# Independent review of dense degree-18 pivot coverage

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): [dense pivot coverage](dense_pivot_coverage.md),
`claim-dense-pivot-01`, `claim-dense-pivot-02`, `claim-dense-pivot-03`.

Author and reviewer: pivot-coverage agent; low-excess agent (distinct
identities). Date: 2026-10-14.

Reviewed revision: exact uncommitted file SHA-256
`ffb876fc478698c1a32a86298c29863bdfd562ca646706f8d93e630dc0a215d1`.

Dependencies reviewed: `pivot_classes.md` SHA-256
`43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233`;
`excess_bounds.md` SHA-256
`2577e6eccf38b51fbb2d691d488d747302b4445fca31dbe344b64dd30af73c97`;
`frontier_band.md` SHA-256
`0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`.
The retained identities x=136+2q+E and q+E<=W/2+4 were rederived from
degree/edge sums and the stated neighborhood/antineighborhood extrema.
The numerical census premises and established small Ramsey numbers were
checked for applicability, not independently recertified.

## Independent checks

All three claims were independently checked. The thirteen-root family
argument counts ambient common neighbors, uses triangle-codegree equality
and component independence, and supplies overlap<=10 on one same-family
edge without an edge census. The h/W/deficit family substitutions were
recomputed, including26/26/24/20/14 members at h3/5/7/9/11, D0.

Both endpoint density predicates belong to that same family; no independent
root selectors are merged. The family counts are conditional and overlapping,
with no universal small-h, W or x hypothesis. Every permitted overlap and
completion remains a later gluing obligation.

Outcome: accepted, on the explicitly retained numerical literature premises.
No mathematical corrections are required for the reviewed revision.

Permitted search use: Claim01 and Claim03 supply existence coverage for a
complete two-root family; Claim02 supplies numerical propagation and
conditional family counts. No listed profile is closed. Applying the family
properties to an arbitrary earlier root, identifying separate guaranteed
pairs, or omitting allowed overlap maps/completions would exceed these claims.

Limits: census premises and small Ramsey-number certificates were not
recertified; no exhaustive graph computation, formal proof checking,
construction, or order-43 exclusion was performed. Novelty was not checked.
Proof changes require renewed exact-revision review.
