<!-- extension-research-integration:start -->
Integration status (2026-10-17): all five claims independently accepted at
reviewed-body SHA-256 `8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`.
See the [exact-revision review and premise-declaration addendum](review_independent_row_cuts_20261017_audit.md).
The reviewed body below is preserved verbatim; ready labels are historical.
Permitted use: the stated profile propagation and termination of x>=280,
on the declared smaller Ramsey/global degree premises and e(B)>=144.
The census-free intermediate bound is280. No x136 closure premise,
formal exhaustion certificate, novelty claim, or full d18 exclusion is used.
Lean formalization: [`Ramsey.d18.degree18_cross_le_279`](../../lean/Ramsey/d18/CrossEdgeBounds.lean)
proves the actual degree-18 pivot bound. The supporting modules also prove the
census-free tail count and both equality-profile exclusions. The reviewed body
below remains unchanged.
<!-- extension-research-integration:end -->

# Independent-row cuts and the large-row tail

Date: 2026-10-17. Task: `extension-research-20261017`. Author: Main.
Pure mathematical deductions with arithmetic self-checks; no graph enumeration,
solver, catalogue acquisition, installation, or novelty review. The user's
reported closure of x=136 is not used anywhere in these claims.

## Setting

G has order 43 and neither K5 nor I5. A=N(v) has order 18 for a degree-18
pivot v, and B=M(v) has order 24. A is K4/I5-free; B is K5/I4-free.
The recorded R(4,5)=25 gives 18<=d_G(z)<=24 for every vertex z of G,
including B vertices; the final degree sum uses this global upper cap.
For u in A write r_u=|R_u| with R_u=N_B(u), d_u=d_A(u), and
 epsilon_u=d_G(u)-18. Recorded Ramsey bounds give 0<=epsilon_u<=6,
0<=d_u<=13, r_u<=17, and d_u+r_u=17+epsilon_u.

Dependencies are the smaller Ramsey bounds R(4,3)=R(3,4)=9,
R(3,3)=6 and R(4,4)=18; see the
[baseline](../../docs/mathematical_baseline.md). Claims 01--04 use no graph
census. Claim 05 additionally uses the recorded published bound e(B)>=144,
obtained by complementing E(4,5,24)<=132; see
[the existing census input](cross_upper_bound.md#1-setting-and-premises).
No claim uses the reported x136 closure.

<a id="claim-independent-row-degree-cuts"></a>
## 1. Independent internal anchors give upper row budgets

Claim ID: `n43/d18/independent_row_cuts.md#claim-independent-row-degree-cuts`  
Kind: local-deduction  
Review state: accepted  
Scope: every G,v above and every independent t-set I in A, t=2,3,4  
Dependencies: ambient types and R(4,3)=9  
Conclusion: sum_I d_u>=8,12,20 respectively; equivalently
sum_I r_u<=26+E_I,39+E_I,48+E_I, where E_I=sum_I epsilon_u  
Search use: none pending independent review; proposed propagate  
Reviews: [exact-revision review; operative premise-declaration addendum](review_independent_row_cuts_20261017_audit.md)

For t=2, the A vertices outside I missing both anchor vertices form a
K4/I3-free graph, hence number at most eight. Of the 16 vertices outside I,
at least eight have a neighbor in I. Thus sum_I d_u>=8. More precisely,
for nonadjacent u,w in A,

    d_u+d_w-|N_A(u) intersect N_A(w)|>=8.                 (1)

For t=3, the vertices missing all three anchor vertices form a clique:
two nonadjacent such vertices would extend I to I5. A is K4-free, so
at most three of the 15 outside vertices miss I. Hence sum_I d_u>=12.

For t=4, every one of the 14 outside vertices meets I. For fixed u in I,
the outside vertices with exact I-signature {u} form a clique, since a
nonadjacent pair together with I-{u} would form I5. This clique has at
most two vertices because it is joined to u and A has no K4. There are
at most eight singleton signatures. If n1 denotes their number and
h=sum_(outside vertices with signature size>=3)(signature size-2), then

    sum_I d_u=28-n1+h=20+(8-n1)+h>=20.                 (2)

The pivot is not included in these signatures: this is a count inside A,
not the existing 24-column anchor count in B. Substitute
sum_I r_u=17t+E_I-sum_I d_u to obtain the row budgets. No uniform
existence of an independent t-set in a prescribed subset is assumed.

<a id="claim-independent-row-combined-pairs"></a>
## 2. Opposing pair cuts and size-17 excess profiles

Claim ID: `n43/d18/independent_row_cuts.md#claim-independent-row-combined-pairs`  
Kind: local-deduction  
Review state: accepted  
Scope: every pair of actual A vertices and the family L17={u:r_u=17}  
Dependencies: claim-independent-row-degree-cuts; R(3,4)=9  
Conclusion: opposing forced-pair tests and the excess thresholds below  
Search use: none pending independent review; proposed propagate  
Reviews: [exact-revision review; operative premise-declaration addendum](review_independent_row_cuts_20261017_audit.md)

An A edge uw makes B[R_u intersect R_w] K3/I4-free, so its order is at
most eight. Since its order is at least r_u+r_w-24,

    r_u+r_w>32  =>  uw is a nonedge.                    (3)

On the other hand, (1) gives

    r_u+r_w>26+epsilon_u+epsilon_w  =>  uw is an edge.   (4)

If both antecedents hold, the pair is impossible, without needing to
inspect B's triangle or independent-triple witnesses. These are sufficient,
not complete, forced-pair tests.

Every size-17 row vertex has d_u=epsilon_u. By (3) L17 is independent,
has size at most four, and is anticomplete to L16={u:r_u=16}. If
 t=|L17|, the independent-anchor cuts give

| t | Necessary sum of excess on L17 |
| --- | --- |
| 2 | at least 8 |
| 3 | at least 12 |
| 4 | at least 20 |

For every pair in L17, epsilon_u+epsilon_w>=8, so when t>=2 each
member has excess at least two. A size-17 and size-16 pair also obey
 epsilon_u+epsilon_w>=7, since (3) forces that pair to be a nonedge.
These exclude entire numerical row/excess profiles for all x.

<a id="claim-independent-row-tail-counts"></a>
## 3. Omitted high rows give the unconditional bound x<=280

Claim ID: `n43/d18/independent_row_cuts.md#claim-independent-row-tail-counts`  
Kind: local-deduction  
Review state: accepted  
Scope: every G,v above; t=|L17| and s=|L16|, including t=0  
Dependencies: claim-independent-row-combined-pairs; ambient I5 prohibition  
Conclusion: s<=12-3t, 7t+8s<=72, and x<=280; table below  
Search use: none pending independent review; proposed propagate and terminate x>=281  
Reviews: [exact-revision review; operative premise-declaration addendum](review_independent_row_cuts_20261017_audit.md)

For y in B let O_y={w in L16:y notin R_w} and
k_y=|{u in L17:y notin R_u}|, m_y=|O_y|. If two L16 vertices are
adjacent in A, their row intersection has order at most eight and hence
their union is all B. Thus O_y is independent. L17 is independent and
anticomplete to L16, so L17 union O_y is independent inside A. It follows
that t+m_y<=4. Sum over all 24 vertices y: each L16 row omits eight
vertices, giving

    8s=sum_y m_y<=24(4-t),  s<=12-3t.                 (5)

There is a second, stronger bound when few size-17 rows occur. The subset
of L17 omitting y together with O_y is independent and anticomplete to y.
It therefore has order at most three, or adjoining y makes I5. Hence

    k_y+m_y<=3,
    7t+8s=sum_y(k_y+m_y)<=72.                         (6)

Both constraints are needed: replacing (6) by the I5 bound inside A alone
would lose the extra independent vertex y. All other rows have size at
most 15, so x<=270+2t+s. Since 0<=t<=4, (5) and (6) give

| t | Upper bound on s | Upper bound on x |
| --- | --- | --- |
| 0 | 9 | 279 |
| 1 | 8 | 280 |
| 2 | 6 | 280 |
| 3 | 3 | 279 |
| 4 | 0 | 278 |

In particular x<=280 for every degree-18 pivot. This excludes the entire
tail x>=281, not just a specified family of large rows. No neighborhood
census, root selection, or graph enumeration is used. If x=280, exactly
one of the following profiles remains: (t,s)=(1,8) with nine other rows
of size 15, or (t,s)=(2,6) with ten other rows of size 15. Any smaller
remaining row would make the respective upper bound strict.

<a id="claim-independent-row-single-seventeen-boundary"></a>
## 4. The one-size-17 equality profile is impossible

Claim ID: `n43/d18/independent_row_cuts.md#claim-independent-row-single-seventeen-boundary`  
Kind: local-deduction  
Review state: accepted  
Scope: x=280 and t=1 in the preceding equality table  
Dependencies: claim-independent-row-tail-counts; exact row degree bounds  
Conclusion: this profile is impossible; a pivot with exactly one size-17 row has x<=279  
Search use: none pending independent review; proposed terminate this profile  
Reviews: [exact-revision review; operative premise-declaration addendum](review_independent_row_cuts_20261017_audit.md)

Let L=L16 have eight vertices and Z be the nine size-15 row vertices.
The total of k_y+m_y is 7+8*8=71. Each is at most three by (6), so
exactly 23 B vertices have k_y+m_y=3, and one has value two. At every
one of those 23 vertices the actual high-row roots omitting y form an
independent triple J_y.

Fix z in Z. It omits nine vertices of B, at least eight among those 23.
For each such y, z must have an A neighbor in J_y; otherwise
{y,z} union J_y is I5. That neighbor cannot be the size-17 root: if a
size-17 and size-15 row both omit y, their intersection has order at
least 17+15-23=9 and contains a B triangle, forbidding their adjacency.
Thus each of these at least eight obligations requires an L neighbor.

For adjacent z in Z and w in L, their omitted sets satisfy

    |(B-R_z) intersect (B-R_w)|<=1.                   (7)

Indeed |R_z intersect R_w|=15+16-24+|(B-R_z) intersect (B-R_w)|,
and an A edge bounds this intersection by eight. Therefore one L
neighbor of z can meet at most one of the eight distinct omitted-y
obligations. Each z has at least eight L neighbors, giving e_A(Z,L)>=72.
But every L vertex has full A-degree 1+epsilon_w<=7, so e_A(Z,L)<=56.
This contradiction excludes the profile without assuming any of its
undecided edges. Combined with the table, x=280 requires t=2,s=6.

<a id="claim-independent-row-280-boundary"></a>
## 5. The two-size-17 equality profile is impossible: x<=279

Claim ID: `n43/d18/independent_row_cuts.md#claim-independent-row-280-boundary`  
Kind: local-deduction  
Review state: accepted  
Scope: every G,v above; the remaining x=280 profile  
Dependencies: preceding claims; R(4,4)=18; the all-vertex degree cap
d_G(z)<=24 from R(4,5)=25; Mantel/Turan bounds; the published e(B)>=144 premise  
Conclusion: x=280 is impossible, hence x<=279 for every degree-18 pivot  
Search use: none pending independent review; proposed terminate x>=280 on the stated premises  
Reviews: [exact-revision review; operative premise-declaration addendum](review_independent_row_cuts_20261017_audit.md)

Suppose x=280. By Claims 03--04 there are two size-17 roots u,w, six
size-16 roots L, and ten size-15 roots Z. The roots u,w are independent
and anticomplete to L. In (5), 8s=48=24(4-t), so every m_y=2.
Equation (6) forces k_y<=1. Thus their omitted seven-sets are disjoint:
the two 17-cores cover B and have a ten-vertex common core C. Write

    X=R_u-R_w, Y=R_w-R_u, |X|=|Y|=7, M=X union Y.

Both induced 17-cores are (4,4)-free and therefore 8-regular. Subtract
their degree equations on C to obtain e(C,X)=e(C,Y). Summing the degree
equations on X and Y gives e(X)=e(Y)=e. The same equations give

    e(C,X)=e(C,Y)=56-2e,
    e(C)=12+e,
    b=e(B)=124-e+f, where f=e_B(X,Y).                  (8)

Since X has no I4, its complement is K4-free on seven vertices. Turan's
bound gives at most floor(7^2/3)=16 complement edges, hence e>=21-16=5.

For each y in M, exactly one size-17 root and exactly two L roots omit y.
They form an independent triple J_y. If z in Z also omits y, it must
have an A neighbor in J_y, or {y,z} union J_y is I5. The omitted size-17
root cannot be that neighbor, by the same 17+15-23 intersection argument
as in Claim 04. Thus some L neighbor must also omit y. By (7), any one
edge from z to L can witness at most one such y. Summing the obligations,

    a_M:=sum_(z in Z)|(B-R_z) intersect M|<=e_A(Z,L).  (9)

The graph A[L] has no I3, since adding u,w to such a triple would give
I5. Its complement is triangle-free on six vertices, and Mantel's bound
gives e(A[L])>=C(6,2)-9=6. Every L vertex has full A-degree at most
seven and has no neighbor among u,w, so

    e_A(Z,L)<=6*7-2e(A[L])<=30.                      (10)

Finally sum global degrees on the actual fourteen-vertex set M. The
B-internal degree sum is 14*8+2f=112+2f: each vertex has eight neighbors
in its own 17-core and its other B neighbors lie in the other exclusive
seven-set. Each M vertex has exactly four L neighbors and exactly one
neighbor among u,w, contributing 14*5=70. The ten Z vertices contribute
10*14-a_M=140-a_M. There are no pivot edges to B. Therefore

    sum_(y in M)d_G(y)=322+2f-a_M<=14*24=336,
    2f<=14+a_M<=44, so f<=22.                       (11)

Equations (8) and (11), together with e>=5, now give

    b<=124-5+22=141,

contrary to the retained published lower bound b>=144. This excludes
the last x=280 profile. Claim 03 had already excluded x>=281, proving
the new unconditional-in-the-root bound x<=279 on the stated Ramsey and
census premises. No x136 closure, isolated-neighborhood enumeration, or
assumption about the degree-18 family size enters the proof.

The entire tail x=280,...,288 in the former corridor is consequently
excluded. This does not exclude x=279, establish endpoint realizability,
or decide the degree-18 branch.

## Evidence and limits

The independent-anchor counts were checked directly inside A, separately
from the old signatures of B columns. Tail bounds, omitted-incidence
budgets and equality profiles were checked by finite integer arithmetic,
not graph enumeration. The intermediate bound x<=280 and the one-size-17
equality exclusion use no graph census; the final x<=279 uses only the
explicit e(B)>=144 census premise beyond those elementary inputs.
Independent review is required before pruning. No full degree-18 exclusion
or order-43 decision is claimed; x<=279 remains to be investigated.
