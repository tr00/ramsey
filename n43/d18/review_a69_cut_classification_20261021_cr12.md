# Independent review of the 69-edge cut classification

Date: 2026-10-21. Task kind: research, independent proof review.

Claim: [claim-a69-cut-classification](a69_decomposition.md#claim-a69-cut-classification), only.
Author: Main. Reviewer: `claim_review_12` (`cr12`), a distinct reviewing agent.
Outcome: **accepted**, conditional on the recorded Ramsey and census premises.

Reviewed revision: HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`;
the exact worktree source SHA-256 is
`b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`.
The hash, rather than HEAD alone, identifies the reviewed bytes.

Dependencies inspected (SHA-256 of current bytes):

| Source | SHA-256 | Use |
| --- | --- | --- |
| `a69_decomposition.md`, Claim 1 | `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085` | Independently replayed the connectivity and order-16 degree-profile arguments needed here; no separate outcome for Claim 1 is issued. |
| `neighborhood_connectivity.md`, claims 01–02 | `b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0` | Disconnected profile and maximum 68 edges. |
| `connected_structure_transfer.json`, separator profiles | `4f7abd8d1dcd5fae9e08b8123ea76427af7f4678310f51af78fcb36f42a9bd13` | Independently replayed the one-separator component and attachment bounds. |
| `review_connected_structure_transfer_20261019.json` | `337398dabb0c65da5cdc490f19ec76b3db673b88b6d154da46576089efdd5765` | Historical independent audit and renewed acceptance; historical hashes are not substituted for current proof bytes. |
| `../../README.md` (repository root) | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` | Ramsey table and census extrema, with reference [2] to McKay–Radziszowski (1992). |
| `../../docs/mathematical_baseline.md` (repository root `docs/`) | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` | Recorded external-premise context. |

Decisive independent checks:

- **Scope and coverage.** The disconnected-neighborhood result has ambient metadata, but its proof uses only order 18, no K4, no I5, Ramsey values and census extrema. Replaying it in the pure scope gives maximum 68 edges. For a cut vertex, the remaining order 17 has independence at most four. Component independence profiles other than (1,3) have order at most 16: (2,2) gives 16, (1,1,2) gives 14, and (1,1,1,1) gives 12; total independence at most three gives at most 11. Thus exactly a clique K_m and a (4,4)-free component remain.
- **Forced equality.** At m=1,2,3 the edge ceilings are respectively `60+8+1=69`, `55+1+8+2=66`, and `50+3+8+2=63`. The bound eight on the cut vertex's core neighbors follows from triangle-freeness and I4-freeness, using R(3,4)=9. Consequently 69 edges force m=1, core order 16, 60 core edges, eight attachments and the edge to the singleton. There are no singleton-to-core edges by the component partition.
- **Converse and uniqueness.** Any core and eight-subset satisfying the specified triangle test produce 69 edges and avoid K4/I5: a K4 through z needs a triangle in W, while an independent set uses at most one endpoint of uz and at most three core vertices. The core is at least five-connected: any disconnected induced (4,4)-free graph has at most 11 vertices by component independence additivity and R(4,3)=9. Hence deletions other than z cannot disconnect A. Core vertices have degrees at least seven, z has degree nine, and u has degree one, proving uniqueness of the leaf as well as the cut vertex. For A-u, fewer than five deletions neither disconnect the core nor exhaust z's eight attachments.
- **Transversal and triple counts.** Every I4 uses exactly one of u,z, giving precisely the two displayed families. The transversal {u,z} proves tau_4<=2; R(4,4)=18 guarantees an I4 in A, so tau_4>=1. For the supplementary count, the order-16 core has eight degrees seven and eight degrees eight, as its degrees lie in {7,8} and its degree sum is 120. Each vertex contributes `d(15-d)=56`; counting mixed triples twice yields `triangles(C)+I3(C)=binom(16,3)-16*56/2=112`. An edge codegree is at most three because its common neighborhood is independent (a common-neighbor edge creates K4) and C has no I4. Thus `3*triangles(C)<=3*60`, or triangles(C)<=60. The complement has the same degree multiset and 60 edges and is also (4,4)-free, so I3(C)<=60. Combining these gives the stated `52<=I3(C)<=60`.

Findings: no mathematical gap or required correction in the assigned claim.
The two I4 subfamilies are disjoint as families of sets; no assertion that their
core triples are vertex-disjoint is needed. No I4 prohibition was transferred
to A itself. The claim gives a pure structural parametrization and does not
assert any ambient extension.

Limits: Ramsey values and the published order-14 through order-17 edge extrema
were retained from the repository, not recertified against the paper or a
catalogue. No novelty review, solver, prover, canonicalizer, graph generation,
download, or nontrivial computational search was performed. The review checks
mathematical reasoning, not an order-43 completion or branch closure. Search
use remains `none` in the source pending coordinator integration; this review
supports the proposed complete structural branching for this claim only.
Only this review file was created; source, indexes, WORK and manifests were
not edited.
