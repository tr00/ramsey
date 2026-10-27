module

public import Ramsey.n43.d18.k1.Totals
public import Ramsey.n43.d18.k1.Attachments
public import Ramsey.n43.d18.k1.Completion

/-!
# Scalar parameters of the K1 reduction

The tuple records the 7-cell edges, the 2 side budgets and the cross-core edge count.
The allowed interval is an outer envelope and never asserts graph realizability.
-/

namespace Ramsey.d18.k1

attribute [local instance] Classical.propDecidable

/-- The 4 integer parameters of a fixed rooted double-core frame. -/
public structure Parameters where
  /-- The number of edges in the 7-cell. -/
  h : ℕ
  /-- The first attachment count plus the 7-cell edge count. -/
  L : ℕ
  /-- The second attachment count plus the 7-cell edge count. -/
  R : ℕ
  /-- The number of cross-core edges. -/
  r : ℕ

/-- The complete aggregate outer envelope with the strict 64-edge attachment bound. -/
@[expose] public def Parameters.Allowed (p : Parameters) : Prop :=
  5 ≤ p.h ∧ p.h ≤ 18 ∧
    max 76 (64 + p.h) ≤ p.L ∧ p.L ≤ 92 ∧
    max 76 (64 + p.h) ≤ p.R ∧ p.R ≤ 92 ∧ p.L + p.R ≤ 168 ∧
    153 + p.h - min p.L p.R ≤ p.r ∧ p.r ≤ 255 + p.h - max p.L p.R

/-- The scalar tuple is uniquely calculated from the actual frame adjacency. -/
@[expose] public noncomputable def Frame.parameters {G : SimpleGraph (Fin 43)}
    (F : Frame G) : Parameters where
  h := inducedEdgeCount G F.T
  L := crossEdgeCount G F.C F.T + inducedEdgeCount G F.T
  R := crossEdgeCount G F.D F.T + inducedEdgeCount G F.T
  r := crossEdgeCount G F.C F.D

/-- Every actual Ramsey completion satisfies the complete scalar outer envelope. -/
public theorem Frame.parameters_allowed {G : SimpleGraph (Fin 43)} (F : Frame G)
    (hF : F.Admissible) (hG : IsRamseyGraph 5 5 G) : F.parameters.Allowed := by
  have hp := attachment_cross_ge_sixty_four hF.ramsey_C hF.card_C hF.side_C
    F.disjoint_CT hF.card_T
  have hq := attachment_cross_ge_sixty_four hF.ramsey_D hF.card_D hF.side_D
    F.disjoint_DT hF.card_T
  have hs := F.side_edge_budgets hF
  have hh := F.T_edge_range hF
  have ht := F.T_degree_sum_range hF hG
  rw [F.degree_sum_T] at ht
  have he := F.core_excess_budgets hF hG
  have hu := F.core_excess_le hF hG
  simp only [Parameters.Allowed, Frame.parameters]
  omega

/-- The attachment and cross-core projections of the outer envelope have explicit endpoints. -/
public theorem Frame.parameter_projections {G : SimpleGraph (Fin 43)} (F : Frame G)
    (hF : F.Admissible) (hG : IsRamseyGraph 5 5 G) :
    (64 ≤ crossEdgeCount G F.C F.T ∧ crossEdgeCount G F.C F.T ≤ 87) ∧
    (64 ≤ crossEdgeCount G F.D F.T ∧ crossEdgeCount G F.D F.T ≤ 87) ∧
    (74 ≤ crossEdgeCount G F.C F.D ∧ crossEdgeCount G F.C F.D ≤ 191) := by
  have hp := F.parameters_allowed hF hG
  simp only [Parameters.Allowed, Frame.parameters] at hp
  omega

/-- Total degree excess and total edges lie in the projected aggregate intervals. -/
public theorem Frame.total_projections {G : SimpleGraph (Fin 43)} (F : Frame G)
    (hF : F.Admissible) (hG : IsRamseyGraph 5 5 G) :
    (26 ≤ degreeExcess G 18 Set.univ ∧ degreeExcess G 18 Set.univ ≤ 246) ∧
    (400 ≤ Nat.card G.edgeSet ∧ Nat.card G.edgeSet ≤ 510) := by
  have hp := F.parameters_allowed hF hG
  simp only [Parameters.Allowed, Frame.parameters] at hp
  have he := F.total_edges hF
  have hw := F.total_excess_add hF hG
  omega

/-- A scalar branch retains a maximizing pivot, its admissible frame and mixed obligations. -/
@[expose] public def ParameterClass (p : Parameters) (G : SimpleGraph (Fin 43)) : Prop :=
  ∃ F : Frame G, IsMaximalDegree18Pivot G F.v ∧ F.Admissible ∧
    CliqueCompatible F ∧ IndepCompatible F ∧ F.parameters = p

/-- The allowed scalar branches cover every K1 candidate without a realizability assumption. -/
public theorem parameter_cover (G : SimpleGraph (Fin 43)) (hG : KClass 1 G) :
    ∃ p : Parameters, p.Allowed ∧ ParameterClass p G := by
  obtain ⟨hRamsey, v, hv, hK⟩ := hG
  obtain ⟨F, hroot, hF⟩ := exists_admissible hRamsey v hv.1 hK
  obtain ⟨hc, hi⟩ := (ramsey_iff_compatible F hF).mp hRamsey
  exact ⟨F.parameters, F.parameters_allowed hF hRamsey, F,
    hroot.symm ▸ hv, hF, hc, hi, rfl⟩

/-- Complete scalar-branch enumerations give a complete enumeration of the original K1 class. -/
public theorem complete_by_parameters
    (S : {p : Parameters // p.Allowed} → Set (SimpleGraph (Fin 43)))
    (h : ∀ p, Complete (S p) (ParameterClass p.val)) :
    Complete (⋃ p, S p) (KClass 1) := by
  apply Complete.cover h
  intro G hG
  obtain ⟨p, hp, hclass⟩ := parameter_cover G hG
  exact ⟨⟨p, hp⟩, hclass⟩

end Ramsey.d18.k1
