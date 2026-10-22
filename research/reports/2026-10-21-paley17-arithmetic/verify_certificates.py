"""Verify retained p=68/69 forced-obstruction witnesses directly from residues."""
from itertools import combinations
from pathlib import Path
import json
ROOT=Path(__file__).parent
Q={x*x%17 for x in range(1,17)}
V=lambda m:[x for x in range(17) if m>>x&1]
output=[]
for total in [68,69]:
    families=json.loads((ROOT/f'equality{total}.json').read_text())['families']
    witnesses=json.loads((ROOT/f'forced{total}.json').read_text())
    assert len(families)==len(witnesses)
    for fam,w in zip(families,witnesses):
        assert len(fam)==7 and sum(m.bit_count() for m in fam)==119-total
        for pair,tri in zip(combinations(w['T_I4'],2),w['edge_forcing_core_triangles']):
            assert len(V(tri))==3
            assert all((b-a)%17 in Q for a,b in combinations(V(tri),2))
            assert all(fam[i]&tri==0 for i in pair)
        assert len(set(w['T_I4']))==4
    output.append({'attachment_total':total,'checked_I4_certificates':len(witnesses)})
print(json.dumps({'status':'PASS','results':output},sort_keys=True,indent=2))
