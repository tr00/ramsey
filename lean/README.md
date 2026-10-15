# Lean 4 scaffolding

Scaffolding for formalizing results of the R(5, 5) project in Lean 4 with
Mathlib, under the evidence rules below: premises are isolated as named
axioms. The two even-pivot branch targets `Ramsey.d18.excludes` and
`Ramsey.d20.excludes` remain deliberate `sorry`s; the main target `R_5_5_43`
is proved from them by `Ramsey.ramsey_5_5_43_of_d18_d20`. The general transversal
modules additionally contain statement-only declarations with deliberate `sorry`
bodies, not proofs; they are not used by the main target. Statements added here must
mirror the claim / review discipline of `../.agents/AGENTS.md` and
`../docs/workflow.md`. Style and file placement rules for `.lean` files live
in [AGENTS.md](AGENTS.md).

## Layout

| Path | Purpose |
| --- | --- |
| `lakefile.toml` | Package `Ramsey`; depends on Mathlib `v4.35.0` |
| `lean-toolchain` | `leanprover/lean4:v4.35.0` (must match Mathlib's pin) |
| `lake-manifest.json` | Pinned dependency revisions; keep committed |
| `AGENTS.md` | Style rules for `.lean` files: file placement, comment limits, no markdown references from Lean |
| `Ramsey.lean` | Root module: re-exports everything below; hosts the single theorem `R_5_5_43`, proved modulo the two branch `sorry`s |
| `Ramsey/Premises.lean` | Trusted published facts as named axioms; Ramsey upper bounds and both edge bounds use the predicates in `Ramsey/defs/RamseyGraph.lean` (audit trail via `#print axioms`) |
| `Ramsey/D18.lean` | Degree-18 frontier on top of `Premises` and the `defs` transfer lemmas: `18 ≤ d(v) ≤ 24` on 43 vertices (`degree_mem`) and the adjacent common-neighbor bound `card_commonNeighbors_le_13` |
| `Ramsey/EvenPivot.lean` | Even-pivot root reduction (d18 ∪ d20, `../n43/reductions.md` §3): handshaking + complement symmetry give `exists_degree_18_or_20_up_to_compl`; `ramsey_5_5_43_of_d18_d20` composes a proof of the d18 case (`ExcludesDegree 18`) and a proof of the d20 case (`ExcludesDegree 20`) into the entire order-43 statement, and `ramseyNumber_5_5_le_43_of_d18_d20` into `R(5,5) ≤ 43` |
| `Ramsey/d18/Exclusion.lean` | d18 branch target `Ramsey.d18.excludes : ExcludesDegree 18` — deliberate `sorry`, mirrors `../n43/d18/` (all pivots, not a tie rule) |
| `Ramsey/d20/Exclusion.lean` | d20 branch target `Ramsey.d20.excludes : ExcludesDegree 20` — deliberate `sorry`, mirrors `../n43/d20/`; arbitrary even-pivot d20, *not* the normalized min-degree-20 scheme of `../n43/min-degree20/` |
| `Ramsey/Endgame.lean` | Endgame glue `ramsey_5_5_eq_43`: order-43 exclusion + Exoo's 42-vertex witness ⇒ `ramseyNumber 5 5 = 43` |
| `Ramsey/defs/RamseyGraph.lean` | Core vocabulary and premise-free transfer lemmas: `IsRamseyGraph`, `ramseyNumber`, explicit bound predicates `RamseyUpperBound` / `RamseyEdgeLowerBound` / `RamseyEdgeUpperBound`, balanced-clique definitions, and complement, embedding and induced-subgraph transfers (mirrors `../tex/core_definitions.tex`) |
| `Ramsey/defs/Transversals.lean` | Pivot and transversal vocabulary: `antiNeighborSet` (`M(v)`), `crossEdgeSet` (`x = e(A,B)`), `rowSet` / `columnSet`, counting (`inducedEdgeCount`, `crossEdgeCount`, `degreeExcess`), rectangle predicates, set-family and transversal definitions, and the pivot partition lemma |
| `Ramsey/theorems/TransversalDeletion.lean` | 17 unproved deletion statements with a shared `DeletionHypotheses` package, named thresholds/defects and named result fields; external edge bounds remain explicit |
| `Ramsey/theorems/TransversalCompatibility.lean` | Proved avoidance and weighted criteria using separate `WeightOccupancy`/`ComplementExclusion` packages; degree compatibility and frontier intersection retain two deliberate `sorry`s |
| `Ramsey/theorems/TransversalFour.lean` | Proved four-vertex transversal bounds and frontier cross-column application, consuming the named Ramsey and census axioms from `Premises` |
| `Ramsey/theorems/LocalReductions.lean` | Proved mixed/common-nonneighbor cells, full pair-codegree intervals and row/column cardinal bounds |
| `Ramsey/theorems/PivotInterface.lean` | Proved exact forbidden-rectangle criterion with internal graph types and pivot-containing sets handled explicitly |
| `Ramsey/theorems/PivotCounting.lean` | General proved cross-edge counts, pivot degree sums and complement edge identity |
| `Ramsey/d18/PivotBudget.lean` | Proved degree-18 edge intervals, deficit/excess identity, `136≤x≤288` and equality-frontier consequences; scoped hypotheses preserve existing theorem applications |

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

## Degree-18 cross-edge corridor

For any `(5,5)`-free graph on `Fin 43` and any vertex of degree 18,
`Ramsey.degree18_cross_range hG v hv` proves `136 ≤ x ∧ x ≤ 288`, where
`x = crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v)`.
Its endpoints are `degree18_cross_ge_136` (existing) and `degree18_cross_le_288`.
These formalize [the corridor proof](../n43/d18/cross_upper_bound.md#claim-cross-upper-corridor),
source snapshot `592D`, Section 2 including its displayed lower-bound argument.
The lower endpoint uses `edges_ramsey_4_5_18_le_85` and `ramsey_4_5_le_25`.
The upper endpoint uses `edges_ramsey_4_5_24_le_132` and `ramsey_4_5_le_25`.
No additional trusted premises or `sorry`s are introduced. The equality conditions
at `x = 288` and subsequent defect refinements are not formalized by this change.
