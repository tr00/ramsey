# Independent review: independent-root coverage and exceptional signature core

Date: 2026-10-17. Reviewer: LegacyCellAudit (independent of the author
CoverageResearch).

## Claim(s) under review

All six claims of [obstruction coverage](obstruction_coverage.md), anchored
`claim-coverage-root-cell-types` (Claim01), `claim-coverage-independent-four-signatures`
(Claim02), `claim-coverage-twenty-five-roots` (Claim03),
`claim-coverage-dense-moderate-cells` (Claim04),
`claim-coverage-exceptional-core-obligations` (Claim05),
`claim-coverage-closure-barrier` (Claim06), plus the arithmetic self-check
and coverage section. Author: CoverageResearch; reviewer: LegacyCellAudit.

## Reviewed revision (exact SHA-256)

n43/d18/obstruction_coverage.md =
86a940a7871f5196bc8a51590ef9d60bbc2479c4a1194dff420b127bb14d4874
(442 lines, untracked working file; hash re-pinned immediately before this
review was written and equal to the coordinator's stabilized SHA).

## Dependencies reviewed

- Local standing hypotheses: |V|=43, no K5, no I5; P = degree-18 roots;
  degree range 18..24.
- Ramsey premises R(4,5)=25 (=R(5,4)), R(4,4)=18, R(3,5)=14, R(3,4)=9,
  R(3,3)=6: verified present in
  [mathematical baseline](../../docs/mathematical_baseline.md#immediate-local-constraints)
  (section read; records R(4,5)=25, R(4,4)=18, R(3,5)=14 and the cell
  anchor rule). Values accepted as recorded, not recertified.
- Census extremum (4,5,18) <= 85 defining q: recorded premise, used only
  where Claim04/Claim06 cite it; not recertified.
- Claim04's (4,4,15) upper edge bound 55: the citation
  `transversal_four.md#published-input` resolves (heading `## Published input`,
  transversal_four.md line 19) and records `between 50 and 55 edges` for
  15-vertex (4,4) graphs — the upper endpoint 55 is exactly what Claim04
  needs. Verified.
- Claim04's application table: dense-pivot
  `dense_pivot_coverage.md#claim-dense-pivot-02` exists (line 135, review
  state accepted); its arithmetic was spot-checked below. The family
  example `sos_pivot_selection.md#claim-sos-pivot-family` (line 154) and the
  twelve-root statement `#claim-sos-pivot-twelve` (line 226) both resolve.

## Checks and per-claim findings

### Claim01 — four cells of two roots, with types. Outcome: ACCEPTED

Independently rederived every table entry from the K5/I5 prohibitions alone.

- Sizes. Adjacent uv: the neighborhoods union to 36-lambda and contain both
  roots, so D = 7+lambda and X,Y are 17-lambda each (the excluded root lies
  in the other's neighborhood); nonadjacent uv: neither root lies in either
  neighborhood, so D = 5+lambda and X,Y are 18-lambda. Both four-orders sum
  to 41, as claimed.
- Types. Nonedge: C (4,5) (K4 plus u gives K5), X,Y (4,4) (K4 plus u, I4
  plus v), D (5,3) (independent triple plus the independent pair {u,v}).
  Edge: C (3,5) (triangle plus uv gives K5), X,Y (4,4), D (5,4) (I4 plus u
  gives I5; K4 in D not excluded since neither root is adjacent to D).
  Heredity supplies the second parameter in every entry.
- Consequences. Nonedge: X order 18-lambda <= 17 (R(4,4)=18) gives
  lambda >= 1; D order 5+lambda <= 13 (R(5,3)=R(3,5)=14) gives lambda <= 8.
  Edge: C order lambda <= 13 gives lambda <= 13; lambda >= 0 is free.
  All four bounds recomputed and correct.
- The proof paragraph's rules (`triangle in C joins uv`, `I4 in D joins u`,
  `X joins u / joins v`) match the baseline anchor rule with (c,i) =
  (2,0),(1,1),(0,1) for edges and (2,2)-readings avoided for nonedges —
  the text's nonedge (4,5) entry uses c=1 via single-vertex attachment,
  consistent with the baseline section.
- This table is exactly the correction basis for the legacy pointed-pair
  paragraphs in pivot_classes/transfer_bounds; it agrees cell by cell with
  [the superseding ambient-type audit](review_adjacent_root_cell_20261017_audit.md)
  (same date), which independently derived the same types and sizes.

### Claim02 — independent four: 16 aggregate profiles. Outcome: ACCEPTED

- 39 external vertices (43-4), all with nonempty signature (empty signature
  plus I gives I5). Incidence sum 4*18 = 72. Subtracting the vertex and
  incidence equations gives n1 = 6+n3+2n4, n2 = 33-2n3-3n4 — recomputed.
- S_i is a clique (two nonadjacent members plus I minus {vi} give I5) and
  |S_i| <= 3 (four-clique plus vi gives K5), so n1 <= 12 and therefore
  n3+2n4 <= 6; n2 >= 21 and n4 <= 3 follow — all recomputed.
- The 16 pairs (n3,n4) enumerate as 7+5+3+1. The six-overlap sum
  L = n2+3n3+6n4 = 33+n3+3n4 gives the displayed per-row maxima
  39,40,41,42 — recomputed; the self-check section's claims (max 41 outside
  n4=3; unique sum-42 profile (n3,n4,n1,n2)=(0,3,12,24)) match.
- Dichotomy completeness: all six overlaps >= 7 forces L >= 42, hence
  L = 42, n4=3, n3=0, n1=12, n2=24; the caps |S_i| <= 3 with total 12 give
  three per singleton class, and each double class is 7-3 = 4 because the
  pair's common neighbors are only its own double class plus the three
  all-four vertices. Converse and disjointness verified. Pair lower
  codegree 1 <= lambda and upper 8 are exactly Claim01's nonedge interval,
  correctly cited as the dependency.

### Claim03 — 25 roots force a pair or the exact core. Outcome: ACCEPTED

- G[F] has no K5 and |F| >= 25 = R(5,4), supplying an independent four I in
  the same family F; Claim02 then applies. Same-family hypothesis is
  explicit and sound: the pair and the four core all live in F, and
  property-defined families transfer their property to both/all endpoints;
  the text correctly refuses to impose it on an arbitrary pre-fixed root.
- Pair branch: overlap 1..6 (Claim01 nonedge range), opposite mixed cells
  (4,4) of equal order 18-lambda in 12..17 — recomputed.
- Quantifiers: F=P whenever h <= 18 (43-h >= 25); h >= 19 leaves at most 24
  roots and the text states no conclusion there — occurrence vs conditional
  framing is correct; no unconditional occurrence claim is made.
- The twelve-root adjacent theorem is mentioned only as a different
  unavoidable family, explicitly not assumed to coincide with this one;
  its statement exists at the cited anchor (review state ready). No
  dependency on it for Claims01-06.

### Claim04 — dense q<=2 families: cell orders 12..14. Outcome: ACCEPTED

- Setup for a nonedge pair: N(u) = C disjoint union X, X (4,4) of order
  18-lambda. Edge caps U(17),U(16),U(15) = 68,64,55: 68 and 64 are the
  elementary (4,4) degree cap 8 (neighborhood is (3,4)-free by R(3,4)=9,
  heredity) times order/2 — recomputed as 17*8/2 and 16*8/2; 55 is the
  recorded census upper endpoint, cited to a verified anchor.
- For c in C, neighbors in X are triangle-free (triangle plus the adjacent
  pair u,c gives K5) and I4-free (inside X), so at most 8 each by
  R(3,4)=9; G[C] is K4-free (inside N(u)) so at most floor(lambda^2/3) by
  Turan. Caps: 68+8+0 = 76, 64+16+1 = 81, 55+24+3 = 82, giving necessary
  q_u >= 9,4,3 — all recomputed, including the floor terms. The argument is
  symmetric in u,v.
- Consequence: q <= 2 excludes overlaps 1..3 of Claim03's range 1..6,
  leaving 4..6 and mixed-cell orders 14,13,12 — recomputed. The q<=3 and
  q<=8 remarks (retain 3..6, 2..6) are consistent with the thresholds.
- Application table verified against the source claim: for h=3,W=18 and
  h=5,W=30 one has D=0 in dense-pivot Claim02 (W=6h-D), and its formula
  R_h = 24h - 2*floor(3h^2/8) - (43-h)(h-1)/2 gives 26 in both rows; D=0
  forces exactly E=3h+3 (12 and 18), q in {0,1}, x in {139+3h,141+3h} =
  {148,150} and {154,156}, matching the table entry by entry. The rows are
  labeled conditional on the exact global degree data with occurrence
  proved inside them (the source claim is review-state accepted), and the
  text warns that a lower bound of 24 roots is insufficient — occurrence
  vs conditional-filter discipline is correct throughout.

### Claim05 — exceptional core structure and obligations. Outcome: ACCEPTED

- Partition 4*3 + 6*4 + 4*0 + 1*3 = 39; each {vi} union S_i is a K4
  (S_i clique from Claim02, vi adjacent to all of it), disjoint over i, so
  the 16-vertex core is actual — recomputed.
- D_ij is (4,3)-free: K4 plus vi gives K5; I3 plus the complementary root
  pair {vk,vl} gives I5 — verified (D_ij vertices miss vk,vl by signature).
- Rectangles: M_i(y) = S_i minus N(y) is nonempty (else y plus the rooted
  K4 gives K5), and for a in M_i(y), b in M_j(y) nonadjacent, the set
  {y,a,b,vk,vl} is independent (y misses a and b by the definition of M,
  both miss vk,vl by signature, vk-vl is a nonedge) giving I5; so every
  double vertex forces a nonempty complete bipartite rectangle, and every
  singleton-class pair gets a cross edge — verified, with the definitions
  read carefully (the nonadjacency of y to a and b comes from M's
  definition, not from signatures).
- U vertices: omission sets in all four singleton classes are nonempty
  (rooted-K4 completion), and no independent transversal exists (it plus y
  would be I5) — verified as stated (a conditional constraint, not a claimed
  smaller obstruction).
- Cell equations for the pair {vi,vj}: C = D_ij union U (order 7),
  X = S_i union D_ik union D_il (11), Y symmetric (11),
  D = {vk,vl} union S_k union S_l union D_kl (12); sum 41; types (4,4),
  (4,4), (5,3) are Claim01's nonedge row. Recomputed. Degree consistency
  check: vk's total external incidences 3+4+4+4+3 = 18 (its singleton,
  three double classes containing k, all-four) and vk has 3+4 = 7
  neighbors within D — both match the stated `exactly7`.
- The section claims no impossibility and no edge determination between
  classes — correctly scoped.

### Claim06 — x136 closure scope and scalar barrier. Outcome: ACCEPTED
### (conditional premise C136 explicitly retained)

- x_v = 136+2q_v+E_v with q,E >= 0 gives x=136 iff q=E=0; hence C136
  yields q+E >= 1 rootwise, E_v=0 => q_v >= 1, and the text explicitly
  forbids promoting this to q_v >= 1 for all roots or to a global excess
  bound — the quantifiers are correct.
- C136 is stated as the user-reported closure accepted as supplied, used
  conditionally pending integration, with the branch README's older open
  status explicitly not treated as counter-evidence; Claims01-05 are
  verified not to use C136. This matches the standing instruction for the
  x136 report (accept, no invented certification).
- The scalar assignment was recomputed: h=W=0; every root q=1, E=0,
  e(N)=84, x=138, e(M)=147 satisfies q+E >= 1, 0<=q<=35,
  q+E <= W/2+4 = 4, x = 136+2q+E = 138, and the edge identity
  84+147+138+18 = 387 = 387+W/2 (the identity
  b = 148+W/2-q-E was itself rederived from e = 387+W/2, a=85-q,
  x = 136+2q+E). Intervals 50..85 and 144..160 hold (84, 147), and the
  implied constraint E_v <= W holds (0 <= 0).
- Signature vector: singletons 3, doubles 4, triples 0, all-four 3 totals
  39, gives per-root incidences 3+12+3 = 18 and all six overlaps 7 in
  Claim01's interval 1..8 — recomputed; no pair of overlap <= 6 exists
  among those four, as stated.
- No false-graph construction: the text repeatedly and explicitly scopes
  the assignment to scalar and signature-count variables, denies
  realizability, and limits the barrier to the listed relaxation. The
  barrier statement (these constraints, even with C136, cannot algebraically
  discard the exceptional vector) is true as scoped. No closure or
  exclusion claim is made.

### Arithmetic self-check section — Outcome: ACCEPTED

Every figure it reports (16 pairs; incidence equations; n1<=12, n2>=21;
max overlap sum 41 outside n4=3; unique (0,3,12,24); the 15-class expansion
to 39 vertices, degree sums 18, overlaps 7, mixed-cell order 11; thresholds
9,4,3) matches the independent computations above. It is correctly labeled
an author self-check, not an independent acceptance.

## Findings

No defect found. All six claims, their quantifiers, same-family
hypotheses, occurrence-vs-conditional framing, extremal algebra, pair
codegree bounds, dependency anchors, and the scalar-model disclaimer check
out against independent recomputation.

## Outcome

Accepted for all six claims at SHA-256
86a940a7871f5196bc8a51590ef9d60bbc2479c4a1194dff420b127bb14d4874,
subject to the limits below. Search use stays as proposed in each claim
(none pending review at authoring time; propagate/branch uses now allowed
per the accepted claims), with no termination, novelty, or closure claim.

## Limits

- External premises not recertified: the Ramsey values R(4,5)=25,
  R(4,4)=18, R(3,5)=14, R(3,4)=9, R(3,3)=6; the census extrema (4,5,18)
  <= 85 and the (4,4,15) interval 50..55; C136 (accepted per user report
  only).
- dense-pivot Claim02 and the sos twelve/family claims were verified at
  statement, anchor, and arithmetic-spot-check level only; their full
  proofs were not re-derived here (dense Claim02's formulas were recomputed
  for the two cited rows h=3 and h=5).
- weighted_averaging/overlapping_cells characterizations quoted in the
  Setting were not re-audited.
- The coordinator's in-flight tail deductions about row counts and the
  x <= 282/280/279 boundaries are outside this file and outside this
  review; obstruction_coverage.md cites none of them (Claim06 uses only
  the x_v identity and the recorded pivot scalar bounds).
- No graph search, solver, catalogue download, Lean, or project validation
  was run; no realizability, novelty, or order-43 exclusion claim is
  evaluated.
