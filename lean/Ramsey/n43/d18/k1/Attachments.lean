module

public import Ramsey.n43.d18.k1.Core
public import Ramsey.n09.R43
public import Ramsey.theorems.Counting
public import Ramsey.basics.GraphTheory
public import Mathlib.Tactic.IntervalCases

/-!
# Attachment packing at a 17-vertex core

A core nonedge has at most 1 common misser in a disjoint cell on a (5,4)-free side.
The resulting packing bounds the total number of omissions without a graph census.
-/

namespace Ramsey.d18.k1

open scoped BigOperators

variable {V : Type*} [Fintype V] {G : SimpleGraph V} {K U : Set V}

omit [Fintype V] in
/-- A finite independent set with 4 named vertices contradicts the side bound. -/
private lemma no_independent_quad (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U)))
    {a b c d : V} (ha : a ∈ K ∪ U) (hb : b ∈ K ∪ U)
    (hc : c ∈ K ∪ U) (hd : d ∈ K ∪ U)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (nab : ¬G.Adj a b) (nac : ¬G.Adj a c) (nad : ¬G.Adj a d)
    (nbc : ¬G.Adj b c) (nbd : ¬G.Adj b d) (ncd : ¬G.Adj c d) : False := by
  classical
  have h1 : G.IsNIndepSet 1 {d} := ⟨by simp, by simp⟩
  have h2 := isNIndepSet_insert (z := c) (by simpa using hcd) h1 (by simpa using ncd)
  have h3 := isNIndepSet_insert (z := b) (by simp [hbc, hbd]) h2
    (by simpa using And.intro nbc nbd)
  have h4 := isNIndepSet_insert (z := a) (by simp [hab, hac, had]) h3
    (by simpa using And.intro nab (And.intro nac nad))
  apply (indepSetFree_induce_iff G (K ∪ U) 4).mp hside.2 _ ?_ h4
  intro z hz
  simp only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton] at hz
  rcases hz with rfl | rfl | rfl | rfl <;> assumption
omit [Fintype V] in

/-- An outside vertex missing a core nonedge meets all its common core antineighbors. -/
private lemma misser_meets_triangle
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    {x y : K} (hne : x ≠ y) (hxy : ¬G.Adj x y) {t : U}
    (htx : ¬G.Adj t x) (hty : ¬G.Adj t y)
    {z : K} (hz : z ∈ antiNeighborSet (G.induce K) x ∩
      antiNeighborSet (G.induce K) y) : G.Adj t z := by
  by_contra htz
  have hKU (a : K) (b : U) : (a : V) ≠ b := by
    intro he
    exact Set.disjoint_left.mp hdis a.2 (he ▸ b.2)
  exact no_independent_quad hside (Or.inl x.2) (Or.inl y.2) (Or.inr t.2) (Or.inl z.2)
    (fun he ↦ hne (Subtype.ext he)) (hKU x t) (fun he ↦ hz.1.1 (Subtype.ext he.symm))
    (hKU y t) (fun he ↦ hz.2.1 (Subtype.ext he.symm)) (hKU z t).symm
    hxy (fun h ↦ htx h.symm) hz.1.2 (fun h ↦ hty h.symm) hz.2.2 htz

/-- A core nonedge is missed by at most 1 vertex of a disjoint cell on a (5,4)-free side. -/
public theorem core_nonedge_miss_unique
    (hK : IsRamseyGraph 4 4 (G.induce K)) (hcard : Nat.card K = 17)
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    {x y : K} (hne : x ≠ y) (hxy : ¬G.Adj x y) {t s : U}
    (htx : ¬G.Adj t x) (hty : ¬G.Adj t y)
    (hsx : ¬G.Adj s x) (hsy : ¬G.Adj s y) : t = s := by
  classical
  by_contra hts
  have hKU (a : K) (b : U) : (a : V) ≠ b := by
    intro he
    exact Set.disjoint_left.mp hdis a.2 (he ▸ b.2)
  have hadj : G.Adj t s := by
    by_contra hn
    exact no_independent_quad hside (Or.inl x.2) (Or.inl y.2) (Or.inr t.2) (Or.inr s.2)
      (fun he ↦ hne (Subtype.ext he)) (hKU x t) (hKU x s) (hKU y t) (hKU y s)
      (fun he ↦ hts (Subtype.ext he)) hxy (fun h ↦ htx h.symm)
      (fun h ↦ hsx h.symm) (fun h ↦ hty h.symm) (fun h ↦ hsy h.symm) hn
  let Z := antiNeighborSet (G.induce K) x ∩ antiNeighborSet (G.induce K) y
  obtain ⟨hZcard, hZclique⟩ : Nat.card Z = 3 ∧ (G.induce K).IsClique Z :=
    n17.nonedge_common_anti_triangle (G := G.induce K) hK hcard hne hxy
  have hZ : (G.induce K).IsNClique 3 Z.toFinset := by
    refine ⟨?_, ?_⟩
    · simpa only [Set.coe_toFinset] using hZclique
    · simpa only [Set.toFinset_card, Nat.card_eq_fintype_card] using hZcard
  let q := Z.toFinset.map (Function.Embedding.subtype (· ∈ K))
  have hq : G.IsNClique 3 q := (SimpleGraph.isNClique_induce_iff K Z.toFinset 3).mp hZ
  have htq : ∀ z ∈ q, G.Adj t z := by
    intro z hz
    obtain ⟨w, hw, rfl⟩ := Finset.mem_map.mp hz
    exact misser_meets_triangle hside hdis hne hxy htx hty (Set.mem_toFinset.mp hw)
  have hsq : ∀ z ∈ q, G.Adj s z := by
    intro z hz
    obtain ⟨w, hw, rfl⟩ := Finset.mem_map.mp hz
    exact misser_meets_triangle hside hdis hne hxy hsx hsy (Set.mem_toFinset.mp hw)
  have h4 := hq.insert htq
  have h5 := h4.insert (a := (s : V)) (by simpa using And.intro hadj.symm hsq)
  apply (SimpleGraph.cliqueFree_induce_iff G (K ∪ U) 5).mp hside.1 ?_ h5
  intro z hz
  rcases Finset.mem_insert.mp hz with rfl | hz
  · exact Or.inr s.2
  rcases Finset.mem_insert.mp hz with rfl | hz
  · exact Or.inr t.2
  obtain ⟨w, _, rfl⟩ := Finset.mem_map.mp hz
  exact Or.inl w.2

/-- The set of cell vertices missing a core nonedge has cardinality at most 1. -/
public theorem core_nonedge_miss_card_le_one
    (hK : IsRamseyGraph 4 4 (G.induce K)) (hcard : Nat.card K = 17)
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    {x y : K} (hne : x ≠ y) (hxy : ¬G.Adj x y) :
    Nat.card {t : U | ¬G.Adj t x ∧ ¬G.Adj t y} ≤ 1 := by
  classical
  rw [Nat.card_eq_fintype_card]
  apply Fintype.card_le_one_iff_subsingleton.mpr
  constructor
  intro t s
  apply Subtype.ext
  exact core_nonedge_miss_unique hK hcard hside hdis hne hxy t.2.1 t.2.2 s.2.1 s.2.2

/-- The common omissions of 2 distinct cell vertices form a clique in the core. -/
public theorem attachment_common_omissions_clique
    (hK : IsRamseyGraph 4 4 (G.induce K)) (hcard : Nat.card K = 17)
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    {t s : U} (hts : t ≠ s) :
    (G.induce K).IsClique {x : K | ¬G.Adj t x ∧ ¬G.Adj s x} := by
  intro x hx y hy hxy
  by_contra hn
  exact hts (core_nonedge_miss_unique hK hcard hside hdis hxy hn hx.1 hy.1 hx.2 hy.2)

/-- The common omissions of 2 distinct cell vertices have cardinality at most 3. -/
public theorem attachment_common_omissions_le_three
    (hK : IsRamseyGraph 4 4 (G.induce K)) (hcard : Nat.card K = 17)
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    {t s : U} (hts : t ≠ s) :
    Nat.card {x : K | ¬G.Adj t x ∧ ¬G.Adj s x} ≤ 3 := by
  classical
  exact clique_card_le_of_cliqueFree hK.1
    (attachment_common_omissions_clique hK hcard hside hdis hts)

/-- Every cell vertex has at least 9 neighbors in the core. -/
public theorem attachment_degree_ge_nine
    (hK : IsRamseyGraph 4 4 (G.induce K)) (hcard : Nat.card K = 17)
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    {t : V} (ht : t ∈ U) : 9 ≤ Nat.card (rowSet G K t) := by
  classical
  let S := K ∩ antiNeighborSet G t
  have h43 : IsRamseyGraph 4 3 (G.induce S) := by
    refine ⟨?_, ?_⟩
    · apply (SimpleGraph.cliqueFree_induce_iff G S 4).mpr
      intro q hq hcl
      exact (SimpleGraph.cliqueFree_induce_iff G K 4).mp hK.1
        (fun x hx ↦ (hq hx).1) hcl
    · apply (indepSetFree_induce_iff G S 3).mpr
      intro q hq hind
      have htq : t ∉ q := fun hm ↦ (hq hm).2.1 rfl
      have h4 := isNIndepSet_insert htq hind (fun x hx ↦ (hq hx).2.2)
      apply (indepSetFree_induce_iff G (K ∪ U) 4).mp hside.2 _ ?_ h4
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Or.inr ht
      · exact Or.inl (hq hx).1
  have hcap : Nat.card S ≤ 8 := by
    by_contra hn
    exact ramsey_4_3_le_9.not_isRamseyGraph (by omega) _ h43
  have heq : rowSet G K t ∪ S = K := by
    ext x
    have hxt : x ∈ K → x ≠ t := by
      intro hx he
      exact Set.disjoint_left.mp hdis hx (he ▸ ht)
    simp only [rowSet, S, antiNeighborSet, Set.mem_union, Set.mem_inter_iff,
      SimpleGraph.mem_neighborSet, Set.mem_ofPred_eq]
    tauto
  have hdisj : Disjoint (rowSet G K t) S := by
    exact Set.disjoint_left.mpr (fun x hx hy ↦ hy.2.2 hx.1)
  have hcount := Set.ncard_union_eq hdisj
  rw [heq] at hcount
  simp only [← Nat.card_coe_set_eq] at hcount
  omega

/-- Pairwise intersection capacity 3 gives at most 55 incidences on a 17 by 7 array. -/
private lemma packing_incidence_le_fifty_five
    {A B : Type*} [Fintype A] [Fintype B] (R : B → A → Prop) [DecidableRel R]
    (hA : Fintype.card A = 17) (hB : Fintype.card B = 7)
    (hpair : ∀ s t : B, s ≠ t → (∑ x : A, if R s x ∧ R t x then 1 else 0) ≤ 3) :
    (∑ x : A, ∑ t : B, if R t x then 1 else 0) ≤ 55 := by
  classical
  let m (x : A) := ∑ t : B, if R t x then 1 else 0
  let n (s : B) := ∑ x : A, if R s x then 1 else 0
  let p (s t : B) := ∑ x : A, if R s x ∧ R t x then 1 else 0
  have hswap : (∑ s : B, n s) = ∑ x : A, m x := Finset.sum_comm
  have hdiag (s : B) : p s s = n s := by simp [p, n]
  have hpoint (s t : B) : p s t + (if t = s then 3 else 0) ≤
      (if t = s then n s else 0) + 3 := by
    by_cases h : t = s
    · subst t
      simp [hdiag]
    · simpa only [h, ite_false, add_zero, zero_add, p] using hpair s t (Ne.symm h)
  have hrow (s : B) : (∑ t : B, p s t) + 3 ≤ n s + 21 := by
    have h := Finset.sum_le_sum (s := Finset.univ) (fun t _ ↦ hpoint s t)
    simpa only [Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, ite_true,
      Finset.sum_const, Finset.card_univ, smul_eq_mul, hB] using h
  have htotal : (∑ s : B, ∑ t : B, p s t) + 21 ≤ (∑ x : A, m x) + 147 := by
    have h := Finset.sum_le_sum (s := Finset.univ) (fun s _ ↦ hrow s)
    simpa only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ, smul_eq_mul,
      hB, hswap] using h
  have hsquare : (∑ x : A, m x * m x) = ∑ s : B, ∑ t : B, p s t := by
    have hproduct (s t : B) (x : A) :
        (if R s x then 1 else 0) * (if R t x then 1 else 0) =
          if R s x ∧ R t x then 1 else 0 := by
      by_cases hs : R s x <;> by_cases ht : R t x <;> simp [hs, ht]
    simp only [m, Finset.sum_mul, Finset.mul_sum, hproduct]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro s _
    simpa only [p, and_comm] using
      (Finset.sum_comm (f := fun x t ↦ if R t x ∧ R s x then 1 else 0))
  have hconvex (x : A) : 7 * m x ≤ m x * m x + 12 := by
    have hm : m x ≤ 7 := by
      calc
        m x ≤ ∑ _t : B, 1 := Finset.sum_le_sum (fun t _ ↦ by split_ifs <;> omega)
        _ = 7 := by simp [hB]
    generalize m x = k at *
    interval_cases k <;> decide
  have hc : 7 * (∑ x : A, m x) ≤ (∑ x : A, m x * m x) + 204 := by
    have h := Finset.sum_le_sum (s := Finset.univ) (fun x _ ↦ hconvex x)
    simpa only [Finset.mul_sum, Finset.sum_add_distrib, Finset.sum_const,
      Finset.card_univ, smul_eq_mul, hA] using h
  rw [hsquare] at hc
  change (∑ x : A, m x) ≤ 55
  omega

/-- A 7-cell on a (5,4)-free side has at least 64 edges to its 17-vertex core. -/
public theorem attachment_cross_ge_sixty_four
    (hK : IsRamseyGraph 4 4 (G.induce K)) (hcard : Nat.card K = 17)
    (hside : IsRamseyGraph 5 4 (G.induce (K ∪ U))) (hdis : Disjoint K U)
    (hU : Nat.card U = 7) : 64 ≤ crossEdgeCount G K U := by
  classical
  have hpair (s t : U) (hne : s ≠ t) :
      (∑ x : K, if ¬G.Adj s x ∧ ¬G.Adj t x then 1 else 0) ≤ 3 := by
    have h := attachment_common_omissions_le_three hK hcard hside hdis hne
    rw [Nat.card_eq_fintype_card, Fintype.card_subtype, Finset.card_filter] at h
    exact h
  have hmiss := packing_incidence_le_fifty_five (fun t : U ↦ fun x : K ↦ ¬G.Adj t x)
    (by simpa only [Nat.card_eq_fintype_card] using hcard)
    (by simpa only [Nat.card_eq_fintype_card] using hU) hpair
  have hrow (x : K) : Nat.card (rowSet G U x) =
      ∑ t : U, if G.Adj t x then 1 else 0 := by
    let e : rowSet G U x ≃ {t : U | G.Adj t x} :=
      { toFun := fun t ↦ ⟨⟨t, t.2.2⟩, t.2.1.symm⟩
        invFun := fun t ↦ ⟨t, t.2.symm, t.1.2⟩
        left_inv := fun _ ↦ rfl
        right_inv := fun _ ↦ rfl }
    rw [Nat.card_congr e, Nat.card_eq_fintype_card, Fintype.card_subtype,
      Finset.card_filter]
    rfl
  have hpoint (x : K) (t : U) :
      (if G.Adj t x then 1 else 0) + (if ¬G.Adj t x then 1 else 0) = 1 := by
    split_ifs <;> simp_all
  have hsum : (∑ x : K, ∑ t : U, if G.Adj t x then 1 else 0) +
      (∑ x : K, ∑ t : U, if ¬G.Adj t x then 1 else 0) = 119 := by
    rw [← Finset.sum_add_distrib]
    simp_rw [← Finset.sum_add_distrib, hpoint]
    simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul,
      ← Nat.card_eq_fintype_card, hcard, hU]
  rw [crossEdgeCount_eq_sum_rows G K U hdis]
  simp_rw [hrow]
  omega

end Ramsey.d18.k1
