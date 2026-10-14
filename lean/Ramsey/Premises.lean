module

public import Ramsey.Defs

/-!
# Trusted premises

The published computational facts the R(5, 5) work leans on, isolated as
named axioms so that `#print axioms` on any downstream theorem reports its
exact trusted-premise chain. This mechanizes the certificate obligation of
`../n43/reductions.md` §15: any final certificate must identify which inputs
are theorem-prover checked and which rely on published exhaustive
computation.

Status labels: every declaration here is **[PUBLISHED]** — established
literature or published exhaustive computation, used as a trusted premise,
not re-proved. Sources: `../docs/mathematical_baseline.md` and its
bibliography (Radziszowski, *Small Ramsey Numbers*, DS1 rev. 18; Exoo 1989;
Angeltveit & McKay 2026 / arXiv:2409.15709; McKay's Ramsey graph data);
the upper bounds and the edge extrema cite sources listed at the end of
this file.

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
axiom ramsey_4_3_le_9 {V : Type*} [Finite V] (h : 9 ≤ Nat.card V)
    (G : SimpleGraph V) : ¬IsRamseyGraph 4 3 G

/-- `R(3, 5) ≤ 14` [Greenwood & Gleason 1955]. -/
axiom ramsey_3_5_le_14 {V : Type*} [Finite V] (h : 14 ≤ Nat.card V)
    (G : SimpleGraph V) : ¬IsRamseyGraph 3 5 G

/-- `R(4, 4) ≤ 18` [Greenwood & Gleason 1955]. -/
axiom ramsey_4_4_le_18 {V : Type*} [Finite V] (h : 18 ≤ Nat.card V)
    (G : SimpleGraph V) : ¬IsRamseyGraph 4 4 G

/-- `R(4, 5) ≤ 25` [McKay & Radziszowski 1995]. -/
axiom ramsey_4_5_le_25 {V : Type*} [Finite V] (h : 25 ≤ Nat.card V)
    (G : SimpleGraph V) : ¬IsRamseyGraph 4 5 G

/-! ### Edge extrema of small Ramsey graphs (published censuses) -/

/-- R(4,5,18): e(G) >= 50 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_18_ge_50 {V : Type*} [Finite V] (h : Nat.card V = 18)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    50 ≤ Nat.card G.edgeSet

/-- R(4,5,18): e(G) <= 85 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_18_le_85 {V : Type*} [Finite V] (h : Nat.card V = 18)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    Nat.card G.edgeSet ≤ 85

/-- R(4,5,17): e(G) <= 79 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_17 {V : Type*} [Finite V] (h : Nat.card V = 17)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    Nat.card G.edgeSet ≤ 79

/-- R(4,5,24): e(G) >= 116 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_24_ge_116 {V : Type*} [Finite V] (h : Nat.card V = 24)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    116 ≤ Nat.card G.edgeSet

/-- R(4,5,24): e(G) <= 132 [Angeltveit & McKay 2026]. -/
axiom edges_ramsey_4_5_24_le_132 {V : Type*} [Finite V] (h : Nat.card V = 24)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 5 G) :
    Nat.card G.edgeSet ≤ 132

/-- R(4,4,15): e(G) >= 50 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_15_ge_50 {V : Type*} [Finite V] (h : Nat.card V = 15)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 4 G) :
    50 ≤ Nat.card G.edgeSet

/-- R(4,4,15): e(G) <= 55 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_15_le_55 {V : Type*} [Finite V] (h : Nat.card V = 15)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 4 G) :
    Nat.card G.edgeSet ≤ 55

/-- R(4,4,14): e(G) >= 41 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_14_ge_41 {V : Type*} [Finite V] (h : Nat.card V = 14)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 4 G) :
    41 ≤ Nat.card G.edgeSet

/-- R(4,4,14): e(G) <= 50 [McKay & Radziszowski 1992]. -/
axiom edges_ramsey_4_4_14_le_50 {V : Type*} [Finite V] (h : Nat.card V = 14)
    (G : SimpleGraph V) (hG : IsRamseyGraph 4 4 G) :
    Nat.card G.edgeSet ≤ 50

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
order 17 gives 41..79, order 18 gives 50..85, order 24 gives 116..132.
Supplies `edges_ramsey_4_5_17`, `edges_ramsey_4_5_18_ge_50`,
`edges_ramsey_4_5_18_le_85`, `edges_ramsey_4_5_24_ge_116`, and
`edges_ramsey_4_5_24_le_132`.

[McKay & Radziszowski 1992] B. D. McKay and S. P. Radziszowski, *A New
Upper Bound for the Ramsey Number R(5,5)*, Australasian Journal of
Combinatorics **5** (1992) 13-20,
<https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>. The complete
enumeration of the `(4, 4)`-Ramsey graphs, credited in DS1 rev. 18 §2.1(d);
supplies the order-14 interval 41..50 and the order-15 interval 50..55.
Independently recorded, with the same intervals and the counts 130,816 and
640, by C. Calvert, M. J. Schuster, and S. P. Radziszowski, *Computing the
Ramsey Number R(K5-P3,K5)*, arXiv:1203.6536, Table I.
-/
