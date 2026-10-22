module

public import Ramsey.n17.Structure
public import Ramsey.n17.M8
public import Ramsey.n17.Signatures
public import Mathlib.Data.Fintype.Powerset

/-!
# Signatures outside a rooted Wagner neighborhood

A neighborhood labeling gives 38 possible outside signatures and their exact pair incidences.
-/

namespace Ramsey.n17

open scoped BigOperators

variable {V : Type*}

/-- A sum over a subtype is the corresponding sum of indicators. -/
private lemma sum_subtype_indicator [Fintype V] (p : V → Prop) [DecidablePred p]
    (f : V → ℕ) :
    (∑ x : {x // p x}, f x) = ∑ x : V, if p x then f x else 0 := by
  classical
  rw [← Finset.sum_filter]
  exact (Finset.sum_subtype _ (by simp) f).symm

/-- A set cardinality is the sum of its membership indicators. -/
private lemma card_set_indicator [Fintype V] (p : V → Prop) [DecidablePred p] :
    Nat.card {x // p x} = ∑ x : V, if p x then 1 else 0 := by
  classical
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype, Finset.card_filter]

/-- A root, its neighborhood, and its antineighborhood partition all finite sums. -/
private lemma sum_root_partition [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) (f : V → ℕ) :
    f v + (∑ a : G.neighborSet v, f a) +
      (∑ y : antiNeighborSet G v, f y) = ∑ z : V, f z := by
  classical
  rw [sum_subtype_indicator, sum_subtype_indicator]
  have hpoint (z : V) :
      (if z = v then f z else 0) + (if z ∈ G.neighborSet v then f z else 0) +
        (if z ∈ antiNeighborSet G v then f z else 0) = f z := by
    by_cases hz : z = v
    · subst z
      simp [antiNeighborSet]
    · by_cases ha : G.Adj v z <;> simp [antiNeighborSet, hz, ha]
  have h := Finset.sum_congr (s₁ := Finset.univ) rfl (fun z _ ↦ hpoint z)
  simpa only [Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ,
    ite_true] using h

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Every admissible 4-set is one of the 38 explicit signatures. -/
private lemma signatureSet_complete :
    ∀ S : Finset (Fin 8), S.card = 4 →
      (∀ i j k : Fin 8, i ∉ S → j ∉ S → k ∉ S → i ≠ j → i ≠ k → j ≠ k →
        ¬mobius8.Adj i j → ¬mobius8.Adj i k → mobius8.Adj j k) →
      ∃ t : Fin 38, signatureSet t = S := by
  have hcover : ∀ S : Finset (Fin 8), S.card = 4 →
      (∃ t : Fin 38, signatureSet t = S) ∨
        ∃ i j k : Fin 8, (i ∉ S ∧ j ∉ S ∧ k ∉ S) ∧
          (i ≠ j ∧ i ≠ k ∧ j ≠ k) ∧
          (¬mobius8.Adj i j ∧ ¬mobius8.Adj i k ∧ ¬mobius8.Adj j k) := by
    decide +kernel
  intro S hcard hallowed
  rcases hcover S hcard with hs | ⟨i, j, k, ⟨hi, hj, hk⟩, ⟨hij, hik, hjk⟩, haij, haik, hajk⟩
  · exact hs
  · exact (hajk (hallowed i j k hi hj hk hij hik hjk haij haik)).elim

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The local common-neighbor count gives the stated outside pair budget. -/
private lemma mobius8_pair_budget :
    ∀ i j : Fin 8, i ≠ j →
      1 + (∑ k : Fin 8, if mobius8.Adj i k ∧ mobius8.Adj j k then 1 else 0) +
        signaturePairBudget i j = if mobius8.Adj i j then 3 else 4 := by
  decide

/-- The outside vertices have cardinality 8. -/
public lemma rooted_outside_card [Fintype V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17) (v : V) :
    Nat.card (antiNeighborSet G v) = 8 := by
  have hp := card_neighborSet_add_antiNeighborSet G v
  have hn := card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hG hcard v
  omega

/-- The neighborhood signature of an outside vertex. -/
public noncomputable def rootedNeighborSet [Fintype V] {G : SimpleGraph V} (v : V)
    (e : G.neighborSet v ≃ Fin 8) (y : antiNeighborSet G v) : Finset (Fin 8) := by
  classical
  exact Finset.univ.filter (fun i ↦ G.Adj (e.symm i) y)

/-- Membership in a rooted signature means adjacency to the labeled neighbor. -/
@[simp] public lemma mem_rootedNeighborSet [Fintype V] {G : SimpleGraph V} (v : V)
    (e : G.neighborSet v ≃ Fin 8) (y : antiNeighborSet G v) (i : Fin 8) :
    i ∈ rootedNeighborSet v e y ↔ G.Adj (e.symm i) y := by
  classical
  simp [rootedNeighborSet]

/-- Each outside vertex has exactly 4 neighbors in the root neighborhood. -/
private lemma rootedNeighborSet_card [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17)
    (v : V) (e : G.neighborSet v ≃ Fin 8) (y : antiNeighborSet G v) :
    (rootedNeighborSet v e y).card = 4 := by
  classical
  have hc := (isSRGWith hG hcard).of_not_adj y.property.1.symm y.property.2
  have hsum : (rootedNeighborSet v e y).card =
      Nat.card (G.commonNeighbors v y) := by
    rw [rootedNeighborSet, Finset.card_filter, card_set_indicator]
    calc
      _ = ∑ a : G.neighborSet v, if G.Adj a y then 1 else 0 := by
        apply Fintype.sum_equiv e.symm
        intro i
        split_ifs <;> rfl
      _ = ∑ z : V, if z ∈ G.commonNeighbors v y then 1 else 0 := by
        calc
          _ = ∑ z ∈ Finset.univ.filter (fun z ↦ G.Adj v z),
              if G.Adj z y then 1 else 0 :=
            (Finset.sum_subtype _ (by simp) (fun z ↦ if G.Adj z y then 1 else 0)).symm
          _ = _ := by
            rw [Finset.sum_filter]
            apply Finset.sum_congr rfl
            intro z _
            simp only [SimpleGraph.mem_commonNeighbors,
              SimpleGraph.adj_comm (G := G) y z]
            split_ifs <;> simp_all
  simpa only [Nat.card_eq_fintype_card] using hsum.trans (by
    simpa only [Nat.card_eq_fintype_card] using hc)

/-- The complement of an outside signature contains no independent triple. -/
private lemma rootedNeighborSet_no_triple [Fintype V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) (v : V) (e : G.neighborSet v ≃ Fin 8)
    (he : ∀ a b : G.neighborSet v, G.Adj a b ↔ mobius8.Adj (e a) (e b))
    (y : antiNeighborSet G v) :
    ∀ i j k : Fin 8, i ∉ rootedNeighborSet v e y → j ∉ rootedNeighborSet v e y →
      k ∉ rootedNeighborSet v e y → i ≠ j → i ≠ k → j ≠ k →
      ¬mobius8.Adj i j → ¬mobius8.Adj i k → mobius8.Adj j k := by
  classical
  intro i j k hi hj hk hij hik hjk haij haik
  by_contra hajk
  have hne (a : Fin 8) : (e.symm a : V) ≠ y := by
    intro h
    exact y.property.2 (h ▸ (e.symm a).property)
  have hdist (a b : Fin 8) (hab : a ≠ b) : (e.symm a : V) ≠ e.symm b := by
    intro h
    exact hab (e.symm.injective (Subtype.ext h))
  have hna (a b : Fin 8) (hab : ¬mobius8.Adj a b) :
      ¬G.Adj (e.symm a) (e.symm b) := by
    intro h
    apply hab
    simpa using (he (e.symm a) (e.symm b)).mp h
  have hiy : Gᶜ.Adj (e.symm i) y := ⟨hne i, by simpa using hi⟩
  have hjy : Gᶜ.Adj (e.symm j) y := ⟨hne j, by simpa using hj⟩
  have hky : Gᶜ.Adj (e.symm k) y := ⟨hne k, by simpa using hk⟩
  have hij' : Gᶜ.Adj (e.symm i : V) (e.symm j) := ⟨hdist i j hij, hna i j haij⟩
  have hik' : Gᶜ.Adj (e.symm i : V) (e.symm k) := ⟨hdist i k hik, hna i k haik⟩
  have hjk' : Gᶜ.Adj (e.symm j : V) (e.symm k) := ⟨hdist j k hjk, hna j k hajk⟩
  have h1 : Gᶜ.IsNClique 1 {(y : V)} := by simp
  have h2 := h1.insert (a := (e.symm k : V)) (by simpa using hky)
  have h3 := h2.insert (a := (e.symm j : V)) (by simpa using And.intro hjk' hjy)
  have h4 := h3.insert (a := (e.symm i : V)) (by
    simpa using And.intro hij' (And.intro hik' hiy))
  exact (SimpleGraph.cliqueFree_compl G).mpr hG.2 _ h4

/-- Every outside vertex has an explicit signature index. -/
public lemma rooted_signature_exists [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17)
    (v : V) (e : G.neighborSet v ≃ Fin 8)
    (he : ∀ a b : G.neighborSet v, G.Adj a b ↔ mobius8.Adj (e a) (e b))
    (y : antiNeighborSet G v) :
    ∃ t : Fin 38, signatureSet t = rootedNeighborSet v e y :=
  signatureSet_complete _ (rootedNeighborSet_card hG hcard v e y)
    (rootedNeighborSet_no_triple hG v e he y)

/-- Common neighbors outside the root neighborhood satisfy the exact pair budgets. -/
public lemma rooted_outside_pair_count [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17)
    (v : V) (e : G.neighborSet v ≃ Fin 8)
    (he : ∀ a b : G.neighborSet v, G.Adj a b ↔ mobius8.Adj (e a) (e b))
    (i j : Fin 8) (hij : i ≠ j) :
    (∑ y : antiNeighborSet G v,
      if G.Adj (e.symm i) y ∧ G.Adj (e.symm j) y then 1 else 0) =
        signaturePairBudget i j := by
  classical
  let a : V := e.symm i
  let b : V := e.symm j
  have hab : a ≠ b := by
    intro h
    exact hij (e.symm.injective (Subtype.ext h))
  have hcommon : Nat.card (G.commonNeighbors a b) =
      if mobius8.Adj i j then 3 else 4 := by
    have heab : G.Adj a b ↔ mobius8.Adj i j := by
      simpa [a, b] using he (e.symm i) (e.symm j)
    by_cases hm : mobius8.Adj i j
    · simpa only [Nat.card_eq_fintype_card, hm, ite_true] using
        (isSRGWith hG hcard).of_adj a b (heab.mpr hm)
    · simpa only [Nat.card_eq_fintype_card, hm, ite_false] using
        (isSRGWith hG hcard).of_not_adj hab (mt heab.mp hm)
  have hpart := sum_root_partition G v
    (fun z ↦ if G.Adj a z ∧ G.Adj b z then 1 else 0)
  have hroot : (if G.Adj a v ∧ G.Adj b v then 1 else 0) = 1 := by
    simp [a, b, (e.symm i).property.symm, (e.symm j).property.symm]
  have hlocal : (∑ z : G.neighborSet v,
      if G.Adj a z ∧ G.Adj b z then 1 else 0) =
      ∑ k : Fin 8, if mobius8.Adj i k ∧ mobius8.Adj j k then 1 else 0 := by
    apply Fintype.sum_equiv e
    intro z
    simp only [a, b, he, e.apply_symm_apply]
  have htotal : (∑ z : V, if G.Adj a z ∧ G.Adj b z then 1 else 0) =
      Nat.card (G.commonNeighbors a b) := by
    rw [Nat.card_eq_fintype_card, Fintype.card_subtype, Finset.card_filter]
    apply Finset.sum_congr rfl
    intro z _
    simp only [SimpleGraph.mem_commonNeighbors]
  rw [hroot, hlocal, htotal, hcommon] at hpart
  have hbudget := mobius8_pair_budget i j hij
  change (∑ y : antiNeighborSet G v, if G.Adj a y ∧ G.Adj b y then 1 else 0) = _
  omega

/-- The fiber cardinalities of a signature map. -/
@[expose] public noncomputable def signatureMultiplicity {B : Type*} [Finite B]
    (sig : B → Fin 38)
    (k : Fin 38) : ℕ := Nat.card {y // sig y = k}

/-- Signature multiplicities sum to the number of outside vertices. -/
public lemma signatureMultiplicity_total {B : Type*} [Fintype B] (sig : B → Fin 38) :
    (∑ k, signatureMultiplicity sig k) = Nat.card B := by
  classical
  simpa [signatureMultiplicity, Nat.card_eq_fintype_card] using
    (Fintype.sum_fiberwise sig (fun _ ↦ (1 : ℕ)))

/-- Summing signature multiplicities transports any pair incidence count. -/
private lemma signatureMultiplicity_pair {B : Type*} [Fintype B] (sig : B → Fin 38)
    (i j : Fin 8) :
    (∑ k, if i ∈ signatureSet k ∧ j ∈ signatureSet k then
      signatureMultiplicity sig k else 0) =
      ∑ y : B, if i ∈ signatureSet (sig y) ∧ j ∈ signatureSet (sig y) then 1 else 0 := by
  classical
  calc
    _ = ∑ k, ∑ _y : {y // sig y = k},
        if i ∈ signatureSet k ∧ j ∈ signatureSet k then 1 else 0 := by
      apply Finset.sum_congr rfl
      intro k _
      by_cases h : i ∈ signatureSet k ∧ j ∈ signatureSet k <;>
        simp [h, signatureMultiplicity, Nat.card_eq_fintype_card]
    _ = _ := Fintype.sum_fiberwise' sig _

/-- Full incidence data for the vertices outside a labeled root neighborhood. -/
public structure SignatureData [Fintype V] (G : SimpleGraph V) (v : V)
    (e : G.neighborSet v ≃ Fin 8) where
  /-- The explicit signature index of each outside vertex. -/
  sig : antiNeighborSet G v → Fin 38
  /-- Signature membership describes every edge from the neighborhood to the outside. -/
  incidence : ∀ (y : antiNeighborSet G v) (i : Fin 8),
    G.Adj (e.symm i) y ↔ i ∈ signatureSet (sig y)
  /-- There are exactly 8 outside vertices. -/
  outside_card : Nat.card (antiNeighborSet G v) = 8
  /-- The multiplicities have total 8. -/
  total : ∑ k, signatureMultiplicity sig k = 8
  /-- Every distinct ordered pair has its exact outside incidence budget. -/
  pairs : ∀ i j : Fin 8, i < j →
    (∑ k, if (signatureMask k / 2 ^ i.val) % 2 = 1 ∧
      (signatureMask k / 2 ^ j.val) % 2 = 1 then signatureMultiplicity sig k else 0) =
        signaturePairBudget i j

/-- A neighborhood isomorphism produces all outside signature incidence data. -/
public noncomputable def rootedSignatureData [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17)
    (v : V) (e : G.neighborSet v ≃ Fin 8)
    (he : ∀ a b : G.neighborSet v, G.Adj a b ↔ mobius8.Adj (e a) (e b)) :
    SignatureData G v e := by
  classical
  let sig (y : antiNeighborSet G v) : Fin 38 :=
    (rooted_signature_exists hG hcard v e he y).choose
  have hsig (y : antiNeighborSet G v) : signatureSet (sig y) = rootedNeighborSet v e y :=
    (rooted_signature_exists hG hcard v e he y).choose_spec
  have hinc (y : antiNeighborSet G v) (i : Fin 8) :
      G.Adj (e.symm i) y ↔ i ∈ signatureSet (sig y) := by
    rw [hsig]
    exact (mem_rootedNeighborSet v e y i).symm
  refine ⟨sig, hinc, rooted_outside_card hG hcard v, ?_, ?_⟩
  · rw [signatureMultiplicity_total, rooted_outside_card hG hcard v]
  · intro i j hij
    simp_rw [← mem_signatureSet_iff]
    rw [signatureMultiplicity_pair]
    simp_rw [← hinc]
    exact rooted_outside_pair_count hG hcard v e he i j (ne_of_lt hij)

end Ramsey.n17
