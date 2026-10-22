# Research documentation cleanup

Date: 2026-10-21. Task: `research-doc-cleanup-20261021`. Editor: Main.
Base: `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.

Condensed 41 reviews into claim outcomes, decisive checks, substantive
corrections and limits. Simplified the results/d18/general-theorem indexes,
shortened six synthesis/history reports, moved the engine reference to
[docs/engine.md](../../docs/engine.md), and added a [report topic index](README.md).
Completed coordination rows were removed from `WORK.md`; active ownership
and the pending parameter-landscape audit were preserved.

The [cleanup manifest](2026-10-21-research-cleanup.json) maps each edited
document's original and condensed SHA-256 and records size/check results.
To read an original audit, use:

```sh
git show 3eebcca5e627fdc3df5f26fd2a1925a7c121153f:research/n43/d18/review_independent_row_cuts_20261017_audit.md
```

Historical manifests continue to pin the original audit bytes. Reviewed source
hashes, meaningful claim/dependency identifiers, acceptance/withdrawal/renewal
outcomes and author/reviewer identities are retained. This is editorial work,
not a new mathematical review or promotion of pending claims. Existing proof
and foundation files remain byte-identical; engine and Lean source are untouched.

Removed fourteen exploratory OPB archives totaling **56,746,958 bytes
(54.1 MiB)**. Their commands, hashes, counts, measurements, drivers and small
logs remain in the [experiment record](2026-10-19-scoped-engine-experiments.json).
No run closed a Ramsey subbranch. The retained subset and historical replay
assumptions are explained in its [README](2026-10-19-scoped-engine-experiments/README.md).
The deletion affects the working tree; original archives remain in Git history.

[Retention policy](../../docs/reproducibility.md#retention-scope), repository
instructions and the remote PB handoff now require a full checked evidence
package for a named mathematical subbranch closure or verified construction.
Pure experiments need a concise session summary; generated models, traces
and bulky logs may be discarded. Ignore rules direct those outputs to scratch.

Validation passed: local Markdown links and anchors in the cleanup files; preservation
of all recorded review hashes and meaningful dependency IDs; byte comparison
of 66 proof/foundation files; JSON parsing; exact deletion-manifest agreement;
hashes of all 65 retained experiment files; representative scratch/model/proof
ignore rules; and `git diff --check`. The two retained arithmetic snippets in
the forced-anchor audit and frontier handoff also replayed successfully.
No remaining tracked file exceeds 1 MiB. Builds were unnecessary because no
engine or Lean implementation changed.

Exact document counts and reductions are in the manifest. Concurrent research
files and the separately added shared-notation reference were preserved.
The repository-wide link scan found one unfinished report reference in the
active density-rerooting task; that task's files were left with their owner.
No staging, commit, solver run or history rewrite was performed.
