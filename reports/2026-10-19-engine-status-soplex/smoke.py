#!/usr/bin/env python3
"""Bounded real-solver smoke checks for normalized exits and SoPlex linkage."""
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
SOLVER = ROOT/'third-party/roundingsat/build/roundingsat'
ENGINE = ROOT/'build/ramsey'
rows = []

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def run(name,args,expected):
    command = ['prlimit','--as=2147483648','--cpu=25:30','--','/usr/bin/time','-v',
               'timeout','--signal=TERM','--kill-after=2s','35s',*map(str,args)]
    start = time.monotonic()
    with (OUT/(name+'.stdout')).open('wb') as out,(OUT/(name+'.stderr')).open('wb') as err:
        p = subprocess.run(command,cwd=ROOT,stdout=out,stderr=err,timeout=40)
    text = (OUT/(name+'.stdout')).read_text()
    row = {'name':name,'command':command,'exit_status':p.returncode,'expected_exit_status':expected,
           'wall_seconds':time.monotonic()-start,'stdout':name+'.stdout','stderr':name+'.stderr',
           'status_lines':[s for s in text.splitlines() if s.startswith('s ')],
           'LP_calls':int(m[1]) if (m:=re.search(r'^c LP calls (\d+)$',text,re.M)) else None}
    rows.append(row)
    (OUT/'measurements.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(name,p.returncode,row['status_lines'],'LP_calls',row['LP_calls'],flush=True)
    assert p.returncode==expected, row
    return row

with tempfile.TemporaryDirectory(prefix='ramsey-status-soplex-') as temp:
    work = Path(temp)
    # A tiny consumer of the same process supervisor used by the engine.
    source = '#include "solver.hpp"\nint main(int argc,char **argv) { return argc<2 ? 2 : ramsey::run_solver(argv[1],argv+1); }\n'
    (work/'consumer.cpp').write_text(source)
    run('compile-consumer',['/usr/bin/c++','-std=c++20','-O2','-Isrc',work/'consumer.cpp','src/solver.cpp','-o',work/'consumer'],0)
    sat = '* #variable= 3 #constraint= 3\n+1 x1 >= 1;\n-1 x2 >= 0;\n+1 x1 +1 x2 +1 x3 >= 2;\n'
    unsat = '* #variable= 3 #constraint= 4\n+1 x1 +1 x2 >= 1;\n+1 x1 +1 x3 >= 1;\n+1 x2 +1 x3 >= 1;\n-1 x1 -1 x2 -1 x3 >= -1;\n'
    (work/'sat.opb').write_text(sat)
    (work/'unsat.opb').write_text(unsat)
    run('real-sat',[work/'consumer',SOLVER,'--print-sol=1',work/'sat.opb'],10)
    lp = run('real-lp-unsat',[work/'consumer',SOLVER,'--verbosity=2','--lp=-1',work/'unsat.opb'],20)
    assert lp['LP_calls'] is not None and lp['LP_calls']>0, 'LP backend was not exercised'
    model = work/'model.opb'
    base = [ENGINE,ROOT/'data/r45_24/b24.g6','-o',model]
    run('engine-generate',[*base,'-g'],0)
    model_sha = sha(model)
    run('engine-timeout',[*base,'--','--lp=0','--time-limit=0'],4)
    assert sha(model)==model_sha, 'Default OPB changed between generate and solve'
    run('engine-unsat',[*base,'--global-degree-min','none','--global-degree-max','17','--','--lp=0'],20)
    run('engine-solver-error',[*base,'--','--not-a-real-option=1'],1)
    run('engine-lp',[*base,'--zero-neighborhood-excess','--','--time-limit=10','--lp=1'],4)
    engine_lp = rows[-1]
    assert engine_lp['LP_calls'] is not None and engine_lp['LP_calls']>0, 'Engine LP path was not exercised'
    metadata = {'temporary_consumer_source':source,'tiny_sat_opb':sat,'tiny_unsat_opb':unsat,
                'default_opb_sha256':model_sha,'estimated_peak_temporary_model_bytes':60000000,
                'free_disk_bytes':shutil.disk_usage(work).free,
                'solver_binary_sha256':sha(SOLVER),'engine_binary_sha256':sha(ENGINE),
                'source_sha256':{name:sha(ROOT/name) for name in ['src/solver.cpp','src/solver.hpp','src/engine.cpp',
                                'tests/test_solver.cpp','CMakeLists.txt','reports/2026-10-19-engine-status-soplex/smoke.py']},
                'data_sha256':sha(ROOT/'data/r45_24/b24.g6'),
                'cleanup':'Temporary consumer executable, source and OPBs removed by TemporaryDirectory. Raw verification logs retained.',
                'scope':'Smoke checks only. No Ramsey exclusion or performance comparison claim.'}
    (OUT/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
print('PASS: real SAT 10, UNSAT 20, timeout 4, solver error 1, generate-only 0 and positive SoPlex LP calls',flush=True)
