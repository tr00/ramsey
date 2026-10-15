# Independent review of mixed-cell intersection claims

Date: 2026-10-15.
Author: Codex cell-intersection author.
Reviewer: Codex cell-obligations agent, a distinct collaborating agent.

Claim(s): all five local-deduction claims in
`n43/d18/cell_intersections.md`:
`claim-intersection-types`, `claim-c5-signatures`,
`claim-c5-edge-cell-extensions`, `claim-exact-mixed-compatibility`, and
`claim-isolated-mixed-pair-limit`.

Reviewed revision: exact uncommitted file SHA-256
`cc05444b193403ba5ef614ed75f1acfba566afda576e7a3fe473c08aac4144b7`.
Repository HEAD during review:
`f98a1285b7adc9720a693ae3a54fba212a021bdf`.

Dependencies reviewed: cell-type and saturation arguments in
`n43/d18/anchored_cell_averaging.md`, SHA-256
`719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3`;
its recorded exact-revision independent audit
`n43/d18/review_audit_pending_averaging_20261015.md`, SHA-256
`e6964bfaaecc6a78b6d45ab922f3535a98a0c76174ec7be49445397bd6dfd66a`.
The external small Ramsey premise R(3,3)=6 was retained. All classification
and subset-partition steps below were independently derived; no graph
enumeration or catalogue was used.

## Checks and findings

The ambient hypotheses are correct: A can contain I4, T is
triangle-free/I4-free, U is K5-free/I3-free, and their induced intersection
is triangle-free/I3-free. The two anchors are stated disjoint; the analysis
uses actual occurrences and imposes no x, q, E, or column-size hypothesis.

For `claim-intersection-types`, I checked orders zero through five.
At order three, neither all-zero nor all-one pairs are permitted, giving
the two complementary types. At order four the degree lies in [1,2].
Components of maximum degree two are paths and cycles; the only partitions
without isolated vertices or triangles are a four-path, a four-cycle, and
two two-paths, each with independence number two. At order five both a
vertex's independent neighbor set and its clique nonneighbor set have
order at most two, so every degree is two and the graph is C5. This
independently checks completeness and local realizability, without
asserting occurrence in a full order-43 candidate.

For `claim-c5-signatures`, a T-exclusive vertex has an independent
S-neighbor signature and a U-exclusive vertex has a clique S-nonneighbor
signature. Both have order at most two. At each cycle vertex, the two
cycle neighbors are already in its independent T-neighborhood, whose
order is at most three. Thus there is at most one T-exclusive neighbor
at that vertex, proving disjointness of every pair of N signatures,
including signatures at nonadjacent exclusive vertices. The listed eleven
named subsets on each side are precisely the empty set, five singletons,
and the five allowed pairs.

For `claim-c5-edge-cell-extensions`, I checked necessity and sufficiency
separately. With one exclusive vertex, no new I4 can occur because S has
no independent triple. With two exclusive vertices, an I4 can only use
both and an independent S pair; for a nonadjacent exclusive pair this is
equivalent to the missed S set being a clique. The union of their disjoint
signatures therefore has order at least three. Sizes are (1,2) or (2,2).
Deleting an independent cycle pair leaves an edge and its common-neighbor
singleton. A further singleton must be that isolated vertex for the
remaining set to be a clique. Any two disjoint independent pairs leave
a singleton and pass the test.

With three exclusive vertices, T has order eight and every degree lies
in [2,3], independently because neighborhoods are independent of order
at most three and nonneighbors are (3,3)-free of order at most five.
If X has zero edges, its three signatures each have size two, violating
disjointness in a five-set. If it has one edge, the isolated vertex's
signature is an independent pair. Each of the other signatures must
contain that pair's unique common cycle neighbor, by the missed-clique
condition; this again violates disjointness. A triangle is forbidden.
Thus X is P3. Its endpoint signatures have sizes (1,2) or (2,2), and
its center signature has size at most one in the remaining S vertices.
For sizes (1,2), the two remaining cycle vertices are equivalent under
the reflection preserving the endpoint signatures. For sizes (2,2),
deleting the unused cycle vertex leaves P4, whose partition into two
independent pairs is its unique bipartition, up to exchange. These are
exactly A--D. Each listed pattern has independent disjoint signatures,
triangle-free X, no independent X triple, and a clique of missed S vertices
for the only nonadjacent X pair. Consequently no triangle or I4 remains.
This verifies the full local sufficiency statement, rather than only its
necessary signature tests.

For `claim-exact-mixed-compatibility`, I independently partitioned a
forbidden subset by S,X,Y. A subset wholly in either anchored cell is
excluded by that cell's type, and a subset avoiding S is covered by (i).
A remaining K5 meets all three sets; triangle-freeness of S union X
forces exactly one vertex in S, one in X, and three in Y. This is exactly
the obstruction prohibited by (iii). A remaining I4 meets all three;
the no-I3 condition in S union Y forces exactly one vertex in S, one in
Y, and two in X. This is exactly (ii). Violating either containment gives
the stated K5 or I4 directly, so necessity also holds. This argument
covers all orders of S, including S empty. The two propagation statements
are valid necessary disjunctions on actual B pairs. Condition (i) is
properly retained, so the note does not promote these mixed clauses to
a complete test for the part avoiding S.

For `claim-isolated-mixed-pair-limit`, any new forbidden subset must use
both x and y. A K5 then requires a triangle in S, and an I4 requires two
nonadjacent S vertices in y's missed set, which is a clique. Neither
depends on the choice of xy. This is a local statement on the specified
induced subgraph; the explicit limits correctly preserve possible
obligations from other anchors, vertices, or degrees.

Outcome: **accepted**, all five claims at the exact hash above.
Permitted search use after integration: propagation on each claim's stated
actual-cell hypotheses; the isolated-pair limit also supports research
planning. There is no branch-termination or universal-occurrence deduction.

Limits: external small Ramsey inputs were not reproved from primary
literature. No novelty review, formal proof checker, construction verification,
or certified exhaustive order-43 decision was performed. Any proof change
requires renewed review of its changed exact revision.

