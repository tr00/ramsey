module

public import Ramsey.n43.d18.k2.Structure
public import Ramsey.theorems.Counting

/-!
# Strict density improvement in the K2 branch

The 2 vertices of the complete component have degree 18 and 16-vertex cross rows.
Their rows meet in 8 vertices. Re-rooting increases the neighborhood edge count from 61 to 69.
-/

@[expose] public section

namespace Ramsey.d18.k2

/-- Inserting a new vertex adds exactly its edges into the old vertex set. -/
private lemma edge_count_insert (G : SimpleGraph (Fin 43)) (a : Fin 43)
    (S : Set (Fin 43)) (ha : a ∉ S) :
    inducedEdgeCount G (insert a S) = inducedEdgeCount G S + Nat.card (rowSet G S a) := by
  classical
  have hd : Disjoint ({a} : Finset (Fin 43)) S.toFinset := by simpa
  have hs := links_self G ({a} : Finset (Fin 43))
  have hz : links G {a} {a} = 0 := by simp [links]
  have he : inducedEdgeCount G ({a} : Set (Fin 43)) = 0 := by
    simp only [Finset.coe_singleton] at hs
    omega
  have hc : crossEdgeCount G ({a} : Set (Fin 43)) S = Nat.card (rowSet G S a) := by
    have h := links_eq_crossEdgeCount G ({a} : Finset (Fin 43)) S.toFinset hd
    simp only [Finset.coe_singleton, Set.coe_toFinset, links, Finset.sum_singleton] at h
    have hset : (S.toFinset.filter (G.Adj a) : Set (Fin 43)) = rowSet G S a := by
      ext x
      simp [rowSet, and_comm]
    rw [← h, ← hset, Nat.card_coe_set_eq, Set.ncard_coe_finset]
  have hu := inducedEdgeCount_union G ({a} : Set (Fin 43)) S
    (Set.disjoint_singleton_left.mpr ha)
  simpa only [Set.singleton_union, he, hc, zero_add] using hu

/-- Every order-16 `(4,4)` graph has exactly 60 edges by the existing census bounds. -/
private lemma edges_sixty (G : SimpleGraph (Fin 43)) (S : Set (Fin 43))
    (hn : Nat.card S = 16) (hS : IsRamseyGraph 4 4 (G.induce S)) :
    inducedEdgeCount G S = 60 := by
  have hlo : 60 ≤ Nat.card (G.induce S).edgeSet := by
    exact_mod_cast edges_ramsey_4_4_16_ge_60.on_finite_type hn (G.induce S) hS
  have hhi : Nat.card (G.induce S).edgeSet ≤ 60 := by
    exact_mod_cast edges_ramsey_4_4_16_le_60.on_finite_type hn (G.induce S) hS
  exact Nat.le_antisymm hhi hlo

/-- Adjacent vertices have at most 8 common neighbors in a fixed antineighborhood. -/
private lemma common_row_cap {G : SimpleGraph (Fin 43)} (hG : IsRamseyGraph 5 5 G)
    (v u w : Fin 43) (huw : G.Adj u w) :
    Nat.card ↥(rowSet G (antiNeighborSet G v) u ∩
      rowSet G (antiNeighborSet G v) w) ≤ 8 := by
  let S := rowSet G (antiNeighborSet G v) u ∩ rowSet G (antiNeighborSet G v) w
  have hC := isRamseyGraph_induce_subset (isRamseyGraph_induce_commonNeighbors hG huw)
    (show S ⊆ G.commonNeighbors u w from fun _ hx ↦ ⟨hx.1.1, hx.2.1⟩)
  have hI := isRamseyGraph_induce_subset (isRamseyGraph_induce_antiNeighborSet_succ hG v)
    (show S ⊆ antiNeighborSet G v from fun _ hx ↦ hx.1.2)
  have hR : IsRamseyGraph 3 4 (G.induce S) := ⟨hC.1, hI.2⟩
  have h := ramsey_4_3_le_9.compl.card_lt hR
  change Nat.card S ≤ 8
  omega

/-- A K2 neighborhood admits a degree-18 re-root with exactly 8 more neighborhood edges. -/
theorem strict_reroot {G : SimpleGraph (Fin 43)} (hG : IsRamseyGraph 5 5 G)
    (v : Fin 43) (hv : deg G v = 18)
    (hK : IsKNeighborhood 2 (G.induce (G.neighborSet v))) :
    ∃ u : Fin 43, deg G u = 18 ∧
      inducedEdgeCount G (G.neighborSet v) = 61 ∧
      inducedEdgeCount G (G.neighborSet u) = 69 := by
  classical
  obtain ⟨u, w, C, huw, hvu, hvw, huwadj, hN, hd, hcut, hC, h44⟩ :=
    exists_structure v hv hK
  let B := antiNeighborSet G v
  let Ru := rowSet G B u
  let Rw := rowSet G B w
  have huc : u ∉ C := fun h ↦ Set.disjoint_left.mp hd (by simp) h
  have hwc : w ∉ C := fun h ↦ Set.disjoint_left.mp hd (by simp) h
  have hnu : G.neighborSet u = insert v (insert w Ru) := by
    ext x
    constructor
    · intro hx
      by_cases hxv : x = v
      · exact Set.mem_insert_iff.mpr (Or.inl hxv)
      by_cases hxw : x = w
      · exact Set.mem_insert_of_mem _ (Set.mem_insert_iff.mpr (Or.inl hxw))
      refine Set.mem_insert_of_mem _ (Set.mem_insert_of_mem _ ⟨hx, hxv, ?_⟩)
      intro hvx
      change x ∈ G.neighborSet v at hvx
      rw [hN] at hvx
      rcases hvx with hpair | hc
      · simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hpair
        rcases hpair with rfl | rfl
        · simp at hx
        · exact hxw rfl
      · exact (hcut x hc).1 hx
    · intro hx
      rcases hx with rfl | hx
      · exact hvu.symm
      rcases hx with rfl | hx
      · exact huwadj
      · exact hx.1
  have hnw : G.neighborSet w = insert v (insert u Rw) := by
    ext x
    constructor
    · intro hx
      by_cases hxv : x = v
      · exact Set.mem_insert_iff.mpr (Or.inl hxv)
      by_cases hxu : x = u
      · exact Set.mem_insert_of_mem _ (Set.mem_insert_iff.mpr (Or.inl hxu))
      refine Set.mem_insert_of_mem _ (Set.mem_insert_of_mem _ ⟨hx, hxv, ?_⟩)
      intro hvx
      change x ∈ G.neighborSet v at hvx
      rw [hN] at hvx
      rcases hvx with hpair | hc
      · simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hpair
        rcases hpair with rfl | rfl
        · exact hxu rfl
        · simp at hx
      · exact (hcut x hc).2 hx
    · intro hx
      rcases hx with rfl | hx
      · exact hvw.symm
      rcases hx with rfl | hx
      · exact huwadj.symm
      · exact hx.1
  have hvRu : v ∉ Ru := fun hx ↦ hx.2.1 rfl
  have hvRw : v ∉ Rw := fun hx ↦ hx.2.1 rfl
  have hwRu : w ∉ Ru := fun hx ↦ hx.2.2 hvw
  have huRw : u ∉ Rw := fun hx ↦ hx.2.2 hvu
  have hvwne : v ≠ w := hvw.ne
  have hvune : v ≠ u := hvu.ne
  have hdu : deg G u = Nat.card Ru + 2 := by
    change Nat.card (G.neighborSet u) = _
    rw [hnu, Nat.card_coe_set_eq, Nat.card_coe_set_eq,
      Set.ncard_insert_of_notMem (by simp [hvwne, hvRu]), Set.ncard_insert_of_notMem hwRu]
  have hdw : deg G w = Nat.card Rw + 2 := by
    change Nat.card (G.neighborSet w) = _
    rw [hnw, Nat.card_coe_set_eq, Nat.card_coe_set_eq,
      Set.ncard_insert_of_notMem (by simp [hvune, hvRw]), Set.ncard_insert_of_notMem huRw]
  have hflooru : 18 ≤ deg G u := by simpa only [deg_eq_degree] using (degree_mem hG u).1
  have hfloorw : 18 ≤ deg G w := by simpa only [deg_eq_degree] using (degree_mem hG w).1
  have hB : Nat.card B = 24 := by
    have h := card_neighborSet_add_antiNeighborSet G v
    change deg G v + Nat.card B + 1 = Nat.card (Fin 43) at h
    simp only [Nat.card_fin] at h
    omega
  have hcap := common_row_cap hG v u w huwadj
  change Nat.card ↥(Ru ∩ Rw) ≤ 8 at hcap
  have hsum := Set.ncard_union_add_ncard_inter Ru Rw
  have hunion : (Ru ∪ Rw).ncard ≤ B.ncard :=
    Set.ncard_mono (by rintro x (hx | hx) <;> exact hx.2)
  simp only [← Nat.card_coe_set_eq] at hsum hunion
  have hru : Nat.card Ru = 16 := by omega
  have hrw : Nat.card Rw = 16 := by omega
  have hinter : Nat.card ↥(Ru ∩ Rw) = 8 := by omega
  have hru44 : IsRamseyGraph 4 4 (G.induce Ru) :=
    isRamseyGraph_induce_mixedCell hG u v
  have heRu := edges_sixty G Ru hru hru44
  have heC := edges_sixty G C hC h44
  have hrowwC : rowSet G C w = ∅ := by
    ext x
    simp only [Set.mem_empty_iff_false, iff_false]
    exact fun hx ↦ (hcut x hx.2).2 hx.1
  have hrowuC : rowSet G (insert w C) u = {w} := by
    ext x
    constructor
    · rintro ⟨hx, rfl | hxC⟩
      · rfl
      · exact False.elim ((hcut x hxC).1 hx)
    · rintro rfl
      exact ⟨huwadj, Set.mem_insert _ _⟩
  have hrowvRu : rowSet G (insert w Ru) v = {w} := by
    ext x
    constructor
    · rintro ⟨hx, rfl | hxR⟩
      · rfl
      · exact False.elim (hxR.2.2 hx)
    · rintro rfl
      exact ⟨hvw, Set.mem_insert _ _⟩
  have hrowwRu : rowSet G Ru w = Ru ∩ Rw := by
    ext x
    simp only [Ru, Rw, rowSet, Set.mem_inter_iff]
    tauto
  have hesource : inducedEdgeCount G (G.neighborSet v) = 61 := by
    rw [hN, Set.insert_union, Set.singleton_union]
    rw [edge_count_insert G u _ (by simp [huw, huc]),
      edge_count_insert G w C hwc, hrowwC, hrowuC, heC]
    simp
  refine ⟨u, by omega, hesource, ?_⟩
  rw [hnu, edge_count_insert G v _ (by simp [hvwne, hvRu]),
    edge_count_insert G w Ru hwRu, heRu, hrowwRu, hinter, hrowvRu]
  simp

end Ramsey.d18.k2
