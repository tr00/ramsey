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
| [q0](q0/README.md) | q=0, E_A=1 | 85 | 4 |

This is a disjoint exhaustive profile split under the inherited published
bound e(A)<=85 and degree lower bound 18. Every profile remains open.
The reviewed [four-column stability proof](../four_column_stability.md#claim-four-column-stability-04)
excludes r=4 here. The live necessary ranges are r0:s7..10, r1:s5..10,
r2:s3..7, and r3:s1..3, with H=-7+2r+s.
Independently, `148<=e(B)<=160`, `E_B=2e(B)-296+1`, and
`e(G)=240+e(B)-q`.

[Transfer bounds](../transfer_bounds.md) records the applicable small-column
counts, pair and triple predicates, and adjacent degree-18 pivot bounds.
[Transfer summary](../transfer_summary.md) separates inherited results from
new reviewed deductions. The new r4 exclusion uses its separate higher-x
argument.
