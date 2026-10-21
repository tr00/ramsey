module

public import Ramsey.defs.BoundaryProfileGluing
public import Ramsey.defs.BoundaryProfileOperations

/-!
# Paired expressions in the uniform boundary calculus

A derivation pairs 2 expressions with identical operation data and related leaves.
The boundary graph compatibility at each gluing node is part of the syntax.
-/

namespace Ramsey.Boundary

universe u

/-- A relation between finite graphs with the same boundary labels and arbitrary interiors. -/
public abbrev GraphRelation :=
  ∀ {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y],
    SimpleGraph (B ⊕ X) → SimpleGraph (B ⊕ Y) → Prop

/-- Paired finite expressions with fixed operation data and related replacement leaves. -/
public inductive UniformDerivation (R : GraphRelation.{u}) :
    {B X Y : Type u} → [Fintype B] → [Fintype X] → [Fintype Y] →
      SimpleGraph (B ⊕ X) → SimpleGraph (B ⊕ Y) → Prop where
  /-- A replacement leaf is admitted by the specified leaf relation. -/
  | leaf {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
      {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
      (h : R G H) : UniformDerivation (@R) G H
  /-- A fixed leaf is the same concrete graph on both sides. -/
  | fixed {B X : Type u} [Fintype B] [Fintype X]
      (G : SimpleGraph (B ⊕ X)) : UniformDerivation (@R) G G
  /-- Both uniform joins pair the corresponding operands and retain their common boundary. -/
  | glue {B X X' Y Y' : Type u}
      [Fintype B] [Fintype X] [Fintype X'] [Fintype Y] [Fintype Y']
      {G : SimpleGraph (B ⊕ X)} {G' : SimpleGraph (B ⊕ X')}
      {H : SimpleGraph (B ⊕ Y)} {H' : SimpleGraph (B ⊕ Y')}
      (left : UniformDerivation (@R) G G') (right : UniformDerivation (@R) H H')
      (ε : Bool) (compatible : boundaryGraph G = boundaryGraph H)
      (compatible' : boundaryGraph G' = boundaryGraph H') :
      UniformDerivation (@R) (Boundary.glue G H ε) (Boundary.glue G' H' ε)
  /-- Forgetting uses the same specified boundary label on both sides. -/
  | forget {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
      {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
      (child : UniformDerivation (@R) G H) (b : B) [Fintype {a : B // a ≠ b}] :
      UniformDerivation (@R) (Boundary.forget G b) (Boundary.forget H b)
  /-- Introduction uses the same fresh label, boundary neighbors and uniform interior bit. -/
  | introduce {B X Y : Type u} [Fintype B] [Fintype X] [Fintype Y]
      {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
      (child : UniformDerivation (@R) G H) (S : Set B) (ε : Bool) :
      UniformDerivation (@R) (Boundary.introduce G S ε) (Boundary.introduce H S ε)
  /-- Relabelling transports both boundaries by the same fixed bijection. -/
  | relabel {B C X Y : Type u} [Fintype B] [Fintype C] [Fintype X] [Fintype Y]
      {G : SimpleGraph (B ⊕ X)} {H : SimpleGraph (B ⊕ Y)}
      (child : UniformDerivation (@R) G H) (e : B ≃ C) :
      UniformDerivation (@R) (Boundary.relabel G e) (Boundary.relabel H e)

end Ramsey.Boundary
