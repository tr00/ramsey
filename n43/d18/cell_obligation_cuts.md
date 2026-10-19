# Simultaneous cell obligations and attachment cuts

Date: 2026-10-15. Author: Codex cell-obligations agent.

Integration status (2026-10-15): all 4 mathematical claims below have
independent exact-revision acceptance; see [the review](review_cell_obligation_cuts_20261015_intersections.md).
The reviewed proof body and its historical author-stage labels are preserved.
This banner resolves their current status: conditional propagation is accepted
on the stated hypotheses; certificate implementation remains a draft design.
Reviewed and integrated hashes are recorded in
[the cell integration manifest](overlapping_cells_manifest.json).
All claims are self-audited drafts pending independent exact-revision review.
No novelty claim, solver, enumeration, installation, or download. These are
necessary-condition reductions for specified actual cells; no order-43 branch
is excluded and no obligation pattern is asserted to occur universally.

## Setting and obligations

Let G be K5/I5-free on 43 vertices, let d_G(v)=18, and put
A=N(v), B=M(v). Thus A is K4/I5-free and B is K5/I4-free.
Occurrences y in B have actual columns C_y=N_A(y), including repetitions.
For an edge Q of A and an independent pair P of A define

    T_Q={y in B: Q subset C_y},
    U_P={y in B: C_y intersect P is empty}.

The accepted [cell-type and closure claims](anchored_cell_averaging.md)
give T_Q type (3,4), U_P type (5,3), and T_Q intersect U_P type
(3,3). If Q intersects P the intersection is empty. No value of x or
neighborhood census assumption is imposed here.

Retain separately forced B edges F* and forced B nonedges H*; neither
inferred relation is identified with the original witness-defined F or H.
Every undecided pair e has indicator z_e=1 for a B edge and z_e=0 for a
B nonedge. All set memberships used by a cut are actual memberships, or
memberships proved permanent in a partial state. Missing future cell
memberships cannot be replaced by a completed-cell assumption.

An edge obligation is a proved inequality sum_e a_e z_e >= L with a_e>=0;
a nonedge obligation is sum_e b_e(1-z_e) >= M with b_e>=0. Upper capacity
inequalities have the analogous <= form. Subtract the contribution of
forced pairs before writing an inequality on undecided pairs. Useful inputs
include the accepted cell edge budgets, vertex degree intervals, and:

* If three occurrences lie in U_P, at least one of their pairs is an edge.
* If three occurrences lie in T_Q, at least one of their pairs is a nonedge.
* Every vertex in T_Q has at most three T_Q neighbors: those neighbors
  are independent, and T_Q has no I4.
* Every vertex in U_P has at most four U_P nonneighbors: those
  nonneighbors form a clique, and U_P has no K5.

The last two bounds hold at every cell size, not only at saturation.

<a id="claim-cell-signed-cut"></a>
## A rational signed cut combines overlapping supports

Claim ID: `n43/d18/cell_obligation_cuts.md#claim-cell-signed-cut`
Kind: local-deduction
Review state: accepted
Scope: any finite undecided-pair set D; every stated family of proved
edge/nonedge lower obligations and upper capacities on D
Dependencies: elementary linear inequalities; each supplied obligation must
independently have applicable hypotheses
Conclusion: the signed demand inequality below is necessary; its strict
failure is an exact finite infeasibility certificate
Search use: none pending independent review; proposed propagate
Reviews: [review](review_cell_obligation_cuts_20261015_intersections.md)

Write edge and nonedge lower obligations as

    sum_e a_je z_e >= L_j,
    sum_e b_ke(1-z_e) >= M_k,

and edge and nonedge upper capacities as

    sum_e c_le z_e <= H_l,
    sum_e d_me(1-z_e) <= J_m.

All four coefficient families are nonnegative rationals. Choose any
nonnegative rational multipliers lambda_j, mu_k, nu_l, xi_m, and put

    alpha_e=sum_j lambda_j a_je - sum_l nu_l c_le,
    beta_e =sum_k mu_k b_ke   - sum_m xi_m d_me,
    V=sum_j lambda_j L_j + sum_k mu_k M_k
      -sum_l nu_l H_l -sum_m xi_m J_m.

Then necessarily

    V <= sum_(e in D) max(alpha_e,beta_e).                 (1)

Proof. Multiply every supplied lower inequality by its multiplier, and
subtract every multiplied upper inequality. This gives

    V <= sum_e [alpha_e z_e+beta_e(1-z_e)].

For either z_e=0 or z_e=1, its summand is at most
max(alpha_e,beta_e). This proves (1). The same bound holds for
0<=z_e<=1. Negative alpha_e or beta_e are allowed; their definitions,
not their signs, determine the valid subtraction. Empty families and D
empty are allowed. Rational denominators can be cleared by multiplication
by one common positive integer, giving a certificate using integer addition
and comparisons only.

For lower obligations alone, (1) reads

    sum_j lambda_j L_j+sum_k mu_k M_k
      <=sum_e max(sum_j lambda_j a_je, sum_k mu_k b_ke).

Thus edge and nonedge obligations on the same pairs compete for their
single binary choice. Counting supports independently loses precisely this
competition. A successful cut certifies only its supplied partial state;
failure to find multipliers proves nothing about feasibility.

<a id="claim-cell-overlap-degree-cut"></a>
## An intersection retains both degree demands

Claim ID: `n43/d18/cell_obligation_cuts.md#claim-cell-overlap-degree-cut`
Kind: local-deduction
Review state: accepted
Scope: actual T=T_Q, U=U_P, S=T intersect U; every a in S; independently
proved intervals l_Z<=d_Z(a)<=u_Z for Z=T,U,S,W=T union U
Dependencies: cell types and degree bounds in
`anchored_cell_averaging.md#claim-cell-saturation`; exact set inclusion
Conclusion: interval (2) for d_S(a), and union-degree interval (3)
Search use: none pending independent review; proposed propagate
Reviews: [review](review_cell_obligation_cuts_20261015_intersections.md)

The following intervals are necessary:

    max(l_S,l_T+l_U-u_W) <= d_S(a)
      <=min(u_S,u_T+u_U-l_W),                              (2)

    l_T+l_U-u_S <= d_W(a) <= u_T+u_U-l_S.                 (3)

Proof. Neighbors of a in S are counted twice by d_T(a)+d_U(a),
while all other W-neighbors are counted once. Hence exactly

    d_W(a)=d_T(a)+d_U(a)-d_S(a).

Solve for each quantity and use the stated intervals. Either resulting
empty interval rejects the partial state. This is an intersection cut,
not a sum of independent degree checks.

For any actual Z containing a, |Z|=m and c=|C_a|, global degree bounds
18<=d_G(a)<=24 imply

    max(0,m-6-c) <= d_Z(a) <= min(m-1,24-c).

This follows from d_G(a)=c+d_B(a) and at most 24-m outside-Z
neighbors. Intersect these intervals with the applicable Ramsey intervals
and use them for W even when W has no stronger anchored-cell type.
With known outside-Z pairs, let f_out,h_out be the counts of forced
outside-Z neighbors and nonneighbors. Replace the global contribution by

    max(0,18-c-(24-m-h_out)) <= d_Z(a)
      <=min(m-1,24-c-f_out).

These endpoints can be tightened further when d_G(a) is fixed. If only
a subset of a final cell is retained, |Z| and its outside counts must refer
to that specified actual subset.

<a id="claim-cell-star-cover-cut"></a>
## Dispersed triple witnesses force a vertex-cover demand

Claim ID: `n43/d18/cell_obligation_cuts.md#claim-cell-star-cover-cut`
Kind: local-deduction
Review state: accepted
Scope: the two actual-cell patterns below; witness anchors may vary from
one leaf pair to another; all leaves are distinct occurrences and differ
from the center
Dependencies: cell triple obligations; elementary weighted counting;
universal T-neighbor and U-nonneighbor capacities proved above
Conclusion: any fractional matching of total weight greater than the
remaining attachment capacity rejects the pattern
Search use: none pending independent review; proposed propagate
Reviews: [review](review_cell_obligation_cuts_20261015_intersections.md)

First choose an edge cell T=T_Q and center a in T. Let b_1,...,b_n
be leaves in T whose pairs with a remain undecided. After all other forced
T-neighbors of a have been retained, suppose at most h of these leaves
can be adjacent to a. In particular h=3-f is sound when f is the number
of its forced T-neighbors outside these leaves; stronger applicable
degree intervals may reduce h.

Define a graph H on the leaf indices. An edge ij of H must have both:

1. b_i b_j is a forced B nonedge;
2. there is a named independent pair P_ij of A for which
   a,b_i,b_j all lie in U_(P_ij).

Writing z_i=1[ab_i is a B edge], the no-I3 condition in that named
omission cell gives

    z_i+z_j>=1  for ij in E(H),
    sum_i z_i<=h.                                        (4)

Thus the set of adjacent leaves is a vertex cover of H. More generally,
let rational lambda_ij>=0 satisfy

    sum_(j:ij in E(H)) lambda_ij<=1  for every i.

Multiplying (4) by lambda and summing gives

    sum_(ij in E(H)) lambda_ij <= sum_i z_i <= h.          (5)

Indeed each z_i is nonnegative and appears with coefficient at most one.
Since sum_i z_i is integral, it is at least the ceiling of the left side.
This proves the fractional-matching cut. The exact stronger statement is
tau(H)<=h, where tau denotes minimum vertex-cover size; evaluating tau
is not needed to check a supplied certificate (5).

The dual pattern chooses an omission cell U=U_P and center a in U,
uses leaves b_i in U with undecided pairs to a, and gives them a remaining
capacity h for nonneighbors. One may take h=4-f where f counts its
forced U-nonneighbors outside the leaves. A leaf edge ij of H now requires
b_i b_j to be a forced B edge and a,b_i,b_j to share some named edge
cell T_(Q_ij). Set z_i=1[ab_i is a B nonedge]. The no-triangle condition
in that named containing cell proves exactly (4) and (5). This derivation
does not exchange the ambient independence caps of A and B.

The varying anchors are essential to the coverage statement: no common
independent pair P for the whole first pattern, or common edge Q for the
whole dual pattern, is assumed. Each triple implication has its own
checkable anchor witness. All newly implied pairs enter F* or H*, with
no assertion of membership in the original F or H.

<a id="claim-cell-odd-cycle-certificates"></a>
## Small explicit attachment certificates

Claim ID: `n43/d18/cell_obligation_cuts.md#claim-cell-odd-cycle-certificates`
Kind: local-deduction
Review state: accepted
Scope: a pattern of the preceding claim, with integer remaining capacity
h>=1, whose obligation graph H contains a cycle on 2h+1 distinct leaves
Dependencies: preceding vertex-cover cut
Conclusion: the pattern is infeasible; the certificate consists of the
2h+1 witnessed triple inequalities and one vertex capacity inequality
Search use: none pending independent review; proposed propagate
Reviews: [review](review_cell_obligation_cuts_20261015_intersections.md)

Put lambda=1/2 on the cycle edges and zero on all other edges. Every
cycle vertex has incident lambda-weight one, while total lambda is
(2h+1)/2>h. Equivalently, simply add the 2h+1 inequalities in (4):

    2*sum_(cycle leaves i) z_i >= 2h+1,
    2*sum_(cycle leaves i) z_i <= 2h.

These contradictory integer inequalities are a complete local certificate.
For h=0 a single witnessed leaf pair already supplies a contradiction.
Additional leaves, chords, or witnesses outside the cycle do not change
the argument. Chords among leaves are not required to have either value.

In a containing edge cell, universal h<=3 yields the following examples:

| Forced neighbors outside the cycle | Remaining upper capacity h | Rejected obligation cycle |
| --- | --- | --- |
| 0 | 3 | 7 leaves |
| 1 | 2 | 5 leaves |
| 2 | 1 | 3 leaves |
| 3 | 0 | One leaf pair |

The dual omission-cell table is h<=4: with respectively 0,1,2,3 forced
nonneighbors outside the cycle, cycles on respectively 9,7,5,3 leaves
are rejected; four such forced nonneighbors reject one witnessed leaf pair.
Each leaf-pair obligation still needs its actual opposite pair value and
its named cell witness. These tables assert conditional exclusions only.

## Certificate design and self-audit

Kind: design; review state: draft; search use: none.
Suggested certificate data are: the actual center/leaf occurrences and
anchor sets, the relevant known B pairs, the proved capacity with all
forced-pair contributions, and rational multipliers for the listed
inequalities. A verifier can check these data by set containment,
A-edge/nonedge inspection, known-pair lookup, and integer arithmetic.
This describes a future local certificate format, not an implemented
checker or complete exhaustion procedure.

Self-audit checks: the signed cut subtracts upper capacities, permitting
negative pair coefficients, and maximizes each pair independently only
after subtraction. Inclusion-exclusion uses degree counts at a vertex
inside both cells; outside vertices are not assigned their cell's anchored
type. The graph H records witness obligations rather than a new B graph.
Leaf forced pairs are excluded from the undecided star, while forced
neighbors/nonneighbors outside the star consume the corresponding capacity.
The odd-cycle proof uses distinct leaves and counts each exactly twice.
The universal capacities use only T's triangle prohibition and I4 bound,
and U's I3 prohibition and K5 bound; A is allowed to contain I4.
None of the cuts proves that the necessary pattern occurs in every
order-43 candidate, nor that states surviving all cuts are completable.
