# Independent audit: exact complementary moments and the q=1 anchor strip

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `sos_finite_moments.md#claim-finite-triangle-deficits`,
`#claim-finite-core-caps`, `#claim-finite-low-transversal-thresholds`,
and `#claim-finite-q1-anchor`.

Author and reviewer: `/root/sos_finite`; independent reviewer
`/root/sos_columns` (distinct agents).

Reviewed revision: base HEAD `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`,
exact uncommitted source SHA-256
`87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`.

Dependencies reviewed: the stated derivations and relevant existing
`x136/five_column_compatibility.md` core-cap tables; the proof (rather
than only declared actual-column scope) of
`four_column_stability.md#claim-four-column-stability-01`; the signature
anchor cap; and the q<=2 four-transversal argument in `frontier_band.md`.
Published small Ramsey/census premises remain assumed, not recertified.

Checks: all ambient graph types, complement symmetry, degree support,
integer residues, order13 coverage, codegree endpoint correction, Turan
equality cases, anchor disjointness, q/E quantifiers and future use limits.

## Independent checks

All four claims were checked with both triangle counts in Goodman,
integer degree/slack terms and the correct complementary moment equations.
The reviewed note strengthens core caps to36/48 at orders11/13; its
transversal table retains the earlier order12 cap43. The separately reviewed
[order-twelve addendum](sos_order12_addendum.md) later improves that cap to42.
These sufficient caps are not asserted optimal. The q1,E_A<=29 anchor strip
preserves actual-interface anchor budgets and covers all low-degree deletion
cardinalities.

The low-degree transversal and column statements retain their exact
q/excess/core hypotheses. Actual A remains I4-allowed; only proved
transversal remainders are I4-free. Scalar affine bounds, integer ceilings,
zero/empty cases and every displayed numerical threshold were recomputed.
No full x branch or q1 size-four-column exclusion follows.

Outcome: **accepted** for all four claims at the exact stated hash.

Permitted use: core-cap and deficit propagation on specified actual cores;
transversal threshold propagation; conditional q1,ell9,E_A<=29 rejection;
unavoidable-anchor branching in the fixed-q1,E_A<=29 slice, retaining all
anchor choices and completions with full coverage.

Limits: no recertification of cited Ramsey/census premises, novelty review,
pure unconstrained SOS claim, formal checker, global x upper bound, pivot
selection theorem, or branch closure. The source correctly makes degree
integrality and neighborhood inequalities explicit. Independent acceptance
does not supply a certified order-43 exhaustion. Proof changes require
renewed review.
