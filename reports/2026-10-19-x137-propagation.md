# x137 propagation: cross-comparison of the x136 closure against existing claims

Date: 2026-10-19. Task token: `x137-propagation-20261019`.
Session: Main. Follow-up to the
[x136 closure integration](2026-10-19-x136-frontier-closure.md). Pure
mathematical cross-comparison; no search, solver, catalogue, download, or
installation. No novelty claim.

## Question and method

Which existing degree-18 claims can use the reviewed bound
"every degree-18 root has x>=137"? Every d18 claim is parameterized by
the exact identity `x = 136 + 2q + E` with `q=85-e(A)>=0` and
`E=sum_A(d_G-18)>=0`, so the closure removes exactly one lattice point:
`(q,E)=(0,0)`. I mapped every consumer of the bound (grep over `n43/`,
`docs/`, `results.md`, `reports/` for the frontier expressions), read the
band, transfer, tau, excess, and extension notes, then classified each
consumer as strengthened, unchanged, or status-stale, and rederived the
strengthened statements.

## Strengthened (recorded in `n43/d18/x136_closure_consequences.md`, all `ready`)

1. **Rootwise profile exclusion** (claim-closure-consequences-root-profiles):
   at every degree-18 root, `2q+E>=1`; `E=0 => q>=1` (an all-18
   neighborhood has at most 84 edges); `q=0 => E>=1` and the root has a
   neighbor of degree at least 19 with `x=136+E>=137`. These discharge the
   conditional premise C136 of `obstruction_coverage.md` Claim06 and the
   conditional conclusions in `c/w0/research.json`.
2. **18-regular sharpening** (same claim, part d): if W=0 the graph is
   18-regular, every root shares one `q in {1,2,3,4}`, `x in
   {138,140,142,144}`, `b=148-q in {144,145,146,147}`; in particular no
   18-regular candidate has `b=148` (the `b=148 => 18-regular` frontier
   equivalence loses its equality endpoint). Before the closure the range
   was `q in {0,1,2,3,4}` with `(x,b)=(136,148)` live.
3. **Floor sharpening** (claim-closure-consequences-floors): every recorded
   conclusion `x >= 136 + f` keeps its content and gains the effective
   floor 137. Named consumers: the accepted weighted-anchor certificate
   `x >= 136+2q+ceil(L(A))` becomes `x >= 136+max(1, 2q+ceil(L(A)))`,
   strictly stronger exactly at `q=0, L(A)=0`; the `docs/lemma_phase_2.md`
   frontier-lemma equality block and the `docs/theory_phase_1.md` corridor
   floor now carry floor 137 (equality block recorded as impossible).
4. **Forced-q=0 upgrade** (claim-closure-consequences-forced-q0): any
   argument forcing a root with `q=0` now forces `q=0 AND E>=1`, i.e. an
   85-edge neighborhood containing a degree >=19 vertex; concretely the
   excess-bounds section-4 profiles (h,W) in {(2,8),(4,20),(6,32)}.
   That note is internally audited only; disclosed in the dependency.

## Checked and unchanged (important negatives)

- **The Q=1 hypothesis is NOT discharged.** `excess_bounds.md` sections
  4-5 assume `q>=1` for *every* root; the closure allows `(q,E)=(0,1)`
  (the live x137 cell), so those conditional tables keep their
  hypothesis. `q>=1` must not be promoted globally — same warning as
  `obstruction_coverage.md`.
- Endpoint bounds survive: `b>=148` at k=1 (the k=0 row dies but k=1
  keeps 148), `b>=144` globally, `e(G)=387+W/2` with minimum 387,
  parity structure at even k>=2, all upper bounds (x<=279, x142 caps,
  dense-pivot caps), and the tau ladder arithmetic `24*tau_4<=x` for
  x<=143.
- Band profile tables: only the x=136 row `(85,0)` is deleted; rows
  x137..142 and the residual x>=143 are untouched.
- The closure is rooted: nothing here bears on roots of other degrees or
  on `R(5,5)`.

## Status-stale consumers updated (superseding notes appended; bodies and review states untouched)

- `n43/d18/README.md` split sentence: lower bound now x>=137.
- `n43/reductions.md` section 2 narrative (equality frontier) + section
  8.3 pointer to the consequences note and this report.
- `docs/lemma_phase_2.md`, `docs/theory_phase_1.md`: dated floor notes.
- `n43/d18/frontier_band.md`: "No value of x has been excluded" superseded.
- `n43/d18/fixed_b_extensions.md`: "pending integration" superseded;
  "no claim here uses it" retained as accurate.
- `n43/d18/obstruction_coverage.md`: C136 establishment note added inside
  the existing integration banner; Claim06 keeps its conditional
  qualifier until renewed review (claim change, not performed unilaterally).
- `n43/d18/tau/README.md` applicability cell: integrated, reviewed.
- `n43/d18/x136/README.md`: consequences bullet added.
- `results.md` and `WORK.md` rows added for this task.

Not edited: `c/w0/research.json` and other hashed JSON/proof artifacts of
released tasks (their premise records would break recorded SHA manifests);
their conditional qualifiers are discharged in this report for a renewed
review by the original workflow instead. `docs/lemma_phase_2.md` and
`frontier_band.md` review hashes therefore identify pre-note revisions;
the appended notes are dated and distinguishable.

## Checks

Python3 exact-integer replay (standard library, no solver):
`2q+E>=1 <=> x>=137 <=> not(q=0 and E=0)` for all q<=35, E<=108; the
W=0 table `b=148-q` with band identity `E_B=2b-296+x`; the k=0..5
`b` lower bounds `[148,148,147,147,146,146]`; E_A=0 parity `x in
{138,...,206}`; and the floor-max arithmetic for the weighted certificate.
All passed.

## Follow-ups outside this task's scope

- `src/` engine cross-edge default endpoint `136..279` (cpp-edge-bounds)
  could tighten to `137..279`; code change with tests, not performed.
- Lean `degree18_cross_range` still states 136; formalizing the closure
  first would be required; not performed.
- The x137 live cell (q0, r0:s7..10) is untouched by design: closing it
  is new research, not propagation.
