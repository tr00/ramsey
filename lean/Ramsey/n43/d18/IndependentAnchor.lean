module

public import Ramsey.n43.d18.PivotBudget
public import Ramsey.n18.R44
public import Ramsey.theorems.CliqueBounds
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Independent 4-set anchors at degree-18 pivots

Every degree-18 neighborhood contains an independent 4-set. Its signatures in the
antineighborhood have nonempty support, singleton capacity 3 and Hall constraints on
independent subfamilies. No cross-edge count or connectivity assumption is imposed.
-/

namespace Ramsey.d18

open scoped BigOperators

variable (R : RootedRamseyGraph 5 5 (Fin 43)) [DecidableRel R.graph.Adj]

/-- The neighbors of a vertex within a chosen independent anchor. -/
@[expose] public def anchorSignature (I : Finset (Fin 43)) (y : Fin 43) : Finset (Fin 43) :=
  I.filter (fun u ↦ R.graph.Adj y u)

/-- The antineighbors with exactly the prescribed anchor signature. -/
@[expose] public noncomputable def anchorClass (I S : Finset (Fin 43)) : Finset (Fin 43) :=
  R.B.toFinset.filter (fun y ↦ anchorSignature R I y = S)

omit [DecidableRel R.graph.Adj] in
/-- An independent set in the ambient graph has at most 4 vertices. -/
private lemma independent_card_le_four {J : Finset (Fin 43)}
    (hJ : R.graph.IsIndepSet J) : J.card ≤ 4 :=
  independent_finset_card_le_of_indepSetFree R.ramsey.2 hJ

/-- Every degree-18 neighborhood contains an independent 4-set. -/
public theorem exists_independent_anchor (hv : R.graph.degree R.pivot = 18) :
    ∃ I : Finset (Fin 43), (I : Set (Fin 43)) ⊆ R.A ∧ R.graph.IsNIndepSet 4 I := by
  classical
  have hn : Nat.card R.A = 18 := R.card_A.trans hv
  have hnot : ¬(R.graph.induce R.A).IndepSetFree 4 := by
    intro h
    exact ramsey_4_4_le_18.not_isRamseyGraph (by omega) _ ⟨R.neighborhood.ramsey.1, h⟩
  rw [← SimpleGraph.cliqueFree_compl, compl_induce,
    SimpleGraph.cliqueFree_induce_iff] at hnot
  simp only [SimpleGraph.CliqueFreeOn, SimpleGraph.isNClique_compl] at hnot
  push Not at hnot
  exact hnot

/-- Every antineighbor meets every independent 4-set in the neighborhood. -/
public theorem anchorSignature_nonempty {I : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I)
    {y : Fin 43} (hy : y ∈ R.B) : (anchorSignature R I y).Nonempty := by
  classical
  by_contra h
  have hmiss : ∀ u ∈ I, ¬R.graph.Adj y u := by
    intro u hu hadj
    exact h ⟨u, Finset.mem_filter.mpr ⟨hu, hadj⟩⟩
  have hyI : y ∉ I := fun hyI ↦ hy.2 (hIA hyI)
  have hind : R.graph.IsIndepSet (insert y I : Finset (Fin 43)) := by
    intro u hu w hw hne
    simp only [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at hu hw
    rcases hu with rfl | hu <;> rcases hw with rfl | hw
    · exact (hne rfl).elim
    · exact hmiss w hw
    · exact fun hadj ↦ hmiss u hu hadj.symm
    · exact hI.isIndepSet hu hw hne
  have hc := independent_card_le_four R hind
  rw [Finset.card_insert_of_notMem hyI, hI.card_eq] at hc
  omega

/-- Two antineighbors with the same singleton signature must be adjacent. -/
public theorem singleton_anchorClass_isClique {I : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I)
    {a : Fin 43} (ha : a ∈ I) :
    R.graph.IsClique (anchorClass R I {a} : Set (Fin 43)) := by
  classical
  intro y hy z hz hyz
  obtain ⟨hyB, hys⟩ := Finset.mem_filter.mp hy
  obtain ⟨hzB, hzs⟩ := Finset.mem_filter.mp hz
  have hyB : y ∈ R.B := Set.mem_toFinset.mp hyB
  have hzB : z ∈ R.B := Set.mem_toFinset.mp hzB
  have hyI : y ∉ I := fun h ↦ hyB.2 (hIA h)
  have hzI : z ∉ I := fun h ↦ hzB.2 (hIA h)
  by_contra hn
  have hmiss : ∀ b ∈ I.erase a, ¬R.graph.Adj y b ∧ ¬R.graph.Adj z b := by
    intro b hb
    obtain ⟨hba, hbI⟩ := Finset.mem_erase.mp hb
    constructor
    · intro hadj
      have : b ∈ anchorSignature R I y := Finset.mem_filter.mpr ⟨hbI, hadj⟩
      rw [hys] at this
      exact hba (Finset.mem_singleton.mp this)
    · intro hadj
      have : b ∈ anchorSignature R I z := Finset.mem_filter.mpr ⟨hbI, hadj⟩
      rw [hzs] at this
      exact hba (Finset.mem_singleton.mp this)
  have hind : R.graph.IsIndepSet (insert y (insert z (I.erase a)) : Finset (Fin 43)) := by
    intro u hu w hw hne
    simp only [Finset.coe_insert, Set.mem_insert_iff, Finset.mem_coe] at hu hw
    rcases hu with rfl | rfl | hu <;> rcases hw with rfl | rfl | hw
    · exact (hne rfl).elim
    · exact hn
    · exact (hmiss w hw).1
    · exact fun hadj ↦ hn hadj.symm
    · exact (hne rfl).elim
    · exact (hmiss w hw).2
    · exact fun hadj ↦ (hmiss u hu).1 hadj.symm
    · exact fun hadj ↦ (hmiss u hu).2 hadj.symm
    · exact hI.isIndepSet (Finset.mem_of_mem_erase hu) (Finset.mem_of_mem_erase hw) hne
  have hc := independent_card_le_four R hind
  have hyE : y ∉ insert z (I.erase a) := by simp [hyz, hyI]
  have hzE : z ∉ I.erase a := fun h ↦ hzI (Finset.mem_of_mem_erase h)
  rw [Finset.card_insert_of_notMem hyE, Finset.card_insert_of_notMem hzE,
    Finset.card_erase_of_mem ha, hI.card_eq] at hc
  omega

/-- Each singleton signature class has at most 3 vertices. -/
public theorem singleton_anchorClass_card_le_three {I : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I)
    {a : Fin 43} (ha : a ∈ I) : (anchorClass R I {a}).card ≤ 3 := by
  classical
  by_contra h
  obtain ⟨T, hTC, hT⟩ := Finset.exists_subset_card_eq
    (by omega : 4 ≤ (anchorClass R I {a}).card)
  have hc : R.graph.IsNClique 4 T :=
    ⟨(singleton_anchorClass_isClique R hIA hI ha).subset (by simpa using hTC), hT⟩
  apply R.ramsey.1 _ (hc.insert (a := a) ?_)
  intro y hy
  have hs := (Finset.mem_filter.mp (hTC hy)).2
  have : a ∈ anchorSignature R I y := by rw [hs]; simp
  exact (Finset.mem_filter.mp this).2.symm

/-- Independent antineighbor subfamilies satisfy the signature Hall inequality. -/
public theorem independent_anchor_hall {I Q : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I)
    (hQB : (Q : Set (Fin 43)) ⊆ R.B) (hQ : R.graph.IsIndepSet Q) :
    Q.card ≤ (Q.biUnion (anchorSignature R I)).card := by
  classical
  let T := Q.biUnion (anchorSignature R I)
  have hTI : T ⊆ I := by
    intro a ha
    obtain ⟨y, _, hy⟩ := Finset.mem_biUnion.mp ha
    exact (Finset.mem_filter.mp hy).1
  have hdis : Disjoint Q (I \ T) := by
    apply Finset.disjoint_left.mpr
    intro y hy hyI
    exact (hQB hy).2 (hIA (Finset.mem_sdiff.mp hyI).1)
  have hmiss : ∀ y ∈ Q, ∀ a ∈ I \ T, ¬R.graph.Adj y a := by
    intro y hy a ha hadj
    exact (Finset.mem_sdiff.mp ha).2 (Finset.mem_biUnion.mpr
      ⟨y, hy, Finset.mem_filter.mpr ⟨(Finset.mem_sdiff.mp ha).1, hadj⟩⟩)
  have hind : R.graph.IsIndepSet (Q ∪ (I \ T) : Finset (Fin 43)) := by
    intro u hu w hw hne
    rcases Finset.mem_union.mp hu with hu | hu <;>
      rcases Finset.mem_union.mp hw with hw | hw
    · exact hQ hu hw hne
    · exact hmiss u hu w hw
    · exact fun hadj ↦ hmiss w hw u hu hadj.symm
    · exact hI.isIndepSet (Finset.mem_sdiff.mp hu).1 (Finset.mem_sdiff.mp hw).1 hne
  have hc := independent_card_le_four R hind
  rw [Finset.card_union_of_disjoint hdis] at hc
  have ht := Finset.card_sdiff_add_card_eq_card hTI
  rw [hI.card_eq] at ht
  change Q.card ≤ T.card
  omega

/-- At most 12 antineighbors have singleton signatures. -/
public theorem singleton_anchor_count_le_twelve {I : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I) :
    (R.B.toFinset.filter (fun y ↦ (anchorSignature R I y).card = 1)).card ≤ 12 := by
  classical
  have hsub : R.B.toFinset.filter (fun y ↦ (anchorSignature R I y).card = 1) ⊆
      I.biUnion (fun a ↦ anchorClass R I {a}) := by
    intro y hy
    obtain ⟨hyB, hy⟩ := Finset.mem_filter.mp hy
    obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hy
    have haI : a ∈ I := by
      have : a ∈ anchorSignature R I y := by rw [ha]; simp
      exact (Finset.mem_filter.mp this).1
    exact Finset.mem_biUnion.mpr ⟨a, haI, Finset.mem_filter.mpr ⟨hyB, ha⟩⟩
  calc
    _ ≤ (I.biUnion (fun a ↦ anchorClass R I {a})).card := Finset.card_le_card hsub
    _ ≤ ∑ a ∈ I, (anchorClass R I {a}).card := Finset.card_biUnion_le
    _ ≤ ∑ _a ∈ I, 3 := Finset.sum_le_sum fun a ha ↦
      singleton_anchorClass_card_le_three R hIA hI ha
    _ = 12 := by simp [hI.card_eq]

/-- Cross incidences at an anchor can be counted by its antineighbor signatures. -/
public lemma anchor_crossEdgeCount_eq_sum (I : Finset (Fin 43))
    (hIA : (I : Set (Fin 43)) ⊆ R.A) :
    crossEdgeCount R.graph (I : Set (Fin 43)) R.B =
      ∑ y ∈ R.B.toFinset, (anchorSignature R I y).card := by
  classical
  rw [crossEdgeCount_comm, crossEdgeCount_eq_sum_rows R.graph R.B (I : Set (Fin 43))
    (R.disjoint_parts.symm.mono_right hIA)]
  rw [Finset.sum_set_coe (f := fun y ↦ Nat.card (rowSet R.graph (I : Set (Fin 43)) y)) R.B]
  apply Finset.sum_congr rfl
  intro y _
  have he : rowSet R.graph (I : Set (Fin 43)) y =
      (anchorSignature R I y : Set (Fin 43)) := by
    ext a
    simp [rowSet, anchorSignature, and_comm]
  rw [he]
  simp [Nat.card_eq_fintype_card]

/-- Every independent 4-set has at least 36 cross edges at a degree-18 pivot. -/
public theorem independent_anchor_cross_ge_thirty_six (hv : R.graph.degree R.pivot = 18)
    {I : Finset (Fin 43)} (hIA : (I : Set (Fin 43)) ⊆ R.A)
    (hI : R.graph.IsNIndepSet 4 I) :
    36 ≤ crossEdgeCount R.graph (I : Set (Fin 43)) R.B := by
  classical
  have hn : R.B.toFinset.card = 24 := by
    simpa only [Set.toFinset_card, ← Nat.card_eq_fintype_card] using
      degree18_antiNeighbor_card R hv
  have hs := Finset.sum_le_sum (s := R.B.toFinset) (f := fun _ ↦ 2)
    (g := fun y ↦ (anchorSignature R I y).card +
      if (anchorSignature R I y).card = 1 then 1 else 0) (by
        intro y hy
        have hp := (anchorSignature_nonempty R hIA hI (Set.mem_toFinset.mp hy)).card_pos
        split_ifs <;> omega)
  rw [Finset.sum_add_distrib, ← Finset.card_filter] at hs
  simp only [Finset.sum_const, smul_eq_mul, hn] at hs
  have hc := singleton_anchor_count_le_twelve R hIA hI
  rw [anchor_crossEdgeCount_eq_sum R I hIA]
  omega

/-- The singleton deficit and the higher-signature mass give the exact incidence defect. -/
public theorem independent_anchor_defect_identity (hv : R.graph.degree R.pivot = 18)
    {I : Finset (Fin 43)} (hIA : (I : Set (Fin 43)) ⊆ R.A)
    (hI : R.graph.IsNIndepSet 4 I) :
    crossEdgeCount R.graph (I : Set (Fin 43)) R.B - 36 +
        (R.B.toFinset.filter (fun y ↦ (anchorSignature R I y).card = 1)).card =
      12 + ∑ y ∈ R.B.toFinset, ((anchorSignature R I y).card - 2) := by
  classical
  have hn : R.B.toFinset.card = 24 := by
    simpa only [Set.toFinset_card, ← Nat.card_eq_fintype_card] using
      degree18_antiNeighbor_card R hv
  have hpoint : ∀ y ∈ R.B.toFinset,
      (anchorSignature R I y).card + (if (anchorSignature R I y).card = 1 then 1 else 0) =
        2 + ((anchorSignature R I y).card - 2) := by
    intro y hy
    have hp := (anchorSignature_nonempty R hIA hI (Set.mem_toFinset.mp hy)).card_pos
    split_ifs <;> omega
  have hs := Finset.sum_congr rfl hpoint
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib, ← Finset.card_filter] at hs
  simp only [Finset.sum_const, smul_eq_mul, hn] at hs
  rw [← anchor_crossEdgeCount_eq_sum R I hIA] at hs
  have hc := independent_anchor_cross_ge_thirty_six R hv hIA hI
  omega

/-- Anchor internal degrees and cross incidences satisfy the exact excess budget. -/
public theorem independent_anchor_degree_budget {I : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I) :
    (∑ u ∈ I, Nat.card (rowSet R.graph R.A u)) +
        crossEdgeCount R.graph (I : Set (Fin 43)) R.B =
      68 + degreeExcess R.graph 18 (I : Set (Fin 43)) := by
  classical
  have hcard : Nat.card (I : Set (Fin 43)) = 4 := by
    simp [Nat.card_eq_fintype_card, hI.card_eq]
  have he := sum_degree_eq_base_add_excess R.graph 18 (I : Set (Fin 43))
    (fun u _ ↦ (degree_mem R.ramsey u).1)
  rw [hcard] at he
  have hsplit : ∀ u ∈ I, R.graph.degree u = 1 + Nat.card (rowSet R.graph R.A u) +
      Nat.card (rowSet R.graph R.B u) := by
    intro u hu
    have hd := degree_eq_common_add_mixed (G := R.graph) u R.pivot
    simp only [(hIA hu).symm, ite_true] at hd
    change R.graph.degree u = Nat.card (R.graph.commonNeighbors u R.pivot) +
      Nat.card (rowSet R.graph R.B u) + 1 at hd
    change R.graph.degree u = 1 + Nat.card (R.graph.commonNeighbors u R.pivot) +
      Nat.card (rowSet R.graph R.B u)
    omega
  have hs := Finset.sum_congr rfl hsplit
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib] at hs
  simp only [Finset.sum_const, smul_eq_mul, mul_one, hI.card_eq] at hs
  have hc := crossEdgeCount_eq_sum_rows R.graph (I : Set (Fin 43)) R.B
    (R.disjoint_parts.mono_left hIA)
  have he' : (∑ u : (I : Set (Fin 43)), R.graph.degree u) =
      72 + degreeExcess R.graph 18 (I : Set (Fin 43)) := by
    convert he using 1
    congr 1
    ext u
    simp
  have hc' : crossEdgeCount R.graph (I : Set (Fin 43)) R.B =
      ∑ u : (I : Set (Fin 43)), Nat.card (rowSet R.graph R.B u) := by
    convert hc using 1
    congr 1
    ext u
    simp
  rw [Finset.sum_set_coe (f := fun u ↦ R.graph.degree u) (I : Set (Fin 43))] at he'
  rw [Finset.sum_set_coe (f := fun u ↦ Nat.card (rowSet R.graph R.B u))
    (I : Set (Fin 43))] at hc'
  simp only [Finset.toFinset_coe] at he' hc'
  omega

/-- Every independent anchor has internal degree sum at most 32 plus its excess. -/
public theorem independent_anchor_degree_sum_le (hv : R.graph.degree R.pivot = 18)
    {I : Finset (Fin 43)} (hIA : (I : Set (Fin 43)) ⊆ R.A)
    (hI : R.graph.IsNIndepSet 4 I) :
    (∑ u ∈ I, Nat.card (rowSet R.graph R.A u)) ≤
      32 + degreeExcess R.graph 18 (I : Set (Fin 43)) := by
  have hb := independent_anchor_degree_budget R hIA hI
  have hc := independent_anchor_cross_ge_thirty_six R hv hIA hI
  omega

/-- Singleton signatures are counted once by their unique anchor neighbor. -/
private lemma singleton_count_eq_sum_classes (I : Finset (Fin 43)) :
    (R.B.toFinset.filter (fun y ↦ (anchorSignature R I y).card = 1)).card =
      ∑ a ∈ I, (anchorClass R I {a}).card := by
  classical
  simp_rw [anchorClass, Finset.card_filter]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro y _
  by_cases hs : (anchorSignature R I y).card = 1
  · obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hs
    have haI : a ∈ I := by
      have : a ∈ anchorSignature R I y := by rw [ha]; simp
      exact (Finset.mem_filter.mp this).1
    simp [ha, haI]
  · have hne : ∀ a ∈ I, anchorSignature R I y ≠ {a} := by
      intro a _ he
      exact hs (by rw [he]; simp)
    simp only [hs, ite_false]
    symm
    exact Finset.sum_eq_zero fun a ha ↦ ite_eq_right (hne a ha)

/-- Equality at 36 incidences means full singleton classes and only double signatures otherwise. -/
public theorem independent_anchor_cross_eq_thirty_six_iff
    (hv : R.graph.degree R.pivot = 18) {I : Finset (Fin 43)}
    (hIA : (I : Set (Fin 43)) ⊆ R.A) (hI : R.graph.IsNIndepSet 4 I) :
    crossEdgeCount R.graph (I : Set (Fin 43)) R.B = 36 ↔
      (∀ a ∈ I, (anchorClass R I {a}).card = 3) ∧
        ∀ y ∈ R.B, (anchorSignature R I y).card = 1 ∨
          (anchorSignature R I y).card = 2 := by
  classical
  have hd := independent_anchor_defect_identity R hv hIA hI
  have hcap := singleton_anchor_count_le_twelve R hIA hI
  constructor
  · intro he
    have hzero : (∑ y ∈ R.B.toFinset, ((anchorSignature R I y).card - 2)) = 0 := by
      omega
    have hsingle : (R.B.toFinset.filter
        (fun y ↦ (anchorSignature R I y).card = 1)).card = 12 := by omega
    constructor
    · have hs : (∑ a ∈ I, (anchorClass R I {a}).card) = ∑ _a ∈ I, 3 := by
        rw [← singleton_count_eq_sum_classes R I, hsingle]
        simp [hI.card_eq]
      exact (Finset.sum_eq_sum_iff_of_le
        (fun a ha ↦ singleton_anchorClass_card_le_three R hIA hI ha)).mp hs
    · intro y hy
      have hz := (Finset.sum_eq_zero_iff.mp hzero) y (Set.mem_toFinset.mpr hy)
      have hp := (anchorSignature_nonempty R hIA hI hy).card_pos
      omega
  · rintro ⟨hsingle, hsize⟩
    have hzero : (∑ y ∈ R.B.toFinset, ((anchorSignature R I y).card - 2)) = 0 := by
      apply Finset.sum_eq_zero
      intro y hy
      have := hsize y (Set.mem_toFinset.mp hy)
      omega
    have hcount : (R.B.toFinset.filter
        (fun y ↦ (anchorSignature R I y).card = 1)).card = 12 := by
      rw [singleton_count_eq_sum_classes R I,
        Finset.sum_congr rfl (fun a ha ↦ hsingle a ha)]
      simp [hI.card_eq]
    have hge := independent_anchor_cross_ge_thirty_six R hv hIA hI
    omega

end Ramsey.d18
