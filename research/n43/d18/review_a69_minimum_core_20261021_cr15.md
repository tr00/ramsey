# Independent review of the minimum-core bound

Claim: [claim-a69-minimum-core](a69_decomposition.md#claim-a69-minimum-core), and only that claim.
Author: Main. Reviewer: independent subagent `claim_review_15` (`cr15`).
Date: 2026-10-21. Outcome: **accepted**, conditional on the recorded classical Ramsey and published core-edge premises.

Reviewed revision: worktree source SHA-256
`b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`;
base Git commit `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.
The hash, rather than the base commit, identifies the reviewed source bytes.

Dependencies read and checked:

| File | SHA-256 | Relevant premise |
| --- | --- | --- |
| `README.md` | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` | `R(4,4)=18`, `R(3,4)=9`; published order-11 through order-17 edge intervals |
| `docs/mathematical_baseline.md` | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` | Forbidden-graph conventions and external-premise context |
| `research/n43/d18/x136/five_column_compatibility.md` | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` | `claim-five-columns-core-caps`, sufficient order-10 cap |

Decisive independent checks:

- `A` is `K4`-free on 18 vertices, so `R(4,4)=18` supplies an `I4` and hence `tau_4>=1`. Any `I4` disjoint from a closed neighborhood would form an `I5` with its center. Thus each closed neighborhood is a transversal, giving `t<=d_A(u)+1` for every vertex. The average degree is `138/18=23/3<8`, so some degree is at most seven and `t<=8`.
- For any chosen minimum transversal, deleting it leaves a `K4/I4`-free core. Minimum cardinality implies inclusion minimality: `T-{u}` fails to hit some `I4`, whose intersection with `T` is exactly `{u}`. Its other three vertices lie in `H-P_u`, proving the private-triple bound `|P_u|<=h-3`. Independently, `H[P_u]` has no triangle (otherwise `u` completes a `K4`) and no `I4` (it is in the core); `R(3,4)=9` yields `|P_u|<=8`. No disjointness of private triples is needed.
- Partitioning edges gives the exact attachment budget `b=69-a_H-g`. Substituting each recorded interval gives every table endpoint. For `t=1`, `g=0`, and the order-17 core has 68 edges, giving budget one. All other rows keep the explicit `g` term.
- The sufficient order-10 range follows from the independently checked cap and complementation: `e(H)<=31` and `45-e(H)<=31`, hence `14<=e(H)<=31`. For the cap proof, at order ten degrees lie in `1..8`; direct substitution in its displayed function gives `g_10(d)+6d = 30,44,56,64,70,74,74,72`. Thus `360=3*C(10,3)<=740-12e(H)`, and integrality gives `e(H)<=31`. The triangle counts and Goodman identity used there apply equally to the complementary core.
- Summing the universal degree floor on `T` gives `2g+b>=t(t-1)`, equivalent to `a_H-g<=69-t(t-1)`. Summing it on `H` gives `2a_H+b>=h(t-1)`, equivalent to `a_H-g>=h(t-1)-69`. The signs in both displayed inequalities are correct.

Findings: No gap or correction is required. The quantifier over every chosen minimum transversal is justified; the core order is at least ten, and the budget ranges are necessary restrictions only. The claim does not exclude any residual family or certify realizability.

Limits: Published order-11 through order-17 census intervals and classical Ramsey values were retained as external premises, without checking the original publication or certificates. This review does not assess other claims in the source, novelty, ambient extension, or nonexistence. No solver, prover, canonicalizer, download, or nontrivial search was used. Mathematical acceptance supports necessary propagation of these bounds; source search-use metadata remains for coordinator integration.
