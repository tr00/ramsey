# Strict improvement by re-rooting at a degree-18 vertex

Date: 2026-10-21. Task: `reroot-density-20261021`.
Author and self-auditor: Main, working alone.

These claims are **ready for independent review**, with no acceptance or
executable pruning change. The aim is to replace an actual degree-18 root
by another actual degree-18 root with strictly more neighborhood edges.
The graph stays fixed. No complementation or edge augmentation is involved.
The user supplied the closure of x137 and x138; neither closure is needed
in these proofs. No novelty claim is made.

## Setting and premises

Let G be a simple K5/I5-free graph on 43 vertices. Write

```text
P = {v : d_G(v)=18},  epsilon_z = d_G(z)-18,
W = sum_z epsilon_z,  B0 = W/2+4,
a_v = e(G[N(v)]),  q_v = 85-a_v,
E_v = sum_(z in N(v)) epsilon_z                 (v in P).
```

The recorded Ramsey bounds give 18<=d_G(z)<=24, so epsilon is in 0..6
and W is even. The published neighborhood and antineighborhood edge
intervals give 50<=a_v<=85 and

```text
q_v + E_v <= B0.
```

These premises and their derivation are in [pivot classes](pivot_classes.md).
Their external sources are Angeltveit--McKay, arXiv:2409.15709v2,
Appendix A, Table 1, for the (4,5) edge intervals, and McKay--Radziszowski
1992, Table 1, p. 16, for the (4,4) intervals recorded in the
[root table](../../../README.md#state-of-the-art). They are retained as
literature premises, not recertified here.

For a (4,4)-free graph of order m use the lower edge bounds

|m|10|11|12|13|14|15|16|17|
|---|---|---|---|---|---|---|---|---|
|L(m)|14|19|26|33|41|50|60|68|

For m=0..9 set L(m)=binom(m,2)-floor(m^2/3), from Turan's
theorem applied to the K4-free complement. This completes the lower
bound function at every cell order used below.

At orders 11..17 these are the recorded published bounds. At order 10,
L(10)=14 follows by complementing the elementary upper cap 31 proved
in [core caps](x136/five_column_compatibility.md#claim-five-columns-core-caps).
The proofs also use R(3,4)=9 and R(4,4)=18, the accepted
[connectivity classification](neighborhood_connectivity.md), the
[17-core codegrees](large_row_extensions.md#claim-seventeen-codegree-moments),
and the [K1 attachment bounds](k1/research.json).

A strictly improving destination has q_u<q_v. Choosing a root maximizing
a_v over the nonempty finite set P therefore forbids every applicable
strict improvement certificate. Arbitrary roots need not satisfy these
restrictions. The destination's E_u and x_u must be recalculated; density
improvement alone does not order either of them.

<a id="claim-reroot-family-transport"></a>
## 1. Excess transport through any family of eligible destinations

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-family-transport`  
Kind: local-deduction  
Review state: ready  
Scope: the setting; any nonempty F subset P; any initial v in P  
Dependencies: q_u+E_u<=B0; exact degree incidence  
Conclusion: the family and local-neighborhood certificates below  
Search use: none pending independent review; proposed re-rooting/propagation  
Reviews: none

Put t=|F| and

```text
J_F = sum_(u in F) E_u
    = sum_z epsilon_z |N_G(z) intersect F|.
```

For any proved lower bound J_lo<=J_F, some u in F satisfies

```text
a_u >= 85 - floor(B0-J_lo/t).
```

In particular, the strict test

```text
J_lo > t*(B0-q_v)
```

forces a_u>a_v at an actual degree-18 destination. If v belongs to F,
this strict inequality ensures that the destination is different from v.

Proof. Sum q_u+E_u<=B0 over F. Then
sum_F q_u<=t B0-J_F<=t B0-J_lo, so some integral q_u is at most
floor(B0-J_lo/t). Rearranging proves both assertions. The incidence
formula counts each excess vertex once for each neighbor in F.

The same count can force **multiple** better roots. Put
T0=B0-q_v and U0=min(W,B0,108), and assume 0<=T0<U0. Let
M=|{u in F:q_u<q_v}|. A non-improving root has E_u<=T0;
every root has E_u<=U0. Hence

```text
M >= max(0,ceil((J_lo-t*T0)/(U0-T0))).
```

If T0<0, the budget already forces every root in F to improve. If
U0<=T0, this weighted count alone cannot give strict improvement.
When v belongs to F it is automatically excluded from the counted
strict destinations. This gives a family of improving choices, with
all original degree-18 and location properties retained.

There is a useful certificate entirely in the original root's row/column
data. Put A=N(v), B=M(v), A_+=A-P, z=|A_+|, and F=A intersect P.
If z<18, then

```text
J_F >= sum_(y in A_+) epsilon_y max(0,d_A(y)-z+1)
     + sum_(y in B) epsilon_y max(0,|N_A(y)|-z).
```

Indeed a vertex in A_+ has at most z-1 neighbors in A_+, and a B vertex
has at most z. The pivot carries no excess. This lower bound uses no
neighborhood-edge count at a destination and retains the actual eligible
family. Any sharper proved attachment bounds may replace these terms.

<a id="claim-reroot-independent-four"></a>
## 2. Independent anchors cancel total excess

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-independent-four`  
Kind: local-deduction  
Review state: ready  
Scope: every actual independent t-set I subset P, t=2,3,4; any initial v in P  
Dependencies: preceding claim; K5/I5 obstructions  
Conclusion: the signed signature-excess certificates below  
Search use: none pending independent review; proposed re-rooting/propagation  
Reviews: none

For an independent t-set I subset P, let W_j sum the excess on vertices
outside I having exactly j neighbors in I, including j=0. Put

```text
D_I = sum_(j=0..t) (t-2j)W_j.
```

Some u in this same I satisfies

```text
q_u <= 4+floor(D_I/(2t)),
a_u >= 81-floor(D_I/(2t)).
```

Thus D_I<2t(q_v-4) forces strict improvement from v. To prove it,
use W=sum_j W_j and sum_I E_u=sum_j jW_j in the sum of
q_u+E_u<=W/2+4. This gives sum_I q_u<=4t+D_I/2. Average.
The formula also holds for any t-set of degree-18 roots; independence
supplies the additional signature restrictions used below.

For t=2,3 the certificate specializes to

```text
t=2: a_u >= 81-floor((W_0-W_2)/2),
t=3: a_u >= 81-floor((3W_0+W_1-W_2-3W_3)/6).
```

For an independent triple, its exact empty-signature class is a clique
of size at most four, so W_0<=24. This gives small witnesses even when
an independent four is unavailable. No empty class is discarded for
triples or pairs. Any family of at least14 degree-18 roots contains
an independent triple by R(5,3)=14, and any family of at least25 contains
an independent four by R(5,4)=25.

For t=4, W_0=0 by I5-freeness. Put

```text
Delta_I = W_1-W_3-2W_4.
```

Some u in this same I satisfies

```text
q_u <= 4 + floor(Delta_I/4),
a_u >= 81 - floor(Delta_I/4).
```

Consequently Delta_I<4q_v-16, equivalently Delta_I<324-4a_v,
forces a strict re-rooting from v. At a maximum-density root, every
eligible I necessarily satisfies Delta_I>=4q_v-16.

Proof. Every vertex outside I has a nonempty signature, or it extends I
to I5. The four roots carry no excess, so W=W_1+W_2+W_3+W_4, and

```text
sum_(u in I) E_u = W_1+2W_2+3W_3+4W_4
                = 2W-Delta_I.
```

Summing q_u+E_u<=W/2+4 now gives sum_I q_u<=16+Delta_I.
Average and use integrality. The total W cancels exactly; no small-W
assumption or zero neighborhood excess is needed.

Each exact singleton class is a clique of size at most three: a nonedge
with the other three roots gives I5; four clique members with its root
give K5. Thus W_1<=72, and every such I supplies a root with a_u>=63.
If its singleton vertices have degree 18, W_1=0 and a_u>=81, regardless
of W. Excess on triple or quadruple signatures improves that bound.
A bound giving q_u<0 refutes the specified signature configuration.

For example, to force a destination with at least 69, 75, 81, 84 edges,
it suffices respectively that Delta_I<=51,27,3,-9. These bounds land
in the connected, three-connected, four-connected, and q<=1 regimes
of the [accepted connectivity transfer](neighborhood_connectivity.md#claim-connected-density-connectivity).
If |P|>=25, R(5,4)=25 supplies an independent four in P, so the
63-edge guarantee has occurrence coverage. In particular every source
with a_v<=62 then has a strict degree-18 destination, even if no local
degree-18 neighbor is available. This removes every K2/K3 disconnected
source from maximum-density selection under |P|>=25, including the
K3 all-degree-19 small component. Stronger signed tests still
need their stated signature-excess hypothesis. No supplied anchor is
assumed to exist merely because its certificate would be useful.

<a id="claim-reroot-pair-sum"></a>
## 3. A pair certificate with no opposing density metric

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-pair-sum`  
Kind: local-deduction  
Review state: ready  
Scope: every distinct v,u in P, adjacent or nonadjacent  
Dependencies: degree floor 18; correct two-root cell types; lower edge
bounds L; R(4,3)=9  
Conclusion: the exact identity and strict tests below  
Search use: none pending independent review; proposed re-rooting/propagation  
Reviews: none

Exclude the two roots from all cells. Write gamma=1 if vu is an edge
and 0 otherwise, and define S,X,Y,Z as their common neighbors,
v-only neighbors, u-only neighbors, and common nonneighbors. Put k=|S|.
Then |X|=|Y|=18-gamma-k and |Z|=5+2gamma+k. Both X and Y are
(4,4)-free, by the [reviewed cell theorem](obstruction_coverage.md#claim-coverage-root-cell-types).
Let E_S=sum_S epsilon_z. Exactly

```text
a_v+a_u = e(X)+e(Y)+(16+2gamma)k+E_S-e(S,Z).
```

Proof. The two neighborhood edge counts sum to
2e(S)+e(X)+e(Y)+e(S,X)+e(S,Y)+2gamma k.
The degree sum on S is 18k+E_S, of which 2k goes to the two roots
and 2e(S) is internal. Substitute
e(S,X)+e(S,Y)=16k+E_S-2e(S)-e(S,Z).

For an edge, e(S,Z)<=k(7+k). For a nonedge, Z has no I3, and
N_Z(s) has no K4 (it would extend with s to K5), hence each s has
at most eight Z neighbors by R(4,3)=9. Therefore

```text
a_v+a_u >= K_gamma(k)+E_S,
K_1(k) = 2L(17-k)+k(11-k),
K_0(k) = 2L(18-k)+k*(16-min(8,5+k)).
```

If K_gamma(k)+E_S>2a_v, re-rooting at u strictly improves density;
indeed a_u>=K_gamma(k)+E_S-a_v. At a maximum-density root every
degree-18 companion must obey K_gamma(k)+E_S<=2a_v.

Here are excess-free sufficient tests. Each row means that the displayed
pair relation and overlap force strict improvement whenever the source
has at most the listed number of edges. They do not assert occurrence
of a pair of that overlap.

|Relation|Overlap k|K_gamma(k)|Largest source a_v with guaranteed strict improvement|
|---|---|---|---|
|edge|0|136|67 (in fact overlap zero forces a_v=a_u=68)|
|edge|1|130|64|
|edge|2|118|58|
|edge|3|106|52|
|nonedge|1|146|72|
|nonedge|2|138|68|
|nonedge|3|124|61|
|nonedge|4|114|56|
|nonedge|5|106|52|

For example, an actual nonadjacent degree-18 pair with overlap two
re-roots a 68-edge source to at least 70 edges. The overlap-one
nonedge case re-roots a 72-edge source to at least 74 edges.
The identity can be stronger than the table when actual e(X),e(Y),
E_S, or an upper bound on e(S,Z) is supplied. All common-neighbor
excess enters with the favorable sign.

<a id="claim-reroot-small-neighbor"></a>
## 4. Small internal degree gives a row-based improvement certificate

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-small-neighbor`  
Kind: local-deduction  
Review state: ready  
Scope: every v in P and every actual u in N(v) intersect P with
s=d_A(u) in 0..7, A=N(v)  
Dependencies: row (4,4)-freeness; lower edge bounds L  
Conclusion: the local lower bound and strict test below  
Search use: none pending independent review; proposed re-rooting/propagation  
Reviews: none

Put S=N_A(u), R=N_B(u), and w(t)=d_A(t)-epsilon_t. Then |R|=17-s,
and exactly

```text
a_u=s+e_A(S)+e_B(R)+e(S,R).
```

The B row R is (4,4)-free. Also for t in S, its B row has size
17-w(t), so its intersection with R has size at least
max(0,10-s-w(t)). Therefore

```text
a_u >= s+e_A(S)+L(17-s)
      +sum_(t in S) max(0,10-s-w(t)).
```

If this lower bound exceeds a_v, u is a strict destination. The test
needs only original internal degrees, excesses, and e_A(S); it does
not require building or counting the destination's full neighborhood.
It has no connectivity, small-E_v, or small-x assumption. The guarantee
requires epsilon_u=0; small d_A(u) alone does not give global degree 18.

|s|Base s+L(17-s)|Additional contribution per t in S|
|---|---|---|
|0|68|none (the exact destination has 68 edges)|
|1|61|max(0,9-w(t))|
|2|52|max(0,8-w(t))|
|3|44|max(0,7-w(t))|
|4|37|max(0,6-w(t))|
|5|31|max(0,5-w(t))|
|6|25|max(0,4-w(t))|
|7|21|max(0,3-w(t))|

For example, a degree-18 leaf u whose sole A-neighbor t satisfies
w(t)<=2 has a_u>=68, so it strictly improves any source a_v<=67.
If s=2, the two A-neighbors are adjacent, and both have w<=2,
then a_u>=52+1+12=65, improving any source a_v<=64.
For s=3 with e_A(S)=2 and all three w<=1, a_u>=44+2+18=64,
improving any source a_v<=63. These are sufficient local patterns;
their ambient occurrence is not asserted. Actual row-edge counts or
intersection sizes can replace the lower estimates and strengthen the test.

<a id="claim-reroot-small-column"></a>
## 5. Degree-18 B vertices give the complementary column test

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-small-column`  
Kind: local-deduction  
Review state: ready  
Scope: every v in P and every actual y in B intersect P, B=M(v)  
Dependencies: B is K5/I4-free; row and degree identities; lower edge bounds L  
Conclusion: the B-side lower bound and strict test below  
Search use: none pending independent review; proposed re-rooting/propagation  
Reviews: none

Put C=N_A(y), c=|C|, R=N_B(y), and w(t)=d_A(t)-epsilon_t for t in C.
Since y has degree 18, |R|=18-c. The neighborhood of y is C union R,
and R is (4,4)-free: its K4 would join y to make K5, while I4 is
already forbidden in B. Thus c>=1 by R(4,4)=18, and exactly

```text
a_y=e_A(C)+e_B(R)+e(C,R).
```

The B-row of t has size 17-w(t), and includes y. Remove y before
intersecting with R inside the 23-vertex universe B-{y}. This gives

```text
a_y >= e_A(C)+L(18-c)
      +sum_(t in C) max(0,11-c-w(t)).
```

Any value above a_v certifies a strict re-rooting to y. The formula
applies for all c=1..18, using the lower function defined in the
setting. It requires degree 18 at y, rather than merely a small column.

For c=1 the base bound is 68, strictly improving every source a_v<=67.
For c=2 it is 60, strictly improving every source a_v<=59. With
e_A(C)=1 and both w<=3, that latter bound rises to 73. For c=3,
e_A(C)=2 and all three w<=2 give a_y>=50+2+18=70.
The remaining base bounds for c=3..8 are 50,41,33,26,19,14;
the contribution per C vertex is max(0,11-c-w(t)).
The exclusion of y before the intersection count is essential.

In the degree-18 extension data, this B-side test and the A-side test
above cover every eligible vertex, with exact edge formulas even when
their estimated lower bounds are too weak. They can be checked before
choosing a new root and recalculating its q, E, x, and connectivity.

<a id="claim-reroot-k2"></a>
## 6. Every K2 disconnected neighborhood strictly improves, 61 to 69

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-k2`  
Kind: local-deduction  
Review state: ready  
Scope: d(v)=18 and N(v)=K2 disjoint-union C_16, with C_16 (4,4)-free  
Dependencies: connectivity classification; (4,4,16) exact edge count 60;
row cap 17; R(3,4)=9  
Conclusion: both K2 vertices have degree 18 and neighborhood edge count 69  
Search use: none pending independent review; proposed strict re-rooting
and removal of this branch under maximum-density root selection  
Reviews: none

Proof. Write the K2 vertices as u,w. Their A-degrees are one, so their
B rows have sizes r_u=16+epsilon_u, r_w=16+epsilon_w, with epsilon in
0..1. An A edge has at most eight common B neighbors by R(3,4)=9,
whereas |R_u intersect R_w|>=r_u+r_w-24. Hence r_u+r_w<=32,
forcing both excesses to zero, both rows to have size 16, and their
intersection to have size eight. Each row induces a (4,4)-free graph
with exactly 60 edges. Now

```text
N(u) = {v,w} disjoint-union R_u,
a_u = 1+60+8 = 69,
a_v = 1+60 = 61.
```

The 1 counts vw, the 8 counts w's edges into R_u, and v has none
there. Exchange u,w for the other destination. Density increases by
eight, q drops from 24 to 16, and the destination is connected.

<a id="claim-reroot-k3"></a>
## 7. K3 disconnected neighborhoods improve whenever a small vertex is eligible

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-k3`  
Kind: local-deduction  
Review state: ready  
Scope: d(v)=18 and N(v)=K3 disjoint-union C_15, C_15 (4,4)-free  
Dependencies: connectivity classification; order-15 edge interval 50..55;
row cap and A-edge common-B cap eight  
Conclusion: the degree dichotomy and strict improvements below  
Search use: none pending independent review; proposed re-rooting/branch  
Reviews: none

Write epsilon_1,epsilon_2,epsilon_3 for the small clique's excesses.
Each is in 0..2 and each pair has epsilon_i+epsilon_j<=2: its rows
have sizes 15+epsilon_i and 15+epsilon_j and are adjacent in A, so
their sum is at most 32. If no epsilon_i is zero, all three equal one.
Otherwise any zero-excess member u is an eligible degree-18 destination.

For such u the B row has size 15 and at least 50 edges. Its other
two small-clique neighbors w,t each have at least 15 B neighbors,
so |R_u intersect R_w| and |R_u intersect R_t| are each at least six.
The induced graph on {v,w,t} is a triangle and v has no B neighbors.
Consequently

```text
a_u >= 3+50+6+6 = 65 > a_v,     53<=a_v<=58.
```

There are useful refinements on the same named destination:

```text
a_u >= 65+epsilon_w+epsilon_t.
```

If another small vertex has excess two, its 17-row has common
intersection exactly eight with R_u; the remaining small vertex must
have excess zero. This gives a_u>=3+50+8+6=67. If all three small
vertices have excess zero, each is eligible and the 65-edge guarantee
applies to all three.

Thus a root of maximum neighborhood density cannot have this K3
disconnection unless all three small vertices have degree 19. This
last degree pattern is retained, not declared impossible. A 65-edge
destination is not automatically connected: restart the connectivity
classification there. Since 65 and 67 are outside every disconnected
edge slice [53,58], {61}, {68}, those exact values are connected; an
unknown larger value could still be 68 in the K1 slice.

The retained degree pattern admits a second, wider move. Suppose all
three small vertices have degree 19. Let C_+=C_15-P, z=|C_+|,
E_C=sum_C epsilon_c, and F=C_15 intersect P. Let q=q_v in 27..32.
If z<=2, a strict destination exists in F, even though none of the
three small vertices is eligible. More precisely some c in F has

```text
q_c <= floor(((1+z)*(q+E_C)+222-10z)/(15-z)).
```

For z=0,1,2 this uniformly gives a_c>=69,65,60 respectively,
all strictly greater than the source a_v<=58.

Proof. Every core vertex has at least six C-neighbors by R(4,3)=9
applied to its C-nonneighbors, and at most eight by R(3,4)=9.
Hence each higher-degree core vertex has at least 7-z neighbors in F.
For y in B that misses any small-clique vertex u, the C-nonneighbors
of y have no I3: such a triple with nonadjacent u,y gives I5.
Thus y has at least seven C-neighbors and at least 7-z in F.
The exceptional B vertices adjacent to all three small vertices
number at most three: the full common neighborhood of that triangle
is independent of size at most four, and already contains v.
Their total excess W_exc is at most 18. The three small vertices
carry total excess three and have no core neighbors. Consequently

```text
J_F >= (7-z)*(W-3-W_exc) >= (7-z)*(W-21).
```

The original antineighborhood upper edge bound gives
W<=2q+2E_C+30, since E_v=3+E_C. Summing the root budget over
the 15-z eligible core vertices gives

```text
sum_F q_c <= (15-z)*(W/2+4)-(7-z)*(W-21).
```

Its W coefficient is (1+z)/2>0. Substitute the W upper bound
and simplify to (1+z)*(q+E_C)+222-10z. Use q<=32 and
E_C<=6z for the three uniform destination bounds. For z=2,
this bound is at most 334 over 13 roots, giving q_c<=25 and
a_c>=60. The other maxima are 254 over 15 and 288 over 14.

Therefore a maximum-density K3 root must have all three small
vertices of degree 19 **and** at least three higher-degree core vertices.
For larger z, the unsimplified J_F estimate may still trigger Claim 1
with the actual W_exc and core degrees. The displayed count threshold
is a sufficient uniform result, not a limit of the general certificate.

<a id="claim-reroot-k1-transport"></a>
## 8. K1 with few higher-degree core vertices improves by up to ten edges

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-k1-transport`  
Kind: local-deduction  
Review state: ready  
Scope: the actual K1 double-core decomposition; no maximum-root,
small total W, or fixed x assumption  
Dependencies: family transport; accepted K1 decomposition and budgets;
recorded 17-core regularity and attachments  
Conclusion: the certificate and uniform table below  
Search use: none pending independent review; proposed strict re-rooting
and necessary restrictions on a maximum-density K1 root  
Reviews: none

Use the [double-core notation](k1/research.json): roots v,u of degree 18,
cores C,D of order 17 with degree eight and 68 edges, and T of order seven.
Both roots have a=68. Let E_C,E_D,E_T sum excess on these cells, and
let i,j be the offsets

```text
e(C union T)=144+i,  e(D union T)=144+j,
0<=i,j,  i+j<=16.
```

The [accepted budgets](k1/seven_cell.json) give

```text
E_D=E_C+j-i,  E_T=26+i+j,
W=2E_C+26+2j,  B0=17+E_C+j.
```

Put C_+=C-P, z=|C_+|, F=C intersect P, n=17-z>0.
Define f_z(d)=d max(0,2+d-z). Write E_D=17b+r, 0<=r<17, and

```text
F_z(E_D)=(17-r)f_z(b)+r f_z(b+1),
J_lo=max(0,9-z)*(E_C+E_T)+F_z(E_D),
Q_C=floor(B0-J_lo/(17-z)).
```

Then some c in this actual adjacent degree-18 family satisfies

```text
a_c >= 85-Q_C.
```

In particular Q_C<=16 is a strict improvement from v's 68 edges.
The formula applies to every z<=16, retaining the actual offsets and
excesses. It can provide stronger destinations than the uniform table.

Proof of J_lo. Each higher-degree C vertex has at least 8-(z-1)=9-z
neighbors in F, when this number is positive. Each T vertex has at least
nine C neighbors and hence at least 9-z in F. For d in D, the exact
degree identity is d_C(d)+d_T(d)=9+epsilon_d, and d_T(d)<=7;
therefore d_C(d)>=2+epsilon_d and it has at least
max(0,2+epsilon_d-z) neighbors in F. Count their weighted contributions
to J_F as in Claim 1. This yields the first term and sum_D f_z(epsilon_d).
The discrete function f_z is convex on the integers 0..6. Moving one
unit from a larger excess to a smaller one differing by at least two
cannot increase its sum. The balanced 17 entries of sum E_D therefore
minimize that sum and give F_z(E_D). Apply Claim 1.

The following are uniform over every offset pair i,j in the stated
outer envelope and every allowed excess distribution. No graph
realizability assertion is used to obtain the bounds.

|Higher-degree vertices z in C|Allowed E_C for this row|Guaranteed a_c|Strict gain from v|Destination structure guaranteed|
|---|---|---|---|---|
|0|0|78|at least 10|vertex connectivity at least three|
|1|1..6|74|at least 6|vertex connectivity at least two|
|2|2..12|69|at least 1|connected|
|3|3..4|69|at least 1|connected|

The exact certificate refines the one-positive-vertex row to 75 when
E_C<=3. With two positive vertices it gives 72 at E_C=2..4,
71 at E_C=5..7, 70 at E_C=8..10, and 69 at E_C=11..12.
These are proved lower guarantees; their attainability is not asserted.

Here is a symbolic verification of the table. In the first three rows,
E_D is at most 16,22,28 respectively. On those intervals convex balancing
gives F_0(E_D)=3E_D; F_1(E_D)>=2E_D;
F_2(E_D)>=E_D. The common expression gives respectively

```text
sum_F q_c <= 55+5j-6i                      (z=0),
sum_F q_c <= 64+6E_C+6j-6i                 (z=1),
sum_F q_c <= 73+7E_C+7j-6i                 (z=2).
```

At z=0, j<=16 gives a bound 135, hence some q_c<=7 and a_c>=78.
For z=1,2 the exact balanced functions on the relevant interval are
F_1(E_D)=2E_D+2max(0,E_D-17) and
F_2(E_D)=E_D+2max(0,E_D-17). Retaining those balanced terms gives
the stronger expressions below:

```text
sum_F q_c <= 64+6E_C+6j-6i-2max(0,E_C+j-i-17)     (z=1),
sum_F q_c <= 73+7E_C+7j-6i-2max(0,E_C+j-i-17)     (z=2),
sum_F q_c <= 82+8E_C+8j-6i-2max(0,E_C+j-i-17)     (z=3).
```

For z=3, E_D<=20 and F_3(E_D)=2max(0,E_D-17).
Each expression is nondecreasing in E_C and j and nonincreasing in i;
thus set i=0,j=16 and E_C equal to 6,12,4 in the three rows. The
upper bounds are respectively 186,247,236. Dividing by the actual
eligible family sizes 16,15,14 gives q_c<=11,16,16 and proves the
table. This derivation is symbolic; the small offset replay is a self-check.

For z=0 the new destination belongs to C and has degree 18; its own
neighborhood excess generally increases. This is precisely why density
is the sole monotone metric. The original isolated vertex u gives only
a tie, 68 to 68, and is not used as the improving destination.

Exchange C,D and v,u for the symmetric certificate. For a
maximum-density K1 root, both cores must have at least three
higher-degree vertices, and if exactly three, their total excess must
be at least five. The full Q_C certificate may eliminate further
parameter profiles, but no all-profile K1 exclusion follows here.

<a id="claim-reroot-max-zero-excess"></a>
## 9. A maximum-density root with zero neighborhood excess is connected

Claim ID: `research/n43/d18/density_rerooting.md#claim-reroot-max-zero-excess`  
Kind: local-deduction  
Review state: ready  
Scope: v maximizes a_v over P, and E_v=0  
Dependencies: preceding K1/K2/K3 improvements; connectivity classification  
Conclusion: G[N(v)] is connected  
Search use: none pending independent review; proposed branch reduction  
Reviews: none

Proof. If it is disconnected, the accepted classification gives
K_m disjoint-union C with m=1,2,3. Nonnegative excess and E_v=0
make every vertex in N(v) degree 18. The K1 case has z=0 and
strictly improves 68 to at least 78; K2 improves 61 to 69;
K3 improves at most 58 to at least 65. Each contradicts maximality.

The destination of a move from an arbitrary zero-excess root need not
itself have zero excess. Thus this proves connectedness conditional on
both maximum density and zero excess at the same root. It does not
assert that every graph possessing a zero-excess root possesses a
maximum-density zero-excess root. Restarting the general d18 chain,
rather than the zero-excess child, is always sound.

## Coverage, validation, and remaining work

Each strict move increases an integer a_v in 50..85 while preserving
G and degree 18. Any sequence of such moves terminates after at most
85-a_initial steps. A local terminal root need not maximize a_v over
P; choosing a global maximum at the outset is the safe coverage rule.
Existing theorem chains can be applied anew to the actual destination.

The accompanying [report](../../reports/2026-10-21-density-rerooting.md)
records the exact arithmetic audit, dependency hashes, and scope.
The claims have author self-checks only. No solver, graph search,
catalogue processing, Lean changes, downloads, or independent review
was performed, and accepted branch/navigation status is unchanged.

The retained gaps are general connected roots with no triggered pair or
transport certificate, K1 with both cores outside the displayed low-count
regime, and K3 with small-component degrees (19,19,19) and at least three
higher-degree core vertices. No theorem
here forces q<=2 in every degree-18 graph or decides order 43.
