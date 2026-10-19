#!/usr/bin/env python3
"""Validate retained experimental evidence and collect grounded integration findings."""
import gzip
import hashlib
import itertools
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
REPORT = ROOT/'reports/2026-10-19-scoped-engine-experiments.json'

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

measurements = json.loads((OUT/'measurements.json').read_text()) + json.loads((OUT/'followup-measurements.json').read_text())
keys = ['cpu time','total solve time','propagation time','conflict analysis time','decisions','conflicts',
        'input clauses','input cardinalities','input general constraints','learned clauses','learned cardinalities',
        'learned general constraints','LP calls','restarts']
for row in measurements:
    text = (OUT/row['stdout']).read_text()
    err = (OUT/row['stderr']).read_text()
    # RoundingSat's final counters use whitespace, unlike its progress lines.
    row['statistics'] = {key:m.group(1) for key in keys if (m:=re.search('^c '+re.escape(key)+r' (.+)$',text,re.M))}
    for stream in ['stdout','stderr']:
        digest = sha(OUT/row[stream])
        if stream+'_sha256' in row:
            assert digest == row[stream+'_sha256']
        row[stream+'_sha256'] = digest
    rss = re.search(r'Maximum resident set size \(kbytes\): (\d+)',err)
    if rss:
        row['peak_rss_kib'] = int(rss[1])
by_name = {row['name']:row for row in measurements}
assert len(by_name)==25
assert by_name['control-sat']['status_lines']==['s SATISFIABLE']
assert by_name['impossible-pivot']['status_lines']==['s UNSATISFIABLE']
assert by_name['anchor-pinned-signatures']['status_lines']==['s UNSATISFIABLE']
assert by_name['anchor-residual-ordered']['exit_status']==0
assert by_name['anchor-residual-ordered']['status_lines']==['s TIMELIMIT']

# Verify the tiny SAT model directly against its actual OPB and returned assignment.
tiny = gzip.decompress((OUT/'control-sat.opb.gz').read_bytes()).decode()
solution = next(line[2:].split() for line in (OUT/'control-sat.stdout').read_text().splitlines() if line.startswith('v '))
assignment = {int(token.lstrip('-x')):not token.startswith('-') for token in solution}
assert len(assignment)==3
for line in tiny.splitlines():
    if not line or line.startswith('*'):
        continue
    rhs = int(re.search(r'>=\s*(-?\d+)',line)[1])
    terms = re.findall(r'([+-]\d+)\s+x(\d+)',line)
    assert sum(int(c)*assignment[int(v)] for c,v in terms)>=rhs

model_manifest = json.loads((OUT/'models.json').read_text()) | json.loads((OUT/'followup-models.json').read_text())
raw_bytes = compressed_bytes = 0
for name,info in model_manifest.items():
    path = OUT/info['gzip']
    assert sha(path)==info['gzip_sha256']
    digest = hashlib.sha256()
    count = size = 0
    with gzip.open(path,'rb') as model:
        header = next(model)
        digest.update(header)
        size += len(header)
        for line in model:
            digest.update(line)
            size += len(line)
            if line.strip() and not line.startswith(b'*'):
                assert line.rstrip().endswith(b';')
                count += 1
    assert header.decode().strip()==info['header']
    assert count==int(re.search(r'#constraint=\s*(\d+)',info['header'])[1])
    assert digest.hexdigest()==info['sha256'] and size==info['bytes']
    raw_bytes += size
    compressed_bytes += path.stat().st_size

# Find an explicit obstruction already forced by the deliberately pinned I-to-B matrix.
def decode(record):
    n = ord(record[0])-63
    bits = [(ord(c)-63>>b)&1 for c in record[1:] for b in range(5,-1,-1)]
    edges = set()
    k = 0
    for j in range(1,n):
        for i in range(j):
            if bits[k]:
                edges.add((i,j))
            k += 1
    return n,edges

n,b_edges = decode((OUT/'b-first.g6').read_text().strip())
assert n==24
partial = {(i+4,j+4) for i,j in b_edges}
signatures = [{i%4} for i in range(12)] + [set(p) for p in itertools.combinations(range(4),2) for _ in range(2)]
for y,sig in enumerate(signatures):
    partial.update((i,y+4) for i in sig)
obstruction = None
for vertices in itertools.combinations(range(28),5):
    values = [pair in partial for pair in itertools.combinations(vertices,2)]
    if all(values) or not any(values):
        obstruction = {'type':'K5' if all(values) else 'I5',
                       'vertices':[('A'+str(i)) if i<4 else ('B'+str(i-4)) for i in vertices]}
        break
assert obstruction is not None

hard_names = ['default','zero-excess','zero-x138','anchor-x138','canonical-anchor-x138',
              'default-degree-ordered','anchor-residual-ordered','anchor-counting-disabled','b-second-anchor']
assert all(by_name[name]['status_lines']==['s TIMELIMIT'] for name in hard_names)
assert all(by_name[name]['statistics']['LP calls']=='0' for name in hard_names)
assert all(int(by_name[name]['statistics']['conflicts'])>0 for name in hard_names)

def finding(id,severity,title,observations,evidence,consequence,recommendation):
    return dict(id=id,severity=severity,title=title,observations=observations,evidence=evidence,
                consequence=consequence,recommendation=recommendation)

findings = [
 finding('status-contract','critical','Exit 0 does not mean SAT, UNSAT, or even a completed decision',
         ['SAT control and both UNSAT controls exit 0.','anchor-residual-ordered prints s TIMELIMIT but exits 0; other timeouts exit 4.'],
         ['control-sat.stdout','impossible-pivot.stdout','anchor-pinned-signatures.stdout','anchor-residual-ordered.stdout','anchor-residual-ordered.stderr',
          'third-party/roundingsat/src/run.cpp:43-57,84-122','src/engine.cpp:222-230'],
         'Shell success checks can silently misclassify an unfinished run. The frontend execs the solver and cannot normalize the result afterward.',
         'Use the explicit s status line as the decision field. Keep raw exit status separately, require a terminal status, and classify timeout/unknown/error independently. Do not change vendored code.'),
 finding('certification','high','No end-to-end candidate or UNSAT-certificate acceptance path',
         ['Engine execs the solver without decoding or validating a SAT assignment.','RoundingSat help defaults --print-sol to 0. All these solver runs explicitly request 1.','Proof logging was deliberately disabled; no UNSAT result here is certified.'],
         ['src/engine.cpp:219-230','third-party/roundingsat/src/quit.cpp:62-72','README.md:165-170,238-240'],
         'A solver status alone cannot safely become research evidence, even if a future run decides a nontrivial slice.',
         'Separate solving from acceptance: retain assignment/proof, reconstruct all 43 vertices, exhaustively check all 5-subsets, and integrate an approved independent proof checker before exclusion claims.'),
 finding('symmetry','high','Nauty is a graph6 parser in the engine, not solver symmetry reduction',
         ['First and second B graphs both have automorphism group size 1 and 24 orbits.','Canonicalizing B changes the anchor search trace but still times out.','The engine emits all labelled A constraints without an A symmetry breaker. Degree ordering also times out.'],
         ['src/engine.cpp:146-175','src/core.cpp:133-146','nauty-b-properties.stdout','nauty-second-properties.stdout','canonical-anchor-x138.stdout','default-degree-ordered.stdout'],
         'Canonical B labelling does not remove permutations of the 18 unknown A vertices. A designated 4-anchor still leaves permutations of its 14 other A vertices.',
         'Evaluate symmetry handling for the combined unknown A/cross structure, with a coverage argument. Cheap internal-degree ordering is incomplete and is not a demonstrated speedup here.'),
 finding('lp-build','high','The local PB solver has no LP backend',
         ['Configured local Release build has soplex:STRING=OFF.','Every measured hard run reports LP calls 0.','The help still lists LP controls and --lp default 1.'],
         ['third-party/roundingsat/build/CMakeCache.txt:251-252','default.stdout','zero-x138.stdout','solver --help observed during setup'],
         'Linear constraints are handled by PB/CDCL propagation and cutting planes, not an LP relaxation in this build.',
         'Expose solver build capabilities in experiment metadata. Compare with an LP-enabled local build only after obtaining approval for any missing dependency/download; no LP performance claim follows from these runs.'),
 finding('pb-cost','medium','Stronger restrictions change per-conflict cost, not just search space',
         ['At equal 8-second internal CPU budgets: default 137966 conflicts, zero excess 106350, fixed x138 zero excess 41990.','Fixed x138 learns 16723 general constraints versus 0 in the default run.','All 9 nontrivial comparisons time out. Disabling counting propagation does not decide the anchor instance.'],
         ['default.stdout','zero-excess.stdout','zero-x138.stdout','anchor-counting-disabled.stdout'],
         'Fewer variables or stronger equations cannot be assumed to imply faster solving. Conflict counts alone are not a progress/completeness metric.',
         'Benchmark repeated instances and deterministic work counters with fixed scope. Keep runtime, learned-constraint mix and memory, not just conflict throughput. No tuning default is justified by this small sample.'),
 finding('cut-interface','high','Scoped graph constraints require external OPB surgery',
         ['The CLI exposes aggregate interval endpoints and zero excess but no fixed edge literals, designated independent set, anchor degree constraints, or residual degree ordering.','Experiments added 14 anchor rows, 96 arbitrary fixed-cross-edge rows, and degree-order rows outside the engine.','Arbitrary pinned incidences already force an explicit 5-vertex obstruction: '+str(obstruction)],
         ['src/main.cpp:76-92','scopes.json','followup-scope.json','run.py','followup.py'],
         'Ad hoc text augmentation couples experiments to variable numbering and header maintenance. An easy UNSAT slice can simply be inconsistent input, not evidence of difficult-branch feasibility.',
         'A small typed experiment-cut interface using the existing builder would improve usability. Record every cut and whether it is implied, a covered symmetry choice, or an arbitrary restriction; do not promote these artificial pins into production defaults.'),
 finding('io-preflight','medium','Late contradiction and option discovery forces avoidable generation and parsing',
         ['Impossible pivot cap generates a 28549175-byte OPB before UNSAT at parsing, with zero search decisions.','An invalid forwarded solver option is discovered only after a complete default OPB is generated.','All core rows are built before any optional bound component.'],
         ['impossible-pivot.stderr','impossible-pivot.stdout','forward-invalid-option.stdout','models.json','src/engine.cpp:200-225','src/constraints/degrees.cpp:21-22'],
         'Obvious input contradictions and execution mistakes still incur model construction, serialization and sometimes full core parsing.',
         'Preflight fixed pivot/bounds and solver availability before large generation, while preserving an explicit infeasible-model mode when requested. Separate generate/solve commands so tuning does not regenerate identical models.'),
 finding('batch-provenance','high','One-shot frontend lacks catalogue scheduling and reproducible run records',
         ['Frontend handles one B record per invocation. read_record scans from the beginning for each --index.','OPB metadata records variable map and B graph6 but not active constraint options, source/tool hashes or artificial scope.','Experiment drivers had to add resource limits, raw logs, status parsing, hashing and compressed model retention.','Solver path is baked into the engine at build time.'],
         ['src/engine.cpp:104-143,222-230','src/opb.cpp:63-89','CMakeLists.txt:72-73','run.py','followup.py'],
         'Naive index-by-index batch use performs quadratic catalogue scanning and cannot safely resume/aggregate a decision frontier. Moving the checkout or swapping solver builds needs manual care.',
         'Use a sequential catalogue iterator or index, explicit solver path, and a manifest-driven external supervisor with separate model/scope/attempt IDs and resumable undecided cases. Preserve exec signal behavior for the low-level frontend.'),
 finding('nauty-budget','medium','Order-18 generation is not yet a measured complete enumeration strategy',
         ['The small n6/e6 connected generator completes and countg reports 13 graphs.','Count-only K4-free/I5-free n18/e84 generation hits the 5-second watchdog without a completed count.'],
         ['nauty-small-count.stdout','nauty-order18-budget.stderr'],
         'The tiny control validates local tool plumbing, not scalability or coverage at order 18. Timeout gives no bound on remaining work.',
         'Measure split-job sizes and retain exact res/mod settings before using generation as a coverage source. No catalogue completeness or nonexistence conclusion is drawn here.')
]

inputs = json.loads((OUT/'inputs.json').read_text())
for relative,digest in inputs['sha256'].items():
    assert sha(ROOT/relative)==digest, relative
additional_sources = ['src/instance.hpp','src/constraints/degrees.cpp','CMakeLists.txt',
                      'third-party/roundingsat/src/run.cpp','third-party/roundingsat/src/roundingsat.cpp',
                      'third-party/roundingsat/src/quit.cpp','third-party/roundingsat/src/version.hpp',
                      'third-party/nauty/build/nauty.h']
artifacts = {p.name:{'bytes':p.stat().st_size,'sha256':sha(p)} for p in sorted(OUT.iterdir()) if p.is_file()}
report = {
 'date':'2026-10-19','task':'scoped-engine-experiments-20261019','kind':'authorized bounded computational experiments and integration investigation',
 'result':'All 9 nontrivial solver configurations time out. SAT/UNSAT controls work. A timeout can exit 0. No Ramsey branch is excluded.',
 'authorization':inputs['authorization'],
 'tools':{'engine':'Existing local Release build, source/binary hashes in inputs.json',
          'nauty':'2.9.3, local geng/countg/labelg binaries',
          'RoundingSat':'2, commit d4edbf7, Release, SoPlex OFF',
          'compiler':(OUT/'compiler-version.stdout').read_text().splitlines()[0],
          'seed':'No seed option exposed in observed solver help. No claim of statistical robustness from these single runs.'},
 'resource_limits':inputs['limits'],
 'storage':{'first_batch_estimate_bytes':200000000,'note':'First-batch raw model total exceeded the rough estimate, about 257 MB versus 200 MB. More than 542 GB was available. All exact models retained as gzip after runs.',
            'all_model_raw_bytes':raw_bytes,'all_model_gzip_bytes':compressed_bytes,
            'all_retained_artifact_bytes':sum(x['bytes'] for x in artifacts.values()),
            'proof_traces':'Disabled to avoid uncontrolled certificate growth; UNSAT statuses are uncertified.'},
 'scope':{'B_records':'Only original catalogue records 1 and 2, plus canonical relabelling of record 1. Not catalogue-wide.',
          'zero_x138':'All A global degrees 18, e(A)=84, e(A,B)=138. Connectedness not imposed.',
          'anchor':'A[0:4] independent, each internal degree 8. No coverage certificate supplied by these experiments.',
          'pinning':'A further arbitrary assignment of all 96 anchor-to-B incidences; not a justified B symmetry reduction.',
          'ordering':'Nonincreasing internal degrees within all A for default, or only the 14 nonanchor A vertices. Proof of scope: relabel that free block by descending degree; labels within the designated anchor remain fixed. This is not full canonicalization.',
          'timeouts':'No evidence of nonexistence, no completed search coverage. No construction found in nontrivial runs.'},
 'runs':measurements,
 'comparison_order':hard_names,
 'model_manifest':model_manifest,
 'controls':{'tiny_sat_assignment':assignment,'tiny_sat_verified_against_opb':True,
             'pinned_partial_graph_obstruction':obstruction,'small_nauty_graph_count':13,
             'first_B':'n24 e152 min12 max14 clique4 independent3 automorphism-group1',
             'second_B':'n24 e151 min11 max14 clique4 independent3 automorphism-group1'},
 'findings':findings,
 'illustrative_catalogue_arithmetic':{
     'records':352366,'input_bytes':16913568,
     '8_cpu_seconds_each_days':352366*8/86400,
     'one_default_opb_per_record_bytes':352366*model_manifest['default.opb']['bytes'],
     'warning':'Arithmetic illustration only, not a projection that 8 seconds decides any record. Most measured cases remained undecided.'},
 'recommended_priority':['Reliable status/witness/certificate acceptance contract before batch use',
                         'Scope-aware experiment manifests and bounded resumable orchestration',
                         'Typed anchor/fixed-edge cuts and coverage-aware A symmetry experiments',
                         'Only then larger comparative solver/backend benchmarks'],
 'validation':{'command':'python3 reports/2026-10-19-scoped-engine-experiments/analyze.py',
               'checks':['25 raw run records and log hashes','All compressed model SHA-256 values, raw hashes and exact constraint counts',
                         'Tiny returned SAT assignment against every actual OPB constraint',
                         'Explicit fixed partial-graph K5/I5 witness for arbitrary pins',
                         'Original source/tool/input hashes still match']},
 'source_sha256':{p:sha(ROOT/p) for p in additional_sources},
 'artifacts':artifacts,
 'replay':['python3 reports/2026-10-19-scoped-engine-experiments/run.py',
           'python3 reports/2026-10-19-scoped-engine-experiments/followup.py',
           'python3 reports/2026-10-19-scoped-engine-experiments/analyze.py'],
 'cleanup':'Only evidence reports and WORK.md changed. Temporary uncompressed OPBs removed after gzip retention. Experiment drivers retained as reproducibility evidence. No engine/default constraint changes, dependency changes, downloads, Lean edits, staging or commit.'
}
REPORT.write_text(json.dumps(report,indent=2)+'\n')
print('PASS: 25 commands; all logs, model hashes and constraint counts; SAT assignment; explicit pinned obstruction; unchanged input/source/tool hashes')
print('Pinned obstruction:',obstruction)
for name in hard_names:
    r = by_name[name]
    print(name,r['exit_status'],round(r['wall_seconds'],3),r['peak_rss_kib'],r['statistics']['conflicts'],r['status_lines'][0])
print('Retained model gzip bytes:',compressed_bytes)
print('Report:',REPORT.relative_to(ROOT))
