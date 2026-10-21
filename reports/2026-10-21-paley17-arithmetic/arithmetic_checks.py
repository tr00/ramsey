"""Exact arithmetic identities and quartic-coset signature classification."""
import contextlib
import io
import json
import runpy
from itertools import combinations
from pathlib import Path
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(Path(__file__).with_name('subsets.py')))
Q=d['RESIDUES'];NS=set(range(1,17))-Q;H={pow(x,4,17) for x in range(1,17)}
mask=lambda xs:sum(1<<x for x in xs)

aps={mask({(b-a)%17,b,(b+a)%17})
     for b in range(17) for a in range(1,17)}
assert len(aps)==136
clique_aps={mask({(b-a)%17,b,(b+a)%17}) for b in range(17) for a in Q}
indep_aps={mask({(b-a)%17,b,(b+a)%17}) for b in range(17) for a in NS}
assert clique_aps==set(d['cliques']) and indep_aps==set(d['independent'])
for x,y in combinations(range(17),2):
    b=(x+y)*9%17; a=(y-x)*9%17
    expected={(b-3*a)%17,b,(b+3*a)%17}
    if (y-x)%17 in Q:
        actual={z for z in range(17) if (z-x)%17 in Q and (z-y)%17 in Q}
    else:
        actual={z for z in range(17) if z not in [x,y]
                and (z-x)%17 not in Q and (z-y)%17 not in Q}
    assert actual==expected

A=[mask({(b+x)%17 for x in NS}) for b in range(17)]
B=[mask({(b+a*x)%17 for x in H|{3*h%17 for h in H}}) for b in range(17) for a in [1,2]]
assert len(set(A))==17 and len(set(B))==34 and set(A).isdisjoint(B)
assert set(A+B)=={m for m in range(1<<17) if d['valid'][m] and m.bit_count()==8}

# Membership counts and pair differences in the 34-block quartic orbit.
A_pair_counts={};B_pair_counts={}
for x,y in combinations(range(17),2):
    A_pair_counts[x,y]=sum(bool(m&(1<<x) and m&(1<<y)) for m in A)
    B_pair_counts[x,y]=sum(bool(m&(1<<x) and m&(1<<y)) for m in B)

# Signature matrix Gram identity, exact for every valid omission signature.
for m in range(1<<17):
    if not d['valid'][m]:continue
    r=m.bit_count();h=[sum(d['S'][x][y] for y in d['vertices'](m)) for x in range(17)]
    assert sum(h)==0 and sum(x*x for x in h)==17*r-r*r
    assert sum(h[x] for x in d['vertices'](m))==4*d['edges'](m)-r*(r-1)

print(json.dumps({'fourth_powers':sorted(H),'triangle_AP_count':len(clique_aps),
    'independent_AP_count':len(indep_aps),'A_omission_family_count':len(A),
    'B_omission_family_count':len(B),'A_pair_multiplicity_edge':sorted({v for (x,y),v in A_pair_counts.items() if (y-x)%17 in Q}),
    'A_pair_multiplicity_nonedge':sorted({v for (x,y),v in A_pair_counts.items() if (y-x)%17 in NS}),
    'B_pair_multiplicity_edge':sorted({v for (x,y),v in B_pair_counts.items() if (y-x)%17 in Q}),
    'B_pair_multiplicity_nonedge':sorted({v for (x,y),v in B_pair_counts.items() if (y-x)%17 in NS}),
    'character_signature_moments_checked':sum(d['valid'])},indent=2,sort_keys=True))
