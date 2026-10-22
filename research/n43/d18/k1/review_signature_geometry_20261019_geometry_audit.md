# Independent exact-revision audit of the k1 signature-geometry note

```text
Claim(s): research/n43/d18/k1/signature_geometry.md
  #claim-seven-signature-energy          (Section 1)
  #claim-minimal-signature-incidence     (Section 2)
  #claim-uniform-attachment-65           (Section 3)
  #claim-signature-slack-stability       (Section 4)
  #claim-near-minimal-edge-stability     (Section 5)
  plus the unnumbered "Consequences and exact limits" section and the
  file-level scope/limit statements
Author and reviewer: CoreSignatureTheory (author); GeometryAudit
  (independent reviewer, token geometry_audit) — distinct identities
Reviewed revision: file is untracked (uncommitted) at review time;
  SHA-256 of the exact bytes reviewed
  f5d3e739185bfcfb52c5520406c8c8461814308e5338c6e32564e50c18a840bb
  (362 lines), recomputed with sha256sum before and during the audit;
  the file did not change during review.
Dependencies reviewed: versions and unresolved external premises —
  see "Dependencies" below.
Checks: assumptions, quantifiers, ambient types, algebra, case coverage,
  dependency applicability, and permitted search use — see "Checks".
Findings: none (all five claims correct at the exact hash; details and
  supporting reasoning per claim below).
Outcome: accepted (at this exact hash only; any edit requires renewed
  review).
Limits: see "Limits".
```

## Dependencies and exact versions

All premises used by the note were traced to accepted sources at their
current hashes; each acceptance chain was verified, not assumed.

| Source | Reviewed/accepted SHA-256 | Current SHA-256 | Chain verified |
| --- | --- | --- | --- |
| `research/n43/d18/k1/cross_core.json` | `f114df4f0999ce41f91b87c1fa73bb887ebd365df2fb1871957c62b749be86ce` (5/5 claims, `review_attachments_20261019.json`) | `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d` | Independent `git diff 48bb291 3eebcca` shows only (i) the required att-01 correction inside `strict-seven-signature-budget`'s proof and (ii) status/reviews/search_use/verification_limits metadata; matches the metadata-only integration record in `research/reports/2026-10-19-d18k1-research.json` (PASS). |
| `research/n43/d18/k1/seven_cell.json` | `12291b747b0ffaf8c1210e204c88361520c702b2ea400dd61df1b396ff5cbc56` (9/9 claims, same review) | `f62130763dfb9315377ad542c33aabef9eb8555370c29db2b61f5e998f780bfd` | Independent `git diff 48bb291 3eebcca` shows status/accepted/reviews/outcome metadata only; all claim bodies byte-identical; matches the dated report's PASS record. |
| `research/n43/d18/large_row_extensions.md` (`#claim-seventeen-codegree-moments`, `#claim-common-eight-classification`) | reviewed body `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48` (`review_large_row_extensions_20261017_audit.md`, both claims **accepted**) | `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` (503 lines) | Exact reconstruction: deleting the 9-line integration banner plus its blank line and reverting the six `Review state`/`Reviews` label pairs reproduces the reviewed SHA-256 `1f53107e…` bit-for-bit; `git diff ef944c2 ceb2cb4` for this file is label-only. Reviewed body preserved verbatim. |
| `research/n43/d18/k1/research.json` (branch setup, not cited by a claim) | accepted, `review_research_20261019.json` | `bf434421efcf08b73813866ba8db7e76878700fb65104895539622d8127a069e` | Matches `research/reports/2026-10-19-d18k1-research.json` hash list. |

Premise-to-source mapping checked statement by statement:

* "Both `G[K]` and `B` are SRG(17,8,3,4), `B` has 68 edges" — from
  `critical-core-srg` (cores are SRG(17,8,3,4)) plus elementary
  complementation: a `B`-adjacent pair is a `G[K]`-nonadjacent pair with
  `15-(2·8-4)=3` common nonneighbors, and a `B`-nonadjacent pair is a
  `G[K]`-adjacent pair with `15-(2·8-3-2)=4` common nonneighbors; degree
  `17-1-8=8`, edges `17·8/2=68`. I recomputed both parameters.
* "`B[W_t]` triangle-free and I4-free, `w_t<=8`" — from
  `strict-seven-signature-budget`'s proof (`G[K][W_t]` has no I3 else
  with `t` an I4 in `K+T`; K4-free by heredity; `R(3,4)=9` on the
  complement) exactly as consumed.
* Pairwise disjoint `E(B[W_t])` and clique intersections of order ≤ 3 —
  `saturated-core-nonedge-packing` (misses at most one `t` per core
  nonedge, for adjacent as well as independent pairs) and K4-freeness
  of `G[K]`.
* `w_t=8 ⇒ f_t in {10,11,12}` — `claim-common-eight-classification`,
  whose scope is *every* triangle-free I4-free order-8 graph (applied to
  `B[W_t]`, legitimate because `B` is (4,4)-free as the complement of an
  (4,4)-free graph).
* S10 outside degrees `4` or `5` with multiplicities `1` and `8` —
  `claim-seventeen-codegree-moments`: for `e(U)=10`,
  `sum h_t=44`, `sum binom(h_t,2)=86`, hence
  `sum h_t^2=216` and `sum (h_t-4)(h_t-5)=216-9·44+180=0`, forcing one
  outside vertex of degree 4 and eight of degree 5. I recomputed the
  moment arithmetic.
* `a_K>=64` — `strict-seven-signature-budget` /
  `saturated-core-nonedge-packing` (`p,q>=64`), both present at the
  current hashes.
* `9<=d_C(t),d_D(t)<=17` and "at most six equal 9" (Claim 2's opening)
  — `strict-seven-signature-budget` conclusion bullets 1 and 4 and
  `single-attachment-bounds`; `2<=d_T(x)<=7` (Claim 4) —
  `exact-symmetric-budget-identities` and `research.json`
  `claim-k1-budget-obstruction`.

## Checks

### Claim 1 — `#claim-seven-signature-energy`

* `A^2=4I-A+4J` recomputed from SRG(17,8,3,4):
  `(k-mu)I + (lam-mu)A + muJ = 4I - A + 4J`; `A1=8·1`.
  Eigenvalues on `1^perp` satisfy `z^2+z-4=0`, minimum
  `s=-(1+sqrt(17))/2 ≈ -2.5615`.
* Rayleigh step: for indicator `x=(w/17)1+y`,
  `x^T A x = 8w^2/17 + y^T A y >= 8w^2/17 + s·w(17-w)/17`; the cross
  terms vanish because `1^perp` is `A`-invariant. Inequality (1) holds
  for every subset of size `w`, exactly as the conclusion states.
* `w=7`: right side `(357-35 sqrt(17))/17 ≈ 12.5113`. The written
  rationalization is correct: `>12` iff `153>35 sqrt(17)` iff
  `23409 > 20825` (both recomputed). Since `2e` is an even integer
  exceeding 12, `e >= 7`.
* Scope does not need the triangle-free condition, as stated; no
  induced-subgraph classification, no subset enumeration, no Paley
  identification, no uniqueness premise. Verified: the argument uses
  only the SRG parameters, so it is valid for every SRG(17,8,3,4).

### Claim 2 — `#claim-minimal-signature-incidence`

* Under `a_K=64`: seven integers ≥ 9 summing to 64, not all 9 (accepted
  strict bound), forces six 9s and one 10; hence
  `w=(8,8,8,8,8,8,7)` and `sum w = 119-64 = 55 = 6·8+7`. Correct.
* `sum_x binom(m_x,2) = sum_{i<j}|W_i∩W_j| <= 21·3 = 63`, and
  `binom(m,2)-(3m-6) = (m-3)(m-4)/2 >= 0` for **every** integer `m`
  (checked at all residues: 6,3,1,0,0,1 for `m=0..5`, nonnegative
  outside). Summing gives `>= 3·55-6·17 = 63`. Equality forces both
  `|W_i∩W_j|=3` for all 21 pairs and `m_x∈{3,4}` for all 17 points.
* `4a+3(17-a)=55` gives exactly four points of multiplicity 4; the
  four-set `F` and `m=3·1+1_F` follow.
* Per-signature double count:
  `18 = sum_{j≠i}|W_i∩W_j| = sum_{x∈W_i}(m_x-1) = 2w_i+|W_i∩F|`, so
  `|W_i∩F|=2` for `i<=6` (`w_i=8`) and `=4` for `i=7` (`w_7=7`), i.e.
  `F⊆W_7`. All four instances recomputed. Claim's conclusion matches
  the derivation exactly.

### Claim 3 — `#claim-uniform-attachment-65`

* Edge budget: pairwise disjointness gives `sum f_i<=68`; minima
  `6·10 + 7 = 67`, so total excess `<=1`. The case split ("none or
  one" exceptional among the six eight-point sets) is exhaustive;
  `f_7=7` or `8` in the no-exception case and `f_7=7` in the
  one-exception case — the proof never needs `f_7=10`, and the
  sentence "all the others have exactly ten" is scoped by its subject
  "at most one of `W_1,...,W_6`" and the following definition of
  "exceptional among these six".
* Point selection: every `W_i`, `i<=6`, contains two points of `F`
  (Claim 2), so in the exceptional case `F∩W_exceptional` is
  nonempty; `x∈F` lies in `W_7` and in exactly three of the six
  (`m_x=4`). Both cases handled; the three six-sets **not** containing
  `x` are always nonexceptional.
* (3): those three sets have `w=8, f=10`, i.e. type S10, and `x` is
  outside them, so `d_B(x,W_i)∈{4,5}`. Applicability of the accepted
  S10 identity confirmed on the exact hypotheses.
* (4): the edge sets `E(B[W_i])` are pairwise disjoint (accepted), so
  the edges at `x` inside `B[W_i]` over distinct `i`, together with
  the edges at `x` inside `B[W_7]`, are distinct edges at `x`;
  `d_B(x)=8` gives `sum_{i<=6, x∈W_i} d_B(x,W_i) <= 8-d_B(x,W_7)`.
* (5): Claim 2 gives `sum_{i<=6} 1_{W_i} = 3·1+1_F-1_{W_7} = 3·1-1_R`
  (verified pointwise on `F`, `R=W_7\F`, and `K\W_7`), and summing
  B-neighbors of `x` gives `24-d_B(x,R)` since `d_B(x)=8`.
* Contradiction: (3)+(4) bound the same sum by `23-d_B(x,W_7)`, while
  `R⊆W_7` implies `d_B(x,R)<=d_B(x,W_7)`, so
  `24-d_B(x,R) >= 24-d_B(x,W_7) > 23-d_B(x,W_7)`. Strictness is
  unconditional. Hence `a_K≠64`; with accepted `a_K>=64` and
  integrality, `a_K>=65`. The argument for `C` uses only `C`-side
  premises and the one for `D` only `D`-side premises; independent
  application is legitimate. No C-D cross count enters anywhere.
* Corollary: `6·9=54`, seventh degree `>=65-54=11`. Correct.

### Claim 4 — `#claim-signature-slack-stability`

* `m_x=7-d_T(x)` with accepted `2<=d_T(x)<=7` gives `0<=m_x<=5`;
  `rho_x=(m_x-3)(m_x-4)/2>=0` at every integer; `Delta_ij>=0` by
  saturated packing (intersections are cliques of order ≤ 3 in a
  K4-free core).
* Identity (6) recomputed:
  `sum binom(m_x,2) = 3(119-a_K)-102+sum rho = 255-3a_K+sum rho`
  and `= 63-sum Delta`, hence
  `sum rho + sum Delta = 3a_K-192 = 3(a_K-64)`. Verified at
  `a_K=64,65,66` (0, 3, 6) with an independent scalar script.
* Row costs recomputed: `m=0..5 → 6,3,1,0,0,1`. Consequences drawn:
  budget 3 at `a_K=65` excludes `m=0` (cost 6), and a single `m=1`
  row (cost 3) exhausts the shared budget; budget 6 at `a_K=66`.
  All correct, and the shared-budget framing (rows and pairs not
  independent) is accurate.
* (7): `sum_{x∈W_i}(m_x-1) = 18-Delta_i` and adding `2w_i` on the
  left gives `sum_{x∈W_i}(m_x-3) = 18-2w_i-Delta_i`; right side
  `2-Delta_i`, `4-Delta_i`, `6-Delta_i` for `w_i=8,7,6`. (8) is the
  standard double count of pair defects. Both verified.

### Claim 5 — `#claim-near-minimal-edge-stability`

* `sum_i (8-w_i) = 56-(119-a_K) = a_K-63`. Partitions of 2 give
  `8^6,6` and `8^5,7,7`; partitions of 3 give `8^6,5`, `8^5,7,6`,
  `8^4,7,7,7`. Exactly five patterns, exhaustively; no other pattern
  is possible because every deficit is a nonnegative integer (w_i<=8).
* Five- and six-point bounds from (1), recomputed numerically:
  `w=5`: `(170-30 sqrt(17))/17 ≈ 2.724 > 2` iff `136>30 sqrt(17)` iff
  `18496 > 15300`, i.e. `sqrt(17)<68/15`; integral `f>=2`.
  `w=6`: `(255-33 sqrt(17))/17 ≈ 6.996 > 6` iff `153>33 sqrt(17)` iff
  `23409 > 18513`, i.e. `sqrt(17)<51/11`; integral `f>=4` (even `2f`
  above 6). Both square-and-compare steps are sound.
* Table recomputed: minima `64,64,62,61,61` and
  `U_max = 68 - min = 4,4,6,7,7` — all five rows match.
  `U + sum excesses = 68 - M` exactly (each nonnegative), which is what
  the "bounds the sum" sentence claims; S11/S12 consume 1/2 excess
  units as stated; `a_K=65` covers at least 64 of 68 B-edges.
* Identity (9) recomputed symbolically:
  `(Am)_x = sum_i d_B(x,W_i) = [8-u_x] + [5(b-n_x)-epsilon_x] +
  sum_{i not in I, x not in W_i} d_B(x,W_i)`, where
  `sum_{x'~x} m_{x'} = sum_i d_B(x,W_i)` and the first bracket uses
  pairwise-disjoint incident edge sets. Rearrangement reproduces (9)
  exactly, term for term as the prose explains. S10 inputs:
  `epsilon_i(x)∈{0,1}` with exactly one outside vertex of value 1, and
  `sum_x epsilon_x = b` (each ordinary signature contributes once);
  `u_x>=0`, `sum_x u_x = 2U`. At `a_K=65`, `U<=4` gives
  `sum u_x <= 8`, as claimed. The identity needs only accepted packing
  plus the S10 facts for ordinary signatures, so its unrestricted scope
  is justified.

### Consequences and limits section

* `p,q>=65` (Claim 3) substituted into the accepted envelope
  (`76<=L,R<=92` from the (5,4,24) census, `L+R<=168` from T degree
  caps) gives `max(76,65+h)<=L,R<=92`, `L+R<=168` — correct as a pure
  substitution. With accepted offsets `i=L-76`, `j=R-76`:
  `76+i>=65+h ⇔ h<=11+i`, likewise for `j` — correct.
* The section explicitly disclaims feasibility, exhaustive scalar
  re-partition, and any improvement of `h<=18`; it uses no result
  beyond the accepted `5<=h<=18` context and does not invoke any newer
  Main result (no `h<=15` statement is used or needed here).
* The closing limits correctly state: no whole-branch exclusion, no
  existence of a 65-edge attachment, no classification of higher
  attachment layers, no two-core compatibility, no novelty claim, k1
  remains open, `search use: none`.

### Cross-boundary and quantifier audit

* Every producing-side new value (`p,q>=65`, patterns at 65/66,
  identities (6)-(9)) is either consumed inside the same file
  (consequences section) or explicitly marked `Search use: none`
  awaiting coordinator integration; no in-file consumer drops,
  no-ops, or silently narrows the new bound. Downstream accepted
  files (e.g. `cross_core.json`'s `exact-scalar-envelope`, still
  parameterized `p,q>=64`) are shared indexes owned by Main — the
  note itself flags that replacement is a permitted consequence, so
  the stale `>=64` downstream is an integration item, not a defect of
  this patch.
* Ambient types: all arguments are stated for `K=C` or `K=D` with
  `B=complement of G[K]` on 17 vertices; the consumed claims'
  scopes (`(4,4)`-free order 17, triangle-free I4-free order 8) match
  exactly what is applied. Complementation swaps K/I obstructions and
  preserves SRG(17,8,3,4); recomputed.
* No uniqueness of the 17-core, no catalogue, no Paley identification,
  no census input appears anywhere; premises are explicitly
  "arbitrary such cores".
* Permitted use: only displayed scalar arithmetic (recomputed with a
  deterministic script) and the accepted dependency statements; no
  search, solver, catalogue, download, build, test, or Lean/engine
  change was needed or performed by this review.

## Findings

None. Every algebraic identity, inequality direction, integer
rounding step, case split, and equality condition in the five claims
was rederived independently and matches the written text; the
quantifiers in each claim's Scope are the quantifiers actually
proved; every dependency applies at its recorded accepted hash.

Supporting reasoning highlights (not gaps): the tightest steps are
(a) Claim 3's unconditional strictness — `24-d(x,R) >= 24-d(x,W_7) >
23-d(x,W_7)` uses only `R⊆W_7`, so no degree case analysis is needed;
(b) Claim 5's `w=6` bound — the value `≈6.996` genuinely exceeds 6
(via `sqrt(17)<51/11`), so the evenness of `2f` really yields `f>=4`;
(c) Claim 2's double-sided sandwich at exactly 63/63 forces both
equality families simultaneously, which is what makes the `F`
structure available to Claim 3.

## Outcome

**accepted** — all five claims and the consequences section, at
SHA-256 `f5d3e739185bfcfb52c5520406c8c8461814308e5338c6e32564e50c18a840bb`
only. Any content change reopens review.

## Limits

* Acceptance covers the written mathematics at the exact hash, not a
  formal certificate; no proof assistant check was run or required.
* Dependency proofs were rechecked at the level consumed (SRG
  complementation, S10 moment arithmetic, eight-set classification
  applicability, packing statement); the full dependency audits
  remain those of `review_attachments_20261019.json`,
  `review_large_row_extensions_20261017_audit.md`, and
  `review_research_20261019.json` at the hashes recorded above.
* Literature premises (Ramsey numbers `R(3,3)=6`, `R(3,4)=9`,
  `R(4,4)=18`, the published (5,4,24) interval 144..160) are retained,
  not recertified here.
* No existence claim for a 65- or 66-edge attachment, no exclusion of
  the remaining attachment layers, no two-core compatibility result,
  no whole-k1 exclusion, and no novelty claim is verified or implied.
* `h<=15`-type results are outside this owned proof and were neither
  used by the note nor reviewed here.
* Downstream integration (updating shared indexes from `p,q>=64` to
  `p,q>=65`, closure evidence, changelog) is Main's; this review
  modifies only the owned review file.
