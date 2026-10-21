module

public import Ramsey.theorems.PivotCounting

/-!
# Degree-18 pivot budgets

Exact cross-edge and degree-excess identities, published internal edge intervals,
and the equality-frontier consequences. No degree-18 branch is excluded.
-/

@[expose] public section

namespace Ramsey

section Degree18

variable (R : RootedRamseyGraph 5 5 (Fin 43)) [DecidableRel R.graph.Adj]
variable (hv : R.graph.degree R.pivot = 18)

include hv

/-- The neighborhood upper bound uses only the published 85-edge cap. -/
private theorem degree18_neighbor_edge_le_85 : inducedEdgeCount R.graph R.A ≤ 85 := by
  have hn : Nat.card R.A = 18 := R.card_A.trans hv
  exact_mod_cast edges_ramsey_4_5_18_le_85.on_finite_type hn _ R.neighborhood.ramsey

/-- Published neighborhood edge interval at a degree-18 pivot (§8.1). -/
theorem degree18_neighbor_edge_range :
    50 ≤ inducedEdgeCount R.graph R.A ∧ inducedEdgeCount R.graph R.A ≤ 85 := by
  exact edges_ramsey_4_5_18_range (R.card_A.trans hv) _ R.neighborhood.ramsey

/-- Exact nonnegative frontier budget: `x + 2a = 306 + Δ_A` (§2). -/
theorem degree18_cross_budget :
    crossEdgeCount R.graph R.A R.B + 2 * inducedEdgeCount R.graph R.A =
      306 + degreeExcess R.graph 18 R.A := by
  have hs := sum_degree_eq_base_add_excess R.graph 18 R.A
    (fun u _ ↦ (degree_mem R.ramsey u).1)
  have hc : Nat.card R.A = 18 := R.card_A.trans hv
  rw [pivot_neighbor_degree_sum, hc, hv] at hs
  dsimp only [RootedRamseyGraph.A, RootedRamseyGraph.B] at *
  omega

/-- The exact deficit/excess parametrization `x = 136 + 2(85-a) + Δ_A` (§8.6). -/
theorem degree18_frontier_identity :
    crossEdgeCount R.graph R.A R.B =
      136 + 2 * (85 - inducedEdgeCount R.graph R.A) + degreeExcess R.graph 18 R.A := by
  have hb := degree18_cross_budget R hv
  have ha := degree18_neighbor_edge_le_85 R hv
  omega

/-- Every degree-18 pivot has at least 136 cross edges (§8.2). -/
theorem degree18_cross_ge_136 : 136 ≤ crossEdgeCount R.graph R.A R.B := by
  rw [degree18_frontier_identity R hv]
  omega

/-- Equality is equivalent to extremality and zero excess. It is not a branch exclusion. -/
theorem degree18_frontier_iff :
    crossEdgeCount R.graph R.A R.B = 136 ↔
      inducedEdgeCount R.graph R.A = 85 ∧ ∀ u ∈ R.A, R.graph.degree u = 18 := by
  classical
  have hb := degree18_cross_budget R hv
  have ha := degree18_neighbor_edge_le_85 R hv
  have hz : degreeExcess R.graph 18 R.A = 0 ↔
      ∀ u ∈ R.A, R.graph.degree u = 18 := by
    simp only [degreeExcess, Finset.sum_eq_zero_iff, Finset.mem_univ, forall_const]
    constructor
    · intro h u hu
      have he := h ⟨u, hu⟩
      rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] at he
      have hmin := (degree_mem R.ramsey u).1
      exact Nat.le_antisymm (Nat.sub_eq_zero_iff_le.mp he) hmin
    · intro h u
      rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree, h u u.2,
        Nat.sub_self]
  constructor
  · intro hx
    have he : degreeExcess R.graph 18 R.A = 0 := by omega
    exact ⟨by omega, hz.mp he⟩
  · rintro ⟨he, hd⟩
    have := hz.mpr hd
    omega

/-- A degree-18 pivot has exactly 24 antineighbors. -/
theorem degree18_antiNeighbor_card : Nat.card R.B = 24 := by
  have h := R.card_parts
  rw [R.card_A, hv, Nat.card_fin] at h
  omega

/-- The `(5,4)` antineighborhood uses the complement of the published order-24 interval. -/
theorem degree18_antiNeighbor_edge_range :
    144 ≤ inducedEdgeCount R.graph R.B ∧ inducedEdgeCount R.graph R.B ≤ 160 := by
  classical
  have hn := degree18_antiNeighbor_card R hv
  have hR := (isRamseyGraph_compl _).mp R.antineighborhood.ramsey
  have hr := edges_ramsey_4_5_24_range hn _ hR
  have he := card_edges_add_card_edges_compl (R.graph.induce R.B)
  have hchoose : Nat.choose 24 2 = 276 := by decide
  rw [hn, hchoose] at he
  change 144 ≤ Nat.card (R.graph.induce R.B).edgeSet ∧
    Nat.card (R.graph.induce R.B).edgeSet ≤ 160
  dsimp only [RootedRamseyGraph.antineighborhood] at hr
  omega

/-- Every degree-18 pivot has at most 288 cross edges. -/
theorem degree18_cross_le_288 : crossEdgeCount R.graph R.A R.B ≤ 288 := by
  classical
  have hn := degree18_antiNeighbor_card R hv
  have hR := (isRamseyGraph_compl _).mp R.antineighborhood.ramsey
  have hcap : Nat.card (R.graph.induce R.B)ᶜ.edgeSet ≤ 132 := by
    exact_mod_cast edges_ramsey_4_5_24_le_132.on_finite_type hn _ hR
  have he := card_edges_add_card_edges_compl (R.graph.induce R.B)
  have hchoose : Nat.choose 24 2 = 276 := by decide
  rw [hn, hchoose] at he
  have hb : 144 ≤ inducedEdgeCount R.graph R.B := by
    change 144 ≤ Nat.card (R.graph.induce R.B).edgeSet
    omega
  have hs : (∑ y : R.B, R.graph.degree y) ≤ 576 := by
    calc
      (∑ y : R.B, R.graph.degree y) ≤ ∑ _y : R.B, 24 :=
        Finset.sum_le_sum (fun y _ ↦ degree_le_24 R.ramsey y)
      _ = 576 := by simp [← Nat.card_eq_fintype_card, hn]
  rw [pivot_antiNeighbor_degree_sum] at hs
  dsimp only [RootedRamseyGraph.A, RootedRamseyGraph.B] at *
  omega

/-- Every degree-18 pivot lies in the cross-edge corridor `136 ≤ x ≤ 288`. -/
theorem degree18_cross_range :
    136 ≤ crossEdgeCount R.graph R.A R.B ∧ crossEdgeCount R.graph R.A R.B ≤ 288 :=
  ⟨degree18_cross_ge_136 R hv, degree18_cross_le_288 R hv⟩

/-- The antineighborhood excess budget, written without truncated subtraction. -/
theorem degree18_antiNeighbor_budget :
    2 * inducedEdgeCount R.graph R.B + crossEdgeCount R.graph R.A R.B =
      432 + degreeExcess R.graph 18 R.B := by
  have hs := sum_degree_eq_base_add_excess R.graph 18 R.B
    (fun y _ ↦ (degree_mem R.ramsey y).1)
  rw [pivot_antiNeighbor_degree_sum, degree18_antiNeighbor_card R hv] at hs
  exact hs

/-- The equality frontier strengthens the lower `B` edge bound from 144 to 148 (§8.3). -/
theorem degree18_frontier_antiNeighbor_edge_range
    (hx : crossEdgeCount R.graph R.A R.B = 136) :
    148 ≤ inducedEdgeCount R.graph R.B ∧ inducedEdgeCount R.graph R.B ≤ 160 := by
  have hb := degree18_antiNeighbor_budget R hv
  have hr := (degree18_antiNeighbor_edge_range R hv).2
  omega

end Degree18

end Ramsey
