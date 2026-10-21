# Independent review of A-label relocation

Claim: [claim-tau-symmetry-01](symmetry.md#claim-tau-symmetry-01).
Author: Main (`tau-scaffold-20261019`). Reviewer: independent subagent
`cr20` (`claim_review_20`), 2026-10-21.

Reviewed revision: HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`;
the exact working-tree source SHA-256 is
`204e4baa20aee79c08a4f1320fab292fbe981b87d4fe16be673564d2fa0b98f7`.

Dependencies reviewed (exact working-tree SHA-256):

- [Degree-18 definitions](../README.md):
  `414e3736238a87ea6715f725c9d46312d2caf97b285c27f535de91b5ecf76c66`.
- [Tau definitions and superset closure S3](README.md):
  `1d68090879bc6009bdb69be8f0d58b211d6097472d88fdea888b9c34a5ce2ab7`.
  Only these definitions and S3 are used; unrelated numerical bounds and
  other pending claims in that README are not premises of this review.

Decisive independent checks:

- Extend a permutation of A by the identity on B and v. Each of the four
  edge categories (inside A, inside B, A–B, and pivot edges) is carried to
  exactly the assembled graph specified by the permuted internal graph
  and columns. Thus the map is a graph isomorphism fixing the entire B,
  and it preserves both forbidden five-vertex patterns. It preserves
  `e(A)` and each individual column cardinality, hence their multiset and
  their sum x. No B automorphism is needed.
- An independent four-set J is carried to an independent four-set pi(J),
  and `T intersect J` is empty exactly when `pi(T) intersect pi(J)` is
  empty. This proves transversality in both directions without assuming
  that A is I4-free. The permitted ambient types are consistent: I4 can
  occur in A, while fixed B is (5,4)-free.
- Given any t-subset T, choose a bijection from T to the designated first
  t labels and a bijection of their complements; their union is the
  required permutation. If a transversal has size s<=t<=18, choose t-s
  further A vertices. Every previously met four-set stays met. This also
  covers an empty transversal when the four-set family is empty. Applying
  the permutation to the enlarged transversal gives the contrapositive
  UNSAT implication with the correct existential quantifiers over
  extensions of the same fixed B.

Outcome: **accepted** for the stated mathematical claim and its symmetry
search use, subject to the stated requirement that added instance
restrictions are preserved under A relabeling.

Editorial finding: the caveat saying any row distinguishing a specific
column y breaks the argument is stronger than necessary. B labels are
fixed by the action; for example `|C_y|>=5` for a designated y is itself
A-invariant and preserves the argument. The actual condition is
invariance under the A action. This conservative overstatement does not
invalidate the claim or its proof and does not require a proof repair.

Limits: no concrete rung encoding, symmetry-breaking rows, SAT result,
refutation certificate, catalogue coverage, novelty, or theorem-prover
formalization was audited. The claim gives a conditional reduction,
not an exclusion. No solver, prover, canonicalizer, download, or
nontrivial computational search was used. The source and shared indexes
were not edited.
