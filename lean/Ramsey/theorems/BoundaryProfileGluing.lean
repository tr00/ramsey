module

public import Ramsey.theorems.BoundaryProfiles
public import Ramsey.defs.BoundaryProfileGluing
public import Mathlib.Data.Finset.Sum
public import Mathlib.Tactic

/-! Exact profile formulas for concrete shared-boundary uniform gluing. -/

namespace Ramsey.Boundary

variable {B X Y : Type*}

/-- A glued eligible set consists of eligible parts with the prescribed cross colour. -/
public theorem eligible_glue_disjSum (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε k : Bool) (U : Finset B) (L : Finset X) (R : Finset Y) :
    Eligible (glue G H ε) k U (L.disjSum R) ↔
      Eligible G k U L ∧ Eligible H k U R ∧
        (∀ x ∈ L, ∀ y ∈ R, ε = k) := by
  classical
  cases ε <;> cases k <;>
    simp [Eligible, Homogeneous, colourAdj, Sum.forall, glue] <;> grind

/-- The actual eligible maximum adds for matching cross colour and otherwise takes a maximum. -/
public theorem rawEntry_glue [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε k : Bool) (U : Finset B) :
    rawEntry (glue G H ε) k U =
      if ε = k then rawEntry G k U + rawEntry H k U
      else max (rawEntry G k U) (rawEntry H k U) := by
  classical
  obtain ⟨L, hL, eL⟩ := exists_rawEntry G k U
  obtain ⟨R, hR, eR⟩ := exists_rawEntry H k U
  by_cases h : ε = k
  · rw [ite_eq_left h]
    apply (rawEntry_eq_iff _ _ _).2
    constructor
    · intro W hW
      have hw := (eligible_glue_disjSum G H ε k U W.toLeft W.toRight).1
        (by simpa only [Finset.toLeft_disjSum_toRight] using hW)
      have hl := le_rawEntry hw.1
      have hr := le_rawEntry hw.2.1
      have ec := Finset.card_toLeft_add_card_toRight (u := W)
      omega
    · refine ⟨L.disjSum R, (eligible_glue_disjSum _ _ _ _ _ _ _).2
        ⟨hL, hR, fun _ _ _ _ ↦ h⟩, ?_⟩
      simp [Finset.card_disjSum, eL, eR]
  · rw [ite_eq_right h]
    apply le_antisymm
    · apply rawEntry_le
      intro W hW
      have hw := (eligible_glue_disjSum G H ε k U W.toLeft W.toRight).1
        (by simpa only [Finset.toLeft_disjSum_toRight] using hW)
      have he : W.toLeft = ∅ ∨ W.toRight = ∅ := by
        by_cases hl : W.toLeft = ∅
        · exact Or.inl hl
        · right
          obtain ⟨x, hx⟩ := Finset.nonempty_iff_ne_empty.2 hl
          apply Finset.eq_empty_iff_forall_notMem.2
          intro y hy
          exact h (hw.2.2 x hx y hy)
      have hl := le_rawEntry hw.1
      have hr := le_rawEntry hw.2.1
      have ec := Finset.card_toLeft_add_card_toRight (u := W)
      rcases he with he | he <;> simp only [he, Finset.card_empty] at ec <;> omega
    · apply max_le
      · have he : Eligible (glue G H ε) k U (L.disjSum ∅) :=
          (eligible_glue_disjSum _ _ _ _ _ _ _).2 ⟨hL, eligible_empty _ _ _, by simp⟩
        simpa [Finset.card_disjSum, eL] using le_rawEntry he
      · have he : Eligible (glue G H ε) k U ((∅ : Finset X).disjSum R) :=
          (eligible_glue_disjSum _ _ _ _ _ _ _).2 ⟨eligible_empty _ _ _, hR, by simp⟩
        simpa [Finset.card_disjSum, eR] using le_rawEntry he

/-- The exact clipped table formula simultaneously gives both colours and both join bits. -/
public theorem entry_glue [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε k : Bool) (t : ℕ) (U : Finset B) :
    entry (glue G H ε) k t U =
      if ε = k then min t (entry G k t U + entry H k t U)
      else max (entry G k t U) (entry H k t U) := by
  rw [entry, rawEntry_glue]
  split <;> simp_all only [entry, cap_add_cap, cap_max]

/-- Complete interior joins add capped eligible clique contributions. -/
public theorem clique_entry_join [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (p : ℕ) (U : Finset B) :
    entry (glue G H true) true p U = min p (entry G true p U + entry H true p U) := by
  simpa using entry_glue G H true true p U

/-- Complete interior joins take the maximum of eligible independence contributions. -/
public theorem indep_entry_join [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (q : ℕ) (U : Finset B) :
    entry (glue G H true) false q U = max (entry G false q U) (entry H false q U) := by
  simpa using entry_glue G H true false q U

/-- Anticomplete interior joins take the maximum of eligible clique contributions. -/
public theorem clique_entry_antijoin [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (p : ℕ) (U : Finset B) :
    entry (glue G H false) true p U = max (entry G true p U) (entry H true p U) := by
  simpa using entry_glue G H false true p U

/-- Anticomplete interior joins add capped eligible independence contributions. -/
public theorem indep_entry_antijoin [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (q : ℕ) (U : Finset B) :
    entry (glue G H false) false q U = min q (entry G false q U + entry H false q U) := by
  simpa using entry_glue G H false false q U

/-- Compatible uniform gluing preserves equal profiles across unrelated interior types. -/
public theorem glue_congr {X' Y' : Type*} [Fintype X] [Fintype Y]
    [Fintype X'] [Fintype Y'] {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    {G' : SimpleGraph (B ⊕ X')} {H' : SimpleGraph (B ⊕ Y')} {p q : ℕ}
    (hG : profile G p q = profile G' p q) (hH : profile H p q = profile H' p q)
    (compatible : boundaryGraph G = boundaryGraph H) (ε : Bool) :
    profile (glue G H ε) p q = profile (glue G' H' ε) p q := by
  obtain ⟨hbG, hcG, hiG⟩ := (profile_eq_iff G G').1 hG
  obtain ⟨_, hcH, hiH⟩ := (profile_eq_iff H H').1 hH
  apply profile_ext
  · simpa only [boundaryGraph, glue_boundary] using hbG
  · intro U hU
    have hu : Homogeneous (boundaryGraph G) true U := hU
    have hv : Homogeneous (boundaryGraph H) true U := compatible ▸ hu
    simp only [entry_glue, hcG U hu, hcH U hv]
  · intro U hU
    have hu : Homogeneous (boundaryGraph G) false U := hU
    have hv : Homogeneous (boundaryGraph H) false U := compatible ▸ hu
    simp only [entry_glue, hiG U hu, hiH U hv]

open scoped Classical

/-- A matching-colour join computes the capped whole maximum with boundary counted once. -/
public theorem capped_homogeneousNumber_glue_matching [Fintype B] [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (k : Bool) (t : ℕ) :
    min t (homogeneousNumber (glue G H k) k) =
      Finset.univ.sup (fun U : {U : Finset B // Homogeneous (boundaryGraph G) k U} ↦
        min t (U.val.card + entry G k t U.val + entry H k t U.val)) := by
  classical
  rw [capped_homogeneousNumber]
  apply Finset.sup_congr
  · ext U
    exact iff_of_true (Finset.mem_univ U)
      (Finset.mem_univ (⟨U.val, U.property⟩ :
        {U : Finset B // Homogeneous (boundaryGraph G) k U}))
  · intro U _
    simp only [entry_glue, ite_true, cap_add, Nat.add_assoc]

/-- The capped clique number of a complete interior join counts the shared clique once. -/
public theorem capped_cliqueNumber_join [Fintype B] [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (p : ℕ) :
    min p (homogeneousNumber (glue G H true) true) =
      Finset.univ.sup (fun U : {U : Finset B // Homogeneous (boundaryGraph G) true U} ↦
        min p (U.val.card + entry G true p U.val + entry H true p U.val)) :=
  capped_homogeneousNumber_glue_matching G H true p

/-- The capped independence number of an anticomplete join counts the shared set once. -/
public theorem capped_indepNumber_antijoin [Fintype B] [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y)) (q : ℕ) :
    min q (homogeneousNumber (glue G H false) false) =
      Finset.univ.sup (fun U : {U : Finset B // Homogeneous (boundaryGraph G) false U} ↦
        min q (U.val.card + entry G false q U.val + entry H false q U.val)) :=
  capped_homogeneousNumber_glue_matching G H false q

end Ramsey.Boundary
