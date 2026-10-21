module

public import Ramsey.defs.RamseyGraph
public import Ramsey.defs.Transversals
public import Ramsey.Premises

/-!
# The degree-18 frontier

First premise-consuming layer. The premise-free neighborhood and antineighborhood
transfer lemmas live in `Ramsey.defs.RamseyGraph` and `Ramsey.defs.Transversals`.
On top of the named premises, this module proves for a `(5,5)`-Ramsey graph `G`:

* `18 ≤ d(v) ≤ 24` on 43 vertices (`degree_mem`), from `R(4,5) ≤ 25` and its
  complement form `ramsey_5_4_le_25`
* adjacent vertices have at most `13` common neighbors
  (`card_commonNeighbors_le_13`), from `R(3,5) ≤ 14`
-/

namespace Ramsey

variable {V : Type*}

/-- `R(5,4) ≤ 25`, derived from `ramsey_4_5_le_25` by complement symmetry. -/
public theorem ramsey_5_4_le_25 : RamseyUpperBound 5 4 25 :=
  ramsey_4_5_le_25.compl

/-- Degree bound from `R(4,5) ≤ 25`: `d(v) ≤ 24`. -/
public theorem degree_le_24 {G : SimpleGraph V} [Fintype V] [DecidableRel G.Adj]
    (hG : IsRamseyGraph 5 5 G) (v : V) : G.degree v ≤ 24 := by
  by_contra hlt
  exact ramsey_4_5_le_25.not_isRamseyGraph (by
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
    omega) _ (isRamseyGraph_induce_neighborSet hG v)

/-- The degree frontier on 43 vertices: `18 ≤ d(v) ≤ 24`. -/
public theorem degree_mem {G : SimpleGraph (Fin 43)} [DecidableRel G.Adj]
    (hG : IsRamseyGraph 5 5 G) (v : Fin 43) :
    18 ≤ G.degree v ∧ G.degree v ≤ 24 := by
  refine ⟨?_, degree_le_24 hG v⟩
  by_contra hlt
  have hsplit := card_neighborSet_add_antiNeighborSet G v
  rw [Nat.card_fin] at hsplit
  have hdeg : G.degree v = Nat.card ↥(G.neighborSet v) := by
    rw [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
  have h25 : 25 ≤ Nat.card ↥(antiNeighborSet G v) := by omega
  exact ramsey_5_4_le_25.not_isRamseyGraph h25 (G.induce (antiNeighborSet G v))
    (isRamseyGraph_induce_antiNeighborSet hG v)

/-- Adjacent vertices have at most `13` common neighbors (`R(3,5) ≤ 14`). -/
public theorem card_commonNeighbors_le_13 {G : SimpleGraph V} [Finite V]
    (hG : IsRamseyGraph 5 5 G) {v w : V} (hvw : G.Adj v w) :
    Nat.card ↥(G.commonNeighbors v w) ≤ 13 := by
  by_contra hlt
  exact ramsey_3_5_le_14.not_isRamseyGraph (by omega) _
    (isRamseyGraph_induce_commonNeighbors hG hvw)

end Ramsey
