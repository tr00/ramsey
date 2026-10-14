# Independent review of pivot/excess pairings

Claim(s): [Claims 01--04](pairwise_pivot_refinements.md), anchors
`claim-pivot-pairwise-01` through `claim-pivot-pairwise-04`.
Author and reviewer: pivot/excess agent; Codex coordinator, distinct agents.
Date: 2026-10-14.

Reviewed revision: base `81c768a683d3c3b3df70d4d3b7d03a67d505447b`,
exact uncommitted proof SHA-256
`612722691dca4fb0eb0cf85330a133e8cba2270bb5743cf3f083f62d8ce82bda`.
Later review metadata/formatting changes preserve this review; proof changes
need renewal. Metadata hard-break spaces were converted to blank paragraphs
for the commit; no mathematical text changed.

Dependencies reviewed: pivot_classes.md SHA-256
`43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233`,
excess_bounds.md SHA-256
`2577e6eccf38b51fbb2d691d488d747302b4445fca31dbe344b64dd30af73c97`,
cliques_augmentation.md SHA-256
`4cb5c4bd34d7d45a3c42783fdf091ac3aae0acafcc6f6fd6203f83cf9d366b2c`.
The reviewer re-derived q+E<=W/2+4, the degree/cut identities, integer
capacities, and pointed overlap bounds. Order-18/24 edge extrema and the
order-17 maximum 79 remain external census premises.

Checks and findings:

- Claim 01: for z in H, d_P(z)=19+epsilon_z-h+d_barH(z). Multiplying
  and summing counts J. Turan on H supplies a lower bound L_h on its
  missing edges; complement-Turan supplies its edge lower bound and is
  not confused with this direction. The nonedge contribution is at least
  2*eta_min*L_h. Balanced positive excesses minimize Z by convexity.
  The threshold family count follows from E<=W inside and E<=D0 outside.
  All six W=6 J lower bounds and the uniform count four were rechecked.
- Claim 02: each root's m_H neighbors have excess at least S_m. This
  supplies t(0) and t(Q+1) capacities independently for every root,
  without assuming simultaneous minimum-cost assignments. Counting the
  cut then gives the claimed family bound. At h3/W18, capacities 2 and
  1 give 66-40=26; at h5/W30, capacities 3 and 2 give 102-76=26.
  Any five roots have an edge by alpha(G)<=4; both endpoints are dense.
- Claim 03: writing h=2a,W=6h-4 gives E>=6m_H-4 and E<=3h+2.
  Hence m_H<=a+1, and m_H=a+1 forces E=3h+2 and q=0. Cut surplus
  C_lo-p*a is 1,2,3 at the stated rows, yielding those exact-profile
  counts. Omitted H excess is 6(a-1), forcing each omitted vertex to
  have excess six. Internal degree sum 170 minus at least 6m_H for H
  neighbors leaves pointed overlap caps 9,10,10. The companion root is
  degree eighteen but is not asserted to have the first root's deficit.
- Claim 04: summing q+E<=B0 gives p*q_*+J<=p*B0 for the minimum-q
  root, and its own E<=B0-q_* gives x<=136+B0+q_*. Thus the average
  and degree inequality apply at the same maximum-edge root. Independent
  exact rational arithmetic on every h satisfying h<=W<=6h for even
  W=0..10 reproduced q caps 4,4,4,4,5,5, x caps 144,145,146,147,149,150,
  and pointed overlap caps 9,9,10,11,12,12. This was bounded arithmetic,
  not graph enumeration. The root-choice coverage retains all maximizers.

Outcome: accepted for all four claims, conditional on stated premises.
Search use: numerical propagation and conditional pointed/family branching;
no whole order-43 or degree-18 branch is terminated. Dense-family and small
overlap guarantees cannot be imposed on the same edge without further proof.

Limits: no catalogue download/replay, theorem prover, graph enumeration,
novelty review, or formal exhaustion certificate. No unrestricted upper bound
on h or W is established. Maximum-edge root selection is a separate coverage
scheme and cannot constrain an arbitrary previously chosen root.
