# Independent audit: omitted-row obligations from high-row averaging

Claim(s): `n43/d18/averaging_omission_cuts.md` —
`#claim-omission-triple-supply` (section 1),
`#claim-omission-attachment-capacity` (section 2),
`#claim-omission-endpoint-cover` (section 3).

Author: Main. Reviewer: AuditOmission. Distinct identities; every
inequality, count, profile and scalar below was rederived from the ambient
setting rather than accepted from the author's arithmetic.

## Reviewed revision

Byte-exact SHA-256 of the exact uncommitted file under review, computed
with `sha256sum` immediately before writing this file and re-verified
unchanged after all checks:

    97f7a05a4e44c2f6e72b65c4b4e64ac35c4542534213fdf8ebbbfe95407493bd

(206 lines.) `git log` records no commit for this path and `git diff` for
it is empty, so the file is a new uncommitted revision and the SHA-256
above is the revision identifier. The author did not edit the file during
this review: the hash was taken before the mathematical checks and again
immediately before writing, and both reads are identical. Inbound
references exist only from `n43/d18/averaging_future_work.md` (anchor
`#claim-omission-endpoint-cover`) and `reports/2026-10-18-averaging-tail.md`
(claim list plus hash slot); both are summaries and neither consumes a
claim as a premise yet. No review banner exists yet, so no superseded
revision can be consumed downstream.

## Dependencies reviewed

- `docs/mathematical_baseline.md` (recorded, NOT recertified here):
  `R(4,3)=R(3,4)=9`, `R(3,3)=6`, `R(4,4)=18`, and `R(4,5)=25`, the last
  giving the all-vertex cap `d_G<=24` and hence `0<=epsilon_u<=6` for
  `u in A`. The note states the cap as "Recorded smaller Ramsey bounds"
  and points at the reviewed independent-row setting; the origin
  (`R(4,5)=25`) is recorded in the baseline and in the accepted
  independent-row note's Setting, so the premise is present, only
  abbreviated.
- `n43/d18/independent_row_cuts.md`, accepted at banner SHA-256
  `8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`:
  row identity `d_A(u)+r_u=17+epsilon_u`, `r_u<=17`, `H17` independent
  and anticomplete to `H16`, degree caps `d_A<=7` on `H16` and `d_A<=6`
  on `H17`, tail counts `0<=t<=4`, `s<=12-3t`, `7t+8s<=72`, and
  `x<=279` (the last retaining the published `e(B)>=144` premise).
- Ambient types rederived independently: `A` is `K4`-free (`K4` plus `v`
  is `K5`) and `I5`-free (heredity); `B` is `K5`-free (heredity) and
  `I4`-free (`I4` plus `v` is `I5`). The note's Setting states exactly
  this ("A is K4/I5-free and may contain I4; B is K5/I4-free"), and no
  argument below swaps the two types.
- Section 3 numerical consequences additionally use
  `50 <= e(A) <= 85` (reductions.md section 8.1 `[PUBLISHED]`;
  theory_phase_1.md "The published `(4,5)` census gives `50 <= a <= 85`")
  and the branch-wide definitions `q=85-e(A)`, `E=sum_A epsilon_u`,
  `E=x+2a-306` (fixed_b_extensions.md, frontier_band.md,
  symmetry_reduction.md, four_column_stability.md). Applicability checked:
  `A` is `(4,5)`-free on 18 vertices, so the interval applies to every
  degree-18 pivot's neighborhood.
- Sibling notes `tail_zero_one.md` and `tail_two_three.md`: I read both
  and matched their claim statements against what section 3 consumes
  (below). Their proofs are audited by AuditZeroOne and AuditTwoThree;
  this review accepts section 3 only conditional on those outcomes.
- No solver, enumeration, catalogue, download, build or theorem prover.
  Only finite integer arithmetic (Python 3, listed under "Scalar
  evidence").

## Checks

### Claim 1 — `#claim-omission-triple-supply`

- Quantifiers/scope: `J_y`, `j_y`, `S`, `U`, `Delta` are defined for
  every `y in B` and all of `B` is quantified; no claim is made about
  columns outside `B` or about rows outside `H`. "Independent of order
  at most three" is asserted for the actual sets `J_y`, not for an
  assumed family.
- Independence of `J_y`: for adjacent `p,q in J_y` the common row
  `B[R_p intersect R_q]` is triangle-free (a `B`-triangle with edge `pq`
  is `K5`) and `I4`-free (subset of `B`), hence order `<= R(3,4)-1 = 8`.
  Because both rows omit `y`, the union lies in `B-{y}` (23 vertices), so
  `|R_p intersect R_q| >= r_p+r_q-23 >= 32-23 = 9`. The threshold 23
  (not 24) is correct and is what makes the `H16`/`H16` case work:
  9 > 8 gives the contradiction in every one of the three pair types
  (17/17, 17/16, 16/16). Reverified independently.
- `j_y<=3`: four independent `A`-members of `J_y` are each nonadjacent
  to `y` (`y in O_h`), so with `y` they form `I5`, which `G` forbids.
  Correct; note it needs only the ambient `I5` prohibition, exactly what
  the Dependencies declare.
- Deficit identity: double count pairs `(h,y)` with `h in H`, `y in O_h`:
  `sum_y j_y = 7t+8s`, so `sum_y(3-j_y) = 72-7t-8s = Delta`. Since
  `j_y<=3` termwise, `Delta>=0` follows from the claim's own `j_y<=3`
  and does not lean on the reviewed `7t+8s<=72` (consistent with it).
- Supply bounds: each `y in U` has `3-j_y>=1`, so `|U|<=Delta`;
  `|S| = 24-|U| >= 24-Delta` and `|S|>=0` give
  `|S|>=max(0,24-Delta)`. `Delta=0 => U=0` is stated with the correct
  qualification ("not an assumed anchor cover").
- Case coverage: all rows of `H` are covered (16 and 17 only, since
  `r_u<=17`); `Z` plays no role here. `|B|=24` and "17-row omits 7,
  16-row omits 8" verified.
- Cross-check: the independence conclusion, `j_y<=3` and `Delta>=0`
  coincide with accepted claim `#claim-independent-row-tail-counts`
  (`O_y` independent, `k_y+m_y<=3`, `7t+8s<=72`) — same facts, a
  different (sharper, shared-omission) proof; no conflict.
- Dependencies: `R(3,4)=9` and ambient prohibitions are declared and are
  the only external inputs used. Search use "none pending review" matches
  kind `local-deduction`; no novelty or closure claim appears.

### Claim 2 — `#claim-omission-attachment-capacity`

- Quantifiers/scope: pointwise statements quantify every `z in Z`
  (`r_z<=15` because `r_z<=17` and `r_z notin {16,17}`, so
  `delta_z=15-r_z>=0` is well defined); (3) quantifies every subset
  `Z0 of Z`, (4) is explicitly restricted to nonempty `Z0` in the body.
- Demand lower bound: `|O_z| = 24-r_z = 9+delta_z`,
  `|O_z intersect U| <= |U| <= Delta`, so
  `|O_z intersect S| >= 9+delta_z-Delta` and `>=0`. The sharper
  `max(0,9+delta_z-|U|)` variant is valid because `|U|<=Delta`.
- Witness existence: for `y in O_z intersect S` (`|J_y|=3`),
  nonadjacency of `z` to `J_y` together with `y` gives `I5`; `z in Z`
  and `J_y subset H` are disjoint, and all five vertices are distinct.
  Correct.
- Capacity (2): `|O_z intersect O_h| = 24-r_z-r_h+|R_z intersect R_h|`
  (complement arithmetic inside the 24-set) and an `A`-edge bounds the
  common row by 8, giving `<=32-r_z-r_h`. Substituting
  `r_z=15-delta_z`: `H16 -> 1+delta_z`, `H17 -> delta_z`. Verified for
  `delta_z = 0..5`; no negative capacity occurs (`r_z<=15`).
- Witness counting: distinct demands `y` contribute distinct pairs
  `(y,h)`, each `h in N_A(z) intersect H` covers at most
  `|O_z intersect O_h|` of them, and overcounting a demand with several
  witnesses only strengthens the upper bound. Hence
  `|O_z intersect S| <= (1+delta_z)d16(z)+delta_z d17(z)`. Correct, and
  `d16+d17 <= d_A(z)` is never assumed in a way that would weaken it.
- Summed version (3): termwise `max(0,a)>=a` gives
  `sum (9+delta_z-Delta) = (9-Delta)|Z0|+D0`; empty `Z0` reads `0<=0`
  as stated. Verified chain, including the possibly negative
  coefficient `9-Delta` (harmless: the chain only needs `>=`).
- Summed version (4): rederived exactly. `H17` independent and
  anticomplete to `H16` is justified inline (an `A`-edge of row sum
  `>=33` forces `|R_u intersect R_w| >= r_u+r_w-24 >= 9 > 8`), matching
  accepted claim `#claim-independent-row-combined-pairs`. Degree caps
  `d_A<=1+eps<=7` (`H16`) and `d_A<=eps<=6` (`H17`). Then
  `sum_{H16} d_A = 2e_A(H16)+e_A(H16,Z0)+e_A(H16,Z-Z0) <= 7s` and
  `sum_{H17} d_A = e_A(H17,Z0)+e_A(H17,Z-Z0) <= 6t`, so
  `e_A(H16,Z0) <= 7s-2e_A(H16)-e_A(H16,Z-Z0)` and
  `e_A(H17,Z0) <= 6t-e_A(H17,Z-Z0)`, i.e. exactly the two brackets.
  Replacing the per-`z` coefficients `1+delta_z`, `delta_z` by
  `1+delta_max`, `delta_max` is valid because `d16,d17>=0`; the
  brackets are nonnegative because they dominate actual edge counts.
  (Reading note: "the nonnegative coefficients in (3)" means the
  coefficients of `d16(z), d17(z)` in the middle term of (3), not the
  `9-Delta` coefficient of the left term; I rederived the step under
  that reading and it is correct.)
- Edge-case qualifications, each checked and correct: empty `Z0`
  (`0<=0`, (4) not asserted); `Z0={z:r_z=15}` makes `D0=0`, `delta_max=0`
  so (5) collapses to `max(0,9-Delta)|Z0| <= e_A(Z0,H16) <=` first
  bracket — and (5) also holds when that set is empty (left side `0`,
  bracket `=7s-sum_{H16}d_A >=0`); (6) at `delta_z=0, Delta=0` reads
  `9<=8`, impossible, so a size-15 row cannot exist there (this
  reproduces the tail note's `t=0,s=9` argument, a useful independent
  cross-check); (6) at `Delta=1` forces `d16(z)>=8` with `d_A(z)=2+eps_z<=8`,
  so equality gives `epsilon_z=6` and all `A`-neighbors in `H16` — the
  note correctly labels this a transition constraint; size-15 cannot use
  a size-17 neighbor (capacity `delta=0`), size-14 can (capacity 1), and
  a size-14/size-16 edge has capacity 2 (not 1). "These are upper
  capacities, not realizability assertions" is the right disclaimer.
- Capacity ceiling (6): `capacity = d16+delta_z(d16+d17) <=
  (1+delta_z)d_A(z) <= (1+delta_z)(8+delta_z)`; exhaustively verified over
  every split `d16+d17=d_A<=8+delta_z`, `delta_z=0..7`.
- Cross-check: at `t in {0,1}` claim 2's (1) is literally
  `tail_zero_one.md` (2)-(3) with `Q=Delta`, and (2) there is the same
  capacity. Two independently written notes agree.
- Dependencies: preceding claim, `R(3,4)=9`, and the exact row-degree
  identity are declared; `epsilon<=6`, `|B|=24` and the ambient types are
  in the Setting. The `H17`/`H16` structural facts are re-justified
  inside the proof, so no undeclared reviewed result is load-bearing.
  Search use "none pending review" is respected.

### Claim 3 — `#claim-omission-endpoint-cover`

- Quantifiers/scope: `x=279` is a hypothesis of the claim, not a
  conclusion; the table is stated as necessary coverage, explicitly not
  existence and not a disjoint classification of isomorphism types; the
  all-profile bound is explicitly left at 279.
- Profile enumeration, rederived from scratch: `x=270+2t+s-D=279` gives
  `s-D=9-2t`, so `D=s-9+2t` is determined by `(t,s)`; with `D>=0`,
  `0<=t<=4`, `s<=12-3t`, `7t+8s<=72`, `s<=18-t` the integer solutions
  are exactly
  `(0,9,0),(1,7,0),(1,8,1),(2,5,0),(2,6,1),(3,3,0)`; `t=4` is empty
  (`s>=1` versus `s<=0`). Script-enumerated, matches the note exactly,
  and the same six are reproduced independently in the two sibling
  notes (each covering its own `t` range) with no disagreement.
- Exclusions match the linked statements verbatim:
  `(0,9,0)` vs `tail_zero_one.md#claim-zero-seventeen-bound`
  ("`s=9` implies `D>=9`", scope `t=0`); `(1,8,1)` vs
  `tail_zero_one.md#claim-one-seventeen-eight-sixteen`
  ("`D>=9` and `x<=271`", scope `t=1,s=8`); `(2,6,1)` vs
  `tail_two_three.md#claim-tail-two-three-one-deficit-exclusion`
  (scope literally `x=279` and `(t,s,D)=(2,6,1)`). All three anchors
  exist in the sibling files. The claim's own Dependencies line states
  that each linked claim requires independent acceptance first.
- `D=0` forces every `Z` row to `r_z=15` (nonnegative summands), and
  `|Z|=18-t-s` gives `10,11,12` for the three survivors; all rows then
  have order `>=15`. Recomputed. Omission totals for all six candidate
  profiles equal `18*24-279=153`, an independent consistency check on the
  row arithmetic.
- Endpoint consequences: `2e(A) = sum_A d_A(u) <= sum_A(23-r_u) =
  18*23-279 = 135` (this is the already-indexed `x<=414-2a` from
  reductions section 8.2 / cross_upper_bound), hence `e(A)<=67`.
  With the retained `50<=e(A)<=85`: `q=85-e(A) in [18,35]`,
  `E=279-306+2e(A)=2e(A)-27 in [73,107]`, `E` odd. All values
  script-checked; cross-identities `E=143-2q` and `x=136+2q+E=279`
  hold on the whole interval, and `E<=107<108=18*6` is consistent with
  `epsilon<=6`. The claim "not a `q<=2` regime" follows from
  `q>=18` alone; the low ends `q<=35`, `E>=73` need the retained
  `e(A)>=50` minimum (see Findings).
- Edge-case/coverage qualifications: `Delta` equals `9,18,27` on the
  three surviving profiles, so section 2's (5) is vacuous on exactly
  them — consistent with the Limits statement "(5) alone becomes
  vacuous at `Delta>=9`". The claim does not convert its capacities into
  realizability claims anywhere.
- Dependency applicability: `x<=279` and the tail counts are the
  accepted independent-row results (banner hash above); the three new
  sibling claims are matched statement-by-statement as above and are
  pending their own audits. Search use "none pending review; proposed
  branch/propagate" is consistent with a necessary-coverage statement and
  with the absence of any closure claim.

### Scalar evidence

Finite integer arithmetic only (Python 3.12), no graph data:

- Profile enumeration returns exactly the six listed triples, `t=4`
  empty; omission totals `153` for all six; capacity identities
  `32-r-16==1+(15-r)`, `32-r-17==15-r`, `24-r==9+(15-r)`,
  `23-r==8+(15-r)` for `r=0..15` (496 parameter cases).
- (6) and its consequences: `max(0,9+0-0)<=8` false (`9<=8`), tight at
  `delta=0, Delta=1` (`8<=8`), true elsewhere in `delta=0..7`;
  `d16+delta(d16+d17)<=(1+delta)(8+delta)` exhaustively true over all
  admissible degree splits.
- (3)/(4) algebra: 6340 random structural instances satisfying
  `sum_{H16}d_A<=7s`, `sum_{H17}d_A<=6t` give
  `(1+dmax)e_A(H16,Z0)+dmax*e_A(H17,Z0) <= (1+dmax)[7s-2e16-e16_rest]
  +dmax[6t-e17_rest]` with zero violations; coefficient monotonicity and
  the `max(0,a)>=a` chain checked with zero violations (200000 random
  and exhaustive small ranges).
- Section 3 numbers: `18*23-279=135`; `e(A) in 50..67` gives
  `q in 18..35`, `E in 73..107`, `E` odd, `E=143-2q`,
  `136+2q+E=279`.

## Findings

1. **Rescope the Setting's "no census edge bound" sentence.**
   Lines 19-20 assert "Nothing below requires small q, small excess, the
   reported x136 closure, or a census edge bound", but line 187 uses
   "the already retained `50<=e(A)<=85` census interval" for the
   `q`/`E` conclusions of section 3, and section 3's premise `x<=279` was
   itself accepted on the published `e(B)>=144` census premise. The
   premises are declared in-file (line 187, Dependencies line 154) and
   both consumers attribute them correctly, so no proof step is wrong;
   the blanket sentence is simply false as written and would license a
   downstream banner or summary describing the endpoint consequences as
   census-free. Suggested replacement for lines 19-20:

```suggestion
These are the setting and premises of the reviewed
[independent-row cuts](independent_row_cuts.md). Sections 1 and 2 require
no small q, small excess, the reported x136 closure or census edge bound;
the section 3 endpoint consequences additionally use the retained
`50<=e(A)` minimum and the reviewed `x<=279`, which itself retains the
published `e(B)>=144` premise.
```

   Priority 3, confidence 0.92 — non-blocking for mathematical validity;
   the reviewed body must be re-hashed and re-reviewed if it is applied.

2. **Declare the `e(A)>=50` premise in claim 3's Dependencies (or mark
   the paragraph a remark).** The Dependencies field (lines 154-158)
   lists the tail counts, `x<=279` and the three sibling claims, but the
   section 3 paragraph at lines 185-191 additionally needs
   `50<=e(A)` — an external published/census premise recorded in
   `n43/reductions.md` section 8.1 `[PUBLISHED]` and
   `docs/theory_phase_1.md` — to obtain `q<=35` and `E>=73`, and it is
   cited neither there nor at line 187 ("already retained" is the only
   marker). The claim template asks Dependencies for "precise
   theorem/table/page citations where available"; a reader taking only
   the claim header (together with the Finding 1 sentence) would
   conclude the numerical consequences are premise-free. Suggested
   replacement of lines 154-158:

```suggestion
Dependencies: reviewed independent-row tail counts and x<=279; the new
[zero-root bound](tail_zero_one.md#claim-zero-seventeen-bound),
[one-root bound](tail_zero_one.md#claim-one-seventeen-eight-sixteen), and
[one-deficit exclusion](tail_two_three.md#claim-tail-two-three-one-deficit-exclusion),
each requiring independent acceptance before this synthesis is used;
for the section 3 numerical consequences only, the retained published
minimum `50<=e(A)` (reductions.md section 8.1)
```
   Priority 3,
   confidence 0.85 — the premise is visible in the body, so validity is
   unaffected; this is declaration completeness.

## Outcome

- `#claim-omission-triple-supply`: **accepted** — independence,
  `j_y<=3`, the deficit identity and both supply bounds rederived; only
  declared premises (`R(3,4)=9`, ambient `K5`/`I5`) are used; quantifiers
  and scope honored; consistent with the accepted independent-row tail
  claim.
- `#claim-omission-attachment-capacity`: **accepted** — the pointwise
  sandwich (1), the witness capacity `1+delta` / `delta`, the summed
  bounds (3)-(4), the specialization (5) and the ceiling (6) were each
  rederived and scalar-checked, including every stated edge case
  (empty `Z0`, `Z0={r=15}`, `delta=0/Delta=0` impossibility, the
  `Delta=1` transition, size-15/14 witness capacities, multiplicity
  disclaimer). Only the preceding claim, `R(3,4)=9` and the row-degree
  identity are used, all declared.
- `#claim-omission-endpoint-cover`: **accepted conditionally** — the
  six-profile enumeration, the three exclusions, `D=0`, the row counts
  `10/11/12`, the `279 not 278` statement and the `e(A)/q/E`
  arithmetic all rederive; the exclusions depend on
  `tail_zero_one.md#claim-zero-seventeen-bound`,
  `tail_zero_one.md#claim-one-seventeen-eight-sixteen` and
  `tail_two_three.md#claim-tail-two-three-one-deficit-exclusion`, which
  this review matches statement-by-statement but does not prove. Per the
  workflow rule, if any of those three is changed or withdrawn, this
  claim reverts to pending review. Findings 1 and 2 attach to this
  section (premise declarations only).
- Overall: **accepted** for the exact revision SHA-256
  `97f7a05a4e44c2f6e72b65c4b4e64ac35c4542534213fdf8ebbbfe95407493bd`
  (206 lines). Findings 1 and 2 are P3 declaration findings, not proof
  defects; acceptance covers the mathematics at this hash. If the author
  applies either suggestion the body changes and a renewed byte-exact
  review is required before any banner is prepended. The integration
  banner and report must not describe the section 3 `q`/`E`
  consequences as census-free.

## Limits

- External premises retained, not recertified: `R(4,3)=R(3,4)=9`,
  `R(3,3)=6`, `R(4,4)=18`, `R(4,5)=25`; the published `(4,5,18)` edge
  interval `50<=a<=85` and the published `(4,5,24)` interval behind
  `e(B)>=144` (Angeltveit-McKay citation recorded in the baseline,
  reductions section 8.1 and cross_upper_bound). Applicability and all
  arithmetic chaining them into these claims were checked; the
  publications themselves were not.
- The three sibling claims behind the endpoint table are under separate
  audit (AuditZeroOne, AuditTwoThree); their proofs were not re-derived
  here beyond statement matching. A negative outcome there invalidates
  the affected exclusion and hence this claim's table.
- No realizability claim: the three surviving profiles are necessary
  conditions only; `x=279` and every smaller value remain open, and no
  degree-18 or order-43 case is closed. `x<=278` is not implied.
- No novelty claim is made or checked; no certificate (Lean, exhaustive
  search, solver) exists or is implied; no graph enumeration was run by
  reviewer or author. The user-reported `x136` closure is not used
  anywhere in the reviewed file.
- Acceptance covers the three claims' mathematical validity and the
  recorded search-use proposals (`propagate` / `branch`) only as
  proposals; the coordinator decides any pruning or integration use.

## Addendum — renewed review after the premise-declaration fixes

Author applied exactly Findings 1 and 2 (the Setting scope sentence and
claim 3's Dependencies declaration) and no proof body changed. Renewed
byte-exact SHA-256, computed with `sha256sum` immediately before this
addendum:

    8b01927b165167b108b6ae0b4829a7688a4ba2ec61b80e50bcbc2f0f099e45b9

(210 lines; the superseded revision accepted in the first pass above was
`97f7a05a4e44c2f6e72b65c4b4e64ac35c4542534213fdf8ebbbfe95407493bd`,
206 lines). The initial review is preserved unchanged as the historical
record of that revision.

Verification on the new revision — full re-read compared line by line
against the text audited above. No scalar check was repeated, because no
number, formula or proof line changed; only the hash and the new link
were verified, per the integration handoff:

- Setting, former lines 19-20, is now four lines (current 19-22):
  "No claim requires small q, small excess or the reported x136 closure.
  Sections 1--2 use no census edge bound. Section 3 retains the published
  e(B)>=144 premise behind x<=279 and its one-deficit exclusion; its q/E
  interval additionally uses e(A)>=50." This rescopes the blanket
  disclaimer exactly as recommended.
- Claim 3 Dependencies (current lines 160-162) now ends "…before this
  synthesis is used; the final q/E interval also uses the retained
  published e(A)>=50 minimum
  ([reduction index, Section 8.1](../reductions.md#81-published-internal-edge-ranges))".
- Line delta +4 (206 -> 210) matches these two insertions exactly
  (+2 Setting, +2 Dependencies).
- Everything else is byte-identical to the reviewed revision: all three
  claim IDs and anchors, Kind/Scope/Conclusion/Search-use/Reviews fields,
  both proof bodies, equations (1)-(6), the three-row profile table and
  the six-profile list, the `e(A)/q/E` paragraph (now lines 189-195), and
  the Limits section. The arithmetic chains are therefore not re-derived,
  only re-confirmed intact.
- New premises checked for accuracy and applicability: sections 1-2 use
  only `R(3,4)=9`, the ambient `K5`/`I5` prohibitions, `|B|=24` and the
  row-degree identity, so "no census edge bound" is now true for them;
  `e(B)>=144` is indeed the premise behind the reviewed `x<=279` and
  behind `tail_two_three.md`'s one-deficit exclusion; `e(A)>=50` is the
  premise the q/E interval needs. The link resolves to
  `n43/reductions.md` section "8.1 Published internal-edge ranges"
  (`[PUBLISHED] 50 <= a <= 85`), the same anchor already used by
  `transfer_bounds.md`.

Finding 1 (Setting census disclaimer): **RESOLVED** — applied as
recommended; withdrawn.
Finding 2 (claim 3 Dependencies declaration): **RESOLVED** — applied with
the requested citation; withdrawn.

Renewed outcome: all three claims **accepted** for revision SHA-256
`8b01927b165167b108b6ae0b4829a7688a4ba2ec61b80e50bcbc2f0f099e45b9`
(210 lines) — `#claim-omission-triple-supply` and
`#claim-omission-attachment-capacity` unconditionally, and
`#claim-omission-endpoint-cover` **conditional on sibling acceptance** of
`tail_zero_one.md#claim-zero-seventeen-bound`,
`tail_zero_one.md#claim-one-seventeen-eight-sixteen` and
`tail_two_three.md#claim-tail-two-three-one-deficit-exclusion` by
AuditZeroOne and AuditTwoThree (a changed or withdrawn sibling claim
reverts it to pending review). The acceptance for the superseded
`97f7a05a…` revision stands only as history and must not be quoted for
integration. All statements in the Limits section continue to apply to
this revision, except that Findings 1-2 no longer do.
