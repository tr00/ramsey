# Independent review: effective-degree rigidity claims at x=137

Date: 2026-10-18.

Claim(s): `n43/d18/x137/effective_anchor.md#claim-x137-low-score`,
`n43/d18/x137/effective_anchor.md#claim-x137-exact-anchor`,
`n43/d18/x137/effective_anchor.md#claim-x137-no-four-transversal`

Author and reviewer: Author and self-auditor Main (task
`x137-effective-anchor-20261018`); reviewer AnchorRigor, an independent
reviewer identity. The author's exact-scalar and fixed-extremal attachment
self-checks are not treated as review evidence.

Reviewed revision: SHA-256 of the exact uncommitted claim-file bytes,
`c33b0d6630873d1f1b9f8e03a7f52166b47b4348a1ce225dd15078c357d49daf`
(`n43/d18/x137/effective_anchor.md`). All checks below were performed against
that revision by re-derivation plus throwaway scripts (arithmetic and an
exhaustive integer sweep); the scripts are checks only, not new evidence.

## Dependencies reviewed

| Dependency | Revision (SHA-256 prefix) | Recorded status | Applicability check |
| --- | --- | --- | --- |
| `n43/d18/frontier_band.md` (exact budgets, four-transversal bound, `#claim-frontier-anchor-defects`) | `cc3bcc50f5d3` | anchor-defects: accepted | Re-derived `k = 2q + E` from `2a + x + 18 = 324 + E`; at x=137 uniquely `(q,E) = (0,1)`, `e(A) = 85`. Four-transversal bound re-derived: `F = A-bar` has `e(F) = 68 <= 70`, `alpha(F) <= 3`; a 3-transversal would give a 15-vertex (4,4)-free `H` with `e(H) >= 50` and each deleted vertex `>= 15 - (R(4,3)-1) = 7` neighbors in `H`, so `e(F) >= 71 > 68`. The argument uses only transversality, so it covers abstract I4-transversals; the `tau = 0` (no-I4) case is subsumed by the same contradiction, consistent with R(4,4)=18. Anchor-defects `e(I,B) >= 36` applies to every independent four-set per its scope, and is re-derived independently in Claim 2 below. |
| `n43/d18/four_column_stability.md#claim-four-column-stability-01` | `71fa0ce84eef` | accepted | Quantifier over abstract transversals confirmed line by line: the proof's first sentence uses actual-column status only to establish that `T` meets every I4; every later step needs only `|T| = 4`, `A-T` (4,4)-free, `e(A) = 85 - q`, and `R(3,4) = 9`. At q=0 the floor is `d_A(t) >= 9`. |
| `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-01` | `e855ca074447` | accepted | Scope explicitly covers "every four-set T of A meeting every I4 of A, whether or not T is an actual B column". Its proof uses `e(A) = 85`, `E(4,4,14) <= 50`, `R(3,4) = 9` and clique/I-obstruction arguments only; no step uses zero global excess (`E=0`) or `x=136`. The claim file's characterization of the floor's needs is accurate. |
| `n43/d18/x136/five_column_compatibility.md#claim-five-columns-core-caps` | `2ac70b04e861` | **ready, Reviews: none** (unreviewed dependency) | Orders 8 and 9 caps (21, 27) re-derived from Turan's K4-free bound (`t_3(8) = 21`, `t_3(9) = 27`). The order-10 cap (31) was re-derived independently in this review (see Claim 1 checks), so no accepted claim here rests on the unreviewed claim's authority. |
| Root `README.md#state-of-the-art` table | `c8f01e2f5077` | external literature premise | `(4,4,n)` maxima at n=11..17 read as 36, 40, 45, 50, 55, 60, 68, matching the claim file's list. Retained as recorded; novelty not rechecked per instructions. Also records `min e(4,4,15) = 50`, `E(4,4,14) = 50`, `E(4,5,17) = 79`, Ramsey values `R(3,4) = 9`, `R(4,3) = 9`, `R(3,5) = 14`, `R(4,4) = 18`, `R(4,5) = 25` as used. |
| Turan's theorem with its standard equality case; Goodman's identity | standard | not recertified here | Turan direction and both equality cases re-derived: `e(A[S]) >= b4(|S|)` uses only I5-freeness of A (no I4 prohibition); equality at j=8 gives complement `= T(8,4)` so `A[S]` is 4 disjoint edges; K4-free H with `e(H) = 27 = t_3(9)` gives `H = K_{3,3,3}`. Goodman's identity re-derived exactly (see Claim 1 checks) and verified numerically on 200 random 10-vertex graphs. |

## Setting checks (shared by all three claims)

- Budgets: `1 = 2q + E` forces `q = 0`, `E = 1`; `e(A) = 85`,
  `sum_A d_A = 170`; unique `p` with `epsilon_p = 1`, all other epsilons 0;
  `sum_A w = 170 - 1 = 169`; `d_B(u) = 17 - w(u)`; `d_G(u) >= 18` follows
  from R(4,5) = 25 (a vertex of degree <= 17 leaves >= 25 nonneighbors
  containing K4 or I5), so epsilons are nonnegative. All verified.
- Ambient types: A is K4/I5-free with I4 allowed; no step of any of the
  three proofs imposes I4-freeness on A (b4 needs only I5-freeness; the type
  and matching arguments use K4-freeness and I5-freeness only). B is
  K5/I4-free; the only clique-size step is in G (four singleton members plus
  their anchor give K5 in G), so B's I4-freeness is not misapplied.
- `w(u) <= 13`: `N_A(u)` is K3-free (K3 plus u is a K4 in A) and I5-free,
  so R(3,5) = 14 gives `d_A(u) <= 13`.
- `b4(j)` for j = 1..10 verified exhaustively as
  `C(j,2) - t_4(j)`: values 0, 0, 0, 0, 1, 2, 3, 4, 6, 8; the j=8
  complement is exactly 4 disjoint edges (script-checked structurally).

## Claim 1: `#claim-x137-low-score`

Checks:

- Algebra: `7ell + 13(18-ell) = 234 - 6ell`; `169 <= 234 - 6ell` gives
  `ell <= 10` (script: max solution 10).
- Supposition `L` transversal: four-transversal bound gives `ell >= 4`
  (re-derived above; applies to abstract transversals at q=0). At `ell = 4`
  the degree floor gives `d_A >= 9`, hence `w >= 9 - 1 = 8 > 7` (uses
  `epsilon <= E = 1`), contradicting `u in L`. So `5 <= ell <= 10`.
- `H = A-L` is K4-free as a subset of A and I4-free because L is a
  transversal. `e(H) = 85 - sum_L d_A + e(A[L]) >= 84 - 7ell + b4(ell)`
  with `sum_L d_A <= 7ell + 1` (since `sum_L epsilon <= 1`).
- Table (script-verified both columns; uppers from the README (4,4,n)
  maxima at orders 11-13 and core caps at 8-10):
  ell=5: lb 50 > 45 (order 13); ell=6: 44 > 40 (12); ell=7: 38 > 36 (11);
  ell=8: 32 > 31 (10); ell=9: 27 = 27 (9); ell=10: 22 > 21 (8).
  Only ell=9 survives.
- Equality case: `e(H) = 85 - s + a = 27` with `s <= 64`, `a >= 6` has the
  unique solution `s = sum_L d_A = 64`, `a = e(A[L]) = 6` (exhaustive in
  script). Hence `sum_L epsilon = 1`, every L weight is 7, and Turan
  equality on the K4-free order-9 H with 27 edges gives `H = K_{3,3,3}`
  (`t_3(9) = 27`).
- `e(L,H) = 64 - 2*6 = 52` (handshake split over L, H).
- K_{3,3,3} neighborhood-type argument re-derived:
  - An L vertex with a neighbor in each of the 3 parts is adjacent to a
    cross-part triangle, giving a K4 with that vertex (A is K4-free). So
    its neighbors lie in at most 2 parts; H-degree <= 6, and degree 6
    means exactly two whole parts (3 types).
  - Two same-type L vertices: if adjacent, their common H-neighborhood
    contains a cross-part edge, completing a K4 (all four vertices lie in
    A); if nonadjacent, together with the omitted part — independent in
    H and anticomplete to both — they form an I5 in A. Either is
    impossible, so each type occurs at most once.
  - Therefore at most 3 of the 9 L vertices have H-degree 6 and the other
    6 have H-degree at most 5, giving `e(L,H) <= 3*6 + 6*5 = 48 < 52`
    (script-verified). Contradiction removes the only equality case.
- Ten-vertex cap derivation (Setting section), verified in detail as
  coordinator requested:
  - Both f slots are valid upper bounds on `e(N_H(v))`: H K4-free makes
    `N_H(v)` triangle-free (Mantel slot `floor(d^2/4)`); the same
    triangle-free property makes any vertex's neighborhood-within-`N_H(v)`
    independent, so 4 such neighbors would be an I4 in H, bounding maximum
    degree by 3 and giving `floor(3d/2)`. Both slots hold, so the `min`
    direction is safe. On the complement side H I4-free gives H-bar
    K4-free (triangle-free complement neighborhoods) and H K4-free gives
    H-bar I4-free (I4 in H-bar iff K4 in H), so `f(9-d)` is valid by the
    same two slots.
  - Goodman step re-derived exactly, not by inspection: a triple is
    non-homogeneous iff it has exactly 1 or exactly 2 edges; it is then
    counted at exactly its two vertices that see one neighbor and one
    nonneighbor in the triple. Since `d(u)(9-d(u))` counts, for each u,
    exactly the triples `{u,y,z}` with `y ~ u`, `z !~ u`,
    `sum_u d(u)(9-d(u)) = 2 * (#non-homogeneous)`, hence
    `t + i3 = C(10,3) - (1/2) sum d(u)(9-d(u))`. With
    `3t <= sum f(d)` and `3i3 <= sum f(9-d)` this rearranges to
    `3*C(10,3) <= sum g(d)`, `g(d) = f(d) + f(9-d) + (3/2)d(9-d)`.
    The identity was also checked on 200 random 10-vertex graphs.
  - Degree range `1 <= d <= 8`: `d <= 8` from `N_H(v)` triangle-free and
    I4-free with R(3,4) = 9; `d >= 1` because the antineighborhood is
    K4-free (subset) and I3-free (plus v it would be an I4), so has order
    at most 8 by R(4,3) = 9. No d=0 or d=9 vertex can occur; even the
    edge values are safe: `g(0) = 13 <= 74`, `g(9) + 54 = 67 <= 74`
    (script-checked).
  - Per-digit inequality verified exhaustively for d = 1..8:
    `g(d) + 6d` = 30, 44, 56, 64, 70, 74, 74, 72, all `<= 74`
    (equality only at d=6,7). Hence
    `360 <= sum g(d) <= 740 - 12 e(H)`, so `e(H) <= 95/3`, integer cap 31;
    `740 - 12*31 = 368 >= 360` and `740 - 12*32 = 356 < 360` (script).
    Turan alone would give 33 at order 10, so the Goodman route is
    genuinely needed and matches the core-cap row m=10 (a=6, c=74).
  - The m=8, m=9 core-cap rows also recompute from the core-cap formula
    ((8*42 - 168)/8 = 21, (9*43 - 252)/5 = 27), agreeing with Turan.
- Dependency applicability: upper bounds at orders 11, 12, 13 taken from
  the recorded literature table (retained, not rechecked); orders 8-10
  re-derived here; K4/I4-freeness of H is exactly what those bounds
  require (H inherits I4-freeness from transversality).
- Quantifiers/scope: proof is uniform in the rooted (G,v); conclusion is
  the stated existential ("some independent four-set disjoint from L").
- Search use: `none pending independent review` is accurate; the
  Consequences section claims no closure and states the branch remains
  open.

Findings: no gap found; the argument re-derives cleanly. Two minor
presentation notes only: (a) the `w <= 13` input and the R(3,5) route are
stated in the Setting, so the table derivation's per-row steps are correct
as written; (b) the K_{3,3,3} type argument needs the fact that parts of
`K_{3,3,3}` are independent in H (for the I5 case) and that cross-part
pairs are edges (for the K4 case) — both are the standard structure of the
Turan graph and are used correctly.

Outcome: **accepted** — every scalar entry, both equality cases, the type
argument, and the supporting cap derivations were independently re-derived
and script-verified.

## Claim 2: `#claim-x137-exact-anchor`

Checks:

- Anchor selection: claim 1 supplies an I4 disjoint from L, so each of its
  weights is `>= 8`; `sum_I w <= 32` from `e(I,B) >= 36` via
  `e(I,B) = 68 - sum_I w`. Dependency applicability: the anchor-defects
  claim's scope covers every independent four-set in A at any q, and the
  needed `e(I,B) >= 36` is re-derived independently below, so acceptance
  does not hinge on that dependency. Four weights `>= 8` with sum `<= 32`
  force all exactly 8, hence `d_B = 17 - 8 = 9` per anchor and
  `e(I,B) = 36`.
- Transversality of every column: a column missing I would give I5 with
  its B endpoint. Exact singleton class `{a}`: two nonadjacent members
  together with `I - {a}` give I5, so the class is a clique; four members
  plus `a` give K5, so the class has size at most 3.
- Counting: `36 >= n1 + 2(24 - n1) = 48 - n1 >= 36` forces `n1 = 12`
  (exhaustive check: only n1 = 12 satisfies both ends with `n1 <= 12`).
  Equality then forces: 4 classes of size exactly 3 (4 classes, each <= 3,
  total 12), and the remaining 12 columns have signature exactly 2 (their
  24 incidences average 2 with each `>= 2`); no larger signatures. Column
  count `12 + 12 = 24` checks.
- Per-anchor incidences: `d_B = 9 = 3 singleton + 6 double`; cross-check
  `24 double incidences / 4 anchors = 6` (script).
- A-degrees: `epsilon_p = 1` and `w(p) = 8` give `d_A(p) = 9`; epsilons
  vanish on I when p is absent, giving `d_A = 8` for all four (script
  identity `9 + 8*3 = 33` used again in claim 3).
- Quantifiers: conclusion is existential (there exists such an anchor I)
  and independent of which anchor contains p, matching the proof's
  "choose I disjoint from L". The proof records the disjointness choice
  that claim 3 later reuses; the conclusion line does not restate it, but
  the construction carries it — not a gap.
- Search use and Consequences: no branch closure claimed; conditional
  wording ("would supply", "would exclude") throughout.

Findings: no gap found; the count chain, its equality forcing, and the
p-vs-not-p degree conclusions all re-derive exactly as stated.

Outcome: **accepted**.

## Claim 3: `#claim-x137-no-four-transversal`

Checks:

- Degree floor on the abstract transversal T: both cited sources verified
  to cover abstract four-set transversals at q=0 (see dependency table);
  the r2 claim's proof was checked step by step for hidden reliance on
  E=0 — none exists (only `e(A) = 85`, `E(4,4,14) <= 50`, `R(3,4) = 9`).
  So every T member has `d_A >= 9`.
- `T` meets the claim-2 anchor I; members of I have `d_A = 8` except
  possibly p (`d_A = 9`), so necessarily `p in T intersect I` (if p were
  absent from I, no I vertex could meet T at all) and `d_A(p) = 9`.
- `L intersect I = empty` by I's construction, so `p notin L`, so every
  L vertex has epsilon 0 and `d_A <= 7`. This fact is used in the degree
  sum and its justification is stated a few sentences later; its premises
  (`p in I`, `L intersect I = empty`) appear before the sum, so the
  argument is complete, merely forward-referenced — presentation note
  only, not a gap.
- Degree sum (script-verified): `7ell + 33 + 13(14-ell) = 215 - 6ell`;
  `170 <= 215 - 6ell` gives `ell <= 7` (max solution 7); set sizes
  `|A - L - I| = 18 - ell - 4 = 14 - ell` check.
- `L union {p}` transversal: an independent J disjoint from it has all
  weights `>= 8`, hence all exactly 8 by `sum <= 32`; p absent from J
  makes all its A-degrees 8, so J (an I4) would miss T (members >= 9),
  contradicting transversality. Re-verified.
- `K = A - (L union {p})`, order `17 - ell`: K4-free as a subset of A,
  I4-free because `L union {p}` is a transversal. Identity
  `e(K) = 85 - sum_L d_A - d_A(p) + e(A[L union {p}])` re-derived from
  the edge split; with `sum_L d_A <= 7ell`, `d_A(p) = 9`,
  `e(A[L union {p}]) >= b4(ell+1)` this gives `>= 76 - 7ell + b4(ell+1)`.
- Table (script-verified; uppers from README maxima at orders 11-17 and
  core cap at 10): ell=0: 76 > 68; 1: 69 > 60; 2: 62 > 55; 3: 55 > 50;
  4: 49 > 45; 5: 43 > 40; 6: 37 > 36; 7: 31 = 31 (order 10). Only ell=7
  survives; all ell in 0..7 are covered (ell >= 0 trivially).
- Equality case at ell=7 (script-verified unique): `e(K) = 85 - s - 9 + a
  = 31` with `s <= 49`, `a >= 4` forces `s = sum_L d_A = 49` (all seven L
  degrees exactly 7) and `a = e(A[L union {p}]) = 4 = b4(8)`. Turan
  equality makes the 8-vertex induced graph the complement of T(8,4),
  i.e. 4 disjoint edges (script-checked structure), so p has exactly one
  neighbor in L, hence `d_K(p) = 9 - 1 = 8`; `|K| = 10` leaves exactly
  `10 - 8 = 2` nonneighbors of p in K. But `I - {p}` is 3 vertices
  contained in K (L misses I, p removed), all nonadjacent to p since I is
  independent: `3 > 2`, contradiction (script).
- Final steps: no size-4 transversal exists; the four-transversal bound
  excludes sizes below 4, so `tau(I4(A)) >= 5`; every actual column C_y is
  a transversal (a missed I4 plus y in B gives I5), so `|C_y| >= 5`.
- Quantifiers: scope says "every abstract I4-transversal" and the proof
  supposes an arbitrary such T — abstract/actual distinction is stated
  correctly in the conclusion.
- Search use: `none pending independent review`; Consequences are
  conditional ("would exclude", "would be") and explicitly disclaim any
  branch or order-43 closure. Profile bookkeeping spot-checked: with r=0
  and all 24 columns of size >= 5, `sum c_y = 137` gives
  `sum (c_y - 5) = 17`, hence `H = 17 - (24 - s) = s - 7`, matching the
  branch README's `H = -7 + 2r + s` at r=0 and its recorded r0 range
  `s7..10` (the s <= 10 end is inherited branch bookkeeping, see Limits).

Findings: no gap found; the `L union {p}` transversal step, both scalar
tables' surviving rows, the unique equality case, and the final
nonneighbor-count contradiction all re-derive exactly. Two presentation
notes recorded above (forward-referenced `p notin L` justification; the
anchor I's disjointness carried from claim 2's construction).

Outcome: **accepted**.

## Limits

- External premises retained as recorded, not rechecked: the published
  (4,4,n) extrema for n = 11..17 (McKay-Radziszowski 1992 via root README),
  `min e(4,4,15) = 50`, `E(4,4,14) = 50`, `E(4,5,17) = 79`, `E(4,5,14) = 60`
  (used only inside the accepted anchor-defects claim), and the Ramsey
  values. Novelty was not reviewed.
- `#claim-five-columns-core-caps` is itself `ready` with no reviews; this
  review independently re-derived its m=10 row (the only one needed beyond
  Turan), so the accepted claims do not rest on it, but that claim remains
  unreviewed for its other rows and its own proposers.
- The Consequences profile's `s <= 10` upper end and the `s7..10` r0 range
  are pre-existing branch bookkeeping recorded in `n43/d18/x137/README.md`;
  only the identity `H = s - 7` at r=0 was re-derived here.
- This review certifies the three local deductions at the stated SHA-256
  only. A proof change requires renewed review. No claim-state flip, search
  use change, branch closure, or order-43 conclusion is implied; state
  updates remain with the coordinator.
