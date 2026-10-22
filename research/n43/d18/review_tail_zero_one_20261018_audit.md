# Independent audit: zero/one size-17 root omission and attachment cuts

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `research/n43/d18/tail_zero_one.md` —

- `#claim-zero-one-omission-budget` (Claim 1, equations (1)–(3)),
- `#claim-zero-seventeen-bound` (Claim 2, t=0 bound x<=278),
- `#claim-one-seventeen-eight-sixteen` (Claim 3, t=1,s=8 gives D>=9, x<=271),
- `#claim-one-seventeen-residual-attachments` (Claim 4, residual inequalities
  (6)–(10) and the h=1 specialization).

Author: TailZeroOne. Reviewer: AuditZeroOne (review token `audit`). Distinct
identities; every inequality, count, profile list, and dependency hypothesis
below was rederived from the ambient setting and the reviewed dependency
texts, not accepted from the author's arithmetic.

Reviewed source SHA-256:
`d5e0f9319228d562e886c03e7017001a6d23e3e4c4a07dda01d2879efd4a983e`.

## Outcomes and independent checks

| Claim | Outcome | Check |
| --- | --- | --- |
| `claim-zero-one-omission-budget` | accepted | d_A+r=17+epsilon and x=270+2t+s-D rederived. A-edge omission intersection<=32-r_a-r_b gives capacities 1+delta and delta; each actual triple requires a high-root witness. |
| `claim-zero-seventeen-bound` | accepted | t0/s9 has Q0, forcing every residual deficit>=1 and x<=270; otherwise x<=278. At x278 only(s,D)=(8,0) remains. |
| `claim-one-seventeen-eight-sixteen` | accepted | D<=8 supplies a zero-deficit root complete to L. L is triangle-free from that root and I4-free from anticompleteness to the 17-root. Then72-4D<=e(Z,L)<=36 contradicts D<=8; D>=9 and x<=271. At t1/x279 only(s,D)=(7,0) remains. |
| `claim-one-seventeen-residual-attachments` | accepted | Equations(6)--(10), H/W sums, h1 signatures and thresholds14/11/10/9/9/9 for h1..6 recomputed. The scalar tuple(2,11,24,72,5) is feasible; a sweep finds tuples for every h1..6, not graphs or an exclusion. |

No defect found. The exact row identity is immediate from the cited row cuts;
Claim 1's safely narrower t0/1 scope is not needed by its equations.
Claims 1--3 are census-free; b>=144 enters only equation(10).
Use: terminate t0 at x>=279 and t1/s8 at x>=272; propagate the residual.
The all-profile bound remains279 and t1/x279 is open.

## Dependencies and limits

Accepted independent-row body:
`8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`;
integrated snapshot:
`9aa35b990079ca3e249c9df9b096252fcbbb73dec9b0280e3059b3a78e2434b6`.
Accepted large-row body:
`1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`;
integrated snapshot:
`4d91ae44929b9026eca2fd5de5a36a75927368658c904c37d4a6c10fb8d1cb71`.
Both were reread for applicability, including the general eight-cell
classification used on A[L]. The checked dependencies are
`claim-independent-row-combined-pairs`, `claim-independent-row-tail-counts`,
`claim-seventeen-codegree-moments`, `claim-common-eight-classification`,
and `claim-seventeen-extension-domain` in those notes.
Ramsey values, the degree interval18..24
and B census minimum144 remain external. No novelty or formal certificate;
no endpoint realizability, t>=2 exclusion, full d18 closure or x<=278 result.
