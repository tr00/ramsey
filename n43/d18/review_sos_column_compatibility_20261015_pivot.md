# Independent review of dispersed triple-witness positivity

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.

Claim(s): all four claims in
[sos_column_compatibility.md](sos_column_compatibility.md):
`claim-sos-columns-weighted-goodman`, `claim-sos-columns-integer-goodman`,
`claim-sos-columns-profile-coverage`, and
`claim-sos-columns-anchor-first-moment`.

Author and reviewer: author `sos_columns`; independent reviewer `sos_pivot`.
The reviewer did not author or edit the proof source.

Reviewed revision: base HEAD
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`; exact uncommitted source
SHA-256 `cf63a76237207e9d7b3242b61744476a053cf087bc6e64d27d57c2cb9d266646`.

Dependencies reviewed: actual column definitions and local Ramsey tests
were rederived directly. The reviewer read the relevant exact anchor and
small-column profile conclusions at these hashes:

```text
2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e n43/d18/x136/five_column_compatibility.md
f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733 n43/d18/x136/small_columns.md
e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e docs/mathematical_baseline.md
e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07 n43/d18/weighted_averaging.md
719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3 n43/d18/anchored_cell_averaging.md
7538fb1429225c180e6aa7febc39d75f14ff7bf8a79019c0ef4a01d108aafb92 n43/d18/overlapping_cells.md
```

The external Ramsey number and retained frontier census premises remain
external; this review does not replay their computational certificates.

Checks: ambient graph types, actual versus speculative witnesses,
weighted triple multiplicities, polynomial expansion, rational-square
coefficients, integer-degree rounding, handshake parity, all feasible
column sizes, degree-sum variance, equality-frontier applicability,
Gram eigenvalues, and precise conditional search use.

## Independent checks

All claims accepted. The reviewer retained both Goodman triangle counts,
weighted degree-square terms and integer-distance corrections. Actual
triple witnesses may vary across columns; no common witness is assumed.
The resulting open-triple lower bound is `440+sum_y tau_y(tau_y+1)/2`, with
`tau_y=max(0,6-|C_y|,|C_y|-13)`; the x136 specialization is `440+s`.

The affine/degree bounds and all numeric examples were recomputed. Sound
intervals and permanently witnessed obligations are required for propagation;
fractional positivity is not a Boolean SOS exhaustion or a column-family
existence certificate. A/B ambient types were checked separately.

## Outcome and limits

Outcome: **accepted** for all four claims at the exact reviewed hash.
Permitted use: conditional propagation of weighted/integer/open-triple
coverage constraints, whole-interface degree penalties, and opposite
anchor-pair balance. A rational violation rejects a specified actual
or permanently justified partial predicate. Witness validity and
degree intervals must be independently available for that predicate.

No branch is closed by this review. It does not establish a uniform
violation, a construction, an order-43 nonexistence certificate,
an unconditional transversal theorem, or novelty. The first Gram
limitation is not an SOS hierarchy lower bound. The exact source's
author-stage labels can be retained with an integration banner linking
this review. No solver, graph enumeration, download, installation,
staging, or commit was used in the review.
