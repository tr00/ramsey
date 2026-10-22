# Independent review: independent-root coverage and exceptional signature core

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-17. Reviewer: LegacyCellAudit (independent of the author
CoverageResearch).

## Decisive independent checks

All six claims and the self-check arithmetic were independently checked.
The adjacent-root cells have orders(lambda,17-lambda,17-lambda,7+lambda)
and types(3,5),(4,4),(4,4),(5,4); nonedge cells have orders
(lambda,18-lambda,18-lambda,5+lambda) and types(4,5),(4,4),(4,4),(5,3).

An independent four of degree 18 roots has 39 external vertices and 72
incidences. The signature equations yield16 aggregate profiles; overlaps
all>=7 force the unique singleton/double/universal vector(12,24,3).
A prescribed family of>=25 roots contains such an I4 and hence either an
overlap1..6 nonedge or that exact exceptional core. q<=2 removes overlaps
1..3 using neighborhood edge caps76/81/82, leaving mixed cells12..14.
Neither alternative is excluded or supplied in every candidate.

The exceptional core's rooted K4s, nonempty omission rectangles, cell
partitions and attachment obligations were rederived. Claim 06 remains
conditional on C136: closure gives q+E>=1, not universal q>=1 or small W.
Its h=W=0,q1,E0 scalar assignment remains feasible and is not a graph.
The dense-family examples were checked for h3/W18 and h5/W30 only.

## Claim(s) under review

All six claims of [obstruction coverage](obstruction_coverage.md), anchored
`claim-coverage-root-cell-types` (Claim01), `claim-coverage-independent-four-signatures`
(Claim02), `claim-coverage-twenty-five-roots` (Claim03),
`claim-coverage-dense-moderate-cells` (Claim04),
`claim-coverage-exceptional-core-obligations` (Claim05),
`claim-coverage-closure-barrier` (Claim06), plus the arithmetic self-check
and coverage section. Author: CoverageResearch; reviewer: LegacyCellAudit.

## Reviewed revision (exact SHA-256)

research/n43/d18/obstruction_coverage.md =
86a940a7871f5196bc8a51590ef9d60bbc2479c4a1194dff420b127bb14d4874
(442 lines, untracked working file; hash re-pinned immediately before this
review was written and equal to the coordinator's stabilized SHA).

## Dependencies reviewed

- Local standing hypotheses: |V|=43, no K5, no I5; P = degree-18 roots;
  degree range 18..24.
- Ramsey premises R(4,5)=25 (=R(5,4)), R(4,4)=18, R(3,5)=14, R(3,4)=9,
  R(3,3)=6: verified present in
  [mathematical baseline](../../../docs/mathematical_baseline.md#immediate-local-constraints)
  (section read; records R(4,5)=25, R(4,4)=18, R(3,5)=14 and the cell
  anchor rule). Values accepted as recorded, not recertified.
- Census extremum (4,5,18) <= 85 defining q: recorded premise, used only
  where Claim04/Claim06 cite it; not recertified.
- Claim04's (4,4,15) upper edge bound 55: the citation
  `transversal_four.md#published-input` resolves (heading `## Published input`,
  transversal_four.md line 19) and records `between 50 and 55 edges` for
  15-vertex (4,4) graphs — the upper endpoint 55 is exactly what Claim04
  needs. Verified.
- Claim04's application table: dense-pivot
  `dense_pivot_coverage.md#claim-dense-pivot-02` exists (line 135, review
  state accepted); its arithmetic was spot-checked for the two stated rows. The family
  example `sos_pivot_selection.md#claim-sos-pivot-family` (line 154) and the
  twelve-root statement `#claim-sos-pivot-twelve` (line 226) both resolve.

## Findings

No defect found. All six claims, their quantifiers, same-family
hypotheses, occurrence-vs-conditional framing, extremal algebra, pair
codegree bounds, dependency anchors, and the scalar-model disclaimer check
out against independent recomputation.

## Outcome

Accepted for all six claims at SHA-256
86a940a7871f5196bc8a51590ef9d60bbc2479c4a1194dff420b127bb14d4874,
subject to the limits below. Search use stays as proposed in each claim
(none pending review at authoring time; propagate/branch uses now allowed
per the accepted claims), with no termination, novelty, or closure claim.

## Limits

- External premises not recertified: the Ramsey values R(4,5)=25,
  R(4,4)=18, R(3,5)=14, R(3,4)=9, R(3,3)=6; the census extrema (4,5,18)
  <= 85 and the (4,4,15) interval 50..55; C136 (accepted per user report
  only).
- dense-pivot Claim02 and the sos twelve/family claims were verified at
  statement, anchor, and arithmetic-spot-check level only; their full
  proofs were not re-derived here (dense Claim02's formulas were recomputed
  for the two cited rows h=3 and h=5).
- weighted_averaging/overlapping_cells characterizations quoted in the
  Setting were not re-audited.
- The coordinator's in-flight tail deductions about row counts and the
  x <= 282/280/279 boundaries are outside this file and outside this
  review; obstruction_coverage.md cites none of them (Claim06 uses only
  the x_v identity and the recorded pivot scalar bounds).
- No graph search, solver, catalogue download, Lean, or project validation
  was run; no realizability, novelty, or order-43 exclusion claim is
  evaluated.
