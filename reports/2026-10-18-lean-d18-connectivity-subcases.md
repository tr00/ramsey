# d18 connectivity subcase split in Lean

Date: 2026-10-18. Task token: `lean-d18-subcases-20261018`. Base revision:
`f488e02` (working tree). User-directed formalization scaffolding change; no
new mathematics, no graph search, no solver, no downloads, no staging and no
commit.

## Change

The d18 branch target `Ramsey.d18.excludes : ExcludesDegree 18` was a single
deliberate `sorry`. It is now derived from four connectivity subcase
targets, one per branch of the reviewed connectivity classification
(`n43/d18/neighborhood_connectivity.md#claim-connectivity-01`, formalized in
`Ramsey/d18/ConnectivityClassification.lean` as `IsDisconnectedNeighborhood`):

* `Ramsey.d18.ConnClass`: 43-vertex `(5,5)`-Ramsey graphs with a degree-18
  pivot whose neighborhood is connected (subcase `c`)
* `Ramsey.d18.KClass k`: degree-18 pivot whose neighborhood has the
  exceptional shape with complete component of order `k` (subcases `k1`,
  `k2`, `k3`)

New and changed files:

* `lean/Ramsey/d18/ConnectivityClassification.lean`: added
  `IsKNeighborhood k` (exceptional shape at exact component order `k`) and
  the proved trichotomy `isDisconnectedNeighborhood_iff`. No existing
  declaration changed.
* `lean/Ramsey/d18/ConnectivitySubcases.lean` (new): `SubcaseBranch`
  (`conn | k1 | k2 | k3`), the instance-free subcase classes `ConnClass`
  and `KClass k` (stated through `deg`), `SubcaseClass`/`SubcaseSet`/
  `ExcludesSubcase b` (the branch obligation `Complete ∅ (SubcaseClass b)`),
  the proved class cover `subcase_cover`, and `excludes_of_subcases`, which
  derives `ExcludesDegree 18` from the four subcase obligations by
  `Complete.cover` and `Complete.forall_not_of_eq_empty`, mirroring the
  even-pivot wiring in `Ramsey/EvenPivot.lean`.
* `lean/Ramsey/d18/c/Exclusion.lean`, `k1/`, `k2/`, `k3/` (new): subcase
  targets `Ramsey.d18.c.excludes : ExcludesSubcase .conn` and
  `Ramsey.d18.k{i}.excludes : ExcludesSubcase .k{i}`, each one deliberate
  `sorry` stub.
* `lean/Ramsey/d18/Exclusion.lean`: `excludes` statement unchanged, now
  proved by `excludes_of_subcases c.excludes k1.excludes k2.excludes
  k3.excludes`; own `sorry` removed, docstring updated.
* `lean/Ramsey.lean`: added the five new modules to the public imports.
* `lean/scripts/sorry-ledger.txt`: removed `Ramsey/d18/Exclusion.lean 1`,
  added `Ramsey/d18/{c,k1,k2,k3}/Exclusion.lean 1` each (net deliberate
  sorries 4 to 5 counting d20 and the transversal modules).
* `lean/scripts/Audit.lean`: added `#print axioms` lines for
  `isDisconnectedNeighborhood_iff`, `subcase_cover` and
  `excludes_of_subcases`; `lean/scripts/expected-axioms.txt` regenerated.
* `lean/scripts/style-allowlist.txt`: dropped `Ramsey/d18/Exclusion.lean`
  (rewrite removed its em-dashes).
* `lean/README.md`: intro, layout rows and a new connectivity-subcases
  section.

## Verification

`sh lean/scripts/check.sh` PASS (pin, build, per-file elaboration, sorry
ledger equality, em-dash style, axiom audit). New audited targets:

* `isDisconnectedNeighborhood_iff`: `propext, Classical.choice, Quot.sound`
* `subcase_cover`: `propext, Classical.choice, Quot.sound, Ramsey.ramsey_4_3_le_9`
* `excludes_of_subcases`: `propext, Classical.choice, Quot.sound, Ramsey.ramsey_4_3_le_9`

All existing audited targets are unchanged. The d18 target statement
`ExcludesDegree 18` is unchanged, so `Ramsey.ramsey_5_5_43_of_d18_d20`,
`Ramsey.R_5_5_43` and the Endgame glue are untouched.

New-file SHA-256:

```
bc3b8533c0fd7dc9fbfcc3140524edcea5c49a192a7d0e5022cd53dc99bc4438  Ramsey/d18/ConnectivitySubcases.lean
4ff21f5d54169a18e851628a0580d46d90da220c4329eebbb88aa87ea50fa938  Ramsey/d18/c/Exclusion.lean
6e885f9e08cfd324858dfe1c5ca8534b5d25a4a35287d97a3840bdef96ae225d  Ramsey/d18/k1/Exclusion.lean
7d073923a7ee256b26c63a748377b5fb4fc4e277640f23397222f648fc08397c  Ramsey/d18/k2/Exclusion.lean
6bcc045fb61b1115915e176e3cbeb8e8d548372cd18cc003e255e2616dcfe655  Ramsey/d18/k3/Exclusion.lean
f88ebb74e5f9d901d4d111cdc73c3f3b25c28f95dae661782e92eb573c46c4ba  Ramsey/d18/Exclusion.lean
```

## Open obligations

Four subcase `sorry`s: `Ramsey.d18.c.excludes`, `Ramsey.d18.k1.excludes`,
`Ramsey.d18.k2.excludes`, `Ramsey.d18.k3.excludes`. Each completion must
build with zero `sorry` and only standard axioms plus its explicitly
consumed named premises.
