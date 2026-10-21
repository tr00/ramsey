module

public import Ramsey.defs.BoundaryProfileContexts
public import Ramsey.theorems.BoundaryProfileGluing
public import Ramsey.theorems.BoundaryProfileOperations

/-!
# Replacement in every uniform expression

Structural induction propagates equal profiles through the complete operator language.
The paired-expression grammar permits any finite family of replacements in 1 induction.
-/

namespace Ramsey.Boundary

universe u

variable {R : GraphRelation.{u}} {p q : ℕ}

/-- Every expression preserves profile equality when each replacement leaf does. -/
public theorem UniformDerivation.profile_eq
    (hLeaves : ∀ {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
      {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)},
      R G H → profile G p q = profile H p q)
    {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    (d : UniformDerivation (@R) G H) : profile G p q = profile H p q := by
  induction d with
  | leaf h => exact hLeaves h
  | fixed => rfl
  | glue left right ε compatible compatible' ihLeft ihRight =>
      exact glue_congr ihLeft ihRight compatible ε
  | forget child b ih => exact forget_congr ih b
  | introduce child S ε ih => exact introduce_congr ih S ε
  | relabel child e ih => exact relabel_congr ih e

/-- Equal graph orders at every replacement leaf imply equal output orders. -/
public theorem UniformDerivation.order_eq
    (hLeaves : ∀ {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
      {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)},
      R G H → Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y))
    {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    (d : UniformDerivation (@R) G H) :
    Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y) := by
  induction d with
  | leaf h => exact hLeaves h
  | fixed => rfl
  | glue left right ε compatible compatible' ihLeft ihRight =>
      simp only [Fintype.card_sum] at *
      omega
  | forget child b ih =>
      simp only [Fintype.card_sum, Fintype.card_option] at *
      omega
  | introduce child S ε ih =>
      simp only [Fintype.card_sum, Fintype.card_option] at *
      omega
  | relabel child e ih =>
      simp only [Fintype.card_sum] at *
      omega

/-- The replacement relation retains the profile but deliberately does not retain graph order. -/
public abbrev ProfileRelation (p q : ℕ) : GraphRelation.{u} :=
  fun G H ↦ profile G p q = profile H p q

/-- Equal-profile replacements are a congruence for all 5 specified operations. -/
public theorem uniform_replacement
    {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    (d : UniformDerivation (ProfileRelation p q) G H) :
    profile G p q = profile H p q :=
  d.profile_eq (fun h ↦ h)

/-- A well-typed gluing remains well typed after the paired equal-profile replacements. -/
public theorem UniformDerivation.glue_of_profiles
    {B X X' Y Y' : Type u}
    [Fintype B] [Fintype X] [Fintype X'] [Fintype Y] [Fintype Y']
    {G : SimpleGraph (B ⊕ X)} {G' : SimpleGraph (B ⊕ X')}
    {H : SimpleGraph (B ⊕ Y)} {H' : SimpleGraph (B ⊕ Y')}
    (left : UniformDerivation (ProfileRelation p q) G G')
    (right : UniformDerivation (ProfileRelation p q) H H')
    (ε : Bool) (compatible : boundaryGraph G = boundaryGraph H) :
    UniformDerivation (ProfileRelation p q)
      (Boundary.glue G H ε) (Boundary.glue G' H' ε) := by
  have hG : SameProfile G G' p q := uniform_replacement left
  have hH : SameProfile H H' p q := uniform_replacement right
  exact .glue left right ε compatible
    (hG.boundary_eq.symm.trans (compatible.trans hH.boundary_eq))

/-- Order-sensitive replacement adds an explicit equal-order condition to each leaf pair. -/
public abbrev OrderedProfileRelation (p q : ℕ) : GraphRelation.{u} :=
  fun {B X Y} _ _ _ G H ↦
    profile G p q = profile H p q ∧ Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y)

/-- Any finite family of equal-profile and equal-order replacements preserves both quantities. -/
public theorem uniform_ordered_replacement
    {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    (d : UniformDerivation (OrderedProfileRelation p q) G H) :
    profile G p q = profile H p q ∧ Fintype.card (B ⊕ X) = Fintype.card (B ⊕ Y) :=
  ⟨d.profile_eq (fun h ↦ h.1), d.order_eq (fun h ↦ h.2)⟩

/-- Replacements preserve both clipped homogeneous numbers at the resulting boundary. -/
public theorem uniform_replacement_observations
    {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    (d : UniformDerivation (ProfileRelation p q) G H) (k : Bool) :
    min (if k then p else q) (homogeneousNumber G k) =
      min (if k then p else q) (homogeneousNumber H k) :=
  sameProfile_capped_homogeneousNumber (uniform_replacement d) k

/-- Every permitted context has the same Ramsey freeness observation after replacement. -/
public theorem uniform_replacement_isRamseyGraph
    {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
    {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
    (d : UniformDerivation (ProfileRelation p q) G H) :
    IsRamseyGraph p q G ↔ IsRamseyGraph p q H :=
  sameProfile_isRamseyGraph (uniform_replacement d)

end Ramsey.Boundary
