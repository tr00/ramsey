module

public import Ramsey.d18.k1.Frame
public import Ramsey.d18.k1.Rigidity

/-!
# Exact double-core structure in the K1 branch

An isolated neighbor of a degree-18 pivot gives 2 disjoint 17-vertex 8-regular cores
and a 7-vertex common antineighborhood. Both 24-vertex sides retain their Ramsey type.
-/

namespace Ramsey.d18.k1

namespace Frame

variable {G : SimpleGraph (Fin 43)}

/-- The first core order is 1 less than its root degree. -/
private lemma degree_v (F : Frame G) : deg G F.v = Nat.card F.C + 1 := by
  have hu : F.u ∉ F.C := by simp
  change Nat.card (G.neighborSet F.v) = _
  rw [F.neighbor_v, Nat.card_coe_set_eq, Nat.card_coe_set_eq,
    Set.ncard_insert_of_notMem hu]

/-- The second core order is 1 less than its root degree. -/
private lemma degree_u (F : Frame G) : deg G F.u = Nat.card F.D + 1 := by
  have hv : F.v ∉ F.D := by simp
  change Nat.card (G.neighborSet F.u) = _
  rw [F.neighbor_u, Nat.card_coe_set_eq, Nat.card_coe_set_eq,
    Set.ncard_insert_of_notMem hv]

/-- The row cap and global degree floor force the isolated root to degree 18. -/
public theorem degree_u_eq_eighteen (F : Frame G) (hG : IsRamseyGraph 5 5 G) :
    deg G F.u = 18 := by
  classical
  have h44 : IsRamseyGraph 4 4 (G.induce F.D) :=
    isRamseyGraph_induce_rowSet hG F.v F.u
  have hcap : Nat.card F.D ≤ 17 := by
    by_contra h
    exact ramsey_4_4_le_18.not_isRamseyGraph (by omega) _ h44
  have hfloor : 18 ≤ deg G F.u := by
    have h := (degree_mem hG F.u).1
    have he := deg_eq_degree G F.u
    omega
  have he := F.degree_u
  omega

/-- The 2 roots and the 3 cells form an exact disjoint partition of the vertices. -/
public theorem root_partition (F : Frame G) :
    F.v ≠ F.u ∧
      Disjoint ({F.v, F.u} : Set (Fin 43)) (F.C ∪ F.D ∪ F.T) ∧
      Disjoint F.C (F.D ∪ F.T) ∧ Disjoint F.D F.T ∧
      ({F.v, F.u} ∪ F.C ∪ F.D ∪ F.T : Set (Fin 43)) = Set.univ := by
  have hvu : F.v ≠ F.u := F.adjacent.ne
  refine ⟨hvu, ?_, F.disjoint_CD.union_right F.disjoint_CT, F.disjoint_DT, ?_⟩
  · apply Set.disjoint_left.mpr
    intro x hx hy
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    rcases hx with rfl | rfl <;>
      simp [mem_C, mem_D, T, antiNeighborSet] at hy
  · apply Set.eq_univ_of_forall
    intro x
    rcases F.cover x with h | h | h | h | h <;> simp_all

/-- Both degree-18 roots give the complete core and side admissibility conditions. -/
public theorem admissible_of_degrees (F : Frame G) (hG : IsRamseyGraph 5 5 G)
    (hv : deg G F.v = 18) (hu : deg G F.u = 18) : F.Admissible := by
  have hC : Nat.card F.C = 17 := by have h := F.degree_v; omega
  have hD : Nat.card F.D = 17 := by have h := F.degree_u; omega
  have h44C : IsRamseyGraph 4 4 (G.induce F.C) :=
    isRamseyGraph_induce_rowSet hG F.u F.v
  have h44D : IsRamseyGraph 4 4 (G.induce F.D) :=
    isRamseyGraph_induce_rowSet hG F.v F.u
  have hsum := card_neighborSet_add_antiNeighborSet G F.v
  have hanti : Nat.card (antiNeighborSet G F.v) = Nat.card F.D + Nat.card F.T := by
    rw [F.anti_v, Nat.card_coe_set_eq, Nat.card_coe_set_eq, Nat.card_coe_set_eq,
      Set.ncard_union_eq F.disjoint_DT]
  have hT : Nat.card F.T = 7 := by
    change deg G F.v + Nat.card (antiNeighborSet G F.v) + 1 = Nat.card (Fin 43) at hsum
    rw [hv, hanti, hD, Nat.card_fin] at hsum
    omega
  refine ⟨hC, hD, hT, h44C, h44D,
    card_neighborSet_eq_eight_of_isRamseyGraph_4_4 h44C hC,
    card_neighborSet_eq_eight_of_isRamseyGraph_4_4 h44D hD, ?_, ?_⟩
  · rw [← F.anti_u]
    exact isRamseyGraph_induce_antiNeighborSet hG F.u
  · rw [← F.anti_v]
    exact isRamseyGraph_induce_antiNeighborSet hG F.v

/-- The second root is the unique isolated vertex in the first root neighborhood. -/
public theorem isolated_neighbor_unique (F : Frame G) (hF : F.Admissible) {w : Fin 43}
    (hw : G.Adj F.v w) (hiso : ∀ x, G.Adj F.v x → ¬G.Adj w x) : w = F.u := by
  by_contra hne
  let wC : F.C := ⟨w, (F.mem_C w).mpr ⟨hw, hne⟩⟩
  have hcard := hF.regular_C wC
  obtain ⟨y⟩ : Nonempty ((G.induce F.C).neighborSet wC) :=
    Finite.card_pos_iff.mp (by omega)
  exact hiso y.1.1 ((F.mem_C y.1.1).mp y.1.2).1 (SimpleGraph.induce_adj.mp y.2)

end Frame

/-- A K1 neighborhood contains an adjacent root with no common neighbor with the pivot. -/
private lemma exists_frame {G : SimpleGraph (Fin 43)} (v : Fin 43)
    (hK : IsKNeighborhood 1 (G.induce (G.neighborSet v))) :
    ∃ F : Frame G, F.v = v := by
  obtain ⟨S, hcardS, -, hcut, -, -, -, -⟩ := hK
  have hsub : Subsingleton S :=
    Finite.card_le_one_iff_subsingleton.mp (by omega)
  obtain ⟨u₀⟩ : Nonempty S := Finite.card_pos_iff.mp (by omega)
  refine ⟨⟨v, u₀.1.1, u₀.1.2, ?_⟩, rfl⟩
  rintro w ⟨hvw, hadj⟩
  have hwS : (⟨w, hvw⟩ : G.neighborSet v) ∉ S := by
    intro hmem
    have he := hsub.elim (⟨(⟨w, hvw⟩ : G.neighborSet v), hmem⟩) u₀
    have hw : w = u₀.1.1 := congrArg Subtype.val (congrArg Subtype.val he)
    rw [hw] at hadj
    exact absurd hadj (by simp)
  exact hcut u₀.1 u₀.2 ⟨w, hvw⟩ hwS (SimpleGraph.induce_adj.mpr hadj)

/-- A degree-18 K1 pivot admits the exact 17+17+7 double-core reduction. -/
public theorem exists_admissible {G : SimpleGraph (Fin 43)} (hG : IsRamseyGraph 5 5 G)
    (v : Fin 43) (hv : deg G v = 18)
    (hK : IsKNeighborhood 1 (G.induce (G.neighborSet v))) :
    ∃ F : Frame G, F.v = v ∧ F.Admissible := by
  obtain ⟨F, hF⟩ := exists_frame v hK
  refine ⟨F, hF, F.admissible_of_degrees hG ?_ (F.degree_u_eq_eighteen hG)⟩
  simpa [hF] using hv

end Ramsey.d18.k1
