# Complete same-degree pair coverage in the normalized minimum-degree-20 branch

Integration status (2026-10-15): every claim below is independently accepted
on its stated premises. The author-stage “ready” labels are preserved to
keep the exact reviewed proof text unchanged. See the
[independent review](review_pair_coverage_20261015_transversal.md)
and [integration manifest](../../../docs/general_theorems/integration_manifest.json).

Date: 2026-10-15. Task: `abstraction-20261015`.
Author: overlap-author agent. Pure mathematics; no graph computation,
download, installation, or novelty review. Claims are ready for independent
review. This gives a complete pair-selection reduction for this branch,
not a decision of its satisfiability.

<a id="claim-normalized-pair-01"></a>
## 1. Normalization and degree-count parameters

Claim ID: `research/n43/min-degree20/pair_coverage.md#claim-normalized-pair-01`

Kind: local-deduction

Review state: accepted

Scope: any finite simple graph `G` of order 43 whose minimum degree is at
least 20 and whose sorted degree sequence `D` satisfies the safe complement
selector `D <lex D^c`, where
`D^c=(42-d_43,...,42-d_1)` for `D=(d_1<=...<=d_43)`.
Ramsey avoidance is not needed for this count claim.

Dependencies: handshake lemma; sorted lexicographic comparison. The selector
and branch parameterization are recorded in
[theory phase I, Sections 2 and 7](../../../docs/theory_phase_1.md), with the
corrected minimum-degree split checked in
[the 2026-10-13 review](../../../docs/proof_review_2026_10_13.md).
They are rederived directly below.

Conclusion: all degrees are 20, 21 or 22, the minimum is exactly 20, and
`n20>n22`. There are nonnegative integers `j,t`, `j+t<=21`, such that

```text
n20=t+2j+1,
n21=42-2(j+t),
n22=t,
e(G)=451-j.
```

These are necessary degree-count identities, not realizability assertions.

Proof: if the maximum degree were at least 23, the smallest entry of
`D^c` would be at most 19, strictly below the smallest entry of `D`, which
is at least 20. This contradicts the selector. Thus all degrees lie in
`{20,21,22}`. Complementation swaps the counts at 20 and 22 and fixes the
count at 21. If `n20<n22`, at the first unequal sorted entry `D` has a
larger degree than `D^c`, again contradicting the selector. If `n20=n22`,
the two sorted sequences are equal, contradicting its strictness. Hence
`n20>n22`, in particular `n20>0`, proving minimum degree exactly 20.

The handshake lemma makes `n21` even, since degrees 20 and 22 are even.
As the order is odd, `n20+n22=43-n21` is odd, so `n20-n22` is a positive
odd integer, say `2j+1` for `j>=0`. Put `t=n22>=0`. Summing vertex counts
then gives the displayed `n21`, whose nonnegativity gives `j+t<=21`.
Finally the degree sum is `21*43-(n20-n22)=903-(2j+1)=902-2j`, proving
the edge count.

For completeness, applying this selector loses no complement orbit of an
order-43 Ramsey candidate. Its complement is also `(5,5)`-free; if
`D=D^c`, its degree sum would equal `21*43=903`, contrary to handshake.
Thus exactly one of a graph and its complement has the smaller sorted
degree sequence. This does not imply that every candidate normalizes into
minimum degree 20; lower-minimum branches remain separate.

Search use: propagate degree counts and retain complement-normalized branch
coverage. No lower-degree branch or arbitrary-pivot case is excluded.

Reviews: [review](review_pair_coverage_20261015_transversal.md).

<a id="claim-normalized-pair-02"></a>
## 2. A disjoint, exhaustive pair-selection split

Claim ID: `research/n43/min-degree20/pair_coverage.md#claim-normalized-pair-02`

Kind: local-deduction

Review state: accepted

Scope: every order-43 `(5,5)`-free graph in the normalized branch of Claim 1.
Write `P_i={z:d_G(z)=i}` and use its `j,t` parameters.

Dependencies: Claim 1; the same-family overlap theorem and its strict-triangle
extension in
[family overlap, Claims 3 and 4](../../../docs/general_theorems/family_overlap.md).
That proof's exact input revision is recorded below. Its classical Ramsey
premises are `R(3,3)=6`, `R(3,4)=9`, and `R(3,5)=14`; no published
neighborhood edge extrema or small degree-excess hypothesis is used here.

Conclusion: the following predicates form a disjoint exhaustive split of
the normalized minimum-degree-20 branch:

| degree-count predicate | guaranteed same-degree edge |
| --- | --- |
| `t+2j+1>=13`, equivalently `n20>=13` | adjacent `u,v in P_20` with `|N(u) intersect N(v)|<=11` |
| `t+2j+1<=12`, equivalently `n20<=12` | adjacent `u,v in P_21` with `|N(u) intersect N(v)|<=12` |

In the second predicate `n21>=20`, so there are enough degree-21 roots
without an additional family-count assumption. More generally, within either
predicate any prescribed thirteen-element subset of the indicated degree
class contains an edge obeying that row's overlap bound. Both endpoints
and the overlap restriction belong to that same prescribed family.

Proof: if `n20>=13`, apply the degree-20 specialization of family-overlap
Claim 3 to `P_20`. Its parameters are `d=20,s=5,k=4,L=12` and
`b=43-20-1=22`. Triangle equality holds, `2L=d+k=24`, the four-clique
exception `d=3k=12` is absent, and the exact anchor condition is

```text
A=max(22,44-12)=32 > 4(20-1-12)=28.
```

Thus the claimed degree-20 edge has codegree at most `L-1=11`.

If `n20<=12`, Claim 1 gives `t+2j<=11`. Since `j>=0`, also `j+t<=11`.
Therefore

```text
n21=42-2(j+t)>=42-22=20>=13.
```

Apply the strict-triangle specialization of family-overlap Claim 4 to
`P_21`. Now `d=21,s=5,k=4,L=13` and `b=21`. The triangle threshold is
strict, `2L=26>d+k=25`, and the exact anchor condition is

```text
A=max(21,42-12)=30 > 4(21-1-13)=28.
```

Thus the degree-21 edge has codegree at most `L-1=12`. The predicates
are mutually exclusive and exhaustive because `n20` is an integer.
The family theorem is quantified over every prescribed sufficiently large
equal-degree subset, which gives the stronger selection statement without
identifying separately guaranteed pairs.

Search use: branch | propagate after independent review. A complete two-root
gluing reduction may select an edge from the indicated same-degree family
under each predicate. It must retain every permitted overlap value, map,
internal graph and completion, and may not presume a neighborhood edge
deficit, a small excess, or an independent anchor not separately supplied.
Failure of a selected pair search is no nonexistence evidence without
exhaustive coverage and independently checkable certificates.

Reviews: [review](review_pair_coverage_20261015_transversal.md).

## Scope and provenance

This is coverage for `research/n43/min-degree20`, which imposes a global minimum-degree
condition and the complement selector. The branch `research/n43/d20` uses an arbitrary
even-degree pivot and lacks those global premises; its coverage cannot be
replaced by the count split here. Likewise the second row selects degree-21
endpoints, even though the ambient graph has minimum degree 20.

Input project revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.
Input hashes read:

```text
0aae68255942301e339f944d23e25dc055cb6f8e4cec271abf4a1df3f62abf35  docs/theory_phase_1.md
09c87f558e2c21be688f0adbf1a98389b8d26eff1599ebcb0b2517e965ba2820  docs/proof_review_2026_10_13.md
ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1  docs/general_theorems/family_overlap.md
```

The normalization/count argument and both numerical substitutions were
self-checked by the author; independent exact-revision review remains required.
No order-43 construction, nonexistence result, or novelty assertion is made.
