# Degree-18 pivot

Branch name: `n43/d18`. Scheme: even-pivot. Object: rooted graph (G,v).
Assumptions: G is an order-43 (5,5)-Ramsey candidate and d_G(v)=18.
Notation and inherited bounds: [reduction index](../reductions.md), sections 2,
3, and 8. A=N(v), B is the antineighborhood, x=e(A,B).

| Child | Predicate | Status |
| --- | --- | --- |
| [x136](x136/README.md) | x=136 | Open, refined by the number of size-four columns |
| [x137](x137/README.md) | x=137 | Open; r=4 excluded |
| [x138](x138/README.md) | x=138 | Open |
| [x139](x139/README.md) | x=139 | Open |
| [x140](x140/README.md) | x=140 | Open |
| [x141](x141/README.md) | x=141 | Open |
| [x142](x142/README.md) | x=142 | Open; every column has size at least four |
| [x-ge143](x-ge143/README.md) | x>=143 | Open residual branch |

This disjoint split uses the existing lower bound x>=136 and integer x.
The notes tabulate profiles through x142; no upper bound x<=142 was located
in the frontier-band work or reports. The residual x>=143 branch is retained.
The [x>=137 overview](x-ge137/README.md) links to these sibling branches.
External premises and proof status remain those recorded in the reduction index.

Shared proof notes:

- [Frontier band](frontier_band.md)
- [Pivot classes and conditional coverage](pivot_classes.md)
- [Excess bounds](excess_bounds.md)
- [Clique budgets and augmentation](cliques_augmentation.md)
- [Four-transversal bound](transversal_four.md)
- [Pairwise refinements and reviewed claim connections](pairwise_refinements.md)
- [Four-column stability beyond equality](four_column_stability.md)
- [Above-frontier transfer scope and reviewed deductions](transfer_summary.md)

These results may have narrower hypotheses than this parent branch. Follow the
preconditions in each proof before applying a filter.
