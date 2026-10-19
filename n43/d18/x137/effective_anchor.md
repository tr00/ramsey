# Effective-degree rigidity at x=137

Current branch status (2026-10-19): the separately reviewed
[full-frontier closure](frontier_closure.md) now excludes x137 entirely.
This note's proof and original scope/limit statements are preserved below;
it supplies inputs to that closure rather than itself proving it.

Date: 2026-10-18. Author and self-auditor: Main, working alone.
Task token: `x137-effective-anchor-20261018`.

All three claims were accepted after independent review on 2026-10-18, recorded in
[the review](review_effective_anchor_20261018_anchor_rigor.md). No subagents,
solver, graph search, catalogue processing, downloads or Lean changes were used.
Exact scalar checks and fixed-extremal-graph attachment checks are self-checks,
not independent review. No novelty claim or complete x137 exclusion is made.

## Setting and dependencies

Let G be K5/I5-free on 43 vertices, let d_G(v)=18, and put A=N(v),
B=M(v), C_y=N_A(y). Assume x=e(A,B)=137. The
[exact budgets](../frontier_band.md) give e(A)=85 and
sum_A epsilon_u=1, where epsilon_u=d_G(u)-18>=0. Thus a unique p in A
has epsilon_p=1; every other epsilon is zero. Write

    w(u)=d_A(u)-epsilon_u,   L={u in A:w(u)<=7},   ell=|L|.

Then d_B(u)=17-w(u), sum_A d_A=170 and sum_A w=169.
The graph A is K4/I5-free; B is K5/I4-free. In particular, do not impose
an I4 prohibition on A.

We use these existing premises with their existing provenance:

- R(3,5)=14 gives d_A(u)<=13. R(4,4)=18 ensures an I4 in A.
- Every I4-transversal in A has size at least four, by the
  [four-transversal bound](../frontier_band.md), since q=85-e(A)=0.
- Every member of every four-set I4-transversal T has A-degree at least
  nine. This is the proof of
  [four-column stability Claim 01](../four_column_stability.md#claim-four-column-stability-01):
  its argument applies to any transversal, because A-T is K4/I4-free;
  actual-column status is used there only to establish transversality.
  The same quantifier is explicit in
  [the earlier transversal claim](../x136/r2/low_excess_columns.md#claim-r2-low-excess-01).
  This degree floor needs e(A)=85, E(4,4,14)<=50 and R(3,4)=9,
  not zero global excess on A.
- For any independent four-set I in A, e(I,B)>=36, using the actual 24
  columns and their singleton capacities. Therefore sum_I w<=32.
  See [anchor defects](../frontier_band.md#claim-frontier-anchor-defects).
- The published K4/I4-free edge maxima at orders 11..17 are respectively
  36,40,45,50,55,60,68, as recorded with citations in the
  [root table](../../../README.md#state-of-the-art).
- We use K4/I4-free core upper bounds at orders 8,9,10 of 21,27,31.
  The first two follow from Turan's K4-free bound; the last follows from
  [the elementary core-cap proof](../x136/five_column_compatibility.md#claim-five-columns-core-caps).

For clarity, the ten-vertex cap needs no unpublished census. In a K4/I4-free
H on ten vertices, 1<=d_H(u)<=8. Put
f(d)=min(floor(d^2/4),floor(3d/2)). Triangle-free neighborhoods in H and
its complement give 3t(H)<=sum f(d) and 3i3(H)<=sum f(9-d).
Goodman's identity then gives

    3*C(10,3)<=sum g(d),
    g(d)=f(d)+f(9-d)+(3/2)*d*(9-d).

For each integer d=1..8, g(d)+6d<=74. Hence
360<=740-12e(H), and e(H)<=floor(95/3)=31.

Define b4(j) as the sum of C(part_size,2) over four balanced parts of total
size j. Because A has no I5, Turan applied to the complement of any j-set
S gives e(A[S])>=b4(j). Equality at j=8 forces A[S] to be four disjoint
edges. We use the standard equality case of Turan's theorem, not an
assertion about the full graph A.

<a id="claim-x137-low-score"></a>
## 1. The low-effective-degree vertices are not a transversal

Claim ID: `n43/d18/x137/effective_anchor.md#claim-x137-low-score`
Kind: local-deduction
Review state: accepted
Scope: every rooted (G,v) in the setting; L as defined above
Dependencies: setting; core caps; Turan's theorem with equality
Conclusion: some independent four-set in A is disjoint from L
Search use: propagate
Reviews: [independent review](review_effective_anchor_20261018_anchor_rigor.md)

Proof. Since w(u)<=13,

    169=sum_A w<=7ell+13(18-ell)=234-6ell,

so ell<=10. Suppose L is a transversal. The four-transversal lower bound
excludes ell<4. If ell=4, every member has A-degree at least nine, so
its weight is at least eight, contrary to the definition of L.
Thus 5<=ell<=10. The graph H=A-L is K4/I4-free and

    e(H)=85-sum_L d_A+e(A[L])>=84-7ell+b4(ell),

because sum_L epsilon<=1. The complete table is

|ell|order H|lower bound e(H)|upper bound e(H)|
|---|---|---|---|
|5|13|50|45|
|6|12|44|40|
|7|11|38|36|
|8|10|32|31|
|9|9|27|27|
|10|8|22|21|

Only ell=9 survives the scalar comparison. Equality forces
sum_L d_A=64, e(A[L])=6 and e(H)=27. Turan equality makes
H=K_{3,3,3}; in particular

    e(L,H)=64-2*6=52.

A vertex of L can meet at most two of the three H parts: one neighbor
in each part would give a K4 with that vertex. Its H-degree is therefore
at most six. H-degree six means that its neighborhood is exactly two
whole parts. There are three such types, and each can occur at most once.
Indeed, two L vertices of the same type cannot be adjacent, since their
common H-neighborhood contains an edge and would complete a K4; nor can
they be nonadjacent, since they and the omitted independent H part would
form an I5. Hence at most three L vertices have H-degree six; the other
six have H-degree at most five. Thus e(L,H)<=3*6+6*5=48, contradicting
52. This removes the only equality case and proves the claim.

<a id="claim-x137-exact-anchor"></a>
## 2. An exact independent-four anchor survives the excess unit

Claim ID: `n43/d18/x137/effective_anchor.md#claim-x137-exact-anchor`
Kind: local-deduction
Review state: accepted
Scope: every rooted (G,v) in the setting
Dependencies: preceding claim; singleton-signature capacity in B
Conclusion: an independent four-set I has w(u)=8 for all u in I;
relative to I there are four singleton triangle classes of size three,
exactly twelve double-signature columns, and no larger signatures;
each anchor vertex occurs in six double signatures
Search use: propagate
Reviews: [independent review](review_effective_anchor_20261018_anchor_rigor.md)

Proof. Choose I disjoint from L. Each of its four weights is at least
eight, whereas sum_I w<=32. Thus all four equal eight, and each anchor
vertex has exactly nine B-neighbors. In particular e(I,B)=36.
Every B column meets I. Each exact singleton class is a clique: a nonedge
in it together with the other three vertices of I would give I5.
Its size is at most three, since four members with its anchor give K5.
If n1 is the total number of singleton columns, then

    36=e(I,B)>=n1+2(24-n1)=48-n1>=36.

Equality forces n1=12, all four singleton classes of size three, and all
other signatures of size two. Each anchor row has three singleton and
six double incidences. If p is absent from I, all four A-degrees are
eight; if p is present, its A-degree is nine and the other three are eight.

<a id="claim-x137-no-four-transversal"></a>
## 3. Every transversal has size at least five at x=137

Claim ID: `n43/d18/x137/effective_anchor.md#claim-x137-no-four-transversal`
Kind: local-deduction
Review state: accepted
Scope: every rooted (G,v) in the setting; every abstract I4-transversal
Conclusion: no four-set I4-transversal exists; every actual |C_y|>=5
Dependencies: preceding two claims; four-transversal degree floor;
core edge maxima; Turan's theorem with equality
Search use: terminate x137 children r>=1
Reviews: [independent review](review_effective_anchor_20261018_anchor_rigor.md)

Proof. Suppose T is a four-set transversal, and choose the anchor I of
Claim 2. Every member of T has A-degree at least nine. Every member of
I other than possibly p has A-degree eight. Since T meets I, necessarily

    p in T intersect I,   d_A(p)=9,

and the other three I vertices have A-degree eight. The sets L and I are
disjoint. Summing A-degrees over L, I and their complement gives

    170<=7ell+33+13(14-ell)=215-6ell,

hence ell<=7.

The set L union {p} is itself a transversal. Otherwise an independent
four-set J disjoint from it would have all weights at least eight,
hence exactly eight by the anchor bound. Since p is absent, all its
A-degrees would be eight, so J would miss T, a contradiction.

Put K=A-(L union {p}). It is K4/I4-free, and

    e(K)=85-sum_L d_A-d_A(p)+e(A[L union {p}])
        >=76-7ell+b4(ell+1).

Here p is the unique positive-excess vertex and is not in L, so all L
vertices have A-degree at most seven. Every possible ell is covered:

|ell|order K|lower bound e(K)|upper bound e(K)|
|---|---|---|---|
|0|17|76|68|
|1|16|69|60|
|2|15|62|55|
|3|14|55|50|
|4|13|49|45|
|5|12|43|40|
|6|11|37|36|
|7|10|31|31|

The only remaining case is ell=7. Equality forces all seven L degrees
to equal seven and e(A[L union {p}])=b4(8)=4. Turan equality makes this
eight-vertex induced graph four disjoint edges. In particular p has
exactly one neighbor in L, and hence eight neighbors in the ten-vertex K.
Only two vertices of K are nonadjacent to p. But I-{p} consists of three
vertices in K, all nonadjacent to p. Contradiction.

Thus no four-set transversal exists. The prior lower bound of four
excludes smaller transversals, proving tau(I4(A))>=5. Every actual C_y is
a transversal, so every column has size at least five.

## Consequences and limits

With independent acceptance recorded, Claim 3 excludes all x137 children with
r>=1, strengthening the reviewed r4 exclusion. The surviving
necessary profile is r=0, s=7..10, H=s-7, where s counts size-five
columns and H sums column excesses above six. Claim 2 supplies an exact
anchor despite the single global excess unit, without choosing a canonical
anchor or assuming which anchor contains p.

The whole x137 branch remains open. Nothing here decides order 43,
uses the unintegrated x136 closure, establishes a five-transversal theorem
for arbitrary 85-edge A without the actual B interface, or changes accepted
pruning. Independent review and any formalization are not supplied by the
arithmetic self-checks.
