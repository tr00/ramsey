module

public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Data.Set.Card

/-!
# Basic graph operations and finite clique bounds

Embeddings, induced subgraphs and complements preserve the standard clique and independence
properties. Disjoint complete or anticomplete finite sets combine with additive cardinality.
-/

namespace Ramsey

variable {V : Type*}

/-- `G` contains `G.comap f` as a copy, for any embedding `f`. -/
public lemma comap_isContained {W : Type*} (G : SimpleGraph V) (f : W ↪ V) :
    SimpleGraph.IsContained (G.comap f) G :=
  ⟨⟨f, fun h ↦ SimpleGraph.comap_adj.mp h⟩, f.injective⟩

/-- Complements commute with induced subgraphs. -/
public lemma compl_induce (G : SimpleGraph V) (s : Set V) :
    (G.induce s)ᶜ = Gᶜ.induce s := by
  ext a b
  simp only [SimpleGraph.compl_adj, SimpleGraph.induce_adj]
  refine ⟨fun h ↦ ⟨fun he ↦ h.1 (Subtype.ext he), h.2⟩, ?_⟩
  rintro ⟨h1, h2⟩
  exact ⟨fun he ↦ h1 (congrArg Subtype.val he), h2⟩

/-- Independent finite sets in an induced graph are independent in the ambient graph. -/
public lemma isNIndepSet_induce_iff (G : SimpleGraph V) (s : Set V) (t : Finset s)
    (n : ℕ) :
    (G.induce s).IsNIndepSet n t ↔ G.IsNIndepSet n (t.map (.subtype _)) := by
  rw [← SimpleGraph.isNClique_compl, compl_induce, SimpleGraph.isNClique_induce_iff,
    SimpleGraph.isNClique_compl]

/-- Independence exclusion is preserved by induced subgraphs. -/
public lemma indepSetFree_induce {G : SimpleGraph V} (s : Set V) (n : ℕ)
    (h : G.IndepSetFree n) : (G.induce s).IndepSetFree n :=
  (SimpleGraph.cliqueFree_compl _).mp (by
    rw [compl_induce, SimpleGraph.cliqueFree_induce_iff]
    exact fun t _ ↦ (SimpleGraph.cliqueFree_compl G).mpr h t)

/-- Independence exclusion on an induced graph can be checked on ambient finite sets. -/
public lemma indepSetFree_induce_iff (H : SimpleGraph V) (S : Set V) (n : ℕ) :
    (H.induce S).IndepSetFree n ↔
      ∀ t : Finset V, (↑t : Set V) ⊆ S → ¬H.IsNIndepSet n t := by
  rw [← SimpleGraph.cliqueFree_compl, compl_induce, SimpleGraph.cliqueFree_induce_iff]
  simp only [SimpleGraph.CliqueFreeOn, SimpleGraph.isNClique_compl]

/-- A vertex anticomplete to a finite independent set extends it. -/
public lemma isNIndepSet_insert {G : SimpleGraph V} {n : ℕ} {t : Finset V} {z : V}
    [DecidableEq V] (hz : z ∉ t) (ht : G.IsNIndepSet n t)
    (hnon : ∀ w ∈ t, ¬G.Adj z w) :
    G.IsNIndepSet (n + 1) (insert z t) := by
  rw [← SimpleGraph.isNClique_compl] at ht ⊢
  exact ht.insert fun w hw ↦ ⟨fun he ↦ hz (he.symm ▸ hw), hnon w hw⟩

/-- Disjoint finite cliques with complete cross edges combine into a clique. -/
public lemma isNClique_union {G : SimpleGraph V} {m n : ℕ} {s t : Finset V}
    [DecidableEq V] (hs : G.IsNClique m s) (ht : G.IsNClique n t)
    (hd : Disjoint s t) (hcross : ∀ u ∈ s, ∀ w ∈ t, G.Adj u w) :
    G.IsNClique (m + n) (s ∪ t) := by
  refine ⟨?_, by rw [Finset.card_union_of_disjoint hd, hs.card_eq, ht.card_eq]⟩
  intro u hu w hw hne
  rcases Finset.mem_union.mp hu with hu | hu <;>
    rcases Finset.mem_union.mp hw with hw | hw
  · exact hs.isClique hu hw hne
  · exact hcross u hu w hw
  · exact (hcross w hw u hu).symm
  · exact ht.isClique hu hw hne

/-- Disjoint finite independent sets with no cross edges combine into an independent set. -/
public lemma isNIndepSet_union {G : SimpleGraph V} {m n : ℕ} {s t : Finset V}
    [DecidableEq V] (hs : G.IsNIndepSet m s) (ht : G.IsNIndepSet n t)
    (hd : Disjoint s t) (hcross : ∀ u ∈ s, ∀ w ∈ t, ¬G.Adj u w) :
    G.IsNIndepSet (m + n) (s ∪ t) := by
  rw [← SimpleGraph.isNClique_compl] at hs ht ⊢
  apply isNClique_union hs ht hd
  intro u hu w hw
  exact ⟨fun he ↦ Finset.disjoint_left.mp hd hu (he.symm ▸ hw), hcross u hu w hw⟩

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
