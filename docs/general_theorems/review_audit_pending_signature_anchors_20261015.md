# Independent audit of cross signatures and homogeneous anchors

Editorially condensed on 2026-10-21; [original audit and lineage](../../research/reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Author: `augmentation_author`. Reviewer: audit-pending
coordinator (distinct from the author and this session's three subagent auditors).
Claim(s): `signature_anchors.md#claim-signature-anchors-01` through
`claim-signature-anchors-06`.
Reviewed revision: input HEAD `b12925f7a96d24e18d06b0237930a32e30660ca2`;
exact source SHA-256 `7c286ad9f941ca8bb62ac24aa03967e436d78266299a42d2fef1cede098ebb0b`.

Dependencies reviewed: the six direct arguments, the precise rooted graph
setting and complement roles, and the Ramsey inputs R(4,3)=9 and R(3,5)=14.
The optional global minimum-degree floor 18 is conditional on R(4,5)=25.
These classical premises were checked for applicability, not recertified.

## Independent checks

All six claims were rederived. Every mixed forbidden-set split and empty
endpoint case is covered. Hall applies to actual independent families;
singleton capacities and exact defect identities handle repeated signatures.
Weighted sums retain load and nonnegative-excess hypotheses, without an
assumed perfect cover. The asymmetric clique-anchor dual and degree18/20
numerical substitutions were checked in the correct complement orientation.

Outcome: accepted, all six claims on their stated hypotheses.
Permitted search use: propagate; Claim 01 supplies complete mixed-set checking
only when every required homogeneous B subset is covered. Explicit anchor
weights and loads are required for weighted certificates. No branch closes.
Limits: mathematical independent review, without formal proof checker,
literature novelty check, computation, or census recertification. Substantive
source edits invalidate exact-revision acceptance and need a new review.
