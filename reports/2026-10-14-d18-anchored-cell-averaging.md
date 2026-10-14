# Averaging extension to anchored degree-18 cells

Request: strengthen averaging tools to force structure without strict
small-excess assumptions; document and commit the work.

Added `n43/d18/anchored_cell_averaging.md`. Four author-audited claims:

1. Every specified A clique/independent-anchor cell in B has its exact
   reduced Ramsey type, with explicit unconditional size caps.
2. Weighted clique inequalities give two-sided remaining-edge budgets
   after subtracting already forced edges/nonedges, on every such cell.
3. Saturated cells force degree intervals and sometimes exact structure:
   size-17 rows are 8-regular; order-five (3,3) cells are C5. Intersect
   these with global degree/column-size bounds to propagate pairs.
4. A-edge cells and independent-A-pair cells give triple constraints that
   propagate new pairs beyond the initial pair-only tests. Their closure
   can feed back into the weighted and degree budgets.

None assumes q<=2, bounded E, or a fractional perfect anchor cover. The
cell triple constraints apply even when cells are not saturated. Actual
anchor identities and repeated column occurrences are retained. The weighted
inequality is standard; its proof is included. It is not claimed to be
logically stronger than all clique tests, or computationally faster.

All claims are ready for independent review, not independently accepted.
No branch excluded; no saturated cell proved unavoidable. No solver,
graph enumeration, downloads, installation, or theory-map promotion.
Author audit checked cell types, both complement bounds, forced/undecided
pair accounting, saturation degree intervals, and propagation polarity.
An attempted extra two-sided homogeneous-anchor comparison was abandoned
before inclusion: the two weighted sides had no justified pointwise
comparison. The four recorded claims do not use it.

The earlier weighted_averaging.md and its report were committed by the
concurrent coordinator in 8b18882, observed during this task. This task
commits only its new note and this report, leaving shared indexes to later
integration after independent review. No other worktree or Git-index changes
are included. Follow-up: audit the exact note hash, then integrate the four
claims as cell-generation/completion filters on the x>=143 branch.
