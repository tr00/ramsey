# Joint size-five interfaces in the r=2 frontier

Date: 2026-10-14. Task token: `r2-triples-20261014`.
Author: `r2_triples` agent. Purely mathematical deductions, with no graph
enumeration, solver, catalogue, download, or installation. No novelty claim
is made. All seven claims have exact-revision independent acceptance; the whole r2 branch is now closed by their low-excess dependencies.

## Setting

Let G have 43 vertices and contain neither K5 nor I5. Fix a degree-18 pivot
v, put A=N(v), B=M(v), C_y=N_G(y) intersect A, and assume e(A,B)=136.
Then |A|=18, |B|=24, A is (4,5)-free, B is (5,4)-free, e(A)=85,
and every A vertex has global degree18. Thus

```text
d_B(a)=17-d_A(a).
```

In this note r=2: L4={q1,q2}, with T_i=C_(q_i) of size four. Put
L5={y in B:|C_y|=5}, s=|L5| and

```text
H=sum_(y:|C_y|>=6)(|C_y|-6)=s-4.
```

The recorded four-transversal theorem and column bounds give s=4..7.
The pair-union bound is |C_y union C_z|>=10 whenever yz is a B nonedge:
the complement of that union in A is K4/I3-free, so R(4,3)=9 bounds its
order by eight. Consequently q1q2 is an edge, both q_i are adjacent to
every L5 vertex, and intersecting size-five columns have adjacent endpoints.
The graph J=B[L5] is triangle-free and I4-free. An A vertex belongs to at
most two L5 columns; if it lies in both T_i, it belongs to at most one.
These follow from the K5 obstruction with q1,q2.

The equality-frontier numerical premises and row identity are recorded in
[frontier_band.md](../../frontier_band.md); small-column facts and the
eight-vertex calculation are in [small_columns.md](../small_columns.md).
The new [low-excess note](low_excess_columns.md) gives independent
four-transversal compatibility. We use the latter only where stated.
Published census premises are inherited, rather than recertified here.

<a id="claim-r2-triples-01"></a>
## 1. Simultaneous independent-triple cores

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-01`

Kind: local-deduction

Review state: accepted

Scope: the setting above; every independent triple y1,y2,y3 in J.

Dependencies: pair-union bound; eight-vertex degree bound from
small_columns.md, Section4; R(3,3)=6.

Conclusion: Write P_i=C_(y_i). The P_i are pairwise disjoint five-sets;
R=A-(P1 union P2 union P3) has size three and induces a triangle. Each
D_i=A[P_i union R] is (4,3)-free on eight vertices with degrees four or
five and 16..18 edges. For every a in R,

```text
2<=|N_A(a) intersect P_i|<=3 for each i,
8<=d_A(a)<=11,
d_A(a)=8+|{i:d_(D_i)(a)=5}|.
```

Thus its degree in A is determined by the three actual pair cores. A
degree-eleven vertex of R has degree five in all three cores. The cross-edge
budget among the three five-sets is

```text
e(P1,P2)+e(P1,P3)+e(P2,P3)
=91-[e(D1)+e(D2)+e(D3)] in 37..43.
```

If s>=6, J necessarily contains such an independent triple. Hence these
constraints apply to an unavoidable family in both s=6 and s=7.

Proof: Nonadjacent five-columns are disjoint by their union lower bound.
If two residual vertices were nonadjacent, they with y1,y2,y3 would give
I5, so R is a triangle. For each i, D_i is the complement in A of the
other two five-columns and is (4,3)-free. The eight-vertex lemma gives
degrees four or five, edges16..18. A residual vertex already has two
neighbors in R, so its degree in each D_i gives two or three neighbors in
P_i. Summing proves the displayed A degree identity. Finally the three
D_i contain every A edge except edges between distinct P_i, and each of
the three R edges is counted three times instead of once. Therefore
sum_i e(D_i)=85-e(P1,P2)-e(P1,P3)-e(P2,P3)+6. Triangle-freeness of J
and R(3,3)=6 give an I3 for every s>=6. This is family coverage; it does
not privilege a unique triple or assume its two remaining B vertices.

Search use: propagate each actual independent-triple interface; branch on
an unavoidable triple for s=6,7 with all allowable completions retained.

Reviews: [coordinator exact review](review_independent_triples_20261014_coordinator.md); [independent low-excess review](review_independent_triples_20261014_low_s.md).

<a id="claim-r2-triples-02"></a>
## 2. Seven size-five columns saturate A membership

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-02`

Kind: local-deduction

Review state: accepted

Scope: the setting above with s=7. Define lambda(a)={y in L5:a in C_y}.

Dependencies: L5 vertexwise multiplicity bounds in the setting; pair-union
bound; Claim02 of low_excess_columns.md for the final nonempty-overlap
assertion only.

Conclusion: Exactly17 A vertices have |lambda(a)|=2 and exactly one,
called a0, has |lambda(a0)|=1. No A vertex has empty lambda. Every
two-element lambda is an edge of J. For every independent triple S in J,
its residual A triangle comprises three vertices whose lambda labels
avoid S. Exactly one of these vertices is a0 if and only if a0's singleton
label avoids S.

In any r=2 realization satisfying the disjoint-transversal exclusion,

```text
T1 intersect T2={a0}.
```

Equivalently the 17 double-labelled A vertices define nonnegative integer
edge weights w_yz=|C_y intersect C_z| on J. Their total is17, and their
weighted degrees are five except at the unique singleton-labelled endpoint,
where the weighted degree is four. Zero weights on actual J edges are
allowed; this is an encoding, not an isomorphism classification.

Proof: The seven five-columns have35 memberships. On18 A vertices each
has capacity two, so the total deficit from capacity36 is one. Thus the
entire deficit is one vertex of multiplicity one. Intersecting columns
have adjacent endpoints, proving the edge-label assertion. An A vertex
lies outside the three columns of S exactly when its label avoids S;
Claim01 identifies that three-vertex residual set as a triangle. An
overlap of T1,T2 can only contain vertices of multiplicity at most one,
so it is contained in {a0}. The disjoint-transversal exclusion makes it
nonempty. The weighted identities then follow by counting each double
membership once at each of its two endpoints.

Search use: propagate labelled membership, residual triangles, and weighted
degree identities. The encoding alone does not exclude s=7.

Reviews: [coordinator exact review](review_independent_triples_20261014_coordinator.md); [independent low-excess review](review_independent_triples_20261014_low_s.md).

<a id="claim-r2-triples-03"></a>
## 3. The exceptional overlap has no size-six neighbor

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-03`

Kind: local-deduction

Review state: accepted

Scope: the setting above with s=7 and T1 intersect T2={a0}, as established
by Claim02 using the disjoint-transversal exclusion.

Dependencies: Claim02; pair-union bound; R(3,4)=9; the four-transversal
vertex upper bound d_A<=11 from low_excess_columns.md, Claim01.

Conclusion: No B vertex z with |C_z|=6 is adjacent to a0. Consequently
there are exactly three columns of size seven, a0 belongs to all three,
and d_A(a0)=11. In particular the alternative excess partitions consisting
of one size-nine column or one size-eight and one size-seven column are
impossible in s=7.

Proof: Suppose z is such a size-six neighbor. It is adjacent to both q_i:
otherwise |T_i union C_z|<=4+6-1=9 violates the pair-union bound. Put
K=N_B(q1) intersect N_B(q2). This graph is triangle-free and I4-free,
so R(3,4)=9 gives |K|<=8. It already contains all seven L5 vertices
and z, hence K=L5 union {z}. Every vertex of a triangle-free I4-free
graph on eight vertices has degree at least two: its nonneighbors form
a triangle-free I3-free graph, of order at most five by R(3,3)=6.
Thus z has at least two neighbors in L5. Write Z=L5-N_B(z), so |Z|<=5.

For every b in C_z, its label lambda(b) meets Z. If its label is a J
edge whose both endpoints are neighbors of z, those endpoints form a
triangle with z inside K, impossible. For the sole singleton b=a0,
its endpoint p is nonadjacent to z: otherwise q1,q2,a0,p,z give K5.
This proves the assertion for all six vertices of C_z.

For every y in Z, nonadjacency yz gives

```text
10<=|C_y union C_z|=5+6-|C_y intersect C_z|,
|C_y intersect C_z|<=1.
```

Counting the label memberships in Z in two ways therefore gives

```text
6<=sum_(b in C_z)|lambda(b) intersect Z|
  =sum_(y in Z)|C_y intersect C_z|<=|Z|<=5,
```

a contradiction. Finally a0 has exactly two L4 neighbors, one L5
neighbor, no size-six neighbors, and h neighbors with column size at
least seven. Its cross degree is3+h, so d_A(a0)=14-h. Since H=3,
h<=3; since d_A(a0)<=11, h>=3. Hence h=3 and d_A(a0)=11, with all
three units of H contributed by three size-seven columns containing a0.

Search use: propagate the size-seven excess pattern and exceptional row
identity. Combined with an independently accepted incompatibility theorem
for singleton-overlap degree-eleven four-transversals, terminate s=7.

Reviews: [coordinator exact review](review_independent_triples_20261014_coordinator.md); [independent low-excess review](review_independent_triples_20261014_low_s.md).

<a id="claim-r2-triples-04"></a>
## 4. The s=7 child is excluded

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-04`

Kind: local-deduction

Review state: accepted

Scope: the setting above with s=7; all J=B[L5] structures and all excess
partitions H=3 are covered.

Dependencies: Claims02--03 here; disjoint-transversal exclusion and general
singleton-overlap degree-eleven exclusion in low_excess_columns.md,
Claims02 and04, respectively.

Conclusion: No r=2, s=7 equality-frontier interface exists. This closes
that child, rather than the entire degree-18 or order-43 branch.

Proof: The disjoint-transversal theorem forces T1 intersect T2 nonempty.
Claim02's saturated membership count makes this intersection the singleton
{a0}. Claim03 makes its A degree eleven. This is precisely the pair of
four-set I4-transversals prohibited by the general singleton-overlap
degree-eleven theorem. No restriction on which H=3 partition is selected
is imposed in the argument; Claim03 derives its forced three-size-seven
alternative before the same contradiction applies.

Search use: terminate s=7 after independent acceptance and applicability
of all stated numerical and equality-frontier premises.

Reviews: [coordinator exact review](review_independent_triples_20261014_coordinator.md); [independent low-excess review](review_independent_triples_20261014_low_s.md).

<a id="claim-r2-triples-05"></a>
## 5. The two-overlap s=6 interface has a shared eight-vertex core

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-05`

Kind: local-deduction

Review state: accepted

Scope: the setting above with s=6 and T1 intersect T2={a,b}. Use the
necessary interface from low_excess_columns.md, Claim05: a,b are
nonadjacent of A degree ten; K=N_B(q1) intersect N_B(q2) consists of
L5 and two size-six vertices z1,z2; both overlaps are adjacent to both
z_i and to exactly one L5 vertex each, and these two ordinary neighbors
are nonadjacent to each other and to each overlap's L5 neighbor.

Dependencies: low_excess_columns.md, Claim05; pair-union bound;
triangle-freeness and I4-freeness of K; the eight-vertex lemma in
small_columns.md, Section4.

Conclusion: Write X_i=C_(z_i), p_a and p_b for the respective L5
neighbors of a,b, and P_a=C_(p_a), P_b=C_(p_b). Then

```text
X1 intersect X2={a,b};
D=A-(X1 union X2) has eight vertices and is (4,3)-free;
p_a != p_b, and p_a p_b is an edge of B;
P_a intersect X_i={a}, P_b intersect X_i={b} for i=1,2;
P_a-{a} and P_b-{b} are four-subsets of D.
```

Every vertex of D has degree four or five in D, with the edge/triangle
alternatives (16,8), (17,10), or (18,12). Also p_a,p_b are precisely the
common nonneighbors of z1,z2 in K. Let Z_i=X_i-{a,b}, so each Z_i has
four vertices. Each overlap is adjacent in A to all four vertices of
(T1 union T2)-{a,b}. Its remaining six A neighbors supply
the exact identity

```text
|N_A(c) intersect Z1|+|N_A(c) intersect Z2|
 +|N_A(c) intersect D|=10, for c=a,b.
```

The Z_i and D form a disjoint partition of A-{a,b}; the displayed
identity retains every attachment and is not an additional contradiction.

Proof: The nonadjacent size-six pair has union size at least ten, so
|X1 intersect X2|<=2. Both contain a,b, proving equality and |D|=8.
The pair-union reasoning makes D K4/I3-free; the existing eight-vertex
lemma applies regardless of whether the deleted columns have size five
or six, as its proof only uses D's graph type and order.

For i=1,2, nonadjacency z_i p_a gives |X_i intersect P_a|<=1. This
intersection contains a and hence equals {a}; similarly it contains
exactly b for p_b. If p_a=p_b, its common column would meet X_i in
both a and b, contradicting the same bound. Thus the two L5 endpoints
are distinct and their columns outside the respective overlap vertices
are contained in D. The common nonneighbors of z1,z2 in K form a clique:
a nonedge there would give I4 with z1,z2. Since K is triangle-free this
clique has at most two vertices, and it already contains p_a,p_b. Hence
they are adjacent and exhaust it.

Finally degree ten on a four-set transversal gives internal degree at
least two, because each external attachment has size at most eight.
The other overlap is a nonneighbor, so each overlap must be adjacent
to both remaining vertices in each T_i. These yield the four specified
neighbors. X1 intersect X2={a,b} makes the Z_i and D disjoint and
exhaustive, and the displayed degree identity follows.

Search use: propagate the common eight-vertex core, endpoint edge,
four-subset attachments, and exact intersection pattern. This does not
close the two-overlap s=6 case.

Reviews: [independent low-excess review](review_independent_triples_20261014_low_s.md).

<a id="claim-r2-triples-06"></a>
## 6. The remaining s=6 overlap is a singleton

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-06`

Kind: local-deduction

Review state: accepted

Scope: the setting above with s=6, using the overlap/row alternatives
of low_excess_columns.md, Claim05.

Dependencies: low_excess_columns.md, Claim05; R(3,5)=14; exact global
degree18 of every A vertex.

Conclusion: |T1 intersect T2|=1. Thus the residual r=2/s=6 interface has
exactly one overlap vertex, of A degree ten, with the seven B neighbors
recorded in low_excess_columns.md, Claim05. The two-overlap core of
Claim05 here is impossible in the full graph G.

Proof: Suppose T1 intersect T2={a,b}. These are nonadjacent and both
have global degree18. They share the pivot v as a neighbor. Both have
the six common B neighbors q1,q2,W1,W2,z1,z2 from the exact overlap
rows. In A both are adjacent to the four distinct vertices of
(T1 union T2)-{a,b}: their degree-ten/internal-attachment bound requires
adjacency to the two other vertices in each T_i. Hence their global
common-neighbor count c is at least1+6+4=11.

On the other hand, the 41 vertices different from a,b contain exactly
41-(18+18-c)=5+c common nonneighbors. This induced graph is K5-free
as a subgraph of G, and I3-free because an independent triple there
with the nonadjacent a,b would give I5. R(3,5)=14 makes its order at
most13, so 5+c<=13 and c<=8. This contradicts c>=11. The overlap
size-one-or-two coverage from low_excess_columns.md, Claim05, therefore
leaves exactly one vertex. The calculation uses global degrees, including
v and all B neighbors; it does not apply an I4 prohibition to A.

Search use: terminate the two-overlap s=6 child; propagate singleton
overlap in the residual s=6 branch, after independent acceptance and
applicability of the stated equality-frontier premises.

Reviews: [exact two-overlap review](review_r2_remaining_20261014_pivot.md); [independent low-excess review](review_independent_triples_20261014_low_s.md).

<a id="claim-r2-triples-07"></a>
## 7. The singleton overlap forces a 5/6/6 independent-column partition

Claim ID: `research/n43/d18/x136/r2/independent_triples.md#claim-r2-triples-07`

Kind: local-deduction

Review state: accepted

Scope: the setting above with s=6 and T1 intersect T2={a}, using the
remaining exact row in low_excess_columns.md, Claim05, and Claim06 here.
Write p for a's unique L5 neighbor, P=C_p, and X_i=C_(z_i) for the two
ordinary size-six neighbors of a.

Dependencies: low_excess_columns.md, Claim05; Claim06 here; pair-union
bound; the K4/I5 obstructions in A and G.

Conclusion: The B triple {p,z1,z2} is independent and

```text
P intersect X1=P intersect X2=X1 intersect X2={a};
|P union X1 union X2|=15;
R=A-(P union X1 union X2) induces a triangle;
D=A-(X1 union X2) has seven vertices, is (4,3)-free,
and D=(P-{a}) disjoint_union R.
```

The two eight-vertex pair remainders A-(P union X_i) are (4,3)-free and
equal (X_(3-i)-{a}) disjoint_union R. Thus the same residual triangle
belongs simultaneously to two eight-vertex cores and one seven-vertex
core, with the exact five/five/four attachments specified above.

Proof: The exact overlap row supplies the independent triple p,z1,z2.
For each i, the nonadjacent columns P,X_i have sizes five and six, so
their pair-union lower bound ten gives |P intersect X_i|<=1. They
both contain a, proving equality. Put t=|X1 intersect X2|. These also
contain a, so t>=1, and their triple intersection with P is exactly {a}.
Inclusion-exclusion gives

```text
|P union X1 union X2|=5+6+6-1-1-t+1=16-t.
```

The 18-(16-t)=2+t residual vertices form a clique: a nonedge among them
with p,z1,z2 would give I5. Since A has no K4 this clique has at most
three vertices, yielding t<=1. Thus t=1, the three pair intersections
are the same singleton, the union has size15, and R is a triangle.
The pair remainder for z1,z2 is (4,3)-free by the standard pair argument
and has order18-11=7. Removing the shared singleton shows it consists
exactly of P-{a} and R. The other two pair remainders have order eight
and the displayed partitions by the same set identities. No graph
catalogue or assumption about the seventh L5 vertex is used.

Search use: propagate the exact three-column intersections, triangle,
and simultaneous seven/eight/eight-vertex remainder attachments in the
residual singleton-overlap s=6 branch after independent acceptance.

Reviews: [exact residual-triple review](review_residual_triple_20261014_pivot.md).

## Integration limit

Claims01--03 are separate deductions: the joint triple cores are useful
for either s=6 or s=7; the saturated label argument uses s=7 essentially.
For s=6 the membership deficit is six, so the proof's full-coverage label
count cannot be transferred unchanged. Claim04 records the exact s=7
closure composition, Claim06 closes the two-overlap s=6 child, and
Claim07 supplies a simultaneous-core filter for its remaining singleton.
No exclusion of the entire s=6 child is claimed here.

All r2 children are now excluded by low_excess_columns.md, Claim06,
with exact independent review. Claims05 and07 here retain conditional
interface deductions for the historical proof chain; they do not define
live generation branches. No x136 or order-43 exclusion follows.
