module

public import Ramsey.d18.k1.Budgets

/-!
# Global and root budgets for a double-core frame

The fixed root and core incidences determine both root cuts and the total edge count.
Handshaking expresses the total degree excess in the 4 remaining edge blocks.
-/

namespace Ramsey.d18.k1

open scoped BigOperators

attribute [local instance] Classical.propDecidable

variable {G : SimpleGraph (Fin 43)}

/-- An isolated added vertex leaves the induced edge count unchanged. -/
private lemma edges_insert_isolated (S : Set (Fin 43)) (a : Fin 43)
    (h : ∀ x ∈ S, ¬G.Adj a x) :
    inducedEdgeCount G (insert a S) = inducedEdgeCount G S := by
  classical
  have he : G.edgeFinset ∩ (insert a S).toFinset.sym2 =
      G.edgeFinset ∩ S.toFinset.sym2 := by
    ext e
    induction e using Sym2.inductionOn with
    | _ x y =>
      simp only [Finset.mem_inter, SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
        Finset.mk_mem_sym2_iff, Set.mem_toFinset, Set.mem_insert_iff]
      have hx := h x
      have hy := h y
      have hsym := G.adj_comm x y
      have hxx := G.loopless.irrefl a
      grind
  have hleft := G.map_edgeFinset_induce (s := insert a S)
  have hright := G.map_edgeFinset_induce (s := S)
  have hc := congrArg Finset.card he
  have hl := congrArg Finset.card hleft
  have hr := congrArg Finset.card hright
  simp only [Finset.card_map] at hl hr
  simp only [Set.toFinset_insert] at hl hc
  have hc' := hl.trans (hc.trans hr.symm)
  simpa only [inducedEdgeCount, SimpleGraph.edgeFinset_card,
    ← Nat.card_eq_fintype_card] using hc'

namespace Frame

/-- Every admissible frame has 2 roots of degree 18. -/
public theorem root_degrees (F : Frame G) (hF : F.Admissible) :
    G.degree F.v = 18 ∧ G.degree F.u = 18 := by
  classical
  have hv : F.u ∉ F.C := by simp
  have hu : F.v ∉ F.D := by simp
  have hc : Nat.card (G.neighborSet F.v) = 18 := by
    rw [F.neighbor_v, Nat.card_coe_set_eq, Set.ncard_insert_of_notMem hv,
      ← Nat.card_coe_set_eq, hF.card_C]
  have hd : Nat.card (G.neighborSet F.u) = 18 := by
    rw [F.neighbor_u, Nat.card_coe_set_eq, Set.ncard_insert_of_notMem hu,
      ← Nat.card_coe_set_eq, hF.card_D]
  simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using
    And.intro hc hd

/-- Both root neighborhoods have exactly 68 induced edges. -/
public theorem neighbor_edge_counts (F : Frame G) (hF : F.Admissible) :
    inducedEdgeCount G (G.neighborSet F.v) = 68 ∧
      inducedEdgeCount G (G.neighborSet F.u) = 68 := by
  have hc := F.core_edge_counts hF
  constructor
  · rw [F.neighbor_v, edges_insert_isolated]
    · exact hc.1
    · intro x hx hux
      exact F.separated x ⟨((F.mem_C x).mp hx).1, hux⟩
  · rw [F.neighbor_u, edges_insert_isolated]
    · exact hc.2
    · intro x hx hvx
      exact F.separated x ⟨hvx, ((F.mem_D x).mp hx).1⟩

/-- The first root cut consists of 17 fixed edges and the 2 first-core blocks. -/
public theorem cross_v (F : Frame G) (hF : F.Admissible) :
    crossEdgeCount G (G.neighborSet F.v) (antiNeighborSet G F.v) =
      17 + crossEdgeCount G F.C F.D + crossEdgeCount G F.C F.T := by
  classical
  have hs := pivot_neighbor_degree_sum G F.v
  have hsum : (∑ x : G.neighborSet F.v, G.degree x) =
      G.degree F.u + ∑ x : F.C, G.degree x := by
    simp_rw [← Finset.sum_subtype _ (fun _ ↦ Set.mem_toFinset)
      (fun x ↦ G.degree x)]
    have hn : (G.neighborSet F.v).toFinset = insert F.u F.C.toFinset := by
      ext x
      simp only [Set.mem_toFinset, Finset.mem_insert, F.neighbor_v, Set.mem_insert_iff]
    rw [hn, Finset.sum_insert (by simp)]
  rw [hsum, (F.root_degrees hF).2, F.degree_sum_C hF,
    (F.root_degrees hF).1, (F.neighbor_edge_counts hF).1] at hs
  omega

/-- The second root cut has the symmetric exact block formula. -/
public theorem cross_u (F : Frame G) (hF : F.Admissible) :
    crossEdgeCount G (G.neighborSet F.u) (antiNeighborSet G F.u) =
      17 + crossEdgeCount G F.C F.D + crossEdgeCount G F.D F.T := by
  classical
  have hs := pivot_neighbor_degree_sum G F.u
  have hsum : (∑ x : G.neighborSet F.u, G.degree x) =
      G.degree F.v + ∑ x : F.D, G.degree x := by
    simp_rw [← Finset.sum_subtype _ (fun _ ↦ Set.mem_toFinset)
      (fun x ↦ G.degree x)]
    have hn : (G.neighborSet F.u).toFinset = insert F.v F.D.toFinset := by
      ext x
      simp only [Set.mem_toFinset, Finset.mem_insert, F.neighbor_u, Set.mem_insert_iff]
    rw [hn, Finset.sum_insert (by simp)]
  rw [hsum, (F.root_degrees hF).1, F.degree_sum_D hF,
    (F.root_degrees hF).2, (F.neighbor_edge_counts hF).2] at hs
  omega

/-- The 2 root cut excesses are exactly the excesses of the corresponding cores. -/
public theorem root_cross_excess (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    crossEdgeCount G (G.neighborSet F.v) (antiNeighborSet G F.v) =
        170 + degreeExcess G 18 F.C ∧
      crossEdgeCount G (G.neighborSet F.u) (antiNeighborSet G F.u) =
        170 + degreeExcess G 18 F.D := by
  have hc := F.core_excess_budgets hF hG
  have hv := F.cross_v hF
  have hu := F.cross_u hF
  omega

/-- The root pair and 3 cells split any finite vertex sum. -/
private lemma sum_partition (F : Frame G) (f : Fin 43 → ℕ) :
    (∑ x, f x) = f F.v + f F.u + (∑ x : F.C, f x) +
      (∑ x : F.D, f x) + ∑ x : F.T, f x := by
  classical
  have hp := F.root_partition
  have hrC : Disjoint ({F.v, F.u} : Set (Fin 43)) F.C :=
    hp.2.1.mono_right (by intro x hx; exact Or.inl (Or.inl hx))
  have hrD : Disjoint ({F.v, F.u} ∪ F.C : Set (Fin 43)) F.D :=
    (hp.2.1.mono_right (by intro x hx; exact Or.inl (Or.inr hx))).union_left
      F.disjoint_CD
  have hrT : Disjoint ({F.v, F.u} ∪ F.C ∪ F.D : Set (Fin 43)) F.T :=
    ((hp.2.1.mono_right (by intro x hx; exact Or.inr hx)).union_left
      F.disjoint_CT).union_left F.disjoint_DT
  simp_rw [← Finset.sum_subtype _ (fun _ ↦ Set.mem_toFinset) f]
  have he : (({F.v, F.u} : Set (Fin 43)).toFinset ∪ F.C.toFinset ∪
      F.D.toFinset) ∪ F.T.toFinset = Finset.univ := by
    ext x
    simp only [Finset.mem_union, Set.mem_toFinset, Finset.mem_univ, iff_true]
    rcases F.cover x with h | h | h | h | h <;> simp_all
  have hdT : Disjoint (({F.v, F.u} : Set (Fin 43)).toFinset ∪ F.C.toFinset ∪
      F.D.toFinset) F.T.toFinset := by
    simpa only [Set.toFinset_union] using Set.disjoint_toFinset.mpr hrT
  have hdD : Disjoint (({F.v, F.u} : Set (Fin 43)).toFinset ∪ F.C.toFinset)
      F.D.toFinset := by
    simpa only [Set.toFinset_union] using Set.disjoint_toFinset.mpr hrD
  rw [← he, Finset.sum_union hdT, Finset.sum_union hdD,
    Finset.sum_union (Set.disjoint_toFinset.mpr hrC)]
  simp [hp.1]

/-- Exactly 171 edges are fixed before the 4 remaining blocks are counted. -/
public theorem total_edges (F : Frame G) (hF : F.Admissible) :
    Nat.card G.edgeSet = 171 + crossEdgeCount G F.C F.D +
      crossEdgeCount G F.C F.T + crossEdgeCount G F.D F.T +
      inducedEdgeCount G F.T := by
  classical
  have hs := G.sum_degrees_eq_twice_card_edges
  rw [F.sum_partition (fun x ↦ G.degree x), (F.root_degrees hF).1,
    (F.root_degrees hF).2, F.degree_sum_C hF, F.degree_sum_D hF,
    F.degree_sum_T] at hs
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at hs
  omega

/-- The additive total-excess identity avoids natural subtraction. -/
public theorem total_excess_add (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    degreeExcess G 18 Set.univ + 432 =
      2 * (crossEdgeCount G F.C F.D + crossEdgeCount G F.C F.T +
        crossEdgeCount G F.D F.T + inducedEdgeCount G F.T) := by
  classical
  have hb := sum_degree_eq_base_add_excess G 18 Set.univ
    (fun x _ ↦ (degree_mem hG x).1)
  have hs := G.sum_degrees_eq_twice_card_edges
  have he := F.total_edges hF
  rw [← Finset.sum_subtype Set.univ.toFinset (fun _ ↦ Set.mem_toFinset)
    (fun x ↦ G.degree x)] at hb
  simp only [Set.toFinset_univ] at hb
  rw [hs] at hb
  simp only [Nat.card_eq_fintype_card, SimpleGraph.edgeFinset_card] at hb he
  have hcard : Fintype.card (Set.univ : Set (Fin 43)) = 43 := by simp
  rw [hcard] at hb
  omega

/-- The total degree excess is twice the block sum above 216. -/
public theorem total_excess (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    degreeExcess G 18 Set.univ =
      2 * (crossEdgeCount G F.C F.D + crossEdgeCount G F.C F.T +
        crossEdgeCount G F.D F.T + inducedEdgeCount G F.T - 216) := by
  have h := F.total_excess_add hF hG
  omega

/-- Each core has at most 102 ambient degree excess. -/
public theorem core_excess_le (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    degreeExcess G 18 F.C ≤ 102 ∧ degreeExcess G 18 F.D ≤ 102 := by
  classical
  have hcap (S : Set (Fin 43)) : degreeExcess G 18 S ≤ 6 * Nat.card S := by
    unfold degreeExcess
    have hd (x : S) : Nat.card (G.neighborSet x) - 18 ≤ 6 := by
      have hx := (degree_mem hG x).2
      simp only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
      omega
    calc
      _ ≤ ∑ _x : S, 6 := Finset.sum_le_sum (fun x _ ↦ hd x)
      _ = _ := by simp [Nat.card_eq_fintype_card, Nat.mul_comm]
  simpa only [hF.card_C, hF.card_D] using And.intro (hcap F.C) (hcap F.D)

end Frame

end Ramsey.d18.k1
