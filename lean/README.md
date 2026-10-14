# Lean 4 scaffolding

Scaffolding for formalizing results of the R(5, 5) project in Lean 4 with
Mathlib. Nothing is formalized yet; this directory only provides the build
setup and module skeleton. Statements added here must mirror the claim /
review discipline of `../AGENTS.md` and `../docs/workflow.md`.

## Layout

| Path | Purpose |
| --- | --- |
| `lakefile.toml` | Package `Ramsey`; depends on Mathlib `v4.35.0` |
| `lean-toolchain` | `leanprover/lean4:v4.35.0` (must match Mathlib's pin) |
| `lake-manifest.json` | Pinned dependency revisions; keep committed |
| `Ramsey.lean` | Root module: re-exports; hosts the `R_5_5_43` main target |
| `Ramsey/Defs.lean` | Pure definitions: `IsRamseyGraph`, `ramseyNumber`, pivot vocabulary (`antiNeighborSet`, `crossEdgeSet`, `rowSet`, `columnSet`, `IsTransversal`) — no premise imports |
| `Ramsey/Premises.lean` | Trusted published facts as named axioms, on top of `Defs` (audit trail via `#print axioms`) |

## Build

Requires `elan` (Lean 4.35.0 installs automatically from `lean-toolchain`).

```sh
cd lean/
lake update            # only when changing the Mathlib pin
lake exe cache get     # fetch prebuilt Mathlib artifacts (once, ~GBs)
lake build
```

`lake update` rewrites `lake-manifest.json`; commit the result so builds are
reproducible. `.lake/` is ignored.

## Evidence rules for proofs

- A lemma counts as proved only if its file builds with zero `sorry` and
  `#print axioms` reports only `propext`, `Classical.choice`, `Quot.sound`.
- Record the correspondence between a Lean name and the informal claim in
  `../n43/` or `../docs/` (claim file and revision) in the module docstring.
- Do not weaken a statement to make it provable; if the informal claim needs
  an extra hypothesis, say so in the docstring and flag it in the handoff.
