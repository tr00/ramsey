# Independent review of two-root symmetry gluing: original revision

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Review task: `audit_pair_gluing`.

Claim(s): [pair gluing](symmetry_pair_gluing.md),
`claim-pair-gluing-01`, `claim-pair-gluing-02`, and
`claim-pair-gluing-03`; the order-43 application table was also checked.

Author and reviewer: Codex, task `symmetry-hour-20261015`; independent
reviewer `/root/audit_pair_gluing` (distinct agent, not the author or an
author self-check).

Reviewed revision: exact uncommitted file SHA-256
`9d57200109c45fcaca71167f209781a4f3a10fd5b8de8a79459396c9b796391b`.
Working HEAD when this revision was read:
`249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`.
The author subsequently changed the proof; this review remains about the
original bytes and must not be cited as acceptance of the replacement.

## Scope failure and original outcomes

A pointed three-vertex star with red/blue leaves has trivial color-preserving
side groups, but the original uncolored overlap set contains both the
color-matching and color-swapping maps. The latter identifies red with blue
and does not define a consistently colored skeleton. Side colors alone do
not repair the overlap torsor. Fixed nonlocal relations also require their
actual enriched-state stabilizer, potentially coupling D and side actions.

Claims01/02/03: **changes-requested** at the original hash. The uncolored
double-coset action, compatible-skeleton fiber product/order formula, and
staged complete coverage arguments were independently verified; their stated
colored scope was defective. The original review does not accept the
replacement. See [renewed review](review_symmetry_pair_gluing_20261015_gluing_auditor_revised.md)
for the repair and all-three-claim acceptance.

## Dependencies and limits

| File | SHA-256 |
| --- | --- |
| `n43/min-degree20/pair_coverage.md` | `dcc49b82fd216c9db70de88d0d8f0dc33e25a82c0eb75e671d47542d4c30cbde` |
| `n43/d18/dense_pivot_coverage.md` | `e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a` |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |

Pair-family assumptions and the application formulas |D|=43-2d+lambda,
lambda>=d-18 were checked. The overlap is (3,5)-free; side-exclusive cells
are(4,4)-free, with no I4 transfer to a whole neighborhood. Ramsey premises
remain external. Complete pointed-input/map/full-vector coverage is required;
root reversal, complementation and unrooted uniqueness need separate selectors.
No implementation, closure, novelty assessment or formal certificate was supplied.
