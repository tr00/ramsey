<!-- extension-research-integration:start -->
Integration status (2026-10-17): all six claims independently accepted at
reviewed-body SHA-256 `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`.
See the [exact-revision review](review_large_row_extensions_20261017_audit.md).
The reviewed body below is preserved verbatim; ready labels are historical.
Permitted use: the stated conditional propagation and exact local descriptions,
with every retained ambient completion obligation still required. No core
census, complete large-row exclusion, novelty or runtime claim is certified.
<!-- extension-research-integration:end -->

# Large-row attachment reductions at a degree-18 pivot

Date: 2026-10-17. Author: LargeRowResearch. All claims below are **ready
for independent review**, not accepted. No novelty claim or branch closure.
No graph search, catalogue acquisition, solver, or theorem prover was used.

## Scope and retained hypotheses

Throughout G is K5/I5-free on 43 vertices, v has degree 18,
A=N(v) has order 18 and is K4/I5-free, and B=M(v) has order 24 and is
K5/I4-free. Set R_u=N_B(u), C_y=N_A(y), and
`epsilon_z=d_G(z)-18 in {0,...,6}`. In particular

```text
d_A(u)+|R_u|=17+epsilon_u,
d_B(y)+|C_y|=18+epsilon_y.
```

A may contain I4. No condition on x, q, or total excess is imposed.
In particular, none of this note depends on the user-supplied closure of
x=136. The input row and cell bounds are the reviewed
[cell saturation](anchored_cell_averaging.md#claim-cell-saturation) and
[adjacent-sixteen-row observation](averaging_future_work.md#claim-averaging-adjacent-sixteen-rows).
The Ramsey inputs used below are R(4,4)=18, R(3,4)=9, and R(3,3)=6.
No census uniqueness premise is needed for the proved claims.

The results are attachment restrictions, not merely internal regularity:
17-cores impose inequalities between their exclusive parts, and adjacent
16-rows have only three possible common-eight-cell types, with an exact
signature reduction retaining all remaining ambient obligations.

<a id="claim-seventeen-codegree-moments"></a>
## 0. Census-free codegrees and attachment moments in a 17-core

Claim ID: `n43/d18/large_row_extensions.md#claim-seventeen-codegree-moments`
Kind: local-deduction
Review state: accepted
Scope: any (4,4)-free graph H of order seventeen; any subset U of its vertices
Dependencies: cell saturation; Claim `claim-common-eight-classification`
only for the final eight-subset specialization
Conclusion: H has edge codegree three and nonedge codegree four; the
exact attachment moments and S10 rigidity below follow
Search use: propagate pending independent review
Reviews: [exact-revision review](review_large_row_extensions_20261017_audit.md)

H is 8-regular and has 68 edges and 68 nonedges. For an edge xy, the
common neighborhood is independent (otherwise K4), hence has order at
most three. For a nonedge xy, the common nonneighborhood is a clique
(otherwise I4), hence has order at most three. Since x,y are nonadjacent
and both have degree eight, this common nonneighborhood has order
`15-(16-c)=c-1`, where c is their common-neighbor count. Thus c<=4.
But the sum of codegrees over all unordered pairs is

```text
sum_v binom(d_H(v),2)=17*28=476=68*3+68*4.
```

All upper bounds are therefore equalities. This proves the parameters
SRG(17,8,3,4) directly, without identifying H with a catalogue graph.

For U of size r, write e=e(H[U]), d_s=d_U(s) for s in U, and
h_t=d_U(t) for t outside U. Double counting incident edges and then
common-neighbor triples gives the exact moment constraints

```text
sum_(t outside U) h_t = 8r-2e,
sum_(t outside U) binom(h_t,2)
    = 4*binom(r,2)-e-sum_(s in U) binom(d_s,2).
```

Indeed each pair inside U contributes codegree three if adjacent and
four if not; the right side subtracts the common neighbors that are
themselves in U. These identities constrain attachments of any selected
subgraph, not just its internal degree sequence.

In particular, if H[U] is triangle-free of order eight, the three types
proved below give the following moments on its nine-vertex complement:

| Type | sum h_t | sum binom(h_t,2) |
| --- | --- | --- |
| S10 | 44 | 86 |
| S11 | 42 | 81 |
| S12 | 40 | 76 |

For S10 the signature degrees are forced: eight outside vertices see
five U vertices and the remaining outside vertex sees four. To verify
this without an integer search, use the moments to obtain
`sum h_t^2=216` and hence
`sum (h_t-4)(h_t-5)=216-9*44+20*9=0`.
For integral h_t each summand is nonnegative, so every h_t is four or
five, and their sum fixes the multiplicities. Thus H-U has degree
sequence `(4,3,3,3,3,3,3,3,3)`. S11 and S12 retain the displayed
moment equations; no assertion that they force a unique signature is
made. For any two triangle-free eight-subsets of H, these moment
restrictions apply to both simultaneously; no incompatibility of any
specified overlap pattern is claimed here.

<a id="claim-seventeen-extension-domain"></a>
## 1. An actual 17-row: seven outside vertices with constrained signatures

Claim ID: `n43/d18/large_row_extensions.md#claim-seventeen-extension-domain`
Kind: local-deduction
Review state: accepted
Scope: any u in A with |R_u|=17; put H=B[R_u], W=B-R_u
Dependencies: scope; cell saturation; R(3,4)=9
Conclusion: the signature conditions and degree identities below are
necessary and sufficient for a proposed attachment of W to a specified
(4,4)-free H to make B K5/I4-free; ambient extension is separately retained
in Claim `claim-large-row-ambient-lifting`
Search use: propagate; exact finite reduction pending independent review
Reviews: [exact-revision review](review_large_row_extensions_20261017_audit.md)

H is 8-regular. For each z in W define

```text
T_z = R_u - N_B(z),     S_z = R_u - T_z.
```

Every H[T_z] has no I3: such a triple and z would be I4 in B.
Consequently |T_z|<=8, and every outside vertex has at least nine
neighbors in H. Thus the signature domain is not all subsets of H: it
is exactly the subsets T with alpha(H[T])<=2. The following is an exact
local extension criterion, where common intersections over named vertices
are actual intersections, not just size bounds:

* B[W] has no K5 or I4.
* For an edge zz' of W, H[S_z intersect S_z'] has no triangle.
* For a triangle Q of W, H[intersection_(z in Q) S_z] is independent.
* For a K4 Q of W, intersection_(z in Q) S_z is empty.
* Each H[T_z] has no I3.
* For a nonedge zz' of W, H[T_z intersect T_z'] is a clique
  (therefore of order at most three).
* For an independent triple P of W, intersection_(z in P) T_z is empty.

Proof of exactness. Split a forbidden clique or independent set according
to its number of W vertices. A K5 using one W vertex would require a K4
in H, already impossible. For two, three, or four W vertices the three
clique conditions are precisely the remaining obstructions; five are
handled inside W. For I4, one, two, or three W vertices give precisely
the last three conditions, and four are handled inside W. H itself has
neither forbidden graph. This proves both directions, including empty
intersection cases.

The exact global degree budgets, not just local Ramsey clauses, are

```text
d_A(u)=epsilon_u<=6,
|C_y|=10+epsilon_y-d_W(y)                 (y in R_u),
|C_z|=1+epsilon_z+|T_z|-d_W(z)           (z in W).
```

Here u belongs to every C_y in the second line and to none in the third;
`1<=|C_y|<=18` and `0<=|C_z|<=17` must be retained. For the second line
use d_B(y)=8+d_W(y); for the third use
`d_B(z)=17-|T_z|+d_W(z)`. In particular d_A(u) is small but is **not**
proved zero. Every A-neighbor w of u has |R_w|<=15 by
`17+|R_w|-24<=|R_u intersect R_w|<=8`. If |R_w|=15, it is complete to
W and has exactly eight neighbors in R_u. No row-17/row-16 edge can occur.

This is a complete finite B-attachment reduction: choose a (4,4)-free
17-core H, seven signatures in the specified domain, and a graph on seven
named outside vertices satisfying the displayed criterion. It does not
assert that a resulting B admits the remaining A vertices. The published
unique-17-core census could, if explicitly retained as an external premise,
replace the first choice by one unlabelled core; neither its data nor
uniqueness has been acquired or independently recertified here.

<a id="claim-two-seventeen-core-balance"></a>
## 2. Two 17-cores must balance their exclusive attachments

Claim ID: `n43/d18/large_row_extensions.md#claim-two-seventeen-core-balance`
Kind: local-deduction
Review state: accepted
Scope: any K5/I4-free graph B of order 24 and any two vertex sets H,H'
of order 17 inducing (4,4)-free graphs; they need not be specified as A rows
Dependencies: cell saturation; the one-vertex missing-signature argument
of the preceding claim
Conclusion: the equalities, inequality, and 16-set exclusion below
Search use: propagate; branch exclusion pending independent review
Reviews: [exact-revision review](review_large_row_extensions_20261017_audit.md)

Put J=H intersect H', X=H-H', Y=H'-H, and t=|X|=|Y|.
Then |J|=17-t>=10 and 0<=t<=7. Every j in J satisfies

```text
d_X(j)=d_Y(j).
```

Consequently

```text
e(J,X)=e(J,Y),
e(X)=e(Y),
e(X,Y)>=2e(X)+t = 2e(Y)+t.
```

More strongly, for each x in X and y in Y,

```text
d_Y(x)>=d_X(x)+1,       d_X(y)>=d_Y(y)+1.
```

Proof. Both induced cores are 8-regular. Subtract their degree equations
at j to obtain the pointwise equality. Summing and then using
`8t=2e(X)+e(J,X)=2e(Y)+e(J,Y)` gives equality of exclusive edge counts.
For x in X, its nonneighbors in H' cannot contain I3, hence number at
most eight. Thus `d_J(x)+d_Y(x)>=9`, whereas its degree in H is
`d_J(x)+d_X(x)=8`. Subtract and sum over X. The Y inequality is identical.
The argument is vacuous, and still valid, when t=0.

If t=1, writing X={x}, Y={y}, the tips are adjacent and have identical
neighborhood P in J, of order eight. They are true twins in
`B[J+{x,y}]`, **not necessarily in all B**. P is triangle-free because
it is the neighborhood of x in the K4-free core H.

It follows that **any fixed 16-subset J of B is contained in at most two
distinct induced (4,4)-free 17-subsets**. Indeed, if three tips x,y,z
extended J, regularity would give all three the same eight-element
J-neighborhood P, and the preceding inequality would make the tips a
triangle. P has an edge: otherwise it would itself contain I4 in B.
That edge together with x,y,z is K5. This exclusion concerns distinct
core subsets, not the number of A vertices allowed to have an equal row.

The argument is stronger than comparing row cardinalities: it constrains
the actual attachment matrices of every pair of cores. It does not require
the unique-17-core census or any bound on x.

<a id="claim-common-eight-classification"></a>
## 3. The common eight-cell of adjacent 16-rows has exactly three types

Claim ID: `n43/d18/large_row_extensions.md#claim-common-eight-classification`
Kind: local-deduction
Review state: accepted
Scope: every triangle-free I4-free graph S of order eight; in particular
S=B[R_u intersect R_w] for adjacent size-16 rows u,w
Dependencies: R(3,4)=9 and R(3,3)=6; elementary degree arguments
Conclusion: up to isomorphism S is one of the following three graphs;
in particular e(S) in {10,11,12}, with exactly 24-2e(S) vertices of degree 2
Search use: exact finite branch reduction pending independent review
Reviews: [exact-revision review](review_large_row_extensions_20261017_audit.md)

The descriptions specify all edges; there are no unlisted edges.

* **S10:** a cycle 0-1-2-3-4-0, vertices a,p,q, and edges
  `ap, aq, p3, q2, q4`.
* **S11:** the same cycle and extra vertices, with edges
  `ap, aq, p0, p2, q1, q3`.
* **S12:** independent vertices p1,p2,p3, a vertex a adjacent to all three,
  a path q1-q2-q3-q4, and attachments
  `N_P(q1)={p2,p3}`, `N_P(q2)={p1}`, `N_P(q3)={p2}`,
  `N_P(q4)={p1,p3}`.

Proof of coverage. Each degree is two or three: a neighborhood is
independent of order at most three, while a nonneighborhood is triangle-free
and I3-free, so has order at most five.

Suppose first that a has degree two, with independent neighbors p,q.
Its other five vertices induce a triangle-free I3-free graph, necessarily
C5. Each of p,q has one or two neighbors on this cycle, forming an
independent set. Their common missed vertices on the cycle must be a
clique; otherwise p,q and two such vertices form I4. Thus their union
of cycle-neighborhoods has size at least three.

If their sizes are one and two, their union has size three and the
remaining pair must be an edge. Removing an edge's two endpoints from
C5 leaves P3. Its only independent pair consists of its endpoints, so
these are the two neighbors of one root and the middle vertex is the
single neighbor of the other. This is S10 up to cycle symmetry and
interchanging p,q.

If both sizes are two, a union of size three is impossible: its complement
would be an edge, leaving P3, which has only one independent pair. Hence
the pairs are disjoint, leaving one missed cycle vertex. The remaining
four induce P4, whose only partition into two independent pairs is its
bipartition. This gives S11. Two singleton neighborhoods cannot cover
three vertices. These exhaust the degree-two case.

Otherwise S is cubic. Choose a vertex a, its independent neighbor set
P of size three, and the remaining four vertices Q. Each P vertex has
two Q neighbors, so e(P,Q)=6. Summing degrees over Q gives e(Q)=3.
Q is triangle-free and I3-free, so its three edges form P4: a star would
have an independent triple, and the other three-edge possibilities on
four vertices contain a triangle. Write Q=q1-q2-q3-q4. The P-neighborhoods
of the endpoints have size two, those of the middle vertices size one,
and adjacent Q vertices have disjoint P-neighborhoods. The singleton
neighborhoods at q2,q3 are different, say {p1},{p2}; the endpoint
neighborhoods are then forced to be {p2,p3},{p1,p3}. This is S12.

Proof that the displayed graphs have the stated local type. Triangle-
freeness follows directly from independent attachment signatures and
absence of p-q edges. For S10 and S11, an independent four-set containing
a would need an independent triple in C5. A set containing p and q
would need an independent pair in their common missed cycle vertices,
which are respectively an edge or a singleton. A set containing at most
one of a,p,q cannot have four vertices since alpha(C5)=2. For S12, an
independent four-set containing a would need three vertices in Q, but
alpha(P4)=2. Without a, a set containing all three P vertices cannot
add a Q vertex; each Q vertex sees P. Two P vertices have at most one
common missed Q vertex (their common-miss sets are empty, {q3}, {q2}),
so cannot add two Q vertices. One or zero P vertices cannot contribute
four vertices since alpha(Q)=2. Thus all three graphs are I4-free.
Finally the degree sum gives n2=24-2e(S). No catalogue count is used.

This exact classification sharpens the previous interval e(S)=8..12.
It also proves that no stronger exclusion of S10 or S11 follows solely
from the common-cell type. Their occurrence in an ambient G remains open.

<a id="claim-sixteen-signature-reduction"></a>
## 4. Adjacent 16-rows: exact residual signatures and global budgets

Claim ID: `n43/d18/large_row_extensions.md#claim-sixteen-signature-reduction`
Kind: local-deduction
Review state: accepted
Scope: adjacent u,w in A with |R_u|=|R_w|=16
Dependencies: reviewed adjacent-sixteen-row observation; cell saturation;
preceding classification
Conclusion: the three-type finite attachment reduction, equations, and
inequalities below; full ambient completion remains as in the next claim
Search use: propagate; exact finite branch reduction pending review
Reviews: [exact-revision review](review_large_row_extensions_20261017_audit.md)

Write S=R_u intersect R_w, X=R_u-R_w, Y=R_w-R_u. These are a partition
of B into three eight-sets, with S one of S10,S11,S12. Put T=X union Y
and, for z in T, P_z=N_S(z). Specify a graph L on T and these signatures.
The following conditions are necessary and sufficient for the constructed
B to be K5/I4-free **and** for both prescribed rows S+X,S+Y to be
(4,4)-free:

1. L has no K5 or I4; L[X] and L[Y] have no K4.
2. For each z in T, S-P_z has no I3; hence |P_z|>=3.
3. For every nonedge zz' of L, S-(P_z union P_z') is a clique
   (hence has order at most two, since S is triangle-free).
4. For every independent triple Z of L, union_(z in Z) P_z=S.
5. For every triangle Q of L, S[intersection_(z in Q) P_z] is independent.
6. For every K4 Q of L, intersection_(z in Q) P_z is empty.
7. For every edge zz' lying wholly in X or wholly in Y,
   S[P_z intersect P_z'] is independent.
8. For every triangle Q lying wholly in X or wholly in Y,
   intersection_(z in Q) P_z is empty.

Proof of exactness. For B, split I4 according to its number of T
vertices: zero is impossible in S, one gives item 2, two item 3,
three item 4, and four item 1. A K5 can use at most two S vertices
because S is triangle-free. Its splits into T/S are respectively
5/0, 4/1, 3/2, giving items 1,6,5. For K4 in S+X or S+Y the only
possible splits are 4/0,3/1,2/2, giving items 1,8,7. Thus neither
forbidden subset is omitted; the same splitting proves sufficiency.
The bound |P_z|>=3 follows because S-P_z is also triangle-free and
R(3,3)=6. This is an exact finite prescription, not evidence that any
of its completions extends to G.

There are also substantial degree constraints on the prescription. Define
for s in S

```text
a_s=d_(S+X)(s)-7 in {0,1},
b_s=d_(S+Y)(s)-7 in {0,1}.
```

Then

```text
d_X(s)=7-d_S(s)+a_s,
d_Y(s)=7-d_S(s)+b_s,
d_B(s)=14-d_S(s)+a_s+b_s,
|C_s|=4+d_S(s)+epsilon_s-a_s-b_s.
```

Thus every degree-two common-cell vertex has at least four A neighbors,
and every degree-three common-cell vertex at least five. Let
`sigma=12-e(S) in {0,1,2}`, `a=sum_S a_s`, `b=sum_S b_s`, and
`E_S=sum_S epsilon_s`. Summing gives

```text
e(S,X)=32+2sigma+a,       e(S,Y)=32+2sigma+b,
sum_(s in S)|C_s|=56-2sigma+E_S-a-b >=40-2sigma.
```

After the two root incidences at every s, there are therefore at least
`24-2sigma` incidences from S to A-{u,w}. These lower bounds are
40,38,36 total S-column incidences for S12,S11,S10 respectively.
Each degree-two s has five or six neighbors in each exclusive cell;
each degree-three s has four or five. These constraints retain which
vertices have which degree, rather than using only an average.

For x in X put `c_x=d_(S+X)(x)-7 in {0,1}`. The complementary budgets are

```text
d_L[X](x)+|P_x|=7+c_x,
|C_x|=11+epsilon_x-c_x-d_Y(x).
```

The analogous equations hold on Y. Here C_x contains u and excludes w;
C_y contains w and excludes u. At s in S, both roots belong to C_s.
Finally

```text
d_A(u)=1+epsilon_u,       d_A(w)=1+epsilon_w.
```

So the root neighborhoods in A-{u,w} have exactly epsilon_u and
 epsilon_w vertices, respectively, each at most six. All these are
exact degree constraints of the ambient graph, not regularity assumptions
on B or the other A vertices.

<a id="claim-large-row-ambient-lifting"></a>
## 5. Exact lifting and coverage: no ambient constraints are discarded

Claim ID: `n43/d18/large_row_extensions.md#claim-large-row-ambient-lifting`
Kind: local-deduction
Review state: accepted
Scope: either of the preceding B-attachment reductions
Dependencies: preceding exact local criteria; scope
Conclusion: the completion objects and criterion below are equivalent
to the full rooted G in the respective large-row branch
Search use: exact finite branch reduction pending independent review
Reviews: [exact-revision review](review_large_row_extensions_20261017_audit.md)

For a 17-row, the residual object consists of its specified core, seven
outside signatures and their graph, a graph on A with distinguished u,
and the other seventeen actual rows. For adjacent 16-rows, it consists
of one of the three specified S types, the sixteen T signatures and L,
a graph on A with distinguished edge uw, and the other sixteen actual
rows. In both cases require the preceding local criteria and degree
equations, and also:

* A is K4/I5-free.
* For every clique Q in A of size k=1,2,3, the common B-neighborhood
  `intersection_(a in Q) R_a` has no K_(5-k).
* For every independent P in A of size k=1,2,3,4, the common B-missed
  set `B-union_(a in P) R_a` has no I_(5-k).
* At every a in A and y in B, the exact two scope degree equations
  hold with epsilon in {0,...,6}, using the actual column memberships.

These final clauses are retained obligations, **not** a claim that the
small local reduction already enforces them. No column-symmetry quotient,
root selection, or equality-frontier premise is implicit. Set x equal
to the sum of the rows and q=85-e(A); these quantities are not fixed.

Proof of equivalence and coverage. An ambient G directly supplies all the
objects. The overlap bound supplies the three eight-sets in the 16-row
case; the preceding classification exhausts their isomorphism types.
Any bijection to the chosen description is allowed; remaining vertex
labels and signatures are retained, so classification introduces no
unproved symmetry identification. Conversely attach v complete to A
and anticomplete to B. A K5 through v would require K4 in A. An I5
through v would require I4 in B. Without v, a K5 or I5 lying in one
part is already forbidden; any mixed forbidden set violates the
corresponding named clique/independent-anchor clause. The degree equations
ensure the retained global degree range. Thus these are exact finite
attachment reductions, not sufficient conditions with a hidden mixed
obstruction or an omitted degree check. The 17-row and adjacent-16-row
families may overlap; coverage is claimed for each stated family, not as
a disjoint partition of all degree-18 graphs.

## Limits, failed shortcuts, and author audit

* The tempting degree claim `|R_u|=17 implies d_A(u)=0` is not proved;
  only `d_A(u)=epsilon_u<=6` follows. The invalid independent-set extension
  involving the adjacent pivot and A vertex remains invalid; see the
  [existing withdrawal](cross_upper_bound.md#4-audit-of-stronger-attempts).
* Adjacent 16-rows have not been excluded. Classification of S is not a
  classification of its attachments. Even the minimum-edge S10 is a valid
  common-cell type in isolation, as proved above; local validity does not
  establish ambient realizability.
* In the two-core result, extending identical J-neighborhoods to all of B
  would be an unjustified stronger proposal. The six vertices outside the
  union of two 17-cores are not controlled by that equality.
* The fixed-16-set result counts distinct 17-subsets, not repeated equal
  rows. The exact lifting clauses must still be applied to multiplicities
  and simultaneous rows. In particular, an independent triple of row
  roots must have a row union of order at least twenty, since its missed
  B cell is a clique of order at most four; this is a retained ambient
  obligation, not substituted for the stronger core-attachment equations.
* No maximum number of realizable large rows, new global x bound, or
  nonexistence of G is asserted here. The unresolved concrete tasks are
  completion of the two finite signature systems and their ambient lifting,
  not an unspecified request to enumerate all graphs.

Author self-check: the classification proof treats every degree-two and
cubic possibility and analytically checks the three displayed types.
The exact criteria were checked by forbidden-set splits, not by running a
graph enumerator. A tiny scalar audit evaluated
`n2=24-2e(S)`, `e(S,X)=56-2e(S)+a`, and the minimum column sum at
`e(S)=10,11,12`, obtaining respectively `(n2,base,minsum)` equal to
`(4,36,36)`, `(2,34,38)`, `(0,32,40)`. The two-core identities were also
checked arithmetically over their finite scalar ranges; that audit is
not an existence search or independent proof review. All significant
claims above are proved in the text; no graph data were acquired.
The 17-core moment audit returned `(e,n2,sum h,sum binom(h,2))` equal
to `(10,4,44,86)`, `(11,2,42,81)`, `(12,0,40,76)`, and checked
`17*28=68*3+68*4=476` and the zero S10 integer-square expression.
These were exact scalar arithmetic checks; no graph generation occurred.
