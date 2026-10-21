# Independent review of the landscape template attachment cap

Date: 2026-10-21. Task kind: research / independent proof review.

Claim: [claim-landscape-template-cap](parameter_landscape.md#claim-landscape-template-cap).
Author: Main. Reviewer: `/root/claim_review_22`, distinct from the author.
Reviewed revision: repository HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`;
exact source SHA-256
`6d0af226c0723b698ec5fa033776f216b7953ba4885bf93fba59de21bc6164ca`.

Dependencies reviewed: the claim uses only its explicit K4/I5-free ambient
hypothesis and the induced balanced complete three-partite structure of H.
These hypotheses and the proof are in the source bytes identified above;
there is no external census, Ramsey-number value, or other landscape claim
needed for this review. Review protocol files read were `.agents/AGENTS.md`
(SHA-256 `e5990b6ed2f9801ef2c333665714bf63cb8604887e24f6c1aeb2f68e7db62958`)
and `docs/workflow.md`
(SHA-256 `68cb023b675e7b00469b89bf23dc2c7919c2d4eb4ea9fd656b4a5e083b034c0a`).

Checks and findings:

- Independently partitioned an outside vertex's H-neighbors by the three
  parts. Meeting all three gives a triangle in its neighborhood and hence
  K4. Meeting at most two gives degree at most the sum of the two largest
  part sizes, namely M=m-c. Degree M requires both occupied parts to be
  complete and the omitted part to have size c. All parts are nonempty for
  3<=m<=9, so this description covers every equality case.
- For a fixed omitted part, two degree-M vertices share all of each of
  the other two parts. Pick one vertex in each: those vertices form an
  edge, and an edge between the outside vertices would complete K4.
  Thus all outside vertices of this type are pairwise nonadjacent.
  Each is also nonadjacent to the omitted independent c-set. Their union
  is independent, and I5-freeness gives type multiplicity at most 4-c.
  This uses no assumption that arbitrary outside vertices are independent.
- Summing the k type bounds gives at most k(4-c) degree-M vertices;
  there are also at most ell of them. Every remaining vertex has integer
  degree at most M-1. Therefore the cut is at most
  `(M-1)ell+min(ell,k(4-c))`, for every chosen set of ell outside vertices.
  Repeated neighborhoods are allowed. At ell=0 the same expression is zero.
- A trivial arithmetic check of the seven balanced part-size triples gave
  `(M,k(4-c))` equal to `(2,9),(3,6),(4,3),(4,6),(5,4),(6,2),(6,3)`
  at m=3,...,9. This independently confirms the two displayed specializations:
  K332 gives `5ell+min(ell,2)` and K333 gives `5ell+min(ell,3)`.

Outcome: **accepted** for this exact revision and this claim alone.
The statement is a valid upper bound, without any claim that equality is
attainable. Its argument applies to arbitrary selected outside vertices,
not just actual cross columns. Source metadata and search permissions remain
unchanged; integration belongs to the coordinator.

Limits: no other claim, parameter-map computation, finite-template evidence,
branch closure, or order-43 conclusion was reviewed. No novelty check or
formal verification was performed. No solvers, provers, canonicalizers,
downloads, or graph searches were used; the seven arithmetic rows merely
check the formula's constants.
