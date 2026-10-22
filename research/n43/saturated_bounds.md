# Bounds for globally saturated order-43 Ramsey graphs

Date: 2026-10-22. Author: Main, working alone.

All claims are ready for independent review. None is an accepted pruning rule.
This is mathematical research with elementary arithmetic validation; no solver,
graph catalogue processing, downloads, or novelty review was performed.

Throughout, G has 43 vertices, no K5, no I5, and is **globally K5-saturated**:
every missing edge creates a K5 when added. This means that every nonedge has
a triangle in its common neighborhood. It does not mean that G[N(v)] is
K4-saturated. The earlier [58-edge local floor](d18/saturated_neighborhood_density_floor.md)
therefore has a different hypothesis.

For any pivot v put A=N(v), B=M(v), d=|A|, a=e(A), b=e(B), x=e(A,B),
C_y=N_A(y), s_u=d_A(u), epsilon_z=d_G(z)-18, and E_A=sum_A epsilon_u.
The published degree range is 18..24, and

    x=17d-2a+E_A,       e(G)=d+a+b+x.

The numerical census inputs are the recorded (4,4) maxima 50,55,60,68 at
orders14,15,16,17; the (4,5) maximum85 at order18; and the (5,4,24)
interval144..160, obtained by complementing the (4,5,24) interval116..132.
They are from McKay--Radziszowski (1992), Table1, p.16, and
Angeltveit--McKay, R(5,5)<=46, Appendix A, Table1, as recorded in the
[root table](../../README.md). The Ramsey inputs R(3,4)=9, R(3,5)=14,
R(4,4)=18, R(4,5)=25 are those in the [baseline](../../docs/mathematical_baseline.md).
No census uniqueness assumption is used.

<a id="claim-saturated-triangle-transversal"></a>
## 1. Triangle-containing transversals replace unrestricted columns

Claim ID: n43/saturated_bounds.md#claim-saturated-triangle-transversal  
Kind: local-deduction  
Review state: ready  
Scope: every saturated G in the setting, every pivot and every y in B  
Dependencies: [single-edge obstruction](../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-01); I5-freeness  
Conclusion: C_y contains a triangle and meets every I4 of A; the bounds below hold  
Search use: none pending review; proposed propagation and structural branching  
Reviews: none

Saturation of vy supplies a triangle in N(v) intersect N(y)=C_y. A missed
independent four-set of A would form I5 with y. Define

    tau(A)=minimum size of a set meeting every I4 of A,
    sigma(A)=minimum size of such a set that also contains a triangle.

Sigma is defined for every actual neighborhood here, since B is nonempty and
any actual column is eligible. This yields

    sigma(A)>=max(3,tau(A)),
    |C_y|>=sigma(A),
    (42-d)*sigma(A)<=x,
    sigma(A)<=floor(x/(42-d)).

Sigma need not equal tau. In particular, a lower bound on actual column size
does not prove the same lower bound on unrestricted tau.

<a id="claim-saturated-triangle-capacity"></a>
## 2. Triangle capacities and clique counts

Claim ID: n43/saturated_bounds.md#claim-saturated-triangle-capacity  
Kind: local-deduction  
Review state: ready  
Scope: every pivot and every triangle T in A  
Dependencies: Claim1; K5/I5 avoidance; R(3,4)=9 for edge capacity eight  
Conclusion: t(A)>=ceil((42-d)/3), the incidence cuts below, and #K4(G)>=65  
Search use: none pending review; proposed propagation  
Reviews: none

For T a triangle in A, let Z_T be its common neighborhood in B. Z_T is
independent: an edge there would complete a K5 with T. Moreover |Z_T|<=3,
because v is nonadjacent to every B vertex and four independent members of
Z_T together with v would give I5. Every y in B lies in some Z_T by Claim1.
Consequently

    42-d <= sum_(T triangle in A) |Z_T| <= 3*t(A),
    t(A)>=ceil((42-d)/3),
    sum_(y in B) t(A[C_y])<=3*t(A).

For every actual edge uw in A, at most eight B vertices see both endpoints,
because their common B neighborhood is (3,4)-free. For a triangle T, at
most three B vertices see all of T. Thus the stronger shape-sensitive cuts are

    sum_(y in B) e(A[C_y])<=8*a,
    sum_(y in B) t(A[C_y])<=3*t(A).

For d18 these imply x>=72 and t(A)>=8. The edge floor is weaker than the
recorded x>=137, but the shape-sensitive incidence cuts carry additional
information. If h_y vertices of
C_y lie outside a chosen witness triangle T_y, then the isolated vertices
of A[C_y] are among those h_y vertices. Summing gives a row-degree cut:

    sum_(u in A) max(0,17+epsilon_u-9*s_u) <= x-3*(42-d).       (1)

Indeed u belongs to r_u=17+epsilon_u-s_u columns. At most 8*s_u of them
can also contain an A-neighbor of u, by the edge capacity eight and a union
bound. The remainder make u isolated in their induced column graph. Every
column contains a triangle, so it has at most |C_y|-3 isolated vertices.

A K4 containing v corresponds to a triangle of A. Therefore each vertex
belongs to at least ceil((42-d_G(v))/3) copies of K4. If n_i counts vertices
of degree i, double-counting incidences gives

    4*#K4(G) >= 8*(n18+n19+n20)+7*(n21+n22+n23)+6*n24,
    #K4(G)>=ceil(258/4)=65.

This improves the recorded universal count 33 under global saturation.
The complement need not be saturated, so no corresponding new I4 count
is inferred.

<a id="claim-saturated-small-column-pairs"></a>
## 3. Nonedge overlaps and the degrees of small columns

Claim ID: n43/saturated_bounds.md#claim-saturated-small-column-pairs  
Kind: local-deduction  
Review state: ready  
Scope: every G in the setting; the small-column consequences specify d18  
Dependencies: Claim1; smaller Ramsey cell bounds  
Conclusion: the codegree, degree, and set-union inequalities below  
Search use: none pending review; proposed propagation  
Reviews: none

For any global nonedge yz the common neighborhood contains a triangle. The
standard pair interval consequently improves to

    max(3,d_G(y)-17,d_G(z)-17)
        <= |N(y) intersect N(z)| <= d_G(y)+d_G(z)-28.           (2)

For a d18 root, all columns have size at least three. A size-three column
T is a triangle, and its B endpoint has degree at most 20 because
d_B(y)<=17. If |C_y|+|C_z|<=9, then yz must be an edge: otherwise their
missed set in A has type (4,3), order at most8, forcing
|C_y union C_z|>=18-8=10. The common-B-neighbor edge cap eight then gives

    d_B(y)+d_B(z)<=32,
    epsilon_y+epsilon_z <= |C_y|+|C_z|-4.                     (3)

In particular two size-three endpoints have combined excess at most two.
A size-three and a size-four endpoint have combined excess at most three.

If C_y=T is a triangle and yz is an edge, |T intersect C_z|<=2:
otherwise T together with y,z is a K5. Distinct size-three columns
therefore have distinct triangle signatures. Their endpoints are all
adjacent by (3), so there are at most four size-three columns.

<a id="claim-saturated-d18-three-column-excess"></a>
## 4. Dense triangle columns of size three force excess

Claim ID: n43/saturated_bounds.md#claim-saturated-d18-three-column-excess  
Kind: local-deduction  
Review state: ready  
Scope: every d18 root with a size-three I4-transversal containing a triangle; actual columns qualify under global saturation  
Dependencies: order15 (4,4) maximum55; R(3,4)=9; the independent-four incidence argument below  
Conclusion: a<=82; if a=81 then E_A>=5, and if a=82 then E_A>=14  
Search use: none pending review; proposed propagation  
Reviews: none

Let T be this three-set, a triangle, and H=A-T. Transversality makes H (4,4)-free on15
vertices, so m=e(H)<=55. Put S_i=N_H(t_i), c=sum_i |S_i|. Each S_i is
triangle-free and I4-free, so |S_i|<=8. Hence

    a=m+3+c<=55+3+24=82.

For any independent four-set X in A,

    e(X,B)>=36.                                               (4)

To see this, every column meets X. At most three columns have exact
X-signature {u} for each u in X: the corresponding B vertices form a
clique by I5-freeness, and a clique of four would make K5 with u. There
are at most twelve singleton signatures, and the remaining columns
contribute at least two incidences. This gives 2*24-12=36.

For the triangle T, all pair intersections D_ij=S_i intersect S_j are
independent with size at most3, and the triple intersection is empty.
Every D_ij is anticomplete to the third triangle vertex, so when
|D_ij|=3 it gives an independent four-set with that vertex.

If a=82, necessarily m=55 and c=24. All S_i have size8. The union has
size at most15, so all three pair intersections have size3, and the
union covers H. The three disjoint independent anchors contain T and
the nine double-membership vertices D; the six remaining H vertices
have singleton membership. Since every H degree is at most8,

    sum_D d_H >=2*55-6*8=62,
    sum_(T union D) d_A >=30+18+62=110.

Their three independent-anchor cut floors total108. The row identity
on their twelve vertices gives e(T union D,B)<=204+E_(T union D)-110,
and therefore E_A>=14. This rederives the
[accepted a82 result](d18/x142/q3/three_columns.md#claim-q3-three-column-excess-fourteen)
using only the present triangle hypothesis and its stated census input.

If a=81, the only (m,c) possibilities are (55,23) and (54,24).
For (54,24), the same full three-anchor partition gives
sum_D d_H>=108-48=60, hence E_A>=12.
For (55,23), the S_i sizes are 8,8,7. The total double membership is
at least 23-15=8, and each pair contributes at most3. If it totals9,
all three independent anchors exist. There are five singleton H
vertices and one vertex seeing none of T. Thus sum_D d_H>=110-6*8=62
and the T-degree sum is29. The three-anchor row calculation yields
E_A>=13.

For total double membership8, the pair sizes are 3,3,2. Keep the two
independent four-sets from the size-three pairs; their union U contains
six H vertices and two T vertices. H has110 total degrees, and the other
nine H vertices have degree at most8, so the retained six have total
H-degree at least38. They contribute12 triangle incidences. The retained
two T vertices have A-degree sum at least9+10=19. Hence

    sum_U d_A>=38+12+19=69,
    e(U,B)>=72,
    e(U,B)=136+E_U-sum_U d_A<=67+E_U,
    E_U>=5.

Nonnegative excess outside U gives the uniform a81 bound5. For actual
size-three columns the resulting edge bounds are

    a=81 => E_A>=5 and x>=149,
    a=82 => E_A>=14 and x>=156,
    a>=83 => every column has size>=4.

These proofs also apply to every size-three transversal containing a
triangle, whether or not it is an actual column. Thus sigma(A)>=4 at
a=81,E_A<=4 or a=82,E_A<=13; at a>=83 sigma(A)>=4 without an excess
hypothesis.

<a id="claim-saturated-d18-four-column-excess"></a>
## 5. At 85 edges, a four-column forces excess at least fourteen

Claim ID: n43/saturated_bounds.md#claim-saturated-d18-four-column-excess  
Kind: local-deduction  
Review state: ready  
Scope: every d18 root with a=85, and every four-set transversal T containing a triangle  
Dependencies: order14 (4,4) maximum50; R(3,4)=9; inequality(4); K4/I5 avoidance in A  
Conclusion: E_A>=14; a paw T forces E_A>=15; for actual four-columns x>=150, or x>=151 for a paw  
Search use: none pending review; proposed propagation and structural branching  
Reviews: none

This claim only needs that T meets every I4 of A and contains a triangle;
it need not be an actual column. Actual four-columns satisfy the hypothesis
by global saturation.

Put H=A-T, m=e(H)<=50, c=e(T,H), t=e(A[T]), and
delta_u=8-|N_H(u)|>=0 for u in T. Then

    85=m+t+32-sum_T delta,
    sum_T delta=m+t-53<=t-3.                                 (5)

The graph A[T] is K4-free and contains a triangle. Its shapes are a
triangle plus an isolated vertex (t=3), a paw (t=4), or a diamond (t=5).
A triangle's attachments have empty triple intersection, pair intersections
independent of size at most3, and union of size at most14. Therefore
their attachment-size sum is at most23, or their delta sum at least1.
This excludes t=3 in (5).

For the paw, (5) forces m=50 and total delta1 on a triangle vertex.
The three triangle attachments total23, each pair intersection has
size3, and their union is all H. Thus H consists of nine double-membership
vertices D and five singleton members P relative to the triangle. The
pendant vertex w has eight H-neighbors, at least three in D.

The three triangle-derived independent anchors X_i={t_i} union D_jk
are disjoint, with twelve-vertex union U=(T-{w}) union D. The three
triangle vertices have total A-degree23+6+1=30. Therefore

    sum_D d_H >=2*50-5*8=60,
    e(w,D)>=8-5=3,
    sum_U d_A>=30+18+60+3=111.

By (4), e(U,B)>=108. The row identity gives
e(U,B)<=204+E_U-111, hence E_A>=E_U>=15.

For the diamond, write u,v for its shared-edge vertices and r,s for
its nonadjacent tips. K4-freeness makes D=N_H(u) intersect N_H(v)
independent and anticomplete to both tips, so |D|<=2 by I5-freeness.
The triangle u,v,r has attachment-size sum at most14+2+3+3=22.
Therefore delta_u+delta_v+delta_r>=2, and likewise with s. Equation(5)
forces m=50, delta_r=delta_s=0, and delta_u+delta_v=2. Both triangle
unions cover H, |D|=2, and each shared-vertex/tip pair intersection has
size3.

Relative to triangle u,v,r, H consists of D (two vertices), the
three-vertex sets E_u=N_H(u) intersect N_H(r), E_v=N_H(v) intersect
N_H(r), and private sets P_u,P_v,P_r of total size6. These are three
disjoint independent four-sets:

    {u} union E_v,   {v} union E_u,   {r,s} union D.

Their union U consists of all four T vertices and the eight H vertices
D union E_u union E_v. The remaining six H vertices have total H-degree
at most48, so the retained H vertices have total H-degree at least52.
Each retained H vertex sees two vertices of triangle u,v,r. The tip s
has eight H-neighbors, at least two among the retained vertices, because
only six H vertices lie outside them. The total A-degree on T is40.
Consequently

    sum_U d_A>=40+52+16+2=110,
    e(U,B)>=108,
    E_U>=108-204+110=14.

This proves the uniform bound14, and the stronger15 for a paw. Therefore

    a=85 and E_A<=13 => sigma(A)>=5 and every column has size>=5.

This is a sigma bound. Triangle-free four-set transversals remain outside
this claim; it does not establish unrestricted tau(A)>=5.

<a id="claim-saturated-dense-coverage"></a>
## 6. A complete dense saturation normalization

Claim ID: n43/saturated_bounds.md#claim-saturated-dense-coverage  
Kind: local-deduction  
Review state: ready  
Scope: existence in R(5,5,43), independent of any initial pivot  
Dependencies: finite safe augmentation; complementation; published degree and edge extrema  
Conclusion: R(5,5,43) is nonempty iff it contains a globally saturated member with e(G)>=452; normalized degree and d18 edge bounds below  
Search use: none pending review; proposed complete existence normalization  
Reviews: none

Given any witness, choose the denser of it and its complement. Their edge
counts sum to C(43,2)=903, so the chosen graph has at least452 edges.
Extend it to a maximal K5-free supergraph on the same vertices. Additions
preserve I5-freeness and increase edges. The final graph is globally
saturated and still has at least452 edges. Conversely such a graph is
a Ramsey witness. This yields a complete existence reduction; it does
not assert that every saturated member has this many edges.

In this normalized representative write m=e(G), W=sum_z epsilon_z. Then

    452<=m<=516,
    W=2m-774>=130,
    |{z:d_G(z)>18}|>=ceil(W/6)>=22,
    |{z:d_G(z)=18}|<=21,
    Delta(G)>=ceil(2m/43)>=22.

The complete degree-count inequality is

    n22+2*n23+3*n24 >= 1+3*n18+2*n19+n20,

since sum_z(d_G(z)-21)=2m-903>=1.

Selecting a maximum-degree pivot therefore gives a complete rooted
coverage with degree22, 23, or24, while retaining global saturation.
Complementing later to force a degree18 or20 root would generally lose
saturation, so those two rooted branches alone are not this reduction.

If this normalized graph has a d18 root, the published bounds a<=85,
b<=160 give

    m=324-a+b+E_A,
    E_A>=a-32,
    x>=274-a>=189,
    E_B=W-E_A=m-450-a+b>=61.

The last bound uses m>=452,a<=85,b>=144. The pivot has zero excess,
so W-E_A is exactly the excess on B.

For an unnormalized saturated graph, a size-three column implies
d_B(y)<=17, hence d_G(y)<=20. These degree bounds and Claims1--5 do
not require the dense normalization. The reduction may change an
original degree18 pivot's degree and neighborhood.

<a id="claim-saturated-transversal-density-thresholds"></a>
## 7. Density thresholds for sigma at degrees18 through21

Claim ID: n43/saturated_bounds.md#claim-saturated-transversal-density-thresholds  
Kind: local-deduction  
Review state: ready  
Scope: every actual neighborhood A of G; density thresholds refine d in {18,19,20,21}  
Dependencies: Claims1,5; the (4,4) census maxima and Ramsey inputs above  
Conclusion: the sigma density thresholds in the table below  
Search use: none pending review; proposed propagation  
Reviews: none

Any transversal T leaves a (4,4)-free graph A-T. Since R(4,4)=18,
tau(A)>=d-17. Thus sigma(A)>=max(3,d-17) for every pivot.

If |T|=3 and T contains a triangle, each of its vertices has at most
eight attachments into H=A-T. The census maximum M(h) gives

    a<=M(d-3)+27.

For d=18,19,20 this yields a<=82,87,95. For d>=21 there is no
three-set transversal because |H|>=18.

If |T|=4 and it contains a triangle, let h=d-4, m=e(H)<=M(h),
and delta_u=8-|N_H(u)|. For a triangle in T, inclusion-exclusion
gives a delta sum at least max(0,15-h): its pair intersections have
size at most3 and its union lies in h vertices. For a diamond, the
shared-edge intersection is independent and anticomplete to both tips,
so has size at most2. Each triangle of that diamond has delta sum at
least max(0,16-h). Therefore the three possible shapes give

    triangle plus isolated vertex: a<=M(h)+35-max(0,15-h),
    paw:                          a<=M(h)+36-max(0,15-h),
    diamond:                      a<=M(h)+37-max(0,16-h).

The maximum of these caps is85,91,97,105 for d=18,19,20,21. This
does not require the full surviving-family classifications in the
earlier four-transversal work.

| Pivot degree d | Density forcing sigma(A)>=4 | Density forcing sigma(A)>=5 |
| --- | --- | --- |
| 18 | a>=83 | a=85 and E_A<=13, by Claim5 |
| 19 | a>=88 | a>=92 |
| 20 | a>=96 | a>=98 |
| 21 | every a | a>=106 |
| 22 | every a | every a, from tau(A)>=5 |
| 23 | every a | sigma(A)>=6 for every a |
| 24 | every a | sigma(A)>=7 for every a |

Every lower bound s in the table gives |C_y|>=s and x>=(42-d)*s.
For d18 the additional a81/a82 excess-sensitive thresholds are in Claim4.
The density thresholds alone restrict sigma, not unrestricted tau.

<a id="claim-saturated-disconnected-sigma"></a>
## 8. Sigma is exact in the disconnected degree18 families

Claim ID: n43/saturated_bounds.md#claim-saturated-disconnected-sigma  
Kind: local-deduction  
Review state: ready  
Scope: every d18 root with disconnected A  
Dependencies: [reviewed disconnected classification](d18/neighborhood_connectivity.md#claim-connectivity-01); R(3,4)=9  
Conclusion: sigma(A)=4,5,3 for A=K_m disjoint union C with m=1,2,3, respectively  
Search use: none pending review; proposed propagation  
Reviews: none

The reviewed classification gives A=K_m disjoint union C, where
m is1,2,or3, |C|=18-m, and C is (4,4)-free with independence3.
Every independent four-set is {u} union J, with u in K_m and J an
independent triple of C. Thus a transversal either contains all K_m
or its intersection with C meets every independent triple of C.
In the latter case, the remaining C graph is (4,3)-free and has
at most8 vertices. This costs at least |C|-8=10-m vertices.

For m=1 or2, a triangle must lie entirely in C. Taking all K_m
and any C triangle is eligible and costs m+3; such a triangle exists
because |C|>=16, C has no I4, and R(3,4)=9. A smaller eligible
transversal can neither include all K_m plus a triangle nor pay
the 10-m cost in C. Hence sigma(A)=m+3. For m=3, K_m itself
is a triangle and a transversal, giving sigma(A)=3.

In the m=1 family tau(A)=1 whereas sigma(A)=4; in the m=2
family tau(A)=2 whereas sigma(A)=5. This explicitly distinguishes
the parameters even in the previously retained neighborhood families.
No ambient realization of these families is asserted.

## Handoff limits

For arbitrary saturated members the available scalar global interval
remains387..516, with degrees18..24. The 452 floor belongs to the dense
normalization. The normalization and sigma parameter supply complete global
restrictions. They leave the maximum-degree22,23,24 cases open. Global
saturation alone does not justify the local 58-edge neighborhood floor,
nor a blanket tau>=3 or tau>=5. No order43 nonexistence or sharpness
claim is made. [Validation and handoff](../reports/2026-10-22-global-saturation-bounds.md)
records the arithmetic checks and exact proof hash.
