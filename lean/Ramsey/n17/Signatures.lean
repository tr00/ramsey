module

public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Tactic.NormNum

/-!
# Incidence rigidity for a Wagner neighborhood

Exact pair incidences determine the 8 outside neighborhood signatures.
-/

namespace Ramsey.n17

open scoped BigOperators

/-- The possible 4-neighbor signatures with no independent triple in their complement. -/
@[expose] public def signatureMask : Fin 38 → ℕ := ![15, 23, 29, 30, 39, 46, 51, 57, 58, 60, 71, 78, 85, 92, 102, 113, 114, 116, 120, 135, 139, 142, 147, 153, 156, 163, 170, 184, 195, 197, 201, 204, 209, 225, 226, 228, 232, 240]

/-- The subset represented by a signature mask. -/
@[expose] public def signatureSet (k : Fin 38) : Finset (Fin 8) :=
  Finset.univ.filter (fun i ↦ (signatureMask k).testBit i.val)

/-- Signature membership agrees with the binary digit formula. -/
public theorem mem_signatureSet_iff (k : Fin 38) (i : Fin 8) :
    i ∈ signatureSet k ↔ (signatureMask k / 2 ^ i.val) % 2 = 1 := by
  revert k i
  decide

/-- The 1st cyclic family of outside signatures. -/
@[expose] public def leftSignatureCounts : Fin 38 → ℕ := ![0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0]

/-- The reflected cyclic family of outside signatures. -/
@[expose] public def rightSignatureCounts : Fin 38 → ℕ := ![0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0]

/-- The common outside-neighbor budget of a pair in the Wagner neighborhood. -/
@[expose] public def signaturePairBudget (i j : Fin 8) : ℕ :=
  if (j.val + 8 - i.val) % 8 = 3 ∨ (j.val + 8 - i.val) % 8 = 5 then 1 else 2

/-- Expands a signature sum once before reducing its numerical coefficients. -/
private lemma sum_signature_indices (f : Fin 38 → ℕ) :
    ∑ k, f k = f 0 + f 1 + f 2 + f 3 + f 4 + f 5 + f 6 + f 7 + f 8 + f 9 + f 10 + f 11 + f 12 + f 13 + f 14 + f 15 + f 16 + f 17 + f 18 + f 19 + f 20 + f 21 + f 22 + f 23 + f 24 + f 25 + f 26 + f 27 + f 28 + f 29 + f 30 + f 31 + f 32 + f 33 + f 34 + f 35 + f 36 + f 37 := by
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, add_zero, ← add_assoc]
  rfl

set_option maxHeartbeats 1000000 in
/-- The pair budgets force one of the 2 cyclic signature families. -/
public theorem signature_counts_classification (c : Fin 38 → ℕ)
    (htotal : ∑ k, c k = 8)
    (hpairs : ∀ i j : Fin 8, i < j →
      (∑ k, if (signatureMask k / 2 ^ i.val) % 2 = 1 ∧
        (signatureMask k / 2 ^ j.val) % 2 = 1 then c k else 0) =
          signaturePairBudget i j) :
    c = leftSignatureCounts ∨ c = rightSignatureCounts := by
  simp only [Fin.forall_fin_succ] at hpairs
  norm_num [sum_signature_indices, signatureMask, signaturePairBudget] at htotal hpairs
  by_cases hc : c 1 = 0
  · right
    simp only [funext_iff, Fin.forall_fin_succ]
    norm_num [rightSignatureCounts]
    lia (splits := 40)
  · left
    simp only [funext_iff, Fin.forall_fin_succ]
    norm_num [leftSignatureCounts]
    lia (splits := 40)

end Ramsey.n17
