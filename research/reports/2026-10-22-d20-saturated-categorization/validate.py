#!/usr/bin/env python3
"""Self-check: exact categories, scalar arithmetic, and small completion criterion."""
import itertools as it
import json
from pathlib import Path

triples = {k: [(z,p,k-z-p) for z in range(k+1) for p in range(k-z+1)] for k in (1,2,3)}
assert [len(triples[k]) for k in (1,2,3)] == [3,6,10]
assert 2 + sum(map(len, triples.values())) + 1 == 22
a,b,x = 90,130,220
EA,EB = 2*a+x-360,2*b+x-418
assert (EA,EB,20+a+b+x) == (40,62,460)
assert max(160,360-2*a,418-2*b) <= x <= min(290,440-2*a,506-2*b)
assert 0 <= EA <= 80 and 0 <= EB <= 88 and (EA+EB)%2 == 0

# Independently compare forbidden-five enumeration and split rectangles on
# every graph with fixed v-A edges, |A|=|B|=3: 2^15 graphs.
A,B = (1,2,3),(4,5,6)
free = list(it.combinations(range(1,7),2))
subsets = list(it.combinations(range(7),5))
checked = saturated = 0
for mask in range(1<<len(free)):
    edges = {frozenset((0,u)) for u in A}
    edges.update(frozenset(e) for i,e in enumerate(free) if mask>>i&1)
    def homogeneous(U, present):
        return all((frozenset(e) in edges)==present for e in it.combinations(U,2))
    sides = not any(homogeneous(U,True) for U in it.combinations(A,4)) and not any(homogeneous(U,False) for U in it.combinations(A,5)) and not any(homogeneous(U,True) for U in it.combinations(B,5)) and not any(homogeneous(U,False) for U in it.combinations(B,4))
    direct = not any(homogeneous(U,c) for U in subsets for c in (True,False))
    criterion = sides
    for present, splits in [(True,[(1,4),(2,3),(3,2)]),(False,[(1,4),(2,3),(3,2),(4,1)])]:
        for i,j in splits:
            for U in it.combinations(A,i):
                for W in it.combinations(B,j):
                    if homogeneous(U,present) and homogeneous(W,present) and all((frozenset((u,w)) in edges)==present for u in U for w in W):
                        criterion = False
    assert direct == criterion
    if direct:
        # Witness formulation versus testing every single-edge addition.
        witness = True
        additions = True
        for p,q in it.combinations(range(7),2):
            e = frozenset((p,q))
            if e in edges:
                continue
            common = [z for z in range(7) if frozenset((p,z)) in edges and frozenset((q,z)) in edges]
            witness &= any(homogeneous(T,True) for T in it.combinations(common,3))
            augmented = edges | {e}
            additions &= any(all(frozenset(f) in augmented for f in it.combinations(U,2)) for U in subsets)
        assert witness == additions
        saturated += witness
    checked += 1
result = {'category_triples':triples,'category_count':22,'scalar_example':{'a':a,'b':b,'x':x,'EA':EA,'EB':EB,'edges':460},'small_graphs_checked':checked,'small_saturated_ramsey_graphs':saturated,'status':'passed','limits':'Author self-check; no order-43 graph feasibility or closure.'}
Path(__file__).with_name('validation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
