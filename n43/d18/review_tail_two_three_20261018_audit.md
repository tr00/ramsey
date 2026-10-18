# Independent audit: two and three size-17 roots at the x=279 boundary

Claim(s): `n43/d18/tail_two_three.md` —
`#claim-tail-two-three-profiles` (claim 1),
`#claim-tail-two-three-one-deficit-exclusion` (claim 2),
`#claim-tail-two-three-five-sixteen-residual` (claim 3),
`#claim-tail-two-three-three-root-residual` (claim 4).

Author: TailTwoThree. Reviewer: AuditTwoThree. Distinct identities; every
inequality, degree sum, capacity, scalar maximum, and equality case below
was rederived from the ambient setting rather than accepted from the
author's arithmetic.

## Reviewed revision

Byte-exact SHA-256 of the exact uncommitted file (untracked, so no commit
id applies), computed with `sha256sum` at the start of this review and
re-computed immediately before writing it — identical both times:

    1cf1ac0ccada5735c22b4f3198b3f2f2d1b88d2f78d6d0dd233dfb1dfe4df583

(322 lines.) The file was not modified during this review. One read-tool
line-count discrepancy observed mid-review (the `:raw` selector reported
"of 323") was checked against `sha256sum` and `wc -l`; the byte hash is
unchanged, so it is a display artifact of that selector, not an edit.

## Dependencies reviewed

- `n43/d18/independent_row_cuts.md`: the integration-banner block was
  stripped and the remaining body re-hashed — byte-identical to the
  accepted reviewed-body SHA-256
  `8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`
  (270 lines). All four cited anchors (`claim-independent-row-degree-cuts`,
  `claim-independent-row-combined-pairs`, `claim-independent-row-tail-counts`,
  `claim-independent-row-280-boundary`) exist at their stated paths. The
  facts consumed here were re-checked against those accepted claims and
  used within scope: `s<=12-3t` and `k_y+m_y<=3` and `m_y<=4-t` (tail
  counts), `T` independent and anticomplete to `L` (combined pairs),
  `|R_p intersect R_q|<=8` for an A edge, the independent-`t` cuts
  8/12/20, the pair excess `epsilon_u+epsilon_w>=8`, the accepted `x<=279`,
  and the retained published input `b=e(B)>=144`.
- `n43/d18/large_row_extensions.md`: same procedure — body byte-identical
  to accepted SHA-256
  `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`.
  Anchors `claim-two-seventeen-core-balance` and
  `claim-seventeen-extension-domain` exist. The balance lemma's scope (any
  K5/I4-free `B` of order 24, any two order-17 `(4,4)`-free subsets) covers
  both places the note invokes it: claim 2's exclusive-set equations and
  claim 3's `7-h` / `10+h` restatement (there `|J|=10+h>=10` and tip count
  `7-h<=7` hold, so the lemma is applicable at every `h`).
- External premises retained as recorded and NOT recertified here:
  `R(4,4)=18`, `R(3,4)=9`, `R(4,5)=25` (behind `18<=d_G(z)<=24` and
  `0<=epsilon<=6`), the published `(4,5,24)` edge interval behind
  `b>=144`, and the reviewed `x<=279`. Applicability arithmetic for
  `b>=144` rechecked: `B` K5/I4-free on 24 vertices has complement
  K4/I5-free, so `e(B) >= 276-132 = 144`.
- The note's own premise declarations were audited: the Setting names the
  Ramsey premises, `r_u<=17`, the all-vertex degree interval (the premise
  the earlier audit of `independent_row_cuts` had to add — present here),
  `b>=144` with "no new census premise", and `x<=279`. The x136 closure is
  mentioned only to be excluded (line 34); grep confirms no other `136`
  occurrence in the file.
- Method: independent algebra plus one small integer-arithmetic script
  (profile enumeration, the three maxima in (5), Turan/Mantel values, the
  E_T=13 partitions). No graph enumeration, solver, catalogue, download,
  build, test suite, or Lean; no project-wide commands were run.

## Checks

### Setting and shared facts (rederived)

- Row identity: `d_G(u)=1+d_A(u)+r_u=18+epsilon_u`, equivalently
  `d_A(u)+r_u=17+epsilon_u` (the pivot contributes the `+1`); `Z` rows have
  `r<=15` because `r<=17` and sizes 16,17 are split into `L,T`, so
  `D>=0`; `x = 17t+16s+15(18-t-s)-D = 270+2t+s-D`. Correct.
- `r_u<=17` rederived: a subset `R_u` of order >=18 contains K4 or I4 by
  `R(4,4)=18`; I4 is impossible inside `B`, and a K4 together with `u`
  would be K5. Correct.
- (1): for an A edge, `B[R_p intersect R_q]` is K3-free (a B-triangle
  plus `{p,q}` is K5) and I4-free (inside `B`), so its order is
  `<= R(3,4)-1 = 8`; inclusion-exclusion gives
  `|O_p intersect O_q| = 24-r_p-r_q+|R_p intersect R_q| <= 32-r_p-r_q`.
  The four specializations 15-16, 14-16, 15-17, 14-17 give 1, 2, 0, 1.
  Correct.
- 8-regularity of every actual 17-core `B[R_u]` (K4-free because K4+`u`
  is K5, I4-free inside `B`): `N(y)` is K3-free (triangle+`y`=K4) and
  I4-free, and the co-neighborhood is I3-free (I3+`y`=I4), so both have
  order `<=8` by `R(3,4)=9` and `d(y)=8`. Correct; matches the accepted
  regularity used in the reviewed x=280 proof.

### Claim 1 — exact t>=2 profiles (accepted)

- `s-D=9-2t` at x=279. Constraints: `D>=0`, `s<=12-3t` (tail counts),
  `t<=4` (`T` independent by 17+17>32, `alpha(A)<=4` because A is
  I5-free). Script enumeration over `t>=2` with these constraints returns
  exactly `(2,5,0), (2,6,1), (3,3,0)`.
- The second tail bound `7t+8s<=72` was checked to be weaker at every
  candidate (`t=2: s<=7`, `t=3: s<=6`, `t=4: s<=5`), so omitting it from
  the enumeration loses nothing; it is cited as a dependency but is not
  load-bearing here.
- Row splits: `|Z|=18-t-s` gives 11 / 10 / 12 rows; `D=0/1/0` gives
  eleven size-15 / nine size-15 + one size-14 / twelve size-15. Correct.
- `t=4`: `s<=12-3t=0` and `D>=0` give `x=278-D<=278`; `t>=5` impossible
  since `T` is independent in the I5-free `A`. Correct. The claim
  explicitly disclaims realizability of the listed profiles — quantifier
  scope honored.

### Claim 2 — (2,6,1) exclusion (accepted)

- Disjointness of the two 17-row omissions is *derived*, not assumed:
  `sum m_y=48=24*2` with `m_y<=2` forces `m_y=2` everywhere, then
  `k_y<=1` gives `O_u intersect O_w` empty. Sizes `|X|=|Y|=7`,
  `|C|=10`, `|M|=14`, `B=C disjoint-union M`. Correct.
- (2) rederived from 8-regularity plus pointwise balance on `C`:
  on `X`: `56=2e+e(C,X)`; balance gives `e(C,X)=e(C,Y)`; on `C`:
  `80=2e(C)+e(C,X)` so `e(C)=12+e`; partitioning `B` gives
  `b=(12+e)+2e+2(56-2e)+f=124-e+f`. Correct.
- `e>=5`: `B[X]` is I4-free on seven vertices, its complement is
  K4-free, `ex(7,K4)=e(T(7,3))=16=floor(49/3)` (script), so
  `e>=21-16=5`. Correct.
- Obligation structure at `y in M`: omitting roots are one T and two L
  roots (`k=1`, `m=2`), independent (T internal; T-L anticomplete; two
  L roots sharing `y` cannot be adjacent by (1) at 16-16, which allows
  zero shared omissions). A `z` omitting `y` with no edge to this triple
  gives the I5 `{y,z}` union triple — every pair checked (all omissions
  make `y` anticomplete to the four A vertices; triple internally
  independent; the `z`-triple edges are the supposition). Uses ambient
  I5-freeness only. Correct.
- (3): for a size-15 `z`, adjacency to the omitting T root would force
  zero shared omissions by (1) at 15-17, yet both omit `y` — so the T
  root cannot witness; each `z`-L edge covers at most one `y` (15-16
  bound 1), and for fixed `z` distinct `y` map to distinct L neighbors,
  so `d_L(z)>=a_z` and summing gives (3). Correct.
- z0 capacities: 14-16 edges share at most 2 omissions, 14-17 edges at
  most 1 (by (1): 32-30, 32-31), so `a_z0<=2q+j` — and unlike the
  15-rows, a T edge *may* witness for z0 (one shared omission allowed),
  which the note correctly does not exclude. Root-specific caps: `j=1`
  gives an edge to one T root, bounding the omission on that root's
  exclusive 7-set by 1 and the other part trivially by 7, so `<=8`;
  `j=2` gives `<=2`; `j=0` gives `<=10` from `|O_z0|=10`. Hence (4)
  `a_z0<=min(2q+j,c_j)`, `(c_0,c_1,c_2)=(10,8,2)`. Correct.
- Mantel step: `A[L]` has no I3 (2 T vertices + I3 = I5), its complement
  on six vertices is triangle-free (<=9 edges), so `e(A[L])>=6`. L
  vertices have `d_A<=7` (`1+7+16=24`) and no T neighbors (17+16>32),
  so `e_A(Z15,L)+q = sum d_A(L) - 2e(A[L]) <= 42-12=30`. Correct.
- (5): `a <= 30-q+min(2q+j,c_j)`. The note's rewriting
  `min(10-q,q)<=5` (j=0), `min(8-q,q+1)<=4 for integral q` (j=1),
  `min(2-q,q+2)<=2 for q>=0` (j=2) was re-proved (if both arguments
  exceeded the stated value the two inequalities on `q` are
  contradictory), and a script over the actual range `0<=q<=6`
  reproduces the maxima **35, 34, 32** exactly as the self-check claims.
  The lemmas hold for all integer `q`, so no unlisted `q` case is
  omitted. Correct.
- Degree sum on M: B-side `14*8+2f=112+2f` (8 core neighbors inside
  `C` union own exclusive part, plus `f` cross edges counted once per
  endpoint); T-side 14 (`k=1` per vertex means adjacency to the other
  root); L-side `14*4=56` (`m=2` of six); Z-side
  `sum_z |R_z intersect M| = 10*14-a = 140-a`, which indeed depends only
  on `|M|=14` and not on individual row sizes; pivot contributes none.
  Total `322+2f-a <= 336` (the declared all-vertex cap 24) gives
  `2f<=14+a<=49`, `f<=24`, `b<=124-5+24=143<144` — contradicting the
  retained premise `b>=144` (listed in this claim's Dependencies and
  scoped in the Setting). Correct.
- The note deliberately uses the true 14-16 capacity of **two** in the
  `z0` argument and does not reuse the false one-omission shortcut; the
  final paragraph's characterization of that shortcut matches the proof
  as written.

### Claim 3 — t2s5 residual, conditional (accepted)

- Profile: eleven size-15 rows; `q_y=2-m_y>=0` (cap `m<=4-t=2`),
  `sum q_y=48-40=8`. Correct.
- Overlap `h`: each shared omission has `k=2` hence `m<=1` hence
  `q_y>=1`, so `h<=8`; `h<=7` from `|O_u|=7`. The note correctly states
  the omission inequalities do **not** force `h=0` and makes no
  disjointness assumption outside the flagged subcase — the conditional
  `O_u`-disjoint hypothesis is declared in the Scope field and again in
  the body ("conditional propagation constraint, not an exclusion").
- Balance lemma applicability at general `h`: exclusive sets `7-h`,
  common core `10+h`, both within the lemma's `0<=t<=7`, `|J|>=10`
  scope; the note correctly adds that the lemma does not supply
  disjointness.
- Mantel on five: `A[L]` triangle-free complement gives `e(A[L])>=10-6=4`,
  so `e(L,Z)<=35-8=27` (L A-degree sum `<=5*7`, internal edges counted
  twice, no T edges). Correct.
- (7): for `t=2`, `k<=2` (only two T roots exist), so `k+m=3` is exactly
  the two listed cases — the index set is exhaustive. Triples are
  independent as in claim 2; T witnesses are excluded for 15-rows by (1)
  at 15-17; each L edge covers at most one `y` (15-16 bound 1), so
  summing per-`z` distinct edges gives `<= e_A(Z,L) <= 27`. I also
  checked the converse direction (no *missing* obligations): at
  `k+m<=2` the four vertices `{z}` union the omitting roots union `{y}`
  form at most an I4, which is permitted, so obligations arise exactly
  at `k+m=3`. Correct.
- h=0 subcase: `M-E={m_y=2}` with `k=1` are obligated, so
  `a_M<=27+beta`; (2) re-derives identically at `h=0` (partition
  10/7/7, regular cores), `e>=5` as in claim 2, and `b>=144` gives
  `f>=20+e`. Degree sum: T `14*1`, L `sum(5-m_y)=70-sum_M m_y`, Z
  `11*14-a_M=154-a_M`, B `112+2f`, total
  `350+2f-sum_M m_y-a_M<=336`, i.e. `2f<=sum_M m_y+a_M-14
  =14-Q_M+a_M<=41-Q_M+beta` — arithmetic rederived. With
  `2f>=40+2e`: `beta>=Q_M+2e-1>=Q_M+9`. Then `|E|<=Q_M` (each E-vertex
  contributes at least 1), `beta<=11|E|<=11Q_M`, so
  `11Q_M>=Q_M+9` forces `Q_M>=1` (integer), i.e. the deficit (6) cannot
  lie entirely in `C=B-M`. All correct; the inequality chain is exactly
  the one labeled the "final inequality additionally assumes" in Scope.
- The `h>0` caveat is accurate: the `h` shared omissions lie outside
  `R_u union R_w`, `|C|=10+h` and `|M|=14-h` change the partition, and
  those vertices have no guaranteed 8-core neighbors, so the
  disjoint-case identity genuinely cannot be reused without their edges.

### Claim 4 — three-root residual (accepted)

- `m_y<=1` with `sum m_y=24` forces `m_y=1` everywhere, so the omitted sets
  `O_w` of the three L rows are disjoint 8-sets partitioning `B`; `k_y<=2` (from `k+m<=3`),
  hence no triple intersection of the three `O_ui`. Correct.
- L is a clique: a nonedge in `L` together with the independent,
  anticomplete three-set `T` is I5. This uses only ambient
  I5-freeness/A-type as the note states — no `B` premise. Correct.
- `e_A(Z,L)<=15`: an L vertex has `d_A<=7`, minus 2 within the L
  clique, minus 0 to `T`, so at most 5 Z neighbors; times 3. Correct.
- Domination: a `z in Z` without a T neighbor is anticomplete to `T`;
  for any `w in L`, `T union {w}` is an independent 4-set, so `z` must
  neighbor `w` or `{z} union T union {w}` is I5; then `z union L` would
  be K4 in the K4-free `A`. Hence every `z` has a T neighbor, and
  `z union L` K4 also gives `d_L(z)<=2`. Correct — argument order in the
  text (clique first, domination second) is sound.
- `E_T`: for 17-rows `d_u=epsilon_u`, so `E_T=sum_T d_u`. The reviewed
  independent-four cut on `T union {w}` (independent: `T` independent,
  anticomplete to `L`) gives `E_T+d_w>=20`; `d_w<=7` gives `E_T>=13`,
  improving the three-cut value 12. Summing `d_w-2` over L rederives
  (10)'s left inequality exactly: `sum(d_w-2)=sum d_A(L)-6
  =2*e(A[L])+e_A(Z,L)-6=e_A(Z,L)` (clique of three, `e(A[L])=3`), so
  `e_A(Z,L)>=3(18-E_T)`. `E_T<=18` follows from `epsilon<=6` on three
  roots (equivalently `d_u<=6` from the degree cap) — the retained
  Setting premise; correct even though the text compresses its
  derivation into the same sentence.
- Counts (11): `T` anticomplete to `L` and independent, so
  `E_T=e_A(T,Z)=sum_z d_T(z)=N_1+2N_2+3N_3` with `N_1+N_2+N_3=12`
  (every `z` dominated). At `E_T=13`: `N_2+2N_3=1` forces
  `(N_1,N_2,N_3)=(11,1,0)`. Correct.
- Equality structure at `E_T=13`: (10) pins `e_A(Z,L)=15` and every L
  vertex at `d_A=7` (both routes: the summed inequality and
  `E_T+d_w>=20`). Pairwise cuts `epsilon_i+epsilon_j>=8` with total 13
  give `epsilon_i<=5` (and `>=3`); a script confirms the only
  partitions of 13 into three parts at most five are `(3,5,5)` and
  `(4,4,5)` up to permutation, and both satisfy every pairwise `>=8`.
  Correct.
- P-geometry (12): from `sum k_y=21`, `k<=2`,
  `|{k=2}|=h`, `|{k=1}|=21-2h`, `|{k=0}|=3+h` — arithmetic checked; `P`
  is the disjoint union of the three pairwise intersections (no triple).
  At `y in P` the triple is 2 T + the unique L omission, independent;
  T witnesses are excluded for 15-rows by (1), and per-`z` distinct L
  edges give both `sum_z |O_z intersect P|<=e_A(Z,L)<=15` and
  `|O_z intersect P|<=d_L(z)<=2`. Attachment constraints rederived:
  adjacency to `u_i` makes `O_z` avoid `O_ui` (15-17 zero shared), so
  any P omission of such `z` lies in the other pair's intersection; two
  T neighbors clear all three pairwise intersections, leaving no P
  omission; three T neighbors push all nine omissions into `{k=0}`
  (a `k=1` vertex lies in exactly one `O_ui`), so `9<=3+h`, `h>=6`.
  Correct.
- The note claims no contradiction and leaves the profile unresolved;
  I found none either — (9)-(12) and the attachment constraints are
  simultaneously consistent with the scalar bounds, so "unresolved
  here" is accurate.

### Search use, coverage, strongest-conclusion section

- All four claim records match the claim template (ID, Kind, Review
  state, Scope, Dependencies, Conclusion, Proof, Search use, Reviews);
  anchors are stable and unique; every Search use is a *proposal* pending
  independent review. `ready`, not `accepted` — consistent with the
  pre-integration state.
- Strongest-conclusion paragraph verified link by link: the surviving
  profiles `{(2,5,0),(3,3,0)}` follow from claims 1+2; "t=2,s=6 has
  x<=278" needs both the reviewed `x<=279` (so `D>=1` for `x=280-D`)
  and the new exclusion of `D=1` (so `D>=2`) — both are cited in the
  sentence; `t=4` gives 278 from claim 1; and the **uniform bound for
  all t>=2 remains x<=279** — the file nowhere claims a 278 all-profile
  bound, matching the recorded contract.
- The "failed shortcuts" paragraph matches the proofs as written; in
  particular I verified the root-specific caps (4) are genuinely
  load-bearing: using only `2q+j` with, e.g., `j=0,q=6` would give
  `a<=36`, hence only `f<=25` and `b<=144` — no contradiction — so the
  caps `c_j` are what make the exclusion go through, as the note says.
- Grep confirms downstream references (`averaging_future_work.md`,
  `averaging_omission_cuts.md`) are explicitly gated on independent
  acceptance, so no ungated consumer exists.

## Findings

1. (P3, metadata only, non-blocking) Claim 3's `Dependencies` record
   (line 171) lists "reviewed row cuts, two-core balance, and b>=144"
   but omits the Mantel and Turan bounds its proof uses load-bearing —
   `e(A[L])>=4` by Mantel at line 188 and `e>=5` by Turan at line 205.
   Claim 2's record (line 83) names "Mantel and Turan bounds" for the
   identical inputs, and the Self-check paragraph (line 318) names them
   file-wide, so validity and file-level traceability are unaffected;
   the fix is to mirror claim 2's wording in claim 3's record. (Claim 4
   needs no Mantel/Turan — its `e(A[L])=3` comes from the clique — and
   its looser "row bounds" wording is covered by the Setting's explicit
   four-anchor list.)

## Outcome

- Claim 1 `#claim-tail-two-three-profiles`: **accepted** (profiles
  `(2,5,0)`, `(2,6,1)`, `(3,3,0)` exhaustive at x=279, t>=2; t=4 at
  x<=278).
- Claim 2 `#claim-tail-two-three-one-deficit-exclusion`: **accepted**
  (disjointness derived, (2)-(5) and the degree sum rederived, scalar
  maxima reproduced, `b<=143<144` contradiction valid on the declared
  premises).
- Claim 3 `#claim-tail-two-three-five-sixteen-residual`: **accepted**
  (deficit/overlap constraints and (7) correct; (8) accepted strictly as
  the conditional `h=0` propagation inequality its Scope declares).
- Claim 4 `#claim-tail-two-three-three-root-residual`: **accepted**
  (L clique/domination, `E_T>=13` with its `E_T=13` equality structure,
  and the P-omission bounds all rederived).
- Overall: **accepted** for the exact uncommitted revision SHA-256
  `1cf1ac0ccada5735c22b4f3198b3f2f2d1b88d2f78d6d0dd233dfb1dfe4df583`
  (322 lines), with Finding 1 (P3) as a non-blocking record-completeness
  note. Integration may prepend the acceptance banner preserving the
  reviewed body byte-for-byte. The claimed all-profile bound for t>=2
  remains **279** (both residual profiles are unexcluded); nothing here
  is 278.

## Limits

- External premises retained, not recertified: `R(4,4)=18`,
  `R(3,4)=9`, `R(4,5)=25`; the published `(4,5,24)` edge interval behind
  `b>=144`; the reviewed `x<=279` and the two dependency notes at the
  recorded accepted SHAs verified above. All arithmetic chaining these
  premises into the claims was checked.
- Mantel and Turan bounds are classical; their values (9, 6, 16) were
  checked directly by script.
- No novelty claim is made or checked; no certificate (Lean, exhaustive
  search, solver) exists or is implied for any claim; no graph
  enumeration was performed by reviewer or author; the x136 closure is
  not used by any claim.
- Acceptance covers mathematical validity of the four claims only. The
  Search uses ("branch", "propagate", "terminate this profile") remain
  proposals for the coordinator; x=279 with the two residual profiles
  `(2,5,0)` and `(3,3,0)` remains open, and no degree-18 or order-43
  case is closed by this note.

## Addendum — reviewer corrections and integration-banner record

Coordinator follow-up: two transcription slips in *this review* (not in the
author note) were reported and corrected in place; no author body text was
touched, and the accepted SHA-256 and all four outcomes above stand
unchanged:

1. The Setting check now reads `d_G(u)=1+d_A(u)+r_u=18+epsilon_u`,
   equivalently `d_A(u)+r_u=17+epsilon_u` — the pivot `v` contributes the
   `+1`.
2. The claim 4 check now states that the *omitted sets* `O_w` of the three
   L rows are the disjoint 8-sets partitioning `B`; the L rows themselves
   are 16-subsets of `B`.

Provenance record: after this review was delivered, the coordinator
prepended the `averaging-tail-integration` acceptance banner (which also
carries the Mantel/Turan dependency-record clarification for Finding 1)
to `n43/d18/tail_two_three.md`. As verified at this addendum, the wrapped
file hashes to
`16d1e3a30e27c60728d39a2bbcdafa25a938a16b476fa80a225002d85ee6738d`
(336 lines), and stripping exactly that banner block plus its trailing
blank line reproduces the accepted reviewed body byte-for-byte at
`1cf1ac0ccada5735c22b4f3198b3f2f2d1b88d2f78d6d0dd233dfb1dfe4df583`
(322 lines). This is a reference-only change: the accepted hash, the four
claim outcomes, and Finding 1's record (addressed by the banner without
body alteration) are all retained.
