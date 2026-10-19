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

Shared proof notes:

- [K1 subbranch: double regular cores, seven-cell obstruction and exact 289-bit completion partition](k1/research.json) ([attachment and scalar bounds](k1/cross_core.json), [seven-cell structure](k1/seven_cell.json)); no full exclusion claimed.

- [Cross-branch synthesis: stronger interior degrees, separator exclusions, and transversal thresholds across all x](../../reports/2026-10-19-cross-branch-synthesis.json)
- [Reviewed interior floors/ceilings and tightened row and pointed-overlap filters](interior_transfer.json) ([audit](review_interior_transfer_20261019.json))
- [Separator structure, higher vertex connectivity, and selected-root transfer](connected_structure_transfer.json) ([audit](review_connected_structure_transfer_20261019.json))
- [Reviewed exact-census transversal thresholds, member degrees, and conditional column-excess budgets](deletion_degree_transfer.json) ([audit](review_deletion_degree_transfer_20261019.json))

- [Extension research synthesis: omitted-row exclusions, fixed-B capacity, and unavoidable root cores](../../reports/2026-10-17-d18-extension-research.md)
- [Fixed-B extension coverage, row multiplicity, exchange-ball capacities and exact certificates](fixed_b_extensions.md)
- [Independent-root coverage: opposite cells or an exact exceptional four-root core](obstruction_coverage.md)
- [Large-row core moments, exact eight-cell types and finite attachments](large_row_extensions.md)
- [Reviewed SDP/SOS theory: pivot selection, varying-x triple moments, finite core caps and attachment certificates](../../reports/2026-10-15-sos-theory.md)
- [Reviewed twelve-root overlap coverage and rational excess covariance](sos_pivot_selection.md)
- [Reviewed dispersed triple-witness SOS filters across x](sos_column_compatibility.md)
- [Reviewed finite core caps and q=1 anchor through x167](sos_finite_moments.md)
- [Reviewed order-twelve cap42 and six-set transversal threshold](sos_order12_addendum.md)
- [Reviewed rational SOS on attachment-obligation graphs](sos_obligation_graphs.md)
- [Reviewed cross-count upper bound x<=279 and omitted-row tail exclusions](independent_row_cuts.md) ([Lean proof](../../lean/Ramsey/d18/CrossEdgeBounds.lean))
- [Averaging continuation: omission-supply cuts and three remaining x279 row profiles](averaging_omission_cuts.md) ([report](../../reports/2026-10-18-averaging-tail.md))
- [Reviewed weighted averaging](weighted_averaging.md)
- [Reviewed anchored cells and corrected implication closure](anchored_cell_averaging.md)
- [Reviewed overlapping-cell compatibility and dispersed attachment cuts across x](overlapping_cells.md)
- [Neighborhood connectivity classification](neighborhood_connectivity.md) ([Lean proof](../../lean/Ramsey/d18/ConnectivityClassification.lean))
- [Frontier band](frontier_band.md)
- [Pivot classes and conditional coverage](pivot_classes.md)
- [Excess bounds](excess_bounds.md)
- [Clique budgets and augmentation](cliques_augmentation.md)
- [Four-transversal bound](transversal_four.md)
- [Reviewed full x136 frontier exclusion: double domination, three-anchor and low-degree lemmas, column-incidence closure](x136/frontier_exclusion_handoff.md) ([review](x136/review_frontier_exclusion_handoff_20261019_main.md))
- [Reviewed equality-frontier degree-eight anchor and column size>=5](x136/five_column_compatibility.md)
- [Pairwise refinements and reviewed claim connections](pairwise_refinements.md)
- [Four-column stability beyond equality](four_column_stability.md)
- [Above-frontier transfer scope and reviewed deductions](transfer_summary.md)
- [Dense degree-18 families with a simultaneous overlap bound](dense_pivot_coverage.md)
- [Reviewed column-multiset symmetry coverage](symmetry_reduction.md)
- [Reviewed frontier duplicate-orbit and rooted automorphism bounds](../symmetry_structure.md)
- [Reviewed exact two-root overlap-map and completion quotient](../../docs/general_theorems/symmetry_pair_gluing.md)

These results may have narrower hypotheses than this parent branch. Follow the
preconditions in each proof before applying a filter.

## Pending independent review

[The full (q,E_A) structural landscape](parameter_landscape.md) gives uniform
transversal certificates, an E_A-unrestricted q=1 degree-eight anchor,
point-avoiding anchors, and concentrated-excess column exclusions at q=0.
Its [machine-readable map](parameter_landscape.json) covers all 3,600 integer
cells of the stated basic outer envelope, not a feasibility classification.
All five new claims are ready, not accepted; existing pruning is unchanged.
