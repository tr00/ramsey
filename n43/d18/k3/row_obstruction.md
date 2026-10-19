# A 17-row forces a unique K3 signature core

Date: 2026-10-19. Author: K3RowStructure. All three claims are independently
**accepted** in the [exact-revision review](review_row_obstruction_20261019_main.md). No novelty claim is made.
This is a mathematical deduction, not a graph search, solver run, catalogue
inspection, or existence certificate.

## Scope and notation

Let B be a K5-free, I4-free graph on 24 vertices. Adjoin a triangle
U={u1,u2,u3}, and specify its B-neighborhoods R1,R2,R3. Assume that
G[U union B] is K5-free and that 15<=|Ri|<=17 for each i. Thus every B[Ri]
is (4,4)-free, every B[Ri intersect Rj] is triangle-free and I4-free, and
B[R1 intersect R2 intersect R3] is independent. These are local hypotheses:
no order-43 completion is assumed in Claims 1--3 except in the explicitly
labelled degree corollary of Claim 2.

In the intended ambient application, G is K5/I5-free of order 43,
v has degree 18, A=N(v)=K3(U) disjoint-union C, |C|=15, B=M(v),
and all global degrees lie in 18..24. The row identity gives
|Ri|=15+(d_G(ui)-18), and the recorded row cap gives |Ri|<=17.
The intended C is (4,4)-free with 50..55 edges. Neither that edge interval
nor any property of C is used in Claims 1--3.

Dependencies retained as recorded, not recertified:

* R(3,4)=9 and R(3,3)=6.
* [Neighborhood connectivity](../neighborhood_connectivity.md),
  claims `claim-connectivity-01` and `claim-connectivity-03`, only to
  identify the ambient branch and row identity.
* [Reduction index](../../reductions.md), sections 5.2 and 5.4, for the
  recorded row and intersection bounds; their needed consequences are
  proved again below from the local hypotheses.
* [Large-row extensions](../large_row_extensions.md),
  `claim-common-eight-classification`, for the three exact eight-graph
  types, their edge counts, and the cubic type's S12 name. The forced
  signature, degree-11 conclusion, and disjoint-missed-clique inequalities
  do not need that isomorphism classification.

For audit provenance, the source SHA-256 values read for this derivation are:

```text
n43/d18/neighborhood_connectivity.md
b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0
n43/reductions.md
4d7ddf5fce27a8c569df443855262c8751505018e0e4828e915383b42405bdf9
n43/d18/large_row_extensions.md
43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3
n43/d18/k1/cross_core.json
772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d
```

The last file's `strict-seven-signature-budget` contains the general
17-core nonedge-packing argument reused and fully reproved in Claim 3;
its k1 ambient setting is not imported. The note follows
`docs/workflow.md`, SHA-256
`51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2`.

<a id="claim-k3-seventeen-signature"></a>
## 1. The zero-triple branch of a 17-row is impossible

Claim ID: `n43/d18/k3/row_obstruction.md#claim-k3-seventeen-signature`  
Kind: local-deduction  
Review state: accepted
Scope: the local hypotheses above, with |R1|=17  
Dependencies: R(3,4)=9; inherited local forbidden configurations  
Conclusion: |R2|=|R3|=15, and the eight U-signature cells have exactly the
sizes in the table below; in particular the triple intersection has size
one, not zero  
Search use: propagate; terminate only the |R1|=17, triple-intersection-zero
subbranch  
Reviews: [independent exact-revision audit](review_row_obstruction_20261019_main.md)

Write H=B[R1], T=B-R1, X=R1 intersect R2, and Y=R1 intersect R3.
Then |T|=7 and the forced partition is

| U-neighborhood | Cell | Size |
|---|---|---:|
| {u1,u2,u3} | {z}=X intersect Y | 1 |
| {u1,u2} | X-{z} | 7 |
| {u1,u3} | Y-{z} | 7 |
| {u2,u3} | T | 7 |
| {u1} | L=R1-(X union Y) | 2 |
| {u2} | empty | 0 |
| {u3} | empty | 0 |
| empty | empty | 0 |

Equivalently, after placing the 17-row first, the row-size excess pattern
(2,0,0) has exactly one possible signature-count pattern. This is a
necessary pattern, not a realization statement.

Proof. In a (4,4)-free graph, a neighborhood is triangle-free and I4-free,
and a nonneighborhood has no K4 or I3. R(3,4)=9, also applied after
complementation, bounds both orders by eight. Consequently every
17-vertex (4,4)-free graph is 8-regular. In particular H is 8-regular.

For j=2,3, the triangle-free I4-free cell R1 intersect Rj has size at most
eight. Therefore

```text
17+|Rj|-24 <= |R1 intersect Rj| <= 8.
```

The assumed lower bound |Rj|>=15 forces |Rj|=15 and equality throughout.
Hence |X|=|Y|=8, T is contained in both R2 and R3, and
R2=T union X, R3=T union Y. The cell R2 intersect R3 is
T union (X intersect Y), and again has size at most eight. Thus
|X intersect Y|<=1.

Suppose X and Y were disjoint. They would cover 16 vertices of H, leaving
one vertex w. Both H[X] and H[Y] are triangle-free. Thus N_H(w) intersect X
and N_H(w) intersect Y are independent sets. They partition all eight
neighbors of w. One part has at least four vertices, contradicting
I4-freeness of H. Therefore X intersect Y={z}. The table follows.

This argument proves a useful standalone obstruction: an 8-regular,
I4-free graph of order 17 cannot have its deletion of one vertex
partitioned into two induced triangle-free graphs.

<a id="claim-k3-shared-vertex-rigidity"></a>
## 2. The sole common vertex has three cubic links

Claim ID: `n43/d18/k3/row_obstruction.md#claim-k3-shared-vertex-rigidity`  
Kind: local-deduction  
Review state: accepted
Scope: Claim 1's local hypotheses and notation; the final C-degree
corollary additionally assumes the stated order-43 ambient setting  
Dependencies: Claim 1; R(3,4)=9; the common-eight classification for
e(S) in {10,11,12} and the S12 isomorphism names
Conclusion: the vertex z has exactly three neighbors in each of X-{z},
Y-{z},T, and both vertices of L; its B-degree is 11, and the additional
rigidity below follows  
Search use: propagate  
Reviews: [independent exact-revision audit](review_row_obstruction_20261019_main.md)

Put S=T union {z}=R2 intersect R3. Each of X,Y,S is a triangle-free,
I4-free graph of order eight. The conclusions are:

1. d_X(z)=d_Y(z)=d_S(z)=3, and z is complete to L.
2. d_R2(z)=d_R3(z)=6 and d_B(z)=11.
3. If D=N_T(z), then |D|=3 and D is independent. If T0=T-D,
   then |T0|=4 and B[T0] is one of 2K2, P4, C4. In particular
   e(T) is in {7,8,9}.
4. H[N_H(z)] is cubic, triangle-free and I4-free, hence S12.
   If M=R1-({z} union N_H(z)), then |M|=8 and H[M] is 4-regular
   with no I3; its complement is cubic, triangle-free and I4-free,
   hence also S12.
5. In the intended order-43 setting, z has exactly 3 neighbors in U,
   11 in B and none at v. Thus d_C(z)=d_G(z)-14 lies in 4..10.

Proof. A neighborhood in a triangle-free I4-free graph is independent
of size at most three. Since z has eight H-neighbors and L has only two
vertices,

```text
8=d_X(z)+d_Y(z)+d_L(z) <=3+3+2.
```

Equality forces d_X(z)=d_Y(z)=3 and d_L(z)=2.

Every vertex of a 15-vertex (4,4)-free graph has degree at least six:
its nonneighbors have no K4 or I3 and therefore number at most eight by
R(3,4)=9 after complementation. Apply this in B[R2] at z. It gives
3+d_T(z)>=6. But d_T(z)=d_S(z)<=3, so equality holds. This proves
items 1 and 2. Triangle-freeness of S makes D independent. Its four
nonneighbors T0 have no I3, since an I3 there together with z would be
I4 in S. They are also triangle-free. A triangle-free I3-free graph on
four vertices is 2K2, P4 or C4: its degrees are one or two, and the
only other maximum-degree-two possibilities on four vertices contain
an independent triple. The common-eight classification gives
e(S) in {10,11,12}; subtracting d_S(z)=3 yields e(T) in {7,8,9}.

For completeness, the codegree rigidity used in item 4 needs no census
uniqueness premise. In any 8-regular (4,4)-free H on 17 vertices an edge
has at most three common neighbors, since that common neighborhood is
independent. A nonedge has at most three common nonneighbors, since
those common nonneighbors form a clique. If c is its common-neighbor
count, its common-nonneighbor count is c-1, so c<=4. H has 68 edges
and 68 nonedges, and

```text
sum_{unordered xy} |N_H(x) intersect N_H(y)|
  =17*binom(8,2)=476=68*3+68*4.
```

Thus every bound is attained: edge codegree three, nonedge codegree four,
and every nonedge has a common-nonneighbor triangle. The neighbors of z
therefore induce a cubic triangle-free I4-free graph. Each a in M has
four neighbors in N_H(z), by nonedge codegree four, and hence four
neighbors in M. The graph H[M] has no I3, since z misses all of M.
Its complement has the asserted type. Item 5 is the degree partition
in the ambient graph and uses no edge-count premise for C.

<a id="claim-k3-twelve-vertex-residual"></a>
## 3. A twelve-vertex residual with disjoint missed cliques

Claim ID: `n43/d18/k3/row_obstruction.md#claim-k3-twelve-vertex-residual`  
Kind: local-deduction  
Review state: accepted
Scope: Claims 1 and 2's local hypotheses and notation  
Dependencies: Claims 1 and 2; R(3,3)=6; inherited K5/I4 prohibitions;
the common-eight classification for the final S10/S11/S12 descriptions
Conclusion: the four vertices of T0 have pairwise disjoint missed
cliques in M, with the edge covering inequality below; two simultaneous
critical eight-graphs give the further finite residual structure  
Search use: propagate  
Reviews: [independent exact-revision audit](review_row_obstruction_20261019_main.md)

For t in T0 put A_t=M-N_B(t), a_t=|A_t|. Then:

```text
A_t is a clique in H[M],       0<=a_t<=3;
A_t intersect A_s is empty     for distinct t,s in T0;
sum_{t in T0} a_t <=8;
e_B(T0,M)=32-sum_{t in T0} a_t >=24;
ts in E(B[T0]) implies a_t+a_s>=3.
```

In particular no two vertices with a_t<=1 are adjacent in B[T0], and
sum a_t>=6 if B[T0] is 2K2 or C4. If B[T0] is P4, the displayed
edge inequalities are retained without asserting that their sum alone
is a complete characterization.

There is also a useful exact local description of two additional
critical eight-vertex graphs. Set

```text
P=M intersect (X-{z}),       Q=M intersect (Y-{z}).
```

Then |P|=|Q|=4, M=P disjoint-union Q. Each of B[P], B[Q], B[T0]
is 2K2, P4 or C4. The two graphs

```text
F_P = complement(B[P union T0]),
F_Q = complement(B[Q union T0])
```

are triangle-free I4-free eight-graphs, hence each is S10, S11 or S12.
Every P-vertex has at most one neighbor in T0 in F_P; the analogous
statement holds for Q in F_Q. Their common induced graph on T0 is
complement(B[T0]). Also complement(H[M]) is the cubic S12. These are
simultaneous conditions on the same twelve named vertices, not
independent graph choices.

Proof. First establish the general 17-core nonedge-packing fact. Let
xy be a nonedge of H. Its three common nonneighbors form a triangle Z,
by Claim 2's codegree argument. If t outside H misses x and y, it must
be complete to Z: otherwise x,y,t and a missed vertex of Z form I4 in B.
Two distinct outside vertices t,s cannot both miss x,y. If ts is a
nonedge, x,y,t,s form I4. If ts is an edge, Z union {t,s} forms K5.
Thus every H-nonedge is missed by at most one outside vertex.

All t in T0 miss z. Since z also misses every vertex of M, the packing
fact applied to each nonedge za shows that at most one T0-vertex misses
a, for each a in M. This proves pairwise disjointness of the A_t and
the incidence bound. If a,b were nonadjacent vertices in one A_t,
then z,t,a,b would be I4 in B; hence A_t is a clique. H is K4-free,
so a_t<=3.

If ts is an edge of B[T0], their common neighbors in M cannot contain
a triangle, or that triangle with t,s would be K5. This common
neighborhood is exactly M-(A_t union A_s), because the A_t are disjoint.
It also has no I3, since H[M] has none. R(3,3)=6 gives
8-a_t-a_s<=5, proving the edge inequality. For 2K2, sum it over its two
disjoint edges. For C4, sum it over the four edges and divide by two.
These yield sum a_t>=6 in the two specified cases.

For the last description, z has three neighbors in X-{z} and three
in Y-{z}, so its eight H-nonneighbors split into P and Q of size four.
Each of H[P],H[Q] is triangle-free by membership in X or Y and I3-free
by membership in M. The same four-vertex classification applies.
The nonneighbors of z in R2 are precisely P union T0. Such a
nonneighborhood in a (4,4)-free graph has no K4 or I3. Taking its
complement gives F_P of the asserted type; R3 gives F_Q. Finally,
the previously proved packing fact says each a in P or Q misses at
most one t in T0, exactly the bound on those complementary cross
degrees.

## Residual branch and limits

This note excludes a genuine boundary signature: a 17-row with empty
triple intersection. It does **not** exclude a 17-row outright. The
remaining (2,0,0) excess branch has exactly the signature counts of
Claim 1, the forced shared-vertex degrees of Claim 2, and the
simultaneous twelve-vertex constraints of Claim 3. Whether that local
core exists, or extends to the remaining C-interface, is unresolved
here. No witness is asserted and no exhaustive forbidden-five-subset
check is claimed.

The row-size excess types with no 17-row, namely sorted types
(0,0,0), (1,0,0), (1,1,0), and (1,1,1), are intentionally unchanged by
this note. The elementary restriction e_i+e_j<=2, where e_i=|Ri|-15,
follows from |Ri|+|Rj|-24<=8; this lists all other sorted types.
Neither their feasibility nor their exclusion follows from the
17-core argument.
