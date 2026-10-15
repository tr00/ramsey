# Independent review of normalized same-degree pair coverage

Date: 2026-10-15. Author: overlap-author agent.
Reviewer: `transversal_compatibility`, a distinct agent.

Claim(s): `n43/min-degree20/pair_coverage.md`,
`claim-normalized-pair-01` and `claim-normalized-pair-02`.

Reviewed revision: exact uncommitted SHA-256
`2d0856ed1586302fa1b493a2aefe20993847784148a0674ddb42911ed7d09d9d`.
The file hash was verified before the full proof was read.

Dependencies reviewed: the normalization/count proof was rederived directly.
The family-overlap dependency was read at exact SHA-256
`ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1`,
whose four claims are independently accepted in
[the augmentation-author review](../../docs/general_theorems/review_family_overlap_20261015_augmentation.md).
For applicability, this reviewer separately checked the prescribed-family
quantifiers, thirteen-root threshold, and both numerical substitutions.
The classical premises R(3,3)=6, R(3,4)=9, and R(3,5)=14 are retained as
explicit dependencies and were not recertified here.

Checks: complement selector including maximum-degree inference, parity,
parameter coverage, same-family applicability, exact anchor values,
disjointness/exhaustiveness, ambient graph types, and permitted search use.

## Findings

**Claim 01 accepted.** If maximum degree is at least 23, the first entry
of the sorted complementary sequence is at most 19, whereas the first
entry of D is at least 20. Thus the strict smaller-sequence selector
excludes that maximum degree without a Ramsey premise. All degrees lie
in 20,21,22. Complementation exchanges the outer counts. When n20<n22,
the first difference after the initial shared degree-20 entries favors
the complementary sequence; when n20=n22 both sequences are equal.
Both contradict the selector. Therefore n20>n22 and minimum degree is
exactly 20.

Handshake implies n21 is even. Since n20+n22=43-n21 is odd,
n20-n22 is a positive odd integer 2j+1. Setting t=n22 gives

```text
n20=t+2j+1, n21=42-2(j+t), n22=t,
j>=0, t>=0, j+t<=21.
```

The exact degree sum is 20n20+21n21+22n22
=21*43-(n20-n22)=902-2j, so e(G)=451-j. Independently, if D=D^c
then the sum of D equals half the sum of D and D^c, namely 903,
contradicting handshake. Thus every complement orbit of order-43
(5,5)-free graphs has exactly one smaller sorted sequence. The proof
correctly keeps other normalized minimum-degree branches: normalization
itself does not force the minimum to be 20.

**Claim 02 accepted.** If n20>=13, the prescribed family P20 has enough
members for family-overlap Claim 03. Its parameters obey triangle equality
`2L=24=d+k` for d=20,k=4,L=12. The excluded equality-case degree 3k=12
is absent. With b=43-20-1=22, the exact anchor is
`max(22,44-12)=32>4(20-1-12)=28`. Hence the same family contains an
adjacent pair of ambient codegree at most 11.

If n20<=12 then t+2j<=11; equivalently t<=11-2j. Therefore
j+t<=11-j<=11 and n21=42-2(j+t)>=20. Thus the degree-21 family has
at least thirteen members without any extra census or excess assumption.
For family-overlap Claim 04, d=21,k=4,L=13 gives strict triangle exclusion
`2L=26>25=d+k`. With b=21 the anchor is
`max(21,42-12)=30>4(21-1-13)=28`. Consequently the degree-21 family
contains an adjacent pair of ambient codegree at most 12. The sharper
thirteen-root threshold is justified by the accepted family theorem's
triangle-free component envelope; using only its elementary k^2+1
threshold would not establish the stated arbitrary thirteen-subset
conclusion, so the dependency on that refinement is material.

The two degree-count predicates are disjoint and exhaustive for integral
n20. In each one, every prescribed thirteen-element subset of the
indicated family satisfies the same equal-degree and ambient Ramsey
hypotheses, so the guaranteed edge and its codegree occur within that
same subset. The argument never combines a separately selected edge
with a separately proved overlap bound. No low-excess, neighborhood edge
extremum, or independent-four prohibition in N(v) is introduced.

Outcome: **accepted**, both claims at the exact reviewed hash, on the
recorded family-overlap theorem and its explicit classical Ramsey premises.

Permitted search use: propagate degree counts; branch on n20>=13 versus
n20<=12; select a same-degree edge with the corresponding codegree bound.
For a complete nonexistence reduction all permitted overlap values,
maps, internal graphs, and completions must be retained and independently
certified. The branch n43/d20 lacks the global normalization/minimum-degree
premises and cannot inherit this exhaustive count split. No order-43
branch is closed by this review or the audited statements.

Limits: independent mathematical audit, not a formally checked certificate.
No literature novelty review, classical Ramsey-value recertification,
graph enumeration, or gluing implementation coverage audit. Acceptance
applies only to the exact stated revision; substantive changes require
renewed review.
