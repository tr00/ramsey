# Averaging continuation: omitted triples and the x=279 endpoint

Date: 2026-10-18. Task: `averaging-tail-20261018`.
Authors: Main, TailZeroOne, TailTwoThree. Independent reviewers:
AuditOmission, AuditZeroOne, AuditTwoThree.

## Result and exact scope

Theory-only continuation of
[the averaging agenda](../n43/d18/averaging_future_work.md), starting from
the already reviewed x<=279 bound, not the older scalar ceiling288.
All eleven claims have independent acceptance on their stated premises.
No novelty claim, graph search, solver, catalogue processing, download,
installation, Lean change, engine change, staging or commit.

Write t for the number of size-17 rows, s for size-16 rows, and
D=sum_(other rows)(15-row size). The new notes establish omission-supply and actual attachment capacities,
then exclude three of the six initial x279 profiles. Proof homes:
[omission cuts](../n43/d18/averaging_omission_cuts.md),
[zero/one 17-root](../n43/d18/tail_zero_one.md),
[two/three 17-roots](../n43/d18/tail_two_three.md).
The conditional tail bounds are x<=278 at t0 and x<=271 at t1,s8;
(t,s,D)=(2,6,1) fails because b<=143<144. The proofs retain actual
membership and the correct two-omission capacity on14--16 edges.

The new endpoint cover has exactly three remaining numerical profiles:

| t | s | D | size-15 row count |
| --- | --- | --- | --- |
| 1 | 7 | 0 | 10 |
| 2 | 5 | 0 | 11 |
| 3 | 3 | 0 | 12 |

All three remain unresolved. Therefore the all-profile bound is still
x<=279; x<=278 is **not** established. At x=279 every row has size at
least15, e(A)<=67, and the retained 50<=e(A) premise gives
18<=q<=35 and odd total A-excess E in73..107. No small-excess premise
is used. The user-reported closure of x136 is neither questioned nor
used as an input to any proof here.

## Independent review and provenance

Three sibling audits cover all eleven new claims:

* [Omission supply, capacity and endpoint cover](../n43/d18/review_averaging_omission_cuts_20261018_audit.md).
* [Zero/one 17-root deductions](../n43/d18/review_tail_zero_one_20261018_audit.md).
* [Two/three 17-root deductions](../n43/d18/review_tail_two_three_20261018_audit.md).

The omission note's initial audit found two premise-declaration omissions;
both were corrected and the revised exact body independently accepted.
The two/three-root note's classical Mantel/Turan dependency clarification
is recorded in its integration banner without changing the reviewed body.
The endpoint cover's sibling-acceptance gate is discharged by the two
accepted endpoint audits. No mathematical gaps remain in these stated
deductions; all three residual endpoint profiles remain open.

Final provenance (SHA-256; body means the exact reviewed note before its
acceptance banner):

```text
n43/d18/averaging_omission_cuts.md
  body 8b01927b165167b108b6ae0b4829a7688a4ba2ec61b80e50bcbc2f0f099e45b9
  file ff46f5a9cc6723c26298034ff53c05bcc675a18b38d1ceb0c0f3bcb09b91b8b7
n43/d18/tail_zero_one.md
  body d5e0f9319228d562e886c03e7017001a6d23e3e4c4a07dda01d2879efd4a983e
  file e433102247ca2876a54b8f7fb89ee2eb943f6fd3cd57164b966cd98dc0c34fb7
n43/d18/tail_two_three.md
  body 1cf1ac0ccada5735c22b4f3198b3f2f2d1b88d2f78d6d0dd233dfb1dfe4df583
  file 16d1e3a30e27c60728d39a2bbcdafa25a938a16b476fa80a225002d85ee6738d
review_averaging_omission_cuts_20261018_audit.md
  45ff3ff4daf50b2957c8dd1ccea0484409033ecff1fd3e45976733d5cc11132f
review_tail_zero_one_20261018_audit.md
  a2e9fa3426f679fd11dcf69d62d58ea2d7c32adfab509baad4a7de0a8c544161
review_tail_two_three_20261018_audit.md
  aa3256a1d12dc71a225d883007d4cf25de210a9779b68195e133e8a430db6a3d
```

Integration preserved all three accepted bodies and the preexisting
independent-row, large-row and two averaging-agenda claim bodies.
The audit hashes above identify the original reviews, before editorial
condensation; see [cleanup lineage](2026-10-21-research-cleanup.md).

Input SHA-256 values before this continuation:

```text
bba1f2b598080c7fc36d08e4b2ee443e8a98383ba75975dcdb5002a9f2773c95  n43/d18/averaging_future_work.md
9aa35b990079ca3e249c9df9b096252fcbbb73dec9b0280e3059b3a78e2434b6  n43/d18/independent_row_cuts.md
4d91ae44929b9026eca2fd5de5a36a75927368658c904c37d4a6c10fb8d1cb71  n43/d18/large_row_extensions.md
e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07  n43/d18/weighted_averaging.md
719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3  n43/d18/anchored_cell_averaging.md
```

## Trivial scalar validation

Executed in the Python Eval kernel, Python 3.12.3, GCC13.3.0; no external
package, graph data or solver. The following reproduces the material scalar
checks (finite integer arithmetic, not graph enumeration):

```python
from itertools import product
from math import ceil

checks = 0
for t, s in product(range(5), range(13)):
    if s <= 12-3*t and 7*t+8*s <= 72:
        for r in range(16):
            d = 15-r
            assert 32-r-16 == 1+d and 32-r-17 == d
            assert 24-r == 9+d and 23-r == 8+d
            checks += 1
assert checks == 496
profiles = [(t, s, 270+2*t+s-279)
            for t, s in product(range(5), range(13))
            if s <= 12-3*t and 7*t+8*s <= 72 and 270+2*t+s >= 279]
assert profiles == [(0,9,0),(1,7,0),(1,8,1),(2,5,0),(2,6,1),(3,3,0)]
assert [p for p in profiles if p not in [(0,9,0),(1,8,1),(2,6,1)]] \
       == [(1,7,0),(2,5,0),(3,3,0)]
for d in range(16):
    assert ceil(8/(1+d)) >= 8-4*d
maxima = [max(30-q+min(2*q+j,c) for q in range(7))
          for j,c in enumerate((10,8,2))]
assert maxima == [35,34,32]
assert 124-5+(14+max(maxima))//2 == 143
h,M,a,f,e = 2,11,24,72,5
assert 1<=h<=6 and 5<=M<=14 and h*(14-M)<=7*(h-1)
assert M>=ceil(7+7/h) and f+2*e-M-a<=49 and f+M+a<=112
assert 0<=a<=7*(10-h) and f>=63 and e>=5 and f+e>=76
assert a+M>=27+e and 68+f+e==145
triples = [p for p in product(range(7), repeat=3)
           if sum(p)==13 and all(p[i]+p[j]>=8
               for i in range(3) for j in range(i+1,3))]
assert sorted({tuple(sorted(p)) for p in triples}) == [(3,5,5),(4,4,5)]
assert (18*23-279)//2 == 67
assert (279-306+2*50, 279-306+2*67) == (73,107)
```

Observed outputs: 496 row-capacity identity cases; six initial and three
remaining endpoint profiles; 16 deficit-boundary cases; witness maxima
35,34,32; B-edge cap143; residual scalar witness b145; equality excess
multisets (3,5,5) and (4,4,5). All assertions passed. The b145 tuple is
only aggregate arithmetic, not a graph construction. Scalar checks do not
replace independent mathematical review or certify nonexistence.

Final integration checks passed: the report's exact Python reproduction
was executed successfully; all 113 local links/anchors in the three proof
notes, three audits, updated agenda, d18/results navigation and this report
resolve. Both original accepted averaging claim blocks remain verbatim,
and the existing independent-row and large-row proof files are unchanged.
No temporary script, graph artifact or model was created; no engine or
Lean test run was applicable to this mathematical-documentation task.

## Handoff

Prioritize simultaneous 17-core attachments in the three exact x279
profiles. For t=2 retain both overlapping and disjoint omission cases;
for t=1 retain actual shared eight-set signatures; for t=3 combine
triangle-L16 capacities with the independent-four excess cut. The
unavoidable-triple supply becomes weak when Delta is large, so it does
not close the agenda's broad middle regime. Adjacent size-16 rows also
remain unexcluded. No engine filter or theory-map promotion is made.
