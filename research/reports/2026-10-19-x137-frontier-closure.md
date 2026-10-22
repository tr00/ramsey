# Single-excess frontier research: x=137

Date: 2026-10-19. Task: `x137-frontier-closure-20261019`.
Task kind: Research. Author/coordinator: Main.

## Result and review gate

Accepted result: no degree-18 rooted order-43 K5/I5-free graph has
x=e(N(v),M(v))=137. Both independent scoped reviews accepted the exact
candidate revision; their scopes jointly cover all three claims.

Proof: [frontier closure](../n43/d18/x137/frontier_closure.md), Claims
`claim-x137-closure-anchors`, `claim-x137-closure-low-weights`, and
`claim-x137-closure-exclusion`.

The advance over the existing x136 argument has two essential steps:

- Three effective-weight-eight anchors would force the unique excess vertex
  to have five neighbors in a K_{2,2,2} remainder, producing a forbidden K4.
- With at most one low-weight vertex, all independent four-sets lie inside
  a set U with e(U,B)<=117. Each projected actual column is an abstract
  transversal and must have size at least five, requiring e(U,B)>=120.

The published 12-vertex (4,4) upper edge bound 40 is needed in the first
deletion table; the earlier elementary cap 42 is insufficient there.

## Independent review

- [AnchorAudit](../n43/d18/x137/review_frontier_closure_20261019_anchor_audit.md):
  accepted Claims 1 and 2, including dependency applicability and tight equality.
- [CapacityAudit](../n43/d18/x137/review_frontier_closure_20261019_capacity_audit.md):
  accepted Claim 3 conditional on ell<=1, including abstract-transversal scope.

Reviewed candidate SHA-256:
`ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`.
An author's arithmetic replay is a self-check, not independent mathematical
review or a certified order-43 exhaustion.

Integrated proof SHA-256:
`7090245d842a24dd4bb3aab71f3c973e3ea79dc5dd1ac8e7a37cae74cd93abfa`.
Only an acceptance banner was inserted; removing that banner reproduces the
reviewed candidate hash exactly (checked in the validation kernel).
Anchor review SHA-256:
`beaa22583e4ae8dca78cb95c6eee5600dc665af0a24cbfb9d30176f07435a0e2`.
Capacity review SHA-256:
`f05bca37ba533fba6a80395c41b937ca3ce80379a293f22a23c717e786299b97`.

## Inputs

Exact input SHA-256 values at the author's validation:

| File | SHA-256 |
| --- | --- |
| `research/n43/d18/x137/effective_anchor.md` | `2a5400db2b8dc3397025e0cb038382b45d8369b112495f98b375bd291278234b` |
| `research/n43/d18/x137/review_effective_anchor_20261018_anchor_rigor.md` | `45ce4497b40f10349ae026a0b3d352f9bff96c257862e28832af79df8de64cbc` |
| `research/n43/d18/frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `README.md` | `fff09d1ae4150385e869d15f974cde5070cfddc5a64a946422cbec6174923de4` |
| `research/n43/d18/x136/five_column_compatibility.md` | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` |
| `research/n43/d18/x136/frontier_exclusion_handoff.md` | `a199142f594183660037639eddeeeb4ebffe331afcb92e00f0fa796384e9a127` |

External premises remain the repository's recorded small Ramsey numbers and
published edge extrema. The proof does not recertify the graph catalogues or
claim literature novelty. The effective-anchor dependency has an existing
independent review; its historical author-stage assertions are not new evidence.

## Trivial validation, not computational exploration

Executed in the Python Eval kernel, Python 3.12.3 (GCC 13.3.0), with a
30-second per-cell deadline. Normal completion; all assertions passed.
No solver, graph catalogue processing, candidate search, package installation,
download, engine change or Lean change. No new experiment-sized artifacts.

The following dependency-free replay combines the assertions actually run:

```python
from itertools import combinations, combinations_with_replacement

U = {0:0, 1:0, 2:1, 3:3, 4:5, 5:8, 6:12,
     7:16, 8:21, 9:27, 10:31, 11:36, 12:40}
def b4(j):
    q, r = divmod(j, 4)
    return r*q*(q+1)//2 + (4-r)*q*(q-1)//2

for ell in range(2, 11):
    assert 52-5*ell+b4(ell) > U[14-ell]
    assert 28-3*ell+b4(ell) > U[10-ell]

edges = {(a,b) for a,b in combinations(range(6),2) if a//2 != b//2}
for five in combinations(range(6),5):
    assert any(all(tuple(sorted(e)) in edges for e in combinations(tri,2))
               for tri in combinations(five,3))

profiles = []
for h in range(5,8):
    for t in range(11,18):
        for high in combinations_with_replacement(range(9,14),17-t):
            if h + 8*t + sum(high) != 169:
                continue
            assert t == 11
            assert all(w >= 16-h for w in high)
            eligible = [w for w in high if w+h+16 <= 32]
            assert len(eligible) <= 1
            capacity = 9*t + 17-h + sum(17-w for w in eligible)
            assert capacity <= 117 < 120
            profiles.append((h, high, capacity))
assert len(profiles) == 10
assert max(p[2] for p in profiles) == 117
for h in (5,6,7):
    assert (52+h)//5 == 11
    assert 81-h > 2*(16-h)+4*13
    assert 99+(17-h)+(17-(16-h)) == 117
assert (234-169)//5 == 13
quad_count = 0
for h, high, capacity in profiles:
    weights = [h] + [8]*11 + list(high)
    support = set(range(12)) | {i for i in range(12,18) if weights[i] == 16-h}
    for quad in combinations(range(18),4):
        quad_count += 1
        if sum(weights[i] for i in quad) <= 32:
            assert set(quad) <= support
    assert sum(17-weights[i] for i in support) < 120
assert quad_count == 30600
print('PASS: 18 deletion inequalities, 6 K222 subsets, 10 scalar profiles')
```

Observed: all 18 deletion inequalities strict; each of the six five-subsets
of the fixed K_{2,2,2} contains a triangle; exactly ten scalar high-weight
profiles survive the sum constraint, and every projected capacity is at most
117. Closed-form t and capacity bounds also passed a separate replay.
These finite checks do not establish graph existence or nonexistence by search.

An additional direct scalar check examined all 30,600 four-subsets across
the ten weight profiles. Every four-subset of weight sum at most 32 was
contained in the proposed U. This verifies the support implication against
all scalar boundary profiles, without enumerating graphs.

## Limits and integration

Combining this accepted result with the accepted x136 closure gives x>=138
for every degree-18 root. Equivalently 2q+E_A>=2;
q=0 then requires E_A>=2. No unavoidable degree-18 root with x<=137 is
claimed. All x>=138 branches, the degree-20 scheme, and R(5,5) remain open.
No formal Lean proof, SAT/UNSAT certificate, or proof of R(5,5)=43 is supplied.

Integration updates the x137/q0 and parent branch navigation, the historical
x>=137 overview, results dashboard, reduction index, frontier-band status,
transfer summary, and root README. Earlier proof bodies and historical reports
retain their original claims and review provenance. No engine constraint
default was changed: retaining the weaker floor136 is mathematically sound
and avoids adding unrequested engine behavior to this research task.
The earlier effective-anchor note also receives a current-status banner;
its reviewed mathematical body is unchanged.

The retained inline replay was executed directly from this report and passed,
including all 30,600 scalar support checks. Exact reviewed-body preservation
and the three final artifact hashes above were verified in the same kernel.
Final local Markdown validation checked 247 links across the 15 changed/new
research and navigation documents, including explicit and heading anchors:
PASS. Removing the effective-anchor status banner also reproduces that
dependency's pre-integration SHA-256 exactly.
