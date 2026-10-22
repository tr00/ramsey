# Independent review of simultaneous cell-obligation cuts

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.
Author reviewed: Codex cell-obligations agent.
Independent reviewer: Codex cell-intersection author, task
`/root/cell_intersection_retry`; distinct from the reviewed author.
Reviewed repository HEAD: `f98a1285b7adc9720a693ae3a54fba212a021bdf`.
The exact uncommitted source, rather than HEAD alone, is identified below.

| Reviewed file | Exact SHA-256 |
| --- | --- |
| `cell_obligation_cuts.md` | `46f6e43ab3758fb085c41b90418e3780d720374e53e04dfb25d36b77c843470f` |
| `anchored_cell_averaging.md` dependency | `719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3` |
| `review_audit_pending_averaging_20261015.md` dependency review | `e6964bfaaecc6a78b6d45ab922f3535a98a0c76174ec7be49445397bd6dfd66a` |
| `../../../docs/workflow.md` review protocol | `51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2` |

Outcome: **accepted** for all four mathematical claims at the exact source
hash above. Their proposed search use may become **propagate**, retaining
the hypotheses and limitations below. The certificate-format paragraph
remains design, not an implementation claim.

No graph enumeration, solver, proof checker, theorem prover, download,
installation, or catalogue was used. The reviewed author note was not edited.
The author's self-audit was not relied on as proof.

## Decisive independent checks

All four local deductions were independently checked. Signed rational cuts
combine lower pair demands and upper capacities with nonnegative multipliers;
forced edges/nonedges and known outside pairs must be subtracted in their
correct directions. An intersection inherits both actual degree demands,
without assuming its ambient graph is I4-free.

Star obligations retain the actual triple witnesses and consumed slots.
Fractional matching or odd-cycle certificates reject only when their demand
exceeds residual capacity; rounding and the example numbers were recomputed.
Overlapping witnesses are counted through valid capacities, not presumed
independent. The certificate-format section remains design, and no supplied
star or C5 pattern is universally unavoidable.

## Scope and dependencies checked

G has order 43 and no K5 or I5, with a degree-18 root. B has order 24
and no K5 or I4: an I4 in B extends with the root to I5. A has no K4
or I5, and may contain I4. These ambient types are kept distinct.

For an actual A edge Q, a triangle in its containing-column cell T_Q
joins Q to give K5. For an actual independent A pair P, an independent
triple in its missing-column cell U_P joins P to give I5. Therefore the
two cell types and their triple implications can be checked directly.
Intersection membership gives both restrictions; overlapping Q and P
forces that cell empty. No condition on the cross-edge count or a census
extremum is required.

The universal capacity d_T(a)<=3 follows because a T-neighborhood is
independent in a triangle-free graph and T has no I4. The universal
nonneighbor capacity in U is four because its antineighborhood is a clique
in an I3-free graph and U has no K5. These are upper capacities at every
cell size. No minimum or saturation is assumed.

The global degree premise 18<=d_G(a)<=24 is the retained established
R(4,5)=25 premise for order 43: neighborhoods have type (4,5) and
antineighborhoods type (5,4), each of order at most 24. This review uses
that established Ramsey value without re-proving it from primary literature.
The proof does not require external graph census extrema. Supplied degree
intervals and other obligations must themselves be sound and applicable
to the specified actual subsets, or to proved permanent memberships in a
partial state. An omitted possible future member is never treated as absent
from a completed cell.

## Per-claim decisions

| Claim in `cell_obligation_cuts.md` | Outcome | Accepted use |
| --- | --- | --- |
| `claim-cell-signed-cut` | accepted | Rational necessary-condition cut and strict-failure rejection on its supplied state |
| `claim-cell-overlap-degree-cut` | accepted | Degree propagation on the exact intersection and union |
| `claim-cell-star-cover-cut` | accepted | Witnessed attachment demand against its remaining capacity |
| `claim-cell-odd-cycle-certificates` | accepted | Explicit local infeasibility certificate, conditional on every listed witness |

## Limits and integration handoff

All four deductions are independently accepted at the exact reviewed hash.
They may reject their explicitly witnessed partial states, or propagate
their necessary inequalities, once those statements and review metadata
are integrated by the coordinator. They do not prove that a rejecting
configuration must occur in every candidate, nor that passing the cuts
implies completion. The general signed cut has no completeness claim.

The design paragraph suggests locally checkable certificate data; no verifier
was implemented or tested. No external-literature novelty assessment,
order-43 case coverage, formal certificate replay, or nonexistence proof
was supplied. Any mathematical source edit requires renewed review; a
metadata-only integration may preserve this acceptance after its diff is
checked against the reviewed hash.
