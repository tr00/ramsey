# Independent review of joint size-five interfaces

Date: 2026-10-14. Author: `r2_triples`. Reviewer: Codex coordinator,
distinct from the author.

Claims: [independent_triples.md](independent_triples.md),
`claim-r2-triples-01` through `claim-r2-triples-04`.

Reviewed revision: exact uncommitted SHA-256
`74ed9333e9959f1e11d2f442fda5b068c953872aded2447f29660ec52cc9178c`.
Claims 01--03 were initially rechecked at
`c733b899d98562444bbab640faa760bc984188b49727abfed404a71789ea1941`;
the added Claim 04 is separately checked below. Later metadata-only edits
do not replace these proof revisions.

Dependencies reviewed: small-column note SHA-256
`f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733`;
frontier note `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`;
low-excess proof `116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`,
including its separate independent reviews by the triple and pivot agents.
The numerical census extrema underlying equality and the four-transversal
bound remain external premises; no catalogue completeness was recertified.

Checks and findings:

- For an independent B triple of size-five columns, the three columns are
  disjoint by the pair union lower bound. Its remaining three A vertices
  form a triangle by the mixed independent-five obstruction. Each of the
  three eight-vertex pair remainders is K4/I3-free. A vertex of such a
  remainder has degree four or five: its nonneighbors are a clique of
  order at most three and its neighborhood is triangle-free with alpha at
  most two. The edge bounds 16..18 additionally use the previously recorded
  Goodman/neighborhood triangle count. Summing the three remainders counts
  the residual triangle three times, giving the exact correction six and
  the between-column edge interval 37..43. The residual degree identity
  includes two neighbors in the common triangle and the three attachment
  contributions. Triangle-free B[L5] of order at least six has an I3 by
  R(3,3)=6, so family coverage is explicit.
- At s=7 the total 35 memberships have capacity 36, with each A vertex
  in at most two L5 columns. Hence there is exactly one singleton and no
  zero label. Two L5 neighbors of the same A vertex are adjacent by the
  pair-union condition; an overlap of the two L4 columns has at most one
  L5 neighbor by K5-freeness. The new disjoint-transversal exclusion then
  forces exactly the singleton-labelled A vertex into the L4 overlap.
  The weighted encoding permits zero-weight edges and repeated labels.
- A hypothetical size-six neighbor z of that overlap vertex belongs to
  the common B neighborhood of the L4 edge, which is triangle-free and
  I4-free. Its seven L5 vertices plus z fill the upper order bound eight.
  Such a graph has minimum degree two: a vertex's nonneighbors are
  triangle-free/I3-free and have order at most five. Thus z has at most
  five L5 nonneighbors. Each of its six A column members has a label
  meeting that nonneighbor set. For a double label this follows from
  triangle-freeness; for the exceptional singleton it follows from the
  explicit K5 on q1,q2,a0,p,z if zp were an edge. Each nonneighbor L5
  column intersects the six-column in at most one vertex, by the
  nonadjacent union bound. The incidence contradiction 6<=5 is valid.
- With ordinary size-six neighbors excluded, the exceptional row has
  exactly two L4 neighbors, one L5 neighbor and h large-column neighbors.
  Its global degree18 yields d_A=14-h. The four-transversal upper bound
  eleven forces h>=3; H=3 forces h<=3. Thus d_A=11 and three size-seven
  columns occur, all incident to that row.
- Claim 04 composes these deductions with the independently accepted
  low-excess singleton-degree-eleven theorem. All s=7 profiles, including
  every J and every partition of H=3, are covered: no assumed preferred
  independent triple is used in the closure. The contradiction terminates
  exactly the r=2/s=7 child. The general triple-core predicates remain
  useful for s=6, where the saturated label premise cannot be transferred.

Outcome: accepted on the stated premises. Permitted search use: propagate
the joint triple predicates, use unavoidable triple coverage at s>=6,
and terminate r=2/s=7 with the low-excess dependency chain.

Limits: independent mathematical review, not a formal certificate or a
literature novelty claim. No full x branch or order-43 decision follows.
No graph enumeration, solver, download or installation was used.
