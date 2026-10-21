module

public import Ramsey.n43.EvenPivot
public import Ramsey.n09.R43
public import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
public import Mathlib.Data.Set.Card
public import Mathlib.SetTheory.Cardinal.NatCard

/-!
# Connectivity classification and the d18 subcase split

An 18-vertex `(4,5)`-Ramsey graph is connected unless it is the disjoint union
of a clique of order 1, 2 or 3 and a connected `(4,4)`-Ramsey graph.
The classification uses the published Ramsey upper bounds as named premises.

The classification is refined by the exact complete-component order
(`IsKNeighborhood k`, `isDisconnectedNeighborhood_iff`) and turned into the
connectivity branching of the d18 case: `SubcaseBranch` indexes the four
subcases, `ConnClass` and `KClass k` are their classes of 43-vertex graphs
(stated instance-free through `deg`), `subcase_cover` covers the d18 pivot
class, and `excludes_of_subcases` derives `Ramsey.ExcludesDegree 18` from the
four subcase obligations `ExcludesSubcase b` by `Complete.cover` and
`Complete.forall_not_of_eq_empty`.
-/

namespace Ramsey.d18

variable {V : Type*}

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
  rw [indepSetFree_induce_iff]
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

/-- Every disconnected 18-vertex `(4,5)`-Ramsey graph has the exceptional shape. -/
public theorem disconnected_neighborhood_classification [Finite V] (F : RamseyGraph 4 5 V)
    (hn : Nat.card V = 18) (hd : ¬F.graph.Connected) : IsDisconnectedNeighborhood F.graph := by
  classical
  let H := F.graph
  have hH := F.ramsey
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

/-- Disconnection is equivalent to the rigid exceptional family at order 18. -/
public theorem connectivity_classification [Finite V] (H : RamseyGraph 4 5 V)
    (hn : Nat.card V = 18) : ¬H.graph.Connected ↔ IsDisconnectedNeighborhood H.graph :=
  ⟨disconnected_neighborhood_classification H hn, IsDisconnectedNeighborhood.not_connected⟩

/-- The exceptional disconnected-neighborhood shape with the complete
component of order exactly `k`. -/
@[expose] public def IsKNeighborhood (k : ℕ) (H : SimpleGraph V) : Prop :=
  ∃ S : Set V, Nat.card S = k ∧ H.IsClique S ∧
    (∀ u ∈ S, ∀ w ∉ S, ¬H.Adj u w) ∧
    Nat.card S + Nat.card ↥Sᶜ = 18 ∧
    (H.induce Sᶜ).Connected ∧ IsRamseyGraph 4 4 (H.induce Sᶜ) ∧
    ¬(H.induce Sᶜ).IndepSetFree 3

/-- The exceptional family is exactly the union of the order-1, order-2 and
order-3 complete-component families. -/
public theorem isDisconnectedNeighborhood_iff {H : SimpleGraph V} :
    IsDisconnectedNeighborhood H ↔
      IsKNeighborhood 1 H ∨ IsKNeighborhood 2 H ∨ IsKNeighborhood 3 H := by
  constructor
  · rintro ⟨S, hlo, hhi, hclique, hcut, hsum, hconn, hcore, hfree⟩
    rcases (show Nat.card S = 1 ∨ Nat.card S = 2 ∨ Nat.card S = 3 by omega) with h | h | h
    · exact Or.inl ⟨S, h, hclique, hcut, hsum, hconn, hcore, hfree⟩
    · exact Or.inr (Or.inl ⟨S, h, hclique, hcut, hsum, hconn, hcore, hfree⟩)
    · exact Or.inr (Or.inr ⟨S, h, hclique, hcut, hsum, hconn, hcore, hfree⟩)
  · rintro (⟨S, hs, hclique, hcut, hsum, hconn, hcore, hfree⟩ |
      ⟨S, hs, hclique, hcut, hsum, hconn, hcore, hfree⟩ |
      ⟨S, hs, hclique, hcut, hsum, hconn, hcore, hfree⟩)
    · exact ⟨S, by omega, by omega, hclique, hcut, hsum, hconn, hcore, hfree⟩
    · exact ⟨S, by omega, by omega, hclique, hcut, hsum, hconn, hcore, hfree⟩
    · exact ⟨S, by omega, by omega, hclique, hcut, hsum, hconn, hcore, hfree⟩

/-- The four connectivity subcases of the d18 branch: the connected
neighborhood and the three disconnected shapes. -/
public inductive SubcaseBranch : Type
  | conn | k1 | k2 | k3

/-- The connected subcase class: 43-vertex `(5,5)`-Ramsey graphs with a
degree-18 pivot whose neighborhood is connected. -/
@[expose] public def ConnClass (G : SimpleGraph (Fin 43)) : Prop :=
  IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = 18 ∧
    (G.induce (G.neighborSet v)).Connected

/-- The disconnected subcase class for complete-component order `k`:
43-vertex `(5,5)`-Ramsey graphs with a degree-18 pivot whose neighborhood
has the exceptional shape with complete component of order `k`. -/
@[expose] public def KClass (k : ℕ) (G : SimpleGraph (Fin 43)) : Prop :=
  IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = 18 ∧
    IsKNeighborhood k (G.induce (G.neighborSet v))

/-- The subcase class of a branch. -/
public def SubcaseClass : SubcaseBranch → SimpleGraph (Fin 43) → Prop
  | .conn => ConnClass
  | .k1 => KClass 1
  | .k2 => KClass 2
  | .k3 => KClass 3

/-- The K1 subcase classifier is exactly its complete-component class. -/
public theorem subcaseClass_k1 (G : SimpleGraph (Fin 43)) :
    SubcaseClass .k1 G ↔ KClass 1 G := Iff.rfl

/-- The enumeration set of each subcase branch: the empty set, since the
obligation of every subcase is the refutation of its class. -/
public def SubcaseSet : SubcaseBranch → Set (SimpleGraph (Fin 43))
  | _ => ∅

/-- Every subcase enumeration set is empty. -/
public theorem subcaseSet_eq_empty (b : SubcaseBranch) : SubcaseSet b = ∅ := by
  cases b <;> rfl

/-- Branch obligation of subcase `b`: the empty enumeration completely
enumerates the subcase class, so no graph of the class exists. -/
public abbrev ExcludesSubcase (b : SubcaseBranch) : Prop :=
  Complete (SubcaseSet b) (SubcaseClass b)

/-- The connectivity split covers the d18 pivot class: every 43-vertex
`(5,5)`-Ramsey graph with a vertex of degree 18 has, at that vertex, the
connected neighborhood shape or one of the three exceptional shapes. -/
public theorem subcase_cover (G : SimpleGraph (Fin 43)) (hG : IsRamseyGraph 5 5 G)
    {v : Fin 43} (hv : deg G v = 18) : ∃ b : SubcaseBranch, SubcaseClass b G := by
  classical
  have hn : Nat.card ↥(G.neighborSet v) = 18 := hv
  have hN : IsRamseyGraph 4 5 (G.induce (G.neighborSet v)) :=
    isRamseyGraph_induce_neighborSet hG v
  by_cases hconn : (G.induce (G.neighborSet v)).Connected
  · exact ⟨.conn, hG, v, hv, hconn⟩
  · have hdisc : IsDisconnectedNeighborhood (G.induce (G.neighborSet v)) :=
      (connectivity_classification
        (⟨G.induce (G.neighborSet v), hN⟩ : RamseyGraph 4 5 ↥(G.neighborSet v)) hn).mp hconn
    rcases isDisconnectedNeighborhood_iff.mp hdisc with h1 | h2 | h3
    · exact ⟨.k1, hG, v, hv, h1⟩
    · exact ⟨.k2, hG, v, hv, h2⟩
    · exact ⟨.k3, hG, v, hv, h3⟩

/-- The d18 branch obligation follows from the four subcase obligations: the
subcase classes cover the d18 class, every subcase enumeration is empty, and
`Complete.forall_not_of_eq_empty` refutes the class. -/
public theorem excludes_of_subcases (hc : ExcludesSubcase .conn)
    (h1 : ExcludesSubcase .k1) (h2 : ExcludesSubcase .k2)
    (h3 : ExcludesSubcase .k3) : ExcludesDegree 18 := by
  have hbranch : ∀ b : SubcaseBranch, ExcludesSubcase b := by
    intro b
    cases b with
    | conn => exact hc
    | k1 => exact h1
    | k2 => exact h2
    | k3 => exact h3
  have hcover : Complete (⋃ b : SubcaseBranch, SubcaseSet b)
      (fun G : SimpleGraph (Fin 43) ↦
        IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = 18) :=
    Complete.cover hbranch fun G hG ↦ by
      obtain ⟨v, hv⟩ := hG.2
      exact subcase_cover G hG.1 hv
  have hempty : (⋃ b : SubcaseBranch, SubcaseSet b) = ∅ := by
    simp [subcaseSet_eq_empty]
  exact fun G hG ↦ hcover.forall_not_of_eq_empty hempty G hG

end Ramsey.d18
