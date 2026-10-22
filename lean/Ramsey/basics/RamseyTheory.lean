module

public import Ramsey.defs.Transversals
public import Ramsey.basics.GraphTheory
public import Mathlib.Tactic

/-!
# Elementary Ramsey theory

Complement and induced-subgraph restrictions, finite-type bounds and the additive recurrence.
The explicit bound predicates do not assume existence of a finite Ramsey number.
-/

namespace Ramsey

variable {V : Type*}

/-- The antineighborhood is the neighborhood in the complement graph. -/
public lemma antiNeighborSet_eq_compl (G : SimpleGraph V) (v : V) :
    antiNeighborSet G v = Gᶜ.neighborSet v := by
  ext w
  simp [antiNeighborSet, SimpleGraph.compl_adj, ne_comm]

/-- The neighborhood, antineighborhood and pivot partition the vertex count. -/
public lemma card_neighborSet_add_antiNeighborSet [Finite V] (G : SimpleGraph V) (v : V) :
    Nat.card ↥(G.neighborSet v) + Nat.card ↥(antiNeighborSet G v) + 1 = Nat.card V := by
  rw [antiNeighborSet_eq_compl, Nat.card_coe_set_eq,
    Nat.card_coe_set_eq, ← Set.ncard_union_eq (G.compl_neighborSet_disjoint v)]
  rw [G.neighborSet_union_compl_neighborSet_eq, Set.ncard_compl, Set.ncard_singleton]
  have := Nat.card_pos_iff.mpr (show Nonempty V ∧ Finite V from ⟨⟨v⟩, inferInstance⟩)
  omega

/-- Complement symmetry: swapping the clique and independence sides. -/
public lemma isRamseyGraph_compl (G : SimpleGraph V) {s t : ℕ} :
    IsRamseyGraph s t G ↔ IsRamseyGraph t s Gᶜ := by
  simp [IsRamseyGraph, and_comm]

/-- Transfer along an embedding: `G.comap f` is the induced structure of `G`
on the range of `f`, reindexed. -/
public lemma isRamseyGraph_comap {W : Type*} {s t : ℕ} (G : SimpleGraph V) (f : W ↪ V)
    (hG : IsRamseyGraph s t G) : IsRamseyGraph s t (G.comap f) := by
  obtain ⟨hc, hi⟩ := hG
  have hcc : (G.comap f)ᶜ = Gᶜ.comap f := by ext a b; simp [SimpleGraph.comap_adj]
  have hc' : Gᶜ.CliqueFree t := (SimpleGraph.cliqueFree_compl G).mpr hi
  refine ⟨SimpleGraph.CliqueFree.comap (comap_isContained G f) hc, ?_⟩
  rw [← SimpleGraph.cliqueFree_compl, hcc]
  exact SimpleGraph.CliqueFree.comap (comap_isContained Gᶜ f) hc'

/-- If no graph on `Fin n` is `(s, t)`-Ramsey, then `ramseyNumber s t ≤ n`. -/
public lemma ramseyNumber_le_of_forall {s t n : ℕ}
    (h : ∀ G : SimpleGraph (Fin n), ¬IsRamseyGraph s t G) : ramseyNumber s t ≤ n :=
  Nat.sInf_le (fun ⟨G, hG⟩ ↦ h G hG)

/-- Below `ramseyNumber s t` a witness graph exists. The converse needs the
defining set to be nonempty (finite Ramsey theorem), which is not available. -/
public lemma exists_of_lt_ramseyNumber {s t n : ℕ} (h : n < ramseyNumber s t) :
    ∃ G : SimpleGraph (Fin n), IsRamseyGraph s t G := by
  by_contra hc
  exact absurd (Nat.sInf_le hc) (not_le.2 h)

/-- Ramsey exclusion is inherited by every induced subgraph. -/
public lemma isRamseyGraph_induce {G : SimpleGraph V} {r s : ℕ}
    (hG : IsRamseyGraph r s G) (A : Set V) : IsRamseyGraph r s (G.induce A) := by
  refine ⟨?_, indepSetFree_induce _ _ hG.2⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  exact fun t _ ↦ hG.1 t

/-- An induced Ramsey restriction is inherited by smaller vertex sets. -/
public lemma isRamseyGraph_induce_subset {G : SimpleGraph V} {r s : ℕ} {A B : Set V}
    (hG : IsRamseyGraph r s (G.induce B)) (hAB : A ⊆ B) :
    IsRamseyGraph r s (G.induce A) := by
  rw [IsRamseyGraph, SimpleGraph.cliqueFree_induce_iff, indepSetFree_induce_iff] at hG ⊢
  exact ⟨fun _ ht ↦ hG.1 (ht.trans hAB), fun _ ht ↦ hG.2 _ (ht.trans hAB)⟩

/-- A neighborhood lowers the excluded clique size by 1. -/
public lemma isRamseyGraph_induce_neighborSet_succ {V : Type*} {G : SimpleGraph V}
    {r s : ℕ} (hG : IsRamseyGraph (r + 1) s G) (v : V) :
    IsRamseyGraph r s (G.induce (G.neighborSet v)) := by
  classical
  refine ⟨?_, indepSetFree_induce _ _ hG.2⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t hts ht
  exact hG.1 _ (ht.insert fun w hw ↦ (hts (Finset.mem_coe.mpr hw) : G.Adj v w))

/-- An antineighborhood lowers the excluded independent-set size by 1. -/
public lemma isRamseyGraph_induce_antiNeighborSet_succ {G : SimpleGraph V} {r s : ℕ}
    (hG : IsRamseyGraph r (s + 1) G) (v : V) :
    IsRamseyGraph r s (G.induce (antiNeighborSet G v)) := by
  rw [isRamseyGraph_compl, compl_induce, antiNeighborSet_eq_compl]
  exact isRamseyGraph_induce_neighborSet_succ ((isRamseyGraph_compl G).mp hG) v

/-- Common neighbors of adjacent vertices form a `(3,5)`-Ramsey graph. -/
public lemma isRamseyGraph_induce_commonNeighbors {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) {v w : V} (hvw : G.Adj v w) :
    IsRamseyGraph 3 5 (G.induce (G.commonNeighbors v w)) := by
  classical
  refine ⟨?_, indepSetFree_induce _ _ hG.2⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t ht hc
  exact hG.1 _ ((hc.insert fun x hx ↦ (ht hx).2).insert fun x hx ↦ by
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hvw
    · exact (ht hx).1)

/-- A mixed cell is `(4,4)`-Ramsey without any edge or distinctness assumption on its anchors. -/
public lemma isRamseyGraph_induce_mixedCell {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (u w : V) :
    IsRamseyGraph 4 4 (G.induce (G.neighborSet u ∩ antiNeighborSet G w)) := by
  have hN := isRamseyGraph_induce_subset (isRamseyGraph_induce_neighborSet_succ hG u)
    (Set.inter_subset_left : G.neighborSet u ∩ antiNeighborSet G w ⊆ G.neighborSet u)
  have hM := isRamseyGraph_induce_subset (isRamseyGraph_induce_antiNeighborSet_succ hG w)
    (Set.inter_subset_right : G.neighborSet u ∩ antiNeighborSet G w ⊆ antiNeighborSet G w)
  exact ⟨hN.1, hM.2⟩

/-- The common antineighborhood is the common neighborhood in the complement.
Both anchors are excluded. -/
public lemma commonAntiNeighborSet_eq_compl (G : SimpleGraph V) (u w : V) :
    antiNeighborSet G u ∩ antiNeighborSet G w = Gᶜ.commonNeighbors u w := by
  rw [antiNeighborSet_eq_compl, antiNeighborSet_eq_compl]
  rfl

/-- Distinct nonadjacent anchors have a `(5,3)`-Ramsey common antineighborhood. -/
public lemma isRamseyGraph_induce_commonAntiNeighbors {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) {u w : V} (hne : u ≠ w) (hnadj : ¬G.Adj u w) :
    IsRamseyGraph 5 3 (G.induce (antiNeighborSet G u ∩ antiNeighborSet G w)) := by
  have hc := isRamseyGraph_induce_commonNeighbors ((isRamseyGraph_compl G).mp hG)
    (show Gᶜ.Adj u w from ⟨hne, hnadj⟩)
  rw [commonAntiNeighborSet_eq_compl]
  exact (isRamseyGraph_compl _).mpr (by simpa [compl_induce] using hc)

/-- An upper bound excludes Ramsey graphs on any finite type of at least that
order. -/
public lemma RamseyUpperBound.not_isRamseyGraph {r s R : ℕ} (hR : RamseyUpperBound r s R)
    [Finite V] (h : R ≤ Nat.card V) (G : SimpleGraph V) : ¬IsRamseyGraph r s G := by
  let : Fintype V := Fintype.ofFinite V
  let f : Fin R ↪ V := Classical.choice
    (Function.Embedding.nonempty_of_card_le (by simpa [Nat.card_eq_fintype_card] using h))
  exact fun hG ↦ hR (G.comap f) (isRamseyGraph_comap G f hG)

/-- Complement symmetry for explicit Ramsey upper bounds. -/
public lemma RamseyUpperBound.compl {r s R : ℕ} (hR : RamseyUpperBound r s R) :
    RamseyUpperBound s r R :=
  fun G hG ↦ hR Gᶜ ((isRamseyGraph_compl G).mp hG)

/-- Every finite Ramsey graph has order strictly below an explicit upper bound. -/
public lemma RamseyUpperBound.card_lt {r s R : ℕ} (hR : RamseyUpperBound r s R)
    [Finite V] {G : SimpleGraph V} (hG : IsRamseyGraph r s G) : Nat.card V < R := by
  by_contra h
  exact hR.not_isRamseyGraph (Nat.le_of_not_gt h) G hG

/-- Apply a published lower edge bound on any finite type of exactly the
stated order. -/
public lemma RamseyEdgeLowerBound.on_finite_type {n r s : ℕ} {L : ℝ}
    (hL : RamseyEdgeLowerBound n r s L) [Finite V] (hn : Nat.card V = n)
    (G : SimpleGraph V) (hG : IsRamseyGraph r s G) : L ≤ (Nat.card G.edgeSet : ℝ) := by
  let : Fintype V := Fintype.ofFinite V
  have hn' : Fintype.card V = n := by simpa only [Nat.card_eq_fintype_card] using hn
  have h := hL (G.overFin hn')
    (isRamseyGraph_comap G (Fintype.equivFinOfCardEq hn').symm.toEmbedding hG)
  have he := Nat.card_congr (G.overFinIso hn').mapEdgeSet
  rwa [← he] at h

/-- Apply a published upper edge bound on any finite type of exactly the
stated order. -/
public lemma RamseyEdgeUpperBound.on_finite_type {n r s : ℕ} {U : ℝ}
    (hU : RamseyEdgeUpperBound n r s U) [Finite V] (hn : Nat.card V = n)
    (G : SimpleGraph V) (hG : IsRamseyGraph r s G) : (Nat.card G.edgeSet : ℝ) ≤ U := by
  let : Fintype V := Fintype.ofFinite V
  have hn' : Fintype.card V = n := by simpa only [Nat.card_eq_fintype_card] using hn
  have h := hU (G.overFin hn')
    (isRamseyGraph_comap G (Fintype.equivFinOfCardEq hn').symm.toEmbedding hG)
  have he := Nat.card_congr (G.overFinIso hn').mapEdgeSet
  rwa [← he] at h

/-- A smaller Ramsey bound caps the size of every neighborhood. -/
public lemma RamseyUpperBound.card_neighborSet_lt [Finite V]
    {G : SimpleGraph V} {r s n : ℕ} (hn : RamseyUpperBound r s n)
    (hG : IsRamseyGraph (r + 1) s G) (v : V) : Nat.card (G.neighborSet v) < n :=
  hn.card_lt (isRamseyGraph_induce_neighborSet_succ hG v)

/-- A smaller Ramsey bound caps the size of every antineighborhood. -/
public lemma RamseyUpperBound.card_antiNeighborSet_lt [Finite V]
    {G : SimpleGraph V} {r s n : ℕ} (hn : RamseyUpperBound r s n)
    (hG : IsRamseyGraph r (s + 1) G) (v : V) : Nat.card (antiNeighborSet G v) < n :=
  hn.card_lt (isRamseyGraph_induce_antiNeighborSet_succ hG v)

/-- An edgeless graph on `s` vertices has an independent set of size `s`. -/
public lemma ramsey_two_left (s : ℕ) : RamseyUpperBound 2 s s := by
  intro G hG
  have hbot : G = ⊥ := SimpleGraph.cliqueFree_two.mp hG.1
  subst G
  exact hG.2 Finset.univ ⟨fun _ _ _ _ _ ↦ by simp, by simp⟩

/-- The Ramsey recurrence adds bounds for the 2 smaller excluded-set sizes. -/
public lemma RamseyUpperBound.add {r s m n : ℕ} (hm : 0 < m)
    (hleft : RamseyUpperBound r (s + 1) m)
    (hright : RamseyUpperBound (r + 1) s n) :
    RamseyUpperBound (r + 1) (s + 1) (m + n) := by
  intro G hG
  let v : Fin (m + n) := ⟨0, by omega⟩
  have hN := hleft.card_neighborSet_lt hG v
  have hM := hright.compl.card_neighborSet_lt ((isRamseyGraph_compl G).mp hG) v
  have hsum := card_neighborSet_add_antiNeighborSet G v
  rw [antiNeighborSet_eq_compl] at hsum
  simp only [Nat.card_fin] at hsum
  omega

end Ramsey
