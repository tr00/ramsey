# Markdown consolidation report

Date: 2026-10-18. Task: `markdown-consolidation-20261018`.
Documentation reorganization only; no mathematical content, proof note,
review file, claim body, or status label was changed.

## Changes

1. Consolidated the twelve undated 2026-10-13..14 session-summary stubs in
   `research/reports/` into
   [early_session_reports.md](early_session_reports.md) (544 lines across
   twelve files became 381 lines in one file). Section content is preserved
   as written; only headers, repeated per-file disclaimers, and absolute
   `/scratch/ramsey` proof pointers were merged or converted to relative
   links. Every stub was a summary whose full proofs live in `research/n43/` and
   `docs/` notes; no proof text was deleted.
2. Removed the accumulated per-task status changelog from
   `docs/theory_phase_1.md` section 9 (751 -> 608 lines). The nine
   2026-10-14..17 paragraphs duplicated the operational index, branch
   READMEs, dated reports, and the results dashboard, and had grown stale:
   five referenced pre-migration file names (`degree18_excess_bounds.md`,
   `degree18_pivot_classes.md`, `degree18_cliques_augmentation.md`,
   `degree18_small_columns.md`, `frontier_band.md`) and one asserted the
   superseded "only r=0,1 live at x136" status. Each paragraph's facts
   remain recorded at their home: `research/n43/reductions.md` sections 8-10 and 16,
   `research/n43/d18/README.md`, `research/n43/d18/x136/README.md`,
   `docs/general_theorems/README.md`, and the dated reports. The original
   proof-targets list and sections 1-8, 10 are unchanged; sections before
   line 552 are byte-identical, preserving the line-number reference from
   `research/reports/2026-10-15-lean-even-pivot.md` to section 2.
3. Updated all inbound references to the removed stubs:
   `research/n43/reductions.md` (section 8.12 audit pointer, section 17 source list,
   `Last updated` date), `research/n43/d18/x136/r4/README.md` (historical-report
   link), and `research/reports/2026-10-14-d18-layout.md` (four session-report
   links). No other file referenced the stubs; the historical
   `docs/` -> `research/n43/` entries in `2026-10-14-structure-migration.json` were
   left untouched.

Not changed: all dated reports, proof notes, review/audit files (their
recorded exact-revision hashes stay meaningful), migration manifests,
`docs/lemma_phase_2.md` (contains the hash-pinned frontier-anchor
subsection), Lean sources, and concurrent uncommitted work such as
`tex/main.tex`.

## Validation

Repo-wide Markdown link check (excluding `third-party/`, `.lake/`, `.git/`):
803 links resolve, including every anchor into the new archive; the only
regex hits besides those were pre-existing non-link math prose such as
`` `G[R_u]` ... `(4,4)` `` and a fenced suggested-snippet in
`research/reports/2026-10-17-d18-connectivity.md`. A grep for the twelve removed
file names over `*.md`, `*.json`, `*.lean`, `*.py` finds only the archive's
own provenance list and the historical migration manifest. Net effect:
research/reports/ loses eleven files and 163 lines; `docs/theory_phase_1.md` loses
143 lines. No solver, enumeration, download, staging, or commit.
