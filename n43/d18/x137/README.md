# Degree-18 cross count x=137

Branch name: `n43/d18/x137`.
Parent: [degree-18 pivot](../README.md). State: open.
Additional predicate: `x=e(A,B)=137`. Inherited setting: G is an order-43
(5,5)-free graph with a chosen degree-18 pivot, A=N(v) of order 18 and
B=M(v) of order 24. A is (4,5)-free; B is (5,4)-free.

Put q=85-e(A) and E_A=sum_A(d_G(u)-18). The exact identity is
`1=2q+E_A`. These are all permitted numerical profiles:

| Child | Additional predicate | e(A) | Minimum column size |
| --- | --- | --- | --- |
| [q0](q0/README.md) | q=0, E_A=1 | 85 | 5 |

This is a disjoint exhaustive profile split under the inherited published
bound e(A)<=85 and degree lower bound 18.
The reviewed [four-column stability proof](../four_column_stability.md#claim-four-column-stability-04)
excludes r=4 here, and the independently accepted
[effective-degree anchor](effective_anchor.md#claim-x137-no-four-transversal)
excludes every r>=1 child because all actual columns have size at least
five. The live necessary range is r0:s7..10, with H=s-7.
Independently, `148<=e(B)<=160`, `E_B=2e(B)-296+1`, and
`e(G)=240+e(B)-q`.

[Transfer bounds](../transfer_bounds.md) records the applicable small-column
counts, pair and triple predicates, and adjacent degree-18 pivot bounds.
[Transfer summary](../transfer_summary.md) separates inherited results from
new reviewed deductions. The new r4 exclusion uses its separate higher-x
argument.

## Effective-degree anchor (accepted)

[Effective-degree rigidity](effective_anchor.md) derives an exact independent-four
anchor and excludes every four-set transversal at x137. Its three claims were
independently accepted on 2026-10-18, recorded in the sibling
[review](review_effective_anchor_20261018_anchor_rigor.md). Together with the
reviewed r4 exclusion this removes r1, r2 and r3, leaving r0:s7..10 and H=s-7.
The proof includes both tight Turan equality cases. The r0 component remains
open; no complete x137 or order-43 exclusion is claimed.
