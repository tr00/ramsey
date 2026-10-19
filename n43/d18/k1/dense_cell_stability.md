# Local degree stability of dense seven-cells

<!-- k1-whole-branch-integration:start -->
Integration status (2026-10-19): all three claims are independently **accepted**
by [Main's review](review_dense_cell_stability_20261019_main.md), distinct
from author CoreSignatureTheory, at SHA-256
`d077f32c6a49b68105eedefb3abe93b3d74236ec97f58e154f1195ed59064383`.
The exterior/density premises of that conditional audit are independently
accepted by [ExteriorCapacityAudit](review_triangle_capacity_20261019_exterior_audit.md).
The author-stage body below is unchanged; ready labels are historical.
Permitted use: local degree propagation and the exhaustive six-shape h=15
residual partition. No one of those shapes or the whole K1 branch is closed.
<!-- k1-whole-branch-integration:end -->

Date: 2026-10-19. Author: CoreSignatureTheory.
All claims are ready for independent review, not accepted.
No novelty, uniqueness, catalogue-completeness, or full-exclusion claim.

## Setting and dependencies

Use the accepted k1 partition in
[`research.json`](research.json), claim `claim-k1-double-core`:
G is K5/I5-free of order 43, with adjacent roots u,v, critical
17-vertex cores C,D, and a seven-vertex set T anticomplete to both
roots. The sides C+T and D+T are K5/I4-free. Write

    p=e(C,T), q=e(D,T), h=e(T), F=complement(G[T]).

For either core K, define two different kinds of missed sets:

    U_i=K-N_K(t_i),       w_i=|U_i|       (t_i in T),
    R_x=T-N_T(x),         m_x=|R_x|       (x in K).

Thus t_i belongs to R_x if and only if x belongs to U_i.
The accepted saturated packing in
[`cross_core.json`](cross_core.json), claim
`strict-seven-signature-budget`, gives w_i<=8 and
|U_i intersect U_j|<=3 for every distinct i,j. This does not depend
on whether t_i,t_j are adjacent.

The new ready, not yet accepted, dependency
[`critical_core_exterior.md#claim-critical-exterior-four`](../critical_core_exterior.md#claim-critical-exterior-four)
says that G[T][R_x] is triangle-free and I3-free and m_x<=4.
Consequently F[R_x] is also triangle-free and I3-free. Its only
four-vertex types are 2K2, P4, C4; its only three-vertex types are
K2+K1 and P3.

The ready, not yet accepted, density and slack theorem
[`triangle_capacity.md#claim-k1-dense-seven-cell`](triangle_capacity.md#claim-k1-dense-seven-cell)
supplies

    p,q>=22+3h,       h<=15.

The accepted global degree bound d_G(z)<=24 gives
p+q+2h<=168. All these dependencies are universal statements about
the actual cores and attachments; no particular 17-core is selected.
The proofs below state their use explicitly, so their conclusions
remain conditional on the ready exterior and density dependencies
until those dependencies are independently accepted.

<a id="claim-local-dense-slack"></a>
## 1. Localizing the density slack at a specified seven-cell vertex

Claim ID: `n43/d18/k1/dense_cell_stability.md#claim-local-dense-slack`  
Kind: local-deduction  
Review state: ready  
Scope: either core K in the stated k1 setting; every t_i in T  
Dependencies: accepted saturated packing; the ready exterior row theorem
and density-slack theorem linked above  
Conclusion: with a=e(K,T) and B_K=a-22-3h, the nonnegative slacks below
satisfy w_i>=3d_F(t_i)-B_K  
Search use: none pending independent review  
Reviews: none

**Proof.** For a core vertex x and an F-edge t_it_j, put

    alpha_x=e(F[R_x])-m_x+2,
    beta_ij=3-|U_i intersect U_j|.

Both are nonnegative integers. The latter follows from packing. For
the former, triangle-freeness of G[T][R_x] gives

    e(F[R_x])>=binom(m_x,2)-floor(m_x^2/4)>=m_x-2.

Since 0<=m_x<=4, this can also be checked from the following complete
list. The column of degrees describes degrees in F[R_x].

| m_x | F[R_x] | alpha_x | Degrees in F[R_x] |
| --- | --- | --- | --- |
| 0 | empty graph | 2 | none |
| 1 | single vertex | 1 | 0 |
| 2 | empty graph | 0 | 0,0 |
| 2 | K2 | 1 | 1,1 |
| 3 | K2+K1 | 0 | 1,1,0 |
| 3 | P3 | 1 | 2,1,1 |
| 4 | 2K2 | 0 | 1,1,1,1 |
| 4 | P4 | 1 | 2,2,1,1 |
| 4 | C4 | 2 | 2,2,2,2 |

In particular, for every t_i in R_x,

    d_(F[R_x])(t_i)<=1+alpha_x.                       (1)

This is a pointwise assertion, not an assumption that distinct
vertices or degrees spend independent copies of alpha_x.

Double counting missed F-edge incidences gives the exact global
slack identity

    B_K=a-22-3h
       =sum_(x in K) alpha_x + sum_(t_it_j in E(F)) beta_ij.  (2)

For completeness, sum_x m_x=119-a and e(F)=21-h. Therefore

    sum_x alpha_x
       =sum_(t_it_j in E(F)) |U_i intersect U_j|-(119-a)+34,

and adding all beta_ij gives
3(21-h)-(119-a)+34=a-22-3h, proving (2).

Now fix t_i. Count F-neighbors of t_i missed simultaneously by a
core vertex x in U_i. By (1),

    3d_F(t_i)-sum_(j:t_it_j in E(F)) beta_ij
       =sum_(j:t_it_j in E(F)) |U_i intersect U_j|
       =sum_(x in U_i) d_(F[R_x])(t_i)
       <=w_i+sum_(x in U_i) alpha_x.

Every term in (2) is nonnegative. Thus the two partial defect sums
on the right after rearrangement have total at most B_K, giving

    w_i>=3d_F(t_i)-B_K.                              (3)

The estimate may be vacuous when its right side is negative, but
it remains valid for every t_i and every cross count. ∎

<a id="claim-seven-cell-local-degree"></a>
## 2. A local complement-degree bound valid throughout k1

Claim ID: `n43/d18/k1/dense_cell_stability.md#claim-seven-cell-local-degree`  
Kind: local-deduction  
Review state: ready  
Scope: every k1 candidate under the stated dependencies; every t_i in T;
no restriction on its C-D cross count  
Dependencies: Claim 1; degree upper bound 24; accepted double-core
partition and T-degree identity  
Conclusion: 7d_F(t_i)+8h<=140, and consequently the endpoint restrictions
below  
Search use: none pending independent review  
Reviews: none

**Proof.** Put

    B_C=p-22-3h,       B_D=q-22-3h,       B=B_C+B_D.

These are nonnegative by (2). Write w_i^C,w_i^D for the two missed
signature sizes, and d_i=d_F(t_i). Applying (3) on both sides yields

    w_i^C+w_i^D>=6d_i-B.                             (4)

Since d_T(t_i)=6-d_i and neither root is adjacent to t_i, its full
degree is exactly

    d_G(t_i)=(17-w_i^C)+(17-w_i^D)+(6-d_i)
             =40-d_i-w_i^C-w_i^D
             <=40-7d_i+B.

Define its nonnegative degree deficit delta_i=24-d_G(t_i). It follows
that

    delta_i>=7d_i-16-B.                              (5)

On the other hand, the total degree deficit in T is

    Delta=sum_i delta_i
         =168-(p+q+2h)
         =168-(44+6h+B+2h)
         =124-8h-B.                                  (6)

Because each other deficit is nonnegative, delta_i<=Delta. Combining
(5) and (6), the same B cancels:

    7d_i-16-B<=124-8h-B,
    7d_F(t_i)+8h<=140.                               (7)

No division by a slack, assumption of equality, or choice of a
low-defect core is involved.

Consequently:

* If h=15 then d_F(t_i)<=floor(20/7)=2 for all i, so delta(T)>=4.
* If h=14 then d_F(t_i)<=floor(28/7)=4, so delta(T)>=2.
* If h=13 then d_F(t_i)<=floor(36/7)=5, so T has no isolated vertex.
* An isolated vertex of T has d_F(t_i)=6, and therefore requires h<=12.

These are necessary restrictions, not existence assertions for the
remaining degree patterns. ∎

<a id="claim-fifteen-edge-complement-shapes"></a>
## 3. The fifteen-edge endpoint has only six complement shapes

Claim ID: `n43/d18/k1/dense_cell_stability.md#claim-fifteen-edge-complement-shapes`  
Kind: local-deduction  
Review state: ready  
Scope: every k1 candidate with h=15 under the stated dependencies  
Dependencies: Claim 2; elementary classification of graphs of maximum
degree at most two  
Conclusion: F is one of the six disjoint-union shapes listed below  
Search use: none (analytic residual partition, not branch termination)  
Reviews: none

**Proof.** Here |V(F)|=7 and e(F)=21-15=6. By Claim 2 its maximum
degree is at most two. Thus every connected component is either a
path (including an isolated vertex P1) or a cycle of length at least
three. A path component contributes one to |V|-e, and a cycle
component contributes zero. Since |V(F)|-e(F)=1, there is exactly
one path component.

If there is no cycle, that path is P7. If there is exactly one
cycle C_j, then 3<=j<=6 and the path is P_(7-j). If there are two
cycles, they each have at least three vertices; the remaining path
has at least one vertex, so equality in 3+3+1<=7 is forced. There
cannot be three cycles. Therefore the complete list is

    P7,
    C3 + P4,
    C4 + P3,
    C5 + P2,
    C6 + P1,
    C3 + C3 + P1.                                    (8)

Here + denotes disjoint union and the subscripts give vertex
counts. This is a proof of exhaustiveness from the degree bound,
not a scan of seven-vertex graphs. Labels are not quotiented in any
computational implementation. ∎

## Residual status and provenance

No one of the six h=15 shapes in (8) is asserted realizable or
excluded here. Their actual core signatures, remaining degree-defect
allocations, and C-D compatibility remain unresolved. In particular
this note does not close k1. Its uniform contribution is (7), which
removes seven-cell patterns beyond merely imposing h<=15, and the
complete analytic six-shape residual at h=15.

The earlier independent one-core bounds and near-equality SRG
stability remain in [`signature_geometry.md`](signature_geometry.md).
This note does not edit or replace those claims. The row and aggregate
premises used here are ready dependencies, so independent acceptance
of this note requires checking their applicability as well as the
algebra above.

No graph or subset search, solver, catalogue scan, download, package
installation, test, build, linter, formatter, or Lean change was used.
No novelty claim is made. All computations in the proof are displayed
scalar identities and fixed row-template degree checks.
