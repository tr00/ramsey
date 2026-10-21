# Independent review: zero-excess anchor defect transport

Claim: `n43/d18/c/w0/research.json#claim-cw0-anchor-defect-transport` only.  
Author: Main. Reviewer: independent subagent `/root/claim_review_26` (cr26).  
Date: 2026-10-21. Task kind: research proof review.  
Reviewed revision: repository HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256 `88c31770ed2011a82248902ad14f7572bfaaf4b08202fa58c97ed3b89c5661a1`.

Dependencies reviewed: this claim is self-contained under the source's stated simple order-43 K5/I5-free graph, degree-18 pivot, independent four-set I in its order-18 neighborhood A, and global degree 18 at each member of I. No external numerical census, existence theorem for I, earlier local claim, or closure premise is needed. The full zero-excess and connectedness hypotheses are stronger than the hypotheses used here. Policy versions read: `.agents/AGENTS.md` SHA-256 `e5990b6ed2f9801ef2c333665714bf63cb8604887e24f6c1aeb2f68e7db62958`; `docs/workflow.md` SHA-256 `68cb023b675e7b00469b89bf23dc2c7919c2d4eb4ea9fd656b4a5e083b034c0a`; `docs/reproducibility.md` SHA-256 `d01b48ce5138ec6e9c44e60860c5559356ec237a79e2d2024df8397c2b6ea6fc`.

Decisive independent checks:

- An empty I signature outside I would extend I to an independent five-set. For each exact singleton type i, two nonadjacent vertices of that type together with I minus i give an independent five-set. Thus the *global* singleton class is a clique. Four vertices in that class together with i give K5, so its cap is 3. The pivot has all-four signature and contributes to no singleton count. Consequently a1+b1<=12, with no accidental exclusion of singleton vertices lying in A.
- Each root i has one pivot neighbor, d_A(i) neighbors in A-I, and all remaining neighbors in B. Its B row therefore has size 17-d_A(i). Summing yields e(I,B)=68-s=36+eta. Subtracting twice the B cardinality 24 from this incidence count gives -b1+b3+2b4=eta-12. Since b1<=12, eta>=0; combining this equality with the global singleton cap yields a1+b3+2b4<=eta.
- A-I has cardinality 14. Its incidence sum is s, because I is independent. Subtracting twice 14 yields -a1+a3+2a4=s-28=4-eta, establishing the exact second identity. This calculation allows independent four-sets inside A-I and assumes no I4 prohibition on A.
- When eta=0, nonnegativity forces a1=b3=b4=0, then b1=12. Each of the four B singleton classes must attain its individual cap 3, and its clique property makes it a triangle. With all four internal degrees equal to 8, eta=0 follows directly, each B row has size 9, and its 3 singleton neighbors leave precisely 6 double-signature vertices incident to that root.

Findings: all stated conclusions follow for every independent four-set I in the given scope. The singleton cap applies globally before being split between A and B; that distinction is correctly preserved in the defect inequality. No correction is required.

Outcome: **accepted** for this exact claim and source revision. This review records acceptance independently; it does not edit source review-state metadata or authorize other claims in the file.

Limits: no graph realization, branch exclusion, formal proof, novelty audit, or solver/search computation was performed. The source ledger's C136 premise is exactly the user's reported closure of the whole x=136 case, described there as accepted as supplied with its proof pending checkout integration. This claim does not invoke C136 and its acceptance is unconditional on that reported closure. Other claims, current closure integration, and contextual numerical premises are outside this review. The recorded search use remains `none pending independent review` in the unchanged source; any later propagation use must retain the stated hypotheses.
