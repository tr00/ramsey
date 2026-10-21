module

public import Ramsey.theorems.BoundaryProfileOperations

/-!
# Independence of interior names and forgetting order

Any 2 reindexings of the same graph that retain the same labelled boundary have equal profiles.
This includes arbitrary orders of forgetting labels, whose vertex maps are composed bijections.
-/

namespace Ramsey.Boundary

variable {B X Y V : Type*} {p q : ℕ}

/-- A bijection fixing the entire left summand is a bijection of the right summands. -/
private lemma exists_interiorEquiv (e : (B ⊕ X) ≃ (B ⊕ Y))
    (he : ∀ b, e (.inl b) = .inl b) :
    ∃ i : X ≃ Y, e = Equiv.sumCongr (Equiv.refl B) i := by
  classical
  have hr : ∀ x, ∃ y, e (.inr x) = .inr y := by
    intro x
    cases h : e (.inr x) with
    | inl b =>
        have hf := e.injective (h.trans (he b).symm)
        cases hf
    | inr y => exact ⟨y, rfl⟩
  let f : X → Y := fun x ↦ Classical.choose (hr x)
  have hf (x : X) : e (.inr x) = .inr (f x) := Classical.choose_spec (hr x)
  have hi : Function.Injective f := by
    intro x z h
    have hx := e.injective ((hf x).trans ((congrArg Sum.inr h).trans (hf z).symm))
    exact Sum.inr.inj hx
  have hs : Function.Surjective f := by
    intro y
    obtain ⟨v, hv⟩ := e.surjective (.inr y)
    cases v with
    | inl b => cases (he b).symm.trans hv
    | inr x => exact ⟨x, Sum.inr.inj ((hf x).symm.trans hv)⟩
  refine ⟨Equiv.ofBijective f ⟨hi, hs⟩, ?_⟩
  ext v
  cases v with
  | inl b => exact he b
  | inr x => exact hf x

/-- Reindexing vertices while fixing every boundary label leaves the full profile unchanged. -/
public theorem profile_comap_fixedBoundary [Fintype X] [Fintype Y]
    (G : SimpleGraph (B ⊕ Y)) (e : (B ⊕ X) ≃ (B ⊕ Y))
    (he : ∀ b, e (.inl b) = .inl b) :
    profile (G.comap e) p q = profile G p q := by
  obtain ⟨i, rfl⟩ := exists_interiorEquiv e he
  exact relabelInterior_profile G i.symm p q

/-- All reindexings of a fixed graph with the same retained boundary compute the same profile. -/
public theorem profile_eq_of_same_retained_boundary [Fintype X] [Fintype Y]
    (G : SimpleGraph V) (e : (B ⊕ X) ≃ V) (f : (B ⊕ Y) ≃ V)
    (h : ∀ b, e (.inl b) = f (.inl b)) :
    profile (G.comap e) p q = profile (G.comap f) p q := by
  have he : ∀ b, (e.trans f.symm) (.inl b) = .inl b := by
    intro b
    simp [h b]
  have ht := profile_comap_fixedBoundary (p := p) (q := q) (G.comap f) (e.trans f.symm) he
  simpa only [SimpleGraph.comap_comap, Equiv.coe_trans, Function.comp_def,
    Equiv.apply_symm_apply] using ht

end Ramsey.Boundary
