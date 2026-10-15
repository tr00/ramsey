module

public import Mathlib.Basic.Finite.Defs
public import Mathlib.Combinatorics.SimpleGraph.Basic
public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Combinatorics.SimpleGraph.Finite
public import Mathlib.Data.Fintype.Basic
public import Mathlib.SetTheory.Cardinal.Finite

/-!
# Core definitions

Pure definitions for the R(5, 5) formalization, mirroring the notation of
`../docs/mathematical_baseline.md` ("Definitions and proof target"):

* `IsRamseyGraph s t G` — `G` has no `s`-clique and no independent `t`-set
  (the informal "`G` in `R(s, t, n)`", without the order condition).
* `ramseyNumber s t` — the Ramsey number `R(s, t)`.
* Pivot vocabulary, mirroring `../n43/reductions.md` §2 and §5:
  `antiNeighborSet` (`M(v)`), `crossEdgeSet` (`x = e(A, B)`), `rowSet` (`R_u`),
  `columnSet` (`C_y`), `IsTransversal`.
* Structural lemmas: `isRamseyGraph_compl`, `isRamseyGraph_comap`, and the
  `ramseyNumber` bounds `ramseyNumber_le_of_forall` / `exists_of_lt_ramseyNumber`.

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

/-- Edges of `G` with one endpoint in `A` and the other in `B`. -/
def crossEdgeSet (G : SimpleGraph V) (A B : Set V) : Set (Sym2 V) :=
  {e | e ∈ G.edgeSet ∧ ∃ u ∈ A, ∃ w ∈ B, e = s(u, w)}

/-- The cross row at `u ∈ A`: neighbors of `u` inside `B` (`R_u`). -/
def rowSet (G : SimpleGraph V) (B : Set V) (u : V) : Set V :=
  G.neighborSet u ∩ B

/-- The cross column at `y ∈ B`: neighbors of `y` inside `A` (`C_y`). -/
def columnSet (G : SimpleGraph V) (A : Set V) (y : V) : Set V :=
  G.neighborSet y ∩ A

/-- `T` is a transversal of `C` if it meets every member of `C`. -/
def IsTransversal (T : Set V) (C : Set (Set V)) : Prop :=
  ∀ S ∈ C, (S ∩ T).Nonempty

end Ramsey
