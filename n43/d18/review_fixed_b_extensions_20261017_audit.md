# Independent proof review: fixed-B extensions, mask occupancy, capacity certificates

Claim(s): `n43/d18/fixed_b_extensions.md` — all nine anchors:
`#claim-fixed-b-outer-cover` (lines 48–78), `#claim-fixed-b-exact-extension`
(80–155), `#claim-fixed-b-symmetry` (156–201), `#claim-fixed-b-forced-pairs`
(202–254), `#claim-fixed-b-mixed-occupancy` (255–309),
`#claim-fixed-b-small-row-capacities` (310–353), `#claim-fixed-b-mask-balls`
(354–446), `#claim-fixed-b-rational-capacity` (447–526),
`#claim-fixed-b-finite-relaxation` (527–604), plus the Limits (605–629) and
Author audit evidence (630–642) sections.

Author: FixedBResearch. Reviewer: FixedBAudit (independent; author self-audit
is not acceptance).

Reviewed revision: SHA-256
`570a467d13425643b16a829ff116e2634bef91d839a9b65e417529fa0b6ee56f`
(exact uncommitted file, 642 lines, 32129 bytes, mtime 2026-10-17 20:43:15).
Hash confirmed before and during review; the file did not change while I
worked. No project build, formatter, linter, test suite, solver, graph search,
canonicalizer, or graph-file download was run. Only the note, its cited
in-repo dependencies, and the catalogue landing page HTML were read.

Dependencies reviewed:

* `../reductions.md` §5.1–§5.4: the exact forbidden-rectangle criterion
  (all-one rectangle for clique splits, all-zero for independent splits)
  matches (E1)–(E5) term for term; §5.2 single-row bounds
  `d-18 <= s_u <= 13`, `17-s_u <= r_u <= min(17,23-s_u)` are exactly the
  rearranged (E6) row interval at pivot degree 18; §5.3 column bounds match
  `max(1,18-t_y) <= c_y <= min(14,24-t_y)`; §5.4 pair bounds give
  `|R_u∩R_z| <= 8` for edges and `|B-(R_u∪R_z)| <= 13` for nonedges, i.e.
  the strict thresholds 9 and 10 used throughout the note; §8.1 records
  `50 <= a <= 85` and `144 <= b <= 160` as [PUBLISHED]. Applicability holds.
* `symmetry_reduction.md#claim-d18-symmetry-01` (accepted): the A-first
  two-stage quotient with exact sequence `1 -> ∏ S_(m_C) -> Gamma -> H -> 1`.
  Claim 3 is its literal B-first mirror; I rederived the mirror independently
  rather than trusting the swap.
* `anchored_cell_averaging.md#claim-cell-types` (accepted): cited only for
  homogeneous-extension proof style; Claim 5 rederives every table entry from
  first principles (below), so the review does not lean on that file.
* `cell_obligation_cuts.md#claim-cell-signed-cut` (accepted, per
  `review_cell_obligation_cuts_20261015_intersections.md`): rational signed
  aggregation; Claim 8's aggregation was re-proved independently here.
* Classical values used: R(3,3)=6, R(3,4)=9, R(3,5)=14 and symmetric
  R(5,3)=14, R(4,4)=18, R(k,2)=k — all standard.
* External premises (retained, NOT recertified): `R(4,5)=25`; edge extrema
  `50<=a<=85`, `144<=b<=160` (reductions §8.1 [PUBLISHED]); the Ramsey(4,5,24)
  census completeness. I read the McKay landing-page HTML section “Extremal
  Ramsey(4,5)-graphs”: it states verbatim 350904 found in 1995, remainder in
  2016, 352366 altogether, and that no Ramsey(4,5)-graphs exceed 24 vertices.
  The citation is accurate; the completeness assertion itself remains an
  external premise, exactly as the note declares. No graph file (r45_24.g6
  or otherwise) was accessed.

Checks (independent rederivations, claim by claim):

Claim 1 (outer cover).
* Complementation maps B K5/I4-free to B-bar K4/I5-free on 24 vertices;
  C -> C-bar is a bijection on isomorphism classes (isomorphism of
  complements preserves original nonedges), so representatives' complements
  neither overlap nor miss a B type. Relabeling B with rows/A-edges carried
  together preserves the rooted candidate; residual labels are deferred to
  Claim 3. Coverage implication is explicitly conditional on the external
  completeness premise and explicitly not a recertification; the note also
  correctly forbids promoting this to a full-graph complement quotient.

Claim 2 (E1–E6 exact extension).
* Sufficiency: every five-set split i in A / 5-i in B checked case by case in
  both directions. Cliques: i=0 ambient K5-free; i=1 (E2) (D_B excludes
  K4 in B[R]); i=2 edge half of (E3); i=3 triangle half of (E4); i=4,5 (E1).
  Independent: i=0,1 ambient I4-free of B; i=2 nonedge half of (E3);
  i=3 (E4) clique of the complement forbids the mutual nonedge of the two B
  vertices; i=4 (E5); i=5 (E1). Through v: K5 needs K4 in A (E1), I5 needs
  I4 in B (ambient). Necessity: each failure exhibits the corresponding K5
  or I5 (e.g. (E4) nonedge half + triple = I5; (E5) + y = I5).
* Row/domain bounds, no circularity: `r_i <= 17` from (E2) + inherited
  I4-free = (4,4) via R(4,4)=18; `s_i <= 13` from N_A(i) being (3,5)-free
  (K3 in it plus i = K4 in A) via R(3,5)=14; `r_i >= 4` from
  `d_G(i)=1+s_i+r_i >= 18`, whose bound follows from R(4,5)=25 applied to
  neighborhoods and antineighborhoods — no row-size lower bound, frontier,
  or x>=136 premise enters any necessity argument, and sufficiency
  (E1–E5 => K5/I5-free) uses no row sizes at all. The note's own sentence
  that D_B may be used before (E1) is assigned is correct: the inequalities
  needed are necessary for every eventual A.
* E6 arithmetic re-derived: column bounds `18-d_B(y) <= c_y <= 24-d_B(y)`
  from `18 <= d_G(y) <= 24`; `d_B(y) <= 17` because B[N(y)] is (4,4);
  `c_y=0` would make A itself (4,4) of order 18 (K4-free always; an I4
  in A plus the nonadjacent y would be I5), impossible;
  `d_B(y) >= 10` because B's antineighborhood at y is (5,3) of order <= 13;
  hence interval ⊆ `1 <= c_y <= 14`. Identities verified:
  `2a+x=306+E`, `E=x+2a-306`, `x=136+2q+E` (q=85-a),
  `E_B=x+2b-432`, `W=2b-296+2q+2E`. `0 <= epsilon_i <= 6` uses
  `s_i <= 23-r_i` (tight at r=17) and `s_i >= 17-r_i`.
* Observed nuance (not a requested change): the Conclusion folds (E6) into
  "necessary and sufficient for K5/I5-free". Sufficiency genuinely needs only
  (E1)–(E5); (E6)'s necessity holds under the declared external degree/extremal
  premises, which the metadata text itself states ("redundant for genuine
  Ramsey graphs on the external degree/extrema premises"). The statement is
  true under its declared dependencies; recorded here so no downstream user
  reads (E6) as an independently closed premise.

Claim 3 (multiset symmetry).
* Group law on Gamma_M closes (R_{σσ'(i)} = gg'(R_i)); projection onto
  H_M is onto (equal multiplicities give an occurrence bijection); kernel is
  exactly ∏ S_(n_R); kernel permutations preserve fixed labeled B and act on
  the full A edge vector; two same-M completions are rooted-isomorphic iff
  their edge vectors lie in one Gamma_M orbit. Kernel-only minimization is
  correctly flagged as safe but possibly incomplete (H_M class exchanges).
  Scalar invariance and epsilon relabeling caveats correct.

Claim 4 (forced pairs, multiplicity 2, no 9/10 repeats).
* Thresholds exact: `|R∩S| >= 9 -> H` (R(3,4)=9 at the boundary, B I4-free);
  `|R∪S| <= 10 -> F` (complement >= 14, K5-free, R(5,3)=14 at the boundary).
* n_R <= 2 both cases. Triangle-free case: r <= 8 (R(3,4)=9), complement
  >= 16 carries an I3 (F forces all pairs adjacent); three occurrences would
  be an A triangle and B[R] has an edge because r >= 4 with B I4-free, so
  (E4) triangle half fires (K5 = triangle + that edge). Triangle case:
  H forces nonadjacency; three occurrences leave B-R of order >= 7 which is
  not a clique (>=5 vertices, K5-free), giving I5 with the independent
  triple. Two such occurrences force `|B-R| <= 13` (no I3 by (E3),
  R(5,3)=14) => r >= 11. Types are mutually exclusive: triangle-free masks
  have r <= 8, so a mask with `B-R` I3-free must have r >= 11 and a triangle.
  r=9,10 have both F(R,R) and H(R,R) — both boundaries verified — hence no
  repeats. Consequences (>= 9 distinct masks, all-distinct at sizes 9/10,
  kernel <= 2^9 = 512) follow.

Claim 5 (mixed-anchor occupancy).
* Cell type (O) re-derived: clique of size 5-|Q| in the cell joins Q (rows
  contain Q), independent set of size 5-|P| joins P (rows miss P); no
  condition on Q–P cross edges is used; parameter 1 means the cell is empty
  (a vertex containing a 4-clique or missing a 4-set completes K5/I5 with
  B's clique/independent anchor). All 20 table entries recomputed against
  min(18, R(alpha,beta)-1): rows |Q|=0,1 give 18,17,8,3; |Q|=2 give
  13,8,5,2; |Q|=3 give 4,3,2,1 (cell independent; the |P|-bounds come from
  joining the anchor, not from A's I4 allowance); |Q|=4 all 0. The cap-18
  entry correctly uses the ambient 18 occurrences, not R(4,5)-1=24. B has no
  independent 4-set, so |P| <= 3 covers all anchors. Follow-ups (triangle in
  <= 4 rows, I3 missed by <= 3, mixed caps 2 and 1) match table entries.

Claim 6 (small-row capacities).
* (1) union <= 10 -> F -> all pairs adjacent -> four give K4. (2) union
  <= 6+6-2 = 10 -> F; three + common edge = K5. (3) union <= 6+6-3 = 9
  gives F (adjacency) while T gives H (nonadjacency): contradiction, so
  <= 1. (4) three size<=8 rows have union <= 3*8-2*3 = 18 (T counted three
  times), uncovered >= 6 is not a clique (K5-free), nonedge + independent
  triple = I5. Repetitions included (equal masks are the tight case).
* Generalization: complement I3-free gives union >= 11 (h=2), complement a
  clique of order <= 4 gives union >= 20 (h=3), (E5) gives union = 24 (h=4);
  `|union| <= sum r_i - 3(h-1)` holds because the h rows count T's vertices
  h times vs once. Combining: 14, 26, 33 — matches, including the author's
  audit arithmetic. The non-additivity caveat is correct.

Claim 7 (exchange balls, fractional witnesses).
* Pair geometry: intersection ⊇ S minus 2a_0 deletions; union ⊆ S plus 2b_0
  additions. Radius convention is consistent everywhere: a_0 = deletions
  feeds H-flag and F-improvement (r-3a_0 >= 4); b_0 = additions feeds
  F-flag and H-improvements (r+4b_0 <= 23, r+3b_0 <= 19). Center need not
  be admissible; equal masks (repeats) satisfy the same bounds.
* Flags: numerical H at r-2a_0 >= 9 (R(3,4)=9, non-strict, exact);
  numerical F at r+2b_0 <= 10 (complement >= 14 -> I3, exact). Fractional
  witnesses use strict `> 2a_0` / `> 2b_0` with correct capacity accounting
  (a <= 2a_0-vertex deletion set hits weight <= 2a_0 < supplied by summing
  per-vertex capacities <= 1); surviving triangle lies in both rows,
  surviving I3 lies outside both unions. Disjoint-witness special cases
  (2a_0+1 or 2b_0+1 triples) are correctly strict.
* Capacities: five pairwise nonadjacent rows = I5; four need union <= 23;
  three need union <= 19 (uncovered >= 5 is not a clique); four adjacent =
  K4; three adjacent need intersection >= 4 with a B edge inside (any 4 B
  vertices contain an edge by I4-free) = K5. Both flags => <= 1.
* Table for a_0=b_0=1 recomputed: F fires for r <= 8 (improves to 2 iff
  r >= 7) giving caps 3 at r=4,5,6 and 2 at r=7,8; neither flag at r=9,10
  (9-2=7<9, 10+2=12>10); H fires for r >= 11 (improves to 2 iff r+3 <= 19,
  i.e. r <= 16) giving 2 at 11..16 and 3 at 17. Exactly the note's table.
  At r=9,10 either fractional witness gives cap 2 (r+3 <= 19 / r-3 >= 4),
  both give 1; three disjoint triangles + three disjoint I3s are feasible
  exactly for 9 <= r <= 15 (9 vertices needed each side) — the stated
  interval. Eight cap-2 balls cover <= 16 < 18 occurrences; fractional
  cover with total weight < 9 rejects via Claim 8 with rho=1; equality at 9
  does not reject and the exactly-nine analysis (each ball occupancy 2,
  every selected occurrence in exactly one ball) is a correct equality case.
  No universal existence of the witnesses is claimed; the Limits section
  says so explicitly.

Claim 8 (rational/integer certificates).
* Aggregation: nonnegative multipliers, pointwise `L(R) >= rho > 0`,
  `rho*sum n <= H`, integrality => `sum n <= floor(H/rho)`; `H < 18*rho`
  rejects 18-row families (non-strict/strict thresholds correct). Signed
  column cuts are in valid `L <= h` form (`c_y <= 24-d_B(y)` and
  `-c_y <= d_B(y)-18`); negative coefficients are sound because only
  `n_R >= 0` is used. Prefix advice (subtract exact occupancy, residual
  capacities) is correct.
* Triangle/I3 specialization coefficients match Claim 5 (4 and 3) and
  Claim 6 (2 at size <= 8, 1 at size <= 6, applicable only when every row in
  D meets the size restriction). Box-strengthened (B): per-mask identity
  `N*nu - sum L n = sum (nu-L) n <= sum m_R max(nu-L,0)` verified (both
  signs of `nu-L(R)` checked); strict failure is a valid rejection.
  Denominator clearing, "cover of a subdomain does not cover other masks",
  and "failure to find a certificate proves nothing" all correctly prevent
  silent completeness claims.

Claim 9 (finite relaxation, exactness boundary).
* Occupancy stage is a finite necessary-condition system (finite power set,
  0 <= n_R <= m_R with m_R from Claim 4 incl. m_R=1 exactly when F(R,R) and
  H(R,R)). Support variables are exact: `p_R + p_S <= 1` under both
  witnesses is required, and the note correctly rejects the weaker
  `n_R + n_S <= 2` (it would admit one of each incompatible mask).
* Pair stage: `f_i <= u_i`, `17-h_i >= l_i` are the right feasibility
  necessities against (E6) intervals; the three homogeneous rejections
  (forced-F triangle + common edge; forced-H triangle + omitted nonedge;
  forced-H four-set missing a B vertex) each exhibit an explicit K5/I5;
  completeness is explicitly not claimed.
* Rational edge stage: z in [0,1] on 153 = C(18,2) pairs; the five
  constraint families re-checked against (E1)–(E5): 4-set sum <= 5 and
  5-set sum >= 1 are the exact binary no-K4/no-I5 relaxations; triple +
  common B edge (sum <= 2) is (E4) triangle half; triple omitting a B
  nonedge (sum >= 1) is (E4) independent half; four rows omitting y
  (sum >= 1) is (E5). Pair cases are exactly the F/H fixings; K4-in-one-row
  is excluded by D_B = (E2); 1+4 and 2+3 splits reduce to these plus the
  ambient prohibitions, so with binary z the system is precisely (E1)–(E5)
  (+ the displayed (E6) budgets), and Claim 2 gives exactness. The binary
  boundary is stated as the only exact point: occupancy and rational
  prefixes are necessary-condition relaxations; passing them asserts no
  completion; no optimizer is trusted (Farkas certificate with nonnegative
  multipliers, both equality directions, variable bounds, sum a_l = 0 and
  sum b_l < 0 — verified); and the note explicitly disclaims that every
  integral obstruction has a rational certificate. No silently complete LP.

Cross-cutting checklist from the assignment:

* Duplicate occurrences: rows are occurrences everywhere (Claim 3 kernel,
  Claim 5 cell sums, Claim 6 "repetitions included", Claim 7 repeats scope,
  Claim 8 n_R, Claim 9 m_R/support variables). Consistent.
* Strict/non-strict thresholds: 9 (>= for H), 10 (<= for F), 18*rho (strict
  rejection), weight > 2a_0/2b_0 (strict), degree/column bounds non-strict —
  all verified exact at the boundaries against R(3,4)=9 and R(5,3)=14.
* Radius conventions: a_0 deletions / b_0 additions applied consistently in
  both flags, all improvement inequalities, and the concrete table.
* Signed aggregation: Claim 8 signed column cuts and Claim 9 two-sided
  equality handling are sound; only n_R >= 0 and lambda >= 0 are used.
* No silently complete LP: both Claim 8 and Claim 9 state and keep the
  sufficiency boundary of their certificates.
* No row-size lower bound used circularly in sufficiency: the sufficiency
  direction of Claim 2 never uses row bounds; `r_i >= 4` derives from the
  external degree floor plus `s_i <= 13`, and D_B's necessity precedes any
  assignment of (E1). Claims 4/6/7 consume row bounds only under D_B scope.
* x136: no claim uses the user-reported closure; `x = 136+2q+E` is an
  identity with q = 85-a on the declared external `a <= 85`; the note's
  disclaimer matches my reading of the full text.
* Ambient types proved from first principles: A K4/I5-free, B K5/I4-free,
  B[N(y)] (4,4), B-antineighborhood at y (5,3), N_A(i) (3,5), cell type (O)
  — each re-derived here without relying on the cited cell-type lemma.

Findings: no defect requiring correction. One non-blocking observation is
recorded under Claim 2 above (E6 necessity rides on declared external
premises; sufficiency is (E1)-(E5)) — this is disclosed in the source metadata
itself, so no change is requested.

Outcome (claim-by-claim):

| Claim | Anchor | Outcome |
| --- | --- | --- |
| 1 outer cover | `#claim-fixed-b-outer-cover` | accepted (conditional on external census premise, retained) |
| 2 exact extension | `#claim-fixed-b-exact-extension` | accepted |
| 3 multiset symmetry | `#claim-fixed-b-symmetry` | accepted |
| 4 forced pairs / multiplicity | `#claim-fixed-b-forced-pairs` | accepted |
| 5 mixed occupancy | `#claim-fixed-b-mixed-occupancy` | accepted |
| 6 small-row capacities | `#claim-fixed-b-small-row-capacities` | accepted |
| 7 exchange balls | `#claim-fixed-b-mask-balls` | accepted |
| 8 rational capacity | `#claim-fixed-b-rational-capacity` | accepted |
| 9 finite relaxation | `#claim-fixed-b-finite-relaxation` | accepted (kind: design; exactness boundary accepted as stated) |

Overall outcome: accepted, as mathematics, at the reviewed hash.

Limits:

* External premises retained, not recertified: census completeness of the
  352366 Ramsey(4,5,24) family (landing page read 2026-10-17; quote verified,
  completeness asserted externally, graph files untouched); edge extrema
  50<=a<=85 and 144<=b<=160; R(4,5)=25. A change in any of these puts the
  affected claims back into review.
* This review certifies proof validity only: no realizability, no enumeration,
  no branch closure, no pruning authority beyond the stated necessary
  conditions, no novelty check. Claims remain "ready", not accepted by the
  author side; acceptance here does not close any branch.
* Search use as labeled in the note is permitted: Claim 1 branch-conditional
  on the census premise; Claims 2-8 propagate after this review; Claim 9
  stays design-only until implementation is separately reviewed.
* Unrelated to this file: Main's separate tail-bound deductions
  (superseding drafts around x<=282/280/279) do not appear in this note and
  are owned by other reviews; nothing here depends on them, and they were
  not used in this review.
