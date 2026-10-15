# Lean formalization of the even-pivot reduction

Date: 2026-10-15. Task: `lean-even-pivot-20261015`.

Input: `n43/reductions.md` §3 ("Coverage warning", uncommitted working-tree
revision), `docs/theory_phase_1.md` §2 (lines 162-165), and the review note in
`docs/proof_review_2026_10_13.md` ("the alternative arbitrary even-degree
pivot split into 18 and 20 is sound"). Premise: `Ramsey.degree_mem`
(`18 ≤ d(v) ≤ 24` on 43 vertices, from `R(4,5) ≤ 25`), already proved in
`lean/Ramsey/D18.lean`.

## What was formalized

New module `lean/Ramsey/EvenPivot.lean`, imported and re-exported by the root
module:

- `Ramsey.degree_add_compl_degree` — `d_G(v) + d_{Gᶜ}(v) = 42` on `Fin 43`.
- `Ramsey.exists_even_degree` — handshaking on odd order (Mathlib's
  `SimpleGraph.even_card_odd_degree_vertices`): a graph on an odd number of
  vertices has an even-degree vertex.
- `Ramsey.exists_degree_18_or_20_up_to_compl` — the §3 coverage argument:
  with the degree frontier, even degrees are `{18, 20, 22, 24}`, and
  complementation maps `22 ↦ 20`, `24 ↦ 18`, preserving the `(5,5)`-Ramsey
  property; so `G` or `Gᶜ` has a vertex of degree 18 or 20.
- `Ramsey.ExcludesDegree d` — the branch-hypothesis shape: no 43-vertex
  `(5,5)`-Ramsey graph has a vertex of degree exactly `d`.
- **`Ramsey.ramsey_5_5_43_of_d18_d20`** — the requested phrasing: a proof of
  the d18 case (`ExcludesDegree 18`) and a proof of the d20 case
  (`ExcludesDegree 20`) together prove the entire order-43 statement
  (`¬ IsRamseyGraph 5 5 G` for every `G : SimpleGraph (Fin 43)`).
- `Ramsey.ramseyNumber_5_5_le_43_of_d18_d20` — the same composition into
  `ramseyNumber 5 5 ≤ 43`.

## Verification

- `lake build` clean; zero new `sorry` (the only `sorry` remains the
  deliberate main target `R_5_5_43`).
- `#print axioms`: `degree_add_compl_degree` and `exists_even_degree` use
  only `propext`, `Classical.choice`, `Quot.sound`; the four Ramsey-consuming
  theorems add exactly the named premise `Ramsey.ramsey_4_5_le_25`
  (transitively, via `degree_mem`), consistent with the lean `README.md`
  evidence rules.

## Scope and non-claims

- Existence of a pivot, not a canonical-pivot tie rule: the branch hypotheses
  must hold for *every* degree-18 (resp. degree-20) vertex, per the last
  paragraph of `reductions.md` §3.
- Only the even-pivot scheme is covered. The complement-normalized
  minimum-degree split (including its minimum-degree-19 branch) is not
  formalized and must not be merged with this split without the separate
  coverage argument flagged in `docs/proof_review_2026_10_13.md`.
- No branch is closed: `ExcludesDegree 18` and `ExcludesDegree 20` are
  hypotheses. No novelty claim; no graph search, solver, download, or
  installation. Shared navigation files (`n43/reductions.md`) were left for
  coordinator integration.

Concurrent work preserved: uncommitted `lean/Ramsey/D18.lean` API cleanup by
another agent was untouched and still builds.
