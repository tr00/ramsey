# Independent review: elementary two-transversal bound

Claim: [transfer_summary.md#claim-band137-two-transversal](transfer_summary.md#claim-band137-two-transversal).
Author: Codex coordinator, band137-20261014.
Reviewer: x142 boundary agent, band137-q3-20261014; additional independent
check by transfer agent, band137-transfer-20261014. This record is maintained
by the coordinator from the reviewers' explicit handoff findings.
Reviewed revision: base commit 81c768a683d3c3b3df70d4d3b7d03a67d505447b plus
exact file SHA-256
`9450f09438793a30f53293da67d85a12ed044e3b4005deaae40c121f0426fedc`.
The proof was reviewed at SHA-256
`f1bc1e17671b2d9387b5e86a0eda1e9f3708361dc84cbee5329cfed03c708972`;
subsequent changes only update claim review metadata and navigation to other
claims. The two-transversal statement and proof are unchanged.
Dependencies reviewed: R(4,3)=9. R(4,4)=18 is listed but unused.
No numerical census dependency is needed for this claim.

Checks: deleting an enlarged two-vertex transversal leaves H of order16
with no K4 and alpha(H)<=3. H-nonneighbors of an h form a K4-free set
with no independent triple, as the latter together with h violates
alpha(F)<=3. At most8 nonneighbors force d_H(h)>=7 and e(H)>=56.
For each deleted t the same independent-triple extension applies in its
H-nonneighbor set, so d_H(t)>=8. The two attachments therefore total
at least16, giving e(F)>=72. Edges within the deleted two-set are
nonnegative and may be omitted. Superset enlargement preserves transversal
coverage. No restriction on omega(F) is used.

Outcome: accepted. Search use: propagate to exclude K4 transversals of
size at most two when F has order18, alpha(F)<=3, e(F)<=71; for the
application q=3 this excludes actual cross columns smaller than three.
Limits: an internal independent review is not a formal certificate;
novelty has not been checked. No complete Ramsey branch closes here.


## Reference-only relocation, 2026-10-14

The user requested sibling x case folders under research/n43/d18. This review and
its claim links now use the new paths; the original reviewed hashes above
are retained as historical provenance. Claim anchors and mathematical text
are unchanged. See the [move/hash manifest](../../reports/2026-10-14-d18-layout-migration.json).

Current source: `research/n43/d18/transfer_summary.md`, SHA-256 `dd18ca7a750c8e67ec29fee57858482d1eba400315d5904e42dbe0ca3d809859`.

Reversing the recorded path/link updates on each moved proof source
reconstructs its original reviewed SHA-256 exactly. This is a reference
migration, preserving the existing review outcome and evidence limits.
