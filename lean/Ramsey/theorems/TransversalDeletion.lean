module

public import Ramsey.Defs
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Clique-transversal deletion: unproved statements

This module states Claims 01–04 of
`docs/general_theorems/transversal_deletion.md`. Every theorem is deliberately unproved
(`by sorry`). No published Ramsey or census input is imported or asserted here: the relevant
`RamseyUpperBound` and `RamseyEdgeLowerBound` propositions are explicit hypotheses.

Claim 01 allows a real lower bound, while Claim 02's exact defects are integers. Every defect
subtraction is performed after casting edge counts to `ℤ`. The natural number `h + 1 - R`
is the nonnegative truncation of the mathematical integer `h - R + 1`; `h - R + 1` in `ℕ`
would have the wrong value when `h < R`.

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

/-- The number of nonneighbors of `x` outside `T`; for `x ∈ T` these are other vertices. -/
noncomputable def outsideNonneighborCount (F : SimpleGraph V) (T : Finset V) (x : V) : ℕ :=
  Nat.card {y : V // y ∉ T ∧ ¬F.Adj x y}

/-- Source: `transversal_deletion.md#claim-transversal-deletion-01`, notation:
a clique transversal is exactly a deletion set leaving a clique-free graph. -/
theorem isCliqueTransversal_iff_cliqueFree_deleted (F : SimpleGraph V) (T : Finset V)
    (r : ℕ) :
    IsCliqueTransversal F r T ↔ (F.induce (T : Set V)ᶜ).CliqueFree r := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-01`.
The component bounds retain the Ramsey type of each nonneighbor set. The whole graph need
not be clique-free, and no graph attaining the external lower bound is presumed to exist. -/
theorem deletion_component_bounds [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℝ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s L)
    (T : Finset V) (hTcard : T.card = t) (hT : IsCliqueTransversal F r T) :
    let h := n - t
    let b := h + 1 - R
    let a := balancedCliqueEdges t (s - 1)
    IsRamseyGraph r s (F.induce (T : Set V)ᶜ) ∧
      L ≤ (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℝ) ∧
      (∀ x ∈ T,
        IsRamseyGraph r (s - 1) (F.induce {y | y ∉ T ∧ ¬F.Adj x y}) ∧
          outsideNonneighborCount F T x ≤ R - 1 ∧ b ≤ outsideDegree F T x) ∧
      a ≤ Nat.card (F.induce (T : Set V)).edgeSet ∧
      t * b ≤ Nat.card (crossEdgeSet F (T : Set V) (T : Set V)ᶜ) := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-01`.
The general deletion lower bound permits any real external lower bound `L`. -/
theorem deletion_edge_lower_bound [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℝ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s L)
    (T : Finset V) (hTcard : T.card = t) (hT : IsCliqueTransversal F r T) :
    L + (t : ℝ) * ((n - t + 1 - R : ℕ) : ℝ) +
        (balancedCliqueEdges t (s - 1) : ℝ) ≤ (Nat.card F.edgeSet : ℝ) := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-01`.
The strict threshold excludes every transversal of size at most `t`, not only exact `t`-sets;
smaller transversals can be enlarged since `t ≤ n`. -/
theorem no_small_transversal_of_strict_edge_bound [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℝ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s L)
    (hEdges : (Nat.card F.edgeSet : ℝ) <
      L + (t : ℝ) * ((n - t + 1 - R : ℕ) : ℝ) +
        (balancedCliqueEdges t (s - 1) : ℝ)) :
    ¬∃ T : Finset V, T.card ≤ t ∧ IsCliqueTransversal F r T := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-01`.
When the real threshold is an integer `B`, the equivalent integer cutoff is `B - 1`. -/
theorem no_small_transversal_of_integer_edge_cutoff [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℝ} {B : ℤ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s L)
    (hIntegral : L + (t : ℝ) * ((n - t + 1 - R : ℕ) : ℝ) +
      (balancedCliqueEdges t (s - 1) : ℝ) = (B : ℝ))
    (hEdges : (Nat.card F.edgeSet : ℤ) ≤ B - 1) :
    ¬∃ T : Finset V, T.card ≤ t ∧ IsCliqueTransversal F r T := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-02`.
The exact integer defect decomposes into nonnegative integer component defects. Each
individual defect and the total attachment defect are at most the total defect. -/
theorem deletion_defect_identity [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℤ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s (L : ℝ))
    (T : Finset V) (hTcard : T.card = t) (hT : IsCliqueTransversal F r T) :
    let b := n - t + 1 - R
    let a := balancedCliqueEdges t (s - 1)
    let δ : ℤ := (Nat.card F.edgeSet : ℤ) - (L + (t : ℤ) * (b : ℤ) + (a : ℤ))
    let u : ℤ := (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℤ) - L
    let z : ℤ := (Nat.card (F.induce (T : Set V)).edgeSet : ℤ) - (a : ℤ)
    let w : ℤ := ∑ x ∈ T, ((outsideDegree F T x : ℤ) - (b : ℤ))
    0 ≤ δ ∧ δ = u + z + w ∧
      0 ≤ u ∧ u ≤ δ ∧ 0 ≤ z ∧ z ≤ δ ∧ 0 ≤ w ∧ w ≤ δ ∧
      (∀ x ∈ T,
        0 ≤ (outsideDegree F T x : ℤ) - (b : ℤ) ∧
          (outsideDegree F T x : ℤ) - (b : ℤ) ≤ δ) := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-02`.
Stability bounds include the ambient size cap on attachment degrees and the integral bound
on how many vertices can have a positive attachment defect. -/
theorem deletion_defect_stability [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℤ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s (L : ℝ))
    (T : Finset V) (hTcard : T.card = t) (hT : IsCliqueTransversal F r T) :
    let h := n - t
    let b := h + 1 - R
    let a := balancedCliqueEdges t (s - 1)
    let δ : ℤ := (Nat.card F.edgeSet : ℤ) - (L + (t : ℤ) * (b : ℤ) + (a : ℤ))
    (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℤ) ≤ L + δ ∧
      (Nat.card (F.induce (T : Set V)).edgeSet : ℤ) ≤ (a : ℤ) + δ ∧
      (∀ x ∈ T, (b : ℤ) ≤ (outsideDegree F T x : ℤ) ∧
        (outsideDegree F T x : ℤ) ≤ min (h : ℤ) ((b : ℤ) + δ)) ∧
      ((T.filter (fun x ↦ b < outsideDegree F T x)).card : ℤ) ≤ δ := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-02`.
Zero defect forces equality in every component and balanced disjoint cliques on `T`, with
empty parts allowed. The exact `R - 1` nonneighbor conclusion requires `b > 0`; at `b = 0`
only zero attachments are asserted. -/
theorem deletion_equality_structure [Finite V] [DecidableEq V]
    (F : SimpleGraph V) {n r s t R : ℕ} {L : ℤ}
    (hn : Nat.card V = n) (hr : 2 ≤ r) (hs : 3 ≤ s) (ht : t ≤ n)
    (hF : F.IndepSetFree s) (hR : RamseyUpperBound r (s - 1) R)
    (hL : RamseyEdgeLowerBound (n - t) r s (L : ℝ))
    (T : Finset V) (hTcard : T.card = t) (hT : IsCliqueTransversal F r T)
    (hEquality : (Nat.card F.edgeSet : ℤ) =
      L + (t : ℤ) * ((n - t + 1 - R : ℕ) : ℤ) +
        (balancedCliqueEdges t (s - 1) : ℤ)) :
    let b := n - t + 1 - R
    let a := balancedCliqueEdges t (s - 1)
    (Nat.card (F.induce (T : Set V)ᶜ).edgeSet : ℤ) = L ∧
      Nat.card (F.induce (T : Set V)).edgeSet = a ∧
      Nat.card (crossEdgeSet F (T : Set V) (T : Set V)ᶜ) = t * b ∧
      (∀ x ∈ T, outsideDegree F T x = b) ∧
      IsBalancedCliqueUnion (F.induce (T : Set V)) (s - 1) ∧
      (0 < b → ∀ x ∈ T, outsideNonneighborCount F T x = R - 1) ∧
      (b = 0 → ∀ x ∈ T, outsideDegree F T x = 0) := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-03`.
Complementation interchanges clique transversals and independent-set transversals. -/
theorem cliqueTransversal_iff_indepTransversal_compl (F : SimpleGraph V) (r : ℕ)
    (T : Finset V) :
    IsCliqueTransversal F r T ↔ IsIndepTransversal Fᶜ r T := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-03`.
The substitution `n = 18, t = 3, r = s = 4, R = 9, L = 50` gives the threshold 71.
Both external numerical inputs remain hypotheses. -/
theorem eighteen_three_transversal_edge_lower_bound (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hTcard : T.card ≤ 3) (hT : IsCliqueTransversal F 4 T) :
    71 ≤ Nat.card F.edgeSet := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-03`.
No clique prohibition on the 18-vertex graph `F` is required. -/
theorem eighteen_transversal_card_ge_four (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hEdges : Nat.card F.edgeSet ≤ 70)
    (hR : RamseyUpperBound 4 3 9) (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hT : IsCliqueTransversal F 4 T) :
    4 ≤ T.card := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-03`.
The same size bound applies to independent-four transversals of the complement of `F`. -/
theorem eighteen_complement_indep_transversal_card_ge_four
    (F : SimpleGraph (Fin 18)) (hF : F.IndepSetFree 4)
    (hEdges : Nat.card F.edgeSet ≤ 70) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hT : IsIndepTransversal Fᶜ 4 T) :
    4 ≤ T.card := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-03`.
In the pivot notation `A` is `(4,5)`-free, and `F = Aᶜ` has `68 + q` edges. The condition
`q ≤ 2` is sufficient; no independent-four prohibition on `A` is assumed. -/
theorem eighteen_pivot_indep_transversal_card_ge_four (A : SimpleGraph (Fin 18))
    (hA : IsRamseyGraph 4 5 A) {q : ℤ} (hq : q ≤ 2)
    (hEdges : (Nat.card Aᶜ.edgeSet : ℤ) = 68 + q)
    (hR : RamseyUpperBound 4 3 9) (hL : RamseyEdgeLowerBound 15 4 4 50)
    (T : Finset (Fin 18)) (hT : IsIndepTransversal A 4 T) :
    4 ≤ T.card := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-03`.
Actual cross columns are transversals because a missed independent four-set, together with
its endpoint outside `A`, would form an independent five-set in the ambient graph. The
ambient prohibition is explicit; local `(4,5)`-freeness alone does not suffice for this step. -/
theorem eighteen_cross_column_card_ge_four [Finite V] [DecidableEq V]
    (G : SimpleGraph V) (A : Set V) (hAcard : Nat.card A = 18)
    (hA : IsRamseyGraph 4 5 (G.induce A)) (hG : G.IndepSetFree 5)
    (hEdges : Nat.card ((G.induce A)ᶜ).edgeSet ≤ 70)
    (hR : RamseyUpperBound 4 3 9) (hL : RamseyEdgeLowerBound 15 4 4 50)
    (y : V) (hy : y ∉ A) (C : Finset A)
    (hC : ∀ x : A, x ∈ C ↔ G.Adj y x.1) :
    IsIndepTransversal (G.induce A) 4 C ∧
      4 ≤ C.card ∧ 4 ≤ Nat.card (columnSet G A y) := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-04`.
The substitution `n = 18, t = 4, r = s = 4, R = 9, L = 41` gives the threshold 66,
including the one edge forced by balanced clique sizes `2, 1, 1` on `T`. -/
theorem eighteen_four_transversal_edge_lower_bound (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 14 4 4 41)
    (T : Finset (Fin 18)) (hTcard : T.card = 4) (hT : IsCliqueTransversal F 4 T) :
    66 ≤ Nat.card F.edgeSet := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-04`.
At `68 + q` edges, the exact four-set deletion defect is `2 + q`, with every bracket
nonnegative. This also gives the frontier budget `u + w + z = 3 + q`, where the cross
attachment defect is measured above 24 and `z` is the actual induced edge count. -/
theorem eighteen_four_transversal_defect_budget (F : SimpleGraph (Fin 18))
    (hF : F.IndepSetFree 4) (hR : RamseyUpperBound 4 3 9)
    (hL : RamseyEdgeLowerBound 14 4 4 41)
    (T : Finset (Fin 18)) (hTcard : T.card = 4) (hT : IsCliqueTransversal F 4 T)
    {q : ℤ} (hq : 0 ≤ q) (hEdges : (Nat.card F.edgeSet : ℤ) = 68 + q) :
    let u : ℤ := (Nat.card (F.induce (T : Set (Fin 18))ᶜ).edgeSet : ℤ) - 41
    let w : ℤ :=
      (Nat.card (crossEdgeSet F (T : Set (Fin 18)) (T : Set (Fin 18))ᶜ) : ℤ) - 24
    let z : ℤ := (Nat.card (F.induce (T : Set (Fin 18))).edgeSet : ℤ)
    (Nat.card F.edgeSet : ℤ) - 66 = 2 + q ∧
      u + (z - 1) + (∑ x ∈ T, ((outsideDegree F T x : ℤ) - 6)) = 2 + q ∧
      0 ≤ u ∧ 0 ≤ z - 1 ∧
      (∀ x ∈ T, 0 ≤ (outsideDegree F T x : ℤ) - 6) ∧
      w = ∑ x ∈ T, ((outsideDegree F T x : ℤ) - 6) ∧
      0 ≤ w ∧ 1 ≤ z ∧ u + w + z = 3 + q := by sorry

/-- Source: `transversal_deletion.md#claim-transversal-deletion-04`.
The induced-set bound improves the raw estimate 65 to 66. Neither strict exclusion
threshold applies at 68; this numerical statement makes no existence claim. -/
theorem four_transversal_thresholds_below_sixty_eight :
    balancedCliqueEdges 4 3 = 1 ∧
      (41 + 4 * 6 : ℕ) = 65 ∧
      (41 + 4 * 6 + balancedCliqueEdges 4 3 : ℕ) = 66 ∧
      (65 : ℕ) < 68 ∧ (66 : ℕ) < 68 ∧ ¬((68 : ℕ) < 66) := by sorry

end Ramsey.TransversalDeletion
