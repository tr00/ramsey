# Lean formalization of the K1 rigidity

Date: 2026-10-19. Task token: `lean-d18-k1-rigidity-20261019`. Base revision:
`37b0d2d` (working tree). User-directed formalization; no new mathematics, no
graph search, solver run, download, staging or commit.

## What is formalized

`Ramsey.d18.k1.rigidity` mirrors item (b) of
`n43/d18/neighborhood_connectivity.md#claim-connectivity-03` at `m = 1`: if the
neighborhood `A = N(v)` of a 43-vertex `(5,5)`-Ramsey graph has the exceptional
disconnected shape with complete component of order exactly 1
(`IsKNeighborhood 1`), then the unique component vertex `u` satisfies

- `deg G u = 18` (that is, `epsilon_u = 0`),
- `|R_u| = |N(u) ∩ M(v)| = 17` (that is, `d_B(u) = 17`),
- `G[R_u]` is a 17-vertex 8-regular `(4,4)`-Ramsey graph.

Source claim status: claim-connectivity-03 is **ready, not accepted**. Its
independent review is in progress as task `x137-connectivity-review-20261018`
(read-only on the claim file, no conflict with this change). The general-m
arithmetic of item (b), `epsilon_u <= m - 1` and `d_B(u) = 18 - m + epsilon_u`,
collapses at `m = 1` to the equalities above, so the Lean statement is the
faithful specialization. One deliberate strengthening: no hypothesis on the
pivot degree is needed (the row cap plus the global degree floor force both
values for any pivot), so `deg G v = 18` is not an assumption.

## Supporting general theorems

`Ramsey/theorems/RowBounds.lean` (new) holds the two boundary facts of the
single-row bounds at their natural generality:

- `Ramsey.isRamseyGraph_induce_rowSet`: every cross row
  `R_u = N(u) ∩ M(v)` of a `(5,5)`-Ramsey graph induces a `(4,4)`-Ramsey graph
  (a K4 in the row joins u to a K5, an I4 in the row joins v to an I5), so
  `|R_u| <= 17` by `R(4,4) <= 18`. Premise-free.
- `Ramsey.card_neighborSet_eq_eight_of_isRamseyGraph_4_4`: a `(4,4)`-Ramsey
  graph on 17 vertices is 8-regular. The degree cap 8 applies `R(3,4) <= 9`
  (via complement symmetry of `ramsey_4_3_le_9`) to a vertex neighborhood,
  the degree floor 8 applies `R(4,3) <= 9` to its antineighborhood. Consumes
  only `ramsey_4_3_le_9`.

## Supporting refactor

The private helper `indepFree_induce_iff` of
`Ramsey/d18/ConnectivityClassification.lean` moved to
`Ramsey/defs/RamseyGraph.lean` as the public
`Ramsey.indepSetFree_induce_iff` beside its sibling `indepSetFree_induce`, and
the classification now uses the public version. Proof bodies are unchanged.

## Wiring and bookkeeping

- `Ramsey.lean` imports `Ramsey.theorems.RowBounds` and
  `Ramsey.d18.k1.Rigidity`.
- `scripts/Audit.lean` audits the three new theorems; axiom sets:
  - `isRamseyGraph_induce_rowSet`: `[propext, Classical.choice, Quot.sound]`
  - `card_neighborSet_eq_eight_of_isRamseyGraph_4_4`:
    `[propext, Classical.choice, Quot.sound, Ramsey.ramsey_4_3_le_9]`
  - `Ramsey.d18.k1.rigidity`:
    `[propext, Classical.choice, Quot.sound, Ramsey.ramsey_4_3_le_9,
    Ramsey.ramsey_4_4_le_18, Ramsey.ramsey_4_5_le_25]`
    (the last through `Ramsey.degree_mem`, the degree floor on 43 vertices)
- `scripts/expected-axioms.txt` regenerated; all 19 prior entries unchanged.
- Sorry ledger and style allowlist unchanged (no sorries, no style
  exceptions). `lean/README.md` gains two layout rows, a corrected note about
  claim 03 formalization coverage, and a K1 rigidity subsection.

## Verification

`sh lean/scripts/check.sh` PASS: pin, build, per-file elaboration, sorry
ledger, em-dash style, axiom audit (80.56 s). No new axioms were added; all
consumed premises were already recorded in `Ramsey/Premises.lean`.

SHA-256 of the touched Lean sources:

```
604e7e3c0d4a966799fa89d9f81895993b9089e62213dab2772f2f17a8258a88  Ramsey/theorems/RowBounds.lean
9650de455ce436556f88be9c49f80a32ee2e110fa24cfd9f04b861bcb20b3725  Ramsey/d18/k1/Rigidity.lean
929e4c4cdb911009bb0e124a4f42113f6fb801b176c1b577efc793c9b449f14b  Ramsey/defs/RamseyGraph.lean
ee2ae05afff116508df929306d1fbc66d8e8a62447a7642a20c38cef3d03e1b4  Ramsey/d18/ConnectivityClassification.lean
```

## Coordination note

The untracked `lean/Ramsey/d18/IndependentAnchor.lean` belongs to concurrent
work outside this task and was not touched. That task will likely need
`Ramsey.lean`, `scripts/Audit.lean` and `scripts/expected-axioms.txt` too;
re-read them before wiring (they now include this task's lines).

## Open obligations

Unchanged: the four subcase `sorry`s in `Ramsey/d18/{c,k1,k2,k3}/Exclusion.lean`
and the d20 branch sorry. The k1 obligation can now consume
`Ramsey.d18.k1.rigidity` as its starting structure.
