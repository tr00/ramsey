# R(5,5) Search Results and Reduction Index

Last updated: 2026-10-18

This is the operational index for a future certified order-43 search. It
collects:

- the current case tree;
- exact pruning predicates and their preconditions;
- safe symmetry reductions;
- useful global identities;
- open branches and rejected shortcuts;
- implementation and certification requirements.

Detailed proofs are organized under `n43/`, with global and mixed notes in `docs/`. This file should state enough assumptions
to prevent a valid branch from being pruned accidentally.

## Status labels

- **[PUBLISHED]** Established in cited literature or a published complete
  census.
- **[PROVED-HERE]** Internally derived and independently audited, but not
  literature-checked for novelty.
- **[OPEN]** A target, conjecture, or incomplete reduction. Never use it to
  prune.
- **[REJECTED]** Tested and found false, unsupported, or too weak.
- **[DESIGN]** Proposed search/certification architecture rather than a
  mathematical theorem.

## 1. Global target

**[PUBLISHED]**

```text
43 <= R(5,5) <= 46.
```

The first decision problem is whether a graph `G` on 43 vertices can satisfy

```text
omega(G)<=4 and alpha(G)<=4.
```

- UNSAT at order 43 proves `R(5,5)=43`, using the established order-42
  construction.
- SAT supplies a directly checkable 43-vertex construction and moves the
  project to order 44.
- Do not attack 44 or 45 before deciding 43.
- Order-46 nonexistence is already proved.

## 2. Core notation

For a pivot vertex `v`, define:

```text
A = N_G(v)
B = V(G) - (A union {v})
d = |A|
b0 = |B| = 42-d
a = e(G[A])
b = e(G[B])
x = e_G(A,B)
```

### What is `x`?

`x` is the number of **cross edges between the pivot neighborhood and
antineighborhood**:

```text
x = |{uw in E(G) : u in A, w in B}|.
```

It is not a codegree, catalogue index, or SAT variable. In a cross-adjacency
matrix with rows indexed by `A` and columns by `B`, `x` is the number of ones.

For the degree-18 pivot branch:

```text
|A|=18, |B|=24.
```

If

```text
Delta_A = sum_(u in A) (d_G(u)-18),
```

then degree summation over `A` gives:

```text
x = 306 - 2a + Delta_A.
```

The published bound `a<=85` yields:

```text
x = 136 + 2(85-a) + Delta_A >= 136.
```

Thus `x=136` was the sharp equality frontier. Equality forces:

```text
a=85,
d_G(u)=18 for every u in A.
```

Update (2026-10-19): the equality case is excluded by the reviewed
[full-frontier closure](d18/x136/README.md); every degree-18 root now has
`x>=137`, so the forcing list above records an impossible profile and the
floor of every `x>=136` bound in this index is 137. Consequences and
consumer cross-comparison: [closure consequences](d18/x136_closure_consequences.md).

For navigable case folders, start at [n43/README.md](README.md) and
[the x136 r partition](d18/x136/README.md). This detailed index preserves
legacy mathematical content and status assertions.

## 3. Current branching tree

This is a prospective complete decomposition. The final implementation may
encode some nodes as SAT clauses rather than explicit generator branches.

```text
Order-43 (5,5)-Ramsey candidate G
|
+-- Global degree bounds: every degree is 18..24
|
+-- Up to complement, choose an even-degree pivot
|   |
|   +-- d(v)=18
|   |   |
|   |   +-- x=136
|   |   |   |
|   |   |   +-- a=85; all A-vertices have global degree 18
|   |   |   +-- 148<=b<=160
|   |   |   +-- every cross column has size at least 4
|   |   |   |
|   |   |   +-- all cross columns have size at least 5
|   |   |   |
|   |   |   `-- some cross column T has size 4
|   |   |       |
|   |   |       +-- 49-edge 14-core, T induces C4
|   |   |       |
|   |   |       `-- 50-edge 14-core
|   |   |           +-- T induces P4 or K1,3
|   |   |           +-- T induces C4 or a paw
|   |   |           `-- T induces K4-e
|   |   |
|   |   `-- x>=137
|   |       `-- refine by (85-a, Delta_A, b, degree sequence)
|   |
|   `-- d(v)=20
|       `-- general degree-20 branch; global degrees may be 18..24
|
`-- Alternative canonical root split
    +-- minimum degree 18
    +-- minimum degree 19
    `-- minimum degree 20
```

### Coverage warning

The even-pivot split is complete because:

1. a 43-vertex graph has an even-degree vertex;
2. allowed even degrees are 18, 20, 22, 24;
3. complementation maps 22 to 20 and 24 to 18.

Choosing a **canonical** pivot among possibly many candidates still requires a
verified tie rule or explicit coverage of all pivot choices.

## 4. Universal pruning predicates

These apply to every hypothetical order-43 candidate.

### 4.1 Degree bounds

**[PUBLISHED]** Using `R(4,5)=25`:

```text
18 <= d_G(v) <= 24.
```

Precondition: `G` has no `K5` and no independent 5-set.

Search use: propagate degree cardinalities; reject a partial graph once a
lower or upper degree bound cannot be met.

### 4.2 Neighborhood types

**[PUBLISHED]**

```text
G[N(v)] is (4,5)-free.
G[B] is (5,4)-free.
complement G[B] is (4,5)-free.
```

Search use: attach published edge extrema and local Ramsey constraints to each
pivot.

### 4.3 Pair codegree bounds

**[PROVED-HERE from published Ramsey numbers]**

Let `c(u,w)=|N(u) intersect N(w)|`.

If `uw` is an edge:

```text
max(d(u),d(w))-18 <= c(u,w) <= 13.
```

If `uw` is a nonedge:

```text
max(d(u),d(w))-17
  <= c(u,w)
  <= d(u)+d(w)-28.
```

Search use: reject partial pair signatures whose attainable codegree interval
misses these bounds.

### 4.4 Small common-cell bounds

**[PROVED-HERE from published Ramsey numbers]**

- An edge has at most 13 common neighbors.
- A nonedge has at most 13 common nonneighbors.
- A triangle has at most 4 common neighbors.
- An independent triple has at most 4 common nonneighbors.
- A mixed adjacency/nonadjacency cell for two anchors has at most 17 vertices.

At equality, several cells become regular critical graphs:

- a 13-vertex `(3,5)` cell is 4-regular;
- a 17-vertex `(4,4)` cell is 8-regular.

Search use: fast cardinality propagation and equality-triggered templates.

### 4.5 Forced homogeneous 4-sets

**[PROVED-HERE]**

Every vertex lies in a `K4` and in an independent 4-set. Globally:

```text
#K4(G) >= 33,
#I4(G) >= 33.
```

Search use: justify the availability of `K4`/`I4` anchors. The global counts
are weak and should not be used as primary branching criteria.

## 5. Pivot-interface predicates

Fix `v`, `A=N(v)`, and `B=M(v)`. For `u in A` and `y in B`, define:

```text
R_u = N_B(u)       # row signature
C_y = N_A(y)       # column signature
```

### 5.1 Exact forbidden-rectangle criterion

**[PROVED-HERE]**

Once `G[A]` and `G[B]` are fixed, the interface is valid exactly when:

1. no clique `P in A` and clique `Q in B`, with `|P|+|Q|=5`, form an all-one
   rectangle `P x Q`;
2. no independent `P in A` and independent `Q in B`, with
   `|P|+|Q|=5`, form an all-zero rectangle.

Search use: this is the semantic foundation of incremental row/column
generation.

### 5.2 Single-row bounds

Let `s_u=d_A(u)` and `r_u=|R_u|`.

**[PROVED-HERE]**

```text
d-18 <= s_u <= 13,
17-s_u <= r_u <= min(17,23-s_u).
```

Boundary triggers:

- `r_u=17` makes `G[R_u]` a 17-vertex 8-regular `(4,4)` graph.
- `r_u=4` forces `s_u=13` and global degree 18.
- `s_u=13` makes `G[N_A(u)]` a 13-vertex 4-regular `(3,5)` graph.

### 5.3 Single-column bounds

Let `t_y=d_B(y)` and `c_y=|C_y|`.

**[PROVED-HERE]**

```text
b0-14 <= t_y <= 17,
max(d-17,18-t_y) <= c_y <= min(d-4,24-t_y).
```

Boundary trigger:

```text
c_y=d-17
```

makes `G[A-C_y]` a 17-vertex 8-regular `(4,4)` graph.

### 5.4 Pair and higher intersections

**[PROVED-HERE]**

For `u,z in A`:

- if `uz` is an edge, `|R_u intersect R_z|<=8`;
- if `uz` is a nonedge,
  `|B-(R_u union R_z)|<=13`;
- every row difference has size at most 17.

For a clique in `A`:

- an edge has at most 8 common cross-neighbors;
- a triangle has at most 3 common cross-neighbors.

For an independent set in `A`:

- an independent pair has at most 13 common cross-nonneighbors;
- an independent triple has at most 4;
- an independent 4-set has none.

Dual statements hold for columns.

### 5.5 Forced adjacency from signatures

**[PROVED-HERE]**

For columns `C_y,C_z`:

- a triangle in `C_y intersect C_z` forces `yz` to be a nonedge;
- an independent triple in `A-(C_y union C_z)` forces `yz` to be an edge;
- if both occur, the signature pair is impossible.

Search use: derive internal `B` edges directly from selected cross columns.

## 6. Four-bit anchor predicates

### 6.1 Independent-4 anchor in `A`

Fix `X=I4 in A`. Every `y in B` has a nonempty four-bit signature:

```text
S_y=C_y intersect X.
```

**[PROVED-HERE]** For every independent `Q in B`:

```text
|union_(y in Q) S_y| >= |Q|.
```

Exact signature-class bounds:

```text
|S|=1: class size <= 3
|S|=2: class size <= 8
|S|=3: class size <= 17
|S|=4: class size <= 24
```

Aggregate incidence bound:

```text
e(X,B) >= 2|B|-12.
```

Equality forces four singleton classes of size 3 and all remaining signatures
to have size 2.

### 6.2 Clique-4 anchor in `B`

Fix `Y=K4 in B`. Each `u in A` has a nonempty missing signature:

```text
T_u=Y-R_u.
```

**[PROVED-HERE]** Clique signatures satisfy the dual Hall condition, and:

```text
e(A,Y) <= 2|A|+12.
```

Equality forces four singleton missing-signature classes of size 3 and all
remaining missing signatures to have size 2.

### 6.3 Simultaneous equality

**[PROVED-HERE]**

If both anchor bounds are equalities, every row and column of the anchored
`4 x 4` block has degree 2. Therefore the block is:

```text
C8
```

or

```text
C4 disjoint union C4.
```

This is rigid but not contradictory.

## 7. Catalogue-free quadratic interface predicates

Let:

```text
d=|A|,
b0=|B|,
a=e(A),
b=e(B),
x=e(A,B),
z=d*b0-x.
```

**[PROVED-HERE]**

```text
x^2/b0 - 4x <= 64a,
x^2/d  - 3x <= 78b,
z^2/b0 - 3z <= 78(C(d,2)-a),
z^2/d  - 4z <= 64(C(b0,2)-b).
```

Preconditions: the pivot split and the pair-intersection predicates above.

Search use: cheap scalar rejection before canonicalization or SAT.

## 8. Degree-18 branch

### 8.1 Published internal-edge ranges

**[PUBLISHED]**

For `d=18`:

```text
50 <= a <= 85,
144 <= b <= 160.
```

The second interval follows by complementing the published 24-vertex
`(4,5)` edge interval 116 through 132.

### 8.2 Cross-edge corridor

**[PROVED-HERE]**

```text
max(306-2a,432-2b)
  <= x
  <= min(279,414-2a,576-2b).
```

In particular:

```text
136 <= x <= 279.
```

The upper endpoint279 follows from the independently reviewed
[omitted-row tail exclusions](d18/independent_row_cuts.md): if t and s
count size-17 and size-16 rows, then s<=12-3t and 7t+8s<=72, giving
x<=280 without a census. Both equality profiles are excluded; the last
uses the recorded e(B)>=144 and all-vertex degree cap24. Thus x>=280
terminates on those premises. This argument does not use the reported
x136 closure. See its [exact-revision review](d18/review_independent_row_cuts_20261017_audit.md).

Search use: branch by `x`, or more economically by:

```text
h=85-a,
Delta_A=sum_(u in A)(d_G(u)-18),
x=136+2h+Delta_A.
```

### 8.3 The `x=136` frontier

**[PROVED-HERE]**

```text
a=85,
d_G(u)=18 for all u in A,
148<=b<=160.
```

If `b=148`, the whole graph is 18-regular.

For every independent `I=I4 in A`, writing

```text
C=e_A(I,A-I),
```

gives:

```text
25 <= C <= 32,
36 <= e(I,B) <= 43,
53 <= e(A-I) <= 60.
```
The strengthened bounds use the published `E(4,5,14)=60` on `A-I`,
which is `(4,5)`-free, not necessarily `(4,4)`-free. See the updated
[frontier anchor proof](d18/frontier_band.md#independent-four-anchor-defects).

**[PROVED-HERE; accepted independent mathematical review]** The entire
`x=136` branch is excluded: no order-43 K5/I5-free graph with a degree-18
root has `x=136`. Consequently every degree-18 root of an order-43
candidate has `x>=137`.

Proof: [frontier exclusion handoff](d18/x136/frontier_exclusion_handoff.md),
Claims 01--04, with [exact independent review](d18/x136/review_frontier_exclusion_handoff_20261019_main.md)
at file SHA-256 `c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`.
Chain: every all-degree-eight independent four-set anchor double-dominates
A (saturated B singleton classes forbid A singleton signatures by K5);
three disjoint anchors are impossible (`85=96-e(A[D])+e(A[R])<=84` with
Turan's K4-free cap on the six-vertex remainder); deletion-cap tables
against the reviewed K4/I4-free core caps force every A degree to at least
eight with at most one degree-seven exception (a sole degree-six vertex
dies in the Turan equality case `K(3,3,3)`); both surviving profiles
contradict the abstract transversal bound tau>=5 through the degree-eight
row budget `9*|D8|` (`t>=14>12` without the degree-seven vertex;
`t=11` and `e(D8 union {u},B)=109<120` with it).

Preconditions: the rooted equality-frontier setting of section 8.3,
including the actual24 B columns, global degree18 for every A vertex, the
reviewed degree-eight anchor and abstract tau>=5, and the reviewed core
caps 36/42/48 at orders 11/12/13. Rooted scope only: unavoidability of a
low-x degree-18 root in every candidate is not asserted. Search use:
terminate x136 completely, including r0. The degree-18 x>=137 siblings,
d20 and min-degree20 schemes, and the x>=143 residual remain open.

Rootwise corollaries, the floor sharpening for `x>=136` conclusions, and
the forced-q=0 upgrade are recorded in
[closure consequences](d18/x136_closure_consequences.md); the full
consumer cross-comparison is in the
[propagation report](../reports/2026-10-19-x137-propagation.md).


### 8.4 Four-vertex transversal bound

Put:

```text
F=complement G[A].
```

Then `F` has 18 vertices, 68 edges, independence number at most 3, and clique
number at most 4.

**[PROVED-HERE using a PUBLISHED 15-vertex census]**

```text
tau_K4(F) >= 4.
```

Every cross column `C_y` meets every `K4(F)`, so:

```text
|C_y|>=4 for every y in B.
```

Proof source: `n43/d18/transversal_four.md`.

### 8.5 Attempted strengthening to five

**[OPEN]**

```text
tau_K4(F) >= 5
```

is not proved.

If a size-four transversal `T` exists, work in `A0=G[A]` and put:

```text
K=A0-T.
```

The 14-vertex graph `K` is `(4,4)`-free. The following are the audited
surviving families:

1. `e(K)=49`, `A0[T]=C4`, and all four `T-to-K` degrees are 8.
2. `e(K)=50`, `A0[T]=P4` or `K1,3`, and all four degrees are 8.
3. `e(K)=50`, `A0[T]=C4` or a paw, with degrees `8,8,8,7`.
4. `e(K)=50`, `A0[T]=K4-e`; the tips have degree 8 and the shared-edge
   endpoints have degrees `8,6` or `7,7`.

Do not prune these families: they remain open.

Important correction:

> Common nonneighbors of a nonedge have independence number at most 2; they
> need not form a clique.

The invalid stronger claim previously produced a false elimination.

Details: `n43/d18/x136/transversal_five_attempt.md`.

### 8.6 Frontier band and anchor defects

**[PROVED-HERE, with the published census inputs of 8.1 and 8.4 and
E(4,5,14)=60 from Angeltveit-McKay, Appendix A, Table 1]**

For x=136+k, q=85-a and E_A=sum_A(d_G(u)-18), exactly:

```text
k=2q+E_A,
q=0,...,floor(k/2), E_A=k-2q,
E_B=sum_B(d_G(y)-18)=2b-296+k,
max(144,ceil((296-k)/2))<=b<=160,
e(G)=239+b+k-q.
```

The nonzero A excesses partition E_A, each part at most six. The
four-transversal proof works when e(complement A)<=70, so every column has
size at least four in every q<=2 subcase. In particular this holds uniformly
through x=141, not only at x=136. At x=142, only (a,E_A)=(82,0) falls
outside this proof; do not infer a three-transversal exists in that case.

For an independent four-set I in A, let E_I=sum_I(d_G(u)-18) and
C=e_A(I,A-I). Then:

```text
25-q<=C<=32+E_I,
36<=e(I,B)<=43+q+E_I,
53-q-E_I<=e(A-I)<=60.
```

If eta_I=e(I,B)-36, n1 counts singleton I signatures, and h is the sum
of (signature size minus two) over signatures of size at least three,
then eta_I=(12-n1)+h, with both terms nonnegative, and
`0<=eta_I<=7+q+E_I`. In particular at least `max(0,5-q-E_I)` columns
have singleton I signatures, and at most `7+q+E_I` have size at least
three on I. These are necessary incidence bounds, not branch exclusions.

Search use: exact degree-excess branches and defect-aware anchor propagation.
Proof: `n43/d18/frontier_band.md`.

### 8.7 Joint small-column predicates

**[PROVED-HERE]** Let r and s count size-four and size-five columns.

Every nonadjacent B pair satisfies |C_y union C_z|>=10. Consequently size-four
columns form a clique joined to all size-five columns; intersecting size-five
columns also force adjacency. Every A vertex lies in at most three of these
small columns, proving 4r+5s<=54.

```text
r:             0   1   2   3
maximum s:    10  10   7   3
```

If r=2 with signatures T1,T2, then 5s<=36-|T1 intersect T2|.
If every column has size at least four (in particular for q<=2), put
H=sum_(c_y>=6)(c_y-6). Then exactly 2r+s=8-k+H, H>=0.
After the independently reviewed full-interface transversal exclusion below,
the former necessary count range at x=136 was:

```text
(r,s)=(0,8..10);
```

that final case is now also excluded by the reviewed full-frontier closure
in section 8.3.

**[PROVED-HERE]** The `r=4` branch is impossible at `x=136`. Four size-four
columns would be pairwise disjoint as subsets of `A`; an independent 4-set in
`A` would then meet each exactly once. The audited internal-degree bounds give
at most 32 incidences from that anchor into `B`, contradicting the anchor
lower bound 36.

Proof: `n43/d18/x136/r4/exclusion.md`.

**[PROVED-HERE; accepted independent mathematical review]** The `r=3`
branch is also impossible at `x=136`. Its former s=2..3 range gives H<=1.
Any vertex in two size-four signatures must have A degree 11 and is universal
inside both; no vertex belongs to three. The overlap vertices form a clique
O of size at most three. The four-transversal theorem gives an independent
four-set avoiding O, meeting the three columns at distinct vertices of degree
at least nine. Its fourth vertex has degree at least six by E(4,5,17)=79;
the sum is at least 33, contradicting the anchor upper bound 32.

For `r=2`, s=4 forces disjoint size-four signatures. At s=5, their overlap
has size at most two, lies in the unique size-seven column, and has A degrees
11. At s=6, a degree-ten overlap vertex requires two size-seven columns and
belongs to both. These conditions do not close r=2.

Proof: [small-column refinements](d18/x136/pairwise_small_refinements.md),
Claims 01--04. [Exact independent review](d18/review_pairwise-small_2026-10-14_coordinator.md)
retains external premises. Search use: terminate exactly x136/r3 and propagate
the live r<=2 split; apply the r2 overlap conditions only at x136.

At x136/r2,s=7, an overlap has size at most one and its vertex needs at
least two incident columns of size seven or larger. The single size-nine
column alternative forces disjointness. With sizes eight and seven, an
overlap belongs to both and has A degree eleven; with three size-seven
columns, degree ten requires membership in all three.
Proof: same note, Claim 05;
[independent review](d18/review_pairwise-small-05_2026-10-14_coordinator.md).

**[PROVED-HERE; accepted independent mathematical reviews]** The entire
`x136/r2` branch is excluded by joint actual-column and transversal arguments.
Its former s=4..7 split is completely covered:

| Former s | Closure |
| --- | --- |
| 4 | No large column implies disjoint four-transversals, which are impossible |
| 5 | Sole large column forces a singleton overlap of degree eleven, which is impossible |
| 7 | Membership saturation forces a singleton overlap; an exact column incidence count forces its degree eleven |
| 6, one size-eight column | Same singleton-degree-eleven obstruction |
| 6, two size-seven columns | Overlap rows force one or two independent degree-ten vertices; two violate global nonedge codegree, and a singleton violates the new degree-ten transversal theorem |

For every four-set I4-transversal T, the new proof gives 9<=d_A(t)<=11
and 38<=sum_T d_A<=40. It prohibits two disjoint such transversals and
singleton intersections of degree ten or eleven. These statements use the
full equality-frontier independent-four anchor bound sum_I d_A<=32;
they are not universal claims about isolated 85-edge neighborhoods.

Proofs: [low-excess Claims 01--06](d18/x136/r2/low_excess_columns.md),
[triple Claims 02--04 and 06](d18/x136/r2/independent_triples.md).
Exact independent reviews:
[all low-excess claims](d18/x136/r2/review_low_excess_columns_20261014_triples.md),
[final singleton and full coverage](d18/x136/r2/review_singleton_ten_20261014_pivot.md),
[triple claims](d18/x136/r2/review_independent_triples_20261014_low_s.md),
and [two-overlap contradiction](d18/x136/r2/review_r2_remaining_20261014_pivot.md).
Search use: terminate exactly x136/r2, propagate r<=1 at equality together
with the earlier r3,r4 closures. Published extrema 85 at (4,5,18), 79 at
(4,5,17), 50 maximum at (4,4,14), and 50 minimum at (4,4,15) remain
external premises. No x136, degree18, or order-43 closure is implied.

**[PROVED-HERE; accepted independent mathematical review]** The full
equality frontier has no four-set I4-transversal, so all r>=1 interfaces,
including the entire former r1:s6..10 branch, are excluded. Every actual
column has size at least five. Every candidate has an independent four-set
I in A with all internal degrees eight. Relative to I, its24 actual columns
have twelve singleton signatures in four triangle classes of size three,
and twelve two-element signatures; each anchor vertex occurs in six of
the two-element signatures. Pair-signature multiplicities remain unrestricted
except by the proved counts and all other interface constraints.

Proof: [four reviewed claims](d18/x136/five_column_compatibility.md), with
[exact independent review](d18/x136/review_five_column_compatibility_20261015_independent.md).
The proof first bounds K4/I4-free core edges at orders7..13 by elementary
triangle counts in the graph and its complement. Deleting a transversal of
at most eleven degree-at-most-seven vertices contradicts these caps. The
full low-degree set has size at most ten by total degree170 and ceiling13,
so some I4 avoids it; the actual-interface degree-sum cap32 makes all four
degrees eight. Every four-set transversal has all degrees at least nine
by the existing unrestricted deletion lemma, and therefore misses that I4.

Preconditions: order43 K5/I5-free G, chosen degree18 pivot, and x=136,
including all24 actual B columns and global degree18 for every A vertex.
Published small Ramsey numbers, extrema85 at (4,5,18),79 at (4,5,17),
maximum50 at (4,4,14), and minimum50 at (4,4,15) remain external premises.
Search use: propagate column size>=5 and the exact anchor signatures;
terminate x136/r1 and every x136/r>=1; branch on an unavoidable anchor
only with all allowed choices and completions retained. No isolated85-edge
neighborhood theorem, unique anchor, or canonical-root omission is implied.
The remaining r0:s8..10 range was necessary, not a realizability claim;
the complete x136 branch is now closed by the reviewed
[full-frontier exclusion](d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-exclusion)
recorded in section 8.3 above, which is independent of r and s.

A nonadjacent size-five pair has disjoint signatures. Their complement D in
A has eight vertices, degrees four or five, with respectively 0,2,or4
degree-five vertices, 16,17,or18 edges, and 8,10,or12 triangles. Degree-five
neighborhoods are C5; at the 18-edge endpoint degree-four neighborhoods are C4.
An independent triple of size-five columns leaves a three-vertex clique in A.

Search use: joint overlap, induced-cell and column-count predicates.
Proof: `n43/d18/x136/small_columns.md`. The overlap and eight-vertex
results use only published small Ramsey numbers, not graph catalogues.

### 8.8 Four-clique degree budget and equality pattern

**[PROVED-HERE]** For every Q=K4 in the 24-vertex (5,4)-free B:

```text
sum_Q d_B(y)<=60,
sum_Q c_y>=12+sum_Q(d_G(y)-18).
```

At equality each Q vertex has B degree 15. The 20 external B vertices have
exact Q signatures of size two or three, with two vertices in each of the
six pair classes and four triple classes. Internal edges among those classes
must still be checked; the equality pattern is not a contradiction.

For four size-four columns Q, their total degree excess is at most four.
If it equals four, all Q vertices have global degree 19 and the equality
pattern above applies. This does not require x=136.

Search use: degree-sum and signature-class propagation at any four-clique.
Proof: `n43/d18/cliques_augmentation.md`, using only R(3,4)=9.

**[PROVED-HERE; accepted independent review]** Every exact triple-Q class
in B-Q has size at most two: the class is independent and anticomplete to
the omitted Q vertex, with three members forbidden by I4 in B. For Q=L4
of size four, if n_j counts external Q signatures of size j and E_Q is
the total degree excess of Q, then
`n_3=4+E_Q+2n_0+n_1<=8`, hence `2n_0+n_1<=4-E_Q`.
Each Q edge additionally has at most six external common neighbors. These
mask/degree propagation bounds hold wherever such Q exists, independently
of x; they alone do not exclude a branch. Proof:
[frontier Claim 04](d18/pairwise_frontier_refinements.md#claim-pairwise-frontier-04),
[exact review](d18/review_pairwise-frontier_2026-10-14_coordinator.md).

### 8.9 Safe augmentation at a=84

**[PROVED-HERE, using the published extremal bound a<=85]** A safe missing
edge means adding it creates no K4, equivalently its common A neighborhood
contains no edge. At a=85 no such edge exists. At a=84 there are at most
three, forming a union of stars. Any two additions jointly create K4:
disjoint safe edges have all four cross edges present in A; incident ones
have their other endpoints adjacent in A.

Therefore an 84-edge neighborhood either is already K4-saturated or has at
most three possible single-edge augmentations to an 85-edge (4,5)-free graph.
Do not assume the saturated category is empty. This applies in every q=1
subcase, regardless of x or A degree excess.

Search use: near-extremal internal-graph classification and pruning.
Proof: `n43/d18/cliques_augmentation.md`.

**[PROVED-HERE; accepted independent review]** At q=1, let D8 consist of
A-degree-eight vertices in any actual size-four column. Every safe edge
has all D8 vertices as endpoints: adding it preserves each T's I4-transversal
property, and the 85-edge augmented internal graph forces degree at least
nine on every T vertex. Thus |D8|>=3 forces saturation; |D8|=2 permits
only their mutual edge; |D8|=1 requires all safe edges to share that vertex.
For any T with e(A-T)=50, every safe edge meets T. This holds regardless
of A degree excess and does not assert a full-interface extension after
the internal addition. Proof:
[augmentation bridge](d18/pairwise_refinements.md#claim-pairwise-safe-columns),
[independent review](d18/review_pairwise-safe-columns_2026-10-14_small-agent.md).

### 8.10 Neighborhood bounds transferred between pivots

**[PROVED-HERE, with an additional root-choice precondition]** In a graph
having degree-18 vertices, one may choose v maximizing e(G[N(v)]) among them.
Then every other degree-18 root has neighborhood edge count at most a.

For u in A of global degree 18, put S_u=N_A(u), R_u=N_B(u), s_u=|S_u|.
For y in B of global degree 18, put P_y=N_B(y). Then:

```text
s_u+e_A(S_u)+e_B(R_u)+e(S_u,R_u)<=a,
e_A(C_y)+e_B(P_y)+e(C_y,P_y)<=a.
```

Search use: couple multiple roots with the selected pivot's edge upper bound.
Never impose these inequalities on an arbitrary root without the maximizing
precondition. Allowing all maximizing roots preserves existence coverage;
selecting a unique canonical root needs a separate tie/coverage argument.
Proof: `n43/d18/cliques_augmentation.md`.

### 8.11 Degree-18 root classes and conditional coverage

**[PROVED-HERE using published neighborhood edge extrema]** Put
W=sum_z(d_G(z)-18), so W is even and e(G)=387+W/2. Classify each degree-18
root by q=85-e(N(v)) and m_i, its number of neighbors of degree 18+i.
Then E=sum_i i*m_i and:

```text
sum_i m_i=18, 0<=q<=35,
x=136+2q+E, b=148+W/2-q-E,
max(0,W/2-12-E)<=q<=min(35,W/2+4-E).
```

These partition actual roots by numerical profile, not graph isomorphism;
not every numerical profile is realizable. q<=2 gives the four-transversal
predicate independently of E. At E<18 the root has degree-18 neighbors.

Using the published E(4,5,17)=79, some such neighbor has overlap at most

```text
min(13,floor((170-2q-max(0,6-q)*E)/(18-E))).
```

A sharper formula retains the actual m_i; see the proof. All x=136..138
classes yield overlap at most nine; all x=136..141 yield at most ten.
The second root's profile is not automatically the same as the first.

If the additional global hypothesis W<=10 holds, both endpoint neighborhoods
have at least 81-W/2 edges, and every degree-18 root has a degree-18 neighbor
with the following overlap upper bound:

```text
W:               0  2  4  6  8 10
overlap bound:   9  9 10 11 12 12
```

Thus the table gives complete conditional pointed-pair families, with all
isomorphism maps and completions still required. W<=10 is not proved for
general degree-18 candidates. No near-frontier existence assertion follows.

For P the degree-18 roots, n=|P|, h=43-n, and J=sum_(v in P)E_v:

```text
J=sum_(i>=1) i*sum_(d(z)=18+i)d_P(z),
J>=sum_(i>=1) i*n_i*max(0,19+i-h),
sum_(v in P)q_v<=n*(W/2+4)-J.
```

For M_Q=|{v in P:q_v<=Q}| and B0=W/2+3-Q, when 0<=B0<W:

```text
M_Q>=max(0,ceil((J-n*B0)/(W-B0))).
```

This forces at least 18 roots with q<=4 at W=2, at least ten at W=4,
and at least ten with q<=5 at W=6. Since five vertices contain an edge,
each of those branches has an adjacent pair in the stated dense family.
That pair need not be the pair in the overlap-bound table; do not assume
both conclusions hold for the same edge.

At a degree-18 vertex the excess-identity contribution is W/2-E: q cancels.
Consequently that identity alone, after substitution, does not force q<=2.
Search use: numerical profile splitting, conditional pair coverage and
weighted family bounds. Proof and arithmetic audit:
`n43/d18/pivot_classes.md`.

### 8.12 Conditional upper bounds on W and E

**[PROVED-HERE using published neighborhood edge extrema]** Let
P={z:d(z)=18}, H=V(G)-P, h=|H|, p=43-h>0, and
Z=sum_z(d(z)-18)^2. Retain h<=W<=6h and even W. If all roots in P
satisfy q_v>=Q for an integer Q>=0, put

```text
t=h-ceil((W/2-4+Q)/6).
```

Every root has at most min(h,18,t) neighbors in H. Counting the P-H cut and
using the K5-free Turan bound on H gives the necessary inequality

```text
18h+W-2floor(3h^2/8) <= (43-h)min(h,18,t).
```

A negative t excludes the profile. This inequality gives the following
conditional bounds; each row assumes the stated exact h. Q=0 always holds.

For a stronger degree-count filter, sort the positive excesses eta_i and
let S_m be the sum of the m smallest. Define
t_seq(Q)=max{m:0<=m<=min(h,18), S_m<=W/2+4-Q}. An empty set excludes
the profile; otherwise replace min(h,18,t) by t_seq(Q). If all root
deficits q_v are recorded, the cut capacity improves to
sum_(v in P)t_seq(q_v). This gives no simultaneous realization guarantee.

|h|W upper bound|all degree-18 E_v upper bound|
|---|---|---|
|2|8|8|
|4|20|14|
|6|32|20|
|8|44|26|
|10|58|33|

If no degree-18 neighborhood has 85 edges (Q=1), the bounds become:

|h|W upper bound|all degree-18 E_v upper bound|
|---|---|---|
|2|6|6|
|4|18|12|
|6|30|18|

Equivalently, h=2,W=8; h=4,W=20; or h=6,W=32 forces a root with q=0.
This does not force E=0 or x=136 at that root.

There are separate bounds selecting some root with small E. Exactly,

```text
J=sum_(v in P)E_v
 =18W+Z-sum_(yz edge in H)(epsilon_y+epsilon_z)
 <=18W+Z<=24W.
```

Hence min_(v in P)E_v<=floor((18W+Z)/p). A bound using only h,W replaces Z
by Z_max=h+35a+r(r+2), where W-h=5a+r, 0<=r<5. Also put
L_h=C(h,2)-floor(3h^2/8). The complementary Turan bound e(H)>=L_h gives

```text
min_(v in P)E_v<=6floor((18h+W-2L_h)/p).
```

Taking the best of these and the individual bounds gives:

```text
exact h:                       0  1  2  3  4  5  6
some degree-18 E_v at most:     0  0  4  6 12 18 18
```

For Q=1, h=2 and h=4 give selected-root bounds three and ten.
Selecting minimum E is safe; it does not also select minimum q.

For h<18, every root has a degree-18 neighbor whose overlap is at most

```text
min(13,floor((170-2q_v-max(0,6-q_v)*h)/(18-h))).
```

For h=0,1,2,3,4,5 this gives uniform bounds 9,9,9,10,11,12 without a
small-W assumption. The overlap bound additionally uses E(4,5,17)=79.

Search use: exclude degree-count profiles, force extremal neighborhoods
conditionally, and select a pivot by minimum E. No bound on h has been proved
for the entire degree-18 branch, so these do not establish W<=10 globally.
Detailed proofs: `n43/d18/excess_bounds.md`; status and arithmetic audit:
[early excess-bounds session summary](../reports/early_session_reports.md#degree18-excess-bounds).

### 8.13 Reviewed x137..142 profiles and above-frontier deductions

**[PROVED-HERE, accepted independent reviews on retained published premises]**
The [degree-18 branch](d18/README.md) separates x136,...,x142 and residual
x>=143 into sibling case folders. Each x137..142 case retains all its
disjoint (q,E_A) numerical profiles; [x>=137](d18/x-ge137/README.md) is an overview.
No unconditional x<=142 bound or unavoidable root in this subband is proved.

For actual four size-four columns Q and q=85-e(A), each member a satisfies
9-q<=d_A(a)<=11. All twenty external columns then have size at least six
even without an assumed lower bound elsewhere. Their total excess over six
is k=x-136. If m(a) counts memberships in Q columns and p(a) counts
incident external columns larger than six, m=2 forces p>=1+epsilon_a,
m=3 forces p>=3+epsilon_a, and m=4 is impossible. Independent-four anchor
degree sums give further actual-incidence filters.

Consequences, restricted to the indicated hypotheses:

- At x137, r4 is excluded; live necessary ranges are r0:s7..10,
  r1:s5..10, r2:s3..7, r3:s1..3. This does not close x137.
- At q0,r4,x138 exactly two external columns have size seven; at
  q0,r4,x139..141 at least two columns exceed six.
- At q0,r4 through x142 the four size-four signatures must overlap.
  At x142,q0,r4 a single exceptional column requires six excess-one
  A vertices inducing a triangle-free graph; other profiles remain open.

Proof and exact review: [four-column stability](d18/four_column_stability.md),
claims01..06 and linked review. Search use: branch and propagate.

At q3, any actual size-three column forces an exact triangle/55-edge-core
decomposition and three disjoint independent-four anchors. Combined core
degree and anchor-incidence counts give E_A>=14 and x>=156. Therefore q3
and x142..155 exclude size three. An elementary deletion-two argument also
excludes sizes at most two for complement A of order18, alpha<=3,
and 71 edges. Thus every actual column has size at least four in all x142
profiles. The isolated four-transversal argument remains restricted to q<=2;
the new q3 bound uses the complete order-43 interface.

Proof and exact review: [size-three theorem](d18/x142/q3/three_columns.md),
claims core/excess-six/excess-fourteen, and
[elementary lower bound](d18/transfer_summary.md#claim-band137-two-transversal).
Search use: propagate; no full q3 branch is closed.

The [transfer bounds](d18/transfer_bounds.md) rederive complete b and
small-column counts through142 (including b>=145 at142), extend the guaranteed
adjacent degree-18 neighbor codegree bounds at142 to 11,10,9,9 for q0..3,
and apply the existing eight-vertex structural test to every nonadjacent
union-ten column pair, including size4+size6. Any independent B triple
has column union at least15 and a clique remainder of size at most3;
exact overlap filters are recorded for size triples4/6/6,5/5/6,6/6/6.
Search use: branch and propagate under each claim's hypotheses.

These additions have exact-revision independent internal reviews and no
novelty claim or new formal certificate. Retained census premises, symmetry
coverage, and complete completion certificates remain necessary for a future
order-43 proof. All complete x137..142 branches and x>=143 remain open.

### 8.14 Reviewed pairwise pivot and excess refinements

**[PROVED-HERE; accepted independent mathematical review]** For P the
degree-18 vertices and H its complement in V(G), put h=|H|, p=43-h,
J=sum_(v in P)E_v, Z=sum epsilon_z^2, and B0=W/2+4. For h>0,

```text
J=(19-h)W+Z+sum_(yz nonedge in H)(epsilon_y+epsilon_z)
 >=(19-h)W+Z+2*eta_min*(C(h,2)-floor(3h^2/8)).
```

This strengthens weighted root-family lower bounds; W=6 now forces at
least four degree-18 roots with at least 81 neighborhood edges, though
four roots alone need not contain an edge.

Using the excess sequence capacity t(j)=t_seq(j) of section 8.12, when
t(0)>t(Q+1) and both exist, the dense family M_Q={v in P:q_v<=Q} obeys

```text
|M_Q|>=max(0,ceil((C_lo-p*t(Q+1))/(t(0)-t(Q+1)))),
C_lo=18h+W-2floor(3h^2/8).
```

At h3/W18 this forces 26 roots with at least 84 neighborhood edges;
at h5/W30 it forces 26 with at least 83. Each family has an adjacent
pair. At h2/W8, h4/W20, h6/W32, cut surplus forces at least 1,2,3 roots
with exact (q,E,x)=(0,8,144),(0,14,150),(0,20,156). Each such root has
some adjacent degree-18 neighbor with overlap at most 9,10,10 respectively;
the companion's deficit need not be zero.

If a root is explicitly chosen to maximize neighborhood edges among P,
its q_*=min_P q satisfies q_*<=floor(B0-J_lo/p) for any valid lower
bound J_lo, and the same root has x<=136+B0+q_*. For W=0,2,4,6,8,10,
the resulting x caps are 144,145,146,147,149,150, retaining pointed
overlap caps 9,9,10,11,12,12. These caps require the stated root choice.

Search use: conditional root-family and degree-count propagation/branching.
No bound on h or W throughout d18 is inferred, and the dense-pair and
low-overlap statements do not automatically apply to the same edge.
Proof: [pivot pairings](d18/pairwise_pivot_refinements.md), Claims 01--04;
[exact review](d18/review_pairwise-pivot_2026-10-14_coordinator.md).

### 8.15 Simultaneous dense endpoints and overlap ten

**[PROVED-HERE; accepted independent mathematical review]** Every family F
of at least thirteen degree-18 vertices contains adjacent u,v in F with
global codegree at most ten. This theorem uses small Ramsey numbers and
the independent-four signature argument; it needs no edge census. Both
endpoint conditions belong to the same family and hold for the same edge.

For odd h, W=6h-D, D in {0,2,4,6}, 1<=h<=35 and h<=W, put

```text
R_h=24h-2floor(3h^2/8)-(43-h)*(h-1)/2.
```

At least max(0,R_h-D) degree-18 roots have m_H=(h+1)/2,
q<=1+D/2, 3h+3-D<=E<=3h+4-D/2, and
139+3h-D<=x<=141+3h. If this family has at least thirteen vertices,
two of those roots form the overlap-ten edge. At D=0 they have exact
E=3h+3 and q=0 or1. For h=3,5,7,9,11 and D=0, the family counts are
26,26,24,20,14; both endpoint neighborhoods have at least84 edges.
For h=3,5,7,9 and D=2, counts24,24,22,18 give at least83 edges at
both endpoints. Four-transversal bounds apply at both endpoints for D<=2.

Proof: [dense-pivot Claims 01--03](d18/dense_pivot_coverage.md);
[exact independent review](d18/review_dense_pivot_coverage_20261014_low_s.md).
Search use: conditional family propagation and two-root branching with all
overlaps, maps and completions retained. No small h,W or x hypothesis has
been established throughout d18. These are unavoidable families, not a
disjoint case split, and no listed degree predicate is excluded here.

### 8.16 Overlapping actual cells and dispersed attachment obligations

**[PROVED-HERE; accepted independent mathematical review]** For every
degree-18 pivot, edge-containing cells T_Q are (3,4)-free and missing-pair
cells U_P are (5,3)-free. The new continuation combines their actual
intersections, attachment demands and shared undecided pairs without any
x, q or E restriction. Thirteen reviewed claims and exact revisions are
linked in [overlapping cells](d18/overlapping_cells.md).

Within T_Q a vertex has at most three T_Q neighbors. Triple witnesses from
possibly different U_P cells can require its adjacent leaves to cover an
obligation graph. Any supplied fractional matching exceeding the remaining
capacity rejects; the dual uses U_P nonneighbor capacity at most four and
possibly different T_Q triple witnesses. Signed rational cuts additionally
combine pair demands and upper capacities. Exact mixed union compatibility
holds at all overlap orders, while C5 boundary templates retain explicit
cell-size assumptions. No universally occurring pattern is asserted.

Search use: conditional propagation and local rejection after witness checks;
certificate formats and implementation remain design. No branch closes, no
cross-count bound improves, and no census or symmetry coverage is supplied.
The explicit local (5,3)-free boundary witness has research-planning use only.

### 8.17 Fixed-B extension capacity and unavoidable independent-root cores

**[PROVED-HERE; accepted independent mathematical review]** The
[fixed-B extension specification](d18/fixed_b_extensions.md) complements
the external complete352366-member (4,5,24) family, then constructs the18
actual cross rows and A edges together. All mixed five-set constraints,
degree budgets, multiplicities and residual symmetry are retained; catalogue
completeness remains an external premise, not independently replayed here.

Every row mask occurs at most twice; sizes9,10 cannot repeat. A one-deletion,
one-addition mask ball has occupancy at most two for center sizes7,8,11..16.
Eight such balls cannot cover an18-row family. Named triangle/I3 matching
witnesses and signed rational/box-capacity certificates extend these domain
rejections. No cover of every mask domain or complete rational relaxation
is asserted. Search use: the stated witnessed propagation/domain rejection;
actual generation and certified orbit/exhaustion coverage remain design.

The [independent-root occurrence theorem](d18/obstruction_coverage.md) applies
to every prescribed family of at least25 degree-18 roots. It forces either
a nonadjacent pair of overlap1..6 (opposite (4,4) cells of orders12..17),
or an independent four with singleton classes3 each, double classes4 each,
no triples, and universal class3. For same-family q<=2 roots the pair range
is4..6 and the cell orders12..14. The exceptional branch has four actual
rooted K4's on16 vertices and explicit attachment obligations; neither
alternative is excluded. No such25-root family is asserted universally.

The [large-row attachment notes](d18/large_row_extensions.md) retain exact
core/signature reductions rather than dropping ambient completion clauses.
Reviews, exact hashes, premise limits and the new x<=279 tail argument are
collected in the [extension research report](../reports/2026-10-17-d18-extension-research.md).
The reported x136 closure is not used by these new structural deductions.


## 9. Complement-normalized minimum-degree-20 branch

Use the canonical degree-sequence orientation described in Section 10. If the
minimum degree is 20, every degree is 20, 21, or 22.

Parameterize:

```text
n20-n22=2j+1,
n22=r.
```

Then:

```text
n20=r+2j+1,
n21=42-2(j+r),
n22=r,
e(G)=451-j,
j,r>=0,
j+r<=21.
```

There are 253 arithmetically possible degree-count triples before pruning.

Fix a degree-20 pivot and define:

```text
s=sum_(u in A)(d_G(u)-20).
```

Then:

```text
b=a+51-j-s,
x=380+s-2a.
```

Using published edge ranges:

```text
68 <= a <= 100,
117 <= b <= 143,
max(68,66+j+s) <= a <= min(100,92+j+s),
j+s <= 34.
```

Search use: branch on `(j,r,s,a)` only after feasibility checks from these
intervals.

### 9.1 Complete same-degree pair-selection coverage

**[PROVED-HERE; independently reviewed]** Under the global normalized
minimum-degree20 assumptions of this section, the count predicates
n20>=13 and n20<=12 give a disjoint exhaustive split. The first guarantees
an edge with both endpoints of degree20 and codegree<=11. The second forces
n21>=20 and guarantees an edge with both endpoints of degree21 and
codegree<=12. More strongly, every thirteen-element prescribed subset of
the indicated degree class contains such an edge.

Dependencies: degree-count/selector identities and classical
R(3,3)=6, R(3,4)=9, R(3,5)=14 through the generalized family-overlap theorem.
No edge census or small-excess bound is assumed. This does not apply to an
arbitrary even-pivot d20 branch without the global normalization premises.

Search use: branch | propagate for complete two-root existence coverage;
retain every allowed overlap value, map, internal graph and completion.
No branch termination follows without exhaustive exclusion/certificates.
Proof and exact reviews: [pair coverage](min-degree20/pair_coverage.md),
[general family overlap](../docs/general_theorems/family_overlap.md).

## 10. Symmetry reductions

### 10.1 Global action

**[PROVED-HERE]**

The action is:

```text
S_43 x C2
```

where `C2` is complementation. Complementation acts freely on isomorphism
classes because `C(43,2)=903` is odd, so no order-43 graph is self-complementary.

### 10.2 Canonical complement selector

Let:

```text
D=(d_1<=...<=d_43),
D^c=(42-d_43,...,42-d_1).
```

Safe WLOG selector:

```text
D <lex D^c.
```

The first nonzero entry of `(n18-n24,n19-n23,n20-n22)` must be positive;
they cannot all vanish by degree-sum parity. This yields:

- minimum 18 with `n18>0` and that first-nonzero-entry rule;
- minimum 19 with `n18=n24=0`, `n19>0`, and the first nonzero entry of
  `(n19-n23,n20-n22)` positive;
- minimum 20 with only degrees 20, 21, 22 and `n20>n22`.

Outer paired degree counts may tie. Do not impose n18>n24 on every
minimum-18 case, or n19>n23 on every minimum-19 case.

### 10.3 Rooted residual action

After fixing `v`, and fixed labeled internal graphs `G[A]`, `G[B]`, the cross
matrix is acted on by:

```text
Aut(G[A]) x Aut(G[B]).
```

Safe reduction: retain one **whole-matrix** representative per product-group
orbit.

Unsafe reductions:

- minimizing each row or column under a different automorphism;
- sorting rows while columns remain freely permutable;
- choosing a "most constrained" pivot without an invariant tie rule;
- applying lex constraints only to group generators and assuming this implies
  global lex minimality;
- combining independent complement selectors without proving that one member
  of every complement pair survives.

The [reviewed column-multiset alternative](d18/symmetry_reduction.md) first
quotients 24 cross columns by S_24 and Aut(A), then completes B modulo
the full multiset stabilizer Gamma_M. The kernel is product_C S_(m_C)
and its quotient is the row automorphisms preserving the multiset.
Sorted-prefix row comparisons preserve a least full multiset path.
Selected full-vector lex comparisons preserve coverage even when they do
not give a complete orbit quotient; partial comparisons need the stated
assigned-domain and full-path restrictions.

At x136..141 all signature multiplicities are at most two; repeated pairs
are forced edges through x139. At x140,141 a repeated size-ten signature
is not forced adjacent by the union bound. At equality duplicate swaps
give a kernel of order at most4096. Separately, 3k-5q<48 forces n18>n24,
so x<=151 is automatically compatible with the degree-sequence complement
selector. This is not an upper bound on x.

Proof and precise scope: symmetry Claims01--06;
[exact independent review](d18/review_d18_symmetry_20261014_pivot.md).
Search use: symmetry and propagation on the recorded premises. Complete
A generation, certified permutations, rejection witnesses, surviving paths,
root selection and completion certificates still require implementation.
The mathematical review does not certify a generator or appended lex CNFs.

### 10.4 Canonical-parent generation

**[DESIGN]**

Vertex deletion is compatible with the hereditary Ramsey property, but a
rooted generator must use an isomorphism-equivariant canonical parent.
Deleting another vertex can change which pivot is minimum-degree. Either:

- retain rooted canonical labels throughout; or
- unroot and recanonicalize at every accepted extension.

The parent-map and orbit-coverage checker are part of the proof obligation.

### 10.5 Reviewed pair separation and duplicate-stabilizer bounds

**[PROVED-HERE; independently reviewed]** Every order43 candidate pair has
at least8 distinguishing vertices. A nonidentity automorphism therefore moves
at least10 vertices. Every such candidate and every order24 (5,4)-free B
is prime under modular decomposition; no primeness assumption applies to A.
These assertions use the stated small Ramsey values, not edge censuses.

Under p disjoint duplicate-column swaps, the completed stabilizer L is a
partition subspace described by equal swap bits and pinned zeros. Each free
component has at least5 pairs, so

```text
|L|<=2^floor(p/5), |K_M.G|>=2^(p-floor(p/5)), K_M=(C2)^p.
```

Through x141 the accepted multiplicity premises give p<=12, restriction
kernel |L|<=4 and |Aut(G)_v|<=4|Aut(A)|. Thus a12-pair completion orbit
under K_M has at least1024 members. K_M remains the larger candidate action;
L fixes a particular completion and must not replace K_M in the quotient.
The full S_24 B-label orbit at fixed labeled A has at least24!/4 members.

Through x139 duplicate pairs are forced edges. A free five-pair component
cannot coexist with another free component. For p10,11 this bounds |L| by2,
giving completion orbits at least512,1024. At p12 a possible order4 stabilizer
must have two six-pair components; that case is not excluded. At x136 the
independently accepted anchor has four singleton anchor-signature classes
of size3. Each forces a singleton complete signature, hence p<=10 and
at least4 singleton complete signatures. Here |L|<=2 and the complete
B-label orbit has at least24!/2 members. All frontier applications retain
their multiplicity/forced-edge and, at equality, anchor census dependencies.

Search use: conditional propagation, completed-module filtering, actual
automorphism restrictions and symmetry accounting on the exact hypotheses.
Partial modules may be broken by later assignments; label factors are not
runtime measurements. No branch closure or implemented pruning is certified.
Proofs and exact reviews: [symmetry structure](symmetry_structure.md),
[disjoint swaps](../docs/general_theorems/disjoint_swap_stabilizers.md),
[audit report](../reports/2026-10-15-symmetry-audit.md).

### 10.6 Reviewed exact two-root gluing quotient

**[PROVED-HERE; independently reviewed after revision]** For fixed pointed
neighborhoods of ordered adjacent roots, let S be their compatible colored
common-neighbor graph, J_u,J_v the induced overlap automorphism images,
and rho_u,rho_v the side restriction maps. The identification-map classes
are exactly J_v \ Aut(S) / J_u. After choosing phi, the full remaining
completion group in the uniform unstructured D-cell scope is

```text
Gamma_phi={(a,b):rho_v(b)phi=phi rho_u(a)} x S_(|D|),
|Gamma_phi|=|D|! |ker rho_u| |ker rho_v|
             * |J_v intersect phi J_u phi^(-1)|.
```

All maps and automorphisms preserve fixed overlap colors. Fixed signatures
or other nonlocal relations may couple side and D actions and require the
actual enriched-state stabilizer, not merely replacement of the D factor.
The staged quotient retains every admissible ordered-root completion with
complete pointed-input, double-coset and residual-orbit coverage. The existing
normalized degree20/21 pair families and conditional degree18 families
retain their exact existence hypotheses; no universal new family is supplied.

Search use: mathematical symmetry with certified complete map/input/orbit
handling. Unrooted uniqueness, endpoint reversal and complementation need
additional compatible selectors. Proof and original/revised reviews:
[two-root gluing](../docs/general_theorems/symmetry_pair_gluing.md).

## 11. Global counting identities

These are valid pruning/LP inputs but currently do not close a branch alone.

### 11.1 Goodman identity

Define:

```text
delta_v=d(v)-21,
Delta=sum delta_v,
V=sum delta_v^2.
```

Then:

```text
2e(G)=903+Delta,
triangles(G)+independent_triples(G)=(5719+V)/2.
```

Also:

```text
6T >= 5418+13Delta+3V,
6I >= 5418-13Delta+3V,
T>=803,
I>=803.
```

### 11.2 Rooted homogeneous-triple identity

For:

```text
h_v=e(G[N(v)]) + e(complement G[M(v)]),
s_v=sum_(u adjacent v)(d(u)-21),
```

the exact identity is:

```text
2h_v
  = 399-Delta + delta_v + delta_v^2 + 2s_v.
```

The associated degree-energy identity is:

```text
2P=399Delta-Delta^2+43V+3C-2Q,
```

where:

```text
P=sum delta_v h_v,
C=sum delta_v^3,
Q=sum_(uv edge)(delta_u-delta_v)^2.
```

and:

```text
0<=Q<=43V-Delta^2.
```

Search use: degree-class LP or assortativity pruning once sharper local
`h_v` ranges are available.

## 12. Regular and equality subbranches

### 12.1 Strongly regular branch

**[PROVED-HERE]**

No order-43 strongly regular graph satisfies the `(5,5)` Ramsey constraints.
Parameter integrality, codegree bounds, eigenvalue discriminants, and trace
conditions exclude all possible degrees 18, 20, 22, 24.

### 12.2 Do not infer strong regularity

**[REJECTED]**

Regularity does not follow from current results, and regularity does not
currently force constant codegrees. Do not prune a regular branch merely
because all strongly regular cases are impossible.

### 12.3 The 18-regular corner

If `x=136` and `b=148`, `G` is 18-regular. Published edge ranges and local
arguments give:

```text
81 <= e(G[N(v)]) <= 85,
2 <= edge codegree <= 13,
3 <= nonedge codegree <= 8.
```

At the selected `x=136` root, the transversal theorem strengthens every cross
column to size at least 5, by the reviewed full-interface argument in
Section8.7. It does not imply that every nonedge of the whole graph has
codegree at least 5 at every other root.

## 13. Rejected or non-pruning ideas

### 13.1 Known 42-vertex graphs

**[REJECTED as proof]**

There are 656 known order-42 examples (including complements), and none is
known to extend to order 43. Their completeness is unproved. Nonextendibility
of this list does not prove `R(5,5)=43`.

### 13.2 Fractional perfect anchor designs

**[REJECTED]**

Local Ramsey constraints do not guarantee a fractional perfect matching in
the `I4` or `K4` anchor hypergraphs. Explicit join constructions provide a
space barrier.

### 13.3 Anchor equality as a contradiction

**[REJECTED]**

Simultaneous anchor equality is locally feasible and merely forces a
2-regular `4 x 4` block.

### 13.4 Generic spectral bounds

**[REJECTED as primary route]**

Hoffman, ordinary interlacing, fourth moments, and scalar codegree variance
leave broad feasible ranges. They remain auxiliary checks only.

### 13.5 Transversal bound five

**[OPEN, not a predicate]**

The attempted `tau>=5` strengthening has four unresolved families. Do not
encode `|C_y|>=5` unless those families are eliminated or a complete finite
verification is admitted.

## 14. SAT and generator material

### 14.1 Direct encoding

**[DESIGN]**

Use one Boolean variable per edge. For order 43:

```text
variables = C(43,2) = 903,
clauses   = 2*C(43,5) = 1,925,196,
clause length = 10.
```

For each 5-set:

- one clause forbids all ten edges;
- one clause forbids all ten nonedges.

This encoding is the preferred semantic foundation because it is simple to
regenerate and independently check.

### 14.2 Structured generation

**[DESIGN]**

Do not enumerate complete 43-vertex graphs. Generate partial structures:

```text
mathematical branch
  -> canonical pivot/internal graph
  -> incremental cross signatures
  -> exact pruning predicates
  -> partial assignment (cube)
  -> proof-logging SAT completion
```

Likely reusable components:

- nauty/Traces for canonical labels and automorphism groups;
- CaDiCaL or Kissat for SAT;
- DRAT/FRAT logging and LRAT-oriented checking;
- custom deterministic interface generator and coverage checker.

These are future engine components. The solver is being built on a separate
machine; this workspace's active research remains purely mathematical.

### 14.3 Candidate versus cube handling

The intended process is not:

```text
generate all full graphs -> filter -> SAT
```

It is:

```text
extend a partial graph
  -> propagate exact predicates immediately
  -> canonicalize the partial state
  -> stop at a useful cutoff
  -> send the unresolved cube to SAT
```

### 14.4 Proof obligations

For UNSAT:

- prove every mathematical branch is covered;
- prove every canonical/orbit omission is symmetry-equivalent to a retained
  case;
- prove cubes cover the base formula;
- retain a checkable proof for every cube.

For SAT:

- extract the adjacency matrix;
- exhaustively verify all 5-subsets with an independent checker.

## 15. Published census dependencies

Methodology review: `docs/upper_bound_method_review.md` reads
Angeltveit-McKay arXiv:2409.15709v2. Its filtering uses linear programming
and exact counting plus an unavoidable pointed-pair theorem (Theorem 5.4),
not SDP or flag algebras. Transferring that architecture to order 43 needs
new branch-specific coverage results; the order-46 thresholds cannot simply
be imported.

Current reductions use these published finite facts:

- `R(4,5)=25`;
- `(4,5,18)` edge interval 50 through 85;
- the `(4,5,17)` upper edge extremum 79 for the root-overlap classification;
- `(4,5,14)` edge interval 22 through 60, with its upper endpoint used
  by the revised independent-four anchor proof;
- `(4,5,24)` edge interval 116 through 132;
- every 15-vertex `(4,4)` graph has 50 through 55 edges;
- every 14-vertex `(4,4)` graph has 41 through 50 edges.

The `(4,5)` intervals are in Angeltveit-McKay, arXiv:2409.15709v2,
Appendix A, Table 1. The `(4,4)` intervals are in McKay-Radziszowski
1992, Table 1, p. 16. The [README table](../README.md#state-of-the-art)
also records the published `(4,4)` intervals at orders 11, 12, 13, 16
and 17, now available as named Lean premises. Their addition does not
replace the separately proved, census-free sufficient caps or retroactively
change the premises of historical proofs.

Any final certificate must identify which of these are theorem-prover checked,
which rely on published exhaustive computation, and what is trusted.

### Scoped Lean proofs

The [Lean coverage catalogue](../lean/Ramsey/theorems/README.md#proved-reduction-index-basics)
records 33 proved public reduction theorems for the basic pivot counting,
pair codegree intervals, two-anchor cells, row/column inequalities, exact
forbidden-rectangle criterion, and degree-18 deficit/excess and equality budgets.
The [verification report](../reports/2026-10-15-lean-reductions.json) records
source hashes and an axiom audit of all 33 theorems plus three shared helpers.
Those declarations contain no `sorryAx` and retain explicit published premises.
This is partial formal coverage of this index, not a formal proof of the later
small-column exclusions, exhaustive search coverage, or order-43 nonexistence.

## 16. Update template

### Reviewed SDP/SOS continuation (2026-10-15)

Status: **PROVED-HERE**, seventeen independently reviewed local claims;
no novelty or formal exhaustion assertion. Exact claim scopes and hashes are
in [the report](../reports/2026-10-15-sos-theory.md) and
[manifest](d18/sos_theory_manifest.json).

Preconditions: order43 K5/I5-free G, chosen degree18 pivot where applicable;
A is K4/I5-free and may contain I4, B is K5/I4-free. Pivot-family statements
require the stated actual degree18 family. q=1,E_A<=29 is a conditional
fixed-q strip, not unavoidable root coverage. Census premises are retained
only where individually identified.

Conclusions and search use:

- [Pivot covariance and twelve-root theorem](d18/sos_pivot_selection.md):
  any twelve degree18 roots contain a same-family edge of overlap<=10.
  Rational covariance squares improve conditional excess lower bounds and
  the root family cap becomes min(W,W/2+4). Propagate actual statistics;
  branch with full same-family overlap/map/completion coverage or an explicit
  minimum-q root selector. No blanket small-W or small-x assumption.
- [Dispersed column moments](d18/sos_column_compatibility.md): weighted
  Goodman squares and integer degree distances constrain triples whose
  triangle/independent possibilities remain open under potentially varying
  A witnesses. All24 columns require at least440+sum triangular(tau_y)
  open triples, tau_y=max(0,6-|C_y|,|C_y|-13); x136 requires>=440+s.
  Propagate on actual/permanently witnessed columns and sound degree intervals.
- [Finite caps and anchor strip](d18/sos_finite_moments.md), with
  [order12 addendum](d18/sos_order12_addendum.md): (4,4)-free edge caps
  at orders11,12,13 improve to36,42,48. Low-degree transversal thresholds
  hold across q; at q1,E_A<=29 an I4 with all A degrees>=8 is unavoidable.
  Propagate specified core/transversal hypotheses and branch on all allowed
  anchors. No size-four-column exclusion at q1 follows.
- [Obligation-graph SOS](d18/sos_obligation_graphs.md): eight leaves whose
  witnessed obligation graph contains the cycle-plus-opposite-matching graph
  need at least five selected attachments, rejecting omission-star capacity4
  where fractional matching only gives4. Propagate/reject the supplied actual
  star with all witnesses and consumed slots retained; no unavoidable occurrence.

All existing whole-x branches remain open. These tools supply reductions for
a future certified decision, without a new bound on R(5,5).

### Template

Add future results using this structure:

```text
### Result name

Status: [PUBLISHED | PROVED-HERE | OPEN | REJECTED | DESIGN]

Preconditions:
- exact graph order and branch;
- fixed pivot assumptions;
- any published census inputs;
- any equality conditions.

Conclusion:
- exact inequality, forced structure, or eliminated case.

Search use:
- branch / propagate / canonicalize / terminate / heuristic only.

Proof:
- link to detailed file and source.
```

Never move an **[OPEN]** item into executable pruning code without an audited
proof or an explicitly admitted complete finite verification.

## 17. Detailed source files

- `docs/mathematical_baseline.md`
- `docs/theory_phase_1.md`
- `docs/lemma_phase_2.md`
- `n43/d18/transversal_four.md`
- `n43/d18/x136/transversal_five_attempt.md`
- `n43/d18/frontier_band.md`
- `n43/d18/x136/small_columns.md`
- `n43/d18/x136/r4/exclusion.md`
- `n43/d18/cliques_augmentation.md`
- `docs/upper_bound_method_review.md`
- `n43/d18/pivot_classes.md`
- `n43/d18/excess_bounds.md`
- `n43/d18/pairwise_refinements.md`
- `n43/d18/x136/pairwise_small_refinements.md`
- `n43/d18/pairwise_frontier_refinements.md`
- `n43/d18/pairwise_pivot_refinements.md`
- `docs/reproducibility.md`
- `reports/early_session_reports.md` (consolidated 2026-10-13..14 session
  summaries; supersedes the twelve former standalone stub reports)
- `reports/2026-10-14-d18-pairwise-refinements.md`
