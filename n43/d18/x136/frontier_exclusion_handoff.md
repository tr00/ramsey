# Candidate exclusion of the entire equality frontier

Date: 2026-10-15. Task token: `frontier-exclusion-handoff-20261015`.
Author and self-auditor: Codex. Base revision:
`ab4941bd3e4b4b0bcd89098482f5767bd3fc5925`.

**Handoff status: ready for independent review; not accepted.** The author
believes the argument below excludes every degree-18 rooted order-43
candidate with `x=136`, including the remaining `r=0` case. Each step has
an explicit proof and an author self-check. There has been no independent
review of this new argument. Do not change accepted branch status, update
the accepted theory map, or use these claims for pruning until a distinct
reviewer audits the exact revision and its dependencies.

The user requested a handoff and commit to end the session. No graph search,
enumeration, solver, proof checker, canonicalizer, download, installation,
or literature novelty review was performed. No novelty claim is made. Even
if this argument is accepted, `x>=137`, other degree-18 profiles, and the
remaining order-43 schemes stay open; it would not determine `R(5,5)`.

## Setting and already accepted inputs

Suppose G is a simple graph of order43 with neither K5 nor I5. Fix a
degree-18 vertex v and set

```text
A=N_G(v), |A|=18;
B=V(G)-({v} union A), |B|=24;
C_y=N_G(y) intersect A for y in B;
x=e_G(A,B)=136.
```

A is K4/I5-free and may contain independent four-sets; B is K5/I4-free.
All degrees `d_A` below refer to the induced graph on A. The following
inputs are from existing project results, not new claims in this note:

1. `e(A)=85`, every vertex of A has global degree18, and
   `|N_B(a)|=17-d_A(a)`. In particular `sum_A d_A=170`.
   See [the equality budget](../frontier_band.md).
2. `6<=d_A(a)<=13`. The floor uses the published order-17 (4,5) maximum79;
   the ceiling uses `R(3,5)=14`. See
   [the frontier setting](five_column_compatibility.md#setting-and-precise-external-inputs)
   and [the earlier degree proof](r2/low_excess_columns.md).
3. For **every** independent four-set X in A,
   `sum_(a in X)d_A(a)<=32`. This uses the actual24 B columns: every column
   meets X, each exact singleton class has at most three members, and hence
   `e(X,B)>=36`; the row identity then gives `sum_X d_A<=68-36=32`.
4. There is an independent four-set I in A all of whose internal degrees
   are eight. Relative to I, the B columns have exactly twelve singleton
   signatures in four triangle classes of size three, and twelve double
   signatures. See the accepted
   [degree-eight anchor theorem](five_column_compatibility.md#claim-five-columns-degree-eight-anchor).
5. Every set meeting all independent four-sets of A has size at least five,
   including abstract transversals, not only actual columns. See the accepted
   [transversal theorem](five_column_compatibility.md#claim-five-columns-no-four-transversal).
6. The following valid upper edge caps for K4/I4-free remainders are available:

   | Order m | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 |
   | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
   | Upper cap U(m) | 0 | 0 | 1 | 3 | 5 | 8 | 12 | 16 | 21 | 27 | 31 | 36 | 42 | 48 |

   For m<=9 except m=4 these bounds follow from Turan's K4-free bound
   `floor(m^2/3)`; at m=4 the forbidden K4 gives cap5. The m=10 cap31 is
   [frontier core Claim01](five_column_compatibility.md#claim-five-columns-core-caps).
   The m=11 and13 caps36 and48 are the accepted
   [finite core caps](../sos_finite_moments.md#claim-finite-core-caps).
   The m=12 cap42 is the accepted
   [order-twelve addendum](../sos_order12_addendum.md#claim-order12-cap42).
   At order9, equality in the K4-free cap27 forces `K(3,3,3)` by Turan's
   equality theorem.

The accepted integration banners and linked independent reviews govern
inputs4--6; historical author-stage labels inside those files are preserved.
Their external census dependencies have not been recertified here. The
[baseline](../../../docs/mathematical_baseline.md) records the source chain.

For a deletion set S the identity used throughout is

```text
e(A-S)=85-sum_(a in S)d_A(a)+e(A[S]).
```

## 1. A degree-eight anchor doubles every outside A vertex

<a id="claim-frontier-handoff-double-domination"></a>

Claim ID: `n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-double-domination`

Kind: local-deduction. Review state: ready.

Scope: the full equality-frontier setting; every independent four-set I in A
whose four internal degrees are eight; every a in A-I.

Dependencies: inputs1 and3; exact singleton capacities, rederived below.

Conclusion: `|N_A(a) intersect I|>=2` for every a in A-I.

Proof. Every B column meets I. For each i in I, the B vertices whose exact
I signature is `{i}` form a clique, since two nonadjacent such vertices
together with `I-{i}` would give I5. This clique has order at most three,
since four members together with i would give K5. Thus at most twelve
columns have singleton signatures. The four row sums give

```text
e(I,B)=4*(17-8)=36.
```

The other B signatures have size at least two, so
`36>=n1+2*(24-n1)=48-n1>=36`. Equality forces exactly three B
vertices in each singleton class, as in input4. This proof works for any
all-degree-eight independent four-set, not only an initially chosen anchor.

Now take a in A-I. It cannot miss all of I, since that would give I5.
If its exact I signature were `{i}`, it would have to be adjacent to all
three B vertices in the `{i}` singleton class: a nonedge with any member,
together with `I-{i}`, would give I5. Those three B vertices already form
a triangle and all are adjacent to i; a is also adjacent to i. Hence
these five vertices would give K5. Therefore a has at least two I neighbors.

Search use: none pending independent review; proposed propagation on each
actual degree-eight independent-four anchor. Reviews: none.

## 2. Three disjoint degree-eight anchors are impossible

<a id="claim-frontier-handoff-three-anchors"></a>

Claim ID: `n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-three-anchors`

Kind: local-deduction. Review state: ready.

Scope: the full equality-frontier setting; three pairwise disjoint
independent four-sets I,J,K, all of whose vertices have internal degree8.

Dependencies: Claim01; input1; Turan's K4-free bound on six vertices.

Conclusion: No such triple exists.

Proof. Put D=I union J union K, so |D|=12, and R=A-D, so |R|=6.
For any two of the three anchors, Claim01 gives at least two neighbors in
one anchor for each of the four vertices of the other. Thus each of the
three cuts between anchors has at least eight edges and `e(A[D])>=24`.
The degree sum over D is exactly96. Consequently

```text
85=e(A)=96-e(A[D])+e(A[R])
        <=96-24+12=84,
```

where the last cap is Turan's theorem for the K4-free graph A[R]. This is
a contradiction. No I4 prohibition was imposed on R.

Search use: none pending independent review; proposed rejection of an actual
triple of disjoint degree-eight anchors. Reviews: none.

## 3. No degree-six vertex, and at most one degree-seven vertex

<a id="claim-frontier-handoff-low-degrees"></a>

Claim ID: `n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-low-degrees`

Kind: local-deduction. Review state: ready.

Scope: the full equality-frontier setting, before any r or s split.

Dependencies: Claims01--02; inputs1--4 and6; Turan's theorem and equality.

Conclusion: Every vertex of A has internal degree at least eight, with the
possible exception of exactly one vertex of degree seven. In particular
there are no degree-six vertices.

Proof. Let `L={a in A:d_A(a)<=7}` and `ell=|L|`. Input2 gives
`170<=7*ell+13*(18-ell)=234-6*ell`, hence `ell<=10`.
Every independent four-set avoiding L consists entirely of degree-eight
vertices: all four degrees are at least8 and their sum is at most32.
Choose an initial degree-eight anchor I using input4; it is disjoint from L.

Suppose first that `ell>=2`. If `I union L` met every I4, its remainder
would be K4/I4-free of order `14-ell`. Each L vertex has at least two I
neighbors by Claim01. Also `e(A[L])>=b4(ell)`, where b4 is the sum of
`C(p_i,2)` for four balanced part sizes summing to ell; this is Turan's
bound applied to the K5-free complement of A[L]. The deletion identity gives

```text
e(A-(I union L))>=85-32-7*ell+2*ell+b4(ell)
                =53-5*ell+b4(ell).
```

Every possible ell gives a strict contradiction to the relevant core cap:

| ell | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| b4(ell) | 0 | 0 | 0 | 1 | 2 | 3 | 4 | 6 | 8 |
| Remainder order | 12 | 11 | 10 | 9 | 8 | 7 | 6 | 5 | 4 |
| Edge lower bound | 43 | 38 | 33 | 29 | 25 | 21 | 17 | 14 | 11 |
| Upper cap | 42 | 36 | 31 | 27 | 21 | 16 | 12 | 8 | 5 |

Thus there is a second degree-eight anchor J disjoint from I and L.
By Claim01, `e(I,J)>=8` and every L vertex has at least four neighbors
in I union J. If `I union J union L` were a transversal, its K4/I4-free
remainder of order `10-ell` would satisfy

```text
e(A-(I union J union L))
 >=85-64-7*ell+8+4*ell+b4(ell)
 =29-3*ell+b4(ell).
```

Again every value gives a strict contradiction:

| ell | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Remainder order | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
| Edge lower bound | 23 | 20 | 17 | 15 | 13 | 11 | 9 | 8 | 7 |
| Upper cap | 21 | 16 | 12 | 8 | 5 | 3 | 1 | 0 | 0 |

It follows that a third I4 avoiding I,J,L exists and is another degree-eight
anchor, contradicting Claim02. When the remainder has fewer than four
vertices, that existence is itself impossible; those rows are also excluded.
This rules out every `ell>=2` case.

It remains to rule out `ell=1` when the sole low vertex u has degree6.
If `I union {u}` were a transversal, its order13 remainder would have

```text
e(A-I-u)=85-32-6+|N_A(u) intersect I|>=49>48.
```

Therefore choose a second degree-eight anchor J avoiding I and u.
Let `R=A-(I union J union {u})`, of order9. If R had an I4 it would
be a third disjoint degree-eight anchor, prohibited by Claim02. Hence R
is K4/I4-free, and

```text
27>=e(A[R])=85-64-6+e(A[I union J union {u}])
            >=15+8+4=27.
```

Equality forces `e(I,J)=8`, precisely four neighbors of u in I union J,
and `A[R]=K(3,3,3)` by Turan's equality case. Each vertex of R has six
neighbors within R and at least two in each of I,J, so its A degree is
at least10. The two remaining neighbors of u lie in R. They cannot meet
all three tripartite parts, so u misses an entire independent part P of
order3. The independent four-set `{u} union P` has degree sum at least
`6+3*10=36`, contradicting input3's cap32. This excludes the single
degree-six case and completes the proof.

Search use: none pending independent review; proposed internal degree
propagation. Reviews: none.

## 4. Column incidences exclude both remaining low-degree cases

<a id="claim-frontier-handoff-exclusion"></a>

Claim ID: `n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-exclusion`

Kind: local-deduction. Review state: ready.

Scope: every order-43 K5/I5-free graph with a degree-18 root and `x=136`.
No root-maximization, canonical selection, regularity, r, or s assumption.

Dependencies: Claim03; inputs1--3 and5; actual-column transversality.

Conclusion: No such rooted candidate exists. If independently accepted,
the whole `x=136` branch would close and every degree-18 root of an
order-43 candidate would have `x>=137`.

Proof. Let `D8={a in A:d_A(a)=8}` and `t=|D8|`. Every vertex of D8
has exactly nine B neighbors by the row identity, so `e(D8,B)=9*t`.
Claim03 leaves exactly two cases.

**Case (a): no degree-seven vertex.** All A degrees are at least8, so
input3 puts every independent four-set entirely in D8. For each y in B,
`C_y intersect D8` is consequently a transversal of the entire I4 family
of A. Input5 gives at least five vertices in each of these24 projected
columns. Hence `9*t>=120`, so `t>=14`. But input2's degree ceiling gives

```text
170<=8*t+13*(18-t)=234-5*t,
```

so `t<=12`, a contradiction.

**Case (b): one degree-seven vertex u.** Every independent four-set
avoiding u consists entirely of D8 vertices. Therefore for every y in B,

```text
(C_y intersect D8) union {u}
```

meets every independent four-set in A: those containing u are met by u,
and all others are met by the actual column's D8 part. Since u is not
in D8, input5 implies `|C_y intersect D8|>=4`. Thus `9*t>=96`, so
`t>=11`. On the other hand,

```text
170<=7+8*t+13*(17-t)=228-5*t,
```

so `t<=11`. Consequently t=11 and there are six other A vertices.
Their degree sum is `170-7-11*8=75`; since each degree is at most13,
each of the six is at least `75-5*13=10`.

No independent four-set can contain one of those six vertices: even with
the unique degree-seven vertex and two degree-eight vertices its sum would
be at least `10+7+8+8=33>32`. Thus every I4 lies entirely in
`U=D8 union {u}`. Each actual column's projection to U is now a full
transversal and has size at least5. But

```text
120<=e(U,B)=11*(17-8)+(17-7)=99+10=109,
```

a final contradiction. Both cases are impossible.

Search use: none pending independent review; proposed termination of the
entire x136 branch, only after the complete dependency chain is accepted.
Reviews: none.

## Author self-check and exact handoff to the next agent

The new move is to apply the saturated singleton capacity in the **full
ambient graph**, including A vertices, rather than only within B. The proof
uses the B triangle in each singleton class to forbid an additional A
singleton. It does not infer that A is I4-free.

The author separately checked the following accounting points:

- Three anchors: `sum_D d_A=2*e(D)+e(D,R)=96`, hence
  `e(A)=96-e(D)+e(R)`; the six-vertex remainder only needs to be K4-free.
- First deletion: each low vertex contributes at least two edges into one
  anchor; second deletion: at least four into two anchors. Cuts between
  distinct anchors are counted once in `e(S)` and twice in their degree sum,
  as the deletion identity requires.
- Every new I4 obtained outside L has four degrees at least8; the cap32
  forces all four to equal8, allowing renewed use of singleton saturation.
- The unique degree-six equality case uses the order9 Turan equality, then
  constructs a named I4 with u. Its contradiction uses degrees in all of A,
  not only in the tripartite remainder.
- In the unique degree-seven case, the added u is an **abstract** transversal
  member even when the actual column omits u. This is permitted by input5;
  no column enlargement is claimed to preserve a full graph completion.
- Projections onto D8 or U are called full transversals only after proving
  the relevant support property of **every** independent four-set.

These are author self-checks, not independent review or a formal certificate.
No unresolved algebraic gap is presently known to the author. The next agent
should nevertheless start from the actual proof, not the summary or the
session's optimistic commentary.

Suggested audit order:

1. Independently rederive Claim01's full-graph singleton argument.
2. Verify Claim02's 84-edge contradiction and the exact deletion tables in
   Claim03, especially the single-degree-six equality case.
3. Check Claim04's projection quantifiers and the degree-nine elimination
   via the six-vertex degree sum75.
4. Recheck applicability and accepted exact revisions of the inherited
   order11/12/13 core caps, arbitrary-transversal bound5, and anchor theorem.
5. Record a sibling independent review naming this proof's SHA-256. If
   accepted, integrate the x136 closure and `x>=137` consequence in the branch
   navigation, reduction index, research dashboard, and theory map. If a gap
   is found, preserve the valid earlier claims and mark the affected claims
   changes-requested; do not silently replace this handoff.

No inference is made about whether any low-x root is unavoidable in every
order-43 candidate. This is a conditional rooted branch exclusion.

## Exact dependency snapshots

| File read | SHA-256 at author start |
| --- | --- |
| n43/d18/x136/five_column_compatibility.md | `2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e` |
| n43/d18/sos_finite_moments.md | `3475235a80af1c671a4b79768980e19be4e6ff370f54bcfdc1dd724cbc93c29f` |
| n43/d18/sos_order12_addendum.md | `1156aaa3b9e5e03a0a6eeaac80478ecfca637507ccc06c0988496e237a530549` |
| n43/d18/x136/r2/low_excess_columns.md | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` |
| n43/d18/x136/small_columns.md | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| n43/d18/frontier_band.md | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |

The proof's final file hash and committed handoff provenance belong in the
[historical report](../../../reports/2026-10-15-frontier-exclusion-handoff.md).
