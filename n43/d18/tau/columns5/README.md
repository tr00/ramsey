# Relaxation branch: all columns of size at least five

Branch name: `n43/d18/tau/columns5`. Parent: [tau scheme](../README.md).
State: scaffolding; no run.

Date: 2026-10-19. Task token: `tau-scaffold-20261019`.

Additional predicate: `|C_y|>=5` for all 24 y in B.

## Role and assumptions

This is the relaxation of `tau_4>=5`: it is implied by `tau_4>=5` through
(S2) (columns are transversals) and it contains the entire no-4-transversal
half of the space. It needs no fixed labels, so unlike the rungs it does
not depend on the relocation
[claim](../symmetry.md#claim-tau-symmetry-01). Coverage as recorded in the
[scheme README](../README.md):

```text
UNSAT(t4) and UNSAT(columns5)  =>  no feasible extension of the fixed B,
```

because any candidate either has a 4-transversal (relocated into t4) or
has none, in which case `tau_4>=5` by (S3) and every column has size `>=5`
by (S2). This pairing closes a cell without t5 and without the ladder
order.

A byproduct, not used by the scheme: UNSAT of this branch alone would
prove every feasible extension has a column of size at most 4; where
`tau_4>=4` is proved (q<=2) that would force `tau_4=4`.

## Established structure holding inside the branch

- r (the number of size-4 columns) is 0. The exact column-sum identity of
  [small columns](../../x136/small_columns.md) section 3 gives, with the
  excess sum H over columns of size at least six,
  `x=144-s+H`, hence `s=8-k+H>=8-k`, and `5s<=54` gives `s<=10`.
- At k=0 the necessary range is `s=8..10`. At x=137 (k=1) this branch
  coincides with the live r0:s7..10 space of
  [x137](../../x137/README.md); at x=138..142 it is the r=0 subcase inside
  each per-x q-profile split. This folder adds no new per-x content beyond
  the pairing role; per-x work stays in those branches.
- Overlap structure retained from
  [small columns](../../x136/small_columns.md) sections 1 and 4, which
  extend to every q<=2 subcase at higher k as recorded there: nonadjacent
  size-five columns have disjoint signatures with the exact eight-vertex
  (4,3)-free alternatives; every A vertex lies in at most three small
  signatures; an independent triple of size-five columns has pairwise
  disjoint signatures whose complement in A is a 3-clique.

The count identities need only the column floors; they hold a fortiori
here. The `s<=10` bound needs the incidence argument of section 1.

## Status and next actions

Scaffolding only. Any run requires explicit user authorization and
[reproducibility](../../../../docs/reproducibility.md) records. SAT is a
43-vertex candidate: exhaustive 5-subset verification before any claim.
