# Independent review of the degree-ten singleton contradiction

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
`r2_low_s` author. The reviewer did not contribute to this proof before
receiving its final draft.

Claim: `low_excess_columns.md#claim-r2-low-excess-06`.

Reviewed revision: exact uncommitted proof SHA-256
`2e6f85a9ebf910adfbe1cf4fa66c8a66452de34161d9fb38b458484f3b0a7868`.
Claims01--05 retain their previous mathematical text. Their separate
exact-revision reviews remain preserved; this is a new Claim06 audit.

Dependencies reviewed: arbitrary-transversal Claim01 and its direct
diamond argument, independently reviewed at the earlier exact proof hash
`116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`;
the equality row and anchor identities; the four-transversal proof;
6<=d_A<=13. For the r=2 closure composition, the reviewer also checks
the accepted normal form Claim05 at
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`
and the two-overlap exclusion `independent_triples.md#claim-r2-triples-06`
at `fed38dd2c1bac3d580f788d4ac842da5c5b02c4fd2cc43e46fd595fd9b7f5b5f`.
Numerical maxima85 for (4,5,18),79 for (4,5,17),50 for (4,4,14), and
minimum50 for (4,4,15) remain external census premises, not recertified.

Checks and findings:

- The arbitrary-transversal scope requires no universality of a in T_i.
  With their singleton intersection of degree10, the exact degree sum
  on the eleven-vertex outside set U is170-sum(T1)-sum(T2)+10, hence
  100..104. Every I4 avoiding a uses exactly one vertex from each
  T_i-{a} and a U pair of sum at most14. An I4 containing a uses at
  most one further T-union vertex; that case leaves a U pair of sum
  at most13, while the case with none leaves a U triple of sum at
  most22. The degree sums33 and34 exclude the remaining cases.
- The set L of U vertices of degree at most7 meets every I4. Its
  size cannot be at most4 by the four-transversal and Claim01 degree
  requirements. At size5, choosing an I4 avoiding each low four-set
  forces the omitted low vertex to have degree6 in every case: the
  overlap-avoiding U pair has the other degree at least8, the overlap-
  containing U pair cannot have such a high second vertex, and the
  U triple with two high vertices forces6+8+8=22. All five low
  degrees6 then give a (4,4)-free thirteen-vertex remainder with at
  least55 edges but at most52. Thus |L|>=6.
- For D_i, the degree9 vertices in T_i-{a}, there are at most2 since
  three would give total10+27=37 below38. The hitter {a} union X union
  D_i is valid: an I4 avoiding a and all U degree6 vertices has a
  U pair of degrees at least7 and sum at most14, hence exactly7,7,
  and selected degree9 vertices from both T_i. If p=|X| is0 its
  hitter has size at most3; if p=1 it has size at most4 and contains
  a degree6 vertex. Both contradict the accepted transversal bounds,
  so p>=2. For |L|>=7 the U total is at most7*7+4*13-p<=99,
  decreasing further as |L| increases. Hence |L|=6 exactly.
- Writing D for the five high U deficits from13 gives U total
  107-p-D>=100 and p+D<=7. An I4 containing a has at least two
  low vertices: in its two-U case a high degree plus any U degree
  is at least8+6>13; in its three-U case two highs would have to
  be8,8 with a low6, contributing deficit at least10 and violating
  p+D<=7. Three highs exceed the U sum22 directly.
- An I4 avoiding a can use a high U vertex only as a6,8 pair.
  Such a high contributes at least5 to D. Together with p>=2 this
  forces p=2,D=5 and U total100, so both transversal totals equal40.
  At that equality D_i has at most1 vertex: two degree9 vertices
  with a degree10 would require the fourth degree12, above11.
  The already proved hitter {a} union X union D_i then has size
  at most4 and includes degree6 vertices, again impossible. This
  excludes all exceptional one-low anchor cases without assuming
  any unproved relation between a and the other T vertices.
- Every I4 consequently has at least two vertices in the six-set L.
  Each four-subset L-{u,w} fails to be a transversal by Claim01
  since all its degrees are at most7. An I4 avoiding that subset
  must therefore contain the exact pair u,w. Every low pair is
  nonadjacent, giving I6 and contradicting I5-freeness. All quantified
  avoidance choices are justified by the arbitrary-transversal theorem.
- The full r=2 coverage composition is valid. The original necessary
  s range is4..7. The disjoint case excludes s4; the earlier singleton
  degree11 contradiction excludes s5; the saturated size5 membership
  argument excludes s7. At s6 the independently accepted exact normal
  form leaves overlaps of size1 or2, both degree10. The separate
  global nonedge codegree contradiction excludes size2, and this newly
  proved general theorem excludes size1. Thus the closure applies to
  every child of the r=2 equality-frontier branch on these premises.

Outcome: accepted on the recorded external premises. Permitted search use:
propagate the general prohibition on singleton degree10 intersections of
four-set I4-transversals under the full equality-frontier assumptions;
terminate s=6 and the entire r=2 child after assembling the separately
accepted s=4,5,7 and overlap coverage chain.

Limits: this is an independent mathematical branch proof with literature
census dependencies, not a formal solver certificate or an order43
decision. It does not exclude r=0 or1, any above-frontier x branch,
or degree18 as a whole. The census and small Ramsey-number certificates
were not recertified, and novelty was not checked. No graph enumeration,
solver, download, or installation was used. Changes to the mathematical
proof or its dependencies require renewed review.
