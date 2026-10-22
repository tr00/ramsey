"""Exact fixed-core packing and local side validity at total attachment 68.

The size-eight family affine orbit cover reduces only simultaneous labels.
All other omission masks and all allowed T edge assignments are retained.
"""
import contextlib
import io
import json
import runpy
from collections import Counter
from itertools import combinations
from pathlib import Path
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(Path(__file__).with_name('subsets.py')))
V=d['vertices']; valid=d['valid']; homo=d['homogeneous']; perms=d['perms']; FULL=d['FULL']
cliques=d['cliques']; ADJ=d['ADJ']
sizes={k:[m for m in range(1<<17) if valid[m] and m.bit_count()==k] for k in [6,7,8]}
compatible=lambda a,b:homo(a&b,True)

# All 8-family representatives modulo the explicit 136 affine automorphisms.
def reps(k):
    seen=set()
    for f in combinations(sizes[8],k):
        if f in seen or not all(compatible(a,b) for a,b in combinations(f,2)):continue
        seen.update(tuple(sorted(d['transform'](m,p) for m in f)) for p in perms)
        yield f

families=[]; family_counts=Counter()
for k in [2,3]:
    for base in reps(k):
        seven=[m for m in sizes[7] if all(compatible(m,a) for a in base)]
        req=5 if k==2 else 3
        def compatible_choices(chosen, remaining, count):
            if count == 0:
                yield chosen
                return
            for pos, candidate in enumerate(remaining):
                tail = [m for m in remaining[pos+1:] if compatible(candidate,m)]
                if len(tail) >= count-1:
                    yield from compatible_choices(chosen+(candidate,),tail,count-1)
        for choice in compatible_choices((),seven,req):
            high=base+choice
            tails=[None] if k==2 else [m for m in sizes[6] if all(compatible(m,a) for a in high)]
            for tail in tails:
                fam=high if tail is None else high+(tail,)
                assert len(fam)==7 and sum(m.bit_count() for m in fam)==51
                families.append(fam); family_counts[k]+=1

T_pairs=list(combinations(range(7),2))
T_clique_counts=Counter(); total_assignments=0; feasible=[]

def local_ok(fam,Tad):
    for size in [3,4,5]:
        for subset in combinations(range(7),size):
            complete=all(Tad[i] & (1<<j) for i,j in combinations(subset,2))
            independent=all(not Tad[i] & (1<<j) for i,j in combinations(subset,2))
            omit=FULL; neigh=FULL
            for i in subset:
                omit &= fam[i]; neigh &= FULL^fam[i]
            if size==3 and complete and not homo(neigh,False):return False
            if size==4 and complete and neigh:return False
            if size==5 and complete:return False
            if size==3 and independent and omit:return False
            if size==4 and independent:return False
    return True

for fam in families:
    # Nonedges always satisfy pair I4 condition because of packing. Edges
    # allowed exactly when the common core neighborhood is triangle-free.
    free=[]
    for i,j in T_pairs:
        neigh=(FULL^fam[i]) & (FULL^fam[j])
        if not any(neigh&t==t for t in cliques):free.append((i,j))
    for bits in range(1<<len(free)):
        total_assignments+=1; Tad=[0]*7
        for e,(i,j) in enumerate(free):
            if bits & (1<<e):Tad[i]|=1<<j;Tad[j]|=1<<i
        if local_ok(fam,Tad):
            h=sum(m.bit_count() for m in Tad)//2;T_clique_counts[h]+=1
            feasible.append({'omissions':[list(V(m)) for m in fam],
                             'T_edges':[(i,j) for i,j in T_pairs if Tad[i]&(1<<j)],
                             'side_edge_count':68+68+h})

result={'families':[list(f) for f in families], 'scope':'Complete Paley17 seven-cell packing cases at e(core,T)=68, then exact local K5/I4 completion. No cross-core matrix or 43-vertex graph generated.',
        'packing_family_counts_by_eight_omissions':dict(sorted(family_counts.items())),
        'local_T_assignments_checked':total_assignments,
        'local_valid_count':len(feasible),
        'local_valid_count_by_T_edges':dict(sorted(T_clique_counts.items())),
        'first_local_witness':feasible[:1]}
print(json.dumps(result,indent=2,sort_keys=True))
