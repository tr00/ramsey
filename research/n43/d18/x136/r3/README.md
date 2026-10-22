# r=3 frontier branch

Branch name: `research/n43/d18/x136/r3`. State: excluded by independently reviewed local deduction.
Parent: [x136](../../README.md); inherit all its assumptions and notation.
Exact additional predicate: precisely 3 vertices y in B have |C_y|=4.
The previous necessary size-five count was s=2..3, from the existing
[small-column note](../small_columns.md) and
[reduction index](../../../reductions.md), section 8.7.

Both cases are excluded by
[actual-column overlap and independent-four anchors](../pairwise_small_refinements.md#claim-pairwise-small-03).
Their column budget H=s-2<=1 forces the overlap vertices into a clique
of size at most three. The four-transversal theorem supplies an independent
four-set avoiding that clique; its internal degree sum is at least 33,
contradicting the anchor upper bound 32.

[Independent review](../../review_pairwise-small_2026-10-14_coordinator.md)
records exact proof hashes and the external census premises: the order-14
(4,4) maximum 50, order-15 (4,4) minimum 50, and E(4,5,17)=79, together
with the equality-frontier premises. This closes this child; x136 remains
open at r=0,1,2. No formal exhaustion certificate or novelty claim is asserted.
