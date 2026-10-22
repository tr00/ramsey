module

public import Ramsey.basics.RamseyTheory
public import Ramsey.basics.Transversals
public import Ramsey.Premises
public import Ramsey.n09.R43
public import Ramsey.theorems.Counting
public import Mathlib.Data.Finset.Card
public import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# Four-vertex transversals

Formalization of `research/n43/d18/transversal_four.md`. The published 15-vertex census
edge bound is the named axiom `edges_ramsey_4_4_15_ge_50` from `Ramsey.Premises`.
The bound `R(4,3) ≤ 9` is proved in `Ramsey.n09.R43`. No clique bound is imposed on the
ambient 18-vertex graph. This module does not import the unproved
transversal-deletion statements.
-/

@[expose] public section

namespace Ramsey.TransversalFour

variable {V : Type*}

/-- The order-15 `(4,4)` census supplies the core edge lower bound. -/
private theorem census_bound [Fintype V] (F : RamseyGraph 4 4 V)
    (hn : Fintype.card V = 15) : 50 ≤ Nat.card F.graph.edgeSet := by
  have hi := F.graph.overFinIso hn
  have h := edges_ramsey_4_4_15_ge_50 (F.graph.overFin hn)
    (isRamseyGraph_comap F.graph (Fintype.equivFinOfCardEq hn).symm.toEmbedding F.ramsey)
  have he := Nat.card_congr hi.mapEdgeSet
  rw [← he] at h
  exact_mod_cast h

private theorem nonneighbor_card_le [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (hF : F.IndepSetFree 4) (T : Finset V)
    (hT : IsCliqueTransversal F 4 T) {t : V} (ht : t ∈ T) :
    outsideNonneighborCount F T t ≤ 8 := by
  classical
  let A : Set V := {u | u ∉ T ∧ ¬F.Adj t u}
  have hc : (F.induce A).CliqueFree 4 := by
    rw [SimpleGraph.cliqueFree_induce_iff]
    intro I hI hcl
    exact (SimpleGraph.cliqueFree_induce_iff F _ 4).mp
      ((isCliqueTransversal_iff_cliqueFree_deleted F T 4).mp hT)
      (fun x hx ↦ (hI hx).1) hcl
  have hi : (F.induce A).IndepSetFree 3 := by
    rw [indepSetFree_induce_iff]
    intro I hI hIndep
    have htI : t ∉ I := fun htI ↦ (hI htI).1 ht
    exact hF _ (isNIndepSet_insert htI hIndep (fun u hu ↦ (hI hu).2))
  have h := ramsey_4_3_le_9.card_lt
    (show IsRamseyGraph 4 3 (F.induce A) from ⟨hc, hi⟩)
  exact Nat.le_of_lt_succ h

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
  have hcore := census_bound
    ⟨F.induce (T : Set V)ᶜ, (isCliqueTransversal_iff_cliqueFree_deleted F T 4).mp hT,
      indepSetFree_induce _ _ hF⟩ hHcard
  change 50 ≤ inducedEdgeCount F (T : Set V)ᶜ at hcore
  have hdegree : ∀ t : T, 7 ≤ outsideDegree F T t := by
    intro t
    have hnon := nonneighbor_card_le F hF T hT t.property
    have hsplit :
        outsideDegree F T t + outsideNonneighborCount F T t = 15 := by
      simp only [outsideDegree, outsideNonneighborCount, rowSet,
        Nat.card_eq_fintype_card, Fintype.card_subtype]
      have he := Finset.card_filter_add_card_filter_not
        (s := Finset.univ.filter (fun u : V ↦ u ∉ T)) (fun u ↦ F.Adj t u)
      simpa only [Finset.filter_filter, Set.mem_inter_iff, SimpleGraph.mem_neighborSet,
        Set.mem_compl_iff, Finset.mem_coe, and_comm] using he.trans hU
    omega
  letI : Fintype (T : Set V) := Subtype.fintype (· ∈ (T : Set V))
  have hsum : 21 ≤ ∑ t : (T : Set V), outsideDegree F T t := by
    have h := Finset.sum_le_sum (s := (Finset.univ : Finset (T : Set V)))
      (fun t _ ↦ hdegree t)
    simpa [hcard] using h
  have hcount := edge_count_partition F (T : Set V)
  rw [crossEdgeCount_eq_sum_rows F _ _ disjoint_compl_right] at hcount
  change Nat.card F.edgeSet = inducedEdgeCount F (T : Set V) +
    inducedEdgeCount F (T : Set V)ᶜ + ∑ t : (T : Set V), outsideDegree F T t at hcount
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
  have hT : IsCliqueTransversal F 4 T := hS.mono hST
  have h := edge_lower_bound_of_three_transversal F hn hF T hTcard hT
  omega

/-- The source's exact 68-edge formulation, without an ambient clique-number hypothesis. -/
theorem transversal_card_ge_four_of_edges_eq_68 [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) (hn : Fintype.card V = 18) (hF : F.IndepSetFree 4)
    (hEdges : Nat.card F.edgeSet = 68)
    (S : Finset V) (hS : IsCliqueTransversal F 4 S) : 4 ≤ S.card :=
  transversal_card_ge_four F hn hF (by omega) S hS

/-- A missed independent four-set and the outside endpoint would give an independent five. -/
theorem cross_column_isTransversal [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hG : G.IndepSetFree 5)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) :
    IsIndepTransversal (G.induce A) 4 C := by
  classical
  rw [isIndepTransversal_iff]
  intro J hJ
  by_contra hmiss
  push Not at hmiss
  let K := J.map (Function.Embedding.subtype A)
  have hK : G.IsNIndepSet 4 K := (isNIndepSet_induce_iff G A J 4).mp hJ
  have hyK : y ∉ K := by
    intro hyK
    obtain ⟨x, _, hxy⟩ := Finset.mem_map.mp hyK
    exact hy (hxy ▸ x.property)
  have hnon : ∀ b ∈ K, ¬G.Adj y b := by
    intro b hb hadj
    obtain ⟨x, hx, hxb⟩ := Finset.mem_map.mp hb
    subst b
    exact hmiss x hx ((hC x).mpr hadj)
  exact hG _ (isNIndepSet_insert hyK hK hnon)

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
  · exact (cliqueTransversal_compl_iff _ 4 C).mpr htrans

/-- The frontier's `e(A) = 85` yields `e(Aᶜ) = 68`, hence every actual column has size four
or more. Its published inputs are the named axioms from `Ramsey.Premises`. -/
theorem frontier_cross_column_card_ge_four [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hn : Nat.card A = 18)
    (hA : (G.induce A).CliqueFree 4) (hG : G.IndepSetFree 5)
    (hEdges : inducedEdgeCount G A = 85)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) : 4 ≤ C.card := by
  classical
  let : Fintype A := Fintype.ofFinite A
  let H := G.induce A
  have he := card_edges_add_card_edges_compl H
  have hcomp : Nat.card Hᶜ.edgeSet = 68 := by
    rw [hn, show Nat.choose 18 2 = 153 by decide] at he
    change Nat.card H.edgeSet = 85 at hEdges
    omega
  exact (cross_column_card_ge_four G A hn hA hG hcomp y hy C hC).2

end Ramsey.TransversalFour
