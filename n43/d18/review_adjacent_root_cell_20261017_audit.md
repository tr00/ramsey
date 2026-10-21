# Independent ambient-type audit: adjacent degree-18 root cells

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-17. Reviewer: LegacyCellAudit (independent of the note authors
and of the coordinator who applied the correction).

## Decisive independent checks

The adjacent-root common-nonneighbor cell has order 7+lambda and type(5,4),
not(4,4): no root is adjacent to it, so a K4 there is not forbidden.
Opposite mixed cells are(4,4), and the common-neighbor cell is(3,5).
For nonadjacent roots the common-nonneighbor cell is(5,3), order 5+lambda.
All cell orders sum to41 after removing the roots.

Both corrected paragraphs were compared with the applied diff. The overlap
tables were recomputed and remain unchanged: their derivations use the
common-neighbor cap 13, the deletion floor from E(4,5,17)=79, and, where
needed, opposite mixed-cell bounds. The withdrawn typing affected gluing
prose only. The x142 overlap list11/10/9/9 was reproduced.

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
