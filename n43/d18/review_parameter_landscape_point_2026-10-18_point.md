# Independent review: point-avoiding anchors and column bands

Claim(s): `n43/d18/parameter_landscape.md` —
`#claim-landscape-point-avoidance` (claim 4) and
`#claim-landscape-column-bands` (claim 5).

Author: Main (self-auditor, alone). Reviewer: PointReview. Distinct
identities; every equation, cardinality bound, quantifier, equality case,
and scalar table below was rederived from the ambient setting rather than
accepted from the author's arithmetic. Claims 1–3 of the same note are
under a separate core audit (CoreReview) and are treated here strictly as
a dependency boundary.

## Reviewed revision

Byte-exact SHA-256 of the exact uncommitted file (untracked in git, so no
commit id applies), computed with `sha256sum` at the start of this review
and re-computed immediately before writing it — identical both times:

    6d0af226c0723b698ec5fa033776f216b7953ba4885bf93fba59de21bc6164ca

(412 lines.) The source note was not modified by this review; this file
is the only artifact created.

## Dependencies reviewed

- **Claims 1–3 of the same note — pending, not accepted here.** Claim 4
  consumes Claim 3's curve `h(q)` only, and Claim 3 in turn consumes
  Claims 1–2. I checked the one interface my claims need arithmetically:
  `g(q) <= h3(q)` for every `q=0..8` (8/8, 7<=8, 7<=7 at q=2..5, 6<=7,
  5<=7) — so Claim 3's anchor is always disjoint from `L={d<=g(q)-1}`.
  Equations (3)–(7) are *not* used by Claim 4's exclusion tests, and the
  pure-certificate budget-zero reading is not invoked. If the core audit
  changes `h(q)`, claim 4 reverts to pending review; otherwise my
  acceptance below covers claims 4–5 only.
- `n43/d18/four_column_stability.md#claim-four-transversal-stability-01`
  (review state: accepted, coordinator review recorded) — the `9-q`
  member-degree floor. Its **recorded Scope says "actual size-four
  column"**, while the landscape ledger and claim 4's corollary apply it
  to *arbitrary* four-set transversals. I re-read the proof line by line:
  it uses only (i) `K=A-T` is `(4,4)`-free on 14 vertices with
  `e(K)<=50=U(14)`, (ii) the per-vertex cap 8 in `K` and 3 inside `T`,
  (iii) the `e(A-t)<=76` case analysis on `A[T]`, which needs only
  K4-freeness and `alpha(A)<=4`. Step (i) holds for any transversal by
  definition; the census lower endpoint 41, the B interface, and `E=0` are
  never used. The ledger's assertion "requires transversality, not
  actual-column status or E=0" is therefore correct, and the scope
  extension is applicable — recorded as Finding 3 below.
- `n43/d18/x142/q3/three_columns.md#claim-q3-three-column-excess-fourteen`
  (review state: accepted,
  `review_band137_three_columns_20261014_coordinator.md`) — verified the
  exact statement and quantifiers: *uniformly over all `E_A`, no
  selected-pivot maximality*, an **actual size-three column** at `q=3`
  forces `E_A>=14` (hence `x>=156`). Its Consequences section itself
  records: `E_A<=13` excludes size-three columns, and combining with an
  elementary size-at-most-two bound gives `|C_y|>=4`. The citation in
  claim 5 matches this scope.
- **Existing lower bound four** (used by claim 4's corollary as
  `tau>=4`): `transversal_four.md` theorem plus the
  `frontier_band.md` four-transversal extension — for `F=complement A`,
  `alpha(F)<=3`, `e(F)=68+q<=70`, i.e. `q<=2`, every `K4(F)`-transversal
  (equivalently every `I4(A)`-transversal) has size at least 4. At `q=0`
  this applies, and `x137/effective_anchor.md` already cites it in the
  same words. It is pre-existing, so claim 4's corollary does **not**
  depend on claim 5; claim 5's own table independently reproves `>=4` at
  `q=0` (no circularity either way).
- **Ledger premises** consumed: `d<=13` (`R(3,5)=14`), `R(4,4)=18`,
  `R(3,4)=9` behind the attachment cap 8, `sum_A d=170-2q`,
  `sum_I w<=32` and `eta_I=32-sum_I w>=0` (the actual-column singleton
  argument), `w=d-epsilon`, and the `U(m)` table. All applicability
  arithmetic chaining them into claims 4–5 was checked; their primary
  provenance is external and not recertified here (as the note itself
  states for `U(11..17)`).
- **Method**: independent algebra plus one small integer-arithmetic script
  (the finite necessary tests of (9)–(11) and `D`, the `g`/`h3` table
  comparison, `b4`/`T3`/`U` values, the `K433` six-neighbor template
  enumeration, and the 76/77/82 arithmetic). No solver, graph search,
  download, Lean, or engine change; no formatters, linters, or
  project-wide test suites were run; no file in the note or its proof
  dependencies was edited.

## Checks

### Setting, ambient types, quantifiers (both claims)

- Pure-graph ambient type for the transversal content: `A` of order 18,
  K4-free (subgraph sense, as used by `R(3,5)` on neighborhoods),
  `alpha(A)<=4`, `e(A)=85-q`, `0<=q<=35`. Claim 4's scope "every pure A;
  every prescribed vertex p" is honored: the proof fixes an arbitrary `A`
  and arbitrary `p`, and every test depends only on `(q, ell, t)` with
  `ell=|L|` graph-determined — no case depends on which vertex `p` is.
  Claim 5's Scope split is correct: its transversal bounds use only the
  pure-graph type; the column statements need the full pivot only
  through "every actual column is a transversal", which I rederived:
  a missed `I4` together with `y in B` is an independent 5-set in `G`
  (ambient `alpha(G)<=4`).
- Case split in claim 4 is exhaustive: `p in L` (the Claim-3 anchor
  already avoids `p`), or `p notin L` with `L u {p}` not a transversal
  (an `I4` disjoint from `L u {p}` avoids `p` and has all degrees
  `>=h=g(q)` because `A-L={d>=h}`), or `L u {p}` a transversal (the test
  battery). For `q=9..35` the table declares no conclusion, and the proof
  only claims positive `h`, so no gap exists at high `q`.
- `g <= h3` verified for all `q=0..8` (script), which is what
  "Claim 3 ensures an I4 disjoint from L" silently requires.

### Equations (9), (10), (11) and the cardinality bounds — rederived

- **(9)** — deletion identity for `S=L u {p}`:
  `e(A-S)=e(A)-sum_S d+e(A[S])` gives
  `e(K)=85-q-sum_L d-d(p)+e(A[L u {p}])`. With
  `sum_L d<=t*ell` (definition of `L`), `d(p)<=13` (ledger), and
  `e(A[L u {p}])>=b4(ell+1)` (no `I5` in any subset of `A`), this is
  exactly `85-q-t*ell-13+b4(ell+1)`. Correct.
- **(10)** — with `S=L`: `e(A-L)=85-q-sum_L d+e(A[L])` and
  `K=(A-L)-{p}` so `e(K)=e(A-L)-d_K(p)`, i.e. the stated exact identity
  `e(K)=85-q-sum_L d+e(A[L])-d_K(p)`. Two ingredients:
  `e(A[L])>=b4(ell)` (no `I5`), and **`d_K(p)<=14-ell`**, which the text
  compresses into "in particular". I verified the missing step: under the
  transversal assumption every `I4` with all degrees `>=h` contains `p`
  (otherwise it misses `L u {p}`); Claim 3 supplies one, and its other
  three vertices lie in `K` and are pairwise non-neighbors of `p`
  (independence), so `d_K(p)<=(17-ell)-3=14-ell`. The bound is valid;
  the justification is one sentence short (Finding 1).
- **(11)** — `A=(L u {p}) disjoint-union K` with `L u {p}` a transversal
  gives `e(A)<=T3(ell+1)+U(17-ell)+8(ell+1)`: K4-free inside the
  transversal, `U` on the K4/I4-free core, and the cap 8 per transversal
  vertex (its core neighborhood is K3- and I4-free, `R(3,4)=9`). Both
  (9) and (10) must be `<=U(17-ell)` for the same reason — K4-free
  hereditarily, I4-free by transversality — so all three tests are
  necessary under exactly the assumption being refuted. Correct.
- **Cardinality bounds** — `ell<=14`: Claim 3's `I4` sits in `A-L`
  ("the four vertices outside L"). `ell<=floor((64+2q)/(13-t))`: summing
  `170-2q=sum_L d+sum_{A-L} d<=t*ell+13(18-ell)` rearranges to
  `(13-t)ell<=64+2q`; `13-t>=6>0` throughout. Correct.
- **`D(q,ell+1)<=t`** for `ell>0`: `D(q,s)` is the per-member floor for
  any `s`-set transversal and every `L` member has `d<=t`. Note the
  stronger `max(D,9-q)` floor at `s=4` is also genuinely necessary but
  deliberately not used; the weaker test alone already excludes every
  cardinality (script), so no exclusion rests on the omitted term.

### Finite `g(q)` table — scalar validation

A script evaluated all four necessary tests for every `q=0..8`, every
`h=g(q)`, every `ell` in `0..min(14,floor((64+2q)/(13-t)))`:

| q | h | t | ell cap | surviving ell |
|---|---|---|---|---|
|0|8|7|10|**8**|
|1|7|6|9|none|
|2|7|6|9|none|
|3|7|6|10|none|
|4|7|6|10|none|
|5|7|6|10|none|
|6|6|5|9|none|
|7|6|5|9|none|
|8|5|4|8|none|

Exactly one survivor: `(q,h,ell)=(0,8,8)` — precisely the exception the
claim states. In particular `ell=0` fails (11) at every `q<=8` (needs
`85-q<=U(17)+8=76`, i.e. `q>=9`), so the `ell>0`-only `D` test loses
nothing. Exceptional-case scalars reproduced: `(10)=71-48+b4(8)=27=U(9)`,
the displayed chain `85-7*8-6+b4(8)=27`, `b4(8)=4`, `b4(9)=6`,
`T3(9)=27=U(9)`, `D(0,9)=0<=7`, `b4` and `T3` values all by definition.
The excluded-cardinality claim is fully reproduced.

### Exceptional equality case `q=0, h=8, ell=8` — rederived

- `e(K)>=27` from (10) and `e(K)<=U(9)=27` force equality; the exact
  identity `27=85-sum_L d+e(A[L])-d_K(p)` with
  `sum_L d<=56`, `e(A[L])>=4`, `d_K(p)<=14-8=6` has lower side
  `85-56+4-6=27`, so **each** bound must be tight: all eight `L` degrees
  are exactly 7, `e(A[L])=4`, `d_K(p)=6`. Any single slack overshoots 27.
  Equality in `b4(8)` (Turan in the complement) gives `A[L]=4K2`, four
  disjoint edges; equality in `T3(9)` gives `K=K333`.
- `N_K(p)` has 6 vertices and is triangle-free (K4-free `A`), so inside
  `K333` it lies in exactly two parts (a size-6 subset of parts 3+3+3
  with an empty part), i.e. two whole parts; `p` is anticomplete to the
  third part, so `A[K u {p}]=K_{4,3,3}` with the four-part `X3 u {p}`.
  (`K433` has 10 vertices = 9 + `p`.) Correct.
- Each `L` vertex has `7=1+6` neighbors: one inside `L` (four disjoint
  edges), six in this `K433`. It must meet the four-part (else the
  independent four-part plus the vertex is `I5`) and cannot meet all
  three parts (else `K4`), so its six neighbors occupy the four-part and
  exactly one three-part. Counting: `a+b=6` with `a<=4`, `b<=3` forces
  `a>=3, b>=2` — exactly the stated "at least three / at least two". I
  enumerated every six-neighbor distribution `(a,b,c)` of `K_{4,3,3}`:
  exactly four patterns meet the `I5` and `K4` constraints,
  `(3,3,0),(3,0,3),(4,2,0),(4,0,2)`, all satisfying the stated bounds.
- Type counting: valid neighbor **sets** per type are
  `C(4,3)C(3,3)+C(4,4)C(3,2)=4+3=7`, hence 14 templates and
  `C(7,2)+C(7,2)=42` same-type pairs — this independently reproduces
  the note's self-check description ("all 14 possible six-neighbor K433
  templates, including all 42 distinct same-type pairs"). Two same-type
  vertices share a neighbor in each occupied part (pigeonhole `3+3>4`,
  `2+2>3`) hence a common edge: adjacent gives `K4`; nonadjacent gives
  `I5` with the omitted independent three-part. So at most one vertex
  per type, `|L|<=2<8` — contradiction. The last equality case is
  genuinely excluded; `L u {p}` is never a transversal and the
  point-avoiding anchor exists with degrees `>=g(q)` for every prescribed
  `p`.

### Excess-support corollary (claim 4)

- Identity (8) rederived from the ledger: with `eta_I=32-sum_I w` and
  `w=d-epsilon`, `sum_I(d-h)+eta_I=sum_I d-4h+32-(sum_I d-E_I)
  =32-4h+E_I`. At `h=8` this is `E_I`.
- At `q=0` with positive excess supported on at most one vertex `p`: the
  point-avoiding anchor avoids `p`, so `E_I=0`; the sum
  `sum_I(d-8)+eta_I=0` has nonnegative terms (`d>=8` from `g(0)=8`,
  `eta_I>=0` from the ledger), forcing all four degrees to equal 8 and
  `eta_I=0`. Correct.
- Any four-set transversal member has `d>=max(D(0,4),9-q)=9` — I checked
  `D(0,4)=8` and re-verified (Finding 3) that the `9-q` floor applies to
  arbitrary transversals — so every member misses the degree-8 anchor
  and the transversal misses that `I4`: no four-set transversal exists.
- `tau>=5` and `|C_y|>=5` (12): the pre-existing `q<=2` four-transversal
  bound supplies `>=4` (or claim 5's own table does), sizes below are
  excluded, and a transversal of size 4 is excluded by the previous
  paragraph; columns are transversals by ambient `I5`-freeness. No
  circularity with claim 5.
- Scalar corollaries: `E<=1` at `q=0` means support size `<=1`, so floor
  five; `E=2..6` is correctly labeled conditional on the support pattern
  (a single vertex may carry up to 6). "At least two positive-excess A
  vertices are required for a four-transversal" is the correct
  contrapositive, and it genuinely strengthens "positive total `E_A`".
- Largest-excess paragraph: anchor avoids the max-excess `p`, so
  `E_I<=E-max_A epsilon` (all `epsilon>=0`); both defects are then
  bounded by `32-4h+E-max` since each term is nonnegative. The note
  correctly avoids claiming two unrelated anchors simultaneously.

### Claim 5 — column floors

- One-set: `A-{s}` is K4/I4-free on 17, `e<=U(17)=68`, cut
  `d(s)<=8`, so `e(A)<=76` and `q>=9`. Two-set: core
  `U(16)=60`, cut `<=16`, internal edge `<=1`, so `e(A)<=77` and
  `q>=8`. Three-set: `U(15)=55`, cut `<=24`, triangle `<=3`, so
  `e(A)<=82` and `q>=3`. All `U` values taken from the note's own table;
  attachment caps re-derived from `R(3,4)=9`. Script confirms every
  table row for all `q=0..35`: sizes 1/2/3 excluded exactly when
  `q<9`/`q<8`/`q<3`, size 0 excluded by `R(4,4)=18` (`A` K4-free, so
  `A` contains an `I4`), so the displayed floors 4/4/4,3/3/3/3/3,
  2, 1..1 all follow, and the enlargement remark is consistent (the
  per-size exclusions are already direct). Correct.
- `q=3, E<=13` dependency: the cited accepted theorem excludes actual
  size-three columns exactly at `E_A<=13`; sizes at most two are excluded
  by the two-set arithmetic just proved (at `q=3<8`), equivalently by the
  pre-reviewed `transfer_summary.md#claim-band137-two-transversal`
  (`e(F)<=71`). The combined `|C_y|>=4` is correct; the single-theorem
  attribution is compressed (Finding 2).
- Claim 4's addition at `q=0` (size five under support `<=1`) matches
  the corollary verified above; neither sentence asserts cell
  unrealizability, matching the recorded Scope and "Search use: none".

## Findings

1. (P3, presentation, non-blocking) Claim 4's proof states
   `d_K(p)<=14-ell` as "in particular" (lines 251–257) without spelling
   out the step that carries (10): the three non-`p` vertices of the
   high-degree `I4` lie in `K` and are non-neighbors of `p`, so `p` misses
   three of the `17-ell` vertices of `K`. The bound is correct (rederived
   above); the fix is one clarifying clause, not a change of statement.
2. (P3, attribution, non-blocking) Claim 5 lines 336–338 credit the
   `q=3,E<=13` column floor of four solely to the three-column excess
   theorem; that theorem excludes size-three columns only — sizes at most
   two come from the two-set bound proved earlier in the same claim (or
   the pre-reviewed two-transversal bound). The cited source records this
   exact combination in its own Consequences section, so the conclusion
   stands; only the attribution is compressed.
3. (P3, dependency record, non-blocking) The `9-q` floor's recorded
   Scope in `four_column_stability.md#claim-four-transversal-stability-01`
   reads "every a in every actual size-four column", while the landscape
   ledger (line 74) and claim 4's corollary apply it to arbitrary
   four-set transversals. I re-verified the proof is transversality-only
   (no B interface, no `E=0`, census lower endpoint unused), so the
   re-scope is sound and applicable; recommend recording the scope
   extension where the dependency is cited so a future dependency audit
   does not flag it as an unstated hypothesis.

## Outcome

- Claim 4 `#claim-landscape-point-avoidance`: **accepted** — (9), (10),
  (11), both cardinality bounds, and the `D` condition rederived; the
  scalar battery reproduces the claimed unique survivor `(0,8,8)`; the
  `K433` equality argument is valid including the template counts and
  the two-type contradiction; the excess-support corollary and (12)
  follow on the verified premises. Boundary: this acceptance is
  conditional on Claim 3's curve `h(q)` surviving the core audit
  unchanged (`g<=h3` checked arithmetically); a changed or withdrawn
  Claims 1–3 reverts claim 4 to pending review per the workflow gates.
- Claim 5 `#claim-landscape-column-bands`: **accepted** — 76/77/82
  arithmetic, the full `q=0..35` table, the empty-transversal exclusion,
  and the column corollaries rederived; the `q=3,E<=13` dependency
  verified at its exact quantifiers and review state.
- Overall: **accepted** for the exact uncommitted revision SHA-256
  `6d0af226c0723b698ec5fa033776f216b7953ba4885bf93fba59de21bc6164ca`
  (412 lines), with Findings 1–3 as non-blocking record notes. No source
  claim was altered. Cross-claim dependencies flagged: claim 4 -> claim 3
  (pending core audit); claim 4's corollary -> pre-existing `tau>=4`
  (available independently of claim 5); claim 5 -> nothing in claim 4
  (no circular edge); both -> ledger/`U(m)`/Ramsey premises (external,
  retained). The JSON map, its 3,600 cells and transition tables are out
  of scope here and are reproduced by the parent audit.

## Limits

- Claims 1–3 are **pending** the separate core audit; nothing in this
  review accepts them. Search uses remain the authors' proposals; this
  review changes no search use, pruning, or branch status, and closes no
  `x` branch, degree-18 case, or order-43 decision.
- External premises retained, not recertified: `R(3,4)=9`, `R(3,5)=14`,
  `R(4,4)=18`, the `U(11..17)` published maxima and their citations, the
  15-vertex census behind the `9-q` floor, and the ledger's actual-column
  singleton bound `sum_I w<=32`. All arithmetic chaining them into these
  two claims was checked; their provenance was not re-verified against
  the primary literature.
- No novelty claim is made or checked; no certificate (Lean, exhaustive
  search, solver) exists or is implied; no graph enumeration, download,
  or engine change was performed by author or reviewer.
- Acceptance covers the mathematical validity of claims 4 and 5 at the
  hashed revision only. A proof change to either claim, or to its
  recorded dependencies, requires renewed review.
