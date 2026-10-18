# Lean 4 scaffolding

Scaffolding for formalizing results of the R(5, 5) project in Lean 4 with
Mathlib, under the evidence rules below: premises are isolated as named
axioms. The two even-pivot branch targets `Ramsey.d18.excludes` and
`Ramsey.d20.excludes` remain deliberate `sorry`s; the main target `R_5_5_43`
is proved from them by `Ramsey.ramsey_5_5_43_of_d18_d20`, carried by
`Ramsey.Complete` (`Ramsey/defs/Completeness.lean`): each branch obligation
is the completeness of its enumeration, and an empty enumeration refutes its
class. The general transversal
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
| `Ramsey/D18.lean`      | Degree-18 frontier on top of `Premises` and the `defs` transfer lemmas: `18 ≤ d(v) ≤ 24` on 43 vertices (`degree_mem`) and the adjacent common-neighbor bound `card_commonNeighbors_le_13` Ramsey.lean — imports Ramsey.defs.Completeness; R_5_5_43's docstring now names the carrier flow (branch Complete proofs → cover → forall_not_of_eq_empty) with the two branch sorries as the only open |

                                                                                                               |

| `Ramsey/EvenPivot.lean` | Even-pivot root reduction (d18 ∪ d20, `../n43/reductions.md` §3) on the `Complete` carrier: handshaking + complement symmetry give `exists_degree_18_or_20_up_to_compl` and the class cover `pivot_cover`; `ramsey_5_5_43_of_d18_d20` joins the branch obligations (`ExcludesDegree d`, the completeness of the empty enumeration of the degree-`d` pivot class) via `Complete.cover` and `Complete.forall_not_of_eq_empty`; `ramseyNumber_5_5_le_43_of_d18_d20` into `R(5,5) ≤ 43` |
| `Ramsey/d18/Exclusion.lean` | d18 branch target `Ramsey.d18.excludes : ExcludesDegree 18` — deliberate `sorry`, mirrors `../n43/d18/` (all pivots, not a tie rule) |
| `Ramsey/d20/Exclusion.lean` | d20 branch target `Ramsey.d20.excludes : ExcludesDegree 20` — deliberate `sorry`, mirrors `../n43/d20/`; arbitrary even-pivot d20, _not_ the normalized min-degree-20 scheme of `../n43/min-degree20/` |
| `Ramsey/Endgame.lean` | Endgame glue `ramsey_5_5_eq_43`: order-43 exclusion + Exoo's 42-vertex witness ⇒ `ramseyNumber 5 5 = 43` |
| `Ramsey/defs/Completeness.lean` | Enumeration completeness carrier `Complete S P` with premise-free glue lemmas (`mono`, `of_imp`, `sep`, `union`, `iUnion`, `cover`, `forall_not_of_eq_empty`); every branch states its obligation as a `Complete` proof |
| `Ramsey/defs/RamseyGraph.lean` | Core vocabulary and premise-free transfer lemmas: bundled `RamseyGraph s t V`, predicate `IsRamseyGraph`, `ramseyNumber`, explicit bound predicates, balanced-clique definitions, and complement, embedding and induced-subgraph transfers |
| `Ramsey/defs/Transversals.lean` | Pivot and transversal vocabulary: `antiNeighborSet` (`M(v)`), `crossEdgeSet` (`x = e(A,B)`), `rowSet` / `columnSet`, counting (`inducedEdgeCount`, `crossEdgeCount`, `degreeExcess`), rectangle predicates, set-family and transversal definitions, and the pivot partition lemma |
| `Ramsey/defs/RootedRamseyGraph.lean` | `RootedRamseyGraph s t V` with its pivot, canonical parts `A` and `B`, partition facts and bundled `(4,5)` neighborhood and `(5,4)` antineighborhood for `(5,5)` graphs |
| `Ramsey/theorems/TransversalDeletion.lean` | 17 unproved deletion statements with a shared `DeletionHypotheses` package, named thresholds/defects and named result fields; external edge bounds remain explicit |
| `Ramsey/theorems/TransversalCompatibility.lean` | Proved avoidance and weighted criteria using separate `WeightOccupancy`/`ComplementExclusion` packages; degree compatibility and frontier intersection retain two deliberate `sorry`s |
| `Ramsey/theorems/TransversalFour.lean` | Proved four-vertex transversal bounds and frontier cross-column application, consuming the named Ramsey and census axioms from `Premises` |
| `Ramsey/theorems/LocalReductions.lean` | Proved mixed/common-nonneighbor cells, full pair-codegree intervals and row/column cardinal bounds |
| `Ramsey/theorems/PivotInterface.lean` | Proved exact forbidden-rectangle criterion with internal graph types and pivot-containing sets handled explicitly |
| `Ramsey/theorems/PivotCounting.lean` | General proved cross-edge counts, pivot degree sums and complement edge identity |
| `Ramsey/d18/PivotBudget.lean` | Proved degree-18 edge intervals, deficit/excess identity, `136≤x≤288` and equality-frontier consequences, taking a rooted Ramsey graph and its pivot-degree hypothesis |
| `Ramsey/d18/ConnectivityClassification.lean` | Proved exact disconnected-neighborhood family `K_m ⊔ C`, `m=1..3`, connected `(4,4)` core with independence number three, census edge slices, and connectivity for `a≥69`, `q≤16` and `x=136` |
| `Ramsey/d18/CrossEdgeBounds.lean` | Single cross-edge module with public `Ramsey.d18.degree18_cross_le_279`. All row, incidence, critical-core and equality-profile support is private and used by this bound. No new axioms or sorries. |

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
Their internal lemmas are no longer part of the public API.

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
`n43/d18/neighborhood_connectivity.md#claim-connectivity-01` for every finite
18-vertex `(4,5)`-Ramsey graph. Its exceptional predicate
`IsDisconnectedNeighborhood` gives a nonempty clique of order at most three,
no edges across its complement, and a connected `(4,4)` core on the remaining
vertices. The core has an independent triple and no independent four-set.
The structural proof needs only the existing `ramsey_4_3_le_9` premise.

`disconnected_edge_slices` formalizes claim 02 using the six existing
order-15, order-16 and order-17 census edge bounds. The degree-18 wrappers
apply to arbitrary finite ambient graphs, except the `x=136` corollary,
which uses the existing order-43 frontier identity. The theorem names and
exact premise chains are included in `scripts/Audit.lean` and its expectations.

Connectivity for `a≥69` is sufficient, not necessary. Disconnection is possible
only in `[53,58] ∪ {61,68}` according to these necessary conditions. Nothing here
asserts that any exceptional graph extends to an order-43 Ramsey candidate.
The interface/filter claims in claim 03 are not formalized by this module.
