# Degree-18 cross count x=140

Branch name: `research/n43/d18/x140`.
Parent: [degree-18 pivot](../../README.md). State: open.
Additional predicate: `x=e(A,B)=140`. Inherited setting: G is an order-43
(5,5)-free graph with a chosen degree-18 pivot, A=N(v) of order 18 and
B=M(v) of order 24. A is (4,5)-free; B is (5,4)-free.

Put q=85-e(A) and E_A=sum_A(d_G(u)-18). The exact identity is
`4=2q+E_A`. These are all permitted numerical profiles:

| Child | Additional predicate | e(A) | Minimum column size |
| --- | --- | --- | --- |
| [q0](q0/README.md) | q=0, E_A=4 | 85 | 4 |
| [q1](q1/README.md) | q=1, E_A=2 | 84 | 4 |
| [q2](q2/README.md) | q=2, E_A=0 | 83 | 4 |

This is a disjoint exhaustive profile split under the inherited published
bound e(A)<=85 and degree lower bound 18. Every profile remains open.
Independently, `146<=e(B)<=160`, `E_B=2e(B)-296+4`, and
`e(G)=243+e(B)-q`.

[Transfer bounds](../transfer_bounds.md) records the applicable small-column
counts, pair and triple predicates, and adjacent degree-18 pivot bounds.
[Transfer summary](../transfer_summary.md) separates inherited results from
new reviewed deductions. The equality-frontier exclusion of four size-four
columns must only be transferred with the stated additional argument.
