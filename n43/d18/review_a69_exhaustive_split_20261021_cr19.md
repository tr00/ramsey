# Independent review of the exhaustive 69-edge split

Claim: [claim-a69-exhaustive-split](a69_decomposition.md#claim-a69-exhaustive-split).
Author: Main. Independent reviewer: `/root/claim_review_19` (`cr19`).
Date: 2026-10-21. Task kind: research proof review.
Outcome: **accepted**, conditional on the explicitly retained Ramsey and
core-edge premises. This review accepts Claim 9 only and does not promote its
other source claims' review metadata.

Reviewed revision: working tree based on commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256
`b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`.
The source hash was rechecked before writing this review.

Dependencies inspected: Claims 2–7 in the same exact source, with Claim 1's
core-connectivity argument as needed. External dependency records inspected:

| File | SHA-256 |
| --- | --- |
| `neighborhood_connectivity.md` | `b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0` |
| `connected_structure_transfer.json` | `4f7abd8d1dcd5fae9e08b8123ea76427af7f4678310f51af78fcb36f42a9bd13` |
| `../../docs/mathematical_baseline.md` | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` |
| `../../README.md` | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` |
| `x136/five_column_compatibility.md` | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` |
| `large_row_extensions.md` | `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` |

The final file's codegree refinement is not needed for exhaustiveness.
The smaller-core intervals, including the sufficient order-10 interval, are
used for template budgets rather than existence assertions. Literature and
census premises remain external and were not recertified.

Decisive independent checks:

- A pure 18-vertex graph has an independent four-set by `R(4,4)=18`, so
  its transversal number is positive. Handshake gives a vertex of degree
  at most seven. Its closed neighborhood hits every independent four-set,
  since an unhit one extends with that vertex to an independent five-set.
  Hence `1<=tau_4<=8` without an ambient hypothesis.
- The disconnected component-independence argument uses only the pure
  forbidden sets. Its sole possible order-18 profile is `(1,3)`.
  The edge maxima for clique orders 1, 2, 3 are respectively 68, 61, 58,
  excluding disconnection at 69 edges. Although the older connectivity
  note states ambient scope, its proof has no interface-dependent step.
- A one-vertex separator leaves order 17. Component independence caps
  eliminate all profiles except a clique of order 1–3 plus a `(4,4)`
  core. Their total edge caps 69, 66, 63 force the singleton component
  at equality, a 16-core with 60 edges, and eight separator attachments.
  Core five-connectivity makes its leaf and cut vertex unique. Every
  independent four-set uses either the leaf or the cut vertex; thus every
  cut graph has transversal number at most two.
- A singleton transversal deletes to a 17-core with 68 edges, so its
  vertex has degree one. Conversely a pendant extension of such a core
  is pure and has transversal number one. In the cut template, the only
  possible singleton transversal is the leaf, and the remaining
  cut-vertex-containing independent-four family exists precisely when
  `C-W` contains an independent triple. This separates the first two rows.
- At transversal number two and connectivity at least two, deletion of
  a chosen minimum pair leaves a 16-core. Counting edges gives attachment
  totals eight for an adjacent pair and nine for a nonadjacent pair.
  Splitting forbidden four-cliques and independent five-sets across that
  pair gives exactly Claim 4's local tests. Its connectivity bounds retain
  precisely the two-connected constructions. The first two rows then
  exclude smaller transversal number in these constructions.
- For a minimum transversal of size `t>=3`, its complement has no
  independent four-set and is a maximum induced `(4,4)` core: a larger
  such core would have a smaller transversal as complement. Claim 6's
  mixed forbidden-set tests cover every number of panel vertices, and
  its exchange test ranges over every possible smaller transversal
  `(T-U) union D`. Thus the higher-transversal templates impose minimum
  cardinality, rather than only inclusion-minimality. Claim 7's
  minimum-degree construction provides an alternative cover by core
  orders 10–15 and panels of orders 2–7 in this residual row.

These checks leave exactly the four displayed predicates: after selecting
`tau_4`, connectivity distinguishes the two `tau_4=2` rows; cut graphs
cannot occupy any `t>=3` row. The separately indexed values `t=3..8` are
also disjoint. Ambient neighborhoods satisfying the 69-edge setting inherit
these pure predicates directly. Choices of minimum pair, maximum core, or
minimum-degree vertex may give multiple representations of one graph, as the
source explicitly allows. No canonical marking or further disjoint edge/nonedge
partition of unmarked graphs follows.

Permitted use and limits: the accepted conclusion supports complete structural
branching after its dependent claims pass their own review gates. Source search
use remains none pending integration. It supplies no excluded family, ambient
extension, isomorphism census, or closure certificate. No solver, prover,
canonicalizer, download, catalogue processing, graph search, or novelty review
was performed. Validation consisted of proof and dependency inspection and
exact file hashes; no engine or Lean checks were required for this new review.
