# Independent review of critical-core connectivity

Date: 2026-10-21. Claim: [claim-a69-core-connectivity](a69_decomposition.md#claim-a69-core-connectivity).
Author: Main. Independent reviewer: `/root/claim_review_11` (`cr11`).

Reviewed revision: uncommitted source at base commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`, with SHA-256
`b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`
for `n43/d18/a69_decomposition.md`.

Dependencies reviewed:

- `README.md`, SHA-256 `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0`: recorded `R(3,4)=9`, and `(4,4,16)` edge interval `60..60`, attributed to McKay–Radziszowski (1992), Table 1, p. 16 by the source note.
- `docs/mathematical_baseline.md`, SHA-256 `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0`: graph-type definitions and external-premise policy. The smaller Ramsey number and edge interval are retained external premises, not recertified literature results.
- Independence additivity across components was checked directly: maximum independent sets in separate components unite, while restricting any independent set to each component gives the reverse inequality. Complementation gives `R(4,3)=R(3,4)`.

Decisive independent checks:

1. For any disconnected induced remainder, each nonempty component contributes at least one to its independence number, whose sum is at most three. The only unordered profiles with at least two components are `(1,1)`, `(1,2)`, and `(1,1,1)`. An independence-one component is a clique of order at most three because `K4` is forbidden. An independence-two component is `(4,3)`-free and has at most eight vertices. Thus the respective total-order caps are six, eleven, and nine. No fourth component or independence-three component can occur. This also proves initial connectedness for every `h>=12`.
2. If a vertex deletion set disconnects `H`, its remaining order is at most eleven, giving `|S|>=h-11`. The convention allowing deletion to a singleton does not weaken this conclusion: such a deletion has size `h-1`. Consequently `kappa(H)>=h-11`.
3. For each vertex, its neighborhood has no triangle and no independent four-set, so it has order at most eight. Its antineighborhood has no `K4` and no independent triple (a triple would extend with the vertex to `I4`), hence also has order at most eight. Therefore `h-9<=d_H<=8`, with the ambient types in the proof correctly distinguished.
4. At order 17 the degree inequalities force every degree to be eight without using the order-17 census edge count. At order 16, let `r` be the number of degree-eight vertices; the others have degree seven. The external 60-edge premise gives `112+r=2*60`, hence `r=8`. Substitution into the connectivity bound gives five and six at orders 16 and 17. Orders above 17 are impossible already from the two eight-vertex local caps, so the stated universal quantifier causes no exceptional case.

Findings: the proof is valid on its stated external premises. The claim's short Dependencies field omits the order-16 edge-count premise used for its degree-profile conclusion, but that premise and its citation are explicitly supplied in the same note's setting and in the proof. The coordinator should add that premise to the field when integrating the review; no mathematical proof repair is required.

Outcome: **accepted** for this exact source revision, conditional on the recorded Ramsey and order-16 edge-count premises. The connectivity bound itself needs only the Ramsey premise and elementary component reasoning.

Limits: no external paper or census certificate was checked, no novelty review was performed, and no solver, theorem prover, canonicalizer, download, catalogue processing, or graph search was run. This review covers only Claim 1. It does not certify an ambient extension or closure of the 69-edge slice. The source still records search use as none pending review; source metadata and any propagation authorization remain the coordinator's responsibility.
