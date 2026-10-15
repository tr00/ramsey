# Independent audit: exact complementary moments and the q=1 anchor strip

Claim(s): `sos_finite_moments.md#claim-finite-triangle-deficits`,
`#claim-finite-core-caps`, `#claim-finite-low-transversal-thresholds`,
and `#claim-finite-q1-anchor`.

Author and reviewer: `/root/sos_finite`; independent reviewer
`/root/sos_columns` (distinct agents).

Reviewed revision: base HEAD `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`,
exact uncommitted source SHA-256
`87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`.

Dependencies reviewed: the stated derivations and relevant existing
`x136/five_column_compatibility.md` core-cap tables; the proof (rather
than only declared actual-column scope) of
`four_column_stability.md#claim-four-column-stability-01`; the signature
anchor cap; and the q<=2 four-transversal argument in `frontier_band.md`.
Published small Ramsey/census premises remain assumed, not recertified.

Checks: all ambient graph types, complement symmetry, degree support,
integer residues, order13 coverage, codegree endpoint correction, Turan
equality cases, anchor disjointness, q/E quantifiers and future use limits.

Findings:

- For (4,4)-free H both original and complementary neighborhoods are
  triangle-free and I4-free. Their maximum degrees are at most three
  because four neighbors would form an independent four-set. The f
  bound applies independently to both. Degree range includes the clipped
  0 and m-1 endpoints correctly.
- The two neighborhood slack sums equal the two separate modulo-three
  residues, and summing the exact Goodman identity yields precisely the
  affine deficit decomposition. Independent exact Fraction substitution
  verified r=(34,22,11,5,0,0,1) at m11 and r=(18,9,1,0,0) at m13,
  with initial caps37 and floor(442/9)=49. This was bounded formula
  arithmetic on the stated degree values, not degree-profile or graph search.
- At m11,e37 zero deficit forces three degree6 and eight degree7
  vertices. Their neighborhood sums107,28 imply at most35 triangles
  and9 independent triples, but Goodman gives45 total. Thus e<=36.
- At m13,e49, nonnegative deficit one excludes degrees4,5 and permits
  at most one degree6. The degree sum98 forces precisely the two
  stated profiles: degree6 present implies eight degree8, four degree7;
  otherwise seven degree8, six degree7. The former has zero remaining
  neighborhood slack and triangle bound sum145, impossible modulo3.
- In the latter profile, sums144,64 and combined defect one force
  original slack zero. Every order8 triangle-free neighborhood of12
  edges with maximum degree3 is 3-regular. Every original H edge incident
  with a degree8 vertex consequently has exactly3 common H neighbors.
- For adjacent H vertices u,w the common complement-neighbor count is
  m-d_H(u)-d_H(w)+c_H(u,w), with the two endpoints removed correctly.
  Two original degree8 vertices adjacent in H therefore have zero common
  complement neighbors. Any two L vertices in a complementary N(z)
  must be adjacent in the complement, so N(z) intersect L is a clique
  of order<=2, since it joins z in a K4-free graph. L's seven vertices
  each require at least two K-neighbors; K's six vertices each see at
  most two L vertices. The cut14<=e_J(L,K)<=12 is impossible.
- Deletion uses the original A degree sum and returns
  e(H)>=85-q-7ell+b4(ell). Independent arithmetic recomputed q lower
  thresholds3,2,3,2,1,2,2 for ell5..11. At q1,ell9 all three
  inequalities are equality, forcing H=K(3,3,3), every L degree7,
  and A[L]=K3 plus three disjoint K2 by both Turan equality cases.
- Each vertex of the L triangle has five H neighbors distributed3+2
  on exactly two H parts. Two adjacent triangle vertices omitting the
  same part have at least four common H neighbors and an H edge there,
  giving K4. Their omitted parts must differ. The three I4s built by
  adjoining each triangle vertex to its omitted part are therefore disjoint.
  H degree sum is54+51=105, the triangle contributes21, and the
  actual-column caps bound126 by96+E_A. Thus E_A>=30.
- For q1 the full A degree sum168 gives at most eleven vertices of
  degree<=7. Cardinalities<=3 are excluded by the q<=2 transversal
  theorem. At cardinality4 the abstract transversal degree floor8 follows
  directly from the existing proof: A-T is (4,4)-free and every bound
  therein uses only T, its remainder and A's K4/I5 properties. Actual
  column occurrence is unnecessary for this particular lower floor.
- The deletion thresholds and exceptional E>=30 exclude all remaining
  transversal sizes when E_A<=29. Some I4 avoids the degree<=7 set.
  Exact row sums and the singleton defect then give
  sum_I(d_A-8)+eta_I=E_I. Both left terms are nonnegative, and E_A=0
  gives the claimed degree8/signature saturation. Size4 columns are
  correctly left live because their q1 degree floor8 can meet this anchor.

Outcome: **accepted** for all four claims at the exact stated hash.

Permitted use: core-cap and deficit propagation on specified actual cores;
transversal threshold propagation; conditional q1,ell9,E_A<=29 rejection;
unavoidable-anchor branching in the fixed-q1,E_A<=29 slice, retaining all
anchor choices and completions with full coverage.

Limits: no recertification of cited Ramsey/census premises, novelty review,
pure unconstrained SOS claim, formal checker, global x upper bound, pivot
selection theorem, or branch closure. The source correctly makes degree
integrality and neighborhood inequalities explicit. Independent acceptance
does not supply a certified order-43 exhaustion. Proof changes require
renewed review.
