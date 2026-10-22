# Independent review of normalized same-degree pair coverage

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Author: overlap-author agent.
Reviewer: `transversal_compatibility`, a distinct agent.

Claim(s): `research/n43/min-degree20/pair_coverage.md`,
`claim-normalized-pair-01` and `claim-normalized-pair-02`.

Reviewed revision: exact uncommitted SHA-256
`2d0856ed1586302fa1b493a2aefe20993847784148a0674ddb42911ed7d09d9d`.
The file hash was verified before the full proof was read.

Dependencies reviewed: the normalization/count proof was rederived directly.
The family-overlap dependency was read at exact SHA-256
`ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1`,
whose four claims are independently accepted in
[the augmentation-author review](../../../docs/general_theorems/review_family_overlap_20261015_augmentation.md).
For applicability, this reviewer separately checked the prescribed-family
quantifiers, thirteen-root threshold, and both numerical substitutions.
The classical premises R(3,3)=6, R(3,4)=9, and R(3,5)=14 are retained as
explicit dependencies and were not recertified here.

Checks: complement selector including maximum-degree inference, parity,
parameter coverage, same-family applicability, exact anchor values,
disjointness/exhaustiveness, ambient graph types, and permitted search use.

## Independent checks

Both claims were independently checked. Complement degree-sequence
normalization gives only degrees20/21/22 and n20>n22, with the exact j/r
counts and edge total 451-j. The n20>=13 / n20<=12 predicates are disjoint
and exhaustive within this normalized branch; the second gives n21>=20.

The prescribed-family theorem then supplies a same-degree 20 edge of
codegree<=11 or same-degree 21 edge of codegree<=12. Every scalar count,
family substitution and overlap-cell bound was recomputed. This does not
apply to an arbitrary degree 20 pivot or classify all completions.

Outcome: **accepted**, both claims at the exact reviewed hash, on the
recorded family-overlap theorem and its explicit classical Ramsey premises.

Permitted search use: propagate degree counts; branch on n20>=13 versus
n20<=12; select a same-degree edge with the corresponding codegree bound.
For a complete nonexistence reduction all permitted overlap values,
maps, internal graphs, and completions must be retained and independently
certified. The branch research/n43/d20 lacks the global normalization/minimum-degree
premises and cannot inherit this exhaustive count split. No order-43
branch is closed by this review or the audited statements.

Limits: independent mathematical audit, not a formally checked certificate.
No literature novelty review, classical Ramsey-value recertification,
graph enumeration, or gluing implementation coverage audit. Acceptance
applies only to the exact stated revision; substantive changes require
renewed review.
