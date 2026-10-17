# Connectivity of the degree-18 neighborhood

Date: 2026-10-17. Task token: `connectivity-d18-20261017`. Base revision:
`d7851e8`. Purely mathematical derivation on recorded premises; no graph
search, enumeration, solver, catalogue download, installation, or novelty
review was performed. The question arose from planning the `G[A]` generator
(`scripts/geng.sh`): whether connected-only generation may be used.

## Setting

G is an order-43 graph with no K5 and no I5, v is a degree-18 vertex,
A=N(v), a=e(G[A]), q=85-a. Then G[A] is (4,5)-free: K4-free because a K4
together with v gives K5, and I5-free by heredity. External premises
retained as recorded, not recertified: R(4,4)=18, R(3,4)=9, and the
published (4,4) census intervals 50..55, 60..60, 68..68 on 15, 16, 17
vertices (root README census table; McKay-Radziszowski 1992 as recorded in
`lean/Ramsey/Premises.lean`).

Preamble (independence is exactly four). An I5 in A would be an I5 in G,
so alpha(A)<=4. Since A is K4-free on 18 vertices, R(4,4)=18 leaves an I4,
so alpha(A)>=4. Hence alpha(A)=4. The lower step is the argument already
used in `pairwise_frontier_refinements.md`.

<a id="claim-connectivity-01"></a>
## 1. Disconnection shape

Claim ID: `n43/d18/neighborhood_connectivity.md#claim-connectivity-01`  
Kind: local-deduction  
Review state: accepted
Scope: every order-43 (5,5)-free G, every degree-18 pivot v; a statement
about G[A] alone, with no assumption on x, q, E, or the interface  
Dependencies: R(4,4)=18; R(3,4)=9; K5/I5 prohibitions  
Conclusion: if G[A] is disconnected, then A has exactly two components: one
complete component K_m with m in {1,2,3}, and one (4,4)-free component C on
18-m vertices with alpha(C)=3  
Search use: propagate  
Reviews: [independent audit and Lean verification](../../reports/2026-10-17-d18-connectivity.md#independent-review)

Proof. Let C_1,...,C_k be the components of G[A], k>=2. Independence is
additive over disjoint unions, so sum_i alpha(C_i)=alpha(A)=4. Three
component facts: (i) alpha(C_i)=1 means C_i is complete, and K4-freeness
bounds it by three vertices; (ii) consequently any component on at least
four vertices has alpha>=2; (iii) any component on at least nine vertices
has alpha>=3, because R(3,4)=9 forces a K4 or an I3 and C_i is K4-free.
The multisets of k>=2 positive integers summing to four are (1,3), (2,2),
(1,1,2), (1,1,1,1). In case (2,2) both components have no I3 and no K4,
so R(3,4)=9 bounds each by eight vertices and the total by 16<18. In cases
(1,1,2) and (1,1,1,1) the total is at most 3+3+8=14<18. Hence the profile
is (1,3): the alpha-1 component is a clique K_m with m<=3, and the single
remaining component C carries alpha(C)=3 on 18-m>=15 vertices and is
K4-free; alpha(C)=3 together with K4-freeness is exactly (4,4)-freeness.

<a id="claim-connectivity-02"></a>
## 2. Edge counts and the connectivity threshold

Claim ID: `n43/d18/neighborhood_connectivity.md#claim-connectivity-02`  
Kind: local-deduction  
Review state: accepted
Scope: as claim 1  
Dependencies: claim-connectivity-01; published (4,4) census intervals
50..55 at order 15, 60..60 at order 16, 68..68 at order 17  
Conclusion: if G[A] is disconnected then a in [53,58] with m=3, a=61 with
m=2, or a=68 with m=1; in particular a>=69, equivalently q<=16, forces
G[A] connected, including the entire x=136 frontier (a=85)  
Search use: propagate  
Reviews: [independent audit and Lean verification](../../reports/2026-10-17-d18-connectivity.md#independent-review)

Proof. Add the clique edges C(m,2) to the census interval of C:
3+[50,55]=[53,58], 1+60=61, 0+68=68. The largest value is 68, so a>=69
excludes every disconnected profile.

These slices record necessary structure only; they do not assert that any
disconnected neighborhood is realizable as N(v) in an order-43 candidate.

<a id="claim-connectivity-03"></a>
## 3. Recorded filters leave the families live; interface obligations

Claim ID: `n43/d18/neighborhood_connectivity.md#claim-connectivity-03`  
Kind: local-deduction  
Review state: ready  
Scope: as claim 1, together with the recorded row identity and universal
predicates cited below  
Dependencies: claim-connectivity-01; [reduction index](../reductions.md)
sections 5.2 and 4.5; row identity d_B(u)=17+epsilon_u-d_A(u)  
Conclusion:
(a) no recorded unconditional G[A] filter excludes the three families: the
deletion floor d_A>=a-79 is vacuous for a<=79 and every disconnected case
has a<=68; clique vertices have d_A=m-1<=2; C-vertices have degree at most
eight, since N_C(x) is triangle-free and I4-free and R(3,4)=9;
(b) for u in K_m: epsilon_u<=m-1 and d_B(u)=18-m+epsilon_u; at m=1 this
forces epsilon_u=0, d_G(u)=18, d_B(u)=17, and the section 5.2 boundary
trigger makes G[N_B(u)] a 17-vertex 8-regular (4,4) graph;
(c) K4 membership (section 4.5) is automatic for m=3 via {u}+(K_m-u)+{v};
for m=1 it forces a triangle in R_u, and for m=2 a triangle in R_u or an
edge inside R_u intersect R_w, where w is the other clique vertex; I4
membership is automatic, since u is anticomplete to C and alpha(C)=3;
(d) every I4 of A consists of exactly one K_m vertex together with an
independent triple of C, so a cross column missing some clique vertex must
meet every independent triple of C  
Search use: propagate  
Reviews: none

Proof. For u in K_m, d_A(u)=m-1 and N_G(u)={v} union (K_m-u) union R_u,
since u has no neighbor in C. The recorded row cap r_u<=17 gives
epsilon_u<=d_A(u)=m-1, and then
r_u=17+epsilon_u-(m-1)=18-m+epsilon_u; at m=1 this is r_u=17 with
epsilon_u=0. For x in C, a triangle in N_C(x) with x gives a K4, and N_C(x)
inherits I4-freeness, so R(3,4)=9 gives d_C(x)<=8. For (c), any K4
containing u is u plus a triangle in N_G(u); v has exactly A as neighbors,
so a triangle containing v needs two A-neighbors of u beyond v, available
only at m=3; all other triangles lie in R_u, or at m=2 consist of w and an
edge inside R_u intersect R_w. For (d), an independent set meets the
complete component in at most one vertex, alpha(C)=3 excludes an I4 inside
C, and every column meets every I4 of A by the recorded universal premise.

## Audit

Independence additivity over disjoint unions was checked on the component
partition; the clique bound alpha=1 with K4-freeness; the partition list is
complete (the four multisets are all partitions of 4 into at least two
positive parts); edge arithmetic C(m,2) with the census intervals quoted in
the recorded direction only. The interface items recombine recorded
identities (row cap, boundary trigger, section 4.5 membership, I4-column
premise) without new hypotheses. No realizability claim is made, and no
value of x is excluded by this note.

## Search integration

For G[A] generation: connected-only generation (geng -C) is sound whenever
a>=69, equivalently q<=16, including x=136. More generally, it is sound
outside [53,58] union {61,68}. This is not a necessary-and-sufficient threshold
for connectivity or for ambient realizability. In the three exceptional slices,
generate without -C or augment connected generation by the rigid families
K_m disjoint-union C of claim 1.
Those families are small: C ranges over (4,4)-free graphs on 15 vertices
with 50..55 edges, on 16 vertices with exactly 60 edges, and on 17 vertices
with exactly 68 edges. Whether any family member embeds as N(v) with a
valid interface is open; item (d) of claim 3 is the first column obligation
any such embedding must satisfy.
