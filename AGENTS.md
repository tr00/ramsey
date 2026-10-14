# R(5,5) Research Instructions

These instructions apply to all work under `/scratch/ramsey`.

## Objective

Determine the exact diagonal Ramsey number `R(5,5)`, currently known to satisfy
`43 <= R(5,5) <= 46`.

The primary target is order 43:

- A certified proof that no `(5,5)`-Ramsey graph exists on 43 vertices, together
  with the established 42-vertex construction, proves `R(5,5)=43`.
- A valid 43-vertex construction raises the lower bound and redirects the
  project to order 44.
- Do not attack orders 44 or 45 before order 43 is decided.
- Order 46 nonexistence is already proved; do not repeat it unless validating a
  method needed at lower orders.

The working expectation `R(5,5)=43` is a conjecture, not an assumption.

## Current Research Track

Computational exploration is paused until the project moves to a stronger
machine. Current work is purely mathematical and should reduce a future
certified order-43 decision:

1. Tighten the degree-18 frontier. At `x=136`, four size-four columns are
   excluded; the live branches have `r=0..3` and are indexed in `n43/reductions.md`.
2. Prioritize compatibility of multiple actual cross columns over proving a
   stronger universal transversal theorem for an isolated neighborhood.
3. Extend the frontier-band and unavoidable adjacent-pivot reductions beyond
   equality, while retaining exact coverage assumptions.
4. In parallel, develop safe symmetry reduction and the normalized
   minimum-degree-20 branch.

These are primarily generation/filtering reductions for a later exhaustive
proof, though they may also expose a construction if order 43 is satisfiable.

## Evidence Standards

- Clearly separate established literature, proved-here lemmas, conjectures,
  heuristics, and failed approaches.
- Treat a failed search, timeout, or inability to extend known graphs as no
  evidence of nonexistence.
- Independently audit algebra and quantifiers before recording a lemma.
- Track ambient graph types exactly: `N(v)` is `(4,5)`-free and may contain
  `I4`; `M(v)` is `(5,4)`-free. Do not transfer an `I4` prohibition across
  this boundary without an additional hypothesis.
- Do not claim novelty until a literature review has been performed.
- A construction must be checked by exhaustive 5-subset verification.
- A nonexistence result must have complete case coverage and independently
  checkable certificates.

## Operational Constraints

- Do not download or install tools, packages, graph catalogues, or datasets
  without explicit user approval.
- Ask before requiring a SAT solver, proof checker, theorem prover, or graph
  canonicalizer.
- Do not modify `/scratch/vitis_flexml`.
- Avoid large CNFs or proof traces until storage and certificate growth have
  been measured.
- Preserve deterministic formats, commands, hashes, and provenance.
- Other agents may edit this folder concurrently. Re-read files before
  patching, prefer narrow edits or new files, and never overwrite newer work.

## Starting Points

Read these before extending the work:

- `results.md` and `n43/README.md`
- `n43/d18/README.md` and `n43/d18/x136/README.md`
- `n43/d18/frontier_band.md`
- `n43/d18/x136/small_columns.md`
- `n43/d18/x136/r4/exclusion.md`
- `n43/d18/pivot_classes.md`
- `docs/reproducibility.md` and `docs/workflow.md`
- `WORK.md` for active ownership in this shared worktree

Record substantial deductions beside the applicable mathematical branch, with
shared lemmas at the nearest appropriate parent. Global or mixed-scope notes
may remain in `docs/`. Follow the claim/review templates in `docs/workflow.md`.
Add a concise historical report under `reports/`; have the coordinator update
shared indexes with assumptions and search use after integration. Update the
theory map only after the deduction is audited.

All agents use this same worktree. Assign distinct owned paths, re-read before
editing, and coordinate edits to shared indexes and the Git index. Never reset,
clean, stash, or switch the shared checkout to isolate a task. Do not overwrite
another agent's or the user's newer work. See `docs/workflow.md` for handoffs.
