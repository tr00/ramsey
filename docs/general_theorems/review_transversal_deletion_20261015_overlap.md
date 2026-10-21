# Independent review of transversal deletion and defect budgets

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `transversal_deletion.md#claim-transversal-deletion-01` through
`transversal_deletion.md#claim-transversal-deletion-04`.

Author and reviewer: transversal-compatibility agent; overlap-author agent
(distinct identities). Date: 2026-10-15.

Reviewed revision: exact uncommitted file SHA-256
`03f47814e5092641864b3f221c06f09123e2364ab0068a05d2cdb8d0bb46dee1`.
This is the current file independently hashed by the reviewer, superseding
the `4939f0b995004f80abeb3601159bc51686f6eddcb8ca057db2bd463f0b42240a`
revision initially named in the assignment. Input project revision:
`b12925f7a96d24e18d06b0237930a32e30660ca2`.

Dependencies reviewed:

- `n43/d18/transversal_four.md`, SHA-256
  `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`;
- `n43/d18/frontier_band.md`, SHA-256
  `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`;
- the supplied Ramsey and lower-edge-bound interface, Turan's balanced
  extremal theorem and equality characterization.

The source notes record `R(4,3)=9`, the lower edge endpoint 50 on
15-vertex `(4,4)`-free graphs, and endpoint 41 on 14-vertex such graphs.
Their exact applicability was checked; their published census evidence was
not independently recertified.

## Independent checks

All four claims were checked. Deleting a transversal partitions edges into
the core, attachments and its own induced graph. The Ramsey nonneighbor cap
and complementary Turan bound give the correct lower threshold; enlarging a
smaller transversal is valid. Strict versus weak comparisons, t0/t=n and
zero-attachment cases were checked.

With integral core minimum L the defect components are nonnegative integers;
zero defect gives conditional balanced-clique structure. At n18,t3 the
threshold is 71, giving tau>=4 at e(F)<=70. At t4 the threshold is 66 and the
defect2+q is necessary only, not evidence that a transversal exists. All
A/B complement types and the separate order 14 minimum/maximum uses are sound.

Outcome: accepted for all four claims on their stated hypotheses and retained
Ramsey/census premises. No correction is required for this exact revision.

Permitted search use: propagate transversal-size lower bounds and exact defect
budgets; terminate only a case whose required transversal size contradicts
the justified strict edge threshold. The four-deletion estimate supplies
no order-43 termination and no transversal-existence assertion.

Limits: no graph computation, external download, formal proof checking, or
census recertification was performed. All applications must instantiate the
Ramsey and lower-edge-bound interface at exactly the stated remainder order
and graph type. Novelty was not checked. Proof changes require renewed review.
