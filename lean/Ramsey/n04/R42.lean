module

public import Ramsey.theorems.RamseyBounds

/-!
# The bound R(4,2) ≤ 4

Complement the edgeless-graph base case.
-/

namespace Ramsey

/-- Every graph on 4 vertices has a 4-clique or an independent pair. -/
public theorem ramsey_4_2_le_4 : RamseyUpperBound 4 2 4 :=
  (ramsey_two_left 4).compl

end Ramsey
