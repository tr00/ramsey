<!-- tau-q0-review-integration:start -->
Integration status (2026-10-19): all ten claims independently **accepted** at
SHA-256 `491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8`:
[foundations audit](review_q0_foundations_20261019_independent.md), Claims1..4;
[closure audit](review_q0_closure_20261019_independent.md), Claims5..10.
The q1 sibling is independently accepted. Together they exclude **all x138**;
with x136/x137, every degree18 root has x>=139 and zero A-excess forces x>=140.
The author-stage body below is unchanged; its ready labels are historical.
Permitted use: terminate the stated x138 cases and propagate these root bounds.
No full connected-d18 or order43 exclusion, novelty or formal certificate.
<!-- tau-q0-review-integration:end -->

# Excluding x138 with q0 and two neighborhood excess units

Date: 2026-10-19. Authors: TauQ0Closure and Main. The moment-profile
closure in Section 7 and common-anchor closure in Section 8 were jointly
derived. Base revision: `1581b3ae1b0e5ca5b65a6177fd8d04678ef96782`.

**Review state: ready, not accepted.** Distinct-author review of the exact
file hash is required. The proof below excludes the whole x138,q0 slice
on its recorded premises. No branch status changes before acceptance.
There is no solver, candidate-graph search, catalogue processing, download,
installation, theorem prover, or novelty claim. The tables are exact finite
scalar identities, not graph enumeration. No build, test, lint, or formatter
was run.

## Setting, existing results, and exact source revisions

Let G be K5/I5-free on 43 vertices, with a degree-18 pivot v. Write
A=N(v), B=M(v), C_y=N_A(y), and assume

    |A|=18, |B|=24, e(A)=85, e(A,B)=138,
    epsilon_a=d_G(a)-18>=0, sum_A epsilon=2.

Thus A is K4/I5-free, B is K5/I4-free, and A may contain I4. The two
excess distributions are one epsilon=2 or two epsilon=1. Put

    w(a)=d_A(a)-epsilon_a,  L={a:w(a)<=7}, ell=|L|,
    D={a:w(a)=8}.

The exact identities and degree bounds are

    sum_A w=168,  d_B(a)=17-w(a),  6<=d_A(a)<=13,
    4<=w(a)<=13.

The A-degree floor uses E(4,5,17)<=79; the ceiling uses R(3,5)=14.
An **anchor** means an independent four-set all of whose weights are eight.
A **tight independent four-set** means one whose weight sum is 32.
Transversals below are arbitrary subsets of A hitting every I4 of A, not
merely actual columns.

Existing premises used, with SHA-256 hashes of the files read:

|Source|SHA-256|
|---|---|
|`docs/workflow.md`|`51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2`|
|`README.md`|`a31dbbee3d997679089ed94c8ac8fd09ccebaf01aebd4dc42f6ccf1ee4660fac`|
|`research/n43/d18/frontier_band.md`|`c13e57b0f788d7286325f0d12ae73ef4851eb2f55b9bf8f25ce113a79918323a`|
|`research/n43/d18/four_column_stability.md`|`71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a`|
|`research/n43/d18/transfer_summary.md`|`cdb100001576f060c3e564b29b6669e4822ce75e02ca5fee550196ce86dd3a80`|
|`research/n43/d18/x137/effective_anchor.md`|`2eed07f6cfb1b61b0a0653d99078d5dbcfc408f369798576c4b4fcfd3dab2b2e`|
|`research/n43/d18/x137/frontier_closure.md`|`7090245d842a24dd4bb3aab71f3c973e3ea79dc5dd1ac8e7a37cae74cd93abfa`|

The [frontier-band four-transversal bound](../frontier_band.md) gives
transversal number at least four at q=0. Every member of a four-set
transversal has A-degree at least nine: the proof of
[stability Claim 01](../four_column_stability.md#claim-four-column-stability-01)
uses only that its 14-vertex complement is K4/I4-free. The quantifier
extension to arbitrary transversals is explicit in
[the accepted x137 note](../x137/effective_anchor.md), setting and Claim 3.

The reviewed four-column results and
[transfer summary](../transfer_summary.md) do not already prove tau>=5
at x138,q0; their x138 restriction is conditional on four actual size-four
columns. Section 5 below rules out even one abstract four-set transversal.
No x137-specific effective-weight conclusion is assumed at x138.

For K4/I4-free graphs of order m use these upper caps U(m), with the
published order-11..17 caps recorded in the
[root table](../../../../README.md#state-of-the-art), and the elementary
order-ten cap proved in the x137 effective-anchor note:

|m|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|U(m)|0|0|1|3|5|8|12|16|21|27|31|36|40|45|50|55|60|68|

At m=6,7,8,9 equality in the K4-free Turan cap gives respectively
K222, K322, K332, K333. For a j-set S in A let b4(j) be the number of
edges in four disjoint balanced cliques of total order j. Turan applied
to the complement gives e(A[S])>=b4(j), with the standard equality case.
In particular b4(5..11)=1,2,3,4,6,8,10. We also use the smaller Ramsey
numbers R(3,3)=6, R(3,4)=9 and R(4,4)=18, as in the root table.

<a id="claim-q0-tight-defects"></a>
## 1. Tight-set domination and exact deletion defects

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-tight-defects`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; every independent four-set
Dependencies: setting; singleton-signature argument in frontier-band anchor defects
Conclusion: weight sum at most 32; every tight four-set double-dominates
its complement in A; the exact deletion formula below holds
Search use: none pending independent review
Reviews: none

Proof. For an independent four-set I, each B column meets I. Its singleton
signature class at i is a clique, since a nonedge there together with
I-{i} gives I5. It has size at most three, since four members together
with i give K5. Let n1 count singleton signatures and let
h=sum_(|C_y intersect I|>=3)(|C_y intersect I|-2). Then

    e(I,B)=48-n1+h,
    eta_I=e(I,B)-36=12-n1+h=32-sum_I w>=0.

This is the effective-weight version of the existing defect identity; it
requires no condition on which vertices carry the two excess units.
If sum_I w=32, then all four singleton classes are triangles and all
other signatures have size two. A vertex a in A-I cannot miss all of I.
If its unique neighbor in I were i, avoiding I5 would force it adjacent
to all three vertices of the singleton class at i; these three, a, i
would give K5. Thus a has at least two I-neighbors.

Here is an exact, nonnegative defect formula useful in transferring the
x137 argument. Suppose I_1,...,I_m are disjoint anchors, disjoint from L,
and S=L union I_1 union ... union I_m. Put

    F=7ell-sum_L w,
    E_S=sum_S epsilon,
    sigma=e(A[L])-b4(ell),
    rho=e(A[S])-e(A[L])-8*C(m,2)-2m*ell.

All F, 2-E_S, sigma, rho are nonnegative: domination gives eight edges
per anchor pair and two edges per low vertex into each anchor. The deletion
identity gives exactly

    e(A-S)=83-32m+(2m-7)ell+8*C(m,2)+b4(ell)
            +F+(2-E_S)+sigma+rho.                 (1)

For m=0,1,2 the base lower bounds are respectively

    83-7ell+b4(ell),
    51-5ell+b4(ell),
    27-3ell+b4(ell).

Consequently equality in any of these bounds forces all low weights to
be seven, all excess inside S, e(A[L])=b4(ell), and every counted
anchor cut to attain its domination minimum. In particular equality
alone does NOT force the anchor excess to vanish. QED.

<a id="claim-q0-low-not-transversal"></a>
## 2. The low-weight set is not a transversal

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-low-not-transversal`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting
Dependencies: Section 1; core caps; Turan equality; smaller Ramsey numbers
Conclusion: some I4 avoids L, hence an anchor exists
Search use: none pending independent review
Reviews: none

Proof. The sum bound gives 168<=7ell+13(18-ell), so ell<=11. Suppose L
is a transversal. Its size is at least four. If ell=4, each member has
A-degree at least nine, so w<=7 requires epsilon>=2 at each member,
contradicting total excess two. For 5<=ell<=11, H=A-L is K4/I4-free
and the m=0 case of (1) gives:

|ell|5|6|7|8|9|10|11|
|---|---|---|---|---|---|---|---|
|order H|13|12|11|10|9|8|7|
|lower e(H)|49|43|37|31|26|21|16|
|U(order H)|45|40|36|31|27|21|16|

The first three rows contradict their caps. We eliminate the rest without
listing or searching candidate graphs.

**ell=8.** Equality forces A[L]=4K2, every low weight seven, all excess in
L, e(H)=31, and e(L,H)=50. A triangle-free I4-free graph on j vertices
has maximum degree at most three, hence at most floor(3j/2) edges.
A triangle-free eight-set in H would therefore give

    e(H)<=12+2*8+1=29,

impossible. Thus every L vertex has H-degree at most seven. A positive
excess-two vertex in L would have H-degree eight, so the excess is two
unit vertices p,q, each with H-degree seven.

For any triangle-free seven-set T in H, e(T)<=10. If its three-vertex
complement R contains an edge ab, the common T-neighborhood of a,b is
independent and has size at most three. Thus

    e({a,b},T)<=7+3=10,  e(R,T)<=17,
    e(H)<=10+17+3=30,

again impossible. Hence R is independent, and e(H)=31 forces e(T)=10
and all 21 R-T edges. Therefore H=I3 joined to a triangle-free seven-
vertex graph T. This T is the unique triangle-free seven-set: a
triangle-free set meeting R can contain at most three T vertices and
three R vertices. Both p and q therefore have neighborhood T in H.
Since T contains an edge, p,q cannot be adjacent. They and the independent
three-set R give I5, contradiction.

**ell=9, e(H)=27.** Then H=K333. Writing s=sum_L d_A and t=e(A[L]),
we have s=58+t<=65 and t>=6. Thus t=6 or 7, and

    e(L,H)=s-2t=58-t>=51.

Every outside vertex meets at most two parts of H and has H-degree at
most six. Degree six means two whole parts. Two vertices of the same
type cannot be adjacent, because their common H-neighborhood contains
an edge; they cannot be nonadjacent, because they and the omitted
three-part give I5. There are at most three degree-six vertices, so
 e(L,H)<=3*6+6*5=48, contradiction.

**ell=9, e(H)=26.** Equality in the lower bound gives A[L]=K3+3K2,
all low weights seven, all excess in L, and e(L,H)=53. There is no
triangle-free seven-set in H, since it would give at most 10+14+1=25
edges. Hence every H-neighborhood has size at most six. Deleting a vertex
and using U(8)=21 gives minimum H-degree five. The H-degree sequence is
therefore 6^7,5^2.

We need the following exact nine-vertex core classification, proved here.
Its complement F has ten edges, degrees 2^7,3^2, and no independent four-
set. By R(3,4)=9 it contains a triangle T. Since only two F vertices
have degree three, some member of T has degree two and no neighbor
outside T. Consequently F-T has independence number at most two.
If t edges exit T, its six-vertex remainder has 7-t edges. Mantel on
its triangle-free complement gives 7-t>=6, hence t<=1. If t=1, that
complement has nine edges and is K33, so the remainder is 2K3. If t=0,
the remainder has seven edges and independence number at most two;
R(3,3)=6 supplies a triangle U. Some member of U again has F-degree
two, so the other three vertices form a clique. In either case F is
three disjoint triangles plus one edge joining two of them. Thus

    H=K333 with one cross edge deleted.             (2)

For a vertex in the L triangle its H-degree is 5+epsilon; for one in
an L pair it is 6+epsilon. Since all are at most six, the two excess
units must be on two different triangle vertices. Exactly eight L
vertices then have H-degree six. Every triangle-free six-set in (2)
is two whole parts: if it met all three parts, the deleted cross edge
would force two of the part intersections to be its singleton endpoints,
so the set would have size at most five. As in the preceding case, at
most one outside vertex has each of the three full-two-part types.
Eight such vertices are impossible.

**ell=10.** Equality gives H=K332, e(A[L])=8, sum_L d_A=72, and
 e(L,H)=56. A triangle-free subset of H has size at most six. Size
six means the two whole three-parts. At most two outside vertices have
this neighborhood: they are pairwise nonadjacent and three of them with
the omitted two-part would give I5. Thus
 e(L,H)<=2*6+8*5=52, contradiction.

**ell=11.** Equality gives H=K322, e(A[L])=10, sum_L d_A=79, and
 e(L,H)=59. Every triangle-free H-neighborhood has size at most five,
so e(L,H)<=55, contradiction.

All cases are excluded, so an I4 avoids L. Each of its weights is at
least eight and their sum is at most 32; all four are eight. QED.

<a id="claim-q0-no-three-anchors"></a>
## 3. Three disjoint anchors are impossible

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-no-three-anchors`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting
Dependencies: Section 1; Mantel and Turan equality
Conclusion: no three pairwise disjoint anchors exist
Search use: none pending independent review
Reviews: none

Proof. Suppose their union is Z, |Z|=12, and R=A-Z has order six.
Put alpha=e(A[Z])-24>=0, beta=12-e(A[R])>=0 and E_Z=sum_Z epsilon.
Degree sums give the exact identity

    alpha+beta=E_Z-1.                              (3)

If E_Z=0 this is impossible. If E_Z=1, both defects vanish and
R=K222. Every anchor vertex has exactly four Z-neighbors. A positive
excess vertex has five R-neighbors, which contain a triangle, giving K4.

If E_Z=2 there are two cases. If alpha=1,beta=0, R=K222. For z in Z
put t_z=d_Z(z)-4>=0. Then sum_Z t=2 and

    d_R(z)=4+epsilon_z-t_z<=4,

because R has no triangle-free five-set. Thus t_z>=epsilon_z, and equality
of totals forces equality pointwise. Every Z vertex has exactly four
R-neighbors, necessarily two full two-parts. At most two Z vertices have
each omitted-part type: they cannot be adjacent, and three with the
omitted two-part give I5. This allows at most six vertices, not twelve.

If alpha=0,beta=1, e(R)=11 and every Z vertex has four Z-neighbors.
An excess-two vertex would meet all of R, impossible because R contains
a triangle. Thus two vertices p,q have unit excess and five R-neighbors.
The five-set N_R(p) is triangle-free, with at most six edges; its remaining
vertex has at most five neighbors. Equality e(R)=11 forces

    R=K123, N_R(p)=the K23 remainder,

with the singleton part its universal vertex r. The unique triangle-free
five-set in R is this remainder, so q has the same R-neighborhood. Thus
p,q are nonadjacent. Every Z-neighbor z of p is normal and has four
R-neighbors. Avoiding K4 with p forces its intersection with the K23
remainder to be independent. To have four neighbors it must therefore
meet r and the entire three-part. All four Z-neighbors of p have this
same R-neighborhood, and are independent because their common
R-neighborhood contains an edge. Any vertex of the two-part misses all
four, giving I5. This excludes the last case of (3). QED.

<a id="claim-q0-low-count"></a>
## 4. Only zero, one, three, or four low vertices can survive

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-low-count`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; every anchor I
Dependencies: Sections 1..3; core caps and Turan equality
Conclusion: ell is 0,1,3,4; if ell=3 or 4, I union L is a transversal
and all its deletion defects vanish
Search use: none pending independent review
Reviews: none

Proof. Fix an anchor I, available by Section 2. Its four weights are
eight and it is disjoint from L. Hence

    168<=32+7ell+13(14-ell)=214-6ell,

so ell<=7. For ell>=2, if I union L were a transversal, (1) with m=1
and the core caps would give:

|ell|2|3|4|5|6|7|
|---|---|---|---|---|---|---|
|order remainder|12|11|10|9|8|7|
|lower edges|41|36|31|27|23|19|
|upper edges|40|36|31|27|21|16|

Only ell=3,4,5 can survive, necessarily with all defects zero. At ell=5
the remainder is K333. Each vertex of the independent anchor I must miss
one full part of this core, since otherwise its neighborhood contains
a triangle. Two of the four I vertices miss the same three-part; they
and that part give I5. Thus ell=5 is impossible in this transversal case.

If I union L is not a transversal, choose another I4 avoiding it. It is
an anchor J. If I union J union L were a transversal, (1) with m=2 gives:

|ell|2|3|4|5|6|7|
|---|---|---|---|---|---|---|
|order remainder|8|7|6|5|4|3|
|lower edges|21|18|15|13|11|9|
|upper edges|21|16|12|8|5|3|

Only ell=2 could survive. Equality then gives H=K332 and S=I union J
union L has ten vertices, degree sum 80, internal edges 16 and cut
 e(S,H)=48. Every S vertex has a triangle-free H-neighborhood. Group
those of H-degree at least five by their omitted H-part. For the omitted
two-part, each meets both three-parts in at least two vertices, so any
pair has a common edge; this type is independent and has at most two
members. For either omitted three-part, degree at least five means the
whole other three-part and two-part; at most one vertex has each such
type. Therefore

    e(S,H)<=2*6+2*5+6*4=46<48.

Thus I union J union L is not a transversal. A third I4 avoiding it is
an anchor, contradicting Section 3. Consequently, whenever ell>=2,
I union L must be a transversal. The first table then leaves only
ell=3 or 4, with equality. This applies to every chosen anchor. QED.

<a id="claim-q0-tau-five"></a>
## 5. Every abstract transversal has size at least five

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-tau-five`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; arbitrary I4-transversals of A
Dependencies: Sections 1,2,4; four-transversal member degree floor; core caps
Conclusion: tau(I4(A))>=5, and every actual column has size at least five
Search use: none pending independent review
Reviews: none

Proof. Suppose T is a four-set transversal. Every member has A-degree
at least nine. Every anchor meets T, but its zero-excess members have
A-degree eight and cannot belong to T. Put

    Q={a in D:epsilon_a>0}.

Every anchor meets Q, so Q is nonempty and has size one or two. Every
I4 avoiding L is an anchor, hence L union Q is a transversal.
If |Q|=1, its total A-degree together with L is at most 7ell+10,
using total excess two. Its complement has order 17-ell and

    e(A-(L union Q))>=75-7ell+b4(ell+1).

If |Q|=2, both have unit excess, neither low vertex has excess, and the
corresponding bound is 67-7ell+b4(ell+2), at order 16-ell. Section 4
leaves only four rows:

|ell|0|1|3|4|
|---|---|---|---|---|
|one Q: lower|75|68|54|48|
|one Q: upper|68|60|50|45|
|two Q: lower|67|60|47|41|
|two Q: upper|60|55|45|40|

Every row contradicts its core cap. Thus no four-set transversal exists.
The inherited lower bound four excludes smaller transversals as well.
Every actual column is a transversal, proving the column bound. QED.

<a id="claim-q0-zero-one-low-excluded"></a>
## 6. Projected support excludes ell=0 and ell=1

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-zero-one-low-excluded`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting
Dependencies: Sections 1 and 5; degree and weight sums; K4/I5 prohibitions in A
Conclusion: ell=0 and ell=1 are impossible
Search use: none pending independent review
Reviews: none

Proof. If a set U contains every I4 of A, then each C_y intersect U is a
full transversal. By Section 5 it has size at least five; therefore

    sum_(a in U)(17-w(a))>=24*5=120.               (4)

When ell=0, all I4 lie in D. Put t=|D|. Then 9t>=120, but
168<=8t+13(18-t) gives t<=13, contradiction.

Now L={u}, h=w(u) in {4,5,6,7}. Every I4 avoiding u lies in D, so
(C_y intersect D) union {u} is a full transversal. Hence 9t>=96 and
t>=11. The weight sum gives 168<=h+8t+13(17-t), so t<=11 except
possibly t=12 at h=7.

For t=11 the six higher-weight vertices H have sum 80-h, each weight
at least 15-h. An I4 containing one of them must also contain u; its
other two vertices have weight at least eight. Thus only weights at
most 16-h can occur in any I4. If two H vertices met this eligibility
condition, their total with four weights at most 13 would give
80-h<=2*(16-h)+4*13, requiring h<=4. For h>=5 there is at most one
eligible H vertex, with B-degree at most 2+h. All I4 then lie in a set
of B-incidence capacity at most

    99+(17-h)+(2+h)=118,

contradicting (4). If h=7,t=12, all other five weights are 13, none can
occur in I4, and the support capacity is 108+10=118, also impossible.

It remains h=4,t=11. Eligible high vertices have weight at most 12,
and every high vertex has weight at least 11. Three eligible vertices
would give high weight sum at most 3*12+3*13=75<76. If there were at
most one, the support capacity would be at most 99+13+6=118. Thus
there must be exactly two, and equality in the total weight budget
forces the numerical profile

    w=[4,8^11,12^2,13^4].                         (5)

The degree floor six forces epsilon_u=2; all other excesses vanish.
But any adjacent a,b in A satisfy d_A(a)+d_A(b)<=22: their common
A-neighborhood is independent by K4-freeness, so has size at most four,
and their neighborhood union has size at most 18. Therefore the six
vertices of A-degrees 12,12,13,13,13,13 in (5) are pairwise nonadjacent,
giving I5. In particular (5) is excluded, not a remaining obstruction.
This finishes ell<=1. QED.

<a id="claim-q0-four-low-excluded"></a>
## 7. A finite moment bound excludes the four-low equality core

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-four-low-excluded`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting with ell=4
Dependencies: Sections 1,4,5,6; Goodman identity; Mantel; smaller Ramsey numbers
Conclusion: ell=4 is impossible
Search use: none pending independent review
Reviews: none

Proof. Fix an anchor I. Equality from Section 4 gives independent L of
size four, all low weights seven, and H=A-(I union L) K4/I4-free on ten
vertices with 31 edges. All excess is in I union L, so w=d_A on H and

    sum_H w=168-32-28=108.                       (6)

Every member of H has internal degree d between one and eight: the
upper bound is R(3,4)=9 on its triangle-free I4-free neighborhood; the
lower bound follows because an isolated vertex would leave nine
vertices avoiding both K4 and I3, contrary to R(4,3)=9.
For d=1..8 put

    f(d)=min(floor(d*d/4),floor(3*d/2)),
    g(d)=f(d)+f(9-d)+(3/2)*d*(9-d).

Triangle-free neighborhoods in H and its complement, each with
independence number at most three, give 3t(H)<=sum f(d) and
3i3(H)<=sum f(9-d). Goodman's triple-count identity implies

    3*C(10,3)=360<=sum_H g(d).

The exact scalar defects are:

|d|1|2|3|4|5|6|7|8|
|---|---|---|---|---|---|---|---|---|
|74-g(d)-6d|44|30|18|10|4|0|0|2|

Since sum d=62, the sum of these nonnegative defects is at most
740-360-6*62=8. Thus every H vertex has internal degree at least five,
and at most two have internal degree five.

By the adjacent-degree bound in Section 6, vertices of A-degree at least
12 are independent, so H contains at most three of them. If some H
vertex had A-degree 13, its at least five H-neighbors would all have
A-degree at most nine. The other vertices, with at most three high
vertices overall, would give

    sum_H w<=5*9+3*13+2*11=106,

contrary to (6). Thus no H weight is 13. If some were 12, it would have
at least five H-neighbors of A-degree at most ten, giving

    sum_H w<=5*10+3*12+2*11=108.

Equality in (6) forces weights 10^5,11^2,12^3. Each of the three
weight-12 vertices then has exactly the five low vertices as its
H-neighbors, so has internal degree five. Their moment defects already
sum to twelve, exceeding eight. This is impossible. All H weights are
therefore at most 11. Their sum 108 leaves just two possible multisets:

    10^2,11^8,   or   9,11^9.                    (7)

Neither is a graph classification; both will be excluded by an explicit
four-set transversal.

In the first case D=I. Any I4 other than I must contain at least two L
vertices: with no low vertex, a high vertex makes the weight sum exceed
32. With exactly one low vertex and an H vertex, the sum is at least
7+10+8+8=33. The remaining type, one low vertex and three I vertices,
is impossible because every low vertex has at least two I-neighbors
by anchor domination. Thus three L
vertices together with any one vertex of I form a four-set transversal,
contradicting Section 5.

In the second case let z be the unique H vertex of weight nine. Every
I4 avoiding z, other than I, again needs at least two L vertices. Each
L vertex has exactly two neighbors in I by the equality defects in
Section 4. Two L vertices l,l' have distinct I-neighbor pairs; otherwise
all four independent L vertices would have the same two neighbors in
I, and any other I vertex with L would give I5. Delete z, the other
two L vertices, and any one vertex of I, forming a four-set T. An I4
avoiding T would avoid z and would not be I, so it would need the two
remaining low vertices l,l'. It cannot include an H vertex of weight
11, since 7+7+11+8>32. Its other two vertices must lie in I and miss
both l,l'. Their distinct neighbor pairs have union of size at least
three, leaving at most one such I vertex. This is impossible. Thus T
is a four-set transversal, again contradicting Section 5. QED.

<a id="claim-q0-three-low-obstruction"></a>
## 8. The three-low equality obstruction is impossible

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-three-low-obstruction`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting with ell=3
Dependencies: Sections 1,4,5,6
Conclusion: ell=3 is impossible
Search use: none pending independent review
Reviews: none

Proof. Fix an anchor I. Section 4 gives the following exact equality
structure, with no assumption about which anchor vertices have excess:

- L is an independent triple, all three weights are seven.
- H=A-(I union L) has 11 vertices, no K4 or I4, and exactly 36 edges.
- Every low vertex has exactly two I-neighbors, so e(I,L)=6.
- All excess is in I union L. Put E_I=sum_I epsilon and
  E_L=sum_L epsilon, so E_I+E_L=2; E_I need not be zero.
- Every H vertex has epsilon=0, hence d_A=w in {8,...,13}, and

      sum_H w=115,
      e(I,H)=26+E_I,  e(L,H)=15+E_L,
      e(I union L,H)=43.

These are consequences of the vanishing nonnegative defects in (1).
Let r count weight-eight H vertices and k count H vertices of weight
at least 12. The latter vertices are pairwise nonadjacent by the
adjacent-degree-sum bound 22 from Section 6. Since H has no I4, k<=3.

If k=2, all weight-11 H vertices are nonadjacent to both high vertices.
Two nonadjacent weight-11 vertices would form I4 with the two high ones.
Thus the weight-11 vertices form a clique and number at most three.
If k=3, no weight-11 H vertex exists: it would be nonadjacent to all
three high vertices and complete I4.

Suppose r>=3. The degree/weight ceiling 13, and the preceding restrictions
at k=2,3, give the following complete scalar comparison:

|k|upper bound for sum_H w when r>=3|
|---|---|
|0|3*8+8*11=112|
|1|3*8+13+7*11=114|
|2|3*8+2*13+3*11+3*10=113|
|3|3*8+3*13+5*10=113|

Every entry is below 115. More than three weight-eight vertices or fewer
than the permitted weight-11 vertices only lowers the stated upper
bound. Hence r<=2. This bounds a weight multiplicity; it is not a
classification of H graphs.

Now D consists of I and at most two extra vertices. Each extra vertex
has at least two I-neighbors by anchor domination. An anchor other
than I cannot use just one extra vertex: it would also use three
vertices of I, although the extra vertex has at most two nonneighbors
in I. If there are two extras z,z', any other anchor must use both and
two I vertices. This is possible only if z,z' are nonadjacent and have
exactly the same two I-neighbors; in that event its two I vertices
are uniquely determined as their common nonneighbors. Thus there is
at most one anchor J other than I, and J intersects I in two vertices.
Whether J exists or not, some i in I belongs to every anchor.

Every I4 avoiding L is an anchor by its weight bound. Therefore
L union {i} is a four-set transversal of all I4 in A, contradicting
Section 5. This excludes ell=3. QED.

<a id="claim-q0-x138-exclusion"></a>
## 9. Closure of the q0 slice and conditional frontier consequences

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-q0-x138-exclusion`
Kind: local-deduction
Review state: ready
Scope: every order-43 K5/I5-free G and degree-18 root v with
e(A)=85 and sum_A(d_G(a)-18)=2; no connectedness assumption
Dependencies: Sections 1..8
Conclusion: no such rooted graph exists
Search use: none pending independent review; proposed x138,q0 termination
Reviews: none

Proof. Sections 2 and 4 force ell in {0,1,3,4}. Section 6 excludes
zero and one, Section 7 excludes four, and Section 8 excludes three.
These are all possibilities. Both excess distributions are covered,
without deciding in advance which anchors contain their support. QED.

<a id="claim-x138-conditional-frontier-consequences"></a>

Claim ID: `research/n43/d18/tau/q0_effective_reduction.md#claim-x138-conditional-frontier-consequences`
Kind: local-deduction
Review state: ready
Scope: every order-43 K5/I5-free G and every chosen degree-18 root v,
conditional on applicable independent acceptance of this note and the
sibling q1 closure
Dependencies: preceding claim; [q1 closure](q1_anchor_reduction.md#claim-q1-projected-capacity-exclusion);
the accepted x136 and x137 closures; frontier-band exact budget identity
Conclusion: x>=139 and 2q+E_A>=3; q0 implies E_A>=3; q1 implies
E_A>=1; E_A=0 implies q>=2 and x>=140
Search use: none pending independent review of all new dependencies
Reviews: none

The sibling q1 note was read at SHA-256
`aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`.
It is a separate ready proof requiring its own exact-revision review;
this note does not assert that its review has already accepted it.

Proof. The identity x=136+2q+E_A with q,E_A>=0 partitions x138 into
exactly q=0,E_A=2 and q=1,E_A=0. The preceding claim excludes the
first and the sibling theorem excludes the second. Combining with the
separately accepted x136 and x137 exclusions gives x>=139, equivalently
2q+E_A>=3. The stated three specializations follow by setting q=0,
q=1 or E_A=0. The conclusion is conditional at each degree-18 root;
it does not assume that a candidate graph has a low-x root. QED.

The complete order-43 and connected degree-18 problems remain open at
higher cross counts. These are local conditional nonexistence deductions,
not a certified complete Ramsey proof, and no novelty is claimed.
