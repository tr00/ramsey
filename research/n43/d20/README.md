# Degree-20 residual branch

Branch name: `research/n43/d20`. State: open. Scheme: even-pivot.
Object: rooted order-43 (5,5)-Ramsey candidate (G,v) with d_G(v)=20
and no degree-18 vertices. Global degrees therefore range from 19 through 24.

Giving d18 priority in either complementary orientation further restricts
the residual to degrees 19 through 23. The
[routing proof](residual_coverage.md#claim-d20-residual-routing) records this
complete split separately from the one-orientation no-degree-18 predicate.
Degree 19 is allowed in both.

The [20-regular specialization](regular_case.md) remains open. Its new
deductions give `87<=e(N(v))<=100` and even `180<=x_v<=206` at every vertex,
two-sided bounds for small pair overlaps, and an exact two-Paley-core frame
with 124 cross edges if an edge has codegree two. The note states the full
remaining fixed-side completion problem. Claims are ready for independent
review; finite author validation is included.

The [Seidel-switching investigation](../seidel_switching.md) gives exact
preservation constraints and excludes cuts with a side of size at most
eight. Its [spectral theorem](../seidel_switching.md#claim-switch-spectral-dichotomy)
gives a conditional split into rigid graphs and graphs whose every
nontrivial preserving cut reaches degree 18 or 24, with stronger criteria
for all-even degrees and regular d20. A
[quartet-closure theorem](../seidel_switching.md#claim-switch-quartet-rigidity)
also certifies rigidity. These deductions are ready for independent review;
the hypotheses are not established for every input, and a complete
switching reduction of this branch to d18 remains open.

The older general degree-20 scope allowed degrees 18 through 24. Historical
formulas remain valid on their stated scopes; the new residual deductions
use the no-degree-18 assumption explicitly. Global saturation and maximizing
neighborhood edges among a specified degree class have separate meanings
and coverage conditions, recorded in
[saturation routing](residual_coverage.md#claim-d20-saturation-routing).

## First deductions, pending independent review

All new claims are ready, not independently accepted. The proof notes own
the exact assumptions and permitted use; no search filters have been added.

| Topic | Conclusion and proof |
| --- | --- |
| Numerical interface | [Exact excess identities and corridor](interface_bounds.md): `160 <= x <= 290`, with sharper bounds depending on `a,b`; the upper bound needs no side-edge census |
| Large-row tail | [Row deficits and rerooting](large_row_tail.md): three/four size-17 rows force `x<=278/276`; a degree20 pair of codegree two gives a neighborhood-edge gain of at least `x-282`, hence `x<=282` at a maximum-density root; any size-17 row there forces `x<=288` |
| General pair transfer | [Exact pair identities and clique cut certificates](pair_density_transfer.md): every degree20 pair has explicit degree/cut defects; at a maximum-density root with `x>=289`, degree20 neighbors have overlap at least 5 and nonneighbors at least 7; triangle-containing nonedge overlaps 3..6 give `x<=251/253/261/269` in degrees 19..23 |
| x290 stability | [One-size-16 profile](cross_tail_stability.md): the eight size-15 endpoints span exactly 8 edges, contain a triangle and include at least seven degree24 vertices; an exact 18+4 omission partition and narrow cuts are forced; neither x290 profile is excluded |
| Connectivity | [Structure](neighborhood_structure.md): `A` and complement `G[B]` are two-vertex-connected; the latter is three-vertex-connected when degrees lie in 19..23 |
| Column coverage | [Five-way split](interface_bounds.md#claim-d20-column-partition); `a>=96` excludes size-three columns, `a>=98` forces every column size at least five |
| Small columns | [Competition](interface_bounds.md#claim-d20-small-column-competition): at most one size-three column; it excludes all size-four columns; at most three size-four columns occur |
| Saturation | [Triangle blockers](interface_bounds.md#claim-d20-saturation-witnesses): each column contains a triangle and meets every independent four-set of `A`; locally safe `A` nonedges require external blockers |
| Size-three endpoint | [Critical cores](neighborhood_structure.md#claim-d20-three-column-core): degree 19/20 alternatives retained; under global saturation the column is a triangle and `74 <= a <= 95` |
| Pair coverage | [Mixed-degree families and exhaustive selection](residual_coverage.md#claim-d20-complete-pair-selection): a bounded-overlap edge in degrees at most 20 or 21, or a bounded-common-nonneighbor nonedge in degrees at least 22 |

See [reduction index](../reductions.md), sections 3 and 5, for scope and shared
interface predicates.

## Saturated closure attempt

The branch remains open. The [saturated categorization](saturated_categorization.md)
gives 22 disjoint exhaustive structural categories, retaining both degree
19/20 types of a three-column and every count triple of the three four-column
shapes. It also gives necessary and sufficient conditions on the full 440-bit
cross matrix for fixed labelled sides. No category has closure evidence.
The note identifies the unresolved matrix exclusions and the separate
saturation/orientation coverage limitation. Claims are ready for independent
review, with an author's finite self-check.

The [large-column follow-up](large_columns.md) sharpens the all-columns-at-least-five
case: simultaneous five/six count bounds, a rigid B frame for four five-columns,
dense-neighborhood shape exclusions, and shared-triangle compatibility. The
branch remains open; the new deductions are ready for independent review.
