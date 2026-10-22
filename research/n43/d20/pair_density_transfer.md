# Degree-20 pair density transfer and common-cell cut certificates

Date: 2026-10-22. Author and self-auditor: /root, working alone.
Task: `d20-pair-transfer-20261022`. The five claims are ready for independent
review. This note extends the codegree-two comparison in
[large-row tail, Claim 4](large_row_tail.md#claim-d20-large-row-maximal-root)
to every pair of actual degree-20 vertices, and gives stronger nonedge
certificates from the common-neighbor graph. The earlier proof is preserved.

Let G be a simple K5/I5-free graph on 43 vertices, let v,u be distinct
vertices of degree 20, and suppose every vertex has degree at most M,
where M is an integer in 20..24. Write

    a_w=e(G[N_G(w)]), x_w=e(N_G(w),M_G(w))  (w=v,u),
    gamma=1 if vu is an edge, and 0 otherwise,
    S=N(v) intersect N(u), q=|S|,
    H=N(v)-({u} union S), D=N(u)-({v} union S),
    Z=V(G)-({v,u} union S union H union D),
    k=|H|=|D|=20-gamma-q, z=|Z|=q+1+2gamma,
    m_H=e(H), m_D=e(D), delta=e(S),
    f=e(S,H), c=e(S,D), j=e(S,Z),
    p=e(H,D), r=e(H,Z), Delta=a_u-a_v.

All cells exclude the roots. No minimum-degree, saturation, complementation
or root-selection assumption is imposed on the identities. The optional
maximum-density hypothesis is that v maximizes a_w among all actual
degree-20 vertices in this fixed G, with every tie retained. The general
order-43 degree cap gives M=24. The complement-closed residual n18=n24=0
gives M=23. Absence of degree 18 alone gives only M=24.

The Ramsey premises are R(4,5)=25, R(4,4)=18, R(3,4)=R(4,3)=9,
R(3,3)=6 and R(3,5)=R(5,3)=14 from the
[baseline](../../../docs/mathematical_baseline.md). The lower edge bounds
used in the numerical tables are the published (4,4) bounds

| h | 11 | 12 | 13 | 14 | 15 | 16 | 17 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| L(h) | 19 | 26 | 33 | 41 | 50 | 60 | 68 |

Source: McKay--Radziszowski, *The Ramsey Number R(5,5)*, Australasian
Journal of Combinatorics 5 (1992), Table 1, p. 16, as recorded in the
[root table](../../../README.md#state-of-the-art) and
[census ledger](../reductions.md#15-published-census-dependencies).
These are external premises, not recertified here. The identities and
cut lemmas do not depend on this census.

<a id="claim-d20-pair-defect-identity"></a>
## 1. Exact density transfer for either root relation

Claim ID: research/n43/d20/pair_density_transfer.md#claim-d20-pair-defect-identity  
Kind: local-deduction  
Review state: ready  
Scope: every degree-20 pair and degree cap M in the setting above  
Dependencies: exact cell counting; K5/I5 prohibitions; R(4,4)=18; R(3,5)=R(5,3)=14  
Conclusion: the two nonnegative-defect identities (3)--(4), with correct exclusive-cell types and overlap domains  
Search use: none pending independent review; proposed numerical propagation and root selection  
Reviews: none

Both H and D are K4/I4-free. For H, a K4 extends with v to K5,
and an I4 extends with u to I5; reverse v,u for D. Thus k<=17,
giving q>=2 for an edge and q>=3 for a nonedge. For an edge, S is
triangle-free (a triangle together with v,u makes K5) and I5-free,
so q<=13. For a nonedge, Z is K5/I3-free: an I3 together with v,u
makes I5. Hence z<=13 and q<=12. These domains do not assert that
each pair type occurs.

The exact counts, for either value of gamma, are

    a_v=gamma*q+delta+m_H+f,
    a_u=gamma*q+delta+m_D+c,
    Delta=m_D-m_H+c-f,
    x_v=gamma*k+(1-gamma)*q+c+j+p+r,
    sum_(h in H)d_G(h)=k+2m_H+f+p+r.                  (1)

The root-only cut term in x_v is k for an edge (u sees D) and q
for a nonedge (u sees S). Each h in H sees v and misses u, explaining
the same k term in the degree sum in both cases. Eliminating p+r gives

    x_v=Delta+sum_H d_G(h)-(1-gamma)*k
        +(1-gamma)*q-m_H-m_D+j.                      (2)

For any real J with j<=J, put

    C_J=(M-1+gamma)*k+(1-gamma)*q+J-m_H-m_D,
    sigma_H=sum_(h in H)(M-d_G(h)),
    sigma_D=sum_(d in D)(M-d_G(d)).

Then exactly

    Delta-(x_v-C_J)=sigma_H+J-j>=0,                 (3)
    -Delta-(x_u-C_J)=sigma_D+J-j>=0.                (4)

Equation (3) follows by substitution in (2); (4) is the same count
with v,u interchanged. Each degree slack is nonnegative under the
stated global cap. With the trivial cut cap J=qz, the constants are

    edge:    C_J=M*(19-q)+q*(q+3)-m_H-m_D,
    nonedge: C_J=(M-1)*(20-q)+q*(q+2)-m_H-m_D.       (5)

At gamma=1,q=2,M=24, H,D have order 17 and 68 edges, so C_J=282.
Equation (3) is precisely the previous codegree-two defect identity.
There is no transfer of an I4 prohibition to all of N(v), which remains
K4/I5-free and may contain I4.

<a id="claim-d20-pair-symmetric-budget"></a>
## 2. Symmetric cross budget and a complete maximum-root certificate

Claim ID: research/n43/d20/pair_density_transfer.md#claim-d20-pair-symmetric-budget  
Kind: local-deduction  
Review state: ready  
Scope: Claim 1; the one-root bound additionally requires maximum-density selection of v among degree-20 vertices  
Dependencies: [Claim 1](#claim-d20-pair-defect-identity); finiteness of the actual degree-20 class  
Conclusion: x_v+x_u=2C_J-sigma_H-sigma_D-2(J-j); at a maximum root x_v<=C_J-sigma_H-(J-j)  
Search use: none pending independent review; proposed propagation and existence-preserving root selection  
Reviews: none

Adding (3) and (4) gives

    x_v+x_u=2C_J-sigma_H-sigma_D-2(J-j)<=2C_J.       (6)

This bound does not require either root to maximize density. In particular,
two roots with cross sum above 2C_J are impossible on the stated premises.
Replacing m_H,m_D by applicable lower bounds makes a weaker valid constant.

If v is a maximum-density degree-20 root, Delta<=0, and (3) gives

    x_v<=C_J-sigma_H-(J-j)<=C_J.                     (7)

Equality x_v=C_J forces Delta=0, sigma_H=0 and j=J: the destination
ties in density, every H vertex has degree M, and the cut attains its
declared cap. If C_J has also been relaxed by m_H,m_D>=L(k), equality
forces both core edge counts to attain L(k). These are necessary equality
conditions, not a realization assertion.

The degree-20 class is nonempty because v exists. It is finite, so it
has a maximum a_w; selecting any maximizer leaves G and its degree
window fixed. It preserves any saturation hypothesis already true of G,
without implying saturation. An arbitrary previously fixed root does
not acquire (7). This argument neither complements nor augments G and
does not impose a secondary rule on tied roots.

<a id="claim-d20-pair-numerical-caps"></a>
## 3. Numerical bounds, including the nonedge eight-neighbor cap

Claim ID: research/n43/d20/pair_density_transfer.md#claim-d20-pair-numerical-caps  
Kind: local-deduction  
Review state: ready  
Scope: Claims 1--2, k in 11..17 for the displayed numerical tables; maximum-density selection for each x_v ceiling  
Dependencies: Claims 1--2; published lower bounds L(k); R(4,3)=9  
Conclusion: tables below; the corresponding pair cross-sum ceiling is twice the listed entry  
Search use: none pending independent review; proposed pair propagation  
Reviews: none

For an adjacent pair use J=q(q+3). Define

    C_edge(M,q)=M*(19-q)+q*(q+3)-2L(19-q).

For a nonadjacent pair, Z has no I3. For each s in S, N_Z(s) also
has no K4, since such a K4 extends with s to K5. R(4,3)=9 therefore
gives |N_Z(s)|<=8. Put b0=min(q+1,8), giving the stronger cap J=q*b0.
Define

    C_nonedge(M,q)=(M-1)*(20-q)+q+q*b0-2L(20-q).

Substitute these J values in (7), then use m_H+m_D>=2L(k):

| Adjacent overlap q | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| M=24: x_v at most | 282 | 282 | 288 | 294 | 300 | 306 | 314 |
| M=23: x_v at most | 265 | 266 | 273 | 280 | 287 | 294 | 303 |

| Nonadjacent overlap q | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| M=24: x_v at most | 270 | 272 | 280 | 288 | 296 | 296 | 296 |
| M=23: x_v at most | 253 | 256 | 265 | 274 | 283 | 284 | 285 |

For overlaps beyond the tables, (3)--(7) still hold with actual m_H,m_D;
no unrecorded census entry is needed for those identities. An entry above
an existing branch ceiling is merely a weaker conditional bound. In the
complement-closed residual, the existing e(M(v))>=117 and degree cap 23
already give x_v<=23*22-2*117=272. For example 253, 256 and 265 improve
that ceiling on the indicated nonadjacent-pair predicates; 274 does not.
The e(M(v)) premise is recorded in the
[interface setting](interface_bounds.md), with source Angeltveit--McKay,
arXiv:2409.15709v2, Appendix A, Table 1, order 22 complemented.

<a id="claim-d20-common-cell-clique-packing"></a>
## 4. Disjoint triangles and edges give additive cut improvements

Claim ID: research/n43/d20/pair_density_transfer.md#claim-d20-common-cell-clique-packing  
Kind: local-deduction  
Review state: ready  
Scope: a nonadjacent degree-20 pair; any actual vertex-disjoint collection of tau triangles and eta edges in G[S], 3*tau+2*eta<=q  
Dependencies: Claims 1--3; K5/I5 prohibitions; R(3,3)=6  
Conclusion: additive cut and cross ceilings (8)--(9), with the triangle and six-overlap tables below  
Search use: none pending independent review; proposed witnessed cut propagation  
Reviews: none

For an edge E={s,t} in S, its common neighbors in Z contain neither
a triangle (it extends E to K5) nor an I3 (Z has no I3). Hence their
number is at most five by R(3,3)=6. The union of their two Z-neighborhoods
has order at most z, so

    e(E,Z)<=z+5, and also e(E,Z)<=2*b0.

For a triangle T in S, its common Z-neighbors are independent, since
an edge among them extends T to K5. Z has no I3, so at most two
vertices of Z see all of T. Every other Z vertex sees at most two of
T, giving

    e(T,Z)<=2z+2, and also e(T,Z)<=3*b0.

Define the nonnegative improvements

    rho_2=max(0,2*b0-z-5),
    rho_3=max(0,3*b0-2z-2).

Because the chosen triangles and edges are vertex-disjoint, summing
their cut bounds and b0 per remaining S vertex gives

    j<=J_pack=q*b0-tau*rho_3-eta*rho_2.              (8)

Put J=J_pack in (3)--(7). In particular, at a maximum-density root,

    x_v<=C_nonedge(M,q)-tau*rho_3-eta*rho_2.         (9)

Without maximum selection the pair cross sum is at most twice that
constant. Missing edges between different packed blocks impose no
additional hypothesis: only their disjoint vertex sets are needed for
the sum. Overlapping triangles cannot be counted as two blocks.

For at least one actual triangle, take tau=1,eta=0:

| Nonadjacent overlap q | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| rho_3 | 2 | 3 | 4 | 5 | 6 | 4 | 2 |
| M=24: x_v at most | 268 | 269 | 276 | 283 | 290 | 292 | 294 |
| M=23: x_v at most | 251 | 253 | 261 | 269 | 277 | 280 | 283 |

Some stronger actual-graph certificates are:

| Overlap and disjoint blocks | M=24: x_v at most | M=23: x_v at most |
| --- | --- | --- |
| q=5, one triangle and one edge | 275 | 260 |
| q=6, one triangle and one edge | 281 | 267 |
| q=6, two triangles | 278 | 264 |

For M=23, the first four one-triangle entries and all three additional
entries improve the residual ceiling 272. In a globally K5-saturated G,
every nonedge vu has a triangle in S, so the one-triangle hypothesis is
automatic in that same orientation. The two-triangle or triangle-plus-edge
hypotheses remain actual graph predicates. Saturation is unnecessary when
a triangle is supplied directly, and must not be inferred after
complementation; see [saturation routing](residual_coverage.md#claim-d20-saturation-routing).

<a id="claim-d20-high-cross-companion-separation"></a>
## 5. High-cross maximum roots have separated degree-20 companions

Claim ID: research/n43/d20/pair_density_transfer.md#claim-d20-high-cross-companion-separation  
Kind: local-deduction  
Review state: ready  
Scope: G in R(5,5,43), v a maximum-density degree-20 root; M=24 or M=23 as specified  
Dependencies: Claims 1--4; [large-row tail Claim 1](large_row_tail.md#claim-d20-large-row-deficits) only for the x=290 profile corollary  
Conclusion: the companion-overlap thresholds below and the explicit restrictions on the two unresolved x=290 profiles  
Search use: none pending independent review; proposed root-selection and profile propagation  
Reviews: none

For M=24, the overlap domains and tables prove:

* If x_v>=283, every degree-20 neighbor u has q>=4, and every
  degree-20 nonneighbor u has q>=6.
* If x_v>=289, every degree-20 neighbor u has q>=5, and every
  degree-20 nonneighbor u has q>=7.
* If x_v>=284 and a degree-20 nonneighbor's common neighborhood
  contains a triangle, that overlap has q>=7.

For example, x_v>=289 contradicts every adjacent q=2,3,4 entry
and every nonadjacent q=3,4,5,6 entry. The first item similarly uses
the nonadjacent bounds through q=5. For the last item, the one-triangle
table is at most 283 through q=6. These are integer strict cutoffs.

In the complement-closed residual M=23, x_v>=270 forces adjacent
degree-20 companions to have q>=4 and nonadjacent companions q>=6.
If the nonadjacent common neighborhood contains a triangle, x_v>=270
forces q>=7. No triangle is required for the first two conclusions.

In rooted-row notation, an adjacent degree-20 u has r_u=19-q.
Consequently x_v>=289 excludes degree-20 endpoints of every row of
size at least 15. A nonadjacent degree-20 u has column size q, so
the same threshold forces all such columns to have size at least 7.

In the additional no-degree18 scope, the previous high-row count gives
only two necessary x_v=290 profiles:

    (t,l,h,D_tail)=(0,1,8,0) or (0,2,6,0),

where t,l,h count size-17,16,15 rows and D_tail is the deficit below 14.
Thus all remaining rows have size 14. At a maximum-density root,
none of the nine (respectively eight) size-15/16 endpoints has degree 20.
Every degree-20 neighbor belongs to the size-14 family, has q=5, and
every degree-20 nonneighbor has column size at least 7. These restrictions
follow for each profile; neither profile is excluded.

## Remaining target and review limits

The major result here is a general, census-free pair identity with
explicit degree and cut defects, and its conditional numerical and
clique-packing consequences. It supplies certificates for every actual
degree-20 pair, including nonadjacent pairs and overlaps beyond two.
No occurrence of a low-overlap pair at the chosen maximum root is proved.
The graph may have only one degree-20 vertex; a supplied companion may
have a larger overlap. Global mixed-degree pair coverage does not ensure
a pair containing this maximum root and cannot fill that gap silently.

The no-degree18 uniform ceiling remains 290; the complement-closed
residual ceiling remains 272. The x=290 profiles remain open, with the
new companion restrictions above. No degree-19 deduction was developed
or revised in this task. No entire d20 branch or order-43 decision is
closed, and the global Ramsey interval remains 43..46. There is no
novelty claim, independent acceptance, formal certificate or executable
filter change. The [dated report](../../reports/2026-10-22-d20-pair-transfer.md)
records the arithmetic self-check and exact revisions for review.
