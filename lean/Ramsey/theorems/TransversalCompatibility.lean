module

public import Ramsey.Defs
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Tactic.Linarith

/-!
# Weighted avoidance and transversal compatibility

The elementary avoidance criteria are independent of weights. Weighted occupancy and complement
exclusion have separate hypotheses. The degree-gap theorem and its frontier specialization
retain their proof obligations and require explicit anchor and transversal bounds.
-/

namespace Ramsey.TransversalCompatibility

open scoped BigOperators

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A transversal of the independent `k`-sets with prescribed cardinality `s`. -/
public structure IsSizedIndepTransversal (G : SimpleGraph V) (k s : ℕ) (T : Finset V) : Prop where
  card_eq : T.card = s
  transversal : IsIndepTransversal G k T

/-- Claim 01: occupancy and avoidance force every `t`-subset of `L` to occur as an exact
intersection with a family member. -/
public theorem exact_intersection_of_avoidance
    (F : Set (Set V)) (L : Finset V) (t : ℕ)
    (ht : 1 ≤ t) (htL : t ≤ L.card)
    (hoccupancy : ∀ I : Finset V, (I : Set V) ∈ F → t ≤ (I ∩ L).card)
    (havoidance : ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsTransversal ((L \ T : Finset V) : Set V) F) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ∃ I : Finset V, (I : Set V) ∈ F ∧ I ∩ L = T := by
  intro T hTsub hTcard
  have hnon := havoidance T hTsub hTcard
  rw [IsTransversal] at hnon
  push Not at hnon
  obtain ⟨S, hSF, hSempty⟩ := hnon
  classical
  let I : Finset V := Finset.filter (· ∈ S) Finset.univ
  have hIset : (I : Set V) = S := by
    ext x; simp [I]
  have hIF : (I : Set V) ∈ F := by rwa [hIset]
  refine ⟨I, hIF, ?_⟩
  have hsubset : I ∩ L ⊆ T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxI, hxL⟩
    have hxS : x ∈ S := by
      simpa [I] using hxI
    have hx_not_sdiff : x ∉ (L \ T : Finset V) := by
      intro hxLminusT
      have hx_inter : x ∈ S ∩ ((L \ T : Finset V) : Set V) := ⟨hxS, by simpa using hxLminusT⟩
      rw [hSempty] at hx_inter
      simp at hx_inter
    rw [Finset.mem_sdiff] at hx_not_sdiff
    simpa [hxL] using hx_not_sdiff
  have hcard_le : (I ∩ L).card ≤ T.card := Finset.card_le_card hsubset
  have hcard_ge : t ≤ (I ∩ L).card := hoccupancy I hIF
  exact Finset.eq_of_subset_of_card_le hsubset (by omega)

/-- Claim 01, singleton boundary: every vertex of `L` occurs alone in the intersection. -/
public theorem singleton_occurrence_of_avoidance
    (F : Set (Set V)) (L : Finset V) (hL : 1 ≤ L.card)
    (hoccupancy : ∀ I : Finset V, (I : Set V) ∈ F → 1 ≤ (I ∩ L).card)
    (havoidance : ∀ v ∈ L,
      ¬IsTransversal ((L \ {v} : Finset V) : Set V) F) :
    ∀ v ∈ L, ∃ I : Finset V, (I : Set V) ∈ F ∧ I ∩ L = {v} := by
  have h_avoidance' : ∀ T : Finset V, T ⊆ L → T.card = 1 →
      ¬IsTransversal ((L \ T : Finset V) : Set V) F := by
    intro T hTsub hTcard
    obtain ⟨v, hv⟩ := Finset.card_eq_one.mp hTcard
    rw [hv]
    have hvL : v ∈ L := by
      rw [hv] at hTsub
      exact hTsub (by simp)
    exact havoidance v hvL
  have h := exact_intersection_of_avoidance F L 1 (by omega) hL hoccupancy h_avoidance'
  intro v hvL
  have hcard : ({v} : Finset V).card = 1 := by simp
  have hsub : ({v} : Finset V) ⊆ L := by simpa using hvL
  obtain ⟨I, hIF, hIeq⟩ := h {v} hsub hcard
  exact ⟨I, hIF, hIeq⟩

/-- Claim 01, independent-family consequence: for `2 ≤ t ≤ |L|`, exact occurrence
forces independence in the graph `G` itself. -/
public theorem independent_of_indep_family_avoidance
    (G : SimpleGraph V) (k : ℕ) (L : Finset V) (t : ℕ)
    (ht : 2 ≤ t) (htL : t ≤ L.card)
    (hoccupancy : ∀ I : Finset V, G.IsNIndepSet k I → t ≤ (I ∩ L).card)
    (havoidance : ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsIndepTransversal G k (L \ T)) :
    G.IsIndepSet (L : Set V) := by
  rw [SimpleGraph.isIndepSet_iff]
  intro u hu v hv hne
  have hpair_sub : ({u, v} : Finset V) ⊆ L := by
    intro x hx
    simp [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with (rfl | rfl)
    · exact hu
    · exact hv
  have hpair_card : ({u, v} : Finset V).card ≤ t := by
    have hcard2 : ({u, v} : Finset V).card ≤ 2 := Finset.card_insert_le _ _
    omega
  obtain ⟨T, hTsub_uv_T, hTsub_T_L, hTcard⟩ :=
    Finset.exists_subsuperset_card_eq hpair_sub hpair_card (by omega)
  have h_not_trans := havoidance T hTsub_T_L hTcard
  rw [IsIndepTransversal] at h_not_trans
  rw [IsTransversal] at h_not_trans
  push Not at h_not_trans
  obtain ⟨S, hS_indep_set, hS_empty⟩ := h_not_trans
  classical
  let I : Finset V := Finset.filter (· ∈ S) Finset.univ
  have hIset : (I : Set V) = S := by
    ext x; simp [I]
  have hI_indep : G.IsNIndepSet k I := by
    rcases hS_indep_set with ⟨J, hJset, hJ_indep⟩
    have hIJ : I = J := by
      exact Finset.coe_injective (hIset.trans hJset.symm)
    rw [hIJ]
    exact hJ_indep
  rcases hI_indep with ⟨hI_indep_set, hI_card⟩
  have h_occupancy := hoccupancy I ⟨hI_indep_set, hI_card⟩
  have h_subset : I ∩ L ⊆ T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxI, hxL⟩
    have hxS : x ∈ S := by
      simpa [I] using hxI
    have hx_not_sdiff : x ∉ (L \ T : Finset V) := by
      intro hxLminusT
      have hx_inter : x ∈ S ∩ ((L \ T : Finset V) : Set V) := ⟨hxS, by simpa using hxLminusT⟩
      rw [hS_empty] at hx_inter
      simp at hx_inter
    rw [Finset.mem_sdiff] at hx_not_sdiff
    simpa [hxL] using hx_not_sdiff
  have hcard_le : (I ∩ L).card ≤ T.card := Finset.card_le_card h_subset
  have hcard_ge : t ≤ (I ∩ L).card := h_occupancy
  have h_eq : I ∩ L = T := Finset.eq_of_subset_of_card_le h_subset (by omega)
  have huT : u ∈ T := hTsub_uv_T (by simp)
  have hvT : v ∈ T := hTsub_uv_T (by simp)
  have huI : u ∈ I := (Finset.mem_inter.mp (h_eq.symm ▸ huT)).1
  have hvI : v ∈ I := (Finset.mem_inter.mp (h_eq.symm ▸ hvT)).1
  have h_not_adj := hI_indep_set (show u ∈ (I : Set V) from huI)
    (show v ∈ (I : Set V) from hvI) hne
  exact h_not_adj

/-- Claim 01, contradiction with `alpha(G) < |L|`. -/
public theorem false_of_indep_family_avoidance
    (G : SimpleGraph V) (k : ℕ) (L : Finset V) (t : ℕ)
    (ht : 2 ≤ t) (htL : t ≤ L.card)
    (hoccupancy : ∀ I : Finset V, G.IsNIndepSet k I → t ≤ (I ∩ L).card)
    (havoidance : ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsIndepTransversal G k (L \ T))
    (hindep : G.IndepSetFree L.card) : False := by
  have h_indep := independent_of_indep_family_avoidance G k L t ht htL hoccupancy havoidance
  have hL_indep : G.IsNIndepSet L.card L := by
    refine ⟨?_, rfl⟩
    intro u hu v hv hne'
    have hu' : u ∈ (L : Set V) := hu
    have hv' : v ∈ (L : Set V) := hv
    exact h_indep hu' hv' hne'
  exact hindep L hL_indep

/-- Real weight bounds and a strict gap forcing occupancy in `L`. Bounds may be negative. -/
public structure WeightOccupancy
    (F : Set (Set V)) (w : V → ℝ) (P L : Finset V) (k j t : ℕ)
    (a m b B : ℝ) : Prop where
  disjoint : Disjoint P L
  t_pos : 1 ≤ t
  t_le_card : t ≤ L.card
  j_le_k : j ≤ k
  slots : (j : ℤ) + (t : ℤ) - 1 ≤ (k : ℤ)
  uniform : ∀ I : Finset V, (I : Set V) ∈ F → I.card = k
  cap : ∀ I : Finset V, (I : Set V) ∈ F → ∑ v ∈ I, w v ≤ B
  anchor_count : ∀ I : Finset V, (I : Set V) ∈ F → j ≤ (I ∩ P).card
  anchor_weight : ∀ v ∈ P, a ≤ w v
  low_weight : ∀ v ∈ L, m ≤ w v
  outside_weight : ∀ v, v ∉ P → v ∉ L → b ≤ w v
  low_le_outside : m ≤ b
  outside_le_anchor : b ≤ a
  gap : B < (j : ℝ) * a + ((t : ℝ) - 1) * m +
    ((k : ℝ) - (j : ℝ) - (t : ℝ) + 1) * b

/-- Claim 02, weighted occupancy from the packaged real weight bounds. -/
public theorem occupancy_of_weight_gap
    {F : Set (Set V)} {w : V → ℝ} {P L : Finset V} {k j t : ℕ} {a m b B : ℝ}
    (h : WeightOccupancy F w P L k j t a m b B) :
    ∀ I : Finset V, (I : Set V) ∈ F → t ≤ (I ∩ L).card := by
  intro I hIF
  by_contra! hlt
  let p := (I ∩ P).card
  let q := (I ∩ L).card
  have hp : (j : ℝ) ≤ (p : ℝ) := by exact_mod_cast h.anchor_count I hIF
  have hqt : q + 1 ≤ t := by omega
  have hq : (q : ℝ) + 1 ≤ (t : ℝ) := by exact_mod_cast hqt
  have hpointwise : ∀ v, b + (if v ∈ P then a - b else 0) +
      (if v ∈ L then m - b else 0) ≤ w v := by
    intro v
    by_cases hvP : v ∈ P
    · have hvL : v ∉ L := fun hvL ↦ Finset.disjoint_left.mp h.disjoint hvP hvL
      simp only [ite_eq_left hvP, ite_eq_right hvL]
      linarith [h.anchor_weight v hvP]
    · by_cases hvL : v ∈ L
      · simp only [ite_eq_right hvP, ite_eq_left hvL]
        linarith [h.low_weight v hvL]
      · simp only [ite_eq_right hvP, ite_eq_right hvL]
        linarith [h.outside_weight v hvP hvL]
  have hPsum : (∑ v ∈ I, if v ∈ P then a - b else 0) = (p : ℝ) * (a - b) := by
    rw [← Finset.sum_filter]
    simp [Finset.filter_mem_eq_inter, p, mul_sub]
  have hLsum : (∑ v ∈ I, if v ∈ L then m - b else 0) = (q : ℝ) * (m - b) := by
    rw [← Finset.sum_filter]
    simp [Finset.filter_mem_eq_inter, q, mul_sub]
  have hsum := Finset.sum_le_sum (s := I) (fun v _ ↦ hpointwise v)
  simp only [Finset.sum_add_distrib] at hsum
  rw [hPsum, hLsum] at hsum
  simp only [Finset.sum_const, nsmul_eq_mul, h.uniform I hIF] at hsum
  have hanchor : 0 ≤ a - b := sub_nonneg.mpr h.outside_le_anchor
  have hlow : 0 ≤ b - m := sub_nonneg.mpr h.low_le_outside
  have hcap := h.cap I hIF
  have hgap := h.gap
  nlinarith [mul_nonneg (sub_nonneg.mpr hp) hanchor,
    mul_nonneg (sub_nonneg.mpr hq) hlow]

/-- A lower bound on transversal weight excludes complements of `t`-subsets of `L`. -/
public structure ComplementExclusion
    (F : Set (Set V)) (w : V → ℝ) (L : Finset V) (t : ℕ) (c Q : ℝ) : Prop where
  t_pos : 1 ≤ t
  t_le_card : t ≤ L.card
  transversal_weight : ∀ R : Finset V,
    (R.card : ℤ) = (L.card : ℤ) - (t : ℤ) →
    IsTransversal (R : Set V) F → Q ≤ ∑ v ∈ R, w v
  low_weight : ∀ v ∈ L, w v ≤ c
  gap : ((L.card : ℝ) - (t : ℝ)) * c < Q

/-- Claim 02, independent low-weight exclusion from the packaged weight bounds. -/
public theorem nontransversal_complements_of_weight_gap
    {F : Set (Set V)} {w : V → ℝ} {L : Finset V} {t : ℕ} {c Q : ℝ}
    (h : ComplementExclusion F w L t c Q) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsTransversal ((L \ T : Finset V) : Set V) F := by
  have ht := h.t_pos
  have htL := h.t_le_card
  intro T hTsub hTcard
  have hRcard : ((L \ T : Finset V).card : ℤ) = (L.card : ℤ) - (t : ℤ) := by
    have hcard_nat : (L \ T).card + T.card = L.card := Finset.card_sdiff_add_card_eq_card hTsub
    have hcardT : T.card = t := hTcard
    rw [hcardT] at hcard_nat
    omega
  intro h_trans
  have hQle := h.transversal_weight (L \ T) hRcard h_trans
  have hsum_le : ∑ v ∈ (L \ T : Finset V), w v ≤ ((L \ T).card : ℝ) * c := by
    calc
      ∑ v ∈ (L \ T : Finset V), w v ≤ ∑ v ∈ (L \ T : Finset V), c :=
        Finset.sum_le_sum (fun v hv ↦ h.low_weight v (Finset.mem_sdiff.mp hv).1)
      _ = ((L \ T).card : ℝ) * c := by simp
  have hcard_eq : ((L \ T).card : ℝ) = (L.card : ℝ) - (t : ℝ) := by
    have hcard_nat : (L \ T).card + T.card = L.card := Finset.card_sdiff_add_card_eq_card hTsub
    have hcardT : T.card = t := hTcard
    rw [hcardT] at hcard_nat
    have hcard_real : ((L \ T).card : ℝ) + (t : ℝ) = (L.card : ℝ) := by
      exact_mod_cast hcard_nat
    linarith
  rw [hcard_eq] at hsum_le
  have : Q ≤ ((L.card : ℝ) - (t : ℝ)) * c := le_trans hQle hsum_le
  linarith [h.gap]

/-- Claim 02, empty-complement boundary. -/
public theorem empty_not_transversal_of_positive_weight_bound
    (F : Set (Set V)) (w : V → ℝ) (Q : ℝ) (hQ : 0 < Q)
    (htransversal : ∀ R : Finset V, R.card = 0 →
      IsTransversal (R : Set V) F → Q ≤ ∑ v ∈ R, w v) :
    ¬IsTransversal (∅ : Set V) F := by
  intro h_trans
  have hQle := htransversal ∅ (by simp) (by simpa using h_trans)
  have hsum0 : ∑ v ∈ (∅ : Finset V), w v = 0 := by simp
  rw [hsum0] at hQle
  linarith

/-- Claim 02, vertexwise alternative. -/
public theorem nontransversal_complements_of_vertexwise_gap
    (F : Set (Set V)) (w : V → ℝ) (L : Finset V) (t : ℕ) (a c : ℝ)
    (ht : 1 ≤ t) (htL : t < L.card)
    (htransversal : ∀ R : Finset V,
      (R.card : ℤ) = (L.card : ℤ) - (t : ℤ) →
      IsTransversal (R : Set V) F → ∀ v ∈ R, a ≤ w v)
    (hLweight : ∀ v ∈ L, w v ≤ c) (hgap : c < a) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsTransversal ((L \ T : Finset V) : Set V) F := by
  intro T hTsub hTcard
  have hRcard : ((L \ T : Finset V).card : ℤ) = (L.card : ℤ) - (t : ℤ) := by
    have hcard_nat : (L \ T).card + T.card = L.card := Finset.card_sdiff_add_card_eq_card hTsub
    have hcardT : T.card = t := hTcard
    rw [hcardT] at hcard_nat
    omega
  have h_nonempty : (L \ T : Finset V).Nonempty := by
    have hcard_sdiff : (L \ T).card = L.card - T.card :=
      Finset.card_sdiff_of_subset hTsub
    have hpos : 0 < (L \ T).card := by
      rw [hcard_sdiff]
      omega
    exact Finset.card_pos.mp hpos
  intro h_trans
  have h_vertex := htransversal (L \ T) hRcard h_trans
  obtain ⟨v, hv⟩ := h_nonempty
  have hav := h_vertex v hv
  have hcv : w v ≤ c := hLweight v (Finset.mem_sdiff.mp hv).1
  linarith

/-- Claim 02: the two weighted conditions together give the exact-occurrence conclusion. -/
public theorem exact_intersection_of_weight_gaps
    (F : Set (Set V)) (w : V → ℝ) (P L : Finset V) (k j t : ℕ)
    (a m b B c Q : ℝ)
    (hoccupancy : WeightOccupancy F w P L k j t a m b B)
    (hexclusion : ComplementExclusion F w L t c Q) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ∃ I : Finset V, (I : Set V) ∈ F ∧ I ∩ L = T := by
  exact exact_intersection_of_avoidance F L t hoccupancy.t_pos hoccupancy.t_le_card
    (occupancy_of_weight_gap hoccupancy)
    (nontransversal_complements_of_weight_gap hexclusion)

/-- Graph, anchor and transversal bounds used by the degree-gap criterion. -/
public structure DegreeCompatibilityHypotheses
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) (m M a B S : ℤ) (F₀ : ℝ) : Prop where
  degrees : ∀ v, m ≤ (G.degree v : ℤ) ∧ (G.degree v : ℤ) ≤ M
  anchor : ∀ I : Finset V, G.IsNIndepSet 4 I → ∑ v ∈ I, (G.degree v : ℤ) ≤ B
  transversal_card : ∀ T : Finset V, IsIndepTransversal G 4 T → s ≤ T.card
  transversal_floor : ∀ T : Finset V, IsSizedIndepTransversal G 4 s T →
    ∀ v ∈ T, a ≤ (G.degree v : ℤ)
  transversal_sum : ∀ T : Finset V, IsSizedIndepTransversal G 4 s T →
    ∑ v ∈ T, (G.degree v : ℤ) ≤ S
  induced : ∀ K : Finset V,
    (K.card : ℤ) = (Nat.card V : ℤ) - (s : ℤ) - 1 →
    (G.induce (K : Set V)).IndepSetFree 4 →
    (Nat.card (G.induce (K : Set V)).edgeSet : ℝ) ≤ F₀
  indep : G.IndepSetFree (s + 2)

/-- Numerical order, deletion and degree gaps used by the compatibility criterion. -/
public structure DegreeCompatibilityGaps
    (G : SimpleGraph V) (s : ℕ) (m c M a B S : ℤ) (F₀ : ℝ) : Prop where
  s_pos : 1 ≤ s
  floor_le_cutoff : m ≤ c
  cutoff_lt_ceiling : c < M
  cutoff_lt_anchor : c < a
  order : (s : ℤ) + 3 ≤ (Nat.card V : ℤ) - 2 * (s : ℤ)
  anchor_gap : B < 3 * a + m
  pair_cap : B - 2 * a ≤ 2 * c + 1
  cutoff : B - 2 * a - (c + 1) ≤ m
  deletion_gap : F₀ < (Nat.card G.edgeSet : ℝ) - ((s : ℝ) + 1) * (m : ℝ)
  first_gap : ((s : ℤ) + 3) * c +
    ((Nat.card V : ℤ) - 2 * (s : ℤ) - (s : ℤ) - 3) * M <
    2 * (Nat.card G.edgeSet : ℤ) - 2 * S
  second_gap : ((s : ℤ) + 2) * c + (B - 2 * a - m) +
    ((Nat.card V : ℤ) - 2 * (s : ℤ) - (s : ℤ) - 3) * M <
    2 * (Nat.card G.edgeSet : ℤ) - 2 * S

/-- Claim 03, graph bounds and numerical gaps exclude two disjoint sized transversals. -/
public theorem not_disjoint_of_degree_gaps
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) (m c M a B S : ℤ) (F₀ : ℝ)
    (hgraph : DegreeCompatibilityHypotheses G s m M a B S F₀)
    (hgaps : DegreeCompatibilityGaps G s m c M a B S F₀)
    (T₁ T₂ : Finset V)
    (hT₁ : IsSizedIndepTransversal G 4 s T₁) (hT₂ : IsSizedIndepTransversal G 4 s T₂) :
    ¬Disjoint T₁ T₂ := by
  sorry

/-- Claim 04, frontier specialization recovering the low-excess disjointness result. -/
public theorem frontier_four_transversals_intersect
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (horder : Nat.card V = 18) (hedges : Nat.card G.edgeSet = 85)
    (hRamsey : IsRamseyGraph 4 5 G)
    (hdegree : ∀ v, 6 ≤ (G.degree v : ℤ) ∧ (G.degree v : ℤ) ≤ 13)
    (hanchor : ∀ I : Finset V, G.IsNIndepSet 4 I →
      ∑ v ∈ I, (G.degree v : ℤ) ≤ 32)
    (htau : ∀ T : Finset V, IsIndepTransversal G 4 T → 4 ≤ T.card)
    (htransversalFloor : ∀ T : Finset V, IsSizedIndepTransversal G 4 4 T →
      ∀ v ∈ T, 9 ≤ (G.degree v : ℤ))
    (htransversalSum : ∀ T : Finset V, IsSizedIndepTransversal G 4 4 T →
      ∑ v ∈ T, (G.degree v : ℤ) ≤ 40)
    (hR34 : RamseyUpperBound 3 4 9)
    (T₁ T₂ : Finset V)
    (hT₁ : IsSizedIndepTransversal G 4 4 T₁) (hT₂ : IsSizedIndepTransversal G 4 4 T₂) :
    (T₁ ∩ T₂).Nonempty := by
  sorry

end Ramsey.TransversalCompatibility
