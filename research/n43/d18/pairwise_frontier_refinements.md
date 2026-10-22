# Actual-column refinements across the degree-18 frontier band

Date: 2026-10-14. Task token: `pairwise-band-20261014`.
Author: frontier agent. Base revision:
`81c768a683d3c3b3df70d4d3b7d03a67d505447b`.

Pure mathematics; no graph search, enumeration, solver, download, or
installation. No literature novelty claim is made. The coordinator accepted the four claims in an independent review of the
exact proof revision, linked below.
The x=137 four-column conclusion was independently reached here while the
external `band137-r4-20261014` task was working on the same conclusion. That
conclusion is recorded as a cross-check, with integration left to the
coordinator. This file does not own or replace the other task's proof note.

## Setting and dependency audit

Let G have order 43 and contain neither K5 nor I5. Fix a degree-18 vertex v;
write A=N(v), B=M(v), C_y=N_A(y), x=e(A,B)=136+k,
q=85-e(A), epsilon_z=d_G(z)-18, and E=sum_(a in A) epsilon_a.
The recorded global degree interval 18..24 and upper extremum
E(4,5,18)=85 imply q,E>=0 and k=2q+E. Vertexwise, including the edge to v,

```text
d_cross(a)=17+epsilon_a-d_A(a).
```

A is (4,5)-free and may contain I4. B is (5,4)-free, so B contains no I4.
Every C_y meets every I4 in A, irrespective of q: an I4 missed by C_y with
y would be an I5. For q<=2, the previously proved four-transversal bound
additionally implies |C_y|>=4 for every y. Its census input is the published
(4,4,15) minimum edge count 50. The direct degree lemma below only uses
that a particular size-four column exists; it does not need q<=2.

For any nonadjacent y,z in B, A-(C_y union C_z) is (4,3)-free. Thus
R(4,3)=9 gives |C_y union C_z|>=10. In particular, Q=L4, the vertices
whose columns have size four, form a clique and |Q|<=4; Q is completely
joined to L5, the vertices whose columns have size five. These assertions
remain valid even where the universal column lower bound is unavailable.

Source revisions used:

| Source | SHA-256 |
| --- | --- |
| `frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `x136/small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| `x136/r4/exclusion.md` | `718d7efd114850a86715f2e4d2f28cc8d14bd2084390fc999f1120e6a6b344a0` |
| `x136/transversal_five_attempt.md` | `2073f1bb0c9390795c352a226f9760ccad6767f709fddf8cc139a769f8727e4c` |
| `cliques_augmentation.md` | `4cb5c4bd34d7d45a3c42783fdf091ac3aae0acafcc6f6fd6203f83cf9d366b2c` |
| `pivot_classes.md` | `43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233` |

The full surviving-family classification in the transversal-five attempt is
not a dependency. Its recorded published (4,4,14) upper edge extremum 50
is used, and the elementary attachment arguments are rederived below.
The lower degree bound for arbitrary A vertices uses E(4,5,17)=79,
cited in `pivot_classes.md`, Section 2, to Angeltveit--McKay,
*R(5,5)<=46*, arXiv:2409.15709v2, Appendix A Table 1. No new literature
verification or catalogue acquisition was performed.

<a id="claim-pairwise-frontier-01"></a>
## 1. A direct vertex bound in every actual size-four column

Claim ID: `research/n43/d18/pairwise_frontier_refinements.md#claim-pairwise-frontier-01`

Kind: local-deduction

Review state: accepted

Scope: the setting above, every actual size-four column T=C_y, every a in T;
all q>=0 allowed by the parent branch.

Dependencies: (4,4,14) upper edge extremum 50; R(3,4)=9; Ramsey hypotheses.

Conclusion: 9-q<=d_A(a)<=11. If d_A(a)=11, a is adjacent to all three
other vertices of T. These bounds avoid the four-family classification.

Proof: Put K=A-T. Since T meets every I4, K is (4,4)-free on 14 vertices
and e(K)<=50. For t in T let S_t=N_K(t). This graph is triangle-free,
because a triangle with t would give K4 in A, and has no I4 as a subset
of K. Therefore |S_t|<=8 by R(3,4)=9. This gives d_A(a)<=8+3=11,
and equality forces three neighbors inside T.

Consider the three vertices T-{a}. If they span at most two edges,

```text
e(A-a)<=50+3*8+2=76.
```

Otherwise they form a triangle. The intersection of two of their attachment
sets is independent: an edge there with the corresponding triangle edge
would give K4. Its size is at most three since K contains no I4. Their
triple intersection is empty, as a vertex adjacent to the whole triangle
would give K4. Inclusion-exclusion, with the union contained in K, gives
the sum of their attachment sizes at most 14+3*3=23. Thus again
e(A-a)<=50+23+3=76. Subtracting from e(A)=85-q proves d_A(a)>=9-q.

Search use: propagate.

Reviews: [independent coordinator review](review_pairwise-frontier_2026-10-14_coordinator.md).

<a id="claim-pairwise-frontier-02"></a>
## 2. Larger columns are a vertexwise resource for overlaps

Claim ID: `research/n43/d18/pairwise_frontier_refinements.md#claim-pairwise-frontier-02`

Kind: local-deduction

Review state: accepted

Scope: the setting above; Q=L4 and a in union_(y in Q) C_y. No universal
column-size lower bound is needed for the vertexwise assertions.

Dependencies: Claim 01; pair-union bound; the vertexwise row identity;
B is I4-free.

Conclusion: Let m_a=|{y in Q:a in C_y}| and
J_a=|{z in B:|C_z|>=7 and a in C_z}|. Then m_a<=3. If m_a=2,

```text
d_A(a)>=12+epsilon_a-J_a,
J_a>=1+epsilon_a.
```

If m_a=3, then

```text
d_A(a)=14+epsilon_a-J_a,
J_a>=3+epsilon_a.
```

If every column has size at least four, put
H=sum_(z:|C_z|>=6)(|C_z|-6). Then J_a<=H. In the r=4 subcase one has
s=0 and H=k, so these necessary overlap costs apply with J_a<=k.

Proof: m_a=4 gives K5 on a and Q, so is impossible. Let z in B-Q have
|C_z|<=6 and contain a. For every y in Q with a in C_y, the union of
C_y and C_z has size at most 4+6-1=9. The pair-union bound forces z
adjacent to y. If m_a=2, all such z are adjacent to the same two Q
vertices and to a. An edge between two such z would give K5. They form
an independent set in B, of size at most three. Consequently
d_cross(a)<=2+3+J_a, and the row identity gives the first degree bound.
Claim 01's upper bound 11 then implies J_a>=1+epsilon_a.

If m_a=3, even one such z gives K5 with a and the corresponding Q
triangle. All cross neighbors outside Q therefore have size at least seven,
and d_cross(a)=3+J_a. The displayed equality and resource lower bound
follow from the row identity and Claim 01.

Every size-at-least-seven column contributes at least one to H, proving
J_a<=H. Under the universal column-size assumption, exact column counting
gives 2r+s=8-k+H. At r=4, a size-five column would extend Q to K5,
so s=0 and the identity gives H=k.

Search use: propagate; retain the actual J_a, rather than replacing it
by H wherever the interface is known.

Reviews: [independent coordinator review](review_pairwise-frontier_2026-10-14_coordinator.md).

<a id="claim-pairwise-frontier-03"></a>
## 3. Independent cross-check of the x=137 four-column exclusion

Claim ID: `research/n43/d18/pairwise_frontier_refinements.md#claim-pairwise-frontier-03`

Kind: local-deduction

Review state: accepted

Scope: the setting above with x=137 and r=4. This statement overlaps the
separate `band137-r4-20261014` task and is recorded for cross-checking.

Dependencies: Claims 01--02; k=2q+E; E(4,5,17)=79;
the four-transversal bound; independent-four singleton-signature count.

Conclusion: r=4 is impossible at x=137; thus r<=3 there. This is a
conditional small-column child exclusion, not an exclusion of x=137.

Proof: k=1 implies q=0,E=1. The column lower bound applies. Claim 02
gives H=1, so there is exactly one size-seven column and every other
column outside Q has size six. No vertex has m_a=3 because it would
need J_a>=3+epsilon_a>1. If m_a=2 then J_a<=1 and Claim 02 forces
epsilon_a=0 and d_A(a)>=11; Claim 01 gives d_A(a)=11.

The (4,5)-free graph A is K4-free on 18 vertices, so R(4,4)=18 gives
an independent four-set I. Every T_y=C_y for y in Q meets I. Let n_j
count vertices of I having m_a=j, for j=0,1,2. Then

```text
n_0+n_1+n_2=4,
n_1+2n_2>=4.
```

The deletion extremum E(4,5,17)=79 gives d_A(a)>=6 for every a in A.
Claim 01 gives degree at least nine for m_a=1, and the preceding argument
gives degree eleven for m_a=2. Therefore

```text
sum_(a in I)d_A(a)>=6n_0+9n_1+11n_2
                          =24+3n_1+5n_2>=34.
```

For completeness, if n_2=0 the lower bound is at least 36; if n_2=1
it is at least 35; if n_2=2 it is at least 34; and n_2>=3 gives at
least 39. These alternatives cover all counts.

Every B column meets I. For any a in I, its exact singleton class in B
is a clique: two nonadjacent class members with I-{a} would give I5.
The class has at most three vertices, since four with a would give K5.
At most twelve B vertices have singleton signatures and all others have
at least two I neighbors. Thus e(I,B)>=36. On the other hand the exact
row sum, with E_I=sum_(a in I)epsilon_a<=E=1, gives

```text
e(I,B)=68+E_I-sum_(a in I)d_A(a)<=68+1-34=35,
```

a contradiction. This uses the vertexwise excess budget and covers every
independent-four membership pattern; it does not infer row degrees from
the aggregate x alone.

Search use: terminate the x=137,r=4 child only after independent acceptance
and coordination with the other task's proof; propagate r<=3 there.

Reviews: [independent coordinator review](review_pairwise-frontier_2026-10-14_coordinator.md).

<a id="claim-pairwise-frontier-04"></a>
## 4. Exact triple classes sharpen the four-clique defect

Claim ID: `research/n43/d18/pairwise_frontier_refinements.md#claim-pairwise-frontier-04`

Kind: local-deduction

Review state: accepted

Scope: first any four-clique Q in the (5,4)-free graph B of order 24;
then the specialized setting Q=L4,r=4. The general statement does not
need any column-size assumption.

Dependencies: B has no K5 or I4; R(3,4)=9; the cross/global degree identity.

Conclusion: Every exact triple Q-signature class has size at most two.
Let n_j count external vertices z in B-Q with |N_Q(z)|=j and let
D=e_B(Q,B-Q). Then

```text
n_3=D-40+2n_0+n_1<=8,
D+2n_0+n_1<=48.
```

For Q=L4,r=4, put E_Q=sum_(y in Q)epsilon_y. Then D=44+E_Q and

```text
0<=E_Q<=4,
2n_0+n_1<=4-E_Q,
n_3=4+E_Q+2n_0+n_1.
```

Every Q edge ij has at most six external common neighbors. If p_ij is
the exact pair-class size and t_S is the exact triple-class size for
S subset Q, this also gives

```text
p_ij+sum_(S:|S|=3,{i,j} subset S)t_S<=6,
0<=t_S<=2.
```

At E_Q=4 the original equality pattern is recovered: all four triple
classes and all six pair classes have size exactly two. Away from equality
the low-Q-signature budget is stronger than the earlier aggregate defect
bound 3n_0+n_1<=8-2E_Q.

Proof: No external vertex has four Q neighbors because B has no K5.
Fix an exact triple S and let y be the omitted vertex of Q. Its class is
independent: an edge in the class with the Q triangle S would give K5.
The class is anticomplete to y. Three class vertices with y would give
I4 in B, so the class has size at most two. Summing the four classes
gives n_3<=8.

There are twenty external vertices. Therefore

```text
D-40=sum_(z in B-Q)(|N_Q(z)|-2)
    =-2n_0-n_1+n_3,
```

which proves the displayed general identities. For r=4 each y in Q
has column size four and B-degree 14+epsilon_y. Counting the Q cut from
its endpoint degrees gives D=4*14+E_Q-12=44+E_Q. Substitution proves
the specialized bounds.

The common B neighborhood of an edge ij is (3,4)-free, hence has at most
eight vertices by R(3,4)=9. Two are the other Q vertices, so at most six
are external, proving the exact-mask inequalities. If E_Q=4, the
low-signature bound forces n_0=n_1=0 and n_3=8. All four triple classes
therefore have size two. There are twelve pair-signature vertices, and
each pair-class bound is p_ij<=6-2-2=2. Summing six classes forces all
six sizes to equal two.

To compare with the previous aggregate defect, its pair-codegree count
is sum_z C(|N_Q(z)|,2)<=36. With D=44+E_Q, this rearranges to
3n_0+n_1<=8-2E_Q. The new bound implies this: writing d=4-E_Q,
2n_0+n_1<=d gives 3n_0+n_1<=2d, since n_0<=d. The converse need
not hold at the level of nonnegative integer count constraints.

Search use: propagate exact Q-signature counts and per-edge class bounds;
this claim alone closes no additional branch.

Reviews: [independent coordinator review](review_pairwise-frontier_2026-10-14_coordinator.md).

## Pairings, coverage, and further use

Claim 01 links the small-column attachment analysis to a deletion extremum,
removing a fragile family classification from later degree arguments.
Claim 02 pairs the global degree excess with the higher-column excess:
overlap needs actual larger columns containing the same vertex. Claim 03
cross-checks that this interaction can extend an exclusion beyond equality.
Claim 04 uses the I4 prohibition specifically in B to strengthen the
four-clique degree budget away from its equality endpoint.

The shared small-column task separately uses the q=0 version of Claim 01
and the overlap resource bound to exclude r=3 at x=136. Its overlap
vertices all have degree eleven and are universal in every containing
four-column. Among three columns any pair of two-column memberships
intersect, so these overlap vertices form a clique of size at most three.
The four-transversal theorem then supplies an I4 avoiding this clique;
three distinct column hits have degree at least nine and its fourth
vertex degree at least six, contradicting the anchor degree-sum bound 32.
That argument was independently checked here, but its statement, final
revision, and formal review belong to
`x136/pairwise_small_refinements.md#claim-pairwise-small-03`.

For q=1,2 Claim 01 supplies degree lower bounds eight and seven in actual
size-four columns. Claim 02 retains epsilon_a and J_a separately; a total
H bound cannot substitute for actual incidence in a future completion.
The r=4 specialization H=k requires excluding columns smaller than four;
it applies uniformly for q<=2, rather than to every degree-18 root.
These statements do not exclude any q>=3 profile, prove a transversal
bound of five, establish that a low-x root is unavoidable, or decide order 43.

The coordinator owns history, shared indexes, and theory-map integration.
Independent review must name this exact file hash and the numerical census
premises retained above before pruning use is promoted.
