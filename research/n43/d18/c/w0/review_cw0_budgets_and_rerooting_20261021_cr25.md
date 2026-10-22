# Independent review: zero-excess budgets and rerooting

Claim: [research.json](research.json), `claim-cw0-budgets-and-rerooting` only.  
Author: Main (source attribution); reviewer: independent subagent `/root/claim_review_25`, token cr25.  
Outcome: **accepted**, retaining the source's explicit conditional C136 premise and published numerical premises. No other claim in the source is reviewed here.

Reviewed revision: checkout HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`, exact uncommitted source SHA-256 `88c31770ed2011a82248902ad14f7572bfaaf4b08202fa58c97ed3b89c5661a1`.

Dependencies read, with exact current SHA-256:

| Dependency | SHA-256 |
| --- | --- |
| `research/n43/d18/frontier_band.md`, Exact budgets | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `research/n43/d18/pivot_classes.md`, §1 | `ab0849cf011c8b830eb5ded2a67d9439776caf7535c19bcf6ef79280cd61081c` |
| `docs/theory_phase_1.md`, universal degrees and census corridor | `d752949e05035e2efe6350bd8e701416df7784e7721c6b99ac117944ccdb62ef` |
| `research/n43/d18/x136/README.md`, C136 provenance context | `57173e0806e28b4b7b95fda085273afbf3103bdd6140705b1022e9fabe26624d` |

Decisive independent checks:

- Ambient types are correct: A is K4/I5-free and may contain I4; B is K5/I4-free. The literature premise R(4,5)=25 bounds every global degree by 18..24: 25 neighbors would contain K4 or I5; 25 nonneighbors would contain K5 or I4, the latter adjoining the root. Therefore excess is nonnegative, and zero A excess means each A vertex has degree exactly 18.
- Summing degrees on A gives `18*18=18+2a+x`, so `x=306-2a=136+2q`. Independently summing all degrees gives `e(G)=387+W/2`; the partition into pivot edges, A edges, cross edges and B edges gives `e(G)=239+q+b`, hence `b=148-q+W/2`. The census bounds on A yield q=0..35, and those on B yield exactly `max(0,2q-8)<=W<=2q+24`. Thus W<=94 and the 19 distinct vertices in {v} union A have degree 18.
- A trivial Python arithmetic check evaluated all q=0..35 and even W=0..144, verifying equivalence between the B edge interval and the displayed W interval, the W cap, the conditional even x range, and the W=0 restriction q=0..4. These are scalar checks, with no realizability assertion.
- For each u in A, excess-bearing neighbors can only be in B, so `E_u=sum_(y in R_u) epsilon_y`. An independent four I exists by R(4,4)=18 and K4-freeness of A. Every y in B has a neighbor in I, since otherwise I union {y} is I5. Reversing the finite weighted incidence sum therefore gives `sum_(u in I) E_u=sum_(y in B) epsilon_y*|N_A(y) intersect I|>=W`. If all E_u vanish, this forces W=0; conversely W=0 forces every excess and every E_u to vanish. No re-rooted neighborhood is incorrectly assigned zero excess.
- Under C136 only, q=0 is deleted because x=136 is equivalent to q=0 in this scope. This yields q=1..35 and x=138,140,...,206; at W=0 it yields q=1..4 and x=138,140,142,144. Connectedness is unnecessary for these conclusions, so the stated connected scope is valid.

Limits and provenance: the exact source records C136 as “the user's reported closure of the whole x=136 case,” accepted as supplied with proof pending checkout integration. Current navigation instead describes an integrated independently reviewed closure. This review does not resolve or independently certify that closure chain and does not upgrade the source's conditional assertions to unconditional ones. R(4,4)=18, R(4,5)=25 and the published edge extrema (50..85 for order-18 K4/I5-free graphs; 116..132 for order-24 K4/I5-free graphs, complemented to 144..160 for B) remain literature premises rather than freshly verified census certificates. No solver, prover, canonicalizer, graph search, download, novelty review or branch exclusion was performed. The source's `none pending independent review` search-use field was not edited; any promotion is for the coordinator.
