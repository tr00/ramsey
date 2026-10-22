# Independent review of the two-transversal attachment family

Date: 2026-10-21. Task kind: research / independent proof review.

Claim: [claim-a69-two-transversal](a69_decomposition.md#claim-a69-two-transversal), including its connectivity, realization, and contraction assertions. Author: Main. Reviewer: `/root/claim_review_14` (`cr14`), a distinct review agent.

Reviewed revision: worktree source at base commit `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`, exact SHA-256 `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085` for `research/n43/d18/a69_decomposition.md`.

Dependencies reviewed:

- Claims 1 and 3 in that same exact source were checked only to the extent used here. A disconnected `(4,4)` graph has order at most 11: independence profiles `(1,2)`, `(1,1)`, and `(1,1,1)` give caps 11, 6, and 9. Hence a 16-core remains connected after fewer than five deletions. Independently, a singleton transversal in a 69-edge graph leaves a 17-core with 68 edges and therefore has degree one, contradicting two-connectivity. The remainder of Claim 3 is not needed or reviewed here.
- `README.md`, SHA-256 `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0`: retained external edge counts 60 and 68 for orders 16 and 17, attributed to McKay–Radziszowski (1992), Table 1, p. 16. Those published data are not recertified.
- `docs/mathematical_baseline.md`, SHA-256 `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0`: retained smaller Ramsey premises. The argument uses `R(3,4)=R(4,3)=9` and `R(4,4)=18`. Existence of a `(4,4)` 17-core is retained for the realization assertion; no concrete graph witness was acquired or certified.

Decisive independent checks:

1. A two-set transversal leaves an induced 16-vertex graph with no `K4` or `I4`. Its 60-edge premise gives attachment sum 8 for an edge pair and 9 for a nonedge pair. In a two-connected graph the endpoint degrees require attachments at least 1 and 2 respectively, giving the stated upper bounds 7. No ambient neighborhood `I4` prohibition was introduced.
2. Every forbidden mixed set was checked by its number of added vertices. A mixed `K4` with one endpoint requires a triangle in its attachment; with two it requires `uw` and an edge in the common attachment. A mixed `I5` with one endpoint would need `I4` in the core; with two it requires a nonedge pair and `I3` in the common missed core. These cases prove both necessity and sufficiency of exactly the displayed tests.
3. For the edge case the common attachment has order at most 3, so the union has order at least 5. Set `k=min(p,q')+1<=5`. Fewer than `k` deletions leave a nonempty connected core. If both endpoints survive, their edge and at least one surviving union attachment connect them to it. If only one survives, removing its attachments and the other endpoint costs at least `k`. Removing the smaller endpoint's full neighborhood gives a separator of size `k`, since the endpoint and many core vertices remain. For the nonedge case, `k=min(p,q')<=4` leaves the core connected and each surviving endpoint attached under fewer than `k` deletions; its smaller attachment is a separator of size `k`. The nonedge mixed test also gives union size at least 8 because its missed core is `(4,3)`-free. Thus both connectivity equalities, including the boundary value 5, hold.
4. Conversely the table constructs a graph of order 18 and 69 edges with no `K4/I5`; the marked pair is a transversal. `R(4,4)=18` excludes transversal number zero, and the independent singleton degree-one argument excludes transversal number one. Hence its transversal number is exactly two. The resulting six-connectivity implication is valid, while these marked attachment families need not be disjoint as families of unmarked graphs.
5. Splitting the eight neighbors of a vertex in any 17-core into nonempty disjoint parts has edge count `68-8+8+1=69`. Each part is triangle-free, and the common attachment is empty. Part sizes `(1,7)`, `(2,6)`, `(3,5)`, and `(4,4)` give connectivity 2, 3, 4, and 5 under the proved formula. This is an analytic construction conditional on the retained core existence premise, not a verified order-43 construction.
6. Contracting the marked edge gives a simple graph with new neighborhood the attachment union and edge count `60+|P union Q|`. Being a 17-core forces 68 edges, hence union size 8 and disjoint attachments. The new vertex creates `K4` exactly through a triangle in the union and `I4` exactly through `I3` in its complement. The three contraction conditions are therefore necessary and sufficient.

Outcome: **accepted** for this exact revision, on the retained external premises. The claim supports the stated complete structural cover and attachment propagation; it supplies no exclusion or ambient-extension certificate. Source review-state metadata was not edited.

Limits: this review does not accept other claims in the document, recertify literature or catalogue premises, establish novelty, enumerate attachment systems, certify a concrete Ramsey witness, or close the 69-edge slice. No solver, prover, canonicalizer, download, or graph search was used.
