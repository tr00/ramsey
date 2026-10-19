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

Graph-level vocabulary shared by every branch of the R(5, 5) formalization:

* `IsRamseyGraph s t G`: `G` has no `s`-clique and no independent `t`-set
* `RamseyGraph s t V`: a graph bundled with its `(s,t)`-Ramsey property
* `ramseyNumber s t`: the Ramsey number `R(s, t)`
* explicit bound predicates `RamseyUpperBound`, `RamseyEdgeLowerBound` and
  `RamseyEdgeUpperBound`
* balanced-clique vocabulary `balancedCliqueEdges` and `IsBalancedCliqueUnion`
* transfer lemmas along complements, embeddings and induced subgraphs,
  including the neighborhood and common-neighbor Ramsey transfers

This module sits at the bottom of the dependency order
`defs ← Premises ← branch modules`, so premise-consuming results can never
cycle back here. Pivot and transversal vocabulary lives in
`Ramsey.defs.Transversals`, which imports this module.
-/

namespace Ramsey

variable {V : Type*}

/-! ### Ramsey graphs and Ramsey numbers -/

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

/-- The Ramsey number `R(s, t)`: the least `n` such that no `(s, t)`-Ramsey
graph exists on exactly `n` vertices.

Caveats:

* Nonemptiness of the defining set (finite Ramsey theorem) is not proved.
  `sInf` of an empty set is `0`, so the definition is total regardless. The
  monotonicity side is covered by `isRamseyGraph_comap` and the bounds below.
-/
@[expose] public noncomputable def ramseyNumber (s t : ℕ) : ℕ :=
  sInf {n | ¬ ∃ G : SimpleGraph (Fin n), IsRamseyGraph s t G}

/-- Complement symmetry: swapping the clique and independence sides. -/
public theorem isRamseyGraph_compl (G : SimpleGraph V) {s t : ℕ} :
    IsRamseyGraph s t G ↔ IsRamseyGraph t s Gᶜ := by
  simp [IsRamseyGraph, and_comm]

/-! ### Transfer along embeddings and induced subgraphs -/

/-- `G` contains `G.comap f` as a copy, for any embedding `f`. -/
public theorem comap_isContained {W : Type*} (G : SimpleGraph V) (f : W ↪ V) :
    SimpleGraph.IsContained (G.comap f) G :=
  ⟨⟨f, fun h => SimpleGraph.comap_adj.mp h⟩, f.injective⟩

/-- Transfer along an embedding: `G.comap f` is the induced structure of `G`
on the range of `f`, reindexed. -/
public theorem isRamseyGraph_comap {W : Type*} {s t : ℕ} (G : SimpleGraph V) (f : W ↪ V)
    (hG : IsRamseyGraph s t G) : IsRamseyGraph s t (G.comap f) := by
  obtain ⟨hc, hi⟩ := hG
  have hcc : (G.comap f)ᶜ = Gᶜ.comap f := by ext a b; simp [SimpleGraph.comap_adj]
  have hc' : Gᶜ.CliqueFree t := (SimpleGraph.cliqueFree_compl G).mpr hi
  refine ⟨SimpleGraph.CliqueFree.comap (comap_isContained G f) hc, ?_⟩
  rw [← SimpleGraph.cliqueFree_compl, hcc]
  exact SimpleGraph.CliqueFree.comap (comap_isContained Gᶜ f) hc'

/-- If no graph on `Fin n` is `(s, t)`-Ramsey, then `ramseyNumber s t ≤ n`. -/
public theorem ramseyNumber_le_of_forall {s t n : ℕ}
    (h : ∀ G : SimpleGraph (Fin n), ¬IsRamseyGraph s t G) : ramseyNumber s t ≤ n :=
  Nat.sInf_le (fun ⟨G, hG⟩ => h G hG)

/-- Below `ramseyNumber s t` a witness graph exists. The converse needs the
defining set to be nonempty (finite Ramsey theorem), which is not available. -/
public theorem exists_of_lt_ramseyNumber {s t n : ℕ} (h : n < ramseyNumber s t) :
    ∃ G : SimpleGraph (Fin n), IsRamseyGraph s t G := by
  by_contra hc
  exact absurd (Nat.sInf_le hc) (not_le.2 h)

/-- Complements commute with induced subgraphs. -/
public theorem compl_induce (G : SimpleGraph V) (s : Set V) :
    (G.induce s)ᶜ = Gᶜ.induce s := by
  ext a b
  simp only [SimpleGraph.compl_adj, SimpleGraph.induce_adj]
  refine ⟨fun h => ⟨fun he => h.1 (Subtype.ext he), h.2⟩, ?_⟩
  rintro ⟨h1, h2⟩
  exact ⟨fun he => h1 (congrArg Subtype.val he), h2⟩

/-- Independent `n`-sets of an induced subgraph are independent in `G`. -/
public theorem indepSetFree_induce {G : SimpleGraph V} (s : Set V) (n : ℕ)
    (h : G.IndepSetFree n) : (G.induce s).IndepSetFree n :=
  (SimpleGraph.cliqueFree_compl _).mp (by
    rw [compl_induce, SimpleGraph.cliqueFree_induce_iff]
    exact fun t _ => (SimpleGraph.cliqueFree_compl G).mpr h t)

/-- Independence exclusion on an induced graph can be checked on ambient
finite sets. -/
public theorem indepSetFree_induce_iff (H : SimpleGraph V) (S : Set V) (n : ℕ) :
    (H.induce S).IndepSetFree n ↔
      ∀ t : Finset V, (↑t : Set V) ⊆ S → ¬H.IsNIndepSet n t := by
  rw [← SimpleGraph.cliqueFree_compl, compl_induce, SimpleGraph.cliqueFree_induce_iff]
  simp only [SimpleGraph.CliqueFreeOn, SimpleGraph.isNClique_compl]
/-- Neighborhoods of `(5,5)`-Ramsey graphs are `(4,5)`-Ramsey. -/
public theorem isRamseyGraph_induce_neighborSet {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) (v : V) :
    IsRamseyGraph 4 5 (G.induce (G.neighborSet v)) := by
  obtain ⟨hc, hi⟩ := hG
  refine ⟨?_, indepSetFree_induce _ _ hi⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t ht htclique
  have hcard := htclique.card_eq
  have hvn : v ∉ (t : Set V) := fun hb => absurd (ht hb) (by simp)
  have hvnF : v ∉ t := fun hb => hvn (Finset.mem_coe.mp hb)
  refine hc (Finset.cons v t hvnF) ⟨?_, ?_⟩
  · rw [SimpleGraph.isClique_iff, Finset.coe_cons]
    exact Set.Pairwise.insert_of_notMem hvn htclique.isClique
      (fun b hb => ⟨(ht hb : G.Adj v b), (ht hb : G.Adj v b).symm⟩)
  · rw [Finset.card_cons]
    omega

/-- Common neighbors of adjacent vertices form a `(3,5)`-Ramsey graph. -/
public theorem isRamseyGraph_induce_commonNeighbors {G : SimpleGraph V}
    (hG : IsRamseyGraph 5 5 G) {v w : V} (hvw : G.Adj v w) :
    IsRamseyGraph 3 5 (G.induce (G.commonNeighbors v w)) := by
  obtain ⟨hc, hi⟩ := hG
  refine ⟨?_, indepSetFree_induce _ _ hi⟩
  rw [SimpleGraph.cliqueFree_induce_iff]
  intro t ht htclique
  have hcard := htclique.card_eq
  have hvn : v ∉ (t : Set V) := fun hb => absurd (ht hb).1 (by simp)
  have hwn : w ∉ (t : Set V) := fun hb => absurd (ht hb).2 (by simp)
  have hvwne : v ≠ w := by
    intro h
    rw [← h] at hvw
    exact absurd hvw (by simp)
  have hvnF : v ∉ t := fun hb => hvn (Finset.mem_coe.mp hb)
  have hwnF : w ∉ t := fun hb => hwn (Finset.mem_coe.mp hb)
  have hvnF' : v ∉ Finset.cons w t hwnF := by
    intro hb
    rcases Finset.mem_cons.mp hb with h' | h'
    · exact hvwne h'
    · exact hvnF h'
  have hvn' : v ∉ (insert w (t : Set V)) := fun hb => by
    rcases Set.mem_insert_iff.mp hb with h' | h'
    · exact hvwne h'
    · exact hvn h'
  refine hc (Finset.cons v (Finset.cons w t hwnF) hvnF') ⟨?_, ?_⟩
  · rw [SimpleGraph.isClique_iff, Finset.coe_cons, Finset.coe_cons]
    refine Set.Pairwise.insert_of_notMem hvn' ?_ ?_
    · exact Set.Pairwise.insert_of_notMem hwn htclique.isClique
        (fun b hb => ⟨(ht hb).2, (ht hb).2.symm⟩)
    · intro b hb
      rcases Set.mem_insert_iff.mp hb with hb' | hb'
      · subst hb'
        exact ⟨hvw, hvw.symm⟩
      · exact ⟨(ht hb').1, (ht hb').1.symm⟩
  · rw [Finset.card_cons, Finset.card_cons]
    omega

/-! ### Explicit bound predicates -/

/-- A genuine homogeneous-set upper bound, without assuming properties of
`ramseyNumber`. -/
@[expose] public def RamseyUpperBound (r s R : ℕ) : Prop :=
  ∀ G : SimpleGraph (Fin R), ¬IsRamseyGraph r s G

/-- An upper bound excludes Ramsey graphs on any finite type of at least that
order. -/
public theorem RamseyUpperBound.not_isRamseyGraph {r s R : ℕ} (hR : RamseyUpperBound r s R)
    [Finite V] (h : R ≤ Nat.card V) (G : SimpleGraph V) : ¬IsRamseyGraph r s G := by
  let : Fintype V := Fintype.ofFinite V
  let f : Fin R ↪ V := Classical.choice
    (Function.Embedding.nonempty_of_card_le (by simpa [Nat.card_eq_fintype_card] using h))
  exact fun hG ↦ hR (G.comap f) (isRamseyGraph_comap G f hG)

/-- Complement symmetry for explicit Ramsey upper bounds. -/
public theorem RamseyUpperBound.compl {r s R : ℕ} (hR : RamseyUpperBound r s R) :
    RamseyUpperBound s r R :=
  fun G hG ↦ hR Gᶜ ((isRamseyGraph_compl G).mp hG)

/-- A lower edge bound for every `(r,s)`-free graph of order `n`. Existence
of such a graph is not assumed. -/
@[expose] public def RamseyEdgeLowerBound (n r s : ℕ) (L : ℝ) : Prop :=
  ∀ G : SimpleGraph (Fin n), IsRamseyGraph r s G → L ≤ (Nat.card G.edgeSet : ℝ)

/-- Apply a published lower edge bound on any finite type of exactly the
stated order. -/
public theorem RamseyEdgeLowerBound.on_finite_type {n r s : ℕ} {L : ℝ}
    (hL : RamseyEdgeLowerBound n r s L) [Finite V] (hn : Nat.card V = n)
    (G : SimpleGraph V) (hG : IsRamseyGraph r s G) : L ≤ (Nat.card G.edgeSet : ℝ) := by
  let : Fintype V := Fintype.ofFinite V
  have hn' : Fintype.card V = n := by simpa only [Nat.card_eq_fintype_card] using hn
  have h := hL (G.overFin hn')
    (isRamseyGraph_comap G (Fintype.equivFinOfCardEq hn').symm.toEmbedding hG)
  have he := Nat.card_congr (G.overFinIso hn').mapEdgeSet
  rwa [← he] at h

/-- An upper edge bound for every `(r,s)`-free graph of order `n`. Existence
of such a graph is not assumed. -/
@[expose] public def RamseyEdgeUpperBound (n r s : ℕ) (U : ℝ) : Prop :=
  ∀ G : SimpleGraph (Fin n), IsRamseyGraph r s G → (Nat.card G.edgeSet : ℝ) ≤ U

/-- Apply a published upper edge bound on any finite type of exactly the
stated order. -/
public theorem RamseyEdgeUpperBound.on_finite_type {n r s : ℕ} {U : ℝ}
    (hU : RamseyEdgeUpperBound n r s U) [Finite V] (hn : Nat.card V = n)
    (G : SimpleGraph V) (hG : IsRamseyGraph r s G) : (Nat.card G.edgeSet : ℝ) ≤ U := by
  let : Fintype V := Fintype.ofFinite V
  have hn' : Fintype.card V = n := by simpa only [Nat.card_eq_fintype_card] using hn
  have h := hU (G.overFin hn')
    (isRamseyGraph_comap G (Fintype.equivFinOfCardEq hn').symm.toEmbedding hG)
  have he := Nat.card_congr (G.overFinIso hn').mapEdgeSet
  rwa [← he] at h

/-! ### Balanced clique unions -/

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
