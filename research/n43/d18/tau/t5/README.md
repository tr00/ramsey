# Rung t5: a fixed five-set transversal

Branch name: `research/n43/d18/tau/t5`. Parent: [tau scheme](../../README.md). State:
scaffolding; no run.

Date: 2026-10-19. Task token: `tau-scaffold-20261019`.

Additional predicate: `T5={a_0,...,a_4}` (five fixed labels of A) is a
`K4(F)`-transversal, equivalently `G[A]-T5` (13 vertices) contains no
independent 4-set.

## Assumptions

- All shared assumptions (S1)-(S5) of the [scheme README](../../README.md),
  including the relocation
  [claim](../symmetry.md#claim-tau-symmetry-01) (ready, unreviewed);
  without it this rung is the family of all `C(18,5)=8568` labeled
  sub-branches.
- No `q<=2` premise is needed for the predicate or the refutation meaning.

## Meaning of UNSAT

No feasible extension of the fixed B has a `K4(F)`-transversal of size at
most 5; by superset closure this is exactly `tau_4>=6` for that B, and with
the [closure cap](../closure/README.md#claim-tau-closure-01)
(`24*tau_4<=x`) it contradicts every cell `x<=143`. This rung alone is
therefore terminal for all of x=137..143. Role options:

- Shortcut: run it directly; expected harder than t4 (weaker floors below,
  larger solution space).
- Ladder: run after t4; at x=137 it is the only rung needed, since
  `tau_4>=5` is already accepted there
  ([effective anchor](../../x137/effective_anchor.md#claim-x137-no-four-transversal)).

## Established structure holding inside the branch

With `H=A-T5` (13 vertices) and `e(F)=68+q`:

- H is (4,4)-free in F, as at t4; the published census gives `e_F(H)>=33`.
- Each member of T5 has at least 5 F-neighbors in H (13 F-nonneighbors
  bounded by 8 via `R(4,3)=9`); hence `e_F(T5,H)>=25`.
- `e_F(T5)>=2` by `alpha(F)<=3` and Turan (balanced 2,2,1 parts).
- Exact decomposition `e_F(H)+e_F(T5,H)+e_F(T5)=68+q`.
- Derived here, unreviewed: the total `33+25+2=60<68+q` is the t=5
  specialization of the accepted
  [transversal deletion claim 01](../../../../../docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-01)
  with the published order-13 minimum 33. As at t=4, no arithmetic kill.

The floors are weaker than t4's (order-13 census bound 33 vs 41, neighbor
floor 5 vs 6), so no recorded lemma closes this rung; it is the genuine
open content of the scheme.

## Status and next actions

Same as [t4](../t4/README.md): review of the relocation and closure claims
first; any run requires explicit user authorization and full
[reproducibility](../../../../../docs/reproducibility.md) records; SAT means a
43-vertex candidate requiring exhaustive 5-subset verification.
