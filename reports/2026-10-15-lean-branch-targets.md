# Lean branch targets: R_5_5_43 proved modulo d18/d20

Date: 2026-10-15. Task: `lean-branches-20261015`.

Input: `Ramsey.ramsey_5_5_43_of_d18_d20` from
`reports/2026-10-15-lean-even-pivot.md` (task `lean-even-pivot-20261015`).

## Changes

- New `lean/Ramsey/d18/Exclusion.lean`: `Ramsey.d18.excludes :
  ExcludesDegree 18` — the d18 branch target, deliberate `sorry`.
- New `lean/Ramsey/d20/Exclusion.lean`: `Ramsey.d20.excludes :
  ExcludesDegree 20` — the d20 branch target, deliberate `sorry`. Scope
  warning recorded in the module: arbitrary even-pivot d20 (global degrees
  `18..24`), explicitly not the complement-normalized minimum-degree-20
  scheme of `../n43/min-degree20/`.
- `lean/Ramsey.lean`: the main target `R_5_5_43` is now *proved* (its own
  `sorry` removed) as
  `ramsey_5_5_43_of_d18_d20 d18.excludes d20.excludes G`; root module
  re-exports both branch modules; docstrings updated (including the stale
  `exists_isRamseyGraph_5_5_42` reference, corrected to `exoo_5_5_42`).
- `lean/README.md`: layout rows for the branch modules; the deliberate-`sorry`
  policy now names exactly the two branch targets.

The sorry discipline moves from one root target to two branch targets: the
open content of the order-43 problem in Lean now lives exactly in
`Ramsey.d18.excludes` and `Ramsey.d20.excludes`, mirroring the informal
branch folders `../n43/d18/` and `../n43/d20/`. Each branch obligation is
full pivot coverage (every degree-18 resp. degree-20 vertex), not a
canonical-pivot tie rule, per `../n43/reductions.md` §3.

## Verification

- `lake build` clean; exactly two `declaration uses sorry` warnings
  (`Ramsey/d18/Exclusion.lean`, `Ramsey/d20/Exclusion.lean`), both
  deliberate.
- `#print axioms Ramsey.R_5_5_43`: `[propext, sorryAx, Classical.choice,
  Quot.sound, Ramsey.ramsey_4_5_le_25]` — the `sorryAx` comes only from the
  two branch targets; the single named premise is the `R(4,5) ≤ 25` degree
  frontier via `Ramsey.degree_mem`. Completing both branches therefore
  closes `R_5_5_43` with the same premise footprint.

No branch is closed; no novelty claim; no graph search, solver, download,
or installation. No commit performed. Shared navigation files left to
coordinator integration.
