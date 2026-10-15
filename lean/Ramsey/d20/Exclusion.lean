module

public import Ramsey.EvenPivot

/-!
# The d20 branch target

The degree-20 pivot branch of the even-pivot scheme
(`../n43/reductions.md` §3, branch `d(v) = 20`; navigation
`../n43/d20/README.md`).

`Ramsey.d20.excludes` is the complete Lean-side obligation of this branch:
no 43-vertex `(5,5)`-Ramsey graph has *any* vertex of degree exactly 20
(`Ramsey.ExcludesDegree 20`), again over all pivots. Together with
`Ramsey.d18.excludes` it proves the entire order-43 statement through
`Ramsey.ramsey_5_5_43_of_d18_d20`; the root target `Ramsey.R_5_5_43` is
proved modulo this `sorry` and the d18 one.

Scope warning (`../n43/README.md`, coverage-distinction column): this is
the *arbitrary even-pivot* d20 branch — the pivot has degree 20 and global
degrees may be anything in `18..24`. It is **not** the complement-normalized
minimum-degree-20 scheme of `../n43/min-degree20/` (only degrees 20, 21,
22). Do not import that scheme's hypotheses here; merging the two schemes
requires the separate coverage argument flagged in
`../docs/proof_review_2026_10_13.md`.

Status: **[OPEN]** — this is the statement under attack on this branch. The
`sorry` is deliberate; see `README.md` in the project root for the evidence
rules a completed proof must satisfy. The eventual proof is expected to
build on `Ramsey.D18` and `Ramsey/Premises.lean`.
-/

@[expose] public section

namespace Ramsey.d20

/-- **The d20 case**: no 43-vertex `(5,5)`-Ramsey graph has a vertex of
degree 20. Deliberate `sorry` — the open branch target. -/
theorem excludes : ExcludesDegree 20 := by
  sorry

end Ramsey.d20
