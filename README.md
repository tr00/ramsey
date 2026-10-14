# Ramsey R(5,5) Research Workspace

This workspace is for a reproducible attempt to determine the diagonal Ramsey
number `R(5,5)`. The setup phase uses only tools already present on the host;
nothing has been downloaded or installed.

## Current status

The established bounds as of 2026-10-13 are

```text
43 <= R(5,5) <= 46.
```

Equivalently, a `(5,5)`-Ramsey graph is a graph with neither a 5-clique nor an
independent set of size 5. A 42-vertex example is known, while no such graph
exists on 46 vertices.

To prove an exact value:

- `R(5,5) = 43`: prove nonexistence on 43 vertices.
- `R(5,5) = 44`: construct a 43-vertex graph and prove nonexistence on 44.
- `R(5,5) = 45`: construct a 44-vertex graph and prove nonexistence on 45.
- `R(5,5) = 46`: construct a 45-vertex graph; the upper bound is already known.

The initial target after setup review is therefore the 43-vertex decision
problem. A failed heuristic search is not evidence of nonexistence.

## Layout and reading paths

Start with [current status](results.md), then follow the
[order-43 navigation](n43/README.md). The main active path is
[n43/d18/x136](n43/d18/x136/README.md), with live cases
[r0](n43/d18/x136/r0/README.md), [r1](n43/d18/x136/r1/README.md),
[r2](n43/d18/x136/r2/README.md), and [r3](n43/d18/x136/r3/README.md).

- `n43/`: mathematical branch navigation, scoped proof notes, and the
  [detailed reduction index](n43/reductions.md).
- `docs/`: global baseline, mixed research-phase notes, environment inventory,
  [reproducibility](docs/reproducibility.md), and [workflow](docs/workflow.md).
- `reports/`: historical summaries; these do not override current proof records.
- [WORK.md](WORK.md): coordinator-owned task ownership and handoffs for agents
  sharing this worktree.
- `src/ramsey.py` and `tests/`: dependency-free reference utility and tests.
- [AGENTS.md](AGENTS.md): scope, research priorities, and evidence standards.

Existing audit assertions are preserved, not independently revalidated by the
reorganization. New reviews identify the exact proof revision and dependencies.

## Baseline commands

Run the tests:

```bash
python3 -m unittest discover -s tests -v
```

Check a graph represented as an edge list:

```bash
python3 src/ramsey.py check --vertices 6 --clique 3 --independent 3 graph.edges
```

Generate the direct Ramsey CNF:

```bash
python3 src/ramsey.py cnf --vertices 6 --clique 3 --independent 3 --output r33_6.cnf
```

The direct encoding uses one Boolean variable per edge. A true variable means
that the edge is present. For each candidate clique it emits a clause requiring
at least one absent edge, and for each candidate independent set it emits a
clause requiring at least one present edge.

## Research boundary

The small utilities here form a transparent reference implementation, not a
credible standalone solver for `R(5,5)`. A serious exhaustive phase requires a
proof-logging SAT solver and likely mature graph canonicalization. Those tools
must not be acquired without explicit user approval.

Computational exploration is currently paused by user request. The active work
is purely mathematical: tighter branch bounds, interface signatures, and safe
symmetry reductions.
