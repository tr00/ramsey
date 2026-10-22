# Independent review of mixed-cell intersection claims

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.
Author: Codex cell-intersection author.
Reviewer: Codex cell-obligations agent, a distinct collaborating agent.

Claim(s): all five local-deduction claims in
`research/n43/d18/cell_intersections.md`:
`claim-intersection-types`, `claim-c5-signatures`,
`claim-c5-edge-cell-extensions`, `claim-exact-mixed-compatibility`, and
`claim-isolated-mixed-pair-limit`.

Reviewed revision: exact uncommitted file SHA-256
`cc05444b193403ba5ef614ed75f1acfba566afda576e7a3fe473c08aac4144b7`.
Repository HEAD during review:
`f98a1285b7adc9720a693ae3a54fba212a021bdf`.

Dependencies reviewed: cell-type and saturation arguments in
`research/n43/d18/anchored_cell_averaging.md`, SHA-256
`719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3`;
its recorded exact-revision independent audit
`research/n43/d18/review_audit_pending_averaging_20261015.md`, SHA-256
`e6964bfaaecc6a78b6d45ab922f3535a98a0c76174ec7be49445397bd6dfd66a`.
The external small Ramsey premise R(3,3)=6 was retained. All classification
and subset-partition steps below were independently derived; no graph
enumeration or catalogue was used.

## Claim outcomes and checks

All five claims: **accepted** at the exact source hash above.

- Intersection types: every order 0..5 case checked; the order 5 equality
  graph is C5. This is local type coverage, not ambient occurrence.
- C5 signatures: T-neighbor signatures are independent and U-omission
  signatures are cliques, both of order<=2. The T capacity forces disjoint
  neighbor signatures; each side has eleven possible named subsets.
- C5 edge-cell extensions: necessity and sufficiency checked separately.
  Three exclusive vertices force P3 and exactly the four A--D signature
  patterns, with all local triangle/I4 obstructions covered.
- Exact mixed compatibility: partitioning forbidden sets by S/X/Y leaves
  exactly the two mixed clauses plus the separately retained S-avoiding
  condition(i). Both directions hold even when S is empty.
- Isolated mixed pair: no new obstruction on S+x+y depends on xy, because
  S has no triangle and y's missed S-set is a clique. Other ambient
  vertices/anchors/degrees can still constrain that pair.

Permitted use: actual-cell propagation; the isolated-pair limit also informs
planning. No universal occurrence or branch termination. The small Ramsey
inputs remain external; no novelty assessment or formal/exhaustion certificate.
