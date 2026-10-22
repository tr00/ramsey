"""Bounded clique analysis of omission signatures of size seven or eight."""
import contextlib
import io
import json
import runpy
from collections import Counter
from itertools import combinations
from pathlib import Path
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(Path(__file__).with_name('subsets.py')))
V=d['vertices']; valid=d['valid']; homo=d['homogeneous']; perms=d['perms']
eights=[m for m in range(1<<17) if valid[m] and m.bit_count()==8]
sevens=[m for m in range(1<<17) if valid[m] and m.bit_count()==7]
compatible=lambda a,b:homo(a&b,True)
seven_adj=[0]*len(sevens)
for i,j in combinations(range(len(sevens)),2):
    if compatible(sevens[i],sevens[j]):
        seven_adj[i]|=1<<j; seven_adj[j]|=1<<i

def clique_of_size(remaining,k,chosen=()):
    if k==0:return chosen
    while remaining.bit_count()>=k:
        bit=remaining&-remaining; i=bit.bit_length()-1; remaining^=bit
        answer=clique_of_size(remaining&seven_adj[i],k-1,chosen+(i,))
        if answer is not None:return answer
    return None

summary=[]
for k in [4,3,2,1,0]:
    seen=set(); reps=[]
    for f in combinations(eights,k):
        if f in seen or not all(compatible(a,b) for a,b in combinations(f,2)):continue
        orbit={tuple(sorted(d['transform'](m,p) for m in f)) for p in perms}
        seen.update(orbit); reps.append(f)
    best=0; hist=Counter(); witnesses=[]
    for f in reps:
        cands=sum(1<<i for i,m in enumerate(sevens) if all(compatible(m,a) for a in f))
        maximum=0; witness=()
        for ell in range(1,8-k):
            answer=clique_of_size(cands,ell)
            if answer is None:break
            maximum=ell; witness=answer
        best=max(best,maximum); hist[maximum]+=1
        if k+maximum==7:
            witnesses.append([list(V(m)) for m in f]+[list(V(sevens[i])) for i in witness])
    summary.append({'eight_count':k,'eight_family_orbits':len(reps),
                    'max_compatible_sevens_up_to_remaining_seven_slots':best,
                    'orbit_distribution_by_seven_maximum':dict(sorted(hist.items())),
                    'all_high_seven_family_examples':witnesses[:1]})
print(json.dumps({'scope':'Complete compatible eight-family orbit cover under affine-square permutations, and exact seven-signature clique searches up to total seven slots.',
                  'cases':summary},indent=2,sort_keys=True))
