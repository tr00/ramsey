# Degree-18 extension research

Date: 2026-10-17. Coordinator: Main. Authors: Main, LargeRowResearch,
FixedBResearch, CoverageResearch. Reviewers: IndependentCutsAudit,
LargeRowAudit, FixedBAudit, LegacyCellAudit. Task: `extension-research-20261017`.

All 26 claims/design statements in four notes received independent
exact-revision acceptance, alongside the inherited ambient-type correction.
The [manifest](2026-10-17-d18-extension-research.json) records source and
original review hashes; proof bodies remain under integration banners.

The scope is an order-43 K5/I5-free graph with degree-18 pivot: A is K4/I5-free
and may contain I4; B is K5/I4-free. This work replaces uncontrolled A
enumeration with structural exclusions and coupled extension reductions.

| Proof and review | Result | Limits |
| --- | --- | --- |
| [Independent-row cuts](../n43/d18/independent_row_cuts.md), [audit](../n43/d18/review_independent_row_cuts_20261017_audit.md) | Omission capacities give x<=280; both equality profiles fail, so x<=279. Independent anchors of sizes2/3/4 have A-degree sums >=8/12/20. | Final t=2 exclusion uses published b>=144 and global degree cap; intermediate x<=280 and t=1 exclusion are census-free. x279 remains open. |
| [Fixed-B extensions](../n43/d18/fixed_b_extensions.md), [audit](../n43/d18/review_fixed_b_extensions_20261017_audit.md) | Exact joint row/A-edge extension criterion; multiplicity<=2, no repeats at sizes9/10, small-row and exchange-ball capacities, rational rejection certificates. | Coverage assumes the complete published 352,366-graph B24 catalogue in the correct complement orientation. Rational occupancy/edge relaxations are not completion certificates. No universal mask cover or runtime guarantee. |
| [Independent-root coverage](../n43/d18/obstruction_coverage.md), [audit](../n43/d18/review_obstruction_coverage_20261017_audit.md) | Every prescribed family of >=25 degree-18 roots has a nonadjacent overlap1..6 pair or the exact exceptional independent-four signature core. Same-family q<=2 narrows pair overlap to4..6. | The threshold is conditional; neither alternative is excluded. The exceptional scalar barrier does not vanish merely from x136 closure. |
| [Large-row extensions](../n43/d18/large_row_extensions.md), [audit](../n43/d18/review_large_row_extensions_20261017_audit.md) | SRG(17,8,3,4) core moments, three eight-cell types, two-core balance and exact 17-row/adjacent16-row attachment descriptions. | Census-free local reductions; completions and whole large-row exclusion remain unresolved. |

The [ambient-type audit](../n43/d18/review_adjacent_root_cell_20261017_audit.md)
corrects the adjacent-root common-nonneighbor cell to (5,4), order 7+lambda.
The opposite mixed cells are (4,4). Incorrect assertions were withdrawn;
overlap-table arithmetic does not depend on them.

The original session took the user's external x136 closure as supplied state,
without reproducing it; these four notes do not depend on that closure.
The [later full-frontier review](2026-10-19-x136-frontier-closure.md) now
records its independent acceptance in this checkout.

Validation at integration checked exact scalar profiles, exchange-ball
thresholds, core moments, omission capacities and both x280 contradictions.
All four proof bodies matched accepted revisions, all 26 statements were
retained and local links resolved. No graph objects were generated, and no
solver, catalogue download or formal proof checker was used in this research
session. The catalogue landing page was read. Mathematical acceptance does
not replay catalogue completeness or establish novelty.

Further work should address actual B-domain covers, the exceptional four-root
core, or surviving large-row attachments within x<=279. No result closes d18
or changes `43 <= R(5,5) <= 46`.

## Subsequent Lean formalization

[`CrossEdgeBounds.lean`](../lean/Ramsey/d18/CrossEdgeBounds.lean) exports
`Ramsey.d18.degree18_cross_le_279` for an actual Ramsey graph on `Fin 43`
and degree-18 pivot. Supporting modules prove x<=280, both equality-profile
exclusions and the finite incidence/Turán facts; no x136 closure is used.
The external axioms are exactly `ramsey_4_3_le_9`, `ramsey_4_4_le_18`,
`ramsey_4_5_le_25`, `edges_ramsey_4_5_24_le_132`, plus standard `propext`,
`Classical.choice`, `Quot.sound`. The last premise gives b>=144 by complement.
Neither the order-24 lower census bound nor the (3,5) premise enters.

That subsequent task passed `sh lean/scripts/check.sh` with unchanged sorry
ledger and exact axiom audit, plus a temporary importing consumer. The
research manifest is historical. Reviewed independent-row proof SHA-256:
`8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`.
