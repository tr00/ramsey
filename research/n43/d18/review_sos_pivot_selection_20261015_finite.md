# Independent review of quadratic degree-18 pivot selection

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.

Claim(s): all four claims in [sos_pivot_selection.md](sos_pivot_selection.md):
`claim-sos-pivot-degree-square`, `claim-sos-pivot-covariance`,
`claim-sos-pivot-family`, and `claim-sos-pivot-twelve`.

Author and reviewer: author `sos_pivot`; independent reviewer `sos_finite`.
The reviewer did not author the source and made no changes to it.

Reviewed revision: base HEAD
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`, exact uncommitted proof SHA-256
`037901dc6de8864744ef9d5945d218624aaa575f889afc7c74650ccdf6f526e7`.

Dependencies reviewed: current exact hashes

```text
e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a research/n43/d18/dense_pivot_coverage.md
2b357ef5a53588c4e6879078210de4deae564ea22611fc4ffd81c21ecaa572e3 research/n43/d18/pairwise_pivot_refinements.md
43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233 research/n43/d18/pivot_classes.md
```

The reviewer read the relevant exact degree/excess identities and independently
rederived the four conditional high-codegree consequences from dense-pivot
Claim01. Exact Ramsey values and previously retained census extrema remain
external premises, not recertified by this review.

Checks: assumptions, quantifiers, ambient types, algebra, spectral direction,
positive-parameter condition, integer rounding, exact equality at twelve roots,
component independence addition, global-vertex coverage, example arithmetic,
and permitted conditional branching.

## Independent checks

All four claims accepted. Weighted K5-free mass merging and the adjacency
operator norm give sum d_H^2<=3eh/2. Centered rational squares give the
covariance cap for t>0, with the e0 and h>0 boundaries handled. Family
counts and selected-root bounds use the same root/statistics and positive
denominators; E and q minimizers are not conflated.

The exact example gives R40,V108/5,t3/4,J>=4003/5 and integer J>=801,
q_*<=4,M7>=14. For twelve roots, equality components are K_(a,a,a) with
part sizes summing to4; outside-vertex coverage would allow at most 16 of31
vertices, a contradiction. The cubic triangle-free equality case is excluded
by the eight-cell minimum10. All equality/counting steps were reconstructed,
including global common neighbors and overlapping component cover sets.

## Outcome and limits

Outcome: **accepted** for all four exact-hash claims on their stated
dependencies. Proposed use: degree/variance/covariance propagation; safe
selected-root and conditional same-family branching; termination only of
an explicitly inconsistent statistic profile. Twelve-root coverage is an
overlapping unavoidable-family statement, requiring every permitted root
profile, overlap map, and completion in any eventual exhaustive gluing use.

This review establishes no graph construction, order43 nonexistence, general
degree18 existence, unconditional small-x or small-excess assumption, or
novelty. It is an independent mathematical review, not a formal certificate
or replay of the external computational census. No solver, graph enumeration,
download, installation, staging, or commit was used.
