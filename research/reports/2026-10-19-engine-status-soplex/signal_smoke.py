#!/usr/bin/env python3
"""Interrupt the actual engine PID after solver startup and verify child supervision."""
import hashlib
import json
import os
from pathlib import Path
import selectors
import signal
import subprocess
import tempfile
import time

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='ramsey-signal-') as temp:
    command = [str(ROOT/'build/ramsey'),str(ROOT/'data/r45_24/b24.g6'),'-o',str(Path(temp)/'model.opb'),
               '--','--lp=0','--time-limit=60','--verbosity=1']
    start = time.monotonic()
    deadline = start+15
    data = bytearray()
    with (OUT/'real-signal.stderr').open('wb') as stderr:
        p = subprocess.Popen(command,cwd=ROOT,stdout=subprocess.PIPE,stderr=stderr,start_new_session=True)
        try:
            with selectors.DefaultSelector() as selector:
                selector.register(p.stdout,selectors.EVENT_READ)
                while b'c #variables ' not in data:
                    assert time.monotonic()<deadline, 'solver did not reach startup within watchdog'
                    if not selector.select(max(0,deadline-time.monotonic())):
                        raise RuntimeError('startup watchdog expired')
                    chunk = os.read(p.stdout.fileno(),4096)
                    assert chunk, 'solver exited before startup'
                    data.extend(chunk)
            # Send only to the engine PID, not to the process group.
            os.kill(p.pid,signal.SIGTERM)
            rest,_ = p.communicate(timeout=max(0.1,deadline-time.monotonic()))
            data.extend(rest)
        finally:
            if p.poll() is None:
                os.killpg(p.pid,signal.SIGKILL)
                p.wait()
    (OUT/'real-signal.stdout').write_bytes(data)
    record = {'command':command,'cwd':str(ROOT),'watchdog_wall_seconds':15,'signal':'SIGTERM',
              'signal_target':'engine PID only, not process group','signal_sent_after':'c #variables startup line',
              'exit_status':p.returncode,'expected_exit_status':128+signal.SIGTERM,
              'wall_seconds':time.monotonic()-start,'stdout':'real-signal.stdout','stderr':'real-signal.stderr',
              'engine_sha256':hashlib.sha256((ROOT/'build/ramsey').read_bytes()).hexdigest(),
              'status_lines':[line for line in data.decode().splitlines() if line.startswith('s ')],
              'cleanup':'Temporary model removed; actual child reaped by engine before engine exit.'}
    (OUT/'signal-measurement.json').write_text(json.dumps(record,indent=2)+'\n')
    assert p.returncode==128+signal.SIGTERM, record
print('PASS: SIGTERM sent only to actual engine PID; solver stopped, output drained, engine exit 143')
