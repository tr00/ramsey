module

public import Ramsey.Defs
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Weighted avoidance and transversal compatibility

Statements from `docs/general_theorems/transversal_compatibility.md`, Claims 01–04.
Every theorem is proved. The numerical specialization records its local frontier premises
explicitly; edge count 85 alone is not an anchor or a four-transversal premise.
-/

@[expose] public section

namespace Ramsey.TransversalCompatibility

open scoped BigOperators

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Claim 01 (`#claim-transversal-compatibility-01`): occupancy and avoidance force every
`t`-subset of `L` to occur as an exact intersection with a family member. For `t = 1` this
asserts occurrence only, not independence. The family uses the existing set-family interface. -/
theorem exact_intersection_of_avoidance
    (F : Set (Set V)) (L : Finset V) (t : ℕ)
    (ht : 1 ≤ t) (htL : t ≤ L.card)
    (hoccupancy : ∀ I : Finset V, (I : Set V) ∈ F → t ≤ (I ∩ L).card)
    (havoidance : ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsTransversal ((L \ T : Finset V) : Set V) F) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ∃ I : Finset V, (I : Set V) ∈ F ∧ I ∩ L = T := by
  intro T hTsub hTcard
  have hnon := havoidence T hTsub hTcard
  rw [IsTransversal] at hnon
  push_neg at hnon
  obtain ⟨S, hSF, hSempty⟩ := hnon
  have hSempty' : S ∩ ((L \ T : Finset V) : Set V) = ∅ := by
    rw [Set.not_nonempty_iff_eq_empty] at hSempty
    exact hSempty
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
      rw [hSempty'] at hx_inter
      exact Set.not_mem_empty x hx_inter
    rw [Finset.mem_sdiff] at hx_not_sdiff
    simpa [hxL] using hx_not_sdiff
  have hcard_le : (I ∩ L).card ≤ T.card := Finset.card_le_card hsubset
  have hcard_ge : t ≤ (I ∩ L).card := hoccupancy I hIF
  exact Finset.eq_of_subset_of_card_le hsubset (by omega)

/-- Claim 01 (`#claim-transversal-compatibility-01`), the singleton boundary: every vertex
of `L` occurs alone in the intersection with some family member. No independence follows. -/
theorem singleton_occurrence_of_avoidance
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
      rw [← hv] at hTsub
      exact hTsub (by simp)
    exact havoidence v hvL
  have h := exact_intersection_of_avoidance F L 1 (by omega) hL hoccupancy h_avoidance'
  intro v hvL
  have hcard : ({v} : Finset V).card = 1 := by simp
  have hsub : ({v} : Finset V) ⊆ L := by simpa using hvL
  obtain ⟨I, hIF, hIeq⟩ := h {v} hsub hcard
  refine ⟨I, hIF, ?_⟩
  simpa [hIeq] using rfl

/-- Claim 01 (`#claim-transversal-compatibility-01`), independent-family consequence:
for `2 ≤ t ≤ |L|`, exact occurrence forces independence in the graph `G` itself. -/
theorem independent_of_indep_family_avoidance
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
  have h_exists_room : t ≤ L.card := htL
  obtain ⟨T, hTsub, hTcard⟩ := Finset.exists_superset_card_eq hpair_sub hpair_card
    (by
      have htotal : Finset.card (Finset.univ : Finset V) = Fintype.card V :=
        Finset.card_finset_univ _
      have hcardV : Fintype.card V = Nat.card V := Nat.card_eq_fintype_card _
      omega)
  have h_not_trans := havoidence T hTsub hTcard
  rw [IsIndepTransversal] at h_not_trans
  rw [IsTransversal] at h_not_trans
  push_neg at h_not_trans
  obtain ⟨S, hS_indep_set, hS_empty⟩ := h_not_trans
  have hS_inter_empty : S ∩ ((L \ T : Finset V) : Set V) = ∅ := by
    rw [Set.not_nonempty_iff_eq_empty] at hS_empty
    exact hS_empty
  let I : Finset V := Finset.filter (· ∈ S) Finset.univ
  have hIset : (I : Set V) = S := by
    ext x; simp [I]
  have hI_indep : G.IsNIndepSet k I := by
    rcases hS_indep_set with ⟨J, hJset, hJ_indep⟩
    have hIJ : I = J := by
      apply Finset.ext; intro x; simp [I, hJset]
    rw [hIJ]
    exact hJ_indep
  have h_occupancy := hoccupancy I hI_indep
  have h_subset : I ∩ L ⊆ T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxI, hxL⟩
    have hxS : x ∈ S := by
      simpa [I, hIset] using hxI
    have hx_not_sdiff : x ∉ (L \ T : Finset V) := by
      intro hxLminusT
      have hx_inter : x ∈ S ∩ ((L \ T : Finset V) : Set V) := ⟨hxS, by simpa using hxLminusT⟩
      rw [hS_inter_empty] at hx_inter
      exact Set.not_mem_empty x hx_inter
    rw [Finset.mem_sdiff] at hx_not_sdiff
    simpa [hxL] using hx_not_sdiff
  have hcard_le : (I ∩ L).card ≤ T.card := Finset.card_le_card h_subset
  have hcard_ge : t ≤ (I ∩ L).card := h_occupancy
  have h_eq : I ∩ L = T := Finset.eq_of_subset_of_card_le h_subset (by omega)
  have huI : u ∈ I := by
    have huT : u ∈ T := by
      rw [← h_eq]
      apply Finset.mem_inter.mpr
      exact ⟨by simpa [I, hIset] using hu, hu⟩
    rw [h_eq] at huT
    exact (Finset.mem_inter.mp huT).1
  have hvI : v ∈ I := by
    have hvT : v ∈ T := by
      rw [← h_eq]
      apply Finset.mem_inter.mpr
      exact ⟨by simpa [I, hIset] using hv, hv⟩
    rw [h_eq] at hvT
    exact (Finset.mem_inter.mp hvT).1
  have h_not_adj := hI_indep.isIndepSet huI hvI hne
  exact h_not_adj

/-- Claim 01 (`#claim-transversal-compatibility-01`), contradiction with
`alpha(G) < |L|`, expressed without an independently defined independence number. -/
theorem false_of_indep_family_avoidance
    (G : SimpleGraph V) (k : ℕ) (L : Finset V) (t : ℕ)
    (ht : 2 ≤ t) (htL : t ≤ L.card)
    (hoccupancy : ∀ I : Finset V, G.IsNIndepSet k I → t ≤ (I ∩ L).card)
    (havoidance : ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsIndepTransversal G k (L \ T))
    (hindep : G.IndepSetFree L.card) : False := by
  have h_indep := independent_of_indep_family_avoidance G k L t ht htL hoccupancy havoidence
  have hL_indep : G.IsNIndepSet L.card L := by
    refine ⟨?_, rfl⟩
    intro u hu v hv hne'
    have hu' : u ∈ (L : Set V) := hu
    have hv' : v ∈ (L : Set V) := hv
    exact h_indep hu' hv' hne'
  exact hindep L hL_indep

/-- Claim 02 (`#claim-transversal-compatibility-02`), weighted occupancy. All weights and
bounds are real and may be negative. Coefficients are cast before subtraction, so the
formula has its signed mathematical meaning. -/
theorem occupancy_of_weight_gap
    (F : Set (Set V)) (w : V → ℝ) (P L : Finset V) (k j t : ℕ)
    (a m b B : ℝ) (hdisjoint : Disjoint P L)
    (ht : 1 ≤ t) (htL : t ≤ L.card) (hjk : j ≤ k)
    (hslots : (j : ℤ) + (t : ℤ) - 1 ≤ (k : ℤ))
    (huniform : ∀ I : Finset V, (I : Set V) ∈ F → I.card = k)
    (hcap : ∀ I : Finset V, (I : Set V) ∈ F → ∑ v ∈ I, w v ≤ B)
    (hPcount : ∀ I : Finset V, (I : Set V) ∈ F → j ≤ (I ∩ P).card)
    (hPweight : ∀ v ∈ P, a ≤ w v)
    (hLweight : ∀ v ∈ L, m ≤ w v)
    (houtside : ∀ v, v ∉ P → v ∉ L → b ≤ w v)
    (hmb : m ≤ b) (hba : b ≤ a)
    (hgap : B < (j : ℝ) * a + ((t : ℝ) - 1) * m +
      ((k : ℝ) - (j : ℝ) - (t : ℝ) + 1) * b) :
    ∀ I : Finset V, (I : Set V) ∈ F → t ≤ (I ∩ L).card := by
  intro I hIF
  by_contra! h_lt
  -- h_lt : (I ∩ L).card < t
  let p := (I ∩ P).card
  let q := (I ∩ L).card
  have hp : (j : ℝ) ≤ (p : ℝ) := by
    have hp_nat : j ≤ p := hPcount I hIF
    exact_mod_cast hp_nat
  have hq_lt_t : q < t := h_lt
  have hq_le : q ≤ t - 1 := by omega
  have hIcard : I.card = k := huniform I hIF
  -- Partition I into I∩P, I∩L, and the rest
  -- Since P and L are disjoint, |I| = |I∩P| + |I∩L| + |I \ (P ∪ L)|
  have h_disjoint_PL : Disjoint (P : Set V) (L : Set V) := hdisjoint
  -- Use the partition identity
  have hIcard_split : (I.card : ℝ) =
      (p : ℝ) + (q : ℝ) + ((I \ (P ∪ L : Finset V)).card : ℝ) := by
    -- The Finset I is partitioned into three disjoint parts
    have h_disjoint_union : (I ∩ P) ∪ (I ∩ L) ∪ (I \ (P ∪ L : Finset V)) = I := by
      ext x; simp [Finset.mem_inter, Finset.mem_sdiff, Finset.mem_union]
      tauto
    have h_disjoint1 : Disjoint (I ∩ P : Finset V) (I ∩ L : Finset V) := by
      refine Finset.disjoint_left.mpr (fun x hx1 hx2 => ?_)
      have hxP : x ∈ P := (Finset.mem_inter.mp hx1).2
      have hxL : x ∈ L := (Finset.mem_inter.mp hx2).2
      have h_empty : P ∩ L = ∅ := Finset.disjoint_iff_inter_eq_empty.mp hdisjoint
      have hx_inter : x ∈ P ∩ L := Finset.mem_inter.mpr ⟨hxP, hxL⟩
      rw [h_empty] at hx_inter
      exact Finset.not_mem_empty x hx_inter
    have h_disjoint2 : Disjoint ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)) (I \ (P ∪ L : Finset V)) := by
      refine Finset.disjoint_left.mpr (fun x hx hx' => ?_)
      rcases Finset.mem_union.mp hx with (hx' | hx')
      · have hxP : x ∈ P := (Finset.mem_inter.mp hx').2
        have hx_not_union : x ∉ (P ∪ L : Finset V) := (Finset.mem_sdiff.mp hx').2
        apply hx_not_union
        simp [hxP]
      · have hxL : x ∈ L := (Finset.mem_inter.mp hx').2
        have hx_not_union : x ∉ (P ∪ L : Finset V) := (Finset.mem_sdiff.mp hx').2
        apply hx_not_union
        simp [hxL]
    have h_card_union1 : ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)).card =
        (I ∩ P).card + (I ∩ L).card :=
      Finset.card_union_of_disjoint h_disjoint1
    have h_card_total : I.card = ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)).card +
        (I \ (P ∪ L : Finset V)).card :=
      Finset.card_union_of_disjoint h_disjoint2
    calc
      (I.card : ℝ) = (((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)).card + (I \ (P ∪ L : Finset V)).card : ℝ) := by
        simp [h_card_total]
      _ = ((I ∩ P).card + (I ∩ L).card : ℝ) + (I \ (P ∪ L : Finset V)).card := by
        simp [h_card_union1]
      _ = (p : ℝ) + (q : ℝ) + ((I \ (P ∪ L : Finset V)).card : ℝ) := by simp [p, q]
  -- Now bound the weight sum
  have hsum : ∑ v ∈ I, w v ≤ B := hcap I hIF
  -- Split the sum into the three parts
  have hsum_split : ∑ v ∈ I, w v =
      ∑ v ∈ (I ∩ P : Finset V), w v + ∑ v ∈ (I ∩ L : Finset V), w v +
      ∑ v ∈ (I \ (P ∪ L : Finset V)), w v := by
    calc
      ∑ v ∈ I, w v = ∑ v ∈ ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V) ∪ (I \ (P ∪ L : Finset V))), w v := by
        rw [h_disjoint_union]
      _ = ∑ v ∈ ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)), w v + ∑ v ∈ (I \ (P ∪ L : Finset V)), w v := by
        rw [Finset.sum_union (Finset.disjoint_left.mpr (fun x hx hx' => ?_))]
        · rfl
        rcases Finset.mem_union.mp hx with (hx' | hx')
        · have hxP : x ∈ P := (Finset.mem_inter.mp hx').2
          have hx_not_union : x ∉ (P ∪ L : Finset V) := (Finset.mem_sdiff.mp hx').2
          apply hx_not_union; simp [hxP]
        · have hxL : x ∈ L := (Finset.mem_inter.mp hx').2
          have hx_not_union : x ∉ (P ∪ L : Finset V) := (Finset.mem_sdiff.mp hx').2
          apply hx_not_union; simp [hxL]
      _ = (∑ v ∈ (I ∩ P : Finset V), w v + ∑ v ∈ (I ∩ L : Finset V), w v) +
          ∑ v ∈ (I \ (P ∪ L : Finset V)), w v := by
        rw [Finset.sum_union h_disjoint1]
      _ = ∑ v ∈ (I ∩ P : Finset V), w v + ∑ v ∈ (I ∩ L : Finset V), w v +
          ∑ v ∈ (I \ (P ∪ L : Finset V)), w v := by ring
  -- Bound each part from below
  have hsumP : (p : ℝ) * a ≤ ∑ v ∈ (I ∩ P : Finset V), w v := by
    calc
      (p : ℝ) * a = ∑ v ∈ (I ∩ P : Finset V), a := by
        simp [Finset.sum_const_nsmul, smul_eq_mul]
      _ ≤ ∑ v ∈ (I ∩ P : Finset V), w v :=
        Finset.sum_le_sum (fun v hv => hPweight v (Finset.mem_inter.mp hv).2)
  have hsumL : (q : ℝ) * m ≤ ∑ v ∈ (I ∩ L : Finset V), w v := by
    calc
      (q : ℝ) * m = ∑ v ∈ (I ∩ L : Finset V), m := by
        simp [Finset.sum_const_nsmul, smul_eq_mul]
      _ ≤ ∑ v ∈ (I ∩ L : Finset V), w v :=
        Finset.sum_le_sum (fun v hv => hLweight v (Finset.mem_inter.mp hv).2)
  have hsumRest : ((I \ (P ∪ L : Finset V)).card : ℝ) * b ≤
      ∑ v ∈ (I \ (P ∪ L : Finset V)), w v := by
    calc
      ((I \ (P ∪ L : Finset V)).card : ℝ) * b = ∑ v ∈ (I \ (P ∪ L : Finset V)), b := by
        simp [Finset.sum_const_nsmul, smul_eq_mul]
      _ ≤ ∑ v ∈ (I \ (P ∪ L : Finset V)), w v :=
        Finset.sum_le_sum (fun v hv => houtside v
          (by
            intro h; have := Finset.mem_sdiff.mp hv; exact this.2 (by simp [h]))
          (by
            intro h; have := Finset.mem_sdiff.mp hv; exact this.2 (by simp [h])))
  -- Now combine: w(I) ≥ p*a + q*m + rest*b
  have hsum_lower : (p : ℝ) * a + (q : ℝ) * m + ((I \ (P ∪ L : Finset V)).card : ℝ) * b ≤
      ∑ v ∈ I, w v := by
    rw [hsum_split]
    nlinarith
  -- Now use the cardinality identity to relate the card expression to k, j, t
  have hcard_rest : (I \ (P ∪ L : Finset V)).card = k - p - q := by
    -- I.card = p + q + rest, and I.card = k
    have htotal : I.card = (I ∩ P).card + (I ∩ L).card + (I \ (P ∪ L : Finset V)).card := by
      -- This follows from the partition
      have h_union : ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V) ∪ (I \ (P ∪ L : Finset V))) = I := by
        ext x; simp [Finset.mem_inter, Finset.mem_sdiff, Finset.mem_union]; tauto
      have h_disj1 : Disjoint (I ∩ P : Finset V) (I ∩ L : Finset V) := by
        refine Finset.disjoint_left.mpr (fun x hx1 hx2 => ?_)
        have hxP : x ∈ P := (Finset.mem_inter.mp hx1).2
        have hxL : x ∈ L := (Finset.mem_inter.mp hx2).2
        have h_empty : P ∩ L = ∅ := Finset.disjoint_iff_inter_eq_empty.mp hdisjoint
        have hx_inter : x ∈ P ∩ L := Finset.mem_inter.mpr ⟨hxP, hxL⟩
        rw [h_empty] at hx_inter
        exact Finset.not_mem_empty x hx_inter
      have h_disj2 : Disjoint ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)) (I \ (P ∪ L : Finset V)) := by
        refine Finset.disjoint_left.mpr (fun x hx hx' => ?_)
        rcases Finset.mem_union.mp hx with (hx' | hx')
        · have hxP : x ∈ P := (Finset.mem_inter.mp hx').2
          have hx_not : x ∉ (P ∪ L : Finset V) := (Finset.mem_sdiff.mp hx').2
          apply hx_not; simp [hxP]
        · have hxL : x ∈ L := (Finset.mem_inter.mp hx').2
          have hx_not : x ∉ (P ∪ L : Finset V) := (Finset.mem_sdiff.mp hx').2
          apply hx_not; simp [hxL]
      calc
        I.card = (((I ∩ P : Finset V) ∪ (I ∩ L : Finset V) ∪ (I \ (P ∪ L : Finset V))).card : ℕ) := by
          rw [h_union]
        _ = ((I ∩ P : Finset V) ∪ (I ∩ L : Finset V)).card + (I \ (P ∪ L : Finset V)).card := by
          rw [Finset.card_union_of_disjoint h_disj2]
        _ = (I ∩ P).card + (I ∩ L).card + (I \ (P ∪ L : Finset V)).card := by
          rw [Finset.card_union_of_disjoint h_disj1]
    rw [htotal, hIcard] at hIcard_split
    omega
  rw [hcard_rest] at hsum_lower
  -- Now we have: w(I) ≥ p*a + q*m + (k-p-q)*b
  -- Need to show: p*a + q*m + (k-p-q)*b ≥ j*a + (t-1)*m + (k-j-t+1)*b
  -- This is equivalent to: p*(a-b) + q*(m-b) ≥ j*(a-b) + (t-1)*(m-b)
  -- Since a-b ≥ 0 and m-b ≤ 0, and p ≥ j, q ≤ t-1, we get the result.
  have h_ineq : (p : ℝ) * a + (q : ℝ) * m + ((k : ℝ) - (p : ℝ) - (q : ℝ)) * b ≥
      (j : ℝ) * a + ((t : ℝ) - 1) * m + ((k : ℝ) - (j : ℝ) - ((t : ℝ) - 1)) * b := by
    have hab_nonneg : 0 ≤ a - b := by linarith [hba]
    have hmb_nonpos : m - b ≤ 0 := by linarith [hmb]
    have hp_ge_j : (j : ℝ) ≤ (p : ℝ) := by exact_mod_cast hp
    have hq_le_tm1 : (q : ℝ) ≤ (t : ℝ) - 1 := by
      have : q ≤ t - 1 := by omega
      exact_mod_cast this
    nlinarith
  have h_contra : (j : ℝ) * a + ((t : ℝ) - 1) * m + ((k : ℝ) - (j : ℝ) - ((t : ℝ) - 1)) * b ≤
      ∑ v ∈ I, w v := by
    linarith
  have hBcap : ∑ v ∈ I, w v ≤ B := hcap I hIF
  have : (j : ℝ) * a + ((t : ℝ) - 1) * m + ((k : ℝ) - (j : ℝ) - (t : ℝ) + 1) * b ≤ B := by
    linarith
  linarith [hgap, this]

/-- Claim 02 (`#claim-transversal-compatibility-02`), independent low-weight exclusion.
The lower bound includes transversals of size zero when `|L| = t`; no nonempty-set
qualification or nonnegative-weight assumption is imposed. -/
theorem nontransversal_complements_of_weight_gap
    (F : Set (Set V)) (w : V → ℝ) (L : Finset V) (t : ℕ) (c Q : ℝ)
    (ht : 1 ≤ t) (htL : t ≤ L.card)
    (htransversal : ∀ R : Finset V,
      (R.card : ℤ) = (L.card : ℤ) - (t : ℤ) →
      IsTransversal (R : Set V) F → Q ≤ ∑ v ∈ R, w v)
    (hLweight : ∀ v ∈ L, w v ≤ c)
    (hgap : ((L.card : ℝ) - (t : ℝ)) * c < Q) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ¬IsTransversal ((L \ T : Finset V) : Set V) F := by
  intro T hTsub hTcard
  have hRcard : ((L \ T : Finset V).card : ℤ) = (L.card : ℤ) - (t : ℤ) := by
    have hcard_nat : (L \ T).card + T.card = L.card := Finset.card_sdiff_add_card_eq_card hTsub
    have hcardT : T.card = t := hTcard
    rw [hcardT] at hcard_nat
    omega
  intro h_trans
  have hQle := htransversal (L \ T) hRcard h_trans
  -- hQle : Q ≤ ∑ v ∈ (L \ T), w v
  have hsum_le : ∑ v ∈ (L \ T : Finset V), w v ≤ ((L \ T).card : ℝ) * c := by
    calc
      ∑ v ∈ (L \ T : Finset V), w v ≤ ∑ v ∈ (L \ T : Finset V), c :=
        Finset.sum_le_sum (fun v hv => hLweight v (Finset.mem_sdiff.mp hv).1)
      _ = ((L \ T).card : ℝ) * c := by simp [Finset.sum_const_nsmul, smul_eq_mul]
  have hcard_eq : ((L \ T).card : ℝ) = (L.card : ℝ) - (t : ℝ) := by
    have hcard_nat : (L \ T).card + T.card = L.card := Finset.card_sdiff_add_card_eq_card hTsub
    have hcardT : T.card = t := hTcard
    rw [hcardT] at hcard_nat
    have hcard_nat' : (L \ T).card = L.card - t := by omega
    -- Need to cast to ℝ carefully
    rw [hcard_nat']
    push_cast
    ring
  rw [hcard_eq] at hsum_le
  have : Q ≤ ((L.card : ℝ) - (t : ℝ)) * c := le_trans hQle hsum_le
  linarith

/-- Claim 02 (`#claim-transversal-compatibility-02`), explicit empty-complement boundary:
a positive lower bound on weights of zero-size transversals excludes the empty transversal. -/
theorem empty_not_transversal_of_positive_weight_bound
    (F : Set (Set V)) (w : V → ℝ) (Q : ℝ) (hQ : 0 < Q)
    (htransversal : ∀ R : Finset V, R.card = 0 →
      IsTransversal (R : Set V) F → Q ≤ ∑ v ∈ R, w v) :
    ¬IsTransversal (∅ : Set V) F := by
  intro h_trans
  have hQle := htransversal ∅ (by simp) h_trans
  have hsum0 : ∑ v ∈ (∅ : Finset V), w v = 0 := by simp
  rw [hsum0] at hQle
  linarith

/-- Claim 02 (`#claim-transversal-compatibility-02`), vertexwise alternative. This excludes
only nonempty complements (`t < |L|`); a vertexwise bound alone says nothing about the empty
transversal. It is independent of the weighted occupancy assumptions. -/
theorem nontransversal_complements_of_vertexwise_gap
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

/-- Claim 02 (`#claim-transversal-compatibility-02`): the two independent weighted
conditions together give the exact-occurrence conclusion of Claim 01. All real parameters
may be negative, and the transversal weight premise includes the empty complement. -/
theorem exact_intersection_of_weight_gaps
    (F : Set (Set V)) (w : V → ℝ) (P L : Finset V) (k j t : ℕ)
    (a m b B c Q : ℝ) (hdisjoint : Disjoint P L)
    (ht : 1 ≤ t) (htL : t ≤ L.card) (hjk : j ≤ k)
    (hslots : (j : ℤ) + (t : ℤ) - 1 ≤ (k : ℤ))
    (huniform : ∀ I : Finset V, (I : Set V) ∈ F → I.card = k)
    (hcap : ∀ I : Finset V, (I : Set V) ∈ F → ∑ v ∈ I, w v ≤ B)
    (hPcount : ∀ I : Finset V, (I : Set V) ∈ F → j ≤ (I ∩ P).card)
    (hPweight : ∀ v ∈ P, a ≤ w v)
    (hLweight : ∀ v ∈ L, m ≤ w v)
    (houtside : ∀ v, v ∉ P → v ∉ L → b ≤ w v)
    (hmb : m ≤ b) (hba : b ≤ a)
    (hoccupancyGap : B < (j : ℝ) * a + ((t : ℝ) - 1) * m +
      ((k : ℝ) - (j : ℝ) - (t : ℝ) + 1) * b)
    (htransversal : ∀ R : Finset V,
      (R.card : ℤ) = (L.card : ℤ) - (t : ℤ) →
      IsTransversal (R : Set V) F → Q ≤ ∑ v ∈ R, w v)
    (hLupper : ∀ v ∈ L, w v ≤ c)
    (hexclusionGap : ((L.card : ℝ) - (t : ℝ)) * c < Q) :
    ∀ T : Finset V, T ⊆ L → T.card = t →
      ∃ I : Finset V, (I : Set V) ∈ F ∧ I ∩ L = T := by
  have h_occupancy := occupancy_of_weight_gap F w P L k j t a m b B hdisjoint ht htL hjk hslots
    huniform hcap hPcount hPweight hLweight houtside hmb hba hoccupancyGap
  have h_nontrans := nontransversal_complements_of_weight_gap F w L t c Q ht htL htransversal
    hLupper hexclusionGap
  exact exact_intersection_of_avoidance F L t ht htL h_occupancy h_nontrans

/-- Claim 03 (`#claim-transversal-compatibility-03`): the full degree-gap theorem.

All six source hypotheses are explicit: (1) global degree bounds, independent-four anchor
cap and transversal-size floor; (2) degree floor and degree-sum cap for every `s`-transversal;
(3) the order and three local gaps; (4) the induced-edge cap and deletion gap; (5) both
strict degree-budget gaps; (6) the independence bound. Degrees are full degrees in `G`.
Here `N = |V| - 2s`, `P = B - 2a`, and `D = 2e(G) - 2S` are expanded using signed integer
arithmetic; `F₀` is real. The induced-graph premise does not forbid independent fours in `G`.
-/
theorem not_disjoint_of_degree_gaps
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) (m c M a B S : ℤ) (F₀ : ℝ)
    (hs : 1 ≤ s) (hmc : m ≤ c) (hcM : c < M) (hca : c < a)
    (h1degrees : ∀ v, m ≤ (G.degree v : ℤ) ∧ (G.degree v : ℤ) ≤ M)
    (h1anchor : ∀ I : Finset V, G.IsNIndepSet 4 I →
      ∑ v ∈ I, (G.degree v : ℤ) ≤ B)
    (h1tau : ∀ T : Finset V, IsIndepTransversal G 4 T → s ≤ T.card)
    (h2floor : ∀ T : Finset V, T.card = s → IsIndepTransversal G 4 T →
      ∀ v ∈ T, a ≤ (G.degree v : ℤ))
    (h2sum : ∀ T : Finset V, T.card = s → IsIndepTransversal G 4 T →
      ∑ v ∈ T, (G.degree v : ℤ) ≤ S)
    (h3order : (s : ℤ) + 3 ≤ (Nat.card V : ℤ) - 2 * (s : ℤ))
    (h3anchorGap : B < 3 * a + m)
    (h3pairCap : B - 2 * a ≤ 2 * c + 1)
    (h3cutoff : B - 2 * a - (c + 1) ≤ m)
    (h4induced : ∀ K : Finset V,
      (K.card : ℤ) = (Nat.card V : ℤ) - (s : ℤ) - 1 →
      (G.induce (K : Set V)).IndepSetFree 4 →
      (Nat.card (G.induce (K : Set V)).edgeSet : ℝ) ≤ F₀)
    (h4deletionGap : F₀ < (Nat.card G.edgeSet : ℝ) - ((s : ℝ) + 1) * (m : ℝ))
    (h5first : ((s : ℤ) + 3) * c +
      ((Nat.card V : ℤ) - 2 * (s : ℤ) - (s : ℤ) - 3) * M <
      2 * (Nat.card G.edgeSet : ℤ) - 2 * S)
    (h5second : ((s : ℤ) + 2) * c + (B - 2 * a - m) +
      ((Nat.card V : ℤ) - 2 * (s : ℤ) - (s : ℤ) - 3) * M <
      2 * (Nat.card G.edgeSet : ℤ) - 2 * S)
    (h6indep : G.IndepSetFree (s + 2))
    (T₁ T₂ : Finset V) (hT₁card : T₁.card = s) (hT₂card : T₂.card = s)
    (hT₁ : IsIndepTransversal G 4 T₁) (hT₂ : IsIndepTransversal G 4 T₂) :
    ¬Disjoint T₁ T₂ := by sorry

/-- Claim 04 (`#claim-transversal-compatibility-04`), recovering
`n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-02`.

This is the explicit-local-premise formulation of the frontier specialization, before
imposing `r = 2`. Besides `(4,5)`-freeness, order 18 and edge count 85, it retains the full
independent-four anchor cap, degree bounds, transversal-size floor and universal
four-transversal degree/sum bounds supplied by the actual-interface setting and its
recorded census premises. These are hypotheses, not consequences asserted from `e = 85`
alone. The external value `R(3,4) = 9` is used only through its explicitly supplied upper
bound, which yields the 52-edge bound for independent-four-free induced 13-vertex graphs.

The Claim 03 parameters are `s=4, m=6, c=7, M=13, a=9, B=32, S=40, F₀=52`.
The transversals need not be actual columns; the conclusion does not close `x = 136`.
-/
theorem frontier_four_transversals_intersect
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (horder : Nat.card V = 18) (hedges : Nat.card G.edgeSet = 85)
    (hRamsey : IsRamseyGraph 4 5 G)
    (hdegree : ∀ v, 6 ≤ (G.degree v : ℤ) ∧ (G.degree v : ℤ) ≤ 13)
    (hanchor : ∀ I : Finset V, G.IsNIndepSet 4 I →
      ∑ v ∈ I, (G.degree v : ℤ) ≤ 32)
    (htau : ∀ T : Finset V, IsIndepTransversal G 4 T → 4 ≤ T.card)
    (htransversalFloor : ∀ T : Finset V, T.card = 4 →
      IsIndepTransversal G 4 T → ∀ v ∈ T, 9 ≤ (G.degree v : ℤ))
    (htransversalSum : ∀ T : Finset V, T.card = 4 →
      IsIndepTransversal G 4 T → ∑ v ∈ T, (G.degree v : ℤ) ≤ 40)
    (hR34 : RamseyUpperBound 3 4 9)
    (T₁ T₂ : Finset V) (hT₁card : T₁.card = 4) (hT₂card : T₂.card = 4)
    (hT₁ : IsIndepTransversal G 4 T₁) (hT₂ : IsIndepTransversal G 4 T₂) :
    (T₁ ∩ T₂).Nonempty := by sorry

end Ramsey.TransversalCompatibility
