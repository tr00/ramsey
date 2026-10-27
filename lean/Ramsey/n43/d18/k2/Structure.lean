module

public import Ramsey.n43.d18.ConnectivityClassification

/-!
# Ambient structure of a K2 neighborhood

The complete 2-vertex component of a degree-18 neighborhood is an edge anticomplete to
its 16-vertex complement. The complement retains its `(4,4)`-Ramsey type in the ambient graph.
-/

namespace Ramsey.d18.k2

/-- A degree-18 K2 pivot has an anticomplete edge and a 16-vertex `(4,4)`-Ramsey core. -/
public theorem exists_structure {G : SimpleGraph (Fin 43)} (v : Fin 43)
    (hv : deg G v = 18) (hK : IsKNeighborhood 2 (G.induce (G.neighborSet v))) :
    ∃ (u w : Fin 43) (C : Set (Fin 43)),
      u ≠ w ∧ G.Adj v u ∧ G.Adj v w ∧ G.Adj u w ∧
      G.neighborSet v = ({u, w} : Set (Fin 43)) ∪ C ∧
      Disjoint ({u, w} : Set (Fin 43)) C ∧
      (∀ x ∈ C, ¬G.Adj u x ∧ ¬G.Adj w x) ∧
      Nat.card C = 16 ∧ IsRamseyGraph 4 4 (G.induce C) := by
  classical
  obtain ⟨S, hcardS, hclique, hcut, hsum, -, h44, -⟩ := hK
  obtain ⟨u, w, huw, hpair⟩ := Set.ncard_eq_two.mp
    (show S.ncard = 2 by simpa only [Nat.card_coe_set_eq] using hcardS)
  have huS : u ∈ S := by rw [hpair]; simp
  have hwS : w ∈ S := by rw [hpair]; simp
  have huw' : u.1 ≠ w.1 := fun h ↦ huw (Subtype.ext h)
  let C : Set (Fin 43) := {x | G.Adj v x ∧ x ≠ u.1 ∧ x ≠ w.1}
  let e : C ≃ ↥(Sᶜ) := {
    toFun := fun x ↦ ⟨⟨x.1, x.2.1⟩, by
      rw [hpair]
      simp only [Set.mem_compl_iff, Set.mem_insert_iff, Set.mem_singleton_iff]
      rintro (h | h)
      · exact x.2.2.1 (congrArg Subtype.val h)
      · exact x.2.2.2 (congrArg Subtype.val h)⟩
    invFun := fun x ↦ ⟨x.1.1, x.1.2, by
      constructor
      · intro h
        apply x.2
        exact (Subtype.ext h : x.1 = u).symm ▸ huS
      · intro h
        apply x.2
        exact (Subtype.ext h : x.1 = w).symm ▸ hwS⟩
    left_inv := fun x ↦ by rfl
    right_inv := fun x ↦ by rfl }
  have hpartition : G.neighborSet v = ({u.1, w.1} : Set (Fin 43)) ∪ C := by
    ext x
    change G.Adj v x ↔ (x = u.1 ∨ x = w.1) ∨
      G.Adj v x ∧ x ≠ u.1 ∧ x ≠ w.1
    constructor
    · intro hx
      by_cases hxu : x = u.1
      · exact Or.inl (Or.inl hxu)
      by_cases hxw : x = w.1
      · exact Or.inl (Or.inr hxw)
      exact Or.inr ⟨hx, hxu, hxw⟩
    · rintro ((rfl | rfl) | hx)
      · exact u.2
      · exact w.2
      · exact hx.1
  have hdisjoint : Disjoint ({u.1, w.1} : Set (Fin 43)) C := by
    apply Set.disjoint_left.mpr
    intro x hx hxC
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    rcases hx with hx | hx
    · exact hxC.2.1 hx
    · exact hxC.2.2 hx
  have hnon : ∀ x ∈ C, ¬G.Adj u.1 x ∧ ¬G.Adj w.1 x := by
    intro x hx
    constructor
    · intro hadj
      exact hcut u huS (e ⟨x, hx⟩).1 (e ⟨x, hx⟩).2
        (SimpleGraph.induce_adj.mpr hadj)
    · intro hadj
      exact hcut w hwS (e ⟨x, hx⟩).1 (e ⟨x, hx⟩).2
        (SimpleGraph.induce_adj.mpr hadj)
  have hcardC : Nat.card C = 16 := by
    have he := Nat.card_congr e
    have hsum' : Nat.card S + Nat.card ↥(Sᶜ) = deg G v := hsum.trans hv.symm
    omega
  have h44C : IsRamseyGraph 4 4 (G.induce C) := by
    have h := isRamseyGraph_comap ((G.induce (G.neighborSet v)).induce Sᶜ)
      e.toEmbedding h44
    change IsRamseyGraph 4 4 (G.induce C) at h
    exact h
  exact ⟨u.1, w.1, C, huw', u.2, w.2,
    SimpleGraph.induce_adj.mp (hclique huS hwS huw),
    hpartition, hdisjoint, hnon, hcardC, h44C⟩

end Ramsey.d18.k2
