"""Exhaustive compatible eight-signature families on fixed Paley17.

Compatibility means disjoint sets of core nonedges, a proved necessary
condition on a (5,4)-free core extension. All cliques are enumerated once.
"""
import contextlib
import io
import json
from collections import Counter
from itertools import combinations
import runpy
from pathlib import Path

with contextlib.redirect_stdout(io.StringIO()):
    d = runpy.run_path(str(Path(__file__).with_name('subsets.py')))
V = d['vertices']; valid = d['valid']; homogeneous = d['homogeneous']
FULL = d['FULL']; ADJ = d['ADJ']; cliques = d['cliques']
sigs = [m for m in range(1 << 17) if valid[m] and m.bit_count()==8]
allowed = [0] * len(sigs)
for i, j in combinations(range(len(sigs)),2):
    if homogeneous(sigs[i] & sigs[j], True):
        allowed[i] |= 1 << j
        allowed[j] |= 1 << i
counts = Counter()
families = []

def enumerate_cliques(chosen, remaining):
    counts[len(chosen)] += 1
    families.append(chosen)
    while remaining:
        bit = remaining & -remaining
        i = bit.bit_length()-1
        remaining ^= bit
        enumerate_cliques(chosen+(i,), remaining & allowed[i])

enumerate_cliques((),(1 << len(sigs))-1)
maximum = max(counts)
maxfam = [f for f in families if len(f)==maximum]

def local_valid(fam, graphbits):
    k = len(fam)
    Tad = [[False]*k for _ in range(k)]
    for edge, (i,j) in enumerate(combinations(range(k),2)):
        Tad[i][j] = Tad[j][i] = bool(graphbits & (1 << edge))
    for size in range(2,6):
        for subset in combinations(range(k),size):
            complete = all(Tad[i][j] for i,j in combinations(subset,2))
            independent = all(not Tad[i][j] for i,j in combinations(subset,2))
            omit = FULL
            neigh = FULL
            for i in subset:
                omit &= sigs[fam[i]]
                neigh &= FULL ^ sigs[fam[i]]
            if size==2 and complete and any(neigh&t==t for t in cliques):
                return False
            if size==3 and complete and not homogeneous(neigh,False):
                return False
            if size==4 and complete and neigh:
                return False
            if size==5 and complete:
                return False
            if size==3 and independent and omit:
                return False
            if size==4 and independent:
                return False
    return True

locally_valid = []
for fam in maxfam:
    ok = [g for g in range(1 << (maximum*(maximum-1)//2)) if local_valid(fam,g)]
    if ok:
        locally_valid.append({'signature_indices':fam,'graph_bits':ok})
print(json.dumps({
    'scope':'All 51 eight-signatures of fixed Paley17; all families satisfying nonedge packing; local graph completions on maximum families.',
    'compatible_family_counts_by_size':dict(sorted(counts.items())),
    'max_eight_signatures':maximum,
    'max_families':len(maxfam),
    'locally_valid_max_families':len(locally_valid),
    'max_family_type_counts':dict(sorted(Counter(
        sum(d['edges'](sigs[i])==18 for i in f) for f in maxfam).items())),
    'compatible_graph_degree_distribution':dict(sorted(Counter(a.bit_count() for a in allowed).items())),
    'signatures':[list(V(m)) for m in sigs],
    'max_family_example': [list(V(sigs[i])) for i in maxfam[0]],
    'local_valid_examples':locally_valid[:1],
},indent=2,sort_keys=True))
