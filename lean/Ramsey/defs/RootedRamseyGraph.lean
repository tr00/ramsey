module

public import Ramsey.defs.Transversals

/-!
# Rooted Ramsey graphs

A Ramsey graph with a chosen pivot has canonical neighborhood and antineighborhood parts.
The parts are derived from the graph, so no partition witnesses or consistency proofs are stored.
-/

namespace Ramsey

variable {V : Type*} {s t : ℕ}

/-- A Ramsey graph with a chosen pivot for its neighborhood decomposition. -/
public structure RootedRamseyGraph (s t : ℕ) (V : Type*) extends RamseyGraph s t V where
  /-- The vertex separating the neighborhood and antineighborhood. -/
  pivot : V

/-- Choose a pivot in a bundled Ramsey graph. -/
public abbrev RamseyGraph.root (G : RamseyGraph s t V) (v : V) :
    RootedRamseyGraph s t V :=
  { toRamseyGraph := G, pivot := v }

/-- A rooted Ramsey graph can be used as its underlying simple graph. -/
public instance : CoeOut (RootedRamseyGraph s t V) (SimpleGraph V) :=
  ⟨fun R ↦ R.graph⟩

namespace RootedRamseyGraph

/-- The neighborhood part of the pivot decomposition. -/
public abbrev A (R : RootedRamseyGraph s t V) : Set V :=
  R.graph.neighborSet R.pivot

/-- The antineighborhood part, excluding the pivot itself. -/
public abbrev B (R : RootedRamseyGraph s t V) : Set V :=
  antiNeighborSet R.graph R.pivot

/-- Neighborhood membership is adjacency to the pivot. -/
@[simp] public lemma mem_A (R : RootedRamseyGraph s t V) (u : V) :
    u ∈ R.A ↔ R.graph.Adj R.pivot u := Iff.rfl

/-- Antineighborhood membership excludes the pivot and its neighbors. -/
@[simp] public lemma mem_B (R : RootedRamseyGraph s t V) (u : V) :
    u ∈ R.B ↔ u ≠ R.pivot ∧ ¬R.graph.Adj R.pivot u := Iff.rfl

/-- The pivot does not belong to its neighborhood. -/
@[simp] public lemma pivot_not_mem_A (R : RootedRamseyGraph s t V) :
    R.pivot ∉ R.A := by simp

/-- The pivot does not belong to its antineighborhood. -/
@[simp] public lemma pivot_not_mem_B (R : RootedRamseyGraph s t V) :
    R.pivot ∉ R.B := fun h ↦ h.1 rfl

/-- The neighborhood and antineighborhood parts are disjoint. -/
public lemma disjoint_parts (R : RootedRamseyGraph s t V) : Disjoint R.A R.B :=
  Set.disjoint_left.mpr fun _ ha hb ↦ hb.2 ha

/-- Every vertex is the pivot, a neighbor, or an antineighbor. -/
public lemma mem_partition (R : RootedRamseyGraph s t V) (u : V) :
    u = R.pivot ∨ u ∈ R.A ∨ u ∈ R.B := by
  classical
  grind [mem_A, mem_B]

/-- The 2 parts and the pivot account for all vertices. -/
public lemma card_parts [Finite V] (R : RootedRamseyGraph s t V) :
    Nat.card R.A + Nat.card R.B + 1 = Nat.card V :=
  card_neighborSet_add_antiNeighborSet R.graph R.pivot

/-- The neighborhood order is the pivot degree. -/
@[simp] public lemma card_A [Fintype V] (R : RootedRamseyGraph s t V)
    [DecidableRel R.graph.Adj] : Nat.card R.A = R.graph.degree R.pivot := by
  rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]

/-- The neighborhood of a rooted `(5,5)` graph is bundled as a `(4,5)` graph. -/
@[expose] public def neighborhood (R : RootedRamseyGraph 5 5 V) : RamseyGraph 4 5 R.A :=
  ⟨R.graph.induce R.A, isRamseyGraph_induce_neighborSet R.ramsey R.pivot⟩

/-- The antineighborhood of a rooted `(5,5)` graph is bundled as a `(5,4)` graph. -/
@[expose] public def antineighborhood (R : RootedRamseyGraph 5 5 V) : RamseyGraph 5 4 R.B :=
  ⟨R.graph.induce R.B, isRamseyGraph_induce_antiNeighborSet R.ramsey R.pivot⟩

end RootedRamseyGraph

end Ramsey
