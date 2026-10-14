# Independent review of four-transversal compatibility at the equality frontier

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
`r2_low_s` author and the coordinator who supplied the diamond argument.

Claim(s): `low_excess_columns.md#claim-r2-low-excess-01` through
`#claim-r2-low-excess-04`.

Reviewed revision: exact uncommitted proof SHA-256
`116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`.
The review accepts the text at that hash, including the arbitrary-transversal
scope of Claim04 and its s=5 closure. A later proof change requires renewed
review. Metadata-only integration does not replace this exact provenance.

Dependencies reviewed: earlier pairwise small-column note SHA-256
`3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85`,
and four-transversal proof
`4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`.
The equality identities and anchor proof are rederived in the reviewed text.
The published maxima85 for (4,5,18),79 for (4,5,17), and50 for
(4,4,14), and the minimum50 for (4,4,15), remain external premises.
The reviewer did not obtain or re-certify their catalogues.

Checks and findings:

- The ambient graphs are used correctly. A may have I4, while an
  I4-transversal T makes A-T both K4-free and I4-free. The independent-four
  anchor uses actual B singleton signatures and B's valid I4 prohibition.
- Claim01 applies to arbitrary four-set transversals. The proof never
  requires a B vertex having T as its column. Each attachment set has size
  at most8 by R(3,4)=9. The vertex lower bound follows from both possible
  induced types of T-{a}, with the triangle's total attachment bound23.
  The degree-sum lower bound is85-50+3=38. For a diamond, the common
  neighborhood of the shared edge is independent and anticomplete to the
  two nonadjacent tips, so its order is at most2. The triangle attachment
  bound22 then gives total attachment at most30 and degree-sum at most40.
- Claim02 retains the full anchor assumptions. Three selected vertices in
  the disjoint T union would have degree sum at least27 and the fourth at
  least6, exceeding32. Thus each I4 has exactly one T vertex from each
  transversal and a U pair of total degree at most14. Its low-degree
  hitting set has size at least5. At size5 the four-subset avoidance choices
  force five degrees6, leaving a 13-vertex (4,4)-free graph with at least55
  edges but at most52. At size6 the U total90..94 forces all other U
  degrees at least9; four-subset avoidance then forces every low pair to
  be nonadjacent. Seven or more low vertices violate the U total directly.
- Claim03 counts distinct B vertices in the common neighborhood of the
  size-four edge. Each overlap vertex has degree11 and six cross neighbors;
  after the two small endpoints and the unique large column, its other
  three neighbors form an independent triple of small columns. At most
  one belongs to L5. Distinct overlap vertices are adjacent in A by
  universality inside T_i, so their triples cannot share a small B vertex.
  Two triples would require at least four of the at most8-s<=3 common
  neighbors outside L5. This argument neither equates different columns
  nor transfers an I4 prohibition to A.
- Claim04's arbitrary-transversal scope is valid: the singleton-overlap
  proof uses no B endpoint for either T_i. The exact U total is101..105.
  For the low-degree transversal L, size5 gives the same six-degree
  deletion contradiction; size at least8 gives U sum at most95. At size7
  the total upper bound101 forces all low degrees7, all high degrees13,
  and both T sums40; an anchor avoiding the overlap must select
  degree9 in each T. At most two such vertices in T_1-{a} together with a
  form a hitting set of size at most3, contradicting the four-transversal
  theorem.
- In Claim04's size6 case, writing p for the number of low degree6
  vertices and D for the total deficits of the five high vertices from13
  gives U total107-p-D and p+D<=6. Every possible I4 with a high U
  vertex is covered. An overlap-avoiding U pair must have degrees6,8.
  An overlap-containing U triple with a high vertex must have either a
  degree8 vertex and at least one degree6 low vertex, or degrees6,6,9.
  Two high vertices require at least6+8+8=22, and a degree10 high vertex
  requires at least6+6+10=22. Thus the only numerical exceptions are
  (p,D)=(1,5) or(2,4), both forcing U total101 and both T sums40.
- The additional degree9 uniqueness at that equality was independently
  checked for all possible T graphs with a universal overlap vertex.
  Internal edge count3 cannot give sum40 with attachment at most32;
  count4 forces a triangle attachment sum24, exceeding23. Count5 is a
  diamond with total attachment30. A degree pattern9,9,11 on the other
  three vertices forces both shared-edge attachments8 and each tip
  attachment7, violating the diamond triangle bound22. The only pattern
  is9,10,10, giving exactly one degree9 vertex b in T_1-{a}.
- In those exceptional high-U cases the hitting set {a} union X union {b}
  is complete: an I4 avoiding a and all degree6 low vertices must use a
  degree7 U pair, so it selects b. Its size is3 or4. Size3 violates the
  four-transversal theorem; size4 includes degree6 vertices, violating
  Claim01. After all high-U witnesses are excluded, avoiding each
  four-subset L-{u,w} forces an I4 using that exact low pair and avoiding
  a. Every pair is nonadjacent, giving I6. This checks quantifiers and
  the two witness regimes separately.
- The interface coverage is explicit. At s=4 the excess budget gives no
  large column and the earlier overlap resource forces disjointness.
  At s=5 the budget gives a sole size7 column; Claims02--03 force a
  singleton degree11 overlap and Claim04 excludes it. Sole size8 or9
  alternatives at s=6 or7 are likewise excluded. The remaining partitions
  at s=6,7 are not silently excluded by these four claims.

Outcome: accepted on the recorded numerical premises. Permitted search use:
propagate arbitrary four-transversal degree and degree-sum bounds; prohibit
disjoint transversals and singleton degree11 intersections under the full
equality-frontier assumptions; terminate r=2/s=4 and r=2/s=5, and the
sole-large-column alternatives at s=6,7, with the stated coverage arguments.

Limits: independent mathematical review is not a formal certificate or a
complete order-43 exhaustion. External census data were not recertified,
and novelty was not reviewed. No enumeration or solver was used. Later
claims using these results still require their own applicability audit.
