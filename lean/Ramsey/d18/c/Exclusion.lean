module

public import Ramsey.d18.ConnectivityClassification

/-!
# The connected d18 subcase

The connected branch of the connectivity split of the degree-18 pivot case:
no 43-vertex `(5,5)`-Ramsey graph has a degree-18 pivot whose neighborhood
is connected (`Ramsey.d18.c.excludes`). Together with the three disconnected
subcases `k1`, `k2` and `k3` it proves the d18 branch target
`Ramsey.d18.excludes` through `Ramsey.d18.excludes_of_subcases`.

Status: **[OPEN]**, this is the statement under attack on this subcase. The
`sorry` is deliberate; see `README.md` in the project root for the evidence
rules a completed proof must satisfy (zero `sorry`, standard axioms plus the
named premises of `Ramsey/Premises.lean` it explicitly consumes). The
eventual proof is expected to build on `Ramsey.D18`, `Ramsey.Premises` and
`Ramsey.d18.ConnectivityClassification`.
-/

namespace Ramsey.d18.c

/-- **The connected d18 subcase**: no 43-vertex `(5,5)`-Ramsey graph has a
degree-18 pivot with a connected neighborhood. Deliberate `sorry`, the open
subcase target. -/
public theorem excludes : ExcludesSubcase .conn := by
  sorry

end Ramsey.d18.c
