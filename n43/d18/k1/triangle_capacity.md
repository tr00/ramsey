# Whole-branch seven-cell capacity obstructions

<!-- k1-whole-branch-integration:start -->
Integration status (2026-10-19): both claims are independently **accepted**
by [ExteriorCapacityAudit](review_triangle_capacity_20261019_exterior_audit.md)
at SHA-256 `35107639650ce2719ffa43d251dbf41d837f7f152ddc2a58fff608edd2ff53a8`.
The exterior dependency was accepted in the same review. The author-stage
body below is unchanged; ready labels are historical. Permitted use:
propagate p,q>=22+3h; terminate h=5,16,17,18 and all three-component T cases.
The residual h=6..15 and the full K1 branch remain open.
<!-- k1-whole-branch-integration:end -->

Date: 2026-10-19. Task: `k1-whole-branch-obstruction-20261019`.
Author: Main. All claims ready pending independent review.
No novelty claim, solver, graph search or catalogue scan.

## Setting

Use the accepted [double-core decomposition](research.json): G is K5/I5-free
on 43 vertices with adjacent roots u,v of degree 18 and no common neighbors,
two disjoint critical cores C,D of order17, and T of order7 anticomplete
to both roots. Both C+T and D+T are K5/I4-free. Put

    p=e(C,T), q=e(D,T), h=e(T), F=complement(G[T]).

The accepted [budget identities](cross_core.json) give

    p+q+2h<=168,  p+h>=76, q+h>=76.

For each core K and t in T, put U_t=K-N_K(t). Its size is at most eight,
and every pair U_t,U_s intersects in a clique of K, hence in at most three
vertices, including when t,s are adjacent. These follow from saturated
nonedge packing and the critical-core parameters. The new
[exterior theorem](../critical_core_exterior.md) says that for each c in K,
W_c=T-N_T(c) is triangle-free and I3-free, with |W_c|<=4.
The latter theorem is a ready dependency until independently audited.

<a id="claim-k1-dense-seven-cell"></a>
## 1. Dense seven-cells are impossible

Claim ID: `n43/d18/k1/triangle_capacity.md#claim-k1-dense-seven-cell`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the K1 setting, without an x restriction
Dependencies: exterior theorem; accepted degree and packing budgets
Conclusion: p,q>=22+3h and h<=15
Search use: none pending independent review
Reviews: none

Proof. For any c in C write m_c=|W_c|. Because W_c is triangle-free,
Turan's bound gives

    e(F[W_c])>=binom(m_c,2)-floor(m_c^2/4)>=m_c-2.

The second inequality holds for every nonnegative integer m_c; alternatively
it is immediate at the only possible sizes 0,1,2,3,4. Count incidences
between core vertices and F-edges with both endpoints missed:

    85-p=(119-p)-34=sum_(c in C)(m_c-2)
        <=sum_(c in C)e(F[W_c])
        =sum_(ts in E(F))|U_t intersect U_s|
        <=3e(F)=3(21-h).

Thus p>=22+3h; the same argument in D gives q>=22+3h. Consequently

    168>=p+q+2h>=44+8h,

so h<=floor(124/8)=15. This excludes all seven-cell graphs with 16,17 or
18 edges, not just the former Turan endpoint.

For exact stability define

    a_c=e(F[W_c])-m_c+2>=0,
    b_ts=3-|U_t intersect U_s|>=0  (ts in E(F)).

The preceding count gives the exact identity, in either core,

    sum_c a_c + sum_(ts in E(F)) b_ts = p-(22+3h),

using q instead of p on side D. In particular h=15 has p,q>=67 and
p+q<=138, so the combined defect sum across both cores is at most four.
This is not an exclusion of that remaining h=15 case.

<a id="claim-k1-component-capacity"></a>
## 2. The seven-cell has at most two components

Claim ID: `n43/d18/k1/triangle_capacity.md#claim-k1-component-capacity`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the K1 setting
Dependencies: accepted double cores and side I4-freeness; R(3,4)=9,
R(3,5)=14, and global degree ceiling24, as in the root Ramsey table
Conclusion: G[T] has at most two connected components and h>=6
Search use: none pending independent review
Reviews: none

Proof. Since T is I4-free, it has at most three components. If it has
three, each component is a clique: otherwise an independent pair in one
and a vertex in each other would give I4. These cliques have size at
most four by K5-freeness. The only partitions of seven into three positive
parts of size at most four are

    (3,2,2), (3,3,1), (4,2,1).

Every c in C union D must be complete to at least one component. Otherwise
choose a missed vertex in each component; those three vertices and c give
I4 in its prevalidated core+T side.

For T=K3+K2+K2, a vertex complete to the triangle lies in its common
G-neighborhood, an independent set of size at most four (an edge there
would give K5). A vertex complete to an edge lies in its common
G-neighborhood, which is triangle-free and I5-free, hence has at most
13 vertices by R(3,5)=14. All 34 core vertices must therefore be covered
by sets of sizes at most 4,13,13, totaling30<34. Impossible.

For T=K3+K3+K1, let t be its isolated vertex and put
Z=(C union D)-N_G(t). Since t has no root or T neighbors and degree at
most24, |Z|>=34-24=10. Every z in Z must be complete to one of the two
triangles; their common-neighbor sets each have size at most four. Thus
|Z|<=8, a contradiction.

For T=K4+K2+K1, write ab for the edge component and t for the isolated
vertex. The same set Z has size at least10. No z can be complete to the
K4 (that would give K5), so every z is complete to ab. Consequently
G[Z] is triangle-free, because a triangle with ab gives K5. It is also
I4-free, because an I4 with t gives I5. By R(3,4)=9, |Z|<=8, again a
contradiction. All three-component cases are excluded.

Finally h>=5 by Turan's theorem in the complement of the I4-free T.
Equality h=5 would force T=K3+K2+K2, already excluded. Therefore h>=6.
Combining Claims 1 and 2 gives the whole-branch interval 6<=h<=15.

## Scope and residual problem

These obstructions hold uniformly across all cross counts of the K1 branch;
no preferred root or low-excess assumption is used. The new restrictions
are necessary filters, not a full classification of T and not sufficient
conditions for either side's attachment or the C-D matrix. In particular,
T may still be disconnected with two components, and h=6..15 remains a
range of unresolved possibilities rather than a realizability assertion.
The whole K1 branch and order43 remain open.
