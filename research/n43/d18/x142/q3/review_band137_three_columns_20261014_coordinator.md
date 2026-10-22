# Independent review: actual size-three columns at q=3

Claim(s): [three_columns.md](three_columns.md), anchors
claim-q3-three-column-core, claim-q3-three-column-excess-six, and
claim-q3-three-column-excess-fourteen.

Author: x142 boundary agent, band137-q3-20261014.
Reviewer: Codex coordinator, band137-20261014; additional independent audit
by transfer agent, band137-transfer-20261014.
Reviewed revision: base commit 81c768a683d3c3b3df70d4d3b7d03a67d505447b plus
exact uncommitted file SHA-256
`15ca2f85ffbc9d739103d7071f54ba6e0416cdac651f48e6b4ff425d103e410d`.
Dependencies reviewed: retained published 15-vertex (4,4) minimum 50;
R(4,3)=R(3,4)=9; order-43 degree range 18..24. The census premise is
accepted as recorded, without downloading or independently replaying its
completeness proof.

Checks and findings:

- An actual column is an independent-four transversal in A. Complement
  deletion leaves exactly 15 vertices and the correct (4,4) ambient type.
  The e(F)=71 equality independently forces 50 core edges, 21 attachments,
  and zero T edges in F. Complementing yields a triangle in A, core55,
  and eight attachments per triangle vertex.
- Pair intersections are independent subsets of the (4,4) core and have
  size at most three. Triple intersection is empty by K4 avoidance. Union
  capacity15 forces all pair cells3, all private cells2, and full coverage.
  The three opposite pair-cell anchors are independent and disjoint.
- Core degrees6..8 follow from the precise neighborhood and nonneighborhood
  ambient types. Singleton classes in B are cliques of size at most three;
  this independently proves each anchor's incidence lower bound36.
- Each anchor's degree sum is at least34 and forces excess at least2.
  The three-anchor union12 has degree sum at least110 because the core
  degree total is110 and six private vertices contribute at most48 inside
  the core. Its cross incidence is at most94+E_U versus at least108.
  Thus E_U>=14 and x=142+E_A>=156. The private-six cut audit yields the
  same inequality without the union-degree subtraction.
- Quantifiers allow any E_A and impose no maximizing-pivot assumption.
  The restriction concerns actual columns of a full G. The source does
  not claim an isolated universal four-transversal theorem at q=3.

Outcome: accepted. Search use: propagate; exclude actual size-three columns
when q=3 and E_A<=13. Combined with the separately reviewed two-transversal
bound, columns have size at least four in those profiles.

Limits: retained published finite premises have no new certificate here;
novelty has not been checked. No complete x or order-43 branch is closed.


## Reference-only relocation, 2026-10-14

The user requested sibling x case folders under research/n43/d18. This review and
its claim links now use the new paths; the original reviewed hashes above
are retained as historical provenance. Claim anchors and mathematical text
are unchanged. See the [move/hash manifest](../../../../reports/2026-10-14-d18-layout-migration.json).

Current source: `research/n43/d18/x142/q3/three_columns.md`, SHA-256 `00e670d5e5a5943f4f725184634f59be5ddf758b7b084551a9f3fd504ee068ee`.

Reversing the recorded path/link updates on each moved proof source
reconstructs its original reviewed SHA-256 exactly. This is a reference
migration, preserving the existing review outcome and evidence limits.
