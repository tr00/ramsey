"""Small finite certificate: every retained p=68/69 packing family forces I4
in T, and also a mixed independent four-set from an independent T triple.
"""
from pathlib import Path
from itertools import combinations
import json

ROOT=Path(__file__).parent;FULL=(1<<17)-1
Q={x*x%17 for x in range(1,17)}
triangles={sum(1<<x for x in {(b-a)%17,b,(b+a)%17}) for b in range(17) for a in Q}
results=[]
for total in [68,69]:
    families=json.loads((ROOT/f'equality{total}.json').read_text())['families']
    witnesses=[]
    for fam in families:
        forced={}
        for i,j in combinations(range(7),2):
            common=(FULL^fam[i])&(FULL^fam[j])
            square_APs=[t for t in triangles if common&t==t]
            if square_APs:forced[i,j]=min(square_APs)
        four=next(q for q in combinations(range(7),4) if all(p in forced for p in combinations(q,2)))
        triple=next(q for q in combinations(range(7),3) if all(p in forced for p in combinations(q,2))
                    and fam[q[0]]&fam[q[1]]&fam[q[2]])
        witnesses.append({'T_I4':four,'edge_forcing_core_triangles':[forced[p] for p in combinations(four,2)],
                          'T_I3':triple,'common_missed_core_vertex':
                          ((fam[triple[0]]&fam[triple[1]]&fam[triple[2]])&-(fam[triple[0]]&fam[triple[1]]&fam[triple[2]])).bit_length()-1})
    (ROOT/f'forced{total}.json').write_text(json.dumps(witnesses,sort_keys=True,separators=(',',':'))+'\n')
    results.append({'attachment_total':total,'families':len(families),
                    'forced_T_I4_families':len(witnesses),'forced_mixed_I4_families':len(witnesses)})
print(json.dumps({'results':results,'status':'PASS'},indent=2,sort_keys=True))
