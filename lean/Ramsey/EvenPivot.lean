module

public import Ramsey.D18
public import Mathlib.Combinatorics.SimpleGraph.DegreeSum
public import Mathlib.Tactic.IntervalCases

/-!
# The even-pivot reduction (d18 ∪ d20)

Root reduction of the order-43 search, formalizing `../n43/reductions.md` §3
("Coverage warning") and `../docs/theory_phase_1.md` §2, second paragraph:

1. a 43-vertex graph has an even-degree vertex (handshaking, Mathlib);
2. the degree frontier `18 ≤ d(v) ≤ 24` (`Ramsey.degree_mem`, from the
   published premise `R(4,5) ≤ 25`) leaves even degrees `{18, 20, 22, 24}`;
3. complementation maps degree `22 ↦ 20` and `24 ↦ 18`, and preserves the
   `(5,5)`-Ramsey property (`Ramsey.isRamseyGraph_compl`).

Consequently `d(v) = 18` and `d(v) = 20` are the only pivot sizes needed, up
to complement: this is `Ramsey.exists_degree_18_or_20_up_to_compl`, and the
master reduction `Ramsey.ramsey_5_5_43_of_d18_d20` assembles a proof of the
d18 case and a proof of the d20 case into the entire order-43 statement.
This reduction is *existence of a pivot*, not a canonical-pivot tie rule:
the branch hypotheses must hold for every vertex of degree 18 (resp. 20).

Premise consumption: only the handshaking step is pure Mathlib; everything
else flows through `Ramsey.degree_mem`, which consumes `ramsey_4_5_le_25`
(see `Ramsey/Premises.lean`). Per
`../docs/proof_review_2026_10_13.md`, "the alternative arbitrary
even-degree pivot split into 18 and 20 is sound", and must not be combined
with the complement-normalized minimum-degree split without a separate
coverage argument (not done here).
-/

@[expose] public section

namespace Ramsey

/-- Complement degrees on 43 vertices: `d_G(v) + d_{Gᶜ}(v) = 42`. -/
theorem degree_add_compl_degree (G : SimpleGraph (Fin 43)) [DecidableRel G.Adj]
    (v : Fin 43) : G.degree v + Gᶜ.degree v = 42 := by
  have hself : v ∉ G.neighborFinset v := by simp
  have hsub : ({v} : Finset (Fin 43)) ⊆ (G.neighborFinset v)ᶜ := by
    rw [Finset.singleton_subset_iff]
    simp
  have hv1 : v ∈ (G.neighborFinset v)ᶜ := Finset.mem_compl.mpr hself
  have hpos : 0 < (G.neighborFinset v)ᶜ.card := Finset.card_pos.mpr ⟨v, hv1⟩
  have hdegc : ((G.neighborFinset v)ᶜ \ {v}).card = Gᶜ.degree v := by
    rw [← SimpleGraph.neighborFinset_compl, SimpleGraph.card_neighborFinset_eq_degree]
  have hdeg : (G.neighborFinset v).card = G.degree v :=
    SimpleGraph.card_neighborFinset_eq_degree _ _
  have h43 : Fintype.card (Fin 43) = 43 := by simp
  have hsplit : ((G.neighborFinset v)ᶜ \ {v}).card = (G.neighborFinset v)ᶜ.card - 1 := by
    rw [Finset.card_sdiff, Finset.singleton_inter_of_mem hv1, Finset.card_singleton]
  have hcomp := Finset.card_compl (s := G.neighborFinset v)
  omega

/-- Handshaking on odd order: a graph on an odd number of vertices has a
vertex of even degree. -/
theorem exists_even_degree {V : Type*} [Fintype V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (hodd : Odd (Fintype.card V)) :
    ∃ v : V, Even (G.degree v) := by
  by_contra hno
  have hall : ∀ v : V, G.degree v % 2 = 1 := by
    intro v
    by_contra hcon
    have h0 : G.degree v % 2 = 0 := by omega
    exact hno ⟨v, Nat.even_iff.mpr h0⟩
  have heven : Even ({v | Odd (G.degree v)} : Finset V).card :=
    G.even_card_odd_degree_vertices
  have hfil : ({v | Odd (G.degree v)} : Finset V) = Finset.univ := by
    ext v
    simp [Nat.odd_iff, hall v]
  rw [hfil, Finset.card_univ] at heven
  rw [Nat.even_iff] at heven
  rw [Nat.odd_iff] at hodd
  omega

/-- Even-pivot root selection (`../n43/reductions.md` §3): a 43-vertex
`(5,5)`-Ramsey graph has, itself or in its complement, a vertex of degree
18 or 20. -/
theorem exists_degree_18_or_20_up_to_compl (G : SimpleGraph (Fin 43))
    [DecidableRel G.Adj] (hG : IsRamseyGraph 5 5 G) :
    (∃ v : Fin 43, G.degree v = 18 ∨ G.degree v = 20) ∨
      (∃ v : Fin 43, Gᶜ.degree v = 18 ∨ Gᶜ.degree v = 20) := by
  obtain ⟨v, hveven⟩ :=
    exists_even_degree G (by rw [Fintype.card_fin, Nat.odd_iff])
  obtain ⟨k, hk⟩ := hveven
  have hrange := degree_mem hG v
  have hb1 : 9 ≤ k := by omega
  have hb2 : k ≤ 12 := by omega
  interval_cases k
  · exact Or.inl ⟨v, by omega⟩
  · exact Or.inl ⟨v, by omega⟩
  · exact Or.inr ⟨v, Or.inr (by have := degree_add_compl_degree G v; omega)⟩
  · exact Or.inr ⟨v, Or.inl (by have := degree_add_compl_degree G v; omega)⟩

/-- Branch hypothesis shape: the pivot branch at degree `d` is excluded, i.e.
no 43-vertex `(5,5)`-Ramsey graph has a vertex of degree exactly `d`. The
instance binder makes the hypothesis available for graphs given with any
adjacency decidability instance (e.g. `classical` downstream). -/
abbrev ExcludesDegree (d : ℕ) : Prop :=
  ∀ G : SimpleGraph (Fin 43), [DecidableRel G.Adj] →
    IsRamseyGraph 5 5 G → ¬ ∃ v : Fin 43, G.degree v = d

/-- **Even-pivot reduction of order 43** (`../n43/reductions.md` §3): a
proof of the d18 case (`ExcludesDegree 18`) and a proof of the d20 case
(`ExcludesDegree 20`) together prove the entire order-43 statement — no
43-vertex graph is `(5,5)`-Ramsey. The complement cases `d ∈ {22, 24}` are
absorbed because the complement of a `(5,5)`-Ramsey graph is again
`(5,5)`-Ramsey, with degrees `42 - d`. -/
theorem ramsey_5_5_43_of_d18_d20 (h18 : ExcludesDegree 18) (h20 : ExcludesDegree 20)
    (G : SimpleGraph (Fin 43)) [DecidableRel G.Adj] : ¬ IsRamseyGraph 5 5 G := by
  intro hG
  have hGc : IsRamseyGraph 5 5 Gᶜ := (isRamseyGraph_compl G).mp hG
  rcases exists_degree_18_or_20_up_to_compl G hG with ⟨v, hv | hv⟩ | ⟨v, hv | hv⟩
  · exact h18 G hG ⟨v, hv⟩
  · exact h20 G hG ⟨v, hv⟩
  · exact h18 Gᶜ hGc ⟨v, hv⟩
  · exact h20 Gᶜ hGc ⟨v, hv⟩

/-- The d18 and d20 cases determine the global bound `R(5,5) ≤ 43`: with
`Ramsey.exoo_5_5_42` this is half of `R(5,5) = 43`. -/
theorem ramseyNumber_5_5_le_43_of_d18_d20 (h18 : ExcludesDegree 18)
    (h20 : ExcludesDegree 20) : ramseyNumber 5 5 ≤ 43 :=
  ramseyNumber_le_of_forall fun G => by
    classical
    exact ramsey_5_5_43_of_d18_d20 h18 h20 G

end Ramsey
