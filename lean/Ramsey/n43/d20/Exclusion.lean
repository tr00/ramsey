module

public import Ramsey.n43.EvenPivot

/-!
# The d20 branch target

The degree-20 pivot branch of the even-pivot scheme, the branch where
`d(v) = 20`.

`Ramsey.d20.excludes` is the complete Lean-side obligation of this branch:
no 43-vertex `(5,5)`-Ramsey graph has *any* vertex of degree exactly 20
(`Ramsey.ExcludesDegree 20`), again over all pivots. Together with
`Ramsey.d18.excludes` it proves the entire order-43 statement through
`Ramsey.ramsey_5_5_43_of_d18_d20`; the root target `Ramsey.R_5_5_43` is
proved modulo this `sorry` and the d18 one.

Scope warning (`../research/n43/README.md`, coverage-distinction column): this is
the *arbitrary even-pivot* d20 branch — the pivot has degree 20 and global
degrees may be anything in `18..24`.

Status: **[OPEN]** — this is the statement under attack on this branch. The
`sorry` is deliberate; see `README.md` in the project root for the evidence
rules a completed proof must satisfy. The eventual proof is expected to
build on `Ramsey.n43.D18` and `Ramsey/Premises.lean`.
-/

@[expose] public section

namespace Ramsey.d20

/-- **The d20 case**: no 43-vertex `(5,5)`-Ramsey graph has a vertex of
degree 20. Deliberate `sorry` — the open branch target. -/
theorem excludes : ExcludesDegree 20 := by
  sorry

end Ramsey.d20
