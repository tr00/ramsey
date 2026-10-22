# Four size-four columns above the degree-18 frontier

Date: 2026-10-14. Author: four-column agent (band137-r4-20261014).
Base revision: `81c768a`. Purely mathematical deductions; no graph search,
enumeration, solver, download, installation, or novelty review was performed.
Claims 1..6 have been independently checked by the coordinator; the exact
revision review is [recorded beside this note](review_band137_four_columns_20261014_coordinator.md).
Author's additional checks remain self-checks.

Let G be an order-43 graph with neither K5 nor I5, v a degree-18 pivot,
A=N(v), B=M(v), and C_y=N_G(y) intersect A. Thus A is (4,5)-free on 18
vertices and B is (5,4)-free on 24 vertices. In particular A may contain I4,
whereas B cannot. Write

```text
q=85-e(A), epsilon_a=d_G(a)-18, E=sum_(a in A) epsilon_a,
x=e(A,B)=136+k, k=2q+E.
```

The recorded census bound gives q>=0, and 18<=d_G(z)<=24 gives
0<=epsilon_z<=6. Assume there are four size-four columns, with their B
vertices denoted Q={y_1,y_2,y_3,y_4} and T_i=C_(y_i). For a in A put

```text
m(a)=|{i:a in T_i}|.
Z={z in B-Q:|C_z|>=7}, h=|Z|,
p(a)=|{z in Z:a in C_z}|.
```

No distinctness of the T_i is assumed. The statements below concern actual
columns in the complete graph, rather than arbitrary isolated transversals.

<a id="claim-four-column-stability-01"></a>
## 1. Vertex degrees in an actual size-four column

Claim ID: `research/n43/d18/four_column_stability.md#claim-four-column-stability-01`  
Kind: local-deduction  
Review state: accepted  
Scope: any rooted (G,v) as above; every a in every actual size-four column T  
Dependencies: 14-vertex (4,4)-free edge interval 41..50, cited in
[four-transversal attempt](x136/transversal_five_attempt.md), sections 1 and 6;
R(3,4)=9; R(4,5)=25 for the global degree range  
Conclusion: `9-q<=d_A(a)<=11`; for any a in A, `d_A(a)>=6-q` additionally
uses the published (4,5,17) upper edge bound 79  
Search use: propagate  
Reviews: [coordinator review](review_band137_four_columns_20261014_coordinator.md)

Proof. Every C_y meets every I4 of A: otherwise its missing independent
four-set, together with y, gives I5. Therefore K=A-T is (4,4)-free on 14
vertices, and 41<=e(K)<=50. For t in T, its K-neighborhood is triangle-free
(a triangle together with t gives K4) and I4-free (as a subset of K), so
its size is at most eight. Its T-degree is at most three. This proves
d_A(t)<=11.

For the lower bound, fix t in T and set J=T-{t}. If A[J] has at most two
edges, then

```text
e(A-t)=e(K)+e(J,K)+e(A[J])<=50+24+2=76.
```

If J is a triangle, the three K-neighborhoods have empty triple
intersection, because A has no K4. Each pair intersection is independent:
an edge there, together with that pair of J vertices, gives K4. It is
anticomplete to the third J vertex, since J is a triangle. Its size is
therefore at most three, since four independent vertices in this intersection,
together with the third J vertex, give I5. Inclusion-exclusion gives
e(J,K)<=14+3*3=23. Thus again

```text
e(A-t)<=50+23+3=76.
```

In both cases d_A(t)=e(A)-e(A-t)>=85-q-76=9-q.
This avoids transferring the equality-frontier attachment classification to
q>0. Finally A-a is (4,5)-free on 17 vertices, so its published maximum 79
gives d_A(a)>=85-q-79=6-q for arbitrary a. This last premise is recorded in
[pivot classes](pivot_classes.md), section 2, citing Angeltveit-McKay,
arXiv:2409.15709v2, Appendix A, Table 1.

<a id="claim-four-column-stability-02"></a>
## 2. Exceptional-column and overlap defects

Claim ID: `research/n43/d18/four_column_stability.md#claim-four-column-stability-02`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) above with four actual size-four columns; no
assumption excluding size-three columns elsewhere is needed  
Dependencies: claim-four-column-stability-01; R(4,3)=9; degree identity
`|N_B(a)|=17+epsilon_a-d_A(a)`  
Conclusion: Q is K4; all other columns have size at least six;
`sum_(z in B-Q)(|C_z|-6)=k`, so `h<=k`; and the overlap bounds below hold  
Search use: propagate  
Reviews: [coordinator review](review_band137_four_columns_20261014_coordinator.md)

Proof. If y,z in B are nonadjacent, D=A-(C_y union C_z) is K4-free as a
subset of A and contains no I3, since an I3 together with y,z gives I5.
Hence R(4,3)=9 gives |D|<=8 and |C_y union C_z|>=10. Two size-four
columns consequently force adjacency, so Q is K4. Any other column of
size at most five has union at most nine with every T_i; its B vertex is
then adjacent to all of Q and gives K5. Thus all twenty external columns
have size at least six. Their sum gives

```text
136+k=4*4+20*6+sum_(z in B-Q)(|C_z|-6),
k=sum_(z in B-Q)(|C_z|-6)>=h.
```

For an external size-six column C_z containing a, nonadjacency of z to
any y_i with a in T_i would give |C_z union T_i|<=9, impossible. Such z is
therefore adjacent to every Q member counted by m(a).

If m(a)=4, Q plus a gives K5. If m(a)=3, no ordinary size-six neighbor
of a is possible: it would form K5 with a and those three Q vertices.
Consequently its cross degree is at most 3+p(a), and

```text
d_A(a)>=14+epsilon_a-p(a),
p(a)>=3+epsilon_a.
```

The second inequality uses d_A(a)<=11. If m(a)=2, all its ordinary
size-six neighbors are adjacent to the same Q edge. Any edge among two
of them gives K5 with a and that Q edge. They are independent, and B is
I4-free, so there are at most three. Thus its cross degree is at most
2+3+p(a), and

```text
d_A(a)>=12+epsilon_a-p(a),
p(a)>=1+epsilon_a.
```

In particular every repeated A member belongs to an exceptional column.
Triple members need at least three distinct exceptional neighbors, even
if one exceptional column has a large size excess. The number p(a),
rather than the total column-size excess, governs this local obstruction.

<a id="claim-four-column-stability-03"></a>
## 3. An independent-four anchor filter

Claim ID: `research/n43/d18/four_column_stability.md#claim-four-column-stability-03`  
Kind: local-deduction  
Review state: accepted  
Scope: every rooted (G,v) with four actual size-four columns; every I4 X in A  
Dependencies: claims-four-column-stability-01 and -02; singleton-signature
anchor argument in [frontier band](frontier_band.md), independent-four section  
Conclusion: `sum_(a in X)m(a)>=4` and `sum_(a in X)L(a)<=32+E_X`,
where `E_X=sum_(a in X)epsilon_a` and L is defined below  
Search use: propagate  
Reviews: [coordinator review](review_band137_four_columns_20261014_coordinator.md)

Define the following lower bounds on d_A(a):

|m(a)|L(a)|
|---|---|
|0|6-q|
|1|9-q|
|2|max(9-q,12+epsilon_a-p(a))|
|3|max(9-q,14+epsilon_a-p(a))|

Proof. Every T_i hits X, proving sum_X m>=4. Every B column hits X.
For each a in X, the exact singleton X-signature class {a} is a clique:
two nonadjacent such vertices together with X-{a} give I5. It has size
at most three, since four such vertices and a give K5. There are at most
twelve singleton columns in total. The remaining columns contribute at
least two incidences, so e(X,B)>=36. On the other hand the four vertex
degree identities give

```text
e(X,B)=68+E_X-sum_(a in X)d_A(a).
```

Therefore sum_X d_A<=32+E_X. Claims 1 and 2 give d_A>=L, proving the
stated necessary inequality. This test keeps the actual exceptional-column
incidences p(a) and does not identify all overlaps of equal cardinality.

<a id="claim-four-column-stability-04"></a>
## 4. At most one exceptional column: exclusion at x=137

Claim ID: `research/n43/d18/four_column_stability.md#claim-four-column-stability-04`  
Kind: local-deduction  
Review state: accepted  
Scope: four actual size-four columns; q=0; at most one external column of
size at least seven  
Dependencies: claims-four-column-stability-01 through -03; four-transversal
bound from [frontier band](frontier_band.md), valid at q=0  
Conclusion: E>=5; in particular `r<=3` at x=137. At x=138 the r=4 profile
with one size-eight external column is excluded; r=4 would require two
size-seven external columns. The one-exception profiles at x=139,140 are
also excluded  
Search use: branch  
Reviews: [coordinator review](review_band137_four_columns_20261014_coordinator.md)

Proof. Since p(a)<=1, claim 2 rules out m=3. If m=2 it gives
d_A(a)>=11+epsilon_a, while claim 1 gives d_A(a)<=11. Thus every
repeated member has epsilon_a=0 and d_A(a)=11. Members with m=1 have
d_A>=9, and members with m=0 have d_A>=6.

Take any I4 X in A. Put b=|{a in X:m(a)=2}| and
j=|{a in X:m(a)>0}|. Then 0<=b<=j<=4 and j+b>=4. Consequently

```text
sum_(a in X)d_A(a)>=11b+9(j-b)+6(4-j)=24+3j+2b>=34.
```

For clarity, when j=2 the required b=2 gives 34; when j=3 at least b=1
gives 35; when j=4 the minimum is 36. The values j=0,1 cannot cover all
four T_i. Claim 3 therefore forces E_X>=2 for every I4 X.

At q=0 every three-set fails to hit all I4 of A. Choose three A vertices
with largest epsilon_a and an I4 X disjoint from them. If at most three
vertices have positive excess, then E_X=0. Otherwise the removed three
contribute at least three, and E_X<=E-3. Either possibility contradicts
E_X>=2 when E<=4. Hence E>=5.

At x=137 the exact profile is q=0,E=1, and claim 2 gives h<=k=1,
so four size-four columns are impossible. The same argument covers x=136
as a special case, providing a proof that does not depend on the previously
classified size-four attachment families. At q=0,E=2,3,4 (x=138,139,140),
it excludes h<=1 but leaves h>=2 open. At x=138, k=2 and h>=2 force
exactly two size-seven exceptions and eighteen size-six external columns.

<a id="claim-four-column-stability-05"></a>
## 5. Disjoint size-four columns require at least seven A-excess units

Claim ID: `research/n43/d18/four_column_stability.md#claim-four-column-stability-05`  
Kind: local-deduction  
Review state: accepted  
Scope: four actual size-four columns; q=0; T_1,T_2,T_3,T_4 pairwise disjoint  
Dependencies: claims-four-column-stability-01 and -03; four-transversal
bound at q=0  
Conclusion: E>=7. Thus every r=4 profile with q=0 at x=138..142 requires
overlap, and h>=1  
Search use: propagate  
Reviews: [coordinator review](review_band137_four_columns_20261014_coordinator.md)

Proof. Any I4 X must meet all four disjoint T_i, so it consists of one
vertex from each. Claim 1 gives sum_X d_A>=36, and claim 3 gives E_X>=4.
Choose X avoiding the three largest-excess vertices as in claim 4. If E<=6,
its excess is zero when at most three vertices have positive excess, and
otherwise is at most E-3<=3. Both contradict E_X>=4. Hence E>=7.

For q>0 the same disjoint-column argument only gives E_X>=4-4q for
every I4 X. This is nonpositive for q>=1 and produces no exclusion there.
The E>=7 conclusion must not be applied to q=1,2,3 profiles.

<a id="claim-four-column-stability-06"></a>
## 6. One exceptional column at x=141 and 142

Claim ID: `research/n43/d18/four_column_stability.md#claim-four-column-stability-06`  
Kind: local-deduction  
Review state: accepted  
Scope: four actual size-four columns; q=0; h<=1; E=5 or 6  
Dependencies: claims-four-column-stability-01 through -04; four-transversal
bound at q=0  
Conclusion: E=5 is impossible. At E=6 exactly six A vertices have excess
one and the other twelve have excess zero; the induced graph on those six
vertices is triangle-free  
Search use: branch  
Reviews: [coordinator review](review_band137_four_columns_20261014_coordinator.md)

Proof. Claim 4 shows that every I4 X in A has E_X>=2. Remove three
largest-excess vertices and use the four-transversal bound to find an I4
disjoint from them. The remaining excess is at least two. With total five,
the only possible positive-excess partition is five ones: at most four
positive entries leave at most one after the largest three are removed,
while five positive entries summing to five are all one.

For any pair of the five positive vertices, remove the other three.
An I4 disjoint from those three must contain both vertices of the chosen
pair, because E_X>=2. Thus every positive pair is independent, giving I5,
contradiction. This excludes E=5.

With total six, the remaining excess after the largest three is at least
two only for the partitions six ones or (2,1,1,1,1). For completeness,
support at most four leaves at most one; support five forces (2,1,1,1,1);
support six forces six ones. Consider (2,1,1,1,1). For any pair of the four
unit-excess vertices, remove the excess-two vertex and the other two
unit-excess vertices. Every I4 disjoint from that three-set contains the
chosen pair and has E_X=2.

Use the j,b notation in claim 4. The anchor bound gives sum_X d_A<=34,
while 24+3j+2b is at least 34 and j+b>=4. The only possibility attaining
at most 34 is j=b=2. Hence precisely two anchor vertices are repeated
members (m=2), and the other two have m=0. Repeated members have excess
zero by claim 4, so the chosen positive pair consists of the two m=0
vertices. Every pair of the four unit-excess vertices is therefore
independent and every such vertex has m=0. Those four vertices form I4
missing every T_i, contradicting the actual-column transversal property.
The partition (2,1,1,1,1) is excluded.

Only six unit-excess vertices remain. For any three of these six, remove
the other three. An I4 disjoint from the removed set must include at
least two vertices of the chosen triple. Thus every triple of the six
contains a nonedge, proving that their induced graph is triangle-free.
No contradiction from this remaining six-vertex profile is claimed.

## Profile consequences and proof limits

The following table records only the deductions above, together with the
existing exact frontier profiles. An exceptional-size profile is an integer
partition of k into positive parts |C_z|-6; no listed profile is asserted
realizable.

|x|(q,E)|consequence if r=4|
|---|---|---|
|137|(0,1)|excluded by claim 4|
|138|(0,2)|exactly two size-seven exceptions; repeated members needed|
|138|(1,0)|claims 1..3 apply; no exclusion here|
|139|(0,3)|at least two exceptions; repeated members needed|
|139|(1,1)|claims 1..3 apply; no exclusion here|
|140|(0,4)|at least two exceptions; repeated members needed|
|140|(1,2), (2,0)|claims 1..3 apply; no exclusion here|
|141|(0,5)|at least two exceptions; repeated members needed|
|141|(1,3), (2,1)|claims 1..3 apply; no exclusion here|
|142|(0,6)|repeated members needed; if h=1, six unit-excess A vertices inducing a triangle-free graph|
|142|(1,4), (2,2), (3,0)|claims 1..3 apply; no exclusion here|

In every row r=4 itself forces the other columns to have size at least six,
including the q=3 row. Thus that conditional assertion is independent of
the separate issue of size-three columns in the unrestricted q=3 branch.
Claim 3 at q=3 uses lower size-four degree six and general degree three;
it remains valid but provides no immediate contradiction.

No x value or complete order-43 branch is closed here. The new x=137
exclusion concerns r=4 only. At x=141 with q=0, at least two exceptional
columns and actual overlap are required. At x=142 with q=0, claim 5 forces
overlap and claim 6 narrows a single exception to the six unit-excess profile;
claims 1..3 should be used as interface filters. Further
exclusions require compatibility among the actual exceptional columns,
their adjacencies to Q, and the repeated A vertices.

Self-checks: column totals were counted directly and by the r=4 exceptional
identity; all overlap cases distinguish the I4 prohibition in B from I4
anchors in A; lower size-four degrees were checked by deleting one T
vertex rather than transporting the q=0 family list; all anchor excess
identities include the pivot edge; avoidance of three excess vertices uses
the existing four-transversal theorem and is restricted to q=0 here.
