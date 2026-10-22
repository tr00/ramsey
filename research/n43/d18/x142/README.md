# Degree-18 cross count x=142

Branch name: `research/n43/d18/x142`.
Parent: [degree-18 pivot](../../README.md). State: open.
Additional predicate: `x=e(A,B)=142`. Inherited setting: G is an order-43
(5,5)-free graph with a chosen degree-18 pivot, A=N(v) of order 18 and
B=M(v) of order 24. A is (4,5)-free; B is (5,4)-free.

Put q=85-e(A) and E_A=sum_A(d_G(u)-18). The exact identity is
`6=2q+E_A`. These are all permitted numerical profiles:

| Child | Additional predicate | e(A) | Minimum column size |
| --- | --- | --- | --- |
| [q0](q0/README.md) | q=0, E_A=6 | 85 | 4 |
| [q1](q1/README.md) | q=1, E_A=4 | 84 | 4 |
| [q2](q2/README.md) | q=2, E_A=2 | 83 | 4 |
| [q3](q3/README.md) | q=3, E_A=0 | 82 | 4, by the actual-column theorem |

This is a disjoint exhaustive profile split under the inherited published
bound e(A)<=85 and degree lower bound 18. Every profile remains open.
The reviewed [actual size-three column theorem](q3/three_columns.md)
requires E_A>=14 for such a column at q=3. Together with the elementary
lower bound of three, this proves every column has size at least four in
the q3 profile too. The isolated four-transversal proof still stops at q<=2.
Independently, `145<=e(B)<=160`, `E_B=2e(B)-296+6`, and
`e(G)=245+e(B)-q`.

[Transfer bounds](../transfer_bounds.md) records the applicable small-column
counts, pair and triple predicates, and adjacent degree-18 pivot bounds.
[Transfer summary](../transfer_summary.md) separates inherited results from
new reviewed deductions. The equality-frontier exclusion of four size-four
columns must only be transferred with the stated additional argument.
