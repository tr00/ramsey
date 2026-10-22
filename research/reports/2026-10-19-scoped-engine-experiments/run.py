#!/usr/bin/env python3
"""Replay bounded exploratory experiments. No Ramsey certificate is produced."""
import gzip
import hashlib
import itertools
import json
from pathlib import Path
import re
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
ENGINE = ROOT / 'build/ramsey'
SOLVER = ROOT / 'third-party/roundingsat/build/roundingsat'
NAUTY = ROOT / 'third-party/nauty/bin'
rows = []

def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1048576), b''):
            h.update(block)
    return h.hexdigest()

def save():
    (OUT/'measurements.json').write_text(json.dumps(rows, indent=2)+'\n')

def run(name, argv, wall=20):
    command = ['prlimit', '--as=1073741824', '--cpu=18:20', '--',
               '/usr/bin/time', '-v', 'timeout', '--signal=INT', '--kill-after=2s',
               str(wall)+'s', *map(str, argv)]
    start = time.monotonic()
    with (OUT/(name+'.stdout')).open('wb') as stdout, (OUT/(name+'.stderr')).open('wb') as stderr:
        p = subprocess.run(command, cwd=ROOT, stdout=stdout, stderr=stderr, timeout=wall+10)
    text = (OUT/(name+'.stdout')).read_text(errors='replace')
    err = (OUT/(name+'.stderr')).read_text(errors='replace')
    stats = dict(re.findall(r'^c\s+([^:\n]+):\s*([^\n]+)', text, re.M))
    row = {'name':name, 'command':command, 'cwd':str(ROOT), 'exit_status':p.returncode,
           'wall_seconds':round(time.monotonic()-start, 6),
           'status_lines':[s for s in text.splitlines() if s.startswith('s ')],
           'statistics':stats, 'stdout':name+'.stdout', 'stderr':name+'.stderr',
           'stdout_sha256':sha(OUT/(name+'.stdout')), 'stderr_sha256':sha(OUT/(name+'.stderr'))}
    rss = re.search(r'Maximum resident set size \(kbytes\): (\d+)', err)
    if rss:
        row['peak_rss_kib'] = int(rss.group(1))
    rows.append(row)
    save()
    print(name, p.returncode, row['status_lines'], row['wall_seconds'], flush=True)
    return row

# Pre-run manifest and storage estimate are retained before any large generation.
inputs = [ROOT/'data/r45_24/b24.g6', ENGINE, SOLVER, NAUTY/'geng', NAUTY/'labelg', NAUTY/'countg',
          ROOT/'src/engine.cpp', ROOT/'src/main.cpp', ROOT/'src/instance.cpp', ROOT/'src/core.cpp',
          ROOT/'src/opb.cpp', ROOT/'src/constraints/degrees.cpp', ROOT/'src/constraints/edges.cpp',
          ROOT/'src/constraints/excess.cpp', ROOT/'src/constraints/zero_excess.cpp',
          ROOT/'third-party/roundingsat/build/CMakeCache.txt', ROOT/'build/CMakeCache.txt', Path(__file__)]
(OUT/'inputs.json').write_text(json.dumps({
    'authorization':'User explicitly authorized scoped engine/nauty/RoundingSat experiments',
    'estimated_model_storage_bytes':200000000,
    'free_storage_bytes_before':shutil.disk_usage(OUT).free,
    'limits':{'solver_internal_cpu_seconds':8, 'wall_seconds':20, 'address_space_bytes':1073741824,
              'process_cpu_soft_seconds':18, 'process_cpu_hard_seconds':20, 'proof_logging':False},
    'sha256':{str(p.relative_to(ROOT)):sha(p) for p in inputs}}, indent=2)+'\n')

run('solver-copyright', [SOLVER, '--copyright'])
run('compiler-version', ['/usr/bin/c++', '--version'])
run('nauty-small', [NAUTY/'geng', '-cq', '6', '6:6', OUT/'small.g6'])
run('nauty-small-count', [NAUTY/'countg', '--ne', OUT/'small.g6'])
with (ROOT/'data/r45_24/b24.g6').open() as f:
    first = next(s.strip() for s in f if s.strip() and not s.startswith('>>'))
(OUT/'b-first.g6').write_text(first+'\n')
run('nauty-b-properties', [NAUTY/'countg', '--nedDkhao', OUT/'b-first.g6'])
run('nauty-canonical', [NAUTY/'labelg', '-q', OUT/'b-first.g6', OUT/'b-canonical.g6'])
run('nauty-canonical-properties', [NAUTY/'countg', '--nedDkhao', OUT/'b-canonical.g6'])
run('nauty-order18-budget', [NAUTY/'geng', '-u', '-k', '-i', '18', '84:84'], wall=5)

(OUT/'control-sat.opb').write_text('* #variable= 3 #constraint= 3\n+1 x1 >= 1 ;\n-1 x2 >= 0 ;\n+1 x1 +1 x2 +1 x3 >= 2 ;\n')
run('control-sat', [SOLVER, '--time-limit=8', '--print-sol=1', OUT/'control-sat.opb'])
opts = ['--time-limit=8', '--verbosity=1', '--print-sol=1']
cases = [
    ('impossible-pivot', ['--global-degree-min', 'none', '--global-degree-max', '17']),
    ('default', []),
    ('zero-excess', ['--zero-neighborhood-excess']),
    ('zero-x138', ['--zero-neighborhood-excess', '--internal-edges-min', '84', '--internal-edges-max', '84',
                   '--cross-edges-min', '138', '--cross-edges-max', '138']),
]
for name, flags in cases:
    run(name, [ENGINE, OUT/'b-first.g6', '-o', OUT/(name+'.opb'), *flags, '--', *opts])

pairs = list(itertools.combinations(range(18), 2))
def av(i,j):
    return pairs.index(tuple(sorted((i,j))))+1

def equality(variables, value):
    return [' '.join('+1 x'+str(v) for v in variables)+' >= '+str(value)+' ;\n',
            ' '.join('-1 x'+str(v) for v in variables)+' >= '+str(-value)+' ;\n']

anchor = []
for i,j in itertools.combinations(range(4),2):
    anchor.append('-1 x'+str(av(i,j))+' >= 0 ;\n')
for i in range(4):
    anchor += equality([av(i,j) for j in range(18) if j!=i], 8)
# Arbitrary fixed I-to-B signature labelling, NOT a justified symmetry quotient.
signatures = [{i%4} for i in range(12)] + [set(p) for p in itertools.combinations(range(4),2) for _ in range(2)]
pinned = []
for y,sig in enumerate(signatures):
    for i in range(4):
        var = 154+24*i+y
        pinned.append(('+1 x'+str(var)+' >= 1 ;\n') if i in sig else ('-1 x'+str(var)+' >= 0 ;\n'))

base = (OUT/'zero-x138.opb').read_text()
def augmented(name, body, extra):
    lines = body.splitlines(keepends=True)
    lines[0] = re.sub(r'(#constraint=\s*)(\d+)', lambda m:m[1]+str(int(m[2])+len(extra)), lines[0])
    (OUT/(name+'.opb')).write_text(''.join(lines)+''.join(extra))
    run(name, [SOLVER, *opts, OUT/(name+'.opb')])

augmented('anchor-x138', base, anchor)
augmented('anchor-pinned-signatures', base, anchor+pinned)
run('canonical-generate', [ENGINE, OUT/'b-canonical.g6', '-g', '-o', OUT/'canonical-base.opb', *cases[-1][1]])
augmented('canonical-anchor-x138', (OUT/'canonical-base.opb').read_text(), anchor)

# Exercise frontend option forwarding and cheap errors without solver search.
run('forward-invalid-option', [ENGINE, OUT/'b-first.g6', '-o', OUT/'forward-invalid.opb', '--', '--not-a-real-option=1'])
run('out-of-range-index', [ENGINE, OUT/'b-first.g6', '--index', '2', '-g', '-o', OUT/'bad-index.opb'])

models = {}
for path in sorted(OUT.glob('*.opb')):
    info = {'sha256':sha(path), 'bytes':path.stat().st_size,
            'header':path.open().readline().strip()}
    zipped = path.with_suffix('.opb.gz')
    with path.open('rb') as source, zipped.open('wb') as target:
        with gzip.GzipFile(filename='', mode='wb', fileobj=target, mtime=0, compresslevel=1) as compressed:
            shutil.copyfileobj(source, compressed)
    info.update({'gzip':zipped.name, 'gzip_sha256':sha(zipped), 'gzip_bytes':zipped.stat().st_size})
    models[path.name] = info
    path.unlink()
(OUT/'models.json').write_text(json.dumps(models, indent=2)+'\n')
(OUT/'scopes.json').write_text(json.dumps({
    'anchor_rows':anchor, 'arbitrary_signature_rows':pinned,
    'anchor_scope':'Chosen A vertices 0..3 independent and each internal degree 8. This is a restricted slice. No coverage certificate claimed.',
    'pinned_scope':'Further arbitrary assignment of all 96 I-to-B edges. UNSAT says nothing about other assignments.',
    'proof_status':'No proof logs or certificates. No Ramsey exclusion is certified.',
    'small_generator_scope':'Connected unlabelled 6-vertex graphs with exactly 6 edges',
    'order18_generator_scope':'K4-free I5-free 18-vertex graphs with 84 edges, count only, 5-second wall watchdog'
}, indent=2)+'\n')
print('COMPLETE', len(rows), 'commands;', sum(p.stat().st_size for p in OUT.iterdir() if p.is_file()), 'retained bytes', flush=True)
