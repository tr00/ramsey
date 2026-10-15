module

public import Ramsey.EvenPivot

/-!
# The d18 branch target

The degree-18 pivot branch of the even-pivot scheme
(`../n43/reductions.md` §3, branch `d(v) = 18`; predicates in §8;
navigation `../n43/d18/README.md`).

`Ramsey.d18.excludes` is the complete Lean-side obligation of this branch:
no 43-vertex `(5,5)`-Ramsey graph has *any* vertex of degree exactly 18
(`Ramsey.ExcludesDegree 18`). Note this is branch coverage over all pivots,
not a canonical-pivot tie rule. Together with `Ramsey.d20.excludes` it
proves the entire order-43 statement through
`Ramsey.ramsey_5_5_43_of_d18_d20`; the root target `Ramsey.R_5_5_43` is
proved modulo this `sorry` and the d20 one.

Status: **[OPEN]** — this is the statement under attack on this branch. The
`sorry` is deliberate; see `README.md` in the project root for the evidence
rules a completed proof must satisfy (zero `sorry`, standard axioms plus the
named premises of `Ramsey/Premises.lean` it explicitly consumes). The
eventual proof is expected to build on `Ramsey.D18` and `Ramsey.Premises`.
-/

@[expose] public section

namespace Ramsey.d18

/-- **The d18 case**: no 43-vertex `(5,5)`-Ramsey graph has a vertex of
degree 18. Deliberate `sorry` — the open branch target. -/
theorem excludes : ExcludesDegree 18 := by
  sorry

end Ramsey.d18
