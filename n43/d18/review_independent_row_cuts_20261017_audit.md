# Independent audit: independent-row cuts and the large-row tail

Claim(s): `n43/d18/independent_row_cuts.md` —
`#claim-independent-row-degree-cuts` (claim 01),
`#claim-independent-row-combined-pairs` (claim 02),
`#claim-independent-row-tail-counts` (claim 03),
`#claim-independent-row-single-seventeen-boundary` (claim 04),
`#claim-independent-row-280-boundary` (claim 05).

Author: Main. Reviewer: IndependentCutsAudit. Distinct identities; every
displayed inequality, count, and equality profile below was rederived from
the ambient setting rather than accepted from the author's arithmetic.

## Reviewed revision

Byte-exact SHA-256 of the exact uncommitted file under review
(computed with `sha256sum` immediately before writing this file):

    eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69

(268 lines.) The author revised three times during this review task; each
revision was re-hashed before reading:

| Order | SHA-256 | Lines | State |
| --- | --- | --- | --- |
| first draft (original assignment target; matched expected SHA) | `8a79cbf9205e738458b697f8da211d8a6c2f6c78daa8c1a4807c123153f71536` | 216 | fully audited, then superseded by author; never accepted |
| intermediate | `fb6059b7b8b6262e5b459cf413acc08fe3e1cf95af40429bc246ade443859c2c` | 258 | fully audited, then superseded by author; never accepted |
| final (target of this review) | `eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69` | 268 | reviewed; outcomes below |

Superseded drafts carry no acceptance; this review covers only the final
SHA. No other file references any anchor of this note (grep-verified), so
superseded claim IDs cannot be consumed downstream.

## Dependencies reviewed

- `docs/mathematical_baseline.md` (status 2026-10-13): R(4,3)=R(3,4)=9,
  R(3,3)=6, R(4,4)=18 (classical values, recorded), and
  "Since R(4,5)=25, n-25 <= d(v) <= 24", i.e. the all-vertex degree cap 24
  for order-43 (5,5)-free graphs — recorded there, but not declared inside
  this note (see Finding 1).
- `n43/reductions.md` section 8.1 `[PUBLISHED] 50 <= a <= 85,
  144 <= b <= 160`, "second interval follows by complementing the published
  24-vertex (4,5) edge interval 116 through 132".
- `n43/d18/cross_upper_bound.md` section "1. Setting and premises" (the
  anchor cited by claim 05 exists): `116 <= e(complement G[B]) <= 132`,
  `144 <= b <= 160`, citing Angeltveit–McKay, R(5,5)<=46.
- Census intervals used only by the superseded first draft, recorded in
  `reports/2026-10-16-published-edge-bounds.md`: (4,4,16) 60..60 and
  reductions index lines: (4,4,15) 50..55.
- R(4,5)=25, the (4,5,24) edge interval, and all classical Ramsey numbers
  are external published premises, retained as recorded and NOT recertified
  here. Applicability of each to this note was checked (below).
- No graph enumeration, catalogue, solver, download, build, or novelty
  search was used. Only finite integer arithmetic (small script) was run.

## Checks

### Claim 01 — independent degree budgets 8/12/20 (accepted)

- t=2: outside-I vertices missing both anchors are K4-free (heredity) and
  I3-free (an independent triple there extends I to I5), hence <= R(4,3)-1 = 8;
  >= 8 of the 16 outside vertices meet I, so sum_I d >= 8. Equation (1)
  rederived exactly: with a = |miss-both| <= 8, b = meet-one, c = meet-both,
  a+b+c = 16, sum_I d = b+2c and |N(u)∩N(w)| = c, so
  d_u+d_w-|N(u)∩N(w)| = b+c = 16-a >= 8. Correct.
- t=3: miss-all-three vertices form a clique (nonadjacent pair would give
  I5); K4-free A caps the clique at 3, so sum_I d >= 15-3 = 12. Correct.
- t=4: every outside vertex meets I (else I5). Singleton classes are
  cliques joined to their anchor, size <= 2 (else K4), so n1 <= 8. Signature
  count rederived: with n1+n2+n3+n4 = 14,
  sum |S| = n1+2n2+3n3+4n4 = 28-n1+n3+2n4 = 28-n1+h, hence
  sum_I d = 20+(8-n1)+h >= 20. Correct.
- Equivalence sum_I r = 17t+E_I-sum_I d gives 26+E_I / 39+E_I / 48+E_I
  (34-8, 51-12, 68-20). Correct. Quantifier caveat in the claim text
  ("no uniform existence of an independent t-set ... is assumed") is honored:
  conclusions are conditional on the given t-set. Ambient types: all
  arguments inside A (K4/I5-free) as scoped.

### Claim 02 — opposing pair cuts and L17 profiles (accepted)

- (3): for an A-edge uw, B[R_u∩R_w] is K3-free (a B-triangle plus u,w is
  K5) and I4-free (B ambient), hence order <= R(3,4)-1 = 8, while
  |R_u∩R_w| >= r_u+r_w-24; r_u+r_w >= 33 forces <= 8 < 9, contradiction,
  so r_u+r_w > 32 => nonedge. Correct.
- (4): (1) with d = 17+eps-r gives d_u+d_w = 34+E-(r_u+r_w) < 8 when
  r_u+r_w > 26+E, contradicting (1) for a nonedge; hence the pair is an
  edge. Correct; both antecedents together are contradictory as stated.
- L17: d_u = eps_u (r=17); independent by (3) (34 > 32); size <= 4 (A
  is I5-free); anticomplete to L16 (33 > 32). Excess table is claim 01
  applied to I = L17 (8/12/20). Pairwise eps >= 8 uses eps <= 6 (recorded),
  so each member >= 2 when t >= 2. 17+16 pair: (1) gives
  d_u+d_w = eps_u+1+eps_w >= 8 => eps_u+eps_w >= 7. All verified.

### Claim 03 — census-free x <= 280 (accepted)

- Adjacent L16 pair: row intersection <= 8 by (3)'s argument and >= 8 by
  inclusion-exclusion, so the union is all B; therefore each O_y
  (L16 rows omitting y) is independent. Verified.
- t+m_y <= 4: L17 ∪ O_y independent in A (L17 independent, anticomplete to
  L16), alpha(A) <= 4. Summing, each L16 row omits exactly 8 B-vertices:
  8s <= 24(4-t) => s <= 12-3t. Correct.
- k_y+m_y <= 3: the L17 rows omitting y together with O_y are independent
  and all miss y, so adjoining y would give I5 beyond size 4. Summing,
  each L17 row is omitted by exactly 7 B-vertices: 7t+8s <= 72. Correct.
- Table recomputed for t = 0..4:
  s = min(12-3t, floor((72-7t)/8), 18-t) = 9, 8, 6, 3, 0 and
  x <= 270+2t+s = 279, 280, 280, 279, 278 (script-verified). Hence
  x <= 280 unconditionally, and x = 280 forces (t,s) = (1,8) with nine
  rows of size 15, or (2,6) with ten rows of size 15 (equality counting:
  17+128+9*15 = 280; 34+96+10*15 = 280). "Any smaller remaining row makes
  the bound strict" checked. Scope includes t = 0 as declared. Census-free
  as claimed: no census premise appears in claims 01–04 (re-verified on
  the final text).

### Claim 04 — the t = 1 equality profile is impossible (accepted)

- Profile: L = 8, Z = 9 (from claim 03 equality). Total k+m = 7+64 = 71
  with per-bin cap 3 over 24 bins => 23 bins at 3, one at 2 (script:
  72-71 = 1). Correct.
- Each z in Z omits 9 B-vertices, >= 8 of them full bins. For each such y,
  z must neighbor J_y (independent triple of high-row roots omitting y),
  else {y,z} ∪ J_y is I5. The L17 root cannot serve: 17+15 rows both
  omitting y live in a 23-vertex universe, intersection >= 9 > 8, and a
  B-(3,4)-free set of order 9 must contain a B-triangle (B has no I4),
  which with the adjacent pair would give K5. Correct.
- (7) rederived: |R_z∩R_w| = 24-(9+8-|O(z)∩O(w)|) = 7+|O(z)∩O(w)|;
  an A-edge bounds the intersection by 8, so omitted-set overlap <= 1.
  Hence one L-neighbor witnesses at most one obligation; each z has >= 8
  distinct L-neighbors; e_A(Z,L) >= 9*8 = 72 > 8*7 >= sum of full
  A-degrees of L (1+eps <= 7). Contradiction; no undecided edge of the
  profile is assumed. Conclusion "x=280 requires t=2,s=6" follows with
  the claim 03 table (t = 0,3,4 cannot reach 280). Correct.

### Claim 05 — the t = 2 equality profile is impossible; x <= 279 (accepted)

- Profile: two size-17 roots u,w, six size-16 roots L, ten size-15 roots Z.
  (5) at t = 2, s = 6 is the equality case (48 = 24*2) so every m_y = 2;
  (6) gives k_y <= 1; omitted 7-sets disjoint; cores R_u, R_w cover B with
  |R_u∩R_w| = 10. X = R_u\R_w, Y = R_w\R_u have size 7; M = X∪Y size 14;
  B = C ⊔ X ⊔ Y with |C| = 10. All verified.
- Cores: G[R_u] is (4,4)-free (K4 + u = K5; I4 forbidden in B), order 17,
  so 8-regular (neighborhood and co-neighborhood are (3,4)-free, order
  <= 8 each way, R(3,4)=9). Core edge count 68 (script).
- Identity (8) rederived three ways and exhaustively over all integer
  (e,f): per-vertex degrees on C give e(C,X) = e(C,Y); degree sums on X, Y
  give e(C,X) = 56-2e and e(X) = e(Y) = e; then
  e(C) = 68 - e - (56-2e) = 12+e and
  b = e(C)+e(X)+e(Y)+e(C,X)+e(C,Y)+f = 124-e+f (script: identity holds for
  every e in 0..21, f in 0..49). Also b = e(R_u)+e(R_w)-e(C)+f = 136-(12+e)+f.
  Correct.
- e >= 5: X has no I4 (subset of B), so its complement on 7 vertices is
  K4-free; Turan e(T_3(7)) = floor(49/3) = 16 (parts 3,2,2), so
  e >= 21-16 = 5. Script-verified. Correct.
- Obligation sum (9): for y in M exactly one 17-root and both m_y = 2
  L-roots omit y, forming an independent triple J_y; a row-15 z omitting y
  must neighbor J_y (I5), the 17-root is excluded by the same 9 > 8
  triangle argument as claim 04, so some L-neighbor of z omits y; by (7)
  each z–L edge witnesses at most one y; summing gives a_M <= e_A(Z,L).
  Correct.
- (10): A[L] has no I3 (u,w anticomplete, independent); its complement is
  triangle-free on 6 vertices, Mantel <= 9, so e(A[L]) >= 15-9 = 6
  (script). Full A-degrees in L are <= 7 with no edges to u,w, so
  e_A(Z,L) <= 6*7 - 2e(A[L]) <= 30. Correct.
- Degree sum on M: B-internal 14*8 + 2f = 112+2f (each core-vertex's other
  B-neighbors lie in the opposite exclusive 7-set); A-side each y in M has
  exactly 6-2 = 4 L-neighbors and exactly one of u,w, contributing 70; Z
  contributes 10*14 - a_M = 140 - a_M; no pivot edges to B. Total
  322+2f-a_M <= 14*24 = 336 (the cap 24 = recorded all-vertex bound, see
  Finding 1), so 2f <= 14+a_M <= 44, f <= 22. All arithmetic script-checked.
- Conclusion: b <= 124-5+22 = 141 < 144 contradicts the retained published
  premise b >= 144 (applicability: B in R(5,4,24), complement in R(4,5,24),
  276-132 = 144 — arithmetic verified; publication not recertified).
  With claim 03 (x <= 280) and claim 04 (t = 1 out), the table rows
  t = 0, 3, 4 already cap at 279, 279, 278, so x <= 279 for every
  degree-18 pivot on the stated premises. Quantifiers and scope honored;
  the claim explicitly does not exclude x = 279 or claim branch closure.

### Superseded-draft checks (history; no acceptance carried forward)

- First draft `8a79cbf...`, the original assignment target: all four
  assigned targets were audited against it.
  - Degree budgets 8/12/20 and opposing pair thresholds: verified identical
    to the accepted final claims 01–02.
  - t17/s16 tail table (then-claim 03): internally correct; its census
    applications were checked against the recorded premises: "16edges60"
    means every (4,4)-free 16-vertex graph has exactly 60 edges (recorded
    interval 60..60) — the s = 16 use (e <= 16*7/2 = 56 < 60) and the
    claim-04 use (degree sum 15*7+8 = 113 < 120) are valid given that
    premise; "15min50" (recorded interval 50..55) supported e(H) >= 50.
    One wording defect was noted: "For t=1, (5) first gives s<=17"
    misattributed a trivial counting bound (17 vertices outside L17) to
    equation (5), which only gives alpha <= 3. Bound true, citation wrong.
  - x287 boundary (then-claim 04): fully rederived — eps_u <= 2 from
    N_A(u) ⊆ {a,b}; eps_u = 0 excluded by (1); eps_u = 1 deleted via
    A-{u,a} (4,4)-free of order 16 with degree sum <= 113 versus the
    recorded exact 60; refined bound 2+d_w-p_w >= 8 giving h_w in {6,7},
    p_w <= 7-h_w; p <= 105-2e <= 5; a,b adjacent via union >= 7 > 5;
    e(A) = e+p+3 <= 108-e <= 58 and q = 85-e(A) >= 27 with q = 85-e(A)
    the branch-wide definition (used consistently with frontier_band,
    fixed_b_extensions, etc.); |R_a∩K| >= 7 forcing R_a = D ∪ S_a with
    |S_a| = 8; |S_a∩S_b| <= 1 from 7+overlap <= 8. All row counts
    (1+15+2 = 18, 17+240+30 = 287) checked. Valid given the census
    premises; these claims and their census text were later removed by the
    author and are NOT part of the accepted final note.
- Intermediate `fb6059b...`: claims 01–04 verified (identical to final).
  Its then-claim 05 (nine-cell reduction) contained a load-bearing step
  asserted without justification — "each y is omitted by exactly two L
  roots, one in T" requires the double count sum_y t_y = 3*8 = 24 with
  t_y <= 1 (triangle covers B) to conclude t_y = 1 for all y, which is what
  makes E_1, E_2, E_3 a partition. The statement is true (I supplied the
  count) but the proof omitted it; reported to the author, who replaced the
  whole nine-cell body. Nothing of that body remains in the final SHA.

## Findings

1. Claim 05 declares its premises incompletely: the degree-sum bound at
   line 242 uses the all-vertex cap d_G(y) <= 24 for the fourteen
   B-vertices of M, but the Setting scopes 0 <= epsilon <= 6 to u in A
   (lines 10-11) and the dependency list (lines 194-195, plus lines 16-20)
   names only R(4,3)/R(3,4)/R(3,3)/R(4,4), Mantel/Turan, and e(B) >= 144 —
   not R(4,5)=25 / the recorded global interval 18..24. The bound is load
   bearing: with d <= 25 the chain gives only b <= 148, which does not
   contradict 144. The premise itself is recorded in the cited baseline
   ("Since R(4,5)=25 ... d(v) <= 24"), so the proof is valid on recorded
   premises; only the declaration is missing. Fix: add the all-vertex
   degree cap (R(4,5)=25, baseline) to the Setting or to claim 05's
   Dependencies.

## Outcome

- Claim 01 `#claim-independent-row-degree-cuts`: **accepted**.
- Claim 02 `#claim-independent-row-combined-pairs`: **accepted**.
- Claim 03 `#claim-independent-row-tail-counts`: **accepted** (x <= 280,
  census-free, verified unconditionally for all t including 0).
- Claim 04 `#claim-independent-row-single-seventeen-boundary`: **accepted**.
- Claim 05 `#claim-independent-row-280-boundary`: **accepted** on the
  stated premises, with Finding 1 (premise declaration, P3) to be added;
  validity is unaffected because the premise is recorded in the cited
  baseline.
- Overall: **accepted** for the exact final revision SHA-256
  `eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69`
  (268 lines) recorded in the revision table above; the combined result
  x <= 279 is accepted as mathematics on the listed premises, not as
  branch closure.

## Limits

- External premises retained, not recertified: R(4,3)=R(3,4)=9, R(3,3)=6,
  R(4,4)=18, R(4,5)=25; the published (4,5,24) edge interval 116..132
  behind e(B) >= 144 (Angeltveit–McKay citation recorded in
  cross_upper_bound.md / reductions 8.1); the recorded census intervals
  50..55 and 60..60 (now used only by superseded drafts). Applicability
  and all arithmetic chaining these premises into the claims were verified.
- Mantel and Turan bounds are classical; their numerical values (9, 16)
  were checked directly.
- No novelty claim is made or checked; no certificate (Lean, exhaustive
  search, or solver) exists or is implied for any claim; no graph
  enumeration was performed by reviewer or author.
- The user-reported x136 closure is not referenced by any claim in the
  final note (grep-verified); nothing here certifies or depends on it.
- Acceptance covers mathematical validity of the five claims only. Search
  uses ("propagate", "terminate x>=281 / x>=280") remain proposals for the
  coordinator; x = 279 and all lower values remain open, and no degree-18
  or order-43 case is closed by this note.

## Addendum — renewed review after the premise-declaration fix

Author applied exactly Finding 1 (the all-vertex cap declaration) and
nothing else; no proof body was to change. Renewed byte-exact SHA-256,
computed with `sha256sum` immediately before this addendum:

    8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0

(270 lines; previously accepted revision was
`eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69`,
268 lines.)

Verification performed on the new revision:

- The full file was re-read and compared line-by-line against the
  previously accepted text. The only differences are:
  1. Setting gains two lines: "The recorded R(4,5)=25 gives
     18<=d_G(z)<=24 for every vertex z of G, including B vertices; the
     final degree sum uses this global upper cap." — a correct
     restatement of the baseline record ("Since R(4,5)=25,
     n-25 <= d(v) <= 24", n = 43).
  2. Claim 05 Dependencies rewritten in place to: "preceding claims;
     R(4,4)=18; the all-vertex degree cap d_G(z)<=24 from R(4,5)=25;
     Mantel/Turan bounds; the published e(B)>=144 premise".
- Line delta +2 (268 -> 270) matches exactly the two-line Setting
  insertion; the Dependencies field stayed two lines.
- All proof bodies of claims 01-05, all tables, equations (1)-(11), the
  Evidence and limits section, and the claim anchors/IDs are unchanged
  and still match the text audited above; the arithmetic chains were
  therefore not re-derived from scratch, only re-confirmed intact.
- The line-242 degree-sum bound 14*24=336 is now backed by a declared
  premise in both the Setting and the claim.

Finding 1: RESOLVED (applied exactly as recommended; withdrawn).

Renewed outcome: all five claims **accepted** at SHA-256
8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0.
This addendum supersedes the operative reviewed revision of the Outcome
section while preserving it as record; the mathematical outcomes are
unchanged. All Limits above still apply unchanged.


## Final manifest note — integration banner and review-wording fixes

- Source state at manifest time: SHA-256
  `2d118369b8436398b8c7c1e16930520dbcd5d8776f3bb1e5d97de35f1c78317c`
  (281 lines) = an 11-line `extension-research-integration` banner
  (file lines 1-11, recording this review's acceptance of reviewed-body
  SHA `8cfd9375...`, linking this review file, and stating permitted
  search use) followed by the accepted 270-line body byte-preserved.
  Verified: 270 + 11 = 281; every claim header, equation (1)-(11), table,
  the Setting cap declaration and claim 05 Dependencies were re-read
  after the banner and are unchanged, with all metadata line numbers
  shifted by exactly +11. The acceptance recorded above covers the body
  `8cfd9375...`; the banner merely records it. (Cosmetic: the banner line
  reads "is280" without a space — reported to the author, not fixed here,
  since the reviewer does not edit the source.)
- Two reviewer-side wording defects were reported by the author and fixed
  in this review file without changing any outcome: (i) the claim 01 t=2
  summary now correctly says an independent *triple* of outside vertices
  missing both anchors extends I to I5 (a pair would only give I4);
  (ii) the claim 01 t=3 inequality direction now reads sum_I d >= 15-3 = 12.
  Both match the derivations actually audited and the source's own text.
- All outcomes, findings status (Finding 1 resolved) and limits above are
  unchanged.
