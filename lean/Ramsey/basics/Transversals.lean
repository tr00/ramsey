module

public import Ramsey.basics.GraphTheory
public import Mathlib.Data.Set.Finite.Basic

/-!
# Elementary transversal facts

Set-family and graph-transversal vocabulary, hitting-set monotonicity, finite witnesses,
complement duality and forbidden configurations after deletion.
-/

namespace Ramsey

variable {V : Type*}

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

/-- Enlarging a hitting set preserves its transversal property. -/
public lemma IsTransversal.mono {T U : Set V} {C : Set (Set V)}
    (hT : IsTransversal T C) (hTU : T ⊆ U) : IsTransversal U C := by
  intro S hS
  obtain ⟨x, hxS, hxT⟩ := hT S hS
  exact ⟨x, hxS, hTU hxT⟩

/-- Restricting the family preserves its transversal property. -/
public lemma IsTransversal.antitone {T : Set V} {C D : Set (Set V)}
    (hT : IsTransversal T C) (hDC : D ⊆ C) : IsTransversal T D :=
  fun S hS ↦ hT S (hDC hS)

/-- A nontransversal misses a member of the family. -/
public lemma not_isTransversal_iff (T : Set V) (C : Set (Set V)) :
    ¬IsTransversal T C ↔ ∃ S ∈ C, Disjoint S T := by
  classical
  simp only [IsTransversal, not_forall, Set.not_nonempty_iff_eq_empty,
    Set.disjoint_iff_inter_eq_empty, exists_prop]

/-- In a finite ambient type, a missed family member has a finite-set witness. -/
public lemma not_isTransversal_iff_exists_finset [Finite V]
    (T : Set V) (C : Set (Set V)) :
    ¬IsTransversal T C ↔ ∃ I : Finset V, (I : Set V) ∈ C ∧ Disjoint (I : Set V) T := by
  classical
  rw [not_isTransversal_iff]
  constructor
  · rintro ⟨S, hS, hdisjoint⟩
    exact ⟨S.toFinite.toFinset, by simpa using hS, by simpa using hdisjoint⟩
  · rintro ⟨I, hI, hdisjoint⟩
    exact ⟨I, hI, hdisjoint⟩

/-- Membership of a finite clique in the clique family is its clique predicate. -/
@[simp] public lemma mem_cliqueFamily (G : SimpleGraph V) (r : ℕ) (I : Finset V) :
    (I : Set V) ∈ cliqueFamily G r ↔ G.IsNClique r I := by
  constructor
  · rintro ⟨J, hJI, hJ⟩
    exact Finset.coe_injective hJI ▸ hJ
  · intro hI
    exact ⟨I, rfl, hI⟩

/-- Membership of a finite set in the independent-set family is its independence predicate. -/
@[simp] public lemma mem_indepSetFamily (G : SimpleGraph V) (s : ℕ) (I : Finset V) :
    (I : Set V) ∈ indepSetFamily G s ↔ G.IsNIndepSet s I := by
  constructor
  · rintro ⟨J, hJI, hJ⟩
    exact Finset.coe_injective hJI ▸ hJ
  · intro hI
    exact ⟨I, rfl, hI⟩

/-- A clique transversal meets every finite clique of the specified size. -/
public lemma isCliqueTransversal_iff (G : SimpleGraph V) (r : ℕ) (T : Finset V) :
    IsCliqueTransversal G r T ↔
      ∀ I : Finset V, G.IsNClique r I → ∃ x ∈ I, x ∈ T := by
  constructor
  · intro h I hI
    exact h (I : Set V) ⟨I, rfl, hI⟩
  · rintro h S ⟨I, rfl, hI⟩
    exact h I hI

/-- An independent-set transversal meets every finite independent set of the specified size. -/
public lemma isIndepTransversal_iff (G : SimpleGraph V) (s : ℕ) (T : Finset V) :
    IsIndepTransversal G s T ↔
      ∀ I : Finset V, G.IsNIndepSet s I → ∃ x ∈ I, x ∈ T := by
  constructor
  · intro h I hI
    exact h (I : Set V) ⟨I, rfl, hI⟩
  · rintro h S ⟨I, rfl, hI⟩
    exact h I hI

/-- Enlarging a clique transversal preserves its transversal property. -/
public lemma IsCliqueTransversal.mono {G : SimpleGraph V} {r : ℕ} {T U : Finset V}
    (hT : IsCliqueTransversal G r T) (hTU : T ⊆ U) : IsCliqueTransversal G r U :=
  IsTransversal.mono hT hTU

/-- Enlarging an independent-set transversal preserves its transversal property. -/
public lemma IsIndepTransversal.mono {G : SimpleGraph V} {s : ℕ} {T U : Finset V}
    (hT : IsIndepTransversal G s T) (hTU : T ⊆ U) : IsIndepTransversal G s U :=
  IsTransversal.mono hT hTU

/-- Failure to hit all cliques is witnessed by a disjoint clique. -/
public lemma not_isCliqueTransversal_iff (G : SimpleGraph V) (r : ℕ) (T : Finset V) :
    ¬IsCliqueTransversal G r T ↔
      ∃ I : Finset V, G.IsNClique r I ∧ Disjoint I T := by
  classical
  rw [isCliqueTransversal_iff]
  simp only [not_forall, not_exists, not_and, Finset.disjoint_left, exists_prop]

/-- Failure to hit all independent sets is witnessed by a disjoint independent set. -/
public lemma not_isIndepTransversal_iff (G : SimpleGraph V) (s : ℕ) (T : Finset V) :
    ¬IsIndepTransversal G s T ↔
      ∃ I : Finset V, G.IsNIndepSet s I ∧ Disjoint I T := by
  classical
  rw [isIndepTransversal_iff]
  simp only [not_forall, not_exists, not_and, Finset.disjoint_left, exists_prop]

/-- Clique transversals in the complement are independent-set transversals. -/
public lemma cliqueTransversal_compl_iff (G : SimpleGraph V) (r : ℕ) (T : Finset V) :
    IsCliqueTransversal Gᶜ r T ↔ IsIndepTransversal G r T := by
  simp only [IsCliqueTransversal, IsIndepTransversal, cliqueFamily, indepSetFamily,
    SimpleGraph.isNClique_compl]

/-- A clique transversal is exactly a deletion set leaving a clique-free graph. -/
public lemma isCliqueTransversal_iff_cliqueFree_deleted (G : SimpleGraph V) (T : Finset V)
    (r : ℕ) :
    IsCliqueTransversal G r T ↔ (G.induce (T : Set V)ᶜ).CliqueFree r := by
  classical
  rw [SimpleGraph.cliqueFree_induce_iff]
  constructor
  · intro h I hI hclique
    obtain ⟨x, hxI, hxT⟩ := (isCliqueTransversal_iff G r T).mp h I hclique
    exact hI hxI hxT
  · intro h
    by_contra hmiss
    obtain ⟨I, hI, hdisjoint⟩ := (not_isCliqueTransversal_iff G r T).mp hmiss
    exact h (fun x hxI ↦ Finset.disjoint_left.mp hdisjoint hxI) hI

/-- An independent-set transversal is exactly a deletion set leaving no such independent set. -/
public lemma isIndepTransversal_iff_indepSetFree_deleted (G : SimpleGraph V) (T : Finset V)
    (s : ℕ) :
    IsIndepTransversal G s T ↔ (G.induce (T : Set V)ᶜ).IndepSetFree s := by
  rw [← cliqueTransversal_compl_iff G s T,
    isCliqueTransversal_iff_cliqueFree_deleted, ← compl_induce,
    SimpleGraph.cliqueFree_compl]

end Ramsey
