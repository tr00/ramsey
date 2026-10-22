# Independent audit of pending claims

Date: 2026-10-15. Task: `audit-pending-20261015`.
Input HEAD: `b12925f7a96d24e18d06b0237930a32e30660ca2`, plus exact
uncommitted source revisions identified in the linked reviews.

The user requested independent subagents to verify pending claims and
reject or withdraw unsupported proofs. Three independently assigned
reviewers audited the degree-18 averaging notes, transversal abstractions,
and family-overlap/cross-count notes. The coordinator independently reviewed
the new signature-anchor abstraction. Already available safe-augmentation
and cut-capacity reviews were checked against their exact current hashes;
these two outcomes reuse existing independent reviews, not new subagent audits.
Concurrent abstraction work and its ownership were preserved. The additional
normalized minimum-degree-20 pair-coverage note appeared during this audit
with an existing independent review; both claims were independently checked
for applicability and their review provenance was verified.

One unsupported assertion was rejected and explicitly withdrawn in
[anchored cell averaging](../n43/d18/anchored_cell_averaging.md#claim-cell-higher-order-propagation):
a B-edge inferred from a three-column cell need not belong to the graph F
whose definition requires a residual independent-triple witness. The repaired
proof concludes a forced B edge and records inferred edges/nonedges in
separate closure graphs F* and H*. The original adverse review is retained,
and the same independent reviewer accepted the coordinator's corrected
revision. This withdraws the unsupported witness-membership assertion,
while preserving the valid cell implication.

The prior stronger cross-count bounds 277 and 272 remain withdrawn. Their
attempted independent-five argument contains the adjacent pivot v and a
vertex of A. The two surviving cross-count claims are accepted and establish
136<=x<=288, with an exact nonnegative defect identity. The residual x>=143
branch remains open and is now documented as 143<=x<=288.

| Source | Audited statements | Outcome / review |
| --- | --- | --- |
| [docs/general_theorems/transversal_deletion.md](../../docs/general_theorems/transversal_deletion.md) | 01–04 | accepted on stated premises; [review](../../docs/general_theorems/review_audit_pending_transversals_20261015.md) |
| [docs/general_theorems/transversal_compatibility.md](../../docs/general_theorems/transversal_compatibility.md) | 01–04 | accepted on stated premises; [review](../../docs/general_theorems/review_audit_pending_transversals_20261015.md) |
| [docs/general_theorems/family_overlap.md](../../docs/general_theorems/family_overlap.md) | 01–04 | accepted on stated premises; [review](../../docs/general_theorems/review_audit_pending_family_overlap_20261015.md) |
| [docs/general_theorems/signature_anchors.md](../../docs/general_theorems/signature_anchors.md) | 01–06 | accepted on stated premises; [review](../../docs/general_theorems/review_audit_pending_signature_anchors_20261015.md) |
| [docs/general_theorems/safe_augmentation.md](../../docs/general_theorems/safe_augmentation.md) | 01–05 | accepted on stated premises; [review](../../docs/general_theorems/review_safe_augmentation_20261015_transversal.md) |
| [docs/general_theorems/cut_capacity.md](../../docs/general_theorems/cut_capacity.md) | 01–03 | accepted on stated premises; [review](../../docs/general_theorems/review_cut_capacity_20261015_overlap.md) |
| [research/n43/d18/weighted_averaging.md](../n43/d18/weighted_averaging.md) | both claims | accepted on stated premises; [review](../n43/d18/review_audit_pending_averaging_20261015.md) |
| [research/n43/d18/anchored_cell_averaging.md](../n43/d18/anchored_cell_averaging.md) | all four, corrected higher-order example | accepted on stated premises; [review](../n43/d18/review_audit_pending_averaging_20261015.md) |
| [research/n43/d18/averaging_future_work.md](../n43/d18/averaging_future_work.md) | local threshold, row and mixed-cell observations | accepted on stated premises; [review](../n43/d18/review_audit_pending_averaging_20261015.md) |
| [research/n43/d18/cross_upper_bound.md](../n43/d18/cross_upper_bound.md) | both surviving claims | accepted on stated premises; [review](../n43/d18/review_audit_pending_cross_upper_20261015.md) |

The accepted deductions retain their exact actual-set, equal-degree,
coverage, strict-inequality and external Ramsey/census hypotheses. Research
priorities remain planning. Acceptance is an independent mathematical audit,
not a census recertification, formal proof certificate, novelty claim, or
order-43 decision. No solver, installation, download, graph search, or
catalogue acquisition was used.

Tracked claim metadata and review links were updated after acceptance.
Mathematical source text changed only to withdraw and repair the unsupported
F-membership assertion. General-theorem originals belong to the active
abstraction task and were left untouched by this audit; their author task
handles metadata integration.
The concurrent author task subsequently added acceptance banners. The
coordinator verified all seven records in its integration manifest: removing
only each banner reproduces the original reviewed hash, and current source
and review hashes match the manifest, including the new normalized pair
coverage note. Thus concurrent integration preserved the reviewed proof bodies.
Historical reports and historical adverse reviews retain their provenance.
No Git staging or commit was performed by this audit task.

## Source hashes after integration

Metadata-only integration hashes are distinct from the original audited
hashes preserved in the reviews. Re-read the review records before using a
later source revision.

```text
dbc5bc023dbe92ee970a816eeaea16ecd808971c0b72b979a3103087323ac24c  docs/general_theorems/transversal_deletion.md
f48f1856a139f1eac97a3648399f4dedc3c7e5fc232b909e670e10821fb53a31  docs/general_theorems/transversal_compatibility.md
6fbd343167de8f0d43985ecf11d39fff9060b867680a91c12347772ffda86e87  docs/general_theorems/family_overlap.md
4959062245805c0690ba4ec9db26d4057ff9ca2342813dc02fa12fe6c08f4036  docs/general_theorems/signature_anchors.md
8d838568f3568fe419938508c9155b04a9adbc70e3ac9f8154d8f7df4d240e3a  docs/general_theorems/safe_augmentation.md
450610eb69eddb2e4c2cfefc25ff99e6e61919aa722ddaf16888f364271b2137  docs/general_theorems/cut_capacity.md
e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07  research/n43/d18/weighted_averaging.md
719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3  research/n43/d18/anchored_cell_averaging.md
9548b538030905b5b154c4aa04dcf6bd0a75b7f2729b1d568cf6a207b3d86b99  research/n43/d18/averaging_future_work.md
deb3638325170ef498710a049b21dd16614c8437962ce62b243a91e7c43c4c25  research/n43/d18/cross_upper_bound.md
```

Additional concurrent reviewed source: `research/n43/min-degree20/pair_coverage.md`
(two claims), with [independent review](../n43/min-degree20/review_pair_coverage_20261015_transversal.md)
and exact provenance in the [integration manifest](../../docs/general_theorems/integration_manifest.json).
