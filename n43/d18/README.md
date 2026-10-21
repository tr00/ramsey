# Degree-18 pivot

Branch name: `n43/d18`. Scheme: even-pivot. Object: rooted graph (G,v).
Assumptions: G is an order-43 (5,5)-Ramsey candidate and d_G(v)=18.
Notation and inherited bounds: [reduction index](../reductions.md), sections 2,
3, and 8. A=N(v), B is the antineighborhood, x=e(A,B).

| Child | Predicate | Status |
| --- | --- | --- |
| [x136](x136/README.md) | x=136 | Excluded; reviewed full-frontier closure, every root has x>=137 |
| [x137](x137/README.md) | x=137 | Open; r0 only, r>=1 excluded |
| [x138](x138/README.md) | x=138 | Open |
| [x139](x139/README.md) | x=139 | Open |
| [x140](x140/README.md) | x=140 | Open |
| [x141](x141/README.md) | x=141 | Open |
| [x142](x142/README.md) | x=142 | Open; every column has size at least four |
| [x-ge143](x-ge143/README.md) | x>=143 | Open residual branch |

This disjoint split uses the lower bound x>=137 and integer x: the x=136
slice is excluded by the reviewed [full-frontier closure](x136/README.md),
whose rootwise profile consequences are recorded in
[closure consequences](x136_closure_consequences.md).
The notes tabulate profiles through x142; no upper bound x<=142 was located
in the frontier-band work or reports. The residual x>=143 branch is retained.
The [x>=137 overview](x-ge137/README.md) links to these sibling branches.
External premises and proof status remain those recorded in the reduction index.

## Shared proof notes

These results may have narrower hypotheses than the parent branch. Follow
each proof's preconditions before applying a filter; reviews are linked in
the proof notes. Dated synthesis and validation records are in the
[report index](../../reports/README.md).

| Topic | Proof homes |
| --- | --- |
| Cross-count budgets and tail | [Frontier band](frontier_band.md), [excess](excess_bounds.md), [independent-row upper bound](independent_row_cuts.md), [omission supply](averaging_omission_cuts.md), [tails t=0/1](tail_zero_one.md) and [t=2/3](tail_two_three.md) |
| Anchors, columns and transfer | [Four-transversal bound](transversal_four.md), [clique budgets](cliques_augmentation.md), [pairwise refinements](pairwise_refinements.md), [four-column stability](four_column_stability.md), [above-frontier transfer](transfer_summary.md), [x136 closure](x136/frontier_exclusion_handoff.md) and [consequences](x136_closure_consequences.md) |
| Root choice and connectivity | [Pivot classes](pivot_classes.md), [dense families](dense_pivot_coverage.md), [connectivity classification](neighborhood_connectivity.md), [interior degrees](interior_transfer.json), [separator/root transfer](connected_structure_transfer.json), [deletion thresholds](deletion_degree_transfer.json) |
| Extension coverage and finite cores | [Fixed-B extensions](fixed_b_extensions.md), [independent-root alternatives](obstruction_coverage.md), [large-row cores](large_row_extensions.md), [K1 structure and completion](k1/research.json), [K1 scalar bounds](k1/cross_core.json), [seven-cell structure](k1/seven_cell.json) |
| Averaging and attachment cuts | [Weighted averaging](weighted_averaging.md), [anchored cells](anchored_cell_averaging.md), [overlapping cells](overlapping_cells.md), [cell intersections](cell_intersections.md), [attachments](cell_attachments.md), [obligation cuts](cell_obligation_cuts.md) |
| SDP/SOS theory | [Pivot covariance/coverage](sos_pivot_selection.md), [column triple witnesses](sos_column_compatibility.md), [finite moments](sos_finite_moments.md), [order-twelve cap](sos_order12_addendum.md), [obligation-graph certificates](sos_obligation_graphs.md) |
| Symmetry | [Column multiset coverage](symmetry_reduction.md), [order43 structure](../symmetry_structure.md), [two-root quotient](../../docs/general_theorems/symmetry_pair_gluing.md) |

Lean formalizations include the [cross-count upper bound](../../lean/Ramsey/d18/CrossEdgeBounds.lean)
and [connectivity classification](../../lean/Ramsey/d18/ConnectivityClassification.lean).

## Pending independent review

[The full (q,E_A) structural landscape](parameter_landscape.md) gives uniform
transversal certificates, an E_A-unrestricted q=1 degree-eight anchor,
point-avoiding anchors, and concentrated-excess column exclusions at q=0.
Its [machine-readable map](parameter_landscape.json) covers all 3,600 integer
cells of the stated basic outer envelope, not a feasibility classification.
All five new claims are ready, not accepted; existing pruning is unchanged.
