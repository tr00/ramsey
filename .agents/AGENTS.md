# R(5,5) Research Instructions

These instructions apply to all work in this repository. Claims, reviews,
ownership, and handoffs: `docs/workflow.md`. Evidence content, retention, and
computation gates: `docs/reproducibility.md`.

## Objective

Determine the exact diagonal Ramsey number `R(5,5)`, currently known to satisfy
`43 <= R(5,5) <= 46`.

The primary target is order 43 with a bias towards non-existence:

- A certified proof that no `(5,5)`-Ramsey graph exists on 43 vertices, together
  with the established 42-vertex construction, proves `R(5,5)=43`.
- A valid 43-vertex construction raises the lower bound and redirects the
  project to order 44.
- Do not attack orders 44 or 45 before order 43 is decided.

The working expectation `R(5,5)=43` is a conjecture, not an assumption.

## Task Types

Identify the task kind before starting. The Objective, Evidence Standards, and
Operational Constraints apply to every kind; the rules below are additional.

### Research

Mathematical work: new lemmas, bounds, case analyses, and proof reviews.

- Read the Starting Points below before extending any branch.
- Use the claim and review templates in `docs/workflow.md`.
- Independent review precedes `accepted` status; a changed proof requires
  renewed review.
- Add a dated report under `reports/`.

### Formalization

Lean work under `lean/`.

- Follow `lean/AGENTS.md` for file placement, visibility, naming, and comment
  rules.
- `sh lean/scripts/check.sh` must pass with the unchanged sorry ledger and the
  audited axiom set. No new axioms or sorries without explicit instruction.
- Mirror the reviewed markdown statement exactly. Do not weaken or restate a
  claim to make it provable; a statement change requires renewed review of the
  source claim.
- Lean work does not require a report under `reports/`; record outcomes in
  the Lean tree as directed by `lean/AGENTS.md`.

### Engine development

Code in `src/`, `scripts/`, `tests/`, and the root `CMakeLists.txt`.

- Keep output formats, variable numbering, and ordering deterministic. An
  encoding change must stay byte-identical to the Python reference in
  `scripts/ramsey.py` or record the divergence in a report.
- Verify with the checks listed in `docs/engine.md` before handing off. Follow
  `.clang-format`.
- The build never downloads or configures dependencies and never modifies
  `third-party/` sources.
- Engine output is candidate evidence, never a certified Ramsey result.

### Experiments

Solver runs, catalogue processing, searches, and other computations.

- Computational exploration is paused by default; get explicit user
  authorization for each run beyond trivial validation.
- Follow `docs/reproducibility.md` for evidence content, retention, and
  storage discipline.
- Summarize an experimental session in one dated report under `reports/`.

### Refactoring

Restructuring that must not change behavior: moves, renames, consolidation.

- Do exactly what the user requested. No extra improvements, reformatting, or
  scope growth.
- No semantic changes. Preserve proof bodies, claim anchors, review
  provenance, and recorded hashes unless the request says otherwise.
  Condense reviews or reports only as `docs/workflow.md` permits, and
  reference Git history for the original audit.
- Update every inbound reference and verify with the checks of each touched
  area: `check.sh`, `ctest`, the Python tests, and link checks.

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
- Avoid large CNFs or proof traces until storage and certificate growth have
  been measured.
- Other agents share this worktree. Assign distinct owned paths (`WORK.md`),
  re-read files before patching, prefer narrow edits or new files, and never
  overwrite another agent's or the user's newer work. Never reset, clean,
  stash, or switch the shared checkout to isolate a task. Coordinate Git-index
  changes; see `docs/workflow.md` for handoffs.

## Starting Points

Read these before extending the work:

- `results.md` and `n43/README.md`
- `docs/theory_map.md` for the layered theory pyramid, the open-obligation
  ledger, and the formalization backlog
- `n43/d18/README.md` and `n43/d18/x136/README.md`
- `n43/d18/frontier_band.md`
- `n43/d18/x136/small_columns.md`
- `n43/d18/x136/r4/exclusion.md`
- `n43/d18/pivot_classes.md`
- `docs/reproducibility.md` and `docs/workflow.md`
- `lean/AGENTS.md` for Lean style, comment rules and file placement
- `docs/engine.md` for engine build, test, and solver-invocation commands
- `WORK.md` for active ownership in this shared worktree

Record substantial deductions beside the applicable mathematical branch, with
shared lemmas at the nearest appropriate parent. Global or mixed-scope notes
may remain in `docs/`. Have the coordinator update shared indexes with
assumptions and search use after integration. Update the theory map only after
the deduction is audited.
