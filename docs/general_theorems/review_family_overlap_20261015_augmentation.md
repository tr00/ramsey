# Independent review of prescribed equal-degree families

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Reviewer: `augmentation_author`.

Claim(s): [family overlap](family_overlap.md), claims
`claim-family-overlap-01` through `claim-family-overlap-04`.

Author and reviewer: overlap-author and augmentation-author, distinct agents.

Reviewed revision: SHA-256
`ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1`
of the exact uncommitted `docs/general_theorems/family_overlap.md`.

Dependencies reviewed: All internal mathematical arguments were independently
rederived. The numerical corollaries use the classical stated premises
`R(3,3)=6`, `R(3,4)=9`, and `R(3,5)=14`. No census, minimum-degree
premise, or completeness of a graph catalogue is needed. The accepted source
note motivates the abstraction but is not needed as an unproved logical step.
No external literature or numerical Ramsey source was fetched in this review.

## Independent checks

All four claims were checked through triangle-codegree equality, the
no-exactly-one-neighbor consequence, exceptional K4 cut counts, and
component independence capacities. Global common neighbors are counted;
ambient types and complement directions are respected. Every degree18/19/20/21
numerical threshold and anchor inequality was independently substituted.

The family is prescribed, with same degree and the stated high-codegree
contradiction hypothesis. Component bounds and their strict triangle/odd-degree
variants cover the empty and equality cases. These give a same-family edge;
they do not supply a large degree-class family in every candidate.

Outcome: **accepted**, all four claims at the exact reviewed hash, on their
explicit hypotheses and numerical Ramsey premises.

Limits: This is an independent mathematical audit, not a formally checked
certificate. The stated classical Ramsey values were not reproved or fetched.
Novelty has not been checked. The theorem supplies conditional two-root
coverage, not an order-43 nonexistence result. Any proof change requires a
renewed exact-revision review; replacing the numerical Ramsey premises also
requires checking their applicability to the component envelope.
