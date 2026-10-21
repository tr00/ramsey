# Independent review of disjoint duplicate-swap minimization

Claim: [claim-symmetry-quotients-02](symmetry_quotients.md#claim-symmetry-quotients-02).

Author: Codex (symmetry-extensions-20261015). Independent reviewer:
`/root/claim_review_02` (`cr02`), 2026-10-21; this reviewer did not author
the source proof.

Reviewed revision: checkout HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`;
exact current source SHA-256
`fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f`.
The hash identifies the reviewed working-tree bytes, rather than asserting
that they equal HEAD.

Dependencies reviewed: finite lexicographic minimization and the finite
2-CNF implication-graph theorem are established directly in this claim's
proof. Their exact reviewed version is the source hash above. No other
claim or external computational premise is needed. Applicable policy hashes:
`.agents/AGENTS.md`
`e5990b6ed2f9801ef2c333665714bf63cb8604887e24f6c1aeb2f68e7db62958`;
`docs/workflow.md`
`68cb023b675e7b00469b89bf23dc2c7919c2d4eb4ea9fd656b4a5e083b034c0a`.

Checks and findings:

- Disjointness makes every pair-coordinate depend on at most the two swap
  indicators of its endpoints. The inverse-action convention is respected:
  each chosen product of disjoint swaps is its own inverse. An edge within
  one swapped pair is fixed as an unordered pair. Excluding every wrong
  assignment gives an exact 2-CNF condition, including unary and constant
  conditions and the empty-clause infeasibility case.
- Prefix induction retains precisely all orientations attaining the selected
  prefix. If the zero trial fails, feasibility of the earlier prefix forces
  the one choice to succeed. This proves both the claimed bound of at most
  `L` feasibility questions and the unique least orbit vector; it does not
  claim uniqueness of the orientation witness. A satisfying final assignment
  can be extracted from the final implication graph without another
  feasibility question.
- The SCC argument is sound with unit implications and separately detected
  empty clauses. Mutual reachability of complementary literals precludes
  satisfiability. Conversely, the stated ordering assignment makes each
  complementary pair consistent, and an unsatisfied clause contradicts the
  forward implications. There are `2p` literal vertices and at most a
  constant times `i` implication edges, yielding the stated
  `O(L*p+L^2)` time and `O(p+L)` space bounds when prefix formulas are
  accumulated rather than retaining every rebuilt graph.
- The example checks directly: either single swap sends coordinate `02` to
  an existing edge (`12` or `03`), after the unchanged coordinate `01`.
  The double swap sends `02` to absent `13`, `03` to existing `12`, and
  `04` to absent `14`; its first difference is therefore a decrease at `04`.
  This verifies that generator-only comparisons can miss a smaller vector.

Outcome: **accepted** for the mathematical minimization claim.

Limits: acceptance concerns arbitrary full vectors and the specified
disjoint-swap group only. Application to feasible completion families still
requires invariance under that group, as stated in the setting. No solver,
canonicalizer, theorem prover, graph enumeration, download, or nontrivial
search was used. No implementation, timing benefit, Ramsey result,
certificate, or literature novelty is certified by this review.
