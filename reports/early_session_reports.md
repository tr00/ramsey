# Early session reports (2026-10-13 .. 2026-10-14)

Consolidated 2026-10-18 from thirteen standalone session summaries that
predated the dated-report convention (see
[consolidation report](2026-10-18-markdown-consolidation.md)). Their content
is preserved as written; only headers, repeated per-file disclaimers, and
absolute `/scratch/ramsey` pointers were merged or converted to relative
links. No proof text was affected. Sessions were pure mathematics unless
noted: no graph enumeration, solver, catalogue download, or installation.

Original filenames: `first_report.md`, `mathematical_phase_1.md`,
`lemma_phase_2.md`, `proof_review_2026_10_13.md`,
`transversal_five_status.md`, `upper_bound_method_review.md`,
`frontier_band.md`, `degree18_pivot_classes.md`,
`degree18_excess_bounds.md`, `degree18_cliques_augmentation.md`,
`degree18_small_columns.md`, `degree18_r4_exclusion.md`.

These are historical records. Several statements below were later
superseded; the current status of every branch is in the
[reduction index](../n43/reductions.md) and the
[results dashboard](../results.md).

<a id="first-report"></a>
## First setup report (2026-10-13)

Requested delivery: approximately 16:53 CEST. Scope: setup and plan only;
the solve attempt had not started.

The workspace was ready. No package, solver, graph catalogue, source
archive, or other tool was downloaded or installed. The peer-reviewed result
was `43 <= R(5,5) <= 46`; the best first decision target is order 43. If no
`(5,5)`-Ramsey graph exists there, Exoo's established 42-vertex witness
gives `R(5,5)=43`; if one exists, it is a directly checkable new
lower-bound witness and the search moves to 44.

Setup completed:

- Recorded sources, proof obligations, degree/cell constraints, and the
  warning that the 656 known order-42 graphs are not a proved complete
  census.
- Inventoried the host: 16 CPU threads, 62 GiB RAM, and 83 GiB free scratch.
- Implemented a dependency-free graph checker and direct DIMACS CNF
  generator.
- Fixed deterministic vertex, edge-variable, subset, and clause orderings.
- Added artifact/provenance rules for witnesses, CNFs, cube trees, solver
  logs, graph catalogues, and SAT proof certificates.
- Passed 9 baseline tests in 0.422 seconds, exhausting all 32,768 labeled
  graphs on 6 vertices to confirm the `R(3,3)<=6` checker path, verifying
  the 5-cycle witness at order 5, and comparing CNF semantics with graph
  semantics on every graph of order 5.
- Confirmed the direct `R(5,5,43)` dimensions without generating it:
  903 variables and 1,925,196 ten-literal clauses.

Structural starting point: for a candidate graph `G` of order 43, every
degree lies in `18..24`; the handshake lemma guarantees an even-degree
vertex; after complementing, a pivot of degree 18 or 20 can be chosen.
Degree 18 gives a 24-vertex `(5,4)` antineighborhood whose complement
belongs to the complete published collection of 352,366 `(4,5,24)` graphs
(the more concrete catalogue branch). Degree 20 needs stronger interface
constraints, generalized templates, or certified SAT splitting; a raw
product of catalogues is infeasible. This reduction does not make either
branch small: the published order-46 proof consumed tens of CPU-years, and
its authors state that the same method does not scale without new ideas.

Proposed solve program after feedback:

1. Validate an external solver and its proof checker on the existing tiny
   encodings, then on `R(3,4)=9`.
2. Establish a simple direct-CNF baseline for order 43 and collect solver
   behavior; retain no non-checkable timeout as evidence.
3. Add proved redundant constraints: degree bounds, common-neighbor bounds,
   and selected counting identities; test each addition independently.
4. Split on the degree-18 and degree-20 pivot branches. Use canonical labels
   only to guide and compress search; anchor final negative evidence to
   exhaustive cubes plus checkable SAT certificates.
5. Run parallel theory work on degree-sequence/counting reductions and
   equality cases for critical `(3,5)` and `(4,4)` cells.
6. If order 43 is SAT, verify and publish the witness format, then repeat at
   44. If UNSAT, independently replay all cube coverage and proof
   certificates.

The first research objective was a measured order-43 pilot identifying
whether direct SAT, the degree-18 catalogue branch, or a new theoretical
reduction has the best scaling. Tools requested before serious exhaustive
work: a proof-logging SAT solver (CaDiCaL/Kissat with DRAT or FRAT output),
a compatible independent proof checker/converter (LRAT-oriented), and
nauty/Traces for canonical labeling; the 83 GiB free-space limit was flagged
as possibly more restrictive than CPU or RAM once proof logging begins.

<a id="mathematical-phase-1"></a>
## Mathematical Phase I report (2026-10-13)

No computation or search was performed; the global bound remained
`43 <= R(5,5) <= 46`.

Best rigorous reductions obtained:

1. **Canonical complement split.** Choose the lexicographically smaller
   sorted degree sequence between `G` and its complement. A minimum-degree
   pivot then has degree 18, 19, or 20, with paired degree counts satisfying
   `n18>n24`, `n19>n23`, or `n20>n22`.
2. **Two-size parity split.** Without a minimum-pivot requirement, the
   handshake lemma and complementation reduce an arbitrary pivot to degree
   18 or 20.
3. **Exact interface criterion.** After fixing `A=N(v)` and `B=M(v)`,
   validity of the cross matrix is exactly the absence of all-one clique
   rectangles and all-zero independent-set rectangles whose side sizes sum
   to 5.
4. **Four-bit anchor signatures.** Relative to any `I4` in `A`, all column
   signatures are nonempty and satisfy Hall's condition on every
   independent set of `B`; relative to any `K4` in `B`, all row
   missing-signatures are nonempty and satisfy the dual Hall condition on
   every clique of `A`. Consequences: `e(I4,B)>=2|B|-12` and
   `e(A,K4)<=2|A|+12`, with a rigid equality pattern of four triangles or
   four independent triples.
5. **Quadratic cross-edge pruning.** Four catalogue-free inequalities bind
   cross-edge and cross-nonedge counts to the two internal edge counts,
   from pair intersections, Turan, and Cauchy-Schwarz; recorded in
   [theory phase I](../docs/theory_phase_1.md).
6. **Degree-18 corridor.** Admitting the published `(4,5)` edge extrema:
   `50<=a<=85`, `144<=b<=160`, and
   `max(306-2a,432-2b)<=x<=min(306,414-2a,576-2b)`; in particular `x>=136`.
   A separate catalogue-free perfect-matching argument gave the weaker
   independent bound `x>=120`.
7. **Normalized degree-20 parametrization.** Every degree sequence is
   represented by integers `j,t>=0`, `j+t<=21`:
   `n20=t+2j+1`, `n21=42-2(j+t)`, `n22=t`, `e(G)=451-j`; for a degree-20
   pivot and neighbor-excess sum `s`: `b=a+51-j-s`, `x=380+s-2a`,
   `max(68,66+j+s)<=a<=min(100,92+j+s)`, `j+s<=34`.
8. **Strongly regular branch excluded.** The parameter equation, local
   codegree bounds, eigenvalue discriminants, and trace condition exclude
   every strongly regular graph on 43 vertices satisfying the Ramsey
   constraints; a regular candidate would need at least four adjacency
   eigenvalues.

Assessment: the strongest immediately useful development was the
interface-signature language (exact subset signatures; pair and triple
intersection constraints; forced adjacencies between signature classes; a
residual `Aut(A) x Aut(B)` action; anchored Hall and incidence
inequalities), suitable for further hand proofs and a later canonical
interface generator. The inequalities did not exclude either pivot branch;
both the 20-regular degree sequence and the one-degree-20/42-degree-21
sequence survive.

Recommended next targets: use the degree-18 `a,b,x` corridor on the 24
column signatures; prove a regular-to-strongly-regular rigidity lemma;
strengthen the anchored Hall bounds via fractional matchings/covers;
establish a sharp rooted inequality for
`h_v=e(G[N(v)])+e(bar(G[M(v)]))`; classify equality and near-equality cases
of the four-bit anchor bounds. Detailed proofs, caveats, and source links:
[theory phase I](../docs/theory_phase_1.md).

<a id="lemma-phase-2"></a>
## Lemma Phase II report (2026-10-13)

No computational exploration was performed; the proposed next lemmas were
attacked and independently audited.

Main result: at the sharp degree-18 frontier, with `F=complement G[N(v)]`
having 18 vertices, 68 edges, and independence number at most 3, the
published census fact that every 15-vertex `(4,4)`-Ramsey graph has at least
50 edges proves that every `K4` transversal of `F` has size at least 4:
deleting a hypothetical three-vertex transversal leaves at least 50 edges,
while the three deleted vertices have at least 21 edges back into the
remainder, forcing at least 71 edges and contradicting 68. Therefore every
cross column in the `x=136` branch has at least four vertices, and the
previous 46/47-edge attachment cases are all impossible. Detailed proof:
[transversal four](../n43/d18/transversal_four.md).

Other Phase II results:

- `x=e(A,B)>=136`; equality forces `e(A)=85` and every `A`-vertex to have
  global degree 18.
- Simultaneous equality in the `I4` and `K4` anchor bounds forces the
  anchored `4 x 4` block to be `C8` or two disjoint `C4`s.
- Exact rooted degree-energy identities were proved.
- In the 18-regular corner, edge codegrees are at least 2 and nonedge
  codegrees at least 3.

Rejected: anchor equality is not itself contradictory; local Ramsey
constraints do not guarantee fractional perfect anchor designs; regularity
does not presently imply strong regularity; cardinal and pair-intersection
constraints alone do not eliminate the first nonedge-codegree case.
Recommended continuation: raise the transversal number from 4 to 5 via
structure of a four-vertex transversal and its 14-vertex remainder. Full
Phase II context: [lemma phase II](../docs/lemma_phase_2.md).

<a id="proof-review-2026-10-13"></a>
## Proof review status (2026-10-13)

Reviewed all research notes, reports, the reference checker/CNF generator,
and its tests; no computational exploration or external acquisition. Two
material gaps were found: the 45-edge 15-vertex core exclusion incorrectly
infers equality from compatible one-sided triangle bounds; and the
normalized minimum-degree-18/19 split omits tied outer degree counts.
Prior statements claiming only three attachment cases or strict first-pair
inequalities should not be used as complete reductions. The exact interface
framework, degree-18 frontier identity, tau>=3 lemma, anchor rigidity,
rooted identities, and normalized minimum-degree-20 formulas survived
mathematical review, conditional on their external numerical premises;
several proof sketches and claimed countermodels needed fuller evidence.
Recommended joint multi-column interface compatibility, a bounded band
above `x=136`, safe symmetry coverage, and explicit coverage of the
remaining pivot branches; deprioritize the isolated 15-vertex attachment
problem. Detailed audit and corrected case coverage:
[proof review](../docs/proof_review_2026_10_13.md).

<a id="transversal-five-status"></a>
## Transversal-five attempt status (2026-10-13)

The attempted strengthening `tau_K4(F)>=5` was not proved.

Progress: a hypothetical four-vertex transversal leaves a 14-vertex
`(4,4)`-Ramsey core with 41, 42, or 43 edges; the 43-edge core is
rigorously impossible; in the complementary 85-edge graph only four
attachment families remain (one 49-edge `C4` family and three 50-edge
types); triangle-deficit arguments eliminate all 48-edge cases and the
49-edge diamond case; paw and diamond families have tight, explicitly
recorded intersection structures; no explicit counterexample was found.

Caveat: an intermediate argument incorrectly treated common nonneighbors of
a nonedge as a clique; the valid conclusion is only that their independence
number is at most 2, and the associated apparent exclusion was discarded.
Recommended continuation: apply `K4` saturation of the extremal 85-edge
graph to the four remaining families, or request permission to inspect the
74 published extremal `(4,5,18)` graphs and independently verify their
transversal numbers. Full details:
[transversal five attempt](../n43/d18/x136/transversal_five_attempt.md).

<a id="frontier-band"></a>
## Frontier band report (2026-10-13)

Extended `x=136` to `x=136+k` by the exact budget `k=2q+E`, where `q=85-e(A)`
and `E` is A degree excess above 18; recorded all cases through `x=142` and
exact B excess and parity budgets. The published census input already in
[transversal four](../n43/d18/transversal_four.md) extends `tau>=4`
uniformly through `x=141`, and to every higher-x subcase with `e(A)>=83`.
Derived independent-four anchor defect identities and a bounded attachment
budget for size-four columns; such columns form a clique in `B`, so there
are at most four, and every size-four/size-five pair also forces adjacency.
No frontier value or global Ramsey bound was improved. Details and proof
premises: [frontier band](../n43/d18/frontier_band.md).

<a id="degree18-pivot-classes"></a>
## Degree-18 pivot classification report (2026-10-14)

Mathematical deductions with a small exact rational-arithmetic table check.
Classified numerical degree-18 root profiles by neighborhood deficit `q` and
neighbor-degree multiplicities. Global degree excess `W` fixes
`b=148+W/2-q-E` and `x=136+2q+E`; census bounds give
`max(0,W/2-12-E)<=q<=min(35,W/2+4-E)`.

Proved every `x=136..138` pivot has an adjacent degree-18 root with codegree
at most nine; throughout `x=136..141` at most ten suffices; the general
profile-dependent formula uses `E(4,5,17)=79` from the reviewed paper. For
`W=0,2,4,6,8,10`, every degree-18 root has respectively a degree-18
neighbor with overlap at most 9,9,10,11,12,12, and both neighborhoods have
at least `81-W/2` edges — complete conditional pointed-pair reductions.
Weighted counts of excess incident to degree-18 roots additionally force
adjacent roots with at least 81 neighborhood edges for `W=2` or 4, and at
least 80 for `W=6`; those pairs need not coincide with the small-overlap
pairs.

The unrestricted degree-18 branch was not reduced to small `k` or small
`W`; the excess identity alone loses `q` after substituting the degree
profiles, so additional structural inequalities are needed. No branch was
excluded. Detailed proofs, conditions and case tables:
[pivot classes](../n43/d18/pivot_classes.md).

<a id="degree18-excess-bounds"></a>
## Conditional degree-excess bounds report (2026-10-14)

Mathematical deductions with exact arithmetic verification; internally
audited, not an order-43 exclusion. With `W=sum_z(d(z)-18)`, `h` the number
of vertices of degree above 18, and `E_v` the total excess adjacent to a
degree-18 root, the published neighborhood edge bounds give
`E_v+q_v<=W/2+4`.

Proved a cut obstruction: if every degree-18 root satisfies `q_v>=Q`, each
has at most `t=h-ceil((W/2-4+Q)/6)` higher-degree neighbors, while the
higher-degree vertices require at least `18h+W-2floor(3h^2/8)` edges back
to the `43-h` roots; this cannot exceed `(43-h)min(h,18,t)`. Consequently,
at exact `h=2,4,6,8,10`, the respective `W` upper bounds are 8,20,32,44,58,
and every degree-18 root has `E_v` at most 8,14,20,26,33. If every such
neighborhood has at most 84 edges, at `h=2,4,6` the `W` bounds sharpen to
6,18,30 and the all-root `E` bounds to 6,12,18. Conversely, the profiles
`(h,W)=(2,8),(4,20),(6,32)` force an 85-edge root neighborhood.

Separately, weighted and unweighted cut averages select a root with small
`E`: at exact `h=0,1,2,3,4,5,6`, some degree-18 root has `E` at most
0,0,4,6,12,18,18; at `h=4` with no 85-edge root, optimizing the excess sum
of squares improves the selected-root bound to ten. Root selection by
minimum `E` does not also guarantee maximum neighborhood edges. Small `h`
gives low-overlap adjacent degree-18 roots independently of `W`: for
`h=0,1,2,3,4,5` the uniform overlap bounds are 9,9,9,10,11,12, additionally
using the published `(4,5,17)` maximum of 79 edges.

Audit: the cut was counted from both sides; Turan was applied to K5-free
induced graphs or complements; integer rounding and quantifiers were
checked; exact arithmetic checked the excluded `W` values 10,12; 22,24;
34,36; 46,48; 60 at `Q=0` and the additional values 8;20;32 at `Q=1`
(reproduce by looping over even `W` in `[h,6h]`, setting
`t=h-ceil((W/2-4+Q)/6)`, and comparing both sides). The overlap maxima are
the maxima over the 36 integers `q=0,...,35` in the displayed formula.
Next avenue: substitute actual excess multiplicities and tighten the
allowed induced graph on the `h` vertices. Detailed proof:
[excess bounds](../n43/d18/excess_bounds.md); operational index:
[reduction index section 8.12](../n43/reductions.md).

<a id="degree18-cliques-augmentation"></a>
## Degree-18 further reductions report (2026-10-14)

Proved every four-clique `Q` in the 24-vertex antineighborhood has internal
degree sum at most 60; equality forces degree 15 at each `Q` vertex and two
external vertices in each of the ten pair/triple `Q` signature classes. For
four size-four columns this bounds their total global excess above 18 by
four; equality makes all four vertices degree 19.

Proved an 84-edge `(4,5)`-free neighborhood has at most three individually
K4-safe missing edges, whose graph is a union of stars with at most three
edges; such a neighborhood is either already saturated or has at most three
single-edge augmentations to an extremal 85-edge graph. Specified a safe
root choice maximizing neighborhood edges among degree-18 vertices and
exact interface inequalities transferring that bound to other degree-18
vertices; the root-choice precondition is essential. The session also
updated the reduction index with the frontier band, small-column
deductions, these results, and corrected complement selector tie coverage.
No frontier value or global Ramsey bound was improved. Full proofs:
[cliques augmentation](../n43/d18/cliques_augmentation.md).

<a id="degree18-small-columns"></a>
## Degree-18 small-column progress (2026-10-14)

Derived constraints coupling size-four and size-five columns in a complete
order-43 interface. Every `A` vertex belongs to at most three such columns,
so `4n4+5n5<=54`; sharper bounds give `n5<=10,10,7,3,0` for
`n4=0,1,2,3,4`. For two size-four columns, `5n5<=36` minus their signature
overlap. The exact cross-edge budget is `2n4+n5=8-k+H` for `x=136+k`, where
`H` is the total column excess above six. At `x=136`, four size-four
columns force every other column to have size six; with no size-four
columns there must be eight to ten size-five columns.

Nonadjacent size-five columns are disjoint and leave an eight-vertex
`(4,3)`-free `A` subgraph; proved without catalogues that it has 16, 17, or
18 edges, with degree-five counts 0, 2, or 4 and triangle counts 8, 10, or
12; degree-five neighborhoods are `C5`, and at the 18-edge endpoint
degree-four neighborhoods are `C4`. An independent triple of size-five
columns leaves a three-vertex clique in `A`. These interface reductions
apply throughout `x=136,...,141` using the existing four-transversal
premise, and in every higher-x subcase with `e(A)>=83`. No frontier value
was excluded and no global Ramsey bound improved. Full proofs and audit:
[small columns](../n43/d18/x136/small_columns.md).

<a id="degree18-r4-exclusion"></a>
## Four size-four columns excluded (2026-10-14)

In the degree-18 `x=136` branch, the case with four size-four cross columns
is impossible. The four columns would form a `K4` in `B`, and the remaining
twenty columns would have size six. Using the audited internal-degree range
for elements of a size-four transversal: an `A`-vertex cannot lie in two of
the four columns; hence the four size-four signatures are pairwise
disjoint; every independent 4-set in `A` must meet each signature exactly
once; its four vertices then have at most 32 total cross incidences; the
independent-anchor signature bound requires at least 36. Therefore `r<=3`
for the number `r` of size-four columns at `x=136`, with remaining
necessary branches `r=0: s=8..10`, `r=1: s=6..10`, `r=2: s=4..7`,
`r=3: s=2..3`, where `s` is the number of size-five columns. Full proof:
[r4 exclusion](../n43/d18/x136/r4/exclusion.md).

<a id="upper-bound-method-review"></a>
## Upper-bound paper review (2026-10-14)

Read arXiv:2409.15709v2 at the user's request. The `R(5,5)<=46` paper uses
linear programming/subgraph counting, selected edge-dense catalogues, a
coverage theorem for pointed-neighborhood pairs, and two independent
gluing computations; it does not present SDP or flag-algebra filtering. The
key extension needed for order 43 is an unavoidable-family theorem, beyond
the current filters at a chosen frontier root. Source version, hash,
section-level account and order-43 implications:
[method review](../docs/upper_bound_method_review.md). No new Ramsey bound
or computational exclusion was claimed.
