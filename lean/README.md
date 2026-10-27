# Lean 4 formalization

Formalization of the R(5, 5) project's results in Lean 4 with Mathlib, under
the evidence rules below: premises are isolated as named axioms in
[`Ramsey/Premises.lean`](Ramsey/Premises.lean). The target theorem
`Ramsey.R_5_5_43` in [`Ramsey.lean`](Ramsey.lean) reduces to the even-pivot
branch obligations `Ramsey.d18.excludes` and `Ramsey.d20.excludes`;
deliberate `sorry`s inside them are tracked by
[`scripts/sorry-ledger.txt`](scripts/sorry-ledger.txt) and the audited axiom
set by [`scripts/expected-axioms.txt`](scripts/expected-axioms.txt), both
enforced by [`scripts/check.sh`](scripts/check.sh).

This file is a static overview of purpose, layout, build and evidence rules.
Proof status, claim correspondence and review decisions live elsewhere: the
ledgers above, the `.lean` docstrings, and the authoritative topic files
under [`../research/`](../research/). Style and file placement rules for
`.lean` files: [AGENTS.md](AGENTS.md).

## Layout

| Path | Purpose |
| --- | --- |
| `lakefile.toml` | Package `Ramsey`; depends on Mathlib `v4.35.0` |
| `lean-toolchain` | `leanprover/lean4:v4.35.0` (must match Mathlib's pin) |
| `lake-manifest.json` | Pinned dependency revisions; keep committed |
| `AGENTS.md` | Style and placement rules for `.lean` files |
| `Ramsey.lean` | Root module; re-exports everything; hosts `R_5_5_43` |
| `Ramsey/Premises.lean` | Trusted published facts as named axioms |
| `Ramsey/basics/` | Premise-free background: graph, transversal and Ramsey theory |
| `Ramsey/defs/` | Shared vocabulary: completeness, Ramsey graphs, transversals, rooted graphs, boundary profiles |
| `Ramsey/theorems/` | Reusable theorems; catalogue in [Ramsey/theorems/README.md](Ramsey/theorems/README.md) |
| `Ramsey/n03/`, `n04/`, `n06/`, `n09/`, `n18/` | Small Ramsey bounds `R(3,2) ≤ 3`, `R(4,2) ≤ 4`, `R(3,3) ≤ 6`, `R(4,3) ≤ 9`, `R(4,4) ≤ 18` |
| `Ramsey/n17/` | Order-17 structure: signatures, regularity, Paley-17 uniqueness |
| `Ramsey/n43/` | Order-43 branch: even-pivot reduction and the d18/d20 subcases |
| `scripts/` | `check.sh` gate: build, sorry ledger, style check, axiom audit |

`R(3,5) ≤ 14` and `R(4,5) ≤ 25` remain published axioms in
`Ramsey/Premises.lean`; the small bounds above are proved theorems using only
`propext`, `Classical.choice` and `Quot.sound`.

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
- A Lean statement must mirror its informal source claim exactly. Record the
  correspondence (topic path and stable anchor) and research-side review
  decisions in the authoritative topic file under `../research/`. Do not
  create a handoff report or put Markdown references in the `.lean` file
  (see `AGENTS.md`).
- Do not weaken a statement to make it provable; if the informal claim needs
  an extra hypothesis, say it in the docstring and flag it in the topic file.
