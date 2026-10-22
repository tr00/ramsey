# Independent review of signatures and weighted homogeneous anchors

Editorially condensed on 2026-10-21; [original audit and lineage](../../research/reports/2026-10-21-research-cleanup.md).

Claim(s): `signature_anchors.md#claim-signature-anchors-01` through
`signature_anchors.md#claim-signature-anchors-06`.

Author and reviewer: augmentation-author agent; overlap-author agent (distinct
identities). Date: 2026-10-15.

Reviewed revision: exact uncommitted file SHA-256
`7c286ad9f941ca8bb62ac24aa03967e436d78266299a42d2fef1cede098ebb0b`.
Input project revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.

Dependencies reviewed: all six direct proofs, the definitions of Ramsey
numbers including `R(i,1)=R(1,j)=1`, and the stated small Ramsey premises
`R(4,3)=9`, `R(3,5)=14` in the numerical specialization. The source
four-bit anchor and frontier-defect arguments were read in
`research/n43/reductions.md`, section 6, and `research/n43/d18/frontier_band.md` while checking
the companion abstractions. No published small Ramsey certificates or the
optional global degree floor 18 were independently recertified.

## Independent checks

All six direct proofs were checked. Mixed clique/independent splits give
exact rooted assembly, including parameter-one and empty-family boundaries.
Residual induced types give the numerical union/intersection caps. The Hall
condition quantifies over every independent subfamily; singleton classes
have capacity p-2. Incidence defects handle b<c, b=c and repeated signatures.

Weighted excess needs nonnegative loads, load<=1 and nonnegative excess on
positive-load vertices; no perfect packing is assumed. The clique-anchor
dual exchanges asymmetric parameters correctly. At pivot degrees18/20,
independent-anchor incidence floors are36/32 and clique-anchor ceilings48/52.
A degree 20 pivot alone does not make excess above degree20 nonnegative.

Outcome: accepted for all six claims on their explicit hypotheses and retained
Ramsey premises. No proof correction is required for this exact revision.

Permitted search use: exact mixed-set propagation using the complete family
of opposite-side homogeneous sets, numerical signature and anchor propagation,
and weighted excess bounds with recorded weights, loads and degree premises.
These provide no fractional-cover existence or order-43 closure.

Limits: no graph computation, download, formal proof checking, or literature
certificate recertification was performed. The optional degree floor and all
numerical Ramsey inputs remain stated application premises. Novelty was not
checked. Proof changes require renewed exact-revision review.
