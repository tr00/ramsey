# r=2 frontier branch

Branch name: `n43/d18/x136/r2`. State: excluded on the recorded premises.
Parent: [x136](../README.md); inherit all its assumptions and notation.
Exact additional predicate: precisely 2 vertices y in B have |C_y|=4.
The earlier necessary count s=4..7 is now **fully excluded** by the
reviewed [low-excess compatibility](low_excess_columns.md) and
[joint size-five interface](independent_triples.md). Here s counts size-five
columns, T_i=C_(q_i) are the two size-four columns, and
H=sum_(|C_y|>=6)(|C_y|-6)=s-4.

| Former child | Reviewed consequence |
| --- | --- |
| s=4 | Excluded: H=0 forces disjoint T_i, prohibited by the new disjoint-transversal theorem |
| s=5 | Excluded: the sole size-seven column forces a singleton overlap of A degree eleven, prohibited by the new singleton theorem |
| s=6, one size-eight column | Excluded by the same singleton-degree-eleven obstruction |
| s=6, two size-seven columns | Excluded: two overlaps violate global nonedge codegree; the remaining singleton has forbidden A degree ten |
| s=7 | Excluded: saturated size-five memberships force a singleton overlap; its exact row has degree eleven |

Before its final contradiction, the s=6 branch is forced to have exactly two size-seven columns W_1,W_2, fourteen
size-six columns, six size-five columns, and two size-four columns. The
intersection T_1 intersect T_2={a} is a singleton, with d_A(a)=10 and
d_G(a)=18. For K=N_B(q_1) intersect N_B(q_2),

```text
K=L5 union {z_1,z_2}, |K|=8,
|C_(z_1)|=|C_(z_2)|=6,
N_B(a)={q_1,q_2,W_1,W_2,z_1,z_2,y_a}, y_a in L5,
{z_1,z_2,y_a} is independent in B.
```

Thus a belongs to both size-seven and both specified size-six columns,
and to exactly one size-five column. An independent triple in B[L5] is
unavoidable; its three five-columns are disjoint and leave a triangle
in A. The simultaneous eight-vertex remainders have the exact degree and
edge budgets in [Claim triples-01](independent_triples.md#claim-r2-triples-01).

Exact reviews: [low-excess Claims 01--04](review_low_excess_columns_20261014_pivot.md),
[low-excess Claim 05](review_low_excess_remaining_20261014_pivot.md),
[triples Claims 01--04](review_independent_triples_20261014_coordinator.md),
and [remaining overlap closure](review_r2_remaining_20261014_pivot.md).
The [singleton degree-ten review](review_singleton_ten_20261014_pivot.md)
accepts the final contradiction and full r2 coverage. The
[second low-excess review](review_low_excess_columns_20261014_triples.md)
independently accepts all six final low-excess claims and the closure chain.
All closures retain the equality-frontier and recorded census premises;
they are independently reviewed mathematical reductions, not a formal
order-43 certificate. The stronger arbitrary-transversal claims need the
full frontier anchor bound, rather than only e(A)=85.

The final theorem prohibits any two four-set I4-transversals with a
singleton intersection of degree ten, using the full equality-frontier
anchor bound. This excludes the forced residual s=6 profile and completes
the s=4..7 coverage. No x136 or order-43 exclusion follows. The displayed
intermediate interface and pair cores remain historical proof steps.
