# Independent review of the singleton-transversal classification

Date: 2026-10-21. Author: `Main`. Independent reviewer: `cr13`.
Task kind: research/proof review. Owned output: this review only.

Claim: [claim-a69-singleton-classification](a69_decomposition.md#claim-a69-singleton-classification), including its necessary degree-set and induced-edge conditions. No other claim receives an acceptance outcome here.

Reviewed revision: worktree at base commit `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256 `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`.

## Dependencies and exact versions

Whole-file SHA-256 values for the dependencies inspected:

| File | SHA-256 |
| --- | --- |
| `a69_decomposition.md`, Claims 1 and 2 | `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085` |
| `large_row_extensions.md`, `claim-seventeen-codegree-moments` | `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` |
| `review_large_row_extensions_20261017_audit.md` | `14a19ee0a4914b5189b17cd797747400cd16c3e43847f1583c43b0a1d18f11fe` |
| `connected_structure_transfer.json`, separator profiles | `4f7abd8d1dcd5fae9e08b8123ea76427af7f4678310f51af78fcb36f42a9bd13` |
| `review_connected_structure_transfer_20261019.json` | `337398dabb0c65da5cdc490f19ec76b3db673b88b6d154da46576089efdd5765` |
| `neighborhood_connectivity.md`, Claims 1 and 2 | `b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0` |
| `../../../README.md`, recorded census extrema | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` |
| `../../../docs/mathematical_baseline.md`, named Ramsey premises | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` |

Historical reviewed-body hashes in the dependency reviews identify their earlier exact revisions; the table records the current presentation inspected here, without replacing historical provenance. The order-16 count 60 and order-17 count 68 remain retained published premises, rather than recertified census data. Claims 1 and 2 are ready in the source; their portions needed below were checked directly, not treated as already accepted.

## Decisive independent checks

1. A singleton hitting every independent four-set leaves a 17-vertex graph with neither K4 nor I4. The retained 68-edge count gives the deleted vertex degree exactly one. Conversely a leaf added to a 17-core introduces no K4 or I5, and every I4 uses the leaf. Such an I4 exists: after deleting its neighbor, the 16 remaining core vertices contain I3 by R(3,4)=9. Thus the minimum hitting number is one, rather than zero. The 17-core is 8-regular from the bounds on each neighborhood and nonneighborhood, so the added leaf is unique.
2. For the cut-family prerequisite, independence additivity bounds disconnected (4,4)-free graphs by order 11, implying five-connectivity of a 16-core. At a one-vertex separator of A the component-independence partitions leave only K_m plus a (4,4) core; the (2,2) alternative has order at most 16, below the required 17. The caps at m=1,2,3 are 69,66,63. Equality forces m=1, e(C)=60, uz present, and eight triangle-free core neighbors of z. Core degrees 7 or 8 show that u is the unique leaf. This verifies the prerequisite used by this claim without auditing unrelated parts of Claim 2.
3. Every I4 in that cut family uses exactly one of u,z because C is I4-free and uz is an edge. Its other three vertices form precisely the respective triple family displayed in Claim 2. Any singleton transversal must have degree one by check 1 and hence must be u. Therefore it exists exactly when C-W contains no I3. If C-W does contain I3, {u,z} still hits all I4 and no singleton does, so the minimum is exactly two. No assumption that arbitrary leaves hit all I4 is used.
4. When C+z is a 17-core, every core vertex has degree eight. Hence precisely the degree-seven vertices of C gain an edge to z, forcing W to be that eight-vertex degree class. Independently, edge codegrees in the 17-core are at most three and nonedge codegrees at most four: common neighbors of an edge are independent, while common nonneighbors of a nonedge form a clique and have size c-1. The sum of all codegrees is 17*binom(8,2)=476=68*3+68*4, so every bound saturates. Each c in W therefore has exactly three neighbors in W. This gives e(C[W])=12, e(W,C-W)=8*7-24=32, and e(C-W)=60-12-32=16. This part needs only elementary Ramsey bounds, not uniqueness of a census graph or the dependency's ambient hypotheses.

## Outcome and limits

Outcome: **accepted**, conditional on the explicitly retained Ramsey and published edge-count premises. No correction to the reviewed claim is required. The exact I3-free test remains necessary; the degree-set and edge counts were correctly presented only as additional necessary conditions.

The reviewed result supports structural branching/propagation under its pure-graph hypotheses. It provides no ambient order-43 completion, exclusion, branch closure, uniqueness census, or novelty claim. No solvers, provers, canonicalizers, downloads, graph enumeration, or nontrivial computational search were used. This review does not change source review states or shared indexes; independent review outcomes for the other source claims remain separate obligations.
