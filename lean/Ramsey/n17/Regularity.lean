module

public import Ramsey.n09.R43
public import Ramsey.basics.RamseyTheory
public import Mathlib.Data.Set.Card

/-!
# Regularity at the order-17 Ramsey boundary

A `(4,4)`-Ramsey graph on 17 vertices is 8-regular by the order-9 Ramsey bounds.
-/

namespace Ramsey

/-- The regularity trigger of the single-row bounds: a `(4,4)`-Ramsey graph
on 17 vertices is 8-regular. -/
public theorem card_neighborSet_eq_eight_of_isRamseyGraph_4_4 {V : Type*} [Finite V]
    {H : SimpleGraph V} (hH : IsRamseyGraph 4 4 H) (hcard : Nat.card V = 17) :
    ∀ y : V, Nat.card ↥(H.neighborSet y) = 8 := by
  intro y
  have hUp := ramsey_4_3_le_9.compl.card_neighborSet_lt hH y
  have hLow := ramsey_4_3_le_9.card_antiNeighborSet_lt hH y
  have hsum := card_neighborSet_add_antiNeighborSet H y
  omega

end Ramsey
