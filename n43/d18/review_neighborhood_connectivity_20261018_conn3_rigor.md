# Independent review of claim-connectivity-03 (recorded filters and interface obligations)

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Claim(s): `n43/d18/neighborhood_connectivity.md#claim-connectivity-03`
(review state `ready`, Reviews: none at review time). Claims
`#claim-connectivity-01` and `#claim-connectivity-02` in the same file were
independently reviewed and accepted elsewhere (`ConnectivityAudit`,
`reports/2026-10-17-d18-connectivity.md`); they are treated here as reviewed
premises and were rechecked only as claim 03 uses them.

Author and reviewer: Author `Main` (task `connectivity-d18-20261017`);
reviewer `ConnRigor`, a distinct identity performing an independent
re-derivation. Date: 2026-10-19.

Reviewed revision: SHA-256 of the exact bytes reviewed:

```text
125007bb8e179ff0fa741eeb926dc1a8cfad4c5d72a07eddfcc3cd919204df77  n43/d18/neighborhood_connectivity.md
```

This equals the post-review integration snapshot recorded in
`reports/2026-10-17-d18-connectivity.md`, where claims 01/02 were accepted
with claim statements and proof bodies unchanged.

## Checks and findings

All four parts were independently rederived. For disconnected A=K_m+C,
a<=68 and d_A on the clique is m-1<=2, while d_C<=8. The deletion floor
max(0,a-79) is vacuous and these degrees satisfy the recorded cap 13.
The survey covered located unconditional A-only filters, not every possible
predicate in the corpus.

At m1, the isolated A vertex has no internal neighbors; its cross row is a
17-vertex 8-regular (4,4) core when its excess is zero. At m2/3 the stated
triangle cases were exhaustively checked. Every actual B column must meet
every I4 in A, directly from I5-freeness; this is an interface obligation,
not an I4 prohibition on all of A. No realizability or exclusion follows.

Initial outcome: **changes-requested**, although the mathematics was correct:
F1 needed the claim02 citation for a<=68; F2 needed the cap 13 and a bounded
filter inventory; F3 needed the source of the column obligation; F4 needed
epsilon=d_G-18 defined once. Claims01/02 retained their separate acceptance.

## Addendum (2026-10-19): renewed review after documentation fixes

Renewed source SHA-256:
`f50fd572fb7a3ed9a275b67bc655f9553ca6b9c0248e2b9b4fe575e21067379a`.
The reviewer reread the full file and checked the six localized metadata,
citation, definition, and inline-derivation edits. F1--F4 were resolved;
all original bounds, quantifiers, arguments and search use were unchanged.
Renewed outcome: **accepted** for `#claim-connectivity-03` at this hash.

## Dependencies and limits

Claims01/02 supply the component shapes and census slices. The recorded
index was checked at
`e00118c9890d529f755591b6f8daa823edb2cf3d344f49338155573e4034cf23`.
External Ramsey values, the (4,4) slices50..55/60/68, E(4,5,17)=79,
E(4,5,14)=60 and the degree interval18..24 remain unrecertified premises.
The located-filter survey is not an exhaustive inventory theorem. This
review supplies no novelty assessment, formal certificate, realizability,
branch closure or x-exclusion; accepted use is scoped propagation only.
