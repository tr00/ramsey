# Small Ramsey upper bounds in Lean

Task kind: formalization of classical upper bounds. No new mathematical claim
or novelty claim, and no graph enumeration or solver run.

## Scope and correspondence

The public statements `Ramsey.ramsey_4_3_le_9 : RamseyUpperBound 4 3 9`
and `Ramsey.ramsey_4_4_le_18 : RamseyUpperBound 4 4 18` retain their exact
former axiom types. They are now theorems in
[`n09/R43.lean`](../../lean/Ramsey/n09/R43.lean) and
[`n18/R44.lean`](../../lean/Ramsey/n18/R44.lean).
The classical source attribution remains Greenwood and Gleason (1955),
*Combinatorial Relations and Chromatic Graphs*,
<https://doi.org/10.4153/cjm-1955-001-4>. Only upper bounds are formalized,
not the witness constructions needed for equality.

Supporting order-specific files prove `R(3,2) ≤ 3`, `R(4,2) ≤ 4`, and
`R(3,3) ≤ 6`. The generic neighborhood restriction, neighborhood cardinality
cap, edgeless-graph base case, and additive recurrence live in
[`basics/RamseyTheory.lean`](../../lean/Ramsey/basics/RamseyTheory.lean), relocated on 2026-10-22.
The recurrence requires a positive first order bound so that its pivot exists.
The order-9 proof uses degree 5 at all 9 vertices and handshaking parity.
The order-18 proof applies the recurrence to the bound for `(4,3)` and its complement.

## Integration and trust

Removed both axiom declarations from `Premises.lean`. Consumers import the
proof modules directly, without replacement axioms or compatibility aliases.
The root module exports the new proofs. Updated the live Lean documentation,
the theory map's trust inventory, and the axiom audit.

All 5 small bounds and all 4 generic support theorems use only `propext`,
`Classical.choice`, and `Quot.sound`. For all 74 pre-existing audit targets,
the new axiom set is exactly the old set minus the 2 removed Ramsey axioms.
The 9 added audit targets use only standard axioms. The sorry ledger is
unchanged. Other published Ramsey bounds and edge-census axioms remain untouched.

Review state: compiler/kernel checked with an author self-check of types and
dependency sets. No separate independent mathematical review is claimed.
Historical reports and their recorded hashes were not rewritten.

## Verification

- `lake env lean Ramsey/theorems/RamseyBounds.lean` initially exposed an
  incomplete edgeless independent-set proof. Repaired with an explicit pairwise proof.
- `lake build Ramsey.n09.R43` and `lake build Ramsey.n18.R44`: passed.
- `lake build`: passed for the complete migrated module graph.
- `lake env lean /tmp/ramsey-small-bounds-smoke.lean`: passed direct-import
  consumers applying both bounds to arbitrary finite vertex types, and the
  complement bound for `(3,4)` on 9 vertices. Its printed axiom sets for all
  5 bounds contain only standard axioms. The throwaway file was removed.
- `lake env lean scripts/Audit.lean`: passed. Before regenerating expectations,
  compared all old targets and checked that only the 2 requested axioms disappeared.
- `sh lean/scripts/check.sh`: passed toolchain pin, build, every source file's
  elaboration and exact sorry ledger, style allowlist, and expected axiom sets.
- Source-path check: all 121 local Ramsey imports resolve. All 5 added or
  updated proof links resolve. No tools or dependencies were installed or downloaded.

## Exact proof file hashes

SHA-256 of the checked proof sources:

```text
e1d6b5f01c62c0e345ab28449b5ea1eccec6da3bfb4b8592da016f42f30de1d1  lean/Ramsey/theorems/RamseyBounds.lean
b2f8dad9288fdfbacf7d10e270936bc8ed9845fa3f42c7d8e8bc44193fe7243d  lean/Ramsey/n03/R32.lean
a20c5119eb0d6208880dabbb00e73bafa3671edcd5715962da3183d817dea90e  lean/Ramsey/n04/R42.lean
2e4d17f3b867d71cd2a4d082e2557549a2607831b9c0f5aa3d8254e9676910b4  lean/Ramsey/n06/R33.lean
656f102a93bf0d99c1f22cbdd160be8992e149bc0cfb08b75623aa2fb7a309b2  lean/Ramsey/n09/R43.lean
b0c98766922ec3d470341e1254f1475e05ac65a99b1bd409269ba52edd2b5d7b  lean/Ramsey/n18/R44.lean
```
