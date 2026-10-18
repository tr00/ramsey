module

public import Ramsey.D18
public import Ramsey.defs.RootedRamseyGraph
public import Mathlib.Data.Set.Card

/-!
# Two-anchor local reductions
Pair codegree intervals, two-anchor cell bounds, and single-row and single-column bounds.
Mixed cells exclude the nonadjacency anchor. The order-43 predicates apply at any pivot.
-/

@[expose] public section

namespace Ramsey

variable {V : Type*}

/-- A mixed cell is `(4,4)`-Ramsey without any edge or distinctness assumption on its anchors. -/
theorem isRamseyGraph_induce_mixedCell {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (u w : V) :
    IsRamseyGraph 4 4 (G.induce (G.neighborSet u ∩ antiNeighborSet G w)) := by
  refine ⟨?_, ?_⟩
  · rw [SimpleGraph.cliqueFree_induce_iff]
    intro t ht
    exact (SimpleGraph.cliqueFree_induce_iff _ _ _).mp
      (isRamseyGraph_induce_neighborSet hG u).1 (fun x hx ↦ (ht hx).1)
  · rw [← SimpleGraph.cliqueFree_compl, compl_induce,
      SimpleGraph.cliqueFree_induce_iff]
    intro t ht
    apply (SimpleGraph.cliqueFree_induce_iff _ _ _).mp
      (isRamseyGraph_induce_neighborSet ((isRamseyGraph_compl G).mp hG) w).1
    intro x hx
    rw [← antiNeighborSet_eq_compl]
    exact (ht hx).2

/-- A mixed two-anchor cell has at most 17 vertices, by `R(4,4) ≤ 18`.
The nonadjacency anchor itself is excluded, even when the anchors are adjacent. -/
theorem card_mixedCell_le_17 {G : SimpleGraph V} [Finite V]
    (hG : IsRamseyGraph 5 5 G) (u w : V) :
    Nat.card ↥(G.neighborSet u ∩ antiNeighborSet G w) ≤ 17 := by
  by_contra h
  exact ramsey_4_4_le_18.not_isRamseyGraph (by omega) _
    (isRamseyGraph_induce_mixedCell hG u w)

/-- The common antineighborhood is the common neighborhood in the complement.
Both anchors are excluded. -/
theorem commonAntiNeighborSet_eq_compl (G : SimpleGraph V) (u w : V) :
    antiNeighborSet G u ∩ antiNeighborSet G w = Gᶜ.commonNeighbors u w := by
  rw [antiNeighborSet_eq_compl, antiNeighborSet_eq_compl]
  rfl

/-- Distinct nonadjacent anchors have a `(5,3)`-Ramsey common antineighborhood. -/
theorem isRamseyGraph_induce_commonAntiNeighbors {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) {u w : V} (hne : u ≠ w) (hnadj : ¬G.Adj u w) :
    IsRamseyGraph 5 3 (G.induce (antiNeighborSet G u ∩ antiNeighborSet G w)) := by
  have hc := isRamseyGraph_induce_commonNeighbors ((isRamseyGraph_compl G).mp hG)
    (show Gᶜ.Adj u w from ⟨hne, hnadj⟩)
  rw [commonAntiNeighborSet_eq_compl]
  exact (isRamseyGraph_compl _).mpr (by simpa [compl_induce] using hc)

/-- Distinct nonadjacent anchors have at most 13 common nonneighbors.
There is no order-43 hypothesis: only finiteness is needed. -/
theorem card_commonAntiNeighbors_le_13 {G : SimpleGraph V} [Finite V]
    (hG : IsRamseyGraph 5 5 G) {u w : V} (hne : u ≠ w) (hnadj : ¬G.Adj u w) :
    Nat.card ↥(antiNeighborSet G u ∩ antiNeighborSet G w) ≤ 13 := by
  rw [commonAntiNeighborSet_eq_compl]
  exact card_commonNeighbors_le_13 ((isRamseyGraph_compl G).mp hG)
    (show Gᶜ.Adj u w from ⟨hne, hnadj⟩)

/-- Exact degree partition into common neighbors, the mixed cell, and the other
anchor if adjacent. Valid for all anchors in every finite graph. -/
theorem degree_eq_common_add_mixed {G : SimpleGraph V} [Fintype V]
    [DecidableRel G.Adj] (u w : V) :
    G.degree u = Nat.card ↥(G.commonNeighbors u w) +
      Nat.card ↥(G.neighborSet u ∩ antiNeighborSet G w) +
      (if G.Adj u w then 1 else 0) := by
  classical
  have h := Set.ncard_inter_add_ncard_sdiff_eq_ncard (G.neighborSet u) (G.neighborSet w)
  have hdeg : (G.neighborSet u).ncard = G.degree u := by
    rw [← Nat.card_coe_set_eq, Nat.card_eq_fintype_card,
      SimpleGraph.card_neighborSet_eq_degree]
  rw [hdeg] at h
  change (G.commonNeighbors u w).ncard +
    (G.neighborSet u \ G.neighborSet w).ncard = G.degree u at h
  by_cases huw : G.Adj u w
  · have heq : G.neighborSet u \ G.neighborSet w =
        insert w (G.neighborSet u ∩ antiNeighborSet G w) := by
      ext x
      simp only [Set.mem_sdiff, SimpleGraph.mem_neighborSet, Set.mem_insert_iff,
        Set.mem_inter_iff, antiNeighborSet, Set.mem_ofPred_eq]
      by_cases hx : x = w <;> simp_all
    have hw : w ∉ G.neighborSet u ∩ antiNeighborSet G w := by
      simp [antiNeighborSet]
    rw [heq, Set.ncard_insert_of_notMem hw] at h
    simpa only [huw, ite_true, ← Nat.card_coe_set_eq, Nat.add_assoc] using h.symm
  · have heq : G.neighborSet u \ G.neighborSet w =
        G.neighborSet u ∩ antiNeighborSet G w := by
      ext x
      simp only [Set.mem_sdiff, SimpleGraph.mem_neighborSet, Set.mem_inter_iff,
        antiNeighborSet, Set.mem_ofPred_eq]
      by_cases hx : x = w <;> simp_all
    rw [heq] at h
    simpa only [huw, ite_false, Nat.add_zero, ← Nat.card_coe_set_eq] using h.symm

/-- Adjacent anchors satisfy the full codegree interval in every finite `(5,5)`-Ramsey graph. -/
theorem adjacent_codegree_interval {G : SimpleGraph V} [Fintype V]
    [DecidableRel G.Adj] (hG : IsRamseyGraph 5 5 G) {u w : V} (huw : G.Adj u w) :
    max (G.degree u) (G.degree w) - 18 ≤ Nat.card ↥(G.commonNeighbors u w) ∧
      Nat.card ↥(G.commonNeighbors u w) ≤ 13 := by
  have hu := degree_eq_common_add_mixed (G := G) u w
  have hw := degree_eq_common_add_mixed (G := G) w u
  have hmu := card_mixedCell_le_17 hG u w
  have hmw := card_mixedCell_le_17 hG w u
  have hcomm : G.commonNeighbors w u = G.commonNeighbors u w := by
    ext x
    exact and_comm
  rw [hcomm] at hw
  simp only [huw, huw.symm, ite_true] at hu hw
  refine ⟨?_, card_commonNeighbors_le_13 hG huw⟩
  omega

/-- For distinct nonadjacent anchors, inclusion-exclusion relates the two common
cells and the two degrees. There is no fixed-order or Ramsey hypothesis. -/
theorem nonadjacent_common_cell_identity {G : SimpleGraph V} [Fintype V]
    [DecidableRel G.Adj] {u w : V} (hne : u ≠ w) (hnadj : ¬G.Adj u w) :
    Nat.card ↥(G.commonNeighbors u w) + Nat.card V = G.degree u + G.degree w +
      Nat.card ↥(antiNeighborSet G u ∩ antiNeighborSet G w) + 2 := by
  classical
  let s := G.neighborSet u ∪ G.neighborSet w
  have hu : u ∉ s := by simp [s, hnadj, SimpleGraph.adj_comm]
  have hw : w ∉ insert u s := by simp [s, hne.symm, hnadj]
  have heq : antiNeighborSet G u ∩ antiNeighborSet G w = (insert w (insert u s))ᶜ := by
    ext x
    simp only [Set.mem_inter_iff, antiNeighborSet, Set.mem_ofPred_eq,
      Set.mem_compl_iff, Set.mem_insert_iff, s, Set.mem_union, SimpleGraph.mem_neighborSet]
    tauto
  have hcomp := Set.ncard_add_ncard_compl (insert w (insert u s))
  rw [Set.ncard_insert_of_notMem hw, Set.ncard_insert_of_notMem hu, ← heq] at hcomp
  have hunion := Set.ncard_union_add_ncard_inter (G.neighborSet u) (G.neighborSet w)
  have hd (v : V) : (G.neighborSet v).ncard = G.degree v := by
    rw [← Nat.card_coe_set_eq, Nat.card_eq_fintype_card,
      SimpleGraph.card_neighborSet_eq_degree]
  rw [hd u, hd w] at hunion
  change s.ncard + (G.commonNeighbors u w).ncard = _ at hunion
  simp only [← Nat.card_coe_set_eq] at hcomp hunion
  omega

/-- On exactly 43 vertices, distinct nonadjacent anchors satisfy the full codegree
interval. The additive upper bound avoids any ambiguity from natural subtraction. -/
theorem nonadjacent_codegree_interval {G : SimpleGraph V} [Fintype V]
    [DecidableRel G.Adj] (horder : Nat.card V = 43) (hG : IsRamseyGraph 5 5 G)
    {u w : V} (hne : u ≠ w) (hnadj : ¬G.Adj u w) :
    max (G.degree u) (G.degree w) - 17 ≤ Nat.card ↥(G.commonNeighbors u w) ∧
      Nat.card ↥(G.commonNeighbors u w) + 28 ≤ G.degree u + G.degree w := by
  have hu := degree_eq_common_add_mixed (G := G) u w
  have hw := degree_eq_common_add_mixed (G := G) w u
  have hmu := card_mixedCell_le_17 hG u w
  have hmw := card_mixedCell_le_17 hG w u
  have hcomm : G.commonNeighbors w u = G.commonNeighbors u w := by
    ext x
    exact and_comm
  rw [hcomm] at hw
  have hnrev : ¬G.Adj w u := fun h ↦ hnadj h.symm
  simp only [hnadj, hnrev, ite_false, Nat.add_zero] at hu hw
  have hid := nonadjacent_common_cell_identity hne hnadj
  have hanti := card_commonAntiNeighbors_le_13 hG hne hnadj
  rw [horder] at hid
  constructor <;> omega

/-- On 43 vertices, a row at a pivot neighbor satisfies the internal and cross-degree bounds. -/
theorem pivot_row_card_bounds (R : RootedRamseyGraph 5 5 (Fin 43))
    [DecidableRel R.graph.Adj] {u : Fin 43} (hu : u ∈ R.A) :
    let s := Nat.card ↥(columnSet R.graph R.A u)
    let r := Nat.card ↥(rowSet R.graph R.B u)
    R.graph.degree R.pivot - 18 ≤ s ∧ s ≤ 13 ∧ 17 - s ≤ r ∧ r ≤ min 17 (23 - s) := by
  have hadj : R.graph.Adj u R.pivot := hu.symm
  have hi := adjacent_codegree_interval R.ramsey hadj
  have hd := degree_mem R.ramsey u
  have hsplit := degree_eq_common_add_mixed (G := R.graph) u R.pivot
  have hm := card_mixedCell_le_17 R.ramsey u R.pivot
  simp only [hadj, ite_true] at hsplit
  change R.graph.degree R.pivot - 18 ≤ Nat.card ↥(R.graph.commonNeighbors u R.pivot) ∧
    Nat.card ↥(R.graph.commonNeighbors u R.pivot) ≤ 13 ∧
    17 - Nat.card ↥(R.graph.commonNeighbors u R.pivot) ≤
      Nat.card ↥(R.graph.neighborSet u ∩ R.B) ∧
    Nat.card ↥(R.graph.neighborSet u ∩ R.B) ≤
      min 17 (23 - Nat.card ↥(R.graph.commonNeighbors u R.pivot))
  dsimp only [RootedRamseyGraph.A, RootedRamseyGraph.B] at *
  omega

/-- On 43 vertices, a column at a pivot antineighbor satisfies the internal and cross-degree bounds.
Here `t` counts its antineighborhood neighbors and `c` counts its neighborhood neighbors. -/
theorem pivot_column_card_bounds (R : RootedRamseyGraph 5 5 (Fin 43))
    [DecidableRel R.graph.Adj] {y : Fin 43} (hy : y ∈ R.B) :
    let b := Nat.card R.B
    let t := Nat.card ↥(rowSet R.graph R.B y)
    let c := Nat.card ↥(columnSet R.graph R.A y)
    b - 14 ≤ t ∧ t ≤ 17 ∧
      max (R.graph.degree R.pivot - 17) (18 - t) ≤ c ∧
        c ≤ min (R.graph.degree R.pivot - 4) (24 - t) := by
  have hne : y ≠ R.pivot := hy.1
  have hn : ¬R.graph.Adj y R.pivot := fun h ↦ hy.2 h.symm
  have hi := nonadjacent_codegree_interval (by simp : Nat.card (Fin 43) = 43)
    R.ramsey hne hn
  have hd := degree_mem R.ramsey y
  have hsplit := degree_eq_common_add_mixed (G := R.graph) y R.pivot
  have hm := card_mixedCell_le_17 R.ramsey y R.pivot
  have hid := nonadjacent_common_cell_identity hne hn
  have hanti := card_commonAntiNeighbors_le_13 R.ramsey hne hn
  have hb := R.card_parts
  rw [R.card_A, Nat.card_fin] at hb
  rw [Nat.card_fin] at hid
  simp only [hn, ite_false, Nat.add_zero] at hsplit
  change Nat.card R.B - 14 ≤ Nat.card ↥(R.graph.neighborSet y ∩ R.B) ∧
    Nat.card ↥(R.graph.neighborSet y ∩ R.B) ≤ 17 ∧
    max (R.graph.degree R.pivot - 17)
      (18 - Nat.card ↥(R.graph.neighborSet y ∩ R.B)) ≤
        Nat.card ↥(R.graph.commonNeighbors y R.pivot) ∧
    Nat.card ↥(R.graph.commonNeighbors y R.pivot) ≤
      min (R.graph.degree R.pivot - 4) (24 - Nat.card ↥(R.graph.neighborSet y ∩ R.B))
  dsimp only [RootedRamseyGraph.A, RootedRamseyGraph.B] at *
  omega

end Ramsey
