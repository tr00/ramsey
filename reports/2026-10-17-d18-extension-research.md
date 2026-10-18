# Degree-18 extension research: omitted rows, fixed-B capacity, and root coverage

Date: 2026-10-17. Coordinator: Main. Authors: Main, LargeRowResearch,
FixedBResearch, CoverageResearch. Independent reviews: IndependentCutsAudit,
LargeRowAudit, FixedBAudit, LegacyCellAudit. Task: `extension-research-20261017`.

Review outcome: all 26 claims/design statements in the four proof notes
received independent exact-revision acceptance. The separate inherited
ambient-type correction was independently accepted. Reviewed bodies remain
verbatim below integration banners; explicit premise and scope limits remain.

## Scope and user-supplied state

The task was to replace infeasible isolated G[A] enumeration by structural
class exclusions and coupled extension reductions for a degree-18 pivot in
an order-43 K5/I5-free graph. A=N(v) has order18 and is K4/I5-free (I4 is
allowed); B=M(v) has order24 and is K5/I4-free.

The user reports that x=136 is wholly closed outside this checkout. That
state is accepted; its missing proof has not been reconstructed, rechecked,
or silently certified. None of the new structural deductions below depends
on that closure. The separate root-profile barrier precisely labels its
conditional use. Older x136 proof bodies and reviews remain historical.

Pure mathematical work only. No graph searches or graph enumeration,
catalogue acquisition, solver, theorem prover, canonicalizer, installation,
large CNF, build, linter, formatter, staging, or commit. The published
catalogue landing page was read, not its graph data. Scalar integer audits
checked identities and thresholds; these are not existence experiments.

## Principal deduction: the old high-x tail can be excluded

[Independent-row cuts](../n43/d18/independent_row_cuts.md) contains five
claims. Let t count size-17 rows and s count size-16 rows.

For any B vertex y, the size-16 row roots omitting y are independent: an
edge between size-16 row roots forces their union to cover B. All size-17
row roots are independent and anticomplete to the size-16 roots. Two
separate capacities follow:

    8s<=24(4-t),          7t+8s<=72.

The second inequality includes the omitted B vertex y in the independent
set; replacing it by a bound inside A alone would lose an essential vertex.
Since all other rows have size at most15,

    x<=270+2t+s<=280.

The two possible x=280 profiles are then both excluded:

* t=1,s=8, nine size-15 rows: almost all B omission bins contain an actual
  independent triple of high-row roots. Each size-15 root needs at least
  eight distinct size-16 neighbors, demanding at least72 incidences from
  a family with total A-degree at most56.
* t=2,s=6, ten size-15 rows: the two 17-cores cover B and overlap in10
  vertices. Their exclusive seven-sets X,Y satisfy e(X)=e(Y)=e>=5 and
  b=124-e+f, f=e(X,Y). Actual omitted-triple obligations bound the relevant
  missing incidences by30; summing global degrees on X union Y gives f<=22.
  Consequently b<=141, contradicting the recorded published b>=144.

Thus the final result is

    x<=279 for every degree-18 pivot,

on the established smaller Ramsey premises and the explicitly retained
24-vertex census edge bound b>=144. The intermediate x<=280 and the first
equality-profile exclusion do not use a graph census. The entire former
tail x=280..288 is excluded by these local mathematical arguments, not by
an exhaustion run. No x=279 exclusion or endpoint construction is supplied.

The same note proves independent-A degree sums >=8,12,20 for anchors of
sizes2,3,4, and opposing numerical row-pair forcing rules. These constrain
whole row/excess profiles without fixing A or B.

## Fixed B replaces the uncontrolled neighborhood-census prerequisite

[Fixed-B extensions](../n43/d18/fixed_b_extensions.md) proves exact extension
coverage conditional on the published complete family of352366 (4,5,24)
graphs: complement each representative to obtain B, then construct all18
actual row masks and the A-edge completion together. All mixed five-set
splits, degree budgets, repeated occurrences, and the actual residual
symmetry group are retained. This does not recertify the catalogue or prove
that the extension search is computationally feasible.

Substantive pre-completion capacities include:

* Every row mask has multiplicity at most two. Sizes9,10 cannot repeat.
* At most three rows have size at most five; smaller-row edge/triangle
  capacities further restrict named B anchors.
* A one-deletion/one-addition mask ball has occupancy at most two when its
  center size is7,8,11,12,13,14,15,16. Thus eight such balls cannot cover
  an18-row family. Named triangle/I3 fractional-matching witnesses extend
  the capacities to additional centers, including9,10.
* Rational weighted occupancy and box-capacity certificates reject whole
  mask domains. Exact coefficient/witness checks suffice; failure to find
  a certificate says nothing about feasibility. The rational edge stage
  remains only a relaxation until its edge variables are integral.

The surviving bottleneck is dispersed moderate masks, especially size9/10
domains without the robust witnesses. No universal mask cover is proved.

## A genuine occurrence theorem, with an explicit exception

[Independent-root coverage](../n43/d18/obstruction_coverage.md) gives an
unavoidable alternative for every prescribed family of at least25 degree-18
vertices, not merely for an arbitrary supplied anchor:

1. A nonadjacent pair has overlap1..6, giving two opposite actual (4,4)
   cells of orders12..17; or
2. An independent four has exact external signature classes: each of four
   singleton classes has size3, each of six double classes size4, triple
   classes are empty, and the universal class has size3.

The exception forces four actual rooted K4's on16 vertices, with nonempty
complete omission rectangles and further named attachment obligations.
For same-family q<=2 roots, the pair alternative narrows to overlap4..6,
so the opposing cells have orders12..14. Existing guaranteed26-root dense
families therefore inherit this alternative without imposing a root profile
on an unrelated endpoint.

The 25-root threshold is conditional coverage: degree-18 families of size
at most24 are not covered by this occurrence proof. Neither the exceptional
core nor the opposing-cell branch has been excluded. The explicit scalar
barrier explains why the currently listed numerical constraints plus the
reported x136 closure do not remove the exception by themselves.

## Large-row attachments now have exact finite descriptions

[Large-row extensions](../n43/d18/large_row_extensions.md) proves six
census-free local deductions/reductions:

* Every17-vertex (4,4) core has parameters SRG(17,8,3,4), by a tight
  codegree sum, with exact subset attachment moments.
* Triangle-free eight-subsets have exactly three types S10,S11,S12. In
  a17-core their external incidence/pair moments are (44,86),(42,81),
  (40,76); S10 forces the external attachment degree profile5^8,4.
* Two actual17-cores must balance exclusive-cell edges and satisfy a
  pointwise opposing-attachment inequality. A fixed16-subset lies in
  at most two distinct induced17-cores; equal rows remain separate.
* An actual17-row reduces B to a17-core plus seven constrained outside
  signatures. Adjacent16-rows reduce B to three eight-cells, with exactly
  three possible common-cell types and full attachment/degree obligations.

These are exact reductions, not assertions that their completions exist
or that the large-row branches are wholly excluded. The new x<=279 proof
uses the two-core idea but does not require a unique17-core catalogue.

## Correcting an inherited ambient-type error

The adjacent-root common-nonneighbor cell was incorrectly labeled (4,4) in
`pivot_classes.md` and `transfer_bounds.md`. Its correct type is (5,4),
with order7+lambda for adjacent degree-18 roots. The opposite mixed cells
are the (4,4) cells. The incorrect assertions were explicitly withdrawn;
the existing overlap-table calculations do not use them. The superseding
[ambient-type audit](../n43/d18/review_adjacent_root_cell_20261017_audit.md)
records the scoped dependency check; historical reviews remain unchanged.

## Review artifacts and reproducibility

* [Independent-row proof review](../n43/d18/review_independent_row_cuts_20261017_audit.md)
* [Fixed-B proof review](../n43/d18/review_fixed_b_extensions_20261017_audit.md)
* [Large-row proof review](../n43/d18/review_large_row_extensions_20261017_audit.md)
* [Coverage proof review](../n43/d18/review_obstruction_coverage_20261017_audit.md)
* [Ambient-type correction review](../n43/d18/review_adjacent_root_cell_20261017_audit.md)

Final reviewed and integrated source hashes are recorded in the sibling
[JSON manifest](2026-10-17-d18-extension-research.json). Exact review bodies are preserved; an
integration banner does not change the reviewed proof body. Mathematical
acceptance is not Lean formalization, a catalogue-completeness replay,
a universal SAT certificate, a runtime estimate, or a novelty claim.

Coordinator scalar audits independently checked the16 aggregate four-root
profiles and unique extremal vector, exchange-ball thresholds,17-core
attachment moments, high-row omission capacities, and the final
x280 contradictions. No graph objects were generated by these audits.
Final integration checks verified that all four proof bodies remain
byte-identical to the independently accepted revisions, with all26
claim/design statements retained. All actual local Markdown link targets
in the new proofs, reviews and this report resolved (code notation excluded).

## Next targets after integration

1. Use279, not288, as the current upper endpoint; do not assume the next
   endpoint is realizable or repeat the excluded tail search.
2. Attack actual B-domain covers or the exceptional independent-four core,
   with occurrence/coverage obligations preserved. A new conditional filter
   without an unavoidable application is lower priority.
3. Classify the surviving large-row attachments only where they materially
   reduce the residual x<=279 range. There is no need to enumerate all A
   as a prerequisite to either fixed-B extension or these core reductions.
4. Formalize the short omitted-row tail proof when Lean work is authorized;
   no Lean files were changed in this research task.

No result changes the global interval43<=R(5,5)<=46 or closes all of d18.

## Subsequent Lean formalization

The user-authorized Lean task formalizes the omitted-row upper bound in
[`CrossEdgeBounds.lean`](../lean/Ramsey/d18/CrossEdgeBounds.lean), exported as
`Ramsey.d18.degree18_cross_le_279`. Its hypotheses are an actual `(5,5)`-Ramsey
graph on `Fin 43` and a degree-18 pivot. The supporting modules prove the
census-free bound `x≤280`, both equality-profile exclusions, critical-core
regularity, finite incidence identities and the required Turán bounds.
This is a subsequent task, not a change to the reviewed research bodies or
the original research manifest. No x136 closure or full d18 exclusion is used.
The final theorem's external axioms are exactly `ramsey_4_3_le_9`,
`ramsey_4_4_le_18`, `ramsey_4_5_le_25` and `edges_ramsey_4_5_24_le_132`,
besides Lean's standard `propext`, `Classical.choice` and `Quot.sound`.
The last input gives `e(B)≥144` by complementing. Neither the order-24
lower census bound nor the `(3,5)` Ramsey premise enters this theorem.
An importing consumer applies the theorem directly to the actual graph,
and the public theorem and intermediate interfaces are in the axiom audit.
Verification passed: `sh lean/scripts/check.sh` checked the project build,
unchanged sorry ledger, style and exact axiom sets. A temporary consumer
importing `Ramsey` applied the bound successfully and was removed. The reviewed
independent-row proof body retains SHA-256
`8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`.
