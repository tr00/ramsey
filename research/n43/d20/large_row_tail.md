# Individual row deficits sharpen the degree-20 large-row tail

Date: 2026-10-22. Author: /root, working alone.
Task: `large-row-breakthrough-20261022`. All claims are ready for independent
review, with written proofs and an arithmetic self-check.

Let G be K5/I5-free on 43 vertices, d_G(v)=20 and n18(G)=0. Put
A=N_G(v), B=M_G(v), so |A|=20, |B|=22, and 19<=d_G(z)<=24.
For u in A put R_u=N_B(u), r_u=|R_u| and s_u=d_A(u). Let x=e(A,B).
No saturation or complement selector is assumed. Claim 4 adds maximum
neighborhood-density selection within the degree-20 class; Claims 1--3
apply to any root in the stated scope.

The premises are R(4,5)=25, R(4,4)=18 and R(3,4)=R(4,3)=9 from the
[baseline](../../../docs/mathematical_baseline.md). The side types are
A: K4/I5-free and B: K5/I4-free. The scalar row inequalities of
[interface Claim 3](interface_bounds.md#claim-d20-cross-upper) are rederived
below, so that their pending status is not a hidden proof dependency.
No side-edge census is used in Claims 1--4.

<a id="claim-d20-large-row-deficits"></a>
## Claim 1. Several size-17 rows require larger deficits

Claim ID: research/n43/d20/large_row_tail.md#claim-d20-large-row-deficits  
Kind: local-deduction  
Review state: ready  
Scope: every G,v above  
Dependencies: displayed Ramsey bounds, degree cap 24 and forbidden sets  
Conclusion: row-count cuts and bounds in (1)--(4), including x<=278 for three size-17 rows and x<=276 for four  
Search use: none pending independent review; proposed propagation  
Reviews: none

We have s_u>=2, r_u<=17 and s_u+r_u=d_G(u)-1<=23. The
internal lower bound holds because the 19 vertices of A-u missing u
are K4/I4-free and at most 17 in number. The upper row bound holds
because R_u is K4/I4-free. An A-edge has at most eight common
B-neighbors, giving

    uw an edge => r_u+r_w<=30.                             (1)

Let T={u:r_u=17}, L={u:r_u=16}, Z={u:r_u=15}, with counts t,l,h.
T union L is independent and anticomplete to Z, so t+l<=4. For each
y in B, the members of Z omitting y are independent: an edge between
two such vertices would have at least 15+15-21=9 common B-neighbors.
Adjoining all of T union L gives an independent A-set, so at most
4-t-l members of Z omit y. Adjoining only the T/L members that also
omit y gives an independent set anticomplete to y, of size at most three.
Counting omissions proves

    7h<=22(4-t-l),
    5t+6l+7h<=66.                                        (2)

Define D=sum_(u:r_u<=14)(14-r_u). The exact row sum is

    x=280+3t+2l+h-D.                                     (3)

Every A-neighbor of T has r_u<=13 by (1), so D is at least the size
of the union of the A-neighborhoods of T. For t=1 this union has
size at least two. For t=2 the 18 outside A-vertices missing T are
K4/I3-free and number at most eight, giving union size at least ten.
For t=3 the 17 outside vertices missing T form a clique of size at
most three, giving union size at least fourteen. For t=4 all 16
outside vertices meet T, giving union size sixteen. This yields

| t | Maximum 3t+2l+h under (2) | Lower bound D | Upper bound x |
| ---: | ---: | ---: | ---: |
| 0 | 10 | 0 | 290 |
| 1 | 11 | 2 | 289 |
| 2 | 12 | 10 | 282 |
| 3 | 12 | 14 | 278 |
| 4 | 12 | 16 | 276 |

The maxima can be checked by substituting l=0,...,4-t into (2);
the [retained validation](../../reports/2026-10-22-large-row-tail/validate.py)
performs the integer check. In comparison, the earlier table used D>=10
also at t=3,4, giving 282 in both cases.

There is a useful additional cut. If t=1 and l>=1, let u be the
size-17 vertex and w any size-16 vertex. They are independent. At
most eight of the 18 outside A-vertices miss both, hence

    s_u+s_w>=|N_A(u) union N_A(w)|>=10.

But s_w<=23-16=7, so s_u>=3 and D>=3. Therefore

    t=1, l>=1 => x<=288.                                 (4)

<a id="claim-d20-single-seventeen-endpoint"></a>
## Claim 2. A size-17 row at x=289 forces two critical cores

Claim ID: research/n43/d20/large_row_tail.md#claim-d20-single-seventeen-endpoint  
Kind: local-deduction  
Review state: ready  
Scope: Claim 1 with x=289 and t>=1  
Dependencies: Claim 1, independent-pair union bound and degree cap 24  
Conclusion: the exact row and adjacency structure below; two critical 17-cores and at least fourteen degree-24 vertices  
Search use: none pending independent review; proposed propagation and rerooting  
Reviews: none

Claim 1 excludes t>=2 and, by (4), excludes l>=1. With t=1,l=0,
(2) gives h<=8. Equation (3) and D>=2 force h=8 and D=2.
The size-17 vertex u has exactly two A-neighbors. Every such neighbor
has row size at most 13 and consumes a unit of D, so those two vertices,
call their set W, have row size exactly 13. All other deficient rows
are absent. The complete profile is

    {u}: one row of size 17,
    Z:   eight rows of size 15,
    W:   two rows of size 13,
    P:   nine rows of size 14.                             (5)

Here N_A(u)=W and d_G(u)=1+2+17=20. The vertex u is anticomplete
to Z. For each z in Z, the independent pair u,z has A-neighborhood
union of size at least ten. As s_u=2 and s_z<=23-15=8, equality is
forced: s_z=8 and N_A(z) is disjoint from W. Hence

    d_G(z)=1+8+15=24 for every z in Z,
    e_A(W,Z)=0.                                          (6)

Both W vertices are complete to B-R_u. Indeed an edge uw has common
B-neighborhood of size at most eight. Their rows have sizes 17 and 13,
so their intersection has size at least eight and their union is all B.
Thus each W row contains the five vertices of B-R_u and exactly eight
vertices of R_u. This is an actual labelled attachment restriction.

Consequently, if n24(G)=0, any occurrence of a size-17 row forces x<=288.
This conditional statement is not an improvement on the existing scalar
cap for the full complement-closed residual; see the limits below.

There is further critical-core structure. Put H=A-({u} union W), so
H=Z disjoint union P has order seventeen. The vertex u misses H, so an
I4 there would extend with u to I5. Thus H is K4/I4-free. The same is
true of R_u. Every (4,4)-free graph of order seventeen is 8-regular:
each neighborhood is K3/I4-free and has at most eight vertices; each
nonneighborhood is K4/I3-free and also has at most eight, forcing both
to have size eight. Both cores consequently have 68 edges, using only
R(3,4)=R(4,3)=9.

Write delta=1 if the two W vertices are adjacent, and zero otherwise,
and f=e_A(W,H). Each p in P has eight H-neighbors, row size 14 and
global degree at most 24, so it has at most one W-neighbor. Together
with (6), this gives f<=9 and shows the two H-attachment sets of W
are disjoint. Each w in W has s_w=1+delta+|N_H(w)| and row size 13,
so the degree floor 19 gives |N_H(w)|>=4-delta. Therefore

    8-2delta<=f<=9,
    a=e(A)=68+2+delta+f=70+delta+f<=80.                   (7)

Every one of the f attached P vertices has degree 1+8+1+14=24; all
eight Z vertices have degree 24 already. Thus at least fourteen
vertices have degree 24.

When delta=0, the independent pair W has A-neighborhood union at least
ten. Its union consists of u and the disjoint H-attachments, giving
1+f>=10. Thus f=9. The two attachment sizes, at least four each, are
four and five, so W has global degrees 19 and 20. Every H vertex then
has degree 24, giving at least seventeen degree-24 vertices. These are
exact necessary conditions on the same labels.

<a id="claim-d20-four-seventeen-endpoint"></a>
## Claim 3. Four size-17 rows have an exact internal degree signature

Claim ID: research/n43/d20/large_row_tail.md#claim-d20-four-seventeen-endpoint  
Kind: local-deduction  
Review state: ready  
Scope: Claim 1 with t=4, without an assumption on x  
Dependencies: forbidden homogeneous sets and the degree cap 24  
Conclusion: every size-17 endpoint has degree 24; exactly eight singleton and eight double signatures occur on A-T  
Search use: none pending independent review; proposed propagation  
Reviews: none

The four vertices of T are independent. Every vertex of A-T meets T,
or together with T it makes I5. For each u in T, the class of vertices
of A-T with exact T-neighborhood {u} is a clique: two nonadjacent
members extend T-u to I5. The class has size at most two because a
triangle in it extends with u to K4 in A. Hence the number n1 of
singleton signatures is at most eight. Let

    H=sum_(w in A-T:|N_T(w)|>=3)(|N_T(w)|-2)>=0.

Counting the sixteen actual signatures gives

    sum_(u in T) s_u=32-n1+H>=24.

Each size-17 endpoint has s_u<=23-17=6, giving an upper bound of 24
on the same sum. Equality holds everywhere: s_u=6 for every u in T,
n1=8 and H=0. Thus d_G(u)=1+6+17=24, each singleton class has size
two and is K2, and the remaining eight outside vertices have signatures
of size exactly two. In particular t=4 is impossible when n24(G)=0.

<a id="claim-d20-large-row-maximal-root"></a>
## Claim 4. A low-codegree degree-20 pair forces x<=282 at a maximum root

Claim ID: research/n43/d20/large_row_tail.md#claim-d20-large-row-maximal-root  
Kind: local-deduction  
Review state: ready  
Scope: any G in R(5,5,43), adjacent degree-20 vertices v,u with exactly two common neighbors; for the maximum-root corollary v maximizes neighborhood edges among degree-20 vertices  
Dependencies: global degree cap 24 and R(3,4)=R(4,3)=9; Claims 1--2 only for the size-17 endpoint corollary  
Conclusion: e(G[N(u)])-e(G[N(v)])>=x-282; a maximum-density root has x<=282 if a size-17-row endpoint has degree 20, and x<=288 if any size-17 row occurs in the no-degree18 scope  
Search use: none pending independent review; proposed root-selection propagation  
Reviews: none

This pair argument does not require n18(G)=0. Set A=N(v), B=M(v),
W=N(v) intersect N(u), H=A-({u} union W) and D=N_B(u).
The two degree-20 hypotheses and |W|=2 give |H|=|D|=17. Both H
and D are K4/I4-free: H is missed by u, D is seen by u, and the
pivot side types supply their other prohibition. As proved in Claim 2,
each is 8-regular with 68 edges.

Put f=e(W,H), c=e(W,D), and delta=e(W) in {0,1}. We have

    N_G(u)={v} disjoint union W disjoint union R_u.

In the present notation R_u=D. Count the two neighborhoods directly:

    a_v=e(G[N_G(v)])=70+delta+f,
    a_u=e(G[N_G(u)])=70+delta+c.                          (8)

For h in H, its eight H-neighbors, the pivot v, its W-neighbors and
its r_h B-neighbors exhaust its ambient degree. Thus

    |N_W(h)|+r_h<=15,
    f<=255-sum_(h in H) r_h.

The exact cross sum is x=17+sum_(w in W)r_w+sum_(h in H)r_h.
Each W row counts its neighbors in D plus its neighbors in B-D,
and |B-D|=5, so sum_W r_w<=c+10. Substitution gives

    f<=272-x+sum_W r_w<=282-x+c,
    a_u-a_v=c-f>=x-282.                                 (9)

The inequality has the exact nonnegative-defect identity

    (a_u-a_v)-(x-282)
      = sum_(h in H)(24-d_G(h)) + 10-e(W,B-D).            (10)

It follows by substituting x=17+c+e(W,B-D)+sum_H r_h and
d_G(h)=9+|N_W(h)|+r_h. Both terms on the right are nonnegative;
this also identifies the equality conditions without a separate estimate.

If v maximizes neighborhood edges among degree-20 vertices, a_u<=a_v,
and hence x<=282. Equivalently, in the no-degree18 scope, a size-17-row
endpoint of degree 20 is impossible at such a root whenever x>=283.
At x=282, equality of root densities additionally forces every H vertex
to have ambient degree 24 and both W vertices to be complete to B-D.
These follow because both degree and five-vertex-cut inequalities in
(9) must be equalities. No endpoint realizability is asserted.

Finally, if a size-17 row occurs at x=289 in the no-degree18 scope,
Claim 2 forces its endpoint u to have degree 20 and s_u=2. Applying
(9) gains at least seven neighborhood edges, contradicting maximality.
Claim 1 already gives x<=289 whenever a size-17 row occurs, so the
remaining endpoint is excluded and x<=288 follows. The exact endpoint
calculation from Claim 2 is a_v<=80 and a_u=86+delta.

Root selection is complete on the stated degree-20 scope: the finite,
nonempty set of degree-20 vertices has a maximum neighborhood edge
count. Choosing any maximizer preserves G, the degree window and any
global saturation hypothesis already present. Ties may be retained in
full; no symmetry quotient or unproved tie rule is needed for this
existence selection. This does not force an arbitrary previously fixed
root to maximize, nor guarantee a degree-20 vertex in every orientation.

## Limits and permitted interpretation

The unrestricted no-degree-18 ceiling remains x<=290. At x=290, Claim 1
has only (t,l,h,D)=(0,1,8,0) or (0,2,6,0). Neither is excluded by
Claims 1--4. The degree-24 conclusion of Claim 2 applies to x=289 with
a size-17 row, not to these x=290 profiles.

The complement-closed residual already satisfies x<=272: summing ambient
degrees at most 23 over B gives x<=23*22-2e(B), and the published e(B)>=117
gives 506-234=272. That census bound is stronger than 288; it is recorded
here to avoid advertising a false improvement. Claims 1--3 supply
census-free, occurrence-sensitive structure, with the new ceilings 278/276
in the wider 19..24 scope.

No graph has been constructed, no entire d20 branch has been excluded,
and no global Ramsey bound changes. These proofs have only author
self-checks; no novelty claim, independent acceptance, formal certificate,
or executable search filter is asserted. The
[dated report](../../reports/2026-10-22-large-row-tail.md) records validation.
