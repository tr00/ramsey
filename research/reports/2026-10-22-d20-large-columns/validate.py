#!/usr/bin/env python3
"""Exact finite self-checks for d20 large-column reductions (standard library)."""
import itertools as it
import json
from pathlib import Path
out = Path(__file__).parent

# Optimize the displayed cap over every possible m distribution; m has 20
# entries in 0..min(k,3), and sum m=5k. This is a counting relaxation only.
count_caps={}
for k in range(5):
 dp={(0,0):0}
 for n in range(20):
  nd={}
  for (_,mass),val in dp.items():
   for m in range(min(k,3)+1):
    key=(n+1,mass+m)
    nd[key]=max(nd.get(key,-1),val+min(4-k,3-m))
  dp=nd
 cap=dp.get((20,5*k))
 count_caps[k]={'incidence_cap':cap,'six_column_cap':cap//6}
assert [count_caps[k]['six_column_cap'] for k in range(5)] == [10,9,6,3,0]

# Solve the four-five group equations without assuming opposite equality.
f_solutions=[]
index=list(it.combinations(range(4),2))
for f in it.product(range(3),repeat=6):
 if all(sum(f[j] for j,p in enumerate(index) if i in p)==5 for i in range(4)):
  f_solutions.append(f)
assert len(f_solutions)==3
assert all(sorted(f)==[1,1,2,2,2,2] for f in f_solutions)

# Common-cell enumeration by direct forbidden homogeneous subsets.
def cell(f):
 fixed=[(0,1),(1,2),(1,3),(0,4),(0,5)]
 free=list(it.product((2,3),(4,5)))+list(it.product((2,3,4,5),range(6,6+f)))+list(it.combinations(range(6,6+f),2))
 n=6+f
 counts={}; masks=[]; block_patterns=set()
 for mask in range(1<<len(free)):
  E=set(fixed)|{tuple(sorted(e)) for i,e in enumerate(free) if mask>>i&1}
  if any(all(e in E for e in it.combinations(T,2)) for T in it.combinations(range(n),3)):continue
  if any(all(e not in E for e in it.combinations(T,2)) for T in it.combinations(range(n),4)):continue
  # Second test using adjacency bitsets, not subset edge lists.
  adj=[0]*n
  for u,v in E: adj[u]|=1<<v;adj[v]|=1<<u
  assert all(not(adj[u]&adj[v]) for u,v in E)
  for u,v,w in it.combinations(range(n),3):
   if not(adj[u]>>v&1 or adj[u]>>w&1 or adj[v]>>w&1):
    assert ((1<<n)-1)&~(adj[u]|adj[v]|adj[w]|(1<<u)|(1<<v)|(1<<w))==0
  counts[len(E)]=counts.get(len(E),0)+1
  masks.append(mask);block_patterns.add(mask&15)
 return {'f':f,'free_edges':free,'count':len(masks),'edge_distribution':counts,'masks':masks,'E_E_patterns':sorted(block_patterns)}
cells=[cell(1),cell(2)]
assert [c['count'] for c in cells]==[40,48]
assert cells[0]['E_E_patterns']==list(range(1,15))
assert cells[1]['E_E_patterns']==[1,2,4,6,8,9]

# Shared E-subgraph cover: the two f=1 opposite pairs and four f=2 pairs.
blocks=[(2*i,2*i+1) for i in range(4)]
pairs8=list(it.combinations(range(8),2));idx={p:i for i,p in enumerate(pairs8)}
i4=[sum(1<<idx[e] for e in it.combinations(U,2)) for U in it.combinations(range(8),4)]
choices=[]
for i,j in it.combinations(range(4),2):
 edges=list(it.product(blocks[i],blocks[j]))
 masks=cells[0 if (i,j) in [(0,1),(2,3)] else 1]['E_E_patterns']
 choices.append([sum(1<<idx[e] for t,e in enumerate(edges) if m>>t&1) for m in masks])
checked=survive=0;dist={}
for pick in it.product(*choices):
 checked+=1;m=sum(pick)
 if any(m&test==0 for test in i4):continue
 survive+=1;e=m.bit_count();dist[e]=dist.get(e,0)+1
assert (checked,survive)==(254016,45912)

# Independent complete five-shape check and triangle bound.
pairs5=list(it.combinations(range(5),2));ids={p:i for i,p in enumerate(pairs5)}
perms=list(it.permutations(range(5)))
def canonical(m):
 return min(sum(1<<ids[tuple(sorted((p[u],p[v])))] for k,(u,v) in enumerate(pairs5) if m>>k&1) for p in perms)
reps={}
labelled=0
for m in range(1024):
 E={p for j,p in enumerate(pairs5) if m>>j&1}
 T=[U for U in it.combinations(range(5),3) if all(p in E for p in it.combinations(U,2))]
 if not T or any(all(p in E for p in it.combinations(U,2)) for U in it.combinations(range(5),4)):continue
 labelled+=1;r=canonical(m)
 if r in reps:continue
 Er={p for j,p in enumerate(pairs5) if r>>j&1}
 Tr=[U for U in it.combinations(range(5),3) if all(p in Er for p in it.combinations(U,2))]
 lam={p:sum(tuple(sorted((p[0],w))) in Er and tuple(sorted((p[1],w))) in Er for w in range(5)) for p in Er}
 h=max(sum(lam[p]-1 for p in it.combinations(U,2)) for U in Tr)
 reps[r]={'edges':len(Er),'h':h,'local_a_cap':95+len(Er)-h}
assert len(reps)==15
assert [r for r in sorted(reps) if reps[r]['local_a_cap']<100]==[19,23,55,184]
# Nontrivial shared-triangle check on explicit Paley17: a nonedge pair
# must leave an I3-free omitted set, of size <=8. Thus union >=9, and
# sharing a triangle forces size sum >=12. All (size5,size6) pairs named
# by a shared triangle are incompatible. This is a fixed-graph check,
# with no claim that every core is Paley.
Q={1,2,4,8,9,13,15,16}
PE={p for p in it.combinations(range(17),2) if (p[1]-p[0])%17 in Q}
PT=[sum(1<<v for v in U) for U in it.combinations(range(17),3) if all(p in PE for p in it.combinations(U,2))]
PI=[sum(1<<v for v in U) for U in it.combinations(range(17),3) if all(p not in PE for p in it.combinations(U,2))]
assert not any(all(p in PE for p in it.combinations(U,2)) or all(p not in PE for p in it.combinations(U,2)) for U in it.combinations(range(17),4))
invalid=bytearray(1<<17)
for I in PI:
 rest=[v for v in range(17) if not(I>>v&1)]
 supers=[I]
 for v in rest:supers += [m|(1<<v) for m in supers]
 for m in supers:invalid[m]=1
shared_triangle_pairs_checked=0
for T in PT:
 rest=[v for v in range(17) if not(T>>v&1)]
 C5=[T|sum(1<<v for v in U) for U in it.combinations(rest,2)]
 C6=[T|sum(1<<v for v in U) for U in it.combinations(rest,3)]
 for C in C5:
  for D in C6:
   shared_triangle_pairs_checked+=1
   assert invalid[((1<<17)-1)^(C|D)]
assert shared_triangle_pairs_checked==len(PT)*91*364

result={'status':'passed','count_caps':count_caps,'group_solutions':f_solutions,'cells':cells,'E_cover':{'checked':checked,'survive':survive,'edge_distribution':dist},'five_shapes':reps,'labelled_five_shapes':labelled,'shared_triangle_pairs_checked':shared_triangle_pairs_checked,'limits':'Author self-check; no order-43 graph feasibility or full branch closure.'}
(out/'validation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='cells'}))
