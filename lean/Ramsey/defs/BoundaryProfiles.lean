module

public import Ramsey.defs.RamseyGraph
public import Mathlib.Data.Finset.Lattice.Fold
public import Mathlib.Data.Fintype.Powerset
public import Mathlib.Tactic

/-!
# Concrete finite boundary profiles

Tables record capped maxima of homogeneous eligible interior sets. Boundary labels and
boundary adjacency are retained exactly, while interior names are absent from the state.
-/

namespace Ramsey.Boundary

variable {p q : ℕ}
variable {V B X : Type*}

/-- The selected colour is adjacency for `true` and distinct nonadjacency for `false`. -/
@[expose] public def colourAdj (G : SimpleGraph V) (k : Bool) (v w : V) : Prop :=
  if k then G.Adj v w else v ≠ w ∧ ¬G.Adj v w

/-- A finite set is homogeneous in the selected colour. -/
@[expose] public def Homogeneous (G : SimpleGraph V) (k : Bool) (S : Finset V) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, a ≠ b → colourAdj G k a b

/-- The exact labelled boundary graph. -/
@[expose] public def boundaryGraph (G : SimpleGraph (B ⊕ X)) : SimpleGraph B := G.comap Sum.inl

/-- Eligible sets are homogeneous interior sets with all required incidences to `U`. -/
@[expose] public def Eligible (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (U : Finset B) (W : Finset X) : Prop :=
  Homogeneous (G.comap Sum.inr) k W ∧
    ∀ u ∈ U, ∀ x ∈ W, colourAdj G k (Sum.inl u) (Sum.inr x)

/-- The actual maximum cardinality in a finite family, with value `0` for an empty family. -/
@[expose] public noncomputable def maxCard [Fintype V] (P : Finset V → Prop) : ℕ := by
  classical
  exact (Finset.univ.filter P).sup Finset.card

/-- The untruncated maximum cardinality of an eligible interior homogeneous set. -/
@[expose] public noncomputable def rawEntry [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (U : Finset B) : ℕ := maxCard (Eligible G k U)

/-- A capped entry, without adding the size of its boundary argument. -/
@[expose] public noncomputable def entry [Fintype X] (G : SimpleGraph (B ⊕ X)) (k : Bool)
    (t : ℕ) (U : Finset B) : ℕ := min t (rawEntry G k U)

/-- The actual whole-graph homogeneous maximum. -/
@[expose] public noncomputable def homogeneousNumber [Fintype V] (G : SimpleGraph V) (k : Bool) : ℕ :=
  maxCard (Homogeneous G k)

/-- A state retains exact boundary adjacency and only the homogeneous boundary table domains. -/
public structure Profile (B : Type*) (p q : ℕ) where
  /-- Exact adjacency on the labelled boundary. -/
  boundary : SimpleGraph B
  /-- Capped clique table, indexed only by clique boundary sets. -/
  clique : {U : Finset B // Homogeneous boundary true U} → Fin (p + 1)
  /-- Capped independence table, indexed only by independent boundary sets. -/
  indep : {U : Finset B // Homogeneous boundary false U} → Fin (q + 1)

/-- The concrete profile of a finite-interior graph. -/
@[expose] public noncomputable def profile [Fintype X] (G : SimpleGraph (B ⊕ X)) (p q : ℕ) :
    Profile B p q where
  boundary := boundaryGraph G
  clique := fun U ↦ ⟨entry G true p U.val, Nat.lt_succ_of_le (min_le_left _ _)⟩
  indep := fun U ↦ ⟨entry G false q U.val, Nat.lt_succ_of_le (min_le_left _ _)⟩

/-- Profile equality permits unrelated finite interior types and does not record graph order. -/
@[expose] public def SameProfile [Fintype X] {Y : Type*} [Fintype Y]
    (G : SimpleGraph (B ⊕ X)) (F : SimpleGraph (B ⊕ Y)) (p q : ℕ) : Prop :=
  profile G p q = profile F p q

/-- The state observation obtained by maximizing boundary size plus its capped entry. -/
@[expose] public noncomputable def observed [Fintype B] (S : Profile B p q) (k : Bool) : ℕ := by
  classical
  exact if h : k then
    Finset.univ.sup (fun U : {U : Finset B // Homogeneous S.boundary true U} ↦
      min p (U.val.card + (S.clique U).val))
  else
    Finset.univ.sup (fun U : {U : Finset B // Homogeneous S.boundary false U} ↦
      min q (U.val.card + (S.indep U).val))

end Ramsey.Boundary
