# Excluding the single-excess frontier x=137

Integration status (2026-10-19): **accepted; the entire x137 branch is excluded**.
Claims 1 and 2 were independently accepted by
[AnchorAudit](review_frontier_closure_20261019_anchor_audit.md), and Claim 3 by
[CapacityAudit](review_frontier_closure_20261019_capacity_audit.md), at exact
file SHA-256 `ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`.
The reviewed author-stage body below is unchanged. This banner governs its
historical ready/pending labels: all three claims are accepted local deductions
on their stated premises; permitted use is full x137 termination and x>=138
propagation together with the existing x136 closure. No novelty or formal
certificate is claimed. See the [integration report](../../../reports/2026-10-19-x137-frontier-closure.md).

Date: 2026-10-19. Task token: `x137-frontier-closure-20261019`.
Author: Main. Independent review is required before branch closure.
No novelty claim, formal certificate, graph search or solver computation.

## Setting and dependencies

Suppose G is a K5/I5-free graph on 43 vertices, v has degree 18,
A=N(v), B=M(v), and x=e(A,B)=137. Thus A is K4/I5-free of order 18
and B is K5/I4-free of order 24. In particular A may contain I4.

The [exact budgets](../frontier_band.md) give e(A)=85 and a unique p in A
with epsilon_p=d_G(p)-18=1. All other A excesses vanish. Put

    w(a)=d_A(a)-epsilon_a,
    L={a in A:w(a)<=7}, ell=|L|,
    D={a in A:w(a)=8}.

Then sum_A w=169, d_B(a)=17-w(a), 6<=d_A(a)<=13, and 5<=w(a)<=13.
The degree floor follows by deleting a from A and using E(4,5,17)<=79;
the ceiling follows from R(3,5)=14. The external bounds are recorded in
the [root table](../../../../README.md#state-of-the-art).

The independently accepted [effective-anchor note](effective_anchor.md)
provides these exact inputs:

1. Every independent four-set I in A satisfies sum_I w<=32, by the
   singleton-signature capacities in the actual 24-vertex B interface.
2. There exists an independent four-set I with w(a)=8 for every a in I.
   Call any such set an anchor.
3. Every abstract transversal of the independent four-sets in A has size
   at least five, not only actual columns C_y=N_A(y).

For K4/I4-free graphs of order m we use the following upper caps U(m):

|m|0|1|2|3|4|5|6|7|8|9|10|11|12|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|U(m)|0|0|1|3|5|8|12|16|21|27|31|36|40|

For m<=9 these follow from Turan's K4-free bound, with cap 5 at m=4.
At m=10 use [the elementary core cap](../x136/five_column_compatibility.md#claim-five-columns-core-caps).
At m=11,12 use the published (4,4) maxima in the root table (36 and 40).
The 12-vertex cap 40, rather than the weaker elementary cap 42, matters.
Turan equality at order six and 12 edges forces K_{2,2,2}.
For any j-set S in A, e(A[S])>=b4(j), where b4(j) sums binomial(part,2)
over four balanced parts of total j. This applies Turan to the K5-free
complement of A[S].

## 1. Anchor domination and the three-anchor obstruction

<a id="claim-x137-closure-anchors"></a>

Claim ID: `research/n43/d18/x137/frontier_closure.md#claim-x137-closure-anchors`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; every effective-weight-eight anchor
Dependencies: setting inputs 1 and 2; Turan's theorem and equality
Conclusion: every vertex of A outside an anchor has at least two neighbors
in it; three pairwise disjoint anchors are impossible
Search use: none pending independent review
Reviews: none

Proof. For any anchor I, e(I,B)=4*9=36. Every B column meets I.
The B vertices with exact I-signature {i} form a clique: a nonedge with
the other three vertices of I gives I5. Each such clique has at most
three vertices, since four together with i give K5. If n1 counts all
singleton columns, then

    36=e(I,B)>=n1+2*(24-n1)=48-n1>=36.

Thus each singleton class has exactly three vertices and forms a triangle.
If a in A-I has only i as an I-neighbor, avoiding I5 forces a adjacent
to all three members of the {i} singleton class. These, a, and i give
K5. Missing all of I also gives I5. This proves double domination.

Suppose I,J,K are disjoint anchors. Put Z=I union J union K and R=A-Z.
Each anchor pair has at least eight edges, so e(A[Z])>=24.
Write delta=1 if p belongs to Z and 0 otherwise. The degree sum on Z is
96+delta. Since R has six vertices and is K4-free, e(A[R])<=12. Hence

    85=96+delta-e(A[Z])+e(A[R])<=84+delta.

Equality is necessary: delta=1, e(A[Z])=24, e(A[R])=12. Thus
A[R]=K_{2,2,2}, every anchor pair has exactly eight edges, and every
vertex of an anchor has exactly two neighbors in each other anchor.
In particular p has four neighbors in Z and d_A(p)=9, so it has five
neighbors in R. Every five vertices in K_{2,2,2} include a triangle.
That triangle with p gives K4 inside A, a contradiction.

## 2. At most one vertex has effective weight below eight

<a id="claim-x137-closure-low-weights"></a>

Claim ID: `research/n43/d18/x137/frontier_closure.md#claim-x137-closure-low-weights`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting
Dependencies: preceding claim; setting inputs 1 and 2; core caps U(m)
Conclusion: ell<=1
Search use: none pending independent review
Reviews: none

Proof. Since 169=sum_A w<=7ell+13(18-ell), ell<=10.
Every I4 avoiding L is an anchor: all four weights are at least eight
and their sum is at most 32. Fix an anchor I, disjoint from L.
Suppose 2<=ell<=10. If I union L were a transversal, its remainder H
would be K4/I4-free of order 14-ell. The deletion identity, domination,
and total excess one give

    e(H)=85-sum_(I union L) d_A+e(A[I union L])
        >=85-32-7ell-1+2ell+b4(ell)
        =52-5ell+b4(ell).

Every possible ell contradicts its core cap:

|ell|2|3|4|5|6|7|8|9|10|
|---|---|---|---|---|---|---|---|---|---|
|b4(ell)|0|0|0|1|2|3|4|6|8|
|order H|12|11|10|9|8|7|6|5|4|
|lower e(H)|42|37|32|28|24|20|16|13|10|
|U(order H)|40|36|31|27|21|16|12|8|5|

Consequently choose a second anchor J disjoint from I and L.
If I union J union L were a transversal, its K4/I4-free remainder H'
of order 10-ell would satisfy

    e(H')>=85-64-7ell-1+8+4ell+b4(ell)
          =28-3ell+b4(ell).

Here the anchor cut contributes at least eight edges and each L vertex
has at least two neighbors in each anchor. Again all rows contradict:

|ell|2|3|4|5|6|7|8|9|10|
|---|---|---|---|---|---|---|---|---|---|
|order H'|8|7|6|5|4|3|2|1|0|
|lower e(H')|22|19|16|14|12|10|8|7|6|
|U(order H')|21|16|12|8|5|3|1|0|0|

Thus a third anchor disjoint from I,J,L exists, contradicting Claim 1.
Rows with remainder order below four already contradict existence of an
I4 there. Therefore ell<=1.

## 3. Projected-column capacity closes x=137

<a id="claim-x137-closure-exclusion"></a>

Claim ID: `research/n43/d18/x137/frontier_closure.md#claim-x137-closure-exclusion`
Kind: local-deduction
Review state: ready
Scope: every order-43 K5/I5-free G and every degree-18 pivot v with x=137
Dependencies: preceding claims; setting inputs 1 and 3; degree/row budgets
Conclusion: no such rooted graph exists
Search use: none pending independent review; proposed full x137 closure
Reviews: none

Proof. Let t=|D|. Each D vertex has nine B neighbors.
If ell=0, every I4 lies entirely in D. Thus C_y intersect D is a full
transversal for every y in B, giving 9t>=24*5=120 and t>=14.
But 169=sum_A w<=8t+13(18-t)=234-5t implies t<=13. Contradiction.

It remains that L={u}, with h=w(u) in {5,6,7}. Every I4 avoiding u lies
in D. Therefore (C_y intersect D) union {u} is a full transversal;
it has at least five vertices, giving 9t>=24*4=96 and t>=11.
On the other hand

    169<=h+8t+13(17-t)=221+h-5t

implies t<=11. Thus t=11 and the remaining six vertices H=A-(D union {u})
have weights greater than eight with total

    sum_H w=169-h-88=81-h.

Because each weight is at most 13, every a in H has w(a)>=16-h.
An I4 containing a must contain u, since otherwise its weight sum exceeds
32. Its other two vertices have weight at least eight. Consequently

    32>=sum_I w>=w(a)+h+16>=32,

so necessarily w(a)=16-h. There is at most one vertex of this weight in
H: two would force

    81-h=sum_H w<=2*(16-h)+4*13=84-2h,

which implies h<=3, contradicting h>=5.

Put H0={a in H:w(a)=16-h} and U=D union {u} union H0.
Every I4 is contained in U, so each actual projected column C_y intersect U
is a full transversal and has size at least five. However

    e(U,B)=99+(17-h)+sum_(a in H0)(17-w(a))
          <=99+(17-h)+(1+h)=117<24*5.

The inequality also covers H0 empty because 1+h>0. This contradiction
excludes the final case and proves nonexistence at x=137.

## Scope and remaining problem

Together with the independently reviewed x136 exclusion and the inherited
x>=136 lower bound, acceptance would give x>=138 for every degree-18 root.
The proof does not assume a low-x root exists in every candidate. No x>=138
branch or degree-20 branch is excluded, and R(5,5) remains undecided.
The improvement is a conditional local theorem on the recorded literature
premises, not a new certified order-43 nonexistence result.
