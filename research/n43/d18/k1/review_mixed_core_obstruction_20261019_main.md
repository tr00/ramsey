# Independent audit of the mixed-core triangle obstruction

Date: 2026-10-19. Author: MixedCoreTheory. Reviewer: Main, a distinct identity.
Task: `k1-whole-branch-obstruction-20261019`.

## Claims and exact revision

All five claims in [mixed_core_obstruction.md](mixed_core_obstruction.md):
`claim-core-pair-triple-duality`, `claim-uniform-core-triangle-envelope`,
`claim-attachment-triangle-load`, `claim-mixed-triangle-moment-obstruction`,
and `claim-mixed-score-limit`.

Reviewed uncommitted SHA-256:
`2e1ed67b761847d9b8cc0432c2ef928e0365022262de88c875776d9c005a329d`.
The full 434-line manuscript was read. Main independently rederived the
arguments below; author output alone was not treated as proof.

Dependencies inspected and their current SHA-256:

| Dependency | SHA-256 |
| --- | --- |
| `research.json` | `bf434421efcf08b73813866ba8db7e76878700fb65104895539622d8127a069e` |
| `cross_core.json` | `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d` |
| `seven_cell.json` | `f62130763dfb9315377ad542c33aabef9eb8555370c29db2b61f5e998f780bfd` |

These are accepted dependency statements with reviews recorded in their
metadata. Both cores are K4/I4-free; the two core+T sides are K5/I4-free;
the full graph is K5/I5-free. The proof does not transfer I4-freeness to
the full graph. No new exterior theorem or 65-edge bound is needed by this
manuscript, so this audit has no circular dependency on them.

## Independent checks

### Pair-triple duality and forbidden templates

An independent core triple has fourteen external vertices, all covered by
its three neighborhoods. Inclusion-exclusion gives common-neighborhood
size 14-24+12=2. An edge's common-neighborhood triple is independent by
K4-freeness; the two recovered common neighbors are its endpoints.
There are 68 edges and 68 independent triples, so the injection is a
bijection. Complementation gives the triangle/nonedge statement.

The induced 3K2 obstruction was independently counted: eleven outside
vertices each must see a whole one of its three edges, but only nine
edge-common-neighbor incidences exist. The seven-vertex/seven-edge
two-triangle obstruction was checked for intersection sizes two, one,
and zero. In the diamond case the two remaining edges are exhausted by
the manuscript's three placements; each gives I4 or an edge with five
common nonneighbors. In the bowtie case each placement of the seventh
edge gives I4 or that same forbidden common cell. For disjoint triangles,
a joining edge still leaves adjacent common nonneighbors of a triangle,
while a nonjoining edge leaves at least three common nonneighbors.
The complete intersection case split is sound.

### Triangle envelope

Each core vertex lies in twelve triangles and each edge in three.
Inclusion-exclusion gives

    tau(S)=68-12|W|+3e(W)-tau(W).

The correction signs and multiplicities were independently recomputed.
The bound tau(W)<=e(W) uses three as an edge-triangle cap and divides the
triangle/edge incidence count by three, not by an arbitrary-density bound.

The seven-set spectral bound follows from A^2=4I-A+4J and the least
root -(1+sqrt(17))/2; the squared positive-side comparison is valid.
At e(W)=7 the forbidden-template lemma gives tau(W)<=1, which is
load-bearing for f(10)=4. At e=8,9 the respective elementary triangle
caps four and five suffice; e>=10 follows from tau<=e.

The six-set e>=4 argument correctly separates induced 3K2 from all other
at-most-three-edge graphs, which have a two-vertex edge cover. With four
edges a triangle either has three common nonneighbors or leaves I4.
The low-edge K4-free triangle caps used in the proof were checked by
minimum-degree peeling, and by the stated degree-four/C4 or cubic
exceptions. Bounds for remainder sizes five through zero then follow
from I4-freeness and the exact triangle deletion identity. No census of
small induced subsets is silently assumed.

Every entry of the resulting table and both affine lower bounds were
checked by exact integer arithmetic for s=0..17.

### Attachment triangle load

For the missed subset W of size at most eight, the complement F of H[W]
is triangle-free and I4-free. Counting independent triples of F gives
exactly the manuscript's equation (2). At w=8 the degree-two/three
identity reduces the count to 24-e(F), at least twelve. At w=7 the count
is 12+n1+n2; parity rules out all seven degrees equal to three. At w=6
the forbidden two-anticomplete-triangles template excludes e(F)=9,
and the degree-sum sixteen case makes the upper bound fifteen on
sum binomial(d,2) strict as required. At w=5 Mantel and degree<=3 give
at least sixteen. Smaller W is covered by the thirteen-set envelope.
All cases yield tau(N_H(t))>=|N_H(t)|+3 with no weakened quantifier.

### Mixed moments and range

For a triangle J of C the full common-neighbor set includes v and is
independent of size at most four. Thus D and T compete for the same
remaining capacity three, not two independent capacities. Summing all
68 triangles gives the first two moment inequalities. Independent
triples of C have at most three common missed D vertices because D
is K4-free and the common missed set must be a clique. Complementing
the core then gives both complementary moment inequalities.

The affine substitutions were independently recomputed:
4r+p<=795, 6r+p<=1169 and their q counterparts, and
6(289-r)-986<=204 gives r>=91. The accepted p>=64 then gives r<=182.
The stronger current p>=65 theorem, if accepted separately, leaves this
integer upper endpoint unchanged. No sufficiency or matrix completion is
claimed.

### Failed score strengthening

For S=N_H(x), tau(S)=0. Every core nonneighbor of x has four neighbors
in S and four in the eight-vertex remainder E, so E has sixteen edges
and twelve nonedges. E has no I3. Hence the independent triples in
{x}+E are exactly x plus a nonedge of E, totaling twelve. The proposed
universal floor twenty is genuinely false, not merely unsupported.

## Exercised arithmetic verification

Python 3.12.3, in-memory Eval with a 30-second deadline: all eighteen
affine table comparisons passed; the integer range arithmetic passed;
all sixteen admissible w=7 degree-count parity profiles and the two
w=6 degree-count profiles of degree sum sixteen passed their stated
bounds. The fixed w=8 edge values 10,11,12 also passed 24-e>=12.
No graph generation, graph search, solver, catalogue processing,
download, build, tests, lint, formatter or theorem prover was run.

## Outcome and limits

Outcome: **accepted** for all five claims at the exact hash above, on the
stated accepted critical-core and Ramsey premises. No findings require
correction. Permitted use: necessary mixed-moment propagation and the
whole-branch interval 91<=r<=182, never full K1 termination.

This is an independent local mathematical audit, not a novelty review,
formal certificate, or recertification of external literature. The
simultaneous C-D completion systems remain unresolved.
