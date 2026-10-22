module

public import Ramsey.n17.Rooted
public import Ramsey.n17.Model
public import Mathlib.Data.Fintype.EquivFin

/-!
# Uniqueness of the 17-vertex (4,4)-Ramsey graph

A Wagner neighborhood gives 38 possible outside signatures.
Their pair incidences force 1 of 2 reflected cyclic families and hence Paley-17.
-/

namespace Ramsey.n17

variable {V : Type*}

/-- Neighborhood vertices adjacent to a fixed neighbor are the corresponding common neighbors. -/
private def localNeighborEquiv (G : SimpleGraph V) (v : V) (a : G.neighborSet v) :
    (G.induce (G.neighborSet v)).neighborSet a ≃ G.commonNeighbors v a where
  toFun x := ⟨x.1.1, x.1.2, x.2⟩
  invFun x := ⟨⟨x.1, x.2.1⟩, x.2.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Every neighborhood is the cubic 8-vertex Wagner graph. -/
public theorem neighborhood_isomorphic_mobius8 [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} [DecidableRel G.Adj]
    (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17) (v : V) :
    Nonempty ((G.induce (G.neighborSet v)) ≃g mobius8) := by
  classical
  have hn := card_neighborSet_eq_eight_of_isRamseyGraph_4_4 hG hcard v
  have hreg (a : G.neighborSet v) : (G.induce (G.neighborSet v)).degree a = 3 := by
    rw [← SimpleGraph.card_neighborSet_eq_degree]
    exact (Fintype.card_congr (localNeighborEquiv G v a)).trans
      ((isSRGWith hG hcard).of_adj v a a.property)
  exact mobius8_unique (isRamseyGraph_induce_neighborSet_succ hG v) hn hreg

/-- Each cyclic family gives multiplicity 1 at all its 8 cyclic indices. -/
private lemma cyclic_signature_count_one :
    ∀ (reverse : Bool) (i : Fin 8),
      (if reverse then rightSignatureCounts else leftSignatureCounts)
        (cyclicSignatureIndex reverse i) = 1 := by
  decide

/-- The 8 cyclic signature indices are distinct in either orientation. -/
private lemma cyclic_signature_injective :
    ∀ reverse : Bool, Function.Injective (cyclicSignatureIndex reverse) := by
  decide

/-- Unit multiplicities identify the outside vertices with their cyclic signature indices. -/
private lemma exists_outside_equiv {B : Type*} [Fintype B] (sig : B → Fin 38)
    (reverse : Bool) (hcard : Nat.card B = 8)
    (hcounts : signatureMultiplicity sig =
      if reverse then rightSignatureCounts else leftSignatureCounts) :
    ∃ e : Fin 8 ≃ B, ∀ i, sig (e i) = cyclicSignatureIndex reverse i := by
  classical
  have hex (i : Fin 8) : ∃ b : B, sig b = cyclicSignatureIndex reverse i := by
    have hc : Nat.card {b // sig b = cyclicSignatureIndex reverse i} = 1 := by
      change signatureMultiplicity sig (cyclicSignatureIndex reverse i) = 1
      rw [hcounts]
      exact cyclic_signature_count_one reverse i
    obtain ⟨b⟩ : Nonempty {b // sig b = cyclicSignatureIndex reverse i} :=
      Finite.card_pos_iff.mp (by omega)
    exact ⟨b.val, b.property⟩
  choose b hb using hex
  have hinj : Function.Injective b := by
    intro i j hij
    apply cyclic_signature_injective reverse
    rw [← hb i, ← hb j, hij]
  have hbij : Function.Bijective b :=
    (Fintype.bijective_iff_injective_and_card b).mpr ⟨hinj, by
      simpa only [Fintype.card_fin, Nat.card_eq_fintype_card] using hcard.symm⟩
  exact ⟨Equiv.ofBijective b hbij, hb⟩

/-- A root and labelings of its 2 cells give a labeling of all 17 vertices. -/
private noncomputable def rootedLabels [Fintype V] {G : SimpleGraph V}
    (hcard : Nat.card V = 17) (v : V) (a : G.neighborSet v ≃ Fin 8)
    (b : Fin 8 ≃ antiNeighborSet G v) : R44Vertex ≃ V := by
  classical
  let f : R44Vertex → V
    | .inl _ => v
    | .inr (.inl i) => a.symm i
    | .inr (.inr i) => b i
  have hsurj : Function.Surjective f := by
    intro x
    by_cases hx : x = v
    · exact ⟨.inl (), hx.symm⟩
    · by_cases ha : G.Adj v x
      · refine ⟨.inr (.inl (a ⟨x, ha⟩)), ?_⟩
        simp [f]
      · refine ⟨.inr (.inr (b.symm ⟨x, hx, ha⟩)), ?_⟩
        simp [f]
  exact Equiv.ofBijective f ((Fintype.bijective_iff_surjective_and_card f).mpr
    ⟨hsurj, by simpa [R44Vertex, Nat.card_eq_fintype_card] using hcard.symm⟩)

/-- The exact signature multiplicities reconstruct Paley-17. -/
private theorem isomorphic_paley17_of_signature_data [Fintype V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17)
    (v : V) (e : G.neighborSet v ≃ Fin 8)
    (he : ∀ a b : G.neighborSet v, G.Adj a b ↔ mobius8.Adj (e a) (e b))
    (data : SignatureData G v e) (reverse : Bool)
    (hcounts : signatureMultiplicity data.sig =
      if reverse then rightSignatureCounts else leftSignatureCounts) :
    Nonempty (G ≃g paley17) := by
  classical
  obtain ⟨b, hb⟩ := exists_outside_equiv data.sig reverse data.outside_card hcounts
  let f := rootedLabels hcard v e b
  apply isomorphic_paley17_of_labels hG reverse f
  · intro i
    exact (e.symm i).property
  · intro i
    exact (b i).property.2
  · intro i j
    change G.Adj (e.symm i) (e.symm j) ↔ mobius8.Adj i j
    simpa only [e.apply_symm_apply] using he (e.symm i) (e.symm j)
  · intro i j
    change G.Adj (e.symm i) (b j) ↔ i ∈ signatureSet (cyclicSignatureIndex reverse j)
    rw [data.incidence, hb]

/-- Every 17-vertex (4,4)-Ramsey graph is isomorphic to the quadratic-residue graph. -/
public theorem isomorphic_paley17 [Finite V] {G : SimpleGraph V}
    (hG : IsRamseyGraph 4 4 G) (hcard : Nat.card V = 17) : Nonempty (G ≃g paley17) := by
  classical
  letI : Fintype V := Fintype.ofFinite V
  obtain ⟨v⟩ : Nonempty V := Finite.card_pos_iff.mp (by omega)
  obtain ⟨a⟩ := neighborhood_isomorphic_mobius8 hG hcard v
  let e : G.neighborSet v ≃ Fin 8 := a.toEquiv
  have he : ∀ x y : G.neighborSet v, G.Adj x y ↔ mobius8.Adj (e x) (e y) :=
    fun x y ↦ a.map_adj_iff.symm
  let data := rootedSignatureData hG hcard v e he
  rcases signature_counts_classification (signatureMultiplicity data.sig) data.total data.pairs with
    hleft | hright
  · exact isomorphic_paley17_of_signature_data hG hcard v e he data false hleft
  · exact isomorphic_paley17_of_signature_data hG hcard v e he data true hright

end Ramsey.n17
