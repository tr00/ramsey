module

import Mathlib

public import Ramsey.defs.Completeness
public import Ramsey.defs.RamseyGraph
public import Ramsey.defs.Transversals
public import Ramsey.defs.RootedRamseyGraph
public import Ramsey.n18.R44
public import Ramsey.n43.D18
public import Ramsey.n43.EvenPivot
public import Ramsey.Premises
public import Ramsey.n43.d18.Exclusion
public import Ramsey.n43.d18.c.Exclusion
public import Ramsey.n43.d18.c.w0.Exclusion
public import Ramsey.n43.d18.k1.Exclusion
public import Ramsey.n43.d18.k2.Exclusion
public import Ramsey.n43.d18.k3.Exclusion
public import Ramsey.n43.d20.Exclusion
public import Ramsey.theorems.TransversalDeletion
public import Ramsey.theorems.TransversalCompatibility
public import Ramsey.theorems.TransversalFour
public import Ramsey.theorems.LocalReductions
public import Ramsey.theorems.PivotInterface
public import Ramsey.theorems.PivotCounting
public import Ramsey.theorems.RowBounds
public import Ramsey.theorems.BoundaryProfileContexts
public import Ramsey.theorems.BoundaryProfileTransport
public import Ramsey.n43.d18.PivotBudget
public import Ramsey.n43.d18.ConnectivityClassification
public import Ramsey.n43.d18.k1.Rigidity
public import Ramsey.n43.d18.k1.Reduction
public import Ramsey.n43.d18.CrossEdgeBounds

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

  See Ramsey/n43/EvenPivot.lean for details
-/
theorem R_5_5_43 (G : SimpleGraph (Fin 43)) : ¬(G.CliqueFree 5 ∧ G.IndepSetFree 5) := by
  classical
  exact ramsey_5_5_43_of_d18_d20 d18.excludes d20.excludes G

end Ramsey
