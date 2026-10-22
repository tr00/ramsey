# Independent review of closure consequence floors

Date: 2026-10-21. Reviewer: Codex subagent `/root/claim_review_09`, token
`cr09`; distinct from source author Main.

Claim: [claim-closure-consequences-floors](x136_closure_consequences.md#claim-closure-consequences-floors).
Outcome: **accepted** on the recorded degree/census premises and accepted
x136 closure. Permitted use: necessary lower-bound propagation at every
degree-18 root of an order-43 K5/I5-free graph.

Reviewed working-tree revision: HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`, with the exact source and
dependency bytes identified below. Current working-tree hashes govern this
review; historical hashes inside condensed reviews retain their original scope.

| Source or dependency read | SHA-256 |
| --- | --- |
| `x136_closure_consequences.md` | `3a7a2777728de0b10b9057f74a44ad908222c20c117d1a37ad623929fb358647` |
| `weighted_averaging.md` | `e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07` |
| `frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `../../../docs/lemma_phase_2.md` | `7fef028563fbdb974ff0f95f4737486d1846caa4741b84a6881146e1c0022213` |
| `../../../docs/theory_phase_1.md` | `d752949e05035e2efe6350bd8e701416df7784e7721c6b99ac117944ccdb62ef` |
| `review_audit_pending_averaging_20261015.md` | `21bb11ee8bd8e811388611384020f546ad83dddb757891ca176f348ded4f99b4` |
| `x136/frontier_exclusion_handoff.md` | `a199142f594183660037639eddeeeb4ebffe331afcb92e00f0fa796384e9a127` |
| `x136/review_frontier_exclusion_handoff_20261019_main.md` | `fc3583f0ef92956752e4b24a065620473cef966d56c1058ff3f0f999fdd8c9fb` |

## Decisive independent checks

Only part (a) of the preceding root-profile claim is needed here. Independently,
sum of global degrees over A equals `18+2a+x`; with
`sum_A d_G=324+E`, this gives `x=306-2a+E=136+2q+E`.
The recorded `a<=85` and global degree floor 18 give integral `q,E>=0`.
The accepted closure rules out exactly `x=136` in this rooted setting,
so `x>=137` and `2q+E>=1`. This checks the needed implication without
assuming independent acceptance of the other root-profile parts.

The weighted certificate applies to actual independent four-sets in A,
which is K4/I5-free and may contain I4. Independently rechecked singleton
classes: every B vertex meets such an I; each singleton class is a clique
of size at most three by ambient I5/K5 prohibitions. Thus `e(I,B)>=36`,
and the row identity gives `sum_I epsilon>=d_A(I)-32`. Nonnegative excess
and vertex packing capacities at most one justify weighted aggregation.
The zero weighting makes `L(A)>=0`. The finite packing region is bounded
(each anchor weight is at most one), so the maximum is attained; integral
E permits upward rounding.

Writing `c=ceil(L(A))>=0`, intersecting `x>=136+2q+c` with `x>=137`
gives exactly `x>=136+max(1,2q+c)`. Subtracting the fixed budget offset
`136+2q` gives `E>=max(c,1-2q)`. For integer `q>=1`, `1-2q<=-1`
and c dominates; for `q=0`, the improvement occurs exactly when c=0.
Since L is nonnegative, c=0 is equivalent to L=0. Thus the stated strict
improvement condition is correct as a comparison of lower-bound right-hand
sides; it does not assert existence of a graph realizing that profile.

For the two named recorded floors, degree summation gives
`306-2a=136+2q`; neither the frontier lower bound nor the corridor lower
bound conflicts with taking their conjunction with 137. The frontier
equality antecedent `x=136` forces q=E=0 before closure, and is refuted by
closure. Its conditional list is therefore historical, not a simultaneously
realizable profile from which later deductions can extract a witness.
No change to corridor upper bounds or other consumers is implied.

## Findings and limits

No mathematical correction is required. The strict-improvement statement
uses the optimized nonnegative certificate L(A); a single arbitrary negative
weight payoff would not support the same characterization, but is not what
the source claims.

This review accepts only the named floor claim. The x136 closure and its
load-bearing core/transversal results remain accepted dependencies rather
than a newly recertified full closure chain. The published census, small
Ramsey numbers, and global degree floor remain recorded premises; primary
literature and novelty were not reviewed. No solver, prover, canonicalizer,
download, nontrivial search, or formal certificate was used. No root
existence, residual branch closure, or value of R(5,5) follows.
