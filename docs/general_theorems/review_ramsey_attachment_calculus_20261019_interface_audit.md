# Independent interface audit: attachment calculus and profile obstructions

Date: 2026-10-19.
Task: `ramsey-attachment-calculus-20261019`.
Author of both reviewed notes: Main.
Reviewer: `InterfaceAudit` (reviewer token `interface_audit`), a distinct
identity. This file is the reviewer's only written output; no source note,
metadata line, status label, or shared index was edited.

Method: written re-derivation from the exact bytes below, using repository
reads, `sha256sum`, and two title-level literature existence searches only.
No solver, graph or catalogue search, download, installation, Lean or engine
change was used. Trivial fixed-object arithmetic and subset checks appear
inline as evidence, never as substitutes for a proof.

## Claim(s) and exact reviewed revision

Both source bodies were frozen for this review and are byte-identical to the
hashes commissioned by Main.

| Source | SHA-256 of exact uncommitted file |
| --- | --- |
| `docs/general_theorems/ramsey_attachment_calculus.md` | `bf9a6d10942e34c6ad1b97ea379e61ef04d3b87115cec5aeb39fb53630be079b` |
| `docs/general_theorems/profile_obstructions.md` | `0b82764ec4d4341eddf02fd51f8bff01ecb403fd64850f69da7e9ec4fc715d8f` |

Repository context: HEAD `1581b3ae1b0e5ca5b65a6177fd8d04678ef96782`; both
files are untracked at review time, so the hashes, not a commit, identify the
reviewed bytes. Acceptance below applies to these exact bytes only.

Claims reviewed, with anchors and reviewed line ranges:

| # | Anchor | Lines | Title |
| --- | --- | --- | --- |
| A1 | `ramsey_attachment_calculus.md#claim-attachment-cell-type` | 50-92 | Root-signature cells and the one-cell attachment operator |
| A2 | `...#claim-attachment-exact-template` | 114-144 | Exact elimination of a core into its attachment template |
| A3 | `...#claim-attachment-arity` | 145-173 | Higher-order interactions cannot universally be dropped |
| A4 | `...#claim-attachment-convolution` | 180-238 | Homogeneous ranks compose across an arbitrary mixed join |
| P1 | `profile_obstructions.md#claim-profile-obstruction-lifting` | 31-65 | Interior automorphisms and modules persist through contexts |
| P2 | `...#claim-profile-forbidden-representative` | 66-99 | A forbidden representative forbids a profile in that context |
| P3 | `...#claim-profile-collision` | 100-152 | Equal-profile sibling blocks force a symmetric representative |

Also checked as part of the same commission: the worked examples and limits
of `ramsey_attachment_calculus.md` (sections 5.1-5.4 lines 239-299, section 6
lines 300-330, section 7 lines 331-351), and the order-43 instance plus
certificate limits of `profile_obstructions.md` (lines 153-194).

## Dependencies reviewed

| Dependency file | SHA-256 | Recorded status | Level used here |
| --- | --- | --- | --- |
| `docs/general_theorems/signature_anchors.md` | `6d2c64d09b5dc3096b4948eef68e3cdbaa8b8d03edc68b88a41dd9113995175f` | all claims accepted | claim 01 proof re-read and re-derived; A2 is its pivot-free recast |
| `docs/general_theorems/symmetry_pair_gluing.md` | `ee85b86d88d36167cdb9a0e5639f9472c74f59e0ab9ba8f9c41a9c94c63b30d7` | claims 01-03 accepted | statement and scope re-read; used only as a pointer in 5.1 |
| `docs/general_theorems/transversal_deletion.md` | `699b21132f1dc10e5b454d69ab45c6b06effa43c2a0a89e8716eacf3735e6eb4` | claims 01-04 accepted | claims 01-02 re-derived at summary level for 5.3 |
| `research/n43/symmetry_structure.md` | `5b682c15fb93f559ec4062afcf986d46f92b9fb67acea4300eaf9d9d1d01195d` | claims 01-09 accepted (reviewed body `ed61d3fd5b87aac35e6bfb41c31aaaf55ff34ed57e72a03ac0cfcba857b49062` recorded inside) | claims 01, 02, 03 statements and proofs re-derived; setting read in full |
| `research/n43/d18/k3/core_interface.md` | `85ef77b4910ecf87b91bdccf81c11c072efb87b095d9231cb7212ec1f481b742` | all seven claims accepted | claim-k3-core-02 hypotheses, conclusion, proof re-read and matched |
| `research/n43/d18/critical_core_exterior.md` | `e30573b5d121f9cbaf01369ad55cfbd109ba12690d66cf4fffdcf30b4344bf19` | both claims accepted | setting read; confirms 5.4's SRG-only-in-the-application statement |
| `docs/general_theorems/boundary_profiles.md` | `013507deec2512db52acdbc8897cf38155c6f05bc9df6152dd5438d18d736673` | claims 01-04 accepted by Main in `review_boundary_profiles_20261019_main.md` (SHA-256 `02cffe9d7a6b66e8aa321b041f74c11fb0473174ace29605edcbc2e4f85b4354`) | for A1-A4: contextual link only, not a premise. For P1-P3: claims 01-04 proofs re-read in full and re-derived at the level used |
| `docs/general_theorems/critical_face_transport.md` | `a0d900a4f8022881b2a3f3c416eb80a26136c16ba49ee37dc34c040c0901c3f0` | claims ready, not accepted | contextual link only for 5.4; explicitly not a premise of A1-A4, and its pending status forms no part of this acceptance |
| `docs/general_theorems/disjoint_swap_stabilizers.md` | `047c6351e57f64e1552a59ece14686a900fe16baaf74dbe5304b47b9cfd8b252` | definition used by accepted claims | the delta definition only: delta(u,w) counts vertices outside the endpoints with differing incidence |

Literature: the Angeltveit-McKay paper `arXiv:2409.15709` (R(5,5)<=46) and
the Antipov-Kratsch paper "Boundaried Kernelization via Representative Sets"
(IPEC 2025, LIPIcs volume 358) both exist as cited. Section numbers were not
re-verified; see Limits.

## Checks

### A1: root cell residual type and the one-cell iff

Quantifiers. For every p,q>=2 (line 28), every R(p,q)-free graph G, every
finite root set R, and every signature S subset R: the cell V_S satisfies
(1). Converse: for every R(p,q)-free D and every disjoint K carrying the
residual type, the one-cell assembly is R(p,q)-free. Both directions were
re-derived independently.

Forward direction. A clique in D[S] is completely joined to V_S because each
V_S vertex is adjacent to exactly the roots in S. A hypothetical
K_{p-c_D(S)} inside V_S combined with a maximum clique of D[S] gives K_p, so
the cell has no such clique. For independent sets, V_S is anticomplete to
R minus S by the same definition, so a hypothetical
I_{q-a_D(R minus S)} combined with a maximum independent set of D[R minus S]
gives I_q. Both residual parameters are positive because D is induced in G,
so c_D(S) <= p-1 and a_D(R minus S) <= q-1; neither parameter exceeds p or
q because ranks are nonnegative. The empty root-graph conventions
c(empty)=a(empty)=0 (line 34) are exactly what makes S=empty and S=R legal
cases of the same formulas.

Converse. Every K vertex is joined exactly to S. A mixed clique has its
D-part inside S (vertices outside S are anticomplete to all of K) of size at
most c_D(S), and its K-part of size at most
p-c_D(S)-1 from K's residual type, so at most p-1 total. The independent
calculation over R minus S with q is identical. Sets inside D are excluded
by D's own type; sets inside K are excluded by K's residual type together
with the trivial monotonicity p-c <= p and q-a <= q (this last case is
implicit in the proof text; see Finding note 1).

Residual-1 boundary case. When p-c_D(S)=1, any cell vertex together with a
maximum (p-1)-clique of D[S] would be K_p, so the cell is empty; statement
(1) then reads R(1,.)-free, which the conventions (lines 29-30) define as
empty, and the converse with empty K returns D itself. Symmetric for
q-a=1. Empty cells and empty D are legal throughout.

Refinement remark (lines 87-91). Three mutually adjacent missed roots give
a_D=1, not 3, so q drops by exactly 1; the note's instruction to recompute
(1) from the actual enlarged root graph, never to decrement once per root,
is what every worked example below uses. See Finding note 2 on the precise
reading of "partitions more finely".

Worked example 5.1, re-derived. One root: A=N(v) is R(4,5), B=M(v) is
R(5,4); R(4,5)-free does not exclude I4, so "A may contain I4" is correct
and matches the accepted symmetry_structure setting. Adjacent roots, D=K2:
signatures {u,v}/{u}/{v}/empty give (3,5)/(4,4)/(4,4)/(5,4) from
(omega,alpha)=(2,0),(1,1),(1,1),(0,1). Nonadjacent roots, D=2K1:
common-neighbour cell (4,5) because omega({u,v})=1 in the edgeless root
graph, exclusive cells stay (4,4), common nonneighbours (5,3) because
alpha({u,v})=2. All eight table entries agree with (1); the adjacent
common-nonneighbour value (5,4) matches the correction recorded in WORK.md
for the 2026-10-17 extension-research integration.

Worked example 5.2, re-derived, and its precise hypotheses. With u isolated
inside an 18-vertex N(v), the signature-{v} cell for the edge root uv is
N(v) minus {u}, order 17, type (4,4) from root graph K2. In the K3 component
setting (N(v)=U disjoint-union C, U a K3 anticomplete to C, |C|=15, root
graph G[{v} union U]=K4): C has signature {v}, omega=1 and missed
alpha(K3)=1, hence type (4,4), order 15. For y in B missing u in U, take
roots {v,u,y}: the only edge is vu, the cell is exactly C minus N(y)=M_y,
signature {v} gives p-side 4, missed set {u,y} is independent so q-side is
5-2=3: type (4,3), matching claim-k3-core-02's q=1 line (alpha<=2,
|M|<=8). For independent Q outside N[v] with a common missed u in U, take
roots {v} union U union Q. The cell is the common missed C region M_Q with
signature {v}, so the p-side is 4. On the q-side, U is a clique so any
independent set of the missed roots U union Q contains at most one U vertex,
and {u} union Q is independent, so alpha = 1+|Q| exactly; the type is
therefore (4, 4-|Q|). |Q|>=4 is unsatisfiable because {u} union Q would be
an I5, so the enumerated |Q|=1,2,3 with (4,3), (4,2), empty are all
satisfiable cases, and they agree exactly with claim-k3-core-02
(alpha<=3-q; clique of order <=3; empty). Every hypothesis the note states
(K3, anticompleteness, Q independent and outside N[v], common missed U
vertex) is used; nothing else is assumed. The note correctly labels the
17-core's further regularity a separate theorem.

### A2: arbitrary-core template with repeated port types

Quantifiers. For every fixed R(p,q)-free core H, every disjoint X, and
every specified port family (repeated ports allowed, distinct realized
vertices, lines 108-109): H bowtie X is R(p,q)-free iff conditions 1-3.

Necessity. A mixed p-clique has nonempty X part Q of size t in 1..p-1 and
an H-part of size p-t inside the common port intersection, so the realized
tuple lies in F^+_t; the independent argument over the uncovered set is
dual; pure parts are excluded by condition 1 and H's own type.

Sufficiency. A clique Q of size t realizing a tuple of F^+_t plus a
(p-t)-clique of the intersection forms K_p; dually an independent Q of size
u plus a (q-u)-independent set of the uncovered region forms I_q. These
reconstructions are valid for every t in 1..p-1 and u in 1..q-1, so the
case split is complete.

Endpoints and boundary ranges. At t=p-1 the requirement is a single
intersection vertex, i.e. for freeness the residual intersection must be
empty; at u=q-1 the uncovered set must be empty. This is exactly the
endpoint phrasing of the accepted signature_anchors claim 01 ("forces an
empty intersection or empty uncovered set"), so line 138 is correct in
that sense. The degenerate parameter ranges check out: p=2 leaves only
t=1 (R(2,q)-free means edgeless, and F^+_1 then requires a nonempty port,
correctly forbidding any cross edge); q=2 leaves only u=1 (R(p,2)-free
means complete, and F^-_1 requires the ports to cover H, correctly
requiring a complete cross join). Unary tests t=1,u=1 are present, so the
template really includes unary restrictions.

Relation to the accepted source. With H=A=N(v) and X the rest, A2's
conditions are verbatim signature_anchors claim 01 (its threshold p-t and
q-t are the same numbers here), with the pivot vertex absorbed: the claim
correctly presents itself as an extension of the accepted criterion, not a
new signature theorem (lines 140-144).

Repeated ports. Distinct X vertices may carry identical ports; conditions
2-3 quantify over vertex sets, so repetitions are handled by tuple
realization, exactly as lines 108-109 state.

Exercised consistency check (fixed object, not a proof substitute). H=K2
on {a,b}, X=K2 on {x,y}, both ports {a}, p=q=3. Condition 2 fails at t=2
(intersection {a} has omega=1 >= 3-2), and the assembled graph indeed
contains K3 on {a,x,y}; independent tests pass; A4 formula (3) on
P=V(H), Q=V(X) gives c_L=3 via the J={x,y} term 2+c_H({a})=3 and a_L=2
via J=empty and singletons. Claim 2 and Claim 4 agree on this instance.

### A3: sharp universal arity examples

Clique example (p>=3, q>=2). H=K1 is R(p,q)-free for p,q>=2; X=K_(p-1)
has no K_p and independence number 1<q. Every clique test of arity
t<=p-2 requires a residual clique of size p-t>=2 inside a one-vertex core,
so it passes. Every independent test passes because the nonempty port union
covers H, leaving an empty uncovered set with a=0 < q-u. The assembled
graph is K_p. The first failing arity is exactly p-1: the whole
(p-1)-clique realizes a tuple with residual clique of size 1 >= p-(p-1).
So "truncating clique tests below arity p-1 is unsound in general" is
sharp: every lower arity passes on a concrete instance.

Dual. Complementation swaps clique with independent, ports with their
complements, and (p,q) with (q,p); equivalently the direct instance
H=K1, X=I_(q-1), all ports empty assembles to I_q, all independent tests
of arity <=q-2 pass (a single missed vertex gives a=1 < q-u) and all clique
tests pass. The first failing independent arity is exactly q-1.

Instances. At p=q=5: unary, binary, ternary tests need residual clique
sizes 4,3,2 against omega(H)=1 and pass; the fourth-order check needs
1>=1 and detects K5 (lines 165-167). Three fully joined blocks K2,K2,K1:
every pair union is K4 or K3, all (5,5)-free; the total union is K5
(lines 167-169). Both arithmetic statements were checked directly.

Scope discipline. The claim is explicitly conditional ("in general") and
lines 170-173 expressly do not forbid encoding higher-order constraints
via auxiliary states or a larger boundary; the note rules out only deletion
of the constraints while keeping the raw pairwise compatibility relation.
No impossibility-of-encoding overreach is present.

### A4: both convolution formulas and order-independent composition

Formula (3), clique side. Upper bound: a clique of L[P union Q] has X part
J clique in X[Q] and H part inside P intersected with the common port
intersection, so its size is at most the displayed term for that J. Lower
bound: for each J, a maximum clique of that intersection is completely
joined to J (membership in every port of J), so the term is attained.
Independent side identical with independent J and the port union removed:
H vertices nonadjacent to x are exactly those outside S_x.

Boundary conventions. The empty J is included (line 207) and uses the
lines 38-39 conventions: the empty intersection is the whole current core, so
J=empty contributes c_H(P) or a_H(P); the empty union is the empty set, so
the independent J=empty term is a_H(P). Empty P, Q, H interiors, and
already-empty cores are all legal: the formulas hold with no Ramsey
premise, exactly as the scope states.

Transport of the template. For a future t-tuple of ports into L split as
P_i union Q_i, the two parts of L are disjoint, so the intersection of the
unions equals the union of the intersections partwise, giving
P=intersection_i P_i, Q=intersection_i Q_i for the positive obstruction,
and the complement identity V(L) minus union_i S_i =
(V(H) minus union_i P_i) union (V(X) minus union_i Q_i) for the negative
one. Both substitutions are exactly those stated, for every arity t in the
families (2) and for repeated port types.

Order-independent composition. All cross matrices between every pair of
blocks are fixed (line 224), so every parenthesized iteration builds the
same final graph, and each intermediate core is an induced subgraph of it;
each application of (3) is an exact identity for that single final graph.
Equivalently, expanding each maximum gives the family of per-block
homogeneous subsets that are pairwise completely joined (clique rank) or
pairwise anticomplete (independent rank), with objective the sum of sizes:
the feasible family and objective do not depend on parenthesization, so
the maxima coincide. The note explicitly avoids the unsound shortcut it
names: pairwise legality of intermediate graphs is not asserted; a final
join is tested against its newly transported template (lines 233-234).

Limits present. Rank storage can be exponential and the two-element ranks
recover the core's edges (line 235; c_H({u,v})>=2 iff uv is an edge); no
compression or fast algorithm is inferred (line 237). No width or
compression overreach.

### Sections 5.3, 5.4, 6, 7 of the first note

5.3. Deleting a K_r-transversal leaves a K_r-free induced core and preserves
the independent-set prohibition by heredity; for x in T the region
F[H minus N(x)] has independence number at most alpha(F)-1 because adding
x extends any independent set there, which is the "stronger
independent-set prohibition supplied by x". The summary of
transversal_deletion claims 01-02 matches: mandatory attachment cost t*b
with b=max(0,h-R+1), internal-T cost a(t,s), and delta an exact sum of
nonnegative component defects.

5.4. Statement-level match with critical_face_transport claims 01-04: an
independent (q-2)-face F has clique Z_F of common core nonneighbors,
capacity c_F=p-1-|Z_F| bounds the outside vertices missing F; weighted
resource packing, unit-capacity missing-set labels, and the derived
colouring obstruction ("rather than merely tighten an edge count") are the
claims' actual conclusions. The SRG(17,8,3,4) parameters appear only in
critical_core_exterior's application, and critical_face_transport states
its SRG derivation is an input for that application only; "without assuming
an SRG core in the abstract theorem" is accurate. None of this section is
a premise of A1-A4.

6. Module statement. The reviewed primeness theorem (symmetry_structure
claim 03) was re-derived: every K5/I5-free graph with a proper module of
order at least 2 has order at most 39 (complete case table on
(omega,alpha) of the module and the two outside parts with the recorded
small Ramsey values), so no order-43 candidate has a nontrivial module;
"uniform substitution alone cannot factor an order-43 candidate" is exactly
that conclusion. The caution that a module of a partial graph can be broken
by future attachments matches the source's own search-use caveat. Lines
314-315 record that no theorem here bounds required width or number of
states.

P4/C5 example (lines 316-323), checked directly. H1 (edges 01,12,23) and
H2 (edges 01,02,23) are both P4 and (3,3)-free. Attaching a vertex to the
labelled port {0,3} gives the 5-cycle 0-1-2-3-n-0 for H1, which is
(3,3)-free (triangle-free, alpha=2), and for H2 the independent triple
{n,1,2} (1-2 is not an edge; n meets only 0 and 3). No isomorphism
H1->H2 transports the port: the P4 endpoint sets are {0,3} and {1,3}.
The example proves its stated point: an unlabelled core plus a numerical
type is not an interface.

Complementation rule (line 306), verified on the families (2): in the
complement the port S_x becomes V(H) minus S_x, omega and alpha swap, and
the complement's positive condition at arity t becomes exactly the
original negative condition, and conversely. The sentence is correct.

7. Disclaimers present as written: no novelty claim, no small-width
decomposition, no order-43 construction, no nonexistence certificate, no
Lean or search result. Both external citations exist (existence checked
only).

### P1: automorphisms and modules persist through every permitted context

Operator language. The setting (lines 17-29) restricts contexts to the
five operators of boundary_profiles claim 04: star_0/star_1 uniform
interior joins over a shared labelled boundary, boundary forgetting,
uniform interior introduction, fixed boundary relabelling, interiors
copied apart. I re-derived claim 04's operator list and congruence proof
from boundary_profiles; the context language used here is exactly that
language, with no mixed attachment or promotion.

Automorphism induction. At a binary join the extension is pi on the hole
side and identity on the other side: well defined because pi fixes the
shared boundary pointwise, and correct because cross edges are uniform in
epsilon. At a uniform introduction the new boundary vertex is adjacent to
all or none of the old interior and to a fixed subset of the old boundary,
so fixing it extends pi. Forgetting changes no graph and drops only a
vertex pi already fixes. Relabelling transports fixed labels. Support is
exactly preserved: interiors are copied apart and only boundaries are ever
identified, so no moved interior vertex is ever identified (the moved set
is unchanged), and no new vertex is ever moved.

Module induction. Old outside vertices keep their all-or-none relation to
M; vertices added by a join see all of M or none (complete or anticomplete
interior join); an introduced vertex is uniform to the current interior,
which still contains M; forgetting and relabelling change no adjacency.
M's vertex set and order are unchanged, so "proper if its order is below
|C[H]|" holds, and the body's nonempty/proper range (1 to |C[H]|-1)
covers P2's use with 2<=|M|<n.

No-promotion lemma. The only boundary transitions in the operator language
are introduction (fresh vertex to the boundary), relabelling (same
vertices), star (boundary glued to boundary), and forgetting
(boundary to interior). Original interior vertices therefore never become
boundary vertices, as the note states; no arbitrary promotion is used.

Edge cases: empty context (C[-]=hole) trivially preserves both properties;
empty boundary makes star a disjoint union and the arguments unchanged;
k=0 interiors are excluded from P3's scope so its swap is never the
identity.

### P2: forbidden representative, symmetry on the replacement graph

Replacement direction. Equal profiles and equal orders give, by
boundary_profiles claim 04, equal profiles of C[H] and C[H'] (congruence
along the hole-to-root path), hence equivalent freeness, and equal output
orders, so |C[H']|=|C[H]|=n. The direction used, "C[H] free implies
C[H'] free", is available in the accepted theorem.

Form 1. The lifted automorphism of C[H'] is nonidentity (support r>=1)
with support exactly r<s by P1, contradicting a universal premise of
minimum support s over n-vertex R(p,q)-free graphs. Form 2: the lifted M
is a module of order 2<=|M|<n=|C[H']|, hence a proper module of order at
least 2, contradicting the universal premise. The premises are supplied
externally; the theorem claims none of its own (lines 95-96).

Location of the symmetry, checked per commission: the automorphism and
module live on H' and its completion C[H']. Lines 92-93 state explicitly
that H itself need not have the automorphism or module and that only the
replacement must have it; the section 6 paragraph of P3 (lines 166-171)
repeats that the contradiction comes from a different, information-
equivalent completed representative, not from partial symmetry of the
original. No symmetry of the original graph is asserted anywhere.

Hypotheses. Equal profiles, equal orders, a certified context expression,
and a valid universal premise are all stated as required (lines 72-74,
95-97); numerical type agreement or an assumed compact decomposition is
expressly insufficient. No arbitrary-context or promotion overreach.

### P3: sibling collision, swap support 2k, pair-distance formulas

Legality of the replacement. Identical profiles give
Sigma(star_epsilon(H1,H2)) = Sigma(star_epsilon(H1,H1)) through
boundary_profiles claim 02's four formulas, since only the operand
profiles and epsilon enter them; equal interior sizes k give equal orders.
Claim 04 then makes C[H1 star H1] order n with equivalent freeness to the
original assembly.

The swap. Swapping the two interior copies pointwise and fixing B is an
automorphism of H1 star_epsilon H1: internal edges match (identical
copies), boundary incidences match (same boundary graph), and cross edges
are uniform in epsilon. All 2k interior vertices move (disjoint copies), so
the support is exactly 2k and the map is nonidentity for k>=1. P1 lifts it
through C with the same support; P2 form 1 then yields 2k>=s.

Pair-distance formulas, re-derived. Every vertex outside the two copies is
fixed by the lifted swap, and an automorphism fixing z gives
z~x1 iff z~x2, so such vertices never distinguish the pair; boundary
neighbours see both copies identically for the same reason. For epsilon=0
there are no cross edges, so the distinguishing vertices are exactly the
two copies of the neighbours of x inside F, giving delta(x1,x2)=2 d_F(x).
For epsilon=1 all cross edges are present, so a copy distinguishes exactly
when it is a nonneighbour of x other than x itself, giving
delta(x1,x2)=2 (k-1-d_F(x)). The two lists are disjoint and exhaustive.
Integer ceilings are correct: delta>=D implies d_F(x)>=ceil(D/2) and
d_complement(F)(x)>=ceil(D/2).

Scope discipline. The consequences are stated as necessary restrictions on
an actual chosen representative, explicitly not degrees assigned to a
profile (lines 147-148). Equal order is load-bearing and is stated in
P2's scope (line 73), P2's body (line 96), and the limits (line 192); see
Finding note 3 on one sentence that should be read with it. H1 and H2 need
not be boundary-isomorphic: equal profile suffices, which is exactly what
claim 04 replacement provides.

### Order-43 instance (lines 153-178)

Premise universality. The instance uses s=10 from symmetry_structure
claim 02 and D=8 from claim 01 as universal premises over the class of
order-43 K5/I5-free graphs. I read the full setting: G is any order-43
graph with neither K5 nor I5, and claims 01-04 carry no additional
premises (the integration banner records them as catalogue-free on the
recorded small Ramsey values). The replacement graph is some member of
exactly this class, so both premises apply.

Values re-derived. Claim 01: for an edge uw the common neighbourhood is
K3-free (a triangle plus u,w is K5) and I5-free (heredity), hence of order
at most R(3,5)-1=13, and delta = d(u)+d(w)-2-2|common| >= 18+18-2-26 = 8
using the derived degree floor 18; the nonedge case is the complemented
argument with complement degrees also at least 18. Claim 02: a fixed
vertex has equal incidence to u and pi(u), so every distinguishing vertex
is moved, and both endpoints are moved, giving support >= delta+2 >= 10.
Claim 03's module premise was re-derived from its case table as recorded
above (order at most 39). All three are the reviewed statements at the
reviewed file bytes.

Exclusions. 2k>=10 forces k>=5, so k<=4 is excluded in any R(5,5)-free
assembly. For k=5 the threshold is ceil(8/2)=4: five vertices with minimum
degree 4 form K5 (epsilon=0), or their complement forms K5 so F is
edgeless (epsilon=1). Either way H1 contains K5 resp. I5. H1's vertex set
is induced in C[H1 star_epsilon H2]: star preserves all previous edges and
adds only interior-to-interior cross edges, and forgetting, introduction
and relabelling add no edges inside a leaf. So H1 must be R(5,5)-free
whenever the assembly is, a contradiction; k=5 is impossible and k>=6
follows. The framing is conditional on freeness throughout (Claim 3's
conclusion states it; the instance cites the "necessary induced
R(5,5)-freeness of H1"), and lines 166-178 disclaim any bound on arbitrary
induced-subgraph orders, any new global bound, any unavoidability claim in
every order-43 candidate, and any transfer of symmetry to the original
graph. Lines 189-194 add: no arbitrary mixed-attachment replacement, no
module crossing a boundary, no small representative or bounded interface,
no efficiency or covering claim.

### Search use and inference audit

Both notes record "Search use: none pending independent review"; no
propagation or branch use is claimed and none was exercised. Every
commissioned negative check passed: no false compression claim (the
exponential-rank and no-small-interface limits are explicit), no width
bound (line 314 of the first note; lines 192-194 of the second), no
novelty claim (first note header and section 7; second note header), no
global-bound or R(5,5) inference (section 7 and instance disclaimers), no
branch exclusion, and no dependence of A1-A4 on the pending status of
critical_face_transport or on boundary_profiles (contextual links only).

## Findings

No proof gaps were found, and no gap requiring immediate notification to
Main arose during the audit. Three precision notes are recorded for the
record; none affects any conclusion.

1. Implicit case in A1's converse (lines 80-85). The proof names the
   wholly-in-D and mixed cases; forbidden sets wholly inside K are
   implicit. They follow from the same bound the sentence already uses:
   K's residual type gives no K_{p-c} and no I_{q-a}, hence
   omega(K)<=p-c-1<=p-1 and alpha(K)<=q-a-1<=q-1. Supporting reasoning,
   not a defect.

2. Cell-refinement phrasing (lines 87-89). Strictly, the finer cells
   partition the old cell minus the vertices promoted into the enlarged
   root set (new roots leave the cells). The load-bearing instruction,
   recompute (1) from the actual enlarged root graph with omega of the
   adjacent roots and alpha of the missed roots rather than decrementing
   once per root, is correct and is what all worked examples use.

3. Representative reading in P3 (lines 147-149). "Any representative
   violating the necessary condition is a certificate against the
   original assembly" is valid for representatives of the same profile
   and equal order, which is what keeps the assembly at order n where the
   universal premises live; the equal-order requirement is stated
   explicitly at lines 73, 96 and 192. Read with those stated hypotheses
   the sentence is correct; it should not be read as licensing
   different-order representatives.

## Outcome

**Accepted.** All four claims (A1-A4) of
`ramsey_attachment_calculus.md`, and all three claims (P1-P3) plus the
order-43 instance of `profile_obstructions.md`, together with the worked
examples, overlap/module statements and stated limits checked above, at
SHA-256 `bf9a6d10942e34c6ad1b97ea379e61ef04d3b87115cec5aeb39fb53630be079b`
and `0b82764ec4d4341eddf02fd51f8bff01ecb403fd64850f69da7e9ec4fc715d8f`
respectively. No changes requested. Acceptance covers written mathematics on
these exact bytes only.

## Limits

- Independent written review, not a Lean proof, formal certificate, novelty
  review, or numerical Ramsey improvement. No new bound, branch exclusion,
  coverage argument, or search use follows from it.
- Numerical Ramsey values (R(3,3)=6, R(3,4)=9, R(3,5)=14, R(4,4)=18,
  R(4,5)=25) are inherited premises of the accepted sources, not
  recertified here.
- The two external citations were checked for existence and authorship
  only; the cited section numbers were not re-verified. The first note
  itself marks them as context, not proof dependencies.
- boundary_profiles claims 01-04 were re-derived only at the level used by
  P1-P3; their acceptance remains Main's at source SHA-256 `013507...`
  (review SHA-256 `02cffe...`). critical_face_transport remains
  ready/unaccepted and forms no premise of this review's acceptance of
  A1-A4 or of P1-P3.
- Any edit to either source file voids this acceptance and requires renewed
  review. Author-stage status labels in the source notes remain untouched;
  Main owns integration, metadata, and any status transition.
