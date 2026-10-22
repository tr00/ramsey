# Independent review of the q=1 actual-column augmentation bridge

Date: 2026-10-14.

Claim(s): `research/n43/d18/pairwise_refinements.md#claim-pairwise-safe-columns`.

Author and reviewer: Codex coordinator; small-column agent (distinct agent).

Reviewed revision: base `81c768a683d3c3b3df70d4d3b7d03a67d505447b`,
exact uncommitted file SHA-256
`095c4ed0c1d8a6abcc50705a133ae03008b5e10993709c97ee8f66a2b6f2dacb`.

Dependencies reviewed:

- `cliques_augmentation.md`, SHA-256
  `4cb5c4bd34d7d45a3c42783fdf091ac3aae0acafcc6f6fd6203f83cf9d366b2c`:
  Section 2's q=1 bound of at most three safe missing edges. The review
  rechecked both disjoint and incident pairs of safe additions and the
  resulting star-component argument.
- `x136/transversal_five_attempt.md`, SHA-256
  `2073f1bb0c9390795c352a226f9760ccad6767f709fddf8cc139a769f8727e4c`:
  only the recorded external upper edge extremum 50 for a 14-vertex
  (4,4)-free graph is used. The full surviving-family classification is
  not a dependency. The published census has not been independently
  reconstructed or its source freshly acquired for this review.
- R(3,4)=9 and the ambient Ramsey restrictions; all attachment and
  deletion arguments were rederived below.

Checks: hypotheses, universal quantification over safe nonedges and actual
columns, ambient graph types, addition monotonicity, degree sums,
inclusion-exclusion, endpoint assertions, and conditional generation scope.

Findings:

1. At q=1 the internal graph A has 84 edges and is (4,5)-free. A safe
   addition gives an 85-edge (4,5)-free graph A': safety excludes K4 and
   edge addition cannot create I5. Every independent four-set of A' was
   already independent in A. An actual T=N_A(y) meets every I4 of A
   because otherwise that set with y would be I5 in G; hence T remains
   a transversal in A'. It is not necessary that the modified full
   graph G with the added edge remain K5-free. The proof only uses the
   augmented internal graph A' and the inherited transversal property.
2. K=A'-T has 14 vertices, no K4, and no I4. The latter follows precisely
   from the retained transversal property, rather than from the general
   (4,5)-free ambient type of A'. The bound e(K)<=50 is therefore applied
   with the correct type.
3. For t in T the attachment set S_t is triangle-free, because a triangle
   with t would give K4, and has no I4 because it is a subset of K.
   Thus |S_t|<=8. If the other three vertices of T form a triangle, each
   pairwise attachment intersection is independent of size at most three
   and the triple intersection is empty. The total of the three attachment
   sizes is at most 14+9=23. Both deletion cases therefore give
   e(A'-a)<=76 and d_A'(a)>=9.
4. A D8 vertex has original degree eight. If a safe edge omitted that
   vertex, its degree in A' would remain eight, contradicting item 3
   applied to an actual T containing it. Hence each safe edge must include
   every D8 vertex. An edge has only two endpoints, proving saturation
   when |D8|>=3 and uniqueness of the candidate when |D8|=2. When |D8|=1,
   all candidates are incident there; the separate at-most-three theorem
   applies without an augmentation-existence assumption.
5. If a safe edge is wholly outside T, the core A'-T has one more edge
   than A-T and remains (4,4)-free. The inequality e(A-T)+1<=50 proves
   the third conclusion. This also verifies its stated contrapositive.
6. For completeness, the safe-edge bound used in item 4 was rechecked.
   Any two individually safe additions must jointly create K4, since
   otherwise a (4,5)-free graph with 86 edges results. If the additions
   are disjoint, all four cross edges among their endpoints must already
   be present; if incident, their other endpoints must be adjacent.
   The graph of safe additions has neither a triangle nor a three-edge
   path on four distinct vertices, and thus has star components. The
   leaves within a component and appropriately chosen endpoints across
   components form a clique in A whose size is the number of safe edges.
   Since A has no K4, there are at most three.

Outcome: accepted for the exact claim at the reviewed SHA-256, conditional
on the recorded published edge extrema.

Limits: The claim neither ensures that a safe edge exists nor asserts that
the full interface extends after adding one. It is valid for every E with
q=1, and does not transfer x=136 or degree-18 equality assumptions to that
branch. No certified search, catalogue completeness replay, theorem-prover
check, or novelty review was performed. Changes to the mathematical proof
or external premises require renewed review.
