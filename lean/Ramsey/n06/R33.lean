module

public import Ramsey.n03.R32

/-!
# The bound R(3,3) ≤ 6

The additive recurrence combines R(2,3) ≤ 3 and R(3,2) ≤ 3.
-/

namespace Ramsey

/-- Every graph on 6 vertices has a triangle or an independent triple. -/
public theorem ramsey_3_3_le_6 : RamseyUpperBound 3 3 6 :=
  RamseyUpperBound.add (by decide) ramsey_3_2_le_3.compl ramsey_3_2_le_3

end Ramsey
