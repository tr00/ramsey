# Lean 4 scaffolding

Scaffolding for formalizing results of the R(5, 5) project in Lean 4 with
Mathlib, under the evidence rules below: premises are isolated as named
axioms, everything else is machine-checked, and the only deliberate `sorry`s
are the two even-pivot branch targets `Ramsey.d18.excludes` and
`Ramsey.d20.excludes`; the main target `R_5_5_43` is proved from them by
the reduction `Ramsey.ramsey_5_5_43_of_d18_d20`. Statements added here must
mirror the claim / review discipline of `../AGENTS.md` and
`../docs/workflow.md`.

## Layout

| Path | Purpose |
| --- | --- |
| `lakefile.toml` | Package `Ramsey`; depends on Mathlib `v4.35.0` |
| `lean-toolchain` | `leanprover/lean4:v4.35.0` (must match Mathlib's pin) |
| `lake-manifest.json` | Pinned dependency revisions; keep committed |
| `Ramsey.lean` | Root module: re-exports everything below; hosts the single theorem `R_5_5_43`, proved modulo the two branch `sorry`s |
| `Ramsey/Premises.lean` | Trusted published facts as named axioms, on top of `Defs` (audit trail via `#print axioms`) |
| `Ramsey/D18.lean` | Degree-18 frontier on top of `Premises`: neighborhood/antineighborhood Ramsey transfer, `18 ≤ d(v) ≤ 24` on 43 vertices, common-neighbor bounds |
| `Ramsey/EvenPivot.lean` | Even-pivot root reduction (d18 ∪ d20, `../n43/reductions.md` §3): handshaking + complement symmetry give `exists_degree_18_or_20_up_to_compl`; `ramsey_5_5_43_of_d18_d20` composes a proof of the d18 case (`ExcludesDegree 18`) and a proof of the d20 case (`ExcludesDegree 20`) into the entire order-43 statement, and `ramseyNumber_5_5_le_43_of_d18_d20` into `R(5,5) ≤ 43` |
| `Ramsey/d18/Exclusion.lean` | d18 branch target `Ramsey.d18.excludes : ExcludesDegree 18` — deliberate `sorry`, mirrors `../n43/d18/` (all pivots, not a tie rule) |
| `Ramsey/d20/Exclusion.lean` | d20 branch target `Ramsey.d20.excludes : ExcludesDegree 20` — deliberate `sorry`, mirrors `../n43/d20/`; arbitrary even-pivot d20, *not* the normalized min-degree-20 scheme of `../n43/min-degree20/` |
| `Ramsey/Endgame.lean` | Endgame glue `ramsey_5_5_eq_43`: order-43 exclusion + Exoo's 42-vertex witness ⇒ `ramseyNumber 5 5 = 43` |

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
- Record the correspondence between a Lean name and the informal claim in
  `../n43/` or `../docs/` (claim file and revision) in the module docstring.
- Do not weaken a statement to make it provable; if the informal claim needs
  an extra hypothesis, say so in the docstring and flag it in the handoff.
