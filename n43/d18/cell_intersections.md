# Exact compatibility at mixed anchored-cell intersections

Date: 2026-10-15. Author: Codex cell-intersection author.

Integration status (2026-10-15): all 5 mathematical claims below have
independent exact-revision acceptance; see [the review](review_cell_intersections_20261015_obligations.md).
The reviewed proof body and its historical author-stage labels are preserved.
This banner resolves their current status: conditional propagation is accepted
on the stated hypotheses; certificate implementation remains a draft design.
Reviewed and integrated hashes are recorded in
[the cell integration manifest](overlapping_cells_manifest.json).
All claims are drafts pending independent exact-revision review. Purely
mathematical work; no enumeration, solver, installation, catalogue, or download.
No novelty claim, forced occurrence of a boundary cell, or branch closure.

## Setting

Let G be an order-43 K5/I5-free graph, v a degree-18 pivot,
A=N(v), B=M(v), and C_y=N_A(y). Thus A is K4/I5-free and B is
K5/I4-free. Choose an actual edge Q of A and an actual independent pair P
of A, with Q and P disjoint, and define

    T={y in B: Q subset C_y},
    U={y in B: P intersect C_y is empty},
    S=T intersect U, X=T-U, Y=U-T.

By the reviewed [cell-type lemma](anchored_cell_averaging.md#claim-cell-types),
T is (3,4)-free, U is (5,3)-free, and S is (3,3)-free. In particular,
|T|<=8, |U|<=13, |S|<=5. All statements below retain these actual sets;
there is no condition on x, q, E, or column sizes.

For x in X and y in Y write

    N_x=N_B(x) intersect S,
    D_y=S-N_B(y).

N_x is an independent subset of S, since T has no triangle. D_y is a
clique of S, since U has no independent triple. The letters x and y here
name vertices, not the global cross-edge count.

## All possible overlap types

<a id="claim-intersection-types"></a>
Claim ID: `n43/d18/cell_intersections.md#claim-intersection-types`
Kind: local-deduction
Review state: accepted
Scope: the actual S above, for every possible order 0<=|S|<=5
Dependencies: reviewed cell types; R(3,3)=6
Conclusion: the following table is complete up to graph isomorphism
Search use: none pending independent review; proposed use: propagate
Reviews: [review](review_cell_intersections_20261015_obligations.md)

| Order of S | Possible induced graphs |
| --- | --- |
| 0 | empty graph on no vertices |
| 1 | one vertex |
| 2 | K2 or I2 |
| 3 | P3 or K2 disjoint union K1 |
| 4 | C4, P4, or 2K2 |
| 5 | C5 |

Proof. S has neither a triangle nor an independent triple. At order three,
there must be at least one edge and at least one nonedge, giving the two
listed types. At order four each vertex has degree at most two: three
neighbors would be independent, since triangles are prohibited. Each has
degree at least one: three nonneighbors would be a clique, since independent
triples are prohibited, and hence a prohibited triangle. A graph of maximum
degree two is a disjoint union of paths and cycles. Minimum degree one
excludes isolated vertices; triangles and an independent triple exclude every
four-vertex possibility except C4, P4, and 2K2. At order five the same
neighborhood argument gives degree at most two. Each vertex has at most two
nonneighbors by the corresponding clique argument, hence degree at least
two. A triangle-free 2-regular graph on five vertices is C5. Orders zero,
one, and two impose no triple constraint. Each listed graph has neither
forbidden triple, so the table gives precisely the local possibilities.
This does not assert that each type occurs in a full order-43 graph.

## C5 signatures

<a id="claim-c5-signatures"></a>
Claim ID: `n43/d18/cell_intersections.md#claim-c5-signatures`
Kind: local-deduction
Review state: accepted
Scope: the actual cells above with |S|=5
Dependencies: preceding claim; T is (3,4)-free; U is (5,3)-free
Conclusion: N_x is empty, a singleton, or a nonadjacent cycle pair;
the N_x are pairwise disjoint; D_y is empty, a singleton, or a cycle edge
Search use: none pending independent review; proposed use: propagate
Reviews: [review](review_cell_intersections_20261015_obligations.md)

Proof. Write S as the five-cycle with vertices s_0,...,s_4, indices modulo
five and edges s_i s_(i+1). The independent sets of S have order at most
two, and its cliques have order at most two. This proves the signature lists.
For each s in S, its T-neighborhood is independent because T is triangle-free,
and has order at most three because T has no I4. Two of its neighbors are
already in S. It therefore has at most one neighbor in X, which proves
pairwise disjointness of the N_x. This disjointness holds for every size of T
containing S, not only when |T|=8.

Equivalently, the eleven possible N signatures are empty, the five singletons,
and the five pairs {s_i,s_(i+2)}. The eleven possible D signatures are empty,
the five singletons, and the five pairs {s_i,s_(i+1)}. These are named actual
subsets, not interchangeable copies after their cross incidences are fixed.

## Exact edge-cell extensions of C5

<a id="claim-c5-edge-cell-extensions"></a>
Claim ID: `n43/d18/cell_intersections.md#claim-c5-edge-cell-extensions`
Kind: local-deduction
Review state: accepted
Scope: every (3,4)-free T containing an induced S=C5; X=T-S;
in the actual anchored setting 0<=|X|<=3
Dependencies: preceding C5 signature claim; elementary forbidden-subset checks
Conclusion: the lists below classify every local extension through order eight
Search use: none pending independent review; proposed use: propagate
Reviews: [review](review_cell_intersections_20261015_obligations.md)

For |X|=0 there is no extension condition. For |X|=1, its N signature can
be any of the eleven independent subsets of S. For |X|=2:

* If the two X vertices are adjacent, their N signatures can be any disjoint
  independent subsets of S.
* If they are nonadjacent, their N signatures must be disjoint and
  S minus their union must be a clique. Their sizes are (1,2) or (2,2).
  For sizes (1,2), the singleton is the unique common cycle neighbor of
  the independent pair. For sizes (2,2), any two disjoint independent pairs
  are allowed.

For |X|=3, X necessarily induces a path p-c-q, whose endpoints p,q are
nonadjacent. Up to cycle symmetry and interchanging the endpoints, there are
exactly four patterns:

| Pattern | N_p | N_q | N_c | Signature sizes |
| --- | --- | --- | --- | --- |
| A | {s_1} | {s_0,s_2} | empty | (1,2,0) |
| B | {s_1} | {s_0,s_2} | {s_3} | (1,2,1) |
| C | {s_0,s_2} | {s_1,s_3} | empty | (2,2,0) |
| D | {s_0,s_2} | {s_1,s_3} | {s_4} | (2,2,1) |

The table records endpoint sizes first and center size last. In pattern B,
{s_4} is equivalent to {s_3} by the reflection fixing s_1 and exchanging
s_0,s_2. Every listed pattern is locally (3,4)-free. Local realization does
not assert compatibility with U, A, or the rest of G.

Proof. The preceding claim gives independent, pairwise disjoint N signatures.
For any nonadjacent p,q in X, their common nonneighbors in S must be a clique:
an independent pair there would join p,q to make I4. Conversely, whenever
|X|<=3 and X has no independent triple, this is the only possible new I4.
Indeed S itself has independence number two; an I4 meeting both S and X
would need two nonadjacent X vertices and two nonadjacent S vertices. A
triangle is prohibited precisely by triangle-freeness of X, independence
of each N signature, and disjointness of N signatures on adjacent X pairs.
Pairwise disjointness already ensures the last condition.

For |X|=1 and |X|=2 these observations give the stated tests. For a
nonadjacent pair its signatures together have at least three vertices,
since the complement in C5 must be a clique of size at most two. Each
signature has size at most two, giving sizes (1,2) or (2,2). If the pair
signature is {s_0,s_2}, its complement induces edge s_3s_4 and isolated
vertex s_1; removing a singleton leaves a clique precisely when that
singleton is s_1. If the two signatures both have size two, their complement
is a singleton, so it is automatically a clique.

Now |T|=8. Every vertex of T has degree two or three: its neighborhood is
independent of size at most three; its antineighborhood is (3,3)-free of size
at most five, so 7-d_T<=5. X cannot contain a triangle. If X is independent,
every vertex in X must have an N signature of size two by its degree lower
bound, contradicting disjointness of three such signatures in five vertices.

If X has exactly one edge, let z be its isolated vertex and p,q the edge
endpoints. Then |N_z|=2 and |N_p|,|N_q| are each one or two by the same
degree bound. Relabel N_z={s_0,s_2}; its complement in S is
{s_1,s_3,s_4}, with edge s_3s_4 and isolated s_1. For either w=p,q,
the nonadjacent pair z,w requires this complement minus N_w to be a clique.
If N_w is a singleton it must be {s_1}. If N_w has size two, its independence
requires that it also contain s_1, since {s_3,s_4} is an edge. Thus both
N_p and N_q contain s_1, contradicting disjointness. The only remaining
triangle-free three-vertex graph is P3.

Its center has internal X degree two, so its N signature has size zero or
one; each endpoint has internal X degree one, so its N signature has size
one or two. The nonadjacent endpoint test gives endpoint sizes (1,2) or
(2,2), as before. In the former case relabel the signatures {s_1} and
{s_0,s_2}; the center is empty or a singleton in {s_3,s_4}, giving A,B.
In the latter case the signatures partition four vertices into independent
pairs. Deleting the fifth cycle vertex leaves P4, whose two independent
parts of size two are its unique bipartition. Relabel these parts
{s_0,s_2},{s_1,s_3}; the center is empty or {s_4}, giving C,D.

For sufficiency, in each listed case X is triangle-free, N signatures are
independent and pairwise disjoint, so no new triangle occurs. X has no
independent triple, S has no independent triple, and the only nonadjacent
X pair in the three-vertex cases is the endpoint pair. Its missed S set
is a clique in A,B,C,D. Thus no new I4 occurs. The same subset check verifies
every permitted one- and two-vertex extension. This proves the classification
without a graph catalogue or an enumeration.

## Exact mixed compatibility, including smaller overlaps

<a id="claim-exact-mixed-compatibility"></a>
Claim ID: `n43/d18/cell_intersections.md#claim-exact-mixed-compatibility`
Kind: local-deduction
Review state: accepted
Scope: any graph H on S disjoint union X disjoint union Y for which
H[S union X] is (3,4)-free and H[S union Y] is (5,3)-free;
in particular the actual anchored cells above, with arbitrary |S|<=5
Dependencies: elementary forbidden clique/independent-set partition argument
Conclusion: H is (5,4)-free if and only if conditions (i)--(iii) below hold
Search use: none pending independent review; proposed use: propagate
Reviews: [review](review_cell_intersections_20261015_obligations.md)

Here N_x=N_H(x) intersect S and D_y=S-N_H(y). The conditions are:

(i) H[X union Y] is (5,4)-free.

(ii) For each nonadjacent pair p,q in X and each y in Y nonadjacent to both,

    D_y subset N_p union N_q.

(iii) For each triangle {y_1,y_2,y_3} in Y and each x in X adjacent to all
three,

    N_x subset D_y1 union D_y2 union D_y3.

Proof of necessity. Condition (i) is inherited by an induced subgraph. If
(ii) fails, choose s in D_y-(N_p union N_q); then {s,p,q,y} is I4. If
(iii) fails, choose s in N_x-(D_y1 union D_y2 union D_y3); then
{s,x,y_1,y_2,y_3} is K5.

Proof of sufficiency. Suppose first that K is a K5. It cannot lie entirely
in S union X or S union Y by their stated types, and it cannot lie in
X union Y by (i). It therefore meets all three sets. Since S union X
is triangle-free, K contains at most two vertices from that union.
It already contains at least one from each of S and X, hence exactly one
from each, and exactly three from Y. These three form a Y triangle; the
X vertex is joined to all three; the S vertex contradicts (iii).

Suppose instead that I is I4. It cannot lie entirely in S union X or
S union Y by their stated types, and cannot lie in X union Y by (i).
It meets all three sets. Since S union Y has no independent triple,
I contains at most two vertices from that union. Therefore it has exactly
one from S, one from Y, and two from X. The X pair is nonadjacent, the Y
vertex misses both, and the S vertex contradicts (ii). This covers all
forbidden subsets and proves the equivalence. The argument also covers
S empty, when only (i) remains.

The equivalence is a local completion characterization on T union U; it
does not characterize G. Condition (i) deliberately retains all forbidden
sets that avoid the overlap, rather than assuming pair clauses suffice.

Concrete propagation from (ii): if p,q are nonadjacent in X and
D_y is not contained in N_p union N_q, then at least one of py,qy is an edge.
If one is already a nonedge, the other is forced to be an edge.
Concrete propagation from (iii): if a fixed Y triangle has a common S
neighbor in N_x, at least one of its three pairs to x is a nonedge. Two
already forced edges force the third pair to be a nonedge. These implications
refer to actual B pairs. They do not assert membership in witness-defined
forced-pair graphs F or H from the averaging notes.

At a C5 overlap, the P3 endpoints from the extension classification give a
particularly explicit version of (ii):

| Edge-cell extension | Missed S set S-(N_p union N_q) | Consequence |
| --- | --- | --- |
| A or B | cycle edge {s_3,s_4} | Every y in Y omitting s_3 or s_4 must join p or q |
| C or D | singleton {s_4} | Every y in Y omitting s_4 must join p or q |

Here “omitting” means membership in D_y. This yields a mixed obligation even
when no isolated pair of cells exceeds its Ramsey size cap.

## A precise limit of pair-only overlap tests

<a id="claim-isolated-mixed-pair-limit"></a>
Claim ID: `n43/d18/cell_intersections.md#claim-isolated-mixed-pair-limit`
Kind: local-deduction
Review state: accepted
Scope: the graph H in the preceding claim, one x in X and one y in Y
Dependencies: S union {x} triangle-free; S union {y} has no I3
Conclusion: H[S union {x,y}] is (5,4)-free for either choice of the pair xy
Search use: none pending independent review; proposed use: research planning
Reviews: [review](review_cell_intersections_20261015_obligations.md)

Proof. Any forbidden subset would have to contain both x and y, since their
individual S extensions have the stronger stated types. A K5 would then
need three S vertices, a prohibited triangle in S. An I4 would need two S
vertices in D_y, but D_y is a clique. Both cases are impossible, independently
of xy. Equivalently, neither condition (ii) nor (iii) can be triggered by
one vertex on each exclusive side.

This rules out an obstruction arising from this isolated mixed pair and S
alone. It does not rule out forced xy choices from actual A anchors, other
vertices, column intersections, or global degree constraints. In particular,
the exact mixed test explains why retaining a pair of X vertices or a triangle
of Y vertices adds information that an isolated X,Y signature test misses.

## Self-audit and use limits

The author rechecked the clique and independence sides separately. T is
triangle-free/I4-free; U is K5-free/I3-free; the common S is (3,3)-free.
No I4 prohibition is imposed on A. The overlap table uses only bounded-degree
path/cycle arguments. The edge-cell classification covers all triangle-free
graphs on three named outside vertices by their number of edges and proves
sufficiency by forbidden-subset partitions, rather than treating the necessary
patterns as examples that exhaust themselves.

The exact mixed characterization partitions every possible forbidden subset
according to whether it meets S,X,Y. Its necessity witnesses have order four
for independence and order five for cliques, matching B's ambient type.
All external incidence sets are actual signatures. No averaging assumption
asserts that |S|=5 or |T|=8 must occur. The C5 tables are conditional filters;
the exact characterization applies to every smaller intersection as well.
Independent review is still required before these draft claims are used for
pruning. No literature novelty check or certified order-43 exhaustion occurred.
