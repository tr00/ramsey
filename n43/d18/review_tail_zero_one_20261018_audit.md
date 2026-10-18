# Independent audit: zero/one size-17 root omission and attachment cuts

Claim(s): `n43/d18/tail_zero_one.md` —

- `#claim-zero-one-omission-budget` (Claim 1, equations (1)–(3)),
- `#claim-zero-seventeen-bound` (Claim 2, t=0 bound x<=278),
- `#claim-one-seventeen-eight-sixteen` (Claim 3, t=1,s=8 gives D>=9, x<=271),
- `#claim-one-seventeen-residual-attachments` (Claim 4, residual inequalities
  (6)–(10) and the h=1 specialization).

Author: TailZeroOne. Reviewer: AuditZeroOne (review token `audit`). Distinct
identities; every inequality, count, profile list, and dependency hypothesis
below was rederived from the ambient setting and the reviewed dependency
texts, not accepted from the author's arithmetic.

## Reviewed revision

Byte-exact SHA-256 of the exact uncommitted file, recomputed with
`sha256sum` immediately before writing this review:

    d5e0f9319228d562e886c03e7017001a6d23e3e4c4a07dda01d2879efd4a983e

(320 lines, 13786 bytes.) The file is untracked (`git status --porcelain`
reports `?? n43/d18/tail_zero_one.md`), so no commit id applies and this
SHA is the operative revision. The hash was stable at three computations
during the review (start, middle, end); the author did not revise
mid-review. The whole document (lines 1–320) was read; nothing was edited
by the reviewer.

## Dependencies reviewed

- `n43/d18/independent_row_cuts.md`: banner records acceptance of all five
  claims at reviewed-body SHA
  `8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`,
  matching the renewed outcome in
  `review_independent_row_cuts_20261017_audit.md` (grep-verified both
  directions). Current file SHA (banner + preserved body)
  `9aa35b990079ca3e249c9df9b096252fcbbb73dec9b0280e3059b3a78e2434b6`.
  Claims consumed here: `claim-independent-row-combined-pairs` (r_a<=17,
  U independent and anticomplete to L, adjacent A-rows have common
  B-neighborhood K3/I4-free of order <=8, nonedge rule r_u+r_w>32) and
  `claim-independent-row-tail-counts` (s<=12-3t, 7t+8s<=72, and for each y
  the set J_y of high roots omitting y is independent with |J_y|<=3,
  k_y+m_y<=3, including t=0 in its scope).
- `n43/d18/large_row_extensions.md`: banner records acceptance of all six
  claims at reviewed-body SHA
  `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`,
  matching `review_large_row_extensions_20261017_audit.md` line 11
  (grep-verified). Current file SHA
  `4d91ae44929b9026eca2fd5de5a36a75927368658c904c37d4a6c10fb8d1cb71`.
  Claims consumed: `claim-seventeen-codegree-moments` (a 17-vertex
  (4,4)-free graph is 8-regular with 68 edges; attachment moments for any
  vertex subset), `claim-seventeen-extension-domain` (every outside vertex
  of a 17-core has >=9 core neighbors; an A-neighbor of the 17-root with
  row 15 is complete to the outside set and has exactly eight core
  neighbors), and `claim-common-eight-classification` (scope stated as
  *every* triangle-free I4-free graph of order eight, "in particular" a
  B-cell; conclusion e(S) in {10,11,12}).
- External premises, retained and not recertified: R(4,4)=18,
  R(3,4)=R(4,3)=9, R(3,3)=6 and R(4,5)=25 for the all-vertex interval
  `n - 25 <= d(v) <= 24` (`docs/mathematical_baseline.md` lines 30–33 —
  the note declares this in its ambient section, unlike the earlier
  finding in the row-cuts audit), and the published b>=144 premise
  (complement of E(4,5,24)<=132, recorded in `cross_upper_bound.md`
  section 1 / `n43/reductions.md` 8.1). The note uses b>=144 only inside
  (10), exactly as its ambient paragraph declares; re-verified by reading
  claims 1–3 for any census input: none appears.
- Reviewer tools: full reads of the note and both dependencies, plus one
  small python script of exact integer arithmetic (row identities,
  pigeonhole lists, ceil chains, (6)–(10) constants, the scalar example,
  h=1 signatures). No solver, enumeration, catalogue, download, build,
  project test, or theorem prover was used.

## Checks

### Ambient setting and stated quantities

- Global interval: d(w)>=18 (a vertex with d<=17 has >=25 nonneighbors,
  which contain K4 or I5 by R(4,5)=25; K4+w is K5) and d(w)<=24 (d>=25
  gives K4 or I5 in the neighborhood; K4+w is K5). Matches the declared
  premise. epsilon in [0,6] follows, and d_A(a)+r_a = d_G(a)-1 =
  17+epsilon_a.
- r_a<=17: B[R_a] is K4-free (K4 plus a is K5) and I4-free (B ambient),
  so R(4,4)=18 applies — this is the reviewed premise as cited.
- Row partition and identity: for z in Z, r_z<=15 (r<=17 and not 16/17),
  so delta_z=15-r_z>=0; summing gives x = 17t+16s+15(18-t-s)-D =
  270+2t+s-D. Script-checked over all sample profiles (t=0,s=9,D=0 -> 279;
  t=0,s=8 -> 278; t=1,s=8 -> 280; t=1,s=7,D=0 -> 279). Note: this exact
  identity is grouped under "the reviewed ... give ... the following
  facts" although the reviewed file only records x<=270+2t+s; it is an
  immediate identity from reviewed row sizes, not a misattributed
  theorem (see Findings).
- q_y>=0 and the triple-column notion: k_y+m_y<=3 because J_y union {y}
  is independent (reconstructed from the reviewed tail-count proof:
  two adjacent L16 rows both omitting y would intersect in >=9 > 8
  columns; U independent and anticomplete to L; adjoining y gives I5).
  Q = 72-7t-8s from sum_y k_y=7t and sum_y m_y=8s. "Triple column" is
  explicitly scoped to high-root omissions only, not to C_y — correct.

### Claim 1 — omission budget (equations (1)–(3))

- (1): for an A-edge ab, B[R_a intersect R_b] is K3-free (a triangle with
  a,b adjacent gives K5) and I4-free (B ambient), hence <=R(3,4)-1=8;
  with |R_a u R_b| = 24-|W_a intersect W_b| the identity
  |R_a intersect R_b| = r_a+r_b-24+|W_a intersect W_b| gives
  |W_a intersect W_b| <= 32-r_a-r_b. Identity and constants
  script-checked: 32-15-16=1, 32-15-17=0, 32-16-16=0. So capacities are
  1+delta_z for z–L edges and delta_z for z–U edges, exactly as stated;
  delta_z=0 (any size-15 row, all of which lie in Z) makes a size-17
  neighbor's capacity 0, i.e. disjoint omitted sets.
- (2): every triple column y in W_z forces an edge z–a with a in J_y
  (else J_y union {z,y} is I5: |J_y|=3, z not in J_y since z in Z,
  z anticomplete to y because y in W_z). Only U/L endpoints can serve,
  and each such edge carries at most the (1) capacity, so
  T_z <= (1+delta_z)d_L(z)+delta_z d_U(z). The overcounting direction is
  correct: obligations <= witness pairs <= sum of edge capacities; no
  distinctness of witnesses is assumed. No witness channel is missed
  (neighbors of z inside Z cannot be in any J_y).
- (3): nontriple columns number at most Q (each contributes >=1 to
  sum q_y), so triple columns number >=24-Q and
  T_z >= 24-Q-r_z = 9+delta_z-Q, floored at 0.
- Final identity d_A(z)=2+delta_z+epsilon_z<=8+delta_z rederived from
  d_A+r=17+epsilon and epsilon<=6.
- Quantifiers: every z in Z, t in {0,1} as scoped. (Equations (1)–(3)
  actually hold for all t; the narrower declared scope is harmless.)

### Claim 2 — t=0: x<=278; s=9 gives x<=270

- s<=9 at t=0 from 7t+8s<=72 (reviewed, census-free). Case s=9: Q=0 so
  every B vertex is a triple column. For each z in Z: (3) gives
  T_z>=9+delta_z>=9 while delta_z=0 would give T_z<=d_L(z)<=d_A(z)<=8
  (using d_A(z)=2+0+epsilon<=8) — contradiction, so every delta_z>=1.
  |Z|=18-9=9, hence D>=9 and x=279-D<=270. Case s<=8:
  x=270+s-D<=278. Exhaustiveness over the profile space verified by
  script: x=279 at t=0 forces (s,D)=(9,0), excluded; x=278 has candidate
  list {(8,0),(9,1)} and every s=9 profile is excluded outright (s=9
  forces D>=9, i.e. x<=270), leaving exactly (8,0): eight size-16 rows,
  ten size-15 rows (8*16+10*15=278). The claim's endpoint sentence and
  "no bound below 278" caveat are accurate. No census premise is used.

### Claim 3 — t=1,s=8: D>=9, x<=271

- Q=72-7-64=1, |Z|=9, d_U(z)<=1 (t=1). (3): T_z>=9+delta_z-1 =
  8+delta_z>0; combined with (2) and d_U<=1:
  d_L(z)>=ceil(8/(1+delta_z)). The chain to 8-4delta_z checked for
  delta=0..6 (8,4,3,2,2,2,2 versus 8,4,0,-4,...); the note's remark that
  the right side is nonpositive for delta>=2 is correct. Summing over
  the nine z gives e_A(Z,L)>=72-4D — (5).
- Assume D<=8: pigeonhole gives z0 in Z with delta=0, so
  d_L(z0)>=8=|L| and z0 is complete to L. Then:
  - A[L] triangle-free: a triangle plus z0 (complete to L) is a K4 in A;
    A is K4-free from the ambient K5-freeness of G. This uses only
    K4-freeness of A, not any claim about I4 in A.
  - A[L] I4-free: the size-17 root u is anticomplete to L (reviewed
    U-anticompleteness), so an I4 in L plus u is I5. Verified: the proof
    does **not** assume A is I4-free (A may contain I4); it derives
    I4-freeness of this specific eight-set from the reviewed
    anticompleteness. The note's shortcut-caveat section states exactly
    this, and additionally that triangle-freeness is *not* uniform (it
    needs the zero-deficit root) — both caveats correct: triangle-
    freeness genuinely fails to follow without z0, while I4-freeness of
    A[L] would in fact hold for any t>=1.
  - Dependency applicability: `claim-common-eight-classification` scope
    is "every triangle-free I4-free graph S of order eight; in particular
    S=B[...]" — applying it to A[L] (order s=8) is inside scope. Hence
    e_A(L)>=10.
- Upper bound: every l in L has d_A(l)=1+epsilon_l<=7 and no neighbor u,
  so e_A(Z,L)=sum_L d_A(l)-2e_A(L)<=56-20=36; (5) at D=8 gives 40>36.
  Contradiction; D>=9 and x=270+2+8-D<=271 (script: 280-9=271).
- Endpoint exhaustiveness at x=279, t=1: s<=8, so s-D=7 has the complete
  candidate list (7,0),(8,1) (script); (8,1) contradicts D>=9 at s=8;
  the survivor profile is one 17-row, seven 16-rows, ten 15-rows
  (17+7*16+10*15=279). The claim is scoped "x=279,t=1 requires s=7,D=0"
  and the census-free status of the t=1 bound 279 is accurate (no b>=144
  appears anywhere in claims 1–3).

### Claim 4 — residual profile t=1,s=7,D=0,x=279

- Sizes: |Z|=10 all row 15 (D=0), Q=9, |H|=17, |W|=7, B[H] 8-regular
  (reviewed 17-core regularity; applicability: H=B[R_u] is (4,4)-free).
  Row sum 17+7*16+10*15=279 checks against x=279.
- S=N_A(u) subset Z (u anticomplete to L), h=epsilon_u<=6, F=A-({u} u S)
  with |F|=17-h, A = {u} + F + S. A[F] is K4-free (heredity) and
  I4-free (u anticomplete to F, so I4+u=I5). For p in F its
  antineighborhood inside F is K4-free (subset of A) and I3-free (would
  form an I4 inside F with p), so R(4,3)=9 gives <=8 nonneighbors and
  d_F(p)>=8-h. Verified the exact route — again no ambient I4-freeness
  of A is used.
- (6): for l in L, d_S(l)=d_A(l)-d_F(l)<=7-(8-h)=h-1 (l in F, no edge
  to u), so e_A(S,L)<=7(h-1). h>=1: at h=0 the bound gives
  d_F(l)>=8 while d_F(l)=d_A(l)<=7 — contradiction, exactly the
  non-classification argument the note advertises. h<=6 from epsilon.
- (7): on W, k_y=1 and m_y<=2; on H, k_y=0 and m_y<=3 (from k+m<=3).
  Sum over the seven 16-rows: sum_H m_y=56-M, so
  sum_H(3-m_y)=51-(56-M)=M-5>=0, and M<=7*2=14: 5<=M<=14.
  Script-checked including realizability ranges (56-M in [0,51]).
- W-intersections: for z in S (row 15, adjacent to u), (1) gives
  |W_z intersect W|<=32-15-17=0, so W_z subset H with |W_z|=9. This
  matches `claim-seventeen-extension-domain`'s stated row-15 fact
  ("complete to W and has exactly eight neighbors in R_u": 7+8=15).
- Per-z obligations: #nontriple(H)<=sum_H q_y=M-5, so each z in S has
  >=9-(M-5)=14-M triple omissions inside H. Each needs an A-neighbor in
  J_y; for y in H, u not in J_y (u is adjacent to y), so the witness
  must lie in L — equivalently the u-edge capacity is delta_z=0. One
  z–L edge covers at most 32-15-16=1 column, hence
  h(14-M)<=e_A(S,L)<=7(h-1), i.e. M>=7+7/h and
  M>=ceil(7+7/h) = 14,11,10,9,9,9 for h=1..6 (script-verified, matches
  the four stated specializations).
- A[S] triangle-free (u complete to S, A K4-free); for z in S,
  |R_z intersect H|=8 exactly (adjacency bounds <=8, inclusion-exclusion
  gives >=15+17-24=8), triangle-free (triangle + z,u = K5) and I4-free
  (B ambient) — so the common-eight classification and the core
  attachment facts apply to these h eight-sets simultaneously; the note
  claims applicability only, assumes no incompatibility, and deduces
  nothing further from them.
- Degree sums in (9): f>=63 from extension-domain (>=9 H-neighbors per
  of the 7 W-vertices; applicability: W=B-R_u matches that claim's scope
  exactly); e>=5: complement of B[W] is K4-free (I4-free B), Turan gives
  <=floor(49/3)=16, so 21-16=5. b=68+f+e. Column sums:
  sum_W|C_y|=(49-M)+(70-a)=119-M-a (L: 7 rows x 7 W-columns minus
  omissions M; u: 0; Z: 70 minus a) and sum_H|C_y|=279-(119-M-a) =
  160+M+a — the identity x=sum_y|C_y| verified. Summing d_G<=24:
  2e+f+119-M-a<=168 -> f+2e-M-a<=49, and 136+f+160+M+a<=408 ->
  f+M+a<=112. All constants script-checked (168-119=49,
  408-136-160=112). a<=7(10-h): the h members of S omit no W vertex,
  each other Z row at most 7.
- (10): b>=144 -> f+e>=76; f+2e-49>=27+e>=32 for e>=5 — chain
  script-verified for e=5..21. This is the only use of the published
  premise, as declared.
- Scalar example h=2,M=11,a=24,f=72,e=5: checked every clause —
  (7) 5<=11<=14; (8) 11>=ceil(10.5)=11; (9) 72+10-11-24=47<=49,
  72+11+24=107<=112, 24<=7*8=56, f>=63, e>=5; (10) 35>=32;
  b=68+72+5=145; (6) internally feasible at h=2 (d_F>=6, d_A<=7,
  d_S<=1 consistent). Reviewer additionally checked the aggregate degree
  sums it induces: sum_W d_G=166<=168, sum_H d_G=403<=408. The note
  correctly labels it a scalar witness, not a graph.
- h=1 specialization: (6) gives e_A(S,L)=0 (7(h-1)=0); (8)+(7) give
  M=14, so all seven W columns have m_y=2. z0 has no L neighbor, so all
  nine of its H-omissions are nontriple (a triple y in H would need an
  L-witness in J_y). (7) says the total H-deficit is M-5=9, so these are
  exactly the nine nontriple H columns, each q_y=1 i.e. m_y=2, and the
  other eight have m_y=3. Script: 9*2+8*3=42=56-14; R_z0∩H has 8
  vertices, all triple; r_z0=8+7=15 consistent. A[F]-degrees:
  7<=d_F(l)<=d_A(l)-d_S(l)=7 so d_F(l)=7, d_A(l)=7, epsilon_l=6 —
  and this is consistent with the reviewed pair cut
  epsilon_u+epsilon_l>=7 (here 1+6=7, tight). No overreach: the
  paragraph states retention of all other obligations.
- All of (6)–(10) was additionally swept over its full integer ranges
  (script): for every h in 1..6 the system retains feasible tuples, so
  no hidden contradiction is being smuggled in, matching the note's
  "these inequalities do not by themselves contradict" statement.

### Coverage, shortcut caveats, and proposed search use

- Coverage table rows re-derived: t=0 -> 278 with residual (s,D)=(8,0);
  t=0,s=9 -> 270; t=1,s=8 -> 271; t=1 -> 279 with residual (s,D)=(7,0).
  All match.
- The note explicitly does **not** claim an all-profile bound below 279:
  "this note does not improve the reviewed all-profile bound x<=279 ...
  nothing is asserted about the other t families" — consistent with the
  stated contract that the all-profile bound remains 279, not 278. No
  t>=2 statement appears anywhere.
- Shortcut caveats all verified: Q=9 at the residual gives >=24-9=15
  triple columns while (3) at delta=0 is max(0,9+0-9)=0; the size-17
  neighbor's capacity is delta_z (retained in (4)'s first line before
  d_U<=1 eliminates it); A[L] triangle-freeness is derived only under
  D<=8 from a zero-deficit root; the scalar witness caveat matches the
  (6)–(10) sweep.
- Search use: all four claims declare "none pending review" with scoped
  proposals (terminate t=0 x>=279; terminate t=1,s=8 x>=272; propagate
  the residual, explicitly "not terminate"). The proposals do not exceed
  what is proved. Downstream consumers
  (`averaging_future_work.md`, `averaging_omission_cuts.md`,
  `reports/2026-10-18-averaging-tail.md`) reference these anchors but
  state that independent acceptance is required first — grep-verified;
  no banner or index was altered by this review (integration is the
  coordinator's step).

## Findings

None. Every assigned target was reconstructed independently — omission
witnesses and delta capacities (1)–(3), the conditional t=0 upper bound 278
and the s=9 -> D>=9 -> x<=270 split, the t=1,s=8 chain
D>=9 -> x<=271 including the delicate A[L] I4-free step (derived from the
reviewed anticompleteness of the size-17 root, not from any ambient
I4-freeness of A), the exhaustive t=1 endpoint list (7,0)/(8,1), the
residual inequalities (6)–(10), the H/W degree sums, the h=1 signature, the
stated scalar example, and every dependency's applicability — and no
hidden assumption, dead case, or overclaim was found. Two harmless
observations recorded for the record, neither affecting validity:

- The exact identity x=270+2t+s-D and delta_z>=0 are presented inside the
  sentence attributing "the following facts" to the reviewed row-cuts
  claims; the reviewed file records only x<=270+2t+s and r<=17. The
  identity is an immediate consequence of those reviewed row sizes
  (script-checked), so this is attribution grouping, not a false premise.
- Claim 1's declared scope is t in {0,1}, while its equations (1)–(3)
  hold for every t (nothing in their derivation uses t). The narrower
  scope is safe; the t>=2 note deliberately draws no conclusions.

## Outcome

- Claim `#claim-zero-one-omission-budget`: **accepted** (equations (1)–(3)
  and the capacity/witness counting, for every z in Z, t in {0,1}).
- Claim `#claim-zero-seventeen-bound`: **accepted** (t=0: s=9 forces
  D>=9 and x<=270; otherwise x<=278; x=279 excluded at t=0; x=278 leaves
  exactly s=8,D=0 as a residual profile, not an existence claim).
- Claim `#claim-one-seventeen-eight-sixteen`: **accepted** (t=1,s=8:
  D>=9 and x<=271; census-free t=1 bound 279; at x=279,t=1 the exact
  residual is s=7,D=0).
- Claim `#claim-one-seventeen-residual-attachments`: **accepted**
  (inequalities (6)–(10) with their declared hypothesis b>=144 only in
  (10), the scalar-consistency example, and the h=1 signature
  specialization).
- Overall: **accepted** for the exact revision SHA-256
  `d5e0f9319228d562e886c03e7017001a6d23e3e4c4a07dda01d2879efd4a983e`
  (320 lines, uncommitted). Acceptance covers the mathematical validity
  of these four claims only; integration banners may be prepended by the
  coordinator provided the reviewed body is preserved byte-for-byte at
  this SHA (any body change voids this review and requires renewal). The
  all-profile bound remains x<=279; this note does not change it.

## Limits

- External premises retained, not recertified: R(4,4)=18,
  R(3,4)=R(4,3)=9, R(3,3)=6, R(4,5)=25 (degree interval 18..24), and the
  published E(4,5,24)<=132 behind b>=144 (Angeltveit-McKay citation
  recorded in cross_upper_bound.md / reductions 8.1). Applicability of
  each use was checked; the numerical chains were verified.
- Dependency acceptances were taken from the integration banners whose
  SHAs match the recorded audits (grep-verified); the dependency bodies
  were re-read at their current hashes but not re-audited end to end.
- No novelty claim is made or checked; no certificate (Lean, solver, or
  exhaustion) exists or is implied for these claims. The existing Lean
  result `Ramsey.d18.degree18_cross_le_279` covers the older pivot bound,
  not this note.
- Not established by this note, and not by this review: realizability of
  any endpoint profile, exclusion of the t=1,x=279 residual or of any
  t>=2 family, closure of the degree-18 branch, or an all-profile bound
  below 279.
- The scalar example after (10) is arithmetic feasibility of the
  displayed inequalities only, as the note itself states; all actual
  intersection, Ramsey, degree, and ambient completion obligations
  remain open.
- Reviewer ran only exact integer scalar checks; no project validation,
  formatter, linter, build, or test suite was executed, per assignment.
