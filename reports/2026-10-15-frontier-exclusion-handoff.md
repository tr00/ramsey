# Handoff: candidate exclusion of the equality frontier

Date: 2026-10-15. Task: `frontier-exclusion-handoff-20261015`.
Author and self-auditor: Codex. Base HEAD:
`ab4941bd3e4b4b0bcd89098482f5767bd3fc5925`.

The user asked for a mathematical breakthrough, then requested documentation
and a commit as a handoff to end the day. The result is a candidate proof
excluding the **entire** degree-18 `x=136` branch, including its sole
remaining `r=0` child. This is an author-stage result awaiting independent
review. No accepted branch status or theory-map entry has been changed.

The complete proof is
[frontier_exclusion_handoff.md](../n43/d18/x136/frontier_exclusion_handoff.md),
SHA-256:

```text
c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb
```

Its four stable claim anchors have review state ready and search use none:

1. `claim-frontier-handoff-double-domination`: every all-degree-eight I4
   anchor has at least two neighbors at every other A vertex. Its saturated
   B singleton triangle prevents a further singleton signature inside A.
2. `claim-frontier-handoff-three-anchors`: three disjoint such anchors would
   give at least24 edges between them; their degree sum96 and a six-vertex
   K4-free remainder cap12 give `e(A)<=84`, contradicting85.
3. `claim-frontier-handoff-low-degrees`: deletion caps repeatedly produce
   three disjoint anchors if at least two vertices have degree<=7. A separate
   Turan equality argument excludes a sole degree-six vertex. Thus at most
   one vertex has degree7 and all others have degree>=8.
4. `claim-frontier-handoff-exclusion`: with no degree7 vertex, all I4s are
   supported on D8, so projected columns and tau>=5 demand at least120
   incidences, exceeding the available degree budget. With one degree7
   vertex, adjoin it to each D8 projection as an abstract transversal. This
   forces exactly11 degree8 vertices; the six others have degree>=10 and
   cannot belong to any I4. The full support then has only109 B incidences
   against the necessary120.

The proof uses existing independently accepted all-degree-eight-anchor and
abstract-transversal-five results and K4/I4 core edge caps36,42,48 at orders
11,12,13. It also retains the existing external order17/18 neighborhood
extrema and small Ramsey numbers. Exact full dependency file hashes are
recorded in the proof. Their independent review records were read during
the handoff preparation; those premises have not been recertified here.

## Verification performed

The author rechecked forbidden-set witnesses, deletion identities, ambient
types, and projected-transversal quantifiers. A Python3 standard-library
formula check verified all18 strict deletion comparisons and both final
incidence contradictions. Exact Fraction arithmetic also rechecked
nonnegativity of the inherited affine core residuals and their published
vectors at orders11,12,13. All assertions passed. `git diff --check` passed.

The new arithmetic checks can be replayed from the repository root with:

```sh
python3 - <<'PY'
from math import comb

caps = {0:0, 1:0, 2:1, 3:3, 4:5, 5:8, 6:12,
        7:16, 8:21, 9:27, 10:31, 11:36, 12:42, 13:48}
def b4(ell):
    q, r = divmod(ell, 4)
    return r*comb(q+1, 2)+(4-r)*comb(q, 2)

for ell in range(2, 11):
    assert 53-5*ell+b4(ell) > caps[14-ell]
    assert 29-3*ell+b4(ell) > caps[10-ell]
assert 96-24+12 == 84
assert 85-32-6+2 == 49 > 48
assert 85-64-6+8+4 == 27
assert 6+3*10 == 36 > 32
assert (120+8)//9 == 14 and (234-170)//5 == 12
assert (96+8)//9 == 11 and (228-170)//5 == 11
assert 170-7-11*8 == 75
assert 75-5*13 == 10
assert 10+7+8+8 == 33 > 32
assert 11*9+10 == 109 < 120
print('PASS: candidate-frontier formula checks')
PY
```

Formula checks are not independent mathematical review or formal proof
certificates. No graph enumeration, solver, proof checker, canonicalizer,
download, installation, or novelty review took place.

## Next-agent instructions and use limits

Start by independently auditing the full proof at the exact hash above;
record a sibling review following [the workflow](../docs/workflow.md).
Prioritize the full-graph singleton witness, the single-degree-six Turan
equality case, and the degree-seven projected-transversal quantifiers.
The proof includes a detailed review order and dependency links.

If all four claims and their exact dependency chain are accepted, the
coordinator can close x136 and record `x>=137` for every degree-18 root in
an order-43 candidate. Update branch navigation, reduction index, dashboard,
and theory map only after that review. If an error is found, retain the
valid deductions and mark affected claims changes-requested.

The author currently knows no unresolved algebraic gap. This handoff does
not claim independent acceptance, a new exact value of R(5,5), or complete
coverage of all order-43 graphs. No work was performed at orders44 or45.
The x>=137 branch and other order-43 schemes remain open. The user
authorized a selective commit of this handoff and its WORK.md row; no
shared accepted indexes are included. Ownership is released for the next
agent. The containing Git commit records the final revision without a
self-referential commit hash in these files.
