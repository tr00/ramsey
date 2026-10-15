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

variable {G : SimpleGraph (Fin 43)} [DecidableRel G.Adj]
variable (hG : IsRamseyGraph 5 5 G) (v : Fin 43) (hv : G.degree v = 18)

include hG hv

/-- The neighborhood upper bound uses only the published 85-edge cap. -/
private theorem degree18_neighbor_edge_le_85 : inducedEdgeCount G (G.neighborSet v) ≤ 85 := by
  have hn : Nat.card (G.neighborSet v) = 18 := by
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  exact_mod_cast edges_ramsey_4_5_18_le_85.on_finite_type hn _
    (isRamseyGraph_induce_neighborSet hG v)

/-- Published neighborhood edge interval at a degree-18 pivot (§8.1). -/
theorem degree18_neighbor_edge_range :
    50 ≤ inducedEdgeCount G (G.neighborSet v) ∧
      inducedEdgeCount G (G.neighborSet v) ≤ 85 := by
  apply edges_ramsey_4_5_18_range
  · simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  · exact isRamseyGraph_induce_neighborSet hG v

/-- Exact nonnegative frontier budget: `x + 2a = 306 + Δ_A` (§2). -/
theorem degree18_cross_budget :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) +
        2 * inducedEdgeCount G (G.neighborSet v) =
      306 + degreeExcess G 18 (G.neighborSet v) := by
  have hs := sum_degree_eq_base_add_excess G 18 (G.neighborSet v)
    (fun u _ ↦ (degree_mem hG u).1)
  have hc : Nat.card (G.neighborSet v) = 18 := by
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hv
  rw [pivot_neighbor_degree_sum, hc, hv] at hs
  omega

/-- The exact deficit/excess parametrization `x = 136 + 2(85-a) + Δ_A` (§8.6). -/
theorem degree18_frontier_identity :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) =
      136 + 2 * (85 - inducedEdgeCount G (G.neighborSet v)) +
        degreeExcess G 18 (G.neighborSet v) := by
  have hb := degree18_cross_budget hG v hv
  have ha := degree18_neighbor_edge_le_85 hG v hv
  omega

/-- Every degree-18 pivot has at least 136 cross edges (§8.2). -/
theorem degree18_cross_ge_136 :
    136 ≤ crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) := by
  rw [degree18_frontier_identity hG v hv]
  omega

/-- Equality is equivalent to extremality and zero excess. It is not a branch exclusion. -/
theorem degree18_frontier_iff :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 136 ↔
      inducedEdgeCount G (G.neighborSet v) = 85 ∧
        ∀ u ∈ G.neighborSet v, G.degree u = 18 := by
  classical
  have hb := degree18_cross_budget hG v hv
  have ha := degree18_neighbor_edge_le_85 hG v hv
  have hz : degreeExcess G 18 (G.neighborSet v) = 0 ↔
      ∀ u ∈ G.neighborSet v, G.degree u = 18 := by
    simp only [degreeExcess, Finset.sum_eq_zero_iff, Finset.mem_univ, forall_const]
    constructor
    · intro h u hu
      have he := h ⟨u, hu⟩
      rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] at he
      have hmin := (degree_mem hG u).1
      exact Nat.le_antisymm (Nat.sub_eq_zero_iff_le.mp he) hmin
    · intro h u
      rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree, h u u.2,
        Nat.sub_self]
  constructor
  · intro hx
    have he : degreeExcess G 18 (G.neighborSet v) = 0 := by omega
    exact ⟨by omega, hz.mp he⟩
  · rintro ⟨he, hd⟩
    have := hz.mpr hd
    omega

omit hG in
/-- A degree-18 pivot has exactly 24 antineighbors. -/
theorem degree18_antiNeighbor_card : Nat.card (antiNeighborSet G v) = 24 := by
  have h := card_neighborSet_add_antiNeighborSet G v
  rw [Nat.card_eq_fintype_card (α := G.neighborSet v),
    SimpleGraph.card_neighborSet_eq_degree, hv, Nat.card_fin] at h
  omega

/-- The `(5,4)` antineighborhood uses the complement of the published order-24 interval. -/
theorem degree18_antiNeighbor_edge_range :
    144 ≤ inducedEdgeCount G (antiNeighborSet G v) ∧
      inducedEdgeCount G (antiNeighborSet G v) ≤ 160 := by
  classical
  have hn := degree18_antiNeighbor_card v hv
  have hR := (isRamseyGraph_compl _).mp (isRamseyGraph_induce_antiNeighborSet hG v)
  have hr := edges_ramsey_4_5_24_range hn _ hR
  have he := card_edges_add_card_edges_compl (G.induce (antiNeighborSet G v))
  have hchoose : Nat.choose 24 2 = 276 := by decide
  rw [hn, hchoose] at he
  change 144 ≤ Nat.card (G.induce (antiNeighborSet G v)).edgeSet ∧
    Nat.card (G.induce (antiNeighborSet G v)).edgeSet ≤ 160
  omega

/-- Every degree-18 pivot has at most 288 cross edges. -/
theorem degree18_cross_le_288 :
    crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) ≤ 288 := by
  classical
  have hn := degree18_antiNeighbor_card v hv
  have hR := (isRamseyGraph_compl _).mp (isRamseyGraph_induce_antiNeighborSet hG v)
  have hcap : Nat.card (G.induce (antiNeighborSet G v))ᶜ.edgeSet ≤ 132 := by
    exact_mod_cast edges_ramsey_4_5_24_le_132.on_finite_type hn _ hR
  have he := card_edges_add_card_edges_compl (G.induce (antiNeighborSet G v))
  have hchoose : Nat.choose 24 2 = 276 := by decide
  rw [hn, hchoose] at he
  have hb : 144 ≤ inducedEdgeCount G (antiNeighborSet G v) := by
    change 144 ≤ Nat.card (G.induce (antiNeighborSet G v)).edgeSet
    omega
  have hs : (∑ y : antiNeighborSet G v, G.degree y) ≤ 576 := by
    calc
      (∑ y : antiNeighborSet G v, G.degree y) ≤
          ∑ _y : antiNeighborSet G v, 24 :=
        Finset.sum_le_sum (fun y _ ↦ degree_le_24 hG y)
      _ = 576 := by simp [← Nat.card_eq_fintype_card, hn]
  rw [pivot_antiNeighbor_degree_sum] at hs
  omega

/-- Every degree-18 pivot lies in the cross-edge corridor `136 ≤ x ≤ 288`. -/
theorem degree18_cross_range :
    136 ≤ crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) ∧
      crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) ≤ 288 :=
  ⟨degree18_cross_ge_136 hG v hv, degree18_cross_le_288 hG v hv⟩

/-- The antineighborhood excess budget, written without truncated subtraction. -/
theorem degree18_antiNeighbor_budget :
    2 * inducedEdgeCount G (antiNeighborSet G v) +
        crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) =
      432 + degreeExcess G 18 (antiNeighborSet G v) := by
  have hs := sum_degree_eq_base_add_excess G 18 (antiNeighborSet G v)
    (fun y _ ↦ (degree_mem hG y).1)
  rw [pivot_antiNeighbor_degree_sum, degree18_antiNeighbor_card v hv] at hs
  exact hs

/-- The equality frontier strengthens the lower `B` edge bound from 144 to 148 (§8.3). -/
theorem degree18_frontier_antiNeighbor_edge_range
    (hx : crossEdgeCount G (G.neighborSet v) (antiNeighborSet G v) = 136) :
    148 ≤ inducedEdgeCount G (antiNeighborSet G v) ∧
      inducedEdgeCount G (antiNeighborSet G v) ≤ 160 := by
  have hb := degree18_antiNeighbor_budget hG v hv
  have hr := (degree18_antiNeighbor_edge_range hG v hv).2
  omega

end Degree18

end Ramsey
