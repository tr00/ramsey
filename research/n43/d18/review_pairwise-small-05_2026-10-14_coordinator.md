# Independent review of the r2 edge-capacity refinement

Claim(s): [Claim 05](x136/pairwise_small_refinements.md#claim-pairwise-small-05).
Author and reviewer: small-column agent; Codex coordinator, distinct agents.
Date: 2026-10-14.

Reviewed revision: base `81c768a683d3c3b3df70d4d3b7d03a67d505447b`,
exact proof file SHA-256
`bbf3ebf695e1db8c3bb375922678f965a912ec0345f1589f54331992dc65cd3d`.
Later review metadata changes preserve this review; proof changes need renewal.

Dependencies reviewed: Claims 01--02 retain their prior exact-revision
[review](review_pairwise-small_2026-10-14_coordinator.md). The reviewer rechecked
the pair-union argument, small-column incidence inequality, and common B
neighborhood type. Published census inputs remain external as before.

Checks and findings: Q consists of the two size-four B vertices and is an
edge. Its common B neighborhood is (3,4)-free, so has at most eight vertices;
all s L5 vertices are present. At most one L5 vertex contains an overlap a,
since two would intersect at a, force an edge, and form K5 with a and Q.
Regular external a-neighbors are common Q neighbors, at most 9-s in total.
Thus 17-d_A(a)<=2+9-s+h_a, giving d_A>=6+s-h_a. Claim 02 supplies
the other inequality d_A>=12-h_a. At s=7, H=3, so h_a in {2,3}; the
edge-incidence inequality gives overlap size at most one. The partitions
3,2+1,1+1+1 exhaust H, and their listed size-nine, size-eight/seven, and
three-size-seven consequences follow. Counts do not imply realizability.

Outcome: accepted; propagation only at x136/r2, with no further closure.
Limits: independent local reasoning, no catalogue replay, formal checking,
graph enumeration, or novelty review. All earlier review limits remain.
