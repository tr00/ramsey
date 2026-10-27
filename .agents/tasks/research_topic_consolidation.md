# Consolidate research topics

## Goal and scope

This is **editorial refactoring**, not new mathematical research or formalization.
Migrate a bounded set of existing research topics to one authoritative Markdown
file per topic under `research/`. Keep metadata and a summary at the top, complete
mathematical development and independent review inline, and a changelog last.
Reduce file proliferation and repetitive bookkeeping without losing mathematics,
review provenance, or evidence.

The spawning instruction should identify the topics or a bounded area to inspect.
If it delegates topic selection, choose a small, coherent batch and state its
boundaries before editing. This brief does not authorize a repository-wide
migration, new proofs, renewed review, solver runs, or dependency installation.

Read the current [repository instructions](../AGENTS.md),
[workflow](../../docs/workflow.md),
[evidence policy](../../docs/reproducibility.md), and
[active ownership](../../WORK.md). They govern this task; do not rely on older
instructions embedded in historical reports. Use existing consolidated topics,
such as [cut capacity](../../research/foundations/cut_capacity.md) and
[family overlap](../../research/foundations/family_overlap.md), as format examples,
not as substitutes for the current policies.

## What to look for

Prioritize reusable foundations, topics with several consumers, dependencies of
recently consolidated work, and results with existing Lean correspondence.
Typical migration candidates have:

- Mathematical notes outside `research/`, especially `docs/general_theorems/`.
- Separate theorem, proof, review, audit, handoff, or session-report files covering
  the same topic.
- Repeated claim metadata, timestamps, task tokens, prose hashes, and stale
  author-stage `ready` labels alongside later independent acceptance.
- Useful findings stranded in reports or machine-readable proof/review snapshots.
- Navigation and validation drivers referring to historical paths.

Group by mathematical scope, not by session or filename similarity. Shared
foundations normally belong in `research/foundations/`; branch-specific results
stay beside their branch. Keep distinct topics separate rather than building an
omnibus file. Keep genuinely different hypotheses explicit: degree-18 pivot
selection, residual d20, and normalized minimum-degree20 are not interchangeable.
Reference documents, policies, and indexes need not become research topics.

## 1. Map sources and ownership

- Read each complete source and all relevant independent reviews. Identify
  corrections, superseded arguments, per-section status, numerical premises,
  validation records, evidence artifacts, and current consumers.
- Map explicit claim anchors and heading targets before moving anything. Search
  inbound references in Markdown, code, scripts, JSON, and Lean documentation;
  distinguish live dependencies from immutable historical source/hash records.
- Capture original source bytes and the relevant evidence baseline for comparison.
  Keep temporary comparison data outside the retained research tree; do not create
  a new prose-hash manifest or session report.
- Claim precise paths in `WORK.md`. Preserve concurrent changes and other owners'
  work. If delegating genuinely independent topics, give each agent distinct
  source/destination ownership; one integration owner updates shared references,
  indexes, ownership, and performs final verification.

## 2. Establish acceptance correspondence

An acceptance banner or a matching filename is not enough. Determine which proof
was independently reviewed and whether that argument is the one being retained.

Historical reviews may name uncommitted snapshots by hash. Use retained manifests
and Git history to establish correspondence. For example, a committed integration
snapshot may reconstruct the reviewed bytes after removing only its integration
banner. Verify that relation; never assume the uncommitted snapshot exists in Git.
Inspect intervening differences instead of dismissing them as administrative.

Preserve each reviewer's identity, covered claims, decisive checks, substantive
findings or repairs, outcome, dependencies, and limits. Keep distinct reviews
identifiable, but do not duplicate theorem proofs inside them. Recover useful
checks omitted by earlier condensation when necessary. Pure relocation does not
constitute a new review. Do not promote self-audited sections, apply one section's
acceptance to the whole file, or silently reconcile unrelated status disputes.
If correspondence cannot be established, make the limitation explicit rather
than claiming current acceptance for unmatched text. Do not silently repair a
mathematical gap as part of this editorial task.

## 3. Consolidate and cut over

- Preserve exact mathematical settings, statements, quantifiers, hypotheses,
  definitions, proof arguments, formulas, tables, exceptional cases, search-use
  conditions, and limitations. Remove repeated administrative fields, not their
  substantive continuation lines.
- Put scope, dependencies, authors/reviewers, result kind, current review state,
  summary, and permitted use at the top. Use a compact section-level table when
  statuses or hypotheses differ. Separate literature premises, proved results,
  conjectures, heuristics, and designs.
- Retain full development and substantive historical independent review inline.
  Keep stable claim anchors and preserve old heading targets through unchanged
  headings or explicit aliases. Link to topic paths and anchors; do not leave
  compatibility stub files or duplicate authoritative copies.
- Remove obsolete readiness gates only where review has actually occurred.
  Author checks and fresh validation are not independent acceptance.
- Update every live inbound reference and any path-sensitive executable consumer.
  Update indexes as navigation, without duplicating proofs or review histories.
- Preserve historical evidence hashes and their original path meanings. Do not
  repin them to relocated or edited bytes. Distinguish a live JSON dependency
  reference that needs migration from an immutable historical fingerprint field.
- Never restore files another task or the user deleted merely to make a link work.
  If a deleted report contains relevant history, recover useful content from Git
  into the topic and identify it as historical. Do not claim a deleted driver,
  fixture, output, or removed Lean theorem is currently available or was replayed.
- Keep necessary witnesses, certificates, replay inputs, and machine-readable
  proof/review evidence. The one-file rule concerns authoritative research prose,
  not those artifacts. Delete superseded prose sources only after their useful
  content and review correspondence have been retained.
- End with a concise mathematical/review changelog. Do not duplicate Git's edit
  history, session transcripts, timestamps, or prose hashes throughout the topic.

## 4. Verify and finish

1. Compare the complete mathematical development against the captured sources.
   Normalize only identified administrative fields, link relocation, and reflow;
   compare all scopes, dependencies, conclusions, proofs, tables, search conditions,
   and limits, not just paragraphs labelled `Proof`. Explain every other difference.
2. Check all old statement and heading targets and all affected local links.
   Scan for live references to retired paths. Distinguish pre-existing broken
   links outside the batch from migration regressions; report the former without
   broadening the task silently.
3. Verify relevant retained evidence and historical manifests remain byte-identical,
   except explicitly required live-consumer edits, whose narrow changes must be
   accounted for. Never rewrite historical outputs to make verification pass.
4. Exercise the changed path. For prose-only mathematics, use read-only navigation
   checks and trivial exact arithmetic or prescribed fixed-object checks for the
   displayed examples. If a validator is affected, inspect it before execution:
   some write outputs or derive the repository root from their directory depth.
   Replay in a suitable temporary tree when needed to avoid overwriting evidence.
   Do not run solver searches, enumerate candidate graph families, or replay large
   experiments under the label of validation. Run applicable repository checks
   only for areas actually changed, following current area-specific instructions.
5. Record useful validation and its limits in the authoritative topic. Separate
   fresh checks from historical reported results and independent review. Remove
   temporary scaffolding, then release only your completed `WORK.md` row.

## Completion report

Report the authoritative topic paths, retired prose files, updated consumer areas,
preserved statements/anchors and review outcomes, exercised verification, evidence
integrity, and any unresolved historical or pre-existing link limitations. Do not
claim a new theorem, renewed acceptance, formalization, or branch closure from an
editorial migration. No separate retained report or review file is required.
