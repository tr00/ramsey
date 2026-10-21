# Independent audit: omitted-row obligations from high-row averaging

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-18. Author: Main. Independent reviewer: AuditOmission.
Source: [averaging_omission_cuts.md](averaging_omission_cuts.md).

| Source stage | SHA-256 | Outcome |
| --- | --- | --- |
| Initial206-line note | `97f7a05a4e44c2f6e72b65c4b4e64ac35c4542534213fdf8ebbbfe95407493bd` | Mathematics accepted; two non-blocking premise-declaration findings. Endpoint cover conditional on sibling audits. |
| Revised210-line note | `8b01927b165167b108b6ae0b4829a7688a4ba2ec61b80e50bcbc2f0f099e45b9` | Findings resolved; all three claims accepted, retaining the sibling condition. |

## Outcomes and independent checks

| Claim | Outcome | Decisive check |
| --- | --- | --- |
| `claim-omission-triple-supply` | accepted | High roots omitting y are independent: an edge would give intersection>=9 against cap 8. At most three omit y, and double counting gives Delta=72-7t-8s and triple supply>=max(0,24-Delta). |
| `claim-omission-attachment-capacity` | accepted | Every actual omitted triple needs a neighboring high-root witness. Intersection capacities 1+delta and delta give the pointwise and summed bounds; overlapping witnesses are counted through capacities. Empty sets, delta0, Delta0/1, size14/15 and all ceilings checked. |
| `claim-omission-endpoint-cover` | accepted conditionally | Six original profiles reduce to(1,7,0),(2,5,0),(3,3,0) using the separately reviewed exclusions. Row counts10/11/12, D0 and the q/E arithmetic were recomputed; the bound stays279. |

Dependencies: [independent-row cuts](independent_row_cuts.md), especially
`claim-independent-row-combined-pairs` and `claim-independent-row-tail-counts`,
at accepted body hash
`8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`;
[zero/one tail](tail_zero_one.md#claim-zero-seventeen-bound),
[one/eight tail](tail_zero_one.md#claim-one-seventeen-eight-sixteen), and
[two-root deficit exclusion](tail_two_three.md#claim-tail-two-three-one-deficit-exclusion).
The endpoint claim's sibling-acceptance gate is discharged by AuditZeroOne
and AuditTwoThree, as recorded in the [integration report](../../reports/2026-10-18-averaging-tail.md).
A changed or withdrawn sibling puts the affected endpoint cover into review.

## Findings and renewal

F1: the initial blanket census-free statement was false for section3.
F2: Claim 3's Dependencies omitted the e(A)>=50 premise used for q<=35
and E>=73. Both were declaration defects, not invalid arithmetic.

## Addendum — renewed review after the premise-declaration fixes

The reviewer reread the revised file and checked exactly two localized
changes: section1/2 remain census-free, section3 explicitly retains b>=144
behind x<=279, and its q/E interval cites the published A minimum50.
All proof bodies, formulas, tables and claim metadata otherwise remained
byte-identical. Both findings: **resolved**. Renewed acceptance applies to
`8b01927b165167b108b6ae0b4829a7688a4ba2ec61b80e50bcbc2f0f099e45b9`;
the initial hash remains historical provenance.

Limits: small Ramsey values, degree interval18..24 and A/B census bounds
remain external premises. A is K4/I5-free with I4 allowed; B is K5/I4-free.
The endpoint survivors are necessary profiles, not constructions or
contradictions. No novelty assessment, formal certificate, whole-branch
closure or x<=278 result. Use: scoped propagation/branching only.
