# Equality frontier x=136

Current status (2026-10-19): **excluded**. The independently reviewed
[frontier exclusion](frontier_exclusion_handoff.md) closes this entire
branch, including the last live child r0. Every degree-18 root of an
order-43 candidate therefore has `x>=137`. The four claims were accepted at
file SHA-256 `c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`
by [exact-revision independent review](review_frontier_exclusion_handoff_20261019_main.md);
see the [integration report](../../../reports/2026-10-19-x136-frontier-closure.md).
The closure is rooted-scope only: it does not assert that a low-x
degree-18 root is unavoidable in every order-43 candidate, and `x>=137`,
other degree-18 profiles, and the remaining order-43 schemes stay open.

Branch name: `n43/d18/x136`. Parent: [n43/d18](../README.md).
Additional predicate: x=e(A,B)=136. Existing equality consequences and their
premises are recorded in [reduction index](../../reductions.md), section 8.3.

Define C_y=N_G(y) intersect A for y in B. Here r is the number of columns
with |C_y|=4, and s is the number with |C_y|=5.

| Child | Predicate | Necessary s range | Status |
| --- | --- | --- | --- |
| [r0](r0/README.md) | r=0 | 8..10 | Excluded by the reviewed full-frontier exclusion above |
| [r1](r1/README.md) | r=1 | — | Excluded by independently reviewed degree-eight anchor and transversal argument |
| [r2](r2/README.md) | r=2 | — | Excluded by independently reviewed joint-column and transversal arguments |
| [r3](r3/README.md) | r=3 | — | Excluded by independently reviewed column/anchor argument |
| [r4](r4/README.md) | r=4 | — | Excluded according to the existing proof note |

The final step is the reviewed [low-degree and column-incidence
exclusion](frontier_exclusion_handoff.md#claim-frontier-handoff-exclusion):
the degree-eight double-domination and three-anchor lemmas force every A
vertex to internal degree at least eight with at most one degree-seven
exception, and both surviving degree profiles contradict the abstract
transversal bound tau>=5 against the degree-eight row budget. This subsumes
the r partition; the earlier per-r closures below remain valid history.

Before the full exclusion, the independently reviewed
[degree-eight anchor theorem](five_column_compatibility.md#claim-five-columns-no-four-transversal)
had excluded every four-set transversal under the full equality-frontier
assumptions, so every actual column has size at least five. Its
[exact-revision review](review_five_column_compatibility_20261015_independent.md)
covers all r>=1 without a size-five profile split. The theorem uses the
actual24 columns and the anchor degree-sum cap32; it does not establish
the isolated universal transversal-five conjecture.

Historical coverage is inherited from the small-column
bound r<=4, the r4 exclusion, and the
[r3 refinement](pairwise_small_refinements.md#claim-pairwise-small-03) with
[exact-revision review](../review_pairwise-small_2026-10-14_coordinator.md);
see [small columns](small_columns.md), [r4 proof](r4/exclusion.md), and reduction
index section 8.7. Those claims were not re-audited during restructuring.
Necessary ranges do not assert that any branch is realizable.

The reviewed [joint-column continuation](r2/low_excess_columns.md) and
[size-five interface](r2/independent_triples.md) exclude every former r2
child s=4..7. The final s=6 alternative forces a singleton overlap of A
degree ten, prohibited by the new transversal theorem. Exact reviews and
the complete closure chain are linked in r2 navigation.

Shared material:

- [Reviewed full-frontier exclusion closing x136](frontier_exclusion_handoff.md) ([review](review_frontier_exclusion_handoff_20261019_main.md))
- [Closure consequences: rootwise profiles and floor sharpenings for other claims](../x136_closure_consequences.md)
- [Reviewed unavoidable degree-eight anchor, exact signatures, and size-four exclusion](five_column_compatibility.md)
- [Joint small-column predicates](small_columns.md)
- [Reviewed small-column refinements and r3 exclusion](pairwise_small_refinements.md)
- [Attempted isolated transversal strengthening](transversal_five_attempt.md)

The core/induced-column classifications in the reduction index are additional
refinements, not substitutes for the r partition. This layout does not assert
that an arbitrary distinguished column or pivot gives unique representations.
