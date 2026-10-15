<!-- symmetry-audit-integration:start -->
Integration status (2026-10-15):

All nine revised claims below received independent exact-revision acceptance:
[structure review](review_symmetry_structure_20261015_structure_auditor.md)
for Claims01-04 and07-09, and
[swap review](../docs/general_theorems/review_disjoint_swap_stabilizers_20261015_swap_auditor.md)
for Claims05-06. The reviewed body SHA-256 is
`ed61d3fd5b87aac35e6bfb41c31aaaf55ff34ed57e72a03ac0cfcba857b49062`.
The entire reviewed body is preserved below; ready labels are historical.
The revision excludes the identity from the small-swap prohibition, explicitly
separates candidate group K_M from completed stabilizer L, and strengthens
Claim09 to p<=10 and at least four singleton complete signatures at x136.
The [anchor dependency](d18/x136/five_column_compatibility.md) has independent
acceptance; its ready/unreviewed references below describe the author stage.

Current state: accepted local deductions on each claim's exact premise chain.
Claims01-04 are catalogue-free on the stated small Ramsey premises. The generic
Claim05 is likewise catalogue-free. Claim06 and the frontier applications of
Claims07-08 inherit the accepted multiplicity/forced-edge premises; Claim09
also inherits the anchor census chain. This corrects the historical introductory
sentence that only Claim06 inherits frontier census premises. Permitted use is
conditional propagation, completed-module filtering, actual-automorphism support
restrictions and symmetry accounting, as specified in the reviews. Partial
modules may be broken by extensions; primeness is not asserted for order18 A.
No generator, formal certificate, novelty, runtime gain or Ramsey branch closure
is certified.

See the [audit report](../reports/2026-10-15-symmetry-audit.md) and its exact-hash manifest.
<!-- symmetry-audit-integration:end -->

# Pair separation, prime graphs, and frontier automorphism bounds

Date: 2026-10-15. Task: `symmetry-hour-20261015`. Author: Codex.
All nine claims are ready for independent review, with author self-checks only.
No new search rule is integrated and no branch is closed. The work is purely
mathematical; no graph enumeration, installation, or external tool was used.
No novelty claim is made.

## Setting and external premises

G is a simple order-43 graph containing neither K5 nor I5. Its degree bounds
are 18<=d_G(u)<=24, from R(4,5)=25. For a degree-18 root v put A=N(v),
B=M(v), so A is K4/I5-free and B is K5/I4-free. In particular A may contain
I4. For y in B let C_y=N_G(y) intersect A.

The established small Ramsey values used below are

    R(2,j)=j, R(3,3)=6, R(3,4)=9,
    R(3,5)=14, R(4,4)=18, R(4,5)=25,

with symmetry in their arguments. Their project provenance is in the
[baseline](../docs/mathematical_baseline.md) and its cited sources. The
numerical values remain external premises, not proofs replayed in this task.
Only Claim 06 additionally inherits frontier census premises through the
[accepted multiplicity theorem](d18/symmetry_reduction.md#claim-d18-symmetry-03).

<a id="claim-symmetry-structure-01"></a>
## 1. Every pair has at least eight distinguishing vertices

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-01`

Kind: local-deduction

Review state: ready

Scope: every distinct u,w in every G in the setting.

Dependencies: degrees at least18; R(3,5)=14; complementation.

Conclusion: for delta_G as defined in the [disjoint-swap note](../docs/general_theorems/disjoint_swap_stabilizers.md),

    delta_G(u,w)>=8.

More precisely, if uw is an edge,

    delta_G(u,w)>=d_G(u)+d_G(w)-28;

if uw is a nonedge,

    delta_G(u,w)>=56-d_G(u)-d_G(w).

Proof: For an edge, its common neighborhood has no K3 and no I5, so has at
most13 vertices. Removing the two endpoints from the degree sum gives

    delta_G(u,w)=d_G(u)+d_G(w)-2-2|N(u) intersect N(w)|
                 >=d_G(u)+d_G(w)-28>=8.

For a nonedge apply exactly this argument to the edge uw in complement G.
Complement degrees are 42-d_G(u),42-d_G(w) and are also at least18. Whether
a third vertex distinguishes the endpoints is unchanged by complementation.
This yields the stated dual inequality and uniform bound.

Search use: none pending independent review; proposed propagation. On a
partial graph with fixed pair status and degree targets, count vertices whose
two incidence bits can still differ. If this maximum is below the applicable
lower bound, the state has no completion. The bound may also be encoded by
XOR indicators; their exact equivalence to differing incidences is required.

Reviews: none.

<a id="claim-symmetry-structure-02"></a>
## 2. Nonidentity automorphisms move at least ten vertices

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-02`

Kind: local-deduction

Review state: ready

Scope: every automorphism pi of G; every moved u with w=pi(u).

Dependencies: Claim 01; automorphism incidence preservation.

Conclusion: if pi is not the identity, its support has size at least10.
If pi moves u to w, its support has size at least delta_G(u,w)+2,
and hence obeys the sharper bounds from Claim 01 for that pair.
Thus a nonidentity permutation that interchanges at most four disjoint pairs
and fixes every other vertex cannot be an automorphism. Graphs G have no true or false
twin pair. For an involution with t transpositions, t>=5; every fixed vertex
has even degree into its moved set.

Proof: If x is fixed by pi, incidence preservation gives
G(xu)=G(pi(x)pi(u))=G(xw). Therefore every vertex distinguishing u,w is
moved. Both u and w are moved too: a bijection cannot map a moved u to a
fixed w. These are disjoint sets of vertices, proving the support bound.
Twin endpoints would have delta zero, contradicting Claim 01. A fixed
vertex of an involution meets either both or neither member of each
transposition, proving the final parity assertion.

Search use: none pending independent review; proposed rejection of impossible
automorphism hypotheses or support types, and propagation in explicitly
symmetry-constrained branches. This is a restriction on actual automorphisms,
not on relabelings between distinct isomorphic candidates.

Reviews: none.

<a id="claim-symmetry-structure-03"></a>
## 3. Every order-43 candidate is prime under modular decomposition

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-03`

Kind: local-deduction

Review state: ready

Scope: every G in the setting; every nonempty proper module S. A module
means every outside vertex is adjacent to all of S or none of S.

Dependencies: the small Ramsey values in the setting; complete case table below.

Conclusion: every proper module S has size1. In fact, any K5/I5-free graph
having a proper module with at least two vertices has order at most39.

Proof: Put w=omega(G[S]), a=alpha(G[S]), s=|S|. Divide the outside vertices
into U, complete to S, and W, anticomplete to S. Both w and a are at most4.
The induced graphs have types

    S: no K_(w+1) or I_(a+1),
    U: no K_(5-w) or I5,
    W: no K5 or I_(5-a).

If w=4, U is empty; if a=4, W is empty. Otherwise their orders are bounded
by the corresponding Ramsey number minus1. If w,a>=2 the full table of
upper bounds on s+|U|+|W| is:

| w | a | s upper bound | U upper bound | W upper bound | total upper bound |
| --- | --- | --- | --- | --- | --- |
| 2 | 2 | 5 | 13 | 13 | 31 |
| 2 | 3 | 8 | 13 | 4 | 25 |
| 2 | 4 | 13 | 13 | 0 | 26 |
| 3 | 2 | 8 | 4 | 13 | 25 |
| 3 | 3 | 17 | 4 | 4 | 25 |
| 3 | 4 | 24 | 4 | 0 | 28 |
| 4 | 2 | 13 | 0 | 13 | 26 |
| 4 | 3 | 24 | 0 | 4 | 28 |
| 4 | 4 | — | 0 | 0 | impossible for a proper module |

For the last row S would be the entire graph. If w=1, S is independent,
so s=a is 2,3 or4. Then |U|<=24 and |W|<=13,4,0 respectively, giving
totals at most39,31,28. The a=1 cases are complementary: s=w is 2,3 or4
and the same totals apply. Finally w=a=1 gives s=1. All possibilities for
a proper module of size at least2 are covered and have total at most39.

Search use: none pending independent review; proposed filtering of completed
G candidates or impossibility of a module preserved by every extension.
A module of a partial induced subgraph can be broken by future vertices or
edges; its mere presence there does not justify rejection.

Reviews: none.

<a id="claim-symmetry-structure-04"></a>
## 4. The 24-vertex antineighborhood is prime as well

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-04`

Kind: local-deduction

Review state: ready

Scope: every graph B of order24 with neither K5 nor I4, independently of G.

Dependencies: the small Ramsey values in the setting; module definition.

Conclusion: B has no proper module of size at least2. In fact any K5/I4-free
graph with such a module has order at most23. The dual statement applies
to every order24 K4/I5-free graph. No assertion of primeness is made for
the order18 neighborhood A.

Proof: In the preceding module argument replace the ambient I5 prohibition
by I4. Now w<=4,a<=3; U has no K_(5-w) or I4, and W has no K5 or I_(4-a).
For w,a>=2 the complete nonexceptional table is

| w | a | s upper bound | U upper bound | W upper bound | total upper bound |
| --- | --- | --- | --- | --- | --- |
| 2 | 2 | 5 | 8 | 4 | 17 |
| 2 | 3 | 8 | 8 | 0 | 16 |
| 3 | 2 | 8 | 3 | 4 | 15 |
| 3 | 3 | 17 | 3 | 0 | 20 |
| 4 | 2 | 13 | 0 | 4 | 17 |
| 4 | 3 | — | 0 | 0 | impossible for a proper module |

If w=1, s=a is2 or3, |U|<=17 and |W|<=4 or0, giving totals at most23
or20 respectively.

If a=1, S is a clique with s=w in2,3,4. The bounds on U are8,3,0 and
on W are13 in each case, giving totals23,19,17. Thus every case has total
at most23. The order24 conclusion follows, and complementation proves its
dual.

Search use: none pending independent review; proposed catalogue filter on
fully specified order24 B or complement B; inherited partial modules must
not be treated as permanent.

Reviews: none.

<a id="claim-symmetry-structure-05"></a>
## 5. Duplicate pairs have a guaranteed large completion orbit

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-05`

Kind: local-deduction

Review state: ready

Scope: every G in the setting and any p disjoint pairs of vertices; the
whole-graph K action is restricted to invariant candidate data when used
for symmetry reduction.

Dependencies: Claim 01; [disjoint-swap Claims 01 and 02](../docs/general_theorems/disjoint_swap_stabilizers.md).

Conclusion: write L=K intersect Aut(G). Then

    |L|<=2^floor(p/5), |K.G|>=2^(p-floor(p/5)).

If the pairs are duplicate columns in B, K fixes v,A and the complete
cross matrix, so this is exactly an orbit of B completions with those data.
Every unpinned stabilizer component contains at least five duplicate pairs.
For p<=4, each orbit has the full size2^p.

Proof: Claim 01 supplies D=8 to the general stabilizer theorem, giving
h=1+ceil(8/2)=5. For equal-column pairs all vertices in A and v have equal
incidences to the two endpoints. Thus all distinctions counted by delta_G
occur in B, and a permutation in K fixes G exactly when it fixes the B edge
vector. The orbit and stabilizer statements follow.

These orbit sizes count distinct labeled completions within one fixed cross
matrix. They do not estimate the prevalence of duplicate columns or runtime,
and do not imply equal remaining neighborhoods for duplicate vertices.

Search use: none pending independent review; proposed exact orbit accounting
and duplicate-pair XOR lower bounds of8 during completion.

Reviews: none.

<a id="claim-symmetry-structure-06"></a>
## 6. Frontier rooted automorphisms have a small kernel

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-06`

Kind: local-deduction

Review state: ready

Scope: a degree18 root with x=136,...,141 and all premises of the accepted
signature-multiplicity bound; p is its number of duplicate signatures.

Dependencies: Claim 05; [accepted symmetry Claim03](d18/symmetry_reduction.md#claim-d18-symmetry-03)
and its census/frontier dependencies; restriction of rooted automorphisms to A.

Conclusion: p<=12 and the kernel of

    Aut(G)_v -> Aut(A)

has order at most2^floor(p/5)<=4. Hence

    |Aut(G)_v|<=4|Aut(A)|.

If Aut(A) is trivial then Aut(G)_v has order1,2 or4; its nontrivial elements
are products swapping at least five duplicate pairs. If p<=4 the restriction
map is injective, and an asymmetric A then forces an asymmetric rooted G.
Let K_M=(C2)^p be the duplicate-column group acting on candidate completions,
and L=K_M intersect Aut(G) the stabilizer of this completed graph. Every
fixed-M completion orbit under K_M has the bounds

| p | maximum stabilizer | minimum orbit size |
| --- | --- | --- |
| 0..4 | 1 | 2^p |
| 5..9 | 2 | 2^(p-1) |
| 10 | 4 | 256 |
| 11 | 4 | 512 |
| 12 | 4 | 1024 |

Combining sorted-column generation and the completion quotient accounts for
at least

    (24!/2^p) * 2^(p-floor(p/5)) = 24!/2^floor(p/5)
       >= 24!/4 = 155112100433309859840000

distinct B labelings of each rooted object with fixed labeled A. Equivalently,
the S_24 orbit of its whole cross matrix and B graph has at least24!/4
members. This is a label-count statement, not an elapsed-time improvement.

Proof: The accepted theorem says each complete signature occurs at most twice,
so the permutations fixing v and every A vertex are contained in the disjoint
duplicate-pair group K with p<=12. Conversely every rooted automorphism with
identity restriction to A must send a B vertex to one with the same complete
signature, and therefore lies in K. Thus its kernel is K intersect Aut(G).
Claim05 bounds this kernel. The image is a subgroup of Aut(A), proving the
rooted group bound and all special cases.
The stabilizer of the complete cross matrix and B graph under S_24 is the
same restriction kernel, so orbit-stabilizer proves the final label count.

Search use: none pending independent review; proposed symmetry certification
and orbit-size forecasting. A bound on the stabilizer must not replace the
larger group acting on candidates: the latter is still Gamma_M, whose order
can be2^p|H_M|.

Reviews: none.

<a id="claim-symmetry-structure-07"></a>
## 7. A smallest free swap component has a rigid ten-vertex support

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-07`

Kind: local-deduction

Review state: ready

Scope: five disjoint pairs in G whose simultaneous swap fixes all other
vertices and is an automorphism; each of the five pairs is an edge.
This includes a five-pair unpinned duplicate-stabilizer component through
x=139, on the accepted forced-edge premises.

Dependencies: Claims01 and02; the common-edge-neighborhood type K3/I5-free;
R(3,4)=9; the elementary regularity argument below.

Conclusion: every moved vertex has degree18. Between any two of the five
pairs the adjacency block is a perfect matching, with exactly two edges.
The ten-vertex moved support therefore has25 edges and is5-regular. For
each pair i, its common neighborhood U_i consists of exactly13 fixed
vertices and induces a4-regular K3/I5-free graph. If x in U_i meets k of
the other four moved pairs, then codegree(a_i,x)=5+k, with 0<=k<=4.

Proof: All distinguishing vertices for the endpoints of a moved pair lie
among the other eight moved vertices. Claim01 forces at least8, so every
one of these eight vertices distinguishes the endpoints. Simultaneous
swapping preserves the block between any two pairs, forcing its diagonal
entries equal and its off-diagonal entries equal. Distinguishing every
endpoint says the diagonal and off-diagonal bits differ; thus the block
is one of the two perfect matchings. Every moved vertex has four neighbors
in other pairs and one mate, giving degree5 in the support.

For pair endpoints a,b, Claim01 now gives

    8=delta_G(a,b)>=d_G(a)+d_G(b)-28>=8.

Both degrees are at least18, so each is exactly18. The exact delta formula
then gives their common-neighbor count13. No other moved vertex is adjacent
to both endpoints; hence these13 vertices are fixed and comprise U_i.

Any K3/I5-free graph U of order13 is4-regular: its neighborhood is independent
and has at most4 vertices, so its maximum degree is4. For z in U, its
12-d_U(z) nonneighbors have neither K3 nor I4, since an independent four-set
there together with z would give I5. R(3,4)=9 gives 12-d_U(z)<=8 and
d_U(z)>=4. This proves regularity directly.

Fix x in U_i. Since x is fixed by the simultaneous swap, it meets both or
neither endpoint of each moved pair. Suppose it meets k of the other four
pairs. Inside N(a_i), its neighbors consist of b_i, its four neighbors
within U_i, and one vertex from each of those k pairs. Therefore the edge
a_i x has codegree5+k, with 0<=k<=4. No fixed value of k is inferred.

Search use: none pending independent review; proposed conditional propagation
for an explicitly hypothesized five-pair automorphism. No occurrence or
nonexistence of such a support is asserted.

Reviews: none.

<a id="claim-symmetry-structure-08"></a>
## 8. A five-pair edge component excludes every second edge component

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-08`

Kind: local-deduction

Review state: ready

Scope: an unpinned five-pair component of the disjoint-swap stabilizer, and
a second disjoint unpinned component; every pair in both components is an
edge. In particular all these edge assumptions hold in x=136,...,139.

Dependencies: Claim07; the component-basis automorphisms of disjoint-swap
Claim01; no K5 or I5.

Conclusion: the two components cannot coexist. Through x139, for p<=11
the duplicate-swap stabilizer has order at most2 (and order1 for p<=4).
For p=10,11 the completion orbits therefore have size at least512,1024.
At p=12 an order4 stabilizer, if present, must have two six-pair components.
No exclusion of this six-plus-six case is asserted.

Proof: Let T be the ten-vertex support of the first component and W the
support of the second component. Their individual swaps alpha,beta commute
and fix all vertices outside their respective supports. Claim07 gives for
each pair i in T a common-neighbor graph U_i of order13, triangle-free and
4-regular. Since beta fixes both endpoints of i, it preserves U_i. Its
moved vertices there are whole edge pairs from W, say r pairs. Every fixed
vertex of beta in U_i is anticomplete to each moved pair: otherwise it sees
both endpoints of that edge and creates a triangle in U_i. Thus the moved
and fixed vertices of beta in U_i induce separate4-regular triangle-free
graphs. If r>0 the moved graph has at least8 vertices: the two ends of an
edge in a4-regular triangle-free graph have disjoint neighborhoods, whose
total size is8. The fixed graph has the odd positive order13-2r<=5, and
cannot be4-regular and triangle-free (order below5 is impossible by degree;
at5 a4-regular graph is K5). Therefore r=0.

Any adjacency between T and W would join entire pairs: invariance under
alpha gives equality across the T endpoints and under beta equality across
the W endpoints. A W pair meeting T would consequently lie in some U_i,
contradicting r=0. Hence T and W are anticomplete.

The support T contains an independent triple. To see this, take a in one
pair, whose four nonneighbors in the other T pairs are precisely the four
neighbors of its mate there, by the perfect-matching blocks in Claim07.
If T had no independent triple these four nonneighbors would form a clique;
together with the mate they would give K5. Thus alpha(T)>=3. The support W
has at least10 vertices by Claim05, so cannot be complete in a K5-free graph;
it has an independent pair. Anticompleteness between T and W now gives I5,
a contradiction.

For p<=11, two free components would each have size at least5 and one would
have size5, which has just been excluded. For p=12, two free components
avoiding size5 must both have size6; three components cannot fit. These
arguments give the claimed stabilizer and orbit bounds.

Search use: none pending independent review; proposed conditional symmetry
accounting through x139. Size-ten repeated columns at x140,141 need not be
edges, so the stronger conclusion is not transferred to those cases.

Reviews: none.

<a id="claim-symmetry-structure-09"></a>
## 9. Conditional anchor parity excludes twelve duplicate pairs at equality

Claim ID: `n43/symmetry_structure.md#claim-symmetry-structure-09`

Kind: local-deduction

Review state: ready

Scope: x=136 with the full actual frontier interface; additionally assume
the degree-eight independent-four anchor of the concurrent ready proof.

Dependencies: [ready, independently unreviewed anchor Claim03](d18/x136/five_column_compatibility.md#claim-five-columns-degree-eight-anchor);
accepted multiplicity bound; Claim08. This claim remains conditional on the
anchor proof and every external premise in that dependency chain.

Conclusion: p<=10; the duplicate kernel of Aut(G)_v has order at most2;
|Aut(G)_v|<=2|Aut(A)|. The complete B-label orbit with fixed labeled A
has size at least24!/2. There are at least four singleton complete signatures.

Proof: The anchor proof supplies four singleton anchor-signature classes,
each with exactly three B vertices. Equal complete signatures have equal
anchor signatures, so duplicate complete signatures cannot cross these
classes. Since every complete signature has multiplicity at most2, each
odd class of size3 contains at least one singleton complete signature.
The four classes are disjoint, giving at least4 singleton complete signatures.
Thus 24-2p>=4 and p<=10. Claim08 bounds the duplicate stabilizer by2
because all duplicate pairs at x136 are edges. The restriction argument
of Claim06 bounds rooted automorphisms, and orbit-stabilizer for S_24
proves the label-orbit size.

Search use: none pending independent review of this claim and the anchor
chain; proposed symmetry accounting only. This deduction does not promote
the concurrent r1 exclusion or anchor proof to accepted status.

Reviews: none.

## Author audit, provenance, and limits

Claims01 and02 were rederived using complement degrees and fixed-vertex
incidences. Every module table row uses the module's actual clique and
independence numbers, with homogeneous modules handled separately and the
proper-module condition used when both outside cells are empty. The two
homogeneous cases in Claim04 give the upper bound23, which excludes order24.
Claim06 distinguishes the
candidate action Gamma_M from the stabilizer of its completed edge vector.

These statements do not assert asymmetry of all candidates, eliminate all
large-support automorphisms, impose primeness on A, close a Ramsey branch,
or establish novelty. Pair separation is logically implied by existing
degree/codegree bounds, but exposes their useful support and orbit consequences.

Base revision: `7ebbef265ef9b55746b798b337b86e4fd6140045`. Exact input SHA-256:

| Input | SHA-256 |
| --- | --- |
| docs/mathematical_baseline.md | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
| n43/d18/symmetry_reduction.md | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| docs/general_theorems/symmetry_quotients.md | `fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f` |
| docs/workflow.md | `51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2` |
| n43/d18/x136/five_column_compatibility.md | `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b` |
