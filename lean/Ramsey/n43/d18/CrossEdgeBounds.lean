module

public import Ramsey.n43.d18.PivotBudget
public import Ramsey.n09.R43
public import Ramsey.theorems.CliqueBounds
public import Mathlib.Tactic
public import Mathlib.Combinatorics.SimpleGraph.Extremal.Turan

/-!
# Cross-edge upper bound at a degree-18 pivot

Independent omitted roots bound the high row classes. Critical 17-vertex mixed cells
exclude both equality profiles at 280 cross edges, leaving the bound 279.
-/

namespace Ramsey.d18

/-- The finite cross row at an ambient vertex. -/
private noncomputable def crossRow (G : SimpleGraph (Fin 43)) (v u : Fin 43) :
    Finset (Fin 43) := by
  classical
  exact Finset.univ.filter (fun y ↦ G.Adj u y ∧ y ∈ antiNeighborSet G v)

/-- Neighborhood vertices with a prescribed cross-row size. -/
private noncomputable def rowClass (G : SimpleGraph (Fin 43)) (v : Fin 43) (k : ℕ) :
    Finset (Fin 43) := by
  classical
  exact (G.neighborSet v).toFinset.filter (fun u ↦ (crossRow G v u).card = k)

/-- Finite cross-row cardinality agrees with the set-based counting vocabulary. -/
private lemma crossRow_card (G : SimpleGraph (Fin 43)) (v u : Fin 43) :
    (crossRow G v u).card = Nat.card (rowSet G (antiNeighborSet G v) u) := by
  classical
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
  congr 1
  ext y
  simp [crossRow, rowSet]

/-- Membership in a cross row means adjacency and antineighborhood membership. -/
@[simp] private lemma mem_crossRow (G : SimpleGraph (Fin 43)) (v u y : Fin 43) :
    y ∈ crossRow G v u ↔ G.Adj u y ∧ y ∈ antiNeighborSet G v := by
  classical
  simp [crossRow]

/-- Membership in a row class records neighborhood membership and exact row size. -/
@[simp] private lemma mem_rowClass (G : SimpleGraph (Fin 43)) (v u : Fin 43) (k : ℕ) :
    u ∈ rowClass G v k ↔ G.Adj v u ∧ (crossRow G v u).card = k := by
  classical
  simp [rowClass]

/-- An independent set in a candidate graph has at most 4 vertices. -/
private lemma independent_card_le_four {G : SimpleGraph (Fin 43)}
    (hG : IsRamseyGraph 5 5 G) {S : Finset (Fin 43)} (hS : G.IsIndepSet S) :
    S.card ≤ 4 :=
  independent_finset_card_le_of_indepSetFree hG.2 hS

/-- An independent triple missing 2 distinct vertices forces a neighbor between them. -/
private lemma independent_triple_neighbor {G : SimpleGraph (Fin 43)}
    (hG : IsRamseyGraph 5 5 G) {J : Finset (Fin 43)} (hJ : G.IsIndepSet J)
    (hcard : J.card = 3) {y z : Fin 43} (hy : y ∉ J) (hz : z ∉ J) (hyz : y ≠ z)
    (hyn : ∀ u ∈ J, ¬G.Adj u y) (hzn : ¬G.Adj z y) :
    ∃ u ∈ J, G.Adj z u := by
  classical
  by_contra hn
  push Not at hn
  have hind : G.IsIndepSet (insert y (insert z J) : Finset (Fin 43)) := by
    intro a ha b hb hab
    simp only [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at ha hb
    rcases ha with rfl | rfl | ha <;> rcases hb with rfl | rfl | hb
    · exact (hab rfl).elim
    · exact fun h ↦ hzn h.symm
    · exact fun h ↦ hyn b hb h.symm
    · exact hzn
    · exact (hab rfl).elim
    · exact hn b hb
    · exact hyn a ha
    · exact fun h ↦ hn a ha h.symm
    · exact hJ ha hb hab
  have hc := independent_card_le_four hG hind
  simp [hy, hz, hyz, hcard] at hc

section Incidences

variable (G : SimpleGraph (Fin 43)) [DecidableRel G.Adj]

/-- Distinct obligations require distinct neighbors when 1 edge covers at most 1 column. -/
private lemma omission_obligation_card_le (O L : Finset (Fin 43)) (z : Fin 43)
    (hw : ∀ y ∈ O, ∃ w ∈ L, G.Adj z w ∧ ¬G.Adj w y)
    (hone : ∀ w ∈ L, G.Adj z w → (O.filter (fun y ↦ ¬G.Adj w y)).card ≤ 1) :
    O.card ≤ (L.filter (G.Adj z)).card := by
  classical
  choose f hf using hw
  apply Finset.card_le_card_of_injOn (fun y ↦ if h : y ∈ O then f y h else z)
  · intro y hy
    change y ∈ O at hy
    change (if h : y ∈ O then f y h else z) ∈ L.filter (G.Adj z)
    rw [dite_eq_left hy]
    exact Finset.mem_filter.mpr ⟨(hf y hy).1, (hf y hy).2.1⟩
  · intro a ha b hb hab
    change a ∈ O at ha
    change b ∈ O at hb
    change (if h : a ∈ O then f a h else z) =
      (if h : b ∈ O then f b h else z) at hab
    simp only [dite_eq_left ha, dite_eq_left hb] at hab
    have hsmall := hone (f a ha) (hf a ha).1 (hf a ha).2.1
    have hya : a ∈ O.filter (fun y ↦ ¬G.Adj (f a ha) y) :=
      Finset.mem_filter.mpr ⟨ha, (hf a ha).2.2⟩
    have hyb : b ∈ O.filter (fun y ↦ ¬G.Adj (f a ha) y) := by
      rw [hab]
      exact Finset.mem_filter.mpr ⟨hb, (hf b hb).2.2⟩
    exact (Finset.card_le_one.mp hsmall) a hya b hyb

end Incidences

variable {G : SimpleGraph (Fin 43)} [DecidableRel G.Adj]

omit [DecidableRel G.Adj] in
/-- The 2 high row classes are disjoint. -/
private lemma rowClass17_disjoint_rowClass16 (v : Fin 43) :
    Disjoint (rowClass G v 17) (rowClass G v 16) := by
  classical
  apply Finset.disjoint_left.mpr
  intro u hu hw
  have hu' := (mem_rowClass G v u 17).mp hu
  have hw' := (mem_rowClass G v u 16).mp hw
  omega

/-- The ambient antineighborhood has 24 entries in every degree-18 row. -/
private lemma crossRow_omission_card (v : Fin 43) (hv : G.degree v = 18) (u : Fin 43) :
    ((antiNeighborSet G v).toFinset \ crossRow G v u).card +
      (crossRow G v u).card = 24 := by
  classical
  have hsub : crossRow G v u ⊆ (antiNeighborSet G v).toFinset := by
    intro y hy
    exact Set.mem_toFinset.mpr ((mem_crossRow G v u y).mp hy).2
  have h := Finset.card_sdiff_add_card_eq_card hsub
  have hb : (antiNeighborSet G v).toFinset.card = 24 := by
    have h := card_neighborSet_add_antiNeighborSet G v
    rw [Nat.card_eq_fintype_card (α := G.neighborSet v),
      SimpleGraph.card_neighborSet_eq_degree, hv, Nat.card_fin] at h
    simpa [Nat.card_eq_fintype_card] using (by omega : Nat.card (antiNeighborSet G v) = 24)
  omega

/-- Summing omissions in a row class counts each missing row entry once. -/
private lemma sum_rowClass_omissions (v : Fin 43) (hv : G.degree v = 18) (k : ℕ) :
    (∑ y ∈ (antiNeighborSet G v).toFinset,
      ((rowClass G v k).filter (fun u ↦ ¬G.Adj u y)).card) =
      (24 - k) * (rowClass G v k).card := by
  classical
  have hrow (u : Fin 43) (hu : u ∈ rowClass G v k) :
      ((antiNeighborSet G v).toFinset.filter (fun y ↦ ¬G.Adj u y)).card = 24 - k := by
    have he : (antiNeighborSet G v).toFinset.filter (fun y ↦ ¬G.Adj u y) =
        (antiNeighborSet G v).toFinset \ crossRow G v u := by
      ext y
      simp only [Finset.mem_filter, Finset.mem_sdiff, Set.mem_toFinset, mem_crossRow]
      tauto
    have hc := crossRow_omission_card v hv u
    have hk := (mem_rowClass G v u k).mp hu
    rw [he]
    omega
  calc
    _ = ∑ y ∈ (antiNeighborSet G v).toFinset, ∑ u ∈ rowClass G v k,
        if ¬G.Adj u y then 1 else 0 := by simp only [Finset.card_filter]
    _ = ∑ u ∈ rowClass G v k, ∑ y ∈ (antiNeighborSet G v).toFinset,
        if ¬G.Adj u y then 1 else 0 := Finset.sum_comm
    _ = ∑ u ∈ rowClass G v k, (24 - k) := by
      apply Finset.sum_congr rfl
      intro u hu
      simpa only [Finset.card_filter] using hrow u hu
    _ = _ := by simp [Nat.mul_comm]

/-- The 2 omission counts add because the high row classes are disjoint. -/
private lemma high_omission_card (v y : Fin 43) :
    ((rowClass G v 17 ∪ rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)).card =
      ((rowClass G v 17).filter (fun u ↦ ¬G.Adj u y)).card +
        ((rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)).card := by
  classical
  rw [Finset.filter_union, Finset.card_union_of_disjoint]
  exact (rowClass17_disjoint_rowClass16 (G := G) v).mono
    (Finset.filter_subset _ _) (Finset.filter_subset _ _)

/-- Row weights give the sharp linear bound in the 2 largest class sizes. -/
private lemma row_weight_sum (v : Fin 43) (hv : G.degree v = 18) :
    (∑ u ∈ (G.neighborSet v).toFinset,
      (15 + 2 * (if (crossRow G v u).card = 17 then 1 else 0) +
        (if (crossRow G v u).card = 16 then 1 else 0))) =
      270 + 2 * (rowClass G v 17).card + (rowClass G v 16).card := by
  classical
  have ha : (G.neighborSet v).toFinset.card = 18 := by
    simpa only [Set.toFinset_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  have hfilter (k : ℕ) :
      ((G.neighborSet v).toFinset.filter (fun u ↦ (crossRow G v u).card = k)).card =
        (rowClass G v k).card := by
    congr 1
    ext u
    simp only [Finset.mem_filter, Set.mem_toFinset, mem_rowClass,
      SimpleGraph.mem_neighborSet]
  simp only [Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_const, smul_eq_mul,
    Finset.sum_boole, ha, hfilter]
  norm_num

/-- The cross-edge count is the finite sum of its actual row sizes. -/
private lemma crossEdgeCount_eq_sum_crossRow (v : Fin 43) :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) =
      ∑ u ∈ (G.neighborSet v).toFinset, (crossRow G v u).card := by
  classical
  rw [crossEdgeCount_eq_sum_rows G _ _
    (Set.disjoint_left.mpr (fun _ ha hb ↦ hb.2 ha))]
  simp_rw [← crossRow_card]
  exact Finset.sum_set_coe (f := fun u : Fin 43 ↦ (crossRow G v u).card)
    (G.neighborSet v)

section Tail

variable (hG : IsRamseyGraph 5 5 G) (v : Fin 43)

include hG

omit [DecidableRel G.Adj] in
/-- Every cross row has at most 17 vertices. -/
private lemma crossRow_card_le_seventeen (u : Fin 43) :
    (crossRow G v u).card ≤ 17 := by
  rw [crossRow_card]
  exact card_mixedCell_le_17 hG u v

omit [DecidableRel G.Adj] in
/-- Adjacent roots have at most 8 common vertices in their cross rows. -/
private lemma adjacent_crossRow_inter_le_eight {u w : Fin 43} (huw : G.Adj u w) :
    (crossRow G v u ∩ crossRow G v w).card ≤ 8 := by
  classical
  let S := crossRow G v u ∩ crossRow G v w
  have hsubC : (S : Set (Fin 43)) ⊆ G.commonNeighbors u w := by
    intro x hx
    obtain ⟨hx₁, hx₂⟩ := Finset.mem_inter.mp hx
    exact ⟨(mem_crossRow G v u x).mp hx₁ |>.1,
      (mem_crossRow G v w x).mp hx₂ |>.1⟩
  have hsubB : (S : Set (Fin 43)) ⊆ antiNeighborSet G v := by
    intro x hx
    exact ((mem_crossRow G v u x).mp (Finset.mem_inter.mp hx).1).2
  have hR : IsRamseyGraph 3 4 (G.induce (S : Set (Fin 43))) := by
    constructor
    · rw [SimpleGraph.cliqueFree_induce_iff]
      intro T hT
      exact (SimpleGraph.cliqueFree_induce_iff G _ 3).mp
        (isRamseyGraph_induce_commonNeighbors hG huw).1 (fun x hx ↦ hsubC (hT hx))
    · rw [← SimpleGraph.cliqueFree_compl, compl_induce,
        SimpleGraph.cliqueFree_induce_iff]
      intro T hT
      have hB : (Gᶜ.induce (antiNeighborSet G v)).CliqueFree 4 := by
        rw [← compl_induce]
        exact (SimpleGraph.cliqueFree_compl _).mpr
          (isRamseyGraph_induce_antiNeighborSet hG v).2
      exact (SimpleGraph.cliqueFree_induce_iff Gᶜ _ 4).mp hB
        (fun x hx ↦ hsubB (hT hx))
  have hc : Nat.card (S : Set (Fin 43)) ≤ 8 := by
    by_contra hn
    exact ramsey_4_3_le_9.compl.not_isRamseyGraph (by omega) _ hR
  rw [Nat.card_coe_set_eq, Set.ncard_coe_finset] at hc
  exact hc

variable (hv : G.degree v = 18)

include hv

/-- For adjacent roots, row sizes and common omissions have total at most 32. -/
private lemma adjacent_crossRow_omission_bound {u w : Fin 43} (huw : G.Adj u w) :
    (crossRow G v u).card + (crossRow G v w).card +
      ((antiNeighborSet G v).toFinset \ (crossRow G v u ∪ crossRow G v w)).card ≤ 32 := by
  classical
  have hi := adjacent_crossRow_inter_le_eight hG v huw
  have hu : crossRow G v u ∪ crossRow G v w ⊆ (antiNeighborSet G v).toFinset := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · exact Set.mem_toFinset.mpr ((mem_crossRow G v u x).mp hx).2
    · exact Set.mem_toFinset.mpr ((mem_crossRow G v w x).mp hx).2
  have hc := Finset.card_sdiff_add_card_eq_card hu
  have he := Finset.card_union_add_card_inter (crossRow G v u) (crossRow G v w)
  have hb : (antiNeighborSet G v).toFinset.card = 24 := by
    simpa only [RootedRamseyGraph.B, Nat.card_eq_fintype_card, Set.toFinset_card] using
      degree18_antiNeighbor_card
        (({graph := G, ramsey := hG} : RamseyGraph 5 5 _).root v) hv
  omega

/-- Size-17 roots are pairwise nonadjacent. -/
private lemma rowClass17_independent :
    G.IsIndepSet (rowClass G v 17 : Set (Fin 43)) := by
  intro u hu w hw _ huw
  have h := adjacent_crossRow_omission_bound hG v hv huw
  have hu' := (mem_rowClass G v u 17).mp hu
  have hw' := (mem_rowClass G v w 17).mp hw
  omega

/-- Size-17 roots have no neighbors among size-16 roots. -/
private lemma rowClass17_anticomplete_rowClass16 {u w : Fin 43}
    (hu : u ∈ rowClass G v 17) (hw : w ∈ rowClass G v 16) : ¬G.Adj u w := by
  intro huw
  have h := adjacent_crossRow_omission_bound hG v hv huw
  have hu' := (mem_rowClass G v u 17).mp hu
  have hw' := (mem_rowClass G v w 16).mp hw
  omega

/-- All high-row roots omitting an antineighbor form an independent set. -/
private lemma omitted_highRows_independent {y : Fin 43}
    (hy : y ∈ antiNeighborSet G v) :
    G.IsIndepSet (((rowClass G v 17 ∪ rowClass G v 16).filter
      (fun u ↦ ¬G.Adj u y)) : Set (Fin 43)) := by
  classical
  intro u hu w hw _ huw
  obtain ⟨hu, huy⟩ := Finset.mem_filter.mp hu
  obtain ⟨hw, hwy⟩ := Finset.mem_filter.mp hw
  have h := adjacent_crossRow_omission_bound hG v hv huw
  have homit : y ∈ (antiNeighborSet G v).toFinset \
      (crossRow G v u ∪ crossRow G v w) := by
    simp [hy, huy, hwy]
  have hc := Finset.card_pos.mpr ⟨y, homit⟩
  rcases Finset.mem_union.mp hu with hu | hu <;>
    rcases Finset.mem_union.mp hw with hw | hw <;>
    have hu' := (mem_rowClass G v u _).mp hu <;>
    have hw' := (mem_rowClass G v w _).mp hw <;> omega

/-- At most 3 high-row roots can omit a fixed antineighbor. -/
private lemma omitted_highRows_card_le_three {y : Fin 43}
    (hy : y ∈ antiNeighborSet G v) :
    ((rowClass G v 17 ∪ rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)).card ≤ 3 := by
  let S := (rowClass G v 17 ∪ rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)
  have hS := omitted_highRows_independent hG v hv hy
  have hyS : y ∉ S := by
    intro h
    obtain ⟨h, _⟩ := Finset.mem_filter.mp h
    rcases Finset.mem_union.mp h with h | h <;>
      exact hy.2 ((mem_rowClass G v y _).mp h).1
  have hind : G.IsIndepSet (insert y S : Finset (Fin 43)) := by
    intro a ha b hb hab
    simp only [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at ha hb
    rcases ha with rfl | ha <;> rcases hb with rfl | hb
    · exact (hab rfl).elim
    · exact fun h ↦ (Finset.mem_filter.mp hb).2 h.symm
    · exact (Finset.mem_filter.mp ha).2
    · exact hS ha hb hab
  have hc := independent_card_le_four hG hind
  rw [Finset.card_insert_of_notMem hyS] at hc
  change S.card + 1 ≤ 4 at hc
  change S.card ≤ 3
  omega

/-- All size-17 roots together with omitted size-16 roots are independent. -/
private lemma rowClass17_union_omitted16_independent {y : Fin 43}
    (hy : y ∈ antiNeighborSet G v) :
    G.IsIndepSet (↑(rowClass G v 17 ∪
      (rowClass G v 16).filter (fun u ↦ ¬G.Adj u y) : Finset (Fin 43))) := by
  classical
  intro u hu w hw hne
  rcases Finset.mem_union.mp hu with hu | hu <;>
    rcases Finset.mem_union.mp hw with hw | hw
  · exact rowClass17_independent hG v hv hu hw hne
  · exact rowClass17_anticomplete_rowClass16 hG v hv hu (Finset.mem_filter.mp hw).1
  · exact fun h ↦ rowClass17_anticomplete_rowClass16 hG v hv hw
      (Finset.mem_filter.mp hu).1 h.symm
  · apply omitted_highRows_independent hG v hv hy _ _ hne
    · exact Finset.mem_filter.mpr ⟨Finset.mem_union_right _ (Finset.mem_filter.mp hu).1,
        (Finset.mem_filter.mp hu).2⟩
    · exact Finset.mem_filter.mpr ⟨Finset.mem_union_right _ (Finset.mem_filter.mp hw).1,
        (Finset.mem_filter.mp hw).2⟩

/-- At most 4 roots occur in the union used by the first omission budget. -/
private lemma rowClass17_union_omitted16_card_le_four {y : Fin 43}
    (hy : y ∈ antiNeighborSet G v) :
    (rowClass G v 17 ∪ (rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)).card ≤ 4 :=
  independent_card_le_four hG (rowClass17_union_omitted16_independent hG v hv hy)

/-- The high-row class sizes satisfy both independent omission budgets. -/
private lemma degree18_high_row_budgets :
    (rowClass G v 17).card ≤ 4 ∧
      8 * (rowClass G v 16).card ≤ 24 * (4 - (rowClass G v 17).card) ∧
      7 * (rowClass G v 17).card + 8 * (rowClass G v 16).card ≤ 72 := by
  classical
  have ht := independent_card_le_four hG (rowClass17_independent hG v hv)
  have hb : (antiNeighborSet G v).toFinset.card = 24 := by
    simpa only [RootedRamseyGraph.B, Nat.card_eq_fintype_card, Set.toFinset_card] using
      degree18_antiNeighbor_card
        (({graph := G, ramsey := hG} : RamseyGraph 5 5 _).root v) hv
  refine ⟨ht, ?_, ?_⟩
  · have hm : ∀ y ∈ (antiNeighborSet G v).toFinset,
        ((rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)).card ≤
          4 - (rowClass G v 17).card := by
      intro y hy
      have h := rowClass17_union_omitted16_card_le_four hG v hv (Set.mem_toFinset.mp hy)
      have hd : Disjoint (rowClass G v 17)
          ((rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)) :=
        (rowClass17_disjoint_rowClass16 (G := G) v).mono_right (Finset.filter_subset _ _)
      rw [Finset.card_union_of_disjoint hd] at h
      omega
    have hs := Finset.sum_le_sum hm
    rw [sum_rowClass_omissions v hv 16] at hs
    simpa [hb] using hs
  · have hm : ∀ y ∈ (antiNeighborSet G v).toFinset,
        ((rowClass G v 17 ∪ rowClass G v 16).filter
          (fun u ↦ ¬G.Adj u y)).card ≤ 3 := by
      intro y hy
      exact omitted_highRows_card_le_three hG v hv (Set.mem_toFinset.mp hy)
    have hs := Finset.sum_le_sum hm
    simp_rw [high_omission_card] at hs
    rw [Finset.sum_add_distrib, sum_rowClass_omissions v hv 17,
      sum_rowClass_omissions v hv 16] at hs
    simpa [hb] using hs

/-- All other rows have size at most 15, giving the linear high-row bound. -/
private lemma degree18_cross_le_row_weights :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) ≤
      270 + 2 * (rowClass G v 17).card + (rowClass G v 16).card := by
  classical
  rw [crossEdgeCount_eq_sum_crossRow, ← row_weight_sum v hv]
  apply Finset.sum_le_sum
  intro u _
  have hc := crossRow_card_le_seventeen hG v u
  split_ifs <;> omega

/-- Every degree-18 pivot has at most 280 cross edges. -/
private lemma degree18_cross_le_280 :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) ≤ 280 := by
  have h := degree18_high_row_budgets hG v hv
  have hx := degree18_cross_le_row_weights hG v hv
  omega

/-- Equality leaves exactly 2 high-row profiles and makes every other row size 15. -/
private lemma degree18_cross_eq_280_profile 
    (hx : crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 280) :
    (((rowClass G v 17).card = 1 ∧ (rowClass G v 16).card = 8) ∨
      ((rowClass G v 17).card = 2 ∧ (rowClass G v 16).card = 6)) ∧
      ∀ u, G.Adj v u → u ∉ rowClass G v 17 → u ∉ rowClass G v 16 →
        (crossRow G v u).card = 15 := by
  classical
  have hb := degree18_high_row_budgets hG v hv
  have hw := degree18_cross_le_row_weights hG v hv
  have hp : ((rowClass G v 17).card = 1 ∧ (rowClass G v 16).card = 8) ∨
      ((rowClass G v 17).card = 2 ∧ (rowClass G v 16).card = 6) := by omega
  refine ⟨hp, ?_⟩
  have hle : ∀ u ∈ (G.neighborSet v).toFinset, (crossRow G v u).card ≤
      15 + 2 * (if (crossRow G v u).card = 17 then 1 else 0) +
        (if (crossRow G v u).card = 16 then 1 else 0) := by
    intro u _
    have hc := crossRow_card_le_seventeen hG v u
    split_ifs <;> omega
  have he : (∑ u ∈ (G.neighborSet v).toFinset, (crossRow G v u).card) =
      ∑ u ∈ (G.neighborSet v).toFinset,
        (15 + 2 * (if (crossRow G v u).card = 17 then 1 else 0) +
          (if (crossRow G v u).card = 16 then 1 else 0)) := by
    rw [← crossEdgeCount_eq_sum_crossRow, row_weight_sum v hv, hx]
    rcases hp with ⟨ht, hs⟩ | ⟨ht, hs⟩ <;> omega
  have hall := (Finset.sum_eq_sum_iff_of_le hle).mp he
  intro u hu h17 h16
  have h17' : (crossRow G v u).card ≠ 17 := by
    intro h
    exact h17 ((mem_rowClass G v u 17).mpr ⟨hu, h⟩)
  have h16' : (crossRow G v u).card ≠ 16 := by
    intro h
    exact h16 ((mem_rowClass G v u 16).mpr ⟨hu, h⟩)
  simpa [h17', h16'] using hall u (Set.mem_toFinset.mpr hu)

/-- A size-15 row missing a saturated high column needs an omitted size-16 neighbor. -/
private lemma high_omission_neighbor 
    {z y : Fin 43} (hz : (crossRow G v z).card = 15)
    (hy : y ∈ antiNeighborSet G v) (hzy : ¬G.Adj z y)
    (hq : ((rowClass G v 17 ∪ rowClass G v 16).filter
      (fun u ↦ ¬G.Adj u y)).card = 3) (hyz : y ≠ z) :
    ∃ w ∈ rowClass G v 16, G.Adj z w ∧ ¬G.Adj w y := by
  classical
  let J := (rowClass G v 17 ∪ rowClass G v 16).filter (fun u ↦ ¬G.Adj u y)
  have hyJ : y ∉ J := by
    intro h
    obtain ⟨h, _⟩ := Finset.mem_filter.mp h
    rcases Finset.mem_union.mp h with h | h <;>
      exact hy.2 ((mem_rowClass G v y _).mp h).1
  have hzJ : z ∉ J := by
    intro h
    obtain ⟨h, _⟩ := Finset.mem_filter.mp h
    rcases Finset.mem_union.mp h with h | h <;>
      have := (mem_rowClass G v z _).mp h <;> omega
  obtain ⟨w, hw, hzw⟩ := independent_triple_neighbor hG
    (omitted_highRows_independent hG v hv hy) hq hyJ hzJ hyz
    (fun u hu ↦ (Finset.mem_filter.mp hu).2) hzy
  obtain ⟨hw, hwy⟩ := Finset.mem_filter.mp hw
  rcases Finset.mem_union.mp hw with hw | hw
  · have hc := adjacent_crossRow_omission_bound hG v hv hzw
    have hw17 := (mem_rowClass G v w 17).mp hw
    have ho : y ∈ (antiNeighborSet G v).toFinset \
        (crossRow G v z ∪ crossRow G v w) := by simp [hy, hzy, hwy]
    have hp := Finset.card_pos.mpr ⟨y, ho⟩
    omega
  · exact ⟨w, hw, hzw, hwy⟩

/-- An edge between rows of sizes 15 and 16 covers at most 1 common omission. -/
private lemma adjacent_omissions_le_one 
    {z w : Fin 43} (hz : (crossRow G v z).card = 15)
    (hw : (crossRow G v w).card = 16) (hzw : G.Adj z w)
    (O : Finset (Fin 43)) (hO : ∀ y ∈ O, y ∈ antiNeighborSet G v ∧ ¬G.Adj z y) :
    (O.filter (fun y ↦ ¬G.Adj w y)).card ≤ 1 := by
  classical
  have hc := adjacent_crossRow_omission_bound hG v hv hzw
  have hs : O.filter (fun y ↦ ¬G.Adj w y) ⊆
      (antiNeighborSet G v).toFinset \ (crossRow G v z ∪ crossRow G v w) := by
    intro y hy
    obtain ⟨hyO, hwy⟩ := Finset.mem_filter.mp hy
    obtain ⟨hyB, hzy⟩ := hO y hyO
    simp [hyB, hzy, hwy]
  have hn := Finset.card_le_card hs
  omega

end Tail

/-- A vertex in a `(4,4)` graph has at most 8 neighbors. -/
private lemma core_degree_le_eight {V : Type*} [Fintype V] (H : SimpleGraph V)
    [DecidableRel H.Adj] (hH : IsRamseyGraph 4 4 H) (x : V) : H.degree x ≤ 8 := by
  classical
  have hr : IsRamseyGraph 3 4 (H.induce (H.neighborSet x)) := by
    refine ⟨?_, indepSetFree_induce _ _ hH.2⟩
    rw [SimpleGraph.cliqueFree_induce_iff]
    intro t ht hc
    exact hH.1 _ (hc.insert (fun y hy ↦ ht hy))
  by_contra hn
  apply ramsey_4_3_le_9.not_isRamseyGraph
    (G := (H.induce (H.neighborSet x))ᶜ)
  · simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
      using (show 9 ≤ H.degree x by omega)
  · exact (isRamseyGraph_compl _).mp hr

section Cores

variable (G)

variable (hG : IsRamseyGraph 5 5 G)

include hG

/-- A size-17 cross row inherits the critical mixed-cell regularity. -/
private lemma crossRow_regular (v u : Fin 43) (hu : (crossRow G v u).card = 17)
    (y : Fin 43) (hy : y ∈ crossRow G v u) :
    (G.neighborFinset y ∩ crossRow G v u).card = 8 := by
  classical
  have he : (crossRow G v u : Set (Fin 43)) =
      G.neighborSet u ∩ antiNeighborSet G v := by
    ext z
    simp [crossRow]
  have hr : IsRamseyGraph 4 4 (G.induce (crossRow G v u : Set (Fin 43))) := by
    rw [he]
    exact isRamseyGraph_induce_mixedCell hG u v
  have hn : Fintype.card (crossRow G v u : Set (Fin 43)) = 17 := by
    change Fintype.card ↥(crossRow G v u) = 17
    rw [Fintype.card_coe, hu]
  have hd := core_degree_le_eight _ hr ⟨y, hy⟩
  have hc := core_degree_le_eight _ ((isRamseyGraph_compl _).mp hr) ⟨y, hy⟩
  rw [SimpleGraph.degree_compl, hn] at hc
  rw [induced_degree_eq_neighbor_inter_card] at hd hc
  change (G.neighborFinset y ∩ crossRow G v u).card ≤ 8 at hd
  change 17 - 1 - (G.neighborFinset y ∩ crossRow G v u).card ≤ 8 at hc
  omega

/-- A regular critical row contributes 8 times the number of chosen vertices. -/
private lemma links_regular (v u : Fin 43) (hu : (crossRow G v u).card = 17)
    (S : Finset (Fin 43)) (hS : S ⊆ crossRow G v u) :
    links G S (crossRow G v u) = 8 * S.card := by
  classical
  rw [links_neighbor_sum]
  rw [Finset.sum_congr rfl (fun y hy ↦ crossRow_regular G hG v u hu y (hS hy))]
  simp [Nat.mul_comm]

/-- 7 vertices without an independent 4-set span at least 5 edges. -/
private lemma seven_edges_ge_five (v : Fin 43) (S : Finset (Fin 43))
    (hS : (S : Set (Fin 43)) ⊆ antiNeighborSet G v) (hn : S.card = 7) :
    5 ≤ inducedEdgeCount G (S : Set (Fin 43)) := by
  classical
  have hB : (Gᶜ.induce (antiNeighborSet G v)).CliqueFree 4 := by
    rw [← compl_induce]
    exact (SimpleGraph.cliqueFree_compl _).mpr
      (isRamseyGraph_induce_antiNeighborSet hG v).2
  have hi : (G.induce (S : Set (Fin 43))).IndepSetFree 4 := by
    rw [← SimpleGraph.cliqueFree_compl, compl_induce,
      SimpleGraph.cliqueFree_induce_iff]
    intro t ht
    exact (SimpleGraph.cliqueFree_induce_iff _ _ _).mp hB (fun _ hz ↦ hS (ht hz))
  have hc := ((SimpleGraph.cliqueFree_compl _).mpr hi).card_edgeFinset_le (r := 3)
  have he := card_edges_add_card_edges_compl (G.induce (S : Set (Fin 43)))
  have hn' : Fintype.card (S : Set (Fin 43)) = 7 := by simpa using hn
  rw [hn', SimpleGraph.turanNumber_three] at hc
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at hc
  have hn'' : Nat.card (S : Set (Fin 43)) = 7 := by simpa using hn
  rw [hn''] at he
  have hchoose : Nat.choose 7 2 = 21 := by decide
  rw [hchoose] at he
  change 5 ≤ Nat.card (G.induce (S : Set (Fin 43))).edgeSet
  norm_num at hc he ⊢
  omega

/-- Critical rows covering the 24 antineighbors give exact incidences and a 5-edge saving. -/
private lemma core_accounting (v u w : Fin 43) (hv : G.degree v = 18)
    (hu : (crossRow G v u).card = 17) (hw : (crossRow G v w).card = 17)
    (hcover : crossRow G v u ∪ crossRow G v w = (antiNeighborSet G v).toFinset) :
    let X := crossRow G v u \ crossRow G v w
    let Y := crossRow G v w \ crossRow G v u
    let M := X ∪ Y
    let f := crossEdgeCount G (X : Set (Fin 43)) (Y : Set (Fin 43))
    M.card = 14 ∧ links G M (antiNeighborSet G v).toFinset = 112 + 2 * f ∧
      inducedEdgeCount G (antiNeighborSet G v) + 5 ≤ 124 + f := by
  classical
  let P := crossRow G v u
  let Q := crossRow G v w
  let X := P \ Q
  let Y := Q \ P
  let B := (antiNeighborSet G v).toFinset
  have hb : (P ∪ Q).card = 24 := by
    rw [hcover]
    simpa only [RootedRamseyGraph.B, Nat.card_eq_fintype_card, Set.toFinset_card] using
      degree18_antiNeighbor_card
        (({graph := G, ramsey := hG} : RamseyGraph 5 5 _).root v) hv
  have hi := Finset.card_inter_add_card_union P Q
  have hx := Finset.card_sdiff_add_card_inter P Q
  have hy := Finset.card_sdiff_add_card_inter Q P
  rw [Finset.inter_comm Q] at hy
  have hPcard : P.card = 17 := hu
  have hQcard : Q.card = 17 := hw
  change X.card + (P ∩ Q).card = P.card at hx
  change Y.card + (P ∩ Q).card = Q.card at hy
  have hXcard : X.card = 7 := by omega
  have hYcard : Y.card = 7 := by omega
  have hXY : Disjoint X Y := by
    apply Finset.disjoint_left.mpr
    intro y hx hy
    exact (Finset.mem_sdiff.mp hx).2 (Finset.mem_sdiff.mp hy).1
  have hPY : Disjoint P Y := by
    apply Finset.disjoint_left.mpr
    intro y hp hy
    exact (Finset.mem_sdiff.mp hy).2 hp
  have hQX : Disjoint Q X := by
    apply Finset.disjoint_left.mpr
    intro y hq hx
    exact (Finset.mem_sdiff.mp hx).2 hq
  have hPB : P ∪ Y = B := by
    calc
      P ∪ Y = P ∪ Q := by ext y; simp [Y]
      _ = B := hcover
  have hQB : Q ∪ X = B := by
    calc
      Q ∪ X = P ∪ Q := by ext y; simp [X]; tauto
      _ = B := hcover
  have hXR : links G X P = 56 := by
    have h := links_regular G hG v u hu X Finset.sdiff_subset
    simpa only [hXcard, Nat.reduceMul] using h
  have hYR : links G Y Q = 56 := by
    have h := links_regular G hG v w hw Y Finset.sdiff_subset
    simpa only [hYcard, Nat.reduceMul] using h
  have hXB : links G X B = 56 + crossEdgeCount G (X : Set _) (Y : Set _) := by
    rw [← hPB, links_union_right G X P Y hPY, hXR, links_eq_crossEdgeCount G X Y hXY]
  have hYB : links G Y B = 56 + crossEdgeCount G (X : Set _) (Y : Set _) := by
    rw [← hQB, links_union_right G Y Q X hQX, hYR, links_comm G Y X,
      links_eq_crossEdgeCount G X Y hXY]
  refine ⟨?_, ?_, ?_⟩
  · change (X ∪ Y).card = 14
    rw [Finset.card_union_of_disjoint hXY, hXcard, hYcard]
  · change links G (X ∪ Y) B = 112 + 2 * crossEdgeCount G (X : Set _) (Y : Set _)
    rw [links_union_left G X Y B hXY, hXB, hYB]
    omega
  · change inducedEdgeCount G (antiNeighborSet G v) + 5 ≤
      124 + crossEdgeCount G (X : Set _) (Y : Set _)
    have hPP : links G P P = 136 := by
      have h := links_regular G hG v u hu P Finset.Subset.rfl
      simpa only [hPcard, Nat.reduceMul] using h
    have hBB := links_union_left G P Y B hPY
    have hP := links_union_right G P P Y hPY
    have hY := links_union_right G Y P Y hPY
    rw [hPB] at hBB hP hY
    rw [hPP, links_comm G P Y] at hP
    have hBdiag : links G B B = 2 * inducedEdgeCount G (antiNeighborSet G v) := by
      simpa only [B, Set.coe_toFinset] using links_self G B
    have hYdiag := links_self G Y
    have hsave : 5 ≤ inducedEdgeCount G (Y : Set (Fin 43)) := by
      apply seven_edges_ge_five G hG v Y ?_ hYcard
      intro y hy
      exact ((mem_crossRow G v w y).mp (Finset.mem_sdiff.mp hy).1).2
    omega

end Cores

/-- Total omission count 71 leaves at most 1 unsaturated column. -/
private lemma single_saturated_columns (B : Finset (Fin 43)) (q : Fin 43 → ℕ)
    (hB : B.card = 24) (hq : ∀ y ∈ B, q y ≤ 3) (hs : ∑ y ∈ B, q y = 71) :
    (B.filter (fun y ↦ q y ≠ 3)).card ≤ 1 := by
  classical
  have hpoint : ∀ y ∈ B, q y + (if q y ≠ 3 then 1 else 0) ≤ 3 := by
    intro y hy
    split_ifs <;> have := hq y hy <;> omega
  have hsum := Finset.sum_le_sum hpoint
  rw [Finset.sum_add_distrib, hs, ← Finset.card_filter] at hsum
  simp only [Finset.sum_const, smul_eq_mul, hB] at hsum
  omega


/-- A size-16 row root has at most 7 neighbors inside the pivot neighborhood. -/
private lemma sixteen_neighbor_card (hG : IsRamseyGraph 5 5 G)
    (v : Fin 43) {w : Fin 43} (hw : w ∈ rowClass G v 16) :
    ((G.neighborSet v).toFinset.filter (G.Adj w)).card ≤ 7 := by
  classical
  have hw' := (mem_rowClass G v w 16).mp hw
  have hr := degree_eq_common_add_mixed (G := G) w v
  have hd := degree_le_24 hG w
  have hc : Nat.card (G.commonNeighbors w v) =
      ((G.neighborSet v).toFinset.filter (G.Adj w)).card := by
    rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
    congr 1
    ext x
    simp [SimpleGraph.commonNeighbors, and_comm]
  have hrow : Nat.card ↥(G.neighborSet w ∩ antiNeighborSet G v) = 16 := by
    change Nat.card (rowSet G (antiNeighborSet G v) w) = 16
    rw [← crossRow_card, hw'.2]
  rw [hc, hrow, ite_eq_left hw'.1.symm] at hr
  omega


section PivotCounts

variable (G)

/-- A 6-vertex graph without an independent triple has at least 6 edges. -/
private lemma six_roots_edges (L : Finset (Fin 43)) (hL : L.card = 6)
    (hfree : (G.induce (L : Set _)).IndepSetFree 3) :
    6 ≤ inducedEdgeCount G (L : Set _) := by
  classical
  have hc : (G.induce (L : Set _))ᶜ.CliqueFree (2 + 1) :=
    (SimpleGraph.cliqueFree_compl _).mpr hfree
  have ht := hc.card_edgeFinset_le
  have hcard : Fintype.card (L : Set (Fin 43)) = 6 := by
    change Fintype.card ↥L = 6
    simpa using hL
  rw [hcard, SimpleGraph.turanNumber_two] at ht
  have he := card_edges_add_card_edges_compl (G.induce (L : Set _))
  have hn : Nat.card (L : Set (Fin 43)) = 6 := by
    rw [Nat.card_eq_fintype_card, hcard]
  rw [hn] at he
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at ht
  change 6 ≤ Nat.card (G.induce (L : Set _)).edgeSet
  norm_num [Nat.choose] at he ht ⊢
  omega

/-- 2 disjoint subsets use no more incidences than their ambient neighborhood. -/
private lemma links_partition_le (v : Fin 43) (L Z : Finset (Fin 43)) (hd : Disjoint L Z)
    (hL : ∀ u ∈ L, G.Adj v u ∧ (crossRow G v u).card = 16)
    (hZ : ∀ z ∈ Z, G.Adj v z) (hG : IsRamseyGraph 5 5 G) :
    links G L L + links G L Z ≤ 7 * L.card := by
  classical
  have hpoint : ∀ u ∈ L,
      (L.filter (G.Adj u)).card + (Z.filter (G.Adj u)).card ≤ 7 := by
    intro u hu
    have hsub : L.filter (G.Adj u) ∪ Z.filter (G.Adj u) ⊆
        (G.neighborSet v).toFinset.filter (G.Adj u) := by
      intro a ha
      rcases Finset.mem_union.mp ha with ha | ha
      · exact Finset.mem_filter.mpr
          ⟨Set.mem_toFinset.mpr (hL a (Finset.mem_filter.mp ha).1).1,
            (Finset.mem_filter.mp ha).2⟩
      · exact Finset.mem_filter.mpr
          ⟨Set.mem_toFinset.mpr (hZ a (Finset.mem_filter.mp ha).1),
            (Finset.mem_filter.mp ha).2⟩
    have hdis : Disjoint (L.filter (G.Adj u)) (Z.filter (G.Adj u)) :=
      hd.mono (Finset.filter_subset _ _) (Finset.filter_subset _ _)
    have hcount := Finset.card_le_card hsub
    rw [Finset.card_union_of_disjoint hdis] at hcount
    exact hcount.trans (sixteen_neighbor_card hG v
      ((mem_rowClass G v u 16).mpr (hL u hu)))
  have hs := Finset.sum_le_sum hpoint
  rw [links_filter_sum, links_filter_sum]
  simpa [Finset.sum_add_distrib, mul_comm] using hs

/-- Adjacencies and omissions partition all pairs between 2 finite sides. -/
private lemma links_add_omissions (S T : Finset (Fin 43)) :
    links G S T + (∑ t ∈ T, (S.filter (fun s ↦ ¬G.Adj t s)).card) = S.card * T.card := by
  classical
  rw [links_filter_sum]
  have hs : (∑ t ∈ T, (S.filter (fun s ↦ ¬G.Adj t s)).card) =
      ∑ s ∈ S, (T.filter (fun t ↦ ¬G.Adj s t)).card := by
    simp only [Finset.card_filter]
    rw [Finset.sum_comm]
    simp only [SimpleGraph.adj_comm]
  rw [hs, ← Finset.sum_add_distrib]
  simp only [Finset.card_filter_add_card_filter_not, Finset.sum_const, smul_eq_mul]

/-- Degrees on a subset of the antineighborhood split into its 2 pivot sides. -/
private lemma subset_pivot_degree_sum (v : Fin 43) (S : Finset (Fin 43))
    (hS : ∀ y ∈ S, y ∈ antiNeighborSet G v) :
    (∑ y ∈ S, G.degree y) = links G S (antiNeighborSet G v).toFinset +
      links G S (G.neighborSet v).toFinset := by
  classical
  rw [links_neighbor_sum, links_neighbor_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro y hy
  have hd : Disjoint (G.neighborFinset y ∩ (antiNeighborSet G v).toFinset)
      (G.neighborFinset y ∩ (G.neighborSet v).toFinset) := by
    apply Finset.disjoint_left.mpr
    intro x hx hx'
    have hxB : x ∈ antiNeighborSet G v := Set.mem_toFinset.mp (Finset.mem_inter.mp hx).2
    have hxA : x ∈ G.neighborSet v := Set.mem_toFinset.mp (Finset.mem_inter.mp hx').2
    exact hxB.2 hxA
  rw [← Finset.card_union_of_disjoint hd, ← SimpleGraph.card_neighborFinset_eq_degree]
  congr 1
  ext x
  simp only [Finset.mem_union, Finset.mem_inter, SimpleGraph.mem_neighborFinset,
    Set.mem_toFinset, SimpleGraph.mem_neighborSet]
  constructor
  · intro hyx
    by_cases hvx : G.Adj v x
    · exact Or.inr ⟨hyx, hvx⟩
    · exact Or.inl ⟨hyx, (show x ≠ v ∧ ¬G.Adj v x from
        ⟨fun he ↦ (hS y hy).2 (he ▸ hyx.symm), hvx⟩)⟩
  · rintro (h | h) <;> exact h.1

end PivotCounts

section Equality

variable (hG : IsRamseyGraph 5 5 G) (v : Fin 43) (hv : G.degree v = 18)

include hG hv

/-- Equality at 280 cannot have exactly 1 size-17 row. -/
private lemma degree18_cross_eq_280_not_single
    (hx : crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 280)
    (ht : (rowClass G v 17).card = 1) : False := by
  classical
  let A := (G.neighborSet v).toFinset
  let B := (antiNeighborSet G v).toFinset
  let H := rowClass G v 17 ∪ rowClass G v 16
  let L := rowClass G v 16
  let Z := A \ H
  let q := fun y ↦ (H.filter (fun u ↦ ¬G.Adj u y)).card
  let bad := B.filter (fun y ↦ q y ≠ 3)
  have hp := degree18_cross_eq_280_profile hG v hv hx
  have hs : L.card = 8 := by dsimp [L]; omega
  have hA : A.card = 18 := by
    simpa only [A, Set.toFinset_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  have hB : B.card = 24 := by
    simpa only [B, RootedRamseyGraph.B, Nat.card_eq_fintype_card, Set.toFinset_card] using
      degree18_antiNeighbor_card
        (({graph := G, ramsey := hG} : RamseyGraph 5 5 _).root v) hv
  have hHA : H ⊆ A := by
    intro u hu
    rcases Finset.mem_union.mp hu with hu | hu <;>
      exact Set.mem_toFinset.mpr ((mem_rowClass G v u _).mp hu).1
  have hH : H.card = 9 := by
    dsimp [H]
    rw [Finset.card_union_of_disjoint (rowClass17_disjoint_rowClass16 v), ht]
    change 1 + L.card = 9
    omega
  have hZ : Z.card = 9 := by
    have h := Finset.card_sdiff_add_card_eq_card hHA
    change Z.card + H.card = A.card at h
    omega
  have hzA : ∀ z ∈ Z, G.Adj v z := by
    intro z hz
    simpa only [A, Set.mem_toFinset, SimpleGraph.mem_neighborSet] using
      (Finset.mem_sdiff.mp hz).1
  have hz15 : ∀ z ∈ Z, (crossRow G v z).card = 15 := by
    intro z hz
    apply hp.2 z (hzA z hz)
    · intro h
      exact (Finset.mem_sdiff.mp hz).2 (Finset.mem_union_left _ h)
    · intro h
      exact (Finset.mem_sdiff.mp hz).2 (Finset.mem_union_right _ h)
  have hq : ∀ y ∈ B, q y ≤ 3 := by
    intro y hy
    exact omitted_highRows_card_le_three hG v hv (Set.mem_toFinset.mp hy)
  have hqsum : ∑ y ∈ B, q y = 71 := by
    change (∑ y ∈ B, ((rowClass G v 17 ∪ rowClass G v 16).filter
      (fun u ↦ ¬G.Adj u y)).card) = 71
    simp_rw [high_omission_card]
    rw [Finset.sum_add_distrib, sum_rowClass_omissions v hv 17,
      sum_rowClass_omissions v hv 16, ht]
    change 7 * 1 + 8 * L.card = 71
    omega
  have hbad : bad.card ≤ 1 := single_saturated_columns B q hB hq hqsum
  have hlower : ∀ z ∈ Z, 8 ≤ (L.filter (G.Adj z)).card := by
    intro z hz
    let O := (B \ crossRow G v z) \ bad
    have hO : 8 ≤ O.card := by
      have hc := crossRow_omission_card v hv z
      rw [hz15 z hz] at hc
      have hd := Finset.card_le_card_sdiff_add_card
        (s := B \ crossRow G v z) (t := bad)
      change (B \ crossRow G v z).card ≤ O.card + bad.card at hd
      change (B \ crossRow G v z).card + 15 = 24 at hc
      omega
    have hyO : ∀ y ∈ O, y ∈ antiNeighborSet G v ∧ ¬G.Adj z y ∧ q y = 3 := by
      intro y hy
      obtain ⟨hyC, hybad⟩ := Finset.mem_sdiff.mp hy
      obtain ⟨hyB, hyz⟩ := Finset.mem_sdiff.mp hyC
      have hyB' := Set.mem_toFinset.mp hyB
      have hn : ¬G.Adj z y := by
        intro h
        exact hyz ((mem_crossRow G v z y).mpr ⟨h, hyB'⟩)
      have hq3 : q y = 3 := by
        by_contra h
        exact hybad (Finset.mem_filter.mpr ⟨hyB, h⟩)
      exact ⟨hyB', hn, hq3⟩
    have hwitness : ∀ y ∈ O, ∃ w ∈ L, G.Adj z w ∧ ¬G.Adj w y := by
      intro y hy
      obtain ⟨hyB, hzy, hq3⟩ := hyO y hy
      apply high_omission_neighbor hG v hv (hz15 z hz) hyB hzy hq3
      intro h
      exact hyB.2 (h ▸ hzA z hz)
    have hone : ∀ w ∈ L, G.Adj z w →
        (O.filter (fun y ↦ ¬G.Adj w y)).card ≤ 1 := by
      intro w hw hzw
      apply adjacent_omissions_le_one hG v hv (hz15 z hz)
        ((mem_rowClass G v w 16).mp hw).2 hzw O
      intro y hy
      exact ⟨(hyO y hy).1, (hyO y hy).2.1⟩
    exact hO.trans (omission_obligation_card_le G O L z hwitness hone)
  have hlow : 72 ≤ links G Z L := by
    have h := Finset.sum_le_sum hlower
    rw [links_filter_sum]
    simpa [hZ] using h
  have hupp : links G L Z ≤ 56 := by
    have hpoint : ∀ w ∈ L, (Z.filter (G.Adj w)).card ≤ 7 := by
      intro w hw
      apply (Finset.card_le_card ?_).trans (sixteen_neighbor_card hG v hw)
      exact Finset.filter_subset_filter _ (Finset.sdiff_subset : Z ⊆ A)
    have h := Finset.sum_le_sum hpoint
    rw [links_filter_sum]
    simpa [hs] using h
  rw [links_comm] at hlow
  omega

/-- Equality with 2 critical roots forces their cover and saturated companion omissions. -/
private lemma double_profile_structure
    (hx : crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 280)
    (ht2 : (rowClass G v 17).card = 2) :
    ∃ u w : Fin 43, u ≠ w ∧ rowClass G v 17 = {u, w} ∧
      (rowClass G v 16).card = 6 ∧
      crossRow G v u ∪ crossRow G v w = (antiNeighborSet G v).toFinset ∧
      (∀ y ∈ antiNeighborSet G v,
        ((rowClass G v 16).filter (fun a ↦ ¬G.Adj a y)).card = 2) ∧
      (G.induce (rowClass G v 16 : Set (Fin 43))).IndepSetFree 3 := by
  classical
  let H := rowClass G v 17
  let L := rowClass G v 16
  let B := (antiNeighborSet G v).toFinset
  have hH : H.card = 2 := ht2
  have hL : L.card = 6 := by
    have hp := (degree18_cross_eq_280_profile hG v hv hx).1
    change (rowClass G v 16).card = 6
    omega
  have hB : B.card = 24 := by
    simpa only [B, RootedRamseyGraph.B, Nat.card_eq_fintype_card, Set.toFinset_card] using
      degree18_antiNeighbor_card
        (({graph := G, ramsey := hG} : RamseyGraph 5 5 _).root v) hv
  have hdis : Disjoint H L := rowClass17_disjoint_rowClass16 v
  have hmle : ∀ y ∈ B, (L.filter (fun a ↦ ¬G.Adj a y)).card ≤ 2 := by
    intro y hy
    have hc := rowClass17_union_omitted16_card_le_four hG v hv
      (Set.mem_toFinset.mp hy)
    have hd : Disjoint H (L.filter (fun a ↦ ¬G.Adj a y)) :=
      hdis.mono_right (Finset.filter_subset _ _)
    change (H ∪ L.filter (fun a ↦ ¬G.Adj a y)).card ≤ 4 at hc
    rw [Finset.card_union_of_disjoint hd, hH] at hc
    omega
  have hsum : (∑ y ∈ B, (L.filter (fun a ↦ ¬G.Adj a y)).card) = ∑ _y ∈ B, 2 := by
    have hs := sum_rowClass_omissions (G := G) v hv 16
    change (∑ y ∈ B, (L.filter (fun a ↦ ¬G.Adj a y)).card) = (24 - 16) * L.card at hs
    rw [hs, hL]
    simp [hB]
  have hm : ∀ y ∈ antiNeighborSet G v, (L.filter (fun a ↦ ¬G.Adj a y)).card = 2 := by
    intro y hy
    exact (Finset.sum_eq_sum_iff_of_le hmle).mp hsum y (Set.mem_toFinset.mpr hy)
  have hh : ∀ y ∈ antiNeighborSet G v, (H.filter (fun a ↦ ¬G.Adj a y)).card ≤ 1 := by
    intro y hy
    have hc := omitted_highRows_card_le_three hG v hv hy
    change ((rowClass G v 17 ∪ rowClass G v 16).filter
      (fun a ↦ ¬G.Adj a y)).card ≤ 3 at hc
    rw [high_omission_card, hm y hy] at hc
    change (H.filter (fun a ↦ ¬G.Adj a y)).card + 2 ≤ 3 at hc
    omega
  have hfree : (G.induce (L : Set (Fin 43))).IndepSetFree 3 := by
    rw [← SimpleGraph.cliqueFree_compl, compl_induce,
      SimpleGraph.cliqueFree_induce_iff]
    intro T hTL hc
    have hTi : G.IsIndepSet (T : Set (Fin 43)) :=
      (SimpleGraph.isClique_compl _).mp hc.isClique
    have hHT : Disjoint H T := by
      apply Finset.disjoint_left.mpr
      intro a ha ht
      exact (Finset.disjoint_left.mp hdis) ha (hTL ht)
    have hind : G.IsIndepSet (H ∪ T : Finset (Fin 43)) := by
      intro a ha b hb hab
      rcases Finset.mem_union.mp ha with ha | ha <;>
        rcases Finset.mem_union.mp hb with hb | hb
      · exact rowClass17_independent hG v hv ha hb hab
      · exact rowClass17_anticomplete_rowClass16 hG v hv ha (hTL hb)
      · exact fun h ↦ rowClass17_anticomplete_rowClass16 hG v hv hb (hTL ha) h.symm
      · exact hTi ha hb hab
    have hcard := independent_card_le_four hG hind
    rw [Finset.card_union_of_disjoint hHT, hH, hc.card_eq] at hcard
    omega
  obtain ⟨u, w, huw, hpair⟩ := Finset.card_eq_two.mp hH
  refine ⟨u, w, huw, hpair, hL, ?_, hm, hfree⟩
  ext y
  constructor
  · intro hy
    rcases Finset.mem_union.mp hy with hy | hy
    · exact Set.mem_toFinset.mpr ((mem_crossRow G v u y).mp hy).2
    · exact Set.mem_toFinset.mpr ((mem_crossRow G v w y).mp hy).2
  · intro hy
    have hyB := Set.mem_toFinset.mp hy
    by_contra hn
    have hno : ¬G.Adj u y ∧ ¬G.Adj w y := by simpa [hyB] using hn
    have hbound := hh y hyB
    simp [hpair, Finset.filter_insert, Finset.filter_singleton, hno.1, hno.2, huw] at hbound

/-- The published order-24 upper edge bound gives the retained lower bound on B. -/
private lemma antiNeighbor_edges_ge_144 :
    144 ≤ inducedEdgeCount G (antiNeighborSet G v) := by
  classical
  have hn := degree18_antiNeighbor_card
    (({graph := G, ramsey := hG} : RamseyGraph 5 5 _).root v) hv
  have hr := (isRamseyGraph_compl _).mp (isRamseyGraph_induce_antiNeighborSet hG v)
  have hc : Nat.card (G.induce (antiNeighborSet G v))ᶜ.edgeSet ≤ 132 := by
    exact_mod_cast edges_ramsey_4_5_24_le_132.on_finite_type hn _ hr
  have he := card_edges_add_card_edges_compl (G.induce (antiNeighborSet G v))
  rw [hn, show Nat.choose 24 2 = 276 by decide] at he
  change 144 ≤ Nat.card (G.induce (antiNeighborSet G v)).edgeSet
  omega


/-- Equality at 280 cannot have 2 size-17 rows. -/
private lemma degree18_cross_eq_280_not_double
    (hx : crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 280)
    (ht : (rowClass G v 17).card = 2) : False := by
  classical
  obtain ⟨u, w, _, hH, hL, hcover, hm, hfree⟩ :=
    double_profile_structure hG v hv hx ht
  let A := (G.neighborSet v).toFinset
  let B := (antiNeighborSet G v).toFinset
  let H := rowClass G v 17
  let L := rowClass G v 16
  let Z := A \ (H ∪ L)
  let X := crossRow G v u \ crossRow G v w
  let Y := crossRow G v w \ crossRow G v u
  let M := X ∪ Y
  let f := crossEdgeCount G (X : Set _) (Y : Set _)
  have hu : u ∈ rowClass G v 17 := by rw [hH]; simp
  have hw : w ∈ rowClass G v 17 := by rw [hH]; simp
  have hu17 := (mem_rowClass G v u 17).mp hu
  have hw17 := (mem_rowClass G v w 17).mp hw
  obtain ⟨hMcard, hcore, hedge⟩ :=
    core_accounting G hG v u w hv hu17.2 hw17.2 hcover
  change M.card = 14 at hMcard
  change links G M B = 112 + 2 * f at hcore
  have hA : A.card = 18 := by
    simpa only [A, Set.toFinset_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  have hHL : Disjoint H L := rowClass17_disjoint_rowClass16 v
  have hHA : H ∪ L ⊆ A := by
    intro a ha
    rcases Finset.mem_union.mp ha with ha | ha <;>
      exact Set.mem_toFinset.mpr ((mem_rowClass G v a _).mp ha).1
  have hZ : Z.card = 10 := by
    have hc := Finset.card_sdiff_add_card_eq_card hHA
    rw [Finset.card_union_of_disjoint hHL] at hc
    change Z.card + (H.card + L.card) = A.card at hc
    change L.card = 6 at hL
    change H.card = 2 at ht
    omega
  have hpart : H ∪ L ∪ Z = A := Finset.union_sdiff_of_subset hHA
  have hHZ : Disjoint (H ∪ L) Z := by
    apply Finset.disjoint_left.mpr
    intro a ha haz
    exact (Finset.mem_sdiff.mp haz).2 ha
  have hLZ : Disjoint L Z := hHZ.mono (Finset.subset_union_right) Finset.Subset.rfl
  have hzA : ∀ z ∈ Z, G.Adj v z := by
    intro z hz
    have hzv : z ∈ G.neighborSet v := Set.mem_toFinset.mp (Finset.mem_sdiff.mp hz).1
    exact hzv
  have hz15 : ∀ z ∈ Z, (crossRow G v z).card = 15 := by
    intro z hz
    apply (degree18_cross_eq_280_profile hG v hv hx).2 z (hzA z hz)
    · intro h
      exact (Finset.mem_sdiff.mp hz).2 (Finset.mem_union_left _ h)
    · intro h
      exact (Finset.mem_sdiff.mp hz).2 (Finset.mem_union_right _ h)
  have hMB : ∀ y ∈ M, y ∈ antiNeighborSet G v := by
    intro y hy
    rcases Finset.mem_union.mp hy with hy | hy
    · exact ((mem_crossRow G v u y).mp (Finset.mem_sdiff.mp hy).1).2
    · exact ((mem_crossRow G v w y).mp (Finset.mem_sdiff.mp hy).1).2
  have hbranches : ∀ y ∈ M,
      (G.Adj u y ∧ ¬G.Adj w y) ∨ (G.Adj w y ∧ ¬G.Adj u y) := by
    intro y hy
    simpa only [M, X, Y, Finset.mem_union, Finset.mem_sdiff, mem_crossRow,
      hMB y hy, and_true] using hy
  have hHmiss : ∀ y ∈ M, (H.filter (fun a ↦ ¬G.Adj a y)).card = 1 := by
    intro y hy
    rcases hbranches y hy with ⟨huy, hwy⟩ | ⟨hwy, huy⟩ <;>
      simp [H, hH, Finset.filter_insert, Finset.filter_singleton, huy, hwy]
  have hq : ∀ y ∈ M,
      ((H ∪ L).filter (fun a ↦ ¬G.Adj a y)).card = 3 := by
    intro y hy
    rw [Finset.filter_union, Finset.card_union_of_disjoint
      (hHL.mono (Finset.filter_subset _ _) (Finset.filter_subset _ _)), hHmiss y hy]
    have hmy : (L.filter (fun a ↦ ¬G.Adj a y)).card = 2 := hm y (hMB y hy)
    omega
  let aM := ∑ z ∈ Z, (M.filter (fun y ↦ ¬G.Adj z y)).card
  have haM : aM ≤ links G Z L := by
    rw [links_filter_sum]
    apply Finset.sum_le_sum
    intro z hz
    apply omission_obligation_card_le G (M.filter (fun y ↦ ¬G.Adj z y)) L z
    · intro y hy
      obtain ⟨hyM, hzy⟩ := Finset.mem_filter.mp hy
      exact high_omission_neighbor hG v hv (hz15 z hz) (hMB y hyM) hzy
        (hq y hyM) (fun he ↦ (hMB y hyM).2 (he ▸ hzA z hz))
    · intro a ha hza
      apply adjacent_omissions_le_one hG v hv (hz15 z hz)
        ((mem_rowClass G v a 16).mp ha).2 hza
      intro y hy
      exact ⟨hMB y (Finset.mem_filter.mp hy).1, (Finset.mem_filter.mp hy).2⟩
  have hlinks := links_partition_le G v L Z hLZ
    (fun a ha ↦ (mem_rowClass G v a 16).mp ha) hzA hG
  have heL := six_roots_edges G L hL hfree
  rw [links_self, links_comm G L Z] at hlinks
  have hLcard : L.card = 6 := hL
  rw [hLcard] at hlinks
  have ha30 : aM ≤ 30 := by omega
  have hMH : links G M H = 14 := by
    rw [links_filter_sum]
    have hpoint : ∀ y ∈ M, (H.filter (G.Adj y)).card = 1 := by
      intro y hy
      rcases hbranches y hy with ⟨huy, hwy⟩ | ⟨hwy, huy⟩ <;>
        simp [H, hH, Finset.filter_insert, Finset.filter_singleton, huy, hwy,
          SimpleGraph.adj_comm]
    rw [Finset.sum_congr rfl hpoint]
    simp [hMcard]
  have hML : links G M L = 56 := by
    have hc := links_add_omissions G L M
    have hs : (∑ y ∈ M, (L.filter (fun a ↦ ¬G.Adj y a)).card) = 28 := by
      have hpoint : ∀ y ∈ M, (L.filter (fun a ↦ ¬G.Adj y a)).card = 2 := by
        intro y hy
        simpa only [SimpleGraph.adj_comm] using hm y (hMB y hy)
      rw [Finset.sum_congr rfl hpoint]
      simp [hMcard]
    rw [hs, links_comm G L M, hL, hMcard] at hc
    omega
  have hMZ := links_add_omissions G M Z
  change links G M Z + aM = M.card * Z.card at hMZ
  rw [hMcard, hZ] at hMZ
  have hd := subset_pivot_degree_sum G v M hMB
  have hMA : links G M A = links G M H + links G M L + links G M Z := by
    rw [← hpart, links_union_right G M (H ∪ L) Z hHZ,
      links_union_right G M H L hHL]
  rw [hMA, hMH, hML, hcore] at hd
  have hcap : (∑ y ∈ M, G.degree y) ≤ 336 := by
    have hs := Finset.sum_le_sum (fun y (_ : y ∈ M) ↦ degree_le_24 hG y)
    simpa [hMcard] using hs
  have hf : f ≤ 22 := by omega
  have hb := antiNeighbor_edges_ge_144 hG v hv
  change inducedEdgeCount G (antiNeighborSet G v) + 5 ≤ 124 + f at hedge
  omega

end Equality

/-- Every degree-18 pivot has at most 279 cross edges on the retained published premises. -/
public theorem degree18_cross_le_279 (R : RootedRamseyGraph 5 5 (Fin 43))
    [DecidableRel R.graph.Adj] (hv : R.graph.degree R.pivot = 18) :
    crossEdgeCount R.graph R.A R.B ≤ 279 := by
  have htail := degree18_cross_le_280 R.ramsey R.pivot hv
  change crossEdgeCount R.graph R.A R.B ≤ 280 at htail
  by_contra hn
  have hx : crossEdgeCount R.graph R.A R.B = 280 := by omega
  rcases (degree18_cross_eq_280_profile R.ramsey R.pivot hv hx).1 with h | h
  · exact degree18_cross_eq_280_not_single R.ramsey R.pivot hv hx h.1
  · exact degree18_cross_eq_280_not_double R.ramsey R.pivot hv hx h.1


end Ramsey.d18
