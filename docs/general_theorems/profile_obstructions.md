# Lifting structural obstructions through equal-profile replacements

<!-- attachment-calculus-integration:start -->
Integration status (2026-10-19): all three claims and the order-43 instance
are independently **accepted** by
[AttachmentInterfaceAudit](review_ramsey_attachment_calculus_20261019_interface_audit.md)
at SHA-256 `0b82764ec4d4341eddf02fd51f8bff01ecb403fd64850f69da7e9ec4fc715d8f`.
The reviewed body below is unchanged; ready/pending labels are historical.
Permitted mathematical use: an explicit equal-profile, equal-order replacement
can exclude a certified context under a valid universal structural premise.
Symmetry/module conclusions belong to the replacement graph, not necessarily
to the original. A representative always retains the equal-order requirement.
No forbidden context is proved unavoidable in every order-43 candidate.
<!-- attachment-calculus-integration:end -->

Date: 2026-10-19. Task: `ramsey-attachment-calculus-20261019`.
Author: Main. All three claims are ready for independent review, not accepted.
Research, not a new Ramsey bound or a claim of novelty.

The [boundary-profile calculus](../../research/foundations/boundary_profiles.md) can do more than
compute clique and independence numbers. If a state has an equal-order
representative with a forbidden structural feature, that representative
can obstruct **every** occurrence of the state in a permitted context,
even when the original block has no such feature.

This note combines exact replacement with the project's reviewed
[symmetry and module obstructions](../../research/n43/symmetry_structure.md).
It is a structural bridge, not another degree/cross-edge budget.

## Setting

Use the B-boundaried graphs, fixed p,q>=2, profiles Sigma_(p,q), and
well-typed contexts of
[boundary profiles Claim 04](../../research/foundations/boundary_profiles.md#claim-boundary-profiles-04).
Only complete/anticomplete joins between interiors, boundary forgetting,
uniform interior introduction and fixed boundary relabelling are allowed.
Interiors are copied apart before gluing. A boundary-fixing automorphism
fixes every boundary vertex pointwise. Its support is its moved-vertex set.

A module M means that every vertex outside M is adjacent to all of M
or none of M. A structural statement about a completed graph is not
silently applied to a partial induced graph.

<a id="claim-profile-obstruction-lifting"></a>
## Claim 1. Interior automorphisms and modules persist through contexts

Claim ID: `docs/general_theorems/profile_obstructions.md#claim-profile-obstruction-lifting`
Kind: local-deduction
Review state: ready
Scope: every boundaried graph H, permitted context C[-], boundary-fixing
automorphism pi of H, and module M of H contained in its interior
Dependencies: the explicit operator definitions in boundary_profiles.md
Conclusion: pi extends to C[H] with exactly the same support size;
M remains a module there, and is proper if its order is below |C[H]|
Search use: none pending independent review
Reviews: none

Proof. Induct along the hole-to-root path. At a binary join, extend pi
by the identity on the other interior. This is well-defined on the
shared boundary because pi fixes it. All cross edges are uniform, so
are preserved. At a uniform introduction, the new boundary vertex has
uniform adjacency to the old interior and fixed edges to the old
boundary, so fixing it extends pi. Forgetting changes no graph and
forgets only a vertex already fixed by pi. A fixed relabelling simply
transports the fixed boundary labels. No operation identifies moved
interior vertices or adds new moved vertices. This proves the exact
support assertion.

For M, an old outside vertex retains its all-or-none relation to M.
A newly introduced vertex has a uniform relation to the current
interior, which still contains M. Vertices added by a binary join also
have a uniform relation to M. Forgetting and relabelling change no
adjacency. Thus M remains a module; it is nonempty and proper in the
final graph whenever its size is between 1 and |C[H]|-1. The same
induction shows that original interior vertices never become boundary
vertices under the permitted operators. No arbitrary promotion or mixed
attachment is being used.

<a id="claim-profile-forbidden-representative"></a>
## Claim 2. A forbidden representative forbids a profile in that context

Claim ID: `docs/general_theorems/profile_obstructions.md#claim-profile-forbidden-representative`
Kind: local-deduction
Review state: ready
Scope: fixed p,q,n; a permitted context C[-]; B-boundaried H,H' with equal
profiles and equal orders, such that |C[H]|=n; any valid universal
structural premise for n-vertex R(p,q)-free graphs as specified below
Dependencies: boundary_profiles Claim 04; Claim 1
Conclusion: either obstruction below proves C[H] is not R(p,q)-free
Search use: none pending independent review
Reviews: none

Two reusable forms are:

1. Suppose every nonidentity automorphism of an n-vertex R(p,q)-free
   graph has support at least s. If H' has a nonidentity boundary-fixing
   automorphism of support r<s, the original C[H] is impossible.
2. Suppose every n-vertex R(p,q)-free graph has no proper module of
   order at least 2. If H' has an interior module M with 2<=|M|<n,
   the original C[H] is impossible.

Proof. If C[H] were R(p,q)-free, equal-order profile replacement would
make C[H'] an R(p,q)-free graph of the same order n. Claim 1 preserves
the displayed automorphism or module in that graph, contradicting the
respective universal structural premise. H itself need not have the
automorphism or module: only the replacement must have it.

The theorem is conditional on the universal premise; it supplies no new
one. It also requires an explicit equal-order representative and a
certified context expression. Mere agreement of numerical Ramsey types
or an assumed compact decomposition does not meet these hypotheses.

<a id="claim-profile-collision"></a>
## Claim 3. Equal-profile sibling blocks force a symmetric representative

Claim ID: `docs/general_theorems/profile_obstructions.md#claim-profile-collision`
Kind: local-deduction
Review state: ready
Scope: fixed p,q,n; H1,H2 with the same labelled boundary B, identical
profiles, and k>=1 interior vertices each; epsilon in {0,1}; a permitted
outer context C[-] with |C[H1 star_epsilon H2]|=n
Dependencies: boundary_profiles Claims 02 and 04; Claims 1 and 2
Conclusion: under a universal minimum nonidentity automorphism-support
premise s, an R(p,q)-free assembly requires 2k>=s; the pair-separation
consequences below also hold under their stated additional premise
Search use: none pending independent review
Reviews: none

Replace H2 by a fresh interior copy of H1, preserving its boundary labels.
The two inputs have equal orders and profiles. The resulting graph
C[H1 star_epsilon H1] has the same order and profile observations as the
original assembly. Swapping the two copies pointwise and fixing B is
an automorphism of H1 star_epsilon H1 with support exactly 2k: internal
edges match, corresponding boundary incidences match, and all cross
edges have the same epsilon. Claim 1 lifts it through C. Claim 2 proves
the support consequence.

There is a finer statement if every pair of distinct vertices in the
n-vertex R(p,q)-free class has at least D distinguishing vertices,
where the endpoints themselves are excluded. Put F=H1-B. For each
x in F and its two copies x1,x2 in the symmetric representative,

```text
epsilon=0: delta(x1,x2)=2*d_F(x),
epsilon=1: delta(x1,x2)=2*(k-1-d_F(x)).
```

Indeed every vertex outside the two copies is fixed by the lifted swap
and so sees x1,x2 identically. For an anticomplete join, the distinguishing
vertices are the two copies of the neighbors of x. For a complete join,
they are the two copies of its nonneighbors other than x. These lists
are disjoint and exhaustive. Therefore any legal original assembly
must satisfy

```text
epsilon=0: minimum degree of F >= ceil(D/2),
epsilon=1: minimum degree of complement(F) >= ceil(D/2).
```

These are restrictions on an actual chosen representative of a state,
not an instruction to assign a degree to a profile. Any representative
violating the necessary condition is a certificate against the original
assembly. H1 and H2 need not be boundary-isomorphic; equal profile
already suffices to create the symmetric replacement.

## Order-43 instance: no small profile collisions in such an expression

For n=43,p=q=5, the reviewed
[support theorem](../../research/n43/symmetry_structure.md#claim-symmetry-structure-02)
gives s=10 and the reviewed
[pair-separation theorem](../../research/n43/symmetry_structure.md#claim-symmetry-structure-01)
gives D=8. Thus sibling blocks as in Claim 3 cannot have k<=4.
In fact k=5 is impossible too: an anticomplete join would force F to
have minimum degree 4 on five vertices, hence F=K5; a complete join
would force complement(F)=K5. Either contradicts the necessary induced
R(5,5)-freeness of H1, which is a leaf in the original assembly.
Consequently such equal-profile sibling interiors have k>=6.

This is not a bound on arbitrary induced-subgraph orders or on every
possible decomposition. It forbids one precisely specified state
collision even when the original completed graph is asymmetric and its
two blocks are not isomorphic. The contradiction comes from a different,
information-equivalent completed representative, not from asserting that
a partial symmetry extends to the original graph.

The reviewed
[prime-graph theorem](../../research/n43/symmetry_structure.md#claim-symmetry-structure-03)
likewise supplies the premise of Claim 2's module form. All numerical
Ramsey premises of those source theorems are inherited, not recertified.
There is no new global bound or claim that a forbidden collision is
unavoidable in every order-43 candidate.

## Practical proof certificate and limits

A certificate using this operator consists of the actual context expression,
the original and representative boundary profiles and equal orders, plus
a boundary-fixing permutation with checked adjacency preservation, or
an interior module with checked all-or-none incidences. The universal
structural premise must be cited at its valid ambient type and order.
No orbit enumeration or canonical-label program is implicit.

Neither replacing a profile under arbitrary mixed attachments nor exposing
a module that meets the boundary is justified by these statements. A
module crossing a boundary can be broken by future context data. Without
an equal-order replacement the order-specific structural theorem is also
unavailable. No small representative, bounded interface, efficient
recognition procedure or covering family of expressions is promised.
