# research/ folder move, 2026-10-22

Move record per workflow: reference-only moves preserve the old provenance and
record the move. No proof bodies, claim anchors, review outcomes, or recorded
hashes changed.

## What moved

At base revision `dab3082` (working tree carried uncommitted Lean and d18
navigation edits from concurrent tasks; their content is preserved
byte-identical):

- `n43/` → `research/n43/`
- `reports/` → `research/reports/`
- `n17/` → `research/n17/` (untracked before and after)

## Reference rewrites

- Outside → moved: `n43/`, `reports/`, and `n17/` path tokens gained the
  `research/` prefix in `README.md`, `WORK.md`, `.agents/AGENTS.md`, `docs/`,
  Lean prose (`lean/README.md`, `lean/AGENTS.md`), and engine/test sources.
- Moved → outside: parent-relative links to `docs/`, `results.md`,
  `README.md`, `WORK.md`, `lean/`, `src/`, `scripts/`, `tests/`, `tex/`, and
  `.agents/` gained one `../` level.
- Moved → moved sibling links (`../n43/`, `../reports/`, `../n17/`) are
  unchanged and remain valid.
- Claim-ID path prefixes updated (for example
  `n17/r44.md#claim-r44-parameters` →
  `research/n17/r44.md#claim-r44-parameters`); anchors unchanged.

## Explicitly untouched

- The Lean module trees `lean/Ramsey/n43/` and `lean/Ramsey/n17/`: physical
  code locations did not move, and `Ramsey/n43/...` references (READMEs,
  sorry ledger, style allowlist, docstrings) are preserved.
- Retained experiment artifacts under dated report directories
  (`.json`, `.py`, `.log`, `.g6` provenance bytes).
- All recorded SHA-256 hashes: they pin reviewed content, not locations.
  Historical manifests keep their original path strings as records.

## Verification

Repo-wide relative-link check: 1881 links resolve, 0 broken by the move. The
checker flags three items that predate the move (verified at the pre-move
revision): two dangling links in `2026-10-17-d18-connectivity.md` and
`2026-10-19-k1-pb-remote-handoff.md`, and one false positive on math prose in
`research/n43/d18/large_row_extensions.md`.
