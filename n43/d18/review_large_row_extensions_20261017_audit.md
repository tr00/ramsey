# Independent audit of large-row attachment reductions

Date: 2026-10-17. Reviewer: `LargeRowAudit`. Author: `LargeRowResearch`.
Owned path: this file only.

## Claim(s) and exact revisions

Source: `n43/d18/large_row_extensions.md`

- Reviewed revision SHA-256
  `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`
  (494 lines). This replaces the originally submitted revision SHA-256
  `f0d6eac70d4f06b9aa7ad4e2d72079d60a577058429ef1bf659729e55748db35`
  (495 lines).
- The sole change between the two revisions is the closing paragraph of
  Claim `#claim-seventeen-codegree-moments` (old lines 94-97, new lines
  94-96): the conditional sentence referring to "a degree-18 ambient
  boundary ... as in the independent row analysis" (retired x287 draft
  context) is replaced by the general statement that the moment
  restrictions apply simultaneously to any two triangle-free eight-subsets
  of H, with no incompatibility of any specified overlap pattern asserted.
  I re-read the full revised file against my complete read of the prior
  revision: no other line differs; the line-count delta is exactly the
  one-sentence replacement. No reference to `287`, to the retired draft,
  or to any x136-tail statement remains; the x136 closure is explicitly
  disclaimed at lines 19-21.

Claims reviewed, each at the reviewed revision above:

1. `#claim-seventeen-codegree-moments`
2. `#claim-seventeen-extension-domain`
3. `#claim-two-seventeen-core-balance`
4. `#claim-common-eight-classification`
5. `#claim-sixteen-signature-reduction`
6. `#claim-large-row-ambient-lifting`

Author and reviewer are distinct; no author self-check is treated as a
review (the author's trailing scalar audit remains a self-check).

## Dependencies reviewed

- `anchored_cell_averaging.md#claim-cell-saturation` — state accepted,
  reviewed by `review_audit_pending_averaging_20261015.md`. Supplies
  8-regularity of the 17-core, degrees 7/8 on 16-vertex rows, degrees
  2/3 on (3,4)-free 8-vertex cells. I re-derived the two facts used here
  directly from R(3,4)=9 and R(3,3)=6 (see checks), so the dependency is
  applicable and its use is narrower than its full statement.
- `averaging_future_work.md#claim-averaging-adjacent-sixteen-rows` — state
  accepted, same review link. Supplies |R_u cap R_w| = 8, |X| = |Y| = 8,
  S = (3,4)-free for adjacent size-16 rows. I re-derived the overlap bound
  (adjacent roots: intersection is triangle-free via K5 through the two
  roots, I4-free via I5 through v, hence <= 8 by R(3,4)=9; pigeonhole
  gives >= 8).
- Ramsey inputs R(4,4)=18, R(3,4)=9, R(3,3)=6 — standard, used only as
  equalities/bounds as stated.
- Scope premise `epsilon in {0,...,6}` (global degree interval 18..24):
  a recorded external branch premise, used in Claim 1's `d_A(u)=epsilon_u<=6`,
  Claim 4's `|C_s| >= 4/5`, `|C_x|` budgets, `d_A(u)=1+epsilon_u`, and
  Claim 5's degree equations. The note states it as retained scope and
  does not re-derive it; I do not re-derive it either. It is independent
  of the x136 closure.
- Census premises are NOT used by any proved claim: the unique-17-core
  census and `E(4,5,18)=85` appear only as explicitly non-acquired
  optional replacements. `q=85-e(A)` and `x` in Claim 5 are declared
  unfixed quantities matching the repository convention (verified against
  `cliques_augmentation.md`, `frontier_band.md`).

## Checks performed (independently rederived)

1. **Ambient types from first principles.** A = N(v) is K4-free (v extends
   a K4 to K5) and I5-free (inherited); B = M(v) is K5-free (inherited)
   and I4-free (v extends an I4 to I5). For adjacent roots a,b the cell
   B[R_a cap R_b] is triangle-free (two roots plus a triangle give K5)
   and I4-free (v plus the I4 give I5), so R(3,4)=9 bounds it by 8.
   For a (4,4)-free 17-vertex graph H and any vertex v: N(v) is
   triangle-free (a triangle there plus v would be a K4) and I4-free, hence
   (3,4)-free of order at most 8 by R(3,4)=9; the antineighborhood is
   K4-free and has no I3 (an independent triple there together with v would be an I4), hence (4,3)-free
   of order at most 8. The two orders sum to 16, so both equal 8:
   every degree is exactly 8, e = 68, nonedges = 68. All of the note's standing
   hypotheses used below follow without census input.
2. **Claim 1 (SRG/moments).** Edge codegree <= 3 (common neighborhood
   independent, I4-free); nonedge common nonneighborhood is a clique of
   order <= 3 and has order `c-1` for common-neighbor count c, so c <= 4.
   `17*C(8,2) = 476 = 68*3 + 68*4` saturates both bounds, giving
   SRG(17,8,3,4). Moment identities rederived symbolically: summing
   degrees over U gives `sum h_t = 8r-2e`; summing pair codegrees
   `4*C(r,2)-e` and subtracting in-U common neighbors
   `sum_s C(d_s,2)` gives the second identity. Numeric audit of the
   table: (e,n2,sum h,sum C(h,2)) = (10,4,44,86), (11,2,42,81),
   (12,0,40,76) — all reproduced. S10 rigidity: sum h^2 = 216,
   `sum (h-4)(h-5) = 216-396+180 = 0`, integrality forces h in {4,5}
   with multiplicities (8,1), so H-U has degrees (4,3^8); edge
   conservation 10+44+14 = 68 confirms. The revised final sentence is
   correct: moment tables apply to any two triangle-free 8-subsets at
   once, and no overlap incompatibility is claimed.
3. **Claim 2 (17-row extension).** The seven-clause criterion is exact by
   the forbidden-set split: K5 by W-count 0..5 gives (H has no K4) then
   the edge/triangle/K4 S-clauses then B[W]; I4 by W-count 0..4 gives
   H-I4-free then the three T-clauses then B[W]; both directions hold,
   empty intersections included. Domain necessity: H[T_z] has no I3.
   **Reviewer-completed step:** `|T_z| <= 8` does not follow from
   no-I3 alone; the valid argument (which I supply) is that a subset of
   order >= 9 with independence number <= 2 has triangle-free
   complement, which by R(3,4)=9 contains an independent 4-set, i.e.
   H contains K4 — contradiction. This uses only declared inputs and
   makes the statement correct. Domain condition: every actual
   signature satisfies alpha(H[T]) <= 2 (its T-set carries no I3), and
   these are exactly the masks the per-vertex filter admits. The
   exactness the source proves and I verified is the JOINT one: for a
   proposed attachment (all seven masks together with the graph on W),
   the seven clauses are necessary and sufficient for B to be
   K5/I4-free, by the forbidden-set split. The source makes no claim
   that each admissible mask alone extends to a full 24-vertex B; an
   earlier draft of this review invented such a witness (edgeless B[W]
   with six empty masks), which is invalid because an edgeless graph on
   seven vertices contains I4. The witness is retracted; no per-mask
   realizability is asserted or needed. Degree
   budgets verified by arithmetic over all endpoints:
   `|C_y| = 10+epsilon_y-d_W(y)`, `|C_z| = 1+epsilon_z+|T_z|-d_W(z)`,
   ranges `1<=|C_y|<=18`, `0<=|C_z|<=17`. Neighbor-row bound
   `17+|R_w|-24 <= |R_u cap R_w| <= 8` gives |R_w| <= 15; at equality
   R_w contains all 7 of W and misses exactly 8 in R_u (verified), so
   no row-17/row-16 edge exists. `d_A(u)=epsilon_u` is equality at
   |R_u|=17 and is explicitly not claimed zero.
4. **Claim 3 (two-core balance).** Pointwise `d_X(j)=d_Y(j)` by
   subtracting the two 8-regular equations; summations give
   `e(J,X)=e(J,Y)`, `8t = 2e(X)+e(J,X)` gives `e(X)=e(Y)`, and summing
   `d_Y(x) >= d_X(x)+1` over X (with `sum_X d_X = 2e(X)`) gives
   `e(X,Y) >= 2e(X)+t`. **Reviewer-completed step:** "nonneighbors in
   H' cannot contain I3, hence number at most eight" again needs the
   R(3,4)=9 complement argument (alpha <= 2 subset of a (4,4)-free
   graph has order <= 8); supplied and valid. t=1: tips adjacent,
   identical 8-neighborhood in J (pointwise equality), true twins only
   inside J+{x,y} as stated; P triangle-free because it is a
   neighborhood in the K4-free core. Fixed-16-set exclusion: three
   tips would share the same P by pairwise t=1 arguments, be pairwise
   adjacent by the inequality, P must contain an edge (else I4 in B),
   edge plus three tips is K5. The scope caveat (distinct subsets, not
   equal-row multiplicity) is correct.
5. **Claim 4 (three (3,4)-free 8-types).** Degree bounds 2/3 rederived
   (independent neighborhood <= 3 by I4-free; antineighborhood is
   (3,3)-free, order <= 5 by R(3,3)=6). Coverage case analysis checked
   line by line: degree-2 root — the other five vertices are (3,3)-free
   on five vertices, and C5 is the only such graph by a direct degree
   argument: in a triangle-free I3-free graph every neighborhood is
   independent (size at most 2, or it would contain I3) and every
   antineighborhood is a clique (two nonadjacent members plus the
   vertex give I3) of size at most 2 (a clique in a triangle-free
   graph), so on five vertices every degree is exactly 2, and a
   2-regular graph on five vertices is a single C5. No enumeration or
   graph generation was run; my scalar script checked only the three
   displayed graphs and the closed-form arithmetic; p,q cycle-neighborhoods have sizes in {1,2} (degrees),
   are independent (triangle-free), common-missed set is a clique
   (else I4) hence size <= 2, forcing union >= 3; sizes (1,2) force
   common-missed = exactly an edge (arithmetic: union = 3-int,
   missed = 2+int <= 2) and P3's unique independent pair is its
   endpoints, giving S10; sizes (2,2) rule out union 3 (P3 has one
   independent pair, cannot split into two independent pairs),
   leaving disjoint pairs over P4's bipartition, giving S11; sizes
   (1,1) cannot cover three vertices. Cubic case: e(P,Q) = 6, e(Q) = 3,
   and the only triangle-free I3-free 3-edge graph on four vertices is
   P4 (star has an independent triple, K3+isolate has a triangle);
   adjacent Q vertices have disjoint P-neighborhoods, singleton
   neighborhoods at q2,q3 differ, endpoints forced to complements —
   S12. Type proofs (triangle-free, I4-free) rechecked for all three,
   including the S12 common-miss sets (empty, {q3}, {q2} — recomputed
   from N(p1)={q2,q4}, N(p2)={q1,q3}, N(p3)={q1,q4}). Scalar audit of
   the three explicit edge lists (no enumeration, no catalogue):
   S10 e=10 degrees [2,2,2,2,3,3,3,3], S11 e=11 degrees [2,2,3,3,3,3,3,3],
   S12 e=12 all cubic; each triangle-free and I4-free; n2 = 24-2e holds
   (4,2,0). The classification is self-contained; no census count is
   referenced in its proof.
6. **Claim 5 (adjacent 16-rows).** Partition S,X,Y of B into three
   8-sets verified from the accepted overlap bound. The eight clauses
   are exhaustive by split: I4 by T-count 0..4 -> impossible in S,
   items 2,3,4,1; K5 by T/S split with S-part <= 2 (triangle-free S):
   5/0,4/1,3/2 -> items 1,6,5; row-K4 splits 4/0,3/1,2/2 -> items
   1,8,7 (row-I4s are B-I4s, already covered). `|P_z| >= 3` via
   R(3,3)=6 on S-P_z. Degree equations rederived:
   `d_X(s)=7-d_S(s)+a_s`, `d_B(s)=14-d_S(s)+a_s+b_s`,
   `|C_s|=4+d_S(s)+epsilon_s-a_s-b_s`, minima 4 (d_S=2) and 5
   (d_S=3); `e(S,X)=56-2e(S)+a = 32+2sigma+a`; column sum
   `56-2sigma+E_S-a-b >= 40-2sigma` (a+b <= 16); roots subtract 16
   leaving `24-2sigma`; bases/minsums (36,36),(34,38),(32,40) for
   S10,S11,S12 all reproduced; `|C_x|=11+epsilon_x-c_x-d_Y(x)`,
   `d_A(u)=1+epsilon_u` verified.
7. **Claim 6 (ambient lifting).** Mixed-clause coverage closed: K5 with
   k in A needs a k-clique in A (k <= 3 since A is K4-free) and a
   K_(5-k) in the common neighborhood — bullets 2; I5 with k in A needs
   an independent k-set (k <= 4 since A is I5-free) and an I_(5-k) in
   the common missed set — bullet 3; part-pure forbidden sets are
   covered by A- and B-side clauses; through-v sets reduce to K4 in A
   / I4 in B. Degree equations give `d_G in [18,24]` exactly as scoped.
   Forward direction: an ambient G supplies core/signatures/L/rows and
   the overlap bound plus my Claim 4 check give the three 8-set types
   under an explicit bijection (no symmetry quotient assumed).
   Converse: attaching v yields a 43-vertex K5/I5-free graph with a
   degree-18 pivot of the right part orders. The note correctly limits
   coverage to the two stated (possibly overlapping) families and does
   not claim a partition of all degree-18 graphs; the retained clause
   list is explicitly labeled as obligations the local reduction does
   not enforce.
8. **Limits section.** Verified: the row-17 -> `d_A(u)=0` shortcut is
   withdrawn; the independent-triple row-union >= 20 statement is
   correct (missed cell is a clique in K5-free B, order <= 4); no row
   count, x bound, or nonexistence claim appears anywhere; search use
   `propagate` only; no closure or certificate is asserted.

## Findings

No correctness defect found in any of the six claims at the reviewed
revision. Two proof steps are compressed in the source to a single
clause that is not valid for general graphs; both become valid using
only the note's declared inputs, and I supply the completed arguments
above (Claims 2 and 3: a subset of a (4,4)-free graph with independence
number at most two has order at most eight, via R(3,4)=9 on its
complement). These are documentation-density issues, not statement
errors; an optional author clarification would help future readers,
but no claim outcome changes.

Coordination note: at `Main`'s request I also independently audited the
new large-row tail arithmetic circulating over hub: the census-free
bound x <= 280 with its t=1 equality exclusion (verified), and the
t=2,x=280 census-based exclusion. In my first pass I flagged one step
of the latter as unproved; that flag is RESOLVED and is not a live
defect: `Main`'s argument gives `t+m_y<=4` at every B-vertex (all t
17-roots, regardless of omission, together with the m_y omitting
16-roots form an independent set of A), so at t=2 every m_y<=2, while
`sum_y m_y = 8s = 48 = 24*2` forces `m_y=2` at all 24 vertices; then
`k_y<=1` (two omitting cores would give k+m=4, an I5), the cores cover
B with |C|=10, each y in X|Y has k+m=3, and the obligation chain
`A<=e(Z,L)<=42-2e(L)<=30` with `e(L)>=6` (Mantel; two disjoint K3 show
6 is sharp at this relaxation) gives `322+2f-A<=336`, `f<=22`,
`b<=124-5+22=141<144`. I rederived each of these lines. Those
statements belong to `Main`'s note, whose own review is owned by
`IndependentCutsAudit` (accepted at `Main`'s final SHA prefix 8cfd);
they are recorded here only to mark the boundary of this review.

## Outcomes

- `#claim-seventeen-codegree-moments` (revised): **accepted**
- `#claim-seventeen-extension-domain`: **accepted**
- `#claim-two-seventeen-core-balance`: **accepted**
- `#claim-common-eight-classification`: **accepted**
- `#claim-sixteen-signature-reduction`: **accepted**
- `#claim-large-row-ambient-lifting`: **accepted**

Permitted search use of the accepted claims: `propagate`, on the stated
scope only.

## Limits

- No branch is closed and no closure is implied; the source asserts no
  novelty, no certificate, and no graph search, and this review supplies
  none. The two finite signature systems and their ambient lifting remain
  open tasks in the source itself.
- The recorded degree interval 18..24, the standard Ramsey numbers, and
  the two accepted input claims were not re-proved here beyond the
  narrow derivations listed above; census data (unique 17-core,
  E(4,5,18)=85) were neither used nor recertified.
- This review checked proofs, quantifiers, splits, and scalar
  arithmetic only. No enumeration, catalogue, solver, build, or Lean
  check was run; acceptance is of the written mathematics at the exact
  SHA-256 recorded above, not a formal verification.
