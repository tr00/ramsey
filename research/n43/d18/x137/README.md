# Degree-18 cross count x=137

Branch name: `research/n43/d18/x137`.
Parent: [degree-18 pivot](../../README.md). State: **excluded**.
Additional predicate: `x=e(A,B)=137`. Inherited setting: G is an order-43
(5,5)-free graph with a chosen degree-18 pivot, A=N(v) of order 18 and
B=M(v) of order 24. A is (4,5)-free; B is (5,4)-free.

The independently reviewed [full-frontier closure](frontier_closure.md)
excludes this entire branch, including q0/r0. Its three claims were accepted
at SHA-256 `ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`
by [AnchorAudit](review_frontier_closure_20261019_anchor_audit.md) (Claims 1--2)
and [CapacityAudit](review_frontier_closure_20261019_capacity_audit.md) (Claim 3).
Together with x136 exclusion, every degree-18 root has x>=138.
No x>=138 branch, degree-20 branch, or order-43 decision is resolved.

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
five. The former necessary range r0:s7..10, H=s-7, is now excluded in full.
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
reviewed r4 exclusion this had removed r1, r2 and r3, leaving r0:s7..10 and H=s-7.
The [full-frontier closure](frontier_closure.md) now excludes that last component
using effective-weight anchors and projected-column capacity, independently of r and s.
