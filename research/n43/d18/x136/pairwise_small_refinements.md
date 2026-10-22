# Pairwise refinements of actual small columns at x=136

Date: 2026-10-14. Task token: `pairwise-small-20261014`.
Author: small-column agent. Base revision:
`81c768a683d3c3b3df70d4d3b7d03a67d505447b`.

These deductions combine actual-column compatibility with independent-four
anchor bounds. They do not assert an isolated transversal bound of five.
No enumeration, solver, download, installation, or literature novelty review
was performed. The coordinator independently accepted all five claims; exact proof hashes
and the review's external-premise limits are linked below.

## Setting and dependency audit

Throughout, G is an order-43 graph with no K5 and no I5. The selected pivot
v has degree 18, A=N(v), B=M(v), and x=e(A,B)=136. Thus |A|=18,
|B|=24, A is (4,5)-free, and B is (5,4)-free. In particular B has no I4;
this prohibition is not imposed on A.

The equality frontier gives e(A)=85 and d_G(a)=18 for every a in A, so

```text
d_cross(a)=17-d_A(a).
```

Put C_y=N_A(y), L4={y in B:|C_y|=4}, L5={y in B:|C_y|=5},
r=|L4|, s=|L5|, and

```text
H=sum_(y:|C_y|>=6)(|C_y|-6).
```

The four-transversal theorem gives |C_y|>=4. The small-column note gives:

```text
L4 is a clique completely joined to L5;
2r+s=8+H;
r=3 implies 2<=s<=3;
r=2 implies 4<=s<=7.
```

The pair-union assertion used below is rechecked directly: if y,z in B are
nonadjacent, D=A-(C_y union C_z) has no K4 because A has none, and no I3
because such a triple with y,z would give I5. Thus R(4,3)=9 implies
|D|<=8 and |C_y union C_z|>=10.

Every independent four-set I in A has

```text
sum_(a in I)d_A(a)<=32.
```

Indeed all 24 B columns meet I. For each a in I its exact singleton class
forms a clique, of size at most three; a nonadjacent pair in this class with
I-{a} would give I5, while a four-clique in the class with a would give K5.
At most twelve singleton columns and at least twelve larger signatures give
e(I,B)>=36. The equality row identity yields
e(I,B)=68-sum_I d_A, proving the displayed bound.

Finally d_A(a)>=6 for every a in A: deleting a leaves a (4,5)-free graph
of order 17 with at most 79 edges, so d_A(a)=85-e(A-a)>=6.
This uses the published upper extremum E(4,5,17)=79 recorded in
`../pivot_classes.md`, Section 2, citing Angeltveit--McKay,
*R(5,5)<=46*, arXiv:2409.15709v2, Appendix A Table 1.

Source revisions read for this handoff:

| Dependency | SHA-256 |
| --- | --- |
| `../frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| `../transversal_four.md` | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` |
| `../pivot_classes.md` | `43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233` |
| `transversal_five_attempt.md` | `2073f1bb0c9390795c352a226f9760ccad6767f709fddf8cc139a769f8727e4c` |
| `r4/exclusion.md` | `718d7efd114850a86715f2e4d2f28cc8d14bd2084390fc999f1120e6a6b344a0` |

Only the elementary core facts of the four-transversal attempt are used;
its full surviving-family classification is not a dependency. The next
vertex bound was independently obtained during discussion with the frontier
agent, by the deletion proof below. The coordinator should cross-reference
the frontier agent's general-q version after reviewing both notes.

<a id="claim-pairwise-small-01"></a>
## 1. Direct size-four-column vertex degrees

Claim ID: `research/n43/d18/x136/pairwise_small_refinements.md#claim-pairwise-small-01`

Kind: local-deduction

Review state: accepted

Scope: the setting above; every actual size-four column T=C_y and every a in T.

Dependencies: four-transversal theorem; published (4,4,14) upper edge
extremum 50 recorded in `transversal_five_attempt.md`, Sections 1 and 3;
R(3,4)=9. The census references are listed in that source's Sources section.

Conclusion: 9<=d_A(a)<=11. Moreover d_A(a)=11 implies that a is adjacent
in A to all other three vertices of T.

Proof: Let K=A-T. Since T meets every I4 of A, K is (4,4)-free on 14
vertices and e(K)<=50. For each t in T put S_t=N_K(t). This neighborhood
is triangle-free because A is K4-free, and has no I4 because K has none.
R(3,4)=9 gives |S_t|<=8. Thus d_A(a)<=8+3=11; equality requires three
neighbors inside T, proving the last assertion.

For the lower bound consider A-a. If T-{a} has at most two edges, the
three remaining attachment sets have total size at most 24, so

```text
e(A-a)<=50+24+2=76.
```

Otherwise T-{a} is a triangle. Each pairwise intersection of its three
attachment sets is independent: an edge there with the triangle's
corresponding edge would give K4. K has no I4, so each pair intersection
has size at most three. The triple intersection is empty, since one vertex
adjacent to the whole triangle would give K4. Inclusion-exclusion therefore
gives total attachment size at most 14+3*3=23. Hence again

```text
e(A-a)<=50+23+3=76.
```

In both cases d_A(a)=85-e(A-a)>=9. This covers all induced T types and
does not use the full four-transversal family classification.

Search use: propagate.

Reviews: [independent coordinator review](../review_pairwise-small_2026-10-14_coordinator.md),
reviewing the exact proof revision before metadata integration.

<a id="claim-pairwise-small-02"></a>
## 2. An overlap needs actual columns of size at least seven

Claim ID: `research/n43/d18/x136/pairwise_small_refinements.md#claim-pairwise-small-02`

Kind: local-deduction

Review state: accepted

Scope: the setting above; Q=L4, T_y=C_y for y in Q; each a in union_Q T_y.

Dependencies: Claim 01; pair-union assertion; B has no I4.

Conclusion: Put m(a)=|{y in Q:a in T_y}| and let h_a be the number of
neighbors z of a in B with |C_z|>=7. Then m(a)<=3. If m(a)=2, then
d_A(a)>=12-h_a and h_a>=1. If m(a)=3, then
d_A(a)=14-h_a and h_a>=3. Consequently H bounds these resources:
h_a<=|{z in B:|C_z|>=7}|<=H.

Proof: Q is a clique, so m(a)=4 would give K5 with a. For z in B-Q with
|C_z|<=6 and a in C_z, z must be adjacent to every y in Q whose column
contains a. Otherwise the pair-union assertion would require
|T_y union C_z|>=10, whereas its size is at most 4+6-1=9.

If m(a)=2, any edge between two such z vertices would give K5 with a
and those same two Q vertices. Thus these z vertices form an independent
set in B, of size at most three. The cross degree is at most 2+3+h_a,
so 17-d_A(a)<=5+h_a. This gives d_A(a)>=12-h_a; Claim 01 then
forces h_a>=1.

If m(a)=3, even one such z would give K5 with a and its Q triangle.
Therefore all other cross neighbors have columns of size at least seven.
The cross degree is exactly 3+h_a, and hence d_A(a)=14-h_a.
Claim 01 forces h_a>=3.

Finally every column of size at least seven contributes at least one unit
to H, proving the resource bound.

Search use: propagate.

Reviews: [independent coordinator review](../review_pairwise-small_2026-10-14_coordinator.md),
reviewing the exact proof revision before metadata integration.

<a id="claim-pairwise-small-03"></a>
## 3. Three size-four columns are excluded at x=136

Claim ID: `research/n43/d18/x136/pairwise_small_refinements.md#claim-pairwise-small-03`

Kind: local-deduction

Review state: accepted

Scope: the setting above, with the additional assumption r=3.

Dependencies: Claims 01--02; small-column count/s bounds;
independent-four anchor sum bound; E(4,5,17)=79; four-transversal theorem.

Conclusion: r=3 is impossible. Together with the existing audited r=4
exclusion, only r=0,1,2 remain at x=136. This is a local branch closure;
it does not exclude x=136 or decide order 43.

Proof: Name the three size-four signatures T_1,T_2,T_3. The existing
small-column bounds give s=2 or 3 and

```text
H=2r+s-8=s-2<=1.
```

By Claim 02, no vertex can belong to all three T_i. Any vertex belonging
to two must have h_a>=1. If H=0 there are no such vertices. If H=1,
there is exactly one column of size at least seven, and it has size seven.
An overlap vertex has h_a=1 and d_A(a)>=11; Claim 01 gives d_A(a)=11.
It is therefore adjacent in A to all other vertices in either T_i
containing it.

Let O={a in A:m(a)=2}. Each vertex of O is universal inside each of its
two T_i. For any two distinct vertices of O, their two-element sets of
indices are subsets of {1,2,3} and hence intersect. The two vertices share
a T_i and are adjacent there. Thus O is a clique in A; since A is K4-free,

```text
|O|<=3.
```

The four-transversal theorem says no set of size at most three can meet
every independent four-set of A. There is consequently an independent
four-set I disjoint from O. It must meet each T_i, since every actual
column meets every I4. The three intersections use three distinct vertices:
one vertex in two T_i would lie in O, while a triple intersection has
already been excluded. Choose a_i in I intersect T_i for i=1,2,3.
Claim 01 gives d_A(a_i)>=9. The fourth vertex of I has degree at least
six by E(4,5,17)=79. Therefore

```text
sum_(a in I)d_A(a)>=9+9+9+6=33.
```

This contradicts the independent-four anchor upper bound 32.
Both s cases are covered. The argument also applies if I's fourth vertex
belongs to one of the T_i, since the degree lower bound six remains valid.

Search use: terminate the r=3 child after independent acceptance of the
claim and its census dependencies; propagate r<=2 together with the
existing r=4 exclusion and r<=4 coverage.

Reviews: [independent coordinator review](../review_pairwise-small_2026-10-14_coordinator.md),
reviewing the exact proof revision before metadata integration.

<a id="claim-pairwise-small-04"></a>
## 4. Remaining r=2 overlap filters

Claim ID: `research/n43/d18/x136/pairwise_small_refinements.md#claim-pairwise-small-04`

Kind: local-deduction

Review state: accepted

Scope: the setting above, r=2; T_1,T_2 are the two actual size-four
columns and h=|{z in B:|C_z|>=7}|.

Dependencies: Claims 01--02; H=s-4; pair-union bound; K5 prohibition.

Conclusion:

- Every overlap vertex lies in at least one actual column of size at
  least seven and has d_A>=12-h, with h<=H=s-4.
- If h=0, T_1 and T_2 are disjoint. In particular s=4 forces disjointness.
- If h=1, every overlap vertex belongs to the unique large column, has
  d_A=11, and |T_1 intersect T_2|<=2. In particular these conditions apply
  when s=5, or when s=6 with a single size-eight column.
- If s=6 and an overlap vertex has d_A=10, there must be exactly two
  size-seven columns, and that vertex belongs to both of them.

Proof: The first two assertions follow from Claim 02. At h=1 the same
claim gives d_A>=11 and the membership in the unique large column;
Claim 01 gives equality. Such vertices are universal inside both T_i,
so the overlap is a clique. The two corresponding B vertices form an
edge. Three mutually adjacent A vertices in their common column
intersection would give K5 with that edge, so the overlap has size at
most two.

If s=6 then H=2. A single size-eight column or two size-seven columns
are the only ways to have columns larger than six. If an overlap vertex
has d_A=10, Claim 02 gives h_a>=2. Thus the two-size-seven alternative
is necessary, and the vertex belongs to both. This is a necessary filter;
no realizability assertion is made.

Search use: propagate; none of these r=2 filters closes that branch.

Reviews: [independent coordinator review](../review_pairwise-small_2026-10-14_coordinator.md),
reviewing the exact proof revision before metadata integration.

## Pairings and limits

The new r=3 closure requires three notes to interact: the small-column
count forces H<=1, actual-column overlap compatibility forces overlap
vertices to be universal in their T_i, and the independent-four anchor
bound conflicts with a four-set avoiding that small overlap clique.
The four-transversal theorem supplies that avoidance rather than merely
the lower bound on individual column sizes.

The same argument gives useful r=2 filters, but the degree sum of two
column-selected vertices and two arbitrary vertices is only 9+9+6+6=30.
Thus the existing anchor upper bound 32 does not yield a parallel r=2
closure. No inference is made from this gap about satisfiability.

After independent review, the coordinator should update the r partition
and branch navigation with exact hypotheses, retain the r=3 README as a
closed historical branch, and record the derivation in the shared report.
The author has not edited shared indexes or the Git index.

<a id="claim-pairwise-small-05"></a>
## 5. An r=2 overlap also spends edge-codegree capacity

Claim ID: `research/n43/d18/x136/pairwise_small_refinements.md#claim-pairwise-small-05`

Kind: local-deduction

Review state: accepted

Scope: the setting above, r=2; T_1,T_2 are the two size-four columns;
every a in T_1 intersect T_2. Let h_a count a's B-neighbors with column
size at least seven.

Dependencies: Claims 01--02; pair-union bound; small-column incidence
bound `5s<=36-|T_1 intersect T_2|` from `small_columns.md`, Section 2;
R(3,4)=9; B has no I4.

Conclusion: Every such overlap vertex satisfies

```text
d_A(a)>=max(12,6+s)-h_a.
```

At s=7 the overlap has size at most one, and each overlap vertex has
h_a>=2 and d_A(a)>=10. The H=3 possibilities have these consequences:

- A single size-nine column forces T_1 and T_2 to be disjoint.
- One size-eight and one size-seven column force any overlap vertex
  to belong to both, with d_A=11.
- Three size-seven columns permit an overlap vertex of degree ten only
  if it belongs to all three. A degree-eleven overlap vertex must belong
  to at least two of them.

These are necessary interface filters, not realizability assertions.

Proof: Write Q={q_1,q_2} for the corresponding B edge. Its common
neighborhood in B has at most eight vertices: that neighborhood is
triangle-free, since a triangle with Q would give K5, and has no I4
because B has none. R(3,4)=9 applies. All s vertices of L5 belong to
this common neighborhood, since size-four and size-five columns are
completely joined. Thus it contains at most 8-s vertices outside L5.

At most one vertex of L5 can be adjacent to a. If two were, their columns
would intersect at a, so they would be adjacent by the pair-union bound.
Those two vertices together with Q and a would give K5.

Every neighbor z of a in B-Q with column size at most six is adjacent
to both q_i by the pair-union argument in Claim 02. Among such vertices
there are therefore at most 8-s outside L5 and at most one inside L5,
for a total of at most 9-s. The cross-degree identity yields

```text
17-d_A(a)<=2+(9-s)+h_a,
d_A(a)>=6+s-h_a.
```

Together with Claim 02 this gives the general inequality.

For s=7, Claim 01 gives d_A<=11, so 13-h_a<=11 and h_a>=2.
The column budget gives H=s-4=3 and hence h_a<=3, proving d_A>=10.
The existing incidence inequality gives |T_1 intersect T_2|<=36-35=1.
The three listed partitions of H among columns larger than six are
exhaustive: 3, 2+1, or 1+1+1. The first has only one such column and
cannot supply h_a>=2. The second forces h_a=2 and d_A>=11, and hence
equality and membership in both. In the last, d_A=10 forces h_a>=3;
d_A=11 still requires h_a>=2. This proves all listed filters.

Search use: propagate; no additional r=2 closure.

Reviews: [independent coordinator review of Claim 05](../review_pairwise-small-05_2026-10-14_coordinator.md).
