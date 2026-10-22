# Degree-18 frontier band

Date: 2026-10-13. Purely mathematical deductions; no search or enumeration.
External census premises are recorded in research/n43/d18/transversal_four.md and
docs/theory_phase_1.md. No novelty claim is made.

## Exact budgets

For a degree-18 pivot let A=N(v), B=M(v), a=e(A), b=e(B), x=136+k.
Put q=85-a and epsilon_u=d_G(u)-18, E=sum_A epsilon_u.
Degree summation gives k=2q+E, with q,E nonnegative. Thus all cases are
q=0,...,floor(k/2), E=k-2q. Each epsilon is between zero and six.

| x   | (a,E)                          |
| --- | ------------------------------ |
| 136 | (85,0)                         |
| 137 | (85,1)                         |
| 138 | (85,2), (84,0)                 |
| 139 | (85,3), (84,1)                 |
| 140 | (85,4), (84,2), (83,0)         |
| 141 | (85,5), (84,3), (83,1)         |
| 142 | (85,6), (84,4), (83,2), (82,0) |

At E=1 precisely one A vertex has degree 19. At E=2 either one has degree
20 or two have degree 19. Generally the positive excesses partition E with
parts at most six; at least 18-E A vertices have degree 18 when E<=18.

Independently E_B=sum_B epsilon_u=2b-296+k. Therefore
max(144,ceil((296-k)/2))<=b<=160, and E_B has parity k.
For k=0,...,5 the b lower bounds are 148,148,147,147,146,146.
At these endpoints E_B is zero for even k and one for odd k.
The total edge count is e(G)=239+b+k-q, also obtained from
2e(G)=774+E+E_B. This is an independent audit of the budgets.

## Four-transversal extension

The proof in transversal_four.md actually applies to any 18-vertex F with
alpha(F)<=3 and e(F)<=70. Deleting a three-transversal leaves a 15-vertex
(4,4)-free graph with at least 50 edges. Each deleted vertex has at least
seven neighbors in the remainder, since its nonneighbors are (4,3)-free and
R(4,3)=9. Hence e(F)>=50+21=71, a contradiction.

For F=complement A, e(F)=68+q. Thus tau_4(F)>=4 whenever q<=2,
uniformly throughout x=136,...,141, including every x=137 and x=138 case.
At x=142 only (a,E)=(82,0) lies outside this argument. The threshold does
not establish existence of a three-transversal at 71 edges.
Every column C_y=N_A(y) is a transversal, so in these cases
4<=|C_y|<=14 and sum_B(|C_y|-4)=40+k.

<a id="claim-frontier-anchor-defects"></a>

## Independent-four anchor defects

Claim ID: `research/n43/d18/frontier_band.md#claim-frontier-anchor-defects`  
Kind: local-deduction  
Review state: accepted
Scope: every order-43 (5,5)-free G, every degree-18 pivot v, and every
independent four-set I in A=N(v), with q and E_I as below  
Dependencies: exact budgets; singleton signature bound;
Angeltveit–McKay, [arXiv:2409.15709v2](https://arxiv.org/abs/2409.15709v2),
Appendix A, Table 1, E(4,5,14)=60  
Conclusion: the anchor intervals and defect identities below  
Search use: propagate
Reviews: [independent revised-anchor audit](review_frontier_anchor_20261016_main.md)

For any independent four-set I in A put S=A-I, C=e_A(I,S), and
E_I=sum_I epsilon_u. Exact degree and edge sums give

e(I,B)=68+E_I-C, and e(S)=85-q-C.

The existing singleton signature bound gives e(I,B)>=36. The induced graph
G[S] has 14 vertices and is (4,5)-free: a K4 in A, together with v, would
give a K5 in G, and an I5 in S would already be an I5 in G. No I4
prohibition is assumed for S. The published maximum E(4,5,14)=60 in
Angeltveit–McKay, Appendix A, Table 1, therefore gives e(S)<=60.
Combining this published input with the local identities above gives

25-q<=C<=32+E_I,
36<=e(I,B)<=43+q+E_I,
53-q-E_I<=e(S)<=60.

Define eta_I=e(I,B)-36. Then 0<=eta_I<=7+q+E_I,
C=32+E_I-eta_I and e(S)=53-q-E_I+eta_I.
If n1 counts singleton I signatures and
h=sum_(y:|C_y intersect I|>=3)(|C_y intersect I|-2), then exactly
eta_I=(12-n1)+h. Both terms are nonnegative. At most eta_I columns have
signature size at least three, and at least 12-eta_I have singleton signatures.
Thus n1>=max(0,5-q-E_I), and at most 7+q+E_I columns have at least
three incidences with I. At x=136, n1>=5 and that latter count is at most seven.
At eta_I=0 the four singleton classes are triangles and all other signatures
have size two. At q=E_I=0 the revised intervals specialize to
25<=C<=32, 36<=e(I,B)<=43, and 53<=e(S)<=60. In particular this applies
at x=136, and at q=0 to every anchor avoiding excess vertices.

## Size-four columns

Let q<=2 and |C_y|=4. In F put T=C_y, H=F-T. Then H is (4,4)-free on
14 vertices. The recorded census lower bound is e(H)>=41. Every T vertex
has at least six H neighbors, again by R(4,3)=9. Write

e(H)=41+u, e_F(T,H)=24+w, t=e(F[T]).

Then u,w>=0 and u+w+t=3+q. Since alpha(F)<=3, t>=1. Consequently
1<=t<=3+q, 3-q<=e_A(C_y)<=5, and u+w<=2+q.
Each attachment degree is between six and 8+q. This gives a finite defect
budget for actual size-four columns, without asking for a new universal tau>=5
lemma.

For any nonadjacent y,z in B, D=A-(C_y union C_z) has no independent triple
(otherwise adding y,z gives an independent five) and no K4. Thus |D|<=8,
so |C_y union C_z|>=10. Two size-four columns have union at most eight,
and hence are necessarily adjacent. All size-four columns form a clique in B
and therefore number at most four. A size-four and size-five column likewise
must be adjacent. More generally any collection whose pair unions are all
below ten is a clique and has at most four members.

## Audit and next target

The budgets were checked using separate degree and edge sums. The transversal
extension uses precisely the published 15-vertex minimum of 50; the size-four
attachment budget additionally uses the recorded 14-vertex minimum of 41.
The pair exclusion uses only R(4,3)=9 and the Ramsey hypotheses.
The revised anchor intervals additionally use the published maximum
E(4,5,14)=60. Their local derivation is ready for independent review;
earlier audits do not certify this changed input or its strengthened bounds.
Unchanged material retains its original review scope.
Status update (2026-10-20): x136, x137 and x138 are excluded by the reviewed
[equality closure](x136/frontier_exclusion_handoff.md),
[single-excess closure](x137/frontier_closure.md), and
[two-profile tau/support closure](x138/README.md).
Every degree18 root therefore has x>=139 and2q+E_A>=3; E_A=0 requires
q>=2 and x>=140. All inequalities above retain their stated hypotheses;
no x>=139 exclusion is asserted here. Size-five pairs with union ten remain
a boundary for forced-adjacency arguments.
