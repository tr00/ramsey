"""Exact bounded analysis of all subsets of one explicitly constructed Paley-17.

No Ramsey census, graph canonicalizer, numerical algebra or solver is used.
Run from the repository root; stdout is the retained JSON result.
"""
from collections import Counter
from itertools import combinations
import json

N = 17
FULL = (1 << N) - 1
RESIDUES = {x * x % N for x in range(1, N)}
ADJ = [sum(1 << y for y in range(N) if (y - x) % N in RESIDUES)
       for x in range(N)]
ANTI = [FULL ^ ADJ[x] ^ (1 << x) for x in range(N)]

def vertices(mask):
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit

def edges(mask):
    return sum((ADJ[x] & mask).bit_count() for x in vertices(mask)) // 2

def homogeneous(mask, clique):
    return all(bool(ADJ[x] & (1 << y)) == clique
               for x, y in combinations(vertices(mask), 2))

# Independent implementation of the I3 prohibition: extend each valid subset
# by its least vertex; the nonneighbors of that vertex must form a clique.
valid = [False] * (1 << N)
valid[0] = True
for mask in range(1, 1 << N):
    bit = mask & -mask
    x = bit.bit_length() - 1
    rest = mask ^ bit
    valid[mask] = valid[rest] and homogeneous(rest & ANTI[x], True)
counts = Counter(mask.bit_count() for mask in range(1 << N) if valid[mask])

triples = [sum(1 << x for x in t) for t in combinations(range(N), 3)]
independent = [m for m in triples if homogeneous(m, False)]
cliques = [m for m in triples if homogeneous(m, True)]
# Exact agreement with independent forbidden-triple mask checking.
assert all(valid[m] == all(m & t != t for t in independent)
           for m in range(1 << N))

perms = [tuple((a*x+b) % N for x in range(N))
         for a in sorted(RESIDUES) for b in range(N)]
assert len(set(perms)) == 136
assert all(bool(ADJ[x] & (1 << y)) == bool(ADJ[p[x]] & (1 << p[y]))
           for p in perms for x in range(N) for y in range(N))

def transform(mask, p):
    return sum(1 << p[x] for x in vertices(mask))

seen = set()
orbits = []
for mask in range(1 << N):
    if not valid[mask] or mask in seen:
        continue
    orbit = {transform(mask, p) for p in perms}
    seen.update(orbit)
    orbits.append({'representative': list(vertices(mask)),
                   'size': mask.bit_count(), 'edges': edges(mask),
                   'nonedges': mask.bit_count()*(mask.bit_count()-1)//2-edges(mask),
                   'orbit_size': len(orbit)})
assert len(seen) == sum(counts.values())

# Character identity, using exact integers.
S = [[0 if x == y else (1 if (y-x) % N in RESIDUES else -1)
      for y in range(N)] for x in range(N)]
assert all(sum(S[x][z]*S[z][y] for z in range(N)) == (16 if x==y else -1)
           for x in range(N) for y in range(N))
assert not any(homogeneous(sum(1 << x for x in q), flag)
               for q in combinations(range(N), 4) for flag in [True, False])

max_masks = [m for m in range(1 << N) if valid[m] and m.bit_count() == 8]
max_pairs = Counter()
for a, b in combinations(max_masks, 2):
    common = a & b
    if homogeneous(common, True):
        neighbors = (FULL ^ a) & (FULL ^ b)
        triangle_free = not any(neighbors & t == t for t in cliques)
        max_pairs[(common.bit_count(), triangle_free)] += 1

result = {
    'scope': 'All 2^17 subsets of fixed Paley17; affine-square subgroup orbits; no ambient graph search.',
    'residues': sorted(RESIDUES),
    'subset_count': 1 << N,
    'I3_free_by_size': dict(sorted(counts.items())),
    'I3_free_total': sum(counts.values()),
    'orbit_count_by_size': dict(sorted(Counter(o['size'] for o in orbits).items())),
    'eight_signature_edge_distribution': dict(sorted(Counter(edges(m) for m in max_masks).items())),
    'eight_signatures_equal_antineighborhoods': set(max_masks) == set(ANTI),
    'max_signature_compatible_pair_types': [
        {'common_omission_size': k[0], 'adjacent_outside_pair_allowed': k[1], 'count': v}
        for k, v in sorted(max_pairs.items())],
    'triangles': len(cliques), 'independent_triples': len(independent),
    'character_matrix_square': '17I-J, checked at all 289 entries',
    'orbits': orbits,
}
print(json.dumps(result, indent=2, sort_keys=True))
