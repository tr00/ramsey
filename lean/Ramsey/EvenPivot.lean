module

public import Ramsey.D18
public import Ramsey.defs.Completeness
public import Mathlib.Combinatorics.SimpleGraph.DegreeSum
public import Mathlib.Tactic.IntervalCases

/-!
# The even-pivot reduction (d18 ∪ d20)

1. a 43-vertex graph has an even-degree vertex (handshaking, Mathlib);
2. the degree frontier `18 ≤ d(v) ≤ 24` (`Ramsey.degree_mem`, from the
   published premise `R(4,5) ≤ 25`) leaves even degrees `{18, 20, 22, 24}`;
3. complementation maps degree `22 ↦ 20` and `24 ↦ 18`, and preserves the
   `(5,5)`-Ramsey property (`Ramsey.isRamseyGraph_compl`).

Consequently the four pivot classes cover the ambient class
(`Ramsey.pivot_cover`): a degree-18 or degree-20 pivot in the graph or in its
complement. Every branch supplies a `Complete` proof of its class
(`Ramsey.complete_pivotSet`); the complement branches inherit theirs from the
self branches by preimage under `G ↦ Gᶜ` (`Ramsey.complete_compl`). The
master reduction `Ramsey.ramsey_5_5_43_of_d18_d20` joins the branch
enumerations with `Complete.cover` and refutes the ambient class with
`Complete.forall_not_of_eq_empty`. The branch obligation remains
`Ramsey.ExcludesDegree d`, now literally the completeness of the empty
enumeration of the degree-`d` pivot class. This reduction is *existence of a
pivot*, not a canonical-pivot tie rule: the branch hypotheses must hold for
every vertex of degree 18 (resp. 20).

Degrees inside classes are stated instance-free through `Ramsey.deg`
(neighbor-set cardinality, equal to `SimpleGraph.degree` under any adjacency
decidability instance), so the `Complete` carrier never carries instance
arguments.

Premise consumption: only the handshaking step is pure Mathlib; everything
else flows through `Ramsey.degree_mem`, which consumes `ramsey_4_5_le_25`
(see `Ramsey/Premises.lean`).
-/

@[expose] public section

namespace Ramsey

/-- Vertex degree as neighbor-set cardinality: instance-free, and equal to
`SimpleGraph.degree` under anelse flows through `Ramsey.degree_mem`, which consumes `ramsey_4_5_le_25`
y adjacency decidability instance
(`deg_eq_degree`). Classes for the `Complete` carrier are stated through
`deg` so that they never carry instance arguments. -/
noncomputable def deg (G : SimpleGraph (Fin 43)) (v : Fin 43) : ℕ :=
  Nat.card ↥(G.neighborSet v)

/-- `deg` agrees with `SimpleGraph.degree` under any adjacency decidability
instance. -/
theorem deg_eq_degree (G : SimpleGraph (Fin 43)) [DecidableRel G.Adj] (v : Fin 43) :
    deg G v = G.degree v := by
  show Nat.card ↥(G.neighborSet v) = G.degree v
  simp only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]

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

/-- The four pivot branches of the even-pivot scheme: pivot degree 18 or 20,
in the graph itself or in its complement. -/
inductive PivotBranch : Type
  | self18 | self20 | compl18 | compl20

/-- The class of branch `b`: 43-vertex `(5,5)`-Ramsey graphs whose pivot
graph (the graph itself on a self branch, its complement on a complement
branch) has a vertex of the branch degree. -/
def PivotClass : PivotBranch → SimpleGraph (Fin 43) → Prop
  | .self18, G => IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = 18
  | .self20, G => IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = 20
  | .compl18, G => IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg Gᶜ v = 18
  | .compl20, G => IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg Gᶜ v = 20

/-- The enumeration set of branch `b`: the empty set on a self branch, its
complement preimage on a complement branch. -/
def PivotSet : PivotBranch → Set (SimpleGraph (Fin 43))
  | .self18 => (∅ : Set (SimpleGraph (Fin 43)))
  | .self20 => (∅ : Set (SimpleGraph (Fin 43)))
  | .compl18 => (fun G ↦ Gᶜ) ⁻¹' (∅ : Set (SimpleGraph (Fin 43)))
  | .compl20 => (fun G ↦ Gᶜ) ⁻¹' (∅ : Set (SimpleGraph (Fin 43)))

/-- Branch hypothesis shape: the pivot branch at degree `d` is excluded, i.e.
the empty set completely enumerates the class of 43-vertex `(5,5)`-Ramsey
graphs with a vertex of degree exactly `d`. Degrees are stated instance-free
through `deg`, so the hypothesis applies to graphs given with any adjacency
decidability instance. -/
abbrev ExcludesDegree (d : ℕ) : Prop :=
  Complete (∅ : Set (SimpleGraph (Fin 43)))
    (fun G ↦ IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = d)

/-- Complement transfer: a complete enumeration of the degree-`d` pivot class
also enumerates the complement-pivot class, by preimage under `G ↦ Gᶜ` (the
complement of a `(5,5)`-Ramsey graph is again `(5,5)`-Ramsey). -/
theorem complete_compl {S : Set (SimpleGraph (Fin 43))} {d : ℕ}
    (h : Complete S (fun G ↦ IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg G v = d)) :
    Complete ((fun G ↦ Gᶜ) ⁻¹' S)
      (fun G ↦ IsRamseyGraph 5 5 G ∧ ∃ v : Fin 43, deg Gᶜ v = d) := by
  intro G hG
  exact Set.mem_preimage.mpr (h Gᶜ ⟨(isRamseyGraph_compl G).mp hG.1, hG.2⟩)

/-- Every pivot branch is completely enumerated: the self branches by their
exclusions, the complement branches by complement transfer. -/
theorem complete_pivotSet (h18 : ExcludesDegree 18) (h20 : ExcludesDegree 20) :
    ∀ b : PivotBranch, Complete (PivotSet b) (PivotClass b) := by
  intro b
  cases b
  · exact h18
  · exact h20
  · exact complete_compl h18
  · exact complete_compl h20

/-- The enumeration set of every branch is empty. -/
theorem pivotSet_eq_empty (b : PivotBranch) : PivotSet b = ∅ := by
  cases b <;> simp [PivotSet]

/-- Pivot selection as a class cover (`../n43/reductions.md` §3): every
43-vertex `(5,5)`-Ramsey graph lies in one of the four pivot classes. -/
theorem pivot_cover (G : SimpleGraph (Fin 43)) [DecidableRel G.Adj]
    (hG : IsRamseyGraph 5 5 G) : ∃ b : PivotBranch, PivotClass b G := by
  rcases exists_degree_18_or_20_up_to_compl G hG with ⟨v, hv | hv⟩ | ⟨v, hv | hv⟩
  · exact ⟨.self18, hG, v, (deg_eq_degree G v).trans hv⟩
  · exact ⟨.self20, hG, v, (deg_eq_degree G v).trans hv⟩
  · exact ⟨.compl18, hG, v, (deg_eq_degree Gᶜ v).trans hv⟩
  · exact ⟨.compl20, hG, v, (deg_eq_degree Gᶜ v).trans hv⟩

/-- **Even-pivot reduction of order 43** (`../n43/reductions.md` §3),
assembled on the `Complete` carrier: a complete enumeration for the d18 case
(`ExcludesDegree 18`) and one for the d20 case (`ExcludesDegree 20`) together
prove the entire order-43 statement — no 43-vertex graph is `(5,5)`-Ramsey.
The four pivot classes cover the ambient class (`pivot_cover`), every branch
set is completely enumerated (`complete_pivotSet`), the union of the branch
sets is empty (`pivotSet_eq_empty`), and `Complete.forall_not_of_eq_empty`
refutes the class. The complement cases `d ∈ {22, 24}` are absorbed because
the complement of a `(5,5)`-Ramsey graph is again `(5,5)`-Ramsey, with
degrees `42 - d`. -/
theorem ramsey_5_5_43_of_d18_d20 (h18 : ExcludesDegree 18) (h20 : ExcludesDegree 20)
    (G : SimpleGraph (Fin 43)) [DecidableRel G.Adj] : ¬ IsRamseyGraph 5 5 G := by
  intro hG
  have hcover : Complete (⋃ b : PivotBranch, PivotSet b) (fun G ↦ IsRamseyGraph 5 5 G) :=
    Complete.cover (complete_pivotSet h18 h20) fun G' hG' ↦ by
      classical
      exact pivot_cover G' hG'
  have hE : (⋃ b : PivotBranch, PivotSet b) = ∅ := by simp [pivotSet_eq_empty]
  exact hcover.forall_not_of_eq_empty hE G hG

/-- The d18 and d20 cases determine the global bound `R(5,5) ≤ 43`: with
`Ramsey.exoo_5_5_42` this is half of `R(5,5) = 43`. -/
theorem ramseyNumber_5_5_le_43_of_d18_d20 (h18 : ExcludesDegree 18)
    (h20 : ExcludesDegree 20) : ramseyNumber 5 5 ≤ 43 :=
  ramseyNumber_le_of_forall fun G => by
    classical
    exact ramsey_5_5_43_of_d18_d20 h18 h20 G

end Ramsey
