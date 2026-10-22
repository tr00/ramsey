"""Second exact implementation: AP signatures, nonedge-resource packing,
and whole-side homogeneous-obstruction clauses on seven outside vertices.

Independently rebuilds omission families at attachment totals 68 and 69 and
compares them with the retained discovery lists. Uses only Python stdlib.
"""
from collections import Counter
from itertools import combinations
from pathlib import Path
import json

ROOT=Path(__file__).parent
N=17;FULL=(1<<N)-1
Q={pow(x,2,N) for x in range(1,N)}
vertices=lambda m:[x for x in range(N) if m>>x&1]
mask=lambda xs:sum(1<<x for x in xs)
adj=lambda x,y:(y-x)%N in Q
nonedges=[(x,y) for x,y in combinations(range(N),2) if not adj(x,y)]
AP=[mask({(b-a)%N,b,(b+a)%N}) for b in range(N) for a in [3,5,6,7]]
assert len(set(AP))==68
valid=[m for m in range(1<<N) if all(m&t!=t for t in AP)]
resource={m:sum(1<<i for i,(x,y) in enumerate(nonedges) if m>>x&1 and m>>y&1) for m in valid}
by_size={k:[m for m in valid if m.bit_count()==k] for k in range(5,9)}
perms=[tuple((a*x+b)%N for x in range(N)) for a in sorted(Q) for b in range(N)]
trans=lambda m,p:mask([p[x] for x in vertices(m)])

# Independent recursive family enumeration using disjoint nonedge resources.
def orbit_bases(k):
    covered=set();reps=[]
    def recurse(chosen,start,used):
        if len(chosen)==k:
            if chosen not in covered:
                reps.append(chosen)
                covered.update(tuple(sorted(trans(m,p) for m in chosen)) for p in perms)
            return
        for i in range(start,len(by_size[8])):
            m=by_size[8][i]
            if not resource[m]&used:recurse(chosen+(m,),i+1,used|resource[m])
    recurse((),0,0)
    return reps
bases={k:orbit_bases(k) for k in range(5)}
assert [len(bases[k]) for k in range(5)]==[1,2,6,11,1]

# Bounds behind exhaustive near-extremal integer profiles.
# Four eights forbid any further omission of size >=7.
for base in bases[4]:
    used=0
    for m in base:used|=resource[m]
    assert all(resource[m]&used for m in by_size[7]+by_size[8])
# Three eights forbid four sevens.
for base in bases[3]:
    used=0
    for m in base:used|=resource[m]
    def four_sevens(chosen,start,occupied):
        if chosen==4:return True
        for i in range(start,len(by_size[7])):
            m=by_size[7][i]
            if not resource[m]&occupied and four_sevens(chosen+1,i+1,occupied|resource[m]):return True
        return False
    assert not four_sevens(0,0,used)

patterns68=[(8,8,7,7,7,7,7),(8,8,8,7,7,7,6)]
patterns69=[(8,8,8,8,6,6,6),(8,8,8,7,7,7,5),(8,8,8,7,7,6,6),
            (8,8,7,7,7,7,6),(8,7,7,7,7,7,7)]

core_hom={flag:{k:[mask(s) for s in combinations(range(N),k)
                 if all(adj(x,y)==flag for x,y in combinations(s,2))]
               for k in range(4)} for flag in [True,False]}
T_pairs=list(combinations(range(7),2));edge_index={p:i for i,p in enumerate(T_pairs)}

results=[]
for total,patterns in [(68,patterns68),(69,patterns69)]:
    expected={tuple(f) for f in json.loads((ROOT/f'equality{total}.json').read_text())['families']}
    actual=set()
    for pattern in patterns:
        k=pattern.count(8)
        for base in bases[k]:
            used=0
            for m in base:used|=resource[m]
            def extend(chosen,remaining,occupied,start=0):
                if not remaining:
                    actual.add(chosen);return
                sz=remaining[0];domain=by_size[sz]
                for i in range(start,len(domain)):
                    m=domain[i]
                    if resource[m]&occupied:continue
                    nxt=i+1 if len(remaining)>1 and remaining[1]==sz else 0
                    extend(chosen+(m,),remaining[1:],occupied|resource[m],nxt)
            extend(base,pattern[k:],used)
    assert actual==expected,(total,len(actual),len(expected))
    tested=0;local_valid=0
    for fam in actual:
        # Build all mixed clique/independence obstructions directly by size.
        forbid_complete=[];forbid_independent=[]
        for flag,target in [(True,5),(False,4)]:
            for k in range(1,target+1):
                if target-k>=4:continue
                for Tset in combinations(range(7),k):
                    common=FULL
                    for i in Tset:common &= (FULL^fam[i]) if flag else fam[i]
                    if any(common&m==m for m in core_hom[flag][target-k]):
                        edge_mask=sum(1<<edge_index[p] for p in combinations(Tset,2))
                        (forbid_complete if flag else forbid_independent).append(edge_mask)
        forced_zero=0
        for m in forbid_complete:
            if m.bit_count()==1:forced_zero|=m
        free=[i for i in range(21) if not forced_zero>>i&1]
        for bits in range(1<<len(free)):
            tested+=1;graph=sum(1<<i for pos,i in enumerate(free) if bits>>pos&1)
            if any(graph&m==m for m in forbid_complete):continue
            if any(graph&m==0 for m in forbid_independent):continue
            local_valid+=1
    assert local_valid==0
    results.append({'attachment_total':total,'regenerated_families':len(actual),
                    'T_edge_assignments':tested,'valid_local_extensions':local_valid})
print(json.dumps({'independent_AP_signature_count':len(valid),
                  'eight_family_orbit_counts':[len(bases[k]) for k in range(5)],
                  'four_eights_forbid_sevens':True,'three_eights_forbid_four_sevens':True,
                  'results':results,'status':'PASS'},indent=2,sort_keys=True))
