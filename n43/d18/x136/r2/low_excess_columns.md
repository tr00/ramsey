# Low-excess actual-column compatibility at x=136, r=2

Date: 2026-10-14. Task token: `r2-low-excess-20261014`.
Author: low-excess agent; the coordinator supplied the independent diamond
attachment argument incorporated in Claim 01. Base revision:
`49bd3637b8e6763ac6fbd3bd5c267155b0f1cb27`.

This is purely mathematical work. No enumeration, solver, canonicalizer,
package, catalogue download, or installation was used. No novelty claim is
made. All six claims have exact-revision independent acceptance; reviews retain their numerical-premise limits.

## Setting and external premises

Let G be an order-43 graph containing neither K5 nor I5. Choose a pivot v of
degree 18, and put A=N(v), B=M(v), C_y=N_G(y) intersect A. Throughout
e(A,B)=136. Thus A is (4,5)-free on 18 vertices, B is (5,4)-free on 24
vertices, e(A)=85, and every a in A has d_G(a)=18. Consequently

```text
d_B(a)=17-d_A(a).
```

We use the recorded published extrema E(4,5,18)=85, E(4,5,17)=79,
and E(4,4,14)=50; the last is the maximum edge count of a 14-vertex
(4,4)-free graph. The four-transversal theorem uses the published minimum
of 50 edges for 15-vertex (4,4)-free graphs. These numerical premises have
not been recertified here. See [the baseline](../../../../docs/mathematical_baseline.md),
[the four-transversal proof](../../transversal_four.md), and the citations in
[the earlier pairwise note](../pairwise_small_refinements.md).

Every C_y meets every I4 in A. Every set meeting every I4 in A has size at
least four. For every I4 I in A,

```text
sum_(a in I)d_A(a)<=32.
```

This is the independent-four anchor bound, independently rechecked as
follows. All 24 columns meet I. Columns with exact signature {a} form a
clique in B: two nonadjacent members together with I-{a} give I5. Each
such clique has size at most three, since four members with a give K5.
Hence at most twelve columns are singletons and e(I,B)>=36. The exact row
identity gives sum_I d_A=68-e(I,B)<=32.

Also 6<=d_A(a)<=13 for every a in A. The lower bound is
85-e(A-a)>=85-79. For the upper bound N_A(a) is triangle-free and
I5-free, so R(3,5)=14 gives |N_A(a)|<=13.

Let L4={y in B:|C_y|=4}, L5={y in B:|C_y|=5}. In the r=2 branch write
L4={q_1,q_2}, T_i=C_(q_i), s=|L5|, and
H=sum_(y:|C_y|>=6)(|C_y|-6)=s-4. The recorded range is s=4..7.
The pair-union argument gives |C_y union C_z|>=10 whenever y,z in B are
nonadjacent: the remaining A vertices are (4,3)-free and number at most
eight. Thus q_1q_2 is an edge, every member of L5 is adjacent to both q_i,
and intersecting size-five columns have adjacent B endpoints.

Input proof revisions:

| File | SHA-256 |
| --- | --- |
| `n43/d18/frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `n43/d18/x136/small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| `n43/d18/x136/pairwise_small_refinements.md` | `3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85` |

<a id="claim-r2-low-excess-01"></a>
## 1. Degrees on any four-set transversal

Claim ID: `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-01`

Kind: local-deduction

Review state: accepted

Scope: the setting above; every four-set T of A meeting every I4 of A,
whether or not T is an actual B column.

Dependencies: E(4,4,14)=50; R(3,4)=9; elementary clique and independent-set
obstructions. The vertex lower bound repeats the accepted earlier
[Claim 01](../pairwise_small_refinements.md#claim-pairwise-small-01), with its
quantifier explicitly extended to all four-set transversals.

Conclusion: Every a in T satisfies 9<=d_A(a)<=11, and d_A(a)=11 makes a
adjacent to every other vertex of T. Moreover

```text
38<=sum_(a in T)d_A(a)<=40.
```

Proof: Put K=A-T, m=e(K), t=e(A[T]), c=e(T,K). Since T is a transversal,
K is (4,4)-free on 14 vertices and m<=50. For a in T, its K neighborhood
S_a is triangle-free and I4-free, so |S_a|<=8. Thus c<=32 and d_A(a)<=11;
degree eleven requires all three internal neighbors. Since 85=m+t+c,
t>=3, whence

```text
sum_T d_A=2t+c=85-m+t>=85-50+3=38.
```

To prove d_A(a)>=9, consider the three-set T-{a}. If it has at most two
edges, e(A-a)<=50+24+2=76. If it is a triangle, each pair of its three K
neighborhoods has independent intersection, of size at most three, and
their triple intersection is empty. Inclusion-exclusion bounds the sum of
the three attachment sizes by 14+3+3+3=23. Then again
e(A-a)<=50+23+3=76. Thus d_A(a)=85-e(A-a)>=9.

For the upper sum bound, t<=4 gives 2t+c<=8+32=40. The only remaining
case is t=5, since A has no K4. In this case A[T] is a diamond: name its
shared-edge vertices u,v and its nonadjacent tips x,y. S_u intersect S_v
is independent, since an edge there with u,v gives K4, and it is
anticomplete to x and y, since a member adjacent to either tip gives K4
with u,v and that tip. It therefore has at most two vertices: three
independent members with x,y would give I5. The intersections
S_u intersect S_x and S_v intersect S_x have size at most three, while
S_u intersect S_v intersect S_x is empty. Hence inclusion-exclusion gives

```text
|S_u|+|S_v|+|S_x|<=14+2+3+3=22.
```

Writing delta_z=8-|S_z|>=0, this says delta_u+delta_v+delta_x>=2 and
therefore sum_T delta>=2. Consequently c<=30 and 2t+c<=10+30=40.
This proof does not use the earlier surviving attachment-family list.

Search use: propagate after independent acceptance.

Reviews: [full independent triple-agent review](review_low_excess_columns_20261014_triples.md); [pivot review of Claims 01--04](review_low_excess_columns_20261014_pivot.md).

<a id="claim-r2-low-excess-02"></a>
## 2. Two disjoint four-set transversals are impossible

Claim ID: `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-02`

Kind: local-deduction

Review state: accepted

Scope: the setting above; any two disjoint four-set I4-transversals T_1,T_2
in A. They need not be actual columns. This assertion uses the full
frontier anchor degree bound, not merely e(A)=85.

Dependencies: Claim 01; the independent-four anchor bound; the
four-transversal theorem; 6<=d_A<=13 in the setting; R(3,4)=9.

Conclusion: No such pair T_1,T_2 exists. In particular all r=2 interfaces
must have T_1 intersect T_2 nonempty, and the s=4 subcase is excluded by
the previously accepted overlap resource bound.

Proof: Put U=A-(T_1 union T_2), of order ten. Every I4 I meets each T_i.
It cannot use at least three vertices in their union: their degrees are
at least nine, the fourth degree is at least six, and
9+9+9+6=33 contradicts the anchor upper bound 32. Hence every I4 uses
exactly one vertex of each T_i and two vertices of U. These last two have
degree sum at most 14. Let

```text
L={u in U:d_A(u)<=7}, ell=|L|.
```

Every I4 meets L, since its U pair has degree sum at most 14. Thus L is
a transversal. The four-transversal theorem gives ell>=4, and Claim 01
rules out ell=4 because its vertices have degree at most seven. So ell>=5.

Suppose ell=5. For each u in L, L-{u} is a four-set of degree-at-most-seven
vertices and therefore cannot be a transversal by Claim 01. Choose an I4
avoiding it. Since L is a transversal this I4 contains u, and its other U
vertex lies outside L, of degree at least eight. The sum bound on the U
pair and the universal lower degree six imply d_A(u)=6 and degree eight
for that other vertex. This holds for every u in L, so all five L
vertices have degree six. Since L is a transversal, A-L is (4,4)-free on
13 vertices. Its vertices have degree at most eight: their neighborhoods
are triangle-free and I4-free, so R(3,4)=9 applies. It follows that

```text
e(A-L)<=13*8/2=52,
e(A-L)=85-sum_L d_A+e(A[L])=55+e(A[L])>=55,
```

a contradiction. Therefore ell>=6.

Claim 01 gives 90<=sum_U d_A<=94. If ell>=7, the degree upper bound 13
gives sum_U d_A<=7*7+3*13=88, impossible (larger ell only reduces this
bound). Hence ell=6. Every vertex of U-L has degree at least nine: if
one had degree eight, the total degree sum would be at most
6*7+8+3*13=89<90. Therefore the two U vertices of every I4 both belong
to L, since 6+9>14.

For any distinct a,b in L, the set L-{a,b} has size four and degrees at
most seven, so by Claim 01 it is not a transversal. An I4 avoiding it
must contain exactly the pair a,b from U, as just proved. Thus every
pair of vertices in L is nonadjacent. This gives an independent six-set,
contrary to A being I5-free. The disjoint case is impossible.

To obtain the s=4 closure, H=s-4=0. The accepted
[overlap resource bound](../pairwise_small_refinements.md#claim-pairwise-small-02)
says every T_1 intersect T_2 vertex needs a neighboring column of size at
least seven, of which none exists when H=0. Thus s=4 forces disjointness,
and the theorem excludes it. This combines exact s=4 coverage with the
new contradiction, not a claim that the count table alone is impossible.

Search use: propagate nonempty overlap; terminate the s=4 child after
independent acceptance and applicability of the stated numerical premises.

Reviews: [full independent triple-agent review](review_low_excess_columns_20261014_triples.md); [pivot review of Claims 01--04](review_low_excess_columns_20261014_pivot.md).

<a id="claim-r2-low-excess-03"></a>
## 3. A sole column larger than six permits at most one overlap vertex

Claim ID: `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-03`

Kind: local-deduction

Review state: accepted

Scope: the setting above, r=2, s>=5, and exactly one B column W has size
at least seven. Here W denotes its vertex of B. This includes s=5
(|C_W|=7), s=6 with a sole size-eight column, and s=7 with a sole size-nine.

Dependencies: Claim 01; earlier overlap resource bound; pair-union bound;
R(3,4)=9; B is I4-free.

Conclusion: |T_1 intersect T_2|<=1. At s=5 it is exactly one by Claim 02;
the overlap vertex a has d_A(a)=11 and belongs to C_W. Its other three
B neighbors form an independent triple in K=N_B(q_1) intersect N_B(q_2),
with at most one in L5 and at least two outside L5. All have column size
at most six.

Proof: The earlier overlap resource bound gives for each overlap a that
a belongs to C_W and d_A(a)=11. Its cross degree is therefore six. After
q_1,q_2,W its other B neighbors form a three-set J_a with column sizes at
most six. Any such z is adjacent to both q_i: otherwise the pair-union
bound requires union size ten although |T_i union C_z|<=4+6-1=9.
Thus J_a is contained in K. An edge within J_a with a,q_1,q_2 gives K5,
so J_a is independent. At most one of its vertices is in L5: two L5
columns containing a intersect, so their endpoints are adjacent.

The graph K is triangle-free, because a triangle there with q_1,q_2 gives
K5, and is I4-free as a subgraph of B. Hence |K|<=8 by R(3,4)=9. It
contains every L5 vertex, so |K-L5|<=8-s<=3.

If two overlap vertices a,b existed, both have degree eleven and are
universal inside each T_i by Claim 01, so a,b are adjacent. No z in B
with column size at most six can belong to both J_a and J_b: it is
adjacent to q_1,q_2 and to a,b, giving K5 on a,b,q_1,q_2,z. Therefore
J_a,J_b are disjoint, and each uses at least two vertices of K-L5. This
requires |K-L5|>=4, a contradiction. At s=5 Claim 02 then forces exactly
one overlap vertex and proves the stated row pattern.

Search use: propagate after independent acceptance; this claim alone does
not exclude s=5 or s=6.

Reviews: [full independent triple-agent review](review_low_excess_columns_20261014_triples.md); [pivot review of Claims 01--04](review_low_excess_columns_20261014_pivot.md).

<a id="claim-r2-low-excess-04"></a>
## 4. A singleton overlap of degree eleven is impossible

Claim ID: `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-04`

Kind: local-deduction

Review state: accepted

Scope: the setting above; any two four-set I4-transversals T_1,T_2
intersecting in exactly one vertex a with d_A(a)=11. The transversals need
not be actual columns. No independent-triple assumption in B is made.

Dependencies: Claims 01--03; the anchor and four-transversal bounds in the
setting; 6<=d_A<=13; R(3,4)=9.

Conclusion: Such a singleton degree-eleven overlap is impossible. Hence
the r=2,s=5 child is impossible. The r=2,s=6 alternative with a sole
size-eight column is also impossible; at s=6 there must be two size-seven
columns. Together with Claim02, r=2 requires s=6 or7 and at least two
columns of size at least seven.

Proof: By Claim01, a is universal inside both T_i. Put
U=A-(T_1 union T_2), so |U|=11 and

```text
101<=sum_U d_A=170-sum_(T_1)d_A-sum_(T_2)d_A+11<=105.
```

An I4 containing a has its other three vertices in U, since a is
universal inside both T_i; their degree sum is at most 21. An I4 avoiding
a has exactly one vertex in each T_i-{a} and two in U: using at least
three vertices of the T union gives degree sum at least 33 as in Claim 02.
Its U pair has degree sum at most 14. Therefore

```text
L={u in U:d_A(u)<=7}, ell=|L|
```

meets every I4: a U pair with sum at most 14 meets L, as does a U triple
with sum at most 21. Thus ell>=5 by the four-transversal theorem and
Claim 01. If ell=5, choose for each u in L an I4 avoiding L-{u}.
It contains u. It cannot contain a, since its U triple would then have
degree sum at least 6+8+8=22. Thus its U pair consists of u and a vertex
outside L of degree at least eight, forcing d_A(u)=6. All five L
vertices then have degree six. As in Claim 02, A-L is (4,4)-free on13
vertices and has both at most52 and at least55 edges, a contradiction.
Hence ell>=6. If ell>=8, sum_U d_A<=8*7+3*13=95<101. So ell=6 or7.

Suppose ell=7. Then sum_U d_A<=7*7+4*13=101 forces equality throughout:
both T_i have degree sum40, all L vertices have degree seven, and the
other four U vertices degree13. Any I4 avoiding a uses two L vertices
(since 6+13>14), giving U degree sum14 and therefore selecting degree9
vertices from both T_i. As d_A(a)=11 and sum_(T_1)d_A=40, the other
three T_1 vertices have total degree29 and each has degree at least9;
at most two have degree9. Thus {a} together with those at most two
degree-nine vertices meets every I4, contrary to the four-transversal
theorem. Therefore ell=6.

There are now six L vertices of degree6 or7 and five U-L vertices of
degree8..13. Let p count degree-six vertices of L and
D=sum_(u in U-L)(13-d_A(u)). Then

```text
sum_U d_A=107-p-D>=101,
p+D<=6.
```

Let X be the degree-six vertices of L. If any I4 has a U vertex outside
L, there are exactly two possible cases. For an I4 avoiding a, its U
pair has sum at most14, so this pair has degrees6,8. Hence p>=1 and
D>=5, giving p=1,D=5. For an I4 containing a, its U triple has sum at
most21. If a high vertex has degree8, this likewise gives p>=1,D>=5
and p=1,D=5. If it has degree9, the other two must both have degree6,
so p>=2,D>=4 and p=2,D=4. Degrees at least10 are impossible. These
cases are exhaustive even if more than one high U vertex were proposed,
since 6+8+8=22>21. In either exceptional case p+D=6, so sum_U d_A=101
and sum_(T_i)d_A=40 for i=1,2.

At this equality, T_1-{a} has exactly one degree-nine vertex b. Here is
the additional attachment check establishing uniqueness. Since a is
universal in T_1, t=e(A[T_1]) is three, four, or five. The equation
sum_(T_1)d_A=2t+c=40 and c<=32 excludes t=3. If t=4, c=32 forces
all four attachment sizes eight, while T_1 contains a triangle; the
triangle attachment sum would be24 although the inclusion-exclusion
bound in Claim 01 is23. Thus t=5: T_1 is a diamond, with a a shared-edge
vertex, and c=30. The degree of a is11, so its attachment size is8.
The other three internal degrees are3,2,2. Their total A degree is29,
and each is at least9. The only possibilities are (9,9,11) or (9,10,10).
In the first, the degree-eleven vertex must be the other shared-edge
vertex (the tips have total degree at most10). Its attachment size is
also8, and the tips both have attachment size7. Either triangle then
has attachment sum8+8+7=23, contrary to the diamond bound22 in Claim01.
Thus the actual possibility is (9,10,10), with exactly one degree-nine
vertex b.

In either exceptional case, {a} union X union {b} meets every I4. Indeed
one containing a is met by a, while one avoiding both a and X must use
two degree-seven U vertices: a high degree-eight or nine vertex with a
degree-seven vertex has sum greater than14. The U degree sum14 then
forces its selected T_1 vertex to be b. This hitting set has size
p+2<=4. If p=1, its size is three, contrary to the four-transversal
theorem. If p=2, its size is four but includes degree-six vertices,
contrary to Claim01. Therefore no I4 can use a vertex of U-L.

All I4s consequently use two L vertices when avoiding a or three L
vertices when containing a. For any pair u,w in L, Claim01 says the
four-set L-{u,w} cannot be a transversal because all four degrees are
at most seven. An I4 avoiding it cannot contain a (it would need three
L vertices but only u,w remain), so it contains u,w as its U pair.
Every pair in L is therefore nonadjacent, giving I6 and contradicting
the I5-free condition on A. This excludes ell=6 and proves the general
singleton-overlap theorem.

For its interface consequences, exactly one column of size at least seven
and s>=5 implies by Claims02--03 a singleton overlap of degree eleven,
which has just been excluded. At s=5 the budget H=1 forces exactly one
size-seven column. At s=6 the budget H=2 allows either a sole size-eight
column or two size-seven columns; the former is excluded. At s=7 the
budget H=3 similarly excludes the sole size-nine column. In all r=2
cases, nonempty overlap from Claim02 and the earlier overlap resource
bound require a large column, while the argument here excludes having
only one. These exhaust the stated sole-large-column alternatives.

Search use: propagate exclusion of singleton overlap of degree eleven;
terminate s=5 and the sole-large-column alternatives after independent
acceptance and applicability of the stated numerical premises.

Reviews: [full independent triple-agent review](review_low_excess_columns_20261014_triples.md); [pivot review of Claims 01--04](review_low_excess_columns_20261014_pivot.md).

<a id="claim-r2-low-excess-05"></a>
## 5. The remaining s=6 overlap and its common-neighborhood rows

Claim ID: `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-05`

Kind: local-deduction

Review state: accepted

Scope: the setting above, r=2,s=6. The preliminary assertion below applies
to any four-set I4-transversal in the setting, whether or not it is a column.

Dependencies: Claims01--04; earlier overlap resource bound; pair-union
bound; R(3,4)=9; K5/I5 avoidance.

Conclusion: No four-set I4-transversal contains two A degree-eleven
vertices. At r=2,s=6 the two exceptional columns have size seven, with
endpoints W_1,W_2. The overlap O=T_1 intersect T_2 has size one or two,
is independent, and all its vertices have A degree ten. Put
K=N_B(q_1) intersect N_B(q_2). Then |K|=8: it consists of the six L5
vertices and two size-six-column vertices z_1,z_2. Every a in O belongs
to C_(W_1),C_(W_2),C_(z_1),C_(z_2), and exactly one L5 column C_(y_a),
with complete cross row

```text
N_B(a)={q_1,q_2,W_1,W_2,z_1,z_2,y_a}.
```

The set {z_1,z_2,y_a} is independent in B. If |O|=2, each T_i induces
either C4 or a diamond with O as its nonadjacent tips.

Proof: Two degree-eleven vertices in a four-set transversal T would both
be universal inside T by Claim01. T must therefore be a diamond with
these two as shared-edge vertices (a sixth edge would give K4). Their
attachment sizes are eight, and both tips have attachment size at least
seven because their A degree is at least nine and their internal degree
is two. Each triangle would then have attachment sum at least23,
contradicting the diamond bound22 in Claim01.

Claims02--04 give nonempty overlap and two size-seven columns. The
earlier overlap resource bound and Claim01 give 10<=d_A(a)<=11 for
a in O, and any degree-ten overlap belongs to both seven-columns.
K is triangle-free and I4-free, so |K|<=8. All six L5 vertices lie in K,
leaving at most two vertices of K outside L5.

If every overlap vertex had degree eleven, the preliminary assertion
would give |O|<=1, while nonempty overlap and Claim04 exclude precisely
that singleton. Thus some a in O has degree ten. Its cross degree is
seven. It belongs to the two Q columns and both seven-columns, leaving
exactly three neighbors with column size at most six. Pair-union forces
all three into K; a B edge among them gives K5 with a,q_1,q_2, so they
are independent. At most one lies in L5, since two such columns both
containing a force adjacent endpoints. Thus exactly two are outside L5,
saturating the capacity of K-L5. Call these z_1,z_2, and the other y_a.
Both z_i have column size six since r=2 and they are outside L5.

If b in O had degree eleven, it would be universal inside T_1 and hence
adjacent to a. It belongs to at least one seven-column, and its cross
degree six leaves at least two other neighbors with columns of size at
most six. These lie in K, at most one in L5, so at least one is z_1 or
z_2. This shared neighbor together with a,b,q_1,q_2 gives K5. Thus every
overlap vertex has degree ten. Repeating the exact row argument above
for each b in O shows that both z_i are neighbors of b. Any adjacent
pair a,b in O would then give K5 with q_1,q_2,z_1, so O is independent.

Every degree-ten vertex of T_i has internal degree at least two, since
its attachment size is at most eight. An independent triple inside a
four-set has each vertex of internal degree at most one. Therefore
|O|<=2. Nonempty overlap proves the claimed size range. If |O|=2, both
vertices are adjacent to each of the two other vertices of T_i. The only
remaining optional edge is between those other two, giving C4 when
absent and a diamond when present. The earlier row argument proves all
listed column memberships and B nonedges.

Search use: propagate this exact necessary interface after independent
acceptance; no termination of the whole s=6 child is claimed.

Reviews: [exact Claim 05 review](review_low_excess_remaining_20261014_pivot.md); [full triple-agent review](review_low_excess_columns_20261014_triples.md).

<a id="claim-r2-low-excess-06"></a>
## 6. A singleton overlap of degree ten is impossible

Claim ID: `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-06`

Kind: local-deduction

Review state: accepted

Scope: the setting above; any two four-set I4-transversals T_1,T_2
with T_1 intersect T_2={a} and d_A(a)=10. Actual column status is not
needed in this assertion.

Dependencies: Claim01; the independent-four anchor bound and
four-transversal theorem in the setting; 6<=d_A<=13; R(3,4)=9.
The closure corollaries additionally use Claims02--05, independent_triples.md
Claims04 and06, and the original s=4..7 count coverage.

Conclusion: No such singleton degree-ten overlap exists. In combination
with Claim05 and the independently reviewed two-overlap exclusion in
independent_triples.md, Claim06, the entire r=2,s=6 child is excluded.

Proof: Put U=A-(T_1 union T_2), of order11. Claim01 gives

```text
100<=sum_U d_A=170-sum_(T_1)d_A-sum_(T_2)d_A+10<=104.
```

An I4 avoiding a must use exactly one vertex in each T_i-{a} and two
in U; three vertices of the T union would give degree sum at least
9+9+9+6=33. Its U pair has degree sum at most14. An I4 containing a
cannot use two further vertices of the T union, because
10+9+9+6=34. If it uses one further T vertex, its two U vertices have
degree sum at most13; if it uses none, its three U vertices have sum
at most22. These possibilities exhaust every I4, without needing a to
be universal in either T_i.

Let L={u in U:d_A(u)<=7}, ell=|L|, and X={u in U:d_A(u)=6}, p=|X|.
Every I4 meets L: U pairs of sum at most14 do, as do U triples of sum
at most22 since three vertices of degree at least8 have sum at least24.
Thus ell>=5 by the four-transversal theorem and Claim01. If ell=5,
for each u in L an I4 avoids the four-set L-{u} by Claim01 and contains
u. If it avoids a its other U vertex has degree at least8, forcing
d_A(u)=6. If it contains a and one further T vertex, its U sum would
be at least6+8=14>13, impossible. If it contains a and no further T
vertex, its two other U vertices have degree at least8, so the upper
sum22 again forces d_A(u)=6. Hence allfive L vertices have degree6.
Since L is a transversal, A-L is (4,4)-free on13 vertices and has
at most52 edges by R(3,4)=9 on each neighborhood, while
e(A-L)=85-30+e(A[L])>=55. Contradiction; thus ell>=6.

For i=1,2 let D_i={t in T_i-{a}:d_A(t)=9}. Its size is at most2:
three degree-nine vertices with a would give total degree37, less than
Claim01's lower bound38. The set

```text
{a} union X union D_i
```

meets every I4. To see this, an I4 avoiding a and X uses a U pair
with both degrees at least7 and sum at most14. Both degrees must
therefore be7, and the two selected T vertices must each have degree9.
In particular its T_i vertex belongs to D_i. If p=0, the hitting set
has size at most3, contradicting the four-transversal theorem. If p=1,
its size is at most4; size at most3 contradicts that theorem, and size4
contains a degree-six vertex, contradicting Claim01. Thus p>=2.

Since all X vertices lie in L, if ell>=7 then
sum_U d_A<=7*7+4*13-p<=99<100 (larger ell only decreases the bound).
Hence ell=6. Write D=sum_(u in U-L)(13-d_A(u)). Then

```text
sum_U d_A=107-p-D>=100,
p+D<=7.
```

Every I4 containing a has at least two vertices of L. In the case with
one further T vertex, its U pair has sum at most13, whereas a vertex
of U-L and any other U vertex have degree sum at least8+6=14.
In the case with three U vertices, two of them outside L would have
their degree sum with the third degree at least6 bounded above by22.
The two outside-L degrees
are at least8, so both must equal8 and the third degree6. These two
degree-eight vertices contribute D>=5+5=10, contrary to p+D<=7.
Three outside-L vertices are already excluded by their degree sum24.

An I4 avoiding a likewise has two L vertices, unless its U pair has
degrees6,8. That exception gives p>=2 and D>=5; p+D<=7 forces p=2,D=5.
Then sum_U d_A=100 and both T_i have total degree40. Consequently
|D_i|<=1: two degree-nine vertices and a of degree10 would force the
fourth degree12, contrary to Claim01's upper bound11. The hitting set
{a} union X union D_i now has size at most4 and contains degree-six
vertices, contradicting either the four-transversal theorem (if size
at most3) or Claim01 (if size4). Thus this exception is impossible.
Every I4 has at least two vertices in the six-set L.

For any pair u,w in L, the remaining four-set L-{u,w} has only vertices
of degree at most7 and is not a transversal by Claim01. An I4 avoiding
it must contain both u,w, because every I4 has at least two L vertices.
Therefore every pair of L vertices is nonadjacent, yielding I6 in the
I5-free graph A. This contradiction proves the singleton theorem.

The residual actual-column s=6 interface has a singleton overlap of
degree ten by Claim05 and independent_triples.md, Claim06. It falls
under the theorem just proved, excluding that whole child. Together
with the separate s=4,s=5,s=7 closures and the original s=4..7 coverage,
this excludes r=2 after all dependencies are independently accepted.

Search use: propagate the general singleton degree-ten incompatibility;
terminate r=2,s=6 and hence r=2 after independent acceptance of this
claim and the exact child-coverage/dependency chain.

Reviews: [exact singleton-ten and coverage review](review_singleton_ten_20261014_pivot.md); [full independent triple-agent review](review_low_excess_columns_20261014_triples.md).

## Current limit

The disjoint-transversal argument excludes s=4; the degree-eleven singleton
argument excludes s=5; the parallel saturated-label argument excludes s=7.
The remaining s=6 child is excluded by the general degree-ten singleton
theorem after the parallel two-overlap exclusion. All six claims and every closure dependency have exact-revision independent
acceptance. The entire r=2 branch is excluded on those premises. These
deductions do not decide x=136, degree18, or order43.
