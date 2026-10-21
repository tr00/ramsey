module

public import Ramsey.defs.BoundaryProfiles

/-!
# Concrete unary operations on boundaried graphs

Forgetting moves a boundary vertex into the interior. Uniform introduction adds a boundary vertex.
Relabelling transports the specified boundary names without changing any incidence.
-/

namespace Ramsey.Boundary

variable {B C X Y : Type*}

/-- The unchanged vertices after moving the specified boundary label into the interior. -/
@[expose] public noncomputable def forgetEquiv (b : B) :
    ({a : B // a ≠ b} ⊕ Option X) ≃ (B ⊕ X) := by
  classical
  exact
    { toFun := fun v ↦ match v with
        | .inl a => .inl a.val
        | .inr none => .inl b
        | .inr (some x) => .inr x
      invFun := fun v ↦ match v with
        | .inl a => if h : a = b then .inr none else .inl ⟨a, h⟩
        | .inr x => .inr (some x)
      left_inv := by
        intro v
        rcases v with a | (_ | x)
        · simp [a.property]
        · simp
        · rfl
      right_inv := by
        intro v
        rcases v with a | x
        · by_cases h : a = b <;> simp [h]
        · rfl }

/-- Forget a boundary label while keeping the graph and all its vertices unchanged. -/
@[expose] public noncomputable def forget (G : SimpleGraph (B ⊕ X)) (b : B) :
    SimpleGraph ({a : B // a ≠ b} ⊕ Option X) :=
  G.comap (forgetEquiv b)

/-- Add a fresh boundary vertex with the specified boundary neighbors and uniform interior bit. -/
@[expose] public def introduce (G : SimpleGraph (B ⊕ X)) (S : Set B) (ε : Bool) :
    SimpleGraph (Option B ⊕ X) where
  Adj v w := match v, w with
    | .inl none, .inl none => False
    | .inl none, .inl (some b) => b ∈ S
    | .inl (some b), .inl none => b ∈ S
    | .inl none, .inr _ => ε = true
    | .inr _, .inl none => ε = true
    | .inl (some a), .inl (some b) => G.Adj (.inl a) (.inl b)
    | .inl (some a), .inr x => G.Adj (.inl a) (.inr x)
    | .inr x, .inl (some a) => G.Adj (.inr x) (.inl a)
    | .inr x, .inr y => G.Adj (.inr x) (.inr y)
  symm := by
    constructor
    intro v w
    rcases v with (_ | a) | x <;> rcases w with (_ | b) | y <;>
      simp only <;> first | exact fun h ↦ h | exact fun h ↦ G.symm.symm _ _ h
  loopless := by
    constructor
    intro v
    rcases v with (_ | a) | x <;> simp

/-- Rename the boundary by a fixed bijection and retain all interior names. -/
@[expose] public def relabel (G : SimpleGraph (B ⊕ X)) (e : B ≃ C) :
    SimpleGraph (C ⊕ X) :=
  G.comap (Equiv.sumCongr e.symm (Equiv.refl X))

/-- Rename interior vertices while keeping every boundary label fixed. -/
@[expose] public def relabelInterior (G : SimpleGraph (B ⊕ X)) (e : X ≃ Y) :
    SimpleGraph (B ⊕ Y) :=
  G.comap (Equiv.sumCongr (Equiv.refl B) e.symm)

end Ramsey.Boundary
