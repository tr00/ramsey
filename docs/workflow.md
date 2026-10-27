# Research topics, ownership, and independent review

## Organization

Keep one authoritative Markdown file per research topic under `research/`.
Statements, proofs, review findings, useful experimental results, and open
questions belong in that file, not in separate claim, theorem, proof, review,
handoff, or session-report files. Update an existing topic instead of creating
a file for each task or continuation.

Use mathematical scope for paths and descriptive lowercase snake_case topic
filenames. Place shared topics at the nearest parent where their hypotheses
apply, including general foundations under `research/`. Different schemes
retain distinct scopes.

Keep stable anchors for separately referenced statements and link by topic path
and anchor. A topic can contain several related statements without repeating
the same metadata for each. Keep unrelated hypotheses and conclusions explicit;
do not combine topics merely to reduce the file count.

Indexes such as `results.md`, branch READMEs, and the theory map are navigation.
Link to the authoritative topic and summarize only what navigation requires.
Do not duplicate proofs, review records, or task histories in indexes.

## Topic file structure

Use this order:

1. **Metadata and summary at the top.** State scope, ambient graph types and
   hypotheses, dependencies and literature citations, kind of result, current
   review state and permitted search use. Summarize the conclusions, limits,
   and open questions. Include authors and independent reviewers as applicable.
   Use a compact section-level table when review states or hypotheses differ.
2. **Detailed development.** Include definitions, exact statements, complete
   proofs, and any useful validation commands and results. Record independent
   review findings alongside the relevant sections or in an inline review
   subsection here. Do not repeat the proof in the review.
3. **Changelog at the bottom.** Record meaningful mathematical changes,
   corrections, dependency changes, and review decisions. Keep entries concise;
   do not reproduce session transcripts or Git's file-edit history.

Distinguish literature premises, proved-here deductions, conjectures, heuristics,
designs, and failed approaches. Review states are `draft`, `ready`,
`changes-requested`, `accepted`, or `withdrawn`. Keep kind, review state, and
permitted search use separate. Acceptance is not a novelty claim or a formally
checked certificate.

Git history holds superseded prose and coordination history. Do not create
dated research reports, sibling review files, or prose-hash manifests. Do not
repeat timestamps, task tokens, source hashes, or base revisions in topic
metadata, review records, and changelogs. The changelog records what matters
mathematically, not who edited which file when.

## Same-worktree collaboration

All agents and the user share this worktree. Use [WORK.md](../WORK.md) for
current task tokens, owners, base revisions, owned paths, and handoff state.
One owner integrates edits to a shared topic, including inline reviews;
reviewers can send findings to that owner without creating another file.
Remove completed rows after useful results and review decisions have been
integrated into the topic. Documentation-only tasks update the applicable
documentation instead; no separate handoff report is required.

The coordinator owns edits to WORK.md, results.md, root policy, and shared
branch indexes during integration. Agents send handoff details to the
coordinator rather than racing to update these files.

Before editing, re-read the target and preserve concurrent changes. Do not edit
another task's owned paths. If two tasks need the same topic, agree on an
integration owner before either edits it; do not create competing topic files.
Never reset, clean, stash, switch branches, or overwrite shared files to isolate
one task. Commits, staging, and integration are coordinated because the Git
index is shared. Unrelated user changes must be preserved.

Handoffs identify affected topics and sections, review state, changed
dependencies, unresolved issues, and next actions. They are coordination
messages, not additional retained reports. This protocol does not itself
authorize spawning agents.

## Independent review and gates

Independent review remains required before acceptance. The reviewer must be
distinct from the author and independently check assumptions, quantifiers,
ambient types, algebra, case coverage, dependency applicability, and permitted
search use. An author's audit or validation run remains a self-check.

Record the reviewer, covered statement anchors or sections, decisive checks,
substantive findings or repairs, outcome, and remaining limits in the topic
file. Acceptance must apply to the proof actually retained. Review the current
text and resolve intervening proof edits before recording acceptance; use Git
for committed revision history, not duplicated prose hashes or timestamps.
Do not mark a whole topic accepted when only some sections were reviewed.

A mathematical proof change requires renewed review of affected sections.
A changed or withdrawn dependency also puts affected dependents and pruning
uses into pending review. Update current metadata and note the change in the
changelog; Git retains superseded outcomes. Pure editorial moves that preserve
the argument and its scope do not constitute a new mathematical review.

A branch closes only with applicable closure evidence and the required coverage
argument. Distinguish disjoint partitions from overlapping unavoidable families.
A timeout, failed search, empty frontier, or metadata validation cannot prove
nonexistence. Follow [reproducibility policy](reproducibility.md) for evidence.
Necessary machine-readable artifacts may accompany the topic under `research/`;
they are evidence, not additional prose reports.

## Existing material

Existing research files outside `research/`, separate reports and reviews, and
historical manifests are legacy material awaiting a separately scoped migration.
This policy change does not itself move, delete, or reconcile them. Their links
and evidence remain valid historical references; do not add new reports or
separate reviews under the old conventions.

When migrating a topic, preserve exact statements, proof arguments, stable
anchors, substantive review findings, and the distinction between reviewed and
unreviewed sections. Match historical acceptance to the proof retained rather
than assuming an uncommitted snapshot exists in Git. Update inbound links and
record the consolidation in the topic changelog. Use Git for the old reports,
timestamps, and prose hashes instead of copying that bookkeeping into the topic.
Do not rewrite historical evidence hashes to describe different bytes or discard
the only copy of branch-closing evidence.
