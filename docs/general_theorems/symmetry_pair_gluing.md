<!-- symmetry-audit-integration:start -->
Integration status (2026-10-15):

All three revised claims below received independent exact-revision acceptance
in the [renewed gluing review](review_symmetry_pair_gluing_20261015_gluing_auditor_revised.md).
The reviewed body SHA-256 is
`4ece07911564de0370a787129e46fa359b4157ec6e5bbe41450990dec1c771f4`.
The [original review](review_symmetry_pair_gluing_20261015_gluing_auditor.md)
preserves its changes-requested outcome. The revision requires compatible
fixed overlap colors and distinguishes coupled fixed signatures from D-only
colors. The entire renewed body is preserved below; ready labels are historical.
Current state: accepted local deductions for compatible double-coset and full
completion symmetry, conditional on complete inputs and certified orbit coverage.
The stated direct product excludes additional nonlocal fixed relations, whose
actual enriched-state stabilizer requires separate derivation. No implementation,
unrooted uniqueness, novelty or Ramsey branch closure is certified.

See the [audit report](../../research/reports/2026-10-15-symmetry-audit.md) and its exact-hash manifest.
<!-- symmetry-audit-integration:end -->

# Exact automorphism quotients for two-root neighborhood gluing

Date: 2026-10-15. Task: `symmetry-hour-20261015`. Author: Codex.
Three mathematical claims are ready for independent review. These are author
proofs and self-checks, not independent acceptance or a certified generator.
No enumeration, external canonicalizer, solver, or download was used.
Double cosets and stabilizers are standard group theory; no novelty is claimed.

## Setting

Consider a graph with an ordered adjacent pair of roots u,v. Take two fixed
pointed graphs (H_u,v_*) and (H_v,u_*), intended to be its induced neighborhoods
N(u),N(v), with v_*,u_* representing the other root. Put

    S_u=N_(H_u)(v_*), X=V(H_u)-({v_*} union S_u),
    S_v=N_(H_v)(u_*), Y=V(H_v)-({u_*} union S_v).

The pointed graphs may carry fixed vertex colors from the same alphabet.
Every isomorphism and automorphism in this note preserves those colors;
the uncolored case uses one common color. The colors assigned to the two
roots, including their appearances as the opposite distinguished vertices,
must agree. The sets S_u,S_v represent the common neighborhood. Their induced
colored graphs must be isomorphic. Let I be the set of color-preserving graph
isomorphisms H_u[S_u] -> H_v[S_v]. If I is empty there is no compatible gluing.
Otherwise choose a fixed phi_0 in I and identify both colored overlap graphs
with an abstract colored graph S. In particular, a map identifying different
fixed colors is excluded from I, not merely from a side automorphism group.

Let A=Aut(H_u)_(v_*), B=Aut(H_v)_(u_*). They preserve S_u,S_v and their
complements X,Y. Write rho_u,rho_v for restrictions to the overlap and
J_u,J_v for their images, transported to subgroups of Aut(S) using phi_0.
Aut(S) also preserves the fixed overlap colors. Arbitrary extra branch data
are not silently part of this exact classification. Conditions on completions
must be invariant under the displayed groups. If additional fixed relations
are imposed, include them in the skeleton and take its actual stabilizer;
the full-group and exact-classification claims below then require a separate
derivation for that enriched skeleton.

For phi in I, identify s in S_u with phi(s) in S_v. The resulting skeleton
has vertices {u,v} union S union X union Y. Its known incidences are

    uv is an edge;
    u is complete to S union X and anticomplete to Y;
    v is complete to S union Y and anticomplete to X;
    all incidences inside S union X and S union Y are fixed by H_u,H_v.

For a target order n, add a set D of

    t=n-2-|S|-|X|-|Y|

vertices, each nonadjacent to both roots. If t<0 this gluing is impossible.
The remaining free edges are X-Y and all edges within D or from D to
S union X union Y. Every feasibility condition used for symmetry must be
invariant under the group actually being used.

<a id="claim-pair-gluing-01"></a>
## 1. Overlap maps are classified exactly by double cosets

Claim ID: `docs/general_theorems/symmetry_pair_gluing.md#claim-pair-gluing-01`

Kind: local-deduction

Review state: accepted

Scope: every two pointed graphs in the setting; ordered roots; exact overlap maps.

Dependencies: graph isomorphism composition and pointed automorphisms.

Conclusion: the isomorphism classes of skeletons with this ordered pointed
neighborhood pair correspond exactly to the A x B orbits on I, acting by

    (a,b).phi=rho_v(b) phi rho_u(a)^(-1).

Equivalently, after fixing phi_0, the map classes are the double cosets

    J_v \ Aut(S) / J_u.

Only one map from each double coset is needed for complete ordered-root
coverage. Its exact number depends on these induced groups, rather than
on |S|! or on the full automorphism orders of the two neighborhoods.

Proof: Relabeling the left pointed neighborhood by a and the right one by b
changes the identification equation phi(s)=s' to
rho_v(b)phi rho_u(a)^(-1)(a(s))=b(s'). This produces an isomorphic skeleton
with both roots fixed. Conversely an ordered-root isomorphism preserves
N(u) and N(v), including their distinguished other roots. Its restrictions
therefore belong to A and B, and their restrictions to the common
neighborhood satisfy precisely this identification equation. These are
both directions of orbit equivalence, with all restrictions preserving colors.
I is a torsor for the color-preserving Aut(S): write
phi=phi_0 h, h in Aut(S_u), and transport J_v through phi_0. The displayed
action on h becomes j_v h j_u^(-1), whose orbits are the stated double
cosets. Duplicate choices of a or b with identical overlap restriction
do not change the map orbit.

Search use: symmetry after independent review and a certified double-coset
enumeration; witness is a pair of explicitly checked pointed automorphisms.

Reviews: [review](review_symmetry_pair_gluing_20261015_gluing_auditor_revised.md).

<a id="claim-pair-gluing-02"></a>
## 2. The residual completion group is a fiber product

Claim ID: `docs/general_theorems/symmetry_pair_gluing.md#claim-pair-gluing-02`

Kind: local-deduction

Review state: accepted

Scope: a chosen phi and t>=0 in the setting, with initially interchangeable
D vertices and no additional noninvariant fixed data.

Dependencies: Claim01; restriction homomorphisms and kernel-image counting.

Conclusion: the full ordered-root group preserving the fixed skeleton and
root incidences is

    Gamma_phi=F_phi x S_t,
    F_phi={(a,b) in A x B:rho_v(b) phi=phi rho_u(a)}.

The action on S is the common restriction, on X,Y the corresponding side
actions, and on D an arbitrary permutation. Its order is

    |Gamma_phi|=t! |ker(rho_u)| |ker(rho_v)|
      * |J_v intersect phi J_u phi^(-1)|,

where groups are compared on S_v. The action on the whole skeleton is
faithful even when either restriction to S is not faithful. A least full
remaining-edge vector under Gamma_phi represents exactly one ordered-root
completion isomorphism class for this fixed skeleton.

Proof: Two side automorphisms define a common permutation of the glued union
exactly when their overlap restrictions agree under phi. This is the fiber
product equation. Every ordered-root skeleton automorphism must preserve
the four root-incidence cells S,X,Y,D, so restricts to such a pair and an
independent D permutation. Conversely these choices preserve all known
incidences and act on every remaining edge, giving the stated full group.
For each common overlap image in the displayed intersection there are exactly
|ker rho_u| left lifts and |ker rho_v| right lifts. This proves the order.
A pair acting trivially on the glued union acts trivially on each complete
pointed neighborhood, so is the identity; D contributes its faithful
permutation action as well. Finally a graph isomorphism fixing the ordered
roots restricts to this skeleton group, and every element of this group
maps the completion to an isomorphic one. Lexicographic orbit minimization
therefore classifies the completions exactly.

For fixed D-only vertex colors, replace S_t by their color stabilizer.
Fixed signatures from D into the side vertices can couple the D and side
permutations; use the actual enriched-skeleton stabilizer, not an independent
D-only replacement. Additional fixed edges or other relations likewise need
the stabilizer of the complete fixed state, or must transform with that state.
The displayed direct-product formula is asserted only in its stated scope.

Search use: symmetry after independent review and certified residual orbit
handling. Kernel factors must be retained: using only overlap image groups
can miss permutations of side vertices fixing S pointwise.

Reviews: [review](review_symmetry_pair_gluing_20261015_gluing_auditor_revised.md).

<a id="claim-pair-gluing-03"></a>
## 3. The staged quotient preserves every admissible pair completion

Claim ID: `docs/general_theorems/symmetry_pair_gluing.md#claim-pair-gluing-03`

Kind: local-deduction

Review state: accepted

Scope: a nonempty isomorphism-equivariant family of admissible ordered adjacent
pairs in each target graph, with all allowed pointed neighborhoods, overlap
sizes, and invariant completion constraints covered.

Dependencies: Claims01 and02; complete input coverage and finite orbit minima.

Conclusion: the following stages retain a representative of every target
graph having an admissible pair:

1. Retain one pointed-neighborhood pair representative; distinguished vertices
   within a fixed neighborhood may be selected modulo its full automorphism
   group, with all orbit types covered.
2. For each pair, retain one map per double coset in Claim01.
3. For each map, retain one full completion per Gamma_phi orbit from Claim02.

These stages classify ordered-root objects exactly if the reductions and
input enumeration are complete. To retain exactly one unrooted graph requires
an additional canonical choice among its admissible pairs. Ordered-root
coverage itself suffices for a nonexistence exhaustion, though it can repeat
the same unrooted graph many times.

Proof: Choose any admissible pair in any target G. Relabel each of its
pointed neighborhoods to retained representatives. Its actual common-neighbor
identification lies in I, so a pair of side automorphisms moves it to the
retained double-coset representative. Transform every free edge at the same
time. Claim02 then moves the remaining full edge vector to its retained
orbit representative without changing either pointed neighborhood or phi.
All these operations are graph isomorphisms, hence preserve the invariant
target conditions. Conversely Claims01 and02 show that equality of the
resulting complete data codes is equivalent to ordered-root isomorphism.
No additional pair-selection restriction is introduced by these stages.

Search use: symmetry after independent review and certified coverage of all
inputs, maps and completions. It is unsafe to minimize the two side maps
independently after fixing their common identification, or to keep one
arbitrary pointed vertex from several automorphism orbits.

Reviews: [review](review_symmetry_pair_gluing_20261015_gluing_auditor_revised.md).

## Order-43 applications and exact limits

For adjacent roots of equal degree d and overlap lambda,

    |X|=|Y|=d-1-lambda,
    |D|=43-2d+lambda.

The common-neighbor graph S is K3/I5-free; this follows from the actual edge
uv and must not be replaced by the (4,5) neighborhood type.

| Covered pair family | d | retained overlap range | size of D |
| --- | --- | --- | --- |
| [Prescribed degree18 family of at least13 roots](../../research/n43/d18/dense_pivot_coverage.md#claim-dense-pivot-01) | 18 | 0..10, further restricted by exact local bounds | 7+lambda |
| [Normalized branch with n20>=13](../../research/n43/min-degree20/pair_coverage.md) | 20 | 2..11 | 3+lambda |
| [Normalized branch with n20<=12](../../research/n43/min-degree20/pair_coverage.md) | 21 | 3..12 | 1+lambda |

The lower bounds2 and3 use the existing edge codegree floor d-18. The
degree18 family premise is conditional and is not proved for every order43
candidate here. The two normalized rows cover that branch by the independently
accepted pair-coverage theorem; they do not cover the lower-minimum branches.
Large D cells remain, so this quotient alone does not promise tractability.

A directly checkable omission witness is (a,b), with both pointed
automorphism checks and phi'=rho_v(b)phi rho_u(a)^(-1). Full double-coset
coverage additionally needs a partition or a descent argument into retained
maps; one witness per discarded map without a termination argument is
insufficient. Completion omissions similarly require checked permutations
and a least-vector or complete orbit argument. No such generator or log is
implemented here. Endpoint reversal and complementation require their own
coverage-compatible selectors; neither is silently included in Gamma_phi.

Author self-check: the converse map-isomorphism argument restricts an
ordered-root isomorphism to both full pointed neighborhoods; the residual
group preserves each root-incidence cell; image intersections count lifts
with both kernels, and the D-size formula is inclusion-exclusion. Fixed
branch data must be invariant or included as colors. No novelty literature
review, graph computation, timing claim, branch closure, or bound on R(5,5)
follows from this note.

Base revision: `7ebbef265ef9b55746b798b337b86e4fd6140045`. Input SHA-256:

| Input | SHA-256 |
| --- | --- |
| research/n43/min-degree20/pair_coverage.md | `dcc49b82fd216c9db70de88d0d8f0dc33e25a82c0eb75e671d47542d4c30cbde` |
| research/n43/d18/dense_pivot_coverage.md | `e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a` |
| docs/mathematical_baseline.md | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
