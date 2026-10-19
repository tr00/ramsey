# Independent review: anchor closure and low-weight claims at x=137

Date: 2026-10-19.

Claim(s): `n43/d18/x137/frontier_closure.md#claim-x137-closure-anchors`
(Claim 1) and `n43/d18/x137/frontier_closure.md#claim-x137-closure-low-weights`
(Claim 2).

Scope statement: this review covers Claims 1 and 2 only, including the
applicability and provenance of the three `effective_anchor.md` inputs, the
ambient graph types at every step, the singleton-signature argument, the
three-anchor tight K_{2,2,2} obstruction, the deletion-set excess accounting,
and both contradiction tables. Claim 3
(`#claim-x137-closure-exclusion`) is a separate sibling review
(`review_frontier_closure_20261019_capacity_audit.md` per the author's
report) and is explicitly not audited here; incidental reading of Claim 3
revealed no issue, but no audit of it is claimed.

Author and reviewer: Author `Main`, task `x137-frontier-closure-20261019`;
reviewer `AnchorAudit`, an independent review identity. The author's scalar
replay in `reports/2026-10-19-x137-frontier-closure.md` is treated as a
self-check, not as review evidence. All steps below were re-derived from the
branch hypotheses before comparison with the note.

Reviewed revision: SHA-256 of the exact uncommitted file,
`ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`
(`n43/d18/x137/frontier_closure.md`, untracked in the worktree at HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`). This matches the candidate hash
recorded in the author's dated report. Re-hashed at the end of this review:
unchanged. No build, test, lint, formatter, search, solver, download, or Lean
operation was performed; only read-only file/git inspection and a small
python scalar script for arithmetic re-derivation.

## Dependencies reviewed

| Dependency | Current SHA-256 | Previously recorded revision | Verified change scope since | Applicability |
| --- | --- | --- | --- | --- |
| `n43/d18/x137/effective_anchor.md` | `2a5400db2b8dc3397025e0cb038382b45d8369b112495f98b375bd291278234b` | `c33b0d6630873d1f1b9f8e03a7f52166b47b4348a1ce225dd15078c357d49daf` (bytes the accepted 2026-10-18 review certified; file at commit `37b0d2d`) | Full `diff` inspected: exactly 7 hunks, all review-state / search-use / review-link / consequence-wording lines (`ready` to `accepted`, `none` to `propagate`/`terminate`, conditional to recorded wording). Every proof line is byte-identical to the reviewed revision. | Inputs 1-3 below are content-identical to the accepted revision; the metadata-only flip is the recorded integration pattern, not a proof change. |
| `n43/d18/x137/review_effective_anchor_20261018_anchor_rigor.md` | `45ce4497b40f10349ae026a0b3d352f9bff96c257862e28832af79df8de64cbc` | matches author's input table | unmodified | Outcome recorded there: all three effective-anchor claims accepted by reviewer `AnchorRigor`; its own reviewed hash line matches `c33b0d66...` above. |
| `n43/d18/frontier_band.md` (exact budgets; `#claim-frontier-anchor-defects`) | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` | `cc3bcc50f5d315d08e667bfd522da9d2eef1560d917bdfce30432119337d3026` (version certified in the 2026-10-18 review; file at commit `ef944c2`) | `git diff ef944c2 HEAD`: one hunk only, 4 insertions/1 deletion, the closing paragraph's 2026-10-19 status update (`x=136` excluded). Budgets, four-transversal extension, and the anchor-defects claim block are untouched. | Anchor-defects claim state `accepted`, review `review_frontier_anchor_20261016_main.md`, whose Outcome line reads `accepted for the revised anchor intervals and their displayed linear/signature consequences`, and whose checks re-derive `e(I,B) >= 36` under the stated identities. Scope covers every independent four-set at any `q`, so it applies at `q=0`, `E=1`. |
| `n43/d18/x136/five_column_compatibility.md#claim-five-columns-core-caps` | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` | `2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e` (version as of the 2026-10-18 review; file at commit `249f50a`) | `git diff 249f50a HEAD`: exactly 8 changed lines, all `Review state: ready` to `accepted` and `Reviews: none.` to the review link, for the four claims. Proof text and cap table unchanged. | The m=10 cap 31 has two independent acceptances: `review_five_column_compatibility_20261015_independent.md` (Outcome: `accepted for all four claims on the recorded external premises`, deriving integer caps `16,21,27,31,37,43,49`) and the 2026-10-18 AnchorRigor review, which re-derived the Goodman route to 31 digit by digit. |
| Root `README.md#state-of-the-art` (linked as `../../../README.md#state-of-the-art`; heading `## State of the Art` exists) | `fff09d1ae4150385e869d15f974cde5070cfddc5a64a946422cbec6174923de4` | `c8f01e2f5077c8241212ee05f27397a21d6f9c67ca3c6b514065c51ade12e10c` (version recorded in the 2026-10-18 review; file at `37b0d2d`) | `git diff 37b0d2d HEAD`: 126/20 lines, all solver/engine documentation; a filtered scan of the diff shows no change to any table row or Ramsey entry. | Current table reads `(4,4,11)` max 36, `(4,4,12)` max 40, `(4,4,13)` 45, `(4,5,17)` max 79, `(4,5,14)` max 60, `R(3,4)=9`, `R(3,5)=14`, `R(4,4)=18`, `R(4,5)=25` - exactly the values the Setting and tables use. |
| `n43/d18/four_column_stability.md#claim-four-column-stability-01` (input 2 provenance chain) | `71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a` | `71fa0ce84eef...` (AnchorRigor dependency table) | unchanged since that review (single commit `2ce0cca`) | Degree floor on abstract four-set transversals at `q=0` was verified line by line in the accepted AnchorRigor review. |
| `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-01` (input 2 provenance chain) | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` | `e855ca074447...` (AnchorRigor dependency table) | unchanged since that review (single commit `8b18882`) | Same: scope covers abstract four-set transversals; no hidden `E=0` reliance (verified in the accepted review). |
| `n43/d18/x137/README.md` (branch context) | `b52e492154883d60fbac092fd5af560f2cfac89f0a34a34dc07558a9a008efd3` | n/a | n/a | Confirms the single permitted `x=137` profile `q=0, E_A=1`, `e(A)=85`, minimum column size 5; consistent with the Setting. |
| Author report `reports/2026-10-19-x137-frontier-closure.md` | `dc0eae7454690fc93edb677f31b56239eb5c24fd385443fe40d85ddb96a14a00` | n/a | uncommitted, untracked | Its input-hash table matches every hash I computed; its candidate hash matches the reviewed bytes. |

Unresolved external premises (retained as recorded, not recertified here):
the published extrema `E(4,5,17)=79`, `E(4,5,14)=60`, `(4,4,11)=36`,
`(4,4,12)=40`, the Ramsey values `R(3,4)=9`, `R(3,5)=14`, `R(4,4)=18`,
`R(4,5)=25`, and Turan's theorem with its equality case. Novelty is out of
scope.

## Checks

### Setting and budgets

- From `frontier_band.md` exact budgets at `x=137`: `1 = 2q + E` with
  `q, E >= 0` forces `(q,E) = (0,1)`, hence `e(A) = 85`,
  `sum_A d_A = 170`, a unique `p` with `epsilon_p = 1`, all other epsilons
  zero. `sum_A w = 170 - 1 = 169` re-derived.
- `d_B(u) = 18 + epsilon_u - 1 - d_A(u) = 17 - w(u)` re-derived from the
  partition `A + B + v`.
- Degree floor: `A` is (4,5)-free (K4-free by `v`-adjacency, I5-free by
  inheritance), `A - a` is (4,5)-free of order 17, so
  `d_A(a) = 85 - e(A-a) >= 85 - 79 = 6` using the recorded `E(4,5,17)=79`.
- Degree ceiling: `N_A(a)` is K3-free (a triangle plus `a` is a K4 in `A`)
  and I5-free, so `R(3,5)=14` gives `d_A(a) <= 13`. Consequently
  `5 <= w(a) <= 13` (only `p` loses the unit of excess). All as stated.

### Ambient graph types

- `G` is K5/I5-free; the proof uses only these two prohibitions in `G`:
  the I5 argument for column transversality of an anchor, the I5 argument
  forcing a singleton-class clique, the K5 arguments (four clique members
  plus their anchor; the three singleton members plus `a` and `i`), and the
  final K4-within-`A` contradiction (K4 in `A` together with `v` is a K5 in
  `G`). Each use checked and correctly typed.
- `A` is K4/I5-free with I4 allowed: every step using `A` uses only
  K4-freeness (`R` K4-free, neighborhood argument for `R(3,5)`, Turan on
  complements) or I5-freeness (`b4(j)` lower bounds). No step imposes
  I4-freeness on `A`; the anchors and transversals are independent four-sets
  that exist inside `A`, exactly as the Setting declares.
- `B` is K5/I4-free; no step misapplies B's type. The singleton classes are
  cliques in `G` inside `B` of size at most three because four members plus
  the anchor vertex give K5 in `G` (not because of a clique bound inside
  `B`); B's I4-freeness is never needed and never used.
- `H` and `H'` in Claim 2 are K4-free as subsets of `A`, and I4-free only
  under their respective transversal suppositions - precisely the (4,4)
  hypotheses required by `U(m)` for `m = 10, 11, 12`; for `m <= 9` only
  K4-freeness is used, which holds unconditionally.

### Provenance and applicability of the three effective-anchor inputs

1. Input 1 (`sum_I w <= 32` for every independent four-set `I`): present
   verbatim in `effective_anchor.md`'s premise list (`e(I,B) >= 36` for any
   independent four-set, therefore `sum_I w <= 32`, via
   `sum_I d_B = e(I,B) = 68 - sum_I w`), with its own provenance in
   `frontier_band.md#claim-frontier-anchor-defects` (accepted, scope: every
   independent four-set, every degree-18 pivot). Additionally the accepted
   AnchorRigor review re-derived `e(I,B) >= 36` independently of that
   dependency, so the input does not rest on a single chain. Applicability
   at `q=0, E=1`: confirmed (the anchor-defects intervals specialize with
   `eta_I = e(I,B) - 36 >= 0`).
2. Input 2 (an independent four-set with all four weights exactly 8,
   called an anchor): this is the conclusion of
   `effective_anchor.md#claim-x137-exact-anchor`, accepted at the reviewed
   bytes, content unchanged as verified above. The construction there
   chooses `I` disjoint from `L`; note that Claim 1 and Claim 2 of
   `frontier_closure.md` in fact need no choice: any anchor automatically
   avoids `L` because its weights are 8 while `L` requires `w <= 7`. The
   note's phrase "Fix an anchor I, disjoint from L" is therefore correct
   unconditionally.
3. Input 3 (every abstract transversal of the independent four-sets has
   size at least five, not only actual columns): matches the conclusion of
   `effective_anchor.md#claim-x137-no-four-transversal` word for word
   (no four-set transversal; hence `tau >= 5` with the inherited four
   bound; every actual `C_y` also at least five). Its dependency chain
   (degree floor on abstract transversals, core maxima, Turan) was checked
   in the accepted AnchorRigor review against unchanged dependency files
   (`four_column_stability.md`, `low_excess_columns.md` hashes still match
   that review's table). Input 3 is not used by Claims 1 or 2 (it feeds
   Claim 3, out of scope here); its recording in the Setting is harmless.

### Upper caps U(m) and b4

- `U(m)` for `m = 0..9` re-derived as Turan's K4-free extremal `t_3(m)`:
  0, 0, 1, 3, 5, 8, 12, 16, 21, 27 - matches the table, including the
  stated cap 5 at `m=4`.
- `U(10) = 31` is the core-cap claim's m=10 row (Goodman route), accepted
  twice over as recorded in the dependency table; plain Turan would give
  33.
- `U(11) = 36`, `U(12) = 40` are the published `(4,4)` maxima in the root
  table; the root table values were re-read at the current revision.
- Load-bearing check (why the note singles out 40): row `ell=2` of the
  first table has lower bound 42, so an elementary cap 42 would leave it
  alive (`42 <= 42`); row `ell=3` has lower bound 37, so the core cap 37
  at order 11 would leave it alive (`37 <= 37`); row `ell=4` has lower
  bound 32, so plain Turan 33 would leave it alive (`32 <= 33`). Exactly
  the caps the note chooses are needed, each for the row it serves. The
  "weaker elementary cap 42" remark resolves to the reviewed order-twelve
  cap `n43/d18/sos_order12_addendum.md#claim-order12-cap42` (also recorded
  as the historical sufficient cap in the anchor-review limits), so it is
  consistent with repository records even though that claim is not cited
  in the note's dependency line.
- `b4(j) = C(j,2) - t_4(j)` (sum of `C(part,2)` over four balanced parts)
  re-derived: applying Turan to the I5-free complement of `A[S]` gives
  `e(A[S]) >= C(j,2) - t_4(j)`. Scripted values for `j = 1..10`:
  0, 0, 0, 0, 1, 2, 3, 4, 6, 8; the note's tables use (for
  `ell = 2..10`) 0, 0, 0, 1, 2, 3, 4, 6, 8 - exact match, including the
  `b4(4)=0` entry.

### Claim 1: `#claim-x137-closure-anchors`

- Anchor bookkeeping: each anchor vertex has `w = 8`, so `d_B = 9` and
  `e(I,B) = 36` exactly.
- Every column meets `I`: a column missing `I` plus its `B` endpoint would
  be an I5 in `G`.
- Singleton class `{i}` is a clique: two nonadjacent members plus
  `I - {i}` give I5. Size at most three: four members plus `i` give K5.
  Hence `n1 <= 12`, and with every column of signature at least one,
  `36 = e(I,B) >= n1 + 2(24 - n1) = 48 - n1 >= 36`. The chain forces
  `n1 = 12`, each of the four classes of size exactly three (four classes,
  each at most three, total twelve), and the remaining twelve columns of
  signature exactly two. The `48 - n1 >= 36` step uses `n1 <= 12`, which
  the preceding sentence establishes; the ordering is correct.
- Double domination: for `a in A - I` with exactly one `I`-neighbor `i`,
  nonadjacency to any member of the size-three `{i}` class would give I5
  with `I - {i}`; so `a` is adjacent to all three, and
  `{a, i} + the three class members` form K5 (checked all ten edges:
  `a-i` by hypothesis, `a-class` forced, class a clique, `i-class` by
  signature). Zero `I`-neighbors gives I5 with `I` directly. Therefore
  every `a in A - I` has at least two `I`-neighbors. Correct and complete;
  note that the size-exactly-three conclusion is established before it is
  used here.
- Three disjoint anchors: `Z` has 12 vertices, `R = A - Z` has six. Each
  anchor pair has at least eight edges by double domination (each vertex
  of `J` lies outside `I`), so `e(A[Z]) >= 24` (internal anchor edges are
  zero, so `e(A[Z])` is exactly the sum of the three pair cuts). Degree
  sum on `Z`: `12 * 8 + delta = 96 + delta` (`delta` counts the unique
  `p`). `R` is K4-free with six vertices, so `e(A[R]) <= t_3(6) = 12`.
  Edge split: `e(A) = sum_Z d_A - e(A[Z]) + e(A[R])`, re-derived from
  `sum_Z d_A = 2e(A[Z]) + e(Z,R)`. Hence
  `85 = 96 + delta - e(A[Z]) + e(A[R]) <= 96 + delta - 24 + 12 =
  84 + delta`, forcing `delta = 1` and both inequalities to equality:
  `e(A[Z]) = 24`, `e(A[R]) = 12`. Turan equality at order six gives the
  unique extremal `A[R] = K_{2,2,2}`; pair-equality gives exactly two
  neighbors per vertex in each other anchor (both directions, by the
  handshake over the pair).
- `p` lies in `Z` (`delta = 1`), has zero neighbors inside its own anchor
  (independent), two in each other anchor: four in `Z`. With
  `d_A(p) = w(p) + 1 = 9`, `p` has five neighbors in `R`. Any five of the
  six vertices of `K_{2,2,2}` retain at least one vertex of each of the
  three parts (a part loses both only if the single omitted vertex were
  both its vertices), so they contain a cross-part triangle; together with
  `p` this is a K4 inside `A`, contradicting K4-freeness. Every step of
  the tight obstruction re-derives.

### Claim 2: `#claim-x137-closure-low-weights`

- `169 <= 7ell + 13(18 - ell) = 234 - 6ell` gives `ell <= 10`.
- Any independent four-set avoiding `L` has four weights at least 8 and
  sum at most 32 (input 1), hence is an anchor; anchors automatically
  avoid `L`.
- Supposition `2 <= ell <= 10`, anchor `I` fixed.
- Case A (supposition: `I union L` is a transversal): `H` has order
  `14 - ell`, is K4-free unconditionally and I4-free under the
  supposition. Deletion identity
  `e(H) = 85 - sum_(I union L) d_A + e(A[I union L])` re-derived from
  `sum_S d_A = 2e(S) + e(S,H)`. Excess accounting:
  `sum_S d_A = 32 + E_I + 7ell + E_L <= 32 + 7ell + 1` because `p` is
  unique and `E_I + E_L <= 1` (the note subtracts the single unit once,
  not twice - correct). Domination (Claim 1) gives `e(I,L) >= 2ell`, and
  `b4` gives `e(A[L]) >= b4(ell)`; internal `I` edges are zero. Result:
  `e(H) >= 52 - 5ell + b4(ell)`. Scripted rows (all strict):
  `42>40, 37>36, 32>31, 28>27, 24>21, 20>16, 16>12, 13>8, 10>5` for
  `ell = 2..10`, each against `U(14-ell)`. Every row of the first table
  re-derives exactly as printed.
- Failure of the Case A supposition yields an independent four-set
  avoiding `I union L`, hence avoiding `L`, hence an anchor `J` disjoint
  from `I` and `L`.
- Case B (supposition: `I union J union L` is a transversal): order
  `H' = 10 - ell`; same identity; excess over three disjoint sets is at
  most one unit:
  `sum <= 64 + 7ell + 1`; edge contributions `e(I,J) >= 8`,
  `e(I,L) >= 2ell`, `e(J,L) >= 2ell`, `e(A[L]) >= b4(ell)` (the note's
  "anchor cut ... eight edges, each L vertex two neighbors in each
  anchor" - both from Claim 1's domination). Result:
  `e(H') >= 28 - 3ell + b4(ell)`. Scripted rows (all strict):
  `22>21, 19>16, 16>12, 14>8, 12>5, 10>3, 8>1, 7>0, 6>0` for
  `ell = 2..10` against `U(10-ell)` - every row of the second table
  re-derives exactly as printed, including the order-0 and order-1 rows
  (a graph on zero or one vertex has no edges).
- Third-anchor step and its sub-four caveat: for `ell <= 6`,
  `|H'| >= 4`, failure of the Case B supposition places a witnessing
  independent four-set inside `H'`, giving a third anchor disjoint from
  `I, J, L` and contradicting Claim 1. For `ell >= 7`, `|H'| <= 3`, so
  that witnessing four-set cannot exist - which is exactly what the
  note's sentence "Rows with remainder order below four already
  contradict existence of an I4 there" records: in those rows the
  contradiction is already complete without invoking Claim 1 (the
  supposition holds vacuously, its table row contradicts, and its negation
  is impossible). Both branches close; case coverage over
  `ell = 2..10` is exhaustive, and `ell <= 1` is the goal.
- Quantifiers: Claim 1's conclusions are universal over rooted graphs and
  over every anchor; Claim 2's is universal over rooted graphs; the
  supposition style ("suppose some graph has `2 <= ell`") discharges them
  correctly. The stated dependency lines match the actual use (Claim 2
  uses Claim 1's domination twice and the `U(m)` caps; Claim 1 uses the
  anchor definition, budgets, and Turan with equality).

### Search use and scalar evidence

- Both claims record `Search use: none pending independent review` and
  `Review state: ready`; accurate. The proofs cite no search, solver,
  catalogue, or timeout evidence; the author's report explicitly limits
  itself to scalar replay. My own arithmetic re-checks (b4 row, all 18
  table inequalities, the `84 + delta` chain, the Turan `K_{2,2,2}`
  five-subset triangle property, and the `ell`, `t` scalar bounds) were
  executed as a small dependency-free python script and all passed; these
  are arithmetic checks only and prove nothing by search.

## Findings

No gap found in either claim; no correction requested. Supporting
reasoning and non-blocking observations:

1. Every scalar in both tables, both deletion identities, the excess
   accounting (single unit subtracted exactly once per identity), the
   singleton count chain and its equality forcing, and the tight
   `K_{2,2,2}` obstruction were independently re-derived from the branch
   hypotheses and agree with the note exactly.
2. The note's terse sub-four-remainder sentence in Claim 2 is correct as
   an exhaustive-case remark (reading recorded in the checks above); it
   is needed only to cover `ell >= 7` where the third-anchor step has no
   room, and the table row already contradicts there.
3. Claim 1's dependency line names setting inputs 1 and 2, but its proof
   uses neither the every-four-set sum bound (input 1) nor anchor
   existence (input 2) beyond the definition of "anchor". Over-declared
   dependencies have no soundness impact; recorded for completeness only.
4. The "weaker elementary cap 42" remark is consistent with repository
   records (reviewed order-twelve cap 42); it is a remark, not a
   dependency, and its load-bearing conclusion (published 40 needed at
   row `ell=2`) is confirmed.
5. Provenance note for integration: the accepted effective-anchor review
   certifies bytes `c33b0d66...`; the current file `2a5400db...` differs
   only in review-status metadata (verified by full diff, proofs
   byte-identical), so the "independently accepted" premise in the
   Setting is upheld at the reviewed content level. The same applies to
   `frontier_band.md` (status paragraph only) and
   `five_column_compatibility.md` (status flips only).

Outcome: **accepted** - Claims
`n43/d18/x137/frontier_closure.md#claim-x137-closure-anchors` and
`#claim-x137-closure-low-weights` are accepted for the exact SHA-256
`ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`,
on the stated external premises (recorded Ramsey values and published
edge extrema as recorded in the root table, Turan's theorem with its
equality case). Acceptance is of local mathematical reasoning only: it is
not a novelty claim, not a formal certificate, and not a branch-status
promotion; status updates remain with the coordinator.

## Limits

- External premises retained, not recertified: `E(4,5,17)=79`,
  `E(4,5,14)=60`, `(4,4,11)=36`, `(4,4,12)=40`, `R(3,4)=9`, `R(3,5)=14`,
  `R(4,4)=18`, `R(4,5)=25`, Turan's theorem with equality. Novelty not
  checked.
- No Lean or other formal certificate exists for these claims; none was
  created. No graph search, solver, download, or engine change was used
  or implied.
- Claim 3 (`#claim-x137-closure-exclusion`) is outside this review's
  scope and is not audited here; this review makes no statement about it.
- This certification covers the recorded SHA-256 only. A proof change
  requires renewed review; the dependency hashes above are the exact
  inputs this outcome rests on.
