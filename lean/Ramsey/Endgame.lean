module

public import Ramsey.Premises

/-!
# Endgame glue

Assembly of `ramseyNumber 5 5 = 43` from an order-43 exclusion and Exoo's
42-vertex witness. Moved out of the root module to keep `Ramsey.lean`
minimal. The public name is unchanged.
-/

@[expose] public section

namespace Ramsey

/-- Endgame glue: the main target and Exoo's 42-vertex witness determine the
Ramsey number. Only the two branch `sorry`s behind `R_5_5_43`
(`Ramsey.d18.excludes`, `Ramsey.d20.excludes`) separate this from a
complete proof of `ramseyNumber 5 5 = 43`. -/
theorem ramsey_5_5_eq_43 (h : ∀ G : SimpleGraph (Fin 43), ¬IsRamseyGraph 5 5 G) :
    ramseyNumber 5 5 = 43 := by
  have hmem : ∀ n : ℕ, (∀ G : SimpleGraph (Fin n), ¬IsRamseyGraph 5 5 G) →
      n ∈ {n | ¬ ∃ G : SimpleGraph (Fin n), IsRamseyGraph 5 5 G} :=
    fun n hn ⟨G, hG⟩ => hn G hG
  refine le_antisymm (Nat.sInf_le (hmem 43 h)) ?_
  by_contra hlt
  have hs := Nat.sInf_mem ⟨43, hmem 43 h⟩
  obtain ⟨G₀, hG₀⟩ := exoo_5_5_42
  have h42 : ramseyNumber 5 5 ≤ 42 := by omega
  have e : Fin (ramseyNumber 5 5) ↪ Fin 42 :=
    ⟨Fin.castLE h42, Fin.castLE_injective h42⟩
  exact hs ⟨G₀.comap e, isRamseyGraph_comap _ e hG₀⟩

end Ramsey
