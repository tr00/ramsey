<!-- sos-theory-integration:start -->
Integration status (2026-10-15): all 3 claims received independent
exact-revision acceptance in [the review](review_sos_obligation_graphs_20261015_columns.md) at reviewed-body
SHA-256 `378cc12352d4c1fa208d12dc6c8f4640d17b6a4a28dec976399e6a9de4a24d68`.
The reviewed body is preserved verbatim below; its ready labels are historical.
Current state: accepted local deductions on each exact premise chain.
Permitted use: conditional witnessed-star propagation and rejection for every x.
No complete x branch or order-43 case is closed. External premises are retained;
independent mathematical review is not a formal exhaustion certificate or novelty review.
See [the synthesis](../../reports/2026-10-15-sos-theory.md) and
[the manifest](sos_theory_manifest.json).
<!-- sos-theory-integration:end -->

# Rational SOS certificates for dispersed attachment obligations

Date: 2026-10-15. Task: sos-theory-20261015. Author: Codex coordinator.
Base revision: `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.
Theory only; no solver, graph enumeration, downloads or installation.
No novelty or order-43 branch closure is claimed.

## Actual Ramsey scope

Let G be an order-43 K5/I5-free graph, v any degree-18 pivot,
A=N(v), B=M(v). A is K4/I5-free and may contain I4; B is K5/I4-free.
There is no extra restriction on x, q, excess or root selection.
For an actual independent A pair P, write
U_P={y in B:C_y intersects P in the empty set}. This cell is K5/I3-free.
For an actual A edge Q, write T_Q={y in B:Q subset C_y}; this is
K3/I4-free. The established cell types and dispersed-star construction
are in [cell obligations](cell_obligation_cuts.md#claim-cell-star-cover-cut)
and [anchored cells](anchored_cell_averaging.md).

A center a in U_P has at most four nonneighbors within U_P: those
nonneighbors form a clique because U_P has no I3, and a five-clique is
forbidden. Subtract all already forced nonneighbors outside a specified
undecided leaf set. If h is a sound remaining nonneighbor capacity, h<=4.
For leaves b_i in U_P, an obligation edge ij requires b_i b_j to be a
known B edge and a,b_i,b_j to share a named containing cell T_(Q_ij).
Its no-triangle constraint implies at least one of ab_i,ab_j is a nonedge.
The anchor Q_ij may vary by pair. Thus z_i=1[ab_i is a nonedge] satisfies
z_i+z_j>=1 on the obligation graph H, and sum z_i<=h. With t_i=1-z_i,
the unchosen leaves form an independent set of H. The dual containing-cell
construction also applies, using h<=3 neighbor capacity and omission-pair
witnesses. H records witnessed obligations, not the graph induced on B.

<a id="claim-sos-obligation-general"></a>
## 1. General quadratic certificate transfer

Claim ID: `research/n43/d18/sos_obligation_graphs.md#claim-sos-obligation-general`
Kind: local-deduction
Review state: accepted
Scope: either witnessed star pattern above; any graph H on n distinct
leaves, any rational U and rational PSD matrix M satisfying the affine identity below
Dependencies: accepted dispersed-star construction; exact PSD positivity
Conclusion: the supplied identity bounds alpha(H)<=floor(U); if
n-h>U the actual partial Ramsey state has no completion
Search use: none pending independent review; proposed conditional propagate
Reviews: [review](review_sos_obligation_graphs_20261015_columns.md)

Suppose there are rational coefficients a_i, c_ij and a rational PSD M
such that the polynomial identity

    U-sum_i t_i = (1,t)^T M (1,t) + sum_i a_i(t_i^2-t_i)
                           + sum_(ij edge H) c_ij t_i t_j

holds. On every independent-set indicator t the equality and edge terms
vanish, so sum t_i<=U. Every completion of the witnessed star has such
an indicator with sum t_i=n-sum z_i>=n-h. A strict violation rejects.
One can equivalently use any SOS polynomial in place of t^T M t and
arbitrary equality multipliers; this elementary transfer does not require
finding an optimum, or identifying a theta hierarchy convention.
An exact supplied factorization/positivity proof and polynomial expansion
are the certificate. Failure to supply one says nothing about completion.

## An explicit eight-leaf graph

Index eight leaves by 0,...,7 modulo8. Let H contain the eight cycle edges
{i,i+1} and four opposite edges {i,i+4}, 0<=i<=3. Additional obligation
edges are permitted. This is the cubic Wagner graph (Mobius ladder M8).
We derive a rational degree-two positivity certificate without appealing
to a numerical eigenvalue computation or a graph catalogue.

<a id="claim-sos-obligation-wagner"></a>
## 2. Rational centered SOS proves alpha(H)<=3

Claim ID: `research/n43/d18/sos_obligation_graphs.md#claim-sos-obligation-wagner`
Kind: local-deduction
Review state: accepted
Scope: the explicitly specified eight-vertex H; every independent-set indicator t
Dependencies: the explicit rational matrix identity proved here
Conclusion: sum t_i<=40/11, hence alpha(H)<=3
Search use: none pending independent review; proposed conditional propagate
Reviews: [review](review_sos_obligation_graphs_20261015_columns.md)

Let K be H's adjacency matrix, and M=K+(5/2)I. We first prove M is
positive definite by an explicit sum of positively weighted squares.
For any vector u put y_i=u_i+u_(i+4), z_i=u_i-u_(i+4), 0<=i<=3.
Let C be the adjacency matrix of the cycle 0-1-2-3-0. Let D have the
same entries except that D_03=D_30=-1. Direct multiplication gives D^2=2I.
Splitting opposite pairs in the cycle and matching gives exactly

    u^T M u = (1/2)[ y^T((7/2)I+C)y + z^T((3/2)I+D)z ].

The two forms on the right have rational identities

    y^T((7/2)I+C)y = sum_(i modulo4)(y_i+y_(i+1))^2
                                      +(3/2)sum_i y_i^2,
    z^T((3/2)I+D)z = (1/3)sum_i ((Dz)_i+(3/2)z_i)^2
                                      +(1/12)sum_i z_i^2.

These establish strict positivity except at zero, and are exactly checkable
by expansion. Positive rational weights on squares suffice for an exact
positivity certificate; they can also be converted to ordinary SOS weights.

Put s=sum t_i and u=t-(s/8)1. As K1=3*1, M1=(11/2)*1.
Expanding the centered quadratic gives the polynomial identity

    u^T M u = (5/2)sum_i(t_i^2-t_i)
                 +2 sum_(ij edge H)t_i*t_j + (5/2)s-(11/16)s^2.

On an independent-set indicator this reduces to

    0 <= u^T M u = (5/2)s-(11/16)s^2.

For s>0, division by s gives s<=40/11<4. The s=0 case is immediate.
This is a degree-two spectral/SOS inequality modulo the Boolean and
edge-product equalities. The centering is linear in the indicators, so
no higher-degree polynomial is concealed in the displayed squares.

<a id="claim-sos-obligation-eight-leaves"></a>
## 3. Eight witnessed leaves reject a full omission-star capacity

Claim ID: `research/n43/d18/sos_obligation_graphs.md#claim-sos-obligation-eight-leaves`
Kind: local-deduction
Review state: accepted
Scope: actual omission-cell star above with remaining nonneighbor capacity
h<=4 and eight distinct undecided leaves whose obligation graph contains H
Dependencies: previous claim; actual witnessed triple constraints
Conclusion: the partial state has no completion; the eight leaves require
at least five center-nonneighbors
Search use: none pending independent review; proposed conditional propagate
Reviews: [review](review_sos_obligation_graphs_20261015_columns.md)

A putative completion selects at most four nonneighbor leaves, so at least
four leaves have t_i=1. They are independent in H by the witnessed pair
obligations. Claim02 prohibits an independent set of size four. Equivalently
any vertex cover of H has size at least5. This rejects the state for every x.
A certificate records the twelve obligation edges, their known B-edge
statuses and named A-edge witnesses Q_ij, the actual omission pair P,
center and leaves, and the remaining capacity with consumed slots.
Additional witnesses or leaves do not invalidate the eight-leaf subset proof.
No occurrence of this pattern is asserted for every candidate.

## Comparison with the existing fractional-matching test

Every fractional matching on eight vertices has total weight at most4,
because summing its eight vertex capacities counts each edge twice.
Weight1/3 on the twelve cubic edges attains4. Thus the fractional-matching
bound alone cannot reject H against h=4. The fractional assignment z_i=1/2
satisfies all linear cover clauses and the capacity. The SOS proof uses
Boolean/edge-product consistency to force at least five selected leaves.
The existing nine-leaf odd-cycle certificate also rejects at h=4; the present
pattern uses eight leaves and is not a consequence of that particular
fractional-matching test. This is an algebraic comparison of filters, not an
assertion of algorithmic performance or a feasible Ramsey realization.

## Author self-audit and limits

The opposite-pair decomposition, D^2=2I, centered expression, rational
coefficients and matrix positivity were independently expanded by the author.
The implication t_i t_j=0 uses Boolean z and each witnessed cover clause;
it is not inferred merely from a fractional assignment. Every anchor is
actual and may vary by obligation edge. Only U_P is assigned I3-free and
only T_Q triangle-free; I4 is allowed in A. This is a self-check pending
independent review. The note closes no x branch and supplies no exhaustive
order-43 certificate. Its use is conditional rejection of an explicitly
witnessed partial state.
