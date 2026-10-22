# Independent review: effective-degree rigidity claims at x=137

Editorially condensed on 2026-10-21; [original audit and lineage](../../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-18.

Claim(s): `research/n43/d18/x137/effective_anchor.md#claim-x137-low-score`,
`research/n43/d18/x137/effective_anchor.md#claim-x137-exact-anchor`,
`research/n43/d18/x137/effective_anchor.md#claim-x137-no-four-transversal`

Author and reviewer: Author and self-auditor Main (task
`x137-effective-anchor-20261018`); reviewer AnchorRigor, an independent
reviewer identity. The author's exact-scalar and fixed-extremal attachment
self-checks are not treated as review evidence.

Reviewed revision: SHA-256 of the exact uncommitted claim-file bytes,
`c33b0d6630873d1f1b9f8e03a7f52166b47b4348a1ce225dd15078c357d49daf`
(`research/n43/d18/x137/effective_anchor.md`). All checks below were performed against
that revision by re-derivation plus throwaway scripts (arithmetic and an
exhaustive integer sweep); the scripts are checks only, not new evidence.

## Outcomes and decisive checks

| Claim | Outcome | Independent check |
| --- | --- | --- |
| low-score | accepted | With w=d_A-epsilon, total 169 and ceiling13 give at most ten weights<=7. Deletion caps leave only ell9; its Turan equality core K(3,3,3) requires 52 attachment edges but the three neighborhood types allow at most 48. |
| exact-anchor | accepted | An I4 avoiding the low-score set has weights>=8. Singleton signature capacities give sum_I w<=32, hence all weights8. If the exceptional point belongs to the anchor its internal degree is 9; otherwise all four degrees are8. |
| no-four-transversal | accepted | A four-transversal has all internal degrees>=9. It avoids the degree 8 anchor vertices; if it misses the exceptional point it already fails. Otherwise the deletion tables leave ell7, whose eight-vertex Turan equality graph is four disjoint edges. The exceptional point then has only two nonneighbors in the core, but the other three anchor vertices require three. |

The reviewer rederived x137 =>(q,E)=(0,1), the exact row budgets, all
balanced-part/deletion tables and the order 10 cap 31. Goodman's identity
was additionally checked on 200 random graphs. I4-freeness is applied only
to remainders after deleting proved transversals, never to ambient A.
All three outcomes are **accepted** at the source hash above.

Dependency anchors checked: `claim-frontier-anchor-defects`,
`claim-four-column-stability-01`, `claim-r2-low-excess-01`, and the independently
rederived order 10 row of `claim-five-columns-core-caps`.

## Dependencies and limits

The frontier-band budget, four-transversal proof and anchor-defect bound;
four-column stability's abstract-transversal floor; and low-excess Claim 01
were reread for applicability. The root literature table supplies published
(4,4) maxima at orders11..17 and the declared small Ramsey values. Turan
and Goodman were checked in both complement orientations.

The five-column core-cap note was labeled ready/unreviewed in this review's
historical snapshot; the needed order 10 cap was independently rederived,
so this acceptance does not rely on that label. Only H=s-7 of the inherited
r0:s7..10 bookkeeping was rederived here. The three deductions establish
column size>=5 and exclude r>=1 at x137; they do not close r0 or x137.
External census/Ramsey premises are retained, with no novelty or formal
certificate claim. Presentation observations were non-blocking: the
p-notin-L step is justified later, and anchor disjointness is carried from
the exact construction in Claim 2.
