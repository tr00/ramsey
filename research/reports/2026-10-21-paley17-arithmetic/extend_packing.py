"""Check whether four size-eight omissions can coexist with size-seven ones."""
import contextlib
import io
import json
import runpy
from collections import Counter
from itertools import combinations
from pathlib import Path
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(Path(__file__).with_name('subsets.py')))
pack=json.loads(Path(__file__).with_name('packing.json').read_text())
mask=lambda xs:sum(1<<x for x in xs)
fam=[mask(xs) for xs in pack['max_family_example']]
valid=d['valid']; homo=d['homogeneous']; V=d['vertices']

compatible=lambda a,b:homo(a&b,True)
sevens=[m for m in range(1<<17) if valid[m] and m.bit_count()==7]
cands=[m for m in sevens if all(compatible(m,a) for a in fam)]
all_cands=[m for m in range(1<<17) if valid[m] and all(compatible(m,a) for a in fam)]
counts=Counter(m.bit_count() for m in all_cands)
maximum=0
for k in range(1,4):
    if any(all(compatible(a,b) for a,b in combinations(f,2)) for f in combinations(cands,k)):
        maximum=k
print(json.dumps({'fixed_four_eight_signature_family':pack['max_family_example'],
                  'compatible_I3_free_signature_counts':dict(sorted(counts.items())),
                  'compatible_size_seven_count':len(cands),
                  'max_pairwise_compatible_sevens_up_to_three':maximum,
                  'seven_signature_candidates':[list(V(m)) for m in cands]},indent=2))
