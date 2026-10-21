module

public import Mathlib.Combinatorics.SimpleGraph.Maps
public import Mathlib.Data.Fintype.Sum

/-! Concrete uniform gluing along a shared labelled boundary. -/

namespace Ramsey.Boundary

variable {B X Y : Type*}

/-- Identify boundary vertices and join the two interiors with the specified constant bit. -/
@[expose] public def glue (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε : Bool) : SimpleGraph (B ⊕ (X ⊕ Y)) where
  Adj
    | .inl b, .inl c => G.Adj (.inl b) (.inl c)
    | .inl b, .inr (.inl x) => G.Adj (.inl b) (.inr x)
    | .inr (.inl x), .inl b => G.Adj (.inr x) (.inl b)
    | .inl b, .inr (.inr y) => H.Adj (.inl b) (.inr y)
    | .inr (.inr y), .inl b => H.Adj (.inr y) (.inl b)
    | .inr (.inl x), .inr (.inl z) => G.Adj (.inr x) (.inr z)
    | .inr (.inr y), .inr (.inr z) => H.Adj (.inr y) (.inr z)
    | .inr (.inl _), .inr (.inr _) => ε = true
    | .inr (.inr _), .inr (.inl _) => ε = true
  symm.symm := by
    intro v w h
    cases v with
    | inl b => cases w with
      | inl c => exact h.symm
      | inr w => cases w <;> exact h.symm
    | inr v => cases v <;> cases w with
      | inl b => exact h.symm
      | inr w => cases w <;> first | exact h.symm | exact h
  loopless.irrefl := by
    intro v
    cases v with
    | inl b => exact G.loopless.irrefl _
    | inr v => cases v <;> first | exact G.loopless.irrefl _ | exact H.loopless.irrefl _

/-- Gluing retains the labelled boundary graph exactly. -/
@[simp] public theorem glue_boundary (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε : Bool) : (glue G H ε).comap Sum.inl = G.comap Sum.inl := rfl

/-- Cross-interior adjacency is exactly the specified uniform bit. -/
@[simp] public theorem glue_cross (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε : Bool) (x : X) (y : Y) :
    (glue G H ε).Adj (.inr (.inl x)) (.inr (.inr y)) ↔ ε = true := Iff.rfl

/-- All old incidences of the left input survive gluing. -/
public theorem glue_left (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε : Bool) :
    (glue G H ε).comap (Sum.map id Sum.inl) = G := by
  ext v w
  cases v <;> cases w <;> rfl

/-- All old incidences of the compatible right input survive gluing. -/
public theorem glue_right (G : SimpleGraph (B ⊕ X)) (H : SimpleGraph (B ⊕ Y))
    (ε : Bool) (compatible : G.comap Sum.inl = H.comap Sum.inl) :
    (glue G H ε).comap (Sum.map id Sum.inr) = H := by
  ext v w
  cases v with
  | inl b => cases w with
    | inl c => exact (congrArg (fun K : SimpleGraph B ↦ K.Adj b c) compatible).to_iff
    | inr y => rfl
  | inr y => cases w <;> rfl

/-- The usual subtraction expression for the order also counts the boundary once. -/
public theorem glue_order_sub [Fintype B] [Fintype X] [Fintype Y] :
    Fintype.card (B ⊕ (X ⊕ Y)) =
      Fintype.card (B ⊕ X) + Fintype.card (B ⊕ Y) - Fintype.card B := by
  simp only [Fintype.card_sum]
  omega

/-- Gluing counts each shared boundary vertex only once. -/
public theorem glue_order [Fintype B] [Fintype X] [Fintype Y] :
    Fintype.card (B ⊕ (X ⊕ Y)) + Fintype.card B =
      Fintype.card (B ⊕ X) + Fintype.card (B ⊕ Y) := by
  simp only [Fintype.card_sum]
  omega

end Ramsey.Boundary
