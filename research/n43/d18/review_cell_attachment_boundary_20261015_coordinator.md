# Independent review of the local attachment boundary witness

Date: 2026-10-15. Author: Codex cell-attachment author.
Reviewer: Codex coordinator, distinct from the author.

Claim: `cell_attachment_boundary_witness.md#claim-u13-two-complete-cycle-vertices`.
Reviewed revision: HEAD `f98a1285b7adc9720a693ae3a54fba212a021bdf`, exact
uncommitted source SHA-256
`e140763cd0c4ece28a23a03308e888e8dc56b0774c505c79238f07dc8ed48875`.
Dependencies: elementary graph definitions and forbidden-subset partitions;
no external census input. I independently reconstructed all adjacencies from
the numerical Y edge list and the S omission table before checking the proof.

The Y edge union has 6+6+6-1=17 distinct edges, with ef the repeated edge.
The numerical list agrees with that union. Its degrees are 3,3,4,5,4,5,5,5.
Each of the five cycle vertices occurs in exactly two omission sets. Hence
the graph has 5+30+17=52 edges and every vertex has degree eight.

For independence, S has no independent triple. A single Y vertex cannot
miss two nonadjacent S vertices, because every D is a cycle clique. For two
Y vertices, the only nonedges not involving the empty-signature vertices
w,z are ac,ad,bc. Their D intersections are empty. Thus no nonadjacent
Y pair has a common S nonneighbor. For triples entirely in Y I reconstructed
each Y antineighborhood and checked all its pairs: they are the cliques
listed in the author's table. These four cases exhaust every triple.

For cliques, a K5 can use at most two cycle vertices. No Y K5 can contain
w or z, of Y degree three; on the remaining six vertices only bd crosses
between ab and cd, while ef is a clique joined to both pairs. A cross
clique containing bd cannot include a or c, so has size at most four.
The only Y K4s are abef and cdef. Their D unions both cover S.

I independently checked the complete twelve-triangle list: wab,zcd,
bde,bdf, and the four triples from each of abef,cdef. Recomputing the
complements of their D unions gives respectively
{1,4},{0,2},{0},{1},{4},{1},{3},empty,{0},{2},{3},empty,
in the author's stated order. Every set is independent in the cycle.
Consequently no Y triangle has two adjacent common S neighbors. These
cases exhaust K5s with zero, one, or two S vertices.

Outcome: **accepted** at the exact source hash above. The local graph is
(5,3)-free and its two vertices complete to S are adjacent. This proves
that the bound two cannot be improved using the isolated U/S hypotheses
alone. Permitted use: research planning, to rule out that stronger isolated
cell assertion. It gives no actual A anchors, T cell, B completion, order-43
construction, or evidence of global satisfiability. No computational graph
enumeration, five-subset construction check, solver, formal certificate,
download, or novelty review was performed; the verification is analytic.
