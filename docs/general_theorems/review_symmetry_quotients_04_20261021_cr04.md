# Independent review of hierarchical symmetry and root selection

Claim: [claim-symmetry-quotients-04](symmetry_quotients.md#claim-symmetry-quotients-04).

Author: Codex, task `symmetry-extensions-20261015`. Reviewer: independent
subagent `cr04`, task `claim_review_04`, 2026-10-21.

Reviewed revision: worktree at commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256
`fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f`.

Dependency reviewed: [d18 symmetry Claim 01](../../research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-01),
exact SHA-256 `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b`.
Its residual-group proof was independently read for the rooted specialization.
Claims 01--03 of the reviewed source are optional algorithms, and their
acceptance is not needed for this abstract claim. No external Ramsey bound
or census premise is needed.

Decisive checks:

- For an orbit O and fixed earlier tuple a, choose x in the nonempty
  fiber. If y=g.x is another fiber member, equivariance gives g.a=a;
  conversely every simultaneous stabilizer element keeps x in the fiber.
  Thus the fiber is precisely Stab(a).x, even for nonfaithful actions and
  orders that the action does not preserve. Finite nonempty fibers have
  attained minima. This proves each conditional stage minimizes exactly
  the remaining lexicographic suffix, rather than independent coordinates.
- Equal least tuples imply orbit equivalence only when the tuple determines
  the full labeled object, as expressly assumed. Equivariance alone would
  not supply this implication; the completeness condition is essential and
  is present in the statement.
- A rooted graph is reconstructed from its distinguished root, exact
  labeled A graph, occurrence-ranked multiset M, and full B edge vector:
  root incidences and A--B incidences are determined. After identifying
  equal canonical A representatives, the remaining row action is Aut(A).
  After fixing M, an isomorphism is exactly a row/occurrence pair preserving
  its cross matrix, namely Gamma_M. Minimizing the full B vector therefore
  completes the rooted code. No small-column hypothesis or prohibition of
  I4 in A is introduced.
- For isomorphic unrooted objects, an equivariant admissible-root family
  gives equal sets of complete rooted codes and hence equal minima. In the
  reverse direction, attainment of equal minima supplies roots with equal
  complete rooted codes, hence a rooted isomorphism and an unrooted
  isomorphism. Nonemptiness is necessary for attainment. Equal codes at two
  roots of the same graph supply an automorphism carrying those roots, so
  the warning that nonautomorphic roots cannot tie is correct.
- The x136 and pair-root remarks are conditional coverage instructions,
  not assertions that either admissible family exists for every order-43
  graph. Restricting to branch-admissible roots, respecting ordered endpoint
  data, and handling ties preserves the stated scope. Complement selection
  requires its own coverage argument as the source explicitly says.

Outcome: **accepted** for claim-symmetry-quotients-04 at the exact source
hash above. No correction is required. Permitted use is the stated
conditional symmetry/root-coverage argument, with complete and certified
codes before computational pruning relies on it.

Limits: This review establishes the mathematical composition argument,
not an implemented canonicalizer, catalogue coverage, root-family
nonemptiness theorem, computational certificate, or Ramsey branch closure.
No solver, theorem prover, canonicalizer, download, graph enumeration,
nontrivial search, or novelty review was used.
