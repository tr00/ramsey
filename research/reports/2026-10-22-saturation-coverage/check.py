#!/usr/bin/env python3
"""Exhaustive small witness check; no order43 search."""
from itertools import combinations
from pathlib import Path
import json
n=8
adj=[set() for _ in range(n)]
for u,v in combinations(range(n),2):
    edge=u==7 or v==7 or ((u-v)%7 not in (1,6))
    if edge:adj[u].add(v);adj[v].add(u)
def clique(S,A):return all(v in A[u] for u,v in combinations(S,2))
def independent(S,A):return all(v not in A[u] for u,v in combinations(S,2))
def saturated(A,V,r):
    for u,v in combinations(V,2):
        if v in A[u]:continue
        common=A[u]&A[v]&set(V)
        if not any(clique(T,A) for T in combinations(sorted(common),r-2)):return False
    return True
assert not any(clique(S,adj) for S in combinations(range(n),5))
assert not any(independent(S,adj) for S in combinations(range(n),5))
assert saturated(adj,range(n),5)
assert [len(A) for A in adj]==[5]*7+[7]
for v in range(7):
    assert not saturated(adj,adj[v],4)
    assert not any(clique(S,adj) for S in combinations(sorted(adj[v]),4))
out={'status':'PASS','vertices':n,'edges':sum(map(len,adj))//2,
     'degrees':[len(A) for A in adj], 'globally_K5_saturated':True,
     'degree5_vertices_with_K4_saturated_neighborhood':0,
     'edge_list':[list(e) for e in combinations(range(n),2) if e[1] in adj[e[0]]]}
Path(__file__).with_name('checks.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
