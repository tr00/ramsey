# Decide the remaining d18k1 obligations with RoundingSat

## Goal and scope

Commissioned computational task (user-authorized 2026-10-27): decide the
open 289-bit C–D completion of the degree-18 K1 branch by pseudo-Boolean
solving with **RoundingSat**, over the accepted `(h,L,R)` profile family.

Outcome semantics, and the only two admissible conclusions:

- **UNSAT on every profile** of a coverage-complete family: no order-43
  K1 completion exists. This excludes the K1 branch at *evidence grade*
  (complete case coverage + independently checkable certificates per
  [reproducibility](../../docs/reproducibility.md)). It is **not** a
  formalized theorem: the Lean reduction
  (`Ramsey.d18.k1` completion classes) is a stub; the trusted coverage
  premise is the accepted markdown reduction recorded in
  [k1/README.md](../../research/n43/d18/k1/README.md) and its linked
  topics.
- **SAT on some profile**: a concrete witness completion. It must be
  materialized as a labelled order-43 graph and verified by an
  independent exhaustive 5-subset check before any claim is recorded.
  A valid witness raises the lower bound and redirects the project to
  order 44; report it immediately and completely.

Anything else (timeouts, unknown, coverage gaps) is **no evidence of
nonexistence** and must be recorded as such.

## Governing documents and trusted premises

Read before encoding: repository [instructions](../AGENTS.md),
[workflow](../../docs/workflow.md),
[evidence policy](../../docs/reproducibility.md),
[engine notes](../../docs/engine.md), and active ownership in
[WORK.md](../../WORK.md).

The encoding may use ONLY constraints that are accepted necessary
conditions of a K1 completion. Accepted sources:

- Double-core reduction and 11 obstruction families:
  [k1 research.json](../../research/n43/d18/k1/research.json).
- Scalar envelope and packing:
  [k1 cross_core.json](../../research/n43/d18/k1/cross_core.json).
- Seven-cell attachment criteria and completion keys:
  [k1 seven_cell.json](../../research/n43/d18/k1/seven_cell.json).
- Capacity, exterior, signature-geometry, mixed-moment, dense-cell
  restrictions: the k1 topic files and
  [critical-core exterior](../../research/n43/d18/critical_core_exterior.md).
- Paley-17 core identification and arithmetic envelope:
  [paley17_arithmetic](../../docs/paley17_arithmetic.md) (accepted
  2026-10-27): both cores fixed Paley-17; `p,q >= 70`;
  `6 <= h <= 14`; `max(76,70+h) <= L,R <= 92`; `L+R <= 168`;
  moment bounds on `r = e(C,D)`.

Do **not** use claims that are only `ready` (e.g. parameter landscape,
density rerooting transport) as constraints. They may narrow a reported
*diagnostic* run, clearly labelled, never a closure claim. Do not edit
`parameter_landscape.md` (another task owns it).

## Phase 1 — Environment and ownership

1. Claim a `WORK.md` row (token `n43-d18k1-pb-20261027`) and an owned
   evidence path (proposed: `research/n43/d18/k1/pb/`) before writing.
   Re-read shared files before patching.
2. Inventory the toolchain: is `roundingsat` present? Which proof
   checker (`veripb` or equivalent)? Record versions, build flags, and
   exact provenance of any binary. The commission covers obtaining and
   building RoundingSat if absent; it covers no other downloads. Keep
   all fetched sources and build logs under the owned path until
   retention is decided with the user.
3. Extract the machine-readable obligation list: the accepted profile
   enumeration (per-side budgets, `h` window, signature-orbit
   representatives, seven-cell completion keys) as a deterministic
   table. This table is the coverage claim; derive it from the accepted
   JSON/topics, and state precisely which accepted claim guarantees its
   exhaustiveness.

## Phase 2 — Encoding

Deterministic, byte-stable encoder (Python, following
`scripts/ramsey.py` output conventions; any divergence must be recorded
in a dated report). Per profile:

- Variables: the 289 C–D bits, numbered deterministically; T fixed by
  the profile's orbit representative; both cores fixed canonical
  Paley-17.
- Constraints: row/column degree budgets; the 11 obstruction families
  as enumerated forbidden subpatterns; all spanning K5/I5 candidates
  over C×D (and C/D×T mixes not already excluded by the accepted
  premises) as clauses; accepted scalar windows as cardinality
  constraints.
- Soundness invariant: every constraint must be implied by an accepted
  necessary condition, so UNSAT is meaningful. Completeness invariant:
  no accepted restriction omitted, subset enumeration exhaustive, so
  SAT witnesses are real completions. State both in the encoder header
  and check them with small fixed-object tests (tiny cores where the
  answer is hand-known), not by running the real search.

## Phase 3 — Pilot before batch

Solve exactly one profile first. Measure: OPB size, clause count, solve
time, certificate size, checker time. Per repo rules, large CNFs and
proof traces stay unwritten until growth is measured; report the
numbers to the user and get a go-ahead before the full batch if any
single artifact exceeds ~100 MB.

## Phase 4 — Batch and certification

- Every UNSAT profile retains its RoundingSat proof, verified by the
  checker, with sha256 and sizes in a manifest. Never summarize a run
  you did not verify.
- Re-solve at least one UNSAT profile from an independently written
  second encoding (fresh script, fresh variable order) as an
  encoding-bug control; the two must agree.
- Deterministic rerun of the full batch (same binaries, same seeds)
  must reproduce all verdicts byte-identically at the manifest level.
- Any SAT witness: materialize the labelled graph, run the exhaustive
  5-subset verification (engine or reference script), and preserve the
  graph in the accepted adjacency format under the owned path.

## Phase 5 — Recording

Update [k1/README.md](../../research/n43/d18/k1/README.md) and the k1
topic files per the topic-file workflow: new claim anchors with exact
scopes (which profiles, which binaries, which checks), search-use
lines, inline review record, changelog. Computational results are
candidate evidence until independently reviewed; mark them accordingly.
Summarize the session per [reproducibility](../../docs/reproducibility.md)
retention discipline; decide artifact retention (raw proofs vs digests)
with the user before deleting anything.

## Non-goals

No Lean formalization of the completion (separate task). No k3 work. No
engine or `third-party/` changes. No d18-wide rerooting review. No
order-44 exploration regardless of outcome.

## Completion report

Report: coverage table provenance; tool provenance; pilot and batch
statistics (instances, times, certificate sizes, digests); control
re-encoding result; witness verification if any; exactly which
obligations remain open; and the recorded topic-file updates. Never
claim branch closure, novelty, or formalization beyond what the
certificates and reviews support.
