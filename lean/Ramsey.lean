module

import Mathlib

public import Ramsey.Defs
public import Ramsey.Premises

/-!
# Ramsey

Lean 4 formalizations for the R(5, 5) Ramsey project. This root module
re-exports the core definitions (`Ramsey.Defs`) and the trusted published
premises (`Ramsey.Premises`), and hosts the main proof target `R_5_5_43` and
the endgame glue `ramsey_5_5_eq_43`.

Nothing from `results.md`, `n43/`, or `docs/` is proved here yet.

Build (from this directory):

    lake exe cache get   # fetch prebuilt Mathlib artifacts once
    lake build

Per-file `public import Mathlib.Combinatorics.…` lines are preferred over
the umbrella `import Mathlib` as the collection grows.
-/

@[expose] public section

namespace Ramsey

/-- **Main proof target.** No graph on 43 vertices is both free of a
5-clique and free of an independent 5-set; equivalently, `R(5, 5) ≤ 43`.
Together with `Ramsey.exists_isRamseyGraph_5_5_42` this yields
`R(5, 5) = 43`.

Not proved: this is the statement under attack. The `sorry` is deliberate;
see `README.md` in this directory for the evidence rules that a completed
proof must satisfy (zero `sorry`, standard axioms plus the named premises
of `Ramsey/Premises.lean`). Placed in the root module — above
`Premises` — precisely so that its eventual proof may consume premises
without an import cycle. -/
theorem R_5_5_43 (G : SimpleGraph (Fin 43)) :
    ¬(G.CliqueFree 5 ∧ G.IndepSetFree 5) := by
  sorry

/-- Endgame glue: the main target and Exoo's 42-vertex witness determine the
Ramsey number. Only the `sorry` in `R_5_5_43` separates this from
`ramseyNumber 5 5 = 43`. -/
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
