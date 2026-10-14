# Independent review of low-excess r=2 compatibility

Date: 2026-10-14. Reviewer: `r2_triples` agent, distinct from the
`r2_low_s` author and the coordinator who supplied the diamond observation.

Claim(s): [Claims 01--03](low_excess_columns.md) with stable anchors
`claim-r2-low-excess-01`, `claim-r2-low-excess-02`, and
`claim-r2-low-excess-03`.

Reviewed revision: exact uncommitted proof SHA-256
`f6a4261cf1a4fd1c10a0a7703cb81c93f1208f64877a34ab481760aefcbe9f14`.
The review concerns the mathematical text at that hash; later metadata-only
integration does not replace this provenance.

Dependencies reviewed: frontier note SHA-256
`0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`;
small-column note `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733`;
earlier pairwise note
`3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85`;
four-transversal note
`4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`.
Published extrema remain recorded external premises: maxima 85 for
(4,5,18), 79 for (4,5,17), and 50 for (4,4,14), together with the minimum
50 for (4,4,15). No catalogue completeness assertion was recertified.

Checks and findings:

- Ambient types are retained: A is K4/I5-free and can contain I4;
  deleting an I4-transversal makes the remainder K4/I4-free. The only
  I4-free assertion about all of B is the valid antineighborhood property.
- The arbitrary-transversal quantifier in Claim 01 is valid. Its proof uses
  only the property that A-T has no I4, rather than any B endpoint for T.
  The sum lower bound is 85-50+3=38. For a diamond, a common neighbor of
  the shared-edge endpoints is anticomplete to both tips; three independent
  such neighbors with the nonadjacent tips give I5. Thus its common
  neighborhood has size at most two and the attachment sum is at most 30,
  giving the claimed upper sum 40. This also proves each vertex degree is
  9..11 without using the surviving-family classification.
- In Claim 02, each I4 uses exactly one vertex of each disjoint T_i:
  three vertices in their union give the degree-sum obstruction 33>32.
  The two U degrees sum to at most 14. The set L of U vertices of degree
  at most seven therefore meets every I4. A four-subset of L cannot be a
  transversal by Claim 01, so the avoidance choices in both the ell=5 and
  ell=6 arguments have the stated universal coverage. At ell=5 these choices
  force all five degrees to be six; the 13-vertex I4-free remainder has
  maximum degree eight and hence at most 52 edges, against at least 55.
- Independently recomputing degree sums gives sum_U in 90..94. At least
  seven low vertices permit at most 88; six low vertices and a degree-eight
  high vertex permit at most 89. Thus ell=6 and every high vertex has
  degree at least nine. Each I4 then uses two low vertices. Avoiding
  L-{a,b} forces every pair a,b in L to be nonadjacent, giving I6.
- Claim 03 correctly counts B neighbors rather than only A column sets.
  An overlap vertex of degree eleven has three neighbors beyond q1,q2,W.
  Their columns have size at most six, so all three belong to the common
  B neighborhood of q1,q2; they are independent and at most one belongs
  to L5. Two overlap vertices are adjacent by the degree-eleven universal
  property, so their triples cannot share a small-column B neighbor.
  They require four vertices outside L5 in that common neighborhood,
  exceeding its capacity 8-s<=3.
- The s=4 closure includes its coverage step H=0, which forces the two
  actual four-columns to be disjoint by the accepted resource bound.
  The proof does not claim exclusion of s=5,6,7.

Outcome: accepted on the stated premises. Search use: propagate the
arbitrary four-transversal degree and degree-sum bounds, prohibit disjoint
four-transversal pairs under the full equality-frontier assumptions, and
terminate r=2/s=4 using the overlap-resource coverage step. Claim 03 permits
its sole-large-column overlap filter.

Limits: this is independent mathematical review, not a formal certificate.
The published numerical premises were not independently recertified and
novelty was not checked. No graph enumeration or solver was used.

## Renewal for the general singleton-overlap theorem

Reviewed revision: full note SHA-256
`116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`.
This revision retains the proofs of Claims01--03 and adds generalized
`claim-r2-low-excess-04`. The reviewer independently checked the entire
new argument and its interface corollaries. Dependencies and their limits
remain those recorded above.

Checks and findings for Claim04:

- Its general statement is justified: after assuming a singleton overlap
  of A degree eleven, the main contradiction does not use the number of
  L5 columns or any adjacency structure in B. A is still permitted I4s.
- Universality of the overlap inside each T_i makes every I4 containing
  it use three U vertices; every I4 avoiding it uses one vertex in each
  T_i-{a} and two in U. Their U degree bounds are respectively21 and14.
  Summing the two transversal degree bounds and restoring the overlap
  gives the checked interval101..105 for the eleven U degrees.
- The low set L of U degrees at most seven meets every I4. Five vertices
  in L again force five degree-six vertices by avoidance of each four-
  subset, contradicting the at-most52/at-least55 edge bounds on A-L.
  Eight or more low vertices give total U degrees at most95. Thus ell=6,7
  covers all remaining counts.
- At ell=7, the degree-sum lower endpoint101 equals the capacity
  7*7+4*13. Both transversal degree sums are40, the low U degrees are7,
  and all other U degrees are13. An I4 avoiding a must select degree-nine
  vertices in each T_i, of which T1 has at most two; those two with a
  form a transversal of size at most three. This is a valid contradiction
  regardless of whether either exceptional I4 family is empty.
- At ell=6, independently counting baseline degrees gives107-p-D and
  p+D<=6. An I4 using U-L forces exactly (p,D)=(1,5) or (2,4): a degree-
  eight vertex requires a low degree six, and degree nine in the three-
  U case requires two low degrees six. Two high U vertices already give
  6+8+8>21. The equality therefore forces both transversal sums40.
- At this equality T1 must be a diamond. Three internal edges cannot
  reach40 with attachments at most32; four internal edges would force
  four size-eight attachments and violate the triangle sum at most23.
  The overlap is a shared-edge vertex with attachment eight. The other
  three total degrees are (9,10,10): the alternative (9,9,11) gives a
  triangle attachment sum23, exceeding the sharper diamond bound22.
  Thus the degree-nine vertex b is unique.
- The proposed hitting set {a} union X union {b} indeed covers every I4:
  avoiding a and the degree-six U vertices forces a U pair of two degree-
  seven vertices and hence forces b. Its size is three or four; in the
  four-vertex case it contains degree-six vertices and contradicts the
  arbitrary-transversal degree bound. Consequently no I4 can use U-L.
  Avoiding each four-subset L-{u,w} now forces u,w as an independent pair,
  giving the final I6 contradiction.
- The sole-large-column corollaries use Claims02--03 to produce exactly
  the prohibited singleton degree-eleven overlap, with H determining
  the size-seven/eight/nine cases. No s=6 two-size-seven closure follows
  from this theorem alone.

Outcome: accepted for Claims01--04 at the renewed exact proof hash, on the
recorded premises. Permitted additional search use: prohibit every pair
of four-set I4-transversals with singleton intersection of degree eleven
under the full equality-frontier assumptions; terminate s=5 and all
sole-large-column alternatives using the stated coverage. The original
review remains historical and this renewal supplies the new provenance.

## Renewal for the singleton-degree-ten theorem and complete r=2 coverage

Reviewed revision: full low-excess note SHA-256
`2e6f85a9ebf910adfbe1cf4fa66c8a66452de34161d9fb38b458484f3b0a7868`.
The reviewer independently checked new `claim-r2-low-excess-06` and its
entire dependency applicability. Claims01--04 retain the previously
accepted mathematical text. Claim05's additional row/interface proof
was independently checked here as well as in the separate pivot-agent
review. The parallel triple note was read at SHA-256
`885018b3583453740b5875cc360ca9d8f9e86960f41939f5568facfabf76859d`;
its independent low-excess-agent and pivot-agent reviews separately
certify the author's own contributions there.

Checks and findings:

- Claim05's no-two-degree-eleven assertion follows independently from the
  diamond attachment inequality. At s=6 the overlap has degree10 or11;
  if all11 it is at most a singleton and the earlier theorem excludes
  it. A degree-ten overlap needs exactly three small-column neighbors,
  an independent triple with at most one L5 endpoint. Six L5 endpoints
  and the common-neighborhood order bound8 force exactly two ordinary
  size-six endpoints, shared by every degree-ten overlap. A degree-eleven
  overlap would be universal and share one such endpoint, giving K5.
  Thus all overlaps are degree10 and independent, of order one or two.
- The new Claim06 uses arbitrary four-set I4-transversals, with singleton
  intersection of degree ten; it does not assume the overlap universal.
  Its I4 cases are exhaustive: avoiding a requires one vertex from each
  T_i and two U vertices; containing a permits at most one further T
  vertex, so it has either two U degrees of sum at most13 or three of
  sum at most22. The U degree total is100..104.
- The low set L meets all I4s. Avoiding each low four-subset when ell=5
  forces its remaining low vertex to have degree six in every admissible
  I4 case. In the three-U case, 6+8+8=22 is allowed and forces equality;
  the proof correctly does not reject this case. The resulting five
  degree-six vertices give the same at-most52/at-least55 remainder
  contradiction, so ell>=6.
- The hitting set {a} union X union D_i is valid without further case
  hypotheses: an I4 avoiding a and all degree-six U vertices has its
  U pair of degrees7,7 and therefore selects degree-nine vertices in
  both T_i. T_i degree sum at least38 makes |D_i|<=2. Hence p<=1 gives
  a prohibited transversal of size at most three, or of size four
  containing a degree-six vertex. Thus p>=2.
- Independently recomputing degree capacities gives ell>=7 a U total
  at most7*7+4*13-p<=99, contrary to100. At ell=6 the sum is107-p-D,
  hence p+D<=7. An I4 containing a and two high U vertices would need
  both high degrees8 and thus D>=10, impossible; when one other T
  vertex is selected its U sum13 forces both U vertices low. So every
  I4 containing a has at least two low U vertices.
- An I4 avoiding a with a high U vertex has degree pair6,8. Since p>=2,
  this forces p=2,D=5, U total100, and both T_i sums40. Two degree-nine
  vertices besides a would force the fourth degree12, violating the
  upper bound11. Thus |D_i|<=1, and the same hitting set has size at
  most four with low degree-six members, a contradiction. Every I4
  consequently uses at least two of the six L vertices. Avoiding each
  four-subset of L forces its complementary pair into an I4 and proves
  all pairs in L nonadjacent, giving I6.
- The application to r=2/s=6 retains complete overlap coverage from
  Claim05: the parallel global-codegree lemma eliminates the two-overlap
  case and leaves exactly the singleton of degree ten now prohibited.
  The original s=4..7 range is complete under the recorded small-column
  assumptions. Claims02/04 exclude s=4/5; the parallel saturated-label
  theorem excludes all s=7 configurations. Together these close r=2.

Outcome: accepted for Claims01--06 at the renewed exact hash, on the
recorded numerical premises and independently reviewed parallel lemmas.
Permitted additional search use: prohibit arbitrary singleton-degree-ten
pairs of four-set I4-transversals under the equality-frontier hypotheses;
terminate the residual s=6 child and hence all r=2 after integration of
the exact coverage chain. This is a local branch exclusion, not a proof
of nonexistence at x=136 or order43. Existing review limits remain: no
formal certificate, catalogue recertification, or novelty review.
