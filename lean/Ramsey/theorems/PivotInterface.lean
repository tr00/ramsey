module

public import Ramsey.n43.D18
public import Ramsey.basics.GraphTheory
public import Ramsey.basics.RamseyTheory

/-!
# Exact pivot-interface criterion

Empty rectangle sides are allowed, so pure five-sets are not omitted.
The pivot equivalence requires both internal Ramsey types to control sets containing the pivot.
-/

@[expose] public section

namespace Ramsey

variable {V : Type*}

/-- For disjoint parts, all-one rectangle exclusion is exactly clique-freeness on their union. -/
theorem cliqueRectangleFree_iff_cliqueFreeOn (G : SimpleGraph V) {A B : Set V}
    (hAB : Disjoint A B) (n : ℕ) :
    CliqueRectangleFree G A B n ↔ G.CliqueFreeOn (A ∪ B) n := by
  classical
  constructor
  · intro h s hs hc
    let P := s.filter (fun x ↦ x ∈ A)
    let Q := s.filter (fun x ↦ x ∈ B)
    have hP : (P : Set V) ⊆ A := by
      intro x hx
      exact (Finset.mem_filter.mp hx).2
    have hQ : (Q : Set V) ⊆ B := by
      intro x hx
      exact (Finset.mem_filter.mp hx).2
    have hPs : P ⊆ s := Finset.filter_subset _ _
    have hQs : Q ⊆ s := Finset.filter_subset _ _
    have hd : Disjoint P Q := Finset.disjoint_left.mpr fun x hx hy ↦
      Set.disjoint_left.mp hAB (hP hx) (hQ hy)
    have hu : P ∪ Q = s := by
      ext x
      simp only [Finset.mem_union, Finset.mem_filter, P, Q]
      constructor
      · rintro (hx | hx) <;> exact hx.1
      · intro hx
        rcases hs hx with hxa | hxb
        · exact Or.inl ⟨hx, hxa⟩
        · exact Or.inr ⟨hx, hxb⟩
    have hcard : P.card + Q.card = n := by
      rw [← Finset.card_union_of_disjoint hd, hu, hc.card_eq]
    exact h P Q hP hQ hcard (hc.isClique.subset hPs) (hc.isClique.subset hQs)
      (fun p hp q hq ↦ hc.isClique (hPs hp) (hQs hq) (by
        intro he
        subst q
        exact Finset.disjoint_left.mp hd hp hq))
  · intro h P Q hP hQ hcard hcP hcQ hcross
    have hd : Disjoint P Q := Finset.disjoint_left.mpr fun x hx hy ↦
      Set.disjoint_left.mp hAB (hP hx) (hQ hy)
    apply h (t := P ∪ Q)
    · intro x hx
      rcases Finset.mem_union.mp hx with hx | hx
      · exact Or.inl (hP hx)
      · exact Or.inr (hQ hx)
    · simpa only [hcard] using
        isNClique_union (⟨hcP, rfl⟩ : G.IsNClique P.card P)
          (⟨hcQ, rfl⟩ : G.IsNClique Q.card Q) hd hcross

/-- On disjoint parts, complementing changes all-one rectangles into all-zero rectangles. -/
theorem cliqueRectangleFree_compl_iff (G : SimpleGraph V) {A B : Set V}
    (hAB : Disjoint A B) (n : ℕ) :
    CliqueRectangleFree Gᶜ A B n ↔ IndepRectangleFree G A B n := by
  have hne : ∀ (P Q : Finset V), (P : Set V) ⊆ A → (Q : Set V) ⊆ B →
      ∀ p ∈ P, ∀ q ∈ Q, p ≠ q := by
    intro P Q hP hQ p hp q hq he
    subst q
    exact Set.disjoint_left.mp hAB (hP hp) (hQ hq)
  constructor
  · intro h P Q hP hQ hcard hPind hQind hcross
    apply h P Q hP hQ hcard
      ((SimpleGraph.isClique_compl G).mpr hPind) ((SimpleGraph.isClique_compl G).mpr hQind)
    intro p hp q hq
    exact ⟨hne P Q hP hQ p hp q hq, hcross p hp q hq⟩
  · intro h P Q hP hQ hcard hPcl hQcl hcross
    apply h P Q hP hQ hcard
      ((SimpleGraph.isClique_compl G).mp hPcl) ((SimpleGraph.isClique_compl G).mp hQcl)
    intro p hp q hq
    exact (hcross p hp q hq).2

/-- The two pivot parts are disjoint. -/
theorem pivot_neighbor_antiNeighbor_disjoint (G : SimpleGraph V) (v : V) :
    Disjoint (G.neighborSet v) (antiNeighborSet G v) := by
  exact Set.disjoint_left.mpr fun _ ha hb ↦ hb.2 ha

/-- Every five-clique either contains the pivot and yields a four-clique in its
neighborhood, or splits into an excluded rectangle away from the pivot. -/
theorem cliqueFree_five_of_pivot_rectangles (G : SimpleGraph V) (v : V)
    (hN : (G.induce (G.neighborSet v)).CliqueFree 4)
    (hrect : CliqueRectangleFree G (G.neighborSet v) (antiNeighborSet G v) 5) :
    G.CliqueFree 5 := by
  classical
  intro s hs
  by_cases hv : v ∈ s
  · have he : (s.erase v : Set V) ⊆ G.neighborSet v := by
      intro x hx
      have hx' := Finset.mem_erase.mp hx
      exact hs.isClique hv hx'.2 hx'.1.symm
    apply (SimpleGraph.cliqueFree_induce_iff G _ _).mp hN he
    refine ⟨hs.isClique.subset (Finset.erase_subset _ _), ?_⟩
    have hcard := Finset.card_erase_of_mem hv
    rw [hs.card_eq] at hcard
    exact hcard
  · apply (cliqueRectangleFree_iff_cliqueFreeOn G
      (pivot_neighbor_antiNeighbor_disjoint G v) 5).mp hrect (t := s) ?_ hs
    intro x hx
    by_cases ha : G.Adj v x
    · exact Or.inl ha
    · exact Or.inr ⟨fun he ↦ hv (he ▸ hx), ha⟩

/-- The exact pivot criterion requires both internal Ramsey types and excludes both rectangle types.
Empty sides include forbidden five-sets lying in one part. -/
theorem isRamseyGraph_five_five_iff_pivot_interface (G : SimpleGraph V) (v : V) :
    IsRamseyGraph 5 5 G ↔
      IsRamseyGraph 4 5 (G.induce (G.neighborSet v)) ∧
      IsRamseyGraph 5 4 (G.induce (antiNeighborSet G v)) ∧
      CliqueRectangleFree G (G.neighborSet v) (antiNeighborSet G v) 5 ∧
      IndepRectangleFree G (G.neighborSet v) (antiNeighborSet G v) 5 := by
  have hd := pivot_neighbor_antiNeighbor_disjoint G v
  constructor
  · intro hG
    refine ⟨isRamseyGraph_induce_neighborSet_succ hG v,
      isRamseyGraph_induce_antiNeighborSet_succ hG v, ?_, ?_⟩
    · apply (cliqueRectangleFree_iff_cliqueFreeOn G hd 5).mpr
      exact fun _ _ ↦ hG.1 _
    · apply (cliqueRectangleFree_compl_iff G hd 5).mp
      apply (cliqueRectangleFree_iff_cliqueFreeOn Gᶜ hd 5).mpr
      exact fun _ _ ↦ (SimpleGraph.cliqueFree_compl G).mpr hG.2 _
  · rintro ⟨hA, hB, hcl, hind⟩
    refine ⟨cliqueFree_five_of_pivot_rectangles G v hA.1 hcl, ?_⟩
    apply (SimpleGraph.cliqueFree_compl G).mp
    have hN : (Gᶜ.induce (Gᶜ.neighborSet v)).CliqueFree 4 := by
      rw [← antiNeighborSet_eq_compl, ← compl_induce]
      exact (SimpleGraph.cliqueFree_compl _).mpr hB.2
    apply cliqueFree_five_of_pivot_rectangles Gᶜ v hN
    have hrect := (cliqueRectangleFree_compl_iff G hd 5).mpr hind
    have hswap : CliqueRectangleFree Gᶜ (antiNeighborSet G v) (G.neighborSet v) 5 := by
      intro P Q hP hQ hcard hcP hcQ hcross
      apply hrect Q P hQ hP (by omega) hcQ hcP
      exact fun q hq p hp ↦ (hcross p hp q hq).symm
    rw [antiNeighborSet_eq_compl Gᶜ, compl_compl, ← antiNeighborSet_eq_compl G]
    exact hswap

end Ramsey
