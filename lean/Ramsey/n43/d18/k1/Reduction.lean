module

public import Ramsey.n43.d18.k1.Structure
public import Ramsey.n43.d18.k1.Budgets
public import Ramsey.n43.d18.k1.Attachments
public import Ramsey.n43.d18.k1.Completion
public import Ramsey.n43.d18.k1.Parameters
public import Ramsey.n43.d18.k1.VertexBounds
public import Ramsey.defs.Completeness

/-!
# The exact K1 completion reduction

A key fixes the ordered roots and all blocks outside the cross-core matrix.
Its cross-core block is erased, so no old matrix is retained in the key.
The 289 Boolean positions are checked by exactly the 8 clique and 3 independent types.
-/

namespace Ramsey.d18.k1

attribute [local instance] Classical.propDecidable

/-- A labelled partial graph fixes every block except the erased cross-core block. -/
public structure Key where
  /-- The graph containing all fixed blocks and no cross-core edges. -/
  base : SimpleGraph (Fin 43)
  /-- Its ordered roots determine the 3 canonical cells. -/
  frame : Frame base
  /-- Both cores and the 2 fixed sides satisfy the admissibility conditions. -/
  admissible : frame.Admissible
  /-- No cross-core edge is retained in a partial key. -/
  erased : ∀ c : frame.C, ∀ d : frame.D, ¬base.Adj c d

namespace Key

/-- A completion chooses 1 Boolean value at every cross-core position. -/
public abbrev Matrix (K : Key) := K.frame.C → K.frame.D → Bool

/-- Assemble the graph by filling precisely the erased cross-core block. -/
@[expose] public noncomputable def assemble (K : Key) (X : K.Matrix) :
    SimpleGraph (Fin 43) := replace K.frame (fun c d ↦ X c d = true)

/-- The ordered roots and canonical cells persist in every assembled graph. -/
@[expose] public noncomputable def assembledFrame (K : Key) (X : K.Matrix) :
    Frame (K.assemble X) := replaceFrame K.frame (fun c d ↦ X c d = true)

/-- Valid matrices satisfy the explicit 8 negative and 3 positive rectangle families. -/
@[expose] public def Valid (K : Key) (X : K.Matrix) : Prop :=
  CliqueCompatible (K.assembledFrame X) ∧ IndepCompatible (K.assembledFrame X)

/-- Assembly produces a Ramsey graph exactly for matrices satisfying the 11 clause families. -/
public theorem assemble_ramsey_iff (K : Key) (X : K.Matrix) :
    IsRamseyGraph 5 5 (K.assemble X) ↔ K.Valid X :=
  replace_ramsey_iff_compatible K.frame K.admissible (fun c d ↦ X c d = true)

/-- The Boolean matrix domain has exactly 289 independently assigned positions. -/
public theorem position_card (K : Key) : Nat.card (K.frame.C × K.frame.D) = 289 :=
  cross_domain_card K.frame K.admissible

set_option exponentiation.threshold 300 in
/-- Every key has exactly 2 raised to 289 Boolean matrices before compatibility filtering. -/
public theorem matrix_card (K : Key) : Nat.card K.Matrix = 2 ^ 289 := by
  have hb : Nat.card Bool = 2 := by simp only [Nat.card_eq_fintype_card, Fintype.card_bool]
  rw [Matrix, Nat.card_fun, Nat.card_fun, K.admissible.card_C, K.admissible.card_D, hb]
  exact (Nat.pow_mul 2 17 17).symm

/-- Distinct Boolean matrices give distinct labelled assembled graphs for a fixed key. -/
public theorem assemble_injective (K : Key) : Function.Injective K.assemble := by
  intro X Y h
  funext c d
  have he : (K.assemble X).Adj c d ↔ (K.assemble Y).Adj c d := by rw [h]
  change (replace K.frame (fun c d ↦ X c d = true)).Adj c d ↔
    (replace K.frame (fun c d ↦ Y c d = true)).Adj c d at he
  rw [replace_adj_cross, replace_adj_cross] at he
  cases hx : X c d <;> cases hy : Y c d <;> simp_all

/-- Erasing a frame matrix produces a key that retains all its fixed blocks. -/
@[expose] public noncomputable def ofFrame {G : SimpleGraph (Fin 43)}
    (F : Frame G) (hF : F.Admissible) : Key where
  base := replace F (fun _ _ ↦ False)
  frame := replaceFrame F (fun _ _ ↦ False)
  admissible := replace_admissible F hF (fun _ _ ↦ False)
  erased := by
    intro c d hadj
    obtain ⟨hc, hd, -⟩ := replaceFrame_cells F (fun _ _ ↦ False)
    have hcm : (c : Fin 43) ∈ F.C := by simpa only [hc] using c.property
    have hdm : (d : Fin 43) ∈ F.D := by simpa only [hd] using d.property
    exact (replace_adj_cross F (fun _ _ ↦ False) ⟨c, hcm⟩ ⟨d, hdm⟩).mp hadj

/-- The original adjacency supplies a Boolean completion of the erased key. -/
@[expose] public noncomputable def actualMatrix {G : SimpleGraph (Fin 43)}
    (F : Frame G) (hF : F.Admissible) : (ofFrame F hF).Matrix :=
  fun c d ↦ decide (G.Adj c d)

/-- Extracting and then assembling the erased key recovers the original graph exactly. -/
public theorem ofFrame_reconstruct {G : SimpleGraph (Fin 43)} (F : Frame G)
    (hF : F.Admissible) : (ofFrame F hF).assemble (actualMatrix F hF) = G := by
  obtain ⟨hc, hd, -⟩ := replaceFrame_cells F (fun _ _ ↦ False)
  ext x y
  change (if x ∈ (replaceFrame F (fun _ _ ↦ False)).C ∧
      y ∈ (replaceFrame F (fun _ _ ↦ False)).D then decide (G.Adj x y) = true
    else if y ∈ (replaceFrame F (fun _ _ ↦ False)).C ∧
      x ∈ (replaceFrame F (fun _ _ ↦ False)).D then decide (G.Adj y x) = true
    else (replace F (fun _ _ ↦ False)).Adj x y) ↔ G.Adj x y
  rw [hc, hd]
  simp only [decide_eq_true_eq, replace]
  split_ifs <;> simp_all [SimpleGraph.adj_comm]

end Key

/-- Necessary numerical and vertexwise filters on a completed double-core frame. -/
public structure Frame.Filters {G : SimpleGraph (Fin 43)} (F : Frame G) : Prop where
  /-- All 4 scalar parameters satisfy the full aggregate outer envelope. -/
  parameters : F.parameters.Allowed
  /-- Both 17-core attachment blocks have at least 64 edges. -/
  attachments : 64 ≤ crossEdgeCount G F.C F.T ∧ 64 ≤ crossEdgeCount G F.D F.T
  /-- The 7-cell carries 26 to 42 degree-excess units. -/
  excess_T : 26 ≤ degreeExcess G 18 F.T ∧ degreeExcess G 18 F.T ≤ 42
  /-- Each 7-cell vertex meets each core in at least 9 vertices. -/
  vertex_T : ∀ t ∈ F.T,
    9 ≤ Nat.card (rowSet G F.C t) ∧ 9 ≤ Nat.card (rowSet G F.D t)
  /-- Each first-core vertex meets the 7-cell in 2 to 7 vertices. -/
  vertex_C : ∀ c ∈ F.C,
    2 ≤ Nat.card (rowSet G F.T c) ∧ Nat.card (rowSet G F.T c) ≤ 7
  /-- Each second-core vertex meets the 7-cell in 2 to 7 vertices. -/
  vertex_D : ∀ d ∈ F.D,
    2 ≤ Nat.card (rowSet G F.T d) ∧ Nat.card (rowSet G F.T d) ≤ 7

/-- Every actual Ramsey completion satisfies the recorded numerical and vertexwise filters. -/
public theorem Frame.filters_of_ramsey {G : SimpleGraph (Fin 43)} (F : Frame G)
    (hF : F.Admissible) (hG : IsRamseyGraph 5 5 G) : F.Filters where
  parameters := F.parameters_allowed hF hG
  attachments := ⟨attachment_cross_ge_sixty_four hF.ramsey_C hF.card_C hF.side_C
    F.disjoint_CT hF.card_T,
    attachment_cross_ge_sixty_four hF.ramsey_D hF.card_D hF.side_D F.disjoint_DT hF.card_T⟩
  excess_T := F.T_excess_range hF hG
  vertex_T := fun _ ht ↦ F.T_core_degree_ge_nine hF ht
  vertex_C := fun _ hc ↦ F.C_T_degree_bounds hF hG hc
  vertex_D := fun _ hd ↦ F.D_T_degree_bounds hF hG hd

/-- Every valid Boolean completion satisfies all filters without any additional assumption. -/
public theorem Key.valid_filters (K : Key) (X : K.Matrix) (h : K.Valid X) :
    (K.assembledFrame X).Filters :=
  Frame.filters_of_ramsey _ (replace_admissible K.frame K.admissible _)
    ((K.assemble_ramsey_iff X).mpr h)

/-- The reduced class retains a maximizing pivot in each compatible admissible-key completion. -/
@[expose] public def ReducedClass (G : SimpleGraph (Fin 43)) : Prop :=
  ∃ K : Key, ∃ X : K.Matrix, K.Valid X ∧ (K.assembledFrame X).Filters ∧
    IsMaximalDegree18Pivot (K.assemble X) (K.assembledFrame X).v ∧ K.assemble X = G

/-- Every K1 candidate is caught by the explicit admissible-key and 289-bit completion reduction. -/
public theorem reduction : Complete {G | ReducedClass G} (KClass 1) := by
  intro G hG
  obtain ⟨hRamsey, v, hv, hK⟩ := hG
  obtain ⟨F, hroot, hF⟩ := exists_admissible hRamsey v hv.1 hK
  let K := Key.ofFrame F hF
  let X := Key.actualMatrix F hF
  have hvalid : K.Valid X := by
    apply (K.assemble_ramsey_iff X).mp
    rw [Key.ofFrame_reconstruct]
    exact hRamsey
  refine ⟨K, X, hvalid, K.valid_filters X hvalid, ?_, Key.ofFrame_reconstruct F hF⟩
  change IsMaximalDegree18Pivot (K.assemble X) F.v
  rw [Key.ofFrame_reconstruct, hroot]
  exact hv

/-- Completeness of a reduced enumeration transfers to the original K1 branch. -/
public theorem complete_of_reduced {S : Set (SimpleGraph (Fin 43))}
    (h : Complete S ReducedClass) : Complete S (KClass 1) :=
  h.of_imp (fun G hG ↦ reduction G hG)

/-- Refuting every compatible completion would exclude K1 without assuming an exclusion. -/
public theorem excludes_of_reduced (h : Complete ∅ ReducedClass) : ExcludesSubcase .k1 := by
  intro G hG
  rw [subcaseSet_eq_empty]
  exact complete_of_reduced h G ((subcaseClass_k1 G).mp hG)

end Ramsey.d18.k1
