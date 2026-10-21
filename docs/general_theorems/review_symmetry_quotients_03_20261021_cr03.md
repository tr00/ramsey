# Independent review of arbitrary-domain uniform descent

Claim: [claim-symmetry-quotients-03](symmetry_quotients.md#claim-symmetry-quotients-03).
Author: Codex, task `symmetry-extensions-20261015`.
Reviewer: independent subagent `claim_review_03`, token `cr03`, 2026-10-21.

Reviewed revision: working-tree source at Git HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact
`docs/general_theorems/symmetry_quotients.md` SHA-256
`fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f`.

Dependencies checked: the source's common setting and action convention
`(gamma.z)_e = z_(gamma^-1(e))`, and the elementary existence of a least
element in each nonempty finite orbit. No substantive result from Claims
01, 02, or 04 is needed for this claim. The residual-action interpretation
was cross-checked against
`n43/d18/symmetry_reduction.md#claim-d18-symmetry-01`, whose source SHA-256 is
`6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b`;
its historical independent review was not re-audited here.

Checks and findings:

- Independently choose the least vector of any feasible full orbit. A
  rejected partial assignment cannot be its restriction: the claimed
  universal strict descent would exhibit a smaller member of that same
  orbit. This uses one fixed full comparison order and invariance of the
  feasible family; neither the assigned domain nor its preservation by
  the permutation enters the contradiction.
- For the explicit witness, a fixed earlier coordinate has equal values
  automatically, while two earlier assigned coordinates with equal bits
  have equal values in every extension. At the witness coordinate the
  inverse-image bit is zero and the original bit is one. These conditions
  therefore establish the universal inequality with the stated action
  orientation. Both examples satisfy this witness at coordinate 1; the
  second has domain `{1,2,3}` mapped to `{1,3,4}`, verifying the intended
  lack of domain preservation.
- The same least vector avoids all rejections simultaneously, even when
  the chosen permutation changes by node. Any sound complete ordinary
  split retains its matching child. Thus arbitrary edge-selection order
  does not affect orbit coverage. As with any tree search, reaching a
  complete leaf additionally requires completion/progress of the tree;
  this claim supplies pruning safety rather than a termination theorem.
- The warnings about noninvariant fixed data, changing comparison order,
  and existence of only some descending extension are necessary and
  correctly stated. A subgroup witness remains an element of the fixed
  global group. Earlier data stages require the stated residual-group or
  complete-code discipline rather than independent incompatible minima.

Outcome: **accepted** for the stated mathematical pruning criterion and
orbit-coverage conclusion. No source correction is required.

Limits: no solver, theorem prover, canonicalizer, enumeration, or literature
search was used. Acceptance does not certify an implementation, finite
search completion, branch log, or Ramsey nonexistence result. The review
covers Claim 03 only and does not accept the optional hierarchical-code
claim or other neighboring claims.
