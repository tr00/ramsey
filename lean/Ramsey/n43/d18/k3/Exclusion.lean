module

public import Ramsey.n43.d18.ConnectivityClassification

/-!
# The K3 d18 subcase

The disconnected branch of the connectivity split of the degree-18 pivot
case whose complete component is a triangle: no 43-vertex `(5,5)`-Ramsey
graph has a degree-18 pivot whose neighborhood has the exceptional shape
with `Nat.card S = 3` (`Ramsey.d18.k3.excludes`). Together with the `c`,
`k1` and `k2` subcases it proves the d18 branch target
`Ramsey.d18.excludes` through `Ramsey.d18.excludes_of_subcases`.

Status: **[OPEN]**, this is the statement under attack on this subcase. The
`sorry` is deliberate; see `README.md` in the project root for the evidence
rules a completed proof must satisfy (zero `sorry`, standard axioms plus the
named premises of `Ramsey/Premises.lean` it explicitly consumes). The
eventual proof is expected to build on `Ramsey.n43.D18`, `Ramsey.Premises` and
`Ramsey.n43.d18.ConnectivityClassification`.
-/

namespace Ramsey.d18.k3

/-- **The K3 d18 subcase**: no 43-vertex `(5,5)`-Ramsey graph has a
degree-18 pivot whose neighborhood has the exceptional shape with complete
component of order 3. Deliberate `sorry`, the open subcase target. -/
public theorem excludes : ExcludesSubcase .k3 := by
  sorry

end Ramsey.d18.k3
