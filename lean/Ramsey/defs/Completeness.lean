module

public import Mathlib.Combinatorics.SimpleGraph.Basic
public import Mathlib.Data.Set.Basic
public import Mathlib.Order.SetNotation

/-!
# Enumeration completeness vocabulary

Completeness bookkeeping for exhaustive searches. `Complete S P` says that the
set `S` catches every graph of the class `P`, so restricting `S` or refuting
membership in `S` is sound exactly when the class implications hold:

* `Complete.mono` enlarges the enumerated set
* `Complete.of_imp` strengthens the enumerated class
* `Complete.sep` prunes by a class-implied predicate
* `Complete.union` and `Complete.iUnion` join branch enumerations, with
  overlap allowed
* `Complete.cover` wires a class cover to per-branch enumerations
* `Complete.forall_not_of_eq_empty` refutes a class from an empty enumeration

The enumerated object is a set, so branch joins are unions and no decidability
or ordering is carried. The module is premise-free and expects no enumeration
program and no isomorphism quotient. Symmetry reduction needs its own layer.
-/

namespace Ramsey

variable {V : Type*}

/-- `Complete S P`: every graph of the class `P` is a member of the set `S`.
The intended reading is that `S` is the class of graphs an enumeration or
search still catches after its pruning. -/
@[expose] public def Complete (S : Set (SimpleGraph V)) (P : SimpleGraph V → Prop) : Prop :=
  ∀ G, P G → G ∈ S

variable {S S' : Set (SimpleGraph V)} {P Q : SimpleGraph V → Prop}

/-- Completeness survives enlarging the enumerated set. -/
public theorem Complete.mono (h : Complete S P) (hsub : S ⊆ S') : Complete S' P :=
  fun G hG ↦ hsub (h G hG)

/-- Completeness survives strengthening the enumerated class. -/
public theorem Complete.of_imp (himp : ∀ G, Q G → P G) (h : Complete S P) : Complete S Q :=
  fun G hG ↦ h G (himp G hG)

/-- Pruning by a predicate that holds on the whole class keeps completeness. -/
public theorem Complete.sep (h : Complete S P) (hQ : ∀ G, P G → Q G) :
    Complete {G ∈ S | Q G} P :=
  fun G hG ↦ Set.mem_sep (h G hG) (hQ G hG)

/-- Binary branch union. Overlap between the two sets is allowed. -/
public theorem Complete.union {S₁ S₂ : Set (SimpleGraph V)} {P₁ P₂ : SimpleGraph V → Prop}
    (h₁ : Complete S₁ P₁) (h₂ : Complete S₂ P₂) :
    Complete (S₁ ∪ S₂) (fun G ↦ P₁ G ∨ P₂ G) := by
  intro G hG
  rcases hG with hG | hG
  · exact Set.mem_union_left _ (h₁ G hG)
  · exact Set.mem_union_right _ (h₂ G hG)

/-- Indexed branch union. Overlap between the branch sets is allowed. -/
public theorem Complete.iUnion {ι : Sort*} {T : ι → Set (SimpleGraph V)}
    {R : ι → SimpleGraph V → Prop} (h : ∀ i, Complete (T i) (R i)) :
    Complete (⋃ i, T i) (fun G ↦ ∃ i, R i G) := by
  intro G hG
  obtain ⟨i, hi⟩ := hG
  exact Set.mem_iUnion.mpr ⟨i, h i G hi⟩

/-- Branch wiring: a class cover plus one complete enumeration per branch
enumerates the whole class. -/
public theorem Complete.cover {ι : Sort*} {T : ι → Set (SimpleGraph V)}
    {R : ι → SimpleGraph V → Prop} (h : ∀ i, Complete (T i) (R i))
    (hcov : ∀ G, P G → ∃ i, R i G) : Complete (⋃ i, T i) P :=
  (Complete.iUnion h).of_imp hcov

/-- An empty complete enumeration refutes the class. -/
public theorem Complete.forall_not_of_eq_empty (h : Complete S P) (hS : S = ∅) :
    ∀ G, ¬P G := by
  intro G hG
  subst hS
  exact (h G hG).elim
