# x136 frontier closure: merge, independent audit, and integration

Date: 2026-10-19. Task token: `x136-merge-audit-20261019`.
Session: Main (user-directed merge, audit, and integration).

## What happened

1. Merged `origin/x136` (commit `904f46e`, one commit ahead of merge-base
   `ab4941b`) into `main`. Pending completed-task working-tree changes were
   committed first (`48bb291`) to keep the merge clean; the only conflict
   (WORK.md, both sides adding rows) was resolved by keeping both rows.
   Merge commit: `a0d4746`. The branch adds exactly three files:
   `n43/d18/x136/frontier_exclusion_handoff.md` (the four-claim proof),
   `reports/2026-10-15-frontier-exclusion-handoff.md` (author handoff), and
   one WORK.md row.
2. Audited the proof independently (reviewer identity distinct from the
   author Codex). All four claims accepted; see
   [the sibling review](../n43/d18/x136/review_frontier_exclusion_handoff_20261019_main.md)
   for the full evidence record.
3. Integrated the closure into branch navigation and shared indexes.

## Result

The entire `n43/d18/x136` branch is excluded, including its last live child
`r0`: **no order-43 K5/I5-free graph with a degree-18 root has x=136**.
Every degree-18 root of an order-43 candidate therefore has `x>=137`.
Rooted scope only; the x>=137 siblings, other degree-18 profiles, the d20
and min-degree20 schemes, and the x>=143 residual remain open. No value of
`R(5,5)` is claimed.

## Audit evidence

- Reviewed revision: file SHA-256
  `c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`,
  byte-identical to the author's committed handoff (verified with
  `sha256sum` after the merge).
- Dependency snapshots: `r2/low_excess_columns.md` and
  `x136/small_columns.md` still match the author's recorded hashes exactly.
  `frontier_band.md`, `five_column_compatibility.md`,
  `sos_finite_moments.md`, and `sos_order12_addendum.md` changed since the
  author's snapshots; `git diff ab4941b HEAD` shows the operative
  mathematical content is identical (metadata `ready`->`accepted` flips,
  table reformatting, and separately reviewed additions). All cited inputs
  were re-verified at current revisions: review states accepted with
  operative review links.
- Mathematical rederivations: Claim01 singleton saturation in the full
  ambient graph (K5/I5 witnesses rechecked), Claim02 identity
  `85=96-e(A[D])+e(A[R])<=84`, both Claim03 deletion tables (b4 Turan
  floors, 18 strict cap comparisons, degree-six Turan equality case), and
  Claim04 projected-transversal quantifiers for both degree profiles.
- Machine checks (Python3, standard library, exact integer arithmetic):
  the author's replay script from
  `reports/2026-10-15-frontier-exclusion-handoff.md` passes; an
  independently written script recomputed the b4 table, Turan caps, both
  deletion tables, and all scalar identities from first principles, and
  validated the deletion identity on 2000 random graphs. All passed.
- External premises were not recertified (R(3,5)=14, R(4,5)=25,
  E(4,5,17)=79, E(4,5,14)=60, R(4,3)=9, published census values); they
  remain recorded premises per `docs/mathematical_baseline.md`. No solver,
  search, enumeration, proof checker, download, or installation was run.

## Integration

- `n43/d18/x136/frontier_exclusion_handoff.md`: integration banner added;
  the four `Review state` lines flipped to `accepted` with review links
  (metadata only; proof bodies byte-preserved).
- New sibling review
  `n43/d18/x136/review_frontier_exclusion_handoff_20261019_main.md`.
- `n43/d18/x136/README.md`: status excluded, all children closed, review
  and report links; historical per-r closure text retained.
- `n43/d18/x136/r0/README.md`: state excluded with closure link.
- `n43/d18/README.md`: x136 row closed; shared-note entry added.
- `results.md`: dashboard row replaced pending-integration line.
- `n43/reductions.md`: full closure entry added to section 8.3; section 8.7
  live-range statements superseded in place.
- This report and a WORK.md row.

No Lean, engine, test, or third-party files were modified. The Lean sorry
ledger is unchanged (the d18 Exclusion target remains open; this closure is
not yet formalized).
