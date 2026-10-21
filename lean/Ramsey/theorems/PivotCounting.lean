module

public import Ramsey.theorems.LocalReductions
public import Mathlib.Combinatorics.SimpleGraph.DegreeSum

/-!
# Pivot edge counting

Cross edges are unordered edges, counted once for disjoint sides.
The degree sums hold in every finite graph and do not assume Ramsey freeness.
-/

@[expose] public section

namespace Ramsey

variable {V : Type*}

/-- Counting cross edges by their unique endpoint in `A` is valid for disjoint sides. -/
theorem crossEdgeCount_eq_sum_rows [Fintype V] (G : SimpleGraph V) (A B : Set V)
    [DecidablePred (· ∈ A)] (hAB : Disjoint A B) :
    crossEdgeCount G A B = ∑ u : A, Nat.card (rowSet G B u) := by
  classical
  let E := Σ u : A, rowSet G B u
  let f : E → crossEdgeSet G A B := fun e ↦
    ⟨s(e.1.1, e.2.1), e.2.2.1, e.1.1, e.1.2, e.2.1, e.2.2.2, rfl⟩
  have hf : Function.Bijective f := by
    constructor
    · intro a b hab
      have he := congrArg Subtype.val hab
      change s(a.1.1, a.2.1) = s(b.1.1, b.2.1) at he
      rcases Sym2.eq_iff.mp he with h | h
      · have hu : a.1 = b.1 := Subtype.ext h.1
        obtain ⟨a, x⟩ := a
        obtain ⟨b, y⟩ := b
        dsimp at hu h
        subst b
        have hx : x = y := Subtype.ext h.2
        subst y
        rfl
      · exact False.elim (Set.disjoint_left.mp hAB a.1.2 (h.1 ▸ b.2.2.2))
    · rintro ⟨e, he, u, hu, w, hw, rfl⟩
      exact ⟨⟨⟨u, hu⟩, ⟨w, he, hw⟩⟩, rfl⟩
  have hc := Nat.card_congr (Equiv.ofBijective f hf)
  simpa [crossEdgeCount, E, Nat.card_eq_fintype_card, Fintype.card_sigma] using hc.symm

/-- Row and column sums count the same unordered cross edges. -/
theorem crossEdgeCount_comm (G : SimpleGraph V) (A B : Set V) :
    crossEdgeCount G A B = crossEdgeCount G B A := by
  unfold crossEdgeCount
  apply congrArg (fun S : Set (Sym2 V) ↦ Nat.card S)
  ext e
  constructor <;> rintro ⟨he, u, hu, w, hw, rfl⟩
  · exact ⟨he, w, hw, u, hu, Sym2.eq_swap⟩
  · exact ⟨he, w, hw, u, hu, Sym2.eq_swap⟩

/-- Internal degree is the number of neighbors in the induced vertex set. -/
lemma induced_degree_eq_row_card [Fintype V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (A : Set V) [DecidablePred (· ∈ A)] (u : A) :
    (G.induce A).degree u = Nat.card (rowSet G A u) := by
  classical
  calc
    (G.induce A).degree u = ((G.induce A).neighborFinset u).card :=
      (SimpleGraph.card_neighborFinset_eq_degree _ _).symm
    _ = (((G.induce A).neighborFinset u).map (.subtype (· ∈ A))).card := by
      rw [Finset.card_map]
    _ = (G.neighborFinset u ∩ A.toFinset).card :=
      congrArg Finset.card (G.map_neighborFinset_induce u)
    _ = Nat.card (rowSet G A u) := by
      rw [Nat.card_eq_fintype_card, ← Set.toFinset_card]
      congr 1
      ext w
      simp only [Finset.mem_inter, SimpleGraph.mem_neighborFinset, Set.mem_toFinset]
      rfl

/-- Induced degrees count ambient neighbors in the finite induced vertex set. -/
lemma induced_degree_eq_neighbor_inter_card [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (S : Finset V) (x : (S : Set V)) :
    (G.induce (S : Set V)).degree x = (G.neighborFinset x ∩ S).card := by
  have h := induced_degree_eq_row_card G (S : Set V) x
  simp only [← SimpleGraph.card_neighborSet_eq_degree, ← Nat.card_eq_fintype_card] at h ⊢
  rw [h]
  classical
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
  congr 1
  ext y
  simp [rowSet]

/-- Directed adjacency incidences between 2 finite vertex sets. -/
noncomputable def links (G : SimpleGraph V) (S T : Finset V) : ℕ := by
  classical
  exact ∑ x ∈ S, (T.filter (G.Adj x)).card

/-- Reversing the 2 sides preserves their adjacency incidence count. -/
lemma links_comm (G : SimpleGraph V) (S T : Finset V) :
    links G S T = links G T S := by
  classical
  simp only [links, Finset.card_filter]
  rw [Finset.sum_comm]
  simp only [SimpleGraph.adj_comm]

/-- Finite incidences agree with filtered counts for every adjacency decidability instance. -/
lemma links_filter_sum (G : SimpleGraph V) [DecidableRel G.Adj] (S T : Finset V) :
    links G S T = ∑ x ∈ S, (T.filter (G.Adj x)).card := by
  classical
  unfold links
  apply Finset.sum_congr rfl
  intro x hx
  congr 1
  ext y
  simp

/-- A disjoint union in the source adds the directed counts. -/
lemma links_union_left [DecidableEq V] (G : SimpleGraph V) (S T U : Finset V)
    (h : Disjoint S T) : links G (S ∪ T) U = links G S U + links G T U := by
  classical
  exact Finset.sum_union h

/-- A disjoint union in the target adds the directed counts. -/
lemma links_union_right [DecidableEq V] (G : SimpleGraph V) (S T U : Finset V)
    (h : Disjoint T U) : links G S (T ∪ U) = links G S T + links G S U := by
  rw [links_comm G S, links_union_left G T U S h, links_comm G T S, links_comm G U S]

/-- Finite incidences between disjoint sets count their unordered cross edges. -/
lemma links_eq_crossEdgeCount [Fintype V] (G : SimpleGraph V) (S T : Finset V)
    (h : Disjoint S T) : links G S T = crossEdgeCount G (S : Set V) (T : Set V) := by
  classical
  rw [crossEdgeCount_eq_sum_rows G _ _ (by simpa using h)]
  unfold links
  rw [Finset.sum_subtype S (fun _ ↦ Iff.rfl) (fun x ↦ (T.filter (G.Adj x)).card)]
  apply Finset.sum_congr rfl
  intro x hx
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
  congr 1
  ext y
  simp [rowSet, and_comm]

/-- Directed incidences can be written as ambient neighbor intersections. -/
lemma links_neighbor_sum [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (S T : Finset V) :
    links G S T = ∑ x ∈ S, (G.neighborFinset x ∩ T).card := by
  classical
  unfold links
  apply Finset.sum_congr rfl
  intro x hx
  congr 1
  ext y
  simp [and_comm]

/-- The diagonal directed count is twice the induced edge count. -/
lemma links_self [Fintype V] (G : SimpleGraph V) (S : Finset V) :
    links G S S = 2 * inducedEdgeCount G (S : Set V) := by
  classical
  have hs := (G.induce (S : Set V)).sum_degrees_eq_twice_card_edges
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at hs
  simp_rw [induced_degree_eq_neighbor_inter_card] at hs
  rw [links_neighbor_sum]
  rw [Finset.sum_subtype S (fun _ ↦ Iff.rfl) (fun x ↦ (G.neighborFinset x ∩ S).card)]
  exact hs

/-- A neighbor of the pivot has one edge to the pivot, internal edges and cross edges. -/
theorem pivot_neighbor_degree_split [Fintype V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) (u : G.neighborSet v) :
    G.degree u = 1 + (G.induce (G.neighborSet v)).degree u +
      Nat.card (rowSet G (antiNeighborSet G v) u) := by
  classical
  rw [induced_degree_eq_row_card]
  have hd := degree_eq_common_add_mixed (G := G) (u : V) v
  simp only [u.2.symm, ite_true] at hd
  change G.degree u = 1 + Nat.card (G.commonNeighbors u v) +
    Nat.card ↥(G.neighborSet u ∩ antiNeighborSet G v)
  omega

/-- Degree summation over a pivot neighborhood: `Σ_A d_G = d + 2a + x`. -/
theorem pivot_neighbor_degree_sum [Fintype V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) :
    ∑ u : G.neighborSet v, G.degree u =
      G.degree v + 2 * inducedEdgeCount G (G.neighborSet v) +
        crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) := by
  classical
  have hd : Disjoint (G.neighborSet v) (antiNeighborSet G v) :=
    Set.disjoint_left.mpr fun _ h₁ h₂ ↦ h₂.2 h₁
  rw [crossEdgeCount_eq_sum_rows G _ _ hd]
  simp_rw [pivot_neighbor_degree_split G v]
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib]
  have he := (G.induce (G.neighborSet v)).sum_degrees_eq_twice_card_edges
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at he
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, mul_one,
    SimpleGraph.card_neighborSet_eq_degree]
  change G.degree v + ∑ u : G.neighborSet v, (G.induce (G.neighborSet v)).degree u + _ = _
  rw [he]
  rfl

/-- The excess definition has an exact sum interpretation above the stated degree floor. -/
theorem sum_degree_eq_base_add_excess [Fintype V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (base : ℕ) (A : Set V) [DecidablePred (· ∈ A)]
    (hbase : ∀ u ∈ A, base ≤ G.degree u) :
    ∑ u : A, G.degree u = base * Nat.card A + degreeExcess G base A := by
  classical
  have h : ∀ u : A, G.degree u = base + (G.degree u - base) :=
    fun u ↦ (Nat.add_sub_of_le (hbase u u.2)).symm
  calc
    ∑ u : A, G.degree u = ∑ u : A, (base + (G.degree u - base)) :=
      Finset.sum_congr rfl (fun u _ ↦ h u)
    _ = base * Nat.card A + degreeExcess G base A := by
      rw [Finset.sum_add_distrib]
      simp only [degreeExcess, Nat.card_eq_fintype_card,
        SimpleGraph.card_neighborSet_eq_degree, Finset.sum_const, Finset.card_univ,
        smul_eq_mul, mul_comm]

/-- An antineighbor has only internal `B` edges and cross edges, and no pivot edge. -/
theorem pivot_antiNeighbor_degree_split [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (y : antiNeighborSet G v) :
    G.degree y = (G.induce (antiNeighborSet G v)).degree y +
      Nat.card (rowSet G (G.neighborSet v) y) := by
  rw [induced_degree_eq_row_card]
  have hn : ¬G.Adj (y : V) v := fun h ↦ y.2.2 h.symm
  have hd := degree_eq_common_add_mixed (G := G) (y : V) v
  simp only [hn, ite_false, Nat.add_zero] at hd
  change G.degree y = Nat.card ↥(G.neighborSet y ∩ antiNeighborSet G v) +
    Nat.card (G.commonNeighbors y v)
  omega

/-- Degree summation over the antineighborhood: `Σ_B d_G = 2b + x`. -/
theorem pivot_antiNeighbor_degree_sum [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) :
    ∑ y : antiNeighborSet G v, G.degree y =
      2 * inducedEdgeCount G (antiNeighborSet G v) +
        crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) := by
  classical
  have hd : Disjoint (antiNeighborSet G v) (G.neighborSet v) :=
    Set.disjoint_left.mpr fun _ h₁ h₂ ↦ h₁.2 h₂
  rw [crossEdgeCount_comm, crossEdgeCount_eq_sum_rows G _ _ hd]
  simp_rw [pivot_antiNeighbor_degree_split G v]
  rw [Finset.sum_add_distrib]
  have he := (G.induce (antiNeighborSet G v)).sum_degrees_eq_twice_card_edges
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at he
  rw [he]
  rfl

/-- A graph and its complement partition the unordered pairs. -/
theorem card_edges_add_card_edges_compl [Fintype V] (G : SimpleGraph V) :
    Nat.card G.edgeSet + Nat.card Gᶜ.edgeSet = (Nat.card V).choose 2 := by
  classical
  have he : G.edgeFinset.card + Gᶜ.edgeFinset.card = (Fintype.card V).choose 2 := by
    rw [← Finset.card_union_of_disjoint
      (SimpleGraph.disjoint_edgeFinset.mpr disjoint_compl_right),
      ← SimpleGraph.edgeFinset_sup]
    simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card]
    rw [sup_compl_eq_top, Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card,
      SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
    simp only [Nat.card_eq_fintype_card]
  simpa only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] using he

end Ramsey
