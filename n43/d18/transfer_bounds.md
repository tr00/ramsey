# Exact budgets and actual-column compatibility for x=137 through 142

Date: 2026-10-14. Author: transfer agent, `band137-transfer-20261014`.
Base revision: `81c768a683d3c3b3df70d4d3b7d03a67d505447b`.
This note independently rederives inherited budgets, records their precise
transfer scope, and extends the adjacent-pivot table and actual-column tests.
No graph search, enumeration, solver, download, installation, or novelty
review was performed. The six claims received independent internal review by
the coordinator; the [exact-revision review](review_band137_transfer_20261014_coordinator.md)
retains the external-premise and coverage limits.

## Setting and coverage

Throughout, G is an order-43 graph with neither K5 nor I5, v has degree 18,
A=N(v), B=M(v), and C_y=N_G(y) intersect A for y in B. Thus |A|=18,
|B|=24, A is (4,5)-free, and B is (5,4)-free. Independent four-sets in A
are permitted and used as anchors; B has no independent four-set.

Write

```text
x=e(A,B)=136+k, a=e(A), b=e(B), q=85-a,
epsilon_z=d_G(z)-18, E_A=sum_(u in A) epsilon_u,
E_B=sum_(y in B) epsilon_y, W=E_A+E_B.
```

The global degree interval 18..24 and published internal edge intervals
50<=a<=85, 144<=b<=160 are premises recorded in
[the reduction index](../reductions.md#81-published-internal-edge-ranges)
and [the baseline](../../docs/mathematical_baseline.md).
The six exact values x=137,...,142 are a bounded subband. The residual
[x>=143](x-ge143/README.md) remains necessary; these tables do not prove an
upper bound x<=142 or that some root belongs to this subband.

<a id="claim-band137-budgets"></a>
## 1. Complete arithmetic profiles in the six-value subband

Claim ID: `n43/d18/transfer_bounds.md#claim-band137-budgets`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above, x=137,...,142; integer q,E_A,E_B,b  
Dependencies: recorded global degree range and internal edge intervals;
[frontier band](frontier_band.md), exact budgets  
Conclusion: the identities and complete necessary profile table below  
Search use: branch  
Reviews: [coordinator review](review_band137_transfer_20261014_coordinator.md)

This transfers existing exact budgets, adding the explicit b endpoint at
x=142. Degree summation over A and B gives independently

```text
324+E_A=2a+18+x,        E_A=k-2q,
432+E_B=2b+x,          E_B=2b-296+k.
```

Therefore k=2q+E_A, with q,E_A nonnegative, gives every possible q in
0,...,floor(k/2). Nonnegativity of E_B and the inherited census interval give

```text
max(144,ceil((296-k)/2))<=b<=160, E_B congruent k mod 2.
```

|x|all necessary (q,E_A) profiles|b interval|E_B interval, step two|
|---|---|---|---|
|137|(0,1)|148..160|1..25|
|138|(0,2), (1,0)|147..160|0..26|
|139|(0,3), (1,1)|147..160|1..27|
|140|(0,4), (1,2), (2,0)|146..160|0..28|
|141|(0,5), (1,3), (2,1)|146..160|1..29|
|142|(0,6), (1,4), (2,2), (3,0)|145..160|0..30|

Each positive epsilon in A is a part at most six of E_A. In particular, at
least 18-E_A vertices of A have global degree 18 in this table; E_A=1
means exactly one degree-19 A vertex and all others degree 18.
As a separate edge-sum check,

```text
e(G)=18+a+b+x=239+b+k-q,
2e(G)=774+E_A+E_B,       W=2b-296+2k-2q.
```

These are necessary integer profiles, rather than existence assertions.

<a id="claim-band137-transfer-scope"></a>
## 2. Which existing neighborhood methods apply

Claim ID: `n43/d18/transfer_bounds.md#claim-band137-transfer-scope`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above; claims restricted to the q cases shown  
Dependencies: [frontier band](frontier_band.md), four-transversal extension
and anchor defects; [safe augmentation](cliques_augmentation.md), section 2;
[elementary two-transversal bound](transfer_summary.md#claim-band137-two-transversal);
[actual q=3 column theorem](x142/q3/three_columns.md#claim-q3-three-column-excess-fourteen)  
Conclusion: all actual columns have size at least four in x=137,...,142;
the stronger isolated-neighborhood theorem remains restricted to q<=2  
Search use: propagate  
Reviews: [coordinator review](review_band137_transfer_20261014_coordinator.md)

For F=complement A, alpha(F)<=3 and e(F)=68+q. The existing deletion-three
proof gives every K4 transversal size at least four when q<=2. Every C_y
is such a transversal. This includes all x137,...,x141 profiles and the
q=0,1,2 profiles at x142. Its 71-edge threshold permits no inference at q=3.

At q=3 the elementary deletion-two argument gives transversal size at
least three: after deleting two transversal vertices, the 16-vertex
(4,4)-free remainder has minimum degree at least seven and hence at least
56 edges, and each deleted vertex has at least eight neighbors in it.
Thus e(F)>=72, contradicting e(F)=71. The new actual-column theorem
then excludes a size-three column whenever E_A<=13; a size-three actual
column would force E_A>=14. Hence every actual C_y has size at least four
in the x142,q3,E_A=0 profile, and more generally for q3 and x=142,...,155.
The last step requires the complete order-43 interface and global degree
identities, beyond an isolated transversal theorem. Its independent review
and retained 15-vertex census premise govern this use.

Consequently 4<=|C_y|<=14 throughout the six-value subband; the upper
endpoint is the inherited single-column bound for a degree-18 pivot.
The following scope table distinguishes the methods:

|q|a|applicable method|exact restriction|
|---|---|---|---|
|0|85|K4 saturation; isolated four-transversal; small-column predicates|no E_A restriction for these transferred facts|
|1|84|isolated four-transversal; at most three individually safe missing edges|augmentation may be absent; do not assume every graph extends to a85|
|2|83|isolated four-transversal; small-column predicates|no isolated five-transversal theorem asserted|
|3|82|isolated three-transversal; actual-column four lower bound|actual four lower bound requires E_A<=13|

The size-four attachment defect budget also transfers whenever an actual
size-four column exists. In F let T=C_y, H=F-T, t=e(F[T]), and set
u=e(H)-41, w=e_F(T,H)-24. The 14-vertex census lower bound and
R(4,3)=9 give u,w>=0, while alpha(F)<=3 gives t>=1. Therefore

```text
u+w+t=3+q, 1<=t<=3+q,
3-q<=e_A(T)<=5, u+w<=2+q.
```

Although first stated in the q<=2 band, this actual-size-four calculation
also applies at q=3, where 0<=e_A(T)<=5 and u+w<=5. It does not rely on
the isolated four-transversal bound; H is (4,4)-free because the actual T
meets every I4 of A. Every T vertex has between six and 8+q F-neighbors
in H, additionally capped by |H|=14.

For any independent four-set I in A, put E_I=sum_I epsilon_u and
eta_I=e(I,B)-36. The transferred anchor identities retain all excess terms:

```text
0<=eta_I<=11+q+E_I,
e_A(I,A-I)=32+E_I-eta_I,
e(A-I)=53-q-E_I+eta_I<=64.
```

They apply at q3 as well, independently of the isolated transversal bound.
The equality identity d_cross(u)=17-d_A(u) must be replaced by
d_cross(u)=17+epsilon_u-d_A(u) whenever E_A>0. Likewise the equality
size-four attachment family list must not be transported to q>0 without
a new argument. The [four-column stability note](four_column_stability.md)
provides such separate arguments, including the new r4 exclusion at x137.
Its [one-exception refinement](four_column_stability.md#claim-four-column-stability-06)
also gives additional q0 filters at x141 and x142.

<a id="claim-band137-small-counts"></a>
## 3. Necessary small-column count ranges

Claim ID: `n43/d18/transfer_bounds.md#claim-band137-small-counts`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above with every column size at least four;
in particular all profiles at x=137,...,142 using the preceding claim  
Dependencies: [small-column predicates](x136/small_columns.md), sections
1 through 3; claim-band137-transfer-scope  
Conclusion: the exact H identity and complete necessary arithmetic ranges below  
Search use: branch  
Reviews: [coordinator review](review_band137_transfer_20261014_coordinator.md)

Let r and s count actual size-four and size-five columns, and define

```text
H=sum_(y:|C_y|>=6)(|C_y|-6).
```

The inherited actual-column predicates give r<=4 and upper s limits
10,10,7,3,0 for r=0,1,2,3,4. Briefly, small-column signatures sharing an
A vertex force pairwise adjacency in B, so at most three can contain
that vertex. This yields 4r+5s<=54. Also L4 is a clique completely joined
to L5, giving clique number at most 4-r in B[L5]; combining the two
incidence restrictions gives the displayed s upper bounds.
The exact column sum gives

```text
x=4r+5s+6(24-r-s)+H=144-2r-s+H,
H=k-8+2r+s>=0.
```

Thus s runs from max(0,8-k-2r) to its respective upper limit. Explicitly:

|x|r0: s|r1: s|r2: s|r3: s|r4: s, H|
|---|---|---|---|---|---|
|137|7..10|5..10|3..7|1..3|0, 1|
|138|6..10|4..10|2..7|0..3|0, 2|
|139|5..10|3..10|1..7|0..3|0, 3|
|140|4..10|2..10|0..7|0..3|0, 4|
|141|3..10|1..10|0..7|0..3|0, 5|
|142|2..10|0..10|0..7|0..3|0, 6|

This table lists the arithmetic ranges before the separately proved
[x137,r4 exclusion](four_column_stability.md#claim-four-column-stability-04).
The reviewed claim excludes that x137,r4 cell. Every remaining cell is
necessary only; further compatibility restrictions may shrink it.
For each cell the formula H=k-8+2r+s fixes the total excess over six,
rather than specifying the number of large columns or individual sizes.
If r4 survives at a higher x, all twenty external columns are at least six
and their excess parts form an integer partition of k.

The inherited overlap refinements also apply throughout this subband:
for r2,s7 the two size-four signatures intersect in at most one vertex;
for r3, 5s<=18-|intersection_(y in L4) C_y|. Thus at r3,s3 their
triple intersection has size at most three. Repeated signatures are allowed;
none of these arguments assumes distinct columns.

<a id="claim-band137-adjacent-pivots"></a>
## 4. Adjacent degree-18 roots, including x142

Claim ID: `n43/d18/transfer_bounds.md#claim-band137-adjacent-pivots`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above with E_A<=6; there exists a degree-18
neighbor u, with bounds indexed by the first root's (q,E_A)  
Dependencies: [pivot classes](pivot_classes.md), section 2;
Angeltveit-McKay, arXiv:2409.15709v2, Appendix A Table 1, E(4,5,17)=79  
Conclusion: the guaranteed codegree bounds below, extending the existing
table to x142  
Search use: branch  
Reviews: [coordinator review](review_band137_transfer_20261014_coordinator.md)

Let t be the number of degree-18 vertices in A and z=18-t. Since each of
the z others contributes at least one unit, z<=E_A and t>=18-E_A>0.
For every u in A, deleting u leaves a 17-vertex (4,5)-free graph with at
most 79 edges, so d_A(u)>=6-q. Put L=max(0,6-q). Sum all A degrees;
some degree-18 u has codegree lambda=d_A(u) at most

```text
floor((170-2q-L*z)/(18-z))
  <=floor((170-2q-L*E_A)/(18-E_A)).
```

The last fraction increases with z, since its derivative has the sign of
170-2q-18L, which is positive for q=0,1,2,3. An edge has codegree at most
13 by R(3,5)=14, so also cap the bound by 13. This gives:

|x|(q,E_A)|guaranteed adjacent degree-18 u with lambda at most|
|---|---|---|
|137|(0,1)|9|
|138|(0,2), (1,0)|9, 9|
|139|(0,3), (1,1)|10, 9|
|140|(0,4), (1,2), (2,0)|10, 9, 9|
|141|(0,5), (1,3), (2,1)|10, 10, 9|
|142|(0,6), (1,4), (2,2), (3,0)|11, 10, 9, 9|

At x142 the uncapped fractions are 134/12, 148/14, 158/16, and 164/18,
giving an independent direct check of the new row. If the actual neighbor
excess multiplicities m_i are retained, the stronger numerator subtracts
sum_(i>0)m_i*max(0,6-q,i), as in the existing pivot note.

The second root's degree is 18; its q and E_A need not equal the first
root's. N(v) intersect N(u) is a (3,5)-free graph on lambda vertices.
The two neighborhoods have union size 36-lambda, including v and u in
the union, and their common-nonneighbor cell has size 7+lambda and is
(4,4)-free. A future gluing reduction must retain every permitted overlap
map, second-root profile, and completion, rather than imposing the first
profile at both endpoints.

<a id="claim-band137-union-ten"></a>
## 5. The same eight-vertex test applies to every union-ten pair

Claim ID: `n43/d18/transfer_bounds.md#claim-band137-union-ten`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above, and every nonadjacent y,z in B with
|C_y union C_z|=10; no q,E_A or column lower-bound hypothesis  
Dependencies: R(4,3)=9, R(3,3)=6;
[eight-vertex boundary proof](x136/small_columns.md#4-the-eight-vertex-boundary-for-nonadjacent-size-five-columns)  
Conclusion: the structure table below for D=A-(C_y union C_z), extending
the existing size-five pair statement to all actual union-ten pairs  
Search use: propagate  
Reviews: [coordinator review](review_band137_transfer_20261014_coordinator.md)

For any nonadjacent y,z, D has no K4 as a subset of A, and no I3 because
that triple together with y,z would give I5. Thus |D|<=8 and every such
pair satisfies |C_y union C_z|>=10. In particular:

|nonadjacent column sizes|necessary intersection restriction|
|---|---|
|4,6|disjoint; union exactly ten|
|5,5|disjoint; union exactly ten|
|5,6|intersection at most one; equality gives union ten|
|4,c|intersection at most c-6; c<6 impossible|

For union ten, D is an eight-vertex (4,3)-free graph. Each degree is at
least four: its nonneighbors are a clique, of size at most three. Each
degree is at most five: its neighborhood is triangle-free and I3-free,
so has at most five vertices by R(3,3)=6. Let h count degree-five vertices;
handshake makes h even and e(D)=16+h/2. Goodman's identity, with no I3,
gives t(D)=8+h. A five-vertex neighborhood is C5: its vertex degrees
are at most two from triangle-freeness and at least two from alpha<=2.
A four-vertex neighborhood has at most four edges by Mantel. Counting
triangles through all neighborhoods gives

```text
3(8+h)<=5h+4(8-h)=32+h, hence h<=4.
```

|h|e(D)|triangles in D|additional consequence|
|---|---|---|---|
|0|16|8|all degrees four|
|2|17|10|each degree-five neighborhood is C5|
|4|18|12|each degree-four neighborhood is C4, each degree-five neighborhood C5|

In the h4 case equality forces every four-vertex neighborhood to have
four edges; a triangle-free graph attaining Mantel's bound there is C4.
Equivalently complement D is triangle-free with independence number at
most three, degrees two or three, and 10..12 edges. The proof uses only
the induced eight-vertex graph, so it transfers verbatim from size5+size5
to size4+size6 and every other actual union-ten pair.

<a id="claim-band137-independent-triples"></a>
## 6. Independent triples couple three actual columns

Claim ID: `n43/d18/transfer_bounds.md#claim-band137-independent-triples`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above and every independent triple y,z,w in B;
no q,E_A or lower column-size hypothesis  
Dependencies: inherited ambient types; claim-band137-union-ten pair bound  
Conclusion: |C_y union C_z union C_w|>=15; its A complement is a clique
of size at most three; the concrete size4/5/6 restrictions below  
Search use: propagate  
Reviews: [coordinator review](review_band137_transfer_20261014_coordinator.md)

Let D=A-(C_y union C_z union C_w). Any nonedge of D together with the
independent B triple would give I5. Thus D is a clique; since A has no
K4, |D|<=3 and the union has size at least 15. When the union has size
15, the three leftover vertices must form K3.

The exact inclusion-exclusion form retains actual overlaps:

```text
sum_(pairs)|C_i intersect C_j|-|C_y intersect C_z intersect C_w|
  <=|C_y|+|C_z|+|C_w|-15.
```

This extends the existing independent size5 triple result as follows:

|sizes of an independent B triple|necessary actual-column conditions|
|---|---|
|5,5,5|pairwise disjoint; the three leftover A vertices form K3|
|4,6,6|each six-set disjoint from the four-set; the six-sets intersect in at most one vertex|
|5,5,6|the five-sets are disjoint; the six-set meets their union in at most one vertex|
|6,6,6|sum of pair overlaps minus triple overlap is at most three|

The first pair-disjointness facts follow from the nonadjacent pair bound;
the remaining overlap budgets are exact union counts against fifteen.
Any triple whose column sizes sum to at most fourteen is immediately
excluded from being independent. If the union has sixteen or seventeen
vertices, respectively its two or one remaining A vertices still form a
clique (so for two vertices the edge is required).

For r3, B[L5] is independent: an edge there together with the L4 triangle
would give K5. Thus if r3,s3 occurs at any x in this subband, its three
size-five columns are pairwise disjoint and leave a K3 in A. This adds
an actual induced-subgraph condition to the numerical r3,s3 range.

## Limits and intended use

Claims 1 through 3 transfer or specialize existing budgets, with the new
q3 actual-column theorem explicitly identified as a changed dependency.
Claim 4 adds the x142 adjacent-pivot row; claims 5 and 6 extend established
pair/triple methods to further actual column combinations. None closes a
complete x value or establishes a construction. They supply branch and
interface propagation conditions for a later certified order-43 proof.
Root selection, symmetry coverage, full interface completion, and all
residual x>=143 profiles still need their separate coverage arguments.

Author checks: independent degree sums and edge sums agree; every q profile
was included; H was counted directly rather than identified with a large-
column count; adjacent-pivot arithmetic retained the excess multiplicities
and did not copy the first profile onto the second root; all pair/triple
proofs retain the (4,5)-type of A and (5,4)-type of B. External census and
smaller Ramsey premises remain unverified evidence dependencies in this
task. An author audit is not an independent review or a certificate.
