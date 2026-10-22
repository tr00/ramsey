# Independent review of a69 ambient transfer

Claim(s): [claim-a69-ambient-transfer](a69_decomposition.md#claim-a69-ambient-transfer) only.

Author and reviewer: source author Main; independent reviewer `/root/claim_review_18` (token `cr18`), 2026-10-21.

Reviewed revision: HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact working-tree source SHA-256 `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`.

Dependencies reviewed:

- Same source revision, Claims 2, 4, and 7: their core/panel parameters are used conditionally here; this review does not independently accept their full classification or coverage arguments.
- `docs/mathematical_baseline.md`, SHA-256 `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0`: global degrees 18..24, via the recorded external premise `R(4,5)=25`.
- `README.md`, SHA-256 `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0`: `R(4,4)=18`, `R(3,4)=9` and the published order-16/17 core edge counts 60/68. External results retained, not recertified.
- `docs/notation.md`, SHA-256 `92d91500274d60c69ebcf9c0033a7676ed934f87a68c0941d81f39991efe3081`, and `research/n43/reductions.md`, SHA-256 `3bd4aa599896e88436e83241216638d51848c38ad580c768ba86b0b274f59ca2`: row and column definitions. The identities and transversality used below were rederived from the ambient hypotheses rather than assumed from index status.

Checks and findings:

- Independently count `d_G(u)=1+s+|D|`. Since `D` is adjacent to `u` and anticomplete to `v`, its `K4` and `I4` respectively extend with those roots, so `D` really is `(4,4)`-free and `|D|<=17`. Hence `|D|=17-s+epsilon` and `0<=epsilon<=min(6,s)`. For the Claim 7 parameters `s<=7`, both core orders are at least ten. The four cells of the adjacent root pair have sizes `s`, `17-s`, `17-s+epsilon`, `7+s-epsilon`; their sum is 41, accounting for all nonroots.
- For `y in B-D`, an unhit independent triple in `H` extends with `u,y`; an unhit triple in `D` extends with `v,y`. Each remainder has no `K4` and no `I3`, so the order-eight bound applies with the correct ambient type. For a leaf `s=1`, this gives precisely the table's 8/8 or 8/9 attachment requirements and 8 or 7 common nonneighbors. The common neighbor `z` has a triangle-free neighborhood in `D` because a triangle there, together with the adjacent vertices `u,z`, gives `K5`; `D` also forbids `I4`, bounding this neighborhood by eight.
- For each independent `J` of size 1, 2, 3 omitted by an actual column, an independent `(4-|J|)`-set in `D_J-C_y` would extend with `J,y` to `I5`. The resulting remainder restrictions are respectively no `I3`, a clique of order at most three, and emptiness. They give (1) and (2). Conversely any unhit `I4` in `A` has a nonempty intersection with `T` because `H` has no `I4`; intersection sizes 1..3 violate one of those restrictions and size four violates the separate no-omitted-`I4` condition. Thus the claimed column-transversality equivalence is exact, with no assumption of distinct columns or compatibility between columns.
- Independently sum `|N_B(c)|=17-d_A(c)+epsilon_c` over `c in H`. Since `sum_H d_A=2a_H+e(T,H)` and `69=a_H+g+e(T,H)`, this yields both expressions in (3). For a cut-family leaf the parameters `h=16,a_H=60,g=1` give `144+E_C`; its omitted-column count is `24-(16+epsilon)=8-epsilon`, yielding at least 64 or 56 incidences. For the two-transversal family, `h=16,a_H=60` gives `143+g+E_C`. Endpoint internal degrees `p+1` and `p` respectively give omitted-column counts `8+p-epsilon` and `7+p-epsilon`; (1) gives at least `8-p` core vertices in each. All signs and constants agree.

Outcome: **accepted**, as a local ambient-transfer deduction for the stated core/panel parameters. No correction to this claim is required. Using the entire parametrization exhaustively still requires independent acceptance of its upstream ready claims; this review does not promote those claims.

Limits: External Ramsey and core-census premises are trusted as recorded. No full independent review of Claims 2, 4, or 7, catalogue recertification, novelty review, formal proof, solver, canonicalizer, download, graph search, or computation closing a branch was performed. These are necessary conditions for actual extensions, not an existence result, ambient incompatibility certificate, or closure of the 69-edge slice. After upstream review, the justified use is structural branching and attachment propagation preserving every actual completion.
