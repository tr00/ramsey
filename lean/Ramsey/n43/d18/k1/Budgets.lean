module

public import Ramsey.n43.d18.k1.Structure
public import Ramsey.n43.d18.PivotBudget
public import Mathlib.Combinatorics.SimpleGraph.DegreeSum
public import Mathlib.Combinatorics.SimpleGraph.Extremal.Turan

/-!
# Exact double-core budgets

The 2 order-24 antineighborhoods share the 7-cell. Their census intervals constrain its
ambient degree sum, while the core regularity gives exact edge and excess identities.
-/

namespace Ramsey.d18.k1

open scoped BigOperators

attribute [local instance] Classical.propDecidable

variable {G : SimpleGraph (Fin 43)}

/-- The edges of a disjoint induced union split into the 2 interiors and their cross edges. -/
private lemma edges_union (S T : Set (Fin 43)) (h : Disjoint S T) :
    inducedEdgeCount G (S ∪ T) = inducedEdgeCount G S + inducedEdgeCount G T +
      crossEdgeCount G S T := by
  classical
  have hd : Disjoint S.toFinset T.toFinset := Set.disjoint_toFinset.mpr h
  have hs := links_self G (S.toFinset ∪ T.toFinset)
  rw [links_union_left G _ _ _ hd, links_union_right G _ _ _ hd,
    links_union_right G _ _ _ hd, links_comm G T.toFinset S.toFinset,
    links_self, links_self, links_eq_crossEdgeCount G _ _ hd] at hs
  simp only [Set.coe_toFinset, ← Set.toFinset_union] at hs
  omega

/-- Summing degrees on a finite set counts its incidences with the whole graph. -/
private lemma degree_sum_links (S : Set (Fin 43)) :
    (∑ x : S, G.degree x) = links G S.toFinset Finset.univ := by
  classical
  unfold links
  rw [← Finset.sum_subtype S.toFinset (fun _ ↦ Set.mem_toFinset)
    (fun x ↦ G.degree x)]
  apply Finset.sum_congr rfl
  intro x hx
  have he : Finset.univ.filter (G.Adj x) = G.neighborFinset x := by
    ext y
    simp
  rw [he, SimpleGraph.card_neighborFinset_eq_degree]

/-- The root pair and the 3 cells split every target incidence. -/
private lemma links_partition (F : Frame G) (S : Finset (Fin 43)) :
    links G S Finset.univ = links G S {F.v, F.u} + links G S F.C.toFinset +
      links G S F.D.toFinset + links G S F.T.toFinset := by
  classical
  have hp := F.root_partition
  have hc : Disjoint ({F.v, F.u} : Finset (Fin 43)) F.C.toFinset := by
    apply Finset.disjoint_left.mpr
    intro x hx hy
    exact Set.disjoint_left.mp hp.2.1 (by simpa using hx)
      (Or.inl (Or.inl (by simpa using hy)))
  have hd : Disjoint (({F.v, F.u} : Finset (Fin 43)) ∪ F.C.toFinset) F.D.toFinset := by
    apply Finset.disjoint_left.mpr
    intro x hx hy
    rcases Finset.mem_union.mp hx with hx | hx
    · exact Set.disjoint_left.mp hp.2.1 (by simpa using hx)
        (Or.inl (Or.inr (by simpa using hy)))
    · exact Set.disjoint_left.mp F.disjoint_CD (by simpa using hx) (by simpa using hy)
  have ht : Disjoint ((({F.v, F.u} : Finset (Fin 43)) ∪ F.C.toFinset) ∪
      F.D.toFinset) F.T.toFinset := by
    apply Finset.disjoint_left.mpr
    intro x hx hy
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_union.mp hx with hx | hx
      · exact Set.disjoint_left.mp hp.2.1 (by simpa using hx) (Or.inr (by simpa using hy))
      · exact Set.disjoint_left.mp F.disjoint_CT (by simpa using hx) (by simpa using hy)
    · exact Set.disjoint_left.mp F.disjoint_DT (by simpa using hx) (by simpa using hy)
  have he : ((({F.v, F.u} : Finset (Fin 43)) ∪ F.C.toFinset) ∪ F.D.toFinset) ∪
      F.T.toFinset = Finset.univ := by
    simpa only [Set.toFinset_union, Set.toFinset_insert, Set.toFinset_singleton,
      Set.toFinset_univ] using
      congrArg (fun S : Set (Fin 43) ↦ S.toFinset) hp.2.2.2.2
  rw [← he, links_union_right G _ _ _ ht, links_union_right G _ _ _ hd,
    links_union_right G _ _ _ hc]

/-- The root pair contributes 1 incidence per core vertex. -/
private lemma links_core_roots (F : Frame G) (S : Set (Fin 43))
    (hS : S = F.C ∨ S = F.D) : links G S.toFinset {F.v, F.u} = Nat.card S := by
  classical
  have hvu := F.adjacent.ne
  unfold links
  have hr : ∀ x ∈ S.toFinset, (({F.v, F.u} : Finset _).filter (G.Adj x)).card = 1 := by
    intro x hx
    have hxS : x ∈ S := by simpa using hx
    rcases hS with rfl | rfl
    · have hxc := (F.mem_C x).mp hxS
      have hno : ¬G.Adj x F.u := fun h ↦ F.separated x ⟨hxc.1, h.symm⟩
      simp only [Finset.filter_insert, Finset.filter_singleton, hxc.1.symm, hno,
        ite_true, ite_false, Finset.insert_empty, Finset.card_singleton]
    · have hxd := (F.mem_D x).mp hxS
      have hno : ¬G.Adj x F.v := fun h ↦ F.separated x ⟨h.symm, hxd.1⟩
      simp only [Finset.filter_insert, Finset.filter_singleton, hxd.1.symm, hno,
        ite_true, ite_false, Finset.card_singleton]
  rw [Finset.sum_congr rfl hr]
  simp [Nat.card_eq_fintype_card]

/-- The 7-cell has no incidence to either root. -/
private lemma links_T_roots (F : Frame G) : links G F.T.toFinset {F.v, F.u} = 0 := by
  classical
  apply Finset.sum_eq_zero
  intro x hx
  have hxT : x ∈ F.T := by simpa using hx
  have hv : ¬G.Adj x F.v := fun h ↦ hxT.1.2 h.symm
  have hu : ¬G.Adj x F.u := fun h ↦ hxT.2.2 h.symm
  simp [hv, hu]

/-- An 8-regular 17-core has exactly 68 edges. -/
private lemma regular_core_edges (S : Set (Fin 43)) (hc : Nat.card S = 17)
    (hr : ∀ x : S, Nat.card ((G.induce S).neighborSet x) = 8) :
    inducedEdgeCount G S = 68 := by
  classical
  have hs := (G.induce S).sum_degrees_eq_twice_card_edges
  have hd : ∀ x : S, (G.induce S).degree x = 8 := by
    intro x
    simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using hr x
  simp_rw [hd] at hs
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul,
    SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card, hc] at hs
  change 17 * 8 = 2 * inducedEdgeCount G S at hs
  omega

namespace Frame

/-- Each admissible frame has 68 edges in each of its 2 cores. -/
public theorem core_edge_counts (F : Frame G) (hF : F.Admissible) :
    inducedEdgeCount G F.C = 68 ∧ inducedEdgeCount G F.D = 68 :=
  ⟨regular_core_edges F.C hF.card_C hF.regular_C,
    regular_core_edges F.D hF.card_D hF.regular_D⟩

/-- The first core degree sum consists of 153 fixed incidences and its 2 attachment blocks. -/
public theorem degree_sum_C (F : Frame G) (hF : F.Admissible) :
    (∑ x : F.C, G.degree x) = 153 + crossEdgeCount G F.C F.D +
      crossEdgeCount G F.C F.T := by
  have hcd := Set.disjoint_toFinset.mpr F.disjoint_CD
  have hct := Set.disjoint_toFinset.mpr F.disjoint_CT
  rw [degree_sum_links, links_partition, links_core_roots F F.C (Or.inl rfl),
    links_self, links_eq_crossEdgeCount G _ _ hcd, links_eq_crossEdgeCount G _ _ hct]
  simp only [Set.coe_toFinset, hF.card_C, (F.core_edge_counts hF).1]

/-- The second core has the symmetric degree-sum identity. -/
public theorem degree_sum_D (F : Frame G) (hF : F.Admissible) :
    (∑ x : F.D, G.degree x) = 153 + crossEdgeCount G F.C F.D +
      crossEdgeCount G F.D F.T := by
  have hcd := Set.disjoint_toFinset.mpr F.disjoint_CD
  have hdt := Set.disjoint_toFinset.mpr F.disjoint_DT
  rw [degree_sum_links, links_partition, links_core_roots F F.D (Or.inr rfl),
    links_comm G F.D.toFinset F.C.toFinset, links_eq_crossEdgeCount G _ _ hcd,
    links_self, links_eq_crossEdgeCount G _ _ hdt]
  simp only [Set.coe_toFinset, hF.card_D, (F.core_edge_counts hF).2]
  omega

/-- The 7-cell degree sum counts the 2 attachment blocks and twice its interior. -/
public theorem degree_sum_T (F : Frame G) :
    (∑ x : F.T, G.degree x) = crossEdgeCount G F.C F.T +
      crossEdgeCount G F.D F.T + 2 * inducedEdgeCount G F.T := by
  have hct := Set.disjoint_toFinset.mpr F.disjoint_CT
  have hdt := Set.disjoint_toFinset.mpr F.disjoint_DT
  rw [degree_sum_links, links_partition, links_T_roots,
    links_comm G F.T.toFinset F.C.toFinset, links_comm G F.T.toFinset F.D.toFinset,
    links_eq_crossEdgeCount G _ _ hct, links_eq_crossEdgeCount G _ _ hdt, links_self]
  simp only [Set.coe_toFinset, zero_add]

/-- The 2 core excesses give the exact attachment budgets with constant 153. -/
public theorem core_excess_budgets (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    crossEdgeCount G F.C F.D + crossEdgeCount G F.C F.T =
        153 + degreeExcess G 18 F.C ∧
      crossEdgeCount G F.C F.D + crossEdgeCount G F.D F.T =
        153 + degreeExcess G 18 F.D := by
  have hc := sum_degree_eq_base_add_excess G 18 F.C (fun x _ ↦ (degree_mem hG x).1)
  have hd := sum_degree_eq_base_add_excess G 18 F.D (fun x _ ↦ (degree_mem hG x).1)
  rw [hF.card_C, F.degree_sum_C hF] at hc
  rw [hF.card_D, F.degree_sum_D hF] at hd
  omega

/-- The 7-cell excess gives its exact degree budget with constant 126. -/
public theorem T_excess_budget (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    crossEdgeCount G F.C F.T + crossEdgeCount G F.D F.T +
        2 * inducedEdgeCount G F.T = 126 + degreeExcess G 18 F.T := by
  have ht := sum_degree_eq_base_add_excess G 18 F.T (fun x _ ↦ (degree_mem hG x).1)
  rw [hF.card_T, F.degree_sum_T] at ht
  exact ht

/-- The first side census bounds the sum of its attachment and 7-cell edges. -/
public theorem side_edge_budgets (F : Frame G) (hF : F.Admissible) :
    (76 ≤ crossEdgeCount G F.C F.T + inducedEdgeCount G F.T ∧
      crossEdgeCount G F.C F.T + inducedEdgeCount G F.T ≤ 92) ∧
    (76 ≤ crossEdgeCount G F.D F.T + inducedEdgeCount G F.T ∧
      crossEdgeCount G F.D F.T + inducedEdgeCount G F.T ≤ 92) := by
  classical
  have hc := F.core_edge_counts hF
  have hcardC : Nat.card ↥(F.C ∪ F.T) = 24 := by
    rw [Nat.card_coe_set_eq, Set.ncard_union_eq F.disjoint_CT,
      ← Nat.card_coe_set_eq, ← Nat.card_coe_set_eq, hF.card_C, hF.card_T]
  have hcardD : Nat.card ↥(F.D ∪ F.T) = 24 := by
    rw [Nat.card_coe_set_eq, Set.ncard_union_eq F.disjoint_DT,
      ← Nat.card_coe_set_eq, ← Nat.card_coe_set_eq, hF.card_D, hF.card_T]
  have sideRange (S : Set (Fin 43)) (hn : Nat.card S = 24)
      (hS : IsRamseyGraph 5 4 (G.induce S)) :
      144 ≤ inducedEdgeCount G S ∧ inducedEdgeCount G S ≤ 160 := by
    have hr := edges_ramsey_4_5_24_range hn _ ((isRamseyGraph_compl _).mp hS)
    have he := card_edges_add_card_edges_compl (G.induce S)
    have hchoose : Nat.choose 24 2 = 276 := by decide
    rw [hn, hchoose] at he
    change 144 ≤ Nat.card (G.induce S).edgeSet ∧
      Nat.card (G.induce S).edgeSet ≤ 160
    omega
  have hC := sideRange _ hcardC hF.side_C
  have hD := sideRange _ hcardD hF.side_D
  have ec := edges_union (G := G) F.C F.T F.disjoint_CT
  have ed := edges_union (G := G) F.D F.T F.disjoint_DT
  change 144 ≤ inducedEdgeCount G (F.C ∪ F.T) ∧
    inducedEdgeCount G (F.C ∪ F.T) ≤ 160 at hC
  change 144 ≤ inducedEdgeCount G (F.D ∪ F.T) ∧
    inducedEdgeCount G (F.D ∪ F.T) ≤ 160 at hD
  omega

/-- The side census forces at least 152 and at most 168 total degrees on the 7-cell. -/
public theorem T_degree_sum_range (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    152 ≤ (∑ x : F.T, G.degree x) ∧ (∑ x : F.T, G.degree x) ≤ 168 := by
  have hs := F.side_edge_budgets hF
  have he := F.degree_sum_T
  have hu : (∑ x : F.T, G.degree x) ≤ ∑ _x : F.T, 24 :=
    Finset.sum_le_sum (fun x _ ↦ degree_le_24 hG x)
  simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul,
    ← Nat.card_eq_fintype_card, hF.card_T] at hu
  omega

/-- The common antineighborhood carries between 26 and 42 excess units. -/
public theorem T_excess_range (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) :
    26 ≤ degreeExcess G 18 F.T ∧ degreeExcess G 18 F.T ≤ 42 := by
  have hs := F.T_degree_sum_range hF hG
  have he := F.T_excess_budget hF hG
  rw [← F.degree_sum_T] at he
  omega

/-- At most 16 degree-deficiency units from 24 remain in the 7-cell. -/
public theorem T_deficiency_le_sixteen (F : Frame G) (hF : F.Admissible)
    (hG : IsRamseyGraph 5 5 G) : (∑ x : F.T, (24 - G.degree x)) ≤ 16 := by
  have hs := F.T_degree_sum_range hF hG
  have he : (∑ x : F.T, (24 - G.degree x)) + (∑ x : F.T, G.degree x) = 168 := by
    rw [← Finset.sum_add_distrib]
    have hp : ∀ x : F.T, (24 - G.degree x) + G.degree x = 24 :=
      fun x ↦ Nat.sub_add_cancel (degree_le_24 hG x)
    simp_rw [hp]
    simp [← Nat.card_eq_fintype_card, hF.card_T]
  omega

/-- The common antineighborhood is (5,4)-free without an assumed K4 prohibition. -/
public theorem T_ramsey (F : Frame G) (hF : F.Admissible) :
    IsRamseyGraph 5 4 (G.induce F.T) := by
  constructor
  · rw [SimpleGraph.cliqueFree_induce_iff]
    intro s hs
    exact (SimpleGraph.cliqueFree_induce_iff G (F.C ∪ F.T) 5).mp hF.side_C.1
      (fun x hx ↦ Or.inr (hs hx))
  · rw [indepSetFree_induce_iff]
    intro s hs
    exact (indepSetFree_induce_iff G (F.C ∪ F.T) 4).mp hF.side_C.2 s
      (fun x hx ↦ Or.inr (hs hx))

/-- Turan bounds give 5 to 18 edges inside the 7-cell. -/
public theorem T_edge_range (F : Frame G) (hF : F.Admissible) :
    5 ≤ inducedEdgeCount G F.T ∧ inducedEdgeCount G F.T ≤ 18 := by
  have ht := F.T_ramsey hF
  have hu := ht.1.card_edgeFinset_le
  have hl := ((SimpleGraph.cliqueFree_compl _).mpr ht.2).card_edgeFinset_le
  have he := card_edges_add_card_edges_compl (G.induce F.T)
  have hc : Fintype.card F.T = 7 := by simpa [Nat.card_eq_fintype_card] using hF.card_T
  simp only [hc] at hu hl
  have h4 : SimpleGraph.turanNumber 7 4 = 18 := by decide
  have h3 : SimpleGraph.turanNumber 7 3 = 16 := by decide
  rw [h4] at hu
  rw [h3] at hl
  simp only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] at hu hl
  rw [hF.card_T] at he
  have hchoose : Nat.choose 7 2 = 21 := by decide
  rw [hchoose] at he
  change 5 ≤ Nat.card (G.induce F.T).edgeSet ∧ Nat.card (G.induce F.T).edgeSet ≤ 18
  omega

end Frame

end Ramsey.d18.k1
