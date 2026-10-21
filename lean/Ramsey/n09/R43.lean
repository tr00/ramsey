module

public import Ramsey.n04.R42
public import Ramsey.n06.R33
public import Mathlib.Combinatorics.SimpleGraph.DegreeSum

/-!
# The bound R(4,3) ≤ 9

A hypothetical (4,3)-Ramsey graph on 9 vertices has degree 5 at every vertex.
The degree sum 45 contradicts the handshaking identity.
-/

namespace Ramsey

/-- Every graph on 9 vertices has a 4-clique or an independent triple. -/
public theorem ramsey_4_3_le_9 : RamseyUpperBound 4 3 9 := by
  classical
  intro G hG
  have hdegree : ∀ v : Fin 9, G.degree v = 5 := by
    intro v
    have hN := ramsey_3_3_le_6.card_neighborSet_lt hG v
    have hM := ramsey_4_2_le_4.compl.card_neighborSet_lt
      ((isRamseyGraph_compl G).mp hG) v
    have hsum := card_neighborSet_add_antiNeighborSet G v
    rw [antiNeighborSet_eq_compl] at hsum
    simp only [Nat.card_fin] at hsum
    have hcard : Nat.card (G.neighborSet v) = G.degree v := by
      simp only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree]
    omega
  have hsum := G.sum_degrees_eq_twice_card_edges
  simp only [hdegree, Finset.sum_const, Finset.card_univ, Fintype.card_fin, smul_eq_mul]
    at hsum
  omega

end Ramsey
