# Degree-18 pivot

Branch name: `research/n43/d18`. Scheme: even-pivot. Object: rooted graph (G,v).
Assumptions: G is an order-43 (5,5)-Ramsey candidate and v is a degree-18
vertex maximizing e(G[N_G(v)]) among all degree-18 vertices of G.
Notation and inherited bounds: [reduction index](../reductions.md), sections 2,
3, and 8. A=N(v), B is the antineighborhood, x=e(A,B).

The pivot-selection condition is

```text
for every u in V(G), d_G(u)=18 implies e(G[N_G(u)])<=e(G[A]).
```

This choice is without loss of generality whenever G has a degree-18 vertex:
the eligible set is finite and nonempty. Ties are unrestricted; this does not
select a unique canonical root. A subcase forcing another degree-18 vertex
with strictly more neighborhood edges is therefore impossible at the chosen
pivot. Re-pivoting need not preserve x, neighborhood excess, or a child-branch
predicate. Proof notes stated for arbitrary degree-18 roots retain their
stronger scope; maximality is not retroactively assumed in those statements.

| Child | Predicate | Status |
| --- | --- | --- |
| [x136](x136/README.md) | x=136 | Excluded; reviewed full-frontier closure, every root has x>=137 |
| [x137](x137/README.md) | x=137 | Excluded; independently reviewed full-frontier closure, every root has x>=138 |
| [x138](x138/README.md) | x=138 | Excluded; independently reviewed tau/support closure of both q profiles, every root has x>=139 |
| [x139](x139/README.md) | x=139 | Open |
| [x140](x140/README.md) | x=140 | Open |
| [x141](x141/README.md) | x=141 | Open |
| [x142](x142/README.md) | x=142 | Open; every column has size at least four |
| [x-ge143](x-ge143/README.md) | x>=143 | Open residual branch |

The live disjoint split starts at x>=139: x136 is excluded by the reviewed
[equality-frontier closure](x136/README.md), x137 by the reviewed
[single-excess closure](x137/frontier_closure.md), and x138 by the reviewed
[two-profile tau/support closure](x138/README.md).
Earlier x136 rootwise consequences remain in [closure consequences](x136_closure_consequences.md).
The notes tabulate profiles through x142; no upper bound x<=142 was located
in the frontier-band work or reports. The residual x>=143 branch is retained.
The [x>=137 overview](x-ge137/README.md) links to these sibling branches.
External premises and proof status remain those recorded in the reduction index.

## Shared proof notes

These results may have narrower hypotheses than the parent branch. Follow
each proof's preconditions before applying a filter. New work uses the
[topic-file workflow](../../../docs/workflow.md), with review recorded inline.
Existing separate reviews remain linked from the proof notes; earlier synthesis
and validation records were removed with the reports tree and remain
recoverable in Git history.

| Topic | Proof homes |
| --- | --- |
| Cross-count budgets and tail | [Frontier band](frontier_band.md), [excess](excess_bounds.md), [independent-row upper bound](independent_row_cuts.md), [omission supply](averaging_omission_cuts.md), [tails t=0/1](tail_zero_one.md) and [t=2/3](tail_two_three.md) |
| Anchors, columns and transfer | [Four-transversal bound](transversal_four.md), [clique budgets](cliques_augmentation.md), [pairwise refinements](pairwise_refinements.md), [four-column stability](four_column_stability.md), [above-frontier transfer](transfer_summary.md), [x136 closure](x136/frontier_exclusion_handoff.md), [consequences](x136_closure_consequences.md), [x137 closure](x137/frontier_closure.md) and [x138 tau/support closure](x138/README.md) |
| Root choice and connectivity | [Pivot classes](pivot_classes.md), [selected-root refinements](pairwise_pivot_refinements.md), [dense families](dense_pivot_coverage.md), [connectivity and separator/root transfer](neighborhood_connectivity.md), [interior degrees](interior_transfer.md), [deletion thresholds](deletion_degree_transfer.json) |
| Connected branch and recursive completion | [Connected scope](c/README.md), [exact residual-obligation theorem](c/recursive_ramsey.md) and [DP prototype](c/recursive_ramsey.py); six claims accepted after independent review, arbitrary mixed rows and a polynomial-size residual kernel, no order43 run or branch closure |
| Extension coverage and finite cores | [Fixed-B extensions](fixed_b_extensions.md), [independent-root alternatives](obstruction_coverage.md), [large-row cores](large_row_extensions.md), [critical-core exterior theorem](critical_core_exterior.md), [K1 whole-branch obstructions and completion](k1/README.md), [K1 scalar bounds](k1/cross_core.json), [seven-cell structure](k1/seven_cell.json) and [K3 structure and completion](k3/README.md) |
| Averaging and attachment cuts | [Weighted averaging](weighted_averaging.md), [anchored cells](anchored_cell_averaging.md), [overlapping cells](overlapping_cells.md), [cell intersections](cell_intersections.md), [attachments](cell_attachments.md), [obligation cuts](cell_obligation_cuts.md) |
| SDP/SOS theory | [Pivot covariance/coverage](sos_pivot_selection.md), [column triple witnesses](sos_column_compatibility.md), [finite moments](sos_finite_moments.md), [order-twelve cap](sos_order12_addendum.md), [obligation-graph certificates](sos_obligation_graphs.md) |
| Symmetry | [Column multiset coverage](symmetry_reduction.md), [order43 structure](../symmetry_structure.md), [two-root quotient](../../../docs/general_theorems/symmetry_pair_gluing.md) and [signature multiplicities, duplicate-kernel reduction and complement selection](symmetry_extensions.md) |

Lean formalizations include the [cross-count upper bound](../../../lean/Ramsey/n43/d18/CrossEdgeBounds.lean)
and [connectivity classification](../../../lean/Ramsey/n43/d18/ConnectivityClassification.lean).

## Pending independent review

[The full (q,E_A) structural landscape](parameter_landscape.md) gives uniform
transversal certificates, an E_A-unrestricted q=1 degree-eight anchor,
point-avoiding anchors, and concentrated-excess column exclusions at q=0.
Its [machine-readable map](parameter_landscape.json) covers all 3,600 integer
cells of the stated basic outer envelope, not a feasibility classification.
All five new claims are ready, not accepted; existing pruning is unchanged.
