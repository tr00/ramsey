# Independent review of the remaining s=6 normal form

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
`r2_low_s` author and the coordinator who supplied the two-degree-eleven
observation.

Claim: `low_excess_columns.md#claim-r2-low-excess-05`.

Reviewed revision: exact uncommitted proof SHA-256
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`.
The earlier review of Claims01--04 at SHA-256
`116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`
is preserved in
[the separate review](review_low_excess_columns_20261014_pivot.md).
The current Claims01--04 mathematical text is unchanged; Claim05 is an
appended deduction. This review independently audits its use of those
accepted local statements.

Dependencies reviewed: Claims01--04 at the current file hash; the earlier
overlap resource bound in `../pairwise_small_refinements.md`, SHA-256
`3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85`;
the equality row identity; pair-union reasoning; R(3,4)=9. Numerical
census premises remain those of the earlier review, without recertification.

Checks and findings:

- The preliminary arbitrary-transversal assertion is valid. Two degree11
  vertices would each be adjacent to all other members of T. K4-freeness
  makes T a diamond with the two degree11 vertices as its shared-edge
  endpoints. They have internal degree3 and attachment size8. The tips
  have internal degree2 and attachment at least7 by the arbitrary-
  transversal degree lower bound9. Each diamond triangle would therefore
  have attachment sum at least23, exceeding Claim01's independently
  accepted bound22. No actual B column is needed for this argument.
- At s=6 the H=2 partition and the earlier sole-large exclusion force
  exactly two size7 columns. Nonempty overlap is supplied by the disjoint
  transversal exclusion. Every overlap has degree10 or11 by the resource
  bound; degree10 requires membership in both size7 columns. If all were
  degree11 there could be at most one by the preliminary assertion, and
  the singleton degree11 exclusion then contradicts nonempty overlap.
  Thus a degree10 overlap exists before the common-neighborhood saturation
  is used.
- Its cross degree is7, leaving exactly three small-column neighbors
  after q1,q2,W1,W2. Pair-union places all three in K, and a B edge
  between two of them would give K5 with a,q1,q2. At most one belongs
  to L5 since two intersecting size5 columns force an edge. The
  triangle-free, I4-free common B neighborhood K has order at most8;
  its six L5 vertices leave at most two ordinary vertices. Therefore
  the independent triple comprises one L5 vertex and exactly those two
  ordinary vertices, K has order8, and both ordinary columns have size6.
  No large-column membership in K is assumed: the saturation derives
  its exclusion.
- A hypothetical degree11 overlap b is universal inside T_1 and is
  adjacent to a. Its cross degree6, after two q endpoints and at least
  one large neighbor, leaves at least two small-column neighbors in K.
  At most one is in L5, so b shares at least one of the two ordinary
  neighbors with a. The five vertices a,b,q1,q2 and that ordinary
  neighbor form K5. This rules out every degree11 overlap.
- Repeating the saturated row count for each degree10 overlap proves
  the displayed complete row, including membership in both ordinary
  columns and exactly one size5 column. Any two adjacent overlap vertices
  with q1,q2,z1 would give K5, so the overlap is independent. A degree10
  member of any T_i has internal degree at least2, since attachment is
  at most8. Three independent overlap vertices in a four-set would each
  have internal degree at most1; this forbids overlap size at least3.
  With two overlap vertices, internal degree at least2 requires all four
  edges to the other two vertices, and their optional edge gives exactly
  C4 or a diamond with the overlap as its tips.

Outcome: accepted on the recorded premises. Permitted search use:
propagate the prohibition on two degree11 vertices in any four-set
I4-transversal, and the exact r=2/s=6 overlap, common B neighborhood,
row-membership and internal T-type normal form in Claim05.

Limits: this is a necessary normal form; it supplies no s=6 contradiction
or exhaustive certificate. The singleton overlap of degree10 remains
covered, and no uniqueness of y_a across different overlap vertices is
assumed. External census premises were not recertified and novelty was
not checked. No solver, graph enumeration, download, or installation was
performed. A mathematical change requires renewed exact-revision review.
