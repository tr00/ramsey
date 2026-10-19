module

public import Ramsey.d18.k1.Structure
public import Ramsey.d18.k1.Attachments

/-!
# Vertexwise bounds in the double-core frame

The 7-cell meets each core in at least 9 neighbors. Core vertices have between 2 and 7
neighbors in the 7-cell, and isolated 7-cell vertices meet each core in at least 10 neighbors.
-/

namespace Ramsey.d18.k1

variable {V : Type*} [Finite V] {H : SimpleGraph V}

/-- Disjoint target cells add their neighbor counts. -/
private lemma row_union_card (K U : Set V) (hdis : Disjoint K U) (x : V) :
    Nat.card (rowSet H (K ∪ U) x) =
      Nat.card (rowSet H K x) + Nat.card (rowSet H U x) := by
  have he : rowSet H (K ∪ U) x = rowSet H K x ∪ rowSet H U x := by
    ext y
    simp [rowSet, and_or_left]
  have hd : Disjoint (rowSet H K x) (rowSet H U x) :=
    hdis.mono Set.inter_subset_right Set.inter_subset_right
  rw [he, Nat.card_coe_set_eq, Set.ncard_union_eq hd,
    ← Nat.card_coe_set_eq, ← Nat.card_coe_set_eq]

omit [Finite V] in
/-- An induced neighborhood counts the ambient row in its vertex set. -/
private lemma induced_row_card (K : Set V) (x : K) :
    Nat.card ((H.induce K).neighborSet x) = Nat.card (rowSet H K x) := by
  let e : (H.induce K).neighborSet x ≃ rowSet H K x :=
    { toFun := fun y ↦ ⟨y.1.1, y.2, y.1.2⟩
      invFun := fun y ↦ ⟨⟨y.1, y.2.2⟩, y.2.1⟩
      left_inv := fun _ ↦ rfl
      right_inv := fun _ ↦ rfl }
  exact Nat.card_congr e

/-- A (5,4)-Ramsey graph on 24 vertices has minimum degree at least 10. -/
private lemma side_degree_ge_ten (hH : IsRamseyGraph 5 4 H) (hn : Nat.card V = 24)
    (x : V) : 10 ≤ Nat.card (H.neighborSet x) := by
  classical
  have h53 : IsRamseyGraph 5 3 (H.induce (antiNeighborSet H x)) := by
    rw [isRamseyGraph_compl, compl_induce, antiNeighborSet_eq_compl]
    refine ⟨?_, indepSetFree_induce _ _ ((isRamseyGraph_compl H).mp hH).2⟩
    apply (SimpleGraph.cliqueFree_induce_iff _ _ _).mpr
    intro q hq hcl
    exact ((isRamseyGraph_compl H).mp hH).1 _
      (hcl.insert (fun y hy ↦ hq hy))
  have hcap : Nat.card (antiNeighborSet H x) ≤ 13 := by
    by_contra h
    exact ramsey_3_5_le_14.compl.not_isRamseyGraph (by omega) _ h53
  have hs := card_neighborSet_add_antiNeighborSet H x
  omega

namespace Frame

variable {G : SimpleGraph (Fin 43)}

/-- Every 7-cell vertex has at least 9 neighbors in each core. -/
public theorem T_core_degree_ge_nine (F : Frame G) (hF : F.Admissible)
    {t : Fin 43} (ht : t ∈ F.T) :
    9 ≤ Nat.card (rowSet G F.C t) ∧ 9 ≤ Nat.card (rowSet G F.D t) := by
  classical
  exact ⟨attachment_degree_ge_nine hF.ramsey_C hF.card_C hF.side_C F.disjoint_CT ht,
    attachment_degree_ge_nine hF.ramsey_D hF.card_D hF.side_D F.disjoint_DT ht⟩

/-- A first-core vertex has 9 fixed neighbors and its 2 other-cell rows. -/
public theorem degree_C (F : Frame G) (hF : F.Admissible) {c : Fin 43} (hc : c ∈ F.C) :
    deg G c = 9 + Nat.card (rowSet G F.D c) + Nat.card (rowSet G F.T c) := by
  classical
  have hcv := ((F.mem_C c).mp hc).1.symm
  have hcu : ¬G.Adj c F.u := fun h ↦ F.separated c ⟨hcv.symm, h.symm⟩
  have he : G.commonNeighbors c F.v = rowSet G F.C c := by
    rw [SimpleGraph.commonNeighbors, F.neighbor_v]
    ext x
    simp only [Set.mem_inter_iff, Set.mem_insert_iff, rowSet]
    change (G.Adj c x ∧ (x = F.u ∨ x ∈ F.C)) ↔ (G.Adj c x ∧ x ∈ F.C)
    grind
  have hi := hF.regular_C ⟨c, hc⟩
  rw [induced_row_card] at hi
  have hd := degree_eq_common_add_mixed (G := G) c F.v
  rw [he, hi, F.anti_v] at hd
  simp only [hcv, ite_true] at hd
  change G.degree c = 8 + Nat.card (rowSet G (F.D ∪ F.T) c) + 1 at hd
  rw [row_union_card _ _ F.disjoint_DT] at hd
  rw [deg_eq_degree]
  omega

/-- A second-core vertex has the mirrored exact degree decomposition. -/
public theorem degree_D (F : Frame G) (hF : F.Admissible) {d : Fin 43} (hd : d ∈ F.D) :
    deg G d = 9 + Nat.card (rowSet G F.C d) + Nat.card (rowSet G F.T d) := by
  classical
  have hdu := ((F.mem_D d).mp hd).1.symm
  have hdv : ¬G.Adj d F.v := fun h ↦ F.separated d ⟨h.symm, hdu.symm⟩
  have he : G.commonNeighbors d F.u = rowSet G F.D d := by
    rw [SimpleGraph.commonNeighbors, F.neighbor_u]
    ext x
    simp only [Set.mem_inter_iff, Set.mem_insert_iff, rowSet]
    change (G.Adj d x ∧ (x = F.v ∨ x ∈ F.D)) ↔ (G.Adj d x ∧ x ∈ F.D)
    grind
  have hi := hF.regular_D ⟨d, hd⟩
  rw [induced_row_card] at hi
  have hs := degree_eq_common_add_mixed (G := G) d F.u
  rw [he, hi, F.anti_u] at hs
  simp only [hdu, ite_true] at hs
  change G.degree d = 8 + Nat.card (rowSet G (F.C ∪ F.T) d) + 1 at hs
  rw [row_union_card _ _ F.disjoint_CT] at hs
  rw [deg_eq_degree]
  omega

/-- A 7-cell vertex has precisely its 2 core rows and its internal 7-cell row. -/
public theorem degree_T (F : Frame G) {t : Fin 43} (ht : t ∈ F.T) :
    deg G t = Nat.card (rowSet G F.C t) + Nat.card (rowSet G F.D t) +
      Nat.card (rowSet G F.T t) := by
  classical
  have htv : ¬G.Adj t F.v := fun h ↦ ht.1.2 h.symm
  have htu : ¬G.Adj t F.u := fun h ↦ ht.2.2 h.symm
  have he : G.commonNeighbors t F.v = rowSet G F.C t := by
    rw [SimpleGraph.commonNeighbors, F.neighbor_v]
    ext x
    simp only [Set.mem_inter_iff, Set.mem_insert_iff, rowSet]
    change (G.Adj t x ∧ (x = F.u ∨ x ∈ F.C)) ↔ (G.Adj t x ∧ x ∈ F.C)
    grind
  have hs := degree_eq_common_add_mixed (G := G) t F.v
  rw [he, F.anti_v] at hs
  simp only [htv, ite_false] at hs
  change G.degree t = Nat.card (rowSet G F.C t) +
    Nat.card (rowSet G (F.D ∪ F.T) t) + 0 at hs
  rw [row_union_card _ _ F.disjoint_DT] at hs
  rw [deg_eq_degree]
  omega

/-- Nonedge common-antineighbor bounds force 2 to 7 neighbors from each first-core vertex. -/
public theorem C_T_degree_bounds (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) {c : Fin 43} (hc : c ∈ F.C) :
    2 ≤ Nat.card (rowSet G F.T c) ∧ Nat.card (rowSet G F.T c) ≤ 7 := by
  classical
  have hcv := ((F.mem_C c).mp hc).1.symm
  have hcu := ((F.mem_C c).mp hc).2
  have hno : ¬G.Adj c F.u := fun h ↦ F.separated c ⟨hcv.symm, h.symm⟩
  have he : G.commonNeighbors c F.u = insert F.v (rowSet G F.D c) := by
    rw [SimpleGraph.commonNeighbors, F.neighbor_u]
    ext x
    simp only [Set.mem_inter_iff, Set.mem_insert_iff, rowSet]
    change (G.Adj c x ∧ (x = F.v ∨ x ∈ F.D)) ↔
      (x = F.v ∨ (G.Adj c x ∧ x ∈ F.D))
    grind
  have hv : F.v ∉ rowSet G F.D c := by simp [rowSet]
  have hcount : Nat.card (G.commonNeighbors c F.u) = Nat.card (rowSet G F.D c) + 1 := by
    rw [he, Nat.card_coe_set_eq, Set.ncard_insert_of_notMem hv, ← Nat.card_coe_set_eq]
  have hu : deg G F.u = 18 := by
    change Nat.card (G.neighborSet F.u) = 18
    rw [F.neighbor_u, Nat.card_coe_set_eq,
      Set.ncard_insert_of_notMem (by simp), ← Nat.card_coe_set_eq, hF.card_D]
  have hid := nonadjacent_common_cell_identity (G := G) hcu hno
  rw [Nat.card_fin, hcount, ← deg_eq_degree, ← deg_eq_degree,
    F.degree_C hF hc, hu] at hid
  have hcap := card_commonAntiNeighbors_le_13 hG hcu hno
  have hupper : Nat.card (rowSet G F.T c) ≤ 7 := by
    rw [← hF.card_T]
    exact Set.ncard_mono Set.inter_subset_right
  constructor <;> omega

/-- The second core has the same 2 to 7 bounds for its 7-cell row. -/
public theorem D_T_degree_bounds (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) {d : Fin 43} (hd : d ∈ F.D) :
    2 ≤ Nat.card (rowSet G F.T d) ∧ Nat.card (rowSet G F.T d) ≤ 7 := by
  classical
  have hdu := ((F.mem_D d).mp hd).1.symm
  have hdv := ((F.mem_D d).mp hd).2
  have hno : ¬G.Adj d F.v := fun h ↦ F.separated d ⟨h.symm, hdu.symm⟩
  have he : G.commonNeighbors d F.v = insert F.u (rowSet G F.C d) := by
    rw [SimpleGraph.commonNeighbors, F.neighbor_v]
    ext x
    simp only [Set.mem_inter_iff, Set.mem_insert_iff, rowSet]
    change (G.Adj d x ∧ (x = F.u ∨ x ∈ F.C)) ↔
      (x = F.u ∨ (G.Adj d x ∧ x ∈ F.C))
    grind
  have hu : F.u ∉ rowSet G F.C d := by simp [rowSet]
  have hcount : Nat.card (G.commonNeighbors d F.v) = Nat.card (rowSet G F.C d) + 1 := by
    rw [he, Nat.card_coe_set_eq, Set.ncard_insert_of_notMem hu, ← Nat.card_coe_set_eq]
  have hv : deg G F.v = 18 := by
    change Nat.card (G.neighborSet F.v) = 18
    rw [F.neighbor_v, Nat.card_coe_set_eq,
      Set.ncard_insert_of_notMem (by simp), ← Nat.card_coe_set_eq, hF.card_C]
  have hid := nonadjacent_common_cell_identity (G := G) hdv hno
  rw [Nat.card_fin, hcount, ← deg_eq_degree, ← deg_eq_degree,
    F.degree_D hF hd, hv] at hid
  have hcap := card_commonAntiNeighbors_le_13 hG hdv hno
  have hupper : Nat.card (rowSet G F.T d) ≤ 7 := by
    rw [← hF.card_T]
    exact Set.ncard_mono Set.inter_subset_right
  constructor <;> omega

/-- Global degree bounds give 9 to 15 neighbors in the 2 other cells from the first core. -/
public theorem C_cross_degree_bounds (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) {c : Fin 43} (hc : c ∈ F.C) :
    9 ≤ Nat.card (rowSet G F.D c) + Nat.card (rowSet G F.T c) ∧
      Nat.card (rowSet G F.D c) + Nat.card (rowSet G F.T c) ≤ 15 := by
  classical
  have hb := degree_mem hG c
  rw [← deg_eq_degree, F.degree_C hF hc] at hb
  omega

/-- The second core has the mirrored 9 to 15 other-cell neighbor bounds. -/
public theorem D_cross_degree_bounds (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) {d : Fin 43} (hd : d ∈ F.D) :
    9 ≤ Nat.card (rowSet G F.C d) + Nat.card (rowSet G F.T d) ∧
      Nat.card (rowSet G F.C d) + Nat.card (rowSet G F.T d) ≤ 15 := by
  classical
  have hb := degree_mem hG d
  rw [← deg_eq_degree, F.degree_D hF hd] at hb
  omega

/-- An isolated 7-cell vertex has at least 10 neighbors in each core. -/
public theorem isolated_T_core_degree_ge_ten (F : Frame G) (hF : F.Admissible)
    {t : Fin 43} (ht : t ∈ F.T) (hiso : Nat.card (rowSet G F.T t) = 0) :
    10 ≤ Nat.card (rowSet G F.C t) ∧ 10 ≤ Nat.card (rowSet G F.D t) := by
  have hC : Nat.card ↥(F.C ∪ F.T) = 24 := by
    rw [Nat.card_coe_set_eq, Set.ncard_union_eq F.disjoint_CT,
      ← Nat.card_coe_set_eq, ← Nat.card_coe_set_eq, hF.card_C, hF.card_T]
  have hD : Nat.card ↥(F.D ∪ F.T) = 24 := by
    rw [Nat.card_coe_set_eq, Set.ncard_union_eq F.disjoint_DT,
      ← Nat.card_coe_set_eq, ← Nat.card_coe_set_eq, hF.card_D, hF.card_T]
  have hc := side_degree_ge_ten hF.side_C hC ⟨t, Or.inr ht⟩
  have hd := side_degree_ge_ten hF.side_D hD ⟨t, Or.inr ht⟩
  rw [induced_row_card, row_union_card _ _ F.disjoint_CT, hiso, Nat.add_zero] at hc
  rw [induced_row_card, row_union_card _ _ F.disjoint_DT, hiso, Nat.add_zero] at hd
  exact ⟨hc, hd⟩

end Frame

end Ramsey.d18.k1
