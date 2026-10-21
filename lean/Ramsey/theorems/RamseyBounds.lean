module

public import Ramsey.defs.Transversals
public import Mathlib.Tactic

/-!
# Elementary Ramsey upper bounds

Neighborhood restriction, the 2-clique base case, and the additive Ramsey recurrence.
These results do not consume published premises.
-/

namespace Ramsey

/-- A neighborhood lowers the excluded clique size by 1. -/
public theorem isRamseyGraph_induce_neighborSet_succ {V : Type*} {G : SimpleGraph V}
    {r s : ℕ} (hG : IsRamseyGraph (r + 1) s G) (v : V) :
    IsRamseyGraph r s (G.induce (G.neighborSet v)) := by
  classical
  refine ⟨?_, indepSetFree_induce _ _ hG.2⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t hts ht
  exact hG.1 _ (ht.insert fun w hw ↦ (hts (Finset.mem_coe.mpr hw) : G.Adj v w))

/-- A smaller Ramsey bound caps the size of every neighborhood. -/
public theorem RamseyUpperBound.card_neighborSet_lt {V : Type*} [Finite V]
    {G : SimpleGraph V} {r s n : ℕ} (hn : RamseyUpperBound r s n)
    (hG : IsRamseyGraph (r + 1) s G) (v : V) : Nat.card (G.neighborSet v) < n := by
  by_contra h
  exact hn.not_isRamseyGraph (by omega) _
    (isRamseyGraph_induce_neighborSet_succ hG v)

/-- An edgeless graph on `s` vertices has an independent set of size `s`. -/
public theorem ramsey_two_left (s : ℕ) : RamseyUpperBound 2 s s := by
  intro G hG
  have hbot : G = ⊥ := SimpleGraph.cliqueFree_two.mp hG.1
  subst G
  exact hG.2 Finset.univ ⟨fun _ _ _ _ _ ↦ by simp, by simp⟩

/-- The Ramsey recurrence adds bounds for the 2 smaller excluded-set sizes. -/
public theorem RamseyUpperBound.add {r s m n : ℕ} (hm : 0 < m)
    (hleft : RamseyUpperBound r (s + 1) m)
    (hright : RamseyUpperBound (r + 1) s n) :
    RamseyUpperBound (r + 1) (s + 1) (m + n) := by
  intro G hG
  let v : Fin (m + n) := ⟨0, by omega⟩
  have hN := hleft.card_neighborSet_lt hG v
  have hM := hright.compl.card_neighborSet_lt ((isRamseyGraph_compl G).mp hG) v
  have hsum := card_neighborSet_add_antiNeighborSet G v
  rw [antiNeighborSet_eq_compl] at hsum
  simp only [Nat.card_fin] at hsum
  omega

end Ramsey
