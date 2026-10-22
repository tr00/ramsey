# Independent review of the residual split and quotient composition

Date: 2026-10-21. Reviewer: `claim_review_01` (`cr01`), independently
dispatched review agent, distinct from the `symmetry-extensions-20261015`
author (Codex).

Claim: [claim-symmetry-quotients-01](symmetry_quotients.md#claim-symmetry-quotients-01).

Reviewed revision: worktree based on commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256
`fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f`.
This outcome concerns only Claim 01 and its setting, not Claims 02--04.

Dependencies reviewed: [d18 symmetry Claim 01](../../research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-01),
source SHA-256
`6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b`.
Its [historical independent review](../../research/n43/d18/review_d18_symmetry_20261014_pivot.md)
was read, SHA-256
`b272654e877d8e5cdd7d94174bdb1d9c3d93c5978afceb0c8fb4ab24bbff8754`;
that review identifies its own earlier proof revision. The present check
rederives the required exact sequence directly, so it does not depend on
transferring historical acceptance across revisions. No census, Ramsey
extremum, or multiplicity bound is needed.

Checks and findings: H is a subgroup because its defining condition is
multiset preservation. For every g in H, the rank-preserving occurrence
map is a bijection, with inverse ell(g^-1), and composition gives
ell(g)ell(h)=ell(gh). Projection from Gamma onto H is therefore surjective
and its kernel is exactly the product of the within-signature symmetric
groups. For any (g,tau), tau ell(g)^-1 preserves each signature class;
this gives existence and uniqueness of the factorization k ell(g).
Conjugation sends the rank permutation in the C factor to that in the gC
factor, establishing the stated semidirect product action for arbitrary
multiplicities, including absent signatures and the empty occurrence set.

The inverse-index convention makes the induced vector action a left
action: (k ell(g)).z = k.(ell(g).z). Consequently every orbit vector is
included in the displayed nested minimum, and every vector in that minimum
belongs to the orbit. Finiteness supplies both minima. Nonfaithfulness on
the B occurrence set merely repeats vectors and does not affect equality.
Invariant feasibility and consistent transformation of indexed extra data
are necessary when applying this orbit identity as a search quotient.
The text states these hypotheses and correctly requires minimization over
all H rather than generator comparisons. No mathematical correction found.

Outcome: **accepted** for Claim 01 at the exact source hash above.
Permitted use: residual symmetry quotient after independently certified
implementation, with the stated invariant-family hypotheses.

Limits: this is a mathematical review, not validation of a canonicalizer,
automorphism list, kernel minimizer, completion search, or coverage
certificate. No novelty assessment, solver, theorem prover, canonicalizer,
enumeration, download, or nontrivial computational search was performed.
