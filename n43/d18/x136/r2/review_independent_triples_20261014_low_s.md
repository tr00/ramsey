# Independent review of joint size-five interfaces and residual overlap

Claim(s): [independent_triples.md](independent_triples.md),
`claim-r2-triples-01` through `claim-r2-triples-06`.

Author and reviewer: independent-triple agent; low-excess agent, distinct
identities. Date: 2026-10-14. The reviewer authored the explicitly linked
low-excess dependency note; this review independently checks the triple
note's additional arguments and their applicability to those dependencies.
The low-excess note itself has separate pivot-agent and triple-agent reviews.

Reviewed revision: exact uncommitted SHA-256
`fed38dd2c1bac3d580f788d4ac842da5c5b02c4fd2cc43e46fd595fd9b7f5b5f`.

Dependencies reviewed: `low_excess_columns.md` SHA-256
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`;
`../small_columns.md` SHA-256
`f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733`;
`../../frontier_band.md` SHA-256
`0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`.
The published numerical census premises underlying equality and the
four-transversal bound remain inherited external inputs, not recertified
catalogue statements.

Checks and findings:

1. The independent triple of actual size-five endpoints has disjoint
   columns by the nonadjacent union bound. Its residual three vertices
   form a triangle by the mixed I5 obstruction. Each P_i union R is
   exactly the pair remainder for the other two endpoints, hence
   K4/I3-free. Its vertices have degree4 or5 by the nonneighbor clique
   bound and R(3,3)=6 on neighborhoods. The existing Goodman/Mantel
   derivation gives16..18 edges. Summing these three cores counts the
   residual triangle three times, giving the stated correction6 and
   cross-edge interval37..43. For each residual vertex the degree in A
   is2 plus three attachments, yielding8 plus the number of degree-five
   core occurrences. This tracks all three actual cores simultaneously.
2. At s7, the capacity2 per A vertex is justified by triangle-freeness
   of B[L5] and the intersecting-column forced edge. The35 memberships
   have exactly one unit of deficit from36. Thus the unique deficient
   vertex has multiplicity1 and no vertex has multiplicity0. The
   weighted encoding allows repeated edge labels and zero-weight B
   edges; no column distinctness, label distinctness, or preferred
   independent triple is assumed. The two-four-column overlap has
   multiplicity at most1, and the separate disjoint exclusion gives
   its singleton identity. Residual labels avoiding any actual I3
   precisely specify its three A remainder vertices.
3. A hypothetical size-six neighbor z of the exceptional overlap must
   join both q_i by the pair-union obstruction. Allseven L5 plus z
   saturate the triangle-free,I4-free common-neighborhood upper order8.
   Its minimum degree is2: each vertex has at most5 nonneighbors by
   triangle-free,I3-free type and R(3,3)=6. Thus z has at most5 L5
   nonneighbors. Every double label in C_z meets that nonneighbor set,
   since two neighbors of z cannot form an edge of its triangle-free
   neighborhood. The unique singleton label meets it by the explicit
   K5 obstruction with q1,q2,a0,z. Each nonneighbor five-column can
   meet C_z in at most1 vertex by union size>=10. Therefore the six
   column members give incidence at least6 while the at-most-five
   nonneighbor columns give incidence at most5. All quantifiers include
   every actual column member, and the no-zero-label fact is essential
   and valid.
4. The exceptional cross row then has2four-column neighbors,1five-column
   neighbor, no size-six neighbor, and h large neighbors. Its exact
   global degree18 gives A degree14-h. The actual four-transversal
   vertex upper bound11 and H3 force h3 and allthree exceptional
   columns size7. This gives singleton overlap degree11, matching the
   independently accepted incompatibility theorem. All H3 partitions
   and all B[L5] graphs are covered; no choice of an independent triple
   participates in this s7 closure.
5. In the two-overlap s6 case, the nonadjacent ordinary6-column vertices
   have columns intersecting exactly in {a,b}, because their union
   must have size>=10. Their complement has order8 and K4/I3-free type,
   so the same eight-vertex lemma applies. Each overlap's L5 endpoint
   is nonadjacent to both ordinary vertices by the independently
   reviewed exact row. Thus its five-column meets either six-column
   in exactly its own overlap vertex, forcing two distinct L5 endpoints
   and their four-subsets in the common remainder. Common nonneighbors
   of an independent pair in K form a clique (a nonedge would giveI4),
   of size<=2 because K is triangle-free. The two L5 endpoints already
   exhaust this clique, proving their edge. An earlier draft's count of
   six vertices in (T1 union T2)-{a,b} was incorrect; it was reported
   and corrected before this reviewed revision. There are four such
   vertices and six remaining A neighbors. The displayed partition
   degree sum10 is correct in the reviewed text.
6. Claim06 independently closes that two-overlap case by a simpler
   full-graph obstruction: the two nonadjacent global degree18 vertices
   share v, four distinct T extras, and six distinct B vertices, so
   their global codegree is at least11. Their common nonneighbors have
   order5+c and are K5/I3-free; R(3,5)=14 gives5+c<=13, or c<=8.
   This contradiction includes the pivot and every B incidence and
   does not transfer an I4 prohibition into A. Size-one-or-two coverage
   from the reviewed low-excess Claim05 therefore leaves exactly a
   singleton overlap of degree10.

Outcome: accepted on the retained numerical literature premises. The
corrected count in Claim05 is required; the earlier incorrect count is
not accepted as evidence.

Permitted search use: propagate simultaneous actual triple-core predicates
and use I3 family coverage for s6/s7; terminate r2/s7; terminate the
two-overlap s6 child and propagate the singleton degree-ten residual.
Claim05 is a valid conditional interface whose full realizations are
subsequently excluded by Claim06. No whole s6 or order-43 closure follows.

Limits: this is independent mathematical review, with disclosed authorship
of a separately audited dependency, not a formal certificate. Numerical
census inputs were not recertified and novelty was not checked. No graph
enumeration, solver, canonicalizer, installation, or download was used.
Mathematical changes require renewed exact-revision review.
