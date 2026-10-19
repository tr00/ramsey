# Rung t4: a fixed four-set transversal

Branch name: `n43/d18/tau/t4`. Parent: [tau scheme](../README.md). State:
scaffolding; no run.

Date: 2026-10-19. Task token: `tau-scaffold-20261019`.

Additional predicate: `T4={a_0,a_1,a_2,a_3}` (four fixed labels of A) is a
`K4(F)`-transversal, equivalently `G[A]-T4` contains no independent 4-set.

## Assumptions

- All shared assumptions (S1)-(S5) of the [scheme README](../README.md).
- The A-label relocation
  [claim](../symmetry.md#claim-tau-symmetry-01) is load-bearing: until it is
  independently reviewed, any t4 refutation is conditional on it. Without
  it, this rung is the family of all `C(18,4)=3060` labeled sub-branches.
- No `q<=2` premise is needed for this branch's own predicate or for its
  refutation meaning.

## Meaning of UNSAT

No feasible extension of the fixed B (at any x) has a `K4(F)`-transversal
of size at most 4; by superset closure this is exactly `tau_4>=5` for that
B. This is the standalone strengthening proposed in
[lemma phase II section 8](../../../../docs/lemma_phase_2.md), at x=136
already available under equality assumptions
([five-column compatibility](../../x136/five_column_compatibility.md#claim-five-columns-no-four-transversal))
and at x=137 already accepted outright
([effective anchor](../../x137/effective_anchor.md#claim-x137-no-four-transversal)).
At `x>=138` it is open.

## Established structure holding inside the branch

Necessary conditions for any feasible extension satisfying the predicate;
none of them kills the branch arithmetically. With `H=A-T4` (14 vertices)
and `e(F)=68+q`:

- H is (4,4)-free in F: no K4 of F because `T4` meets every `K4(F)`-member,
  no I4 because `alpha(F)<=3` (A is K4-free, so F has no independent 4-set).
  The published census gives `e_F(H)>=41`.
- Each member of T4 has at least 6 F-neighbors in H: its F-nonneighbors in
  H are (4,3)-free, of order at most 8 by `R(4,3)=9`. Hence
  `e_F(T4,H)>=24`.
- `e_F(T4)>=1` by `alpha(F)<=3` and Turan.
- Exact decomposition `e_F(H)+e_F(T4,H)+e_F(T4)=68+q`; writing
  `e_F(H)=41+u`, `e_F(T4,H)=24+w`, `t=e_F(T4)` gives `u+w+t=3+q` with
  `t>=1`, the size-four defect budget of the
  [frontier band](../../frontier_band.md), which holds for any 4-set T4,
  not only actual columns.
- Recorded total `e(F)>=41+24+1=65<68+q`: no arithmetic kill
  ([lemma phase II section 8](../../../../docs/lemma_phase_2.md)).

## Status and next actions

1. Independent review of the relocation claim and of
   [closure](../closure/README.md#claim-tau-closure-01).
2. Any run of this rung is computational exploration: paused by default,
   requires explicit user authorization, and must be recorded under
   [reproducibility policy](../../../../docs/reproducibility.md) with
   exact rows, solver, limits, exit status, and measured artifact sizes.
3. A SAT outcome is a 43-vertex candidate for the fixed B: exhaustive
   5-subset verification before any claim.
