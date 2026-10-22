# Naming, ownership, and proof review

## Organization

Mathematical case paths are the primary names: `research/n43/d18/x136/r0` means the
order-43, chosen-degree-18-pivot, equality-frontier case with no size-four
cross columns. Each branch README defines its predicate, parent assumptions,
split scheme, and coverage source. Different schemes use different paths;
`research/n43/d20` and `research/n43/min-degree20` are not interchangeable.

Place shared proofs at the nearest parent where their hypotheses apply.
Keep concise historical reports in `research/reports/`, global foundations and mixed
phase notes in `docs/`, and branch-specific proofs beside the branch README.
Do not create separate claim, task, or source trees merely to satisfy a template.

Use descriptive lowercase snake_case proof filenames. Give independently
reviewable statements stable anchors such as `claim-small-columns-01`.
Reference them by repository path and anchor. Preserve anchors when renaming
files and record the move. Reviews are sibling files named
`review_<claim-slug>_<date>_<reviewer-token>.md`. Historical reviews remain
historical; migration does not promote their status.

Each result has one home: its proof note. Branch READMEs and
`research/n43/reductions.md` link to that note and summarize only the assumptions,
conclusion, and permitted use needed for navigation. Reports record what
changed, validation, and unresolved work without repeating the proof.

## Same-worktree collaboration

All agents and the user share this worktree. Use [WORK.md](../WORK.md) to list
active task tokens, owners, base revisions, owned paths, and handoffs. Assign
unique tokens once; use them in new filenames when collision is possible.
Remove completed rows after their handoff is recorded in the dated report;
Git history preserves the coordination record.
The coordinator owns edits to WORK.md, results.md, root policy, and shared
branch indexes during integration. Agents send handoff details to the
coordinator rather than racing to update these files.

Before editing, re-read the target and check its current hash/diff. Do not edit
another task's owned paths. Prefer new branch-local files for independent work;
if two tasks need the same file, agree on ownership before either edits it.
Never reset, clean, stash, switch branches, or overwrite shared files to isolate
one task. Commits, staging, and integration are coordinated because the Git
index is shared. Unrelated user changes must be preserved.

Task handoffs name the exact files, hashes or revisions, claims, review state,
changed dependencies, unresolved issues, and suggested next actions. Parallel
work is supported, but this protocol does not itself authorize spawning agents.

## Claim template

A note may contain multiple claims when they form a readable derivation. Give
each separately reviewable claim its own statement and metadata:

```text
Claim ID: path#stable-anchor
Kind: local-deduction | literature-premise | conjecture | heuristic | design
Review state: draft | ready | changes-requested | accepted | withdrawn
Scope: branch path, ambient graph types, quantifiers, exact hypotheses
Dependencies: claim links; precise theorem/table/page citations where available
Conclusion: exact statement
Proof: full argument or explicit evidence reference
Search use: none | heuristic-only | propagate | branch | symmetry | terminate
Reviews: links, or none
```

Keep review state separate from kind and search use. Accepted local reasoning
is not a novelty claim or a formally checked certificate. Existing notes keep
legacy status labels until their individual claims are explicitly reviewed.

## Review template and gates

```text
Claim(s): paths and anchors
Author and reviewer: distinct identities for independent review
Reviewed revision: commit plus file hash, or SHA-256 of exact uncommitted file
Dependencies reviewed: versions and unresolved external premises
Checks: assumptions, quantifiers, ambient types, algebra, case coverage,
        dependency applicability, and permitted search use
Findings: specific gaps/corrections or supporting reasoning
Outcome: accepted | changes-requested | unresolved
Limits: unverified premises, missing certificates, novelty not checked
```

A reviewer rechecks reasoning independently, records evidence of the checks,
and identifies the exact revision. An author's own audit remains a self-check.
Keep reviews concise: one outcome per claim or claim group, the decisive
independent checks, substantive findings and repairs, and remaining limits.
Link to the proof instead of restating its derivation. Do not repeat the
same assumptions, outcome, or operational history in several sections.
A proof change requires renewed review; reference-only moves preserve the old
provenance but must record the move. A changed or withdrawn dependency puts
its affected dependents and pruning uses into pending review. Preserve the old
review and record the replacement rather than silently changing its outcome.

Editorial condensation preserves the reviewed source hashes, outcomes, and
supersession history; it is not a new mathematical review. The original
reviews and indexes before the 2026-10-21 cleanup are available at Git commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`. Historical manifests still
identify those original bytes; do not replace their hashes with hashes of
the condensed presentation. The [cleanup manifest](../research/reports/2026-10-21-research-cleanup.json)
maps original and condensed document hashes. Proof changes continue to require
renewed review.

A branch closes only with applicable closure evidence and the required coverage
argument. Distinguish disjoint partitions from overlapping unavoidable families.
A timeout, failed search, empty frontier, or metadata validation cannot prove
nonexistence. Follow [reproducibility policy](reproducibility.md) for evidence.
