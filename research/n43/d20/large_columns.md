# Saturated d20 with every column of size at least five

Date: 2026-10-22. Author: Main, working alone. The branch remains open.
The reductions below are ready for independent review. They give restrictions
on counts, equality cases and actual side graphs; no executable filter was added.

Let G be an order-43 K5/I5-free globally K5-saturated graph, n18(G)=0,
and d_G(v)=20. Put A=N(v), B=M(v), C_y=N_A(y), c_y=|C_y|,
s_u=d_A(u), r_u=d_B(u), t_y=d_B(y), epsilon_y=d_G(y)-19.
Here |A|=20, |B|=22, degrees range over 19..24, and **c_y>=5 for every y**.
All conclusions also hold when n24(G)=0, without complementing G.
Write a=e(A), b=e(B), x=e(A,B), and ell_j=|{y:c_y=j}|.

Dependencies: the [interface bounds](interface_bounds.md), including
nonedge column-union floor 12, K4 degree budget, side edge census and
Ramsey bounds; the elementary K5/I5 and saturation witnesses.
For Claim 3, the (4,4,15) upper edge bound 55 is the published premise
recorded in the [root table](../../../README.md). No core uniqueness is assumed.
Validation is an author's self-check, not independent acceptance.

<a id="claim-d20-five-six-counts"></a>
## 1. Five- and six-columns have simultaneous count bounds

Claim ID: n43/d20/large_columns.md#claim-d20-five-six-counts  
Kind: local-deduction  
Review state: ready  
Scope: the stated large-column branch; saturation is unnecessary for the count inequalities  
Dependencies: column-union floor 12; K5/I4 type of B; K5 prohibition  
Conclusion: table and vertexwise incidence inequalities below  
Search use: none pending review; proposed propagation and branching  
Reviews: none

Let Q={y:c_y=5}, Y={y:c_y=6}, k=|Q|, h=|Y|. Any two members of Q
are adjacent, and every member of Y is adjacent to every member of Q:
the respective column-size sums are 10 and 11, below 12. Hence Q is
a clique, k<=4, and k=4 forces h=0. If k=4 the K4 degree budget gives
20=sum_Q c_y>=20+sum_Q epsilon_y, so all four endpoints have degree 19.
For k>=2, the pair budget also gives epsilon_y+epsilon_z<=2 for y,z in Q.

For u in A define m_u=|N(u) intersect Q| and f_u=|N(u) intersect Y|.
Any two six-columns containing u overlap, have union at most 11, and
therefore have adjacent endpoints. Thus N(u) intersect Y is a clique.
Together with Q it is a clique in B, giving f_u<=4-k. Together with
N(u) intersect Q and u it gives a clique in G, giving f_u+m_u<=3.
Therefore

    f_u <= min(4-k,3-m_u),
    6h=sum_A f_u <= sum_A min(4-k,3-m_u),
    sum_A m_u=5k.                                           (1)

In particular:

| k=ell5 | Upper bound for ell6 | Sharper actual-overlap bound |
| ---: | ---: | --- |
| 0 | 10 | 6h<=60 |
| 1 | 9 | 6h<=55 |
| 2 | 6 | 6h<=40-n2, where n2=|C_y intersect C_z| for Q={y,z} |
| 3 | 3 | 6h<=20-n3, where n3=|intersection_(y in Q) C_y| |
| 4 | 0 | Y is empty and all Q endpoints have degree 19 |

For k=2, m_u in {0,1,2} and only m_u=2 reduces the cap 2 by one.
For k=3, only m_u=3 reduces the cap 1 by one. This proves the table.
Any pair of nonadjacent six-column endpoints has **disjoint** columns,
because their union must have size at least 12 and both columns have size 6.

The endpoint configurations also retain equality information:

* k=0,h=10 forces f_u=3 at every one of the 20 A vertices. Each A vertex
  then names an actual triangle in B[Y], and each Y vertex occurs in six
  of these 20 triangle incidences. Repeated triangles are retained.
* k=1,h=9 forces sum_A(3-m_u-f_u)=1: exactly one A vertex has a deficit
  of one from its cap, and all others attain their cap.
* k=2,h=6 forces n2<=4 and total deficit 4-n2 from the displayed caps.
* k=3,h=3 forces n3<=2. The three Y vertices are independent, because
  they are complete to Q=K3 and an edge between them would make K5.
  Their three six-columns are pairwise disjoint. The two remaining A
  vertices are adjacent, since otherwise they and Y would make I5.
  Thus A splits into three six-column sets and a K2 on the remaining two
  vertices. All other side and cross constraints still apply.

The resulting count region is a strict restriction on the previous
large-column category. It does not assert that any endpoint is realizable.
In particular, ell5=0 is retained, and ell5=ell6=0 (all columns >=7) remains.

<a id="claim-d20-four-five-frame"></a>
## 2. Four five-columns force an exact B partition

Claim ID: n43/d20/large_columns.md#claim-d20-four-five-frame  
Kind: local-deduction  
Review state: ready  
Scope: the stated branch with ell5=4  
Dependencies: Claim 1; K4 degree-budget proof; R(3,4)=9  
Conclusion: mandatory 4+8+10 B frame, constrained group sizes and local cell domains  
Search use: none pending review; proposed exact partial-side reduction  
Reviews: none

Label Q={q0,q1,q2,q3}. Every q_i has c=5, degree 19 and t=14,
so sum_Q t=56. In the K4 budget proof this is equality:

    e(Q,B-Q)=56-12=44=8*3+10*2.

An outside B vertex misses at least one q_i. Each exact singleton
missing-signature class E_i is independent (an edge there plus the other
three q's makes K5), and has size at most two (three independent members
and q_i make I4). Equality forces |E_i|=2 for every i and every remaining
vertex to miss exactly two Q vertices. Let F_ij consist of vertices missing
exactly q_i,q_j, and put f_ij=|F_ij|. Then

    B = Q disjoint-union E0 disjoint-union E1 disjoint-union E2
        disjoint-union E3 disjoint-union (union_(i<j) F_ij),
    |Q|=4, |union E_i|=8, sum_(i<j) f_ij=10,
    sum_(j!=i) f_ij=5 for every i.                           (2)

The row sum follows because q_i has 21-14=7 B nonneighbors, of which
exactly two are E_i. Solving these four equations gives

    f01=f23, f02=f13, f03=f12,
    f01+f02+f03=5.

For distinct i,j with complement indices l,m, the common B neighborhood
of the **edge** q_iq_j is exactly

    {q_l,q_m} disjoint-union E_l disjoint-union E_m
        disjoint-union F_lm.

It is triangle-free/I4-free and has size 6+f_lm<=8, so f_lm<=2.
Together with (2) this forces the three opposite-pair sizes to be 2,2,1.
After one simultaneous permutation of Q, they may be written

    f01=f23=1, f02=f13=f03=f12=2.                             (3)

The chosen permutation must act on all incident state, including the A-Q
columns; it does not license independent signature normalization.

Within a common edge cell, q_lq_m is an edge; E_l,E_m are independent
pairs; q_l sees all E_m and misses E_l, q_m sees all E_l and misses E_m;
both q_l,q_m miss F_lm. These are all fixed adjacencies within that cell.
The remaining possibilities form small **labelled** domains:

| |F_lm| | Unfixed pairs in its common edge cell | Triangle-free/I4-free possibilities | Cell edge counts |
| ---: | ---: | ---: | --- |
| 1 | 8 | 40 | 8,9,10 |
| 2 | 13 | 48 | 10,11,12 |

The retained enumeration tests all 2^8 or 2^13 assignments directly.
This is a finite local domain result. The six common cells must be imposed
on the **same** B graph, with their overlapping pairs identified; their
choices are not independent. Remaining pairs, B's full K5/I4 constraints,
and all A and cross obligations remain. The frame is necessary, not a
sufficient construction of B or G.

A further census-free restriction follows at once. Within a cell with
|F|=2 the E_l-E_m bipartite graph is a matching of size one or two.
The finite table checks every labelled assignment and establishes this restriction. The |F|=1
cells retain any nonempty noncomplete E_l-E_m bipartite graph. Globally,
this reduces the 24 E-E pairs to at most 14^2*6^4=254,016 combinations;
45,912 of those avoid I4 on the eight E vertices. No further B-pairs are
fixed by this count. This is enumeration of a small necessary E-subgraph
cover, not complete B enumeration.

<a id="claim-d20-five-column-density"></a>
## 3. Dense A restricts which five-column shapes can occur

Claim ID: n43/d20/large_columns.md#claim-d20-five-column-density  
Kind: local-deduction  
Review state: ready  
Scope: any actual five-column S=C_y in the stated saturated branch  
Dependencies: (4,4,15) maximum 55; R(3,4)=9; K4/I5 avoidance in A  
Conclusion: a<=95+e(S)-h(S), with the finite shape restrictions below  
Search use: none pending review; proposed column-domain propagation  
Reviews: none

Put H=A-S, f_u=|N_H(u)| for u in S, and p=e(S). H is K4/I4-free
on 15 vertices because S meets every I4 of A. Thus e(H)<=55.
Each N_H(u) is triangle-free/I4-free, so f_u<=8. Saturation supplies
at least one triangle in S, and S itself has no K4.

For an edge uw in S let lambda_S(uw) be its number of common S-neighbors.
Those neighbors are independent. The common H-neighbors of uw are also
independent and anticomplete to the common S-neighbors (otherwise K4).
Since A has no I5,

    |N_H(u) intersect N_H(w)| <= 4-lambda_S(uw).

For a triangle T in S, the three H-neighborhoods have empty triple
intersection. Inclusion-exclusion and |H|=15 give

    sum_(u in T) f_u
       <=15+sum_(uw edge T)(4-lambda_S(uw))
       =24-sum_(uw edge T)(lambda_S(uw)-1).

Define h(S) as the maximum of the last sum over triangles T in S.
It is nonnegative. Adding f_u<=8 for the other two S vertices proves

    e(S,H)<=40-h(S),
    a=e(H)+p+e(S,H)<=95+p-h(S).                              (4)

All 1,024 labelled five-vertex graphs can be checked directly. Exactly
15 isomorphism types are K4-free and contain a triangle. To specify the
complete shape table reproducibly, encode edges by bits in lexicographic
order 01,02,03,04,12,13,14,23,24,34; use the minimum integer over all
120 permutations as the representative. The table records the local cap
from (4); the separate global cap a<=100 still applies.

| Representative | p | h(S) | Cap from (4) |
| ---: | ---: | ---: | ---: |
| 19 | 3 | 0 | 98 |
| 23 | 4 | 0 | 99 |
| 31 | 5 | 0 | 100 |
| 55 | 5 | 1 | 99 |
| 59 | 5 | 0 | 100 |
| 63 | 6 | 1 | 100 |
| 127 | 7 | 2 | 100 |
| 184 | 4 | 0 | 99 |
| 185 | 5 | 0 | 100 |
| 187 | 6 | 1 | 100 |
| 207 | 6 | 0 | 101 |
| 221 | 6 | 0 | 101 |
| 223 | 7 | 2 | 100 |
| 254 | 7 | 1 | 101 |
| 495 | 8 | 2 | 101 |

At a=100, four of these 15 shapes are excluded: a triangle with two
isolated vertices; a paw with an isolated vertex; a triangle disjoint
from an edge; and a diamond with an isolated vertex (representatives
19,23,184,55 respectively). Eleven shape types remain before interface
checks. At a=99 the triangle with two isolated vertices is excluded.
These are shape exclusions, not exclusions of the entire a=99 or a=100 branch.

More generally, a given shape needs 45-p <= e(S,H) at a=100,
while (4) supplies its upper bound. This can be applied vertexwise to
the actual attachments, rather than replacing the full side by a shape count.

<a id="claim-d20-triangle-resources"></a>
## 4. Shared triangles constrain sizes; nonadjacent six-columns expose an eight-core

Claim ID: n43/d20/large_columns.md#claim-d20-triangle-resources  
Kind: local-deduction  
Review state: ready  
Scope: the stated large-column branch; the shared-triangle rule does not need saturation  
Dependencies: column-union floor 12; K5 prohibition; saturation for the B blocker;
[accepted eight-cell classification](../d18/large_row_extensions.md#claim-common-eight-classification) for the three core types  
Conclusion: triangle-resource and nonedge six-column reductions below  
Search use: none pending review; proposed column compatibility and conditional side reduction  
Reviews: none

If a triangle T of A is contained in both C_y and C_z, then yz must be
a nonedge, or T+y+z would be K5. The nonedge union floor gives

    12 <= |C_y union C_z| <= c_y+c_z-3,
    c_y+c_z >= 15.                                         (5)

In fact their overlap is at most c_y+c_z-12. Thus no triangle in a
five-column occurs in any other column of size at most nine; no triangle
in a six-column occurs in another column of size at most eight; and no
two columns of size at most seven share a triangle. This concerns all
triangles of a column, not merely one chosen saturation witness.

Let t(C) count the triangles of A[C] and t(A) those of A. For the actual
small columns this gives the disjoint-resource cut

    sum_(y:c_y<=7) t(C_y) <= t(A).                           (6)

Saturation makes every summand positive. More generally, proposed domains
for columns of size at most seven must admit distinct witness triangles.
If D_y is the set of possible witness triangles for a named occurrence
in such a domain, every subfamily J needs |union_(y in J) D_y|>=|J|.
A failing subfamily is an explicit matching obstruction, provided each
D_y includes every witness still possible for that occurrence. Independent
column normalization or deletion of unexamined triangle choices is not sound.
Equation (5) is an adjacency-independent compatibility filter on two fully
specified columns; it rejects the pair before choosing the B edge.

For nonadjacent six-column endpoints y,z, C_y and C_z are disjoint by
Claim 1. Their leftover H=A-(C_y union C_z) has order eight and type
K4/I3-free. Its complement is therefore one of the three graphs S10,
S11,S12 in the accepted universal eight-cell classification. Consequently

    e(H) in {18,17,16}.

This replaces an unconstrained eight-vertex graph by a three-type cover,
with all relative labels retained. For example, in the k=3,h=3 endpoint
of Claim 1 the core for each pair of Y vertices consists of the third
six-column together with the remaining K2. That distinguished K2 must
be retained in the eight-core labelling, and all three pair cores must
agree on their overlapping A pairs.

Because y,z have disjoint A-neighborhoods and neither sees v, their common
ambient neighborhood is entirely in B. Global saturation of yz therefore
requires an actual triangle in N_B(y) intersect N_B(z). This cannot be
supplied by any cross edges. A fixed B graph with a locally K5-safe
nonedge cannot place two six-column endpoints on that pair. This condition
can be checked before completing A-B; it is automatic from Q in the
k=3,h=3 endpoint, since those Y vertices all see Q=K3.

## What remains

These reductions supply count filters throughout the branch, a rigid B frame
when ell5=4, equality configurations, density-sensitive five-column exclusions,
and shared-triangle compatibility filters. They do not eliminate ell5=0,
all columns >=7,
or every completion of any surviving case. The
[440-bit completion criterion](saturated_categorization.md#claim-d20-exact-saturated-completion)
remains the exact ambient obligation. No full branch exclusion is claimed.
The [dated report](../../reports/2026-10-22-d20-large-columns.md) records
validation and the limited exploratory optimization that guided the shape bound.
