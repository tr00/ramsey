module

public import Mathlib.Basic.Finite.Defs
public import Mathlib.Combinatorics.SimpleGraph.Basic
public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Combinatorics.SimpleGraph.Finite
public import Mathlib.Data.Fintype.Basic
public import Mathlib.Basic.Real.Basic
public import Mathlib.SetTheory.Cardinal.Finite

/-!
# Core definitions

Pure definitions for the R(5, 5) formalization.

* `IsRamseyGraph s t G` — `G` has no `s`-clique and no independent `t`-set
* `ramseyNumber s t` — the Ramsey number `R(s, t)`.
* Pivot vocabulary:
  `antiNeighborSet` (`M(v)`), `crossEdgeSet` (`x = e(A, B)`), `rowSet` (`R_u`),
  `columnSet` (`C_y`), `IsTransversal`.
* Counting vocabulary: `inducedEdgeCount`, `crossEdgeCount`, and `degreeExcess`.
* Interface predicates: `CliqueRectangleFree` and `IndepRectangleFree`.
* Structural lemmas: `isRamseyGraph_compl`, `isRamseyGraph_comap`, and the
  `ramseyNumber` bounds `ramseyNumber_le_of_forall` / `exists_of_lt_ramseyNumber`.
* General theorem vocabulary: `cliqueFamily`, `indepSetFamily`,
  `IsCliqueTransversal`, `IsIndepTransversal`, explicit `RamseyUpperBound`,
  `RamseyEdgeLowerBound` and `RamseyEdgeUpperBound` predicates, and
  `balancedCliqueEdges` / `IsBalancedCliqueUnion`.

The informal mathematical write-up of these definitions is
`../tex/core_definitions.tex`.

This file deliberately imports no premises: it sits at the bottom of the
dependency order `Defs ← Premises ← root target`, so that premise-consuming
results can never cycle back here. The main target `R_5_5_43` lives in the
root module `Ramsey.lean`.
-/

@[expose] public section

namespace Ramsey

variable {V : Type*}

/-- `IsRamseyGraph s t G`: `G` has no clique of size `s` and no independent
set of size `t`. Mirrors "`G` in `R(s, t, n)`" from
`../docs/mathematical_baseline.md`, with the order `n` supplied by the
ambient type. -/
def IsRamseyGraph (s t : ℕ) (G : SimpleGraph V) : Prop :=
  G.CliqueFree s ∧ G.IndepSetFree t

/-- The Ramsey number `R(s, t)`: the least `n` such that no `(s, t)`-Ramsey
graph exists on exactly `n` vertices.

Caveats:

* Nonemptiness of the defining set (finite Ramsey theorem) is not proved;
  `sInf` of an empty set is `0`, so the definition is total regardless. The
  monotonicity side is covered by `isRamseyGraph_comap` and the bounds below.
-/
noncomputable def ramseyNumber (s t : ℕ) : ℕ :=
  sInf {n | ¬ ∃ G : SimpleGraph (Fin n), IsRamseyGraph s t G}

/-- Complement symmetry: swapping the clique and independence sides. -/
theorem isRamseyGraph_compl (G : SimpleGraph V) {s t : ℕ} :
    IsRamseyGraph s t G ↔ IsRamseyGraph t s Gᶜ := by
  simp [IsRamseyGraph, and_comm]

/-- `G` contains `G.comap f` as a copy, for any embedding `f`. -/
theorem comap_isContained {W : Type*} (G : SimpleGraph V) (f : W ↪ V) :
    SimpleGraph.IsContained (G.comap f) G :=
  ⟨⟨f, fun h => SimpleGraph.comap_adj.mp h⟩, f.injective⟩

/-- Transfer along an embedding: `G.comap f` is the induced structure of `G`
on the range of `f`, reindexed. -/
theorem isRamseyGraph_comap {W : Type*} {s t : ℕ} (G : SimpleGraph V) (f : W ↪ V)
    (hG : IsRamseyGraph s t G) : IsRamseyGraph s t (G.comap f) := by
  obtain ⟨hc, hi⟩ := hG
  have hcc : (G.comap f)ᶜ = Gᶜ.comap f := by ext a b; simp [SimpleGraph.comap_adj]
  have hc' : Gᶜ.CliqueFree t := (SimpleGraph.cliqueFree_compl G).mpr hi
  refine ⟨SimpleGraph.CliqueFree.comap (comap_isContained G f) hc, ?_⟩
  rw [← SimpleGraph.cliqueFree_compl, hcc]
  exact SimpleGraph.CliqueFree.comap (comap_isContained Gᶜ f) hc'

/-- If no graph on `Fin n` is `(s, t)`-Ramsey, then `ramseyNumber s t ≤ n`. -/
theorem ramseyNumber_le_of_forall {s t n : ℕ}
    (h : ∀ G : SimpleGraph (Fin n), ¬IsRamseyGraph s t G) : ramseyNumber s t ≤ n :=
  Nat.sInf_le (fun ⟨G, hG⟩ => h G hG)

/-- Below `ramseyNumber s t` a witness graph exists. The converse needs the
defining set to be nonempty (finite Ramsey theorem), which is not available. -/
theorem exists_of_lt_ramseyNumber {s t n : ℕ} (h : n < ramseyNumber s t) :
    ∃ G : SimpleGraph (Fin n), IsRamseyGraph s t G := by
  by_contra hc
  exact absurd (Nat.sInf_le hc) (not_le.2 h)

/-- The antineighborhood `M(v)`: vertices other than `v` not adjacent to `v`. -/
def antiNeighborSet (G : SimpleGraph V) (v : V) : Set V :=
  {w | w ≠ v ∧ ¬G.Adj v w}

/-- Antineighborhood membership is decidable when equality and adjacency are decidable. -/
instance decidableMemAntiNeighborSet [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (v : V) : DecidablePred (· ∈ antiNeighborSet G v) :=
  fun w ↦ inferInstanceAs (Decidable (w ≠ v ∧ ¬G.Adj v w))

/-- Exclude all-one rectangles whose two internally complete sides total `n` vertices.
Empty sides are included. For the intended interpretation the ambient sets are disjoint. -/
def CliqueRectangleFree (G : SimpleGraph V) (A B : Set V) (n : ℕ) : Prop :=
  ∀ P Q : Finset V, (P : Set V) ⊆ A → (Q : Set V) ⊆ B → P.card + Q.card = n →
    G.IsClique (P : Set V) → G.IsClique (Q : Set V) →
    ¬(∀ p ∈ P, ∀ q ∈ Q, G.Adj p q)

/-- Exclude all-zero rectangles whose two internally independent sides total `n` vertices.
Empty sides are included. For the intended interpretation the ambient sets are disjoint. -/
def IndepRectangleFree (G : SimpleGraph V) (A B : Set V) (n : ℕ) : Prop :=
  ∀ P Q : Finset V, (P : Set V) ⊆ A → (Q : Set V) ⊆ B → P.card + Q.card = n →
    G.IsIndepSet (P : Set V) → G.IsIndepSet (Q : Set V) →
    ¬(∀ p ∈ P, ∀ q ∈ Q, ¬G.Adj p q)

/-- Edges of `G` with one endpoint in `A` and the other in `B`. -/
def crossEdgeSet (G : SimpleGraph V) (A B : Set V) : Set (Sym2 V) :=
  {e | e ∈ G.edgeSet ∧ ∃ u ∈ A, ∃ w ∈ B, e = s(u, w)}

/-- Internal edges `e(G[A])`, counted without choosing vertex labels. -/
noncomputable def inducedEdgeCount (G : SimpleGraph V) (A : Set V) : ℕ :=
  Nat.card (G.induce A).edgeSet

/-- Cross edges `e_G(A,B)`. For disjoint sets each edge is counted once, not twice. -/
noncomputable def crossEdgeCount (G : SimpleGraph V) (A B : Set V) : ℕ :=
  Nat.card (crossEdgeSet G A B)

/-- Nonnegative degree excess on `A`. Exact degree identities require all degrees on `A`
to be at least `base`. Subtraction here is natural-number subtraction. -/
noncomputable def degreeExcess [Fintype V] (G : SimpleGraph V)
    (base : ℕ) (A : Set V) [DecidablePred (· ∈ A)] : ℕ :=
  ∑ u : A, (Nat.card (G.neighborSet u) - base)

/-- The cross row at `u ∈ A`: neighbors of `u` inside `B` (`R_u`). -/
def rowSet (G : SimpleGraph V) (B : Set V) (u : V) : Set V :=
  G.neighborSet u ∩ B

/-- The cross column at `y ∈ B`: neighbors of `y` inside `A` (`C_y`). -/
def columnSet (G : SimpleGraph V) (A : Set V) (y : V) : Set V :=
  G.neighborSet y ∩ A

/-- `T` is a transversal of `C` if it meets every member of `C`. -/
def IsTransversal (T : Set V) (C : Set (Set V)) : Prop :=
  ∀ S ∈ C, (S ∩ T).Nonempty

/-- The family of vertex sets spanning an `r`-clique. -/
def cliqueFamily (G : SimpleGraph V) (r : ℕ) : Set (Set V) :=
  {S | ∃ T : Finset V, (T : Set V) = S ∧ G.IsNClique r T}

/-- The family of independent vertex sets of size `s`. -/
def indepSetFamily (G : SimpleGraph V) (s : ℕ) : Set (Set V) :=
  {S | ∃ T : Finset V, (T : Set V) = S ∧ G.IsNIndepSet s T}

/-- A finite vertex set meeting every `r`-clique. -/
def IsCliqueTransversal (G : SimpleGraph V) (r : ℕ) (T : Finset V) : Prop :=
  IsTransversal (T : Set V) (cliqueFamily G r)

/-- A finite vertex set meeting every independent `s`-set. -/
def IsIndepTransversal (G : SimpleGraph V) (s : ℕ) (T : Finset V) : Prop :=
  IsTransversal (T : Set V) (indepSetFamily G s)

/-- A genuine homogeneous-set upper bound, without assuming properties of `ramseyNumber`. -/
def RamseyUpperBound (r s R : ℕ) : Prop :=
  ∀ G : SimpleGraph (Fin R), ¬IsRamseyGraph r s G

/-- An upper bound excludes Ramsey graphs on any finite type of at least that order. -/
theorem RamseyUpperBound.not_isRamseyGraph {r s R : ℕ} (hR : RamseyUpperBound r s R)
    [Finite V] (h : R ≤ Nat.card V) (G : SimpleGraph V) : ¬IsRamseyGraph r s G := by
  let : Fintype V := Fintype.ofFinite V
  let f : Fin R ↪ V := Classical.choice
    (Function.Embedding.nonempty_of_card_le (by simpa [Nat.card_eq_fintype_card] using h))
  exact fun hG ↦ hR (G.comap f) (isRamseyGraph_comap G f hG)

/-- Complement symmetry for explicit Ramsey upper bounds. -/
theorem RamseyUpperBound.compl {r s R : ℕ} (hR : RamseyUpperBound r s R) :
    RamseyUpperBound s r R :=
  fun G hG ↦ hR Gᶜ ((isRamseyGraph_compl G).mp hG)

/-- A lower edge bound for every `(r,s)`-free graph of order `n`; existence is not assumed. -/
def RamseyEdgeLowerBound (n r s : ℕ) (L : ℝ) : Prop :=
  ∀ G : SimpleGraph (Fin n), IsRamseyGraph r s G → L ≤ (Nat.card G.edgeSet : ℝ)

/-- Apply a published lower edge bound on any finite type of exactly the stated order. -/
theorem RamseyEdgeLowerBound.on_finite_type {n r s : ℕ} {L : ℝ}
    (hL : RamseyEdgeLowerBound n r s L) [Finite V] (hn : Nat.card V = n)
    (G : SimpleGraph V) (hG : IsRamseyGraph r s G) : L ≤ (Nat.card G.edgeSet : ℝ) := by
  let : Fintype V := Fintype.ofFinite V
  have hn' : Fintype.card V = n := by simpa only [Nat.card_eq_fintype_card] using hn
  have h := hL (G.overFin hn')
    (isRamseyGraph_comap G (Fintype.equivFinOfCardEq hn').symm.toEmbedding hG)
  have he := Nat.card_congr (G.overFinIso hn').mapEdgeSet
  rwa [← he] at h

/-- An upper edge bound for every `(r,s)`-free graph of order `n`; existence is not assumed. -/
def RamseyEdgeUpperBound (n r s : ℕ) (U : ℝ) : Prop :=
  ∀ G : SimpleGraph (Fin n), IsRamseyGraph r s G → (Nat.card G.edgeSet : ℝ) ≤ U

/-- Apply a published upper edge bound on any finite type of exactly the stated order. -/
theorem RamseyEdgeUpperBound.on_finite_type {n r s : ℕ} {U : ℝ}
    (hU : RamseyEdgeUpperBound n r s U) [Finite V] (hn : Nat.card V = n)
    (G : SimpleGraph V) (hG : IsRamseyGraph r s G) : (Nat.card G.edgeSet : ℝ) ≤ U := by
  let : Fintype V := Fintype.ofFinite V
  have hn' : Fintype.card V = n := by simpa only [Nat.card_eq_fintype_card] using hn
  have h := hU (G.overFin hn')
    (isRamseyGraph_comap G (Fintype.equivFinOfCardEq hn').symm.toEmbedding hG)
  have he := Nat.card_congr (G.overFinIso hn').mapEdgeSet
  rwa [← he] at h

/-- Edges in balanced disjoint cliques on `t` vertices in `parts` parts (empty parts allowed).
The formula is total at `parts = 0`; applications require positive `parts`. -/
def balancedCliqueEdges (t parts : ℕ) : ℕ :=
  parts * (t / parts).choose 2 + (t % parts) * (t / parts)

/-- `G` is a union of `parts` disjoint cliques whose sizes differ by at most one. -/
def IsBalancedCliqueUnion (G : SimpleGraph V) (parts : ℕ) : Prop :=
  ∃ f : V → Fin parts,
    (∀ u v, u ≠ v → (G.Adj u v ↔ f u = f v)) ∧
    ∀ i j, Nat.card {v // f v = i} ≤ Nat.card {v // f v = j} + 1

end Ramsey
