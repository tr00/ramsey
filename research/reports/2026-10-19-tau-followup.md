# Tau scheme follow-up: floor correction, branching-coordinate analysis, connectivity interaction

Date: 2026-10-19. Task token: `tau-followup-20261019`. Agent: Main, working
alone. Continuation of `tau-scaffold-20261019`
([scaffolding report](2026-10-19-tau-scheme-scaffolding.md)). Advisory and
documentation session: no computation, solver run, catalogue processing,
download, or Lean change. No exclusion is claimed.

## Floor correction (65 -> 66 at t4)

`research/n43/d18/tau/t4/README.md` recorded `e(F)>=41+24+1=65`; the sum is 66. The
defect identity `u+w+t=3+q` was already consistent (floors `41+24` plus
`t=e_F(T4)>=1`). [Lemma phase II section 8](../../docs/lemma_phase_2.md)
records 65, counting `41+24` without the `e_F(T4)>=1` term.

Changed:

- `t4/README.md`: total restated as `66<68+q` (slack `q+2`), with the
  reconciliation to section 8 noted inline.
- `research/n43/d18/tau/README.md` inputs row: "reach 65 at t=4 (66 with the
  `e_F(T4)>=1` floor)".

No-kill conclusions unchanged (66 < 68 <= 68+q). The t=5 total
`33+25+2=60` is unaffected. The dated scaffolding report line "(65 < 68+q)"
is left as the historical record of scaffold time.

## Branching-coordinate analysis (advisory, no claims, no file changes)

Comparison of tau_4 against a=|A|, q, x, and the r/s column profile as
branching coordinates. Conclusions, recorded here only as design rationale:

- Layering, not competition: q (identities) and r/s profiles (linear
  counting, explicit family) are arithmetic layers; x-cells carry the
  tightest cuts (`sum(|C_y|-4)=x-96`); tau rungs are the only coordinate
  whose branches terminate the band (closure) rather than enumerate.
- Rung predicates are x- and q-agnostic: one t4 refutation (with
  `sum-cross<=143` pinned) removes the `tau_4<=4` slice of every cell
  x<=143 at once, including every `r>=1` profile (a size-4 column is a
  4-transversal by (S2)); t5 UNSAT additionally removes every `s>=1`
  profile and closes the band.
- Only structure-pinning branches qualify for the S18 relocation collapse
  (3060 -> 1 at t4, 8568 -> 1 at t5); linear-form branches (x, q) never do.
- The ladder degenerates past x=143: each block of 24 cross edges adds a
  rung with weaker floors, up to m=11 at x=279.

## Connectivity interaction (recorded in tau/README.md, derived there, unreviewed)

New section "Interaction with the connectivity split" in
`research/n43/d18/tau/README.md`, four items, all derived-here/unreviewed except
where accepted claims are cited:

1. Geography: `x=136+2q+E_A`, `E_A>=0` gives `q<=floor((x-136)/2)`; every
   cell x<=143 has q<=3, hence connected A with `kappa(A)>=4`, `d_A>=4`
   (accepted thresholds). Disconnected branches sit at `a<=68`: k1 q=17
   (x>=170), k2 q=24 (x>=184), k3 q=27..32 (x>=190). Rung territory and
   k-branches are disjoint.
2. tau collapse: in `A=K_m disjoint-union C`, every I4 of G[A] is mixed
   `{x} union T`, so `K_m` is a transversal and `tau_4=min(m,tau_3(C))<=3`,
   `tau_4=1` in k1. Rungs are inapplicable as refutations in k-branches;
   the cap `24*tau_4<=x` is vacuous there.
3. Placement: the scheme stays a d18-level overlay, sibling of c and k1,
   not a child of c. If x>=144 is attacked, rungs are instantiated under c
   only; k_m is handled by the rigid-core machinery (k1).
4. Rung strengthening: pinning `sum-cross<=143` derives `q<=3`, unlocking
   band-uniform cuts `d_A>=4` (18 linear rows) and `r_u<=17+epsilon_u-4`
   from the accepted transfer; q-conditional floors (L(q), F(q)) need a
   q-split inside the rung.

## Advisory background from the originating Q&A (not previously reported)

Two questions that motivated the scheme, answered as analysis only:
existential transversal constraints are cheap with T fixed (n selectors
otherwise); universal implicit-family constraints are co-NP-shaped and
belong outside the solver as the ladder/CEGAR instead of ~10^6 aux vars.

## Files touched this session

- `research/n43/d18/tau/t4/README.md` (floor total fix)
- `research/n43/d18/tau/README.md` (inputs row fix; interaction section)
- this report

Shared indexes (`WORK.md`, `results.md`, d18 README child table) remain
coordinator-owned and untouched; k2/k3 folders intentionally not created.

## Pending independent review

1. Unchanged from the scaffolding report:
   `claim-tau-symmetry-01`, `claim-tau-closure-01`, and the t=5
   specialization `33+25+2=60`.
2. New: the four interaction items in `research/n43/d18/tau/README.md`, in
   particular items 1 and 2 (geography and the tau collapse), which future
   rung runs would rely on for scope statements.

## Coordinator handoff

Fold into the same integration suggested in the scaffolding report (one
d18 README overlay row after review; extend the WORK.md row token to
`tau-scaffold-20261019` + `tau-followup-20261019`). Any rung run remains
paused by default and needs explicit user authorization with
reproducibility records.
