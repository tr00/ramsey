# Shared-worktree coordination

The coordinator maintains this table. Agents work on distinct owned paths and
submit handoffs; see [workflow](docs/workflow.md). An empty active table is not
a lock against user edits. Re-read files before changing them.

| Task token | Owner | Base revision | Owned paths | State / handoff |
| --- | --- | --- | --- | --- |
| structure-20261014 | Codex | 3334460 | Branch navigation, documentation migration, workflow | Completed; see reports/2026-10-14-structure.md |
| pairwise-d18-20261014 | Codex coordinator and three comparison agents | 81c768a | Pairwise proof notes, five exact reviews, x136/r2/r3 navigation, narrow shared-index integration | Research completed; x136/r3 excluded and all comparison claims independently accepted on recorded premises; see reports/2026-10-14-d18-pairwise-refinements.md; committed at user request; ownership released after commit |
| band137-20261014 | Codex coordinator and three branch agents | 81c768a | Above-frontier profiles, four-column stability, q3 actual-column theorem, transfer bounds, exact reviews and narrow shared-index integration | Completed; ownership released; see reports/2026-10-14-d18-ge137.md; included in user-requested commit |
| band137-flat-20261014 | Codex coordinator | 81c768a | Sibling x cases, transfer-note/review reference migration, navigation and move manifest | Completed; ownership released; reports and original Git band report rechecked, no x<=142 proof located; see reports/2026-10-14-d18-layout.md; included in user-requested commit |

Future entries should identify input claim revisions, acceptance criteria, and
blockers in the handoff column or a linked branch-local note. Remove completed
entries once their historical report is sufficient; keep active ownership clear.
