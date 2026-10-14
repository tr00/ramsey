# Independent review of equality-frontier small-column refinements

Claim(s): [Claims 01--04](x136/pairwise_small_refinements.md), anchors
`claim-pairwise-small-01` through `claim-pairwise-small-04`.

Author and reviewer: small-column agent; Codex coordinator, distinct agents.
Date: 2026-10-14.

Reviewed revision: base `81c768a683d3c3b3df70d4d3b7d03a67d505447b`,
uncommitted proof file SHA-256
`499322f3acfc97a796b7cb4906875cdbbcfb5ec5d7b21669ec62935c1b9a1f73`.
Later changes limited to review metadata and links preserve this proof review;
any proof change requires renewed review.

Dependencies reviewed: exact dependency hashes are retained in the proof.
The reviewer re-derived the equality row identity, singleton anchor count,
pair-union assertion, and four-transversal proof. The 14-vertex maximum 50,
15-vertex minimum 50, and E(4,5,17)=79 remain published external census
premises. The surviving four-transversal family classification is unnecessary.

Checks and findings:

- Claim 01: deleting a T vertex gives either at most 50+24+2 edges or,
  for a remaining triangle, at most 50+23+3. Pair attachment intersections
  are independent because an edge with its two T anchors would be K4;
  their sizes are at most three because the core has no I4. The common
  attachment intersection is empty. Thus degree is at least nine and at
  most 8+3=11. The argument covers every T type.
- Claim 02: an actual size-four/size-at-most-six pair sharing a forces the
  B edge by union size at most nine. With two Q memberships, two adjacent
  external regular neighbors produce K5 with a and the Q edge, leaving
  at most three such neighbors since B has no I4. With three memberships,
  even one regular neighbor produces K5. Column sizes at least seven
  consume at least one H unit apiece. All degree bounds follow from the
  vertexwise equality identity; they are not just aggregate x bounds.
- Claim 03: r=3 gives H=s-2 in {0,1}, excluding triple membership and
  making all double-membership vertices universal inside both columns.
  Any two double-membership index pairs among three columns intersect,
  so their vertices form a clique O of size at most three. The transversal
  theorem applies to O even though O need not be an actual column: there
  is an I4 avoiding O. It meets all three columns at distinct vertices.
  The independent anchor's degree sum is at least 3*9+6=33 but at most
  32. This covers s=2 and s=3 without selecting a special I4.
- Claim 04: at h=1, double-membership vertices have degree 11, lie in the
  unique larger column, and form a clique in the common column intersection.
  That intersection cannot contain a triangle because the two B anchors
  are adjacent. At H=2 the heavy-column alternatives are exactly one
  size-eight or two size-seven columns; degree ten needs two memberships.

Outcome: accepted for all four claims, conditional on the stated external
premises. Permitted search use: local propagation and termination of exactly
the x136/r3 child, with r<=4 and the recorded r4 exclusion providing the
coverage for r<=2. No r2 child, full equality frontier, or order-43 closure.

Limits: no literature novelty review; no catalogue acquisition or replay;
no formal proof checking or exhaustive graph computation. This is independent
mathematical review, not a computer nonexistence certificate. The frontier
agent separately checked the r3 argument and reported agreement.
