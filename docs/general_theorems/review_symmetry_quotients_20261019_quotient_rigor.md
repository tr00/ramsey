# Independent review of exact residual symmetry and arbitrary-domain descent

Date: 2026-10-19. Reviewer: `quotient_rigor`, an independent review agent
distinct from the `Codex` author of task symmetry-extensions-20261015.
Owned path: this review only. No proof, manifest, index, or other file was
edited by this reviewer.

Claim(s): `docs/general_theorems/symmetry_quotients.md#claim-symmetry-quotients-01`,
`#claim-symmetry-quotients-02`, `#claim-symmetry-quotients-03`,
`#claim-symmetry-quotients-04` (anchors at lines 33, 81, 168, 238; all four
were `Review state: ready`, `Reviews: none`).

Author and reviewer: author `Codex` (task symmetry-extensions-20261015,
file line 3); reviewer `quotient_rigor`. Distinct identities; the reviewer
rederived every step independently and did not rely on the author's
self-check (lines 303-320).

Reviewed revision: commit `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`
(working tree clean for the reviewed file); file SHA-256 of the exact text
`fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f`
(recomputed; equals `git show HEAD:docs/general_theorems/symmetry_quotients.md | sha256sum`).
All findings concern this exact text; a changed proof requires renewed review;
the precision edits listed below, if applied, must be recorded and rechecked.

Dependencies reviewed:
- `n43/d18/symmetry_reduction.md` SHA-256
  `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b`
  (recomputed; matches the hash the target file cites at lines 318-321).
  Claim `#claim-d18-symmetry-01` (lines 72-119, state accepted, review
  `n43/d18/review_d18_symmetry_20261014_pivot.md` SHA-256
  `b1c63e0bc08605ca9378221f1616e27c6705a71810ea01e22782416f8f60acf8`,
  recomputed) was read for applicability: its `Gamma_M` binds `g in Aut(A)`
  explicitly (line 99) with `sigma` a full permutation of the 24 positions,
  and asserts the exact sequence and `|Gamma_M|=|H_M|*prod m_C!` but no
  splitting. The target's Claim 01 is the same object in occurrence-rank
  notation plus new content (splitting and the canonical formula), which this
  review rederived from scratch rather than inherited.
- The standard implication-graph characterization of finite 2-CNF
  satisfiability (target lines 93-94): recalled and rederived in this review
  (both directions, unit and empty clauses), not taken on faith.
- Ambient types: `G` K5/I5-free on 43 vertices; `A=N(v)` (4,5)-free, may
  contain I4; `B=M(v)` (5,4)-free, no I4 (d18 setting lines 28-30). Checked
  that no forbidden-set, order-43, census, or pivot-degree fact enters any of
  the four proofs; Claims 01-03 are stated for arbitrary finite `A`, `M`, and
  edge vectors, and Claim 04's degree-18/x_v mentions are admissible-root-family
  restrictions only (`x=136+2q+E` is a rooted-isomorphism invariant, so the
  branch-restricted family is equivariant).
- The target's cited input revision `f98a1285b7adc9720a693ae3a54fba212a021bdf`
  is a real commit; its reduction index `b64a7aec9950ec483e124fda44356a23ae35e913be89a7dfba131a0be76a62ba`
  is exactly `n43/reductions.md` at that commit (recomputed). Current
  `n43/reductions.md` hashes to `4d7ddf5fce27a8c569df443855262c8751505018e0e4828e915383b42405bdf9`
  and has since changed; it is not used in any of the four proofs.
- Unresolved external premises: none. The four claims need no Ramsey value,
  extremum, or census. The d18 acceptance's external premises were not
  re-certified and are not required here.

Checks: assumptions (finite sets, fixed rank/pair orders, F invariant under
the group used), quantifiers (universal-over-extensions in Claim 03;
minimization over all of H, not generators, in Claim 01; minimization over
all 2^p swaps in Claim 02; per-orbit minima in Claim 04), ambient types (no
order-43 leakage; A may contain I4, B none — unused anyway), algebra
(Gamma group axioms, kernel, unique factorization, conjugation rule,
semidirect section, canonical-formula min decomposition, fiber/stabilizer
induction), case coverage (all four disjoint-swap edge cases; witness
alternative for unassigned coordinates; ties and both root-code directions),
dependency applicability (d18 Claim 01 in occurrence-rank notation; 2-SAT
recall rederived), and permitted search use (no search, enumeration, solver,
canonicalizer, download, or package was used by the author or the reviewer;
all computational checks are reviewer-side finite verification scripts run
outside the repository; Search-use lines gate implementation appropriately).
Evidence: a scratch script (95,626 assertions, 0 failures) covering: the
5-vertex example exhaustively (both single swaps first differ at 02 with the
generator larger; the double swap first differs at 04 with z larger; double
swap is the orbit minimum); Claim 02 greedy-vs-brute-force on all 64 vectors
at b=4, all 1024 at b=5, 300 random at b=6, plus 5,248 implication-graph
solver calls cross-checked against brute force (0 disagreements) and
clause-encoding exactness over every assignment of every coordinate;
Claim 01 on three finite instances (|Aut|,|H|,|Gamma| = 2,2,16 / 8,2,8 /
nonfaithful case) verifying group axioms, projection onto H, full-product
kernel, unique factorization, cross-class conjugation, and
`Can_Gamma=min_g Can_K(ell(g)z)` against full orbit minima, including a
nonfaithful occurrence action; Claim 03 exhaustively over all 81 partial
assignments on L=4 for two invariant families (29 witnessed rejections each,
all implications and all orbit-least avoidances verified) plus both text
examples; Claim 04 on all 8 labeled 3-vertex graphs (hierarchy = lex min,
fiber = single stabilizer orbit, complete/incomplete tuple biconditionals, an
abstract instance where independent stage minima give an unrealized tuple,
rooted-code completeness, unrooted min biconditional, family equivariance,
and tie classification).

Findings:
- Claim 01: the mathematics verifies under the intended reading (proof lines
  65-75; conclusion lines 47-63). Two precision gaps, both editorial:
  (i) line 25 does not bind `g in Aut(A)`; read literally, the fiber
  condition admits vertex bijections outside Aut(A) that preserve the column
  multiset (reviewer produced explicit counterexamples on the path instance),
  for which the projection to H fails — the conclusion and proof force the
  intended reading, and d18's source has the binder; add "g in Aut(A),";
  (ii) line 67 should record the one-line fact that bijectivity of tau gives
  `m_(gC)=m_C`, so the projection lands in H (rederived and instance-checked).
  `ell` as an occurrence permutation need not be injective (nonfaithful
  instance verified); only the pair-lift into Gamma must be, and it is,
  because pi composed with the lift is the identity. The canonical-formula
  caveat (lines 73-75) and the generators caveat (lines 62-63) are correct.
- Claim 02: all six assigned aspects verified with exhaustive evidence; no
  gaps. Editorial only: the induction sentence at lines 123-124 compresses
  the feasibility dichotomy (correct as surrounding text spells it out).
- Claim 03: universal condition, witness sufficiency (unassigned earlier
  coordinates only via the fixed-point alternative), orbit-least avoidance,
  tree coverage under the stated hypotheses, both worked examples, and the
  subgroup/no-preservation caveats all verified. Editorial only: the coverage
  hypothesis (lines 190-191) must be read as "every unpruned path reaches a
  complete assignment".
- Claim 04: fiber = single orbit of the simultaneous stabilizer (both
  directions rederived via equivariance); no action-invariance of the orders
  is used anywhere; equal-minimum-tuples biconditional holds under tuple
  completeness; rooted two-direction argument correct under a nonempty
  isomorphism-equivariant root family with exact rooted code; ties classified
  correctly (automorphic roots tie, nonautomorphic cannot when complete);
  x136/pair/complement restrictions are coherent requirements; independent
  stage minima warning demonstrated by explicit counterexample. Editorial
  only: lines 289-290 leave "endpoint ordering ... handled in the code"
  unspecified (should say: minimize over both endpoint orders).

Outcome: **accepted** — Claims 01, 02, 03 and 04 all accepted at the exact
revision above, on their stated scopes (lines 42, 90-91, 177-178, 247-253).
No material statement/proof mismatch was found; the findings above are
editorial precision edits whose application should be recorded (they do not
alter any proof). Acceptance is an independent mathematical audit only, not
a novelty claim, formal certificate, branch closure, or implementation.

Limits: no novelty/literature check was performed (the file makes no novelty
claim); no formal certificate or proof-assistant artifact exists for these
claims; the accepted d18 dependency's external premises (Ramsey values,
extrema, census bounds) were not re-certified and are not needed by these
proofs; the target's cited reduction index is stale relative to the current
`n43/reductions.md` but is not a dependency of these four claims; the
reviewer's finite-instance scripts supplement but do not replace the general
hand-derivations; no solver, canonicalizer, automorphism procedure, orbit
coverage log, or timing claim is validated by this review; the repository's
degree-sequence selector and minimum-degree split were checked only for
existence of the reference, not re-audited.

## Coordinator integration addendum (2026-10-19)

Integrated by the coordinator after the outcome above: claim metadata in
`docs/general_theorems/symmetry_quotients.md` flipped (`Review state:
ready` -> `accepted`, `Reviews: none.` -> a link to this review) and an
integration-status banner added under the title. No proof body, claim
statement, or author prose was edited. The byte-preservation gate
(strip the banner, revert those metadata lines) reproduces the reviewed
SHA-256 exactly; gate result and post-integration hashes are recorded in
[the audit report](../../reports/2026-10-19-symmetry-quotients-extensions-audit.md).
The editorial precision findings above remain open as optional wording fixes;
if applied, the file hash changes and a renewed check is required.
