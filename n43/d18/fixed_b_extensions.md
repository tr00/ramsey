<!-- extension-research-integration:start -->
Integration status (2026-10-17): all nine claims independently accepted at
reviewed-body SHA-256 `570a467d13425643b16a829ff116e2634bef91d839a9b65e417529fa0b6ee56f`.
See the [exact-revision review](review_fixed_b_extensions_20261017_audit.md).
The reviewed body below is preserved verbatim; ready labels are historical.
Permitted mathematical uses are the stated coverage, symmetry and witnessed
capacity deductions. Catalogue completeness/extrema remain external premises;
the final relaxation remains design, not an implemented exhaustive search.
No full degree-18 exclusion, novelty claim, or runtime improvement is certified.
<!-- extension-research-integration:end -->

# Fixed-B extensions, mask occupancy, and capacity certificates

Date: 2026-10-17. Author/task: FixedBResearch.

All claims below are **ready for independent review, not accepted**. This is
mathematical coverage and necessary-condition work, not a graph enumeration,
solver implementation, closure certificate, or novelty claim. Only this note
is owned by this task. No graph files, catalogue downloads, installations,
canonicalizers, theorem provers, graph searches, or solvers were used. The
catalogue landing page was read; its completeness is an external premise.
No new pruning authority is claimed before independent review.

The reported closure of x=136 is user-supplied and pending integration. No
claim here uses it. In particular, the conclusions do not silently replace
x>=136 by x>=137. The older branch index may still display x136 as open.

## Setting and inputs

Let G be K5/I5-free on 43 vertices, v have degree 18, A=N(v), and
B=M(v). Thus |A|=18, |B|=24, A is K4/I5-free, and B is K5/I4-free.
A may contain I4. Fix B first, with its 24 actual vertex labels. A row
R_i is a subset of V(B), not an isomorphism type of an induced subgraph.
Its size is r_i. Repeated rows remain distinct A occurrences.

Write a=e(A), b=e(B), x=sum_i r_i, c_y=|{i:y in R_i}|, and
s_i=d_A(i). The retained global degree bound is 18<=d_G(z)<=24.
It follows, for example, from the external exact value R(4,5)=25 applied
to every neighborhood and antineighborhood. The external edge extrema used
only where explicitly indicated are 50<=a<=85 and 144<=b<=160.
Put q=85-a, epsilon_i=s_i+r_i-17, and E=sum_i epsilon_i.

Existing inputs reused here:

* [Exact forbidden rectangles and row bounds](../reductions.md#5-pivot-interface-predicates),
  especially Sections 5.1--5.4, and the census premises in Section 8.1.
* [Multiset symmetry](symmetry_reduction.md#claim-d18-symmetry-01): the
  two-stage quotient, with A and B interchanged in the permutation argument.
* [Anchored cells](anchored_cell_averaging.md#claim-cell-types): homogeneous
  extension proofs, not an exchange of the two ambient independence caps.
* [Signed capacity cuts](cell_obligation_cuts.md#claim-cell-signed-cut):
  rational aggregation and exact integer verification.
* The classical numbers R(3,3)=6, R(3,4)=9, R(3,5)=14,
  R(4,4)=18, and their symmetric versions; R(k,2)=k.

No adjacent-root common-nonneighbor cell is assigned type (4,4): that cell
would only be (5,4). None of the arguments below needs such a typing.

<a id="claim-fixed-b-outer-cover"></a>
## 1. The complete outer cover is the complemented 24-vertex census

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-outer-cover`
Kind: local-deduction
Review state: ready
Scope: every rooted order-43 degree-18 K5/I5-free candidate; all rooted
isomorphism classes, with no degree-sequence complement selector
Dependencies: B is K5/I4-free; external completeness assertion on Brendan
McKay's [Ramsey graphs page](https://users.cecs.anu.edu.au/~bdm/data/ramsey.html),
section “Extremal Ramsey(4,5)-graphs”, read 2026-10-17
Conclusion: fixing in turn the complements of a complete set of the
352366 Ramsey(4,5,24) representatives covers every possible B
Search use: branch, conditional on the external complete-family premise
Reviews: none

Proof. Complementation interchanges clique and independent-set restrictions,
so B-bar is K4/I5-free on 24 vertices. The cited page states that the full
family has 352366 graphs: the original 350904 plus the remainder found in
2016. Given a complete set of representatives of that family, B-bar is
isomorphic to at least one representative C; then B is isomorphic to C-bar.
Relabel B by that isomorphism and keep the cross rows and A edges together.
This preserves the rooted candidate. Distinct nonisomorphic C have
nonisomorphic complements, since an isomorphism of complements also
preserves the original nonedges. Thus the outer isomorphism types do not
overlap; residual labels are handled in Claim 3.

This is a coverage implication, not an independent recertification of the
census. The landing page, not the graph file, was accessed. Complementing
this 24-vertex core is not complementing G, and does not authorize a second
quotient that identifies degree-18 roots with degree-24 roots of G-bar.

<a id="claim-fixed-b-exact-extension"></a>
## 2. Full row/edge correspondence, including all higher mixed constraints

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-exact-extension`
Kind: local-deduction
Review state: ready
Scope: fixed labeled K5/I4-free B on 24 vertices; an ordered list of 18
actual rows; an arbitrary simple edge assignment on those 18 occurrences
Dependencies: the exact forbidden-rectangle criterion cited above; elementary
homogeneous-set extension; the small Ramsey values listed in the setting
Conclusion: conditions (E1)--(E6) below are necessary and sufficient for the
assembled rooted graph to be K5/I5-free; every actual row lies in D_B below
Search use: propagate and exact branch specification after review
Reviews: none

Define the finite full row domain

    D_B={R subset V(B): 4<=|R|<=17 and B[R] contains no K4}.

The I4 prohibition on B[R] is inherited from B, so its type is (4,4).
The exact conditions on A and its rows are:

* (E1) A has no K4 and no I5.
* (E2) For every row R_i, B[R_i] has no K4.
* (E3) For every A edge ij, B[R_i intersect R_j] has no triangle;
  for every A nonedge ij, B-(R_i union R_j) has no I3.
* (E4) For every A triangle ijk, B[R_i intersect R_j intersect R_k]
  has no edge; for every A independent triple ijk,
  B-(R_i union R_j union R_k) is a clique.
* (E5) For every A independent four-set I, union_(i in I) R_i=V(B).
* (E6) The retained numerical degree and, if desired, census budgets below
  hold. These are redundant for genuine Ramsey graphs on the external
  degree/extrema premises, but useful explicit restrictions in an extension.

Proof of equivalence. Construct G by making v adjacent exactly to all 18
A occurrences, using the prescribed B, the prescribed A edges, and the row
incidences. A K5 through v would require a K4 in A, prohibited by (E1).
An I5 through v would require an I4 in B, already prohibited. A five-set
not through v splits as i vertices of A and 5-i of B. For cliques, i=0
is excluded by B, i=1 by (E2), i=2 by the edge half of (E3), i=3 by the
triangle half of (E4), and i=4,5 by A's K4 prohibition. For independent
sets, i=0 is excluded by B's stronger I4 prohibition, i=1 also by that
prohibition, i=2 by the nonedge half of (E3), i=3 by the independent-triple
half of (E4), i=4 by (E5), and i=5 by (E1). This exhausts every five-set.
Conversely any failure of (E1)--(E5) supplies the indicated K5 or I5,
possibly through v, so each condition is necessary.

For the row bounds, (E2) and B's I4 prohibition imply r_i<=17 by
R(4,4)=18. A neighborhood inside A is K3/I5-free, giving s_i<=13 by
R(3,5)=14. Since d_G(i)=1+s_i+r_i>=18, r_i>=4. Thus no genuine
extension is lost by D_B. One may initially use D_B even though (E1) is
not yet assigned: the inequalities are necessary for every eventual A.
The moderate-row subdomain is D_B intersect {r<=15}; restricting to it
is a separate hypothesis, not coverage of candidates with rows 16 or 17.

Here is the explicit numerical part of (E6):

    max(0,17-r_i) <= s_i <= min(13,23-r_i),
    0<=epsilon_i=s_i+r_i-17<=6,
    18-d_B(y) <= c_y <= 24-d_B(y)                 (every y in B),
    x=sum_i r_i=sum_y c_y,
    50<=a<=85, 144<=b<=160                       (external extrema),
    E=x+2a-306,
    x=136+2q+E, q=85-a,
    E_B=sum_(y in B)(d_G(y)-18)=x+2b-432,
    W=E+E_B=2b-296+2q+2E.

The column bounds also imply c_y>=1. Indeed d_B(y)<=17 because its
B-neighborhood is (4,4). Independently c_y=0 would make all A nonadjacent
to y, forcing A to be (4,4) of order 18, impossible. The corresponding
bound d_B(y)>=10 follows because B's antineighborhood at y is (5,3)
and has order at most 13. Hence the displayed column interval is contained
in 1<=c_y<=14. Summing s_i+r_i=17+epsilon_i gives
2a+x=306+E. Summing B degrees gives E_B. Substitution yields W.
No equality-frontier premise is used.

<a id="claim-fixed-b-symmetry"></a>
## 3. Correct multiset symmetry for the B-first direction

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-symmetry`
Kind: local-deduction
Review state: ready
Scope: one fixed labeled B; the complete row and A-edge extension family;
all extra budgets required to be relabeling-invariant
Dependencies: Claim 2; the finite permutation argument of
`symmetry_reduction.md#claim-d18-symmetry-01`
Conclusion: the two-stage quotient below preserves exactly the rooted
isomorphism classes for this B if both orbit stages are complete
Search use: symmetry after review and certified orbit handling
Reviews: none

Order subsets of V(B) by (size, bit tuple), then sort all 18 actual rows.
Let M have multiplicities n_R and define

    H_M={g in Aut(B): n_(gR)=n_R for every R},
    Gamma_M={(g,sigma): g in Aut(B), sigma in S_18,
                          R_(sigma(i))=g(R_i) for every i}.

Retain one sorted M per Aut(B) orbit and then one full A edge vector per
Gamma_M orbit. There is an exact sequence

    1 -> product_R S_(n_R) -> Gamma_M -> H_M -> 1.

Proof. Before assigning A edges, Aut(B) x S_18 acts on the complete row
list. Quotient by S_18 to get the multiset, and quotient its image by
Aut(B). A g preserving multiplicities can be lifted by matching the
occurrences of R to those of gR. The kernel consists exactly of arbitrary
permutations inside equal-row classes. These are precisely the relabelings
preserving the fixed B and the row incidence structure, so they act on the
entire A edge assignment. Two completions with the same M are rooted
isomorphic exactly when their A edge vectors lie in the same Gamma_M
orbit. This proves both coverage and exactness, together with Claim 1's
outer representatives.

Repeated rows are not required to be twins in A. A duplicate swap changes
the A completion vector together with all other occurrence-indexed data.
Individual Aut(B)-minimization of each row is not valid: one common g must
act on the whole multiset. The kernel alone is safe but may miss mask-class
exchanges by H_M. Scalar q,E,x are invariant; any individual epsilon labels
must be permuted with their occurrences. No full-graph complement selector
is included here.

<a id="claim-fixed-b-forced-pairs"></a>
## 4. Forced pairs and universal row multiplicity two

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-forced-pairs`
Kind: local-deduction
Review state: ready
Scope: actual rows in D_B of any candidate in the setting; no census or
x136 premise
Dependencies: Claim 2; R(3,4)=9 and R(5,3)=14
Conclusion: the forcing and multiplicity classification below holds
Search use: propagate after review
Reviews: none

For two occurrences with masks R,S define the separately witnessed relations

    H(R,S): B[R intersect S] contains a triangle,
    F(R,S): B-(R union S) contains an independent triple.

H forces an A nonedge and F forces an A edge, by (E3). Both witnesses at
once reject the pair. In particular,

    |R intersect S|>=9 -> H(R,S),
    |R union S|<=10    -> F(R,S).

Every mask R has multiplicity n_R<=2. More precisely, a repeated mask
must lie in exactly one of the following two types:

    adjacent duplicate:     4<=r<=8, B[R] triangle-free;
    nonadjacent duplicate: 11<=r<=17, B-(R) has no I3.

These are necessary types, not existence assertions. In particular rows of
size 9 or 10 cannot repeat.

Proof. If B[R] has no triangle, then r<=8 since B has no I4. Its complement
has at least 16 vertices and therefore an I3 by R(5,3)=14. All occurrences
of R are consequently pairwise adjacent in A. Three occurrences would be
an A triangle, while R has an edge because r>=4 and B has no I4. This
violates (E4), so at most two occurrences are possible.

If B[R] has a triangle, all occurrences are pairwise nonadjacent in A.
Three occurrences would be an independent triple. But |B-R|>=7, and a
set of at least five vertices in a K5-free graph is not a clique. Thus the
uncovered set has a nonedge, violating (E4). Again n_R<=2. If two such
occurrences exist, their uncovered set has no I3 by (E3), and its size is
at most 13 by R(5,3)=14. Hence r>=11. Conversely the previous case's
repeated masks are triangle-free and r<=8. These cases exhaust R; for
r=9 or 10 both F(R,R) and H(R,R) hold.

Consequences: at least nine distinct actual masks occur; if all rows have
size 9 or 10, all 18 masks are distinct. The kernel in Claim 3 is a product
of p<=9 disjoint C2 factors, with order at most 512. This concerns the
row-first quotient with B fixed, not the earlier column-first quotient.

<a id="claim-fixed-b-mixed-occupancy"></a>
## 5. Mixed B-anchor occupancy is a pre-completion capacity system

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-mixed-occupancy`
Kind: local-deduction
Review state: ready
Scope: any clique Q and independent set P in the fixed B; Q,P may be
empty, and their cross adjacencies are arbitrary
Dependencies: Claim 2; the homogeneous extension argument; the small Ramsey
values in the setting
Conclusion: the cell and numerical capacities below are necessary for the
row multiplicities, before any A edges are assigned
Search use: propagate after review
Reviews: none

Let

    X(Q,P)={i: Q subset R_i and R_i intersect P is empty},
    L_(Q,P)(R)=1[Q subset R, R intersect P empty].

If Q intersects P, X is empty. Otherwise A[X] is

    (min(4,5-|Q|), min(5,5-|P|))-free.             (O)

A parameter one means the cell is empty. In all cases its order is
sum_R L_(Q,P)(R) n_R. Useful caps h_(Q,P) are:

| |Q| | |P|=0 | |P|=1 | |P|=2 | |P|=3 |
| --- | --- | --- | --- | --- |
| 0 | 18 | 17 | 8 | 3 |
| 1 | 18 | 17 | 8 | 3 |
| 2 | 13 | 8 | 5 | 2 |
| 3 | 4 | 3 | 2 | 1 |
| 4 | 0 | 0 | 0 | 0 |

Here cap 18 uses the ambient number of A occurrences, not R(4,5)-1=24.
For Q=empty and P=empty the cell is all A. B has no independent P of
size four, so the table covers every possible independent anchor size.

Proof. A clique of size 5-|Q| in X joins Q to make a K5. An independent
set of size 5-|P| in X joins P to make an I5. Independently X inherits
A's K4/I5 prohibitions. This proves (O), without any requirement on the
edges between Q and P. The displayed numbers follow from R(3,5)=14,
R(3,4)=9, R(3,3)=6, R(4,4)=18, and R(k,2)=k. For |Q|=3 the cell is
independent, so avoiding respectively zero, one, two, or three B anchors
bounds its order by respectively 4,3,2,1. For |P|=3 it is a clique, so
the inherited K4 bound and the extra Q bound give 3,3,2,1. This also
checks the asymmetric ambient types explicitly.

In particular each B triangle belongs to at most four rows and each B I3
is missed by at most three rows. Mixed caps can be much stronger: three
rows containing a named B triangle cannot all omit a named B nonedge;
two containing that triangle cannot both omit a named B I3. These are
occupancy rejections, not guesses about unknown A pairs.

<a id="claim-fixed-b-small-row-capacities"></a>
## 6. Size-restricted capacities improve the raw anchor table

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-small-row-capacities`
Kind: local-deduction
Review state: ready
Scope: arbitrary subfamilies of actual rows; all other rows and all A
edges may be unknown
Dependencies: Claims 2, 4, and 5; B has no K5 or I4
Conclusion: all four domain-capacity statements below hold universally
Search use: propagate after review
Reviews: none

1. At most three rows have size at most five.
2. For each B edge e, at most two rows of size at most six contain e.
3. For each B triangle T, at most one row of size at most six contains T.
4. For each B triangle T, at most two rows of size at most eight contain T.

Proof. In (1), any two such rows have union size at most 10, so F forces
every pair adjacent. Four would give a K4 in A.

In (2), any pair has union size at most 6+6-2=10, so again all pairs are
A edges. Three occurrences would form an A triangle with the common B
edge e, giving a K5.

In (3), two rows containing T have union size at most 6+6-3=9 and thus
are forced adjacent by F, but T simultaneously forces them nonadjacent by
H. In (4), all occurrences containing T are independent in A. If three
such rows of size at most eight existed, their union would have order at
most 3*8-2*3=18, because the same three vertices are counted three times.
The uncovered set has order at least six and cannot be a clique in B.
It has a nonedge which, with the independent A triple, gives an I5.
This proves (4). Repetitions are included in every count.

More generally, h independent A rows containing the same B triangle must
have total size at least 14 for h=2, at least 26 for h=3, and at least 33
for h=4. For h=2 the union has size at least 11, because its complement
has no I3 and hence order at most 13. For h=3 the union has size at least
20, because its complement is a clique of order at most four. For h=4
the union is all 24 vertices. For h rows with a common triangle,
|union R_i|<=sum_i r_i-3(h-1). Combining gives the three bounds.
These are integer size-resource constraints on a triangle cell; the
minimum sizes for different h are not additive capacities.

<a id="claim-fixed-b-mask-balls"></a>
## 7. Small exchange balls have capacity two, including moderate rows

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-mask-balls`
Kind: local-deduction
Review state: ready
Scope: any fixed B as above; any center S subset V(B) of size r; any
nonnegative integers a_0,b_0; any occurrences whose actual masks lie in
D(S;a_0,b_0) below, including repeats
Dependencies: Claims 2 and 4; B's K5/I4 prohibitions; optional rational
fractional-matching witnesses defined below
Conclusion: the forcing flags and domain occupancy bounds below hold
Search use: propagate after review
Reviews: none

Define the asymmetric exchange ball

    D(S;a_0,b_0)={R in D_B: |S-R|<=a_0, |R-S|<=b_0}.

The center need not itself be an admissible row. Every pair of ball rows
has intersection containing S minus at most 2a_0 vertices, and union
contained in S plus at most 2b_0 vertices. There are two sound flags:

* H-flag: either r-2a_0>=9, or a rational fractional matching of total
  weight >2a_0 is supplied on the B triangles contained in S.
* F-flag: either r+2b_0<=10, or a rational fractional matching of total
  weight >2b_0 is supplied on the B independent triples in B-S.

A fractional matching here has nonnegative weights on named triples with
sum of incident weights <=1 at every vertex. No integrality or disjointness
of that matching is assumed.

If the H-flag holds, all selected occurrences are pairwise nonadjacent in
A. Their number is at most four; it improves to at most three if
r+4b_0<=23, and to at most two if r+3b_0<=19.

If the F-flag holds, they are pairwise adjacent in A. Their number is at
most three; it improves to at most two if r-3a_0>=4.

If both flags hold, there is at most one occurrence.

Proof of the flags. For H's numerical condition, an intersection of order
at least nine contains a triangle by R(3,4)=9. For its fractional witness,
no set of at most 2a_0 vertices hits every weighted triangle: the total
weight it can hit is at most 2a_0 by summing its incident capacities, less
than the total supplied weight. Hence some triangle survives the two
rows' deletions from S and lies in their intersection. This is H. For F,
a union of order at most ten leaves at least 14 vertices of a K5-free B,
which contain an I3 by R(5,3)=14. Alternatively the two rows add at most
2b_0 vertices outside S, and the fractional witness leaves some I3
unhit there. This is F. A witness of 2a_0+1 vertex-disjoint triangles,
or 2b_0+1 vertex-disjoint I3's, is a special integer certificate.

For H's capacities, five rows would form I5 in A. Four have union of
order at most r+4b_0; if this is at most 23, an uncovered B vertex makes
an I5 with them. Three have union of order at most r+3b_0; if this is
at most 19, their uncovered set has at least five vertices and therefore
a B nonedge, making an I5 with them. For F, four give K4 in A. Three
have intersection containing at least r-3a_0 vertices of S; if this is
at least four then B's I4 prohibition provides a common B edge, making
a K5 with that A triangle. Both flags forbid any two occurrences outright.
All size bounds are valid for different masks and repeated masks alike.

### Concrete universal class exclusions

For a_0=b_0=1 (one deletion and one addition, either possibly absent):

| Center size r | Pair flag from size alone | Universal occupancy cap |
| --- | --- | --- |
| 4,5,6 | F | 3 |
| 7,8 | F | 2 |
| 9,10 | neither | no extra cap from these size inequalities alone |
| 11,12,13,14,15,16 | H | 2 |
| 17 | H | 3 |

For center sizes 9 or 10, either fractional witness of weight >2 also
gives cap two, using respectively r+3<=19 or r-3>=4. Both witnesses give
cap one. In particular three vertex-disjoint triangles in S and three
vertex-disjoint I3's in B-S certify cap one throughout the feasible
center-size interval 9<=r<=15. This is conditional on the named triples;
no assertion that every center or every B has such witnesses is made.

Thus, for **every** B, a row domain covered by eight one-exchange balls
whose center sizes lie in {7,8,11,12,13,14,15,16} has occupancy at most
16, and cannot contain all 18 rows of an extension. This excludes a whole
class of moderately clustered mask families without assigning A. More
generally a fractional cover by these cap-two balls with total weight <9
rejects an 18-row domain. These are actual-mask covers, not covers of
induced-subgraph isomorphism types. At total weight exactly nine the
inequality alone does not reject; for an ordinary nine-ball cover, equality
forces occupancy two in each ball and every selected occurrence to belong
to exactly one of them.

<a id="claim-fixed-b-rational-capacity"></a>
## 8. Checkable rational and integer occupancy certificates

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-rational-capacity`
Kind: local-deduction
Review state: ready
Scope: any finite actual-mask domain D subset D_B, with nonnegative
integer multiplicities n_R and any supplied valid occupancy inequalities;
all dependencies of each supplied inequality remain explicit
Dependencies: Claims 4--7 for the concrete rows of the system; elementary
linear inequalities, equivalently the signed-cut principle cited above
Conclusion: the strict inequalities described below certify rejection of
all 18-row multisets supported on D; no A completion is required
Search use: terminate the specified row domain after review and exact
verification of the supplied witnesses and multipliers
Reviews: none

Let L_j(R) be any rational coefficients for which a proved capacity reads

    sum_(R in D) L_j(R) n_R <= h_j.                  (C_j)

Examples include the mixed-anchor indicators from Claim 5, the
size-restricted indicators from Claim 6, exchange-ball indicators from
Claim 7, and the two column inequalities

    sum_R 1[y in R] n_R <=24-d_B(y),
   -sum_R 1[y in R] n_R <=d_B(y)-18.

Negative coefficients are permitted in these last, signed forms. Any
nonnegative rational multipliers lambda_j give

    L(R)=sum_j lambda_j L_j(R),
    H=sum_j lambda_j h_j.

If L(R)>=rho>0 for every R in D, then

    sum_R n_R <= floor(H/rho).                     (C)

The certificate is the finite list of applicable cuts, their witnesses,
the rational multipliers, and the per-mask coefficient comparison. A value
H<18*rho rejects every 18-row family supported on D. Noninteger H/rho is
rounded down because occupancy is integral. For an already chosen prefix,
subtract its exact occupancy in each C_j; apply the same proof to the
remaining masks and their residual capacities, rather than reusing full
capacities.

Proof. Multiply each C_j by lambda_j and add. Since n_R>=0,
rho*sum_R n_R<=sum_R L(R)n_R<=H. Integrality gives (C). This also proves
the fractional-cover assertion in Claim 7: take L_j as ball membership,
h_j=2 and rho=1. Overlaps are allowed and counted correctly.

An explicit triangle/I3 specialization is

    L(R)=sum_(T triangle subset R) lambda_T
           +sum_(J I3, J intersect R empty) mu_J,
    H=4*sum_T lambda_T+3*sum_J mu_J.

If restricted to rows of size at most eight, the coefficient 4 on every
triangle capacity can be replaced by 2; for size at most six it can be
replaced by 1. Mixed anchors and ball capacities may be added to the same
certificate, not tested only in isolation. This is where the system goes
beyond scalar counts of triangles or independent triples: weights can
select dispersed witnesses sharing heavily used masks.

There is also a useful box-strengthened certificate. Let m_R be the valid
mask multiplicity bound (one if F(R,R) and H(R,R), at most two otherwise),
and let N be the required number of rows. For arbitrary rational nu,

    N*nu <= H + sum_(R in D) m_R*max(nu-L(R),0)       (B)

is necessary. Indeed N*nu-sum_R L(R)n_R
=sum_R(nu-L(R))n_R is at most the displayed box sum, since 0<=n_R<=m_R.
A strict failure rejects even when some masks have L(R)<rho and the simple
pointwise cover cannot be used. Use residual m_R after a fixed prefix.
All denominators can be cleared by a common positive integer; verification
then uses exact integer sums, comparisons, triple witnesses, and mask
membership only. A cover over a proposed subdomain does not certify that
all other masks have been covered. Failure to find a certificate proves
nothing about feasibility.

<a id="claim-fixed-b-finite-relaxation"></a>
## 9. A finite relaxation with an exact coverage boundary

Claim ID: `n43/d18/fixed_b_extensions.md#claim-fixed-b-finite-relaxation`
Kind: design
Review state: ready
Scope: each B of Claim 1; a finite row domain D, initially all D_B;
retaining every nonrejected multiset and residual A-edge branch
Dependencies: Claims 1--8; no implemented procedure or measured performance
Conclusion: the following staged relaxation is a sound outer cover;
requiring integral A edges in its last stage recovers exactly Claim 2
Search use: design only until independent review and implementation
Reviews: none

### Occupancy-only stage

Use integer n_R with 0<=n_R<=m_R, sum_R n_R=18, column degree intervals,
all chosen mixed-anchor/small-row/ball capacities, and optionally a fixed
value of x=sum_R |R|n_R. All these are finite systems, since B has 24
vertices and D is a subset of its finite power set. They require no A
edges. This is a specification, not authorization to enumerate D here.

One may add binary support variables p_R with p_R<=n_R<=m_R*p_R and
p_R+p_S<=1 whenever distinct masks R,S have both F and H witnesses.
Without support variables, the weaker count n_R+n_S<=2 would wrongly
allow one occurrence of each incompatible mask. If integrality is dropped,
rejecting the rational relaxation is still sound; passing it is weaker.
The certificates of Claim 8 remain valid without trusting an optimizer.

### Pair-capacity stage for a retained actual multiset

Expand its 18 occurrences. Record forced A edges F and forced nonedges H
from Claim 4, including equal masks. A double-forced pair rejects. With
f_i forced neighbors and h_i forced nonneighbors, the row degree interval
[l_i,u_i]=[max(0,17-r_i),min(13,23-r_i)] requires

    f_i<=u_i and 17-h_i>=l_i.

Forced F must have no K4 and forced H must have no K5. A forced F triangle
with a common B edge, a forced H triangle with a common omitted B nonedge,
or a forced H four-set whose row union misses a B vertex also rejects.
Each rejection has its small explicit homogeneous-set witness. These tests
can reject a retained multiset before solving for A; they are not asserted
to be complete.

### Rational edge-completion stage

Put 0<=z_ij<=1 on all 153 A pairs, fixing F to one and H to zero. Impose
all degree intervals, 50<=sum z_ij<=85 on the external extrema premise,
and any chosen x,q,E equations. Add the following linear constraints:

* For every four A occurrences, sum of their six z pairs <=5 (no K4).
* For every five A occurrences, sum of their ten z pairs >=1 (no I5).
* For every B edge e and every triple of rows all containing e,
  the sum of that triple's three z pairs <=2.
* For every B nonedge P and every triple of rows all omitting P,
  the sum of that triple's three z pairs >=1.
* For every B vertex y and every four rows all omitting y,
  the sum of those four rows' six z pairs >=1.

The B-triangle and B-I3 pair cases are already exactly the F/H fixings.
K4-in-one-row cases have already been excluded from D. Every inequality
is a necessary homogeneous-set prohibition, so every actual extension
survives this rational system. With z binary, the list is precisely
(E1)--(E5): it includes all 1+4, 2+3, 3+2, and 4+1 mixed five-set
constraints, not merely the pairwise overlap caps. Claim 2 then proves
sufficiency. Thus a complete final binary edge completion, with Claim 3's
symmetry, is an exact finite B-first reduction, whereas its occupancy and
rational prefixes are necessary-condition relaxations only.

A rational edge rejection can be certified without an optimizer: write all
chosen inequalities as a_l dot z<=b_l, include the variable bounds and
both directions of equalities, and supply nonnegative rational multipliers
with sum_l lambda_l a_l=0 and sum_l lambda_l b_l<0. Summation gives the
impossible inequality 0<=-delta with delta>0. Clearing denominators makes a
finite integer check. No claim is made that every integral obstruction has
such a rational certificate at this relaxation level.

## Limits, failed shortcuts, and remaining hard regime

* Counting only induced row isomorphism types is invalid: F,H, mixed-anchor
  memberships and ball covers depend on actual masks and their overlaps.
  Repetitions must remain occurrences throughout the completion and quotient.
* The size-only one-exchange argument has no extra cap for centers 9 and 10.
  Its two inequalities genuinely do not fire there. Claim 7 supplies
  witness-dependent repairs, not a claim that the witnesses always exist.
* Merely summing all triangle and all I3 occupancies is not known to reject
  every B or every moderate-row domain. No universal numerical closure is
  claimed from those sums. Strong certificates need actual per-mask loads,
  mixed anchors, or covers. The number 352366 is an outer coverage premise,
  not a certificate that any one member has been eliminated.
* No certificate supplied here covers every actual mask of every B. Widely
  dispersed size-7..15 masks, especially size-9/10 neighborhoods lacking the
  robust fractional witnesses, may evade the small-ball capacities. They
  retain the full occupancy, degree, and higher mixed constraints. Domains
  with rows 16 or 17 are covered by Claims 1--2 and obey these inequalities,
  but this note does not purport to replace specialized large-row work.
* The rational edge stage is not exact unless its pair variables are integral.
  Passing it does not assert an A completion or an order-43 construction.
  Complete exhaustion or a universal covering certificate remains absent.
* No assertion uses the user-supplied x136 closure. Using it elsewhere would
  require explicitly retaining that premise pending integration.

## Author audit evidence

Only arithmetic was executed. A Python integer audit evaluated the one-exchange
size flags for center sizes 4..17 and obtained cap two exactly at
7,8,11,12,13,14,15,16 from the displayed size tests; it left 9,10 without
an additional size-only cap and gave cap three at 17. It checked the union
bounds 2*6-3=9, 3*8-2*3=18, and 2*6-2=10, and the size-resource thresholds
20+2*3=26 and 24+3*3=33. It checked the three degree identities in Claim 2
for 7848 integer parameter triples (q=0..35, E=0..108, b in {144,160});
these are arithmetic identities, not realizability checks or graph searches.
The coefficient derivations and all five-set cases are also proved above.
No project build, formatter, linter, test suite, or graph data was run.
These author checks are not independent review or accepted pruning authority.
