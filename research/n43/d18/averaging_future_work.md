# Future work from the averaging reductions

Date: 2026-10-14. Research agenda, not a branch exclusion or novelty claim.
Parent: degree-18 pivot in an order-43 K5/I5-free graph. A=N(v), |A|=18;
B=M(v), |B|=24; x=e(A,B); R_u=N_B(u); C_y=N_A(y).
No small-excess hypothesis is imposed unless explicitly stated.
The underlying new tools in [anchored cell averaging](anchored_cell_averaging.md)
and [weighted averaging](weighted_averaging.md), and the local observations
below, are independently accepted on their stated premises; see
[the exact-revision audit](review_audit_pending_averaging_20261015.md).
Research targets and priority choices retain search use: research planning only.

Continuation (2026-10-18): the current reviewed upper bound is
[x<=279](independent_row_cuts.md), obtained without excluding adjacent
size-sixteen rows. New [omission-supply and attachment cuts](averaging_omission_cuts.md)
and the [dated research report](../../reports/2026-10-18-averaging-tail.md)
continue the tail analysis. Follow each note's exact-revision review banner;
the all-profile upper bound remains 279.

## Priority regimes

| Regime                                           | Available necessary structure                                                   | Proposed next deduction                                                         |
| ------------------------------------------------ | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| Any x, substantial column overlap                | Columns containing an A edge form a triangle-free B cell of order at most eight | Combine overlapping edge cells and transfer forced pairs between them           |
| Any x, repeated omissions of independent A pairs | Their missing-column cell has no independent triple and order at most thirteen  | Combine its forced-edge obligations with edge cells' forced-nonedge obligations |
| Anchored cells near maximum size                 | Tight internal degree intervals; exact structure at some endpoints              | Bound attachments between two large cells, retaining their intersection         |
| x>=253                                           | Some row has size at least fifteen                                              | Study size-15..17 row structure and attachments                                 |
| x>=271                                           | Some row has size at least sixteen; quantitative family bound below             | Study simultaneous large rows, especially adjacent size-sixteen rows            |
| q=3 and 143<=x<=155                              | Existing reviewed results exclude columns of size at most three                 | Apply cell propagation with the restored column-size lower bound four           |

The last row uses the [reviewed q3 actual-column result](x142/q3/three_columns.md)
and the applicable two-transversal argument linked in
[transfer summary](transfer_summary.md). It does not exclude that x range.

<a id="claim-averaging-large-row-family"></a>

## High-x averaging forces a family of large rows

Claim ID: `research/n43/d18/averaging_future_work.md#claim-averaging-large-row-family`
Kind: local-deduction; review state: accepted; search use: propagate.
Reviews: [independent audit](review_audit_pending_averaging_20261015.md).
Dependencies: |A|=18, sum_A |R_u|=x, universal row bound |R_u|<=17.
The row bound follows because B[R_u] is K4/I4-free: a K4 extends with u,
and an I4 extends with v; R(4,4)=18.

If all rows have size at most fourteen, x<=252. If all have size at most
fifteen, x<=270. Thus the two thresholds in the table are unconditional.
If L counts rows of size sixteen or seventeen, then

    x <= 15*(18-L)+17*L = 270+2L,
    L >= max(0,ceil((x-270)/2)).

More precisely, if n16,n17 are the two row counts and
D=sum_(u:|R_u|<=15)(15-|R_u|), then

    x = 270+n16+2*n17-D.

This supplies unavoidable large-row families in the tail, without an E bound.
It neither proves that any such family is realizable nor improves the existing
cross-count corridor by itself. Thresholds are sufficient, not necessary:
large rows may also occur at smaller x.

<a id="claim-averaging-adjacent-sixteen-rows"></a>

## Main target: compatibility of two large rows

Claim ID: `research/n43/d18/averaging_future_work.md#claim-averaging-adjacent-sixteen-rows`
Kind of the observation: local-deduction; review state: accepted;
search use: propagate. Reviews: [independent audit](review_audit_pending_averaging_20261015.md).
If u,w are adjacent in A, B[R_u intersect R_w] has no triangle and no I4,
so R(3,4)=9 gives |R_u intersect R_w|<=8. Two size-sixteen rows also have
intersection at least 16+16-24=8. Hence, for adjacent such A vertices,

    |R_u intersect R_w|=8, R_u union R_w=B,
    |R_u-R_w|=|R_w-R_u|=8.

The shared cell is (3,4)-free on eight vertices. Its degrees are two or
three: its neighborhoods are independent of order at most three, while
its antineighborhoods are (3,3)-free of order at most five.

The reviewed [large-row continuation](large_row_extensions.md) now classifies
the shared eight-cell into three types and gives exact exclusive-cell
signatures and global degree/column budgets. Adjacent size-sixteen rows
remain unexcluded. The [earlier attempted exclusion](cross_upper_bound.md)
still has its recorded gap; it is not used by the independently proved
[x<=279 bound](independent_row_cuts.md) or the omission continuation below.

## Broad middle regime: opposing cell obligations

Kind: research target, not established exclusion.
Columns containing an A edge cannot form a B triangle. Columns all missing
an independent A pair cannot form a B independent triple. Retain their
actual occurrence intersections and propagate implications from decided
pairs. Feed inferred pairs into cell degree intervals and weighted remaining
edge budgets. A useful result would be a small proved collection of
incompatible overlapping-cell patterns, independent of x and excess.

When the two anchor sets are disjoint, their intersection cell is (3,3)-free
of order at most five; at order five it must be C5. This provides a concrete
starting boundary. Empty or smaller intersections still require the exact
triple constraints, but are not automatically contradictory.

The main coverage gap is moderate rows and dispersed anchored cells.
The [reviewed overlapping-cell continuation](overlapping_cells.md) now gives
varying-anchor triple obligations, vertex-cover/matching capacity cuts and
exact local mixed compatibility at every overlap order. These are conditional
filters; forcing a sufficiently strong obligation family from broad incidence
hypotheses remains open. C5 boundary rigidity does not require small x but
does require the specified cell sizes.
Isolated cell bounds and scalar weighting can be loose there. Prioritize
simultaneous actual-cell compatibility; no uniform large cell, perfect
anchor cover, or small excess may be assumed.

## Continued tail target: the three remaining x=279 profiles

The [endpoint cover](averaging_omission_cuts.md#claim-omission-endpoint-cover)
uses t=size-17 row count, s=size-16 row count, and
D=sum_(other rows)(15-row size). Its independent source deductions are in
[zero/one-root cuts](tail_zero_one.md) and
[two/three-root cuts](tail_two_three.md); their review banners govern use.

| t | s | D | Size-15 rows | Next attachment target |
| --- | --- | --- | --- | --- |
| 1 | 7 | 0 | 10 | Combine the simultaneous shared eight-sets in the unique 17-core with the h-dependent omission budget |
| 2 | 5 | 0 | 11 | Retain overlapping as well as disjoint 17-root omissions; constrain where the eight units of L16 omission deficit lie |
| 3 | 3 | 0 | 12 | Combine the L16 triangle, mandatory L17 attachments and L17 excess at least13 |

The continuation excludes the other three numerical x=279 profiles, not
these three. In particular t=0 gives x<=278, and t=1,s=8 gives x<=271.
The endpoint has no row below fifteen; e(A)<=67 and its retained census
minimum gives q>=18 and total A-excess at least73. Small-excess reasoning
cannot be assumed here.

The new supply step is explicit: high roots omitted at y form an independent
set of order at most three, and Delta=72-7t-8s guarantees at least
max(0,24-Delta) actual omitted triples. A residual row of size 15-delta
must cover its triple obligations using at most 1+delta witnesses per
size-16 neighbor and delta per size-17 neighbor. Large Delta leaves this
bound weak; it does not resolve moderate rows or dispersed middle cells.

## Handoff

Next work should prove and independently audit attachment or overlap lemmas,
then integrate only applicable generation/completion filters. No solver,
canonicalizer, enumeration, or catalogue acquisition is required for this
agenda. Future computational implementation remains subject to the project
approval, provenance, and certificate policies. No theory-map promotion is
made by this planning note.
