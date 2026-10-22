# Degree-20 residual coverage and guaranteed pairs

Date: 2026-10-22. Author: Main, alone. All claims are ready for independent
review. No branch closure, executable pruning, or novelty claim is made.

Write R(s,t,n) for graphs with no K_s or I_t. This note implements the
requested d20 residual scope: G belongs to R(5,5,43), v has degree20, and
G has no degree18 vertex. Thus 19<=d_G(z)<=24. The older arbitrary-degree20
scope remains a valid scope for historical formulas; it does not describe
this residual predicate.

The stronger **complement-closed residual predicate** is n18=n24=0,
equivalently 19<=d_G(z)<=23. It follows when d18 is given priority whenever
either G or its complement has a degree18 vertex. Absence of degree18 in G
alone does not imply absence of degree24. Both predicates are retained below.

<a id="claim-d20-residual-routing"></a>
## 1. Complete routing up to complementation

Claim ID: n43/d20/residual_coverage.md#claim-d20-residual-routing  
Kind: local-deduction  
Review state: ready  
Scope: every G in R(5,5,43), considered up to complementation  
Dependencies: R(4,5)=25; handshake lemma  
Conclusion: d18-priority routing leaves only degrees19..23 in d20, with
at least one degree20 or degree22 vertex  
Search use: none pending review; proposed existence coverage  
Reviews: none

All degrees lie in18..24. If n18+n24>0, G or its complement has a degree18
root and is routed to d18. Otherwise all degrees lie in19..23. The number
of odd-degree vertices is even, so an odd-order graph has an even-degree
vertex. Here its degree is20 or22. Use G itself in the former case, or
its complement in the latter, to obtain a degree20 root. This is a complete
disjoint split by the complement-invariant predicate n18+n24>0 versus zero.
It proves coverage, not nonexistence of either branch.

For a one-orientation priority rule that only checks n18(G), the residual
range is19..24 and the degree24 case needs explicit routing to the
complement's d18 root. It cannot simply disappear from the even-pivot tree.

<a id="claim-d20-saturation-routing"></a>
## 2. Saturation and orientation have separate coverage obligations

Claim ID: n43/d20/residual_coverage.md#claim-d20-saturation-routing  
Kind: local-deduction  
Review state: ready  
Scope: existence in R(5,5,43); the two residual predicates above  
Dependencies: finite edge augmentation; the single-edge characterization
in [safe augmentation](../../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-01)  
Conclusion: global K5-saturation preserves the no-degree18 predicate under
augmentation; complementing a saturated graph need not preserve saturation  
Search use: none pending review; proposed existence coverage  
Reviews: none

Here globally saturated means K5-free and every added nonedge creates K5;
I5-freeness is also required. Equivalently, every nonedge has a triangle in
its common neighborhood. This is distinct from K4-saturation of N(v).

Every Ramsey graph has a K5-saturated Ramsey supergraph: maximize its edges
subject to no K5. Adding edges cannot create I5. If the original has no
degree18, neither does any such supergraph, since degrees only increase.
However it may acquire degree24 vertices, and its original degree20 root
may increase in degree. Complement-closed residual membership need not be
preserved by this augmentation.

A fully covered saturated routing is consequently:

| Globally saturated graph H | Root and inherited saturation |
| --- | --- |
| n18(H)>0 | degree18 in H; global K5-saturation retained |
| n18(H)=0, n24(H)>0 | degree18 in complement H; global K5-saturation of this orientation is not implied |
| n18(H)=n24(H)=0, n20(H)>0 | degree20 in H; global K5-saturation retained |
| n18(H)=n24(H)=n20(H)=0 | degree22 in H, hence degree20 in complement H; global K5-saturation of this orientation is not implied |

The last row has a degree22 vertex by handshake. When an orientation is
complemented, the saturation that does transfer is **edge-deletion
criticality for I5**: deleting any edge creates I5. The table prevents
combining complementation and global K5-saturation without a coverage proof.
For the requested saturated d20 subcase the triangle-witness deductions in
[the interface note](interface_bounds.md#claim-d20-saturation-witnesses)
apply directly. The general coverage, connectivity and interface bounds
hold without saturation; the conditional core statements identify their
saturation hypothesis explicitly. Maximum e(N(v)) may be selected within a nonempty
fixed degree class; it does not imply either saturation notion.

<a id="claim-d20-mixed-low-degree-family"></a>
## 3. Thirteen roots of bounded degree suffice, even with mixed degrees

Claim ID: n43/d20/residual_coverage.md#claim-d20-mixed-low-degree-family  
Kind: local-deduction  
Review state: ready  
Scope: any G in R(5,5,43), any prescribed vertex family F  
Dependencies: R(3,3)=6, R(3,4)=9, R(3,5)=14; the accepted structural
component bound [family overlap, Claim2](../../../docs/general_theorems/family_overlap.md#claim-family-overlap-02)  
Conclusion: |F|>=13 and all degrees<=20 gives a family edge of codegree<=11;
all degrees<=21 gives a family edge of codegree<=12  
Search use: none pending review; proposed pair-selection coverage  
Reviews: none

For the first assertion suppose every edge in J=G[F] has ambient codegree
at least12. On a triangle u,v,w in J let t be its common-neighbor count.
K5-freeness makes those neighbors independent, so t<=4. At each endpoint,

    24 <= c(u,v)+c(u,w) <= d_G(u)+t <= 20+4.

Equality forces all three degrees20, all edge codegrees12, t=4, and every
ambient vertex has zero, two, or three adjacencies to this triangle. Thus J
is induced-paw-free. A K4 in J would have degree20 at every endpoint;
its outside vertices have zero or three adjacencies to it. Summing the cut
and edge-codegrees of that K4 would give 4*20=6*12, impossible. Hence J
is K4-free.

If an independent four-set I lies in N_G(u) intersect F, every vertex of
M_G(u) meets I. Each exact singleton I-signature class is a clique of size
at most3, so

    e(I,M_G(u)) >= 2|M_G(u)|-12 >=32.

But degrees of vertices of I are at most20, and each is adjacent to u.
Consequently

    sum_(i in I)c(u,i) <= 4*19-32=44 <4*12,

a contradiction. Therefore every J-neighborhood has independence at most3,
and alpha(J)<=4. The accepted component bound, with k=4, bounds each
component by three times its independence number: triangle-containing
paw-free components are complete tripartite; triangle-free components use
the bounds2,5,8,12 at independence numbers1,2,3,4. Hence |J|<=12.
This contradicts |F|>=13 and proves the first assertion. The triangle
argument explicitly handles mixed degrees; equality forces degree20.

For the second assertion assume every J-edge has codegree at least13.
A triangle would give 26<=d_G(u)+t<=21+4=25, so J is triangle-free.
The same independent-four argument uses |M_G(u)|>=21 and degrees<=21:

    e(I,M_G(u))>=30,
    sum_(i in I)c(u,i)<=4*20-30=50<4*13.

Thus Delta(J)<=3. The triangle-free component bounds2,5,8,12 again give
|J|<=12. This proves the second assertion. The guaranteed edge has both
endpoints in the originally prescribed family, so any common additional
property of that family is retained at the same pair.

<a id="claim-d20-complete-pair-selection"></a>
## 4. A disjoint exhaustive pair-selection rule

Claim ID: n43/d20/residual_coverage.md#claim-d20-complete-pair-selection  
Kind: local-deduction  
Review state: ready  
Scope: every no-degree18 residual graph G; no orientation selector or saturation needed  
Dependencies: Claim3 applied to G and its complement  
Conclusion: the following three cases cover every such graph  
Search use: none pending review; proposed complete two-root branching  
Reviews: none

Put L20={z:d_G(z)<=20} and L21={z:d_G(z)<=21}.

| Disjoint predicate | Guaranteed pair in this same graph |
| --- | --- |
| card(L20)>=13 | adjacent u,w in L20, c_G(u,w)<=11 |
| card(L20)<=12 and card(L21)>=13 | adjacent u,w in L21, c_G(u,w)<=12 |
| card(L21)<=12 | nonadjacent u,w with d_G(u),d_G(w)>=22 and at most11 common nonneighbors |

In the last case at least31 vertices have degree>=22 in G, hence degree<=20
in the complement. Claim3 there supplies a complementary edge of codegree
at most11. Its endpoints are actual vertices of G; no
saturation property of the complement is required.

In the complement-closed residual case the first two families have degrees
19/20 and19/20/21 respectively, and the last pair has degrees22/23. In the
one-orientation residual it may also use degree24. The rule neither assumes
nor forces a large same-degree class. A future two-root search must retain
all allowed endpoint degrees, overlap values, maps and completions; these
existence statements do not close the branch.
