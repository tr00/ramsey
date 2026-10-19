module

public import Ramsey.theorems.RowBounds
public import Ramsey.theorems.LocalReductions
public import Mathlib.Combinatorics.SimpleGraph.StronglyRegular
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Saturation of the 17-vertex cores

The Ramsey exclusions and regularity force the parameters SRG(17,8,3,4).
-/

namespace Ramsey.d18.k1

open scoped BigOperators

variable {V : Type*}

/-- A common neighborhood of an edge in a 4-clique-free graph is independent. -/
private lemma edge_common_independent {G : SimpleGraph V} (hG : G.CliqueFree 4)
    {x y : V} (hxy : G.Adj x y) : G.IsIndepSet (G.commonNeighbors x y) := by
  classical
  intro a ha b hb hab hn
  have h1 : G.IsNClique 1 {b} := by simp
  have h2 := h1.insert (a := a) (by simpa using hn)
  have h3 := h2.insert (a := y) (by
    simpa using And.intro ha.2 hb.2)
  have h4 := h3.insert (a := x) (by
    simpa using And.intro hxy (And.intro ha.1 hb.1))
  exact hG _ h4

/-- An independent set in a graph with no independent 4-set has size at most 3. -/
private lemma independent_card_le_three [Finite V] {G : SimpleGraph V}
    (hG : G.IndepSetFree 4) {S : Set V} (hS : G.IsIndepSet S) : Nat.card S ≤ 3 := by
  classical
  have := Fintype.ofFinite V
  by_contra h
  have hc : 4 ≤ S.toFinset.card := by
    rw [Set.toFinset_card, ← Nat.card_eq_fintype_card]
    omega
  obtain ⟨t, ht, hcard⟩ := Finset.exists_subset_card_eq hc
  exact hG t ⟨fun a ha b hb hab ↦ hS (Set.mem_toFinset.mp (ht ha))
    (Set.mem_toFinset.mp (ht hb)) hab, hcard⟩

/-- Adjacent vertices of a (4,4)-free graph have at most 3 common neighbors. -/
public theorem core_edge_codegree_le_three [Finite V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) {x y : V} (hxy : G.Adj x y) :
    Nat.card (G.commonNeighbors x y) ≤ 3 :=
  independent_card_le_three hG.2 (edge_common_independent hG.1 hxy)

/-- Nonadjacent vertices of a (4,4)-free graph have at most 3 common antineighbors. -/
public theorem core_nonedge_common_anti_le_three [Finite V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) {x y : V} (hne : x ≠ y) (hxy : ¬G.Adj x y) :
    Nat.card ↥(antiNeighborSet G x ∩ antiNeighborSet G y) ≤ 3 := by
  rw [commonAntiNeighborSet_eq_compl]
  exact core_edge_codegree_le_three ((isRamseyGraph_compl G).mp hG) ⟨hne, hxy⟩

/-- A nonedge in a 17-vertex (4,4)-free graph has codegree at most 4. -/
public theorem core_nonedge_codegree_le_four [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G)
    (hcard : Nat.card V = 17) {x y : V} (hne : x ≠ y) (hxy : ¬G.Adj x y) :
    Nat.card (G.commonNeighbors x y) ≤ 4 := by
  have h := nonadjacent_common_cell_identity (G := G) hne hxy
  have hr := card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hG hcard
  have hd (z : V) : G.degree z = 8 := by
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hr z
  rw [hcard, hd x, hd y] at h
  have hc := core_nonedge_common_anti_le_three hG hne hxy
  omega

/-- Cardinality of a finite vertex set is the sum of its membership indicators. -/
private lemma card_set_sum [Fintype V] (S : Set V) [DecidablePred (· ∈ S)] :
    Nat.card S = ∑ z : V, if z ∈ S then 1 else 0 := by
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype, Finset.card_filter]

/-- Counting length-2 walks by either intermediate vertex gives the codegree sum. -/
private lemma sum_codegrees [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hreg : ∀ z : V, Nat.card (G.neighborSet z) = 8) (x : V) :
    (∑ y : V, Nat.card (G.commonNeighbors x y)) = 64 := by
  classical
  have hc (y : V) : Nat.card (G.commonNeighbors x y) =
      ∑ z : V, if G.Adj x z ∧ G.Adj y z then 1 else 0 := by
    simpa only [SimpleGraph.mem_commonNeighbors] using card_set_sum (G.commonNeighbors x y)
  simp_rw [hc]
  rw [Finset.sum_comm]
  have hz (z : V) : (∑ y : V, if G.Adj x z ∧ G.Adj y z then 1 else 0) =
      if G.Adj x z then 8 else 0 := by
    by_cases hxz : G.Adj x z
    · simpa only [hxz, true_and, ite_true, SimpleGraph.mem_neighborSet,
        SimpleGraph.adj_comm (G := G) _ z] using
        (card_set_sum (G.neighborSet z)).symm.trans (hreg z)
    · simp [hxz]
  simp_rw [hz]
  have hcount : (∑ z : V, if G.Adj x z then 1 else 0) = 8 := by
    exact (card_set_sum (G.neighborSet x)).symm.trans (hreg x)
  calc
    (∑ z : V, if G.Adj x z then 8 else 0) =
        (∑ z : V, if G.Adj x z then 1 else 0) * 8 := by
      rw [Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro z _
      split_ifs <;> rfl
    _ = 64 := by rw [hcount]

/-- The upper codegree budget at every vertex is exactly 64. -/
private lemma sum_codegree_caps [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hcard : Nat.card V = 17)
    (hreg : ∀ z : V, Nat.card (G.neighborSet z) = 8) (x : V) :
    (∑ y : V, if y = x then 8 else if G.Adj x y then 3 else 4) = 64 := by
  classical
  have hcount : (∑ y : V, if G.Adj x y then 1 else 0) = 8 := by
    exact (card_set_sum (G.neighborSet x)).symm.trans (hreg x)
  have hpoint (y : V) :
      (if y = x then 8 else if G.Adj x y then 3 else 4) +
        (if G.Adj x y then 1 else 0) = 4 + (if y = x then 4 else 0) := by
    by_cases he : y = x <;> by_cases ha : G.Adj x y <;> simp_all
  have hs := Finset.sum_congr (s₁ := Finset.univ) rfl (fun y _ ↦ hpoint y)
  simp only [Finset.sum_add_distrib, hcount, Finset.sum_const, Finset.card_univ,
    smul_eq_mul, Finset.sum_ite_eq', Finset.mem_univ, ite_true] at hs
  rw [← Nat.card_eq_fintype_card, hcard] at hs
  omega

/-- Every 17-vertex (4,4)-free graph is strongly regular with parameters (17,8,3,4). -/
public theorem core_isSRGWith [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17) :
    G.IsSRGWith 17 8 3 4 := by
  have hr := card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hG hcard
  have heq (x y : V) : Nat.card (G.commonNeighbors x y) =
      if y = x then 8 else if G.Adj x y then 3 else 4 := by
    have hle (z : V) : Nat.card (G.commonNeighbors x z) ≤
        if z = x then 8 else if G.Adj x z then 3 else 4 := by
      split_ifs with hz ha
      · subst z
        simpa only [SimpleGraph.commonNeighbors, Set.inter_self] using le_of_eq (hr x)
      · exact core_edge_codegree_le_three hG ha
      · exact core_nonedge_codegree_le_four hG hcard (Ne.symm hz) ha
    have hs : (∑ z : V, Nat.card (G.commonNeighbors x z)) =
        ∑ z : V, if z = x then 8 else if G.Adj x z then 3 else 4 := by
      rw [sum_codegrees hr, sum_codegree_caps hcard hr]
    exact (Finset.sum_eq_sum_iff_of_le (fun z _ ↦ hle z)).mp hs y (Finset.mem_univ y)
  refine ⟨by simpa only [Nat.card_eq_fintype_card] using hcard, ?_, ?_, ?_⟩
  · intro x
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hr x
  · intro x y hxy
    have h := heq x y
    simpa only [Nat.card_eq_fintype_card, hxy.ne.symm, ite_false, hxy, ite_true] using h
  · intro x y hne hxy
    have h := heq x y
    simpa only [Nat.card_eq_fintype_card, hne.symm, ite_false, hxy] using h

/-- A core nonedge has a triangle of exactly 3 common antineighbors. -/
public theorem core_nonedge_common_anti_triangle [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} [DecidableRel G.Adj] (hG : IsRamseyGraph 4 4 G)
    (hcard : Nat.card V = 17) {x y : V} (hne : x ≠ y) (hxy : ¬G.Adj x y) :
    Nat.card ↥(antiNeighborSet G x ∩ antiNeighborSet G y) = 3 ∧
      G.IsClique (antiNeighborSet G x ∩ antiNeighborSet G y) := by
  have hc : Gᶜ.Adj x y := ⟨hne, hxy⟩
  have hGc := (isRamseyGraph_compl G).mp hG
  rw [commonAntiNeighborSet_eq_compl]
  refine ⟨?_, ?_⟩
  · simpa only [Nat.card_eq_fintype_card] using (core_isSRGWith hGc hcard).of_adj x y hc
  · exact (SimpleGraph.isIndepSet_compl G).mp (edge_common_independent hGc.1 hc)

/-- The total unordered pair-codegree mass is 17 times choose(8,2), namely 476. -/
public theorem core_paircodegree_mass [Fintype V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17) :
    ∑ z : V, (Nat.card (G.neighborSet z)).choose 2 = 476 := by
  classical
  simp_rw [card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hG hcard]
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, ← Nat.card_eq_fintype_card,
    hcard]
  decide

/-- Summing common-neighbor counts over all unordered vertex pairs gives exactly 476. -/
public theorem core_total_paircodegrees [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17) :
    (∑ p ∈ (Finset.univ : Finset V).powersetCard 2,
      Nat.card {z : V | ∀ x ∈ p, G.Adj x z}) = 476 := by
  classical
  have hcount (p : Finset V) : Nat.card {z : V | ∀ x ∈ p, G.Adj x z} =
      ∑ z : V, if ∀ x ∈ p, G.Adj x z then 1 else 0 := by
    exact card_set_sum _
  simp_rw [hcount]
  rw [Finset.sum_comm]
  have hz (z : V) :
      (∑ p ∈ (Finset.univ : Finset V).powersetCard 2,
        if ∀ x ∈ p, G.Adj x z then 1 else 0) = (Nat.card (G.neighborSet z)).choose 2 := by
    rw [← Finset.card_filter]
    have heq : ((Finset.univ : Finset V).powersetCard 2).filter
        (fun p ↦ ∀ x ∈ p, G.Adj x z) = (G.neighborSet z).toFinset.powersetCard 2 := by
      ext p
      simp only [Finset.mem_filter, Finset.mem_powersetCard, Finset.subset_iff,
        Finset.mem_univ, implies_true, true_and, Set.mem_toFinset,
        SimpleGraph.mem_neighborSet, SimpleGraph.adj_comm (G := G) z]
      exact and_comm
    rw [heq, Finset.card_powersetCard, Set.toFinset_card, ← Nat.card_eq_fintype_card]
  simp_rw [hz]
  exact core_paircodegree_mass hG hcard

end Ramsey.d18.k1
