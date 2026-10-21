module

public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Data.Set.Card

/-!
# Cardinality bounds from forbidden cliques

A finite clique has at most `n` vertices when the graph has no `(n + 1)`-clique.
The independent-set bounds follow by taking the complement.
-/

namespace Ramsey

variable {V : Type*}

/-- A finite clique has at most `n` vertices if `(n + 1)`-cliques are forbidden. -/
public lemma clique_card_le_of_cliqueFree {G : SimpleGraph V} {n : ℕ} {S : Set V}
    [Finite S] (hfree : G.CliqueFree (n + 1)) (hset : G.IsClique S) : Nat.card S ≤ n := by
  classical
  by_contra hc
  obtain ⟨t, ht, hcard⟩ := Finset.exists_subset_card_eq
    (s := S.toFinite.toFinset) (n := n + 1) (by
      have hc' : n < S.ncard := by simpa using hc
      rw [← Set.ncard_eq_toFinset_card S S.toFinite]
      exact Nat.succ_le_of_lt hc')
  exact hfree t ⟨hset.subset (by simpa using ht), hcard⟩

/-- A finite independent set has at most `n` vertices if `(n + 1)`-sets are forbidden. -/
public lemma independent_card_le_of_indepSetFree {G : SimpleGraph V} {n : ℕ} {S : Set V}
    [Finite S] (hfree : G.IndepSetFree (n + 1)) (hset : G.IsIndepSet S) :
    Nat.card S ≤ n :=
  clique_card_le_of_cliqueFree ((SimpleGraph.cliqueFree_compl G).mpr hfree)
    ((SimpleGraph.isClique_compl G).mpr hset)

/-- A finite independent vertex set has cardinality bounded by the forbidden size. -/
public lemma independent_finset_card_le_of_indepSetFree {G : SimpleGraph V} {n : ℕ}
    {S : Finset V} (hfree : G.IndepSetFree (n + 1)) (hset : G.IsIndepSet S) :
    S.card ≤ n := by
  simpa only [Nat.card_coe_set_eq, Set.ncard_coe_finset] using
    independent_card_le_of_indepSetFree hfree hset

end Ramsey
