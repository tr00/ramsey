# Independent review of pair separation, modules, and small swap components

Date: 2026-10-15. Task: `symmetry-audit-20261015`.

Author: Codex coordinator `/root`, the `symmetry-hour-20261015` author.
Independent reviewer: Codex agent `/root/audit_structure_clean`, token
`structure_auditor`. The reviewer did not edit any proof, shared navigation,
WORK row, or Git index, and spawned no further agents. This new sibling
review is the reviewer's only owned output.

Claims assigned: [symmetry_structure.md](symmetry_structure.md), stable anchors
`claim-symmetry-structure-01` through `-04`, and `-07` through `-09`.
General disjoint-swap Claims01-02 and structure Claims05-06 were independently
reconstructed as required dependencies, rather than inferred from labels.

Reviewed working-tree base: `249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`.
The proof is uncommitted, so exact SHA-256 identifies the reviewed revision.

| Proof stage | SHA-256 | Outcome |
| --- | --- | --- |
| Author handoff, initially read before coordinator revisions | `6152574608e34c427c0af0da7eee210969034ece5a2055e4622e0dd0bb385b58` | Claim02 wording needs nonidentity qualification; other assigned mathematics passes |
| Explicit K_M candidate action and L completed stabilizer in Claim06 | `c509fc6eb97a6ef209ae26fa6677e0b4d6cf320412f5f0772e2eeb457bdf454a` | Claim02 qualification still required; Claim06 dependency clarified |
| Claim02 nonidentity qualification | `0a4a6cc21c2ad531f82c8f1a6f9370959f32566816f24e3b9334ded0c26848e2` | Qualification resolves initial finding |
| Final proposed proof, reread in full; Claim09 strengthened | `ed61d3fd5b87aac35e6bfb41c31aaaf55ff34ed57e72a03ac0cfcba857b49062` | All seven assigned claims accepted on renewed review |

**Outcome: accepted for Claims01-04 and07-09 at the final proof hash above,
on the stated external premises and exact scopes.** No unresolved
mathematical gap remains in these assigned claims. Acceptance does not cover
an implementation, a certified exhaustion, or a novelty claim. Mathematical
changes require renewed review; later metadata integration must preserve this
exact provenance.

## Dependencies, exact revisions, and external premises

The reviewer read AGENTS.md, docs/workflow.md, WORK.md, results.md, the n43,
d18 and x136 READMEs, frontier_band.md, small_columns.md, r4/exclusion.md,
pivot_classes.md, and docs/reproducibility.md. Relevant mathematical and review
dependencies were read at these versions:

| Dependency | SHA-256 | Status and use |
| --- | --- | --- |
| docs/general_theorems/disjoint_swap_stabilizers.md | `bdbf5f1aabd35cfb1dec4d8ffa24dfb260a227d0561854c8dd652975161b7c46` | General Claims01-02 reconstructed below; separate swap audit also accepts them |
| docs/general_theorems/review_disjoint_swap_stabilizers_20261015_swap_auditor.md | `67a504cfb84ed14ae85214200898c0f8ddf9c8a2fc4b48632fb0a62b0202eafd` | Read review of swaps and structure05-06 at c509 revision; final structure dependencies independently reread here |
| n43/d18/symmetry_reduction.md | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` | Accepted multiplicity/forced-edge Claim03; required reasoning rederived |
| n43/d18/review_d18_symmetry_20261014_pivot.md | `b1c63e0bc08605ca9378221f1616e27c6705a71810ea01e22782416f8f60acf8` | Prior exact-revision acceptance and scope restrictions inspected |
| n43/d18/frontier_band.md | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` | Frontier identities and four-transversal premises |
| n43/d18/x136/small_columns.md | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` | Small-column budgets used by multiplicity |
| n43/d18/transversal_four.md | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` | Scope/provenance of transversal dependency |
| n43/d18/x136/r2/low_excess_columns.md | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` | Anchor review's unrestricted four-transversal degree floor |
| n43/d18/x136/five_column_compatibility.md, integrated file | `2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e` | Integration banner accepts all four claims; only Claim03 anchor needed here |
| Same anchor proof, accepted body before banner | `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b` | Exact accepted body reproduced by stripping only the banner |
| n43/d18/x136/review_five_column_compatibility_20261015_independent.md | `c6b7e29afaa61a1be112b1ecb47938c7be7452fe6eff96d09564e2834f19a14f` | All-four-claim independent acceptance and precise external premises inspected |
| docs/mathematical_baseline.md | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` | Published small Ramsey values and degree derivation |
| docs/workflow.md | `51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2` | Exact-revision independent review requirements |
| docs/reproducibility.md | `ee57ae7e71a839fffd48c8e21323a845aef972a0295021e46fb04de618fc8de9` | Certificate and search-use limits |

The small Ramsey values R(2,j)=j, R(3,3)=6, R(3,4)=9, R(3,5)=14,
R(4,4)=18, and R(4,5)=25 remain external literature premises. No published
Ramsey certificate was replayed. The baseline retains the source links.

The frontier multiplicity chain additionally uses the published upper edge
extremum85 for (4,5,18), lower edge extremum50 for (4,4,15), and lower edge
extremum41 for (4,4,14). Claim09 inherits the accepted anchor's upper79 for
(4,5,17), upper50 for (4,4,14), and Turan premise as well. Their citations
and precise uses were read in the source notes and independent anchor review;
catalogues and their completeness computations were not recertified.
The contextual e(B)<=160 bound is not needed for these group conclusions.

The structure introduction's sentence that only Claim06 inherits frontier
census premises should be read as historical: the frontier applications of
Claims07-08 use accepted multiplicity/forced-edge premises, and Claim09 also
inherits the anchor chain. Their own scopes/dependency sections record these
conditions. Likewise Claim09's ready/unreviewed anchor labels describe the
author stage; the inspected integration banner and independent review resolve
current dependency status. These historical labels are not a mathematical
obstruction to acceptance on the stated chain.

## Claim01: pair separation

Accepted. For an edge uw, a triangle in its common neighborhood would make
K5 with u,w. The common neighborhood remains I5-free as an induced subgraph
of G, so its order c is at most13 by R(3,5)=14. In the degree sum, the edge
uw contributes twice, and each common third neighbor contributes twice.
All remaining third-neighbor incidences correspond exactly to distinguishing
vertices. Thus delta=d(u)+d(w)-2-2c, giving delta>=d(u)+d(w)-28>=8.

For a nonedge, complement G is again an order43 K5/I5-free graph with degrees
42-d(u),42-d(w) in18..24. Complementing both incidences preserves whether
a third vertex distinguishes the endpoints. Applying the edge formula there
gives delta>=84-d(u)-d(w)-28=56-d(u)-d(w)>=8. Endpoint exclusions and both
directions of the degree bound have been checked.

For a partial-state application, counting every third vertex still capable
of differing yields an upper bound on the eventual delta. If that upper bound
is below the applicable proved lower bound for fixed pair status and degree
targets, rejection is valid. A tight or computable upper bound need not be
exact; an underestimate would be unsafe. XOR variables must represent the
two actual incidences with full equivalence. No implementation is reviewed.

## Claim02: support, twins, and involution parity

Accepted on renewed review. If pi(u)=w and x is fixed, incidence preservation
gives G(xu)=G(xw). Every distinguishing vertex is therefore in the support.
The definition of delta excludes u,w; both endpoints are moved, because if
w were fixed then u and w would have the same image w, contradicting
bijectivity. Hence support>=delta+2>=10, including the sharper pair-dependent
bounds. A true or false twin pair would have delta=0 and is impossible.
For an involution of order two the support has size2t, so t>=5. A fixed
vertex sees both or neither endpoint of each swapped pair, proving even
incidence into the moved set.

Initial correction: the original sentence excluding a permutation that
interchanges 'at most four disjoint pairs' also literally included the
identity with zero swaps. The reviewer requested a nonidentity qualification.
The final text supplies it; a nonidentity product of at most four swaps has
support<=8 and cannot be an automorphism. The term involution here has its
standard order-two meaning; the identity is excluded. The underlying support
proof was valid before this correction. The restriction applies to actual
automorphisms, not relabelings between distinct completed candidates.

## Claim03: complete module table in K5/I5-free graphs

Accepted. Let S be a proper nonempty module, w=omega(S), a=alpha(S). Every
outside vertex belongs to U complete to S or W anticomplete to S, with no
third possibility. In U, a (5-w)-clique would join a maximum w-clique in S
to make K5. In W, a (5-a)-independent set would join a maximum independent
a-set in S to make I5. Internal ambient prohibitions are inherited. Therefore
the three Ramsey order bounds are exactly

    |S|<=R(w+1,a+1)-1,
    |U|<=R(5-w,5)-1,
    |W|<=R(5,5-a)-1,

except that w=4 forces U empty and a=4 forces W empty. These emptiness
conclusions need no undefined or unavailable Ramsey number.

Every nonhomogeneous row was independently evaluated:

| (w,a) | Bounds (S,U,W) | Total |
| --- | --- | --- |
| (2,2) | (5,13,13) |31|
| (2,3) | (8,13,4) |25|
| (2,4) | (13,13,0) |26|
| (3,2) | (8,4,13) |25|
| (3,3) | (17,4,4) |25|
| (3,4) | (24,4,0) |28|
| (4,2) | (13,0,13) |26|
| (4,3) | (24,0,4) |28|
| (4,4) | U=W=empty | impossible when S is proper |

When w=1, S is independent, so s=a in2,3,4 for a nontrivial module. The
bounds on U are24 and on W are13,4,0, yielding39,31,28. When a=1,
complementation interchanges these cases and gives the same totals. If
w=a=1 then s=1: any two distinct vertices would be either an edge or a
nonedge and force one of w,a to be at least2. These cases exhaust all
1<=w,a<=4, without invoking the unknown R(5,5) for the forbidden proper
(4,4) case. Every graph with a proper nontrivial module has order<=39,
so an order43 candidate is prime. The outside partition imposes no
assumption on edges between U and W; ignoring their further constraints
only weakens a valid upper bound.

## Claim04: complete module table in K5/I4-free graphs

Accepted. The same reasoning now has1<=w<=4 and1<=a<=3, and the outside
bounds become U of type K_(5-w)/I4-free and W of type K5/I_(4-a)-free.
The complete nonhomogeneous table independently gives:

| (w,a) | Bounds (S,U,W) | Total |
| --- | --- | --- |
| (2,2) | (5,8,4) |17|
| (2,3) | (8,8,0) |16|
| (3,2) | (8,3,4) |15|
| (3,3) | (17,3,0) |20|
| (4,2) | (13,0,4) |17|
| (4,3) | U=W=empty | impossible when S is proper |

Independent S with size a=2,3 has U<=17 and W<=4,0, yielding23,20.
Clique S with size w=2,3,4 has U<=8,3,0 and W<=13, yielding23,19,17.
The singleton case is harmless and all other parameter possibilities have
been exhausted. The maximum is23, so order24 K5/I4-free B is prime.
Complementation preserves modules and yields the order24 K4/I5-free dual.
No conclusion of primeness for order18 A follows or is asserted. In
particular I4-freeness is used on B, never transferred to A.

## Required dependencies: disjoint swaps and structure05-06

For a fixed vertex and pair i, unequal endpoint-incidence bits force its
swap bit to zero. Between pairs i,j, row/column swaps form F_2^2. Any block
stabilizer is a subgroup of that four-element group. Its only possibilities
are the full group, the three order-two subgroups, and the trivial group;
these impose respectively no equation, one pinned bit, equality of the two
bits, or both bits pinned. This derives the general note's five cases.
Internal pair edges and fixed/fixed edges are invariant. These local tests
therefore cover all edges, and their intersection is exactly the stabilizer.

An equality component is constant; a mark pins the entire component to zero.
The indicator of any unmarked component is an actual stabilizer vector, not
a merely hypothetical product of swaps. A component with w pairs fixes all
vertices outside its2w-vertex support. For any of its pairs, all distinguishing
vertices lie among the2(w-1) other support endpoints. Hence delta>=8 forces
w>=5. Unmarked components have disjoint pair-index supports, so their number
t<=floor(p/5). Stabilizer order2^t and orbit size2^(p-t) prove structure05.
The same argument for general D gives w>=1+ceil(D/2), confirming the general
note's stronger parameterized claim. Duplicate columns have equal incidences
to A and v, so whole-graph K orbits correspond exactly to B-edge completion
orbits at fixed cross matrix. Stored data must remain invariant under K or be
transported consistently.

For accepted d18 multiplicity Claim03, x=136+k,0<=k<=5 gives q<=2 via
k=2q+E with nonnegative q,E. Its accepted four-transversal and actual
size-four edge bounds give |C|>=4 and e_A(C)>=3-q>=1 at size4. The five
small-column s bounds substitute in H=2r+s-8+k to give H<=4+k<=9.
Three copies of size>=10 spend at least12 in H, impossible. At size<=9,
any two copies are adjacent: a nonedge would need column union>=10, by
R(4,3)=9 on the common zero-set. Their common signature has an edge by
the size-four bound or I5-freeness at size>=5. Three adjacent copies plus
that edge would give K5. Thus multiplicity<=2. For a duplicated size c>=7,
2(c-6)<=H<=k+4 implies c<=6+floor((k+4)/2)<=9 at k<=3, proving forced
edges through x139. Smaller duplicated signatures are already forced edges.
At k=4,5 size10 repeats need not be edges, so the stronger component
consequences must not be transferred there.

Restriction rho:Aut(G)_v->Aut(A) is a homomorphism because a fixed root
preserves A and B. Its kernel maps each B vertex within its complete
signature class. With multiplicities<=2 it is exactly
L=K_M intersect Aut(G), where K_M=(C2)^p acts on candidate completions.
General swap bounds give |L|<=2^floor(p/5)<=4, and the image subgroup of
Aut(A) gives structure06's rooted bound. Its table is orbit-stabilizer
under K_M, not under L, whose orbit of completed G is a singleton. The
coordinator's clarification resolves the initial separate swap review's
ambiguity. S_24 stabilizing both the cross matrix and B graph has exactly
the same L, so the B-label orbit size is24!/|L|. Direct arithmetic confirms
24!/4=155112100433309859840000. This accounts for actual labeled graph
orbits, and supplies no measured runtime gain.

## Claim07: rigid edge-pair support and common-neighbor regularity

Accepted. Let alpha swap five disjoint edge pairs and fix every other
vertex. For any pair i, fixed vertices cannot distinguish its endpoints,
and the eight endpoints of the other four pairs are the only remaining
possible distinguishers. Claim01 gives delta>=8, so all eight distinguish.
The2x2 block between i,j is invariant under simultaneous row and column
interchange, hence has shape [[d,e],[e,d]]. Every endpoint of j distinguishes
i, so d!=e. The block is exactly one of the two perfect matchings. This
holds for all ten unordered pair-pairs. Each vertex has its mate and one
neighbor in each other pair, so the support is5-regular with5+10*2=25 edges.

For each edge pair a,b, delta=8 and Claim01 give8>=d(a)+d(b)-28>=8.
Both degrees>=18 force d(a)=d(b)=18. The exact delta formula gives common
neighborhood order13. Matching blocks contain no moved vertex adjacent to
both endpoints, so that common neighborhood U_i consists only of fixed
vertices. It is K3/I5-free by the original edge obstruction.

In any triangle-free I5-free graph U on13 vertices, each neighborhood is
independent and therefore has size<=4. Each vertex z has12-d_U(z)
nonneighbors; these induce a K3/I4-free graph, because an I4 there with z
would give I5 in U. By R(3,4)=9 their order<=8, giving d_U(z)>=4.
Thus U is4-regular. The I4-freeness belongs to this antineighborhood in U,
not to A.

Fix x in U_i. N_G(a_i) is precisely its mate b_i, four support neighbors,
and the13 vertices of U_i: their counts sum to18, already the full degree.
The common neighbors of a_i,x are b_i, the four U_i-neighbors of x, and
one support endpoint from every other moved pair met by x. Since x is
fixed by alpha it meets both or neither endpoint of each pair; if it meets
k of the other four pairs this gives codegree=1+4+k=5+k,0<=k<=4.
No universal fixed k is imposed. All conclusions are conditional on the
specified actual automorphism and internal edge status.

## Claim08: no second unmarked edge-pair component

Accepted. Let T be the ten moved vertices of a five-pair free component
and W the support of another disjoint free component. The component
indicators from the general swap theorem supply individual automorphisms
alpha,beta, each fixing all vertices outside its own support; this is the
needed stronger hypothesis than one global simultaneous swap of both.

For a pair i in T, beta fixes its endpoints and therefore preserves U_i.
Every beta orbit of size two inside U_i is an entire edge pair from W.
For a beta-fixed vertex x in U_i, adjacency to one member of such an edge
pair means adjacency to both, creating a triangle in U_i. Consequently
the beta-moved and beta-fixed vertices of U_i are anticomplete. Both parts
inherit degree4 from U_i. If the moved part has2r>0 vertices, it contains
an internal edge. For an edge pq in a triangle-free4-regular graph,
N(p) and N(q) are disjoint, including their opposite endpoints; each has
four vertices, so the moved part has order>=8. Its complementary fixed
part has odd positive order13-2r<=5 (and2r<=12 because13 is odd). Below
order5 degree4 is impossible; at order5 degree4 forces K5 and violates
triangle-freeness. Thus r=0 for each i.

Any edge between a T pair and W pair propagates under the separate alpha
and beta swaps to all four block entries. That whole W pair would then be
in U_i, contradicting r=0. Hence T,W are anticomplete.

The support T has an independent triple: for any a in one pair, its four
nonneighbors in the other four T pairs are exactly the four neighbors of
its mate there. If those four contained no nonedge, they and the mate
would form K5. Therefore some two of them are nonadjacent and form an
independent triple with a. W has at least ten vertices because every free
component has at least five pairs; K5-freeness prevents W being complete,
so W contains an independent pair. Across anticomplete T,W these produce
I5, the required contradiction. This proof covers a second component of
any allowable size, not only another five-pair component.

With p<=11, two free components each have size>=5 and at least one must
have size5, now excluded; three cannot fit. Thus |L|<=2 and K_M orbits
have size>=2^(p-1), giving512,1024 at p=10,11. For p=12, an order4
stabilizer has exactly two free components; since size5 is excluded, both
have size6. The possible six-plus-six configuration remains unresolved.
Forced-edge applicability is exactly x136..139, and includes all required
frontier premises. There is no corresponding conclusion for size-ten
nonedge repeats at x140,141.

## Claim09: renewed stronger anchor parity

Accepted at the final proposed proof hash. The accepted anchor Claim03
supplies an actual independent four-set I of degree-eight A vertices and
four exact singleton-I-signature classes, one for each anchor vertex,
each containing exactly three B vertices. A complete signature C_y records
all18 incidences into A, so equality of complete signatures necessarily
implies equality of signatures restricted to I. A duplicate complete
signature cannot have one endpoint inside such a class and the other
outside it, and cannot cross two different singleton classes.

Within a singleton class of size3, partition into complete signatures.
Each part has size1 or2 by accepted multiplicity. An odd total of3 cannot
be made entirely from parts of size2. Thus each class contains at least
one complete signature of multiplicity1. The four classes are disjoint,
so at least four distinct singleton complete signatures exist. Across all
24 B vertices, p doubled signatures use2p occurrences and all others
are singletons. Therefore24-2p>=4 and p<=10. This strengthens the old
valid odd-cross-row bound p<=11 without imposing any new anchor assumption.

All duplicate pairs at x136 are forced edges. Claim08 thus gives |L|<=2
at p<=10. The same restriction homomorphism used in Claim06 gives
|Aut(G)_v|<=2|Aut(A)|, and the S_24 stabilizer of the whole cross matrix
and B graph is L. Its orbit consequently has size>=24!/2, independently
checked as310224200866619719680000. These deductions concern the actual
equality-frontier interface and its external premise chain; they are not
an isolated theorem for every85-edge K4/I5-free A.

The initial p<=11/two-singleton version was mathematically valid. The
reviewer suggested using all four odd singleton-anchor classes; the author
implemented the stronger p<=10/four-singleton version, which was then
reread and independently checked above. The anchor acceptance precedes
this review; this review neither newly proves nor promotes its r1 closure.

## Claim-by-claim outcomes and permitted use

| Assigned claim | Final outcome | Permitted mathematical use after integration |
| --- | --- | --- |
|01|accepted|Pair-distinction propagation with correct incidence upper bounds and fixed pair/degree hypotheses|
|02|accepted after nonidentity correction|Reject impossible actual automorphism supports; involution parity propagation in explicit symmetry branches|
|03|accepted|Filter completed G, or a module guaranteed to survive every extension; no rejection solely from a partial module|
|04|accepted|Filter completed order24 K5/I4-free B and its complement; no primeness assumption on order18 A|
|07|accepted|Conditional matching, degree, common-neighbor and codegree propagation for the specified five edge-pair automorphism|
|08|accepted|Conditional duplicate-stabilizer and orbit accounting through x139, with forced-edge premises|
|09|accepted after stronger exact revision|At x136 propagate p<=10/four singleton signatures and use rooted/orbit bounds on the accepted anchor chain|

General swap Claims01-02 and structure05-06 were checked as dependencies
and found applicable; their dedicated independent review remains the primary
review for those claims. This review does not alter their proof files or
their separate outcome history.

Both module tables, all homogeneous cases, degree/support edge counts,
24! orbit arithmetic, and p=10,11 orbit values were also checked with
existing Python3 standard-library integer arithmetic. Every assertion
passed. This was finite arithmetic, not graph generation or enumeration.
Anchor banner removal was checked with standard-library SHA-256 and
reproduced the exact accepted body hash. Shell tools only read local files,
Git revision/status, and hashes.

Limits: no SAT solver, checker, theorem prover, canonicalizer, graph search,
download, installation, external literature retrieval, catalogue completeness
audit, construction verification, formal certificate, staging, or commit.
No branch closure or determination of R(5,5) follows from these claims.
No realized orbit extreme or runtime reduction is asserted. Future exhaustive
work must supply full generation/coverage and independently checked
permutation omissions, in addition to applicable nonexistence certificates.
