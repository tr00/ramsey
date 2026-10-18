# Fusion of the d18 connectivity modules

Date: 2026-10-18. Task token: `lean-d18-fusion-20261018`. Base revision:
`f488e02` (working tree). User-directed refactor of the d18 connectivity
formalization; no new mathematics, no statement changes to surviving
declarations, no graph search, no solver, no downloads, no staging and no
commit.

## Change

`lean/Ramsey/d18/ConnectivitySubcases.lean` (new earlier today) is fused
into `lean/Ramsey/d18/ConnectivityClassification.lean`, which now holds the
classification and the d18 subcase branching in one module. Everything not
needed for the branching is removed:

Removed declarations (no external Lean callers; only `scripts/Audit.lean`
and `lean/README.md` referenced them):

* `edge_card_eq_choose_add_induce_compl` (private), `exceptional_edge_slices`
  (private), `disconnected_edge_slices` — the claim-02 census edge slices
* `connected_of_edge_ge_69`, `degree18_connectivity_classification`,
  `degree18_neighbor_connected_of_edge_ge_69`,
  `degree18_neighbor_connected_of_deficit_le_16`,
  `degree18_frontier_neighbor_connected` — the sufficient-connectivity
  wrappers of the shape `P(x) => connected`. The branching handles
  disconnected neighborhoods through the k1/k2/k3 subcase obligations, so
  forcing connectivity from edge counts is no longer needed.
* Imports `Ramsey.Premises`, `Ramsey.d18.PivotBudget`,
  `Ramsey.defs.RootedRamseyGraph`, `Mathlib.Combinatorics.SimpleGraph.Sum`
  and `Mathlib.Logic.Equiv.Set` became unused and are dropped; the fused
  file imports `Ramsey.EvenPivot` (which re-exports the `D18`/`Premises`/
  `defs` chain providing `deg`, `ExcludesDegree`, `Complete`, `RamseyGraph`,
  `IsRamseyGraph`, `isRamseyGraph_induce_neighborSet`) plus the three
  Mathlib modules the classification still uses.

Survivors, with proof bodies unchanged (statement and axiom sets identical):

* Classification: `IsDisconnectedNeighborhood`,
  `disconnected_neighborhood_classification`,
  `IsDisconnectedNeighborhood.not_connected`, `connectivity_classification`,
  `IsKNeighborhood`, `isDisconnectedNeighborhood_iff` and the 9 private
  support lemmas (all still used by the classification proof).
* Branching: `SubcaseBranch`, `ConnClass`, `KClass`, `SubcaseClass`,
  `SubcaseSet`, `subcaseSet_eq_empty`, `ExcludesSubcase`, `subcase_cover`,
  `excludes_of_subcases`.

Rewired imports: `lean/Ramsey/d18/{c,k1,k2,k3}/Exclusion.lean` and
`lean/Ramsey/d18/Exclusion.lean` import `Ramsey.d18.ConnectivityClassification`
(one docstring mention updated); `lean/Ramsey.lean` drops the
`ConnectivitySubcases` import. `lean/scripts/Audit.lean` drops the five
`#print axioms` lines of the removed theorems (24 to 19 targets) and
`lean/scripts/expected-axioms.txt` is regenerated; the sorry ledger is
unchanged (the deleted module had no sorries). The removed theorem names and
their premise chains are recorded in `reports/2026-10-17-d18-connectivity.md`.

Fused-file SHA-256:

```
1c478c78f0c45c1fcb3844bc0cec2b861f1f1380a21ee12fbb39b098f00fd24c  Ramsey/d18/ConnectivityClassification.lean
```

## Verification

`sh lean/scripts/check.sh` PASS (pin, build, per-file elaboration, sorry
ledger, em-dash style, axiom audit). The audited axiom sets of the surviving
targets are unchanged; `subcase_cover` and `excludes_of_subcases` still use
only `propext`, `Classical.choice`, `Quot.sound` and `ramsey_4_3_le_9`.

## Open obligations

Unchanged: four subcase `sorry`s in `Ramsey/d18/{c,k1,k2,k3}/Exclusion.lean`
and the d20 branch sorry.
