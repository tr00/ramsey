#!/usr/bin/env python3
"""Finite author checks for the displayed saturation floor proof."""
from itertools import combinations, product
from pathlib import Path
import json

assert all(17-d > 3*(d*d//4) for d in range(5))
assert 5+4+24+26==59
pairs=list(combinations(range(6),2))
checked=0
for mask in range(1<<15):
    f=mask.bit_count()
    if f not in (4,5): continue
    adj=[0]*6
    for bit,(u,v) in enumerate(pairs):
        if mask>>bit&1:adj[u]|=1<<v;adj[v]|=1<<u
    if any(adj[u]&adj[v] for u,v in pairs if adj[u]>>v&1):continue
    k=[x.bit_count() for x in adj]
    lower=sum(max(0,5-4*d) for d in k)
    assert lower >= (4 if f==4 else 2)
    for t in range(4):
        R=8+t-2*f
        if R>=0: assert lower>R
    # Check isolated incidence <= signature size minus two, whenever an edge exists.
    for q in range(64):
        if not any(q>>u&1 and q>>v&1 and adj[u]>>v&1 for u,v in pairs):continue
        isolated=sum(q>>u&1 and not(adj[u]&q) for u in range(6))
        assert isolated<=q.bit_count()-2
    checked+=1

def comps(n,h):
    if h==1:
        if n>=1:yield (n,)
    else:
        for x in range(1,n-h+2):
            for tail in comps(n-x,h-1):yield (x,)+tail
cells=0
for T in (2,4,6):
    for h in range(2,T+1):
        actual=max(sum(x*x for x in es) for es in comps(T,h))
        assert actual==(T-h+1)**2+h-1
        assert 6*T+actual<4*(18-h)
        cells+=1
out={'status':'PASS','triangle_free_six_vertex_neighborhoods_checked':checked,
     'surplus_cells_checked':cells,'minimum_degree_bound':5,
     'degree_five_edge_floor':59,'degree_six_neighbor_surplus_floor':4,
     'saturated_18_vertex_edge_floor':58}
print(json.dumps(out,indent=2))
Path(__file__).with_name('checks.json').write_text(json.dumps(out,indent=2)+'\n')
