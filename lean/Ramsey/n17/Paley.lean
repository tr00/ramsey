module

public import Ramsey.basics.RamseyTheory
public import Mathlib.Data.ZMod.Basic

/-!
# The Paley graph on 17 vertices

The nonzero quadratic residues modulo 17 define a concrete (4,4)-Ramsey graph.
Multiplication by 3 identifies this graph with its complement.
-/

namespace Ramsey.n17

/-- The 8 nonzero quadratic residues modulo 17. -/
@[expose] public def paley17Residues : Finset (ZMod 17) := {1, 2, 4, 8, 9, 13, 15, 16}

/-- Two residues are adjacent when their difference is a nonzero square. -/
@[expose] public def paley17 : SimpleGraph (ZMod 17) where
  Adj x y := y - x ∈ paley17Residues
  symm := ⟨by decide⟩
  loopless := ⟨by decide⟩

/-- Adjacency in the explicit Paley graph is decidable. -/
public instance : DecidableRel paley17.Adj :=
  fun x y ↦ inferInstanceAs (Decidable (y - x ∈ paley17Residues))

/-- The explicit residue set is exactly the set of nonzero squares. -/
public theorem mem_paley17Residues_iff (a : ZMod 17) :
    a ∈ paley17Residues ↔ a ≠ 0 ∧ ∃ b : ZMod 17, b * b = a := by
  revert a
  decide

/-- Adjacency is membership of the difference in the explicit residue set. -/
public theorem paley17_adj_iff (x y : ZMod 17) :
    paley17.Adj x y ↔ y - x ∈ ({1, 2, 4, 8, 9, 13, 15, 16} : Finset (ZMod 17)) :=
  Iff.rfl

/-- Translating both endpoints preserves Paley adjacency. -/
public theorem paley17_adj_add_iff (x y a : ZMod 17) :
    paley17.Adj (x + a) (y + a) ↔ paley17.Adj x y := by
  change y + a - (x + a) ∈ paley17Residues ↔ y - x ∈ paley17Residues
  rw [add_sub_add_right_eq_sub]

/-- Multiplication by 3 identifies Paley-17 with its complement, with inverse multiplier 6. -/
@[expose] public def paley17_compl_iso : paley17 ≃g paley17ᶜ where
  toFun x := 3 * x
  invFun x := 6 * x
  left_inv := by decide
  right_inv := by decide
  map_rel_iff' := by decide

/-- No 3 mutually adjacent neighbors of 0 exist in Paley-17. -/
private lemma paley17_no_neighbor_triangle :
    ∀ a b : ZMod 17, paley17.Adj 0 a → paley17.Adj 0 b → paley17.Adj a b →
      ∀ c : ZMod 17, paley17.Adj 0 c → paley17.Adj a c → ¬paley17.Adj b c := by
  decide

/-- Paley-17 contains no clique of size 4. -/
public theorem paley17_cliqueFree : paley17.CliqueFree 4 := by
  classical
  by_contra h
  let f := SimpleGraph.topEmbeddingOfNotCliqueFree h
  have hadj (i j : Fin 4) (hij : i ≠ j) : paley17.Adj (f i - f 0) (f j - f 0) := by
    have hf : paley17.Adj (f i) (f j) := f.map_adj_iff.mpr hij
    simpa only [sub_eq_add_neg, paley17_adj_add_iff] using hf
  have hzero (i : Fin 4) (hi : i ≠ 0) : paley17.Adj 0 (f i - f 0) := by
    simpa only [sub_self] using hadj 0 i hi.symm
  exact paley17_no_neighbor_triangle (f 1 - f 0) (f 2 - f 0)
    (hzero 1 (by decide)) (hzero 2 (by decide)) (hadj 1 2 (by decide))
    (f 3 - f 0) (hzero 3 (by decide)) (hadj 1 3 (by decide)) (hadj 2 3 (by decide))

/-- The explicit Paley graph has neither a clique nor an independent set of size 4. -/
public theorem paley17_isRamseyGraph : IsRamseyGraph 4 4 paley17 := by
  refine ⟨paley17_cliqueFree, ?_⟩
  exact (SimpleGraph.cliqueFree_compl paley17).mp
    (SimpleGraph.CliqueFree.comap paley17_compl_iso.isContained' paley17_cliqueFree)

end Ramsey.n17
