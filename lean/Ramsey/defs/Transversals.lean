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
# Pivot and transversal vocabulary

Vocabulary for the pivot decomposition of a candidate graph into the
neighborhood `A = N(v)` and the antineighborhood `B = M(v)`, and for
transversals of set families:

* `antiNeighborSet` (`M(v)`) with its complement identity and the pivot
  partition lemma `card_neighborSet_add_antiNeighborSet`
* `crossEdgeSet` (`x = e(A, B)`), `rowSet` (`R_u`), `columnSet` (`C_y`)
* counting vocabulary `inducedEdgeCount`, `crossEdgeCount`, `degreeExcess`
* interface predicates `CliqueRectangleFree` and `IndepRectangleFree`
* set-family vocabulary `IsTransversal`, `cliqueFamily`, `indepSetFamily`,
  `IsCliqueTransversal`, `IsIndepTransversal`

Imports `Ramsey.defs.RamseyGraph` for the underlying graph vocabulary and the
neighborhood transfer used by `isRamseyGraph_induce_antiNeighborSet`.
-/

namespace Ramsey

variable {V : Type*}

/-! ### The pivot decomposition -/

/-- The antineighborhood `M(v)`: vertices other than `v` not adjacent to `v`. -/
@[expose] public def antiNeighborSet (G : SimpleGraph V) (v : V) : Set V :=
  {w | w ≠ v ∧ ¬G.Adj v w}

/-- Antineighborhood membership is decidable when equality and adjacency are
decidable. -/
@[expose] public instance decidableMemAntiNeighborSet [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) : DecidablePred (· ∈ antiNeighborSet G v) :=
  fun w ↦ inferInstanceAs (Decidable (w ≠ v ∧ ¬G.Adj v w))

/-- The antineighborhood of `v` is the neighborhood of `v` in the complement. -/
public theorem antiNeighborSet_eq_compl (G : SimpleGraph V) (v : V) :
    antiNeighborSet G v = Gᶜ.neighborSet v := by
  ext w
  simp [antiNeighborSet, SimpleGraph.compl_adj, ne_comm]

/-! ### Cross-edge counting vocabulary -/

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

/-- The cross row at `u ∈ A`: neighbors of `u` inside `B` (`R_u`). -/
@[expose] public def rowSet (G : SimpleGraph V) (B : Set V) (u : V) : Set V :=
  G.neighborSet u ∩ B

/-- The cross column at `y ∈ B`: neighbors of `y` inside `A` (`C_y`). -/
@[expose] public def columnSet (G : SimpleGraph V) (A : Set V) (y : V) : Set V :=
  G.neighborSet y ∩ A

/-! ### Rectangle interface predicates -/

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

/-! ### Set families and transversals -/

/-- `T` is a transversal of `C` if it meets every member of `C`. -/
@[expose] public def IsTransversal (T : Set V) (C : Set (Set V)) : Prop :=
  ∀ S ∈ C, (S ∩ T).Nonempty

/-- The family of vertex sets spanning an `r`-clique. -/
@[expose] public def cliqueFamily (G : SimpleGraph V) (r : ℕ) : Set (Set V) :=
  {S | ∃ T : Finset V, (T : Set V) = S ∧ G.IsNClique r T}

/-- The family of independent vertex sets of size `s`. -/
@[expose] public def indepSetFamily (G : SimpleGraph V) (s : ℕ) : Set (Set V) :=
  {S | ∃ T : Finset V, (T : Set V) = S ∧ G.IsNIndepSet s T}

/-- A finite vertex set meeting every `r`-clique. -/
@[expose] public def IsCliqueTransversal (G : SimpleGraph V) (r : ℕ) (T : Finset V) : Prop :=
  IsTransversal (T : Set V) (cliqueFamily G r)

/-- A finite vertex set meeting every independent `s`-set. -/
@[expose] public def IsIndepTransversal (G : SimpleGraph V) (s : ℕ) (T : Finset V) : Prop :=
  IsTransversal (T : Set V) (indepSetFamily G s)

/-! ### Pivot partition structure -/

/-- Antineighborhoods of `(5,5)`-Ramsey graphs are `(5,4)`-Ramsey. -/
public theorem isRamseyGraph_induce_antiNeighborSet {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (v : V) :
    IsRamseyGraph 5 4 (G.induce (antiNeighborSet G v)) := by
  have hGc : IsRamseyGraph 5 5 Gᶜ := (isRamseyGraph_compl G).mp hG
  rw [isRamseyGraph_compl, compl_induce, antiNeighborSet_eq_compl]
  exact isRamseyGraph_induce_neighborSet hGc v

set_option linter.style.haveILetI false in
/-- Vertex partition: `|N(v)| + |M(v)| + 1 = |V|`. -/
public theorem card_neighborSet_add_antiNeighborSet [Finite V] (G : SimpleGraph V) (v : V) :
    Nat.card ↥(G.neighborSet v) + Nat.card ↥(antiNeighborSet G v) + 1 = Nat.card V := by
  classical
  letI : Fintype V := Fintype.ofFinite V
  have hpos : 0 < Fintype.card V := Fintype.card_pos_iff.mpr ⟨v⟩
  have hTU : (G.neighborSet v ∪ Gᶜ.neighborSet v).toFinset =
      (G.neighborSet v).toFinset ∪ (Gᶜ.neighborSet v).toFinset := by
    ext a
    simp
  have hdF : Disjoint ((G.neighborSet v).toFinset) ((Gᶜ.neighborSet v).toFinset) :=
    Finset.disjoint_left.mpr fun a ha hma => by
      simp only [Set.mem_toFinset, SimpleGraph.mem_neighborSet, SimpleGraph.compl_adj] at ha hma
      exact hma.2 ha
  have hcardU : (G.neighborSet v ∪ Gᶜ.neighborSet v).toFinset.card =
      (G.neighborSet v).toFinset.card + (Gᶜ.neighborSet v).toFinset.card := by
    rw [hTU, Finset.card_union_of_disjoint hdF]
  have hcomp : (G.neighborSet v ∪ Gᶜ.neighborSet v).toFinset.card = Fintype.card V - 1 := by
    simp_rw [G.neighborSet_union_compl_neighborSet_eq, Set.toFinset_compl, Finset.card_compl,
      Set.toFinset_card, Set.card_singleton]
  rw [antiNeighborSet_eq_compl, Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    Nat.card_eq_fintype_card, ← Set.toFinset_card, ← Set.toFinset_card]
  omega

end Ramsey
