# Independent ambient-type audit: adjacent degree-18 root cells

Date: 2026-10-17. Reviewer: LegacyCellAudit (independent of the note authors
and of the coordinator who applied the correction).

## Claim(s) under review

- [pivot classes](pivot_classes.md) section 2, pointed-pair paragraph,
  corrected lines 101-109 (pre-correction lines 101-105).
- [transfer bounds](transfer_bounds.md) `claim-band137-adjacent-pivots`,
  profile paragraph, corrected lines 287-297 (pre-correction lines 287-293).

Author of the notes: branch authors; the correction was applied by the
coordinator (Main). Reviewer: LegacyCellAudit. This file is the superseding
audit linked from both corrected paragraphs.

## Reviewed revision (exact SHA-256)

| file | pre-correction | corrected (reviewed, final) |
| --- | --- | --- |
| n43/d18/pivot_classes.md | 43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233 (238 lines) | cb941dc985719a66ab3988ea9b0bddeaf6848ac64645e13ff4cfffd0c5ed6f42 (242 lines) |
| n43/d18/transfer_bounds.md | aba6d5141eb8ddcb597690658e15f2e962a34984a5c71f9731c5f2af1239e95d (417 lines) | 149783596ee7d8f944082e261d8dff70d966e4b2c6548f8af3d06287042d6115 (421 lines) |

Evidence for the pre-correction hashes: they are the git index blobs
(`git show :<path> | sha256sum`), the index line counts 238/417 match the
pre-correction reads of both files, and the index text at lines 101-105 /
287-291 was read before the correction and matches verbatim (both paragraphs
ended `... has order/size 7+lambda and is (4,4)-free ...`). After the
correction, `git diff -- <both files>` shows exactly one hunk per file — the
`(4,4)` to `(5,4)` substitution plus four added withdrawal lines — and no
other working-tree/index difference, so the index blobs are precisely the
pre-correction files. The corrected hashes were captured in two independent
runs and re-pinned immediately before this review was written.

## Dependencies reviewed

- Standing hypotheses: G simple, |V|=43, no K5, no I5; u,v distinct
  degree-18 roots. Local; no census input in the cell arithmetic.
- R(4,4)=18, R(3,5)=14, and the baseline anchor rule (a cell adjacent to every
  vertex of a fixed c-clique and nonadjacent to every vertex of a fixed
  i-independent set lies in R(5-c,5-i)) from
  [mathematical baseline](../../docs/mathematical_baseline.md#immediate-local-constraints);
  that section was read and does record R(4,5)=25, R(4,4)=18, R(3,5)=14 and
  the anchor rule.
- External premise E(4,5,17)=79 (Angeltveit-McKay) for the displayed
  overlap bounds: recorded in the notes, not recertified here.

## Independent derivation of the actual cell types

Fix adjacent degree-18 roots u,v and lambda = |N(u) intersect N(v)| (neither
root lies in the intersection). Partition V(G) minus {u,v} into the four
cells: C common neighbors, X adjacent only to u, Y adjacent only to v, D
common nonneighbors.

Sizes.

- |N(u) union N(v)| = 36-lambda; because uv is an edge, u lies in N(v) and v
  lies in N(u), so both roots lie in the union. Hence |D| = 43-(36-lambda) =
  7+lambda, and X,Y each have order 18-lambda-1 = 17-lambda (the excluded
  root v lies in N(u) minus N(v)). Check: lambda + 2(17-lambda) +
  (7+lambda) = 41, plus the two roots gives 43.
- For comparison, nonadjacent roots: neither root lies in either
  neighborhood, so |D| = 43-(36-lambda)-2 = 5+lambda, |X| = |Y| =
  18-lambda, and lambda + 2(18-lambda) + (5+lambda) = 41. The `7+lambda`
  and `including v and u in the union` statements in both notes are
  therefore correct exactly for the adjacent case, and the notes are scoped
  to adjacent roots (pivot section 2 title; transfer section 4 title and
  `guaranteed adjacent degree-18 u` table header).

Types (all from the two prohibitions only).

- Adjacent C: a triangle in C together with u and v (all mutual edges) is a
  K5, so C is K3-free; I5-freeness is hereditary. Type (3,5) as the notes
  state, giving lambda <= 13 by R(3,5)=14.
- Adjacent X and Y ("opposite mixed cells"): X is a subset of N(u), so a K4
  in X plus u is K5; every X vertex is nonadjacent to v, so an I4 in X plus
  v is I5. Type (4,4) — orders 17-lambda <= 17 by R(4,4)=18.
- Adjacent D: no vertex of D is adjacent to u or v, so an I4 in D plus u is
  I5: D is I4-free. K5-freeness is hereditary. A K4 in D is NOT excluded:
  neither root is adjacent to D, so neither root extends a D-clique, and the
  baseline anchor rule for D has c=0, i=1, yielding only R(5,4). Best
  derivable type: (5,4)-free. The pre-correction `(4,4)` assertion for D is
  not provable from the standing hypotheses; the corrected `(5,4)` is exact.
- Nonadjacent roots (for contrast): C is (4,5) (K4 plus u is K5), X and Y
  are (4,4) (same argument as above with either root), D is (5,3) (an
  independent triple in D plus the independent pair {u,v} is I5). No
  root-pair common-nonneighbor cell is (4,4) in either relation.
- The corrected sentence `The opposite mixed cells, not this
  common-nonneighbor cell, are (4,4)-free` matches this derivation, for the
  adjacent case, cell by cell.

Baseline anchor rule cross-check: edge uv gives C: c=2,i=0 -> R(3,5); X:
c=1,i=1 -> R(4,4); D: c=0,i=1 -> R(5,4). Nonedge uv gives D: c=0,i=2 ->
R(5,3). Every entry of the corrected paragraphs agrees.

## Dependence of the displayed overlap bounds on the withdrawn typing

The displayed tables (pivot section 2: x136..x141 with bounds 9,9,9/10,...;
transfer section 4: x137..x142 with bounds 9..11) were recomputed
independently:

- Pivot, lambda <= floor((170-2q-L*z)/(18-z)) capped by 13, L=max(0,6-q),
  z=E_v: (0,0) 170/18=9.4->9; (0,1) 164/17=9.6->9; (0,2) 158/16=9.9->9;
  (1,0) 168/18=9.3->9; (0,3) 152/15=10.1->10; (1,1) 163/17=9.6->9;
  (0,4) 146/14=10.4->10; (1,2) 158/16=9.9->9; (2,0) 166/18=9.2->9;
  (0,5) 140/13=10.8->10; (1,3) 153/15=10.2->10; (2,1) 162/17=9.5->9.
  All match the tables. Monotonicity in z has the sign of 170-2q-18L,
  positive for every q=0..35 (checked: worst case q=0 is 62>0; q>=6 gives
  170-2q>=100>0).
- Transfer, x142 row: 134/12=11.2->11; 148/14=10.6->10; 158/16=9.9->9;
  164/18=9.1->9 — the four displayed uncapped fractions reproduce exactly,
  and every (q,E_A) row satisfies x=136+2q+E_A=142.

What the bounds actually use: (a) the external E(4,5,17)=79 lower bound
d_A(u) >= 6-q obtained by deleting u; (b) the R(3,5)=14 cap 13, which needs
the (3,5) type of C — correct in both notes before and after the correction;
(c) integer arithmetic. The general pivot formula also subtracts
max(0,6-q,i) for an excess-i neighbor, i.e. it uses the mixed-cell bound
d_A(u) >= i, which follows from the (4,4) type of the OPPOSITE mixed cell
(|X| = 17+i-lambda <= 17); that typing is retained and correct, and in every
displayed row (q <= 3, E <= 6) max(0,6-q,i) equals max(0,6-q) anyway, so the
displayed numbers do not even need it. The withdrawn common-nonneighbor
typing is used nowhere in either derivation — it is pure gluing/structural
prose. The corrected disclaimers `The overlap bounds above do not use that
assertion` and `The displayed adjacent-pivot overlap bounds do not use the
withdrawn typing` are therefore verified true.

## Corrected lines as applied (verified verbatim)

pivot_classes.md lines 101-109 and transfer_bounds.md lines 287-297 were
read after the correction and match the independently derived replacement
exactly: `(5,4)-free` for the common-nonneighbor cell, the four-line
withdrawal pointing to this audit, the opposite-mixed-cell (4,4) statement
(pivot only), and the bound-independence disclaimers. No further edit is
recommended.

## Findings

1. Pre-correction defect (both files): the common-nonneighbor cell of two
   adjacent degree-18 roots was typed (4,4). Actual type is (5,4); a K4 in
   that cell is not excluded by any standing hypothesis (P1-level for
   downstream gluing, since the type, not the size arithmetic, was wrong).
   Impact was limited to structural/gluing prose: no displayed overlap bound
   depends on it. Corrected by the coordinator; correction verified above.
2. No other defect found in the scoped paragraphs: sizes 36-lambda and
   7+lambda, the union including both roots, (3,5) for the common
   neighborhood, and both disclaimers are all correct.

## Downstream spot checks (in scope of this audit)

- [fixed_b_extensions](fixed_b_extensions.md) lines 45-46 already state the
  cell `would only be (5,4)` and need no typing — consistent.
- [obstruction_coverage](obstruction_coverage.md) Claim01 (lines 66-91)
  independently derives the full four-cell table for both relations; it
  agrees cell by cell with this audit and explicitly corrects the legacy
  pointed-pair paragraphs.
- Residual `(4,4)` mentions in transfer_bounds lines 111 and 144 belong to
  different claims (two-vertex transversal remainder, actual-column
  four-transversal) with their own independent arguments; not the root cell.
- docs/theory_phase_1.md uses `(4,4)` only for mixed cells and `(5,3)` only
  for the nonedge common-nonneighbor cell — both correct in context.
- Text search across n43/, docs/, reports/ for `common-nonneighbor`,
  `7+lambda`, `36-lambda`, `pointed-pair` found no remaining assertion that
  an adjacent-root common-nonneighbor cell is (4,4).

## Outcome

Accepted (post-correction text, exact SHAs above). The pre-correction
typing is changes-requested and superseded; this review records the
replacement rather than altering the historical coordinator reviews of the
surrounding claims.

## Limits

- R(4,4)=18, R(3,5)=14, and E(4,5,17)=79 are accepted as recorded premises,
  not recertified against literature in this audit.
- The downstream search covered text matches in n43/, docs/, reports/;
  full re-audits of x136/ sub-branch proofs, lean/, and the general
  gluing notes were not performed beyond the spot checks listed.
- No novelty, closure, census, or search-use claim is made or checked here.
