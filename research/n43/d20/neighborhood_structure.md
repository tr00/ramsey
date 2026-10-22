# Connectivity and critical cores in the d20 residual branch

Date: 2026-10-22. Author: Main, alone. All claims are ready for independent
review. Maximum-density root selection is not used.

Let G be K5/I5-free of order43, d_G(v)=20, and suppose G has no degree18
vertex. Set A=N_G(v), B=M_G(v), F=complement G[B]. Then |A|=20, |F|=22,
and A,F are K4/I5-free. For u in A write s_u=d_A(u), r_u=|N_B(u)|.
We have 2<=s_u<=13, r_u<=17 and s_u+r_u=d_G(u)-1>=18.
The row cap follows because N_B(u) is K4/I4-free, so has at most17 vertices.
An A-edge has at most8 common neighbors in B, using R(3,4)=9; a triangle
in A has at most3 common neighbors in B, since that cell is independent
and B has no I4.

Dependencies: R(4,4)=18, R(3,4)=9, R(3,5)=14; recorded (4,4) edge counts
60 and68 at orders16 and17, and17-core degree8 where explicitly used.
No uniqueness of either core is assumed.

<a id="claim-d20-neighborhood-connectivity"></a>
## 1. Both internal graphs are two-vertex-connected

Claim ID: n43/d20/neighborhood_structure.md#claim-d20-neighborhood-connectivity  
Kind: local-deduction  
Review state: ready  
Scope: the no-degree18 setting above; saturation unnecessary  
Dependencies: displayed Ramsey and row bounds; independence additivity  
Conclusion: kappa(A)>=2, kappa(F)>=2, alpha(A)=alpha(F)=4,
omega(A)=omega(F)=3; a size-two separator of F can only leave K3 plus a17-core  
Search use: none pending review; proposed structural propagation  
Reviews: none

First consider a disconnected K4/I5-free graph H of order at least18.
Its components have positive independence numbers summing to at most4.
An independence-one component is a clique of order at most3; an
independence-two component has order at most8; an independence-three
component has order at most17. The only profile that can reach18 is
(1,3): the alternatives (2,2), (1,1,2), and (1,1,1,1) have respective
order caps16,14,12. Thus H consists of K_m, 1<=m<=3, and a (4,4)-free
component of order at most17. In particular |H|<=20. At order20 it must
be K3 plus a17-core; at order19 its small component is K2 or K3.

If A were disconnected, its K3 component would have s_u=2 and r_u>=16
at every vertex. Two adjacent vertices then have at least16+16-22=10
common B-neighbors, contrary to the bound8.

If z were a cutvertex of A, A-z has order19 and is disconnected. In
its K2 case both endpoints have s_u<=2, so the same contradiction applies.
In its K3 case each s_u<=3, so every row has size at least15. The separator
z cannot meet all three vertices, or they and z make K4 inside A. Choose
u in the K3 missed by z. Then s_u=2, r_u>=16, while another vertex w in
this component has r_w>=15. Their common B-neighbors number at least
16+15-22=9>8. This excludes a cutvertex and proves kappa(A)>=2.

Deleting zero or one vertex of F leaves order22 or21, so the disconnected
order20 cap proves kappa(F)>=2. If two vertices separate F, the remaining
order20 graph must have the K3 plus17-core shape above. This exceptional
shape is retained in the one-orientation residual.

R(4,4)=18 forces alpha(A)=alpha(F)=4, and R(3,5)=14 forces
omega(A)=omega(F)=3. These are exact homogeneous-set sizes, independently
of edge counts, saturation and the chosen root's neighborhood density.

<a id="claim-d20-complement-side-connectivity"></a>
## 2. Complement-closed residual membership gives three-connectivity on F

Claim ID: n43/d20/neighborhood_structure.md#claim-d20-complement-side-connectivity  
Kind: local-deduction  
Review state: ready  
Scope: Claim1 plus n24(G)=0, equivalently degrees19..23  
Dependencies: Claim1 component profile; triangle cross-intersection bound  
Conclusion: kappa(F)>=3; size-three-separator alternatives below remain  
Search use: none pending review; proposed structural propagation  
Reviews: none

In the complement graph every vertex also has degree at least19. A
size-two separator of F would leave K3 plus a17-core. Each separator
vertex meets at most two K3 vertices, since F is K4-free. The sum of the
three K3 vertices' internal F-degrees is therefore at most6+4=10.
Their cross-row sizes into the20-vertex opposite side sum to at least
3*18-10=44. Their common intersection has size at least44-2*20=4,
contrary to the triangle bound3. Thus kappa(F)>=3.

A size-three separator, if present, leaves either K2 plus a17-core or
K3 plus a16-core. In the K2 case each endpoint has internal F-degree
at most4, so its complementary cross-row size is at least14. The two
rows have intersection at least14+14-20=8, and the edge bound is8.
Equality forces internal F-degrees4, ambient complementary degrees19,
and both K2 vertices adjacent to all three separator vertices. The
separator must be independent, since an edge among it together with
that K2 would make K4 in F. These necessary equality conditions are
retained; they do not establish or refute an ambient completion. No
four-connectivity conclusion follows here.

<a id="claim-d20-three-column-core"></a>
## 3. A minimum-size column retains a17-core and at most two degree types

Claim ID: n43/d20/neighborhood_structure.md#claim-d20-three-column-core  
Kind: local-deduction  
Review state: ready  
Scope: no-degree18 setting; y in B with C_y=N_A(y) of size3  
Dependencies: R(4,4)=18; (4,4) counts at orders16,17; R(3,4)=9;
global saturation only for the last paragraph  
Conclusion: d_G(y) in {19,20}, |N_B(y)| in {16,17}; the core and
attachment restrictions below; if G is globally K5-saturated, C_y=K3 and74<=e(A)<=95  
Search use: none pending review; proposed conditional propagation  
Reviews: none

Put S=C_y, C=A-S, D=N_B(y). An I4 in C would extend with y to I5,
while C is K4-free. Thus C is a (4,4)-free17-core of degree8 with68 edges.
D is also (4,4)-free: a K4 extends with y, and B has no I4. Therefore
|D|<=17, and d_G(y)=3+|D|>=19 forces the alternatives

| d_G(y) | |D| | e(D) |
| --- | --- | --- |
| 19 | 16 | 60 |
| 20 | 17 | 68 |

For t in S the set N_C(t) is triangle-free and I4-free, hence has size
at most8 by R(3,4)=9. Consequently

    e(A)=68+e(S)+e(S,C), e(S,C)<=24, e(A)<=95.

The interface note proves that there can be at most one such column,
and that its presence excludes all size-four columns. These statements
hold without saturation.

If G is globally K5-saturated, adding vy must be blocked by a triangle
in N(v) intersect N(y)=S. Hence S=K3. Write f_t=|N_C(t)| for t in S.
Then s_t=2+f_t, r_t>=16-f_t. For each edge tu of S the B-intersection
bound8 gives

    8 >= r_t+r_u-22 >=10-f_t-f_u,
    f_t+f_u>=2.

Summing over the three edges gives sum_S f_t>=3. Thus

    74<=e(A)=71+sum_S f_t<=95.

Saturation does not force d_G(y)=20: the16-core alternative must also
be covered. No maximum-density-degree20 selection is used here.
