module

public import Ramsey.n43.d18.k2.Rerooting

/-!
# The K2 d18 subcase

A maximizing degree-18 pivot cannot have an edge as its complete neighborhood component.
Such a neighborhood has 61 edges. Re-rooting at an endpoint of the edge gives degree 18
and 69 neighborhood edges, contradicting maximality.

Together with the connected, K1 and K3 subcases this proves the d18 branch target through
`Ramsey.d18.excludes_of_subcases`. This subcase is proved using the existing order-16
`(4,4)` census edge bounds and the published bound `R(4,5) ≤ 25`.
-/

namespace Ramsey.d18.k2

/-- No maximizing degree-18 pivot has the exceptional complete component of order 2. -/
public theorem excludes : ExcludesSubcase .k2 := by
  intro G hG
  obtain ⟨hRamsey, v, hmax, hK⟩ := (subcaseClass_k2 G).mp hG
  obtain ⟨u, hu, hsource, htarget⟩ := strict_reroot hRamsey v hmax.1 hK
  have hle := hmax.2 u hu
  exfalso
  omega

end Ramsey.d18.k2
