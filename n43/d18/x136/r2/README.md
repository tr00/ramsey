# r=2 frontier branch

Branch name: `n43/d18/x136/r2`. State: open.
Parent: [x136](../README.md); inherit all its assumptions and notation.
Exact additional predicate: precisely 2 vertices y in B have |C_y|=4.
Necessary size-five count: s=4..7, from the existing
[small-column note](../small_columns.md) and
[reduction index](../../../reductions.md), section 8.7.

[Reviewed overlap refinements](../pairwise_small_refinements.md#claim-pairwise-small-04)
force the two size-four signatures to be disjoint at s=4. At s=5,
their intersection has size at most two, lies in the unique size-seven
column, and every intersection vertex has internal A degree 11. At s=6,
an intersection vertex of degree 10 requires two size-seven columns and
belongs to both. At s=7, the
[edge-capacity refinement](../pairwise_small_refinements.md#claim-pairwise-small-05)
requires overlap size at most one and at least two incident columns of size
seven or larger. A single size-nine column forces disjointness. These are
propagation conditions; this branch remains open.

No construction or nonexistence proof for this branch is asserted by this
navigation record. New branch-specific notes belong in this directory;
shared lemmas belong at the nearest applicable parent. Record claims and
revision-specific reviews using [the workflow](../../../../docs/workflow.md).
