module

public import Ramsey.n09.R43

/-!
# The bound R(4,4) ≤ 18

The additive recurrence combines R(3,4) ≤ 9 and R(4,3) ≤ 9.
-/

namespace Ramsey

/-- Every graph on 18 vertices has a 4-clique or an independent 4-set. -/
public theorem ramsey_4_4_le_18 : RamseyUpperBound 4 4 18 :=
  RamseyUpperBound.add (by decide) ramsey_4_3_le_9.compl ramsey_4_3_le_9

end Ramsey
