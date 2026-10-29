"""Bounded exploratory edge walk; correlated labeled states, not a census.

Run from the repository root. Results go to a fresh temporary directory.
"""
import sys,json,random,itertools,tempfile
from pathlib import Path
sys.path.insert(0,'research/n43/d18/c')
from safe_contractions import certificate,contract,compatible_pair
from verify_safe_contractions import connectivity,transversal_number,homogeneous,edge_count,valid,load_examples
result_dir=Path(tempfile.mkdtemp(prefix='ramsey-contraction-coverage-'))
print('Results directory:',result_dir,flush=True)
rng=random.Random(1831)
D=next(entry for entry in load_examples() if entry['name']=='dense_compatible_pair')
N=[0]*18
for u,v in D['edges']:N[u]|=1<<v;N[v]|=1<<u
seen=set();counts={q:[0,0,0,0] for q in range(4,16)};witnesses={};max_trials=100000
# Bounded depth: exhaustive first contractions, then recursive safety checks.
def depth(adj,limit):
 if limit==0:return 0
 best=0
 for u,v in itertools.combinations(adj,2):
  if v not in adj[u] or not certificate(adj,u,v)['safe']:continue
  child,_=contract(adj,u,v)
  d=1+depth(child,limit-1)
  best=max(best,d)
  if best==limit:return best
 return best
for step in range(max_trials):
 u,v=rng.sample(range(18),2)
 if N[u]>>v&1:
  M=((1<<18)-1)&~(N[u]|N[v]|(1<<u)|(1<<v));V=[i for i in range(18) if M>>i&1]
  if any(all(not(N[a]>>b&1) for a,b in itertools.combinations(C,2)) for C in itertools.combinations(V,3)):continue
  if rng.random()<.65:continue
  N[u]&=~(1<<v);N[v]&=~(1<<u)
 else:
  J=N[u]&N[v];V=[i for i in range(18) if J>>i&1]
  if any(N[a]>>b&1 for a,b in itertools.combinations(V,2)):continue
  N[u]|=1<<v;N[v]|=1<<u
 if step%75:continue
 a=sum(map(int.bit_count,N))//2;q=85-a
 if not 4<=q<=15 or min(map(int.bit_count,N))<4:continue
 key=tuple(N)
 if key in seen:continue
 seen.add(key)
 adj={u:{v for v in range(18) if N[u]>>v&1} for u in range(18)}
 if connectivity(adj)<4 or transversal_number(adj)<3:continue
 edges=[(u,v) for u,v in itertools.combinations(adj,2) if v in adj[u] and certificate(adj,u,v)['safe']]
 pair=any(not(set(e)&set(f)) and compatible_pair(adj,e,f) for e,f in itertools.combinations(edges,2))
 d=depth(adj,4) if edges else 0
 counts[q][0]+=1;counts[q][1]+=bool(edges);counts[q][2]+=pair;counts[q][3]+=d>=3
 if d not in witnesses:
  w={'n':18,'edges':[(u,v) for u,v in itertools.combinations(adj,2) if v in adj[u]],'q':q,'tau4':transversal_number(adj),'connectivity':connectivity(adj),'depth_up_to_4':d,'initial_safe_edges':edges}
  witnesses[d]=w;print('new depth',d,'q',q,'tau',w['tau4'],'safe',len(edges),flush=True)
  open(result_dir / ('depth'+str(d)+'.json'),'w').write(json.dumps(w,indent=2))
 if sum(c[0] for c in counts.values())>=200:break
print('counts q: [samples, safe edge, disjoint compatible pair, depth >=3]',counts,'steps',step,flush=True)
open(result_dir / 'coverage.json','w').write(json.dumps({'seed':1831,'steps':step,'counts':counts,'sample_method':'One correlated Ramsey-preserving edge walk; distinct labeled states, residual scope only; no representative distribution or catalogue coverage.'},indent=2))
