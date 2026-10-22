# The fifteen-vertex core and its interface in d18k3

Date: 2026-10-19. Task: `d18k3-core-interface-20261019`.
Research note; all seven claims independently **accepted** in the
[exact-revision review](review_core_interface_20261019_main.md). No graph search,
solver, catalogue processing, download, installation, or novelty review was
performed. The explicit modular graph below is proved directly, not asserted
to extend to an order-43 graph.

## Setting and recorded premises

Let G be a simple order-43 graph with neither K5 nor I5. Fix a degree-18
vertex v and write

```
A=N(v)=U disjoint-union C,   U={u1,u2,u3} inducing K3,
|C|=15,   U anticomplete to C,   |B|=|M(v)|=24,
e=e(C) in [50,55],   a=e(A)=e+3 in [53,58].
```

Here C is (4,4)-free. Put epsilon_z=d_G(z)-18, so all epsilon_z are in
[0,6]. For u in U, R_u=N_B(u), |R_u|=15+epsilon_u and
0<=epsilon_u<=2. For c in C put d_c=d_C(c), r_c=|N_B(c)|. For y in B put

```
T_y=N_C(y),   M_y=C-T_y,
k_y=|N_U(y)|,   D_y=U-N_U(y).
```

Dependencies retained as recorded, not recertified:

- [Connectivity claims 01--03](../neighborhood_connectivity.md#claim-connectivity-01),
  including the disconnection shape, census interval, row cap, and the fact
  that a column missing a U vertex meets every independent triple of C.
- [Reduction index](../../reductions.md), sections 4.1--4.4, 5.1--5.4:
  global degrees 18..24; B is (5,4)-free; every row has size at most 17;
  adjacent A rows intersect in at most eight vertices; and the critical-cell
  regularity statements. In particular a 13-vertex (3,5)-free graph is
  4-regular, so its complementary (5,3)-free graph is 8-regular.
- R(3,4)=R(4,3)=9 and R(3,3)=6; the published (4,4) edge intervals
  50..55 on 15 vertices and 60..60 on 16 vertices, recorded in the
  connectivity note. No census membership is assumed from edge counts alone.
- The elementary [eight-vertex calculation](../x136/small_columns.md#4-the-eight-vertex-boundary-for-nonadjacent-size-five-columns):
  a (4,3)-free graph on eight vertices has degrees 4 or 5, with exactly
  0, 2, or 4 vertices of degree 5 and hence 16..18 edges. Its complementary
  (3,4)-free graph has degrees 2 or 3 and 10..12 edges. Although its source
  discusses the frontier, this calculation uses only the stated eight-vertex
  graph type, not x=136.

The maximum-edge root condition used in Claim 4 is **additional**. It may
be chosen for existence coverage of the whole degree-18 branch, but is not
an assumption on an arbitrary rooted d18k3 instance.

<a id="claim-k3-core-01"></a>
## 1. Core degrees and the first sharp column bound

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-01`  
Kind: local-deduction  
Review state: accepted
Scope: every graph and every core/column in the setting above  
Dependencies: recorded core type; R(3,4)=9; eight-vertex calculation  
Conclusion: every c in C has d_c in {6,7,8}. If n_j counts degree-j
vertices in C, then

```
n6+n7+n8=15,   2*n6+n7=120-2*e.
17-d_c <= r_c <= 23-d_c.
```

If k_y<=2, then |T_y|>=7. At equality |T_y|=7, C[M_y] is (4,3)-free on
eight vertices, has degrees 4 or 5 and 16..18 edges. The lower bound seven
is attained by an explicit core and a single valid partial-graph column
in Claim 7; it cannot be replaced by eight using only those local premises.  
Search use: propagate  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. N_C(c) is triangle-free, since a triangle there with c gives K4;
it is I4-free by heredity. Thus d_c<=8. The 14-d_c nonneighbors of c
inside C contain no independent triple (otherwise adjoining c gives I4)
and no K4. R(4,3)=9 therefore gives 14-d_c<=8, or d_c>=6. Handshake
and subtracting the degree sum from 15*8 give the displayed identities.
The full degree identity is d_G(c)=1+d_c+r_c, which gives the row bounds
from 18<=d_G(c)<=24; here 23-d_c<=17 automatically.

If y misses u in U, then an independent triple in M_y together with u,y
is I5. Thus alpha(C[M_y])<=2. This graph is K4-free as an induced
subgraph of C, so |M_y|<=8 and |T_y|>=7. At equality apply the elementary
eight-vertex calculation. This does not impose the (4,3) type on all of C.

<a id="claim-k3-core-02"></a>
## 2. Joint missing columns have much smaller common residuals

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-02`  
Kind: local-deduction  
Review state: accepted
Scope: every independent Q subset B of size q in {1,2,3} with a common
missed U vertex; all residual sets refer to the actual columns  
Dependencies: K5/I5 prohibitions; core type; Claim 1  
Conclusion: put M_Q=intersection_(y in Q) M_y. Then

```
q=1: alpha(C[M_Q])<=2, |M_Q|<=8;
q=2: M_Q induces a clique, |M_Q|<=3;
q=3: M_Q is empty.
```

In particular nonadjacent y,z sharing a missed U vertex satisfy
|T_y union T_z|>=12. If both columns have seven C neighbors, then
|T_y intersect T_z|<=2. If three independent such columns each have seven
C neighbors and share a missed U vertex, their three pairwise M
intersections are disjoint triangles of order three, their triple M
intersection is empty, and their M union is all of C. Exactly nine core
vertices occur in two M sets and six occur in one, two singly occurring
vertices for each M set.  
Search use: propagate  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. Choose u in intersection_(y in Q) D_y. If M_Q contained an
independent set of size 4-q, that set together with u and Q would be I5:
U is anticomplete to C, u misses Q, and M_Q misses Q. Hence
alpha(C[M_Q])<=3-q. At q=1 use R(4,3)=9. At q=2 independence number at
most one means a clique, whose order is at most three by K4-freeness.
At q=3 there can be no vertex. The two union/intersection bounds follow
by taking complements in C and using |T_y|=|T_z|=7 where stated.

For the last assertion write M1,M2,M3, each of size eight. Every pairwise
intersection has at most three vertices and the triple intersection is
empty. Inclusion-exclusion gives

```
15 >= |M1 union M2 union M3|
   =24-|M1 intersect M2|-|M1 intersect M3|-|M2 intersect M3| >=15.
```

All bounds are equalities. Each pair intersection is therefore a
three-clique, and they are mutually disjoint. In each M_i, its two pair
intersections account for six of its eight vertices, leaving two that
occur only there. This is a necessary configuration, not an existence
assertion or a proof that these triangles can be completed inside C.

<a id="claim-k3-core-03"></a>
## 3. Cross-degree supply required by the core transversals

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-03`  
Kind: local-deduction  
Review state: accepted
Scope: the arbitrary-root setting; no canonical-root assumption  
Dependencies: Claim 1; degree identities  
Conclusion: let E_U=sum_U epsilon_u, E_C=sum_C epsilon_c, and
h=|{y in B:k_y<=2}|. Then

```
e(C,B)=255+E_C-2*e >=7*h,
E_C >= max(0,7*h-255+2*e),
x=e(A,B)=300+E_U+E_C-2*e.
```

Every column with k_y<=2 also satisfies d_B(y)<=17-k_y. These are
simultaneous necessary bounds, not an independent choice of every column.  
Search use: propagate  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. Sum r_c=17+epsilon_c-d_c over C and use sum_C d_c=2e.
Double-count e(C,B) as sum_B |T_y| and apply Claim 1 to the h columns.
The U rows sum to 45+E_U, giving x. Finally
24>=d_G(y)=d_B(y)+k_y+|T_y|>=d_B(y)+k_y+7 for each indicated column.

<a id="claim-k3-core-04"></a>
## 4. An excess-zero U vertex gives a strictly denser degree-18 reroot

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-04`  
Kind: local-deduction  
Review state: accepted
Scope: arbitrary-root setting for the reroot statement; the final
specialization additionally assumes v maximizes e(G[N(w)]) among all
degree-18 vertices w of the same graph G  
Dependencies: 15-vertex (4,4) census; row intersection cap; degree identities;
[maximum-edge root selection](../cliques_augmentation.md#3-choosing-a-pivot-by-neighborhood-edge-count)  
Conclusion: if epsilon_u=0 for u in U, and U-u={w,z}, then

```
e(G[N(u)]) >=65+epsilon_w+epsilon_z > e(G[N(v)]).
```

Moreover N(u) is connected. Consequently a maximum-edge degree-18 root
with a d18k3 neighborhood must have epsilon_u=1 for every u in U. In that
specialization B partitions into three sets H_i of size eight, where H_i
consists exactly of the vertices missing u_i and adjacent to the other
two U vertices. In particular every B column has k_y=2.  
Search use: propagate/branch; the root replacement is only for existence
coverage, not deletion of arbitrary rooted instances  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. For epsilon_u=0, |R_u|=15. R_u is (4,4)-free: a K4 with u gives
K5, and an I4 is forbidden inside B. Hence e(R_u)>=50. The neighborhood
of u is {v,w,z} union R_u. Its first three vertices induce a triangle;
v has no B neighbors, and the remaining cross edges number
|R_u intersect R_w|+|R_u intersect R_z|. Since |B|=24,

```
|R_u intersect R_w| >=(15)+(15+epsilon_w)-24=6+epsilon_w,
|R_u intersect R_z| >=6+epsilon_z.
```

Adding gives the claimed lower bound, which exceeds a<=58.
A (4,4)-free graph on 15 vertices is connected: if disconnected, the
positive independence numbers of its components sum to at most three.
A component of independence one is a clique of size at most three; a
component of independence at most two has size at most eight by
R(4,3)=9. Every disconnected partition of an independence sum at most
three therefore has total order at most 3+8=11. Thus R_u is connected,
and w,z each have at least six neighbors in it, so N(u) is connected.

At a maximum-edge degree-18 root the strict inequality rules out all
excess-zero U vertices. For any distinct U vertices, the lower overlap
6+epsilon_u+epsilon_w is at most eight. Since each excess is now at least
one, all three are one. Each row has size 16 and each pair intersection
has size eight (both the lower and upper bounds). If t is the triple
intersection size, inclusion-exclusion gives |R_1 union R_2 union R_3|
=48-24+t=24+t. Hence t=0 and the union is B. No point is in only one
row, since each pair of rows has union B. Thus each point is in exactly
two rows, and the three missing-one classes have size eight.

This argument leaves all arbitrary-root cases with an excess-zero U
vertex live as rooted instances, but transfers their ambient graph to a
degree-18 root with a connected, strictly denser neighborhood. It is not
an unconditional exclusion of the original graph or of the remaining
all-excess-one case.

<a id="claim-k3-core-05"></a>
## 5. Exact core and B excess budgets in the three-block specialization

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-05`  
Kind: local-deduction  
Review state: accepted
Scope: any graph in the setting satisfying the three size-eight H_i
partition in Claim 4; maximum-edge root selection is sufficient, not
otherwise needed  
Dependencies: Claims 1, 3, 4; 16-vertex (4,4) census; eight-vertex calculation;
[accepted common-eight classification](../large_row_extensions.md#claim-common-eight-classification)  
Conclusion: let w=e(B), h_i=e(B[H_i]), E_B=sum_B epsilon_y,
W=sum_(z in G) epsilon_z, and L=sum_B (|T_y|-7). Then

```
10<=h_i<=12,
e(H_i,H_j)=60-h_i-h_j,
w=180-(h_1+h_2+h_3) in [144,150],
each H_i is one of the three explicitly specified graphs S10,S11,S12,
11<=d_B(y)<=14,   7<=|T_y|<=22-d_B(y),
20<=d_G(y)<=24 for every y in B,
L>=0,
e(C,B)=168+L,
E_C=2*e-87+L,
E_B=2*w-216+L,
x=216+L,
0<=L<=min(177-2*e,360-2*w),
W=2*(e+w)-300+2*L >=88.
```

In particular E_C>=13..23 as e ranges from 50 to 55, and E_B>=72..84
as w ranges from 144 to 150. The bounds are indexed by the actual e,w;
they are not assertions that every pair e,w or every scalar profile is
realizable.  
Search use: propagate  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. H_i is the common B neighborhood of two U vertices. It is
triangle-free (a triangle there with those two U vertices gives K5) and
I4-free by heredity from B. The eight-vertex calculation in complementary
form gives internal degrees 2 or 3 and 10..12 edges.
The accepted common-eight classification further identifies each block,
up to isomorphism, with exactly one of S10, S11, S12; these labels specify
the entire internal graphs, not merely their edge counts. Thus there are
ten unordered multisets of three internal block types, with all labelings
and all still-undetermined interblock edges retained.

Each H_i union H_j is a U row of size 16, hence (4,4)-free with exactly
60 edges. A (4,4)-free graph on 16 vertices has degrees 7 or 8: the
neighborhood and nonneighborhood of a vertex have order at most eight
by R(3,4)=R(4,3)=9. Its degree sum 120 in particular means eight vertices
of each degree. The edge identity for a pair union and summing over the
three pairs give the formulas for e(H_i,H_j) and w. For y in H_i its
degrees in H_i union H_j and H_i union H_k are each 7 or 8, and their
sum counts d_(H_i)(y) twice. Subtracting that internal degree (2 or 3)
gives 11<=d_B(y)<=14.

Every column has two U neighbors and misses the third. Claim 1 gives
|T_y|>=7, while d_G(y)=d_B(y)+2+|T_y|<=24 gives the upper bound. The
lower full degree is 11+2+7=20. Summing the C attachments gives 168+L.
Compare with Claim 3 to obtain E_C. Summing full degrees on B gives

```
432+E_B=2*w+48+(168+L),
```

which proves the E_B identity; x additionally includes the 48 U edges.
Finally E_C<=15*6=90 gives L<=177-2e. Summing
|T_y|-7<=15-d_B(y) gives L<=360-2w. Since epsilon_v=0 and E_U=3,
W=3+E_C+E_B=2(e+w)-300+2L, whose minimum over the displayed scalar
bounds is 2*(50+144)-300=88. Equality requires e=50,w=144,L=0,
E_C=13,E_B=72, and every H_i of type S12. These scalar conditions are
not an ambient graph construction. Nothing here proves compatibility
of the individual attachment sets.

<a id="claim-k3-core-06"></a>
## 6. Pointed core attachments to every block and their equality cells

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-06`  
Kind: local-deduction  
Review state: accepted
Scope: the three-block specialization of Claim 5; every c in C and every i  
Dependencies: Claims 1, 4, 5; R(3,3)=6; critical-cell regularity  
Conclusion: put r_i(c)=|N(c) intersect H_i| and
F_i(c)=H_i-N(c). Then

```
r_i(c)>=3,
G[F_i(c)] is triangle-free and I3-free.
```

If r_i(c)=3, the five vertices F_i(c) induce C5. In particular a core
vertex of core degree eight and global degree 18 has exactly three
neighbors in each H_i and leaves an induced C5 in every H_i.

If d_c=6 and r_i(c)=3, put Z=C-({c} union N_C(c)), so |Z|=8. Then
G[Z union F_i(c)] is an 8-regular (5,3)-free graph on 13 vertices,
e(C[Z])=17, and e(Z,F_i(c))=30. In C[Z] exactly two vertices have degree
five and six have degree four.  
Search use: propagate  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. Since u_i and c are nonadjacent, any independent triple in
F_i(c) would form I5 with them. Thus F_i(c) is I3-free; it is triangle-free
as a subset of H_i. R(3,3)=6 gives |F_i(c)|<=5, proving r_i(c)>=3.
A triangle-free I3-free graph on five vertices is C5: each neighborhood
is independent, so each degree is at most two; each nonneighborhood is
a clique of size at most two, so each degree is at least two. It is
therefore a 2-regular graph on five vertices, necessarily C5. If d_c=8
and d_G(c)=18, its B degree is nine, forcing equality r_i(c)=3 for all i.

For the final assertion the common nonneighbors of the independent pair
u_i,c are exactly Z union F_i(c): the other U vertices are adjacent to
u_i, and v is adjacent to both. It has 8+5=13 vertices and contains no
K5 or I3. Its complement is a critical 13-vertex (3,5)-free graph, hence
4-regular by the recorded premise. The original cell is 8-regular. Each
F_i(c) vertex has two neighbors inside its C5 and hence six in Z, giving
30 cross edges. C[Z] is (4,3)-free, with degrees four or five by the
eight-vertex calculation. If h vertices have degree five, its degree sum
is 32+h. Its cross degree sum into F_i(c), by 8-regularity, is 64-(32+h).
Equating this to 30 gives h=2 and e(C[Z])=17.

<a id="claim-k3-core-07"></a>
## 7. An explicit sharp local obstruction: a seven-vertex triple hitter

Claim ID: `research/n43/d18/k3/core_interface.md#claim-k3-core-07`  
Kind: local-deduction  
Review state: accepted
Scope: an explicit isolated core and one-column partial graph only; no
order-43 embedding, degree completion, or B graph is asserted  
Dependencies: direct modular arithmetic and the definitions below  
Conclusion: there is an explicit (4,4)-free C on 15 vertices with 53 edges
and a seven-set T meeting every independent triple. Moreover the
20-vertex partial graph on {v} union U union C union {y}, with the required
v/U/C relations and N(y)=two vertices of U union T, is (5,5)-free.
Therefore those local conditions alone cannot force |T|>=8 or exclude
all single-column attachments.  
Search use: none; obstruction to a stronger local inference, not an ambient witness  
Reviews: [independent exact-revision audit](review_core_interface_20261019_main.md)

Proof. On the residues modulo 17 define P by adjacency when the difference
belongs to

```
Q={1,2,4,8,9,13,15,16}={+/-1,+/-2,+/-4,+/-8}.
```

Translation preserves adjacency. The neighbors of zero are Q; their
induced adjacency lists are

```
1:  2,9,16       2:  1,4,15
4:  2,8,13       8:  4,9,16
9:  1,8,13      13:  4,9,15
15: 2,13,16     16:  1,8,15.
```

In this displayed graph no two neighbors of any vertex are adjacent, so
it has no triangle. A K4 in P could be translated to contain zero and
would then supply a triangle in this graph; hence P has no K4.
Multiplication by 3 takes Q to
{3,5,6,7,10,11,12,14}, exactly the nonzero residues outside Q. It is
therefore an isomorphism from P to its complement. Consequently P also
has no I4. Every vertex has degree eight, so e(P)=17*8/2=68.

Delete adjacent vertices 0 and 1 to obtain C. Then

```
|C|=15,   e(C)=68-8-8+1=53,
T=Q-{1}={2,4,8,9,13,15,16},
S=C-T={3,5,6,7,10,11,12,14}.
```

C inherits K4/I4-freeness. S consists of nonneighbors of zero in P; an
independent triple in S with zero would be I4 in P. Thus alpha(C[S])<=2
and T meets every independent triple of C.

For completeness verify all possible forbidden five-sets in the stated
partial graph H, rather than implying an ambient completion. Inside
A=U disjoint-union C, the largest clique has size at most three and the
largest independent set at most four. A K5 containing v cannot contain y,
since vy is a nonedge, and would require a K4 in A. A K5 containing y
but not v would require a K4 in N_A(y), which is the disjoint union of a
K2 and C[T], each of clique number at most three. Thus H has no K5.
An independent five-set containing v cannot use A and has size at most
two. One containing y but not v would require an independent four-set
in A-N(y); this graph is the disjoint union of the one missed U vertex
and C[S], of independence number at most 1+2=3. An independent five-set
using neither v nor y lies in A, whose independence number is at most
four. This exhausts all cases, proving H is (5,5)-free. H does not satisfy
43-vertex degree requirements and is not offered as a completion.

Fixed-object validation (explicitly requested, not candidate generation):
Python `itertools.combinations` traversed all 1,365 four-subsets of C,
all 455 triples of C, and all 15,504 five-subsets of H. For each subset
the source counted its present unordered pairs using exactly the modular
and v/U/y edge recipe above. Four-subsets with edge count 0 or 6 were
counted as I4 or K4; five-subsets with edge count 0 or 10 as I5 or K5.
Independent triples were additionally tested for intersection with T.
The complete output counts were:

```
C: vertices=15, edges=53, four-subsets=1365, K4=0, I4=0;
C: triples=455, independent-triples=44, unhit-independent-triples=0;
H: vertices=20, edges=83, five-subsets=15504, K5=0, I5=0.
```

For an exact finite-object encoding, relabel old core residue j to j-2,
v to 15, u1,u2,u3 to 16,17,18, and y to 19, with y adjacent to u1,u2
and T. Encode UTF-8 bytes `20\n` followed by all edges `(a,b)`, a<b,
in lexicographic order as `a b\n`. The SHA-256 of those bytes is
`e711eefcf05d41e4101ebb5f064e377d45339dc185600d24c4a1e9cb725c92fa`.
This exhaustive fixed-graph validation does not test, certify, or assert
any completion by another 23 B vertices.

## Residual question and status

These deductions do not close d18k3. Arbitrary roots with an excess-zero U
vertex have a rigorous reroot escape, not a contradiction. With a
maximum-edge degree-18 root, the remaining case has three eight-vertex
B blocks and the exact core/degree budgets above. What is not proved is
existence or nonexistence of simultaneous C-to-B attachments satisfying
all independent-pair/triple obligations, clique obligations, row types,
and every global degree, together with that root-selection condition.
The seven-set example proves a specific attempted local strengthening
false; it is not a witness for this simultaneous residual problem.

No executable pruning, navigation, acceptance status, or shared workflow
file is changed by this note. Independent review must name the exact
SHA-256 of this file before any new claim is promoted.
