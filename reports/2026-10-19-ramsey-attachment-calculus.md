# General Ramsey attachment calculus and structural obstruction transport

Date: 2026-10-19. Task: `ramsey-attachment-calculus-20261019`.
Task kind: Research. Coordinator/author: Main. Other authors:
BoundaryProfileTheory and CriticalFaceTheory.

## User objective and deliverable

The request was theory building rather than another tightening of the
already constrained d18k1 parameters: explain how induced Ramsey graphs
form blocks, which attachment operators are sound, and why several
existing proof ideas have the same mechanism.

The deliverable comprises four connected proof notes:

1. [Exact mixed attachment calculus](../docs/general_theorems/ramsey_attachment_calculus.md):
   root-signature cell types, the exact coloured higher-arity interface,
   an arity obstruction to raw pairwise checking, and order-independent
   mixed-interface convolution.
2. [Finite boundary profiles](../docs/general_theorems/boundary_profiles.md):
   exact uniform joins, forgetting, uniform introduction and relabelling,
   with a context replacement/congruence theorem.
3. [Critical-face transport](../docs/general_theorems/critical_face_transport.md):
   independent/clique face capacities and weighted defects, followed by
   unit-capacity labels, actual transversal demands, derived conflict
   graphs, zero-label elimination and equality rigidity.
4. [Structural obstruction lifting](../docs/general_theorems/profile_obstructions.md):
   interior automorphisms/modules persist through the permitted contexts;
   an equal-order representative with a forbidden structural feature
   excludes the original assembly even if its original block lacks that
   feature. Profile-equivalent sibling blocks give a symmetric representative.

All 16 reviewable statements are independently accepted on their stated
premises, including explicit interface restatements of existing signature
results. Main accepted the boundary calculus; AttachmentInterfaceAudit
accepted the mixed/lifting notes; CriticalTransportAudit accepted the face
note. This is not a novelty claim or a Ramsey branch closure.

## The substantive theory bridge

A numerical type (p,q,n) is not an attachment interface. Root cells need
the actual root graph; mixed joins need common-clique and uncovered-
independent witnesses of several arities. Four ports on a one-vertex core
can pass every unary, binary and ternary test and still form K5.

Uniform contexts admit a smaller invariant: for each homogeneous boundary
set, retain the truncated largest eligible interior homogeneous set in
each colour. Equal profiles can describe different interior graphs and
still permit exact replacement under every operation of that language.
The invariant is not claimed sufficient for arbitrary mixed attachments.

Replacement then interacts with the independently reviewed global
symmetry theorems. One can replace a block by an information-equivalent,
equal-order representative, transport its internal symmetry or module
through the context, and obtain a contradiction in the replacement graph.
This does not assert that a partial symmetry extends in the original graph.
It supplies a new compositional way to use an existing structural theorem.

For example, two equal-profile sibling interiors of order k permit a
swapped-copy representative of support2k. The existing order43 support
and pair-separation premises rule out k<=5 in this precisely specified
context. This is a conditional forbidden state-collision result, not a
bound on arbitrary induced-subgraph orders or an unavoidable decomposition.

A concrete fixed example is the asymmetric seven-vertex tree whose three
branches at its unique degree-three boundary vertex have lengths1,2,3.
It has the same one-boundary profile and order as P7 pointed at its middle.
Both are R(5,5)-free. The former has no nonidentity automorphism (the three
rooted path branches have different lengths); the latter has a reflection
of support6. The executed smoke below checks the profile, actual graph
types, branch certificate and reflection. This illustrates why the original
block need not possess the symmetry of an information-equivalent representative.

## Existing mechanisms recovered without ambient-type changes

- A root in (5,5) gives (4,5) and (5,4), not two (4,4) sides.
- For adjacent roots, exclusive signature cells are (4,4), common
  neighbors are (3,5), and common nonneighbors are (5,4).
- The isolated-neighbor17-core and K3-component15-core are instances of
  the same root-cell rule. A common missed independent root family in
  the K3 setting gives (4,3), (4,2), then an empty common missed region.
- Transversal deletion exposes a smaller induced core by a different
  operator; its attachment and equality budgets remain the existing
  deletion theorem, not a newly renamed result.
- Independent-anchor singleton classes and critical-core nonedge packing
  are both critical-face resources. Unit resources on a link yield
  labels and a conflict-graph obstruction, not merely an edge sum.
- Pointed-neighborhood overlap identification and double-coset symmetry
  remain the existing exact overlap theory.

## Evidence and review manifest

Author-stage proof hashes, before any acceptance banner:

| Proof | SHA-256 |
| --- | --- |
| `docs/general_theorems/ramsey_attachment_calculus.md` | `bf9a6d10942e34c6ad1b97ea379e61ef04d3b87115cec5aeb39fb53630be079b` |
| `docs/general_theorems/boundary_profiles.md` | `013507deec2512db52acdbc8897cf38155c6f05bc9df6152dd5438d18d736673` |
| `docs/general_theorems/critical_face_transport.md` | `a0d900a4f8022881b2a3f3c416eb80a26136c16ba49ee37dc34c040c0901c3f0` |
| `docs/general_theorems/profile_obstructions.md` | `0b82764ec4d4341eddf02fd51f8bff01ecb403fd64850f69da7e9ec4fc715d8f` |

Reviews:

- [Boundary profiles, Main](../docs/general_theorems/review_boundary_profiles_20261019_main.md):
  four claims accepted at exact author-stage hash.
- [Mixed interface and structural lifting, AttachmentInterfaceAudit](../docs/general_theorems/review_ramsey_attachment_calculus_20261019_interface_audit.md): all seven claims and the order-43 instance accepted.
- [Critical-face transport, CriticalTransportAudit](../docs/general_theorems/review_critical_face_transport_20261019_transport_audit.md): all five claims, duals and worked instances accepted.

All four exact reviewed bodies were preserved byte-for-byte; only acceptance
banners were added. Main's review is independent of BoundaryProfileTheory.
The mixed/lifting notes are Main-authored and independently reviewed by
AttachmentInterfaceAudit; the face note is independently reviewed by
CriticalTransportAudit. Contextual links are not hidden proof dependencies.

Integrated proof SHA-256 values after adding only the delimited banners:

| Proof basename | Integrated SHA-256 |
| --- | --- |
| `ramsey_attachment_calculus.md` | `a4adf941cf84a65ab31a4cdb78fbc673f265354f36153f2e4e8eb2bc6a02ef1a` |
| `boundary_profiles.md` | `58a73df37f082a3b096ce4b71d5ddb819ae0d977a8b54d52429a80264544bb85` |
| `critical_face_transport.md` | `1d569facc382145c92a733495d3cee5a9e8e13d14784902c3d64dd0a9b8690c3` |
| `profile_obstructions.md` | `558ff5e03811b2ee3e726b6b6d9175fa00dd3db8ec89212db5052d14d68074dd` |

| Review basename | SHA-256 |
| --- | --- |
| `review_boundary_profiles_20261019_main.md` | `02cffe9d7a6b66e8aa321b041f74c11fb0473174ace29605edcbc2e4f85b4354` |
| `review_ramsey_attachment_calculus_20261019_interface_audit.md` | `20704a92bb243e1683fea17473775f2197ec22759aa422a580237c59da40d8b9` |
| `review_critical_face_transport_20261019_transport_audit.md` | `f47dbbec081e730e8f98e080137a6f8a3ee496dfef755dc4f12955b8b8e56eef` |

Removing each banner reproduces its original reviewed hash: all four checks
passed. The retained Python block also matches the exact corrected/extended
source used in the successful validation stages below.

The audits found no correctness gaps. Non-blocking precision notes are retained
in the reviews and reflected in the banners: refinement excludes promoted
roots; representatives retain equal order; and the core instance uses its
global nonedge premise and ambient type as well as (11). No proof was weakened,
and no mathematical body or recorded source hash was silently changed.

## Executed fixed-object validation

Runtime: Python3.12.3, GCC13.3.0, in-memory Eval. Each call had a30-second
deadline; no separate memory limit was imposed. No external packages,
models, CNFs, solver, catalogue scan, graph/colouring search, download,
installation, Lean or engine change was used. Only subsets of the explicitly
fixed tiny graphs and one explicitly given Paley17 core were checked.

Observed outputs from the successful stages:

```text
PASS: fixed C5/P4 port distinction and nonisomorphic boundaried replacement
PASS: exact calculus operator checks {'cell': 4256, 'template': 544, 'convolution': 6146, 'associativity': 770, 'uniform_join': 64, 'forgetting': 160, 'introduction': 1888, 'relabelling': 112}
PASS: actual C5 critical faces, saturated capacities and complement dual 4
PASS: fixed critical17 resource faces, triangle support and derived conflict K8
PASS: pointed P3 context distinction and P4/C4 mixed-attachment counterexample
PASS: profile replacement lifts support6 through contexts/forgetting 24
PASS: exact copied-pair distinguishing formulas 24
PASS: persistent interior modules; explicit nine-vertex R(5,5)-free symmetric context
PASS: asymmetric Y123 tree and symmetric P7 are equal-order profile-equivalent R(5,5) blocks
```

The fixed core was independently checked on every4-subset for K4/I4,
on every core nonedge for its three-clique residual, and on its eight-
vertex link for triangle support. The conflict graph is literally K8;
no colouring enumeration was performed. The nine-vertex example is
explicitly not a construction or claim at order43.

### Validation-fixture correction and exact commands

The first Eval executed the operator checks successfully, then stopped
with AssertionError at the fixture assertion `load.bit_count()==cap==1`.
That assertion incorrectly gave the same capacity to both colours of an
independent two-vertex C5 core. Its independent-face capacity is1, but its
dual clique-face capacity is2 because the common core neighborhood is empty.
No proof manuscript or operator formula was changed.

Only the failed capacity/critical-core suffix was retried after replacing
that assertion by the two correct checks. The three subsequent example
suffixes were then executed once. The retained corrected source below
contains all five successful stages; it was not rerun from the top after
the fixture correction. Thus the evidence is the successful prefix plus
corrected suffix plus the three added example stages, not an invented
single uninterrupted final replay.

The executed forms were `exec(compile(source, label, 'exec'), namespace)`
with labels `ramsey-attachment-validation` (initial failed suffix),
`ramsey-attachment-validation-corrected-suffix`,
`boundary-profile-extra-examples`, `profile-obstruction-lifting-validation`,
and `asymmetric-profile-equivalent-tree`. The corrected retry selected
`source[source.index('# Actual C5'):]` at that revision. Exit status:
initial1; each corrected/additional stage0.

Full corrected reproducible source SHA-256:
`1901913331f0929fc5965708326b5608b22e98a021ad6a795be43ed3c1503d1d`.

```python
from functools import lru_cache
from itertools import combinations


def graph(n, edges):
    a = [0] * n
    for x, y in edges:
        a[x] |= 1 << y
        a[y] |= 1 << x
    return tuple(a)


def subsets(mask):
    sub = mask
    while True:
        yield sub
        if sub == 0:
            return
        sub = (sub - 1) & mask


def vertices(mask):
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit


def homogeneous(a, mask, colour):
    return all((a[x] & (mask ^ (1 << x))) ==
               ((mask ^ (1 << x)) if colour else 0)
               for x in vertices(mask))


@lru_cache(None)
def rank(a, mask, colour):
    return max(s.bit_count() for s in subsets(mask)
               if homogeneous(a, s, colour))


def free(a, mask, p, q):
    return rank(a, mask, 1) < p and rank(a, mask, 0) < q


def common(a, initial, witness, colour):
    result = initial
    full = (1 << len(a)) - 1
    for x in vertices(witness):
        result &= a[x] if colour else full ^ a[x]
    return result


def convolution(a, h, x, pset, qset, colour, left_rank):
    return max(j.bit_count() + left_rank(common(a, pset, j, colour), colour)
               for j in subsets(qset) if homogeneous(a, j, colour))


def profile(a, boundary, p, q):
    interior = ((1 << len(a)) - 1) ^ boundary
    return tuple({u: min(cap, rank(a, common(a, interior, u, colour), colour))
                  for u in subsets(boundary) if homogeneous(a, u, colour)}
                 for colour, cap in ((1, p), (0, q)))


def uniform_join(a, other, b, colour):
    n = len(a)
    assert all((a[x] & ((1 << b) - 1)) ==
               (other[x] & ((1 << b) - 1)) for x in range(b))
    remap = lambda x: x if x < b else n + x - b
    edges = [(x, y) for x in range(n) for y in range(x)
             if a[x] >> y & 1]
    edges += [(remap(x), remap(y)) for x in range(len(other))
              for y in range(x) if other[x] >> y & 1]
    if colour:
        edges += [(x, remap(y)) for x in range(b, n)
                  for y in range(b, len(other))]
    return graph(n + len(other) - b, edges)


def introduce(a, boundary, port, colour):
    n = len(a)
    neighbors = port | ((((1 << n) - 1) ^ boundary) if colour else 0)
    edges = [(x, y) for x in range(n) for y in range(x) if a[x] >> y & 1]
    edges += [(n, x) for x in vertices(neighbors)]
    return graph(n + 1, edges)


fixtures = [
    ('empty', graph(0, [])),
    ('C5', graph(5, [(i, (i + 1) % 5) for i in range(5)])),
    ('P4-good-port', graph(5, [(0, 1), (1, 2), (2, 3), (4, 0), (4, 3)])),
    ('P4-bad-port', graph(5, [(0, 1), (0, 2), (2, 3), (4, 0), (4, 3)])),
    ('K5', graph(5, combinations(range(5), 2))),
    ('cube', graph(8, [(x, x ^ (1 << k)) for x in range(8)
                     for k in range(3) if x < (x ^ (1 << k))])),
]
counts = dict(cell=0, template=0, convolution=0, associativity=0,
              uniform_join=0, forgetting=0, introduction=0, relabelling=0)
for name, a in fixtures:
    full = (1 << len(a)) - 1
    for r in range(min(2, len(a)) + 1):
        for roots_tuple in combinations(range(len(a)), r):
            roots = sum(1 << x for x in roots_tuple)
            for port in subsets(roots):
                cell = sum(1 << x for x in vertices(full ^ roots)
                           if a[x] & roots == port)
                for p in range(2, 6):
                    for q in range(2, 6):
                        if free(a, roots, p, q):
                            rp = p - rank(a, port, 1)
                            rq = q - rank(a, roots ^ port, 0)
                            assert free(a, roots | cell, p, q) == free(a, cell, rp, rq)
                            counts['cell'] += 1
    for cut in range(len(a) + 1):
        h = (1 << cut) - 1
        x = full ^ h
        for p in range(2, 6):
            for q in range(2, 6):
                ok = free(a, h, p, q) and free(a, x, p, q)
                for colour, cap in ((1, p), (0, q)):
                    for witness in subsets(x):
                        t = witness.bit_count()
                        if 1 <= t < cap and homogeneous(a, witness, colour):
                            ok = ok and rank(a, common(a, h, witness, colour), colour) < cap - t
                assert ok == free(a, full, p, q), (name, cut, p, q)
                counts['template'] += 1
        for support in subsets(full):
            for colour in (0, 1):
                value = convolution(a, h, x, support & h, support & x,
                                    colour, lambda s, c: rank(a, s, c))
                assert value == rank(a, support, colour)
                counts['convolution'] += 1
    first = len(a) // 3
    second = 2 * len(a) // 3
    h = (1 << first) - 1
    x = ((1 << second) - 1) ^ h
    y = full ^ (h | x)
    hx = lambda s, c: convolution(a, h, x, s & h, s & x, c,
                                  lambda z, d: rank(a, z, d))
    xy = lambda s, c: convolution(a, x, y, s & x, s & y, c,
                                  lambda z, d: rank(a, z, d))
    for support in subsets(full):
        for colour in (0, 1):
            left = convolution(a, h | x, y, support & (h | x), support & y, colour, hx)
            right = convolution(a, x | y, h, support & (x | y), support & h, colour, xy)
            assert left == right == rank(a, support, colour)
            counts['associativity'] += 1

left = graph(3, [(0, 1), (1, 2)])
right = graph(2, [(0, 1)])
for p in range(1, 5):
    for q in range(1, 5):
        c1, a1 = profile(left, 1, p, q)
        c2, a2 = profile(right, 1, p, q)
        for colour in (0, 1):
            result = uniform_join(left, right, 1, colour)
            cp, ap = profile(result, 1, p, q)
            for u in cp:
                assert cp[u] == (min(p, c1[u] + c2[u]) if colour else max(c1[u], c2[u]))
                assert ap[u] == (max(a1[u], a2[u]) if colour else min(q, a1[u] + a2[u]))
                counts['uniform_join'] += 1
        for a, boundary in ((left, 1), (fixtures[1][1], 3)):
            c, d = profile(a, boundary, p, q)
            for b in vertices(boundary):
                new_boundary = boundary ^ (1 << b)
                nc, nd = profile(a, new_boundary, p, q)
                for table, old, col, cap in ((nc, c, 1, p), (nd, d, 0, q)):
                    for u in table:
                        expected = old[u]
                        if homogeneous(a, u | (1 << b), col):
                            expected = max(expected, min(cap, 1 + old[u | (1 << b)]))
                        assert table[u] == expected
                        counts['forgetting'] += 1
            for port in subsets(boundary):
                for colour in (0, 1):
                    enlarged = introduce(a, boundary, port, colour)
                    bit = 1 << len(a)
                    nc, nd = profile(enlarged, boundary | bit, p, q)
                    for table, old, col in ((nc, c, 1), (nd, d, 0)):
                        for u in table:
                            expected = old[u] if not u & bit else (old[u ^ bit] if col == colour else 0)
                            assert table[u] == expected
                            counts['introduction'] += 1
        a = fixtures[1][1]
        permutation = [1, 0, 2, 3, 4]
        changed = graph(5, [(permutation[i], permutation[j]) for i in range(5)
                            for j in range(i) if a[i] >> j & 1])
        old = profile(a, 3, p, q)
        new = profile(changed, 3, p, q)
        for before, after in zip(old, new):
            for u, value in before.items():
                transported = sum(1 << permutation[i] for i in vertices(u))
                assert after[transported] == value
                counts['relabelling'] += 1

replacement1 = graph(4, [(0, 1), (1, 2), (2, 3)])
replacement2 = graph(4, [(0, 1), (0, 2), (2, 3)])
assert profile(replacement1, 1, 3, 3) == profile(replacement2, 1, 3, 3)
assert rank(replacement1, 6, 1) != rank(replacement2, 6, 1)
for colour in (0, 1):
    one = uniform_join(replacement1, right, 1, colour)
    two = uniform_join(replacement2, right, 1, colour)
    assert profile(one, 1, 3, 3) == profile(two, 1, 3, 3)
assert profile(replacement1, 0, 3, 3) == profile(replacement2, 0, 3, 3)
assert free(fixtures[2][1], 31, 3, 3)
assert not free(fixtures[3][1], 31, 3, 3)
assert homogeneous(fixtures[3][1], (1 << 4) | (1 << 1) | (1 << 2), 0)
print('PASS: fixed C5/P4 port distinction and nonisomorphic boundaried replacement')
print('PASS: exact calculus operator checks', counts)

# Actual C5 validates capacities in both colours; only subsets of this fixed graph.
a = fixtures[1][1]
h, t = 5, 31 ^ 5
capacity_cases = 0
for colour, p, q in ((0, 3, 3), (1, 3, 3)):
    for face in subsets(h):
        if face.bit_count() == 1:
            z = common(a, h ^ face, face, colour)
            load = common(a, t, face, colour)
            opposite = 1 ^ colour
            assert homogeneous(a, z | load, opposite)
            cap = (p - 1 if colour == 0 else q - 1) - z.bit_count()
            assert load.bit_count() == cap
            assert cap == (1 if colour == 0 else 2)
            capacity_cases += 1
print('PASS: actual C5 critical faces, saturated capacities and complement dual', capacity_cases)

# One explicit Paley17 core, not a search or catalogue scan.
residues = {k * k % 17 for k in range(1, 17)}
core = graph(17, [(i, j) for i in range(17) for j in range(i)
                  if (i - j) % 17 in residues])
for quad in combinations(range(17), 4):
    mask = sum(1 << i for i in quad)
    assert not homogeneous(core, mask, 1) and not homogeneous(core, mask, 0)
assert sum(x.bit_count() for x in core) // 2 == 68
full = (1 << 17) - 1
for i in range(17):
    for j in range(i):
        if not core[i] >> j & 1:
            face = (1 << i) | (1 << j)
            z = common(core, full ^ face, face, 0)
            assert z.bit_count() == 3 and homogeneous(core, z, 1)
e = common(core, full ^ 1, 1, 0)
triangles = [u for u in subsets(e) if u.bit_count() == 3 and homogeneous(core, u, 1)]
assert e.bit_count() == 8
assert min((core[x] & e).bit_count() for x in vertices(e)) >= 4
conflict = set()
for i, j in combinations(vertices(e), 2):
    if not core[i] >> j & 1 or any(u >> i & 1 and u >> j & 1 for u in triangles):
        conflict.add((i, j))
assert len(conflict) == 28
triangle = graph(3, combinations(range(3), 2))
def tau_edges(a):
    full = (1 << len(a)) - 1
    return min(s.bit_count() for s in subsets(full) if rank(a, full ^ s, 1) < 2)
assert tau_edges(triangle) == 2 and tau_edges(fixtures[1][1]) == 3
assert 8 > 3 * (5 - 1 - 2)
assert len(conflict) == 8 * 7 // 2 and 8 > 5
print('PASS: fixed critical17 resource faces, triangle support and derived conflict K8')
print('No graph search, colouring search, solver, catalogue scan, installation or generated model.')

# Additional direct examples from the boundary manuscript; no search.
pointed_middle = graph(3, [(0, 1), (0, 2)])
pointed_end = graph(3, [(0, 1), (1, 2)])
context = graph(2, [])
assembled_middle = uniform_join(pointed_middle, context, 1, 1)
assembled_end = uniform_join(pointed_end, context, 1, 1)
assert free(assembled_middle, 15, 3, 3)
assert not free(assembled_end, 15, 3, 3)
assert homogeneous(assembled_end, 14, 1)
p4_extension = graph(5, [(0, 1), (1, 2), (2, 3), (4, 0), (4, 3)])
c4_extension = graph(5, [(0, 1), (1, 2), (2, 3), (3, 0), (4, 0), (4, 3)])
assert free(p4_extension, 31, 3, 3)
assert not free(c4_extension, 31, 3, 3)
assert homogeneous(c4_extension, 25, 1)
print('PASS: pointed P3 context distinction and P4/C4 mixed-attachment counterexample')

# Profile-equivalent asymmetric input blocks acquire a symmetric representative.
def preserves_adjacency(a, permutation):
    return sorted(permutation) == list(range(len(a))) and all(
        bool(a[i] >> j & 1) == bool(a[permutation[i]] >> permutation[j] & 1)
        for i in range(len(a)) for j in range(i))

def distinguishing(a, x, y):
    return ((a[x] ^ a[y]) & ~((1 << x) | (1 << y))).bit_count()

lifting_checks = separation_checks = legal_contexts = 0
for epsilon in (0, 1):
    original = uniform_join(replacement1, replacement2, 1, epsilon)
    symmetric = uniform_join(replacement1, replacement1, 1, epsilon)
    assert profile(original, 1, 5, 5) == profile(symmetric, 1, 5, 5)
    swap = [0, 4, 5, 6, 1, 2, 3]
    assert preserves_adjacency(symmetric, swap)
    assert sum(i != swap[i] for i in range(7)) == 6
    for context_colour in (0, 1):
        old = uniform_join(original, right, 1, context_colour)
        new = uniform_join(symmetric, right, 1, context_colour)
        for intro_colour in (0, 1):
            old_plus = introduce(old, 1, 1, intro_colour)
            new_plus = introduce(new, 1, 1, intro_colour)
            boundary = 1 | (1 << 8)
            extended_swap = swap + [7, 8]
            assert preserves_adjacency(new_plus, extended_swap)
            assert sum(i != extended_swap[i] for i in range(9)) == 6
            for retained_boundary in (boundary, 1 << 8, 0):
                assert profile(old_plus, retained_boundary, 5, 5) == profile(new_plus, retained_boundary, 5, 5)
                lifting_checks += 1
            legal_contexts += int(free(new_plus, 511, 5, 5))
            for x in (1, 2, 3):
                d = (replacement1[x] & 14).bit_count()
                expected = 2 * (d if epsilon == 0 else 2 - d)
                assert distinguishing(new_plus, x, x + 3) == expected
                separation_checks += 1
# A concrete legal output, not a claim at order43.
assert free(introduce(uniform_join(uniform_join(replacement1, replacement1, 1, 0), right, 1, 1), 1, 1, 1), 511, 5, 5)

module = graph(3, [(0, 1), (0, 2), (1, 2)])
for join_colour in (0, 1):
    joined = uniform_join(module, right, 1, join_colour)
    for intro_colour in (0, 1):
        final = introduce(joined, 1, 1, intro_colour)
        assert all(bool(final[x] >> 1 & 1) == bool(final[x] >> 2 & 1)
                   for x in range(len(final)) if x not in (1, 2))
print('PASS: profile replacement lifts support6 through contexts/forgetting', lifting_checks)
print('PASS: exact copied-pair distinguishing formulas', separation_checks)
print('PASS: persistent interior modules; explicit nine-vertex R(5,5)-free symmetric context')

# Same one-boundary profile, different graph and symmetry: Y123 versus P7.
asymmetric_tree = uniform_join(replacement1, replacement2, 1, 0)
path7 = uniform_join(replacement1, replacement1, 1, 0)
assert profile(asymmetric_tree, 1, 5, 5) == profile(path7, 1, 5, 5)
assert free(asymmetric_tree, 127, 5, 5) and free(path7, 127, 5, 5)
assert [i for i in range(7) if asymmetric_tree[i].bit_count() == 3] == [0]
remaining = set(range(1, 7))
branches = []
while remaining:
    todo = [min(remaining)]
    component = set()
    while todo:
        x = todo.pop()
        if x not in component:
            component.add(x)
            todo.extend(y for y in vertices(asymmetric_tree[x]) if y != 0 and y not in component)
    remaining -= component
    mask = sum(1 << x for x in component)
    assert sum(bool(asymmetric_tree[0] >> x & 1) for x in component) == 1
    assert sum((asymmetric_tree[x] & mask).bit_count() for x in component) == 2 * (len(component) - 1)
    assert max((asymmetric_tree[x] & mask).bit_count() for x in component) <= 2
    branches.append(len(component))
assert sorted(branches) == [1, 2, 3]
# The unique degree3 vertex is fixed; distinct rooted-path lengths fix every branch.
assert preserves_adjacency(path7, [0, 4, 5, 6, 1, 2, 3])
print('PASS: asymmetric Y123 tree and symmetric P7 are equal-order profile-equivalent R(5,5) blocks')
```

## Literature positioning and limits

[Angeltveit--McKay, R(5,5)<=46, arXiv:2409.15709v1](https://arxiv.org/html/2409.15709v1),
sections2,3.2,5, already uses smaller Ramsey blocks and pointed-edge gluing.
[Antipov--Kratsch, IPEC2025, section2](https://drops.dagstuhl.de/storage/00lipics/lipics-vol358-ipec2025/html/LIPIcs.IPEC.2025.6/LIPIcs.IPEC.2025.6.html#S2)
provides standard boundaried gluing/context-equivalence terminology.
These primary sources were read for positioning; neither supplies a new
premise needed by the elementary operator proofs. No novelty or exhaustive
literature-review claim is made.

The exact arbitrary interface can be exponentially large. The finite
uniform profile does not imply a small boundary for every candidate.
The reviewed primeness theorem rules out naive nontrivial modular
substitution, not the existence of overlapping/interface decompositions.
No theorem here makes a forbidden state collision unavoidable on43
vertices. No branch is closed, no43-vertex graph is constructed, and no
new numerical value or global bound for R(5,5) is claimed.

## Final integration

All 16 statements are independently accepted; the four exact reviewed bodies
and their provenance remain intact. Final checks passed for all 228 local
links/anchors across 12 changed/new theory and navigation documents, and for
the report's four reviewed hashes, four integrated hashes and three review
hashes. The full retained validation source matches the successful-stage
source SHA-256 recorded above.

The general theorem index, theory map and results dashboard now link this
calculus. Earlier branch proof bodies, engine constraints and Lean interfaces
are intentionally unchanged: this task provides mathematical operators and
reviewed applications, not an implemented search filter or a new axiom.
No transient script files or generated graph/model artifacts were created;
the reproducible validation source is retained in this report. Ownership released.
