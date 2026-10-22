# Independent review: closure consequences for root profiles

Date: 2026-10-21. Reviewer: subagent `cr08`, independently assigned by the
coordinator; author: Main. Task kind: mathematical proof review.

Claim: [claim-closure-consequences-root-profiles](x136_closure_consequences.md#claim-closure-consequences-root-profiles), and no other claim in that note.

Reviewed revision: working-tree source SHA-256
`3a7a2777728de0b10b9057f74a44ad908222c20c117d1a37ad623929fb358647`;
checkout HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.

Outcome: **changes-requested** for the claim as stated. Parts (a)--(c)
and the pointwise bounds in (d) pass; the assertion in (d) that q is the
same at every root has an unsupported justification.

## Dependencies reviewed

Exact working-tree SHA-256 snapshots:

| Dependency | SHA-256 |
| --- | --- |
| `frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `x136/frontier_exclusion_handoff.md` | `a199142f594183660037639eddeeeb4ebffe331afcb92e00f0fa796384e9a127` |
| `x136/review_frontier_exclusion_handoff_20261019_main.md` | `fc3583f0ef92956752e4b24a065620473cef966d56c1058ff3f0f999fdd8c9fb` |
| `../../../docs/theory_phase_1.md` | `d752949e05035e2efe6350bd8e701416df7784e7721c6b99ac117944ccdb62ef` |
| `../../../docs/mathematical_baseline.md` | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` |

The closure proof and its independent review were read for the exact rooted
scope and permitted propagation of x>=137. Its accepted dependency chain is
used as a premise, rather than recertified recursively. The prior closure
review identifies historical reviewed source hash
`c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`;
the current hashes above identify the presentations actually read, without
replacing historical provenance. The census bounds a<=85 and b>=144 and
R(4,5)=25 remain recorded external premises.

## Decisive independent checks and finding

Degree summation over A gives 324+E_v=18+2a+x, hence
x=306-2a+E_v=136+2q+E_v. The published a<=85 and the degree floor
give nonnegative integer q and E_v. Thus excluding x=136 gives precisely
2q+E_v>=1 and excludes (q,E_v)=(0,0). When E_v=0, integrality gives
q>=1; when q=0, E_v>=1 means at least one of the eighteen nonnegative
neighbor excesses is positive. These verify (a)--(c), with A K4/I5-free
and B K5/I4-free throughout.

When W=0, nonnegative excesses force every global degree to equal 18.
Summing degrees over B gives 432=2b+x, and summing over A gives
324=18+2a+x. Consequently b=a+63=148-q at each root. With b>=144
and q>=1, this yields q in {1,2,3,4}, x in {138,140,142,144}, and
b in {144,145,146,147} at each root. In particular b=148 is impossible.
These are necessary allowed values; existence of all four is not proved.

The proof then says, "Since b is a graph invariant, q is the same at every
root." Here b is e(G[M(v)]), which depends on the chosen vertex v.
Regularity fixes e(G)=387 but does not make this induced-subgraph edge
count a graph invariant independent of v. The independent sums above
show only b_v-a_v=63. Also a_v counts triangles containing v; ordinary
regularity does not make those counts constant. For example, the regular
graph consisting of a disjoint K4 and cube has different neighborhood
edge counts at its vertices. This example diagnoses the invalid general
inference, rather than being a counterexample to the full order-43 Ramsey
hypotheses. No additional argument forcing constancy under those hypotheses
is supplied here or in the cited budgets.

Requested correction: remove "is the same for all roots" and its
graph-invariant justification, retaining the pointwise conclusions, or
supply a separately reviewable argument proving the asserted constancy.
Propagation of the rootwise bounds is supported; propagation of a common
q across distinct roots is not supported by this proof.

## Limits

No solver, prover, canonicalizer, graph search, download, or experiment was
used. Checks were independent symbolic degree sums, integer implications,
ambient-type and dependency-scope checks, and the four endpoint values.
External census premises and the previously accepted closure dependency
chain were not independently recertified. No novelty or formal-certificate
claim is made. This review does not exclude all 18-regular candidates,
establish an unavoidable degree-18 root, or determine R(5,5).
