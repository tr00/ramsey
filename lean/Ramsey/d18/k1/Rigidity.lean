module

public import Ramsey.d18.ConnectivityClassification
public import Ramsey.theorems.RowBounds
public import Mathlib.Data.Set.Card

/-!
# K1 rigidity

The disconnected neighborhood shape whose complete component is a single
vertex. That vertex has no neighbor inside the neighborhood, so its degree
splits into the pivot edge and its cross row. The row cap and the global
degree floor force the boundary values `deg G u = 18` and `|R_u| = 17`, and
the row itself is a 17-vertex 8-regular `(4,4)`-Ramsey graph. No degree
hypothesis on the pivot is used.
-/

namespace Ramsey.d18.k1

/-- **K1 rigidity**: if the neighborhood of `v` has the exceptional
disconnected shape with complete component of order 1, then its unique
vertex `u` satisfies `deg G u = 18`, its cross row
`R_u = N(u) ∩ M(v)` has 17 vertices, and that row induces a 17-vertex
8-regular `(4,4)`-Ramsey graph. -/
public theorem rigidity {G : SimpleGraph (Fin 43)} (hG : IsRamseyGraph 5 5 G)
    (v : Fin 43) (hK : IsKNeighborhood 1 (G.induce (G.neighborSet v))) :
    ∃ u : Fin 43, G.Adj v u ∧ deg G u = 18 ∧
      Nat.card ↥(rowSet G (antiNeighborSet G v) u) = 17 ∧
      IsRamseyGraph 4 4 (G.induce (rowSet G (antiNeighborSet G v) u)) ∧
      ∀ w : ↥(rowSet G (antiNeighborSet G v) u),
        Nat.card ↥((G.induce (rowSet G (antiNeighborSet G v) u)).neighborSet w)
          = 8 := by
  classical
  obtain ⟨S, hcardS, -, hcut, -, -, -, -⟩ := hK
  have hsub : Subsingleton ↥S :=
    Finite.card_le_one_iff_subsingleton.mp (by omega)
  obtain ⟨u₀⟩ : Nonempty ↥S := Finite.card_pos_iff.mp (by omega)
  have hmemS : u₀.1 ∈ S := u₀.2
  have hEX : ∃ u : Fin 43, G.Adj v u ∧ ∀ w : Fin 43, G.Adj v w → ¬ G.Adj u w := by
    refine ⟨u₀.1.1, u₀.1.2, ?_⟩
    intro w hvw hadj
    have hwS : (⟨w, hvw⟩ : ↥(G.neighborSet v)) ∉ S := by
      intro hmem
      have he := hsub.elim (⟨(⟨w, hvw⟩ : ↥(G.neighborSet v)), hmem⟩) u₀
      have h2 : w = u₀.1.1 :=
        congrArg Subtype.val (congrArg Subtype.val he)
      rw [h2] at hadj
      exact absurd hadj (by simp)
    exact hcut u₀.1 hmemS ⟨w, hvw⟩ hwS (SimpleGraph.induce_adj.mpr hadj)
  obtain ⟨u, huN, hnoA⟩ := hEX
  have hvR : v ∉ rowSet G (antiNeighborSet G v) u := fun h ↦ (h.2.1 rfl).elim
  have hNSeq : G.neighborSet u = insert v (rowSet G (antiNeighborSet G v) u) := by
    apply Set.eq_of_subset_of_subset
    · intro w hw
      rcases eq_or_ne w v with rfl | hwv
      · exact Set.mem_insert _ _
      · exact Set.mem_insert_of_mem _ ⟨hw, hwv,
          fun hadjvw ↦ hnoA w hadjvw hw⟩
    · intro w hw
      rcases Set.mem_insert_iff.mp hw with rfl | hR
      · exact huN.symm
      · exact hR.1
  have hdeg : deg G u = Nat.card ↥(rowSet G (antiNeighborSet G v) u) + 1 := by
    show Nat.card ↥(G.neighborSet u) = _
    rw [hNSeq, Nat.card_coe_set_eq, Nat.card_coe_set_eq,
      Set.ncard_insert_of_notMem hvR]
  have h44 : IsRamseyGraph 4 4 (G.induce (rowSet G (antiNeighborSet G v) u)) :=
    isRamseyGraph_induce_rowSet hG v u
  have hcap : Nat.card ↥(rowSet G (antiNeighborSet G v) u) ≤ 17 := by
    by_contra h
    exact ramsey_4_4_le_18.not_isRamseyGraph (by omega) _ h44
  have hfloor : 18 ≤ deg G u := by
    have h := (degree_mem hG u).1
    have h2 := deg_eq_degree G u
    omega
  refine ⟨u, huN, by omega, by omega, h44,
    card_neighborSet_eq_eight_of_isRamseyGraph_4_4 h44 (by omega)⟩

end Ramsey.d18.k1
