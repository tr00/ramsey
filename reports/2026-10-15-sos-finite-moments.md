# Finite positivity and degree-18 anchor handoff

Date: 2026-10-15. Author: `sos_finite`.
Task token: `sos-finite-20261015`. Base HEAD:
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.

Pure mathematical research under the user's theory-only SDP/SOS request.
No solver, graph or degree-profile search, enumeration, download, installation,
staging, commit, or shared-index edit. Small displayed formula tables were
checked by exact arithmetic over their allowed degree values.

Deliverable: [finite-moment proof note](../n43/d18/sos_finite_moments.md),
with four independently reviewable claim anchors:

1. `claim-finite-triangle-deficits`: exact complementary-triangle slack,
   quadratic degree moments, affine certificate deficits, and separate
   modulo-three neighborhood residues for actual (4,4)-free cores/cells.
2. `claim-finite-core-caps`: elementary order11 edge maximum at most36 and
   order13 maximum at most48, improving prior sufficient caps37 and49.
3. `claim-finite-low-transversal-thresholds`: q thresholds for low-degree
   (`d_A<=7`) transversals of sizes5..11, without restricting x. The
   exceptional size9,q1 case forces three disjoint actual independent-four
   anchors and E_A>=30, hence x>=168.
4. `claim-finite-q1-anchor`: at q1,E_A<=29, the set of degree-at-most-seven
   A vertices is not a transversal, so an independent four-set with every
   A degree at least8 is unavoidable. This covers the fixed-q slice
   x138..167, retaining an exact degree/signature defect identity.

The second claim proves two strengthened caps. All are local deductions, author self-audited and
ready for independent exact-revision review. Search use remains none until
review; suggested use is core/anchor propagation and conditional branching.
No x slice, q slice, or order43 case closes.

The order13 proof uses a near-equality structural obstruction in addition
to scalar moments: degree-eight neighborhoods saturate the cubic edge cap,
forcing zero complement common neighbors between nonadjacent members of
a seven-vertex degree-four class. A cross-incidence count then demands
at least14 incidences but permits at most12. This is the extra overlap
information not contained in the earlier affine scalar bound.

The exceptional q1,size9 deletion uses both Turan equality cases. The
resulting K(3,3,3) core and K3 disjoint union3K2 deleted set force three
disjoint I4 anchors of combined internal degree126. Their actual-column
caps permit only96 plus their excess, yielding E_A>=30. It makes direct
use of several actual anchors, without assuming a perfect fractional cover.

Limits: the new q1 anchor does not exclude four-set transversals or size-four
columns there, because their internal-degree floor is eight and they may
meet the degree-eight anchor. The method does not find a q1 root in every
candidate or upper-bound arbitrary x. No novelty claim or formally checked
certificate. Existing exact Ramsey bounds and order14/order18 census
premises remain external dependencies.

Inputs read include all task starting notes, the cross corridor, above-frontier
transfer and four-column notes, current equality anchor proof, weighted/anchored
cells, signature/transversal general theorems, and earlier quadratic interface
and degree-energy work. Exact relevant source hashes at author time:

```text
0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54 n43/d18/frontier_band.md
719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3 n43/d18/anchored_cell_averaging.md
2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e n43/d18/x136/five_column_compatibility.md
4959062245805c0690ba4ec9db26d4057ff9ca2342813dc02fa12fe6c08f4036 docs/general_theorems/signature_anchors.md
dbc5bc023dbe92ee970a816eeaea16ecd808971c0b72b979a3103087323ac24c docs/general_theorems/transversal_deletion.md
```

Exact proof hash at handoff is recorded in the coordinator message. Shared
indexes, WORK, Git staging and integration remain coordinator-owned. Both
owned new files are released to the coordinator for independent review and
integration. Revisions after independent review need a fresh reviewed hash.
