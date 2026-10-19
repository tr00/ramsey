# Independent review of the K3 seventeen-row obstruction

Author: K3RowStructure. Reviewer: Main, a distinct identity.
Reviewed revision: `row_obstruction.md` SHA-256
`ce2c6985723e627a66a479b79f099207c3d30d4200becbd65ca03a7f33d82583`.
Claims: [seventeen-signature](row_obstruction.md#claim-k3-seventeen-signature),
[shared-vertex-rigidity](row_obstruction.md#claim-k3-shared-vertex-rigidity),
[twelve-vertex-residual](row_obstruction.md#claim-k3-twelve-vertex-residual).
Outcome: **accepted** for the exact local hypotheses stated in the note.
No closure of the surviving17row branch or of d18k3 is inferred.

## Independent checks

The reviewer read all296 lines and reconstructed each proof.
Dependencies: recorded R(3,4)=9 and R(3,3)=6; the accepted common-eight
classification at source SHA-256
`43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3`.
The source's connectivity assumptions are needed only for the intended
ambient application, not for the local deductions. No k1-only premise
is transferred; the nonedge-packing argument is completely reproved for B.

1. A17row is8regular by complementary Ramsey degree bounds. Its two other
   rows must each have15vertices, intersect it in8, and contain all7 outside
   vertices. Their pair intersection bounds the core triple intersection
   by1. If zero, the remaining vertex's8neighbors split between two induced
   triangle-free8sets; each part is independent, forcing an I4. Thus only
   triple intersection1 survives and the displayed eight signature counts
   follow exactly. This is a genuine excluded local subbranch.
2. The shared vertex has at most3neighbors inside each triangle-free8cell,
   so8regularity and the leftover2vertices force3+3+2. Degree>=6 in the
   other15rows then forces exactly3outside neighbors, hence Bdegree11.
   Its outside4nonneighbors are triangle-free and I3-free, giving exactly
   2K2/P4/C4. The standalone17core codegree sum476 attains all68edge and
   68nonedge upper bounds, yielding3/4codegrees. Both claimed S12 types
   follow, without assuming uniqueness of the17core itself. The ambient
   degree corollary correctly counts11B+3U and zero adjacency to v.
3. A17core nonedge has a common-nonneighbor triangle. Two outside vertices
   missing that nonedge produce either I4 or K5 according to their mutual
   edge, so the packing argument applies to adjacent as well as nonadjacent
   outside vertices. For the4vertices missing z this gives disjoint A_t.
   Each A_t is a clique by the independent4obstruction on z,t,a,b.
   An outside edge's common M-neighbor set is triangle-free and I3-free,
   hence has order<=5 and yields a_t+a_s>=3. Counts32-sum(a_t)>=24 and
   the stated2K2/C4lower bounds are correct. The two P/QplusT0complements
   have the exact stated8vertex type because they are nonneighborhoods
   of z inside the two15rows. All simultaneous constraints concern the
   same labelled12vertices; they are not independently realizable choices.

## Validation and limits

The parent's tiny scalar replay has71profiles before this obstruction and68
after removing exactly the three oriented(2,0,0),empty-triple profiles:
25 of000,30 of001,3 of002,9 of011,1 of111. This does not establish
feasibility of any survivor. Fixed S10/S11/S12 representatives were checked
for their triangle/I4 prohibitions, not scanned from a catalogue.
No solver, graph search, downloads, Lean or engine verification was performed.
The proof is elementary and does not require an order43 witness.

Metadata-only acceptance integration may follow; a changed proof requires
renewed review.
