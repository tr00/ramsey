# Degree-18 cross count x=138

Branch name: `n43/d18/x138`.
Parent: [degree-18 pivot](../README.md). State: **excluded** by independently
reviewed tau/support proofs of both profiles below.
Additional predicate: `x=e(A,B)=138`. Inherited setting: G is an order-43
(5,5)-free graph with a chosen degree-18 pivot, A=N(v) of order 18 and
B=M(v) of order 24. A is (4,5)-free; B is (5,4)-free.

Put q=85-e(A) and E_A=sum_A(d_G(u)-18). The exact identity is
`2=2q+E_A`. These are all permitted numerical profiles:

| Child | Additional predicate | e(A) | Status |
| --- | --- | --- | --- |
| [q0](q0/README.md) | q=0, E_A=2 | 85 | Excluded; effective anchors and extremal-core obstructions |
| [q1](q1/README.md) | q=1, E_A=0 | 84 | Excluded; saturated anchors and projected capacity118<120 |

This is a disjoint exhaustive profile split under the inherited published
bound e(A)<=85 and degree lower bound18. Both profiles are excluded.
Independently, `147<=e(B)<=160`, `E_B=2e(B)-296+2`, and
`e(G)=241+e(B)-q`.

Proofs and exact-revision independent reviews:

- [q0: two excess units](../tau/q0_effective_reduction.md), with
  [foundations review](../tau/review_q0_foundations_20261019_independent.md) and
  [closure review](../tau/review_q0_closure_20261019_independent.md).
- [q1: zero excess](../tau/q1_anchor_reduction.md), with
  [review](../tau/review_q1_anchor_reduction_20261019_independent.md).
- [General support and rootwise consequences](../tau/transversal_support.md),
  with [review](../tau/review_transversal_support_20261019_independent.md).

Together with x136/x137, every degree18 root has **x>=139**; if E_A=0,
then q>=2 and x>=140. These proofs do not exclude higher x or the full
connected branch. [Dated research report](../../../reports/2026-10-19-d18c-tau-frontier.md).


[Transfer bounds](../transfer_bounds.md) records the applicable small-column
counts, pair and triple predicates, and adjacent degree-18 pivot bounds.
[Transfer summary](../transfer_summary.md) separates inherited results from
new reviewed deductions. The equality-frontier exclusion of four size-four
columns must only be transferred with the stated additional argument.
