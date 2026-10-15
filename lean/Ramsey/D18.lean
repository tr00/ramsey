module

public import Ramsey.Defs
public import Ramsey.Premises

/-!
# The degree-18 frontier

First premise-consuming layer. For a `(5,5)`-Ramsey graph `G`:

* the neighborhood `N(v)` is `(4,5)`-Ramsey and the antineighborhood `M(v)`
  is `(5,4)`-Ramsey (baseline facts, `../n43/d18/README.md`);
* hence `18 ≤ d(v) ≤ 24` on 43 vertices;
* adjacent vertices have at most `13` common neighbors (`R(3,5) ≤ 14`).
-/

@[expose] public section

namespace Ramsey

variable {V : Type*}

/-- The antineighborhood of `v` is the neighborhood of `v` in the complement. -/
theorem antiNeighborSet_eq_compl (G : SimpleGraph V) (v : V) :
    antiNeighborSet G v = Gᶜ.neighborSet v := by
  ext w
  simp [antiNeighborSet, SimpleGraph.compl_adj, ne_comm]

/-- Complements commute with induced subgraphs. -/
theorem compl_induce (G : SimpleGraph V) (s : Set V) :
    (G.induce s)ᶜ = Gᶜ.induce s := by
  ext a b
  simp only [SimpleGraph.compl_adj, SimpleGraph.induce_adj]
  refine ⟨fun h => ⟨fun he => h.1 (Subtype.ext he), h.2⟩, ?_⟩
  rintro ⟨h1, h2⟩
  exact ⟨fun he => h1 (congrArg Subtype.val he), h2⟩

/-- Independent `n`-sets of an induced subgraph are independent in `G`. -/
theorem indepSetFree_induce {G : SimpleGraph V} (s : Set V) (n : ℕ)
    (h : G.IndepSetFree n) : (G.induce s).IndepSetFree n :=
  (SimpleGraph.cliqueFree_compl _).mp (by
    rw [compl_induce, SimpleGraph.cliqueFree_induce_iff]
    exact fun t _ => (SimpleGraph.cliqueFree_compl G).mpr h t)

/-- Neighborhoods of `(5,5)`-Ramsey graphs are `(4,5)`-Ramsey. -/
theorem isRamseyGraph_induce_neighborSet {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (v : V) :
    IsRamseyGraph 4 5 (G.induce (G.neighborSet v)) := by
  obtain ⟨hc, hi⟩ := hG
  refine ⟨?_, indepSetFree_induce _ _ hi⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t ht htclique
  have hcard := htclique.card_eq
  have hvn : v ∉ (t : Set V) := fun hb => absurd (ht hb) (by simp)
  have hvnF : v ∉ t := fun hb => hvn (Finset.mem_coe.mp hb)
  refine hc (Finset.cons v t hvnF) ⟨?_, ?_⟩
  · rw [SimpleGraph.isClique_iff, Finset.coe_cons]
    exact Set.Pairwise.insert_of_notMem hvn htclique.isClique
      (fun b hb => ⟨(ht hb : G.Adj v b), (ht hb : G.Adj v b).symm⟩)
  · rw [Finset.card_cons]
    omega

/-- Antineighborhoods of `(5,5)`-Ramsey graphs are `(5,4)`-Ramsey. -/
theorem isRamseyGraph_induce_antiNeighborSet {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (v : V) :
    IsRamseyGraph 5 4 (G.induce (antiNeighborSet G v)) := by
  have hGc : IsRamseyGraph 5 5 Gᶜ := (isRamseyGraph_compl G).mp hG
  rw [isRamseyGraph_compl, compl_induce, antiNeighborSet_eq_compl]
  exact isRamseyGraph_induce_neighborSet hGc v

/-- `R(5,4) ≤ 25`, derived from `ramsey_4_5_le_25` by complement symmetry. -/
theorem ramsey_5_4_le_25 [Finite V] (h : 25 ≤ Nat.card V)
    (G : SimpleGraph V) : ¬IsRamseyGraph 5 4 G :=
  fun hG => ramsey_4_5_le_25 h Gᶜ ((isRamseyGraph_compl G).mp hG)

/-- Vertex partition: `|N(v)| + |M(v)| + 1 = |V|`. -/
theorem card_neighborSet_add_antiNeighborSet [Finite V] (G : SimpleGraph V) (v : V) :
    Nat.card ↥(G.neighborSet v) + Nat.card ↥(antiNeighborSet G v) + 1 = Nat.card V := by
  classical
  letI : Fintype V := Fintype.ofFinite V
  have hpos : 0 < Fintype.card V := Fintype.card_pos_iff.mpr ⟨v⟩
  have hTU : (G.neighborSet v ∪ Gᶜ.neighborSet v).toFinset =
      (G.neighborSet v).toFinset ∪ (Gᶜ.neighborSet v).toFinset := by
    ext a
    simp
  have hdF : ((G.neighborSet v).toFinset).Disjoint ((Gᶜ.neighborSet v).toFinset) :=
    Finset.disjoint_left.mpr fun a ha hma => by
      simp only [Set.mem_toFinset, SimpleGraph.mem_neighborSet, SimpleGraph.compl_adj] at ha hma
      exact hma.2.2 ha
  have hcardU : (G.neighborSet v ∪ Gᶜ.neighborSet v).toFinset.card =
      (G.neighborSet v).toFinset.card + (Gᶜ.neighborSet v).toFinset.card := by
    rw [hTU, Finset.card_union_of_disjoint hdF]
  have hcomp : (G.neighborSet v ∪ Gᶜ.neighborSet v).toFinset.card = Fintype.card V - 1 := by
    simp_rw [G.neighborSet_union_compl_neighborSet_eq, Set.toFinset_compl, Finset.card_compl,
      Set.toFinset_card, Set.card_singleton]
  rw [antiNeighborSet_eq_compl, Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    Nat.card_eq_fintype_card, ← Set.toFinset_card, ← Set.toFinset_card]
  omega

/-- Degree bound from `R(4,5) ≤ 25`: `d(v) ≤ 24`. -/
theorem degree_le_24 {G : SimpleGraph V} [Fintype V] [DecidableRel G.Adj]
    (hG : IsRamseyGraph 5 5 G) (v : V) : G.degree v ≤ 24 := by
  by_contra hlt
  exact ramsey_4_5_le_25 (by
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
    omega) _ (isRamseyGraph_induce_neighborSet hG v)

/-- The degree frontier on 43 vertices: `18 ≤ d(v) ≤ 24`. -/
theorem degree_mem {G : SimpleGraph (Fin 43)} [DecidableRel G.Adj]
    (hG : IsRamseyGraph 5 5 G) (v : Fin 43) :
    18 ≤ G.degree v ∧ G.degree v ≤ 24 := by
  refine ⟨?_, degree_le_24 hG v⟩
  by_contra hlt
  have hsplit := card_neighborSet_add_antiNeighborSet G v
  rw [Nat.card_fin] at hsplit
  have hdeg : G.degree v = Nat.card ↥(G.neighborSet v) := by
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
  have h25 : 25 ≤ Nat.card ↥(antiNeighborSet G v) := by omega
  exact ramsey_5_4_le_25 h25 (G.induce (antiNeighborSet G v))
    (isRamseyGraph_induce_antiNeighborSet hG v)

/-- Common neighbors of adjacent vertices form a `(3,5)`-Ramsey graph. -/
theorem isRamseyGraph_induce_commonNeighbors {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) {v w : V} (hvw : G.Adj v w) :
    IsRamseyGraph 3 5 (G.induce (G.commonNeighbors v w)) := by
  obtain ⟨hc, hi⟩ := hG
  refine ⟨?_, indepSetFree_induce _ _ hi⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t ht htclique
  have hcard := htclique.card_eq
  have hvn : v ∉ (t : Set V) := fun hb => absurd (ht hb).1 (by simp)
  have hwn : w ∉ (t : Set V) := fun hb => absurd (ht hb).2 (by simp)
  have hvwne : v ≠ w := by
    intro h
    rw [← h] at hvw
    exact absurd hvw (by simp)
  have hvnF : v ∉ t := fun hb => hvn (Finset.mem_coe.mp hb)
  have hwnF : w ∉ t := fun hb => hwn (Finset.mem_coe.mp hb)
  have hvnF' : v ∉ Finset.cons w t hwnF := by
    intro hb
    rcases Finset.mem_cons.mp hb with h' | h'
    · exact hvwne h'
    · exact hvnF h'
  have hvn' : v ∉ (insert w (t : Set V)) := fun hb => by
    rcases Set.mem_insert_iff.mp hb with h' | h'
    · exact hvwne h'
    · exact hvn h'
  refine hc (Finset.cons v (Finset.cons w t hwnF) hvnF') ⟨?_, ?_⟩
  · rw [SimpleGraph.isClique_iff, Finset.coe_cons, Finset.coe_cons]
    refine Set.Pairwise.insert_of_notMem hvn' ?_ ?_
    · exact Set.Pairwise.insert_of_notMem hwn htclique.isClique
        (fun b hb => ⟨(ht hb).2, (ht hb).2.symm⟩)
    · intro b hb
      rcases Set.mem_insert_iff.mp hb with hb' | hb'
      · subst hb'
        exact ⟨hvw, hvw.symm⟩
      · exact ⟨(ht hb').1, (ht hb').1.symm⟩
  · rw [Finset.card_cons, Finset.card_cons]
    omega

/-- Adjacent vertices have at most `13` common neighbors (`R(3,5) ≤ 14`). -/
theorem card_commonNeighbors_le_13 {G : SimpleGraph V} [Finite V]
    (hG : IsRamseyGraph 5 5 G) {v w : V} (hvw : G.Adj v w) :
    Nat.card ↥(G.commonNeighbors v w) ≤ 13 := by
  by_contra hlt
  exact ramsey_3_5_le_14 (by omega) _ (isRamseyGraph_induce_commonNeighbors hG hvw)

end Ramsey
