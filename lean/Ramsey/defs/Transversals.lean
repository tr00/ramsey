module

public import Ramsey.defs.RamseyGraph
public import Mathlib.Basic.Finite.Defs
public import Mathlib.Combinatorics.SimpleGraph.Basic
public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Combinatorics.SimpleGraph.Finite
public import Mathlib.Data.Fintype.Basic
public import Mathlib.Basic.Real.Basic
public import Mathlib.SetTheory.Cardinal.Finite

/-!
# Pivot interface vocabulary

Repository definitions for the neighborhood and antineighborhood decomposition, rows,
edge counts, degree excess and forbidden rectangles. Elementary graph-family transversals
live in `Ramsey.basics.Transversals`. Pivot identities and Ramsey restrictions live in
`Ramsey.basics.RamseyTheory`.
-/

namespace Ramsey

variable {V : Type*}

/-- The antineighborhood `M(v)`: vertices other than `v` not adjacent to `v`. -/
@[expose] public def antiNeighborSet (G : SimpleGraph V) (v : V) : Set V :=
  {w | w ≠ v ∧ ¬G.Adj v w}

/-- Antineighborhood membership is decidable when equality and adjacency are
decidable. -/
@[expose] public instance decidableMemAntiNeighborSet [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) : DecidablePred (· ∈ antiNeighborSet G v) :=
  fun w ↦ inferInstanceAs (Decidable (w ≠ v ∧ ¬G.Adj v w))

/-- Edges of `G` with one endpoint in `A` and the other in `B`. -/
@[expose] public def crossEdgeSet (G : SimpleGraph V) (A B : Set V) : Set (Sym2 V) :=
  {e | e ∈ G.edgeSet ∧ ∃ u ∈ A, ∃ w ∈ B, e = s(u, w)}

/-- Internal edges `e(G[A])`, counted without choosing vertex labels. -/
@[expose] public noncomputable def inducedEdgeCount (G : SimpleGraph V) (A : Set V) : ℕ :=
  Nat.card (G.induce A).edgeSet

/-- Cross edges `e_G(A,B)`. For disjoint sets each edge is counted once, not
twice. -/
@[expose] public noncomputable def crossEdgeCount (G : SimpleGraph V) (A B : Set V) : ℕ :=
  Nat.card (crossEdgeSet G A B)

/-- Nonnegative degree excess on `A`. Exact degree identities require all
degrees on `A` to be at least `base`. Subtraction here is natural-number
subtraction. -/
@[expose] public noncomputable def degreeExcess [Fintype V] (G : SimpleGraph V)
    (base : ℕ) (A : Set V) [DecidablePred (· ∈ A)] : ℕ :=
  ∑ u : A, (Nat.card (G.neighborSet u) - base)

/-- Neighbors of a vertex inside a chosen set, used for cross rows and columns. -/
@[expose] public def rowSet (G : SimpleGraph V) (B : Set V) (u : V) : Set V :=
  G.neighborSet u ∩ B

/-- The number of neighbors of `x` outside the finite deletion set `T`. -/
@[expose] public noncomputable def outsideDegree (G : SimpleGraph V) (T : Finset V)
    (x : V) : ℕ :=
  Nat.card (rowSet G (T : Set V)ᶜ x)

/-- The number of nonneighbors outside `T`, including `x` itself exactly when `x ∉ T`. -/
@[expose] public noncomputable def outsideNonneighborCount (G : SimpleGraph V) (T : Finset V)
    (x : V) : ℕ :=
  Nat.card {y : V // y ∉ T ∧ ¬G.Adj x y}

/-- Exclude all-one rectangles whose two internally complete sides total `n`
vertices. Empty sides are included. For the intended interpretation the
ambient sets are disjoint. -/
@[expose] public def CliqueRectangleFree (G : SimpleGraph V) (A B : Set V) (n : ℕ) : Prop :=
  ∀ P Q : Finset V, (P : Set V) ⊆ A → (Q : Set V) ⊆ B → P.card + Q.card = n →
    G.IsClique (P : Set V) → G.IsClique (Q : Set V) →
    ¬(∀ p ∈ P, ∀ q ∈ Q, G.Adj p q)

/-- Exclude all-zero rectangles whose two internally independent sides total
`n` vertices. Empty sides are included. For the intended interpretation the
ambient sets are disjoint. -/
@[expose] public def IndepRectangleFree (G : SimpleGraph V) (A B : Set V) (n : ℕ) : Prop :=
  ∀ P Q : Finset V, (P : Set V) ⊆ A → (Q : Set V) ⊆ B → P.card + Q.card = n →
    G.IsIndepSet (P : Set V) → G.IsIndepSet (Q : Set V) →
    ¬(∀ p ∈ P, ∀ q ∈ Q, ¬G.Adj p q)

end Ramsey
