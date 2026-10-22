"""Exact local seven-cell extensions at core attachment total 69."""
import contextlib
import io
import json
import runpy
from collections import Counter
from itertools import combinations
from pathlib import Path
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(Path(__file__).with_name('subsets.py')))
valid=d['valid']; homo=d['homogeneous']; V=d['vertices']; FULL=d['FULL']; cliques=d['cliques']; perms=d['perms']
sizes={k:[m for m in range(1<<17) if valid[m] and m.bit_count()==k] for k in range(5,9)}
compatible=lambda a,b:homo(a&b,True)

def reps(k):
    seen=set()
    for f in combinations(sizes[8],k):
        if f in seen or not all(compatible(a,b) for a,b in combinations(f,2)):continue
        seen.update(tuple(sorted(d['transform'](m,p) for m in f)) for p in perms)
        yield f

# Exhaustive partitions of 50 into seven parts <=8, subject to earlier
# proved packing restrictions: <=4 eights; four eights leave parts <=6.
patterns=[(8,8,8,8,6,6,6),(8,8,8,7,7,7,5),
          (8,8,8,7,7,6,6),(8,8,7,7,7,7,6),(8,7,7,7,7,7,7)]
families=[]; counts=Counter()

def extend(chosen,remaining,domains):
    if not remaining:
        yield chosen;return
    sz=remaining[0]
    for pos,m in enumerate(domains[sz]):
        next_domains={k:[b for b in domain if compatible(m,b) and (k!=sz or b>m)]
                      for k,domain in domains.items()}
        if all(len(next_domains[k])>=remaining[1:].count(k) for k in set(remaining[1:])):
            yield from extend(chosen+(m,),remaining[1:],next_domains)

for pattern in patterns:
    k=pattern.count(8); tail=pattern[k:]
    for base in reps(k):
        domains={s:[m for m in sizes[s] if all(compatible(m,a) for a in base)] for s in set(tail)}
        for fam in extend(base,tail,domains):
            assert sum(m.bit_count() for m in fam)==50
            counts[str(pattern)]+=1;families.append(fam)

pairs=list(combinations(range(7),2)); checked=0; feasible=[]

def local_ok(fam,Tad):
    for size in [3,4,5]:
        for subset in combinations(range(7),size):
            complete=all(Tad[i] & (1<<j) for i,j in combinations(subset,2))
            independent=all(not Tad[i] & (1<<j) for i,j in combinations(subset,2))
            omit=FULL; neigh=FULL
            for i in subset:omit &= fam[i];neigh &= FULL^fam[i]
            if size==3 and complete and not homo(neigh,False):return False
            if size==4 and complete and neigh:return False
            if size==5 and complete:return False
            if size==3 and independent and omit:return False
            if size==4 and independent:return False
    return True

for fam in families:
    free=[]
    for i,j in pairs:
        neigh=(FULL^fam[i])&(FULL^fam[j])
        if not any(neigh&t==t for t in cliques):free.append((i,j))
    for bits in range(1<<len(free)):
        checked+=1;Tad=[0]*7
        for e,(i,j) in enumerate(free):
            if bits&(1<<e):Tad[i]|=1<<j;Tad[j]|=1<<i
        if local_ok(fam,Tad):
            feasible.append({'omissions':[list(V(m)) for m in fam],
                'T_edges':[(i,j) for i,j in pairs if Tad[i]&(1<<j)],
                'side_edge_count':68+69+sum(a.bit_count() for a in Tad)//2})
print(json.dumps({'families':[list(f) for f in families], 'scope':'All fixed Paley17 packing profiles at e(core,T)=69, exact local K5/I4 criteria. Conditional computational claim; no complete K1 decision.',
                  'packing_family_counts':dict(sorted(counts.items())),
                  'packing_family_count':len(families),'T_assignments_checked':checked,
                  'valid_local_count':len(feasible),'first_local_witness':feasible[:1]},indent=2,sort_keys=True))
