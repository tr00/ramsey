# Shared-worktree coordination

The coordinator maintains this table. Agents work on distinct owned paths and
submit handoffs; see [workflow](docs/workflow.md). An empty active table is not
a lock against user edits. Re-read files before changing them.

| Task token | Owner | Base revision | Owned paths | State / handoff |
| --- | --- | --- | --- | --- |
| structure-20261014 | Codex | 3334460 | Branch navigation, documentation migration, workflow | Completed; see reports/2026-10-14-structure.md |

Future entries should identify input claim revisions, acceptance criteria, and
blockers in the handoff column or a linked branch-local note. Remove completed
entries once their historical report is sufficient; keep active ownership clear.
