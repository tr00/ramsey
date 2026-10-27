# Independent review: candidate exclusion of the entire x=136 frontier

Editorially condensed on 2026-10-21; [original audit and lineage](../../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-19. Reviewer token: `main` (integration session). Author and
self-auditor: Codex (distinct identity, per
[frontier_exclusion_handoff.md](frontier_exclusion_handoff.md)).

```text
Claim(s): research/n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-double-domination
          research/n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-three-anchors
          research/n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-low-degrees
          research/n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-exclusion
Author and reviewer: Codex author; main reviewer (independent rederivation)
Reviewed revision: commit 904f46e (branch x136), merged at a0d4746;
  file SHA-256 c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb
Dependencies reviewed: current revisions of frontier_band.md,
  five_column_compatibility.md, sos_finite_moments.md,
  sos_order12_addendum.md, x136/small_columns.md, r2/low_excess_columns.md
  (operative content verified identical to the author's recorded snapshots;
  see Findings)
Checks: assumptions, quantifiers, ambient types, algebra, case coverage,
  dependency applicability, permitted search use
Findings: no gaps; supporting reasoning below
Outcome: accepted (all four claims)
Limits: published external premises not recertified; no formal certificate;
  novelty not checked; rooted branch scope only
```

## Decisive independent checks

The four claims were rederived independently; all numerical tables were
recomputed, the author's replay was rerun, and the deletion identity was
checked on 2000 random graphs. x136 forces(a,E)=(85,0), d_B=17-d_A,
sum d_A=170. Every I4 has degree sum<=32 by the singleton-class bound.
The accepted degree-eight anchor, tau>=5, and core caps were checked at
applicable revisions; dependency diffs were metadata/reference changes.

Saturated B singleton classes forbid zero/singleton anchor signatures in A,
proving double domination. Three disjoint anchors require at least 24 edges
among their twelve vertices and at most 12 on the remainder, giving85<=84.
The two deletion-cap tables force at most one degree<=7 vertex; the sole
degree-six possibility contradicts the Turan equality core K(3,3,3).

With no degree-seven exception, column projection to D8 yields9t>=120,
t>=14 against t<=12. With one exception it yields t=11, then every I4 is
supported on D8 plus that vertex, where the cross-edge budget109<120
contradicts tau>=5. Projection is used only after establishing this support.
These close x136 at a chosen degree 18 root, not d18 or order 43.

The checked load-bearing inputs are `claim-five-columns-degree-eight-anchor`,
`claim-five-columns-no-four-transversal`, `claim-finite-core-caps`, and
`claim-order12-cap42` in the linked five-column/finite/order12 notes.

## Dependency applicability

The proof applies the accepted full-interface tau>=5 theorem to abstract
transversals (its scope includes every abstract four-set transversal), and
the core caps to K4/I4-free
remainders obtained by deleting proved transversals (not by ambient-type
transfer), and the anchor theorem at x=136 only. No claim transfers an I4
prohibition from B to A or vice versa. Rooted scope: the exclusion is for
order-43 K5/I5-free graphs with a degree-18 root and x=136; it does not
assert that a low-x degree-18 root is unavoidable in every candidate.

## Findings

No mathematical gaps found. One clarifying observation, not affecting
correctness: in Claim03's second table, for ell>=7 the third-anchor route is
vacuous (remainder below four vertices) and those rows are excluded directly
by the table contradiction, as the proof states.

## Outcome

All four claims **accepted** at the reviewed revision. Permitted use: close
the entire `research/n43/d18/x136` branch, including r0; propagate `x>=137` for every
degree-18 root of an order-43 candidate. Search use remains none (no solver
or pruning was run or authorized by this review).

## Limits

Published premises were not recertified: R(3,5)=14, R(4,5)=25, E(4,5,17)=79,
E(4,5,14)=60, R(4,3)=9, and the accepted reviewed core caps remain recorded
external or reviewed-internal premises. No formal Lean certificate exists for
these four claims (the Lean tree still carries d18 as an open sorry ledger
target). Novelty was not checked. The x>=137 siblings, other degree-18
profiles, the d20 scheme, and the x>=143 residual remain
open; no R(5,5) value is claimed.
