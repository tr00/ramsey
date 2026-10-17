module

public import Ramsey.Premises
public import Ramsey.d18.PivotBudget
public import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
public import Mathlib.Data.Set.Card
public import Mathlib.SetTheory.Cardinal.NatCard
public import Mathlib.Combinatorics.SimpleGraph.Sum
public import Mathlib.Logic.Equiv.Set

/-!
# Connectivity classification for degree-eighteen neighborhoods

An eighteen-vertex `(4,5)`-Ramsey graph is connected unless it is the disjoint union
of a clique of order one, two or three and a connected `(4,4)`-Ramsey graph.
The classification uses the published Ramsey upper bounds as named premises.
-/

namespace Ramsey.d18

variable {V : Type*}

/-- Independence exclusion on an induced graph can be checked on ambient finite sets. -/
private lemma indepFree_induce_iff (H : SimpleGraph V) (S : Set V) (n : ℕ) :
    (H.induce S).IndepSetFree n ↔
      ∀ t : Finset V, (↑t : Set V) ⊆ S → ¬H.IsNIndepSet n t := by
  rw [← SimpleGraph.cliqueFree_compl, compl_induce, SimpleGraph.cliqueFree_induce_iff]
  simp only [SimpleGraph.CliqueFreeOn, SimpleGraph.isNClique_compl]

/-- Independent sets on opposite sides of an anticomplete cut can be combined. -/
private lemma indep_union [DecidableEq V] {H : SimpleGraph V} {S : Set V} {s t : Finset V}
    {m n : ℕ} (hs : H.IsNIndepSet m s) (ht : H.IsNIndepSet n t)
    (hsS : (↑s : Set V) ⊆ S) (htS : (↑t : Set V) ⊆ Sᶜ)
    (hcut : ∀ u ∈ S, ∀ w ∉ S, ¬H.Adj u w) :
    H.IsNIndepSet (m + n) (s ∪ t) := by
  classical
  have hd : Disjoint s t := Finset.disjoint_left.mpr fun u hu hv ↦ htS hv (hsS hu)
  refine ⟨?_, by rw [Finset.card_union_of_disjoint hd, hs.card_eq, ht.card_eq]⟩
  intro u hu w hw hne
  simp only [Finset.coe_union, Set.mem_union] at hu hw
  rcases hu with hu | hu <;> rcases hw with hw | hw
  · exact hs.isIndepSet hu hw hne
  · exact hcut u (hsS hu) w (htS hw)
  · exact fun hadj ↦ hcut w (hsS hw) u (htS hu) hadj.symm
  · exact ht.isIndepSet hu hw hne

/-- A noncomplete side of a cut contains an independent pair. -/
private lemma pair_of_not_clique {H : SimpleGraph V} {S : Set V}
    (h : ¬H.IsClique S) :
    ∃ t : Finset V, (↑t : Set V) ⊆ S ∧ H.IsNIndepSet 2 t := by
  classical
  change ¬∀ u ∈ S, ∀ w ∈ S, u ≠ w → H.Adj u w at h
  push Not at h
  obtain ⟨u, hu, w, hw, hval, hn⟩ := h
  refine ⟨{u, w}, ?_, ?_⟩
  · intro x hx
    simp only [Finset.coe_pair, Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    rcases hx with rfl | rfl
    · exact hu
    · exact hw
  · refine ⟨?_, by simp [hval]⟩
    intro x hx y hy hxy
    simp only [Finset.coe_pair, Set.mem_insert_iff, Set.mem_singleton_iff] at hx hy
    rcases hx with rfl | rfl <;> rcases hy with rfl | rfl
    · exact (hxy rfl).elim
    · exact hn
    · exact fun ha ↦ hn ha.symm
    · exact (hxy rfl).elim

/-- An independent witness on one side excludes larger independent sets on the other side. -/
private lemma free_of_opposite {H : SimpleGraph V} {S : Set V} {t : Finset V}
    {m n : ℕ} (hH : H.IndepSetFree (m + n))
    (ht : H.IsNIndepSet n t) (htS : (↑t : Set V) ⊆ Sᶜ)
    (hcut : ∀ u ∈ S, ∀ w ∉ S, ¬H.Adj u w) :
    (H.induce S).IndepSetFree m := by
  classical
  rw [indepFree_induce_iff]
  intro s hsS hs
  exact hH _ (indep_union hs ht hsS htS hcut)

/-- A clique in a `K4`-free graph has at most three vertices. -/
private lemma clique_card_le_three [Finite V] {H : SimpleGraph V}
    (hH : H.CliqueFree 4) {S : Set V} (hS : H.IsClique S) : Nat.card S ≤ 3 := by
  classical
  by_contra hc
  obtain ⟨t, ht, hcard⟩ := Finset.exists_subset_card_eq
    (s := S.toFinite.toFinset) (n := 4) (by
      have hc' : 3 < S.ncard := by simpa using hc
      rw [← Set.ncard_eq_toFinset_card S S.toFinite]
      omega)
  exact hH t ⟨hS.subset (by simpa using ht), hcard⟩

/-- The two sides of a finite cut partition the vertex count. -/
private lemma card_cut [Finite V] (S : Set V) :
    Nat.card S + Nat.card ↥Sᶜ = Nat.card V := by
  classical
  let := Fintype.ofFinite V
  rw [Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    Fintype.card_compl_set, Nat.card_eq_fintype_card]
  have : Fintype.card S ≤ Fintype.card V :=
    Fintype.card_le_of_injective (fun x : S ↦ (x : V)) Subtype.val_injective
  omega

/-- A nonempty anticomplete side improves the independence bound on its complement. -/
private lemma free_of_nonempty {H : SimpleGraph V} {S : Set V} {n : ℕ}
    (hH : H.IndepSetFree (n + 1)) (hS : S.Nonempty)
    (hcut : ∀ u ∈ S, ∀ w ∉ S, ¬H.Adj u w) :
    (H.induce Sᶜ).IndepSetFree n := by
  classical
  obtain ⟨u, hu⟩ := hS
  apply free_of_opposite hH (t := {u}) (n := 1)
  · exact ⟨by simp [SimpleGraph.IsIndepSet], by simp⟩
  · simpa using hu
  · intro w hw x hx h
    exact hcut x (by simpa using hx) w hw h.symm

/-- A disconnected nonempty graph admits a nontrivial anticomplete cut. -/
private lemma exists_cut {H : SimpleGraph V} [Nonempty V] (hH : ¬H.Connected) :
    ∃ S : Set V, S.Nonempty ∧ Sᶜ.Nonempty ∧
      (∀ u ∈ S, ∀ w ∉ S, ¬H.Adj u w) := by
  classical
  let u : V := Classical.ofNonempty
  have hn : ¬∀ w, H.Reachable u w := by
    intro hr
    exact hH ⟨fun x y ↦ (hr x).symm.trans (hr y)⟩
  push Not at hn
  obtain ⟨w, hw⟩ := hn
  refine ⟨{x | H.Reachable u x}, ⟨u, .rfl⟩, ⟨w, hw⟩, ?_⟩
  intro x hx y hy hxy
  exact hy (hx.trans hxy.reachable)

/-- A disconnected `(4,4)`-Ramsey graph has at most eleven vertices. -/
private lemma connected_of_ramsey44 [Finite V] {H : SimpleGraph V}
    (hH : IsRamseyGraph 4 4 H) (hn : 12 ≤ Nat.card V) : H.Connected := by
  classical
  have : Nonempty V := Finite.card_pos_iff.mp (by omega)
  by_contra hconn
  obtain ⟨S, hS, hT, hcut⟩ := exists_cut hconn
  have hcut' : ∀ u ∈ Sᶜ, ∀ w ∉ Sᶜ, ¬H.Adj u w := by
    intro u hu w hw ha
    exact hcut w (by simpa using hw) u hu ha.symm
  have hS3 : (H.induce S).IndepSetFree 3 := by
    have hf := free_of_nonempty (S := Sᶜ) hH.2 hT hcut'
    rw [compl_compl] at hf
    exact hf
  have hT3 := free_of_nonempty hH.2 hS hcut
  have hcS : (H.induce S).CliqueFree 4 := by
    exact (SimpleGraph.cliqueFree_induce_iff _ _ _).mpr (fun t _ ↦ hH.1 t)
  have hcT : (H.induce Sᶜ).CliqueFree 4 := by
    exact (SimpleGraph.cliqueFree_induce_iff _ _ _).mpr (fun t _ ↦ hH.1 t)
  have hScard : Nat.card S ≤ 8 := by
    by_contra h
    exact ramsey_4_3_le_9.not_isRamseyGraph (by omega) _ ⟨hcS, by simpa using hS3⟩
  have hTcard : Nat.card ↥Sᶜ ≤ 8 := by
    by_contra h
    exact ramsey_4_3_le_9.not_isRamseyGraph (by omega) _ ⟨hcT, hT3⟩
  have hsum := card_cut S
  by_cases hs : H.IsClique S
  · have := clique_card_le_three hH.1 hs
    omega
  by_cases ht : H.IsClique Sᶜ
  · have := clique_card_le_three hH.1 ht
    omega
  obtain ⟨s, hsS, hs⟩ := pair_of_not_clique hs
  obtain ⟨t, htS, ht⟩ := pair_of_not_clique ht
  exact hH.2 _ (indep_union hs ht hsS htS hcut)

/-- The exceptional family is a small complete component and a large Ramsey component.
The second component contains an independent triple and has no independent four-set. -/
@[expose] public def IsDisconnectedNeighborhood (H : SimpleGraph V) : Prop :=
  ∃ S : Set V, 1 ≤ Nat.card S ∧ Nat.card S ≤ 3 ∧ H.IsClique S ∧
    (∀ u ∈ S, ∀ w ∉ S, ¬H.Adj u w) ∧
    Nat.card S + Nat.card ↥Sᶜ = 18 ∧
    (H.induce Sᶜ).Connected ∧ IsRamseyGraph 4 4 (H.induce Sᶜ) ∧
    ¬(H.induce Sᶜ).IndepSetFree 3

/-- Every disconnected eighteen-vertex `(4,5)`-Ramsey graph has the exceptional shape. -/
public theorem disconnected_neighborhood_classification [Finite V] {H : SimpleGraph V}
    (hn : Nat.card V = 18) (hH : IsRamseyGraph 4 5 H) (hd : ¬H.Connected) :
    IsDisconnectedNeighborhood H := by
  classical
  have : Nonempty V := Finite.card_pos_iff.mp (by omega)
  obtain ⟨S, hS, hT, hcut⟩ := exists_cut hd
  have hcut' : ∀ u ∈ Sᶜ, ∀ w ∉ Sᶜ, ¬H.Adj u w := by
    intro u hu w hw ha
    exact hcut w (by simpa using hw) u hu ha.symm
  have hor : H.IsClique S ∨ H.IsClique Sᶜ := by
    by_contra h
    push Not at h
    obtain ⟨s, hsS, hs⟩ := pair_of_not_clique h.1
    obtain ⟨t, htS, ht⟩ := pair_of_not_clique h.2
    have hfS := free_of_opposite hH.2 ht htS hcut
    have hfT := free_of_opposite hH.2 hs (by simpa using hsS) hcut'
    have hScard : Nat.card S ≤ 8 := by
      by_contra hc
      apply ramsey_4_3_le_9.not_isRamseyGraph (by omega) (H.induce S)
      exact ⟨(SimpleGraph.cliqueFree_induce_iff _ _ _).mpr (fun t _ ↦ hH.1 t), hfS⟩
    have hTcard : Nat.card ↥Sᶜ ≤ 8 := by
      by_contra hc
      apply ramsey_4_3_le_9.not_isRamseyGraph (by omega) (H.induce Sᶜ)
      exact ⟨(SimpleGraph.cliqueFree_induce_iff _ _ _).mpr (fun t _ ↦ hH.1 t), hfT⟩
    have := card_cut S
    omega
  have hshape : ∃ T : Set V, T.Nonempty ∧ H.IsClique T ∧
      (∀ u ∈ T, ∀ w ∉ T, ¬H.Adj u w) := by
    rcases hor with hs | ht
    · exact ⟨S, hS, hs, hcut⟩
    · exact ⟨Sᶜ, hT, ht, hcut'⟩
  obtain ⟨T, hT, hclique, hcut⟩ := hshape
  have hsmall := clique_card_le_three hH.1 hclique
  have hpos : 1 ≤ Nat.card T := Finite.card_pos_iff.mpr hT.to_subtype
  have hsum : Nat.card T + Nat.card ↥Tᶜ = 18 := by rw [card_cut, hn]
  have hramsey : IsRamseyGraph 4 4 (H.induce Tᶜ) :=
    ⟨(SimpleGraph.cliqueFree_induce_iff _ _ _).mpr (fun t _ ↦ hH.1 t),
      free_of_nonempty hH.2 hT hcut⟩
  refine ⟨T, hpos, hsmall, hclique, hcut, hsum,
    connected_of_ramsey44 hramsey (by omega), hramsey, ?_⟩
  intro hf
  exact ramsey_4_3_le_9.not_isRamseyGraph (by omega) _ ⟨hramsey.1, hf⟩

/-- An anticomplete clique contributes exactly its unordered vertex pairs to the edge count. -/
private lemma edge_card_eq_choose_add_induce_compl [Finite V] (H : SimpleGraph V) (S : Set V)
    (hclique : H.IsClique S)
    (hanti : ∀ u, u ∈ S → ∀ w, w ∉ S → ¬ H.Adj u w) :
    Nat.card H.edgeSet = (Nat.card S).choose 2 + Nat.card (H.induce Sᶜ).edgeSet := by
  classical
  let e : (H.induce S ⊕g H.induce Sᶜ) ≃g H :=
    { toEquiv := Equiv.Set.sumCompl S
      map_rel_iff' := by
        rintro (u | u) (v | v)
        · rfl
        · simpa using hanti u.1 u.2 v.1 v.2
        · simpa [SimpleGraph.adj_comm] using hanti v.1 v.2 u.1 u.2
        · rfl }
  have hcliqueEdges : Nat.card (H.induce S).edgeSet = (Nat.card S).choose 2 := by
    rw [SimpleGraph.induce_eq_top.mpr hclique]
    let : Fintype S := Fintype.ofFinite S
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_edgeSet] using
      (SimpleGraph.card_edgeFinset_top_eq_card_choose_two (V := S))
  calc
    Nat.card H.edgeSet = Nat.card (H.induce S ⊕g H.induce Sᶜ).edgeSet :=
      (Nat.card_congr e.mapEdgeSet).symm
    _ = Nat.card ((H.induce S).edgeSet ⊕ (H.induce Sᶜ).edgeSet) :=
      Nat.card_congr SimpleGraph.edgeSetSumEquiv
    _ = Nat.card (H.induce S).edgeSet + Nat.card (H.induce Sᶜ).edgeSet := Nat.card_sum
    _ = (Nat.card S).choose 2 + Nat.card (H.induce Sᶜ).edgeSet := by rw [hcliqueEdges]

/-- The published `(4,4)` censuses give three disjoint edge slices for the exceptional shape. -/
private lemma exceptional_edge_slices [Finite V] (H : SimpleGraph V) (hn : Nat.card V = 18) (S : Set V)
    (hSlo : 1 ≤ Nat.card S) (hShi : Nat.card S ≤ 3) (hclique : H.IsClique S)
    (hanti : ∀ u, u ∈ S → ∀ w, w ∉ S → ¬ H.Adj u w)
    (hcore : IsRamseyGraph 4 4 (H.induce Sᶜ)) :
    (Nat.card S = 3 ∧ 53 ≤ Nat.card H.edgeSet ∧ Nat.card H.edgeSet ≤ 58) ∨
      (Nat.card S = 2 ∧ Nat.card H.edgeSet = 61) ∨
      (Nat.card S = 1 ∧ Nat.card H.edgeSet = 68) := by
  classical
  have he := edge_card_eq_choose_add_induce_compl H S hclique hanti
  have hpartition : Nat.card S + Nat.card ↥(Sᶜ) = 18 := by
    calc
      Nat.card S + Nat.card ↥(Sᶜ) = Nat.card (S ⊕ ↥(Sᶜ)) := Nat.card_sum.symm
      _ = Nat.card V := Nat.card_congr (Equiv.Set.sumCompl S)
      _ = 18 := hn
  have hsize : Nat.card S = 3 ∨ Nat.card S = 2 ∨ Nat.card S = 1 := by omega
  rcases hsize with h3 | h2 | h1
  · left
    have horder : Nat.card ↥(Sᶜ) = 15 := by omega
    have hlo : 50 ≤ Nat.card (H.induce Sᶜ).edgeSet := by
      exact_mod_cast edges_ramsey_4_4_15_ge_50.on_finite_type horder _ hcore
    have hhi : Nat.card (H.induce Sᶜ).edgeSet ≤ 55 := by
      exact_mod_cast edges_ramsey_4_4_15_le_55.on_finite_type horder _ hcore
    rw [h3, show Nat.choose 3 2 = 3 by decide] at he
    exact ⟨h3, by omega, by omega⟩
  · right
    left
    have horder : Nat.card ↥(Sᶜ) = 16 := by omega
    have hlo : 60 ≤ Nat.card (H.induce Sᶜ).edgeSet := by
      exact_mod_cast edges_ramsey_4_4_16_ge_60.on_finite_type horder _ hcore
    have hhi : Nat.card (H.induce Sᶜ).edgeSet ≤ 60 := by
      exact_mod_cast edges_ramsey_4_4_16_le_60.on_finite_type horder _ hcore
    rw [h2, show Nat.choose 2 2 = 1 by decide] at he
    exact ⟨h2, by omega⟩
  · right
    right
    have horder : Nat.card ↥(Sᶜ) = 17 := by omega
    have hlo : 68 ≤ Nat.card (H.induce Sᶜ).edgeSet := by
      exact_mod_cast edges_ramsey_4_4_17_ge_68.on_finite_type horder _ hcore
    have hhi : Nat.card (H.induce Sᶜ).edgeSet ≤ 68 := by
      exact_mod_cast edges_ramsey_4_4_17_le_68.on_finite_type horder _ hcore
    rw [h1, show Nat.choose 1 2 = 0 by decide] at he
    exact ⟨h1, by omega⟩

/-- Every member of the exceptional family is disconnected. -/
public theorem IsDisconnectedNeighborhood.not_connected [Finite V] {H : SimpleGraph V}
    (hH : IsDisconnectedNeighborhood H) : ¬H.Connected := by
  classical
  obtain ⟨S, hpos, _, _, hcut, _, hconn, _⟩ := hH
  obtain ⟨u⟩ := Finite.card_pos_iff.mp hpos
  let w : ↥Sᶜ := Classical.choice hconn.nonempty
  intro hall
  obtain ⟨p⟩ := hall (u : V) (w : V)
  have hclosed : ∀ {x y : V}, H.Walk x y → x ∈ S → y ∈ S := by
    intro x y q
    induction q with
    | nil => exact id
    | @cons x y z hxy q ih =>
      intro hx
      apply ih
      by_contra hy
      exact hcut x hx y hy hxy
  exact w.property (hclosed p u.property)

/-- Disconnection is equivalent to the rigid exceptional family at order eighteen. -/
public theorem connectivity_classification [Finite V] {H : SimpleGraph V}
    (hn : Nat.card V = 18) (hH : IsRamseyGraph 4 5 H) :
    ¬H.Connected ↔ IsDisconnectedNeighborhood H :=
  ⟨disconnected_neighborhood_classification hn hH,
    IsDisconnectedNeighborhood.not_connected⟩

/-- Disconnected neighborhoods have only the census edge slices `53..58`, `61` and `68`. -/
public theorem disconnected_edge_slices [Finite V] {H : SimpleGraph V}
    (hn : Nat.card V = 18) (hH : IsRamseyGraph 4 5 H) (hd : ¬H.Connected) :
    (53 ≤ Nat.card H.edgeSet ∧ Nat.card H.edgeSet ≤ 58) ∨
      Nat.card H.edgeSet = 61 ∨ Nat.card H.edgeSet = 68 := by
  obtain ⟨S, hlo, hhi, hclique, hcut, _, _, hcore, _⟩ :=
    disconnected_neighborhood_classification hn hH hd
  rcases exceptional_edge_slices H hn S hlo hhi hclique hcut hcore with h | h | h
  · exact Or.inl h.2
  · exact Or.inr (Or.inl h.2)
  · exact Or.inr (Or.inr h.2)

/-- At least sixty-nine edges force an eighteen-vertex `(4,5)`-Ramsey graph to be connected. -/
public theorem connected_of_edge_ge_69 [Finite V] {H : SimpleGraph V}
    (hn : Nat.card V = 18) (hH : IsRamseyGraph 4 5 H) (he : 69 ≤ Nat.card H.edgeSet) :
    H.Connected := by
  by_contra hd
  have := disconnected_edge_slices hn hH hd
  omega

/-- A degree-eighteen neighborhood is connected exactly when it is not exceptional. -/
public theorem degree18_connectivity_classification [Fintype V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 5 5 G) (v : V) (hv : G.degree v = 18) :
    ¬(G.induce (G.neighborSet v)).Connected ↔
      IsDisconnectedNeighborhood (G.induce (G.neighborSet v)) := by
  apply connectivity_classification
  · simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  · exact isRamseyGraph_induce_neighborSet hG v

/-- The sixty-nine-edge connectivity threshold applies to every degree-eighteen pivot. -/
public theorem degree18_neighbor_connected_of_edge_ge_69 [Fintype V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 5 5 G) (v : V) (hv : G.degree v = 18)
    (he : 69 ≤ Nat.card (G.induce (G.neighborSet v)).edgeSet) :
    (G.induce (G.neighborSet v)).Connected := by
  apply connected_of_edge_ge_69 _ (isRamseyGraph_induce_neighborSet hG v) he
  simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hv

/-- Deficit at most sixteen is sufficient for connectivity of a degree-eighteen neighborhood. -/
public theorem degree18_neighbor_connected_of_deficit_le_16 [Fintype V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 5 5 G) (v : V) (hv : G.degree v = 18)
    (hq : 85 - inducedEdgeCount G (G.neighborSet v) ≤ 16) :
    (G.induce (G.neighborSet v)).Connected := by
  apply degree18_neighbor_connected_of_edge_ge_69 hG v hv
  change 69 ≤ inducedEdgeCount G (G.neighborSet v)
  omega

/-- Every degree-eighteen equality-frontier neighborhood is connected. -/
public theorem degree18_frontier_neighbor_connected {G : SimpleGraph (Fin 43)}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 5 5 G) (v : Fin 43) (hv : G.degree v = 18)
    (hx : crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 136) :
    (G.induce (G.neighborSet v)).Connected := by
  apply degree18_neighbor_connected_of_edge_ge_69 hG v hv
  change 69 ≤ inducedEdgeCount G (G.neighborSet v)
  rw [((degree18_frontier_iff hG v hv).mp hx).1]
  omega

end Ramsey.d18
