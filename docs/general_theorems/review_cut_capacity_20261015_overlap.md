# Independent review of cut-capacity family bounds

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `cut_capacity.md#claim-cut-capacity-01`,
`cut_capacity.md#claim-cut-capacity-02`, and
`cut_capacity.md#claim-cut-capacity-03`.

Author and reviewer: Codex coordinator; overlap-author agent (distinct
identities). Date: 2026-10-15.

Reviewed revision: exact uncommitted file SHA-256
`07884ee766c6d74831dc6b08e99c8e7b81ced6ec5474f40804f4758f8d2ce911`.
Input project revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.

Dependencies reviewed: direct proofs in the three claims; Turan's theorem
for a `K_r`-free graph; the input statistic inequality `q_v+E_v<=B`.
The order-43 illustration was compared with `n43/d18/excess_bounds.md`
and `n43/d18/pairwise_pivot_refinements.md`. The accepted source
`n43/d18/dense_pivot_coverage.md#claim-dense-pivot-01` and its existing
independent review were read; its structural proof was also checked directly
in the reviewer's parallel abstraction work. Published census extrema remain
input premises, not independently recertified facts of this review.

## Independent checks

All three claims were independently checked. Sorted positive excesses give
a necessary per-root cut capacity, without simultaneous cheap selections.
Turan on H yields the cut demand. The family-count inequality uses positive
t(0)-t(Q+1), with inward rounding and the empty-capacity cases handled.

The numerical applications and the same-family overlap composition were
recomputed. q+E<=B is an input to establish separately, not a universal
consequence of the abstract theorem. Both endpoint predicates hold on the
same guaranteed edge only when the prescribed family hypotheses are met.

Outcome: accepted for all three claims on their explicitly stated hypotheses.
No proof correction is required for the exact reviewed revision.

Permitted search use: numerical propagation and rejection of inconsistent
profiles; composition gives existence coverage for complete two-root families.
Allowed overlap maps, completions, and applicability premises must be retained.

Limits: no graph computation, formal certificate checking, or census
recertification was performed. The real root bound `B` and any required
overlap theorem remain application-specific inputs. Neither the abstract
claims nor the conditional illustration exclude order 43. Novelty was not
checked. Proof changes require renewed exact-revision review.
