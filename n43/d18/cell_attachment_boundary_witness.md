# A locally valid size-thirteen attachment boundary

Date: 2026-10-15. Author: Codex cell-attachment author.

Integration status (2026-10-15): all 1 mathematical claim below has
independent exact-revision acceptance; see [the review](review_cell_attachment_boundary_20261015_coordinator.md).
The reviewed proof body and its historical author-stage labels are preserved.
This banner resolves their current status: conditional propagation is accepted
for the companion deductions; this witness has research-planning use only.
Reviewed and integrated hashes are recorded in
[the cell integration manifest](overlapping_cells_manifest.json).
Review state: accepted; independent review recorded.
This is an explicit small local graph with an analytic forbidden-subset
verification. It is not an order-43 construction, an actual rooted candidate,
or evidence of global satisfiability. No enumeration, solver, installation,
catalogue, download, or novelty claim.

## Statement and deterministic definition

<a id="claim-u13-two-complete-cycle-vertices"></a>
Claim ID: `n43/d18/cell_attachment_boundary_witness.md#claim-u13-two-complete-cycle-vertices`
Kind: local-deduction
Review state: accepted
Scope: the explicitly defined local graph H of order13 below
Dependencies: elementary clique/independence partition checks
Conclusion: H is (5,3)-free; H contains S=C5, and exactly two of its
eight vertices outside S are complete to S; these two vertices are adjacent
Search use: none pending review; proposed use: research planning only
Reviews: [review](review_cell_attachment_boundary_20261015_coordinator.md)

The vertex order is

    s0,s1,s2,s3,s4,w,z,a,b,c,d,e,f,

or numerical labels0,...,12 in that order. S={s0,...,s4} induces C5,
with edges s_i s_(i+1) modulo five. Y={w,z,a,b,c,d,e,f}. The edges of
H[Y] are the union of the following specified sets, with repeated edges
taken once and every unspecified Y pair a nonedge:

    {wz,wa,wb,zc,zd,bd},
    all six pairs in {a,b,e,f},
    all six pairs in {c,d,e,f}.

For each y in Y, all S-to-y pairs are edges except those listed in D_y:

| y | D_y=S-N_H(y) |
| --- | --- |
| w | empty |
| z | empty |
| a | {s0} |
| b | {s2,s3} |
| c | {s1} |
| d | {s3,s4} |
| e | {s1,s2} |
| f | {s4,s0} |

Equivalently the numerical Y edge list, in lexicographic order, is

    (5,6),(5,7),(5,8),(6,9),(6,10),
    (7,8),(7,11),(7,12),(8,10),(8,11),(8,12),
    (9,10),(9,11),(9,12),(10,11),(10,12),(11,12).

Together with the C5 edges and the omission table this determines every
pair of H. This is a deterministic definition, not an implicit diagram.

## Analytic verification

Proof. Each D_y is a clique in C5 (empty, a singleton, or a cycle edge).
Consequently an independent triple with one Y vertex and two S vertices
is impossible. An independent triple with two Y vertices and one S vertex
would require a nonadjacent Y pair whose D signatures intersect. We verify
that this never occurs by listing every vertex's Y nonneighbors:

| y | Y-{y}-N_Y(y) | Structure |
| --- | --- | --- |
| w | {c,d,e,f} | K4 |
| z | {a,b,e,f} | K4 |
| a | {z,c,d} | K3 |
| b | {z,c} | K2 |
| c | {w,a,b} | K3 |
| d | {w,a} | K2 |
| e | {w,z} | K2 |
| f | {w,z} | K2 |

Pairs involving w or z have disjoint D signatures since theirs are empty.
The remaining nonedges are a-c, a-d, b-c; their omission sets are,
respectively, {s0} against {s1}, {s0} against {s3,s4}, and {s2,s3}
against {s1}, all disjoint. This proves the two-Y case. The same table
proves H[Y] has no independent triple, since every vertex's Y
nonneighbors form a clique. S itself has no independent triple. These
four partitions by the number of Y vertices cover every I3.

For K5, S has clique number two, so a potential K5 contains zero, one,
or two S vertices. There is no K5 contained in Y. Indeed w and z have
Y degree three, so neither belongs to such a clique. On the remaining
six vertices {a,b,c,d,e,f}, every cross pair between {a,b} and {c,d}
is missing except b-d. Thus its clique number is four, and its only
K4s are {a,b,e,f} and {c,d,e,f}. Their D unions are both all of S,
so neither K4 has a common S neighbor. This excludes a K5 with one S
vertex.

A K5 with two S vertices would require a Y triangle whose common
S-neighborhood contains a cycle edge. The complete Y triangle list is

    wab, zcd, bde, bdf,
    abe, abf, aef, bef,
    cde, cdf, cef, def.

To justify completeness, triangles meeting w or z are uniquely wab and
zcd from their neighborhoods. A triangle avoiding w,z either lies in
one of the two displayed K4s or contains the only cross edge bd; in
the latter case its third vertex is e or f. Compute common S-neighbors
by taking the complement of the three D signatures' union:

| Y triangle | Common S-neighborhood |
| --- | --- |
| wab | {s1,s4} |
| zcd | {s0,s2} |
| bde | {s0} |
| bdf | {s1} |
| abe | {s4} |
| abf | {s1} |
| aef | {s3} |
| bef | empty |
| cde | {s0} |
| cdf | {s2} |
| cef | {s3} |
| def | empty |

Every listed set is independent in C5. This excludes the two-S case.
The three clique partitions are complete, proving H is K5-free. Together
with the independence argument, H is (5,3)-free as asserted. The omission
table directly shows that exactly w,z are complete to S and are adjacent.

## Self-audit, counts, and use limit

The Y degree sequence in the declared vertex order is

    3,3,4,5,4,5,5,5.

It sums to34, matching the17 distinct Y edges. The signature sizes are
0,0,1,2,1,2,2,2, summing to10. Each cycle vertex is omitted exactly
twice, so every S vertex has degree2+6=8; each Y vertex has degree
d_Y+5-|D_y|=8. Thus H is8-regular, e(H)=52, and e(S,Y)=30,
as required by the independently reviewed size-thirteen attachment
constraints. These are cross-checks; the proof itself checks every possible
forbidden subset analytically by the number of S and Y vertices.

The bound of at most two complete-cycle Y vertices in
[attachment rigidity](cell_attachments.md#claim-u13-c5-rigidity) is tight
for an isolated (5,3)-free cell. This local example prevents replacing that
bound by one on the cell hypotheses alone. Actual A anchors, the opposing
T cell, all24 vertices of B, and global degree/column constraints are
absent. No extension to them is asserted. A full order-43 construction
would still require exhaustive five-subset verification and the project's
independent positive-evidence checks.
