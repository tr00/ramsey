# The exterior of a critical seventeen-vertex core

<!-- k1-whole-branch-integration:start -->
Integration status (2026-10-19): both claims and the row-type consequences
are independently **accepted** by
[ExteriorCapacityAudit](k1/review_triangle_capacity_20261019_exterior_audit.md)
at SHA-256 `8b8b1101af98e4c6dfe76234e95510bc6b24fcc32887189aac67d481a2dc2f51`.
The author-stage body below is unchanged; ready labels are historical.
Permitted use: exterior-row propagation on the stated B/H hypotheses.
No full K1 exclusion, novelty or formal certificate is claimed.
<!-- k1-whole-branch-integration:end -->

Date: 2026-10-19. Task: `k1-whole-branch-obstruction-20261019`.
Author: Main. All claims ready, not independently accepted.
No search, solver, catalogue uniqueness, or novelty assertion.

## Setting

Let B be any K5/I4-free graph containing an induced K4/I4-free graph H
of order 17. Put T=V(B)-V(H). No assumption on |T| is needed for the
theorems. For c in H, let W_c=T-N_B(c), its exterior nonneighbors.
For t in T, let U_t=H-N_B(t), its missed core signature.

The accepted [critical-core derivation](large_row_extensions.md#claim-seventeen-codegree-moments)
gives H the parameters SRG(17,8,3,4). In particular each core vertex
has eight core neighbors and eight core nonneighbors. The recorded inputs
R(3,3)=6 and R(3,4)=9 are in the [root table](../../README.md#state-of-the-art).
No identification of H with a unique graph is assumed.

We recall and rederive the [saturated nonedge packing](k1/cross_core.json)
in the present general setting. For a core nonedge xy, its three common
core nonneighbors form a triangle Z. If t in T misses x,y, it is complete
to Z: missing z in Z would make x,y,z,t an I4 in B. If distinct t,s both
miss x,y, nonadjacency ts gives I4 on x,y,t,s; adjacency ts gives K5 on
Z,t,s. Thus a nonadjacent core pair misses at most one common exterior
vertex. Equivalently, for every c and x in H nonadjacent, x misses at
most one member of W_c. Also H[U_t] is I3-free, since an I3 there together
with t would be I4 in B.

For c in H, write E=M_H(c), of order eight. Then E is K4/I3-free:
a missing independent triple would extend with c to I4 in H. Every vertex
x of E has degree four or five within E. Its nonneighbors in E form a
clique of size at most three, giving the floor four; its neighborhood is
triangle-free and I3-free, giving the ceiling five by R(3,3)=6.
Moreover, every edge of E lies in a triangle. Indeed N_E(x) is triangle-free
and I3-free on four or five vertices. It has no isolated vertex: if y
were isolated there, its other at least three vertices would have to form
a clique to avoid I3 with y, contradicting triangle-freeness. Thus each
neighbor y of x has another neighbor in N_E(x).

<a id="claim-critical-exterior-triangle-free"></a>
## 1. Every exterior missed signature is triangle-free

Claim ID: `n43/d18/critical_core_exterior.md#claim-critical-exterior-triangle-free`
Kind: local-deduction
Review state: ready
Scope: every B,H as in the setting, every c in H
Dependencies: SRG core parameters, saturated nonedge packing, R(3,3)=6
Conclusion: B[W_c] has no triangle
Search use: none pending independent review
Reviews: none

Proof. Suppose Q is a triangle in W_c. For each x in E=M_H(c), packing
says x misses at most one member of Q. Give x label 0 if it sees all of
Q and otherwise label q for its unique missed vertex q in Q.

Two vertices x,y with the same nonzero label q must be adjacent: otherwise
c,x,y are an independent triple in U_q, prohibited by the setting.
Thus every nonzero label class is a clique. It has size at most two:
three vertices of such a class would form a triangle complete to the
edge Q-{q}, giving K5 in B.

There can be no label-0 vertex x. In N_E(x), a label-0 vertex y is
impossible: y has a neighbor z there by the no-isolate property, and the
triangle x,y,z sees at least two vertices of Q, which form an edge and
give K5. Two vertices y,z of N_E(x) with the same nonzero label q are
also impossible: they are adjacent, and x,y,z see the edge Q-{q}.
Consequently N_E(x) has at most one vertex of each of the three nonzero
labels, contradicting d_E(x)>=4.

All eight vertices of E therefore belong to three classes of size at most
two, a contradiction. Hence W_c is triangle-free.

<a id="claim-critical-exterior-four"></a>
## 2. At most four exterior nonneighbors

Claim ID: `n43/d18/critical_core_exterior.md#claim-critical-exterior-four`
Kind: local-deduction
Review state: ready
Scope: every B,H as in the setting, every c in H
Dependencies: preceding claim, setting's packing and eight-vertex facts
Conclusion: |W_c|<=4, and B[W_c] is both triangle-free and I3-free;
if |W_c|=4 its type is 2K2, P4 or C4
Search use: none pending independent review
Reviews: none

Proof. W_c is I3-free, since an independent triple there with c would
be I4 in B. By Claim 1 it is triangle-free, so R(3,3)=6 gives |W_c|<=5.
Suppose |W_c|=5. Again every x in E misses at most one member of W_c.
If x misses none, choose a triangle of E through x. Its three vertices
have at least three common neighbors in W_c, because the other two
vertices miss at most one each. Any three vertices of W_c contain an
edge by I3-freeness. This edge and the E triangle give K5.
Thus every vertex of E misses exactly one member of W_c.

If x,y in E miss the same t, I3-freeness of U_t forces xy to be an edge.
That edge lies in a triangle of E. The triangle misses at most two vertices
of W_c, so again it sees three vertices containing an edge, giving K5.
Therefore the missing-vertex labels inject E into W_c, impossible for
orders eight and five. This proves |W_c|<=4.

At order four a triangle-free I3-free graph has every degree one or two:
degree zero forces the other three vertices to be a triangle, and degree
three gives an independent triple of neighbors. The only resulting graphs
are 2K2, P4 and C4. At order three the possible graphs are K2+K1 and P3.

## Consequences for actual seventeen-rows and the K1 branch

If |B|=24, every core vertex has at least three neighbors among its seven
exterior vertices, hence degree at least 11 in B (rather than the general
order-24 lower bound 10). In the [K1 double-core setting](k1/research.json),
this applies to both sides C+T and D+T, uniformly in x and all excesses:

    3<=d_T(c)<=7  for every c in C union D.

Its complete necessary missed-row domain, by row size, is:

| d_T(c) | B[T-N_T(c)] |
| --- | --- |
| 3 | 2K2, P4 or C4 |
| 4 | K2+K1 or P3 |
| 5 | either graph on two vertices |
| 6 | one vertex |
| 7 | empty |

These are necessary row restrictions, not a sufficient attachment criterion
and not assertions that every listed pattern is realizable. They hold for
every induced critical17 core, without selecting one catalogue witness.
They do not exclude K1 or decide R(5,5).
