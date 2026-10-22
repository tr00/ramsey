module

public import Ramsey.n17.Paley
public import Ramsey.n17.Structure
public import Ramsey.n17.Signatures
public import Ramsey.n17.M8

/-!
# Reconstruction from the 2 cyclic signature families

A rooted labeling with either family embeds in Paley-17.
Regularity turns that embedding into a graph isomorphism.
-/

namespace Ramsey.n17

/-- Rooted labels separate the root, its neighbors, and its nonneighbors. -/
public abbrev R44Vertex := Unit ⊕ (Fin 8 ⊕ Fin 8)

/-- The 8 nonzero square labels in cyclic order. -/
@[expose] public def squareLabel : Fin 8 → ZMod 17 := ![1, 2, 4, 8, 16, 15, 13, 9]

/-- The 8 nonsquare labels in the corresponding cyclic order. -/
@[expose] public def nonsquareLabel : Fin 8 → ZMod 17 := ![10, 3, 6, 12, 7, 14, 11, 5]

/-- The left signature at each cyclic outside index. -/
@[expose] public def leftSignatureIndex : Fin 8 → Fin 38 := ![20, 1, 5, 13, 27, 15, 34, 29]

/-- The right signature at each cyclic outside index. -/
@[expose] public def rightSignatureIndex : Fin 8 → Fin 38 := ![2, 8, 17, 36, 32, 25, 10, 21]

/-- Select the signature family by its orientation. -/
@[expose] public def cyclicSignatureIndex (reverse : Bool) : Fin 8 → Fin 38 :=
  if reverse then rightSignatureIndex else leftSignatureIndex

/-- Reflecting the 2 cyclic blocks interchanges the signature families. -/
@[expose] public def reflectR44 : R44Vertex ≃ R44Vertex where
  toFun
    | .inl _ => .inl ()
    | .inr (.inl i) => .inr (.inl ⟨(8 - i.val) % 8, Nat.mod_lt _ (by decide)⟩)
    | .inr (.inr i) => .inr (.inr ⟨(13 - i.val) % 8, Nat.mod_lt _ (by decide)⟩)
  invFun
    | .inl _ => .inl ()
    | .inr (.inl i) => .inr (.inl ⟨(8 - i.val) % 8, Nat.mod_lt _ (by decide)⟩)
    | .inr (.inr i) => .inr (.inr ⟨(13 - i.val) % 8, Nat.mod_lt _ (by decide)⟩)
  left_inv := by decide
  right_inv := by decide

/-- Explicit Paley labels for the root and the 2 cyclic blocks. -/
@[expose] public def paleyLabels : R44Vertex ≃ ZMod 17 where
  toFun
    | .inl _ => 0
    | .inr (.inl i) => squareLabel i
    | .inr (.inr i) => nonsquareLabel i
  invFun x := match x.val with
    | 0 => .inl ()
    | 1 => .inr (.inl 0)
    | 2 => .inr (.inl 1)
    | 3 => .inr (.inr 1)
    | 4 => .inr (.inl 2)
    | 5 => .inr (.inr 7)
    | 6 => .inr (.inr 2)
    | 7 => .inr (.inr 4)
    | 8 => .inr (.inl 3)
    | 9 => .inr (.inl 7)
    | 10 => .inr (.inr 0)
    | 11 => .inr (.inr 6)
    | 12 => .inr (.inr 3)
    | 13 => .inr (.inl 6)
    | 14 => .inr (.inr 5)
    | 15 => .inr (.inl 5)
    | _ => .inr (.inl 4)
  left_inv := by decide
  right_inv := by decide

/-- Oriented Paley labels implement either cyclic signature family. -/
@[expose] public def orientedPaleyLabels (reverse : Bool) : R44Vertex ≃ ZMod 17 :=
  if reverse then reflectR44.trans paleyLabels else paleyLabels

/-- The concrete Paley labeling has exactly the prescribed root incidences. -/
public theorem paleyLabels_root :
    ∀ (r : Bool) (i : Fin 8),
      paley17.Adj (orientedPaleyLabels r (.inl ()))
        (orientedPaleyLabels r (.inr (.inl i))) ∧
      ¬paley17.Adj (orientedPaleyLabels r (.inl ()))
        (orientedPaleyLabels r (.inr (.inr i))) := by
  decide

/-- The square block has the Wagner adjacencies in both orientations. -/
public theorem paleyLabels_square :
    ∀ (r : Bool) (i j : Fin 8),
      paley17.Adj (orientedPaleyLabels r (.inr (.inl i)))
        (orientedPaleyLabels r (.inr (.inl j))) ↔ mobius8.Adj i j := by
  decide

/-- The cross block has precisely the prescribed signature incidences. -/
public theorem paleyLabels_cross :
    ∀ (r : Bool) (i j : Fin 8),
      paley17.Adj (orientedPaleyLabels r (.inr (.inl i)))
        (orientedPaleyLabels r (.inr (.inr j))) ↔ i ∈ signatureSet (cyclicSignatureIndex r j) := by
  decide

/-- A forbidden outside pair has an adjacent pair of common square neighbors. -/
public theorem paleyLabels_outside_obstruction :
    ∀ (r : Bool) (i j : Fin 8), i ≠ j →
      ¬paley17.Adj (orientedPaleyLabels r (.inr (.inr i)))
        (orientedPaleyLabels r (.inr (.inr j))) →
      ∃ a b : Fin 8, mobius8.Adj a b ∧
        a ∈ signatureSet (cyclicSignatureIndex r i) ∧
        a ∈ signatureSet (cyclicSignatureIndex r j) ∧
        b ∈ signatureSet (cyclicSignatureIndex r i) ∧
        b ∈ signatureSet (cyclicSignatureIndex r j) := by
  decide

/-- Inclusion between finite graphs with equal degrees is equality. -/
private lemma graph_eq_of_le_regular {V : Type*} [Fintype V] {G H : SimpleGraph V}
    [DecidableRel G.Adj] [DecidableRel H.Adj]
    (hle : G ≤ H) (hdeg : ∀ v, G.degree v = H.degree v) : G = H := by
  classical
  have hn (v : V) : G.neighborFinset v = H.neighborFinset v := by
    apply Finset.eq_of_subset_of_card_le
    · intro w hw
      exact (H.mem_neighborFinset v w).mpr (hle ((G.mem_neighborFinset v w).mp hw))
    · simpa only [SimpleGraph.card_neighborFinset_eq_degree] using (hdeg v).ge
  ext v w
  simpa only [SimpleGraph.mem_neighborFinset] using
    (show w ∈ G.neighborFinset v ↔ w ∈ H.neighborFinset v by rw [hn v])

/-- Either cyclic signature family determines a graph isomorphic to Paley-17. -/
public theorem isomorphic_paley17_of_labels {V : Type*} [Fintype V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) (reverse : Bool) (f : R44Vertex ≃ V)
    (hrootA : ∀ i : Fin 8, G.Adj (f (.inl ())) (f (.inr (.inl i))))
    (hrootB : ∀ i : Fin 8, ¬G.Adj (f (.inl ())) (f (.inr (.inr i))))
    (hAA : ∀ i j : Fin 8,
      G.Adj (f (.inr (.inl i))) (f (.inr (.inl j))) ↔ mobius8.Adj i j)
    (hAB : ∀ i j : Fin 8,
      G.Adj (f (.inr (.inl i))) (f (.inr (.inr j))) ↔
        i ∈ signatureSet (cyclicSignatureIndex reverse j)) : Nonempty (G ≃g paley17) := by
  classical
  let H := G.comap f
  let P := paley17.comap (orientedPaleyLabels reverse)
  have hH : IsRamseyGraph 4 4 H := isRamseyGraph_comap G f.toEmbedding hG
  have hP : IsRamseyGraph 4 4 P :=
    isRamseyGraph_comap paley17 (orientedPaleyLabels reverse).toEmbedding paley17_isRamseyGraph
  have hle : H ≤ P := by
    intro x y hxy
    rcases x with ⟨⟩ | (i | i) <;> rcases y with ⟨⟩ | (j | j)
    · exact (hxy.ne rfl).elim
    · exact (paleyLabels_root reverse j).1
    · exact (hrootB j hxy).elim
    · exact (paleyLabels_root reverse i).1.symm
    · exact (paleyLabels_square reverse i j).mpr ((hAA i j).mp hxy)
    · exact (paleyLabels_cross reverse i j).mpr ((hAB i j).mp hxy)
    · exact (hrootB i hxy.symm).elim
    · exact ((paleyLabels_cross reverse j i).mpr ((hAB j i).mp hxy.symm)).symm
    · by_contra hnot
      have hij : i ≠ j := by
        intro he
        subst j
        exact hxy.ne rfl
      obtain ⟨a, b, hab, hai, haj, hbi, hbj⟩ :=
        paleyLabels_outside_obstruction reverse i j hij hnot
      have h1 : H.IsNClique 1 {Sum.inr (Sum.inr j)} := by simp
      have h2 := h1.insert (a := Sum.inr (Sum.inr i)) (by simpa using hxy)
      have h3 := h2.insert (a := Sum.inr (Sum.inl b)) (by
        simpa [H] using And.intro ((hAB b i).mpr hbi) ((hAB b j).mpr hbj))
      have h4 := h3.insert (a := Sum.inr (Sum.inl a)) (by
        simpa [H] using And.intro ((hAA a b).mpr hab)
          (And.intro ((hAB a i).mpr hai) ((hAB a j).mpr haj)))
      exact hH.1 _ h4
  have hc : Nat.card R44Vertex = 17 := by simp [R44Vertex]
  have hdeg (x : R44Vertex) : H.degree x = P.degree x := by
    have hh := card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hH hc x
    have hp := card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hP hc x
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using
      hh.trans hp.symm
  have heq : H = P := graph_eq_of_le_regular hle hdeg
  have hi : H ≃g paley17 := by
    rw [heq]
    exact SimpleGraph.Iso.comap (orientedPaleyLabels reverse) paley17
  exact ⟨(SimpleGraph.Iso.comap f G).symm.trans hi⟩

end Ramsey.n17
