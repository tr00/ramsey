module

public import Ramsey.Defs
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Clique-transversal deletion: unproved statements

This module states the general deletion bounds, integer defects and numerical applications.
Every theorem remains deliberately unproved. The Ramsey upper bounds and edge lower bounds
are explicit hypotheses rather than published or census inputs asserted by this module.

Real lower bounds and exact integer defects have separate interfaces. Defect subtraction
takes place after casting edge counts to `ℤ`. The attachment floor uses `n - t + 1 - R`
in `ℕ`, including its nonnegative truncation.

The numerical four-set threshold is only 66, below 68. Its failure to exclude a transversal
is not an assertion that such a transversal, or an ambient extension, exists.
-/

@[expose] public section

open scoped BigOperators

namespace Ramsey.TransversalDeletion

variable {V : Type*}

/-- The number of neighbors of `x` outside the finite deletion set `T`. -/
noncomputable def outsideDegree (F : SimpleGraph V) (T : Finset V) (x : V) : ℕ :=
  Nat.card {y : V // y ∉ T ∧ F.Adj x y}

/-- The number of nonneighbors of `x` outside `T`, excluding `x` when `x ∈ T`. -/
noncomputable def outsideNonneighborCount (F : SimpleGraph V) (T : Finset V) (x : V) : ℕ :=
  Nat.card {y : V // y ∉ T ∧ ¬F.Adj x y}

/-- The common size, independence and Ramsey upper-bound hypotheses for deletion. -/
structure DeletionHypotheses (F : SimpleGraph V) (n r s t R : ℕ) : Prop where
  card_eq : Nat.card V = n
  clique_order_ge : 2 ≤ r
  indep_order_ge : 3 ≤ s
  deletion_size_le : t ≤ n
  indep_free : F.IndepSetFree s
  ramsey_upper : RamseyUpperBound r (s - 1) R

/-- A clique transversal with the exact size used in the deletion calculation. -/
structure IsSizedCliqueTransversal (F : SimpleGraph V) (r : ℕ) (T : Finset V)
    (t : ℕ) : Prop where
  card_eq : T.card = t
  transversal : IsCliqueTransversal F r T

/-- The truncated lower bound on each attachment degree outside a deletion set. -/
def attachmentFloor (n t R : ℕ) : ℕ := n - t + 1 - R

/-- The real deletion threshold for an external real edge lower bound. -/
noncomputable def deletionThreshold (n s t R : ℕ) (L : ℝ) : ℝ :=
  L + (t : ℝ) * (attachmentFloor n t R : ℝ) + (balancedCliqueEdges t (s - 1) : ℝ)

/-- The exact integer deletion threshold for an integral edge lower bound. -/
def integerDeletionThreshold (n s t R : ℕ) (L : ℤ) : ℤ :=
  L + (t : ℤ) * (attachmentFloor n t R : ℤ) + (balancedCliqueEdges t (s - 1) : ℤ)

/-- The total defect subtracts the integer threshold after casting the edge count. -/
noncomputable def totalDefect (F : SimpleGraph V) (n s t R : ℕ) (L : ℤ) : ℤ :=
  (Nat.card F.edgeSet : ℤ) - integerDeletionThreshold n s t R L

/-- The core defect measures edges outside `T` above the integral external bound. -/
noncomputable def coreDefect (F : SimpleGraph V) (T : Finset V) (L : ℤ) : ℤ :=
  (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℤ) - L

/-- The internal defect measures edges on `T` above the balanced-clique lower bound. -/
noncomputable def internalDefect (F : SimpleGraph V) (T : Finset V) (s t : ℕ) : ℤ :=
  (Nat.card (F.induce (T : Set V)).edgeSet : ℤ) - (balancedCliqueEdges t (s - 1) : ℤ)

/-- The attachment defect of one vertex is an integer difference, not Nat subtraction. -/
noncomputable def attachmentDefect (F : SimpleGraph V) (T : Finset V)
    (n t R : ℕ) (x : V) : ℤ :=
  (outsideDegree F T x : ℤ) - (attachmentFloor n t R : ℤ)

/-- The total attachment defect sums the integer defects over the deletion set. -/
noncomputable def totalAttachmentDefect (F : SimpleGraph V) (T : Finset V)
    (n t R : ℕ) : ℤ :=
  ∑ x ∈ T, attachmentDefect F T n t R x

/-- The cross-edge defect measures the entire cut above its attachment floor. -/
noncomputable def crossAttachmentDefect (F : SimpleGraph V) (T : Finset V)
    (n t R : ℕ) : ℤ :=
  (Nat.card (crossEdgeSet F (T : Set V) (T : Set V)ᶜ) : ℤ) -
    (t : ℤ) * (attachmentFloor n t R : ℤ)

/-- The Ramsey types and edge bounds of the core, nonneighbor sets and deletion set. -/
structure DeletionComponentBounds (F : SimpleGraph V) (T : Finset V)
    (n r s t R : ℕ) (L : ℝ) : Prop where
  core_ramsey : IsRamseyGraph r s (F.induce (T : Set V)ᶜ)
  core_lower : L ≤ (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℝ)
  nonneighbor_ramsey : ∀ x ∈ T,
    IsRamseyGraph r (s - 1) (F.induce {y | y ∉ T ∧ ¬F.Adj x y})
  nonneighbor_count_le : ∀ x ∈ T, outsideNonneighborCount F T x ≤ R - 1
  attachment_lower : ∀ x ∈ T, attachmentFloor n t R ≤ outsideDegree F T x
  internal_lower : balancedCliqueEdges t (s - 1) ≤ Nat.card (F.induce (T : Set V)).edgeSet
  cross_lower : t * attachmentFloor n t R ≤
    Nat.card (crossEdgeSet F (T : Set V) (T : Set V)ᶜ)

/-- The exact integer decomposition and nonnegative bounds for every component defect. -/
structure DeletionDefectIdentity (F : SimpleGraph V) (T : Finset V)
    (n s t R : ℕ) (L : ℤ) : Prop where
  total_nonneg : 0 ≤ totalDefect F n s t R L
  decomposition : totalDefect F n s t R L =
    coreDefect F T L + internalDefect F T s t + totalAttachmentDefect F T n t R
  core_nonneg : 0 ≤ coreDefect F T L
  core_le_total : coreDefect F T L ≤ totalDefect F n s t R L
  internal_nonneg : 0 ≤ internalDefect F T s t
  internal_le_total : internalDefect F T s t ≤ totalDefect F n s t R L
  attachment_nonneg : 0 ≤ totalAttachmentDefect F T n t R
  attachment_le_total : totalAttachmentDefect F T n t R ≤ totalDefect F n s t R L
  vertex_nonneg : ∀ x ∈ T, 0 ≤ attachmentDefect F T n t R x
  vertex_le_total : ∀ x ∈ T, attachmentDefect F T n t R x ≤ totalDefect F n s t R L

/-- Stability caps component edges, attachment degrees and the number of positive defects. -/
structure DeletionDefectStability [DecidableEq V] (F : SimpleGraph V) (T : Finset V)
    (n s t R : ℕ) (L : ℤ) : Prop where
  core_upper : (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℤ) ≤
    L + totalDefect F n s t R L
  internal_upper : (Nat.card (F.induce (T : Set V)).edgeSet : ℤ) ≤
    (balancedCliqueEdges t (s - 1) : ℤ) + totalDefect F n s t R L
  attachment_lower : ∀ x ∈ T, (attachmentFloor n t R : ℤ) ≤ (outsideDegree F T x : ℤ)
  attachment_upper : ∀ x ∈ T, (outsideDegree F T x : ℤ) ≤
    min ((n - t : ℕ) : ℤ) ((attachmentFloor n t R : ℤ) + totalDefect F n s t R L)
  positive_attachment_count :
    ((T.filter (fun x ↦ attachmentFloor n t R < outsideDegree F T x)).card : ℤ) ≤
      totalDefect F n s t R L

/-- Equality fixes each component and gives balanced cliques, with empty parts allowed. -/
structure DeletionEqualityStructure (F : SimpleGraph V) (T : Finset V)
    (n s t R : ℕ) (L : ℤ) : Prop where
  core_eq : (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℤ) = L
  internal_eq : Nat.card (F.induce (T : Set V)).edgeSet = balancedCliqueEdges t (s - 1)
  cross_eq : Nat.card (crossEdgeSet F (T : Set V) (T : Set V)ᶜ) =
    t * attachmentFloor n t R
  attachment_eq : ∀ x ∈ T, outsideDegree F T x = attachmentFloor n t R
  balanced : IsBalancedCliqueUnion (F.induce (T : Set V)) (s - 1)
  nonneighbor_eq_of_pos : 0 < attachmentFloor n t R →
    ∀ x ∈ T, outsideNonneighborCount F T x = R - 1
  attachment_eq_zero : attachmentFloor n t R = 0 → ∀ x ∈ T, outsideDegree F T x = 0

/-- A clique transversal is exactly a deletion set leaving a clique-free graph. -/
theorem isCliqueTransversal_iff_cliqueFree_deleted (F : SimpleGraph V) (T : Finset V)
    (r : ℕ) :
    IsCliqueTransversal F r T ↔ (F.induce (T : Set V)ᶜ).CliqueFree r := by sorry

section GeneralDeletion

variable [hFinite : Finite V] [hDecidableEq : DecidableEq V]
variable (F : SimpleGraph V) {n r s t R : ℕ}

include hFinite hDecidableEq

/-- Component bounds retain each nonneighbor set's Ramsey type without a global clique ban. -/
theorem deletion_component_bounds {L : ℝ} (h : DeletionHypotheses F n r s t R)
    (hL : RamseyEdgeLowerBound (n - t) r s L)
    (T : Finset V) (hT : IsSizedCliqueTransversal F r T t) :
    DeletionComponentBounds F T n r s t R L := by sorry

/-- The general deletion lower bound permits any real external lower bound. -/
theorem deletion_edge_lower_bound {L : ℝ} (h : DeletionHypotheses F n r s t R)
    (hL : RamseyEdgeLowerBound (n - t) r s L)
    (T : Finset V) (hT : IsSizedCliqueTransversal F r T t) :
    deletionThreshold n s t R L ≤ (Nat.card F.edgeSet : ℝ) := by sorry

/-- The strict threshold excludes all transversals of size at most `t` by enlargement. -/
theorem no_small_transversal_of_strict_edge_bound {L : ℝ}
    (h : DeletionHypotheses F n r s t R) (hL : RamseyEdgeLowerBound (n - t) r s L)
    (hEdges : (Nat.card F.edgeSet : ℝ) < deletionThreshold n s t R L) :
    ¬∃ T : Finset V, T.card ≤ t ∧ IsCliqueTransversal F r T := by sorry

/-- When the real threshold is an integer `B`, the integer cutoff is `B - 1`. -/
theorem no_small_transversal_of_integer_edge_cutoff {L : ℝ} {B : ℤ}
    (h : DeletionHypotheses F n r s t R) (hL : RamseyEdgeLowerBound (n - t) r s L)
    (hIntegral : deletionThreshold n s t R L = (B : ℝ))
    (hEdges : (Nat.card F.edgeSet : ℤ) ≤ B - 1) :
    ¬∃ T : Finset V, T.card ≤ t ∧ IsCliqueTransversal F r T := by sorry

/-- Integral lower bounds give an exact decomposition with nonnegative component defects. -/
theorem deletion_defect_identity {L : ℤ} (h : DeletionHypotheses F n r s t R)
    (hL : RamseyEdgeLowerBound (n - t) r s (L : ℝ))
    (T : Finset V) (hT : IsSizedCliqueTransversal F r T t) :
    DeletionDefectIdentity F T n s t R L := by sorry

/-- Stability includes the ambient attachment cap and an integral positive-defect count. -/
theorem deletion_defect_stability {L : ℤ} (h : DeletionHypotheses F n r s t R)
    (hL : RamseyEdgeLowerBound (n - t) r s (L : ℝ))
    (T : Finset V) (hT : IsSizedCliqueTransversal F r T t) :
    DeletionDefectStability F T n s t R L := by sorry

/-- Equality forces all component equalities, with exact nonneighbor counts at positive floor. -/
theorem deletion_equality_structure {L : ℤ} (h : DeletionHypotheses F n r s t R)
    (hL : RamseyEdgeLowerBound (n - t) r s (L : ℝ))
    (T : Finset V) (hT : IsSizedCliqueTransversal F r T t)
    (hEquality : (Nat.card F.edgeSet : ℤ) = integerDeletionThreshold n s t R L) :
    DeletionEqualityStructure F T n s t R L := by sorry

end GeneralDeletion

/-- Complementation interchanges clique transversals and independent-set transversals. -/
theorem cliqueTransversal_iff_indepTransversal_compl (F : SimpleGraph V) (r : ℕ)
    (T : Finset V) :
    IsCliqueTransversal F r T ↔ IsIndepTransversal Fᶜ r T := by sorry

/-- The three-set threshold is 71 when the explicit external inputs are 9 and 50. -/
theorem eighteen_three_transversal_edge_lower_bound (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hTcard : T.card ≤ 3) (hT : IsCliqueTransversal F 4 T) :
    71 ≤ Nat.card F.edgeSet := by sorry

/-- Every clique transversal has at least four vertices when `F` has at most 70 edges. -/
theorem eighteen_transversal_card_ge_four (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hEdges : Nat.card F.edgeSet ≤ 70)
    (hR : RamseyUpperBound 4 3 9) (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hT : IsCliqueTransversal F 4 T) :
    4 ≤ T.card := by sorry

/-- The same size bound applies to independent-four transversals of the complement of `F`. -/
theorem eighteen_complement_indep_transversal_card_ge_four
    (F : SimpleGraph (Fin 18)) (hF : F.IndepSetFree 4)
    (hEdges : Nat.card F.edgeSet ≤ 70) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hT : IsIndepTransversal Fᶜ 4 T) :
    4 ≤ T.card := by sorry

/-- A `(4,5)`-free pivot complement with `68 + q` edges has this bound when `q ≤ 2`. -/
theorem eighteen_pivot_indep_transversal_card_ge_four (A : SimpleGraph (Fin 18))
    (hA : IsRamseyGraph 4 5 A) {q : ℤ} (hq : q ≤ 2)
    (hEdges : (Nat.card Aᶜ.edgeSet : ℤ) = 68 + q)
    (hR : RamseyUpperBound 4 3 9) (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hT : IsIndepTransversal A 4 T) :
    4 ≤ T.card := by sorry

/-- Actual cross columns have size at least four under the ambient independent-five ban. -/
theorem eighteen_cross_column_card_ge_four [Finite V] [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hAcard : Nat.card A = 18)
    (hA : IsRamseyGraph 4 5 (G.induce A)) (hG : G.IndepSetFree 5)
    (hEdges : Nat.card ((G.induce A)ᶜ).edgeSet ≤ 70)
    (hR : RamseyUpperBound 4 3 9) (hL : RamseyEdgeLowerBound 15 4 4 50)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) :
    IsIndepTransversal (G.induce A) 4 C ∧
      4 ≤ C.card ∧ 4 ≤ Nat.card (columnSet G A y) := by sorry

/-- The four-set threshold is 66, including the edge forced by clique sizes `2, 1, 1`. -/
theorem eighteen_four_transversal_edge_lower_bound (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 14 4 4 41)
    (T : Finset (Fin 18)) (hTcard : T.card = 4) (hT : IsCliqueTransversal F 4 T) :
    66 ≤ Nat.card F.edgeSet := by sorry

/-- The exact four-set defect and frontier budget retain all component nonnegativity bounds. -/
structure FourTransversalDefectBudget (F : SimpleGraph (Fin 18)) (T : Finset (Fin 18))
    (q : ℤ) : Prop where
  total_eq : totalDefect F 18 4 4 9 41 = 2 + q
  decomposition : coreDefect F T 41 + internalDefect F T 4 4 +
    totalAttachmentDefect F T 18 4 9 = 2 + q
  core_nonneg : 0 ≤ coreDefect F T 41
  internal_nonneg : 0 ≤ internalDefect F T 4 4
  vertex_nonneg : ∀ x ∈ T, 0 ≤ attachmentDefect F T 18 4 9 x
  cross_eq_attachment : crossAttachmentDefect F T 18 4 9 = totalAttachmentDefect F T 18 4 9
  cross_nonneg : 0 ≤ crossAttachmentDefect F T 18 4 9
  internal_lower : 1 ≤ (Nat.card (F.induce (T : Set (Fin 18))).edgeSet : ℤ)
  frontier_budget : coreDefect F T 41 + crossAttachmentDefect F T 18 4 9 +
    (Nat.card (F.induce (T : Set (Fin 18))).edgeSet : ℤ) = 3 + q

/-- At `68 + q` edges, the four-set defect is `2 + q` and the frontier budget is `3 + q`. -/
theorem eighteen_four_transversal_defect_budget (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 14 4 4 41)
    (T : Finset (Fin 18)) (hTcard : T.card = 4) (hT : IsCliqueTransversal F 4 T)
    {q : ℤ} (hq : 0 ≤ q) (hEdges : (Nat.card F.edgeSet : ℤ) = 68 + q) :
    FourTransversalDefectBudget F T q := by sorry

/-- The four-set threshold improves 65 to 66, but neither value excludes 68 edges. -/
theorem four_transversal_thresholds_below_sixty_eight :
    balancedCliqueEdges 4 3 = 1 ∧
      (41 + 4 * 6 : ℕ) = 65 ∧
      (41 + 4 * 6 + balancedCliqueEdges 4 3 : ℕ) = 66 ∧
      (65 : ℕ) < 68 ∧ (66 : ℕ) < 68 ∧ ¬((68 : ℕ) < 66) := by sorry

end Ramsey.TransversalDeletion
