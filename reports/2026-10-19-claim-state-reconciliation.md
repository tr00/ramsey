# Claim-state reconciliation against recorded reviews

Date: 2026-10-19. Task `claim-state-reconcile-20261019`. Main with six
reconciliation subagents. Scope: claim metadata lines only (`Review state`
and `Reviews`) in notes whose template states contradicted an existing
independent review outcome. No proof body, Scope, Dependencies, Conclusion,
Search use, anchor, review file, or manifest was modified. No solver, search,
download, install, Lean or engine change; no staging or commit.

## What was reconciled

113 claims across 27 files were set to `accepted` with the operative review
linked, each flip backed by a quoted outcome line from the covering review:

- `n43/d18/obstruction_coverage.md` (6), `independent_row_cuts.md` (5),
  `large_row_extensions.md` (6), `fixed_b_extensions.md` (9) — the
  2026-10-17 extension audits, including the operative addendum of the
  independent-row review and the conditional-acceptance wording of the
  fixed-B outer cover.
- `n43/d18/averaging_omission_cuts.md` (3), `tail_zero_one.md` (4),
  `tail_two_three.md` (4) — the 2026-10-18 averaging-tail audits; the
  endpoint-cover claim's sibling-acceptance gate is discharged by the two
  accepted endpoint audits.
- `docs/general_theorems/` — `cut_capacity` (3), `safe_augmentation` (5),
  `signature_anchors` (6), `family_overlap` (4), `transversal_compatibility`
  (4), `transversal_deletion` (4), `disjoint_swap_stabilizers` (2),
  `symmetry_pair_gluing` (3), with the later `audit_pending_` audits and the
  `_revised` gluing review treated as operative where they supersede.
- `n43/d18/cell_attachments.md` (3), `cell_intersections.md` (5),
  `cell_obligation_cuts.md` (4), `cell_attachment_boundary_witness.md` (1
  claim plus the file-level status line) — the 2026-10-15 cell reviews; the
  report count of thirteen is reproduced exactly (the witness note holds one
  template claim).
- `n43/d18/sos_` five notes (17) — the 2026-10-15 SOS reviews.
- `n43/d18/x136/five_column_compatibility.md` (4), `n43/symmetry_structure.md`
  (9), `n43/min-degree20/pair_coverage.md` (15 in total for this group).

Combined with the same day's review task, four further claims were closed
(`n43/d18/x137/effective_anchor.md` three claims and connectivity claim 03,
see `2026-10-19-x137-connectivity-reviews.md`).

## Integrity gates

Every slice verified, before flipping, that the current claim bodies match
the reviewed revisions: banner-stripped SHA comparisons against the
averaging-tail provenance, `reviewed_proof_bodies_byte_preserved: true` and
per-file body SHAs in the extension-research JSON, post-integration source
hashes in the pending-claim audit, `integrated_sha256` in the symmetry audit
manifest, and the five-column proof hash. No claim was flipped without an
explicit accepting outcome in its covering review; supersessions
(addenda, `_revised` reviews) were resolved to the operative record.

## Deliberately left unchanged

- `docs/general_theorems/symmetry_quotients.md` (4 ready) and
  `n43/d18/symmetry_extensions.md` (3 ready): no review exists; these remain
  the review queue.
- `n43/d18/parameter_landscape.md` (5 ready): owned by the active
  `parameter-landscape-audit-20261018` task.
- Design entries without reviews: `catalogue_edge_maximality.md` (3 draft),
  `overlapping_cells.md`, the certificate-format paragraph in
  `cell_obligation_cuts.md`, and the `symmetry_reduction.md` generator.
- Legacy-status notes that predate the claim template keep their labels.

A repo-wide residual check shows non-accepted template states only in the
list above (plus the template definition in `docs/workflow.md` and quoted
text inside one review file).
