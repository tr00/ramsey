# Theory map creation

Date: 2026-10-19. Task token: `theory-map-20261019`. User-directed session.

## What was produced

1. `docs/theory_map.md` (new): the dependency-ordered pyramid for the
   order-43 program, from trusted premises to `R(5,5) = 43`:
   - L0 premises (with the exact `lean/Ramsey/Premises.lean` axiom names);
   - L1 general `(r,s)` toolkit (`docs/general_theorems`, 30 general claims
     plus 5 specializations, all accepted);
   - L2 universal order-43 theory; L3 rooted interface theory;
   - L4 root-selection covers and symmetry machinery;
   - L5 branch theories, with the d18 geometry made explicit as two
     orthogonal complete covers (x-slices; connectivity `c/k1/k2/k3`) plus
     the tau overlay, the closed nodes (`x=136`, `x=137`), and the open
     frontier;
   - L6 the `Complete` obligation algebra, the sorry ledger, and the
     certificate ladder (reduction index section 14.4);
   - apex assembly (`R_5_5_43`, `ramsey_5_5_eq_43`);
   - formalization backlog B1-B7 in dependency order;
   - the open-obligation ledger (definition of done) and a metadata-lag list.
2. Narrow navigation: one row in `results.md`; one starting-points bullet in
   `.agents/AGENTS.md`; one line in `research/n43/reductions.md` section 17; one
   `WORK.md` row; this report.

## Method and inputs

- Primary sources read directly: `results.md`, `research/n43/README.md`,
  `research/n43/reductions.md` (sections 1-17 via extraction), `research/n43/d18/README.md`,
  `research/n43/d18/x-ge137/README.md`, `research/n43/d18/tau/README.md`,
  `research/n43/d20/README.md`, `docs/workflow.md`, `docs/mathematical_baseline.md`,
  `docs/theory_phase_1.md`, `docs/lemma_phase_2.md`,
  `lean/README.md`, `lean/AGENTS.md`, `lean/Ramsey.lean`,
  `lean/Ramsey/{Premises,Endgame}.lean`, `lean/scripts/sorry-ledger.txt`,
  `lean/Ramsey/theorems/README.md`.
- Three read-only extraction subagents inventoried claims and statuses:
  `GeneralTheorems` (docs/general_theorems), `D18Branch` (research/n43/d18 tree,
  about 190 claims), `ReductionIndex` (reduction index sections 4-17 plus
  d20/min-degree20/symmetry_structure). Their outputs were cross-checked
  against the primary sources above before use.
- Statuses are mirrored from source notes, reviews, and `WORK.md`
  integration rows. The map promotes nothing and records no mathematics.

## Checks

- Relative-link verification over all five touched files: 207 links
  checked, 0 broken (script: extract markdown link targets from the five
  files, resolve relative to each file, assert existence).
- Formal-status assertions were checked against `lean/scripts/sorry-ledger.txt`
  (5 branch-target sorries; 17 + 2 statement-only toolkit sorries) and
  `lean/Ramsey/theorems/README.md` (30 general + 5 specializations).
- Concurrent-work adaptation: during the session the k1 task integrated
  `review_triangle_capacity_20261019_exterior_audit.md` and the
  whole-branch-obstruction report; the map's k1 row and lag list were
  updated to the post-integration state before delivery.

## Limits

- Navigation only. No proof, review, claim status, proof body, Lean source,
  engine file, manifest, or review file was created or altered.
- The map's layer assignments and one-line summaries compress source
  statements; each linked source remains authoritative for full hypotheses.
- Metadata lags (section 12 of the map) are recorded, not reconciled.
- No solver, search, download, staging, or commit. Ownership released.
