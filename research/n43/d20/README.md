# Degree-20 residual branch

Branch name: `research/n43/d20`. State: open. Scheme: even-pivot.
Object: rooted order-43 (5,5)-Ramsey candidate (G,v) with d_G(v)=20
and no degree-18 vertices. Global degrees therefore range from 19 through 24.

Giving d18 priority in either complementary orientation further restricts
the residual to degrees 19 through 23. The
[routing proof](residual_coverage.md#claim-d20-residual-routing) records this
complete split separately from the one-orientation no-degree-18 predicate.
Degree 19 is allowed in both; this is not the minimum-degree-20 branch.

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
| Connectivity | [Structure](neighborhood_structure.md): `A` and complement `G[B]` are two-vertex-connected; the latter is three-vertex-connected when degrees lie in 19..23 |
| Column coverage | [Five-way split](interface_bounds.md#claim-d20-column-partition); `a>=96` excludes size-three columns, `a>=98` forces every column size at least five |
| Small columns | [Competition](interface_bounds.md#claim-d20-small-column-competition): at most one size-three column; it excludes all size-four columns; at most three size-four columns occur |
| Saturation | [Triangle blockers](interface_bounds.md#claim-d20-saturation-witnesses): each column contains a triangle and meets every independent four-set of `A`; locally safe `A` nonedges require external blockers |
| Size-three endpoint | [Critical cores](neighborhood_structure.md#claim-d20-three-column-core): degree 19/20 alternatives retained; under global saturation the column is a triangle and `74 <= a <= 95` |
| Pair coverage | [Mixed-degree families and exhaustive selection](residual_coverage.md#claim-d20-complete-pair-selection): a bounded-overlap edge in degrees at most 20 or 21, or a bounded-common-nonneighbor nonedge in degrees at least 22 |

See [reduction index](../reductions.md), sections 3 and 5, for scope and shared
interface predicates. Do not import minimum-degree-20 restrictions from the
alternative [normalized branch](../min-degree20/README.md).

## Saturated closure attempt

The branch remains open. The [saturated categorization](saturated_categorization.md)
gives 22 disjoint exhaustive structural categories, retaining both degree
19/20 types of a three-column and every count triple of the three four-column
shapes. It also gives necessary and sufficient conditions on the full 440-bit
cross matrix for fixed labelled sides. No category has closure evidence.
The note identifies the unresolved matrix exclusions and the separate
saturation/orientation coverage limitation. Claims are ready for independent
review, with an author's finite self-check.
