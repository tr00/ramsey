# Lean defs split, 2026-10-16

Task token: `lean-defs-split-20261016` (see WORK.md). Pure code
reorganization, no mathematical content added, removed or weakened.

## What changed

- `lean/Ramsey/Defs.lean` (10.8 KB) was split into
  `lean/Ramsey/defs/RamseyGraph.lean` (core Ramsey graph vocabulary, explicit
  bound predicates, balanced-clique vocabulary, premise-free transfer lemmas)
  and `lean/Ramsey/defs/Transversals.lean` (pivot decomposition, cross-edge
  counting, rectangle predicates, set-family and transversal vocabulary).
- The premise-free general lemmas formerly in `lean/Ramsey/D18.lean` moved
  next to their vocabulary: `compl_induce`, `indepSetFree_induce`,
  `isRamseyGraph_induce_neighborSet`, `isRamseyGraph_induce_commonNeighbors`
  to `defs/RamseyGraph.lean`; `antiNeighborSet_eq_compl`,
  `isRamseyGraph_induce_antiNeighborSet`,
  `card_neighborSet_add_antiNeighborSet` (with its `haveILetI` style option)
  to `defs/Transversals.lean`. `D18.lean` now holds only the
  premise-consuming frontier: `ramsey_5_4_le_25`, `degree_le_24`,
  `degree_mem`, `card_commonNeighbors_le_13`.
- Direct importers updated: `Ramsey.lean`, `Ramsey/Premises.lean`,
  `Ramsey/D18.lean`, `Ramsey/theorems/TransversalCompatibility.lean`,
  `Ramsey/theorems/TransversalDeletion.lean`. Additionally
  `Ramsey/theorems/TransversalFour.lean` now imports
  `Ramsey.defs.Transversals` directly: it previously reached the transversal
  vocabulary only transitively through `Premises → Defs`.
- Documentation pointers updated: `lean/AGENTS.md` placement rules,
  `lean/README.md` layout, `Ramsey/theorems/README.md`,
  `tex/main.tex` (now points at `lean/Ramsey/defs/Transversals.lean`),
  `scripts/style-allowlist.txt` (stale `Ramsey/Defs.lean` entry dropped).

## Invariants preserved

- No declaration was renamed, retyped or restated; the `Ramsey` namespace is
  unchanged, so every external name, including the audited targets in
  `scripts/expected-axioms.txt`, is identical.
- The new files follow the visibility rules in `lean/AGENTS.md`: no blanket
  `@[expose] public section`; every definition is individually
  `@[expose] public` so that importer-side unfolding (`simp [antiNeighborSet]`,
  `rw [IsTransversal]`, direct application of `RamseyEdgeLowerBound` axioms,
  anonymous constructors against `IsRamseyGraph`, defeq `change` against
  `rowSet` / `columnSet`) still elaborates. Theorems stay plain `public`
  since consumers apply rather than unfold them. This was validated by the
  build: without `@[expose]` the consumers failed exactly at those spots.
- Moved docstrings dropped their markdown and tex references, which
  `lean/AGENTS.md` forbids from `.lean` files; the correspondence is kept
  from the markdown side (`tex/main.tex`, `lean/README.md` rows noting
  `../tex/core_definitions.tex`).
- Rewritten comment text contains no new em-dashes or semicolons, so the
  style entry for the deleted file could be removed.

## Verification

- `lake build`: success (9063 jobs).
- `sh lean/scripts/check.sh`: PASS — toolchain pin, full build, per-file
  elaboration with the sorry ledger unchanged (4 listed files, same counts),
  style, and the axiom audit byte-identical to `scripts/expected-axioms.txt`,
  confirming no change to trusted premises.

Historical records referencing the old path (WORK rows of 2026-10-15, the
hash manifest `reports/2026-10-15-lean-reductions.json`) were left untouched.
