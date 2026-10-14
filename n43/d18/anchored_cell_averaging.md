# Anchored cells, weighted edge budgets, and forced completion structure

Date: 2026-10-14. Author: Codex averaging extension.
Review state throughout: ready for independent review, author-audited only.
No novelty claim, enumeration, solver, installation, or branch closure.

## Scope

G is K5/I5-free on 43 vertices, v has degree 18, A=N(v), B=M(v).
A is K4/I5-free; B is K5/I4-free. Columns C_y=N_A(y) and rows
R_u=N_B(u) are actual subsets, including repeated column occurrences.
No restriction on q, E, or x beyond the inherited branch assumptions.
This extends [weighted averaging](weighted_averaging.md). The value comes
from conditioning on actual cells and retaining completion budgets, rather
than assuming a uniformly large fractional anchor packing.

## Arbitrary anchored cells

<a id="claim-cell-types"></a>
Claim ID: `n43/d18/anchored_cell_averaging.md#claim-cell-types`
Kind: local-deduction
Review state: ready
Scope: every clique Q and independent set P in A; each may be empty;
no assumption on edges between Q and P; Q and P may overlap
Dependencies: Ramsey hypotheses and established small Ramsey numbers
Conclusion: T={y in B: Q subset C_y, P intersect C_y empty} is
(5-|Q|, min(4,5-|P|))-free
Search use: none pending independent review; proposed propagate
Reviews: none

Proof. A clique of order 5-|Q| in T joins Q to give K5.
An independent set of order 5-|P| in T joins P to give I5; independently
T has no I4 since it is in B. If Q intersects P then T is empty,
so that case is vacuous. Empty anchors impose only the inherited bounds.
Here |Q|<=3 and |P|<=4 because A is K4/I5-free. A parameter one forces
T empty. Thus there is no implicit ambient-type transfer.

Examples of unconditional size caps for specified actual anchors:

| Q size | P size | Cell type | Maximum order |
| --- | --- | --- | --- |
| 1 | 0 or 1 | (4,4) | 17 |
| 2 | 0 or 1 | (3,4) | 8 |
| 1 | 2 | (4,3) | 8 |
| 2 | 2 | (3,3) | 5 |
| 3 | 0 or 1 | (2,4), independent | 3 |
| 0 | 2 | (5,3) | 13 |
| 0 | 3 | (5,2), clique | 4 |
| any | 4 | independence parameter 1 | 0 |

The numerical inputs are R(4,4)=18, R(3,4)=9, R(3,3)=6,
R(3,5)=14, and R(2,t)=t, as in the mathematical baseline.
These apply for all x, including x>142. They can be imposed on a partial
column family: its occurrences in a cell cannot exceed the final cap.

## Weighted budgets force undecided edges and nonedges

<a id="claim-cell-quadratic-budget"></a>
Claim ID: `n43/d18/anchored_cell_averaging.md#claim-cell-quadratic-budget`
Kind: local-deduction
Review state: ready
Scope: any nonempty actual cell T of type (a,b), a,b>=2; every
nonnegative rational weight w_y on its occurrences
Dependencies: preceding claim; elementary weighted clique inequality proved below
Conclusion: with W=sum_T w_y, D=sum_T w_y^2, and
K=sum_(yz edge in B[T])w_y*w_z,
(W^2/(b-1)-D)/2 <= K <= (a-2)*W^2/(2*(a-1))
Search use: none pending independent review; proposed propagate
Reviews: none

Proof of the weighted clique inequality. In a graph with clique number
at most k, normalize weights to sum one. If two positive-weight vertices
are nonadjacent, the weighted edge sum is linear in their two weights
with their sum fixed. Move all their combined mass to whichever endpoint
has the larger neighbor-weight sum. This cannot decrease the objective
and reduces positive support. Iterate until the support is a clique of
size l<=k. Its edge sum is (1-sum w_y^2)/2<= (1-1/l)/2<= (k-1)/(2k).
Rescale by W^2; W=0 is immediate. Apply with k=a-1 to B[T], and
with k=b-1 to its complement, whose weighted edge sum is
(W^2-D)/2-K. This proves both bounds. This is the standard weighted
clique inequality (often called Motzkin-Straus); no novelty is asserted.

Let f,h be the weighted sums over already forced edges and forced
nonedges within T. Let V=(W^2-D)/2-f-h be the remaining pair weight.
Any completion must assign undecided edge weight e_U satisfying

    max(0,(W^2/(b-1)-D)/2-f)
      <= e_U <= min(V,(a-2)*W^2/(2*(a-1))-f).

An empty interval rejects the partial state. More importantly a positive
lower bound forces a specified amount of remaining edge weight, and
V minus the upper bound forces remaining nonedge weight. Uniform weights
make these integral counts, rounded inward. This is useful even when no
pairwise contradiction has yet appeared.

Uniform examples, for the full specified cell of order m:

* A (4,4) cell requires ceil(m*(m-3)/6)<=e<=floor(m^2/3).
* A (3,4) cell requires ceil(m*(m-3)/6)<=e<=floor(m^2/4).
* A (4,3) cell requires ceil(m*(m-2)/4)<=e<=floor(m^2/3).
* A (3,3) cell requires ceil(m*(m-2)/4)<=e<=floor(m^2/4).

These scalar budgets do not replace the Ramsey constraints. All-weight
clique inequalities encode the corresponding clique caps exactly (a
forbidden clique itself supplies a violating weighting); they are not a
new logical strengthening of complete clique testing. Their additional
practical role is cheap aggregation with forced pairs, cell membership,
and degree intervals. No claim of superior computational performance.

## Maximum cells force degree structure

<a id="claim-cell-saturation"></a>
Claim ID: `n43/d18/anchored_cell_averaging.md#claim-cell-saturation`
Kind: local-deduction
Review state: ready
Scope: any actual anchored cell of the types and sizes stated below
Dependencies: cell types; R(3,4)=9, R(3,3)=6, R(2,t)=t
Conclusion: the exact degree intervals and completion consequences below
Search use: none pending independent review; proposed propagate
Reviews: none

In an (a,b)-free graph T, for every y its neighborhood is
(a-1,b)-free and its antineighborhood is (a,b-1)-free. Therefore

    |T|-R(a,b-1) <= d_T(y) <= R(a-1,b)-1.

Consequently:

| Type | Order | Every internal degree | Edge consequence |
| --- | --- | --- | --- |
| (4,4) | 17 | 8 | exactly 68 edges |
| (4,4) | 16 | 7 or 8 | 56..64 edges |
| (3,4) | 8 | 2 or 3 | 8..12 edges |
| (4,3) | 8 | 4 or 5 | 16..20 edges |
| (3,3) | 5 | 2 | C5, exactly 5 edges |

These sharpen several scalar weighted bounds. The C5 assertion follows
because a simple 2-regular graph on five vertices without triangles is a
single five-cycle. No catalogue is needed.

For any such cell and vertex y, let f_y,h_y count its already forced
neighbors and nonneighbors in the cell, and U_y=m-1-f_y-h_y. If the
allowed internal degree interval is [l_y,u_y], the number t_y of undecided
incident edges must satisfy

    max(0,l_y-f_y) <= t_y <= min(U_y,u_y-f_y).

An empty interval rejects. If its lower endpoint is U_y, all undecided
pairs incident to y are edges; if its upper endpoint is zero, all are
nonedges. In a 17-vertex row R_u, every vertex must finish with exactly
eight neighbors and eight nonneighbors. These obligations are independent
of global excess and apply to every size-17 row, rather than a selected one.

Global degree and column size yield another interval for every cell T:

    max(0,m-6-|C_y|) <= d_T(y) <= min(m-1,24-|C_y|).

Indeed 18-|C_y|<=d_B(y)<=24-|C_y|, and at most 24-m of these neighbors
can lie outside T. Intersect this interval with the Ramsey interval above.
If epsilon_y is fixed, replace the global bounds by the exact
18+epsilon_y-|C_y|. If known outside-cell pairs are retained, subtract
their actual lower/upper degree contributions instead of 0 and 24-m.
This connects unrestricted degree budgets to saturated-cell structure.

## Higher-order anchors propagate pairs missed by the original rules

<a id="claim-cell-higher-order-propagation"></a>
Claim ID: `n43/d18/anchored_cell_averaging.md#claim-cell-higher-order-propagation`
Kind: local-deduction
Review state: ready
Scope: every actual independent triple P or triangle Q in A, and every
actual independent pair P2 or edge Q2 in A
Dependencies: cell types proved above
Conclusion: the forced pairs and triple constraints below
Search use: none pending independent review; proposed propagate
Reviews: none

Every pair of columns both missing an independent triple P must be
adjacent in B. This recovers the original F rule. More generally, all
columns missing P form a clique of size at most four, and this fact is
available simultaneously, with the same named P. All columns containing
a triangle Q form an independent set of size at most three, recovering
the H rule with its exact cell membership retained.

The new propagation is at the next anchor level. For an independent pair
P2 in A, its missing-column cell is (5,3)-free. **Every triple of columns
in that cell must contain a B edge**. If two of its pairs are already
forced nonedges, the third is forced to be an edge. For an A edge Q2,
its containing-column cell is (3,4)-free. **Every triple of columns in
that cell must contain a B nonedge**. If two pairs are already forced
edges, the third is forced to be a nonedge. These newly inferred pairs
can be fed back into the cell degree and weighted completion budgets.
They need not be witnessed by the original pair-only A tests.

For example, if three actual columns all omit an independent A pair,
and two pairs among their occurrences lie in H, the third pair must
enter F even if its own residual A graph has no independent triple.
This is conditional propagation, not a claim that such a configuration
is realized. The dual example uses an A edge shared by three columns
and two pairs in F. A cell triple with all three opposite forced pairs
is immediately rejected. Iterate only sound implications; the resulting
closure is a necessary-condition filter, not complete Ramsey testing.

The same reasoning works in mixed anchored cells: an (3,3) cell
requires every triple to contain both an edge and a nonedge; at order
five it must finish as C5. All these implications hold without any
small-excess condition. A cell need not be maximal to use its triple
constraints or its weighted budgets.

## Audit and use limits

All four claims are ready, pending independent review. Cell types
were checked separately against clique and independence anchors; overlap
forces empty cells. The weighted inequality was proved by support merging
and independently checked on uniform complete multipartite weights. Both
sides of the completion interval subtract forced edges, while forced
nonedges bound available pair weight. Saturation degree intervals follow
from the two disjoint vertex cells of each vertex. Handshake arithmetic
and degree-to-column conversion were checked separately.

These tools force structure in specified actual cells across the entire
d18 branch. They do not prove a saturated cell must occur in every
candidate. Small rows still obey their appropriate cell bounds, but no
uniform exclusion of x>=143 has been obtained. Higher-order mixed Ramsey
constraints and eventual certified exhaustive coverage remain necessary.
