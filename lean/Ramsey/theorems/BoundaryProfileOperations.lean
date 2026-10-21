module

public import Ramsey.defs.BoundaryProfileOperations
public import Ramsey.theorems.BoundaryProfiles
public import Mathlib.Data.Finset.Option

/-!
# Exact finite boundary profile operations

Concrete vertex transports and eligible-set witnesses prove the exact unary table formulas.
The results apply to both homogeneous colours and to every natural threshold.
-/


attribute [local instance] Classical.propDecidable
namespace Ramsey.Boundary

variable {B C X Y V Z : Type*} {p q t : ℕ}

/-- Homogeneity commutes with an injective vertex transport. -/
private lemma homogeneous_comap_image [DecidableEq V] (G : SimpleGraph V) (k : Bool)
    (f : Z → V)
    (hf : Function.Injective f) (U : Finset Z) :
    Homogeneous (G.comap f) k U ↔ Homogeneous G k (U.image f) := by
  classical
  constructor
  · intro h a ha b hb hab
    obtain ⟨a', ha', rfl⟩ := Finset.mem_image.mp ha
    obtain ⟨b', hb', rfl⟩ := Finset.mem_image.mp hb
    exact (colourAdj_comap G k f hf a' b').mp
      (h a' ha' b' hb' (fun he ↦ hab (he ▸ rfl)))
  · intro h a ha b hb hab
    exact (colourAdj_comap G k f hf a b).mpr
      (h _ (Finset.mem_image.mpr ⟨a, ha, rfl⟩) _
        (Finset.mem_image.mpr ⟨b, hb, rfl⟩) (hf.ne hab))

/-- Eligible sets commute with injective boundary and interior transports. -/
private lemma eligible_comap_image (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (f : C → B) (g : Y → X) (hf : Function.Injective f) (hg : Function.Injective g)
    (U : Finset C) (W : Finset Y) :
    Eligible (G.comap (Sum.map f g)) k U W ↔
      Eligible G k (U.image f) (W.image g) := by
  classical
  have hs : Function.Injective (Sum.map f g) := Sum.map_injective.mpr ⟨hf, hg⟩
  have hh : Homogeneous ((G.comap (Sum.map f g)).comap Sum.inr) k W ↔
      Homogeneous (G.comap Sum.inr) k (W.image g) :=
    homogeneous_comap_image (G.comap Sum.inr) k g hg W
  constructor
  · rintro ⟨hW, hc⟩
    refine ⟨hh.mp hW, ?_⟩
    intro u hu x hx
    obtain ⟨u', hu', rfl⟩ := Finset.mem_image.mp hu
    obtain ⟨x', hx', rfl⟩ := Finset.mem_image.mp hx
    exact (colourAdj_comap G k _ hs _ _).mp (hc u' hu' x' hx')
  · rintro ⟨hW, hc⟩
    refine ⟨hh.mpr hW, ?_⟩
    intro u hu x hx
    exact (colourAdj_comap G k _ hs _ _).mpr
      (hc _ (Finset.mem_image.mpr ⟨u, hu, rfl⟩) _
        (Finset.mem_image.mpr ⟨x, hx, rfl⟩))

/-- An interior bijection preserves maxima after the indicated boundary transport. -/
private lemma rawEntry_comap_equiv [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (k : Bool) (f : C → B) (hf : Function.Injective f)
    (g : Y ≃ X) (U : Finset C) :
    rawEntry (G.comap (Sum.map f g)) k U = rawEntry G k (U.image f) := by
  classical
  apply le_antisymm
  · apply rawEntry_le
    intro W hW
    have h := le_rawEntry ((eligible_comap_image G k f g hf g.injective U W).mp hW)
    simpa [Finset.card_image_of_injective _ g.injective] using h
  · obtain ⟨W, hW, he⟩ := exists_rawEntry G k (U.image f)
    have hw : (W.image g.symm).image g = W := by
      ext x
      simp
    have h := le_rawEntry ((eligible_comap_image G k f g hf g.injective U
      (W.image g.symm)).mpr (by simpa only [hw] using hW))
    simpa [Finset.card_image_of_injective _ g.symm.injective, he] using h

/-- Fixed boundary relabelling transports every table argument by the inverse bijection. -/
public theorem relabel_entry [Fintype X] (G : SimpleGraph (B ⊕ X)) (e : B ≃ C)
    (k : Bool) (t : ℕ) (U : Finset C) :
    entry (relabel G e) k t U = entry G k t (U.image e.symm) := by
  unfold entry
  congr 1
  exact rawEntry_comap_equiv G k e.symm e.symm.injective (Equiv.refl X) U

/-- Interior renaming leaves every table entry literally unchanged. -/
public theorem relabelInterior_entry [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (e : X ≃ Y) (k : Bool) (t : ℕ) (U : Finset B) :
    entry (relabelInterior G e) k t U = entry G k t U := by
  unfold entry
  congr 1
  simpa [relabelInterior, Equiv.sumCongr, Equiv.refl, Sum.map] using
    rawEntry_comap_equiv G k id Function.injective_id e.symm U

/-- Boundary relabelling has exactly the induced transported boundary graph. -/
public lemma relabel_boundary (G : SimpleGraph (B ⊕ X)) (e : B ≃ C) :
    boundaryGraph (relabel G e) = (boundaryGraph G).comap e.symm := rfl

/-- Interior renaming preserves the full finite profile. -/
public theorem relabelInterior_profile [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (e : X ≃ Y) (p q : ℕ) :
    profile (relabelInterior G e) p q = profile G p q := by
  apply profile_ext (G := relabelInterior G e) (F := G) rfl
  · intro U _
    exact relabelInterior_entry G e true p U
  · intro U _
    exact relabelInterior_entry G e false q U

/-- Fixed boundary relabelling preserves equality of profiles with unrelated interiors. -/
public theorem relabel_congr [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (h : profile G p q = profile F p q) (e : B ≃ C) :
    profile (relabel G e) p q = profile (relabel F e) p q := by
  obtain ⟨hb, hc, hi⟩ := (profile_eq_iff G F).mp h
  apply profile_ext
  · simp only [relabel_boundary, hb]
  · intro U hU
    rw [relabel_entry, relabel_entry]
    apply hc
    exact (homogeneous_comap_image _ _ _ e.symm.injective U).mp hU
  · intro U hU
    rw [relabel_entry, relabel_entry]
    apply hi
    exact (homogeneous_comap_image _ _ _ e.symm.injective U).mp hU

/-- The fresh boundary vertex sees an interior vertex in exactly the uniform colour. -/
private lemma introduce_colour_new (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (x : X) :
    colourAdj (introduce G S ε) k (.inl none) (.inr x) ↔ ε = k := by
  cases k <;> cases ε <;> simp [colourAdj, introduce]

/-- Old vertices retain all their selected-colour incidences after introduction. -/
private lemma introduce_colour_old (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (v w : B ⊕ X) :
    colourAdj (introduce G S ε) k (Sum.map some id v) (Sum.map some id w) ↔
      colourAdj G k v w := by
  cases k <;> cases v <;> cases w <;> simp [colourAdj, introduce]

/-- Introduction adds precisely one possible uniform eligibility restriction. -/
private lemma eligible_introduce (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (U : Finset (Option B)) (W : Finset X) :
    Eligible (introduce G S ε) k U W ↔
      Eligible G k U.eraseNone W ∧ (none ∈ U → ∀ x ∈ W, ε = k) := by
  have hh : Homogeneous ((introduce G S ε).comap Sum.inr) k W ↔
      Homogeneous (G.comap Sum.inr) k W := by
    cases k <;> rfl
  constructor
  · rintro ⟨hW, hc⟩
    refine ⟨⟨hh.mp hW, ?_⟩, ?_⟩
    · intro b hb x hx
      exact (introduce_colour_old G S ε k (.inl b) (.inr x)).mp
        (hc (some b) (Finset.mem_eraseNone.mp hb) x hx)
    · intro hn x hx
      exact (introduce_colour_new G S ε k x).mp (hc none hn x hx)
  · rintro ⟨⟨hW, hc⟩, hn⟩
    refine ⟨hh.mpr hW, ?_⟩
    intro b hb x hx
    cases b with
    | none => exact (introduce_colour_new G S ε k x).mpr (hn hb x hx)
    | some b =>
      exact (introduce_colour_old G S ε k (.inl b) (.inr x)).mpr
        (hc b (Finset.mem_eraseNone.mpr hb) x hx)

/-- Uniform introduction preserves old entries or excludes all eligible interior vertices. -/
public theorem introduce_entry [Fintype X] (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (t : ℕ) (U : Finset (Option B)) :
    entry (introduce G S ε) k t U =
      if none ∈ U ∧ ε ≠ k then 0 else entry G k t U.eraseNone := by
  classical
  by_cases h : none ∈ U ∧ ε ≠ k
  · rw [ite_eq_left h]
    have hr : rawEntry (introduce G S ε) k U = 0 := by
      apply le_antisymm _ (Nat.zero_le _)
      apply rawEntry_le
      intro W hW
      have he : W = ∅ := Finset.eq_empty_iff_forall_notMem.mpr
        (fun x hx ↦ h.2 (((eligible_introduce G S ε k U W).mp hW).2 h.1 x hx))
      simp [he]
    simp [entry, hr]
  · rw [ite_eq_right h]
    have he : ∀ W, Eligible (introduce G S ε) k U W ↔ Eligible G k U.eraseNone W := by
      intro W
      rw [eligible_introduce]
      simp only [and_iff_left_iff_imp]
      intro _ hn _ _
      exact Classical.not_not.mp (fun hne ↦ h ⟨hn, hne⟩)
    unfold entry rawEntry
    congr 2
    funext W
    exact propext (he W)

/-- A homogeneous extended boundary set has a homogeneous old part. -/
private lemma introduce_homogeneous_eraseNone (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (U : Finset (Option B))
    (h : Homogeneous (boundaryGraph (introduce G S ε)) k U) :
    Homogeneous (boundaryGraph G) k U.eraseNone := by
  intro a ha b hb hab
  have hc := h (some a) (Finset.mem_eraseNone.mp ha) (some b)
    (Finset.mem_eraseNone.mp hb) (by simpa using hab)
  cases k <;> simpa [colourAdj, boundaryGraph, introduce] using hc

/-- Uniform introduction depends on the old exact boundary graph only. -/
private lemma introduce_boundary_congr {G : SimpleGraph (B ⊕ X)}
    {F : SimpleGraph (B ⊕ Y)} (h : boundaryGraph G = boundaryGraph F)
    (S : Set B) (ε : Bool) :
    boundaryGraph (introduce G S ε) = boundaryGraph (introduce F S ε) := by
  ext a b
  have hh (a b : B) : G.Adj (.inl a) (.inl b) ↔ F.Adj (.inl a) (.inl b) := by
    change (boundaryGraph G).Adj a b ↔ (boundaryGraph F).Adj a b
    rw [h]
  cases a <;> cases b <;> simp [boundaryGraph, introduce, hh]

/-- Uniform introduction is a congruence for finite profiles, without an order hypothesis. -/
public theorem introduce_congr [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (h : profile G p q = profile F p q) (S : Set B) (ε : Bool) :
    profile (introduce G S ε) p q = profile (introduce F S ε) p q := by
  obtain ⟨hb, hc, hi⟩ := (profile_eq_iff G F).mp h
  apply profile_ext (introduce_boundary_congr hb S ε)
  · intro U hU
    simp only [introduce_entry]
    split_ifs <;> first | rfl | exact hc _ (introduce_homogeneous_eraseNone G S ε _ U hU)
  · intro U hU
    simp only [introduce_entry]
    split_ifs <;> first | rfl | exact hi _ (introduce_homogeneous_eraseNone G S ε _ U hU)

/-- Inserting a fresh vertex adds exactly its selected-colour incidences. -/
private lemma homogeneous_insert_iff [DecidableEq V] (G : SimpleGraph V) (k : Bool) (v : V)
    (W : Finset V) (hv : v ∉ W) :
    Homogeneous G k (insert v W) ↔
      Homogeneous G k W ∧ ∀ w ∈ W, colourAdj G k v w := by
  constructor
  · intro h
    refine ⟨h.mono (Finset.subset_insert _ _), ?_⟩
    intro w hw
    exact h v (Finset.mem_insert_self _ _) w (Finset.mem_insert_of_mem hw)
      (fun he ↦ hv (he ▸ hw))
  · rintro ⟨hW, hc⟩ a ha b hb hab
    rcases Finset.mem_insert.mp ha with rfl | ha'
    · rcases Finset.mem_insert.mp hb with rfl | hb'
      · exact (hab rfl).elim
      · exact hc b hb'
    · rcases Finset.mem_insert.mp hb with rfl | hb'
      · exact colourAdj_symm G k (hc a ha')
      · exact hW a ha' b hb' hab

/-- The forgotten label is absent from the image of the retained boundary. -/
private lemma forget_not_mem (b : B) (U : Finset {a : B // a ≠ b}) :
    b ∉ U.image Subtype.val := by
  simp only [Finset.mem_image]
  rintro ⟨a, _, he⟩
  exact a.property he

/-- Forgetting retains the exact induced boundary graph. -/
public lemma forget_boundary (G : SimpleGraph (B ⊕ X)) (b : B) :
    boundaryGraph (forget G b) = (boundaryGraph G).comap Subtype.val := rfl

/-- A forgotten interior set avoiding the moved vertex is exactly an old eligible set. -/
private lemma eligible_forget_some (G : SimpleGraph (B ⊕ X)) (b : B) (k : Bool)
    (U : Finset {a : B // a ≠ b}) (W : Finset X) :
    Eligible (forget G b) k U (W.image some) ↔
      Eligible G k (U.image Subtype.val) W := by
  have hh : Homogeneous ((forget G b).comap Sum.inr) k (W.image some) ↔
      Homogeneous (G.comap Sum.inr) k W := by
    exact (homogeneous_comap_image ((forget G b).comap Sum.inr) k some
      (Option.some_injective X) W).symm
  constructor
  · rintro ⟨hW, hc⟩
    refine ⟨hh.mp hW, ?_⟩
    intro a ha x hx
    obtain ⟨a', ha', rfl⟩ := Finset.mem_image.mp ha
    have h := hc a' ha' (some x) (Finset.mem_image.mpr ⟨x, hx, rfl⟩)
    exact (colourAdj_comap G k _ (forgetEquiv b).injective _ _).mp h
  · rintro ⟨hW, hc⟩
    refine ⟨hh.mpr hW, ?_⟩
    intro a ha x hx
    obtain ⟨x', hx', rfl⟩ := Finset.mem_image.mp hx
    apply (colourAdj_comap G k _ (forgetEquiv b).injective _ _).mpr
    exact hc a.val (Finset.mem_image.mpr ⟨a, ha, rfl⟩) x' hx'

/-- Including the moved vertex is possible exactly for its homogeneous extended boundary. -/
private lemma eligible_forget_insert (G : SimpleGraph (B ⊕ X)) (b : B) (k : Bool)
    (U : Finset {a : B // a ≠ b})
    (hU : Homogeneous (boundaryGraph G) k (U.image Subtype.val)) (W : Finset X) :
    Eligible (forget G b) k U (insert none (W.image some)) ↔
      Homogeneous (boundaryGraph G) k (insert b (U.image Subtype.val)) ∧
        Eligible G k (insert b (U.image Subtype.val)) W := by
  rw [homogeneous_insert_iff _ _ _ _ (forget_not_mem b U)]
  have hh : Homogeneous ((forget G b).comap Sum.inr) k (insert none (W.image some)) ↔
      Homogeneous (G.comap Sum.inr) k W ∧
        ∀ x ∈ W, colourAdj G k (.inl b) (.inr x) := by
    apply (homogeneous_insert_iff ((forget G b).comap Sum.inr) k none
      (W.image some) (by simp)).trans
    constructor
    · rintro ⟨hW, hc⟩
      have hhom := (eligible_forget_some G b k ∅ W)
      refine ⟨?_, ?_⟩
      · simpa [Eligible] using hhom.mp ⟨hW, by simp⟩
      · intro x hx
        have h := hc (some x) (Finset.mem_image.mpr ⟨x, hx, rfl⟩)
        cases k <;> simpa [colourAdj, forget, forgetEquiv] using h
    · rintro ⟨hW, hc⟩
      refine ⟨?_, ?_⟩
      · have hhom := (eligible_forget_some G b k ∅ W)
        exact (hhom.mpr (by simpa [Eligible] using hW)).1
      · intro x hx
        obtain ⟨x', hx', rfl⟩ := Finset.mem_image.mp hx
        have h := hc x' hx'
        cases k <;> simpa [colourAdj, forget, forgetEquiv] using h
  constructor
  · rintro ⟨hW, hc⟩
    obtain ⟨hW, hbx⟩ := hh.mp hW
    refine ⟨⟨hU, ?_⟩, ⟨hW, ?_⟩⟩
    · intro a ha
      obtain ⟨a', ha', rfl⟩ := Finset.mem_image.mp ha
      have h := hc a' ha' none (Finset.mem_insert_self _ _)
      have h' := (colourAdj_comap G k _ (forgetEquiv b).injective _ _).mp h
      exact colourAdj_symm (boundaryGraph G) k
        (by simpa [colourAdj, boundaryGraph, forgetEquiv, a'.property] using h')
    · intro a ha x hx
      rcases Finset.mem_insert.mp ha with rfl | ha
      · exact hbx x hx
      · obtain ⟨a', ha', rfl⟩ := Finset.mem_image.mp ha
        have h := hc a' ha' (some x)
          (Finset.mem_insert_of_mem (Finset.mem_image.mpr ⟨x, hx, rfl⟩))
        exact (colourAdj_comap G k _ (forgetEquiv b).injective _ _).mp h
  · rintro ⟨⟨_, hbu⟩, ⟨hW, hc⟩⟩
    refine ⟨hh.mpr ⟨hW, fun x hx ↦ hc b (Finset.mem_insert_self _ _) x hx⟩, ?_⟩
    intro a ha x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · apply (colourAdj_comap G k _ (forgetEquiv b).injective _ _).mpr
      have h := colourAdj_symm (boundaryGraph G) k
        (hbu a.val (Finset.mem_image.mpr ⟨a, ha, rfl⟩))
      simpa [colourAdj, boundaryGraph, forgetEquiv, a.property] using h
    · obtain ⟨x', hx', rfl⟩ := Finset.mem_image.mp hx
      apply (colourAdj_comap G k _ (forgetEquiv b).injective _ _).mpr
      exact hc a.val (Finset.mem_insert_of_mem (Finset.mem_image.mpr ⟨a, ha, rfl⟩)) x' hx'

/-- Forgetting partitions every eligible set by whether it contains the moved boundary vertex. -/
public theorem forget_rawEntry [Fintype X] (G : SimpleGraph (B ⊕ X)) (b : B)
    (k : Bool) (U : Finset {a : B // a ≠ b})
    (hU : Homogeneous (boundaryGraph (forget G b)) k U) :
    rawEntry (forget G b) k U =
      if Homogeneous (boundaryGraph G) k (insert b (U.image Subtype.val)) then
        max (rawEntry G k (U.image Subtype.val))
          (1 + rawEntry G k (insert b (U.image Subtype.val)))
      else rawEntry G k (U.image Subtype.val) := by
  classical
  have hOld : Homogeneous (boundaryGraph G) k (U.image Subtype.val) :=
    (homogeneous_comap_image (boundaryGraph G) k Subtype.val Subtype.val_injective U).mp hU
  apply le_antisymm
  · apply rawEntry_le
    intro W hW
    by_cases hn : none ∈ W
    · have hr : insert none (W.eraseNone.image some) = W := by
        rw [Finset.image_some_eraseNone, Finset.insert_erase hn]
      have he := (eligible_forget_insert G b k U hOld W.eraseNone).mp
        (by simpa only [hr] using hW)
      have hl := le_rawEntry he.2
      have hc := Finset.card_eraseNone_of_mem hn
      have hp : 0 < W.card := Finset.card_pos.mpr ⟨none, hn⟩
      rw [ite_eq_left he.1]
      exact le_trans (by omega) (le_max_right _ _)
    · have hr : W.eraseNone.image some = W := by
        rw [Finset.image_some_eraseNone, Finset.erase_eq_of_notMem hn]
      have he := (eligible_forget_some G b k U W.eraseNone).mp
        (by simpa only [hr] using hW)
      have hl := le_rawEntry he
      have hc := Finset.card_eraseNone_of_notMem hn
      split_ifs
      · exact le_trans (by omega) (le_max_left _ _)
      · omega
  · have hbase : rawEntry G k (U.image Subtype.val) ≤ rawEntry (forget G b) k U := by
      obtain ⟨W, hW, he⟩ := exists_rawEntry G k (U.image Subtype.val)
      have hl := le_rawEntry ((eligible_forget_some G b k U W).mpr hW)
      simpa [Finset.card_image_of_injective _ (Option.some_injective X), he] using hl
    split_ifs with hH
    · apply max_le hbase
      obtain ⟨W, hW, he⟩ := exists_rawEntry G k (insert b (U.image Subtype.val))
      have hl := le_rawEntry ((eligible_forget_insert G b k U hOld W).mpr ⟨hH, hW⟩)
      simpa [Finset.card_image_of_injective _ (Option.some_injective X), he, Nat.add_comm]
        using hl
    · exact hbase

/-- The exact capped forget formula omits the second candidate when its boundary is invalid. -/
public theorem forget_entry [Fintype X] (G : SimpleGraph (B ⊕ X)) (b : B)
    (k : Bool) (t : ℕ) (U : Finset {a : B // a ≠ b})
    (hU : Homogeneous (boundaryGraph (forget G b)) k U) :
    entry (forget G b) k t U =
      if Homogeneous (boundaryGraph G) k (insert b (U.image Subtype.val)) then
        max (entry G k t (U.image Subtype.val))
          (min t (1 + entry G k t (insert b (U.image Subtype.val))))
      else entry G k t (U.image Subtype.val) := by
  unfold entry
  rw [forget_rawEntry G b k U hU]
  split_ifs <;> simp only [cap_max, cap_add]

/-- Forgetting is a congruence for finite profiles with arbitrary finite interior types. -/
public theorem forget_congr [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {F : SimpleGraph (B ⊕ Y)}
    (h : profile G p q = profile F p q) (b : B) :
    profile (forget G b) p q = profile (forget F b) p q := by
  obtain ⟨hb, hc, hi⟩ := (profile_eq_iff G F).mp h
  have hbf : boundaryGraph (forget G b) = boundaryGraph (forget F b) := by
    simp only [forget_boundary, hb]
  apply profile_ext hbf
  · intro U hU
    rw [forget_entry G b true p U hU, forget_entry F b true p U (hbf ▸ hU)]
    have hOld := (homogeneous_comap_image (boundaryGraph G) true Subtype.val
      Subtype.val_injective U).mp hU
    simp only [← hb]
    split_ifs with hH
    · rw [hc _ hOld, hc _ hH]
    · exact hc _ hOld
  · intro U hU
    rw [forget_entry G b false q U hU, forget_entry F b false q U (hbf ▸ hU)]
    have hOld := (homogeneous_comap_image (boundaryGraph G) false Subtype.val
      Subtype.val_injective U).mp hU
    simp only [← hb]
    split_ifs with hH
    · rw [hi _ hOld, hi _ hH]
    · exact hi _ hOld

/-- Relabelling the image of an old boundary argument leaves its entry unchanged. -/
public theorem relabel_entry_image [Fintype X] (G : SimpleGraph (B ⊕ X)) (e : B ≃ C)
    (k : Bool) (t : ℕ) (U : Finset B) :
    entry (relabel G e) k t (U.image e) = entry G k t U := by
  rw [relabel_entry]
  have he : (U.image e).image e.symm = U := by
    ext b
    simp
  rw [he]

/-- Entries avoiding the introduced boundary vertex are unchanged. -/
public theorem introduce_entry_old [Fintype X] (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (t : ℕ) (U : Finset B) :
    entry (introduce G S ε) k t (U.image some) = entry G k t U := by
  rw [introduce_entry]
  simp

/-- Entries containing the fresh boundary vertex have no added interior contribution. -/
public theorem introduce_entry_fresh [Fintype X] (G : SimpleGraph (B ⊕ X)) (S : Set B)
    (ε k : Bool) (t : ℕ) (U : Finset B) :
    entry (introduce G S ε) k t (insert none (U.image some)) =
      if ε = k then entry G k t U else 0 := by
  have he : (insert none (U.image some)).eraseNone = U := by
    ext b
    simp
  rw [introduce_entry]
  by_cases h : ε = k <;> simp [h, he]

/-- Forgetting always makes the moved singleton available to the empty boundary argument. -/
public theorem forget_entry_empty [Fintype X] (G : SimpleGraph (B ⊕ X)) (b : B)
    (k : Bool) (t : ℕ) :
    entry (forget G b) k t ∅ =
      max (entry G k t ∅) (min t (1 + entry G k t {b})) := by
  rw [forget_entry G b k t ∅ (homogeneous_empty _ _)]
  simp

/-- Threshold 1 detects the newly internal singleton even when the old interior is empty. -/
public theorem forget_entry_empty_one [Fintype X] (G : SimpleGraph (B ⊕ X)) (b : B)
    (k : Bool) : entry (forget G b) k 1 ∅ = 1 := by
  rw [forget_entry_empty]
  have h := entry_le G k 1 ∅
  omega

/-- Forgetting preserves the number of vertices because its vertex map is a bijection. -/
public theorem forget_order [Fintype B] [Fintype X] (b : B) :
    Fintype.card ({a : B // a ≠ b} ⊕ Option X) = Fintype.card (B ⊕ X) :=
  Fintype.card_congr (forgetEquiv b)

/-- Uniform introduction adds precisely 1 vertex and leaves the interior unchanged. -/
public theorem introduce_order [Fintype B] [Fintype X] :
    Fintype.card (Option B ⊕ X) = Fintype.card (B ⊕ X) + 1 := by
  simp only [Fintype.card_sum, Fintype.card_option]
  omega

/-- Fixed boundary relabelling preserves the number of vertices. -/
public theorem relabel_order [Fintype B] [Fintype C] [Fintype X] (e : B ≃ C) :
    Fintype.card (C ⊕ X) = Fintype.card (B ⊕ X) :=
  Fintype.card_congr (Equiv.sumCongr e.symm (Equiv.refl X))

/-- Equal input orders remain equal after forgetting the same boundary label. -/
public theorem forget_order_congr [Fintype B] [Fintype X] [Fintype Y]
    (h : Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y)) (b : B) :
    Fintype.card ({a : B // a ≠ b} ⊕ Option X) =
      Fintype.card ({a : B // a ≠ b} ⊕ Option Y) := by
  rw [forget_order b, forget_order b, h]

/-- Equal input orders remain equal after the same uniform introduction. -/
public theorem introduce_order_congr [Fintype B] [Fintype X] [Fintype Y]
    (h : Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y)) :
    Fintype.card (Option B ⊕ X) = Fintype.card (Option B ⊕ Y) := by
  rw [introduce_order, introduce_order, h]

/-- Equal input orders remain equal after the same fixed boundary relabelling. -/
public theorem relabel_order_congr [Fintype B] [Fintype C] [Fintype X] [Fintype Y]
    (h : Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y)) (e : B ≃ C) :
    Fintype.card (C ⊕ X) = Fintype.card (C ⊕ Y) := by
  rw [relabel_order e, relabel_order e, h]

end Ramsey.Boundary
