import itertools as it,json
import numpy as np
from scipy.optimize import milp,Bounds,LinearConstraint
pairs=list(it.combinations(range(5),2)); ids={p:i for i,p in enumerate(pairs)}
perms=list(it.permutations(range(5)))
tri_masks=[sum(1<<ids[e] for e in it.combinations(T,2)) for T in it.combinations(range(5),3)]
four_masks=[sum(1<<ids[e] for e in it.combinations(T,2)) for T in it.combinations(range(5),4)]
def canon(m):
 return min(sum(1<<ids[tuple(sorted((p[u],p[v])))] for k,(u,v) in enumerate(pairs) if m>>k&1) for p in perms)
reps=sorted({canon(m) for m in range(1024) if any(m&t==t for t in tri_masks) and not any(m&t==t for t in four_masks)})
res=[]
for m in reps:
 E={e for k,e in enumerate(pairs) if m>>k&1}
 triangles=[T for T in it.combinations(range(5),3) if all(e in E for e in it.combinations(T,2))]
 P=[p for p in range(32) if not any(all(p>>v&1 for v in T) for T in triangles)]
 rows=[[1]*len(P)]; lo=[15]; hi=[15]
 for v in range(5):
  rows.append([int(p>>v&1) for p in P]);lo.append(0);hi.append(8)
 for u,v in E:
  common=[w for w in range(5) if tuple(sorted((u,w))) in E and tuple(sorted((v,w))) in E]
  rows.append([int(p>>u&1 and p>>v&1) for p in P]);lo.append(0);hi.append(4-len(common))
 for n in (2,3):
  for I in it.combinations(range(5),n):
   if all(e not in E for e in it.combinations(I,2)):
    rows.append([int(all(not(p>>v&1) for v in I)) for p in P]);lo.append(0);hi.append(8 if n==2 else 3)
 obj=np.array([p.bit_count() for p in P])
 r=milp(-obj,integrality=np.ones(len(P)),bounds=Bounds(0,15),constraints=LinearConstraint(np.array(rows),lo,hi),options={'time_limit':5})
 c=round(-r.fun) if r.success else None
 res.append({'shape':m,'edges':m.bit_count(),'triangles':len(triangles),'attachments_max':c,'a_max':55+m.bit_count()+c if c is not None else None,'sizes':[round(sum(r.x[j] for j,p in enumerate(P) if p.bit_count()==k)) for k in range(6)] if r.success else None})
print(json.dumps(res,indent=2))
