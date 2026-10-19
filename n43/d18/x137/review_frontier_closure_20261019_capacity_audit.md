# Independent review: projected-column capacity exclusion at x=137

Date: 2026-10-19.

Claim(s): `n43/d18/x137/frontier_closure.md#claim-x137-closure-exclusion`
(Section 3, "Projected-column capacity closes x=137").
Out of owned scope and not reviewed here: `#claim-x137-closure-anchors`
and `#claim-x137-closure-low-weights` (Claims 1-2 of the same note), both
still `Review state: ready`, `Reviews: none`. Per this audit's charter,
Claim 2's conclusion `ell<=1` is taken as an explicit conditional premise
of Claim 3's audit. Within Claim 3's proof that premise is the only
invocation of Claims 1-2: the three-anchor argument of Claim 1 is not used
(Claim 1 enters only through Claim 2's own dependency chain), and setting
input 2 (the effective-weight-eight anchor) is not used by Claim 3 at all,
matching its stated `Dependencies: preceding claims; setting inputs 1 and
3; degree/row budgets`.

Author and reviewer: Author `Main` (task token
`x137-frontier-closure-20261019`); reviewer `CapacityAudit` (task token
`capacity_audit`), an independent reviewer identity distinct from the
author. The author's scalar self-checks are not treated as review evidence.
No graph search, solver, catalogue processing, download, Lean change, or
test/build/lint/format run was used. The only executable checks were
throwaway arithmetic snippets; their outputs are recorded below as checks,
not as new evidence.

Reviewed revision: SHA-256 of the exact uncommitted file bytes

    ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb  n43/d18/x137/frontier_closure.md

The file is untracked in the worktree (`git status --porcelain` shows
`?? n43/d18/x137/frontier_closure.md`); HEAD is
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f` ("closing x=136", 2026-10-19)
and every tracked dependency below is byte-identical to HEAD.

## Dependencies reviewed

| Dependency | SHA-256 (this review) | Revision behind its recorded review | Drift checked here | Applicability |
| --- | --- | --- | --- | --- |
| `n43/d18/x137/effective_anchor.md` (setting inputs 1-3; source of input 3 via claim 3) | `2a5400db2b8dc3397025e0cb038382b45d8369b112495f98b375bd291278234b` | `c33b0d6630873d1f1b9f8e03a7f52166b47b4348a1ce225dd15078c357d49daf` (commit `37b0d2d`), as recorded in the anchor review | `git diff 37b0d2d ceb2cb4`: 79 diff lines, 14 insertions/13 deletions, all in the header banner, the three claim metadata blocks (`Review state`/`Search use`/`Reviews`) and the Consequences wording; no line inside any `Proof.` block changed | Proof bodies identical to the accepted revision; acceptance carries |
| `n43/d18/x137/review_effective_anchor_20261018_anchor_rigor.md` (accepted review of input 3) | `45ce4497b40f10349ae026a0b3d352f9bff96c257862e28832af79df8de64cbc` | unchanged since commit `ceb2cb4` | tracked, no drift | Reviewed in full for the abstract-transversal quantifiers (Checks 3) |
| `n43/d18/frontier_band.md` (exact budgets `k=2q+E`; `#claim-frontier-anchor-defects`, source of input 1; four-transversal extension) | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` | `cc3bcc50f5d315d08e667bfd522da9d2eef1560d917bdfce30432119337d3026` (commit `ef944c2`), as recorded in the anchor review | `git diff ef944c2 3eebcca`: 4 insertions/1 deletion, solely the trailing "Status update (2026-10-19)" note; claim and budget bodies unchanged | Anchor-defects scope covers every independent four-set at every `(q,E_I)`; budgets apply verbatim at `x=137` |
| `n43/d18/transversal_four.md` (four-transversal bound, `tau>=4`) | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` | unchanged since `81c768a` | tracked, no drift | Theorem is fully abstract ("every vertex set meeting every `K4` of `F`"); hypotheses `e(F)=68`, `alpha(F)<=3` verified at `x=137` in Checks 3 |
| `n43/d18/four_column_stability.md#claim-four-column-stability-01` (degree floor) | `71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a` | matches anchor-review record `71fa0ce84eef` | tracked, no drift | Proof traced line by line for abstract transversals (Checks 3) |
| `n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-01` (cross-reference for the abstract floor) | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` | matches anchor-review record `e855ca074447` | tracked, no drift | Scope explicitly covers abstract four-set transversals; proof uses only `e(A)=85`, `E(4,4,14)<=50`, `R(3,4)=9` (Checks 3) |
| `n43/d18/x136/five_column_compatibility.md#claim-five-columns-core-caps` (core cap `U(10)=31`, indirect via input 3's table) | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` | `2ac70b04e861...` (commit `249f50a`) as recorded in the anchor review | `git diff 249f50a ceb2cb4`: 8 changed line pairs, all `Review state:`/`Reviews:` metadata; proof bodies unchanged | Not used by `#claim-x137-closure-exclusion` itself; for input 3 the `m=10` row was independently re-derived inside the accepted anchor review (Limits) |
| Root `README.md#state-of-the-art` (external bounds) | `fff09d1ae4150385e869d15f974cde5070cfddc5a64a946422cbec6174923de4` | `c8f01e2f5077c8241212ee05f27397a21d6f9c67ca3c6b514065c51ade12e10c` (commit `37b0d2d`), as recorded in the anchor review | `git diff 37b0d2d 3eebcca -- README.md`: hunks start at line 102; the State-of-the-Art table (lines ~17-46) is untouched and no changed line touches the edge-bound rows | Table re-read this review: `R(3,5)=14`, `R(4,4)=18`, `R(4,3)=R(3,4)=9`, `R(4,5)=25`, `max E(4,5,17)=79`, `E(4,4,14)=50`, `min e(4,4,15)=50`, `(4,4,11..17)` maxima `36,40,45,50,55,60,68` |

External literature premises are retained as recorded (Limits); novelty was
not checked.

## Checks

### Assumptions, effective weights, degree floor (Setting lines used by Claim 3)

- Budgets: `k=1=2q+E` with `q,E` nonnegative integers forces `(q,E)=(0,1)`,
  so `e(A)=85` and exactly one vertex `p` has `epsilon_p=1` (all other
  epsilons vanish; uniqueness is just integrality of `E=1`). Verified from
  `frontier_band.md`'s degree/edge sums.
- `d_B(a)=17-w(a)`: `d_G(a)=d_A(a)+d_B(a)+1` (the `+1` is the pivot edge),
  `epsilon_a=d_G(a)-18`, hence `d_B(a)=17+epsilon_a-d_A(a)=17-w(a)`.
  `sum_A w=2*85-1=169`. Cross-check: `sum_A d_B=17*18-169=137=x`, and in
  the `ell=1` partition `(17-h)+9*11+(6 vertices of total weight 81-h)`
  gives `306-169=137` identically in `h`.
- Degree floor `d_A>=6`: `A-a` is (4,5)-free on 17 vertices, so the
  recorded `E(4,5,17)=79` gives `d_A(a)>=85-79=6`; then `w>=5` (worst case
  `p`: `6-1=5`), so `h=w(u) in {5,6,7}` in the `ell=1` case.
- Degree ceiling `d_A<=13`: `N_A(a)` is triangle-free (a triangle plus `a`
  is a `K4` in `A`, plus `v` a `K5` in `G`) and `I5`-free (five independent
  common neighbors already form an `I5` in `G`), so `R(3,5)=14` gives
  `d_A(a)<=13`, hence `w<=13` for all `a` including `p` (`13-1=12`).
- The `U(m)` cap table and `b4` machinery in the Setting are not invoked
  anywhere in Claim 3's proof (they serve Claims 1-2 only).

### Quantifiers: input 1 (`sum_I w<=32` for every independent four-set)

Re-derived independently: every `y in B` meets `I` (a missed independent
four-set plus `y` is an `I5` in `G`), so all 24 columns carry an
`I`-signature of size at least one. Each exact singleton class is a clique
(two nonadjacent members plus `I-{i}` give `I5`) and has at most three
members (four plus `i` give `K5` in `G`). With `n1` the singleton-column
count, `36<=n1+2*(24-n1)=48-n1` and `n1<=12`, so `e(I,B)>=36`. Then
`sum_I w=68-e(I,B)<=32`. The source claim
`#claim-frontier-anchor-defects` states the quantifier "every independent
four-set `I` in `A`" for every degree-18 pivot (Checks dependency table);
Claim 3 applies it exactly to independent four-sets of `A`. Confirmed.

### Quantifiers: input 3 (`tau(I4(A))>=5` for abstract transversals)

Inspected `effective_anchor.md` claim `#claim-x137-no-four-transversal`
and its accepted review line by line:

- The claim's `Scope` says "every abstract I4-transversal" and the proof
  supposes an arbitrary such `T`, not an actual column. The abstract/actual
  distinction is stated in the conclusion ("no four-set I4-transversal
  exists; every actual `|C_y|>=5`").
- Load-bearing input A (degree floor `d_A>=9` on every member of an
  abstract four-set transversal): traced the proof of
  `#claim-four-column-stability-01` step by step. Actual-column status is
  used only in the first sentence, to establish that `K=A-T` is (4,4)-free;
  for an abstract `T`, transversality gives `K` (4,4)-free directly
  (`K4`-free as a subset of `A`, `I4`-free because `T` meets every `I4`).
  Every later step needs only `|T|=4`, `K`'s (4,4)-freeness, `A`'s K4/I5
  type, `e(A)=85-q`, `E(4,4,14)<=50` and `R(3,4)=9` - all satisfied at
  `x=137` (`q=0`, `e(A)=85`). The claim's stated `Scope` line reads
  "actual size-four column", narrower than its proof; the generalization is
  explicitly documented in `effective_anchor.md`'s Dependencies section,
  was verified line by line in the accepted anchor review, and was
  re-traced here. Cross-support: `#claim-r2-low-excess-01` states the
  quantifier explicitly ("whether or not T is an actual B column"); its
  note-level setting is `x=136`, but its proof uses only `e(A)=85`,
  `E(4,4,14)<=50` and `R(3,4)=9` - re-confirmed here that no step uses
  `E=0` or `x=136`, so it applies at `x=137` as well.
- Load-bearing input B (`tau>=4`): `transversal_four.md`'s theorem is
  fully abstract ("every vertex set meeting every `K4` of `F` has size at
  least 4"); a set of size below three is enlarged to a three-set (a
  superset of a transversal is a transversal). At `x=137`,
  `e(F)=C(18,2)-85=68` exactly and `alpha(F)=omega(A)<=3`, so the
  hypotheses hold verbatim. The census lower bound `min e(4,4,15)=50` is
  recorded in the root table and in `transversal_four.md`'s citation.
- Non-vacuity of `tau`: `R(4,4)=18` on `|A|=18` with `A` `K4`-free forces
  an `I4` in `A` (equivalently, the theorem itself forces a `K4` in `F`),
  so "every transversal has size at least five" is not vacuously
  satisfiable.
- Remaining steps re-derived: `T` meeting the claim-2 anchor forces
  `p in T intersect I` with `d_A(p)=9`; the degree sum
  `170<=7ell+33+13(14-ell)=215-6ell` gives `ell<=7`; `L union {p}` is a
  transversal (a disjoint `I4` would have all A-degrees 8, missing `T`);
  `e(K)=85-sum_L d_A-9+e(A[L union {p}])>=76-7ell+b4(ell+1)`; the table
  rows (script-checked: `76,69,62,55,49,43,37,31` vs uppers
  `68,60,55,50,45,40,36,31`) contradict for `ell=0..6` and survive only at
  `ell=7`; the equality case has the unique solution `sum_L d_A=49`,
  `e(A[L union {p}])=4` (script-checked), Turan equality gives four
  disjoint edges, so `d_K(p)=8` leaves 2 nonneighbors in the 10-vertex
  `K` while `I-{p}` contributes 3 - contradiction. Conclusion:
  `tau(I4(A))>=5` with the abstract quantifier, plus `|C_y|>=5` for actual
  columns.
- The accepted anchor review handled the same quantifiers (it re-derived
  the four-transversal bound abstractly, quoted the degree floor's
  abstract-coverage sentence, and noted the `tau=0` case is subsumed).
  Concur on all points.

### Case `ell=0` (all `t` bounds)

- Every `I4` lies in `D`: all four weights are at least 8 (no vertex in
  `L`) and input 1 caps the sum at 32, forcing all four to equal 8.
- For every `y`, `C_y` meets every `I4` (a missed one plus `y` gives
  `I5`), so `C_y intersect D` meets every `I4`: it is an abstract
  transversal and input 3 gives `|C_y intersect D|>=5`. Summing over the
  24 columns, `9t=sum_y|C_y intersect D|>=120`, so `t>=14` (script:
  `ceil(120/9)=14`).
- Row budget: `169<=8t+13(18-t)=234-5t` gives `t<=13` (script: largest
  feasible `t` is 13). `14>13`: contradiction, recorded correctly.

### Case `ell=1`: every `t` bound

- `L={u}`, `h=w(u) in {5,6,7}` (Setting floor/ceiling).
- Every `I4` avoiding `u` lies in `D` (same 8-and-sum-32 argument on
  `A-{u}`), so `(C_y intersect D) union {u}` is an abstract transversal;
  input 3 gives size at least 5, hence `|C_y intersect D|>=4` (whether or
  not `u in C_y`). Summing: `9t>=96`, so `t>=11` (script: `ceil(96/9)=11`).
- Upper bound: `169<=h+8t+13(17-t)=221+h-5t` gives
  `t<=floor((52+h)/5)`, which is 11 for each of `h=5,6,7` (script-checked).
  Hence `t=11` uniquely (script).
- `H=A-(D union {u})` then has 6 vertices, all of weight at least 9, with
  `sum_H w=169-h-88=81-h` (script: 76, 75, 74 for `h=5,6,7`).

### The six-high-weight argument

- Per-vertex floor: the other five `H` vertices have weight at most 13, so
  every `a in H` has `w(a)>=81-h-65=16-h` (script: 11, 10, 9 - all within
  `[9,13]`).
- Containment of `u`: an `I4` containing `a in H` but avoiding `u` has
  sum at least `(16-h)+3*8=40-h>=33>32` (script: 35, 34, 33), contradicting
  input 1; so `u` lies in it.
- Equality chain: the other two vertices are outside `u`, hence weight at
  least 8, so `32>=sum_I w>=w(a)+h+16>=32` (the last step is the floor
  above; script: `(16-h)+h+16=32` exactly for all `h`), forcing
  `w(a)=16-h` (and, reading the chain backwards, the other two weights
  sum to 16 with each at least 8, so both equal 8).
- At most one such vertex: two would give
  `81-h<=2*(16-h)+4*13=84-2h`, i.e. `h<=3`, contradicting `h>=5`
  (script: the inequality fails for each of `h=5,6,7`).
- `H0={a in H:w(a)=16-h}` has size at most 1; `16-h in {9,10,11}` keeps
  `H0` disjoint from `D` as defined.
- "Every `I4` is contained in `U=D union {u} union H0`": any `I4` meeting
  `H` contains `u` (above) and each of its `H`-members has weight exactly
  `16-h` (the equality chain applies to each `H`-member in turn), hence
  lies in `H0`; members outside `H` lie in `{u} union D`. An `I4` avoiding
  `H` lies in `{u} union D`. The conclusion is correct; its justification
  is compressed but every ingredient precedes it in the text.

### Projected-column transversals and the 117 capacity

- Each `C_y intersect U` is an abstract transversal (every `I4` is inside
  `U`, and `C_y` meets every `I4` by the same `I5` argument), so input 3
  gives `|C_y intersect U|>=5` for each of the 24 columns, and
  `e(U,B)=sum_y|C_y intersect U|>=120` (each `U`-to-`B` edge is counted
  exactly once by its `B` endpoint).
- Capacity: `e(U,B)=9*11+(17-h)+|H0|*(1+h)`; with `|H0|<=1` and `1+h>0`
  this is at most `99+(17-h)+(1+h)=117<120` (script: for
  `(h,|H0|)=(5,0),(5,1),(6,0),(6,1),(7,0),(7,1)` the values are
  `111,117,110,117,109,117`). The stated note that the inequality also
  covers `H0` empty is correct. Contradiction, excluding the final case.

### Ambient types, case coverage, search use

- No step of Claim 3 imposes `I4`-freeness on `A` (only `K4`-freeness,
  `I5`-freeness, and input 1 on independent four-sets); every `K5`
  obstruction used elsewhere in the note lies outside Claim 3; column
  transversality uses `I5`-freeness of `G` with `y in B`, `I4 subset A`,
  `A cap B` empty. Types are applied correctly.
- Case coverage: under the premise `ell<=1` and `ell>=0`, the two cases
  `ell=0` and `ell=1` are exhaustive; each is closed by contradiction, so
  the conclusion "no such rooted graph exists" follows conditionally as
  stated.
- Search use: `none pending independent review; proposed full x137
  closure` is accurate; no search, solver or certificate is claimed. The
  note's closing section keeps the consequence conditional ("acceptance
  would give `x>=138` for every degree-18 root") and explicitly disclaims
  any order-43 or `R(5,5)` conclusion; this matches the recorded x136
  closure state at HEAD.
- Arithmetic self-checks (throwaway, checks only): all values quoted in
  the four preceding subsections were produced by one scalar script run;
  outputs matched every number printed in the claim.

## Findings

No gap found; no correction required. Supporting observations, none
affecting correctness:

1. Claim 3's `Dependencies` line says "preceding claims" while the proof
   invokes only `ell<=1`; Claim 1's three-anchor argument is unused
   directly. Over-declared dependency, no impact on the deduction.
2. The degree floor's two cited sources have stated scopes narrower than
   the `x=137` abstract use (an "actual size-four column" scope in
   `#claim-four-column-stability-01`; an `x=136` note-level setting in
   `#claim-r2-low-excess-01`). The generalization to abstract transversals
   is proof-level, is explicitly documented in `effective_anchor.md`, was
   verified line by line in the accepted anchor review, and was re-traced
   here step by step. Recorded for provenance; not a gap.
3. `effective_anchor.md`, `frontier_band.md`, `five_column_compatibility.md`
   and the root `README.md` all carry hashes different from those recorded
   in their reviews; each drift was diffed to the reviewed revision and is
   metadata/status-note/table-adjacent prose only, with no proof-body line
   changed (dependency table above). Acceptance carries unchanged.

## Outcome

**accepted** - conditional on the explicit premise `ell<=1` from
`#claim-x137-closure-low-weights` (Claim 2, outside this charter and not
re-derived here), on the accepted setting inputs 1 and 3, and on the
recorded external bounds. This is acceptance of a local deduction on the
stated external premises: not a novelty claim, not a formally checked
certificate, and not a branch closure. No claim-state flip, search-use
change, or index update is implied; those remain with the coordinator.
Every `t` bound, the six-high-weight argument, the 117 capacity, both
projected-column transversal applications and the abstract `tau>=5`
quantifier chain were independently re-derived and scalar-checked against
the exact revision `ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb`.

## Limits

- Claims 1-2 of `frontier_closure.md` were not reviewed (owned scope
  covers `#claim-x137-closure-exclusion` only); this Outcome is
  conditional on Claim 2 as stated above. Their `Review state: ready`
  labels are untouched.
- External literature premises were re-read against the root README table
  but not verified against primary sources: `E(4,5,17)=79`,
  `E(4,4,14)=50`, `min e(4,4,15)=50`, the `(4,4,11..17)` maxima
  `36,40,45,50,55,60,68`, and the Ramsey values `R(3,5)=14`, `R(4,4)=18`,
  `R(4,3)=R(3,4)=9`, `R(4,5)=25`. Novelty was not reviewed.
- `tau>=5` (input 3) inherits the accepted anchor review; this audit
  re-inspected its quantifiers, re-derived its proof body, and scalar-
  checked its tables, but the `U(10)=31` core cap's Goodman derivation was
  certified inside that earlier review rather than re-derived anew here
  (it is not used by Claim 3 itself).
- No formalization, no graph search, no solver, no certificate; a change
  to the proof bytes at the reviewed revision requires renewed review.
