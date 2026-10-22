# Lean 4 scaffolding

Scaffolding for formalizing results of the R(5, 5) project in Lean 4 with
Mathlib, under the evidence rules below: premises are isolated as named
axioms. Of the two even-pivot branch targets, `Ramsey.d20.excludes` remains
a deliberate `sorry`, while `Ramsey.d18.excludes` is proved from the four
connectivity subcase targets `Ramsey.d18.c.excludes`, `Ramsey.d18.k1.excludes`,
`Ramsey.d18.k2.excludes` and `Ramsey.d18.k3.excludes`, each a deliberate
`sorry`; the main target `R_5_5_43` is proved from the branch obligations by
`Ramsey.ramsey_5_5_43_of_d18_d20`, carried by `Ramsey.Complete`
(`Ramsey/defs/Completeness.lean`): each branch obligation is the completeness
of its enumeration, and an empty enumeration refutes its class. The general
transversal
modules additionally contain statement-only declarations with deliberate `sorry`
bodies, not proofs; they are not used by the main target. Statements added here must
mirror the claim / review discipline of `../.agents/AGENTS.md` and
`../docs/workflow.md`. Style and file placement rules for `.lean` files live
in [AGENTS.md](AGENTS.md).

## Layout

| Path                   | Purpose                                                                                                                                                                                                                                                                                                                                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `lakefile.toml`        | Package `Ramsey`; depends on Mathlib `v4.35.0`                                                                                                                                                                                                                                                                                                                                                    |
| `lean-toolchain`       | `leanprover/lean4:v4.35.0` (must match Mathlib's pin)                                                                                                                                                                                                                                                                                                                                             |
| `lake-manifest.json`   | Pinned dependency revisions; keep committed                                                                                                                                                                                                                                                                                                                                                       |
| `AGENTS.md`            | Style rules for `.lean` files: file placement, comment limits, no markdown references from Lean                                                                                                                                                                                                                                                                                                   |
| `Ramsey.lean`          | Root module: re-exports everything below; hosts the single theorem `R_5_5_43`, proved modulo the two branch `sorry`s                                                                                                                                                                                                                                                                              |
| `Ramsey/Premises.lean` | Trusted published facts as named axioms; Ramsey upper bounds and both edge bounds use the predicates in `Ramsey/defs/RamseyGraph.lean` (audit trail via `#print axioms`)                                                                                                                                                                                                                          |
| `Ramsey/n03/R32.lean` | Proved `R(3,2) ≤ 3` by the edgeless-graph base case and complementation |
| `Ramsey/n04/R42.lean` | Proved `R(4,2) ≤ 4` by the same base case |
| `Ramsey/n06/R33.lean` | Proved `R(3,3) ≤ 6` by recurrence |
| `Ramsey/n09/R43.lean` | Proved `R(4,3) ≤ 9` by forced degree 5 and handshaking parity |
| `Ramsey/n17/Signatures.lean` | Wagner-neighborhood signature classification by finite sum normalization, the split `c 1 = 0`, and Lean's internal `lia` tactic. No external solver or Boolean encoding. |
| `Ramsey/n18/R44.lean` | Proved `R(4,4) ≤ 18` by recurrence from the order-9 bound |
| `Ramsey/basics/GraphTheory.lean` | Premise-free induced-subgraph transport, independent-set insertion, complete and anticomplete unions, and forbidden-size cardinality bounds |
| `Ramsey/basics/Transversals.lean` | Standard hitting-set definitions, monotonicity, missed-member witnesses, complement duality and deletion equivalences |
| `Ramsey/basics/RamseyTheory.lean` | Premise-free Ramsey restrictions, pivot identities, finite-type order and edge bounds, 2-clique base case and additive recurrence |
| `Ramsey/n43/D18.lean` | Degree-18 frontier using `Premises` and `basics/RamseyTheory.lean`: degree window `18 ≤ d(v) ≤ 24` on 43 vertices and adjacent common-neighbor bound `card_commonNeighbors_le_13` |

                                                                                                               |

| `Ramsey/n43/EvenPivot.lean` | Even-pivot root reduction (d18 ∪ d20, `../research/n43/reductions.md` §3) on the `Complete` carrier: handshaking + complement symmetry give `exists_degree_18_or_20_up_to_compl` and the class cover `pivot_cover`; `ramsey_5_5_43_of_d18_d20` joins the branch obligations (`ExcludesDegree d`, the completeness of the empty enumeration of the degree-`d` pivot class) via `Complete.cover` and `Complete.forall_not_of_eq_empty`; `ramseyNumber_5_5_le_43_of_d18_d20` into `R(5,5) ≤ 43` |
| `Ramsey/n43/d18/Exclusion.lean` | d18 branch target `Ramsey.d18.excludes : ExcludesDegree 18`, proved from the four connectivity subcase targets by `Ramsey.d18.excludes_of_subcases`; mirrors `../research/n43/d18/` (all pivots, not a tie rule) |
| `Ramsey/n43/d18/c/Exclusion.lean` | Connected d18 subcase target `Ramsey.d18.c.excludes : ExcludesSubcase .conn` — deliberate `sorry` |
| `Ramsey/n43/d18/c/w0/Exclusion.lean` | Connected degree-18 zero-A-excess branch `Ramsey.d18.c.w0.Class`, with open `Excludes := Complete ∅ Class`. Here `W_A = E_A = 0` means every A vertex has global degree 18, proved by `zero_excess_iff`. Mirrors the exact budgets in `../research/n43/d18/frontier_band.md`. This is not restricted to `x = 136` and does not cover positive A-excess. No new axioms or sorries. |
| `Ramsey/n43/d18/k1/Exclusion.lean` | K1 d18 subcase target `Ramsey.d18.k1.excludes : ExcludesSubcase .k1` (exceptional neighborhood with complete component of order 1) — deliberate `sorry` |
| `Ramsey/n43/d18/k1/Rigidity.lean` | K1 rigidity: the isolated neighbor has global degree 18 and a 17-vertex 8-regular `(4,4)` cross row. Mirrors accepted connectivity claim 03(b), with no pivot-degree hypothesis. |
| `Ramsey/n43/d18/k1/{Frame,Structure}.lean` | Canonical adjacent-root cells and the proved 17+17+7 decomposition with both regular cores and both `(5,4)` sides. |
| `Ramsey/n43/d18/k1/{Core,Attachments}.lean` | Proved SRG(17,8,3,4), unique missers of core nonedges, and at least 64 attachment edges per side. The 64-edge proof uses incidence convexity and needs no 8-vertex census. |
| `Ramsey/n43/d18/k1/{Budgets,Totals,VertexBounds}.lean` | Exact core, root and global edge/excess identities, 7-cell excess 26..42, and all vertexwise bounds. |
| `Ramsey/n43/d18/k1/{Completion,Parameters,Reduction}.lean` | Exact 8/3 mixed obstruction types, arbitrary cross-core replacement, the scalar outer envelope, and `Complete` reductions to admissible erased keys with 289 Boolean positions. No exclusion or realizability claim. |
| `Ramsey/n43/d18/k2/Exclusion.lean` | K2 d18 subcase target `Ramsey.d18.k2.excludes : ExcludesSubcase .k2` (complete component of order 2) — deliberate `sorry` |
| `Ramsey/n43/d18/k3/Exclusion.lean` | K3 d18 subcase target `Ramsey.d18.k3.excludes : ExcludesSubcase .k3` (complete component of order 3) — deliberate `sorry` |
| `Ramsey/n43/d20/Exclusion.lean` | d20 branch target `Ramsey.d20.excludes : ExcludesDegree 20` — deliberate `sorry`, mirrors `../research/n43/d20/`; arbitrary even-pivot d20, _not_ the normalized min-degree-20 scheme of `../research/n43/min-degree20/` |
| `Ramsey/defs/Completeness.lean` | Enumeration completeness carrier `Complete S P` with premise-free glue lemmas (`mono`, `of_imp`, `sep`, `union`, `iUnion`, `cover`, `forall_not_of_eq_empty`); every branch states its obligation as a `Complete` proof |
| `Ramsey/defs/RamseyGraph.lean` | Repository Ramsey graph, bound-predicate and balanced-clique vocabulary. Elementary results live in `basics/RamseyTheory.lean`. |
| `Ramsey/defs/Transversals.lean` | Repository pivot-interface vocabulary: antineighborhood, rows, edge counts, degree excess, deletion counts and rectangle predicates |
| `Ramsey/defs/RootedRamseyGraph.lean` | `RootedRamseyGraph s t V` with its pivot, canonical parts `A` and `B`, partition facts and bundled `(4,5)` neighborhood and `(5,4)` antineighborhood for `(5,5)` graphs |
| `Ramsey/theorems/TransversalDeletion.lean` | 15 unproved deletion statements with explicit external bounds. The elementary deletion equivalence and complement duality are proved in `basics/Transversals.lean`. |
| `Ramsey/theorems/TransversalCompatibility.lean` | Proved avoidance and weighted criteria using separate `WeightOccupancy`/`ComplementExclusion` packages; degree compatibility and frontier intersection retain two deliberate `sorry`s |
| `Ramsey/theorems/TransversalFour.lean` | Proved four-vertex transversal bounds and frontier cross-column application, consuming the published edge-census axiom and the proved order-9 Ramsey bound |
| `Ramsey/theorems/LocalReductions.lean` | Numerical mixed/common-nonneighbor cell bounds, full pair-codegree intervals and row/column bounds, using `basics/RamseyTheory.lean` restrictions |
| `Ramsey/theorems/PivotInterface.lean` | Proved exact forbidden-rectangle criterion with internal graph types and pivot-containing sets handled explicitly |
| `Ramsey/theorems/Counting.lean` | Premise-free row and incidence counts, induced-union and cut edge decompositions, induced-degree identities, two-anchor identities, pivot degree sums and complement edge counts |
| `Ramsey/n17/Regularity.lean` | Every 17-vertex `(4,4)`-Ramsey graph is 8-regular, by the generic neighborhood bounds and the proved order-9 Ramsey bounds |
| `Ramsey/n43/d18/PivotBudget.lean` | Proved degree-18 edge intervals, deficit/excess identity, `136≤x≤288` and equality-frontier consequences, taking a rooted Ramsey graph and its pivot-degree hypothesis |
| `Ramsey/n43/d18/ConnectivityClassification.lean` | Connectivity classification of degree-18 neighborhoods fused with the d18 subcase split: exceptional family `K_m ⊔ C`, `m=1..3`, the order trichotomy `IsKNeighborhood k` / `isDisconnectedNeighborhood_iff`, `SubcaseBranch` branches `conn`/`k1`/`k2`/`k3`, instance-free subcase classes `ConnClass` and `KClass k` through `deg`, the class cover `subcase_cover`, and `excludes_of_subcases` joining the four subcase obligations by `Complete.cover` and `Complete.forall_not_of_eq_empty` |
| `Ramsey/n43/d18/CrossEdgeBounds.lean` | Single cross-edge module with public `Ramsey.d18.degree18_cross_le_279`. Branch-specific support remains local. Generic incidences and induced-degree identities come from `Counting`. No new axioms or sorries. |

The small bounds above use only `propext`, `Classical.choice`, and `Quot.sound`.
`Ramsey.ramsey_4_3_le_9` and `Ramsey.ramsey_4_4_le_18` are theorems, not
axioms in `Premises`. Import their order-specific modules directly, or use
`import Ramsey`. `R(3,5) ≤ 14` and `R(4,5) ≤ 25` remain published axioms.
See the [formalization report](../research/reports/2026-10-21-lean-small-ramsey-bounds.md).

## Paley-17 uniqueness

`Ramsey.n17.isomorphic_paley17` in [research/n17/R44.lean](Ramsey/n17/R44.lean) proves
that every finite 17-vertex `(4,4)`-Ramsey graph is isomorphic to `paley17`.
`Ramsey.n17.paley17_isRamseyGraph` supplies the concrete quadratic-residue construction.
Both declarations use only `propext`, `Classical.choice`, and `Quot.sound`, with no `sorry`.

The proof derives `SRG(17,8,3,4)`, classifies the cubic 8-vertex neighborhood,
extracts its 38 possible outside signatures, and applies the internal `lia`
classification before reconstructing the Paley isomorphism. Finite signature
coverage uses kernel reduction, not `native_decide`, an external solver, or a graph catalogue.
An external consumer checked the arbitrary-vertex theorem, pairwise uniqueness
on `Fin 17`, and the complement case. K1's `Frame.paley_cores` now consumes this theorem.

Verified on 2026-10-21 with `LEAN_NUM_THREADS=2 sh lean/scripts/check.sh`
from the repository root. The full build, unchanged sorry ledger, style check,
and axiom audit passed. Audit expectations now include the Paley construction,
uniqueness theorem, and K1 core isomorphisms, all with only the 3 standard axioms.

The source [uniqueness argument](../research/n17/r44.md) retains its separate `ready`
review status. Kernel checking does not change that review metadata.

## Uniform boundary profiles

The 4 accepted claims in [boundary_profiles.md](../docs/general_theorems/boundary_profiles.md)
are formalized in namespace `Ramsey.Boundary` and re-exported by `import Ramsey`.
Vertices use `B ⊕ X`, separating retained boundary labels from a finite interior.
The profile stores the exact boundary graph and 2 capped tables indexed only by
homogeneous boundary sets. Interior names and graph order are not stored.

| Module | Scope |
| --- | --- |
| `defs/BoundaryProfiles.lean` | Concrete eligible-set maxima, dependent-domain profiles and observations |
| `theorems/BoundaryProfiles.lean` | Explicit finite-state bound, exact capped maxima and Ramsey freeness, including empty and threshold-1 cases |
| `defs/BoundaryProfileGluing.lean`, `theorems/BoundaryProfileGluing.lean` | Concrete shared-boundary gluing, 4 exact table formulas and order identities |
| `defs/BoundaryProfileOperations.lean`, `theorems/BoundaryProfileOperations.lean` | Forgetting, uniform introduction and fixed boundary relabelling |
| `theorems/BoundaryProfileTransport.lean` | Profile independence of interior names and of reindexings retaining the same boundary, including forgetting order |
| `defs/BoundaryProfileContexts.lean`, `theorems/BoundaryProfileContexts.lean` | Typed paired-expression grammar and simultaneous replacement, clipped observations, Ramsey freeness and separate equal-order preservation |

`UniformDerivation R G H` pairs finite expressions with identical operation data,
fixed leaves or `R`-related replacement leaves, and compatible labelled boundaries
at gluing nodes. `uniform_replacement` uses equal-profile leaves and proves equal
output profiles. This covers a 1-hole context and any finite family of replacements.
`UniformDerivation.glue_of_profiles` derives compatibility of the replacement side
from compatibility of the original side. `uniform_ordered_replacement` additionally
requires equal orders at replacement leaves. No arbitrary mixed attachment,
minimal-state characterization, bounded-width decomposition or new Ramsey bound
is asserted. The source's illustrative examples and decomposition discussion are
not additional formalized claims.
Exact source hashes, claim coverage, axiom targets and the composed consumer
proof were recorded in the removed formalization report, preserved in Git
history.

## Bundled Ramsey graphs

`RamseyGraph s t V` packages `graph : SimpleGraph V` with
`ramsey : IsRamseyGraph s t graph`. It coerces to its underlying simple graph.
Construct a bundle with `⟨G, hG⟩` from an existing graph and its Ramsey proof.
The 2 Ramsey-specific general transversal statements and non-pivot connectivity
APIs accept these bundles. One-sided graph hypotheses and predicate-based
completeness interfaces retain their more general formulations.

`RootedRamseyGraph s t V` extends this bundle with `pivot : V`. Construct it
with `G.root v` from `G : RamseyGraph s t V`. Its parts are derived, not stored:
`R.A = R.graph.neighborSet R.pivot` and `R.B = antiNeighborSet R.graph R.pivot`.
This prevents inconsistent decompositions and preserves adjacency decidability.
`R.disjoint_parts`, `R.mem_partition`, `R.card_parts` and `R.card_A` provide the
partition and counting facts. For `(5,5)` graphs, `R.neighborhood` is a bundled
`(4,5)` graph on `R.A`, and `R.antineighborhood` is a bundled `(5,4)` graph on
`R.B`. In particular, no independent-4 prohibition is imposed on `R.A`.

Degree-18 budgets, pivot connectivity, the final cross-edge bound and local
row/column bounds now use rooted graphs instead of graph/proof/pivot arguments.
General counting identities and converse interface criteria remain on raw
graphs because they do not assume Ramsey freeness.

The final cross-edge interface is:

```lean
example (R : Ramsey.RootedRamseyGraph 5 5 (Fin 43)) [DecidableRel R.graph.Adj]
    (hv : R.graph.degree R.pivot = 18) :
    Ramsey.crossEdgeCount R.graph R.A R.B ≤ 279 :=
  Ramsey.d18.degree18_cross_le_279 R hv
```

The former `CrossEdgeSupport`, `CrossEdgeTail`, `CrossEdgeSingle`,
`CrossEdgeCores` and `CrossEdgeDouble` modules have been removed.
Their branch-specific internal lemmas are no longer part of the public API.

The shared `links` API and graph counting identities live in `theorems/Counting.lean`.
Elementary cardinality, insertion and induced-freeness helpers live in `basics/GraphTheory.lean`.
The standard transversal vocabulary and API live in `basics/Transversals.lean`.
Generic restrictions and explicit Ramsey bounds live in `basics/RamseyTheory.lean`.
The former `CliqueBounds`, `RamseyBounds` and `RowBounds` module paths have no compatibility shims.
Order-17 regularity lives with its branch in `n17/Regularity.lean`.
`Counting` replaces `PivotCounting` without a shim and does not import order-specific modules.
The pre-consolidation 2026-10-21 external consumer checked incidence decomposition,
induced degrees, generic cardinality bounds, insertion and induced freeness.
Its axiom checks and consistency gate passed with the then-current ledgers.
The 2026-10-22 consolidation proves the 2 elementary transversal facts in `basics/`,
reducing the deletion module's sorry count from 17 to 15 without adding an axiom.
Verified from `lean/` with `env LEAN_NUM_THREADS=2 sh scripts/check.sh` on 2026-10-22.
The build, per-file elaboration, updated sorry ledger, style and axiom audit passed.
A standalone consumer exercised the new background imports and the empty-graph boundary.
Existing audited axiom sets are unchanged. The 22 added audit targets use only standard axioms.

The concept deduplication uses `rowSet` for both row and column restrictions;
the finite `crossRow` and `anchorSignature` representations delegate to its
`toFinset`. `IsDisconnectedNeighborhood` is the disjunction of
`IsKNeighborhood 1`, `IsKNeighborhood 2` and `IsKNeighborhood 3`.
Boundary `ProfileRelation` delegates to `SameProfile`. Deletion counts live
in `defs/Transversals`, and deletion and compatibility statements reuse
`inducedEdgeCount` and `crossEdgeCount`. `outsideNonneighborCount` still counts
the vertex itself when it lies outside the deletion set.
A separate consumer proof checked these interfaces, signature equality and
the nonneighbor self-counting boundary; all affected modules built.
The full `sh scripts/check.sh` gate passed after the cutover: build, sorry
ledger, style and expected axiom audit all green. No new axioms or sorries
were introduced by this refactor.

## K1 completion reduction

The accepted claims in [the double-core research note](../research/n43/d18/k1/research.json),
[cross-core bounds](../research/n43/d18/k1/cross_core.json), and
[seven-cell structure](../research/n43/d18/k1/seven_cell.json) now have proved reduction interfaces.
The exact source correspondence and axiom audit were recorded in the removed
formalization report, preserved in Git history.

`Ramsey.d18.k1.reduction` proves
`Complete {G | ReducedClass G} (Ramsey.d18.KClass 1)`.
The reduced class contains explicit Boolean completions of partial keys. Each key has the
cross-core block erased and retains both admissible 24-vertex sides. Its matrix has exactly
289 positions. The 8 negative and 3 positive rectangle families are necessary and sufficient
for the assembled graph to be `(5,5)`-free. All scalar, attachment and vertexwise filters
stored in the reduced class are proved consequences, not extra search assumptions.

```lean
example {S : Set (SimpleGraph (Fin 43))}
    (h : Ramsey.Complete S Ramsey.d18.k1.ReducedClass) :
    Ramsey.Complete S (Ramsey.d18.KClass 1) :=
  Ramsey.d18.k1.complete_of_reduced h
```

`complete_by_parameters` alternatively joins complete enumerations for all allowed scalar
profiles. An allowed profile is an outer-envelope cell, not a realizability certificate.
`excludes_of_reduced` transfers an eventual empty complete enumeration to the K1 exclusion.
The original K1 exclusion remains open and its existing `sorry` is unchanged. No new
axioms or sorries are introduced. The core saturation, nonedge packing, and 64-edge bound
now use only standard logical axioms, through the proved `R(4,3) ≤ 9` bound. The exact
completion equivalence and matrix-reconstruction theorems also use only standard axioms.
Census-dependent budget filters retain the existing published order-24 edge bounds.

## Proof automation

The pinned Lean and Mathlib already provide the tactics needed here. No new
solver or tactic dependency is required:

- First use counting identities such as `Set.ncard_union_eq`,
  `Set.ncard_compl`, `SimpleGraph.degree_compl`, the degree-sum theorem and
  the project's cross-edge sum lemmas. These expose the arithmetic content.
- Use `simp only` to normalize set/subtype cardinalities consistently. Before
  arithmetic on rooted and raw expressions, use
  `dsimp only [RootedRamseyGraph.A, RootedRamseyGraph.B] at *` if necessary.
  `omega` can otherwise treat definitionally equal cardinalities as distinct
  atoms. Avoid unrestricted `dsimp` on counting hypotheses because it also
  unfolds cardinality definitions.
- Use `omega` for natural/integer linear arithmetic, including truncated
  subtraction. Use `ring` for polynomial identities and `linarith` or
  `nlinarith` for linear or nonlinear ordered-ring arithmetic.
- Use `grind` for logical and equality reasoning with explicitly supplied
  lemmas, and `aesop` for routine membership and subtype obligations.
  `RootedRamseyGraph.mem_partition` is a checked `grind` example.
- For a genuinely new counting correspondence, provide the bijection or
  injection explicitly. Neither `omega` nor a larger search tactic invents
  the graph-specific correspondence.

For example, the vertex-partition proof now uses set-cardinality identities
and `omega` in 5 proof lines instead of 20. The complement-degree identity
uses `SimpleGraph.degree_compl` and `omega` in 4 lines instead of 15.

## Build

Requires `elan` (Lean 4.35.0 installs automatically from `lean-toolchain`).

```sh
cd lean/
lake update            # only when changing the Mathlib pin
lake exe cache get     # fetch prebuilt Mathlib artifacts (once, ~GBs)
lake build
```

The root module keeps an umbrella `import Mathlib`; per-file
`public import Mathlib.Combinatorics.…` lines are preferred elsewhere as the
collection grows.

`lake update` rewrites `lake-manifest.json`; commit the result so builds are
reproducible. `.lake/` is ignored.

## Evidence rules for proofs

- A lemma counts as proved only if its file builds with zero `sorry` and
  `#print axioms` reports only `propext`, `Classical.choice`, `Quot.sound`,
  and the named premises of `Ramsey/Premises.lean` it explicitly consumes.
- Record the correspondence between a Lean name and the informal claim
  (claim file and revision) in this README or in the handoff report, never
  in the `.lean` file itself (see `AGENTS.md`).
- Do not weaken a statement to make it provable; if the informal claim needs
  an extra hypothesis, say so in the docstring and flag it in the handoff.

## Neighborhood connectivity classification

`Ramsey.d18.connectivity_classification` formalizes
`research/n43/d18/neighborhood_connectivity.md#claim-connectivity-01` for every finite
18-vertex `(4,5)`-Ramsey graph. Its exceptional predicate
`IsDisconnectedNeighborhood` gives a nonempty clique of order at most three,
no edges across its complement, and a connected `(4,4)` core on the remaining
vertices. The core has an independent triple and no independent four-set.
The structural proof now uses only standard logical axioms through the proved order-9 bound.

The claim-02 census edge slices and the sufficient-connectivity wrappers
(edge count `69`, deficit `16`, equality frontier `x=136`) were formalized
here until the 2026-10-18 fusion and removed: the d18 branch now handles
disconnected neighborhoods through the subcase obligations instead of
proving connectivity from edge counts. The informal claims remain in
`research/n43/d18/neighborhood_connectivity.md` and the removed theorem names and
premise chains in `research/reports/2026-10-17-d18-connectivity.md`. The theorem
names and premise chains of the survivors are included in
`scripts/Audit.lean` and its expectations. Nothing here asserts that any
exceptional graph extends to an order-43 Ramsey candidate. The
interface/filter claims in claim 03 are not formalized by the classification
module; the m = 1 rigidity of its item (b) is formalized in
`Ramsey/n43/d18/k1/Rigidity.lean` on top of `Ramsey/n17/Regularity.lean`.

## Connectivity subcases of the d18 branch

`Ramsey.n43.d18.ConnectivityClassification` defines `IsDisconnectedNeighborhood`
through the three exact complete-component orders `IsKNeighborhood k`
(`k = 1, 2, 3`); `isDisconnectedNeighborhood_iff` is definitional. It splits the d18 pivot
class into the four `SubcaseBranch` classes: `ConnClass` (connected
neighborhood) and `KClass k` (exceptional shape at order `k`), both stated
instance-free through `deg`. `subcase_cover` is the resulting cover of the
d18 class, proved from `connectivity_classification`, and
`excludes_of_subcases` derives `Ramsey.ExcludesDegree 18` from the four
subcase obligations `ExcludesSubcase b` by `Complete.cover` and
`Complete.forall_not_of_eq_empty`. The four subcase targets in
`Ramsey/n43/d18/{c,k1,k2,k3}/Exclusion.lean` carry one deliberate `sorry` each;
the d18 branch target itself is proved. The cover and the join now use only
standard logical axioms through the classification and the proved order-9 bound.

### K1 rigidity

`Ramsey.d18.k1.rigidity` formalizes the m = 1 case of the K_m interface
analysis: the unique vertex u of the complete component has no neighbor in
the neighborhood of the pivot, so its degree splits into the pivot edge and
its cross row. The row cap `|R_u| ≤ 17` and the global degree floor
`18 ≤ d(u)` force `deg G u = 18` and `|R_u| = 17`, and the row itself is a
17-vertex 8-regular `(4,4)`-Ramsey graph by the regularity trigger. The
statement needs no hypothesis on the pivot degree. The source claim
`research/n43/d18/neighborhood_connectivity.md#claim-connectivity-03` is independently
accepted. Its item (b) arithmetic `epsilon_u ≤ m - 1` and
`d_B(u) = 18 - m + epsilon_u` collapses at m = 1 to the equalities above.
