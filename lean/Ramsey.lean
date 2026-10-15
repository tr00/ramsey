module

import Mathlib

public import Ramsey.Defs
public import Ramsey.D18
public import Ramsey.EvenPivot
public import Ramsey.Premises
public import Ramsey.d18.Exclusion
public import Ramsey.d20.Exclusion
public import Ramsey.Endgame

@[expose] public section

namespace Ramsey

/--
  A graph with 43 vertices must contain a 5-clique or an independent 5-set.
  This statement is proven by gluing two smaller graphs together.
  We pick a pivot vertex v, and show that `A + v + B` is not a Ramsey graph.
  It remains to be proven that:
  (a) It is sufficient to use only degree 18 and 20 pivots
  (b) There is no degree 18 pivot with a Ramsey graph [sorry'd!]
  (c) There is no degree 20 pivot with a Ramsey graph [sorry'd!]

  See Ramsey/EvenPivot.lean for details
-/
theorem R_5_5_43 (G : SimpleGraph (Fin 43)) : ¬(G.CliqueFree 5 ∧ G.IndepSetFree 5) := by
  classical
  exact ramsey_5_5_43_of_d18_d20 d18.excludes d20.excludes G

end Ramsey
