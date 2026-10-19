# Independent review of the K3 core interface

Author: K3CInterface. Reviewer: Main (distinct identities).
Reviewed revision: `core_interface.md` SHA-256
`9ffcf6b4fb68cc04b7698a5bfc2a4e378ccd7d9041d9ca0360e4a41d59ad46cb`.
Claims: [claim-k3-core-01 through07](core_interface.md#claim-k3-core-01).
Outcome: **accepted**, conditional on the recorded published premises.
No novelty or order43 realizability claim was reviewed or inferred.

## Dependencies and checks

The reviewer read all458 lines and independently checked the seven arguments.
Connectivity source SHA-256:
`b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0`;
common-eight source SHA-256:
`43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3`.
The cited degree/common-cell and census premises remain literature assumptions,
not newly certified facts. The reduction index is concurrently maintained;
review-time hash `3fb69de5abff26ca756032d2d743f134750a06c667ace4dc714d4f062c580a32`.
No proof depends on a dashboard status or on x136 being realizable.

1. Core neighborhoods are (3,4)-free and core nonneighborhoods (4,3)-free,
   giving degrees6..8. The missing-U argument forbids I3 only in the missed
   C set, not throughout C; the seven-column bound has the correct ambient type.
2. For q independent B vertices all missing the same U vertex, a remaining
   independent(4-q)-set would give I5. The q=2 missed residual is therefore a
   clique of size<=3; q=3 gives an empty residual. Three missed8sets then
   saturate inclusion-exclusion24-9=15, giving precisely the stated three
   disjoint triangles and six singleton occurrences.
3. Summing d_G(c)=1+d_C(c)+r_c gives the attachment/excess identities without
   a maximum-root hypothesis. The column upper-degree inequality is immediate
   and applies only to the indicated columns.
4. The15row census gives50edges, the two pair intersections supply>=12,
   and the root triangle supplies3. A disconnected(4,4)15graph would have
   component independence partition of total<=3 and order<=11. Thus the
   strict reroot is connected. Selection of a maximizing degree18 root is
   explicitly additional; it is not used to delete arbitrary-root cases.
5. Positive U excesses force111. Pair unions force exactly three double-
   signature8blocks. Each pair union is a(4,4)16graph with60edges and8
   vertices of each degree7/8. Subtracting the twice-counted internal degree
   yields d_B11..14. Census-free8cell structure and the reviewed exact
   S10/S11/S12 classification apply to each actual block. Summing the degrees
   independently gives X=168+L, EC=2e-87+L, EB=2w-216+L and
   W=2(e+w)-300+2L>=88. Equality prerequisites are not an existence claim.
6. Common nonneighbors of ui,c contain exactly the indicated core residual
   and missed block set. The latter is triangle-free and I3-free, of order<=5;
   equality gives C5. For d_C(c)=6 and r_i(c)=3 the entire cell has13 vertices,
   so the recorded critical-cell regularity gives8regularity. Its C5-to-Z
   edge count is30; 8regularity on Z then forces its degree5 count2 and17
   internal edges. No edges outside this exact cell were counted.
7. The modular recipe was independently implemented using quadratic residues
   rather than the author's listed neighborhoods. All1365 C4subsets avoid
   K4/I4; its44 independent triples all meet T. The20vertex graph has83edges
   and all15504 five-subsets avoid K5/I5. The independent edge serialization
   SHA-256 agrees:
   `e711eefcf05d41e4101ebb5f064e377d45339dc185600d24c4a1e9cb725c92fa`.
   This proves a sharp single-column obstruction, not a43vertex completion.

## Verification and limits

Tiny exact arithmetic independently checked the balanced aggregate endpoint
(f=50,h_i=12,X=168): EC=13,EB=72,W=88. This is arithmetic feasibility only.
All three fixed S10/S11/S12 graphs from the accepted source were also checked
for triangle/I4 freeness and10/11/12edges. No solver, graph enumeration,
catalogue scan, installation, Lean check, or engine test was performed.
The full C-by-B compatibility problem and maximal-root condition remain open.

A future metadata-only acceptance integration preserves this exact proof body;
any proof change requires renewed review.
