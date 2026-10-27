# Interior degree bounds transferred to the degree-18 interface

## Metadata and summary

**Kind:** local deductions from recorded external premises. **Author:** Main.
**Independent reviewer:** InteriorAudit. All three claims below are **accepted**
for their stated hypotheses; this is the historical acceptance, not a new review.
Permitted use is parameter-conditioned propagation (and pointed-family branching
for the interface claim), not executable-pruning changes or branch closure.

The pure floor strengthens `max(0,6-q)` exactly at `q=3..16`; the ceiling
strengthens the universal cap 13 at `q=32..35`. Their ambient transfer bounds
rows and the overlap of one degree-18 companion without identifying that
companion's parameters with the original root's. The worst-case `W<=10`
overlap table does not improve. No parameter profile is asserted realizable.

The [original mathematical JSON](interior_transfer.json) and
[independent-review JSON](review_interior_transfer_20261019.json) are immutable
historical machine-readable proof/review snapshots, not competing current prose.
Their historical hashes remain evidence; Git holds editorial lineage.
Live dependencies are the [published premise record](../../../README.md#state-of-the-art),
[mathematical baseline](../../../docs/mathematical_baseline.md),
[pivot classes](pivot_classes.md), and
[independent row cuts](independent_row_cuts.md#claim-independent-row-combined-pairs).
The separate [connectivity topic](neighborhood_connectivity.md#claim-connected-density-connectivity)
provides vertex-connectivity information, not a premise of these proofs.

## Setting

Pure claims: A is any simple K4/I5-free graph on 18 vertices, a=e(A)=85-q, 0<=q<=35. Ambient claims additionally assume a K5/I5-free graph G on 43 vertices, a degree-18 root v, A=N(v), B=M(v), epsilon_u=d_G(u)-18 in [0,6], E=sum_A epsilon_u, r_u=|N_B(u)|=17+epsilon_u-d_A(u). A is not assumed I4-free.

Write `U(n)` for the recorded upper edge cap `E(4,4,n)` used below.

## External premises

- README.md State of the Art: published maxima E(4,4,n)=45,50,55,60,68 for n=13,14,15,16,17, respectively (McKay-Radziszowski 1992 as recorded).
- README.md State of the Art: 41<=e(4,5,17)<=79 (Angeltveit-McKay, arXiv:2409.15709v2 Appendix A Table 1 as recorded).
- R(3,4)=9 and R(3,5)=14 as recorded in README.md State of the Art; R(4,5)=25 as recorded in docs/mathematical_baseline.md; Mantel's theorem (classical). External literature/censuses not recertified here.

<a id="claim-interior-transfer-floor"></a>
## Interior minimum-degree floor

**Scope.** Every pure A in the setting, every u in A; no connectivity, E, or x hypothesis.

**Dependencies.**

- README.md#state-of-the-art
- n43/d18/pivot_classes.md section 2 deletion floor

**Conclusion.**

Every vertex has d_A(u)>=L(q), where L(q)=6,5,4 at q=0,1,2; 4 for q=3..5; 3 for q=6..10; 2 for q=11..15; 1 for q=16; 0 for q=17..35. Equivalently: L=0 for a<=68, 1 at a=69, 2 at a=70..74, 3 at a=75..79, 4 at a=80..83, 5 at a=84, 6 at a=85. If A is connected replace L by max(1,L).

**Proof.**

1. Fix u and put s=d_A(u), S=N_A(u), H=A-({u} union S). The induced H is K4/I4-free: an I4 in H with u would form I5 in A. Only H, not all of A, is I4-free.

2. The induced S is triangle-free, since a triangle with u gives K4. Hence e(S)<=floor(s^2/4) by Mantel.

3. For each z in S, N_H(z) is triangle-free (a triangle with z would form K4) and I4-free (as a subset of H). Therefore |N_H(z)|<=8 by R(3,4)=9, so e(S,H)<=8s.

4. For s=0,1,2,3,4 the recorded maximum U(17-s) applies to H, and the exact edge partition gives a=s+e(S)+e(S,H)+e(H)<=U(17-s)+9s+floor(s^2/4). These caps are respectively 68,69,74,79,85. Thus a>68 forces s>=1, a>69 forces s>=2, a>74 forces s>=3, a>79 forces s>=4.

5. Independently A-u is (4,5)-free on 17 vertices, giving a-s<=79 and s>=a-79. Taking the maximum of these integral lower bounds and zero proves the table. Connectivity adds s>=1 since A has more than one vertex.

**Improvement.** The old max(0,6-q) floor is strictly strengthened for every q=3..16. In particular a=82 now forces minimum degree4 rather than3; a=80 forces4 rather than1; a=75 forces3 rather than0. No isolated-graph existence is asserted at any parameter.

<a id="claim-interior-transfer-ceiling"></a>
## Interior maximum-degree ceiling

**Scope.** Every pure A above, every vertex u.

**Dependencies.**

- README.md#state-of-the-art
- R(3,5)=14

**Conclusion.**

d_A(u)<=D(q)=min(13,44-q). Thus at q=32,33,34,35 the interior maximum degree is at most12,11,10,9, respectively.

**Proof.**

1. A-u remains (4,5)-free on 17 vertices and has at least41 edges, so a-d_A(u)>=41. Hence d_A(u)<=a-41=44-q.

2. N_A(u) has no triangle and no I5, hence has order at most13 by R(3,5)=14. Combine the two bounds.

**Improvement.** Strengthens the universal interior cap13 at all a=50..53 without assuming connectivity or a small cross count.

<a id="claim-interior-transfer-interface"></a>
## Rows and degree-18 companion transfer

**Scope.** Every ambient candidate in the setting. Write L=L(q), or max(1,L(q)) if connectivity is additionally assumed; D=min(13,44-q). Let m_i count A vertices of global excess i, t=m_0.

**Dependencies.**

- claim-interior-transfer-floor
- claim-interior-transfer-ceiling
- n43/d18/pivot_classes.md section 2
- n43/d18/independent_row_cuts.md setting and claim-independent-row-combined-pairs

**Conclusion.**

1. Every row satisfies max(0,17+epsilon_u-D)<=r_u<=min(17,17+epsilon_u-L). In particular r_u=17 forces epsilon_u>=L; if L=4 this excludes size17 rows at excess0..3.

2. If t>0 some adjacent degree18 root u has overlap lambda_vu=d_A(u)<=min(D,floor((170-2q-sum_{i=1}^6 m_i max(L,i))/t)).

3. If E<=17 some adjacent degree18 root u has overlap at most min(D,floor((170-2q-L E)/(18-E))). This is a statement about one companion root, not an assertion that it shares q or E with v.

**Proof.**

1. The row identity and the degree bounds L<=d_A(u)<=D give the two row inequalities; combine with the recorded r_u<=17. The latter also implies d_A(u)>=epsilon_u.

2. The total interior degree is 170-2q. Each excess-i neighbor has interior degree at least max(L,i). Subtract their degree contribution; the average over the t degree18 neighbors bounds the interior degree of at least one such neighbor. Adjacent-root overlap is exactly that interior degree, and every vertex obeys the cap D.

3. For the simplified expression put z=sum_{i>0}m_i. Then z<=E<=17 and t=18-z>0. The previous average is at most (170-2q-L z)/(18-z). This expression is increasing in z because 170-2q-18L>=0 (also a necessary consequence of all 18 degrees being at least L). Replace z by E and take floors. No assumption is made that the chosen neighbor is itself a maximum-edge pivot.

**Concrete transfers.**

|q|E|Old overlap cap|New overlap cap|Source|
|---|---|---|---|---|
|4|4|11|10|n43/d18/pivot_classes.md section 2 simplified formula|
|5|8|13|12|n43/d18/pivot_classes.md section 2 simplified formula|
|10|4|10|9|n43/d18/pivot_classes.md section 2 simplified formula|

**Limits.** These improve parameter-conditioned pair filters; the worst-case W<=10 overlap table need not improve. No occurrence of the listed profiles, selected-root equality, or complete d18 exclusion follows.

<a id="review-interior-transfer"></a>
## Historical independent review

InteriorAudit, distinct from author Main, accepted
[#claim-interior-transfer-floor](#claim-interior-transfer-floor),
[#claim-interior-transfer-ceiling](#claim-interior-transfer-ceiling), and
[#claim-interior-transfer-interface](#claim-interior-transfer-interface).
The review independently checked the pure/ambient distinction (only the
antineighborhood `H`, not all of `A`, is I4-free), the exact edge partition and
census directions, every floor-table boundary, both row-inequality directions,
positive denominators, excess-multiplicity averaging, and the increasing
E-only substitution. The dependency audit uses the corrected, reviewed
pivot overlap formulas, not the withdrawn adjacent-root common-nonneighbor
(4,4) assertion. The accepted row cap and identity are premises, not a new
audit of all independent-row-cut claims. The unaccepted parameter landscape is
not a dependency.

The reviewer recorded one **non-blocking source-attribution repair**:
`R(3,4)=9` belongs to the README premise record, not the mathematical baseline;
Mantel is classical rather than recorded there. The present immutable proof
snapshot already has that repaired attribution. The review explicitly permits
this one-clause metadata repair and acceptance/review-link/search-use integration
with proof content preserved. The deleted historical synthesis report records
that the three claims' scientific content was preserved at integration. Thus
accepted is the operative state, not a status promotion inferred from stale
source metadata. The reviewer also noted that `U` was undefined in the source;
the notation sentence above makes explicit its recorded intended meaning.

Historical exact arithmetic found zero floor/a-table mismatches, ceiling values
13 then 12/11/10/9, no monotonicity violations for
`0<=z<=E<=17`, and the advertised overlap changes 11→10, 13→12, 10→9.
Across the `36*18` pure `(q,E<=17)` comparisons there were zero regressions
and 63 strict overlap improvements; the six worst-case W-table values remained
9,9,10,11,12,12. These are historical reviewer checks, not new runs or a
computational certificate of the external premises.

**Acceptance limits.** The lower edge-count premise 41 is a universal lower
bound over all (4,5)-free order-17 graphs, corroborated in review by the
complement identity in every README census row; a restricted-subclass reading
would require re-examining the ceiling. Open (4,4) census intervals at orders
13..15 are used only as upper caps. No novelty check, Lean proof, graph search,
catalogue processing, existence/nonexistence conclusion, selected-root equality,
profile occurrence, worst-case W-table improvement, or branch closure follows.
A mathematical proof change or withdrawn dependency reopens the review gate.

## Historical validation and evidence limits

The historical cross-branch synthesis reported 1,476 scalar-envelope checks,
strict floor improvement at q=3..16, and 269 improved scalar-overlap cells
**including conditional connected variants**. This is a different count from
the review's 63 improvements for the pure `(q,E)` table. Its source and results
are recoverable with
`git show 65831d0^:research/reports/2026-10-19-cross-branch-synthesis.json`.
That report was deleted with the reports directory; it is not a currently
retained fixture; its historical driver was not restored or executed.
The immutable proof and review snapshots linked above remain the current
machine-readable evidence for this topic.

- Pure mathematical proof and trivial scalar validation only, no candidate graph search or catalogue processing.
- No novelty review, certified nonexistence result, Lean proof, or change to executable pruning.
- Older reviewed proofs remain unchanged; these claims are separately reviewable transfers.

## Validation of the displayed bounds

A fresh exact-integer replay recomputed the floor and ceiling at all 36
integer deficits and verified the three displayed overlap improvements.
This is scalar validation only, not renewed independent acceptance, a
realizability check, or a rerun of the deleted historical validation driver.

## Changelog

- Established the pure interior floor and ceiling and their row/companion
  transfers; independent review accepted all three claims with a non-blocking
  premise-source correction and explicit unchanged W-table limits.
- Consolidated the exact mathematical JSON development and substantive review
  into this authoritative topic. Retained immutable JSON proof/review evidence,
  clarified the intended `U` notation, and distinguished deleted historical
  validation from current artifacts. No mathematical scope or review promotion.
