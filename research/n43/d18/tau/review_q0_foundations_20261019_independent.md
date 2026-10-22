# Independent review: q0 foundations (Sections 1-4)

Date: 2026-10-19. Reviewer: independent (third identity; distinct from
authors TauQ0Closure and Main).

```text
Claim(s): research/n43/d18/tau/q0_effective_reduction.md#claim-q0-tight-defects (Section 1, lines 82-137),
          research/n43/d18/tau/q0_effective_reduction.md#claim-q0-low-not-transversal (Section 2, lines 139-248),
          research/n43/d18/tau/q0_effective_reduction.md#claim-q0-no-three-anchors (Section 3, lines 250-299),
          research/n43/d18/tau/q0_effective_reduction.md#claim-q0-low-count (Section 4, lines 301-357)
Author and reviewer: authors TauQ0Closure and Main; reviewer independent (third identity)
Reviewed revision: base commit 1581b3ae1b0e5ca5b65a6177fd8d04678ef96782;
  SHA-256 of reviewed file 491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8
  (research/n43/d18/tau/q0_effective_reduction.md, 661 lines);
  SHA-256 of exact scope lines 82-358 (sed range, verbatim) f198e920d982d10e6965251b86ef623efcba2b46fd91592eb0d3d34c4e2abda4.
  Mid-review the coordinator replaced hash 0117ceb620f8d27b501cf3fd3a42c2daac7a5fb1d5d1ab1a4ba5c51915b4d433
  with the hash above, reporting a change only in Section 7 (out of this
  review's scope, owned by another reviewer). I re-read lines 82-358
  verbatim on the new hash; the scope text is identical to the text I
  audited. This review attests the new hash.
Dependencies reviewed: the seven source SHA-256 values recorded in the note's
  source table were recomputed and all match (docs/workflow.md 51220632...,
  README.md a31dbbee..., research/n43/d18/frontier_band.md c13e57b0...,
  research/n43/d18/four_column_stability.md 71fa0ce8..., research/n43/d18/transfer_summary.md cdb10000...,
  research/n43/d18/x137/effective_anchor.md 2eed07f6..., research/n43/d18/x137/frontier_closure.md 7090245d...).
  Applicability spot-checks and unresolved external premises are itemized below.
Checks: assumptions, quantifiers, ambient types, algebra, case coverage,
        dependency applicability, permitted search use - all passed; evidence per claim below.
Findings: no defects; three implicit steps and all verified derivations recorded under "Findings and supporting reasoning".
Outcome: accepted
Limits: external premises listed below are unverified beyond their recorded
  citations; no novelty checked; no search/solver/catalogue/download/install/
  Lean/engine/build/test/lint/format was used; only exact scalar arithmetic and
  tiny fixed-case (<=10 vertex) derivations were performed by hand.
```

## Scope and method

I independently re-derived every algebraic identity, quantifier, degree
bound, equality case, and case split in Sections 1-4 from the note's Setting
(lines 16-79) and the four claims' stated dependencies. I did not repeat the
proof audit of Sections 5-9 (owned by another reviewer) and used no claim
from those sections. All Turan/Mantel equality cases and the small core caps
used below were re-derived, not taken on trust; where a cap is an external
published value I record it as an external premise.

Setting facts used (verified internal consistency): sum_A w = 2*85-2 = 168;
epsilon_a = d_A(a)+d_B(a)-17 so d_B = 17-w exactly; 6<=d_A<=13 (floor from
E(4,5,17)<=79 applied to A-a; ceiling from R(3,5)=14: a neighborhood
N_A(a) is K3-free and I5-free, forcing d_A<=13); 4<=w<=13 follows from
d_A>=6 and epsilon<=2. A is K4-free and I5-free; B is K5/I4-free; A may
contain I4, and only remainders of I4-transversals are K4/I4-free.

## Claim 1: claim-q0-tight-defects (Section 1, lines 82-137)

- Signature count (lines 97-106): every one of the 24 columns meets I
  (otherwise I union {y} is I5). A singleton class at i is a clique (a
  nonedge inside it plus I-{i} gives I5) and has size <=3 (four members
  with i give K5), so n1<=12. Summing signatures gives
  sum|C_y cap I| = n1 + 2*n_(size2) + sum_(size>=3)|sig| = 48 - n1 + h,
  i.e. e(I,B)=48-n1+h. With d_B=17-w, sum_I d_B = 68-sum_I w, hence
  12-n1+h = 32-sum_I w. Nonnegativity holds because n1<=12 and h>=0;
  therefore sum_I w<=32 for EVERY independent four-set, with no condition
  on the excess distribution. Verified exact.
- Tight case (lines 106-116): sum_I w=32 forces n1=12 (all four classes
  triangles) and h=0 (all remaining signatures size two). a in A-I cannot
  miss all of I (I5). If a had unique I-neighbor i, it must be adjacent to
  all three members of the singleton class at i (else those two plus I-{i}
  form I5), and {class, a, i} is K5. So a has >=2 I-neighbors:
  double domination holds for every tight four-set, in particular for every
  anchor (weights all eight -> sum 32). Verified.
- Deletion identity (1) (lines 118-126): independently re-derived.
  sum_S d_A = sum_L w + E_S + 32m, e(S,A\S) = sum_S d_A - 2e(A[S]), so
  e(A-S) = 85 + e(A[S]) - sum_L w - E_S - 32m. Substituting
  F=7ell-sum_L w, sigma=e(A[L])-b4(ell),
  rho=e(A[S])-e(A[L])-8C(m,2)-2m*ell reproduces the right-hand side of (1)
  term for term. Exact.
- Nonnegativity: F>=0 since w<=7 on L; 2-E_S>=0 since total excess is 2;
  sigma>=0 since A is I5-free, so the complement of A[S] is K5-free and
  Turan ex(j,K5)=T_4(j) gives e(A[S])>=b4(j) for any j-set,
  no transversality needed; rho>=0 because domination gives >=8 edges per
  anchor pair (>=2 per vertex per other anchor) and >=2ell per anchor-L cut.
  The sentence at lines 121-123 names domination only; the other three
  justifications are definitional or stated Turan, all valid.
- Base bounds: m=0: 83-7ell+b4; m=1: 83-32-5ell+b4 = 51-5ell+b4; m=2:
  83-64-3ell+8+b4 = 27-3ell+b4. Arithmetic checked. Equality in a base
  bound forces F=0, 2-E_S=0, sigma=0, rho=0 exactly as stated (lines
  132-137); E_S=2 only places the excess inside S, not outside anchors, so
  the caveat that anchor excess may remain is correct.

## Claim 2: claim-q0-low-not-transversal (Section 2, lines 139-248)

- Bound: 168 <= 7ell+13(18-ell) = 234-6ell gives ell<=11. Transversal
  size >=4 uses the frontier-band four-transversal bound at q=0; the
  section "Four-transversal extension" (frontier_band.md lines 35-41) is
  present and applies to any 18-vertex F with alpha(F)<=3 and
  e(F)<=68<=70 (complement of A at e(A)=85), so the citation applies.
  Its own census/15-vertex-minimum premises are external (Limits).
- ell=4 (lines 150-152): member floor 9 for an ARBITRARY four-set
  transversal checked, not only actual columns. four_column_stability.md
  Claim 01 (accepted) proves d_A(t)>=85-(50+24+2)=9 using only that the
  14-vertex complement of the four-set is (4,4)-free (each of the three
  vertices J=T-{t} has <=8 neighbors in K by R(3,4)=9; triangle case gives
  <=23 by inclusion-exclusion); actual-column status there is used only to
  establish transversality. The quantifier extension is explicit in the
  accepted x137 note (effective_anchor.md setting lines 36-44: "applies to
  any transversal, because A-T is K4/I4-free"; Claim 3 scope: "every
  abstract I4-transversal"). With d_A>=9 and w<=7 each member needs
  epsilon>=2, total >=8>2. Verified.
- Cap table (lines 153-159): with H=(4,4)-free under the hypothesis,
  m=0 base 83-7ell+b4(ell) and U(18-ell) give rows
  49/45, 43/40, 37/36 (contradictions) and 31/31, 26/27, 21/21, 16/16
  (survivors). All arithmetic and b4 values (b4(5..11)=1,2,3,4,6,8,10)
  recomputed from four balanced cliques. Verified.
- ell=8 (lines 161-189): equality structure A[L]=4K2 (complement of
  T_4(8) in the sigma equality case), all w=7, E_L=2, e(H)=31,
  e(L,H)=85-31-4=50. Triangle-free I4-free j-graphs have Delta<=3 and
  e<=floor(3j/2), so a triangle-free eight-set gives e(H)<=12+16+1=29<31;
  hence d_H(a)<=7 for a in L; an epsilon=2 vertex would have d_H=8, so
  two unit vertices p,q with d_H=7. For a triangle-free seven-set T with
  complement R: if R has edge ab, common T-neighborhood of a,b is
  independent of size <=3, so e({a,b},T)<=7+3=10, e(R,T)<=17,
  e(H)<=10+17+3=30<31. Hence R is independent, e(T)=10 and all 21 R-T
  edges (31 = 10+21+0), so H = I3 joined to T. Existence and uniqueness
  of T: uniqueness as written is valid (any seven-set meeting R lies in R
  alone because of the join, so has size <=3<7). Existence is implicit but
  immediate: N_H(p) has size 7 and is triangle-free (K4 in A) and
  I4-free (H is a transversal remainder), so it IS such a seven-set;
  independently, 2e(H)=62>60 forces Delta(H)>=7 while Delta<=8 (R(3,4))
  and Delta=8 is excluded by the 29-bound. p,q both have neighborhood T;
  adjacency would give K4 with any edge of T; p,q plus R give I5.
  Verified, no gap.
- ell=9, e(H)=27 (lines 191-200): equality in the cap gives H=K333
  (independently verified below). s=sum_L d_A = 58+t follows from
  e(A)=85: e(L,H)=85-27-t and s=2t+e(L,H)=58+t; s<=65 (7ell+E_L) and
  t>=b4(9)=6 give t in {6,7} and e(L,H)=58-t>=51. H=K333 has no
  triangle-free set meeting all three parts of size >=4 (any transversal
  triple spans a triangle), so an outside vertex has H-degree <=6 and a
  degree-six neighborhood is two whole parts; two same-type vertices
  cannot be adjacent (K4 via a common cross edge) nor nonadjacent (I5 with
  the omitted three-part), so at most three degree-six vertices and
  e(L,H)<=3*6+6*5=48<51. Verified.
- ell=9, e(H)=26 (lines 202-242): equality gives A[L]=K3+3K2 (b4(9)=6,
  sigma equality), w=7, E_L=2, e(L,H)=85-26-6=53. No triangle-free
  seven-set (<=10+14+1=25<26), so all H-degree <=6; H-v is (4,4)-free on
  8 with e<=U(8)=21 gives min degree >=5, and 2*26=52=7*6+2*5 gives
  degree sequence 6^7,5^2. Complement F: 10 edges, degrees 2^7,3^2, no
  I4 (H has no K4). Classification re-derived independently: R(3,4)=9
  gives a triangle T in F; only two degree-3 vertices, so some t in T has
  degree 2 and no neighbor outside T, hence alpha(F-T)<=2 (else that
  vertex plus an independent triple is I4). If t edges leave T, the
  remainder has 7-t edges and triangle-free complement, so Mantel gives
  7-t>=6, t<=1. t=1: complement has 9 edges = K33 (Mantel equality),
  remainder 2K3. t=0: remainder has 7 edges and alpha<=2; R(3,3)=6 gives
  a triangle U, whose member of F-degree 2 forces the three vertices
  outside U within the remainder to form a clique (else that member plus
  an independent triple is I4). Either way F = 3K3 + one bridge, i.e. (2)
  H = K333 minus one cross edge. Verified.
  Degrees: L-triangle vertices have H-degree 5+epsilon (d_L=2), L-pair
  vertices 6+epsilon (d_L=1), all <=6 (a 7-neighborhood would be the
  excluded triangle-free seven-set), so units sit on two distinct triangle
  vertices (epsilon<=1 each) and exactly eight L vertices have H-degree 6.
  A triangle-free six-set in (2): if it contains both endpoints of the
  deleted edge the three part-intersections collapse to the two singletons
  and the set has size <=5; otherwise every transversal triple is present
  and is a triangle, so the set misses a part and, having six vertices,
  equals two whole parts. At most one outside vertex per full-two-part
  type (adjacency -> K4 via a common cross edge; nonadjacency -> I5 with
  the omitted part), three types give at most three < eight. Contradiction.
  Verified.
- ell=10 (file lines 236-241): equality gives H=K332
  (cap equality, verified below), e(A[L])=b4(10)=8, sum_L d_A=7*10+2=72,
  e(L,H)=85-21-8=56. Triangle-free subsets of K332 lie in <=2 parts
  (size <=6; size 6 is the two whole three-parts). At most two outside
  vertices have that neighborhood (pairwise nonadjacent else K4; three
  plus the omitted two-part give I5), the rest have H-degree <=5, so
  e(L,H)<=2*6+8*5=52<56. Verified.
- ell=11 (file lines 243-245): equality gives
  H=K322 (cap equality, verified below), e(A[L])=b4(11)=10,
  sum_L d_A=79, e(L,H)=85-16-10=59. Triangle-free subsets of K322 lie in
  <=2 parts, size <=5, so e(L,H)<=11*5=55<59. Verified.
- Conclusion (file lines 247-248): every case 4..11 is excluded, so an I4
  avoids L; weights >=8 and sum <=32 (Claim 1) force all four weights 8:
  an anchor exists. Verified; no case in 0..11 is left uncovered (ell<4
  impossible for a transversal by tau>=4).

## Claim 3: claim-q0-no-three-anchors (Section 3, lines 250-299)

- Setup (lines 263-266): alpha>=0 holds because the three anchor pairs
  each span >=8 edges by Claim 1 domination and the anchors are
  independent, so e(A[Z])>=24. beta>=0 is asserted without stated
  justification; it is immediate: R=A-Z is K4-free as a subset of A, so
  Turan's K4-free bound ex(6,K4)=T_3(6)=12 gives e(A[R])<=12=U(6).
  (Independent cross-check from my original derivation: sum_R w =
  168-3*4*8 = 72, and any I4 J in R has weight sum <=32 by Claim 1,
  leaving two vertices >=40 > 2*13, impossible; so R is also I4-free and
  U(6)=12 applies as a (4,4) cap. Valid but unnecessary - the K4-free
  Turan bound alone supplies beta>=0.)
- Identity (3) (line 266): sum_Z d_A = 96+E_Z = 2e(Z)+e(Z,R) and
  sum_R d_A = 74-E_Z = 2e(R)+e(Z,R); adding to 170 gives
  alpha+beta = E_Z-1. Verified exact.
- Case coverage over EA2 (one epsilon=2 or two units): E_Z ranges over
  {0,1,2} and, with alpha,beta>=0, (3) admits exactly the three listed
  cases (-1 impossible; (0,0); (1,0); (0,1)). Distributions with the
  excess on R (E_Z=0) are killed by the impossible case; a single
  epsilon=2 vertex in Z falls under E_Z=2 and is excluded inside the
  (0,1) case. No case is dropped.
- E_Z=1 (lines 268-271): alpha=beta=0; beta=0 gives e(R)=12=U(6), whose
  equality case is K222 (Turan uniqueness at n=6; also checked directly:
  the complement must have 3 edges with independence number <=3, forcing
  3K2). alpha=0 with domination equality forces every Z vertex exactly
  2 neighbors in each other anchor, i.e. exactly four Z-neighbors, so
  d_R=4+epsilon; the excess vertex has d_R=5, and every 5-set of K222
  contains a triangle (all three parts survive removal of one vertex),
  giving K4. Verified.
- E_Z=2, alpha=1 (lines 273-284): sum_Z t = 2e(Z)-48 = 2 with
  t_z=d_Z(z)-4>=0 (domination). No triangle-free 5-set in K222 gives
  d_R(z)=4+epsilon_z-t_z<=4, hence t_z>=epsilon_z pointwise by total
  equality, so every Z vertex has exactly four R-neighbors = two full
  two-parts. At most two vertices per omitted-part type (same type:
  adjacency gives K4 via a common cross edge; three give I5 with the
  omitted two-part), three types -> at most six < twelve. Verified.
- E_Z=2, alpha=0 (lines 286-299): every Z vertex has four Z-neighbors
  (domination equality). An epsilon=2 vertex would have d_R=6, meeting
  all of R, but e(R)=11>9=Mantel forces a triangle in R -> K4; so units
  p,q with d_R=5. N_R(p) is triangle-free with <=6 edges (Mantel on 5);
  the remaining vertex has <=5 neighbors, so e(R)=11 forces Mantel
  equality N_R(p)=K23 and the remaining vertex r universal: R=K123. The
  unique triangle-free five-set of K123 is R-{r} (removing r kills all
  r-K23 triangles; removing any other vertex leaves one), so q has the
  same neighborhood; p,q nonadjacent (K4 via an edge of the K23).
  Each Z-neighbor z of p is normal (both units are on p,q) and has exactly
  four R-neighbors: sum_Z d_R = 98-48 = 50, p,q contribute 10, the other
  ten vertices have d_R<=4, so all equal 4. N_R(z) is triangle-free; a
  four-vertex triangle-free set of K123 must contain r and one whole part,
  and independence from p forbids mixing parts in the K23, so
  N_R(z)=r union the three-part. The four Z-neighbors of p are pairwise
  nonadjacent (K4 via the common neighborhood, which contains an edge), a
  two-part vertex is adjacent to none of them, giving I5. Verified; last
  case of (3) excluded. QED line 299.

## Claim 4: claim-q0-low-count (Section 4, lines 301-357)

- Anchor I exists by Claim 2 and is disjoint from L (weights 8).
  168 <= 32+7ell+13(14-ell) = 214-6ell gives ell<=7 (lines 310-314).
- m=1 table (lines 315-323): lower 51-5ell+b4(ell), remainder order
  14-ell, upper U(14-ell): rows 41/40, 36/36, 31/31, 27/27, 23/21, 19/16
  recomputed; only ell=3,4,5 survive, all at equality, so all four defects
  F, 2-E_S, sigma, rho vanish. Every U() use is on the remainder of the
  assumed transversal I union L, which is therefore (4,4)-free as
  required by the note's standing rule.
- ell=5 subcase (lines 324-329): remainder = K333 (cap equality). Each
  independent I vertex's H-neighborhood is triangle-free (K4 in A), so it
  lies in <=2 parts, i.e. the vertex misses a full part; two of four I
  vertices miss the same three-part -> together an I5. Excluded.
- m=2 table (lines 333-341): lower 27-3ell+b4(ell), remainder order
  10-ell: rows 21/21, 18/16, 15/12, 13/8, 11/5, 9/3 recomputed; only
  ell=2 survives, at equality with all defects zero.
- ell=2 subcase (lines 342-350): H=K332 (cap equality), S=I union J union
  L has 4+4+2=10 vertices, sum_S d_A = 32+32+14+2 = 80, e(A[S]) = 0+0+b4(2)=0
  + 8 (I-J at domination minimum) + 2*2*2 (anchor-L cuts) = 16, cut
  e(S,H) = 80-32 = 48. Every S vertex's H-neighborhood is triangle-free.
  Degree >=5 types by omitted part: omitted two-part -> meets both
  three-parts in >=2, any pair shares a cross edge (adjacency would give
  K4) and three give I5 with the omitted two-part: at most 2 vertices of
  degree <=6; either omitted three-part -> degree >=5 means the whole
  other five vertices: at most 1 vertex of degree <=5 each. Remaining six
  vertices have degree <=4. Capacity 2*6+2*5+6*4 = 46 < 48. Verified;
  this is the stated K332 capacity check.
- Third-anchor step (lines 351-355): if I union J union L is not a
  transversal, an I4 avoiding it has weights >=8 and sum <=32, hence is a
  third anchor disjoint from I and J, contradicting Claim 3 (dependency
  applies: three pairwise disjoint weight-8 anchors with the total excess
  EA2 anywhere in A - exactly Claim 3's scope). Therefore for every anchor
  I and every ell>=2, I union L is a transversal, and the m=1 table leaves
  ell in {3,4} with all defects zero. Together with ell<=7 and the
  exclusion of ell=2, the survivors are exactly ell in {0,1,3,4}.
  Verified; conclusion matches the claim statement.

## Cross-boundary dispatch check

Types crossing claim boundaries were traced to their consumers: the anchor
type (weight-eight independent four-set) produced in Claim 2 is consumed in
Claim 4's two branches and in Claim 3's three-anchor hypothesis; the exact
identity (1) produced in Claim 1 is consumed with m=0 (Claim 2 table),
m=1 and m=2 (Claim 4 tables) with matching base-term arithmetic; the
weight-sum<=32 fact from Claim 1 is consumed by Claim 2's conclusion, by
Claim 3's beta>=0 cross-check (via sum_R w=72), and by Claim 4's J/K
anchor selections. No consumer silently drops or no-ops any of them, and
no producer claim assumes a consumer's conclusion.

## Findings and supporting reasoning

No defects found in claims 1-4; outcome accepted. Points that a reader
must assemble, each independently derived here and recorded so the next
review does not re-open them:

1. Section 3 beta>=0 has no inline justification; it follows immediately
   from K4-freeness of R (R subset of A) via Turan ex(6,K4)=T_3(6)=12=U(6).
   The weight-sum route (sum_R w=72 vs weight sum <=32 for any I4) is an
   independent cross-check that also shows R is I4-free; without either,
   the pairs (E_Z,alpha,beta)=(0,0,-1),(1,1,-1),(2,2,-1) would be
   uncovered. All are impossible as shown.
2. Section 2 ell=8 uses "the" triangle-free seven-set before exhibiting
   one; existence holds because N_H(p) is a triangle-free I4-free set of
   size seven (equivalently Delta(H)>=7 from 2e(H)=62>60).
3. Section 1's nonnegativity sentence attributes domination to all four
   defects; F and 2-E_S are definitional and sigma is the stated Turan
   complement bound (I5-free -> complement K5-free -> T_4) - all four
   nonnegativities are true.

## Limits and unverified external premises

- Published (4,4,m) caps for m=11..17 (root table, source [2]) and the
  interval E(4,4,14)=41..50: values match every use here; the underlying
  publications were not re-verified. The small caps U(6..9)=12,16,21,27
  are the K4-free Turan numbers ex(n,K4)=T_3(n), equality cases K222,
  K322, K332, K333 by Turan uniqueness; re-derived here, with n=8,9
  equality additionally cross-checked by direct case analysis. U(10)=31
  comes from the x137 elementary core-cap proof (accepted note, external).
- E(4,5,17)<=79 (Angeltveit-McKay, arXiv:2409.15709v2 Appendix A Table 1,
  via pivot_classes.md): cited, not re-verified.
- Frontier-band four-transversal bound: its transversal_four.md census
  premises and the published 15-vertex minimum 50 are external; the root
  table does record min e(4,4,15)=50, and applicability at q=0 was checked.
- Prior x136/x137 claims are accepted on their recorded premises; their
  full proofs were not re-audited beyond the floor-9 quantifier check
  required by this assignment. No root-unavoidability or order-43 closure
  is claimed anywhere in Sections 1-4, and none is implied by this review.
- Search use: none. No graph search, solver, catalogue, download,
  installation, theorem prover, engine, build, test, lint, or formatter
  was used; only hand derivations, exact scalar arithmetic, and tiny
  fixed-case (<=10 vertex) analyses.

Reviews: this file, research/n43/d18/tau/review_q0_foundations_20261019_independent.md,
against file SHA-256 491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8.
Outcome: accepted for the four claims above, scope lines 82-358 only.
