# Independent audit: two and three size-17 roots at the x=279 boundary

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `research/n43/d18/tail_two_three.md` —
`#claim-tail-two-three-profiles` (claim 1),
`#claim-tail-two-three-one-deficit-exclusion` (claim 2),
`#claim-tail-two-three-five-sixteen-residual` (claim 3),
`#claim-tail-two-three-three-root-residual` (claim 4).

Author: TailTwoThree. Reviewer: AuditTwoThree. Distinct identities; every
inequality, degree sum, capacity, scalar maximum, and equality case below
was rederived from the ambient setting rather than accepted from the
author's arithmetic.

Reviewed source SHA-256:
`1cf1ac0ccada5735c22b4f3198b3f2f2d1b88d2f78d6d0dd233dfb1dfe4df583`.

## Outcomes and independent checks

| Claim | Outcome | Check |
| --- | --- | --- |
| `claim-tail-two-three-profiles` | accepted | At x279,t>=2, x=270+2t+s-D and s<=12-3t give exactly(2,5,0),(2,6,1),(3,3,0); t4 has x<=278. |
| `claim-tail-two-three-one-deficit-exclusion` | accepted | Actual disjointness and omission capacities give maxima35/34/32. The B degree sum gives b<=143<144, excluding(2,6,1). |
| `claim-tail-two-three-five-sixteen-residual` | accepted | Core balance, deficits and overlaps prove(7);(8) is only conditional h0 propagation. The(2,5,0) profile remains open. |
| `claim-tail-two-three-three-root-residual` | accepted | L is a clique dominating the remaining A vertices; its three omitted8-sets partition B. E_T>=13 and the exact equality/P-omission constraints were rederived. The(3,3,0) profile remains open. |

The degree sums, Mantel/Turan values, equality excess partitions and all
scalar maxima were independently recomputed. The all-profile bound is 279,
not 278. Claim 3's Dependencies initially omitted Mantel/Turan, already
named file-wide; this non-blocking record finding was addressed in the
integration banner, preserving the accepted body.

## Addendum — reviewer corrections and integration-banner record

Two reviewer transcription slips were corrected without changing the source
or outcomes: the pivot contributes+1 in d_G=1+d_A+r, and the L **omitted
sets**, not its16-vertex rows, partition B. The integrated 336-line file at
`16d1e3a30e27c60728d39a2bbcdafa25a938a16b476fa80a225002d85ee6738d`
strips to the accepted 322-line body at the source hash above.

## Dependencies and limits

Independent-row accepted body:
`8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`;
large-row accepted body:
`1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`.
Their actual-set scopes were checked, including
`claim-independent-row-degree-cuts`, `claim-independent-row-combined-pairs`,
`claim-independent-row-tail-counts`, `claim-independent-row-280-boundary`,
`claim-two-seventeen-core-balance`, and `claim-seventeen-extension-domain`.
Ramsey values, degree interval18..24
and b>=144 remain recorded external premises; no x136 closure is used.
Use: branch/propagate the exact profiles and terminate only(2,6,1).
No residual realization, complete d18 closure, novelty assessment or formal
certificate is supplied.
