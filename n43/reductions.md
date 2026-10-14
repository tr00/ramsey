# R(5,5) Search Results and Reduction Index

Last updated: 2026-10-14

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

Thus `x=136` is the sharp equality frontier. Equality forces:

```text
a=85,
d_G(u)=18 for every u in A.
```

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
  <= min(306,414-2a,576-2b).
```

In particular:

```text
x>=136.
```

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
21 <= C <= 32,
36 <= e(I,B) <= 47,
53 <= e(A-I) <= 64.
```

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

**[PROVED-HERE, with the published census inputs of 8.1 and 8.4]**

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
21-q<=C<=32+E_I,
36<=e(I,B)<=47+q+E_I,
53-q-E_I<=e(A-I)<=64.
```

If eta_I=e(I,B)-36, n1 counts singleton I signatures, and h is the sum
of (signature size minus two) over signatures of size at least three,
then eta_I=(12-n1)+h, with both terms nonnegative.

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
At x=136 the necessary count ranges are:

```text
(r,s)=(0,8..10),(1,6..10),(2,4..7),(3,2..3).
```

**[PROVED-HERE]** The `r=4` branch is impossible at `x=136`. Four size-four
columns would be pairwise disjoint as subsets of `A`; an independent 4-set in
`A` would then meet each exactly once. The audited internal-degree bounds give
at most 32 incidences from that anchor into `B`, contradicting the anchor
lower bound 36.

Proof: `n43/d18/x136/r4/exclusion.md`.

The remaining ranges are necessary conditions, not realizability claims.

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
`reports/degree18_excess_bounds.md`.

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

### 10.4 Canonical-parent generation

**[DESIGN]**

Vertex deletion is compatible with the hereditary Ramsey property, but a
rooted generator must use an isomorphism-equivariant canonical parent.
Deleting another vertex can change which pivot is minimum-degree. Either:

- retain rooted canonical labels throughout; or
- unroot and recanonicalize at every accepted extension.

The parent-map and orbit-coverage checker are part of the proof obligation.

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
column to size at least 4. It does not imply that every nonedge of the whole
graph has codegree at least 4 at every other root.

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
- `(4,5,24)` edge interval 116 through 132;
- every 15-vertex `(4,4)` graph has 50 through 55 edges;
- every 14-vertex `(4,4)` graph has 41 through 50 edges.

Any final certificate must identify which of these are theorem-prover checked,
which rely on published exhaustive computation, and what is trusted.

## 16. Update template

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
- `docs/reproducibility.md`
- `reports/mathematical_phase_1.md`
- `reports/lemma_phase_2.md`
- `reports/transversal_five_status.md`
- `reports/frontier_band.md`
- `reports/degree18_small_columns.md`
- `reports/degree18_r4_exclusion.md`
- `reports/degree18_cliques_augmentation.md`
- `reports/degree18_pivot_classes.md`
- `reports/degree18_excess_bounds.md`
