# Overlapping actual cells across the cross-count corridor

Date: 2026-10-15. Kind: integration and research design.
Thirteen mathematical claims in four companion notes have independent
exact-revision acceptance. This summary introduces no additional pruning
lemma. No novelty, runtime speedup, unavoidable-pattern theorem, global
cross-count improvement, or order-43 exclusion is claimed.

## Scope and reviewed deductions

Let G be an order-43 K5/I5-free graph, v any degree-18 pivot,
A=N(v), B=M(v). A is K4/I5-free and may contain I4; B is K5/I4-free.
For an actual A edge Q and independent A pair P, put

    T_Q={y in B: Q subset C_y},
    U_P={y in B: C_y intersect P is empty}.

Then T_Q is (3,4)-free and U_P is (5,3)-free. Their intersection is
(3,3)-free; it is empty if the anchors overlap. None of the new lemmas
restricts x, q, E, small-column counts, or complement orientation. Thus
they can be used throughout the recorded 136<=x<=288 corridor whenever
their actual-set hypotheses hold. The new local deductions do not need
the census inputs used to establish that corridor.

| Proof note | Reviewed result | Future use |
| --- | --- | --- |
| [Obligation cuts](cell_obligation_cuts.md) | Rational signed cuts combine edge/nonedge demands and upper capacities on shared pairs. Varying triple anchors impose a vertex-cover demand on a star; fractional matchings give short rejection certificates. | Detect dispersed-cell conflicts, even without a large common overlap. |
| [Intersections](cell_intersections.md) | Exact local mixed compatibility for all overlap orders 0..5. At a C5 overlap, T-side neighbor signatures are disjoint; every order-eight T extension has a P3 outside the cycle and one of four attachment patterns. | Propagate mixed clauses and constrain completions near the boundary. |
| [Attachments](cell_attachments.md) | Medium-size omission budgets, order-thirteen regularity, rigidity of complete-cycle vertices, and joint demands from external independent pairs/triples. | Combine actual cell attachments and vertex capacities. |
| [Boundary witness](cell_attachment_boundary_witness.md) | An explicit local (5,3)-free order-thirteen graph with two adjacent vertices complete to its C5. | Shows that a stronger isolated-cell bound of one is false. |

Every note links its review. [The manifest](overlapping_cells_manifest.json)
records the exact reviewed and banner-integrated source hashes.

## The broadest new filter: dispersed triple obligations

Fix a center a in one edge cell T_Q and undecided leaves b_i in T_Q.
Its remaining T_Q-neighbor capacity is h<=3, reduced by already occupied
slots. Whenever b_i b_j is a known B nonedge and a,b_i,b_j all omit
some named independent A pair P_ij, at least one of ab_i,ab_j must be
an edge. Crucially, P_ij can vary with the leaf pair.

Writing z_i for adjacency to a, these witnesses give z_i+z_j>=1.
The chosen adjacent leaves form a vertex cover of the obligation graph.
A supplied fractional matching of weight greater than h proves that no
completion meets the capacity. In particular, a witnessed odd cycle on
2h+1 leaves gives

    2*sum z_i >= 2h+1,
    2*sum z_i <= 2h.

This is a small contradiction whose witnesses are actual A anchors and
known B pairs. With two occupied T-neighbor slots, a triangle of leaf
obligations suffices. The dual uses one omission cell, remaining nonneighbor
capacity at most four, and triple witnesses from potentially varying edge
cells. These are conditional rejected patterns, not claims of occurrence.

Unlike requiring a common C5, this mechanism needs only a collection of
named three-occurrence witnesses. It directly addresses dispersed anchored
cells. The general signed cut additionally combines these obligations with
degree intervals, whole-cell budgets and competing edge/nonedge demands.

## Information retained at smaller intersections

For S=T intersect U, X=T-U, Y=U-T, define N_p=N_S(p) for p in X
and D_y=S-N_S(y) for y in Y. Once the induced graphs on T and U
have their required types, exact local compatibility on T union U requires:

* Full (5,4) compatibility on X union Y.
* For nonadjacent p,q in X and y in Y missing both,
  D_y subset N_p union N_q.
* For a Y triangle joined to p in X,
  N_p subset the union of that triangle's D signatures.

These are proved necessary and sufficient for that local union, for every
overlap size, including zero. They retain the full tests on X union Y;
the two signature clauses alone are insufficient. The review also proves
why an isolated X/Y pair yields no obstruction from S alone: at least two
X vertices or a Y triangle are needed for the corresponding mixed clause.

## Next mathematical work

Kind: design. Review state: draft. Search use: research planning only.

Prioritize criteria under which available triple witnesses force a large
fractional matching, or another explicit vertex-cover lower bound, in a
center's obligation graph. Derive those criteria from actual column/row
incidences and already proved pair relations. A theorem giving an obligation
family from a broad degree profile would turn the present conditional filters
into an unavoidable reduction; no such family is proved here.

In a future implementation, retain the origin of every pair decision,
distinguish F*/H* closure from original witness-defined F/H, subtract assigned
contributions from capacities, and check actual cell membership on every
certificate. Optimize discovery later; rational matching and cut witnesses
can be verified with containment checks and integer arithmetic. No checker
or engine was implemented in this task, and partial families do not justify
assuming the order of an unknown completed cell.

The C5 rigidity provides a second useful route but remains conditional.
The tight local witness blocks one overly strong omission bound; its actual
A anchors, opposing T cell, remaining B vertices and global degrees are
absent. These notes preserve all unresolved degree-18 branches.
