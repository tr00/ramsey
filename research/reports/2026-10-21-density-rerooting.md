# Degree-18 re-rooting research

Date: 2026-10-21. Task: `reroot-density-20261021`.
Author: Main, working alone. Base HEAD: `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.

The user requested as many strict re-rootings as possible, with broad
coverage and neighborhood edge count as the sole monotone metric. The
user supplied x137/x138 closure outside this checkout. Neither closure
is used in the resulting [proof note](../n43/d18/density_rerooting.md).

Nine claims are ready for independent review. They give arbitrary-family
excess transport, independent pair/triple/four signature certificates,
an exact two-root edge-count identity with overlap tests, local A-row and
B-column destination bounds, strict K2/K3 component moves, and K1/K3
core-family improvements. The broadest tests allow all x and total excess.
Actual destinations always have degree 18; occurrence hypotheses remain
explicit.

The strongest concrete K1 result moves a 68-edge source to at least 78
edges if all 17 vertices of its core have degree 18. One or two
higher-degree core vertices still force at least 74 or 69 edges.
Every K2 source moves from 61 to exactly 69. Every K3 source with a
degree-18 small-component vertex moves from 53..58 to at least 65;
the all-degree-19 small component also improves when its core has at
most two higher-degree vertices. Choosing a maximum-density root therefore
removes these configurations, and its zero-neighborhood-excess child
has a connected neighborhood. These conclusions concern root selection,
not nonexistence of arbitrary rooted graphs in the eliminated source cases.

Validation passed with exact rational/integer arithmetic, an independent
dynamic-programming check of discrete convex balancing, and counting
identities on tiny arbitrary graphs generated with seed 20261021:

- 1,751 convex balancing cells and 4,300 K1 offset budget cells.
- 11 small-clique degree patterns and 5,502 K3 core budget cells.
- Nine pair-table rows, 69,804 signature rounding cells, and 2,722
  strict-destination family-count cells.
- 3,493 pair identities, 20,212 row identities, and 19,988 column
  identities/intersection checks on tiny arbitrary graphs.

Replay:

```sh
python3 research/reports/2026-10-21-density-rerooting/validate.py
```

The [audit source](2026-10-21-density-rerooting/validate.py),
[output](2026-10-21-density-rerooting/validation.json), and
[manifest](2026-10-21-density-rerooting/manifest.json) retain the exact
command, Python version, exit status, proof hash, and dependency snapshots.
The entire validation completes in under one second and creates only small
text artifacts. No solver, Ramsey graph search, catalogue processing,
theorem prover, download, or subagent was used.

These are author proofs and self-checks, not independent review or formal
certificates. No accepted theorem, branch status, engine behavior, or Lean
source was changed; no novelty claim or order-43 exclusion is made.
Concurrent cleanup and parameter-landscape work were preserved. The task
ownership row is released after this handoff.

The main remaining targets are connected roots without triggered certificates,
K1 with at least three higher-degree vertices in both cores outside the
low-excess refinement, and K3 with small-component degrees (19,19,19),
at least three higher-degree core vertices, and fewer than 25 degree-18
vertices globally. Independent review should begin with the signs and
rounding in the transport certificates, then check degree-18 destination
eligibility and the K1/K3 aggregate substitutions against the pinned sources.
