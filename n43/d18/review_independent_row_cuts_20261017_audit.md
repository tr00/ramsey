# Independent audit: independent-row cuts and the large-row tail

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `n43/d18/independent_row_cuts.md` —
`#claim-independent-row-degree-cuts` (claim 01),
`#claim-independent-row-combined-pairs` (claim 02),
`#claim-independent-row-tail-counts` (claim 03),
`#claim-independent-row-single-seventeen-boundary` (claim 04),
`#claim-independent-row-280-boundary` (claim 05).

Author: Main. Reviewer: IndependentCutsAudit. Distinct identities; every
displayed inequality, count, and equality profile below was rederived from
the ambient setting rather than accepted from the author's arithmetic.

## Reviewed revision

Byte-exact SHA-256 of the exact uncommitted file under review
(computed with `sha256sum` immediately before writing this file):

    eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69

(268 lines.) The author revised three times during this review task; each
revision was re-hashed before reading:

| Order | SHA-256 | Lines | State |
| --- | --- | --- | --- |
| first draft (original assignment target; matched expected SHA) | `8a79cbf9205e738458b697f8da211d8a6c2f6c78daa8c1a4807c123153f71536` | 216 | fully audited, then superseded by author; never accepted |
| intermediate | `fb6059b7b8b6262e5b459cf413acc08fe3e1cf95af40429bc246ade443859c2c` | 258 | fully audited, then superseded by author; never accepted |
| final (target of this review) | `eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69` | 268 | reviewed; outcomes below |

Superseded drafts carry no acceptance; this review covers only the final
SHA. No other file references any anchor of this note (grep-verified), so
superseded claim IDs cannot be consumed downstream.

## Claim outcomes and decisive checks

| Claim | Outcome | Independent check |
| --- | --- | --- |
| `claim-independent-row-degree-cuts` | accepted | Independent A-set degree budgets8/12/20 rederived with actual forbidden-set witnesses. |
| `claim-independent-row-combined-pairs` | accepted | Opposing row-pair cuts imply independent size 17 roots anticomplete to size 16 roots. |
| `claim-independent-row-tail-counts` | accepted | s<=12-3t and 7t+8s<=72 imply x<=280 without an edge census, including t0. |
| `claim-independent-row-single-seventeen-boundary` | accepted | t1/s8 equality contradicts actual triple omission capacities. |
| `claim-independent-row-280-boundary` | accepted on declared premises | t2/s6 forces m_y=2 everywhere; the cores cover B and L/Z obligations give A<=30. Global cap 24 gives f<=22, hence b<=141<144. Thus x<=279. |

All scalar tables, Mantel/Turan values and degree sums were recomputed.
Superseded x287/x282 drafts carry no acceptance into the final result.
The initial accepted 268-line revision was
`eba2641c773df72810a918fc01ecf2b250db3bb2fbe90166ac971038e55e9a69`.
Its sole non-blocking finding requested the explicit all-vertex cap 24
citation in the Setting and Claim 05 Dependencies (not a cap only on A).

## Addendum — renewed review after the premise-declaration fix

The reviewer reread the 270-line source at
`8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`.
Only the global-cap declaration and dependency text changed; all five proof
bodies, equations and tables remained intact. Finding resolved; all five
claims **accepted** at this renewed hash.

## Final manifest note — integration banner and review-wording fixes

The281-line integrated source at
`2d118369b8436398b8c7c1e16930520dbcd5d8776f3bb1e5d97de35f1c78317c`
consists of an 11-line banner and the accepted 270-line body, checked byte-for-byte.
Two reviewer transcription corrections leave outcomes unchanged: an outside
independent **triple** extends an independent pair to I5, and the t3
summary inequality is sum_I d>=15-3=12. Earlier drafts are superseded.

Limits: Ramsey values and b>=144 from the published B-complement cap 132
remain external premises. The earlier50..55/60 census slices are used only
by superseded drafts. No graph enumeration, novelty review or formal
certificate was supplied by this audit. Use: stated row/degree propagation
and termination of x>=280; x279 and the d18/order43 decision remain open.
