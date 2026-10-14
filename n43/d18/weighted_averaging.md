# Weighted averaging for the degree-18 interface

Date: 2026-10-14. Author: Codex weighted-averaging task.
Input HEAD: `49bd3637b8e6763ac6fbd3bd5c267155b0f1cb27`.
Pure mathematical development; no graph enumeration, solver, download, or
installation. All claims below are author-audited, **not independently reviewed**.
No novelty claim or branch closure is made.

## Setting and distinction from random constructions

G is an order-43 K5/I5-free candidate, v is any degree-18 vertex,
A=N(v) has order 18 and is K4/I5-free; B=M(v) has order 24 and is
K5/I4-free. Put q=85-e(A), epsilon_u=d_G(u)-18, E=sum_A epsilon_u,
and C_y=N_A(y). The inherited census and degree bounds give
0<=q<=35, 0<=epsilon_u<=6, and x=136+2q+E.

Erdos's first-moment construction argument cannot by itself prove
nonexistence. Here the random objects are orders or anchors inside a
hypothetical candidate. Their expected incidences must respect deterministic
Ramsey caps. Violating such a cap is a necessary-condition contradiction.
The tools apply to x>=143 as well as the frontier; none assumes q<=2.

## Weighted independent anchors give explicit excess certificates

<a id="claim-weighted-anchor-excess"></a>
Claim ID: `n43/d18/weighted_averaging.md#claim-weighted-anchor-excess`
Kind: local-deduction
Review state: ready
Scope: setting above; any nonnegative rational weights lambda_I on actual
independent four-sets I of A, with m_u=sum_(I containing u)lambda_I<=1
Dependencies: inherited degree/excess identity; K5/I5 prohibitions
Conclusion: writing d_A(I)=sum_(u in I)d_A(u),
E>=sum_I lambda_I (d_A(I)-32);
x>=136+2q+ceil(sum_I lambda_I (d_A(I)-32))
Search use: none pending independent review; proposed propagate
Reviews: none

Proof. Every C_y meets I. Vertices y with C_y intersect I={u} form a
clique: two nonadjacent such vertices plus I-{u} would give I5. Each
singleton class has at most three vertices, since four together with u
would give K5. At most twelve columns have singleton signatures; all
others have at least two incidences. Thus e(I,B)>=36. The vertexwise
identity r_u=|N_B(u)|=17+epsilon_u-d_A(u) gives

    sum_(u in I)epsilon_u >= sum_(u in I)d_A(u)-32.

Multiply by lambda_I and sum. The left side is sum_u m_u epsilon_u<=E
because epsilon_u>=0 and m_u<=1. Round the right side upward since E
is integral. This proves both conclusions.

For clarity define the finite certificate value

    L(A)=max { sum_I lambda_I (d_A(I)-32):
                lambda_I>=0, sum_(I containing u)lambda_I<=1 for all u }.

The zero weighting is allowed, so L(A)>=0. Any feasible rational weighting
is already a checkable certificate; no optimizer or solver is required.
Negative-payoff anchors can be omitted. Then E>=ceil(L(A)) and
x>=136+2q+ceil(L(A)). Retaining actual epsilon_u permits the stronger
unaggregated inequalities sum_I epsilon_u>=d_A(I)-32.

A directly evaluable family certificate: if m chosen actual anchors have
maximum vertex multiplicity t>0 and total degree sum D, assigning each
weight 1/t gives E>=ceil((D-32m)/t). Example **conditional arithmetic,
not a realized graph**: four disjoint anchors each of degree sum at least
40 imply E>=32 and x>=168+2q. A single anchor of degree sum 40 already
implies E>=8, excluding x<=143 when q=0. In general a proposed x-profile
fails if D>32m+t*(x-136-2q). These tests can constrain low excess even
when q is large and x is well above 142.

This is a weighted strengthening of the existing anchor bounds, not a
proof that L(A) is uniformly large. In particular it does not revive the
rejected universal fractional-perfect-anchor assumption in reduction
index Section 13.2. No covering existence is assumed.

## Random orders test simultaneous column compatibility

Construct two graphs on the 24 column occurrences (repetitions retained):
F contains yz when A-(C_y union C_z) contains I3; H contains yz when
A[C_y intersect C_z] contains K3. Then F edges must be B edges, and H
edges must be B nonedges. A pair in both is an immediate contradiction.
These exact pair rules already appear in the symmetry-generation note.
A cheap sufficient F test is |C_y union C_z|<10, using R(4,3)=9;
the exact induced-graph test is at least as strong.

<a id="claim-weighted-random-order"></a>
Claim ID: `n43/d18/weighted_averaging.md#claim-weighted-random-order`
Kind: local-deduction
Review state: ready
Scope: every proposed actual column multiset in the setting above; every
nonempty subset S of occurrences and positive rational weights w_y on S
Dependencies: exact pair rules; B has no K5 and no I4
Conclusion: the following two inequalities must hold
Search use: none pending independent review; proposed propagate
Reviews: none

    sum_(y in S) w_y / (w_y+sum_(z in S-{y}: yz not in F) w_z) <=4,
    sum_(y in S) w_y / (w_y+sum_(z in S-{y}: yz not in H) w_z) <=3.

Proof. For any graph J, give vertex y an independent exponential clock
of rate w_y, and select y if its clock precedes every neighbor's clock.
Adjacent vertices cannot both be selected. The probability y is selected
is w_y/(w_y+sum_(z in N_J(y))w_z), obtained by integrating
w_y exp(-(w_y+sum_N w_z)t) over t>=0. Linearity of expectation therefore
bounds the displayed sum by alpha(J).

Apply this to J=complement(F[S]). An independent set in J is a clique
in F[S], hence in B, of size at most four. Apply it to
J=complement(H[S]): a clique in H is an independent set in B, of size
at most three. No independence between selection indicators is needed.
There is no transfer of B's I4 prohibition to A.

Uniform weights yield the particularly simple rational filters

    sum_(y in S) 1/(|S|-d_(F[S])(y)) <=4,
    sum_(y in S) 1/(|S|-d_(H[S])(y)) <=3.

For all 24 columns these imply e(F)<=216 and e(H)<=192 by
Cauchy-Schwarz; however the displayed degree-sensitive inequalities are
stronger tests than those total edge bounds. Apply to selected subsets
and nonuniform weights when concentration is hidden by other columns.
Example **abstract filter arithmetic, not a Ramsey construction**:
on 24 occurrences an H degree list consisting of three vertices of degree
22 and twenty-one of degree 14 would have 180 edges, below 192, but the
sum is 3/2+21/10=18/5>3, so it is incompatible. This is a conditional
rejection of any proposed H having that list, irrespective of whether
such an H arose in a particular branch.

## How to use these in the less constrained regime

1. For a chosen A, retain actual I4 anchors and their degree sums. A small
   explicitly weighted family can certify a minimum E, hence a minimum x.
   In the range 143..155 this can work even when q>2 and four-transversal
   premises are unavailable. Compare the certificate with E=x-136-2q.
2. For partial column families, form F and H on the occurrences already
   fixed. The inequalities on that subset require no knowledge of the
   remaining columns or completion of B. A rational violation is a small
   mathematical rejection certificate. No random sampling is needed.
3. For surviving families, retain higher-order mixed constraints: an
   independent B triple requires its residual A set to be a clique of size
   at most three, and a B triangle requires its common A set to be
   independent of size at most four. Pairwise filters do not enforce these.

The first test is sensitive to A; the second to actual multiple columns.
There is presently no proved uniform positive L(A) for all permitted A,
and no proved violation of the random-order inequalities in every x>=143
configuration. These are new documented necessary-condition tools, not
an exclusion of the residual branch or a construction.

## Author audit

The anchor inequality was rederived from cross incidences and separately
from the degree identity. The weighted step uses a packing capacity <=1,
not equality, and nonnegative excess is essential. The two random-order
bounds were checked by complementing F/H separately and by integrating
the clock probabilities; their caps are respectively four and three.
The uniform edge consequences use sum 1/a>=n^2/sum a, with
sum a=n^2-2e, giving e<=3n^2/8 and e<=n^2/3. Rational examples were
checked directly. This is an author's self-check, not independent review.
Dependencies: [frontier budgets](frontier_band.md),
[small-column anchor proof](x136/small_columns.md),
[exact pair rules](symmetry_reduction.md), and
[failed perfect-design warning](../reductions.md#132-fractional-perfect-anchor-designs).
