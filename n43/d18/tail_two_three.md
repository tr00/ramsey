<!-- averaging-tail-integration:start -->
Integration status (2026-10-18): all four claims independently accepted at
reviewed-body SHA-256 `1cf1ac0ccada5735c22b4f3198b3f2f2d1b88d2f78d6d0dd233dfb1dfe4df583`.
See the [exact-revision audit](review_tail_two_three_20261018_audit.md).
The reviewed body is preserved verbatim; ready labels below are historical.
Permitted use: the stated numerical branching, conditional propagation and
termination of the (2,6,1) endpoint profile, retaining the published b>=144
premise where used. Claim 3 additionally uses the classical Mantel/Turan
bounds explicitly used in its text and checked in the audit; this supplies the
non-blocking dependency-record clarification without changing the proof.
The remaining profiles are not excluded; the all-profile bound remains279.
No novelty or formal exhaustion certificate is asserted.
<!-- averaging-tail-integration:end -->

# Two and three size-17 roots at the x=279 boundary

Date: 2026-10-18. Author: TailTwoThree. Theory-only continuation of
[the averaging agenda](averaging_future_work.md). All new claims are **ready
for independent review**, not accepted. No novelty claim, solver, graph
search, catalogue acquisition, installation, or Lean is involved. This note
owns no shared index and does not change any reviewed proof.

## Setting and dependencies

Let G be K5/I5-free of order 43, with a degree-18 pivot v. Put
A=N(v), B=M(v), so |A|=18 and |B|=24. A is K4/I5-free, whereas B is
K5/I4-free. For u in A put R_u=N_B(u), O_u=B-R_u, r_u=|R_u|,
d_u=d_A(u), and epsilon_u=d_G(u)-18. Retain the recorded premises
18<=d_G(z)<=24 for every G vertex, r_u<=17, and

    d_u+r_u=17+epsilon_u,  0<=epsilon_u<=6.

Write T=L17, L=L16, Z=A-(T union L), t=|T|, s=|L|,
D=sum_(z in Z)(15-r_z), x=e(A,B), and b=e(B).

The reviewed dependencies are:

* [independent-row cuts](independent_row_cuts.md), specifically
  `claim-independent-row-degree-cuts`, `claim-independent-row-combined-pairs`,
  `claim-independent-row-tail-counts`, and `claim-independent-row-280-boundary`;
* [17-core attachment balance](large_row_extensions.md#claim-two-seventeen-core-balance)
  and the [17-core extension domain](large_row_extensions.md#claim-seventeen-extension-domain).

Their retained Ramsey premises include R(4,4)=18, R(3,4)=9 and
R(4,5)=25. The bound b>=144 is precisely the published edge-bound input
retained in independent_row_cuts.md; no new census premise is introduced.
The reviewed bound x<=279 is used for the coverage statement. The
reported closure of x136 is irrelevant and is not used.

We repeatedly use these reviewed facts, restating their exact scope:
T is independent and anticomplete to L; s<=12-3t; and, for y in B,

    k_y=|{u in T:y in O_u}|,
    m_y=|{w in L:y in O_w}|,
    m_y<=4-t,  k_y+m_y<=3.

An A edge pq has |R_p intersect R_q|<=8, hence

    |O_p intersect O_q|<=32-r_p-r_q.                 (1)

In particular, a 15--16 edge shares at most one omission, a 14--16
edge at most **two**, a 15--17 edge none, and a 14--17 edge at most one.
Every actual size-17 core induces an 8-regular (4,4)-free graph.

<a id="claim-tail-two-three-profiles"></a>
## 1. Exact coverage of the t>=2 boundary

Claim ID: `n43/d18/tail_two_three.md#claim-tail-two-three-profiles`  
Kind: local-deduction  
Review state: accepted  
Scope: the setting above, t>=2 and x=279  
Dependencies: reviewed independent-row tail counts and x<=279  
Conclusion: the three profiles below are exhaustive; t=4 has x<=278  
Search use: none pending independent review; proposed branch/propagate  
Reviews: [independent audit](review_tail_two_three_20261018_audit.md)

The exact identity is x=270+2t+s-D. Thus at x=279,
s-D=9-2t. Since D>=0 and s<=12-3t, the possibilities are exactly:

| t | s | D | remaining rows |
| --- | --- | --- | --- |
| 2 | 5 | 0 | eleven size-15 rows |
| 2 | 6 | 1 | nine size-15 rows and one size-14 row |
| 3 | 3 | 0 | twelve size-15 rows |

For t=4, s=0 and x=278-D<=278. No t>=5 is possible because T
is independent in the I5-free graph A. This is an exhaustive numerical
profile reduction, not an assertion that any listed profile is realizable.

<a id="claim-tail-two-three-one-deficit-exclusion"></a>
## 2. The (t,s,D)=(2,6,1) profile is impossible

Claim ID: `n43/d18/tail_two_three.md#claim-tail-two-three-one-deficit-exclusion`  
Kind: local-deduction  
Review state: accepted  
Scope: the setting above, x=279 and (t,s,D)=(2,6,1)  
Dependencies: reviewed row cuts, 17-core regularity, b>=144; Mantel and Turan bounds  
Conclusion: this profile has b<=143, a contradiction  
Search use: none pending independent review; proposed terminate this profile  
Reviews: [independent audit](review_tail_two_three_20261018_audit.md)

Write T={u,w}. Since sum_y m_y=8s=48 and m_y<=2 on all 24
vertices, every m_y=2. Then k_y<=1. Consequently O_u and O_w are
disjoint seven-sets. Put

    X=R_u-R_w=O_w,  Y=R_w-R_u=O_u,
    M=X union Y,  C=R_u intersect R_w.

Thus |X|=|Y|=7, |M|=14, |C|=10, and B=C disjoint-union M.
Regularity of the two actual cores, or the reviewed balance lemma, gives

    e(X)=e(Y)=e,
    e(C,X)=e(C,Y)=56-2e,
    e(C)=12+e,
    b=124-e+f,  where f=e_B(X,Y).                    (2)

For completeness, the first equality follows by subtracting the core
degree equations on C and then summing over the exclusive sets. The
remaining equations are the degree sums on X and C and the partition of
B edges. Since B[X] has no I4, its complement has no K4; Turan on seven
vertices gives e>=21-floor(49/3)=5.

Let z0 be the unique size-14 row and Z15 the nine size-15 rows. For any
z in Z define a_z=|O_z intersect M| and put

    a=sum_(z in Z) a_z,
    q=d_L(z0),  j=d_T(z0) in {0,1,2}.

At each y in M, exactly one T root and two L roots omit y. These three
roots are independent. If z also omits y, some A edge from z to this
triple is necessary, or those four A vertices together with y are I5.
For z in Z15 the T root cannot witness this obligation by (1), and an
edge to L witnesses at most one y. Therefore

    sum_(z in Z15) a_z <= e_A(Z15,L).                 (3)

For z0, each L edge witnesses at most two y, and each T edge at most
one, so a_z0<=2q+j. Also a_z0<=10 because |O_z0|=10.
We must retain the *actual* root-attachment restrictions, not just this
weighted capacity. If j=1, (1) bounds O_z0 on one of X,Y by one and
on the other by seven, giving a_z0<=8. If j=2, each of the two parts
has at most one omission, giving a_z0<=2. Altogether

    a_z0 <= min(2q+j, c_j),  (c_0,c_1,c_2)=(10,8,2). (4)

A[L] has no I3 because T is independent and anticomplete to it. Mantel
on its triangle-free complement gives e(A[L])>=15-9=6. Every L vertex
has total A-degree at most seven, and has no T neighbor. Hence

    e_A(Z15,L)+q <= 6*7-2*6=30.

Combining with (3)--(4),

    a <= 30-q+min(2q+j,c_j) <=35.                   (5)

Here is a direct all-integer check, rather than an enumeration: for j=0,
min(10-q,q)<=5; for j=1, min(8-q,q+1)<=4 for integral q;
for j=2, min(2-q,q+2)<=2 for q>=0. Thus the respective upper bounds
on a are 35,34,32. Allowing q outside its actual graph range only weakens
the bound, so no unlisted q case is being omitted.

Finally each y in M has eight B neighbors in its own core, with the
additional B edges running between X and Y. The B-degree sum on M is
112+2f. Its T-neighbor count is one per vertex and L-neighbor count is
four per vertex. The ten vertices Z contribute 140-a A--M edges,
regardless of their individual row sizes. Thus the actual global degree
sum on M is

    112+2f+14+56+140-a=322+2f-a<=14*24=336.

It follows that 2f<=14+a<=49 and hence f<=24. Equations (2) give
b<=124-5+24=143, contrary to b>=144. This proves the exclusion.

The argument deliberately does not assert that a 14--16 edge witnesses
only one omission. That false shortcut would invalidate this extension
of the reviewed x=280 argument.

<a id="claim-tail-two-three-five-sixteen-residual"></a>
## 3. Restrictions on the two-root, five-size-16 residual

Claim ID: `n43/d18/tail_two_three.md#claim-tail-two-three-five-sixteen-residual`  
Kind: local-deduction  
Review state: accepted  
Scope: x=279, t=2, s=5, D=0; the final inequality additionally assumes O_u disjoint O_w  
Dependencies: reviewed row cuts, two-core balance, and b>=144  
Conclusion: exact omission deficit and overlap constraints; conditional beta bound below  
Search use: none pending independent review; proposed propagate  
Reviews: [independent audit](review_tail_two_three_20261018_audit.md)

There are eleven size-15 rows Z. Define q_y=2-m_y, so q_y>=0 and

    sum_(y in B)q_y=48-8*5=8.                       (6)

Put h=|O_u intersect O_w|. At each of these h shared omissions,
k_y=2, so m_y<=1 and q_y>=1. Thus h<=sum q_y=8 (the sharper
cardinality bound h<=7 is automatic). In particular, unlike Claim 2,
the omission inequalities do **not** force h=0. Both coinciding and
overlapping root rows remain within coverage. The reviewed two-core
balance lemma still applies, with exclusive sets of size 7-h and common
core of size 10+h; it does not supply disjoint omission sets.

A[L] has no I3, so Mantel on five vertices gives e(A[L])>=10-6=4.
The total number of edges from L to Z is therefore at most 35-8=27.
At every y with k_y=1,m_y=2, or with k_y=2,m_y=1, the high roots
omitting y form an independent triple. Any size-15 z omitting y needs
an L neighbor also omitting y, since (1) prohibits the T witness; each
L edge witnesses at most one such y. The exact resulting capacity is

    sum_(z in Z)|O_z intersect {y:k_y+m_y=3}|<=27.    (7)

Here is a stronger explicit restriction in the additional subcase h=0.
Define M=O_u union O_w, E={y in M:m_y<=1},

    Q_M=sum_(y in M)(2-m_y),
    beta=sum_(z in Z)|O_z intersect E|,
    a_M=sum_(z in Z)|O_z intersect M|.

The omitted-triple argument on M-E gives a_M<=27+beta. In this
subcase (2) again holds, with e>=5, so b>=144 forces f>=20+e.
The M degree sum now has eleven Z rows and only five L rows. Its
T contribution is 14, L contribution is 70-sum_M m_y, and Z
contribution is 154-a_M. Along with the B contribution 112+2f, the
global degree upper cap gives

    2f<=sum_M m_y+a_M-14
       =14-Q_M+a_M<=41-Q_M+beta.

Consequently

    beta>=Q_M+2e-1>=Q_M+9.                         (8)

Since |E|<=Q_M, beta<=11|E|<=11Q_M, so Q_M>=1 is necessary.
In particular the entire omission deficit in (6) cannot lie in C=B-M.
This is a conditional propagation constraint, **not** an exclusion.
No claim is made that its scalar bounds imply an actual completion.
When h>0, extra B vertices lie outside the union of the two 17-cores;
the disjoint-case degree identity cannot be reused without their edges.

<a id="claim-tail-two-three-three-root-residual"></a>
## 4. Restrictions on the three-root residual

Claim ID: `n43/d18/tail_two_three.md#claim-tail-two-three-three-root-residual`  
Kind: local-deduction  
Review state: accepted  
Scope: x=279, t=3, s=3, D=0  
Dependencies: reviewed independent-anchor cuts and row bounds  
Conclusion: L is a clique, E_T>=13, and the omission/attachment bounds below  
Search use: none pending independent review; proposed propagate  
Reviews: [independent audit](review_tail_two_three_20261018_audit.md)

Write T={u1,u2,u3}; Z has twelve size-15 vertices. Since m_y<=1
and sum m_y=24, every m_y=1, and k_y<=2. The three omitted
sets of L are therefore disjoint eight-sets partitioning B. Moreover L
is a clique: a nonedge in L together with the independent, anticomplete
three-set T would be I5. This uses the A type K4/I5, not K5/I4.
Each L vertex has at most five Z neighbors, so

    e_A(Z,L)<=15.                                   (9)

Every z in Z has a T neighbor. Otherwise, for each w in L the set
T union {w} is independent of order four, so z must be adjacent to w.
But then z union L would be K4 in A. Also z cannot be adjacent to all
three vertices of L, so d_L(z)<=2.

Put E_T=sum_(u in T)epsilon_u=sum_(u in T)d_u. For each w in L,
the reviewed independent-four cut on T union {w} gives

    E_T+d_w>=20.

Since d_w<=7, this proves E_T>=13, improving the independent-three
cut E_T>=12 for this specific profile. Summing d_w-2 over L gives

    13<=E_T<=18,
    3(18-E_T)<=e_A(Z,L)<=15.                       (10)

Let N_j count z in Z having exactly j T neighbors, for j=1,2,3.
Because T is anticomplete to L and independent,

    N_1+N_2+N_3=12,
    N_2+2N_3=E_T-12.                               (11)

At the boundary E_T=13, this forces N_2=1, N_3=0 and N_1=11.
Equation (10) forces every L vertex to have A-degree seven. The
pairwise T cut epsilon_ui+epsilon_uj>=8 and total 13 imply, up to
permutation, T excesses (3,5,5) or (4,4,5): each excess is at most five,
and three nonnegative integers at most five summing to thirteen have
only those two possibilities.

For the actual omission geometry put P={y:k_y=2} and h=|P|.
Since sum k_y=21 and k_y<=2,

    |{k=2}|=h, |{k=1}|=21-2h, |{k=0}|=3+h.

There is no triple intersection of the three O_ui. Thus P is the
disjoint union of their three pairwise intersections. For y in P,
the two T omissions and the unique L omission form an independent
triple. Any z in Z also omitting y needs an L witness by (1).
Each L edge witnesses at most one y, so

    sum_(z in Z)|O_z intersect P|<=e_A(Z,L)<=15,
    |O_z intersect P|<=d_L(z)<=2 for each z.         (12)

If z is adjacent to ui, (1) gives O_z intersect O_ui empty. Thus any
P omission of z lies specifically in the intersection of the other two
T omission sets. If z has two T neighbors it has no P omissions at
all. If it has three T neighbors, all nine omissions must lie in the
3+h vertices with k=0, forcing h>=6. These are simultaneous actual
attachment constraints, not assertions of a possible signature realization.
They do not contradict (9)--(12); this profile remains unresolved here.

## Strongest conclusion and exact limitations

The new exclusion eliminates (t,s,D)=(2,6,1) at x=279. Together with
the reviewed x<=279, it proves that x=279 with t>=2 requires exactly
one of

    (t,s,D)=(2,5,0) or (3,3,0).

Thus t=2,s=6 has x<=278, and t=4 already has x<=278. The
**uniform bound for all t>=2 remains x<=279**: neither residual
profile is excluded, and no stronger uniform conclusion is claimed.
The three-root E_T>=13 restriction and its E_T=13 equality structure
are further proved propagation, not a closure of that profile.

Failed shortcuts are explicit: the t=2,s=5 omission sets need not be
disjoint; one-deficit 14--16 edges may share two omissions; the weighted
bound a_z0<=2q+j alone is insufficient without the root-specific caps;
and the t=3 high-triple obligation applies only where k=2, not all B.
Dropping any of these qualifications would create a false exclusion.

Self-check evidence: the proofs use exact degree sums on the named sets,
Mantel/Turan bounds, and tiny scalar inequalities only. A separate scalar
check evaluates the three expressions in (5) over 0<=q<=6, obtaining
35,34,32 as their maxima. No graph enumeration, solver, build, tests,
download, or formal proof was run. Independent review of this exact
file is required before any new termination or propagation use.
