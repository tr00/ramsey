module

public import Ramsey.theorems.RamseyBounds

/-!
# The bound R(3,2) ≤ 3

Complement the edgeless-graph base case.
-/

namespace Ramsey

/-- Every graph on 3 vertices has a 3-clique or an independent pair. -/
public theorem ramsey_3_2_le_3 : RamseyUpperBound 3 2 3 :=
  (ramsey_two_left 3).compl

end Ramsey
