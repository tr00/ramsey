# Degree-20 pair transfer and x=290 stability

Date: 2026-10-22. Task: `d20-pair-transfer-20261022`.
Author and self-auditor: /root, working alone.
Base HEAD: `d6d6ee085b701171362b6de8ea16f32383f09d9c`.
The user's continuation asks for a more ambitious target and explicitly
discontinues degree-19 work. This session develops only degree-20 mathematics.

The [pair density transfer note](../n43/d20/pair_density_transfer.md) contains
five separately anchored claims, all **ready for independent review**:

* `claim-d20-pair-defect-identity`: exact density-difference identities for
  every adjacent or nonadjacent pair of degree-20 roots, with exclusive-core
  degree slacks and common-neighbor/common-nonneighbor cut slack.
* `claim-d20-pair-symmetric-budget`: a symmetric pair cross-count ceiling
  without root selection, and a stronger one-root ceiling when that root
  maximizes degree-20 neighborhood density, with exact equality conditions.
* `claim-d20-pair-numerical-caps`: overlap tables for ambient degree caps 24
  and 23, including the nonedge eight-neighbor cut from R(4,3)=9.
* `claim-d20-common-cell-clique-packing`: additive improvements from actual
  vertex-disjoint triangles and edges. In the complement-closed residual,
  a nonedge with a triangle-containing overlap of size 3,4,5,6 gives
  x<=251,253,261,269 at a maximum-density root. Two disjoint triangles
  in an overlap of size 6 give x<=264; a triangle and a disjoint edge
  give x<=267. These improve the existing 272 ceiling on those predicates.
* `claim-d20-high-cross-companion-separation`: at a maximum-density root
  with x>=289, degree-20 neighbors have overlap at least 5 and degree-20
  nonneighbors have overlap at least 7. In either unresolved x=290 profile,
  every degree-20 neighbor must be a size-14-row endpoint.

The [cross-tail stability note](../n43/d20/cross_tail_stability.md) has one
additional ready claim, `claim-d20-one-sixteen-tail-stability`. At any
degree-20 root realizing x=290 with one size-16 row, eight size-15 rows
and eleven size-14 rows, it proves:

* The high-row omission pattern has exactly 18 omitted independent triples
  and four pairs, partitioning the opposite side as F of size 18 and Q of
  size 4; Q is not K4.
* The eight size-15 endpoints H span exactly 8 edges and contain a triangle.
  Their cut to the eleven size-14 endpoints has 47 or 48 edges. Those eleven
  endpoints have only 3 or 4 edges into Q.
* At least seven H vertices have ambient degree 24. The eighth has degree
  23 or 24. The 7-edge alternative, which would be K3 disjoint union K3
  disjoint union K2 by equality in Turan's theorem, is excluded using
  the actual size-16 endpoint and its missed size-14 vertices.

This is stronger structure for an actual x=290 profile than the earlier
scalar row counts. It requires neither saturation, root maximization nor
a side-edge census. Its degree-24 conclusion is specific to the one-size-16
profile, not the other x=290 profile. The elementary omission-witness
method was informed by the
[reviewed d18 tail proof](../n43/d18/independent_row_cuts.md); that proof
was not changed and is not an additional premise of the stability claim.

The pair identities require only two actual degree-20 vertices, a global
degree cap and correct K5/I5 cell types. The numerical tables additionally
use the published (4,4) lower edge extrema at orders 11..17, with their
exact source in the proof. Triangle certificates use an actual triangle,
which global K5-saturation supplies only in the same orientation.
No saturation is inferred under complementation. Absence of degree 18
alone has cap 24; the complement-closed n18=n24=0 residual has cap 23.

Validation command:

```sh
python3 research/reports/2026-10-22-d20-pair-transfer/validate.py
```

The standard-library [driver](2026-10-22-d20-pair-transfer/validate.py)
checks the affine coefficient identities throughout every permissible
pair overlap and M=20..24, all displayed tables and strict cutoffs,
edge/triangle marginal cut counts, all disjoint-block cut formulas, the
unique scalar omission band, all 13 intermediate stability budget cells
and the three cells surviving the 7-edge shape exclusion. The
[retained output](2026-10-22-d20-pair-transfer/validation.json) records
counts and exact SHA-256 hashes for both proof files, the driver and
dependencies. Scalar cells are not graph realizability statements.
Author self-checks and deterministic replay do not constitute independent
review or a graph exhaustion certificate. Local links, anchors and whitespace
passed: 111 local links and all six claim metadata blocks were checked.
The driver passed 110 affine identity cases, 1,746 edge/triangle marginal
cells and 98 disjoint-packing cells. Deterministic replay and all new
artifact hashes passed; the previous large-row proof, driver and dependency
hashes were checked against their original retained output and are preserved.

The no-degree18 uniform ceiling remains 290 and the complement-closed
residual ceiling remains 272. Neither x=290 profile has been excluded.
The missing general step is an occurrence theorem that puts a sufficiently
small-overlap companion at a maximum-density root, or a completion
contradiction for the new endpoint stability alternatives. A mixed-degree
family theorem elsewhere in the repository does not guarantee that
specific companion. No full d20 branch, global routing alternative or
order-43 decision is closed, and the Ramsey interval remains 43..46.
No novelty review was performed. Independent review of the six exact claim
revisions is the next gate before executable pruning.

An intermediate commentary quoted x<=246 for a triangle-containing
four-vertex overlap in the M=23 scope. That value was not established;
the checked bound is 253, and the commentary was corrected. The retained
proofs contain only the verified constants.

Narrow navigation changes are in the d20, results and report indexes.
Degree-19 proofs, earlier proof bodies and evidence outputs, other active
WORK rows, Lean, engine and filters are preserved. No subagents, graph
search, solver, theorem prover, downloads, installations, staging, commits
or external publication were used. The completed task's WORK row is
removed at handoff; its proof and report paths remain the durable record.
