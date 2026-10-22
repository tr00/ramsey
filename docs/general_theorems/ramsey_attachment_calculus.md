# A calculus of induced Ramsey blocks and attachments

<!-- attachment-calculus-integration:start -->
Integration status (2026-10-19): all four claims are independently **accepted**
by [AttachmentInterfaceAudit](review_ramsey_attachment_calculus_20261019_interface_audit.md)
at SHA-256 `bf9a6d10942e34c6ad1b97ea379e61ef04d3b87115cec5aeb39fb53630be079b`.
The reviewed body below is unchanged; ready/pending labels are historical.
Permitted mathematical use: exact cell typing and mixed-interface composition
on the stated data, retaining all required homogeneous-set arities.
Root refinement concerns vertices remaining outside the enlarged root set.
[Structural obstruction lifting](profile_obstructions.md) adds the reviewed
equal-order replacement bridge to automorphism/module obstructions.
No small-width decomposition, branch closure or implementation is certified.
<!-- attachment-calculus-integration:end -->

Date: 2026-10-19. Task: `ramsey-attachment-calculus-20261019`.
Author: Main. New claims are ready for independent review, not accepted.
Task kind: Research. No new Ramsey bound, branch exclusion or novelty claim.

The objects below are induced graphs **with interfaces**, not just graphs
labelled by a Ramsey type. There are two complementary calculi:

- This note retains exact mixed attachments and their higher-order
  homogeneous obstructions. It does not promise small interfaces.
- [Boundary profiles](boundary_profiles.md) compress blocks when the
  permitted future joins are uniform across their interiors.
- [Critical-face transport](critical_face_transport.md) extracts resource,
  equality and labelling certificates from the exact constraints.

The starting mechanisms already exist in the project: the
[exact signature criterion](signature_anchors.md#claim-signature-anchors-01),
[transversal deletion](transversal_deletion.md#claim-transversal-deletion-01),
[pointed overlap gluing](symmetry_pair_gluing.md#claim-pair-gluing-01), and
[saturated core-pair packing](../../research/n43/d18/critical_core_exterior.md).
The purpose here is to put their interfaces and composition rules in one
language, and prove which information can safely be discarded.

## 1. Objects and conventions

All graphs are finite, simple and labelled when an attachment is specified.
Write R(p,q)-free for no K_p and no independent q-set, where p,q>=2.
When a residual parameter is 1 its forbidden singleton forces that graph
to be empty. For S subset V(H), put

\[
 c_H(S)=\omega(H[S]),\qquad a_H(S)=\alpha(H[S]),
 \qquad c_H(\varnothing)=a_H(\varnothing)=0.
\]

These are ranks of actual induced subsets, not clique/independent-set
counts. Empty intersections below mean the whole current core; empty
unions mean the empty set.

A **port** of a vertex x outside H is its actual neighborhood
S_x=N(x) intersect V(H). Given a disjoint graph X and one port S_x for
each x in X, write H bowtie_S X for the graph retaining both internal
graphs and adding exactly the cross incidences h~x iff h belongs to S_x.
Repeated ports are allowed. This operation specifies all cross edges;
a bare pair of Ramsey types does not.

## 2. Root refinement gives exact one-cell types

<a id="claim-attachment-cell-type"></a>
### Claim 1. Root-signature cells and the one-cell attachment operator

Claim ID: `docs/general_theorems/ramsey_attachment_calculus.md#claim-attachment-cell-type`
Kind: local-deduction
Review state: ready
Scope: every R(p,q)-free graph G and induced root graph D=G[R];
every signature S subset R
Dependencies: definitions only
Conclusion: the exact unary residual type below; conversely it suffices
when only that one cell is attached to D
Search use: none pending independent review
Reviews: none

Let V_S be the vertices outside R adjacent to exactly S among the roots.
Then

\[
 G[V_S]\text{ is }R\bigl(p-c_D(S),\ q-a_D(R\setminus S)\bigr)\text{-free}.
 \tag{1}
\]

Conversely, if D itself is R(p,q)-free and a disjoint graph K has the
residual type in (1), attaching every K vertex to exactly S among D
produces an R(p,q)-free graph. This converse concerns **one** cell;
multiple cells also have cross-cell obligations.

Proof. A clique in D[S] is completely joined to V_S. Combining a maximum
such clique with p-c_D(S) vertices of a clique in V_S would give K_p.
The independent argument uses a maximum independent set of D[R-S].
Both residual parameters are positive because D is R(p,q)-free. For the
converse, any clique meeting both parts has at most c_D(S) vertices in
D and at most p-c_D(S)-1 in K, and hence at most p-1 in total. The
independent calculation is identical with R-S and q. Sets contained in
D are excluded by its own type. If a residual parameter is 1 then K is
empty and the converse still holds.

Refining by a larger labelled root set simply partitions these cells
more finely. Formula (1) is recomputed from the actual enlarged root
graph; it does not decrement p or q once for every root condition.
For example, three mutually adjacent missed roots reduce q by only 1,
not by 3. Their independence number is 1.

## 3. A mixed interface is a coloured hypergraph, not a compatibility graph

For a fixed R(p,q)-free core H, the port alphabet is 2^{V(H)}. Define
for 1<=t<=p-1 and 1<=u<=q-1 respectively

\[
\begin{split}
 \mathcal F^+_t(H)&=\{(S_1,\ldots,S_t):
       c_H(\cap_{i=1}^t S_i)\ge p-t\},\\
 \mathcal F^-_u(H)&=\{(S_1,\ldots,S_u):
       a_H(V(H)\setminus\cup_{i=1}^u S_i)\ge q-u\}.
\end{split}
\tag{2}
\]

Tuples may repeat a port, but their realized outside vertices must be
distinct. These families are symmetric under permuting tuple positions.
A positive-colour tuple forbids its outside vertices from forming a
clique; a negative-colour tuple forbids them from being independent.
The template includes the unary restrictions, not just pair relations.

<a id="claim-attachment-exact-template"></a>
### Claim 2. Exact elimination of a core into its attachment template

Claim ID: `docs/general_theorems/ramsey_attachment_calculus.md#claim-attachment-exact-template`
Kind: local-deduction
Review state: ready
Scope: every fixed R(p,q)-free H, disjoint graph X and specified ports S_x
Dependencies: definitions; recasts the existing signature criterion without a pivot
Conclusion: exact mixed attachment iff criterion below
Search use: none pending independent review
Reviews: none

The graph H bowtie_S X is R(p,q)-free if and only if

1. X is R(p,q)-free;
2. no clique Q in X of size t in 1..p-1 realizes a tuple in F^+_t(H);
3. no independent Q in X of size u in 1..q-1 realizes a tuple in F^-_u(H).

Proof. A forbidden set contained in one part is excluded by its internal
type. A mixed p-clique has a nonempty X part Q of size t<=p-1. Its H
part is a (p-t)-clique in the common port intersection. Conversely such
a clique and Q form a forbidden p-clique. A mixed independent q-set
has its H part outside the union of the Q ports, and the same argument
applies. These cases exhaust every forbidden set, including the
endpoint t=p-1 or u=q-1, where the residual set must be empty.

This is not advertised as a new signature theorem: it extends the
[existing exact criterion](signature_anchors.md#claim-signature-anchors-01)
from a pivot partition to an arbitrary core, and identifies the data
that an exact mixed attachment operator must retain.

<a id="claim-attachment-arity"></a>
### Claim 3. Higher-order interactions cannot universally be dropped

Claim ID: `docs/general_theorems/ramsey_attachment_calculus.md#claim-attachment-arity`
Kind: local-deduction
Review state: ready
Scope: p>=3,q>=2 for the clique example; its complement for the dual
Dependencies: definitions and Claim 2's tests
Conclusion: truncating clique tests below arity p-1 is unsound in general;
independent tests below q-1 are unsound by complementation
Search use: none pending independent review
Reviews: none

Take H=K1, X=K_(p-1), and every port equal to V(H). Both internal
graphs are R(p,q)-free. Every clique test of arity at most p-2 passes:
its required residual clique has at least two vertices, but H has one.
There is no failed independent test, since every nonempty port union
covers H. Yet the assembled graph is K_p. The first failed test is
arity p-1. Complementing gives the independent-set example.

At p=q=5 this is a one-vertex core with four mutually adjacent ports:
all unary, binary and ternary mixed checks pass; the fourth-order
check detects K5. Equivalently, three fully joined blocks K2,K2,K1
have legal pairwise unions but an illegal total union.

This does not forbid encoding higher-order constraints using auxiliary
states or a larger boundary. It rules out deleting them while retaining
only the raw pairwise port-compatibility relation.

## 4. Exact interface convolution and order-independent assembly

A block can be absorbed into its core before subsequent attachments,
but only if the enlarged interface is recomputed rather than reusing
the old unary type.

<a id="claim-attachment-convolution"></a>
### Claim 4. Homogeneous ranks compose across an arbitrary mixed join

Claim ID: `docs/general_theorems/ramsey_attachment_calculus.md#claim-attachment-convolution`
Kind: local-deduction
Review state: ready
Scope: every two disjoint finite graphs H,X, every cross-port family S_x,
and arbitrary P subset V(H), Q subset V(X); no Ramsey premise needed
Dependencies: definitions only; Claim 2 for its attachment-template consequence
Conclusion: exact convolution (3), hence exact order-independent template transport
Search use: none pending independent review
Reviews: none

Put L=H bowtie_S X. Then

\[
\begin{split}
 c_L(P\cup Q)
  &=\max_{\substack{J\subseteq Q\\J\text{ clique in }X}}
       \left[|J|+c_H\left(P\cap\bigcap_{x\in J}S_x\right)\right],\\
 a_L(P\cup Q)
  &=\max_{\substack{J\subseteq Q\\J\text{ independent in }X}}
       \left[|J|+a_H\left(P\setminus\bigcup_{x\in J}S_x\right)\right].
\end{split}
\tag{3}
\]

The empty J is included. The maxima are over actual homogeneous sets,
not all vertex subsets with the same size.

Proof. For a clique K in L[P union Q], its X part J is a clique in
X[Q], and its H part lies in P intersect the common port intersection.
This gives the upper bound by the first maximum. For each such J,
a maximum H clique in that intersection forms a clique together with
J, giving the reverse bound. Replace clique by independent and common
neighbors by common nonneighbors for the second equality.

For a future t-tuple of ports into L, write its i-th port as P_i union
Q_i in the two parts. Compute its positive obstruction using (3) with
P=intersection_i P_i and Q=intersection_i Q_i. For its negative
obstruction use P=V(H)-union_i P_i and Q=V(X)-union_i Q_i in the
second equality. Thus (3) transports **every** family in (2), including
higher arities and repeated port types.

For three or more blocks with fixed internal graphs and all fixed cross
matrices, any parenthesized iteration gives the same ranks and the same
final attachment template. To see this without assuming a gluing rule,
expand each maximum into the chosen homogeneous subset of each block.
For the clique rank the subsets must be pairwise completely joined;
for the independent rank they must be pairwise anticomplete. Their
objective is the sum of their sizes. The same finite feasible family
and objective occur in every order, so the maxima coincide.

This is a compositional invariant, not an assertion that pairwise legal
intermediate graphs suffice: a final join is tested against its newly
transported template. Keeping all induced-subset ranks can be exponential
in core size and even determines the core's edges on two-element subsets.
No compression or fast algorithm is inferred for arbitrary mixed joins.

## 5. Four existing constructions in this language

### 5.1 A pivot and then a second root

For a single root v in an R(5,5)-free G, (1) gives
A=N(v) of type (4,5) and B=M(v) of type (5,4). A may contain I4.

For adjacent roots u,v the four outside cells have types

| Root signature | Cell | Residual type |
| --- | --- | --- |
| {u,v} | common neighbors | (3,5) |
| {u} | u-neighbors missing v | (4,4) |
| {v} | v-neighbors missing u | (4,4) |
| empty | common nonneighbors | (5,4) |

For nonadjacent roots, the common-neighbor type is instead (4,5) and
the common-nonneighbor type is (5,3); the two exclusive cells stay (4,4).
The root graph, not merely the number of roots, explains the difference.
Actual labelled overlap identifications and residual symmetries are
handled by [the existing gluing theorem](symmetry_pair_gluing.md).

### 5.2 The 17-core and 15-core come from the same refinement

If u is isolated inside an 18-vertex N(v), then the signature-{v}
cell for the root edge uv has order 17 and type (4,4). Its further
critical regularity is a separate theorem, not part of the type calculus.

In [the K3 component setting](../../research/n43/d18/k3/core_interface.md), let
N(v)=U disjoint-union C with U a K3, anticomplete to C. For root graph
G[{v} union U]=K4, the C signature is {v}, so C again has type (4,4),
now of order 15. If y outside N[v] misses some u in U, the part of C
missing y is anticomplete to the independent pair {u,y}; it therefore
has type (4,3). More generally, if independent Q outside N[v] has a
common missed u in U, its common missed C region has type (4,4-|Q|).
For |Q|=1,2,3 these are respectively (4,3), (4,2), and empty.
This is precisely the nested-core mechanism behind the
[joint missing-column theorem](../../research/n43/d18/k3/core_interface.md#claim-k3-core-02).

### 5.3 A transversal is an alternative way to expose a smaller block

Deleting a K_r-transversal T from F exposes a K_r-free induced core
H=F-T while preserving the independent-set prohibition. The vertices
of T are attachments to H. Their admissible ports are not arbitrary:
F[H-N(x)] has the stronger independent-set prohibition supplied by x.
The [deletion theorem](transversal_deletion.md) adds mandatory attachment
and internal-T costs, and records the exact sum of nonnegative defects.
This is a proof operator on a chosen decomposition, not a requirement
that H be a neighborhood or a unique canonical core.

### 5.4 Saturation turns interface constraints into resources

If an independent (q-2)-face F of H has a large clique of common core
nonneighbors, its outside common nonneighbors have a small residual
clique capacity. The [critical-face theorem](critical_face_transport.md)
turns these capacities into an incidence resource system. Unit capacities
give missing-set labels; label constraints can rule out a whole outside
pattern rather than merely tighten an edge count. This generalizes the
[critical-core exterior proof](../../research/n43/d18/critical_core_exterior.md)
without assuming an SRG core in the abstract theorem.

## 6. What a useful Lego theory can and cannot mean here

The proposed operations are concrete: expose an induced block, refine by
labelled roots, attach with an actual port family, transport its interface
by (3), identify compatible labelled overlaps, forget a boundary using its
profile, and extract weighted or saturated witness certificates.
Complementation exchanges c with a and positive with negative colour.

Uniform substitution alone cannot factor an order-43 candidate into
proper nontrivial modules: the
[reviewed primeness theorem](../../research/n43/symmetry_structure.md#claim-symmetry-structure-03)
already excludes such modules. A module in a partial graph can still be
broken by future attachments; it must not be rejected as permanent.
Overlapping blocks and labelled interfaces avoid that restriction, but
no theorem here bounds their required width or number of states.

Nor is an unlabelled core plus a numerical type an interface. For example,
on labels 0..3 take paths H1 with edges 01,12,23 and H2 with edges
01,02,23. They are isomorphic P4 graphs with identical numerical
invariants and both are (3,3)-free. Attach a new vertex to exactly
{0,3}. The first result is C5, still (3,3)-free; the second has the
independent triple {new,1,2}. An isomorphism must transport the ports
as well as the core. Fixing the same port labels makes this difference
observable. This is why both the profile and symmetry layers matter.

A genuine compression theorem is the
[boundary-profile replacement theorem](boundary_profiles.md), with its
explicitly restricted context algebra. Exact arbitrary mixed attachments
are handled by (2)-(3), not silently by that smaller invariant.
The distinction prevents an attractive but unsound recursive factorization.

## 7. Literature and evidence limits

Neighbourhood and pointed-edge gluing are established methods, not new
in this project. Angeltveit and McKay,
[R(5,5)<=46, arXiv:2409.15709v1](https://arxiv.org/html/2409.15709v1),
sections 2, 3.2 and 5, explicitly assemble smaller Ramsey graphs with
specified overlaps and cross edges. Their upper bound is not a new
premise of this note.

Boundary-labelled gluing and context equivalence are standard graph
algorithm concepts; see Antipov and Kratsch,
[Boundaried Kernelization via Representative Sets](https://drops.dagstuhl.de/storage/00lipics/lipics-vol358-ipec2025/html/LIPIcs.IPEC.2025.6/LIPIcs.IPEC.2025.6.html),
section 2. This citation supplies context, not a dependency of the proofs.
The present contribution is a Ramsey-specific synthesis with exact
operator contracts and structural witness transport. No novelty claim
or comprehensive literature review is made.

All results here concern written mathematics. They do not assert a
small-width decomposition for every candidate, a construction on 43
vertices, or a nonexistence certificate. No new Lean/engine implementation
or computational Ramsey search is included.
