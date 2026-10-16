module

public import Ramsey.defs.RamseyGraph

/-!
# Trusted premises

The published computational facts the R(5, 5) work leans on, isolated as
named axioms so that `#print axioms` on any downstream theorem reports its
exact trusted-premise chain. This mechanizes the certificate obligation:
any final certificate must identify which inputs are theorem-prover checked
and which rely on published exhaustive computation.

Status labels: every axiom here is **[PUBLISHED]**, used as a trusted input and not re-proved.
The derived census interval theorems below are proved from these inputs.
Sources include Radziszowski, *Small Ramsey Numbers*, DS1 rev. 18,
Exoo 1989, Angeltveit & McKay 2026 / arXiv:2409.15709, and McKay's Ramsey graph data.
The upper bounds and edge extrema cite the sources listed at the end of this file.

Ramsey upper bounds and edge bounds use `RamseyUpperBound`,
`RamseyEdgeLowerBound` and `RamseyEdgeUpperBound` from
`Ramsey.defs.RamseyGraph`. Both edge-bound predicates use real-valued edge
counts. Natural-number conclusions follow by `exact_mod_cast`. Their
`on_finite_type` lemmas transport bounds to any finite vertex type of exactly
the stated order.
Use `RamseyUpperBound.not_isRamseyGraph` to apply an upper bound on any finite
vertex type of at least the stated order.

Deliberately **not** included:

* `R(5, 5) ≤ 46` (order-46 nonexistence) — not needed for the order-43
  target.
* Lower-bound halves of the Ramsey numbers below (witness graphs) — not
  consumed by the planned reductions; the one exception is the 42-vertex
  witness for the final `R(5, 5) = 43` assembly.
-/

@[expose] public section

namespace Ramsey

/-! ### Ramsey numbers -/

/-- `R(4, 3) ≤ 9` [Greenwood & Gleason 1955]. -/
axiom ramsey_4_3_le_9 : RamseyUpperBound 4 3 9

/-- `R(3, 5) ≤ 14` [Greenwood & Gleason 1955]. -/
axiom ramsey_3_5_le_14 : RamseyUpperBound 3 5 14

/-- `R(4, 4) ≤ 18` [Greenwood & Gleason 1955]. -/
axiom ramsey_4_4_le_18 : RamseyUpperBound 4 4 18

/-- `R(4, 5) ≤ 25` [McKay & Radziszowski 1995]. -/
axiom ramsey_4_5_le_25 : RamseyUpperBound 4 5 25

/-! ### Edge extrema of small Ramsey graphs (published censuses) -/

/-- R(4,5,14): e(G) >= 22 [Angeltveit & McKay, arXiv:2409.15709v2, Appendix A, Table 1]. -/
axiom edges_ramsey_4_5_14_ge_22 : RamseyEdgeLowerBound 14 4 5 22

/-- R(4,5,14): e(G) <= 60 [Angeltveit & McKay, arXiv:2409.15709v2, Appendix A, Table 1]. -/
axiom edges_ramsey_4_5_14_le_60 : RamseyEdgeUpperBound 14 4 5 60

/-- R(4,5,18): e(G) >= 50 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_18_ge_50 : RamseyEdgeLowerBound 18 4 5 50

/-- R(4,5,18): e(G) <= 85 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_18_le_85 : RamseyEdgeUpperBound 18 4 5 85

/-- R(4,5,17): e(G) >= 41 [Angeltveit & McKay, arXiv:2409.15709v2, Appendix A, Table 1]. -/
axiom edges_ramsey_4_5_17_ge_41 : RamseyEdgeLowerBound 17 4 5 41

/-- R(4,5,17): e(G) <= 79 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_17 : RamseyEdgeUpperBound 17 4 5 79

/-- R(4,5,24): e(G) >= 116 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_24_ge_116 : RamseyEdgeLowerBound 24 4 5 116

/-- R(4,5,24): e(G) <= 132 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_24_le_132 : RamseyEdgeUpperBound 24 4 5 132

/-- R(4,4,11): e(G) >= 19 [McKay & Radziszowski 1992, Table 1, p. 16, by complement]. -/
axiom edges_ramsey_4_4_11_ge_19 : RamseyEdgeLowerBound 11 4 4 19

/-- R(4,4,11): e(G) <= 36 [McKay & Radziszowski 1992, Table 1, p. 16]. -/
axiom edges_ramsey_4_4_11_le_36 : RamseyEdgeUpperBound 11 4 4 36

/-- R(4,4,12): e(G) >= 26 [McKay & Radziszowski 1992, Table 1, p. 16, by complement]. -/
axiom edges_ramsey_4_4_12_ge_26 : RamseyEdgeLowerBound 12 4 4 26

/-- R(4,4,12): e(G) <= 40 [McKay & Radziszowski 1992, Table 1, p. 16]. -/
axiom edges_ramsey_4_4_12_le_40 : RamseyEdgeUpperBound 12 4 4 40

/-- R(4,4,13): e(G) >= 33 [McKay & Radziszowski 1992, Table 1, p. 16, by complement]. -/
axiom edges_ramsey_4_4_13_ge_33 : RamseyEdgeLowerBound 13 4 4 33

/-- R(4,4,13): e(G) <= 45 [McKay & Radziszowski 1992, Table 1, p. 16]. -/
axiom edges_ramsey_4_4_13_le_45 : RamseyEdgeUpperBound 13 4 4 45

/-- R(4,4,16): e(G) >= 60 [McKay & Radziszowski 1992, Table 1, p. 16, by complement]. -/
axiom edges_ramsey_4_4_16_ge_60 : RamseyEdgeLowerBound 16 4 4 60

/-- R(4,4,16): e(G) <= 60 [McKay & Radziszowski 1992, Table 1, p. 16]. -/
axiom edges_ramsey_4_4_16_le_60 : RamseyEdgeUpperBound 16 4 4 60

/-- R(4,4,17): e(G) >= 68 [McKay & Radziszowski 1992, Table 1, p. 16, by complement]. -/
axiom edges_ramsey_4_4_17_ge_68 : RamseyEdgeLowerBound 17 4 4 68

/-- R(4,4,17): e(G) <= 68 [McKay & Radziszowski 1992, Table 1, p. 16]. -/
axiom edges_ramsey_4_4_17_le_68 : RamseyEdgeUpperBound 17 4 4 68

/-- R(4,4,15): e(G) >= 50 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_15_ge_50 : RamseyEdgeLowerBound 15 4 4 50

/-- R(4,4,15): e(G) <= 55 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_15_le_55 : RamseyEdgeUpperBound 15 4 4 55

/-- R(4,4,14): e(G) >= 41 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_14_ge_41 : RamseyEdgeLowerBound 14 4 4 41

/-- R(4,4,14): e(G) <= 50 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_14_le_50 : RamseyEdgeUpperBound 14 4 4 50


/-- The published order-18 `(4,5)` edge interval, transported to an arbitrary finite type. -/
theorem edges_ramsey_4_5_18_range {V : Type*} [Finite V] (hn : Nat.card V = 18)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    50 ≤ Nat.card G.edgeSet ∧ Nat.card G.edgeSet ≤ 85 := by
  constructor
  · exact_mod_cast edges_ramsey_4_5_18_ge_50.on_finite_type hn G hG
  · exact_mod_cast edges_ramsey_4_5_18_le_85.on_finite_type hn G hG

/-- The published order-24 `(4,5)` edge interval. Complement it before using it on `B`. -/
theorem edges_ramsey_4_5_24_range {V : Type*} [Finite V] (hn : Nat.card V = 24)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    116 ≤ Nat.card G.edgeSet ∧ Nat.card G.edgeSet ≤ 132 := by
  constructor
  · exact_mod_cast edges_ramsey_4_5_24_ge_116.on_finite_type hn G hG
  · exact_mod_cast edges_ramsey_4_5_24_le_132.on_finite_type hn G hG

/-! ### The lower-bound witness -/

/-- R(5,5,42)  [Exoo] -/
axiom exoo_5_5_42 :
    ∃ G : SimpleGraph (Fin 42), IsRamseyGraph 5 5 G

end Ramsey

/-! ### Sources

[Greenwood & Gleason 1955] R. E. Greenwood and A. M. Gleason,
*Combinatorial Relations and Chromatic Graphs*, Canadian Journal of
Mathematics **7** (1955) 1-7, <https://doi.org/10.4153/cjm-1955-001-4>.
Establishes `R(3, 4) = 9`, `R(3, 5) = 14`, and `R(4, 4) = 18`; credited in
Radziszowski, *Small Ramsey Numbers*, DS1 rev. 18, §2.1(b). Supplies
`ramsey_4_3_le_9` (via `R(4, 3) = R(3, 4)`), `ramsey_3_5_le_14`, and
`ramsey_4_4_le_18`. Note: Kéry 1964 is `R(3, 6) = 18`, a different number.

[McKay & Radziszowski 1995] B. D. McKay and S. P. Radziszowski,
*R(4, 5) = 25*, Journal of Graph Theory **19** (1995) 309-322,
<https://doi.org/10.1002/jgt.3190190304>. Supplies `ramsey_4_5_le_25`
(upper-bound credit in DS1 rev. 18, Table Ia [MR4]). The full equality was
later formalized in HOL4 by T. Gauthier and C. E. Brown, *A Formal Proof of
R(4,5)=25*, ITP 2024, <https://doi.org/10.4230/LIPIcs.ITP.2024.16>.

[Angeltveit & McKay 2026] V. Angeltveit and B. D. McKay, *R(5,5) ≤ 46*,
Journal of Graph Theory **112** (2026) 198-208,
<https://doi.org/10.1002/jgt.70029>; open version arXiv:2409.15709v2,
Appendix A, Table 1, a census of R(4,5) giving `e_min`/`e_max` per order:
order 14 gives 22..60, order 17 gives 41..79, order 18 gives 50..85,
and order 24 gives 116..132. Supplies `edges_ramsey_4_5_14_ge_22`,
`edges_ramsey_4_5_14_le_60`, `edges_ramsey_4_5_17_ge_41`, `edges_ramsey_4_5_17`,
`edges_ramsey_4_5_18_ge_50`, `edges_ramsey_4_5_18_le_85`,
`edges_ramsey_4_5_24_ge_116`, and `edges_ramsey_4_5_24_le_132`.

[McKay & Radziszowski 1992] B. D. McKay and S. P. Radziszowski, *A New
Upper Bound for the Ramsey Number R(5,5)*, Australasian Journal of
Combinatorics **5** (1992) 13-20,
<https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>. The complete
enumeration of the `(4, 4)`-Ramsey graphs, credited in DS1 rev. 18 §2.1(d).
Table 1 on printed page 16 supplies maxima for orders 11 through 17.
Complementation gives the minima. The resulting supplied intervals are
order 11: 19..36, order 12: 26..40, order 13: 33..45, order 14: 41..50,
order 15: 50..55, order 16: 60..60, and order 17: 68..68.
The order-14 and order-15 intervals are independently recorded, with counts 130,816 and
640, by C. Calvert, M. J. Schuster, and S. P. Radziszowski, *Computing the
Ramsey Number R(K5-P3,K5)*, arXiv:1203.6536, Table I.
-/
