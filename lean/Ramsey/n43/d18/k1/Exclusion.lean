module

public import Ramsey.n43.d18.ConnectivityClassification

/-!
# The K1 d18 subcase

The disconnected branch of the connectivity split of the degree-18 pivot
case whose complete component is a single vertex: no 43-vertex
`(5,5)`-Ramsey graph has a degree-18 pivot whose neighborhood has the
exceptional shape with `Nat.card S = 1` (`Ramsey.d18.k1.excludes`).
Together with the `c`, `k2` and `k3` subcases it proves the d18 branch
target `Ramsey.d18.excludes` through `Ramsey.d18.excludes_of_subcases`.

Status: **[OPEN]**, this is the statement under attack on this subcase. The
`sorry` is deliberate; see `README.md` in the project root for the evidence
rules a completed proof must satisfy (zero `sorry`, standard axioms plus the
named premises of `Ramsey/Premises.lean` it explicitly consumes). The
eventual proof is expected to build on `Ramsey.n43.D18`, `Ramsey.Premises` and
`Ramsey.n43.d18.ConnectivityClassification`.
-/

namespace Ramsey.d18.k1

/-- **The K1 d18 subcase**: no 43-vertex `(5,5)`-Ramsey graph has a
degree-18 pivot whose neighborhood has the exceptional shape with complete
component of order 1. Deliberate `sorry`, the open subcase target. -/
public theorem excludes : ExcludesSubcase .k1 := by
  sorry

end Ramsey.d18.k1
