# Lean degree-18 cross-edge corridor

Date: 2026-10-16. Task: `lean-d18-corridor-20261016`. Author: Main.

## Scope and correspondence

Formalized the two-sided conclusion in
`n43/d18/cross_upper_bound.md#claim-cross-upper-corridor`, Section 2,
including its displayed lower-bound derivation. For every `(5,5)`-free graph
on `Fin 43` and every pivot of degree 18, with `A=N(v)` and `B=M(v)`,
`136 ≤ e(A,B) ≤ 288`. No root-selection or regularity assumption is added.

In `lean/Ramsey/d18/PivotBudget.lean`:

- Reused the existing `Ramsey.degree18_cross_ge_136`.
- Added `Ramsey.degree18_cross_le_288`.
- Added `Ramsey.degree18_cross_range`, joining the endpoints.

The upper-bound proof obtains `|B|=24`, applies the published upper edge cap
132 to the `(4,5)`-free complement of `G[B]`, and deduces `e(B)≥144`.
The antineighborhood degree sum gives `2e(B)+e(A,B)≤24·24=576`, hence
`e(A,B)≤288`. No additional premises, statement changes, or sorries.
The existing lower proof remains unchanged.

The equality characterization at 288 and the defect refinements are outside
this request. No branch closure or novelty claim is made.

## Verification

Commands run from `lean/`:

```sh
lake env lean Ramsey/d18/PivotBudget.lean
lake build Ramsey.d18.PivotBudget
lake env lean /tmp/ramsey-d18-corridor-smoke.lean
sh scripts/check.sh
```

All passed. The throwaway consumer imported the pivot budget module and
applied the combined theorem to arbitrary graph and pivot hypotheses.
It printed the axiom sets of both endpoints and the combined theorem,
then was removed. The repository gate passed the full build, unchanged
sorry ledger, style checks, and updated expected axiom audit.

Exact nonstandard axiom dependencies:

- Lower bound: `Ramsey.edges_ramsey_4_5_18_le_85`, `Ramsey.ramsey_4_5_le_25`.
- Upper bound: `Ramsey.edges_ramsey_4_5_24_le_132`, `Ramsey.ramsey_4_5_le_25`.
- Combined corridor: the union of these three published premises.

All three also use only the standard axioms `propext`, `Classical.choice`,
and `Quot.sound`. None depends on `sorryAx`. The published premises remain
trusted inputs, not independently replayed census certificates.

Added the new public theorems to `lean/scripts/Audit.lean` and
`lean/scripts/expected-axioms.txt`. Updated `lean/README.md` with the
interface, mathematical correspondence, and premise chain. Existing root
exports already expose the pivot budget module. No callsites required
migration. No staging or commit performed.

## Exact evidence hashes

SHA-256 at verification:

```text
deb3638325170ef498710a049b21dd16614c8437962ce62b243a91e7c43c4c25  n43/d18/cross_upper_bound.md
24da5974276c62d92d19f3158ff9fb09050768b76da8e63471b99acbec87c927  lean/Ramsey/d18/PivotBudget.lean
60937aee0793362b62256c853936dce2c7d08aadb0147d6b21f990d7054290f6  lean/scripts/Audit.lean
17dd16957a5858225819906c894fadf24730e6edd60f1c9d9333deb6682f43fc  lean/scripts/expected-axioms.txt
```
