module

public import Ramsey.Premises
public import Ramsey.defs.Transversals
public import Mathlib.Data.Set.Card

/-!
# Single-row boundary structure

The row cap and the regularity trigger of the single-row bounds. The cross
row `R_u = N(u) ∩ M(v)` of a `(5,5)`-Ramsey graph induces a `(4,4)`-Ramsey
graph, hence has at most 17 vertices. A `(4,4)`-Ramsey graph on 17 vertices
is 8-regular: the degree cap 8 comes from `R(3,4) ≤ 9` applied to a
neighborhood, the degree floor 8 from `R(4,3) ≤ 9` applied to an
antineighborhood.
-/

namespace Ramsey

variable {V : Type*}

/-- A vertex anticomplete to a finite independent set extends it. -/
private theorem isNIndepSet_insert {G : SimpleGraph V} {n : ℕ} {t : Finset V} {z : V}
    [DecidableEq V] (hz : z ∉ t) (ht : G.IsNIndepSet n t)
    (hnon : ∀ w ∈ t, ¬G.Adj z w) :
    G.IsNIndepSet (n + 1) (insert z t) where
  isIndepSet := by
    rw [Finset.coe_insert]
    exact Set.Pairwise.insert_of_notMem (by simpa using hz) ht.isIndepSet
      (fun b hb => ⟨hnon b hb, fun h => hnon b hb h.symm⟩)
  card_eq := by rw [Finset.card_insert_of_notMem hz, ht.card_eq]

/-- The row cap of the single-row bounds: the cross row
`R_u = N(u) ∩ M(v)` of a `(5,5)`-Ramsey graph induces a `(4,4)`-Ramsey
graph. By `R(4,4) ≤ 18` the row has at most 17 vertices. -/
public theorem isRamseyGraph_induce_rowSet {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (v u : V) :
    IsRamseyGraph 4 4 (G.induce (rowSet G (antiNeighborSet G v) u)) := by
  classical
  constructor
  · rw [SimpleGraph.cliqueFree_induce_iff]
    intro t hts htclique
    exact hG.1 _ (htclique.insert fun w hw =>
      ((hts (Finset.mem_coe.mpr hw)).1 : G.Adj u w))
  · rw [indepSetFree_induce_iff]
    intro t hts htindep
    refine hG.2 _ (isNIndepSet_insert ?_ htindep fun w hw =>
      (hts (Finset.mem_coe.mpr hw)).2.2)
    intro hb
    exact ((hts (Finset.mem_coe.mpr hb)).2.1 rfl).elim

/-- The regularity trigger of the single-row bounds: a `(4,4)`-Ramsey graph
on 17 vertices is 8-regular. -/
public theorem card_neighborSet_eq_eight_of_isRamseyGraph_4_4 {V : Type*} [Finite V]
    {H : SimpleGraph V} (hH : IsRamseyGraph 4 4 H) (hcard : Nat.card V = 17) :
    ∀ y : V, Nat.card ↥(H.neighborSet y) = 8 := by
  classical
  intro y
  have hUp : Nat.card ↥(H.neighborSet y) ≤ 8 := by
    by_contra hlt
    have h34 : IsRamseyGraph 3 4 (H.induce (H.neighborSet y)) :=
      ⟨by
          rw [SimpleGraph.cliqueFree_induce_iff]
          intro t hts htclique
          exact hH.1 _ (htclique.insert fun w hw =>
            (hts (Finset.mem_coe.mpr hw) : H.Adj y w)),
        indepSetFree_induce _ _ hH.2⟩
    exact ramsey_4_3_le_9.compl.not_isRamseyGraph (by omega) _ h34
  have hLow : 8 ≤ Nat.card ↥(H.neighborSet y) := by
    have hsum := card_neighborSet_add_antiNeighborSet H y
    rw [hcard] at hsum
    have h43 : IsRamseyGraph 4 3 (H.induce (antiNeighborSet H y)) :=
      ⟨(SimpleGraph.cliqueFree_induce_iff _ _ _).mpr fun t _ ↦ hH.1 t,
        (indepSetFree_induce_iff H (antiNeighborSet H y) 3).mpr
          fun t hts htindep ↦
          hH.2 _ (isNIndepSet_insert (fun hb ↦
            ((hts (Finset.mem_coe.mpr hb)).1 rfl)) htindep
            fun w hw ↦ (hts (Finset.mem_coe.mpr hw)).2)⟩
    have hcap : Nat.card ↥(antiNeighborSet H y) ≤ 8 := by
      by_contra h
      exact ramsey_4_3_le_9.not_isRamseyGraph (by omega) _ h43
    omega
  omega

end Ramsey
