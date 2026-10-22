# Independent review of frontier pairings

Claim(s): [Claims 01--04](pairwise_frontier_refinements.md), anchors
`claim-pairwise-frontier-01` through `claim-pairwise-frontier-04`.
Author and reviewer: frontier agent; Codex coordinator, distinct agents.
Date: 2026-10-14.

Reviewed revision: base `81c768a683d3c3b3df70d4d3b7d03a67d505447b`,
exact uncommitted proof SHA-256
`7090379f5864737ee3eb7021907adddb10e9011924ad53e4c403ca2d2d94c3cc`.
Later metadata/link changes preserve this review; proof changes need renewal.

Dependencies reviewed: source hashes are retained in the proof. The reviewer
re-derived attachment bounds, pair unions, singleton anchor counts, degree
identities, and Q-mask counts. Census inputs remain the recorded order-14
(4,4) maximum 50, order-15 (4,4) minimum 50, E(4,5,17)=79, and the
order-18 maximum 85; smaller Ramsey numbers are external premises.

Checks and findings:

- Claim 01: the core lacks both K4 and I4 because an actual column is
  an I4 transversal. Attachments have size at most eight. The deletion
  proof covers a triangle and all nontriangle three-vertex induced types,
  giving e(A-a)<=76 and degree at least 9-q. Degree at most eleven and
  the universal-in-T equality conclusion are independent of q and E.
- Claim 02: size-at-most-six columns sharing a with a size-four column
  force adjacency in B. Two memberships make the remaining regular
  neighbors independent in B, at most three; three memberships forbid
  all such neighbors. The row identity includes epsilon_a and the pivot
  edge. J_a>=1+epsilon_a or >=3+epsilon_a follows. The H bound and H=k
  at r=4 explicitly require exclusion of columns smaller than four.
- Claim 03: at k=1, q=0 and E=1. H=1 means a unique size-seven column.
  Membership three is impossible; membership two implies epsilon_a=0
  and degree eleven. An I4 meeting all four columns has counts
  n_1+2n_2>=4, n_0+n_1+n_2=4. Minimizing 24+3n_1+5n_2 gives 34.
  Its cross sum is at most 68+1-34=35, below the anchor minimum 36.
  This is an independent cross-check of the concurrent four-column task.
- Claim 04: an exact triple-Q class is independent and anticomplete to
  the omitted Q vertex; three class members would give I4 in B with
  that vertex. Thus each class has size at most two, n_3<=8. Degree
  counting gives D-40=-2n_0-n_1+n_3. For size-four Q, D=44+E_Q, so
  2n_0+n_1<=4-E_Q. A Q edge has at most six external common neighbors.
  At E_Q=4 this forces all four triple classes and six pair classes to
  have size two. The comparison to the older count relaxation is valid.

Outcome: accepted for all four claims, conditional on stated external
premises. Search use: propagate general degree/overlap/mask bounds; terminate
exactly x137/r4, coordinating its indexing with the other task. No full x137
closure. General actual-column claims do not require q<=2; their H-based
specializations do require the universal lower column bound.

Limits: no catalogue download/replay, formal theorem prover, graph enumeration,
or novelty review. This accepts local reasoning, not an order-43 exhaustion
certificate. The separate task's independent proof and review remain intact.
