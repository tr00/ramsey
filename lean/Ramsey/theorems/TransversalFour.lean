module

public import Ramsey.Premises
public import Mathlib.Combinatorics.SimpleGraph.Copy
public import Mathlib.Data.Finset.Card
public import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# Four-vertex transversals

Formalization of `n43/d18/transversal_four.md`. The published 15-vertex census
edge bound and `R(4,3) ≤ 9` are the named axioms `edges_ramsey_4_4_15_ge_50`
and `ramsey_4_3_le_9` from `Ramsey.Premises`. No clique bound is imposed on the
ambient 18-vertex graph. This module does not import the unproved
transversal-deletion statements.
-/

@[expose] public section

namespace Ramsey.TransversalFour

variable {V : Type*}

private theorem indepFree_induce (F : SimpleGraph V) {k : ℕ}
    (hF : F.IndepSetFree k) (A : Set V) : (F.induce A).IndepSetFree k := by
  have heq : (F.induce A)ᶜ = Fᶜ.induce A := by
    ext a b
    simp only [SimpleGraph.compl_adj, SimpleGraph.induce_adj]
    exact and_congr_left fun _ ↦ ⟨fun h e ↦ h (Subtype.ext e),
      fun h e ↦ h (congrArg Subtype.val e)⟩
  rw [← SimpleGraph.cliqueFree_compl, heq, SimpleGraph.cliqueFree_induce_iff]
  exact fun t _ ↦ (SimpleGraph.cliqueFree_compl F).mpr hF t

private theorem ramsey_card_lt [Fintype V] (F : SimpleGraph V) {r s R : ℕ}
    (hR : RamseyUpperBound r s R) (hF : IsRamseyGraph r s F) :
    Fintype.card V < R := by
  by_contra! h
  exact hR.not_isRamseyGraph (by simpa [Nat.card_eq_fintype_card] using h) F hF

private theorem census_bound [Fintype V] (F : SimpleGraph V)
    (hn : Fintype.card V = 15) (hF : IsRamseyGraph 4 4 F) :
    50 ≤ Nat.card F.edgeSet := by
  have hi := F.overFinIso hn
  have h := edges_ramsey_4_4_15_ge_50 (F.overFin hn)
    (isRamseyGraph_comap F (Fintype.equivFinOfCardEq hn).symm.toEmbedding hF)
  have he := Nat.card_congr hi.mapEdgeSet
  rw [← he] at h
  exact_mod_cast h

private theorem deleted_cliqueFree (F : SimpleGraph V) (T : Finset V)
    (hT : IsCliqueTransversal F 4 T) : (F.induce (T : Set V)ᶜ).CliqueFree 4 := by
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro I hI hc
  obtain ⟨x, hxI, hxT⟩ := hT (I : Set V) ⟨I, rfl, hc⟩
  exact hI hxI hxT

private theorem nonneighbor_card_le [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (hF : F.IndepSetFree 4) (T : Finset V)
    (hT : IsCliqueTransversal F 4 T) {t : V} (ht : t ∈ T) :
    Nat.card {u : V // u ∉ T ∧ ¬F.Adj t u} ≤ 8 := by
  classical
  let A : Set V := {u | u ∉ T ∧ ¬F.Adj t u}
  have hc : (F.induce A).CliqueFree 4 := by
    rw [SimpleGraph.cliqueFree_induce_iff]
    intro I hI hcl
    exact (SimpleGraph.cliqueFree_induce_iff F _ 4).mp
      (deleted_cliqueFree F T hT) (fun x hx ↦ (hI hx).1) hcl
  have hi : (F.induce A).IndepSetFree 3 := by
    rw [← SimpleGraph.cliqueFree_compl]
    intro I hI
    let J := I.map (Function.Embedding.subtype A)
    have hJ : Fᶜ.IsNClique 3 J := by
      refine ⟨?_, by simpa [J] using hI.card_eq⟩
      intro a ha b hb hab
      obtain ⟨a', ha', hea⟩ := Finset.mem_map.mp
        (show a ∈ I.map (Function.Embedding.subtype A) from ha)
      obtain ⟨b', hb', heb⟩ := Finset.mem_map.mp
        (show b ∈ I.map (Function.Embedding.subtype A) from hb)
      subst a
      subst b
      have hh := hI.isClique ha' hb' (fun e ↦ hab (congrArg Subtype.val e))
      exact ⟨hab, hh.2⟩
    have hext : Fᶜ.IsNClique 4 (insert t J) := hJ.insert fun b hb ↦ by
      obtain ⟨b', hb', heb⟩ := Finset.mem_map.mp
        (show b ∈ I.map (Function.Embedding.subtype A) from hb)
      subst b
      refine ⟨?_, b'.property.2⟩
      intro e
      have e' : t = b'.val := e
      exact b'.property.1 (e' ▸ ht)
    exact (SimpleGraph.cliqueFree_compl F).mpr hF _ hext
  have h := ramsey_card_lt (F.induce A) ramsey_4_3_le_9 ⟨hc, hi⟩
  rw [Nat.card_eq_fintype_card]
  exact Nat.le_of_lt_succ h

private theorem core_add_attachments_le [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (T : Finset V) :
    Nat.card (F.induce (T : Set V)ᶜ).edgeSet +
      ∑ t : T, Nat.card {u : V // u ∉ T ∧ F.Adj t u} ≤ Nat.card F.edgeSet := by
  classical
  let H := F.induce (T : Set V)ᶜ
  let E := Σ t : T, {u : V // u ∉ T ∧ F.Adj t u}
  let f : H.edgeSet ⊕ E → F.edgeSet
    | .inl e => (SimpleGraph.Copy.induce F (T : Set V)ᶜ).mapEdgeSet e
    | .inr e => ⟨s(e.1.1, e.2.1), e.2.2.2⟩
  have hf : Function.Injective f := by
    intro a b hab
    have hab' := congrArg Subtype.val hab
    cases a with
    | inl a =>
      cases b with
      | inl b =>
        exact congrArg Sum.inl ((SimpleGraph.Copy.induce F (T : Set V)ᶜ).mapEdgeSet.injective hab)
      | inr b =>
        obtain ⟨a, ha⟩ := a
        induction a using Sym2.inductionOn with
        | _ u v =>
          change s(u.1, v.1) = s(b.1.1, b.2.1) at hab'
          rcases Sym2.eq_iff.mp hab' with h | h
          · exact False.elim (u.2 (h.1.symm ▸ b.1.2))
          · exact False.elim (v.2 (h.2.symm ▸ b.1.2))
    | inr a =>
      cases b with
      | inl b =>
        obtain ⟨b, hb⟩ := b
        induction b using Sym2.inductionOn with
        | _ u v =>
          change s(a.1.1, a.2.1) = s(u.1, v.1) at hab'
          rcases Sym2.eq_iff.mp hab' with h | h
          · exact False.elim (u.2 (h.1 ▸ a.1.2))
          · exact False.elim (v.2 (h.1 ▸ a.1.2))
      | inr b =>
        change s(a.1.1, a.2.1) = s(b.1.1, b.2.1) at hab'
        rcases Sym2.eq_iff.mp hab' with h | h
        · have ht : a.1 = b.1 := Subtype.ext h.1
          have hu : a.2.1 = b.2.1 := h.2
          obtain ⟨a, u⟩ := a
          obtain ⟨b, v⟩ := b
          dsimp at ht hu
          subst b
          have : u = v := Subtype.ext hu
          subst v
          rfl
        · exact False.elim (b.2.2.1 (h.1 ▸ a.1.2))
  have h := Fintype.card_le_of_injective f hf
  simpa [Fintype.card_sum, Fintype.card_sigma, Nat.card_eq_fintype_card, E, H] using h

/-- Deleting a three-vertex clique transversal forces at least 71 edges. -/
theorem edge_lower_bound_of_three_transversal [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (hn : Fintype.card V = 18) (hF : F.IndepSetFree 4)
    (T : Finset V) (hcard : T.card = 3) (hT : IsCliqueTransversal F 4 T) :
    71 ≤ Nat.card F.edgeSet := by
  classical
  have hU : (Finset.univ.filter (fun u : V ↦ u ∉ T)).card = 15 := by
    have heq : Finset.univ.filter (fun u : V ↦ u ∉ T) = Tᶜ := by ext; simp
    rw [heq, Finset.card_compl, hn, hcard]
  have hHcard : Fintype.card ↥((T : Set V)ᶜ) = 15 := by
    simpa only [Fintype.card_subtype, Set.mem_compl_iff, Finset.mem_coe] using hU
  have hcore := census_bound (F.induce (T : Set V)ᶜ) hHcard
    ⟨deleted_cliqueFree F T hT, indepFree_induce F hF _⟩
  have hdegree : ∀ t : T, 7 ≤ Nat.card {u : V // u ∉ T ∧ F.Adj t u} := by
    intro t
    have hnon := nonneighbor_card_le F hF T hT t.property
    have hsplit :
        Nat.card {u : V // u ∉ T ∧ F.Adj t u} +
          Nat.card {u : V // u ∉ T ∧ ¬F.Adj t u} = 15 := by
      simp only [Nat.card_eq_fintype_card, Fintype.card_subtype]
      have he := Finset.card_filter_add_card_filter_not
        (s := Finset.univ.filter (fun u : V ↦ u ∉ T)) (fun u ↦ F.Adj t u)
      simpa only [Finset.filter_filter] using he.trans hU
    omega
  have hsum : 21 ≤ ∑ t : T, Nat.card {u : V // u ∉ T ∧ F.Adj t u} := by
    have h := Finset.sum_le_sum (s := Finset.univ) (fun t _ ↦ hdegree t)
    simpa [hcard] using h
  have hcount := core_add_attachments_le F T
  omega

/-- Main theorem of `transversal_four.md`; in fact any edge count at most 70 suffices. -/
theorem transversal_card_ge_four [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (hn : Fintype.card V = 18) (hF : F.IndepSetFree 4)
    (hEdges : Nat.card F.edgeSet ≤ 70)
    (S : Finset V) (hS : IsCliqueTransversal F 4 S) : 4 ≤ S.card := by
  classical
  by_contra! hs
  obtain ⟨T, hST, _, hTcard⟩ := Finset.exists_subsuperset_card_eq
    (Finset.subset_univ S) (show S.card ≤ 3 by omega)
    (show 3 ≤ Finset.univ.card (α := V) by simp [hn])
  have hT : IsCliqueTransversal F 4 T := by
    intro I hI
    obtain ⟨x, hxI, hxS⟩ := hS I hI
    exact ⟨x, hxI, hST hxS⟩
  have h := edge_lower_bound_of_three_transversal F hn hF T hTcard hT
  omega

/-- The source's exact 68-edge formulation, without an ambient clique-number hypothesis. -/
theorem transversal_card_ge_four_of_edges_eq_68 [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (hn : Fintype.card V = 18) (hF : F.IndepSetFree 4)
    (hEdges : Nat.card F.edgeSet = 68)
    (S : Finset V) (hS : IsCliqueTransversal F 4 S) : 4 ≤ S.card :=
  transversal_card_ge_four F hn hF (by omega) S hS

/-- Clique transversals in the complement are independent-set transversals. -/
theorem cliqueTransversal_compl_iff (A : SimpleGraph V) (S : Finset V) :
    IsCliqueTransversal Aᶜ 4 S ↔ IsIndepTransversal A 4 S := by
  simp only [IsCliqueTransversal, IsIndepTransversal, cliqueFamily, indepSetFamily,
    SimpleGraph.isNClique_compl]

/-- A missed independent four-set and the outside endpoint would give an independent five. -/
theorem cross_column_isTransversal [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hG : G.IndepSetFree 5)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) :
    IsIndepTransversal (G.induce A) 4 C := by
  classical
  rintro I ⟨J, rfl, hJ⟩
  by_contra hmiss
  have hnon : ∀ x ∈ J, ¬G.Adj y x.1 := by
    intro x hx hadj
    exact hmiss ⟨x, hx, (hC x).mpr hadj⟩
  let K := J.map (Function.Embedding.subtype A)
  have hK : Gᶜ.IsNClique 4 K := by
    refine ⟨?_, by simpa [K] using hJ.card_eq⟩
    intro a ha b hb hab
    obtain ⟨a', ha', hea⟩ := Finset.mem_map.mp
      (show a ∈ J.map (Function.Embedding.subtype A) from ha)
    obtain ⟨b', hb', heb⟩ := Finset.mem_map.mp
      (show b ∈ J.map (Function.Embedding.subtype A) from hb)
    subst a
    subst b
    exact ⟨hab, hJ.isIndepSet ha' hb' (fun e ↦ hab (congrArg Subtype.val e))⟩
  have hext : Gᶜ.IsNClique 5 (insert y K) := hK.insert fun b hb ↦ by
    obtain ⟨b', hb', heb⟩ := Finset.mem_map.mp
      (show b ∈ J.map (Function.Embedding.subtype A) from hb)
    subst b
    refine ⟨?_, hnon b' hb'⟩
    intro e
    have e' : y = b'.val := e
    exact hy (e' ▸ b'.property)
  exact (SimpleGraph.cliqueFree_compl G).mpr hG _ hext

/-- Degree-18 frontier application. `A` may contain independent fours; only its
clique-four prohibition transfers to independence-four freeness of its complement. -/
theorem cross_column_card_ge_four [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hn : Nat.card A = 18)
    (hA : (G.induce A).CliqueFree 4) (hG : G.IndepSetFree 5)
    (hEdges : Nat.card ((G.induce A)ᶜ).edgeSet = 68)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) :
    IsIndepTransversal (G.induce A) 4 C ∧ 4 ≤ C.card := by
  classical
  let : Fintype A := Fintype.ofFinite A
  have hn' : Fintype.card A = 18 := by simpa only [Nat.card_eq_fintype_card] using hn
  have htrans := cross_column_isTransversal G A hG y hy C hC
  refine ⟨htrans, transversal_card_ge_four_of_edges_eq_68 _ hn' ?_ hEdges C ?_⟩
  · simpa using hA
  · exact (cliqueTransversal_compl_iff _ C).mpr htrans

/-- The frontier's `e(A) = 85` yields `e(Aᶜ) = 68`, hence every actual column has size four
or more. Its published inputs are the named axioms from `Ramsey.Premises`. -/
theorem frontier_cross_column_card_ge_four [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hn : Nat.card A = 18)
    (hA : (G.induce A).CliqueFree 4) (hG : G.IndepSetFree 5)
    (hEdges : Nat.card (G.induce A).edgeSet = 85)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) : 4 ≤ C.card := by
  classical
  let : Fintype A := Fintype.ofFinite A
  let H := G.induce A
  have he : H.edgeFinset.card + Hᶜ.edgeFinset.card = (Fintype.card A).choose 2 := by
    rw [← Finset.card_union_of_disjoint
      (SimpleGraph.disjoint_edgeFinset.mpr disjoint_compl_right),
      ← SimpleGraph.edgeFinset_sup]
    simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card]
    rw [sup_compl_eq_top, Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card,
      SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
    simp only [Nat.card_eq_fintype_card]
  have hn' : Fintype.card A = 18 := by simpa only [Nat.card_eq_fintype_card] using hn
  have hcomp : Nat.card Hᶜ.edgeSet = 68 := by
    rw [hn'] at he
    norm_num [Nat.choose] at he
    simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at he
    change Nat.card H.edgeSet = 85 at hEdges
    omega
  exact (cross_column_card_ge_four G A hn hA hG hcomp y hy C hC).2

end Ramsey.TransversalFour
