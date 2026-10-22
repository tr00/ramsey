module

public import Ramsey.basics.RamseyTheory
public import Mathlib.Data.Fintype.Perm
public import Mathlib.Data.Fintype.EquivFin
public import Mathlib.Algebra.BigOperators.Fin

/-!
# The cubic 8-vertex (3,4)-Ramsey graph

Rooting a cubic graph gives 3 independent neighbors and 4 other vertices.
The 3 neighbor rows choose pairs of the other vertices, leaving only 6 unspecified edges.
The resulting finite classification identifies every such graph with the Möbius ladder.
-/

namespace Ramsey.n17

open scoped BigOperators

/-- The Möbius ladder has cyclic differences 1, 4, and 7 modulo 8. -/
@[expose] public def mobius8 : SimpleGraph (Fin 8) where
  Adj x y := (y.val + 8 - x.val) % 8 ∈ ({1, 4, 7} : Finset ℕ)
  symm := ⟨by decide⟩
  loopless := ⟨by decide⟩

/-- Adjacency in the Möbius ladder is decidable. -/
public instance : DecidableRel mobius8.Adj :=
  fun x y ↦ inferInstanceAs
    (Decidable ((y.val + 8 - x.val) % 8 ∈ ({1, 4, 7} : Finset ℕ)))

/-- Distinct Möbius-ladder vertices have distinct neighborhoods. -/
public theorem mobius8_adj_ext :
    ∀ x y : Fin 8, (∀ z, mobius8.Adj x z ↔ mobius8.Adj y z) → x = y := by
  decide

/-- Rooted labels consist of the root, its 3 neighbors, and its 4 nonneighbors. -/
private abbrev LocalVertex := Unit ⊕ (Fin 3 ⊕ Fin 4)

/-- The root label in a local model. -/
private abbrev modelRoot : LocalVertex := .inl ()

/-- The label of a neighbor of the root. -/
private abbrev modelA (i : Fin 3) : LocalVertex := .inr (.inl i)

/-- The label of a nonneighbor of the root. -/
private abbrev modelB (j : Fin 4) : LocalVertex := .inr (.inr j)

/-- The 6 possible pairs among the 4 nonneighbors. -/
private def localPair (i : Fin 6) : Finset (Fin 4) :=
  match i.val with
  | 0 => {0, 1}
  | 1 => {0, 2}
  | 2 => {0, 3}
  | 3 => {1, 2}
  | 4 => {1, 3}
  | _ => {2, 3}

/-- Every pair of the 4 nonneighbors appears in the explicit pair table. -/
private lemma localPair_complete :
    ∀ s : Finset (Fin 4), s.card = 2 → ∃ i : Fin 6, localPair i = s := by
  decide

/-- Ordered endpoints of each pair in the explicit table. -/
private def localEnds (i : Fin 6) : Fin 4 × Fin 4 :=
  match i.val with
  | 0 => (0, 1)
  | 1 => (0, 2)
  | 2 => (0, 3)
  | 3 => (1, 2)
  | 4 => (1, 3)
  | _ => (2, 3)

/-- Two distinct members of a pair give its endpoints in one of 2 orders. -/
private lemma localPair_alignment :
    ∀ (i j : Fin 4) (k : Fin 6), i ≠ j → i ∈ localPair k → j ∈ localPair k →
      (i = (localEnds k).1 ∧ j = (localEnds k).2) ∨
        (i = (localEnds k).2 ∧ j = (localEnds k).1) := by
  decide

/-- Every pair table entry contains exactly 2 vertices. -/
private lemma localPair_sum :
    ∀ k : Fin 6, (∑ j : Fin 4, if j ∈ localPair k then 1 else 0) = 2 := by
  decide

/-- The 18 free rooted edges are 3 pair choices and 6 remaining Boolean choices. -/
private def localAdj (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool) :
    LocalVertex → LocalVertex → Prop
  | .inl _, .inr (.inl _) => True
  | .inr (.inl _), .inl _ => True
  | .inr (.inl i), .inr (.inr j) => j ∈ localPair (rows i)
  | .inr (.inr j), .inr (.inl i) => j ∈ localPair (rows i)
  | .inr (.inr i), .inr (.inr j) =>
      i ≠ j ∧ ∃ k : Fin 6, bits k = true ∧ i ∈ localPair k ∧ j ∈ localPair k
  | _, _ => False

/-- The rooted edge parameters define a simple graph. -/
private def localGraph (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool) :
    SimpleGraph LocalVertex where
  Adj := localAdj rows bits
  symm := ⟨by
    intro x y h
    rcases x with x | (x | x) <;> rcases y with y | (y | y) <;>
      simp only [localAdj] at h ⊢
    all_goals first | exact h | contradiction | skip
    exact ⟨h.1.symm, h.2.imp (fun k hk ↦ ⟨hk.1, hk.2.2, hk.2.1⟩)⟩⟩
  loopless := ⟨by
    intro x
    rcases x with x | (x | x) <;> simp [localAdj]⟩

/-- Every rooted model has decidable adjacency. -/
private instance (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool) :
    DecidableRel (localGraph rows bits).Adj := by
  intro x y
  change Decidable (localAdj rows bits x y)
  unfold localAdj
  split <;> infer_instance

/-- Fixed labels place the root at 0 and its neighbors at 1, 4, and 7. -/
private def localLabels : LocalVertex ≃ Fin 8 where
  toFun
    | .inl _ => 0
    | .inr (.inl i) => if i.val = 0 then 1 else if i.val = 1 then 4 else 7
    | .inr (.inr j) =>
        if j.val = 0 then 2 else if j.val = 1 then 3 else if j.val = 2 then 5 else 6
  invFun i := match i.val with
    | 0 => .inl ()
    | 1 => .inr (.inl 0)
    | 2 => .inr (.inr 0)
    | 3 => .inr (.inr 1)
    | 4 => .inr (.inl 1)
    | 5 => .inr (.inr 2)
    | 6 => .inr (.inr 3)
    | _ => .inr (.inl 2)
  left_inv := by decide
  right_inv := by decide

/-- Permuting the neighbor and nonneighbor blocks gives all rooted target labels. -/
private def permutedLabels (a : Equiv.Perm (Fin 3)) (b : Equiv.Perm (Fin 4)) :
    LocalVertex ≃ Fin 8 :=
  (Equiv.sumCongr (Equiv.refl Unit) (Equiv.sumCongr a b)).trans localLabels

/-- A valid rooted model is cubic and excludes triangles and independent 4-sets. -/
private def localValid (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool) : Prop :=
  (∀ x, (localGraph rows bits).degree x = 3) ∧
    IsRamseyGraph 3 4 (localGraph rows bits)


/-- A graph with the rooted block structure belongs to the finite model family. -/
private lemma exists_localGraph {H : SimpleGraph LocalVertex} [DecidableRel H.Adj]
    (hrootA : ∀ i : Fin 3, H.Adj modelRoot (modelA i))
    (hrootB : ∀ j : Fin 4, ¬H.Adj modelRoot (modelB j))
    (hind : ∀ i j : Fin 3, ¬H.Adj (modelA i) (modelA j))
    (hreg : ∀ x, H.degree x = 3) :
    ∃ (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool), H = localGraph rows bits := by
  classical
  let S (i : Fin 3) := Finset.univ.filter (fun j : Fin 4 ↦ H.Adj (modelA i) (modelB j))
  have hS (i : Fin 3) : (S i).card = 2 := by
    have hd := hreg (modelA i)
    rw [← SimpleGraph.card_neighborSet_eq_degree, Fintype.card_subtype,
      Finset.card_filter] at hd
    change (∑ v : LocalVertex, if H.Adj (modelA i) v then 1 else 0) = 3 at hd
    simp only [Fintype.sum_sum_type, Fintype.sum_unique] at hd
    change (if H.Adj (modelA i) modelRoot then 1 else 0) +
      ((∑ k : Fin 3, if H.Adj (modelA i) (modelA k) then 1 else 0) +
        ∑ j : Fin 4, if H.Adj (modelA i) (modelB j) then 1 else 0) = 3 at hd
    have hr : H.Adj (modelA i) modelRoot := (hrootA i).symm
    simp only [hr, hind, ite_true, ite_false, Finset.sum_const_zero, add_zero] at hd
    have hs : (S i).card =
        ∑ j : Fin 4, if H.Adj (modelA i) (modelB j) then 1 else 0 := by
      exact Finset.card_filter _ _
    omega
  choose rows hrows using fun i ↦ localPair_complete (S i) (hS i)
  let bits (k : Fin 6) :=
    decide (H.Adj (modelB (localEnds k).1) (modelB (localEnds k).2))
  have hcross (i : Fin 3) (j : Fin 4) :
      H.Adj (modelA i) (modelB j) ↔ j ∈ localPair (rows i) := by
    rw [hrows i]
    simp [S]
  have hbits (i j : Fin 4) : H.Adj (modelB i) (modelB j) ↔
      i ≠ j ∧ ∃ k : Fin 6, bits k = true ∧ i ∈ localPair k ∧ j ∈ localPair k := by
    constructor
    · intro hij
      have hne : i ≠ j := fun he ↦ hij.ne (congrArg modelB he)
      obtain ⟨k, hk⟩ := localPair_complete {i, j} (by simp [hne])
      have hi : i ∈ localPair k := by rw [hk]; simp
      have hj : j ∈ localPair k := by rw [hk]; simp
      refine ⟨hne, k, ?_, hi, hj⟩
      rcases localPair_alignment i j k hne hi hj with h | h
      · simpa only [bits, h.1, h.2, decide_eq_true_eq] using hij
      · simpa only [bits, h.1, h.2, decide_eq_true_eq] using hij.symm
    · rintro ⟨hne, k, hk, hi, hj⟩
      have hadj : H.Adj (modelB (localEnds k).1) (modelB (localEnds k).2) :=
        of_decide_eq_true hk
      rcases localPair_alignment i j k hne hi hj with h | h
      · simpa only [h.1, h.2] using hadj
      · simpa only [h.1, h.2] using hadj.symm
  refine ⟨rows, bits, ?_⟩
  ext x y
  rcases x with ⟨⟩ | (x | x) <;> rcases y with ⟨⟩ | (y | y)
  all_goals first
    | simpa only [localGraph, localAdj] using hbits x y
    | simp [localGraph, localAdj, ← hcross, hrootA, hrootB, hind, H.adj_comm]

/-- The root, its neighbors, and its other vertices partition the vertex type. -/
private def rootedMap {V : Type*} (H : SimpleGraph V) (x : V) :
    Unit ⊕ (H.neighborSet x ⊕ {y : V // y ≠ x ∧ ¬H.Adj x y}) → V
  | .inl _ => x
  | .inr (.inl a) => a
  | .inr (.inr b) => b

/-- The rooted partition map is bijective. -/
private lemma rootedMap_bijective {V : Type*} (H : SimpleGraph V) (x : V) :
    Function.Bijective (rootedMap H x) := by
  classical
  constructor
  · intro u v h
    rcases u with ⟨⟩ | (u | u) <;> rcases v with ⟨⟩ | (v | v) <;>
      simp only [rootedMap] at h
    · rfl
    · exact False.elim (v.property.ne h)
    · exact False.elim (v.property.1 h.symm)
    · exact False.elim (u.property.ne h.symm)
    · simpa only [Sum.inr.injEq, Sum.inl.injEq, Subtype.ext_iff] using h
    · exact False.elim (v.property.2 (h ▸ u.property))
    · exact False.elim (u.property.1 h)
    · exact False.elim (u.property.2 (h.symm ▸ v.property))
    · simpa only [Sum.inr.injEq, Subtype.ext_iff] using h
  · intro y
    by_cases hy : y = x
    · subst y
      exact ⟨.inl (), rfl⟩
    · by_cases ha : H.Adj x y
      · exact ⟨.inr (.inl ⟨y, ha⟩), rfl⟩
      · exact ⟨.inr (.inr ⟨y, hy, ha⟩), rfl⟩

/-- Equality of graphs preserves cubic degrees independently of finite-set instances. -/
private lemma cubic_of_eq {V : Type*} [Fintype V] {G H : SimpleGraph V}
    [DecidableRel G.Adj] [DecidableRel H.Adj] (heq : G = H)
    (hreg : ∀ v, G.degree v = 3) : ∀ v, H.degree v = 3 := by
  have hc : ∀ v, Nat.card (G.neighborSet v) = 3 := by
    intro v
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hreg v
  have hc' : ∀ v, Nat.card (H.neighborSet v) = 3 := heq ▸ hc
  intro v
  simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hc' v

/-- Rooting and enumerating the 2 blocks represents every cubic Ramsey graph by a model. -/
private lemma rooted_normalization {V : Type*} [Fintype V] [DecidableEq V]
    {H : SimpleGraph V} [DecidableRel H.Adj] (hH : IsRamseyGraph 3 4 H)
    (hcard : Nat.card V = 8) (hreg : ∀ v, H.degree v = 3) :
    ∃ (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool),
      Nonempty (H ≃g localGraph rows bits) ∧ localValid rows bits := by
  classical
  have hc : Fintype.card V = 8 := by simpa only [Nat.card_eq_fintype_card] using hcard
  haveI : Nonempty V := Fintype.card_pos_iff.mp (by omega)
  let x : V := Classical.choice inferInstance
  let A := H.neighborSet x
  let B := {y : V // y ≠ x ∧ ¬H.Adj x y}
  let p : Unit ⊕ (A ⊕ B) ≃ V := Equiv.ofBijective (rootedMap H x)
    (rootedMap_bijective H x)
  have ha : Fintype.card A = 3 := by
    simpa only [A, SimpleGraph.card_neighborSet_eq_degree] using hreg x
  have hb : Fintype.card B = 4 := by
    have hp := Fintype.card_congr p
    simp only [Fintype.card_sum, Fintype.card_unit, ha, hc] at hp
    omega
  let eA : Fin 3 ≃ A := (Fintype.equivFinOfCardEq ha).symm
  let eB : Fin 4 ≃ B := (Fintype.equivFinOfCardEq hb).symm
  let e : LocalVertex ≃ V :=
    (Equiv.sumCongr (Equiv.refl Unit) (Equiv.sumCongr eA eB)).trans p
  let K := H.comap e
  have hKA (i : Fin 3) : K.Adj modelRoot (modelA i) := (eA i).property
  have hKB (j : Fin 4) : ¬K.Adj modelRoot (modelB j) := (eB j).property.2
  have hKI (i j : Fin 3) : ¬K.Adj (modelA i) (modelA j) := by
    intro hij
    have hij' : H.Adj (eA i : V) (eA j : V) := hij
    exact (H.isIndepSet_neighborSet_of_triangleFree hH.1 x)
      (eA i).property (eA j).property hij'.ne hij'
  have hKreg (v : LocalVertex) : K.degree v = 3 :=
    ((SimpleGraph.Iso.comap e H).degree_eq v).symm.trans (hreg (e v))
  obtain ⟨rows, bits, hK⟩ := exists_localGraph hKA hKB hKI hKreg
  refine ⟨rows, bits, ?_, ?_⟩
  · exact hK ▸ ⟨(SimpleGraph.Iso.comap e H).symm⟩
  · exact ⟨cubic_of_eq hK hKreg, hK ▸ isRamseyGraph_comap H e.toEmbedding hH⟩

/-- The 6 Boolean choices specify adjacency among the 4 nonneighbors. -/
private def otherAdj (bits : Fin 6 → Bool) (i j : Fin 4) : Prop :=
  i ≠ j ∧ ∃ k : Fin 6, bits k = true ∧ i ∈ localPair k ∧ j ∈ localPair k

/-- Adjacency among the other vertices is decidable. -/
private instance (bits : Fin 6 → Bool) : DecidableRel (otherAdj bits) := by
  unfold otherAdj
  infer_instance

/-- The pair table recovers each of its 6 Boolean edge choices. -/
private lemma otherAdj_recover :
    ∀ (bits : Fin 6 → Bool) (k : Fin 6),
      otherAdj bits (localEnds k).1 (localEnds k).2 ↔ bits k = true := by
  decide

/-- Counting neighbors among the 4 vertices counts each incident selected pair once. -/
private lemma otherAdj_degree :
    ∀ (bits : Fin 6 → Bool) (j : Fin 4),
      (∑ l : Fin 4, if otherAdj bits j l then 1 else 0) =
        ∑ k : Fin 6, if bits k = true ∧ j ∈ localPair k then 1 else 0 := by
  decide

/-- Cubic degrees force exactly 3 edges among the 4 nonneighbors. -/
private lemma localBits_three (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool)
    (hreg : ∀ x, (localGraph rows bits).degree x = 3) :
    (Finset.univ.filter (fun k : Fin 6 ↦ bits k = true)).card = 3 := by
  have hd (j : Fin 4) : (localGraph rows bits).degree (modelB j) =
      (∑ i : Fin 3, if j ∈ localPair (rows i) then 1 else 0) +
        ∑ k : Fin 6, if bits k = true ∧ j ∈ localPair k then 1 else 0 := by
    rw [← SimpleGraph.card_neighborSet_eq_degree, Fintype.card_subtype,
      Finset.card_filter]
    change (∑ v : LocalVertex,
      if (localGraph rows bits).Adj (modelB j) v then 1 else 0) = _
    simp only [Fintype.sum_sum_type, Fintype.sum_unique, localGraph, localAdj,
      ite_false, zero_add]
    exact congrArg ((∑ i : Fin 3, if j ∈ localPair (rows i) then 1 else 0) + ·)
      (otherAdj_degree bits j)
  have hc : (∑ j : Fin 4, ∑ i : Fin 3,
      if j ∈ localPair (rows i) then 1 else 0) = 6 := by
    rw [Finset.sum_comm]
    simp only [localPair_sum, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
      smul_eq_mul]
  have hb : (∑ j : Fin 4, ∑ k : Fin 6,
      if bits k = true ∧ j ∈ localPair k then 1 else 0) =
        2 * ∑ k : Fin 6, if bits k = true then 1 else 0 := by
    rw [Finset.sum_comm, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro k _
    by_cases hk : bits k = true
    · simpa only [hk, true_and, ite_true, mul_one] using localPair_sum k
    · simp [hk]
  have ht := Finset.sum_congr (s₁ := Finset.univ) rfl (fun j _ ↦ hd j)
  simp only [Finset.sum_add_distrib, hc, hb, hreg, Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, smul_eq_mul] at ht
  have hs : (Finset.univ.filter (fun k : Fin 6 ↦ bits k = true)).card =
      ∑ k : Fin 6, if bits k = true then 1 else 0 := Finset.card_filter _ _
  omega

/-- The canonical path on the 4 nonneighbors has edge indices 0, 2, and 5. -/
private def pathBits (k : Fin 6) : Bool := decide (k = 0 ∨ k = 2 ∨ k = 5)

/-- The canonical path agrees with the Möbius-ladder nonneighbor labels. -/
private lemma pathBits_correct : ∀ i j : Fin 4,
    otherAdj pathBits i j ↔ mobius8.Adj (localLabels (modelB i))
      (localLabels (modelB j)) := by
  decide

set_option maxRecDepth 10000 in
/-- A 4-vertex graph with 3 edges, no triangle, and no independent triple is a path. -/
private lemma otherPath_complete :
    ∀ bits : Fin 6 → Bool,
      (Finset.univ.filter (fun k : Fin 6 ↦ bits k = true)).card = 3 →
      (∀ i j k : Fin 4, otherAdj bits i j → otherAdj bits i k → ¬otherAdj bits j k) →
      (∀ i j k : Fin 4, i ≠ j → i ≠ k → j ≠ k →
        otherAdj bits i j ∨ otherAdj bits i k ∨ otherAdj bits j k) →
      ∃ b : Equiv.Perm (Fin 4), ∀ i j,
        otherAdj bits (b i) (b j) ↔ otherAdj pathBits i j := by
  decide

set_option maxRecDepth 10000 in
/-- Once the path is labelled, cubic triangle avoidance forces the 3 neighbor rows. -/
private lemma pathRows_complete :
    ∀ rows : Fin 3 → Fin 6,
      (∀ x, (localGraph rows pathBits).degree x = 3) →
      (∀ (i : Fin 3) (j k : Fin 4), j ∈ localPair (rows i) →
        k ∈ localPair (rows i) → ¬otherAdj pathBits j k) →
      ∃ a : Equiv.Perm (Fin 3), ∀ x y,
        mobius8.Adj (permutedLabels a (Equiv.refl _) x)
            (permutedLabels a (Equiv.refl _) y) ↔ (localGraph rows pathBits).Adj x y := by
  decide

/-- Triangle exclusion and independent-set exclusion descend to the 4 nonneighbors. -/
private lemma localBits_obstructions (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool)
    (hH : IsRamseyGraph 3 4 (localGraph rows bits)) :
    (∀ i j k : Fin 4, otherAdj bits i j → otherAdj bits i k → ¬otherAdj bits j k) ∧
      (∀ i j k : Fin 4, i ≠ j → i ≠ k → j ≠ k →
        otherAdj bits i j ∨ otherAdj bits i k ∨ otherAdj bits j k) := by
  let G := localGraph rows bits
  constructor
  · intro i j k hij hik hjk
    exact hH.1 {modelB i, modelB j, modelB k}
      (G.is3Clique_triple_iff.mpr ⟨hij, hik, hjk⟩)
  · intro i j k hij hik hjk
    by_contra h
    have hnij : ¬otherAdj bits i j := fun hh ↦ h (Or.inl hh)
    have hnik : ¬otherAdj bits i k := fun hh ↦ h (Or.inr (Or.inl hh))
    have hnjk : ¬otherAdj bits j k := fun hh ↦ h (Or.inr (Or.inr hh))
    have h3 : Gᶜ.IsNClique 3 {modelB i, modelB j, modelB k} := by
      apply (Gᶜ).is3Clique_triple_iff.mpr
      refine ⟨⟨?_, hnij⟩, ⟨?_, hnik⟩, ⟨?_, hnjk⟩⟩
      · exact fun he ↦ hij (Sum.inr.inj (Sum.inr.inj he))
      · exact fun he ↦ hik (Sum.inr.inj (Sum.inr.inj he))
      · exact fun he ↦ hjk (Sum.inr.inj (Sum.inr.inj he))
    have hr (l : Fin 4) : Gᶜ.Adj modelRoot (modelB l) := by
      simp [G, localGraph, localAdj, SimpleGraph.compl_adj]
    have h4 := h3.insert (a := modelRoot) (by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl <;> exact hr _)
    exact ((SimpleGraph.cliqueFree_compl G).mpr hH.2) _ h4

/-- Relabelling the 4 nonneighbors along their path finishes the local classification. -/
private theorem localModels_complete (rows : Fin 3 → Fin 6) (bits : Fin 6 → Bool)
    (hv : localValid rows bits) : Nonempty (localGraph rows bits ≃g mobius8) := by
  classical
  let G := localGraph rows bits
  obtain ⟨htri, hind⟩ := localBits_obstructions rows bits hv.2
  obtain ⟨b, hb⟩ := otherPath_complete bits (localBits_three rows bits hv.1) htri hind
  let e : LocalVertex ≃ LocalVertex :=
    Equiv.sumCongr (Equiv.refl Unit) (Equiv.sumCongr (Equiv.refl (Fin 3)) b)
  let K := G.comap e
  have hKA (i : Fin 3) : K.Adj modelRoot (modelA i) := by
    change True
    trivial
  have hKB (j : Fin 4) : ¬K.Adj modelRoot (modelB j) := by
    change ¬False
    trivial
  have hKI (i j : Fin 3) : ¬K.Adj (modelA i) (modelA j) := by
    change ¬False
    trivial
  have hKreg (v : LocalVertex) : K.degree v = 3 :=
    ((SimpleGraph.Iso.comap e G).degree_eq v).symm.trans (hv.1 (e v))
  obtain ⟨rows', bits', hK⟩ := exists_localGraph hKA hKB hKI hKreg
  have ho (i j : Fin 4) : otherAdj bits' i j ↔ otherAdj pathBits i j := by
    change (localGraph rows' bits').Adj (modelB i) (modelB j) ↔ _
    rw [← hK]
    exact hb i j
  have hbits : bits' = pathBits := by
    funext k
    have ht : bits' k = true ↔ pathBits k = true :=
      (otherAdj_recover bits' k).symm.trans
        ((ho (localEnds k).1 (localEnds k).2).trans (otherAdj_recover pathBits k))
    cases h1 : bits' k <;> cases h2 : pathBits k <;> simp_all
  subst bits'
  have hreg' : ∀ v, (localGraph rows' pathBits).degree v = 3 := cubic_of_eq hK hKreg
  have hRamsey' : IsRamseyGraph 3 4 (localGraph rows' pathBits) := by
    rw [← hK]
    exact isRamseyGraph_comap G e.toEmbedding hv.2
  have hrows : ∀ (i : Fin 3) (j k : Fin 4), j ∈ localPair (rows' i) →
      k ∈ localPair (rows' i) → ¬otherAdj pathBits j k := by
    intro i j k hij hik hjk
    exact hRamsey'.1 {modelA i, modelB j, modelB k}
      ((localGraph rows' pathBits).is3Clique_triple_iff.mpr ⟨hij, hik, hjk⟩)
  obtain ⟨a, ha⟩ := pathRows_complete rows' hreg' hrows
  let f : localGraph rows' pathBits ≃g mobius8 :=
    { permutedLabels a (Equiv.refl _) with map_rel_iff' := fun {x y} ↦ ha x y }
  have fK : K ≃g mobius8 := hK.symm ▸ f
  exact ⟨(SimpleGraph.Iso.comap e G).symm.trans fK⟩

/-- Every cubic 8-vertex (3,4)-Ramsey graph is isomorphic to the Möbius ladder. -/
public theorem mobius8_unique {V : Type*} [Fintype V] [DecidableEq V]
    {H : SimpleGraph V} [DecidableRel H.Adj] (hH : IsRamseyGraph 3 4 H)
    (hcard : Nat.card V = 8) (hreg : ∀ v, H.degree v = 3) :
    Nonempty (H ≃g mobius8) := by
  obtain ⟨rows, bits, ⟨f⟩, hv⟩ := rooted_normalization hH hcard hreg
  obtain ⟨g⟩ := localModels_complete rows bits hv
  exact ⟨f.trans g⟩

/-- Every vertex of the Möbius ladder has degree 3. -/
public theorem mobius8_degree : ∀ v : Fin 8, mobius8.degree v = 3 := by
  decide

set_option maxRecDepth 10000 in
/-- The Möbius ladder has no triangle and no independent set of size 4. -/
public theorem mobius8_isRamseyGraph : IsRamseyGraph 3 4 mobius8 := by
  constructor
  · change ∀ s : Finset (Fin 8), ¬mobius8.IsNClique 3 s
    decide
  · change ∀ s : Finset (Fin 8), ¬mobius8.IsNIndepSet 4 s
    decide

end Ramsey.n17
