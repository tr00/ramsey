module

public import Mathlib.Basic.Finite.Defs
public import Mathlib.Combinatorics.SimpleGraph.Basic
public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Combinatorics.SimpleGraph.Finite
public import Mathlib.Data.Fintype.Basic
public import Mathlib.Basic.Real.Basic
public import Mathlib.SetTheory.Cardinal.Finite

/-!
# Core Ramsey graph vocabulary

Repository vocabulary for Ramsey graphs, explicit order and edge bounds, and balanced clique unions.
Elementary results about this vocabulary live in `Ramsey.basics.RamseyTheory`.
-/

namespace Ramsey

variable {V : Type*}

/-- `IsRamseyGraph s t G`: `G` has no clique of size `s` and no independent
set of size `t`. Mirrors "`G` in `R(s, t, n)`" from the informal mathematical
baseline, with the order `n` supplied by the ambient type. -/
@[expose] public def IsRamseyGraph (s t : ℕ) (G : SimpleGraph V) : Prop :=
  G.CliqueFree s ∧ G.IndepSetFree t

/-- A graph bundled with the exclusion of `s`-cliques and independent `t`-sets. -/
public structure RamseyGraph (s t : ℕ) (V : Type*) where
  /-- The underlying simple graph. -/
  graph : SimpleGraph V
  /-- The clique and independence exclusions of the underlying graph. -/
  ramsey : IsRamseyGraph s t graph

/-- A bundled Ramsey graph can be used as its underlying simple graph. -/
public instance {s t : ℕ} : CoeOut (RamseyGraph s t V) (SimpleGraph V) :=
  ⟨RamseyGraph.graph⟩

/-- The least order excluding `(s,t)`-Ramsey graphs, or 0 if no such order exists. -/
@[expose] public noncomputable def ramseyNumber (s t : ℕ) : ℕ :=
  sInf {n | ¬ ∃ G : SimpleGraph (Fin n), IsRamseyGraph s t G}

/-- A genuine homogeneous-set upper bound, without assuming properties of
`ramseyNumber`. -/
@[expose] public def RamseyUpperBound (r s R : ℕ) : Prop :=
  ∀ G : SimpleGraph (Fin R), ¬IsRamseyGraph r s G

/-- A lower edge bound for every `(r,s)`-free graph of order `n`. Existence
of such a graph is not assumed. -/
@[expose] public def RamseyEdgeLowerBound (n r s : ℕ) (L : ℝ) : Prop :=
  ∀ G : SimpleGraph (Fin n), IsRamseyGraph r s G → L ≤ (Nat.card G.edgeSet : ℝ)

/-- An upper edge bound for every `(r,s)`-free graph of order `n`. Existence
of such a graph is not assumed. -/
@[expose] public def RamseyEdgeUpperBound (n r s : ℕ) (U : ℝ) : Prop :=
  ∀ G : SimpleGraph (Fin n), IsRamseyGraph r s G → (Nat.card G.edgeSet : ℝ) ≤ U

/-- Edges in balanced disjoint cliques on `t` vertices in `parts` parts (empty
parts allowed). The formula is total at `parts = 0`. Applications require
positive `parts`. -/
@[expose] public def balancedCliqueEdges (t parts : ℕ) : ℕ :=
  parts * (t / parts).choose 2 + (t % parts) * (t / parts)

/-- `G` is a union of `parts` disjoint cliques whose sizes differ by at most
one. -/
@[expose] public def IsBalancedCliqueUnion (G : SimpleGraph V) (parts : ℕ) : Prop :=
  ∃ f : V → Fin parts,
    (∀ u v, u ≠ v → (G.Adj u v ↔ f u = f v)) ∧
    ∀ i j, Nat.card {v // f v = i} ≤ Nat.card {v // f v = j} + 1

end Ramsey
