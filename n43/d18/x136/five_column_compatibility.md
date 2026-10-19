# A forced degree-eight anchor and exclusion of size-four columns

Integration status (2026-10-15): all four claims below received independent
exact-revision acceptance in [the review](review_five_column_compatibility_20261015_independent.md)
at SHA-256 `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b`.
The reviewed body, including its historical author-stage labels, is preserved
unchanged below. This banner resolves the current state: accepted local
deductions on the stated external premises. Permitted use is core and
nontransversality propagation, branching on the unavoidable degree-eight
anchor with complete coverage, column size>=5 propagation, and termination
of x136/r1 (redundantly every x136/r>=1). The whole x136 branch remains open.
No formal certificate or novelty claim is supplied.

Date: 2026-10-15. Task token: `five-columns-20261015`.
Author and self-auditor: Codex. Base revision:
`7ebbef265ef9b55746b798b337b86e4fd6140045`.

This continues the joint size-five-column handoff in
[the earlier research report](../../../reports/2026-10-14-d18-joint-discoveries.md).
The resulting argument concerns the full equality frontier and all abstract
four-set transversals. It does not need a specified number of size-five
columns. All claims are **ready, independently unreviewed**. They must not
change accepted branch status or pruning until independent exact-revision
review. No enumeration, solver, download, installation, or novelty review
was performed.

## Setting and precise external inputs

Let G be an order-43 K5/I5-free graph, v a degree-18 pivot, A=N(v),
B=M(v), and assume x=e(A,B)=136. A is K4/I5-free on18 vertices;
B is K5/I4-free on24 vertices. The equality identity gives

```text
e(A)=85, d_G(a)=18, d_B(a)=17-d_A(a) for every a in A.
```

Write F=I4(A), the family of independent four-sets in A. Established
frontier dependencies, with their recorded external premises, give:

* Every A degree lies in6..13. The floor uses the published upper
  extremum E(4,5,17)=79; the ceiling uses R(3,5)=14.
* Every I in F has sum_I d_A<=32. This uses the actual24 B columns
  and their singleton-signature capacities; it is not a consequence of
  e(A)=85 alone.
* tau(F)>=4, using the published minimum50 edges at order15 for
  (4,4)-free graphs and R(4,3)=9.
* Every four-set transversal T of F has d_A(t)>=9 for each t in T.
  This is [low-excess Claim01](r2/low_excess_columns.md#claim-r2-low-excess-01),
  whose scope explicitly does not require r=2 or actual-column status.
  Its proof uses the published maximum50 edges at order14 for
  (4,4)-free graphs and R(3,4)=9.

The [baseline](../../../docs/mathematical_baseline.md) and linked dependency
notes retain the literature citations. These census premises are not
recertified here. In particular, A may contain I4 throughout this argument.

<a id="claim-five-columns-core-caps"></a>
## 1. Elementary edge caps for the smaller remainders

Claim ID: `n43/d18/x136/five_column_compatibility.md#claim-five-columns-core-caps`

Kind: local-deduction

Review state: accepted

Scope: every K4/I4-free graph H of order m=7,...,13.

Dependencies: R(3,4)=9; elementary neighborhood bounds and handshake;
Goodman's identity, derived below.

Conclusion: The following upper bounds apply without a smaller-order census:

|m|7|8|9|10|11|12|13|
|---|---|---|---|---|---|---|---|
|e(H) upper bound|16|21|27|31|37|43|49|

Proof: Each N_H(u) is triangle-free and I4-free, hence d_H(u)<=8.
Each antineighborhood M_H(u) is K4-free and I3-free, hence has order
at most8. Thus m-9<=d_H(u)<=8.

For a vertex of degree d, the triangle-free graph H[N_H(u)] has at
most floor(d^2/4) edges. It also has maximum degree at most3: four
neighbors of any of its vertices would be independent and give I4
in H. Thus it has at most floor(3d/2) edges. Put

```text
f(d)=min(floor(d^2/4),floor(3d/2)).
```

The triangle-free extremal bound follows from summing d(x)+d(y)<=d
over its edges and Cauchy-Schwarz. Every triangle is counted in the
neighborhoods of its three vertices. The
number of nonhomogeneous triples is (1/2)sum_u d(u)(m-1-d(u)), since
each nonhomogeneous triple is counted twice by its two incident
edge/nonedge choices. H has no independent triple only when explicitly
stated, so retain the independent-triple term i3(H)>=0 in

```text
t(H)+i3(H)=C(m,3)-(1/2)sum_u d(u)(m-1-d(u)).
```

Use the complementary neighborhood bound as well. The complement of H
is also K4/I4-free. Apply precisely the same f bound to each of its
neighborhoods. The independent triples are counted three times there:

```text
3*t(H)<=sum_u f(d(u)),
3*i3(H)<=sum_u f(m-1-d(u)).
```

Combining these inequalities with the identity gives the necessary condition

```text
3*C(m,3) <= sum_u g_m(d(u)),
g_m(d)=f(d)+f(m-1-d)+(3/2)*d*(m-1-d).
```

For each row in the following table, direct substitution in the at-most
nine allowed degree values gives g_m(d)+a*d<=c. Therefore

```text
3*C(m,3)<=m*c-a*sum_u d(u)=m*c-2*a*e(H),
e(H)<=(m*c-3*C(m,3))/(2*a).
```

|m|allowed degrees|a|c|rational edge cap|integer edge cap|
|---|---|---|---|---|---|
|7|0..6|7/2|31|16|16|
|8|0..7|4|42|21|21|
|9|0..8|5/2|43|27|27|
|10|1..8|6|74|95/3|31|
|11|2..8|11/2|82|37|37|
|12|3..8|6|98|43|43|
|13|4..8|9/2|100|442/9|49|

These deliberately sufficient bounds need no optimality assertion.

Search use: none pending independent review; proposed propagation of
the stated core edge caps.

Reviews: [review](review_five_column_compatibility_20261015_independent.md).

<a id="claim-five-columns-low-transversal"></a>
## 2. No degree-at-most-seven transversal of size at most eleven

Claim ID: `n43/d18/x136/five_column_compatibility.md#claim-five-columns-low-transversal`

Kind: local-deduction

Review state: accepted

Scope: the full frontier setting; every L subset A with |L|<=11 and
d_A(u)<=7 for all u in L. Actual-column status is not required.

Dependencies: Claim01; tau(F)>=4 and the degree floor9 on every four-set
transversal from the setting; Turan's theorem; the exact deletion identity.

Conclusion: L does not meet every independent four-set in A.

Proof: Suppose it does, and put ell=|L|. The tau bound excludes ell<4.
The degree floor9 excludes ell=4. Thus 5<=ell<=11. Put H=A-L. Since L
is a transversal, H is I4-free, and it is K4-free as a subset of A.
The complement of A[L] is K5-free because A is I5-free. Turan's theorem
therefore gives e(A[L])>=b4(ell), where

```text
b4(ell)=sum_(i=1..4) C(p_i,2),
p_i are the four balanced part sizes summing to ell.
```

The deletion identity yields

```text
e(H)=85-sum_L d_A+e(A[L])>=85-7*ell+b4(ell).
```

Every possible ell gives a strict contradiction to Claim01:

|ell|m=18-ell|b4(ell)|lower bound e(H)|upper bound e(H)|
|---|---|---|---|---|
|5|13|1|51|49|
|6|12|2|45|43|
|7|11|3|39|37|
|8|10|4|33|31|
|9|9|6|28|27|
|10|8|8|23|21|
|11|7|10|18|16|

All cardinalities up to eleven are covered; no claim for larger L is
needed below.

Search use: none pending independent review; proposed propagation of
nontransversality for each named L with the exact degree/size conditions.

Reviews: [review](review_five_column_compatibility_20261015_independent.md).

<a id="claim-five-columns-degree-eight-anchor"></a>
## 3. An unavoidable degree-eight independent-four anchor

Claim ID: `n43/d18/x136/five_column_compatibility.md#claim-five-columns-degree-eight-anchor`

Kind: local-deduction

Review state: accepted

Scope: every full equality-frontier candidate in the setting, before any r
or s split.

Dependencies: Claim02; total A degree170; maximum A degree13; the
independent-four degree-sum cap32; actual singleton classes in B.

Conclusion: A contains an independent four-set I with d_A(a)=8 for each
a in I. Every column meets I in one or two vertices. Each of the four
singleton signature classes has exactly three members and is a triangle;
there are exactly twelve singleton columns and twelve two-element columns.
Each a in I occurs in exactly six two-element signatures.

Proof: Let L={u in A:d_A(u)<=7}, ell=|L|. If ell>=11 then

```text
170=sum_A d_A<=7*ell+13*(18-ell)=234-6*ell<=168,
```

a contradiction. Thus ell<=10. Claim02 shows L is not a transversal,
so there is an I in F disjoint from L. Every a in I has degree at least8,
while sum_I d_A<=32. Hence all four degrees are exactly8.

Every actual B column meets I. The row sum gives
e(I,B)=sum_I(17-8)=36. The four singleton classes have size at most3,
so their total n1<=12. Every other column has signature size at least2,
and therefore

```text
36=e(I,B)>=n1+2*(24-n1)=48-n1>=36.
```

Equality throughout forces n1=12 and all remaining signatures to have
size exactly2. Each singleton class then has three members, and it is
a clique by the existing I5 obstruction, so is a triangle. Each anchor
vertex has nine B neighbors, three in its singleton class and six in
two-element signatures. This proves all quantifiers in the conclusion.

Search use: none pending independent review; proposed branching on an
unavoidable anchor, retaining all allowed selections, signatures, actual
B adjacencies, and completions. No unique canonical anchor is asserted.

Reviews: [review](review_five_column_compatibility_20261015_independent.md).

<a id="claim-five-columns-no-four-transversal"></a>
## 4. No four-set transversal; the r=1 branch is excluded conditionally

Claim ID: `n43/d18/x136/five_column_compatibility.md#claim-five-columns-no-four-transversal`

Kind: local-deduction

Review state: accepted

Scope: every full equality-frontier candidate; every abstract four-set
transversal T of I4(A). No r=1 or actual-column assumption is required.

Dependencies: Claim03; the degree floor9 on every four-set transversal.

Conclusion: tau(I4(A))>=5 and every actual B column has size at least5.
Consequently r=1 is impossible, and all r>=1 equality-frontier interfaces
are excluded on these premises. The surviving equality case is r=0 with
s=8..10, under the prior small-column counts.

Proof: The forced independent four-set I in Claim03 consists entirely of
degree-eight vertices. Every vertex of T has degree at least9. Thus
T intersect I is empty, contradicting that T meets every independent
four-set. The prior tau>=4 bound and the contradiction for size4 give
tau>=5. Every actual column is a transversal, so has size at least5.
This covers all r>=1, including r=1, without a size-five profile split.

This proves a transversal strengthening under the **full actual frontier
interface** assumptions. It does not prove the isolated theorem for every
18-vertex K4/I5-free graph with85 edges, since its degree-sum cap32 used
the actual24 columns and degree18 rows. It does not exclude r=0, x=136,
the general degree18 branch, or order43.

Search use: none pending independent review; proposed propagation of
column size>=5 and termination of the r=1 child after acceptance of the
entire dependency chain and its external premises.

Reviews: [review](review_five_column_compatibility_20261015_independent.md).

## Provenance and author audit

The source revisions read were:

|Dependency|SHA-256|
|---|---|
|frontier_band.md|0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54|
|transversal_four.md|4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e|
|x136/small_columns.md|f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733|
|x136/r2/low_excess_columns.md|e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff|

An initial unintegrated attempt incorrectly omitted the independent-triple
term from Goodman's identity. The author audit caught this before any
pruning or branch-status change. Claim01 replaces that attempt: it explicitly
retains both triple counts and bounds each using the appropriate graph and
its complement. The maximum-degree-three bound inside both triangle-free
neighborhood types supplies the needed strength.

The author rederived the triple identity by counting nonhomogeneous triples,
checked the degree-three bound in H and its complement separately, and
checked every degree in every table row with exact rational arithmetic.
The deletion table independently includes the balanced Turan lower bound.
The global degree budget proves ell<=10 before invoking Claim02. The final
contradiction only compares the established degree floor9 for transversals
with the unavoidable degree8 anchor. This is a self-check by the author,
not independent review. All claims remain ready, with Search use none.
