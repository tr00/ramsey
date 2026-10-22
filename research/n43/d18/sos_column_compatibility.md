<!-- sos-theory-integration:start -->
Integration status (2026-10-15): all 4 claims received independent
exact-revision acceptance in [the review](review_sos_column_compatibility_20261015_pivot.md) at reviewed-body
SHA-256 `cf63a76237207e9d7b3242b61744476a053cf087bc6e64d27d57c2cb9d266646`.
The reviewed body is preserved verbatim below; its ready labels are historical.
Current state: accepted local deductions on each exact premise chain.
Permitted use: conditional weighted/integer triple-coverage propagation and equality-anchor pair balance.
No complete x branch or order-43 case is closed. External premises are retained;
independent mathematical review is not a formal exhaustion certificate or novelty review.
See [the synthesis](../../reports/2026-10-15-sos-theory.md) and
[the manifest](sos_theory_manifest.json).
<!-- sos-theory-integration:end -->

# Dispersed triple witnesses and exact weighted Goodman positivity

Date: 2026-10-15. Author: Codex column-SOS agent.
Base revision: `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.
All claims below are ready for independent exact-revision review. No solver,
graph enumeration, download, installation, branch closure, or novelty claim.
The positivity identity is elementary weighted Goodman counting; the proposed
Ramsey use retains witnesses which can vary between triples.

## Scope and actual witnesses

Let G be an order-43 K5/I5-free graph, v any degree-18 pivot,
A=N(v), B=M(v), and C_y=N_A(y) for every actual occurrence y in B.
Thus A is K4/I5-free and may contain I4; B is K5/I4-free. No restriction on
x=e(A,B), q, E, small-column counts, or chosen complement orientation is
imposed in Claims 01--03.

Choose any specified subset S of the 24 occurrences. For a three-set
J={y,z,t} in S put

    K_J=C_y intersect C_z intersect C_t,
    D_J=A-(C_y union C_z union C_t).

An actual A edge in K_J forbids a B triangle on J: that edge and the
triangle would give K5. An actual independent A pair in D_J forbids a
B independent triple on J: that pair and the triple would give I5.
The named A anchors may differ for every J. There need not be one edge
cell and one omission cell containing the entire S.

A triangle can also be ruled out by any already proved B nonedge of J;
an independent triple can be ruled out by any already proved B edge of J.
Retain the justifications for such pairs, including inferred F*/H* pairs,
without identifying them with the original witness-defined F/H relations.

Call J *open* when at least one of its two monochromatic possibilities has
not been ruled out by the supplied sound witnesses/decisions. Let O be
the set of open triples. With just the two direct A tests, this means exactly

    J in O iff K_J is independent in A OR D_J is a clique in A.       (1)

Empty sets and singleton sets satisfy both properties. A may have I4,
so the first test means absence of an A edge, not absence of four vertices.
Extra proved prohibitions can only shrink O. In a partial state, every
membership and every witness used to remove a triple must be permanent;
the present note assumes actual columns, not speculative completed ones.

<a id="claim-sos-columns-weighted-goodman"></a>
## 01. Weighted triple coverage is constrained by a diagonal PSD identity

Claim ID: `research/n43/d18/sos_column_compatibility.md#claim-sos-columns-weighted-goodman`
Kind: local-deduction
Review state: accepted
Scope: setting above; any specified S; any nonnegative rational weights w_y;
any sound open-triple set O containing every monochromatic triple which
could occur in the candidate under the supplied prohibitions
Dependencies: K5/I5 prohibitions; weighted counting proved here
Conclusion: inequality (3), and its degree-interval refinement (4), hold
Search use: none pending independent review; proposed propagate
Reviews: [review](review_sos_column_compatibility_20261015_pivot.md)

Write

    W=sum_S w_y, D=sum_S w_y^2, T=sum_S w_y^3,
    d_y^w=sum_(z in S-{y}: yz edge in B) w_z,
    O_w=sum_(J in O) product_(y in J) w_y.

The weighted count M_w of all B triangles and B independent triples in S
satisfies the exact identity

    M_w=(W^3-6*W*D+5*T)/24
        +(1/2)*sum_(y in S) w_y*(d_y^w-(W-w_y)/2)^2.                (2)

Consequently,

    (W^3-6*W*D+5*T)/24
      +(1/2)*sum_y w_y*(d_y^w-(W-w_y)/2)^2 <= O_w.                 (3)

If applicable rational intervals l_y<=d_y^w<=u_y have independently
been proved, let delta_y be the distance of (W-w_y)/2 from [l_y,u_y].
Then the explicit, completion-independent necessary condition is

    (W^3-6*W*D+5*T)/24 +(1/2)*sum_y w_y*delta_y^2 <= O_w.          (4)

Proof. The total weight of all distinct triples is

    e3(w)=(W^3-3*W*D+2*T)/6.

For each y, the quantity w_y*d_y^w*(W-w_y-d_y^w) counts triples with
one edge and one nonedge incident to y, with their triple weights.
Every nonmonochromatic triple has exactly two such vertices. Hence

    M_w=e3(w)-(1/2)*sum_y w_y*d_y^w*(W-w_y-d_y^w).

Completing each square and using

    sum_y w_y*(W-w_y)^2=W^3-2*W*D+T

gives (2). Every monochromatic triple belongs to O and contributes at
most its triple weight, proving M_w<=O_w and (3). Distance from the
interval gives (4). Zero weights and empty S cause no difficulty.

The squared expression in (2) has a diagonal Gram matrix with entries
w_y/2, all rational and nonnegative. Thus its positivity needs no SDP
optimizer or eigenvalue calculation. It is degree two in the B edge
indicators. The witness prohibitions themselves can have degree three
in those indicators: this is not a claim of a degree-two refutation in
every polynomial encoding of the full Ramsey problem.

For a triple with edge bits a,b,c, its monochromatic indicator satisfies
on Boolean assignments

    abc+(1-a)*(1-b)*(1-c)
       =1-((a-b)^2+(a-c)^2+(b-c)^2)/2.                            (5)

This independently verifies that the contribution of each open triple
is at most one and that cubic terms cancel. Equation (2) then expresses
a global incompatibility among many such local squared differences.

Weighted intervals are directly available from forced pairs: the lower
endpoint includes the weight of known S-neighbors, and the upper endpoint
excludes known S-nonneighbors. Further applicable degree/cell constraints
can tighten them. No optimizer is required to check any supplied weights,
intervals, triple witnesses, and rational violation of (4).

<a id="claim-sos-columns-integer-goodman"></a>
## 02. Six columns require at least two open triples

Claim ID: `research/n43/d18/sos_column_compatibility.md#claim-sos-columns-integer-goodman`
Kind: local-deduction
Review state: accepted
Scope: preceding setting; uniform weights on n distinct occurrences;
actual/partial internal degree intervals with integral endpoints
Dependencies: Claim01; integer internal degrees; handshake parity
Conclusion: equations (6)--(8); in particular six columns with |O|<=1
are incompatible
Search use: none pending independent review; proposed propagate
Reviews: [review](review_sos_column_compatibility_20261015_pivot.md)

With d_y=d_(B[S])(y), equation (2) becomes

    M=n*(n-1)*(n-5)/24 +(1/2)*sum_y (d_y-(n-1)/2)^2.              (6)

For a supplied allowed integer interval [l_y,u_y], let delta_y^Z be the
distance from (n-1)/2 to its allowed integers. Then

    |O| >= ceil(n*(n-1)*(n-5)/24
                 +(1/2)*sum_y (delta_y^Z)^2).                    (7)

In the absence of any extra degree restrictions this gives the following
explicit necessary open-triple counts:

| n | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 24 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Minimum | 0 | 2 | 4 | 8 | 12 | 20 | 28 | 40 | 440 |

For even n each integer degree is at distance at least 1/2, so

    |O| >= n*(n-2)*(n-4)/24.                                    (8)

For n=3 mod4, the central degree (n-1)/2 is odd. All n degrees cannot
equal it because the degree sum is even; hence the squared sum in (6)
is at least one. For n=1 mod4, nonnegativity suffices. These arguments
give the displayed odd-order rows, with ceiling if necessary.

For n=6 the constant term is 5/4; six half-integral degree deviations
contribute at least 3/4, so M>=2. Thus at least two triples must remain
open. This improves the elementary no-monochromatic-triangle-on-six
argument, which alone requires only one open triple. For example a
supplied six-column family in which nineteen of its twenty triples have
both kinds of actual A witnesses is impossible. No B pair needs to be
forced individually by these hypotheses. This example is a conditional
rejected predicate, not a claimed realized column family.

At n=5 and O empty, (6) forces every degree to be two; no triangles and
no independent triples then give a C5. This recovers the existing fixed
(3,3)-cell boundary, now also for a set with varying triple witnesses.

The proof is (6), termwise minimization over allowed integer degrees,
and rounding because |O| is an integer. Handshake parity is used only
where stated. A positive lower bound on a squared deviation is justified
by a degree restriction; a pseudoexpectation alone is not assumed to
respect integer-valued aggregate degrees.

<a id="claim-sos-columns-profile-coverage"></a>
## 03. Whole-interface triple coverage depends on column sizes and B edges

Claim ID: `research/n43/d18/sos_column_compatibility.md#claim-sos-columns-profile-coverage`
Kind: local-deduction
Review state: accepted
Scope: all 24 actual columns of any degree-18 pivot; c_y=|C_y|;
b=e(B); O defined by (1), or any sound smaller open-triple set
Dependencies: Claims01--02; inherited global degree range 18..24
Conclusion: inequalities (9)--(10); the frontier corollary below
Search use: none pending independent review; proposed propagate
Reviews: [review](review_sos_column_compatibility_20261015_pivot.md)

Put

    tau_y=max(0,6-c_y,c_y-13).

Then

    |O| >= 440+sum_(y in B) tau_y*(tau_y+1)/2.                    (9)

There is also the independent degree-sum bound

    |O| >= ceil(437+(b-138)^2/12).                               (10)

Proof. Globally d_B(y)=d_G(y)-c_y, so it lies in the integer interval
[18-c_y,24-c_y] intersect [0,23]. Its distance from 23/2 is at least
tau_y+1/2: columns of size <=6 have d_B>=12+(6-c_y); columns of size
>=13 have d_B<=11-(c_y-13); and sizes 7..12 retain the universal
half-integer distance. Empty intersections would already be a degree
contradiction. For n=24 the constant in (6) is 437. Hence

    |O| >= 437+(1/2)*sum_y (tau_y+1/2)^2
          =440+sum_y tau_y*(tau_y+1)/2,

which proves (9). Separately sum_y(d_B(y)-23/2)=2b-276. The identity

    sum_y a_y^2-(sum_y a_y)^2/24
       =(1/24)*sum_(y<z) (a_y-a_z)^2 >=0

with a_y=d_B(y)-23/2 gives (10). This too is an exact SOS inequality.
Both (9) and (10) must hold; neither is asserted to dominate the other.

At x=136, the independently reviewed frontier theorem supplies no
size-four columns, s=8..10 size-five columns, and total excess above
size six H=s-8<=2. Thus all other columns have size 6..8 and (9) reads

    |O|>=440+s>=448.

For a proposed complete equality interface, rejection therefore follows
if fewer than 440+s of its 2024 column triples remain open. This is a
necessary triple-coverage condition, not proof that it is violated in
every interface. The formulation and (9) remain valid above the frontier,
including columns smaller than four when no transversal bound applies.

For a specified subfamily of order n, the corresponding unweighted
degree interval is

    max(0,n-6-c_y) <= d_S(y) <= min(n-1,24-c_y).

The lower endpoint follows by subtracting at most 24-n outside neighbors
from d_B(y)>=18-c_y. Known outside pairs, fixed global degrees, and
cell bounds can improve the endpoints before applying (7).

<a id="claim-sos-columns-anchor-first-moment"></a>
## 04. The equality anchor's first incidence Gram has no additional force

Claim ID: `research/n43/d18/sos_column_compatibility.md#claim-sos-columns-anchor-first-moment`
Kind: local-deduction
Review state: accepted
Scope: x=136, and an independent four-set I={a1,a2,a3,a4} supplied by
the reviewed degree-eight-anchor theorem
Dependencies: exact twelve singleton/twelve double signatures; each
anchor vertex occurs in six double signatures
Conclusion: opposite pair multiplicities agree; the centered incidence
Gram is PSD exactly when the three independent multiplicities are nonnegative
Search use: none pending independent review; proposed propagate pair
balance; remaining observation is a limitation of this chosen relaxation
Reviews: [review](review_sos_column_compatibility_20261015_pivot.md)

Let p_ij count double signatures {ai,aj}. The four equations
sum_(j!=i)p_ij=6 imply

    p12=p34=a, p13=p24=b, p14=p23=c, a+b+c=6.                     (11)

For example subtracting the row sums for 3,4 from those for 1,2 gives
2*(p12-p34)=0; the other two equalities follow by relabeling. All
counts are nonnegative integers, and repeated complete columns are not
identified with these repeated anchor signatures.

For each of the twelve double occurrences y let z_y in R^4 have entry
+1 on its two present anchor vertices and -1 on its two omitted vertices.
Its incidence Gram Q=sum_y z_y*z_y^T has diagonal entries 12 and
off-diagonal Q_ij=4*p_ij-12. The four mutually orthogonal vectors

    (1,1,1,1), (1,1,-1,-1), (1,-1,1,-1), (1,-1,-1,1)

are eigenvectors, with eigenvalues respectively 0, 8a, 8b, 8c.
Thus PSD of this first-degree rooted incidence Gram adds nothing to
(11) and nonnegativity. This is a precise limitation of that single
matrix, not a barrier to higher moments or Gram matrices using B
adjacency. It motivates Claims01--03, which retain actual triple
overlap/omission witnesses and completion degree restrictions.

## Author audit, scope, and future use

The weighted counting was independently re-expanded using the power sums
W,D,T and using the three-bit identity (5). Uniform weights at n=2,3
give zero possible minimum; complete and empty graphs give e3(w),
providing small-instance algebra checks without graph enumeration.
The order-six correction explicitly retains degree integrality. The
whole-B intervals were checked on column sizes 5,6,7,13,14, yielding
respectively excesses 1,0,0,0,1 above 440; they do not transfer an I4
prohibition to A. The Gram eigenvectors/eigenvalues were multiplied
directly and compared to its trace 48=8*(a+b+c).

These are conditional propagation tools on specified actual columns,
not generation completeness or branch closure. Failure to find weights
or a violation supplies no evidence of nonexistence. Fixed cells are
covered by existing tools; the distinct intended use is dispersed,
varying edge/independent-pair witnesses and a small number of open
triples. Witness discovery is a later task; no search engine/checker
has been implemented. All checks in this section are author self-checks,
not independent acceptance.

Dependencies: [weighted averaging](weighted_averaging.md),
[anchored cells](anchored_cell_averaging.md),
[overlapping-cell summary](overlapping_cells.md),
[frontier anchor](x136/five_column_compatibility.md), and
[baseline degree range](../../../docs/mathematical_baseline.md).
No novelty review has been performed.
