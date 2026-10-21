# Independent audit of the prescribed-family overlap claims

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Task: `audit-pending-20261015`.

Claim(s): `family_overlap.md#claim-family-overlap-01` through
`family_overlap.md#claim-family-overlap-04`.

Author and reviewer: overlap-author agent; independent
`/root/audit_family_overlap` agent. The reviewer rederived the arguments
before consulting the earlier source theorem; the author's self-check and
any concurrent review are not treated as independent evidence for this audit.

Reviewed revision: repository HEAD
`b12925f7a96d24e18d06b0237930a32e30660ca2`, with exact uncommitted source
SHA-256:

```text
ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1  docs/general_theorems/family_overlap.md
```

Dependencies reviewed: the four source claims are audited below directly.
The specialized numerical statements assume the classical upper bounds
`R(3,3)<=6`, `R(3,4)<=9`, and `R(3,5)<=14`. Their lower bounds are
unnecessary. Those literature premises were not independently proved or
certificate-replayed here. For a completely specified input to the component
formula one may also take `rho_1=3`, using the elementary `R(3,2)=3`.
The source theorem was consulted for comparison at:

```text
e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a  n43/d18/dense_pivot_coverage.md
e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e  docs/mathematical_baseline.md
51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2  docs/workflow.md
```

No census, minimum-degree theorem, solver, graph enumeration, download,
installation, or formal checker was used. All calculations below are
mathematical counts.

## Claim outcomes and independent checks

| Claim | Outcome | Decisive check |
| --- | --- | --- |
| 01 | accepted | A family triangle saturates2L<=d+k, forcing exact codegrees, a complete neighborhood union and no vertex with exactly one triangle neighbor. The four-clique and independent-anchor alternatives were checked. |
| 02 | accepted | Paw-free triangle components and triangle-free components satisfy the stated independence/order capacities. Ramsey inputs and all empty/equality cases were checked. |
| 03 | accepted | Summing component capacities forces a low-overlap edge inside the prescribed same-degree family; every numerical degree18/19/20/21 substitution was recomputed. |
| 04 | accepted | Strict triangle exclusion and odd-degree consequences use the same-family and exact-codegree assumptions, not a new universal root family. |

Every outcome is on the exact source hash above. Ambient common neighbors
are counted globally. An I4 prohibition is used only where derived from
its actual anchor, not inherited by a whole neighborhood. The proof supplies
conditional overlapping families, not disjoint partitions or completed gluing.

## Search use, limits, and handoff

All four exact-revision claims may support propagation or branching under
their recorded hypotheses and Ramsey premises after coordinator integration.
They are existence-coverage results for retained two-root families. A future
exhaustion must still cover every permitted codegree, overlap map and
completion. No claim supplies a complete graph nonexistence certificate,
family census, novelty determination, or decision of `R(5,5)`.

No unsupported inference requiring withdrawal was found in these four
claims. The restrictions on the equality threshold, exceptional `d=3k`,
strict anchor inequality, equal degrees within the prescribed family, and
explicit general-`k` component bounds are essential and must be retained.
This review changes no source proof or shared index. Any substantive proof
change requires a fresh exact-revision audit.
