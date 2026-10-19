module

public import Ramsey.d18.k1.Frame
import Ramsey.theorems.PivotInterface

/-!
# Exact cross-core completion

The 8 negative and 3 positive rectangle families describe every remaining forbidden 5-set.
-/

namespace Ramsey.d18.k1
set_option maxHeartbeats 1600000
set_option autoImplicit false

variable {G : SimpleGraph (Fin 43)}

/-- The 8 possible core and common-cell counts of a mixed 5-clique. -/
@[expose] public def CliqueCountType (a b c : ℕ) : Prop :=
  (a = 3 ∧ b = 2 ∧ c = 0) ∨ (a = 2 ∧ b = 3 ∧ c = 0) ∨
  (a = 3 ∧ b = 1 ∧ c = 1) ∨ (a = 2 ∧ b = 2 ∧ c = 1) ∨
  (a = 1 ∧ b = 3 ∧ c = 1) ∨ (a = 2 ∧ b = 1 ∧ c = 2) ∨
  (a = 1 ∧ b = 2 ∧ c = 2) ∨ (a = 1 ∧ b = 1 ∧ c = 3)

/-- The 3 possible core and common-cell counts of a mixed independent 5-set. -/
@[expose] public def IndepCountType (a b c : ℕ) : Prop :=
  (a = 3 ∧ b = 2 ∧ c = 0) ∨ (a = 2 ∧ b = 3 ∧ c = 0) ∨
  (a = 2 ∧ b = 2 ∧ c = 1)

/-- The fixed edges of a mixed selection are complete, excluding its cross-core rectangle. -/
@[expose] public def MixedBase (H : SimpleGraph (Fin 43)) (P Q R : Finset (Fin 43)) : Prop :=
  H.IsClique (P : Set _) ∧ H.IsClique (Q : Set _) ∧ H.IsClique (R : Set _) ∧
  (∀ p ∈ P, ∀ r ∈ R, H.Adj p r) ∧ (∀ q ∈ Q, ∀ r ∈ R, H.Adj q r)

/-- Every eligible selection of a listed type has a missing cross-core edge. -/
@[expose] public def MixedCompatible (F : Frame G) (H : SimpleGraph (Fin 43))
    (types : ℕ → ℕ → ℕ → Prop) : Prop :=
  ∀ P Q R : Finset (Fin 43), (P : Set _) ⊆ F.C → (Q : Set _) ⊆ F.D →
    (R : Set _) ⊆ F.T → types P.card Q.card R.card → MixedBase H P Q R →
    ¬(∀ p ∈ P, ∀ q ∈ Q, H.Adj p q)

/-- Negative rectangle clauses for exactly the 8 mixed clique types. -/
@[expose] public def CliqueCompatible (F : Frame G) : Prop :=
  MixedCompatible F G CliqueCountType

/-- Positive rectangle clauses for exactly the 3 mixed independent types. -/
@[expose] public def IndepCompatible (F : Frame G) : Prop :=
  MixedCompatible F Gᶜ IndepCountType

/-- A clique inside a clique-free cell has strictly smaller cardinality. -/
private lemma card_lt_of_free {H : SimpleGraph (Fin 43)} {A : Set (Fin 43)} {n : ℕ}
    (h : H.CliqueFreeOn A n) {s : Finset (Fin 43)} (hs : (s : Set _) ⊆ A)
    (hc : H.IsClique (s : Set _)) : s.card < n := by
  by_contra! hn
  exact SimpleGraph.CliqueFreeOn.mono H hn h hs ⟨hc, rfl⟩

/-- Disjoint selections form a clique exactly when the missing rectangle is complete. -/
private lemma mixed_clique (F : Frame G) (H : SimpleGraph (Fin 43))
    {P Q R : Finset (Fin 43)} (_hP : (P : Set _) ⊆ F.C)
    (_hQ : (Q : Set _) ⊆ F.D) (_hR : (R : Set _) ⊆ F.T)
    (hb : MixedBase H P Q R) (hx : ∀ p ∈ P, ∀ q ∈ Q, H.Adj p q) :
    H.IsClique ((P ∪ Q ∪ R : Finset _) : Set _) := by
  intro x hx' y hy hxy
  rcases Finset.mem_union.mp hx' with hx' | hx' <;>
    rcases Finset.mem_union.mp hy with hy | hy
  · rcases Finset.mem_union.mp hx' with hx' | hx' <;>
      rcases Finset.mem_union.mp hy with hy | hy
    · exact hb.1 hx' hy hxy
    · exact hx x hx' y hy
    · exact (hx y hy x hx').symm
    · exact hb.2.1 hx' hy hxy
  · rcases Finset.mem_union.mp hx' with hx' | hx'
    · exact hb.2.2.2.1 x hx' y hy
    · exact hb.2.2.2.2 x hx' y hy
  · rcases Finset.mem_union.mp hy with hy | hy
    · exact (hb.2.2.2.1 y hy x hx').symm
    · exact (hb.2.2.2.2 y hy x hx').symm
  · exact hb.2.2.1 hx' hy hxy

/-- The 3 cell cardinalities add without overlap. -/
private lemma mixed_card (F : Frame G) {P Q R : Finset (Fin 43)}
    (hP : (P : Set _) ⊆ F.C) (hQ : (Q : Set _) ⊆ F.D)
    (hR : (R : Set _) ⊆ F.T) :
    (P ∪ Q ∪ R).card = P.card + Q.card + R.card := by
  have hd : Disjoint P Q := Finset.disjoint_left.mpr fun _ hp hq ↦
    Set.disjoint_left.mp F.disjoint_CD (hP hp) (hQ hq)
  have he : Disjoint (P ∪ Q) R := by
    apply Finset.disjoint_left.mpr
    intro x hx hr
    rcases Finset.mem_union.mp hx with hp | hq
    · exact Set.disjoint_left.mp F.disjoint_CT (hP hp) (hR hr)
    · exact Set.disjoint_left.mp F.disjoint_DT (hQ hq) (hR hr)
  rw [Finset.card_union_of_disjoint he, Finset.card_union_of_disjoint hd]

/-- A globally clique-free graph satisfies every listed mixed rectangle clause. -/
private lemma compatible_of_free (F : Frame G) (H : SimpleGraph (Fin 43))
    (types : ℕ → ℕ → ℕ → Prop) (ht : ∀ a b c, types a b c → a + b + c = 5)
    (hf : H.CliqueFree 5) : MixedCompatible F H types := by
  intro P Q R hP hQ hR htype hb hx
  exact hf (P ∪ Q ∪ R) ⟨mixed_clique F H hP hQ hR hb hx,
    (mixed_card F hP hQ hR).trans (ht _ _ _ htype)⟩

/-- A rootless forbidden clique splits into the 3 cells and hence violates a rectangle. -/
private lemma free_of_compatible (F : Frame G) (H : SimpleGraph (Fin 43))
    (n : ℕ) (types : ℕ → ℕ → ℕ → Prop)
    (hc : H.CliqueFreeOn F.C 4) (hd : H.CliqueFreeOn F.D 4)
    (hct : H.CliqueFreeOn (F.C ∪ F.T) n)
    (hdt : H.CliqueFreeOn (F.D ∪ F.T) n)
    (classify : ∀ a b c, a + b + c = 5 → a < 4 → b < 4 →
      a + c < n → b + c < n → types a b c)
    (roots : ∀ s, H.IsNClique 5 s → F.v ∉ s ∧ F.u ∉ s)
    (compat : MixedCompatible F H types) : H.CliqueFree 5 := by
  classical
  intro s hs
  obtain ⟨hv, hu⟩ := roots s hs
  let P := s.filter (· ∈ F.C)
  let Q := s.filter (· ∈ F.D)
  let R := s.filter (· ∈ F.T)
  have hP : (P : Set _) ⊆ F.C := fun _ h ↦ (Finset.mem_filter.mp h).2
  have hQ : (Q : Set _) ⊆ F.D := fun _ h ↦ (Finset.mem_filter.mp h).2
  have hR : (R : Set _) ⊆ F.T := fun _ h ↦ (Finset.mem_filter.mp h).2
  have hPs : P ⊆ s := Finset.filter_subset _ _
  have hQs : Q ⊆ s := Finset.filter_subset _ _
  have hRs : R ⊆ s := Finset.filter_subset _ _
  have he : P ∪ Q ∪ R = s := by
    ext x
    simp only [Finset.mem_union, Finset.mem_filter, P, Q, R]
    have hh := F.cover x
    constructor
    · tauto
    · intro hx
      have hxv : x ≠ F.v := fun he ↦ hv (he ▸ hx)
      have hxu : x ≠ F.u := fun he ↦ hu (he ▸ hx)
      tauto
  have hsum : P.card + Q.card + R.card = 5 := by
    rw [← mixed_card F hP hQ hR, he, hs.card_eq]
  have hpc := hs.isClique.subset hPs
  have hqc := hs.isClique.subset hQs
  have hrc := hs.isClique.subset hRs
  have hpr : Disjoint P R := Finset.disjoint_left.mpr fun _ hp hr ↦
    Set.disjoint_left.mp F.disjoint_CT (hP hp) (hR hr)
  have hqr : Disjoint Q R := Finset.disjoint_left.mpr fun _ hq hr ↦
    Set.disjoint_left.mp F.disjoint_DT (hQ hq) (hR hr)
  have hpct : P.card + R.card < n := by
    rw [← Finset.card_union_of_disjoint hpr]
    exact card_lt_of_free hct (by
      intro x hx
      rcases Finset.mem_union.mp hx with h | h
      · exact Or.inl (hP h)
      · exact Or.inr (hR h))
      (hs.isClique.subset (Finset.union_subset hPs hRs))
  have hqdt : Q.card + R.card < n := by
    rw [← Finset.card_union_of_disjoint hqr]
    exact card_lt_of_free hdt (by
      intro x hx
      rcases Finset.mem_union.mp hx with h | h
      · exact Or.inl (hQ h)
      · exact Or.inr (hR h))
      (hs.isClique.subset (Finset.union_subset hQs hRs))
  apply compat P Q R hP hQ hR
    (classify _ _ _ hsum (card_lt_of_free hc hP hpc) (card_lt_of_free hd hQ hqc)
      hpct hqdt)
  · refine ⟨hpc, hqc, hrc, ?_, ?_⟩
    · intro p hp r hr
      exact hs.isClique (hPs hp) (hRs hr) (by
        intro he; subst r
        exact Set.disjoint_left.mp F.disjoint_CT (hP hp) (hR hr))
    · intro q hq r hr
      exact hs.isClique (hQs hq) (hRs hr) (by
        intro he; subst r
        exact Set.disjoint_left.mp F.disjoint_DT (hQ hq) (hR hr))
  · intro p hp q hq
    exact hs.isClique (hPs hp) (hQs hq) (by
      intro he; subst q
      exact Set.disjoint_left.mp F.disjoint_CD (hP hp) (hQ hq))

/-- A 5-clique cannot contain either root of an admissible frame. -/
private lemma clique_roots (F : Frame G) (hF : F.Admissible) :
    ∀ s, G.IsNClique 5 s → F.v ∉ s ∧ F.u ∉ s := by
  classical
  have one (v u : Fin 43) (C : Set (Fin 43)) (hadj : G.Adj v u)
      (hsep : ∀ x, ¬(G.Adj v x ∧ G.Adj u x))
      (hmem : ∀ x, x ∈ C ↔ G.Adj v x ∧ x ≠ u)
      (hfree : (G.induce C).CliqueFree 4) (s : Finset (Fin 43))
      (hs : G.IsNClique 5 s) : v ∉ s := by
    intro hv
    by_cases hu : u ∈ s
    · have hsub : s ⊆ {v, u} := by
        intro x hx
        by_cases hxv : x = v
        · simp [hxv]
        by_cases hxu : x = u
        · simp [hxu]
        exact (hsep x ⟨hs.isClique hv hx (Ne.symm hxv),
          hs.isClique hu hx (Ne.symm hxu)⟩).elim
      have hh := Finset.card_le_card hsub
      have hb : ({v, u} : Finset _).card ≤ 2 := by
        calc
          _ ≤ ({u} : Finset _).card + 1 := Finset.card_insert_le _ _
          _ = 2 := by simp
      rw [hs.card_eq] at hh
      omega
    · apply (SimpleGraph.cliqueFree_induce_iff G C 4).mp hfree
        (t := s.erase v)
      · intro x hx
        obtain ⟨hxv, hxs⟩ := Finset.mem_erase.mp hx
        exact (hmem x).mpr ⟨hs.isClique hv hxs hxv.symm,
          fun he ↦ hu (he ▸ hxs)⟩
      · exact ⟨hs.isClique.subset (Finset.erase_subset _ _), by
          simpa [hs.card_eq] using Finset.card_erase_of_mem hv⟩
  intro s hs
  exact ⟨one F.v F.u F.C F.adjacent F.separated F.mem_C hF.ramsey_C.1 s hs,
    one F.u F.v F.D F.adjacent.symm (fun x h ↦ F.separated x h.symm)
      F.mem_D hF.ramsey_D.1 s hs⟩

/-- An independent 5-set cannot contain either root of an admissible frame. -/
private lemma indep_roots (F : Frame G) (hF : F.Admissible) :
    ∀ s, Gᶜ.IsNClique 5 s → F.v ∉ s ∧ F.u ∉ s := by
  classical
  have one (v : Fin 43) (hf : (G.induce (antiNeighborSet G v)).IndepSetFree 4)
      (s : Finset (Fin 43)) (hs : Gᶜ.IsNClique 5 s) : v ∉ s := by
    intro hv
    have hh : Gᶜ.CliqueFreeOn (antiNeighborSet G v) 4 := by
      apply (SimpleGraph.cliqueFree_induce_iff _ _ _).mp
      rw [← compl_induce]
      exact (SimpleGraph.cliqueFree_compl _).mpr hf
    apply hh (t := s.erase v)
    · intro x hx
      obtain ⟨hxv, hxs⟩ := Finset.mem_erase.mp hx
      exact ⟨hxv, (hs.isClique hv hxs hxv.symm).2⟩
    · exact ⟨hs.isClique.subset (Finset.erase_subset _ _), by
        simpa [hs.card_eq] using Finset.card_erase_of_mem hv⟩
  intro s hs
  exact ⟨one F.v (by rw [F.anti_v]; exact hF.side_D.2) s hs,
    one F.u (by rw [F.anti_u]; exact hF.side_C.2) s hs⟩

/-- All forbidden 5-sets are excluded exactly by the 8 negative and 3 positive families. -/
public theorem ramsey_iff_compatible (F : Frame G) (hF : F.Admissible) :
    IsRamseyGraph 5 5 G ↔ CliqueCompatible F ∧ IndepCompatible F := by
  constructor
  · intro h
    exact ⟨compatible_of_free F G CliqueCountType (by
      intro a b c ht; simp only [CliqueCountType] at ht; omega) h.1,
      compatible_of_free F Gᶜ IndepCountType (by
      intro a b c ht; simp only [IndepCountType] at ht; omega)
        ((SimpleGraph.cliqueFree_compl G).mpr h.2)⟩
  · rintro ⟨hcl, hin⟩
    have core (A : Set (Fin 43)) (h : IsRamseyGraph 4 4 (G.induce A)) :
        Gᶜ.CliqueFreeOn A 4 := by
      apply (SimpleGraph.cliqueFree_induce_iff _ _ _).mp
      rw [← compl_induce]
      exact (SimpleGraph.cliqueFree_compl _).mpr h.2
    have side (A : Set (Fin 43)) (h : IsRamseyGraph 5 4 (G.induce A)) :
        Gᶜ.CliqueFreeOn A 4 := by
      apply (SimpleGraph.cliqueFree_induce_iff _ _ _).mp
      rw [← compl_induce]
      exact (SimpleGraph.cliqueFree_compl _).mpr h.2
    refine ⟨free_of_compatible F G 5 CliqueCountType
      ((SimpleGraph.cliqueFree_induce_iff _ _ _).mp hF.ramsey_C.1)
      ((SimpleGraph.cliqueFree_induce_iff _ _ _).mp hF.ramsey_D.1)
      ((SimpleGraph.cliqueFree_induce_iff _ _ _).mp hF.side_C.1)
      ((SimpleGraph.cliqueFree_induce_iff _ _ _).mp hF.side_D.1)
      (by intro a b c hs ha hb hac hbc; simp only [CliqueCountType]; omega)
      (clique_roots F hF) hcl, ?_⟩
    apply (SimpleGraph.cliqueFree_compl G).mp
    exact free_of_compatible F Gᶜ 4 IndepCountType (core _ hF.ramsey_C)
      (core _ hF.ramsey_D) (side _ hF.side_C) (side _ hF.side_D)
      (by intro a b c hs ha hb hac hbc; simp only [IndepCountType]; omega)
      (indep_roots F hF) hin

/-- Replacing precisely the cross-core matrix leaves all other edges fixed. -/
@[expose] public noncomputable def replace (F : Frame G) (X : F.C → F.D → Prop) :
    SimpleGraph (Fin 43) := by
  classical
  exact {
    Adj := fun x y ↦ if h : x ∈ F.C ∧ y ∈ F.D then X ⟨x, h.1⟩ ⟨y, h.2⟩
      else if h : y ∈ F.C ∧ x ∈ F.D then X ⟨y, h.1⟩ ⟨x, h.2⟩ else G.Adj x y
    symm := ⟨by
      intro x y h
      have hd := Set.disjoint_left.mp F.disjoint_CD
      have hg : G.Adj x y → G.Adj y x := fun h ↦ h.symm
      split_ifs at h ⊢ <;> grind⟩
    loopless := ⟨by
      intro x
      have hd : ¬(x ∈ F.C ∧ x ∈ F.D) := fun h ↦
        Set.disjoint_left.mp F.disjoint_CD h.1 h.2
      simp only [dite_eq_right hd, SimpleGraph.irrefl, not_false_eq_true]⟩ }

/-- Outside the 2 oriented cross-core blocks, replacement preserves adjacency. -/
public lemma replace_adj_fixed (F : Frame G) (X : F.C → F.D → Prop) (x y : Fin 43)
    (hxy : ¬(x ∈ F.C ∧ y ∈ F.D)) (hyx : ¬(y ∈ F.C ∧ x ∈ F.D)) :
    (replace F X).Adj x y ↔ G.Adj x y := by
  classical
  simp only [replace, dite_eq_right hxy, dite_eq_right hyx]

/-- The replacement cross-core block is exactly the supplied matrix. -/
public lemma replace_adj_cross (F : Frame G) (X : F.C → F.D → Prop)
    (c : F.C) (d : F.D) : (replace F X).Adj c d ↔ X c d := by
  classical
  simp only [replace, dite_eq_left (show (c : Fin 43) ∈ F.C ∧ (d : Fin 43) ∈ F.D
    from ⟨c.property, d.property⟩)]

/-- Extracting the graph's actual cross-core matrix reconstructs the graph. -/
public theorem replace_reconstruct (F : Frame G) :
    replace F (fun c d ↦ G.Adj c d) = G := by
  classical
  ext x y
  simp only [replace]
  split_ifs <;> simp [SimpleGraph.adj_comm]

/-- Neither root belongs to either core. -/
private lemma roots_out (F : Frame G) :
    F.v ∉ F.C ∧ F.v ∉ F.D ∧ F.u ∉ F.C ∧ F.u ∉ F.D := by
  simp [Frame.mem_C, Frame.mem_D]

/-- Every edge incident to a root is fixed. -/
public lemma replace_root (F : Frame G) (X : F.C → F.D → Prop) (x : Fin 43) :
    ((replace F X).Adj F.v x ↔ G.Adj F.v x) ∧
    ((replace F X).Adj F.u x ↔ G.Adj F.u x) := by
  obtain ⟨hvc, hvd, huc, hud⟩ := roots_out F
  exact ⟨replace_adj_fixed F X _ _ (by tauto) (by tauto),
    replace_adj_fixed F X _ _ (by tauto) (by tauto)⟩

/-- The same ordered roots define a frame after arbitrary matrix replacement. -/
@[expose] public noncomputable def replaceFrame (F : Frame G) (X : F.C → F.D → Prop) :
    Frame (replace F X) where
  v := F.v
  u := F.u
  adjacent := (replace_root F X F.u).1.mpr F.adjacent
  separated := by
    intro x h
    exact F.separated x ⟨(replace_root F X x).1.mp h.1,
      (replace_root F X x).2.mp h.2⟩

/-- Matrix replacement leaves each canonical cell unchanged. -/
public lemma replaceFrame_cells (F : Frame G) (X : F.C → F.D → Prop) :
    (replaceFrame F X).C = F.C ∧ (replaceFrame F X).D = F.D ∧
      (replaceFrame F X).T = F.T := by
  refine ⟨?_, ?_, ?_⟩
  · ext x
    simp only [Frame.mem_C, replaceFrame, (replace_root F X x).1]
  · ext x
    simp only [Frame.mem_D, replaceFrame, (replace_root F X x).2]
  · ext x
    simp only [Frame.T, antiNeighborSet, Set.mem_inter_iff, Set.mem_ofPred_eq,
      replaceFrame, (replace_root F X x).1, (replace_root F X x).2]

/-- The first 24-side induced graph is unchanged by replacement. -/
private lemma replace_side_C (F : Frame G) (X : F.C → F.D → Prop) :
    (replace F X).induce (F.C ∪ F.T) = G.induce (F.C ∪ F.T) := by
  ext x y
  apply replace_adj_fixed
  · intro h
    rcases y.property with hy | hy
    · exact Set.disjoint_left.mp F.disjoint_CD hy h.2
    · exact Set.disjoint_left.mp F.disjoint_DT h.2 hy
  · intro h
    rcases x.property with hx | hx
    · exact Set.disjoint_left.mp F.disjoint_CD hx h.2
    · exact Set.disjoint_left.mp F.disjoint_DT h.2 hx

/-- The second 24-side induced graph is unchanged by replacement. -/
private lemma replace_side_D (F : Frame G) (X : F.C → F.D → Prop) :
    (replace F X).induce (F.D ∪ F.T) = G.induce (F.D ∪ F.T) := by
  ext x y
  apply replace_adj_fixed
  · intro h
    rcases x.property with hx | hx
    · exact Set.disjoint_left.mp F.disjoint_CD h.1 hx
    · exact Set.disjoint_left.mp F.disjoint_CT h.1 hx
  · intro h
    rcases y.property with hy | hy
    · exact Set.disjoint_left.mp F.disjoint_CD h.1 hy
    · exact Set.disjoint_left.mp F.disjoint_CT h.1 hy

/-- Admissibility depends only on fixed blocks and survives every matrix replacement. -/
public theorem replace_admissible (F : Frame G) (hF : F.Admissible)
    (X : F.C → F.D → Prop) : (replaceFrame F X).Admissible := by
  obtain ⟨hC, hD, hT⟩ := replaceFrame_cells F X
  have gc : (replace F X).induce F.C = G.induce F.C := by
    ext x y
    apply replace_adj_fixed
    · exact fun h ↦ Set.disjoint_left.mp F.disjoint_CD y.property h.2
    · exact fun h ↦ Set.disjoint_left.mp F.disjoint_CD x.property h.2
  have gd : (replace F X).induce F.D = G.induce F.D := by
    ext x y
    apply replace_adj_fixed
    · exact fun h ↦ Set.disjoint_left.mp F.disjoint_CD h.1 x.property
    · exact fun h ↦ Set.disjoint_left.mp F.disjoint_CD h.1 y.property
  constructor
  · simpa only [hC] using hF.card_C
  · simpa only [hD] using hF.card_D
  · simpa only [hT] using hF.card_T
  · rw [hC, gc]
    exact hF.ramsey_C
  · rw [hD, gd]
    exact hF.ramsey_D
  · rw [hC, gc]
    exact hF.regular_C
  · rw [hD, gd]
    exact hF.regular_D
  · rw [hC, hT, replace_side_C]
    exact hF.side_C
  · rw [hD, hT, replace_side_D]
    exact hF.side_D

/-- The assembled graph is Ramsey exactly when all 11 mixed rectangle families hold. -/
public theorem replace_ramsey_iff_compatible (F : Frame G) (hF : F.Admissible)
    (X : F.C → F.D → Prop) :
    IsRamseyGraph 5 5 (replace F X) ↔
      CliqueCompatible (replaceFrame F X) ∧ IndepCompatible (replaceFrame F X) :=
  ramsey_iff_compatible _ (replace_admissible F hF X)

/-- The cross-core matrix has exactly 289 independent positions. -/
public theorem cross_domain_card (F : Frame G) (hF : F.Admissible) :
    Nat.card (F.C × F.D) = 289 := by
  rw [Nat.card_prod, hF.card_C, hF.card_D]

end Ramsey.d18.k1
