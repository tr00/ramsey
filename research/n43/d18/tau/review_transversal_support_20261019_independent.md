# Independent review: support capacity, tripartite attachments, q1 transfer

Date: 2026-10-19. Task token: `d18c-tau-frontier-20261019`.
Reviewer token: `independent`. This file is the reviewer's own; no other file
was edited.

```text
Claim(s): research/n43/d18/tau/transversal_support.md
  #claim-tau-support-capacity
  #claim-tau-tripartite-attachments
  #claim-tau-q1-global-transfer
Author and reviewer: author `Main` (file header "Author: Main");
  reviewer `independent`, a distinct identity with no authorship of the
  reviewed file or of any dependency below.
Reviewed revision: working tree at HEAD 1581b3a ("closing x=137");
  the file is untracked (`git status` shows `?? research/n43/d18/tau/`), so the
  revision is the SHA-256 of the exact uncommitted file:
  905edd28fcd6640dd4246a83b01251405525c1c43ed475e00cc620835be8f67a
  (equals the expected review hash).
Dependencies reviewed: table below, at the exact current bytes I read.
Checks: assumptions, quantifiers, ambient types, algebra, case coverage,
  dependency applicability, permitted search use — all sections below.
Findings: no blocking gaps; two non-blocking reading notes.
Outcome: accepted (claims 1 and 2 on reviewed dependencies; claim 3's q1
  premise independently accepted at SHA-256 aca13de8...bcc7 on 2026-10-19,
  condition satisfied - see the dependency table and claim 3 section).
Limits: published census premises (E(4,5,18) interval, E(4,5,24) interval,
  R values) not recertified here, only their recorded use checked; no
  novelty claim checked or made; no formal certificate; no graph search,
  solver, catalogue processing, download, or Lean/engine work was used —
  only file reading, SHA-256, git read-only commands, and hand scalar
  arithmetic.
```

## Dependency table (exact bytes read)

| Dependency | SHA-256 (current) | Status used here | Preservation check |
|---|---|---|---|
| `research/n43/d18/frontier_band.md#claim-frontier-anchor-defects` | `c13e57b0f788d7286325f0d12ae73ef4851eb2f55b9bf8f25ce113a79918323a` | accepted (claim metadata + `review_frontier_anchor_20261016_main.md`; re-certified at `cc3bcc50…`/commit `ef944c2` in `x137/review_effective_anchor_20261018_anchor_rigor.md`) | `git diff 3eebcca 1581b3a` touches only the trailing status-update paragraph; the anchor-defects block and budgets are unchanged since `ef944c2` |
| `research/n43/d18/tau/q1_anchor_reduction.md` | reviewed body `aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`; current bytes `a58627f9ae262a2bd4d8f5d56183229a2844f43b092d3b523acac78f2c080b45` | **accepted**, all five claims, by `review_q1_anchor_reduction_20261019_independent.md` (reviewer token `independent`, distinct from author `TauQ1Closure`), outcome `accepted`, no findings, at the reviewed body hash | current file = additive 9-line acceptance banner (lines 1-9) + reviewed body; `sed '1,9d'` reproduces `aca13de8...bcc7` byte-identically |
| `research/n43/d18/x136/frontier_exclusion_handoff.md` | `a199142f594183660037639eddeeeb4ebffe331afcb92e00f0fa796384e9a127` | accepted at `c07f0973…` (commit `904f46e`, review outcome "accepted (all four claims)") | `git diff 904f46e 3eebcca` = integration banner + `Review state`/`Reviews` metadata flips only; proof bodies identical |
| `research/n43/d18/x137/frontier_closure.md#claim-x137-closure-exclusion` | `7090245d842a24dd4bb3aab71f3c973e3ea79dc5dd1ac8e7a37cae74cd93abfa` | accepted; banner records review at `ff597134…` | deleting exactly the banner lines 3–13 reproduces `ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`, so the reviewed body is byte-identical |
| `research/n43/d18/pivot_classes.md#1-complete-numerical-profiles` | `ab0849cf011c8b830eb5ded2a67d9439776caf7535c19bcf6ef79280cd61081c` | recorded exact root budgets; previously hashed in several accepted reviews at earlier revisions | every budget claim 3 uses was re-derived below, so acceptance does not rest on that chain alone |
| `research/n43/d18/tau/README.md` (column convention, shared assumptions) | `1d68090879bc6009bdb69be8f0d58b211d6097472d88fdea888b9c34a5ce2ab7` | branch scaffolding, read for the column/transversal convention | — |

## Setting and ambient (Ramsey) types

Re-derived independently:

- `A=N(v)` on 18 vertices is K4-free (a K4 plus `v` would be K5) and
  I5-free (ambient), i.e. (4,5)-free. `B=M(v)` on 24 vertices is K5-free
  (ambient) and I4-free (an I4 plus `v` would be I5), i.e. (5,4)-free.
  The file states exactly these two types, and claim 2's scope restates
  the (4,5)-type it uses. Correct.
- "A may and does contain independent four-sets": the strong reading is
  true by R(4,4)=18 — an 18-vertex K4-free graph must contain an I4 — so
  `tau >= 1` in this setting; the claims themselves never need the strong
  reading (they hold vacuously when no I4 exists).
- Recorded premises checked against `pivot_classes.md` section 1 and
  re-derived where load-bearing:
  - `d_B(a)=17-w(a)`: from `d_G(a)=18+eps_a = 1+d_A(a)+d_B(a)` and
    `w=d_A-eps`. Identity, correct.
  - `sum_A w = 306-x`: `2e(A)-E_A = 2(85-q)-E_A` and
    `x = 136+2q+E_A` give `306-x = 170-2q-E_A`. Correct. (Cross-checks
    with `x137` body "169=sum_A w" at x=137.)
  - `x = 136+2q+E_A`: degree sum over A,
    `324+E_A = 2e(A)+x+18`. Correct.
  - `0<=eps_z<=6` graph-wide: recorded in section 1 for every vertex `z`
    (`W=sum_z eps_z`). Independent derivation: a vertex of degree <=17
    has an antineighborhood of order >=25 that is K5-free and I4-free,
    contradicting R(5,4)=25; applying the same to the complement (also
    (5,5)-free) gives degree <=24. This also supplies the minimum-degree-18
    hypothesis of the q1 setting (see claim 3 below).
  - `d_A(a)<=13`: `N_A(a)` is triangle-free (else K4 with `a`) and
    I5-free, so `d_A(a) <= R(3,5)-1 = 13`. Correct.
  - `q>=0`: published E(4,5,18) <= 85, recorded in section 1
    ("0<=q_v<=35"). Used in claim 3 ("hence q>=2"); covered by the
    listed `exact root budgets` dependency.
  - `(5,4,24) minimum 144`: `B` is (5,4)-free on 24, its complement is
    (4,5)-free, published interval 116..132 gives
    `e(B)=276-e(B-bar) in 144..160`; recorded as `144<=b_v<=160`.
- `sum_I w <= 32` for every I4 (the accepted anchor-defect bound), using
  the **actual** 24-column interface, not an isolated A — verified
  end-to-end: every actual column `C_y` meets `I` (else `I` plus `y` is
  I5); an exact singleton class `{y: C_y cap I = {i}}` is a clique (two
  non-adjacent members plus `I-{i}` would be I5) and has at most three
  members (four plus `i` would be K5); hence singleton columns
  `n1 <= 12` and `e(I,B) = sum_y |C_y cap I| >= n1 + 2(24-n1) = 48-n1
  >= 36`, and `sum_I w = 4*17 - e(I,B) <= 68-36 = 32`. This matches the
  accepted `frontier_band` statement ("the existing singleton signature
  bound gives e(I,B)>=36") and the same derivation in the x136 handoff
  input 3. The isolated-vs-actual distinction is explicit in the Setting
  and again in claim 1's Dependencies ("actual-column transversality").

## Claim 1 — `#claim-tau-support-capacity`

Derivation checked line by line:

- Support: for an I4 containing `a`, the other three weights are the
  weights of three (distinct) elements of `A-{a}`, hence at least
  `m_3(a)`; with `sum_I w <= 32` this gives `w(a)+m_3(a) <= 32`, i.e.
  every vertex of every I4 lies in `S_w`. So the union of all I4s is
  contained in `S_w`. No sign assumption on `w` is used — correct, and
  the file says so.
- Transversal step: for any `S` containing every I4 and any `y in B`,
  `C_y cap S` meets every I4 (column meets the I4, and the I4 lies in
  `S`), so it is a transversal and `|C_y cap S| >= tau >= t`. Summing
  over all 24 columns double-counts `e(S,B) = sum_(a in S) d_B(a)
  = sum_(a in S)(17-w(a))`. Hence `24t <= e(S,B)`. Correct, including
  the degenerate case `tau=0`.
- Refinement 1: if every I4 avoiding `L` lies in `D`, then for each `y`
  the set `L union (C_y cap D)` meets all I4s (those meeting `L` are hit
  by `L`, the others lie in `D` and are hit by the column). Therefore
  `|L|+|C_y cap D| >= |L union (C_y cap D)| >= t`, so
  `|C_y cap D| >= t-|L|` and summing gives `e(D,B) >= 24(t-|L|)`.
  The displayed inequality is correct.
- Provenance sentences check out: `x137` final contradiction is literally
  `e(U,B) <= 117 < 24*5` (`frontier_closure.md` line 203) under the
  accepted banner; the x138/q1 use reaches `118 < 120`
  (`q1_anchor_reduction.md` claim 5: `99+(17-h)+(h+2)=118`,
  `12*9+(17-7)=118`), and both use projected support capacity rather
  than the blanket `|C_y|>=5` alone. Accurate.
- Quantifiers: scope "every rooted graph above; any integer
  lower bound t<=tau" matches the proof, which uses only the Setting,
  `sum_I w<=32`, and column transversality.

## Claim 2 — `#claim-tau-tripartite-attachments`

- Class cap: two vertices omitting part `i` share the whole of parts
  `j,k` (an edge), so adjacency between them plus that edge is a K4 in
  `A` — impossible; the class is independent. The class union part `i`
  is one independent set (part `i` internally non-adjacent since `H` is
  induced, members of the class miss all of part `i`), so
  `|C_i| + p_i <= 4`, i.e. `|C_i| <= 4-p_i`, zero at `p_i=4`. Both
  prohibitions used are exactly the ambient (4,5) type. Correct.
- Sum: `|Z| = sum_i |C_i| <= 12 - (p1+p2+p3) = 12-|H|`. Algebra correct.
- K333 + disjoint I4: a vertex adjacent to one vertex of each part closes
  a triangle, so its H-neighborhood is triangle-free and misses a whole
  part; four vertices and three parts give two missing the same
  three-vertex part; those two plus that part are 5 independent vertices
  — I5. Pigeonhole and the I5 step are both valid; no saturation or
  degree assumption is smuggled in.
- K222 arithmetic and the fixed-subset classification were checked
  independently: a 4-subset of `K_{2,2,2}` with parts of size 2 has type
  (2,2,0) or (2,1,1); type (2,1,1) spans all three parts and contains a
  triangle, so the triangle-free 4-subsets are exactly the three pairs of
  whole parts, each meeting two parts fully and missing the third. Such
  vertices fall under the first assertion with `p_i=2`, cap 2 per class,
  total `3*2 = 6 = 12-|H|`. The file's "at most 6 attachment vertices"
  and "twelve … impossible" are correct.
- The cross-reference sentence ("the equality obstruction used to rule
  out three disjoint saturated anchors in the q1 proof") describes the
  same K222-equality configuration that q1 claim 2 analyzes (its own text
  calls Claim 2 "the K_{2,2,2} equality obstruction"); q1's written
  contradiction there is the degree-sum route, not the `|Z|<=6` count.
  This is a provenance remark, is not used by any other claim in this
  file, and does not affect correctness.

## Claim 3 — `#claim-tau-q1-global-transfer`

Interface of the q1 dependency (inspected, not re-audited; all five
claims of `q1_anchor_reduction.md` were read at statement/interface level
only):

- Exact statement: claim 5 — "no q=1,E_A=0 rooted graph exists,
  equivalently this x138 slice is empty", scope "every rooted graph in
  the setting, without a connectedness assumption".
- Exact conditions of its setting: order-43 K5/I5-free; minimum degree at
  least 18; a root of degree 18; `q=1`, `E_A=0`. All four are met by the
  present file's Setting: the first two and the root are stated, and
  minimum degree 18 follows from the recorded graph-wide premise
  `0<=eps_z<=6` (`pivot_classes` section 1, re-derived above via
  R(5,4)=25 and complement symmetry). I found no proof step in the five
  q1 claims that references a degree outside `A` — every input used is
  `E_A=0`, `q=1`, K5/I5-freeness, and the recorded literature caps — but
  the hypothesis-level match above is what this review relies on.
- `q=1, E_A=0` is exactly `x=136+2+0=138`, budget slice `(84,0)` in the
  `frontier_band` table — "the x138 q1 case" is precise; the other x138
  slice `(85,2)` = q=0,E_A=2 is explicitly kept open, matching the q1
  file's own scope disclaimer.
- Propagation gate already present in the file ("Search use: propagate
  only after the q1 proof receives independent acceptance") and restated
  in its Review-and-scope section. This review first recorded claim 3 as
  conditional on the q1 proof's acceptance at exact hash
  `aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`.
  **Condition satisfied 2026-10-19**: all five q1 claims were independently
  accepted at that exact hash
  (`research/n43/d18/tau/review_q1_anchor_reduction_20261019_independent.md`,
  outcome `accepted`, no findings), and the proof file was subsequently
  given only an additive 9-line acceptance banner, verified here to leave
  the reviewed body byte-identical. The interface conditions inspected
  above therefore hold at the reviewed revision. Any later change to the
  q1 proof body re-pends this claim's use, per the workflow rule that a
  proof change requires renewed review.

Derivations checked:

- `q=1 => E_A>=1, x>=139`: `E_A` is a sum of nonnegative integers; the
  only excluded value at `q=1` is `E_A=0` (q1 slice), so `E_A>=1` and
  `x=136+2+E_A>=139`. Correct; rests on the now-accepted q1 exclusion.
- `E_A=0 => q>=2, e(A)<=83, x>=140`: at `E_A=0`, `q=0` gives `x=136`
  (excluded by the accepted x136 closure, whose scope is every
  order-43 K5/I5-free graph with a degree-18 root and `x=136`, no extra
  assumptions — verified against its scope line), `q=1` is the q1 case;
  with `q>=0` recorded, `q>=2`, `e(A)=85-q<=83`, `x=136+2q>=140`.
  Correct; the `q=1` exclusion step is the now-accepted q1 claim 5.
- Rootwise discipline: the file refuses to move zero-excess or
  connectedness conditions to another root without checking that root's
  own `E_v`. Correct and necessary.
- Regular case, `E_v=0`, `W=0`: handshake gives `e(G)=387` (also
  `387+W/2` from the budgets). Splitting edges,
  `b_v = e(G) - 18 - e(A) - x = 387-18-(85-q)-(136+2q) = 148-q_v`,
  matching the recorded identity `b_v = 148+W/2-q_v-E_v`. The published
  `(5,4,24)` floor `b_v>=144` gives `q_v<=4`. With `q_v>=2` from the
  `E_v=0` consequence (rootwise; every vertex is a degree-18 root in an
  18-regular graph, and minimum degree 18 holds trivially),
  `q_v in {2,3,4}` and `e(G[N(v)])=85-q_v in {81,82,83}`. Correct;
  `q_v<=4` and the half-ranges `t>=1161`, `i3<=1892` do not depend on
  q1, while `q_v in {2,3,4}`, `t<=1189`, `i3>=1864` do.
- Triangles: each triangle lies in exactly three closed neighborhoods,
  so `3t(G) = sum_v e(G[N(v)])` lies in `[43*81, 43*83] = [3483,3569]`,
  giving `1161<=t(G)<=1189` (integer endpoints: `3569/3 = 1189.67`).
- Goodman identity: with `d(v)=18`, each mixed triple (one or two edges)
  has exactly two vertices incident to one edge and one nonedge, so
  `sum_v d(v)(42-d(v)) = 2 * (#mixed)`; hence
  `t+i3 = C(43,3) - (1/2)*43*18*24`. Scalars: `C(43,3)=12341`,
  `(1/2)*43*18*24 = 9288`, difference `3053`. Then
  `i3 = 3053 - t in [3053-1189, 3053-1161] = [1864,1892]`. All match
  the file.
- Case coverage: `q=0` and `q=1` at `E_A=0` are the only excluded
  zero-excess slices; `q>=2` cells, the `q=0,E_A=2` x138 slice, and all
  of `q2,q3,q4` are explicitly declared outside this consequence's
  termination scope, matching the q1 file's disclaimer. The file claims
  necessary invariants only, not classification or exclusion, and its
  closing section disclaims full connected-d18 / order-43 closure. Scope
  discipline is correct.

## Search use and gate check

- Claim 1: "propagate; terminate a case only when this capacity is
  contradicted" — sound for a necessary condition; the file warns that
  passing `S_w`'s inequality proves neither existence of I4s with those
  weights nor of `G`.
- Claim 2: "terminate these explicitly specified local configurations"
  — sound; the file warns it is not a prohibition of arbitrary
  tripartite cores.
- Claim 3: gated on independent acceptance of the q1 proof — appropriate.
- All three claims are `Review state: ready`, `Reviews: none`, awaiting
  this review; no premature acceptance metadata was found.

## Findings

No blocking findings; no changes requested.

Reading notes (non-blocking, no impact on any conclusion):

1. In claim 1's conclusion, `S` is used with `w` and `e(S,B)`, which are
   only defined on `A`; "set S" is read as "subset of A" (as in `S_w`
   and the exact I4-union sentence). All uses inside the file satisfy
   this.
2. The column symbol `C_y` is not redefined in this file; it carries the
   branch convention `C_y = N_A(y)` from `research/n43/d18/tau/README.md` (S2),
   consistently with every dependency.

## Outcome

**accepted**, at SHA-256
`905edd28fcd6640dd4246a83b01251405525c1c43ed475e00cc620835be8f67a`.

- Claim `#claim-tau-support-capacity`: accepted on the accepted
  anchor-defect dependency plus actual-column transversality, both
  re-derived here.
- Claim `#claim-tau-tripartite-attachments`: accepted; self-contained on
  the ambient (4,5) prohibitions.
- Claim `#claim-tau-q1-global-transfer`: **accepted**. Its q1 premise was
  independently accepted at `research/n43/d18/tau/q1_anchor_reduction.md` body
  SHA-256 `aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`
  (all five claims, no findings; the post-review banner verified additive
  with byte-identical body), so the conditional first recorded in this
  review is satisfied. The x136 and x137 inputs are already accepted with
  verified body preservation, and the recorded root budgets were
  re-derived above. Propagation and termination use of claim 3 is
  permitted within its stated scope (the q=1 / E_A=0 consequences and the
  18-regular invariants), still excluding the q=0,E_A=2 x138 slice and
  any full-x138 or full-d18 closure claim.
- Permitted reading of this file's scope: the q1 zero-excess closure is
  not a full x138 closure and not a full connected-d18 or order-43
  closure; the file states this itself and this review confirms no
  stronger claim is made.
