module

public import Ramsey.n43.d18.ConnectivityClassification
public import Ramsey.n43.d18.PivotBudget

/-!
# The zero-A-excess connected d18 subcase

This branch has a maximizing degree-18 pivot with a connected neighborhood A
and W_A = 0, also written E_A = 0. Every vertex in A has global degree 18.

`Excludes` is the open exclusion obligation, not an asserted proof. This branch
does not cover connected neighborhoods with positive A-excess and does not
require the equality frontier x = 136.
-/

namespace Ramsey.d18.c.w0

/-- The maximizing connected degree-18 case with global degree 18 at every vertex in A. -/
@[expose] public def Class (G : SimpleGraph (Fin 43)) : Prop :=
  IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, IsMaximalDegree18Pivot G v ∧
    (G.induce (G.neighborSet v)).Connected ∧ ∀ u ∈ G.neighborSet v, deg G u = 18

/-- The open branch obligation is completeness of the empty enumeration. -/
public abbrev Excludes : Prop :=
  Complete (∅ : Set (SimpleGraph (Fin 43))) Class

/-- Zero A-excess is equivalent to global degree 18 at every vertex in A. -/
public theorem zero_excess_iff (R : RootedRamseyGraph 5 5 (Fin 43))
    [DecidableRel R.graph.Adj] :
    degreeExcess R.graph 18 R.A = 0 ↔ ∀ u ∈ R.A, R.graph.degree u = 18 := by
  classical
  simp only [degreeExcess, Finset.sum_eq_zero_iff, Finset.mem_univ, forall_const]
  constructor
  · intro h u hu
    have he := h ⟨u, hu⟩
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] at he
    have hmin := (degree_mem R.ramsey u).1
    exact Nat.le_antisymm (Nat.sub_eq_zero_iff_le.mp he) hmin
  · intro h u
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree, h u u.2,
      Nat.sub_self]

/-- A maximizing connected degree-18 pivot with zero A-excess belongs to this branch. -/
public theorem class_of_zero_excess (R : RootedRamseyGraph 5 5 (Fin 43))
    [DecidableRel R.graph.Adj] (hv : IsMaximalDegree18Pivot R.graph R.pivot)
    (hc : R.neighborhood.graph.Connected) (hw : degreeExcess R.graph 18 R.A = 0) :
    Class R.graph := by
  refine ⟨R.ramsey, R.pivot, hv, hc, ?_⟩
  · simpa only [deg_eq_degree] using (zero_excess_iff R).mp hw

/-- Any complete enumeration of the connected parent also covers this branch. -/
public theorem complete_of_connected {S : Set (SimpleGraph (Fin 43))}
    (h : Complete S ConnClass) : Complete S Class := by
  apply h.of_imp
  rintro G ⟨hG, v, hv, hc, _⟩
  exact ⟨hG, v, hv, hc⟩

end Ramsey.d18.c.w0
