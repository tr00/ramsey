module

public import Ramsey.n43.EvenPivot
public import Ramsey.n43.d18.ConnectivityClassification
public import Ramsey.n43.d18.c.Exclusion
public import Ramsey.n43.d18.k1.Exclusion
public import Ramsey.n43.d18.k2.Exclusion
public import Ramsey.n43.d18.k3.Exclusion

/-!
# The d18 branch target

The degree-18 pivot branch of the even-pivot scheme, the branch where
`d(v) = 18`.

`Ramsey.d18.excludes` is the complete Lean-side obligation of this branch:
no 43-vertex `(5,5)`-Ramsey graph has *any* vertex of degree exactly 18
(`Ramsey.ExcludesDegree 18`). Note this is branch coverage over all pivots,
not a canonical-pivot tie rule. Together with `Ramsey.d20.excludes` it
proves the entire order-43 statement through
`Ramsey.ramsey_5_5_43_of_d18_d20`. The root target `Ramsey.R_5_5_43` is
proved modulo this branch and the d20 one.

The obligation is wired through the connectivity split of
`Ramsey.n43.d18.ConnectivityClassification`: the four subcase targets
`Ramsey.d18.c.excludes` (connected neighborhood), `Ramsey.d18.k1.excludes`,
`Ramsey.d18.k2.excludes` and `Ramsey.d18.k3.excludes` (exceptional shape
with complete component of order 1, 2 and 3) carry the open `sorry`s, one
per connectivity subcase, and `Ramsey.d18.excludes_of_subcases` joins them
by `Complete.cover`.

Status: **[OPEN]** on all four subcases. The eventual proofs are expected to
build on `Ramsey.n43.D18`, `Ramsey.Premises` and
`Ramsey.n43.d18.ConnectivityClassification`.
-/

namespace Ramsey.d18

/-- **The d18 case**: no 43-vertex `(5,5)`-Ramsey graph has a vertex of
degree 18. Proved from the four open connectivity subcases. -/
public theorem excludes : ExcludesDegree 18 :=
  excludes_of_subcases c.excludes k1.excludes k2.excludes k3.excludes

end Ramsey.d18
