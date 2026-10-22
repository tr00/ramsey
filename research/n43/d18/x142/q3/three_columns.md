# Actual size-three columns at the q=3 boundary

Date: 2026-10-14. Author: x142 boundary agent, task
`band137-q3-20261014`. Base revision:
`81c768a683d3c3b3df70d4d3b7d03a67d505447b`.

A size-three cross column at any degree-18 root with `q=3` forces
`E_A>=14`, and consequently `x>=156`. In particular it is excluded in the
`x=142,q=3,E_A=0` profile. This concerns actual cross columns; a stronger
transversal statement for an isolated neighborhood is not inferred.

No graph enumeration, solver, installation, download, or literature novelty
check was performed. The claims received independent internal review by the
coordinator and transfer agent on the retained numerical census premise.
That premise has not been reverified from the primary paper in this task.

## Setting and dependencies

Let `G` be an order-43 graph with no `K5` and no independent five-set. Choose
a vertex `v` of degree 18 and set

```text
A=N_G(v), |A|=18,
B=V(G)-({v} union A), |B|=24,
q=85-e(A)=3, F=complement A, e(F)=71,
C_y=N_G(y) intersect A, y in B,
epsilon_u=d_G(u)-18, E_A=sum_(u in A) epsilon_u.
```

The established order-43 degree bound `18<=d_G(u)<=24` implies
`epsilon_u>=0`. Inherited degree summation gives `x=142+E_A` and
`d_cross(u)=17+epsilon_u-d_A(u)` for every `u in A`.
The graph `A` has no `K4` and no independent five-set; `F` has independence
number at most three and no `K5`. The argument below permits independent
four-sets in `A` and uses them essentially.

The only numerical census premise used here is that every 15-vertex
`(4,4)`-free graph has at least 50 edges. Primary citation: B. McKay and
S. Radziszowski, *A New Upper Bound for the Ramsey Number R(5,5)*,
Australasian Journal of Combinatorics **5** (1992), 13–20,
<https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>.
The interval 50–55 and its census provenance are recorded in
[the four-transversal proof](../../transversal_four.md#published-input).
This task uses the lower endpoint and complementation, without asserting a
new catalogue completeness result.

The independent-four singleton bound is rederived below. The other numerical
Ramsey premise is `R(3,4)=R(4,3)=9`. The ambient-type and degree premises are
recorded in [the baseline](../../../../../docs/mathematical_baseline.md).

## Equality forced by a size-three column

<a id="claim-q3-three-column-core"></a>

Claim ID: `research/n43/d18/x142/q3/three_columns.md#claim-q3-three-column-core`  
Kind: local-deduction  
Review state: accepted  
Scope: the setting above, quantified over every actual `y in B` with
`|C_y|=3`; no restriction on `E_A`  
Dependencies: the 15-vertex `(4,4)` minimum 50 edges cited above;
`R(4,3)=9`; inherited ambient types  
Conclusion: writing `T=C_y={t_1,t_2,t_3}`, `J=A-T`, and
`S_i=N_A(t_i) intersect J`, one has `A[T]=K3`, `e(J)=55`,
`|S_i|=8`, `d_A(t_i)=10`, and the exact cell decomposition below  
Search use: propagate  
Reviews: [exact-revision review](review_band137_three_columns_20261014_coordinator.md)

Every actual column meets every independent four-set of `A`, because a
missed set together with `y` would be independent of size five. Thus `T`
is a `K4` transversal in `F`, and `H=F-T` is a 15-vertex `(4,4)`-free
graph. The cited premise gives `e(H)>=50`. For any `t_i`, its nonneighbors
in `H` have no `K4` and no independent triple; an independent triple there
with `t_i` would be an independent four-set of `F`. Hence it has at most
eight such nonneighbors and at least seven neighbors in `H`.

Consequently

```text
71=e(F)=e(H)+e_F(T,H)+e_F(T) >=50+21+0=71.
```

Equality gives `e(H)=50`, every `t_i` has seven `H` neighbors, and `F[T]`
is empty. Complementing within the core and across the cut gives
`A[T]=K3`, `e(J)=C(15,2)-50=55`, `|S_i|=8`, and `d_A(t_i)=2+8=10`.

The graph `J` is `(4,4)`-free. Since `t_it_j` is an edge of `A`, its
common neighborhood in `J` is independent, as any edge there would give
a `K4`. Thus `|S_i intersect S_j|<=3`, using `alpha(J)<=3`.
The triple intersection is empty because `T` is a triangle and `A` has
no `K4`. Inclusion-exclusion now gives

```text
15 >= |S_1 union S_2 union S_3|
    =24-sum_(i<j)|S_i intersect S_j| >=24-9=15.
```

All inequalities are equalities. Define the exact membership cells

```text
D_ij=S_i intersect S_j,       |D_ij|=3, 1<=i<j<=3,
P_i=S_i-(S_j union S_k),      |P_i|=2, {i,j,k}={1,2,3}.
```

The three `D_ij` and three `P_i` partition all 15 vertices of `J`.
Every `D_ij` is independent and anticomplete to `t_k`, for the index
`k` outside `{i,j}`. Hence the following are three disjoint independent
four-sets of `A`:

```text
X_1={t_1} union D_23,
X_2={t_2} union D_13,
X_3={t_3} union D_12.
```

For subsequent degree counts, every vertex of `J` has degree between six
and eight within `J`. Its nonneighbors have no independent triple, because
such a triple with the vertex would be independent four, and no `K4`;
`R(4,3)=9` bounds their number by eight, giving degree at least six.
Its neighbors are triangle-free, because `J` has no `K4`, and have no
independent four-set; `R(3,4)=9` bounds their number by eight.

## Three independent anchors force excess

<a id="claim-q3-three-column-excess-six"></a>

Claim ID: `research/n43/d18/x142/q3/three_columns.md#claim-q3-three-column-excess-six`  
Kind: local-deduction  
Review state: accepted  
Scope: the setting above with an actual size-three column; each of the three
disjoint independent four-sets `X_i` from the preceding claim  
Dependencies: [core equality](#claim-q3-three-column-core); the actual
order-43 cross interface; nonnegative vertex excesses  
Conclusion: `sum_(u in X_i) epsilon_u>=2` for every `i`, and `E_A>=6`  
Search use: propagate  
Reviews: [exact-revision review](review_band137_three_columns_20261014_coordinator.md)

For any independent four-set `X` in `A`, every column meets `X`. For a fixed
`u in X`, all `B` vertices having exact `X`-signature `{u}` form a clique:
two nonadjacent such vertices together with `X-{u}` would be an independent
five-set. Such a clique has at most three vertices, since four of them
together with `u` would be a `K5`. At most twelve columns have singleton
`X` signatures; the other at least twelve have signature size at least two.
Therefore `e(X,B)>=12+2*12=36`.

Each `X_i` contains one `t_i` of `A`-degree ten and three pair-cell vertices
of `A`-degree at least `6+2=8`. Thus

```text
sum_(u in X_i) d_A(u)>=10+3*8=34,
e(X_i,B)=68+sum_(u in X_i) epsilon_u-sum_(u in X_i) d_A(u)
         <=34+sum_(u in X_i) epsilon_u.
```

Together with `e(X_i,B)>=36` this gives excess at least two on every
`X_i`. They are disjoint, so nonnegative excesses outside their union give
`E_A>=6`.

## Joint core degrees sharpen the excess bound to fourteen

<a id="claim-q3-three-column-excess-fourteen"></a>

Claim ID: `research/n43/d18/x142/q3/three_columns.md#claim-q3-three-column-excess-fourteen`  
Kind: local-deduction  
Review state: accepted  
Scope: the setting above with an actual size-three column, uniformly over
all `E_A` and without any selected-pivot maximality hypothesis  
Dependencies: [core equality](#claim-q3-three-column-core);
the independent-four incidence proof in
[the preceding claim](#claim-q3-three-column-excess-six)  
Conclusion: for `U=X_1 union X_2 union X_3`,
`sum_(u in U) epsilon_u>=14`; hence `E_A>=14` and `x>=156`  
Search use: propagate  
Reviews: [exact-revision review](review_band137_three_columns_20261014_coordinator.md)

Let `D=D_12 union D_13 union D_23` and `P=P_1 union P_2 union P_3`.
Their sizes are nine and six. Since `e(J)=55` and all `J` degrees are at
most eight,

```text
sum_(u in D) d_J(u)=110-sum_(u in P) d_J(u)>=110-6*8=62.
```

Every vertex of `D` has exactly two neighbors in `T`, while the three
vertices of `T` each have `A`-degree ten. Thus `U=T union D` has twelve
vertices and satisfies

```text
sum_(u in U) d_A(u)=30+18+sum_(u in D) d_J(u)>=110.
```

The three independent anchors are disjoint, so their incidence lower bounds
sum to `e(U,B)>=3*36=108`. On the other hand the inherited vertexwise
degree identity gives

```text
e(U,B)=17*12+sum_(u in U) epsilon_u-sum_(u in U) d_A(u)
      <=94+sum_(u in U) epsilon_u.
```

Therefore the excess on `U` is at least fourteen. Nonnegativity of the
remaining six excesses gives `E_A>=14`; finally `x=142+E_A>=156`.

An equivalent separate audit uses the private cells: their total
`A`-degree is `sum_P d_J+6<=54`, so
`e(P,B)>=17*6+E_P-54=48+E_P`. Adding the three-anchor lower bound
`e(U,B)>=108` gives `x>=156+E_P`, which is exactly `E_U>=14` after
substituting `x=142+E_U+E_P`.

## Consequences and limits

The `x=142,q=3,E_A=0` profile has no size-three column. Combining this
with a separate applicable lower bound excluding columns of size at most
two yields `|C_y|>=4` for every `y in B`. The elementary two-transversal
proof is recorded at
[the transfer summary](../../transfer_summary.md#claim-band137-two-transversal).
This restores the small-column count identity `2r+s=2+H` in this profile
and permits the size-four/five compatibility bounds whose hypotheses only
require all columns to have size at least four.

More generally, throughout the `q=3` family, all profiles with
`E_A<=13` (equivalently `142<=x<=155`) exclude actual size-three columns.
Nothing here excludes `E_A>=14` or constructs a column at that endpoint.
The exact equality attachment pattern is necessary, not an existence claim.
An isolated 82-edge `(4,5)`-free graph may have a size-three independent-four
transversal; this proof requires 24 mutually compatible actual columns and
the global degree identities. The full `x=142,q=3` branch remains open.

Further adjacency tests among actual columns remain useful, but were not
needed for this exclusion. In particular for nonadjacent `y,z in B`,
`|C_y union C_z|>=10` implies `|C_z-T|>=7` when `C_y=T` has size three.
No inference that `A` prohibits independent four-sets was made.
