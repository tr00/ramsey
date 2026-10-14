# Small columns in the degree-18 frontier

Date: 2026-10-14. Derived here and internally audited by separate set,
degree, and triangle counts. No solver, enumeration, download, or literature
novelty check was performed.

## Setting and premises

Let G be an order-43 (5,5)-free graph, v a degree-18 vertex,
A=N(v), B=M(v), and C_y=N_A(y) for y in B. Write x=136+k,
q=85-e(A). We use the recorded census bound e(A)<=85. The four-transversal
proof in `n43/d18/frontier_band.md`, using the published 15-vertex (4,4) minimum of
50 edges, gives |C_y|>=4 whenever q<=2. This includes all k<=5.

The overlap results below do not need the census; only the column-count and
cross-edge budgets assume that columns smaller than four have been excluded.
Let L4 and L5 denote vertices of B with column sizes four and five, and put
r=|L4|, s=|L5|.

## 1. Intersecting small signatures force adjacency

For nonadjacent y,z in B, the set
D=A-(C_y union C_z) has no K4 (as a subset of A) and no independent triple
(such a triple together with y,z would be an independent five). R(4,3)=9
therefore gives |D|<=8, or |C_y union C_z|>=10.

Consequences:

- L4 is a clique, so r<=4.
- Every vertex in L4 is adjacent to every vertex in L5.
- Two intersecting size-five signatures force adjacency in B.
- A nonadjacent size-five pair has disjoint signatures.

For each u in A, all vertices of L4 union L5 whose signatures contain u
are pairwise adjacent: two size-five signatures sharing u have union at most
nine, and the other pair types have union at most nine regardless of overlap.
There can be at most three such vertices, since four together with u give K5.
Double-counting memberships proves the useful incidence bound

```
4r+5s <=54.
```

In particular, s<=10 even when r=0. This is stronger than the ordinary
clique/independence bound on B[L5]. It retains shared-vertex information.

## 2. Sharper bounds with two or more size-four columns

Because L4 is a clique completely joined to L5, B[L5] has clique number
at most 4-r. This bounds the number of size-five signatures containing any
fixed A vertex, since those vertices of L5 are a clique.

Combining this with the preceding common-vertex restriction yields:

|r|upper bound on s|
|---|---|
|0|10|
|1|10|
|2|7|
|3|3|
|4|0|

For r=2, each A vertex lies in at most two size-five signatures, so 5s<=36.
There is a refinement. If the two size-four columns are T1,T2, a vertex
in T1 intersect T2 lies in at most one size-five signature: both L4 vertices
and two such L5 vertices together with that A vertex would give K5. Thus

```
5s <=36-|T1 intersect T2|.
```

If s=7, |T1 intersect T2|<=1. For r=3, the analogous bound is
5s<=18-|intersection_(y in L4) C_y|. For r=4, any vertex in L5 would
extend the L4 clique to K5, so none exists.

These arguments allow repeated signatures: no distinctness assumption is used.
They also show that any A vertex belongs to at most three of the size-four
columns, so four such columns have empty common intersection.

## 3. Exact frontier budget for small-column counts

Assume every column has size at least four. Put

```
H=sum_(y:|C_y|>=6)(|C_y|-6).
```

Counting the 24 column sizes gives the exact identity

```
x=144-2r-s+H,
2r+s=8-k+H,
H>=0.
```

Thus a small-k interface must contain enough small columns. At k=0 the
necessary pairs are precisely the following arithmetic ranges under the
proved bounds (they are not claims of realizability):

|r|s|H|
|---|---|---|
|0|8..10|s-8|
|1|6..10|s-6|
|2|4..7|s-4|
|3|2..3|s-2|
|4|0|0|

In the r=4 frontier subcase, all remaining 20 columns have size exactly six.
If r=2,s=7, its two size-four signatures have overlap at most one.
For any k<=5 the same upper bounds and 2r+s>=8-k give a complete necessary
count split, while H fixes the total excess of columns above six.

## 4. The eight-vertex boundary for nonadjacent size-five columns

Suppose y,z in L5 are nonadjacent. Their signatures are disjoint, so
D=A-(C_y union C_z) has exactly eight vertices and is (4,3)-free.
There is an elementary, catalogue-free sharpening of its structure.

Every vertex of D has degree four or five. Its nonneighbors form a clique,
since alpha(D)<=2, and there are at most three since D has no K4; thus its
degree is at least four. Its neighborhood is triangle-free with independence
number at most two, so R(3,3)=6 makes its degree at most five.

Let h be the number of degree-five vertices. The handshake lemma makes h
even and e(D)=16+h/2. There are no independent triples. Goodman's identity
therefore gives the triangle count

```
t(D)=C(8,3)-(1/2) sum_u d_D(u)(7-d_D(u))=8+h.
```

A five-vertex neighborhood is triangle-free with independence number at most
two and must be C5: every vertex has degree at most two because its neighbors
are independent, and degree at least two because its nonneighbors form a
clique of size at most two. A four-vertex neighborhood has at most four edges
by Mantel. Summing neighborhood edges and counting each triangle three times:

```
3(8+h) <=5h+4(8-h)=32+h.
```

Hence h<=4. Altogether:

|h|e(D)|triangles(D)|
|---|---|---|
|0|16|8|
|2|17|10|
|4|18|12|

Every degree-five vertex has a C5 neighborhood. If h=4, equality in the
neighborhood-edge sum forces every degree-four vertex to have a C4
neighborhood. Equivalently complement D is triangle-free with independence
number at most three, degrees two or three, and 10..12 edges.

Thus a nonadjacent size-five pair forces both disjointness and this exact
eight-vertex degree/triangle alternative. It also forces adjacent pairs in
the A-nonneighbors of each D vertex, providing concrete interface tests.

For an independent triple of L5 vertices the three signatures are pairwise
disjoint. Their union has size 15. The three vertices left in A must form a
clique: a nonedge among them together with the independent triple in B would
give an independent five. This is an additional higher-order restriction.

## 5. Scope and next mathematical work

These are necessary conditions for the full interface. They do not prove
tau>=5 for an isolated 18-vertex graph, and do not exclude x=136.
They refine the existing size-four attachment budget without relying on the
unresolved attachment families in `n43/d18/x136/transversal_five_attempt.md`.

The useful next targets are the r=4 case with twenty size-six columns, and
the r=0 case with eight to ten size-five columns. In the latter, every A
vertex supports at most three small signatures, while nonadjacent pairs force
the eight-vertex alternatives above. Any attempted exclusion must retain
the actual B adjacencies and A induced graphs; the count table alone is not
a contradiction. The properties extend to every q<=2 subcase at higher k.

Audit: the incidence bound follows from a five-vertex clique obstruction;
the r-dependent bounds follow independently from joining a clique to L5;
the H identity is an exact column sum; the eight-vertex alternatives follow
from handshake, Goodman, and a separate neighborhood triangle count. All
external numerical census inputs are isolated in the setting section.
