#!/usr/bin/env python3
"""Bounded ordering/propagation comparisons against retained first-batch models."""
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
SOLVER = ROOT/'third-party/roundingsat/build/roundingsat'
ENGINE = ROOT/'build/ramsey'
rows = []
models = {}

def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda:f.read(1048576), b''):
            h.update(block)
    return h.hexdigest()

def run(name, argv):
    command = ['prlimit', '--as=1073741824', '--cpu=18:20', '--', '/usr/bin/time', '-v',
               'timeout', '--signal=INT', '--kill-after=2s', '20s', *map(str, argv)]
    start = time.monotonic()
    with (OUT/(name+'.stdout')).open('wb') as out, (OUT/(name+'.stderr')).open('wb') as err:
        p = subprocess.run(command, cwd=ROOT, stdout=out, stderr=err, timeout=30)
    text = (OUT/(name+'.stdout')).read_text(errors='replace')
    row = {'name':name,'command':command,'cwd':str(ROOT),'exit_status':p.returncode,
           'wall_seconds':round(time.monotonic()-start,6),
           'status_lines':[s for s in text.splitlines() if s.startswith('s ')],
           'stdout':name+'.stdout','stderr':name+'.stderr'}
    rows.append(row)
    (OUT/'followup-measurements.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(name,p.returncode,row['status_lines'],row['wall_seconds'],flush=True)

def retain(path):
    zipped = path.with_suffix('.opb.gz')
    info = {'sha256':sha(path),'bytes':path.stat().st_size,'header':path.open().readline().strip()}
    with path.open('rb') as source, zipped.open('wb') as target:
        with gzip.GzipFile(filename='',mode='wb',fileobj=target,mtime=0,compresslevel=1) as compressed:
            shutil.copyfileobj(source,compressed)
    info.update({'gzip':zipped.name,'gzip_sha256':sha(zipped),'gzip_bytes':zipped.stat().st_size})
    models[path.name] = info
    (OUT/'followup-models.json').write_text(json.dumps(models,indent=2)+'\n')
    path.unlink()

pairs = list(itertools.combinations(range(18),2))
def av(i,j):
    return pairs.index(tuple(sorted((i,j))))+1

def ordered(start):
    result = []
    for i in range(start,17):
        coeff = {}
        for vertex,sign in [(i,1),(i+1,-1)]:
            for j in range(18):
                if j!=vertex:
                    var = av(vertex,j)
                    coeff[var] = coeff.get(var,0)+sign
        result.append(' '.join(f'{c:+d} x{v}' for v,c in sorted(coeff.items()) if c)+' >= 0 ;\n')
    return result

def augment(name, base, extra):
    lines = base.splitlines(keepends=True)
    lines[0] = re.sub(r'(#constraint=\s*)(\d+)',lambda m:m[1]+str(int(m[2])+len(extra)),lines[0])
    path = OUT/(name+'.opb')
    path.write_text(''.join(lines)+''.join(extra))
    run(name,[SOLVER,'--time-limit=8','--print-sol=1',path])
    retain(path)

(OUT/'followup-scope.json').write_text(json.dumps({
    'estimated_additional_peak_uncompressed_bytes':60000000,
    'estimated_additional_retained_compressed_bytes':13000000,
    'free_storage_bytes_before':shutil.disk_usage(OUT).free,
    'ordering_scope':'Nonincreasing internal A degree. All A labels in default case. Only A[4:18] when the first 4 vertices form the designated anchor. Any witness can be relabelled within that free block. This is not a complete canonical labelling.',
    'solver_tuning':'Disable counting propagation with --prop-counting=0; all other solver defaults unchanged.',
    'followup_driver_sha256':sha(__file__),
    'nauty_version_header_sha256':sha(ROOT/'third-party/nauty/build/nauty.h'),
    'solver_version_header_sha256':sha(ROOT/'third-party/roundingsat/src/version.hpp'),
    'ordering_rows_default':ordered(0),'ordering_rows_anchor':ordered(4)
},indent=2)+'\n')
augment('default-degree-ordered',gzip.decompress((OUT/'default.opb.gz').read_bytes()).decode(),ordered(0))
anchor = gzip.decompress((OUT/'anchor-x138.opb.gz').read_bytes()).decode()
augment('anchor-residual-ordered',anchor,ordered(4))
path = OUT/'anchor-counting-disabled.opb'
path.write_text(anchor)
run('anchor-counting-disabled',[SOLVER,'--time-limit=8','--print-sol=1','--prop-counting=0',path])
retain(path)
with (ROOT/'data/r45_24/b24.g6').open() as f:
    records = (s.strip() for s in f if s.strip() and not s.startswith('>>'))
    next(records)
    (OUT/'b-second.g6').write_text(next(records)+'\n')
run('nauty-second-properties',[ROOT/'third-party/nauty/bin/countg','--nedDkhao',OUT/'b-second.g6'])
path = OUT/'b-second-base.opb'
run('b-second-generate',[ENGINE,OUT/'b-second.g6','-g','-o',path,'--zero-neighborhood-excess',
                        '--internal-edges-min','84','--internal-edges-max','84',
                        '--cross-edges-min','138','--cross-edges-max','138'])
anchor_rows = json.loads((OUT/'scopes.json').read_text())['anchor_rows']
augment('b-second-anchor',path.read_text(),anchor_rows)
retain(path)
print('FOLLOWUP COMPLETE',len(rows),'commands',flush=True)
