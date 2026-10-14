# Purely Mathematical Phase I

Status date: 2026-10-13

This document records deductions for a hypothetical graph `G` on 43 vertices
with neither a 5-clique nor an independent set of size 5. No solver, graph
enumerator, catalogue search, or heuristic search was run in this phase.

The deductions marked **derived here** have been checked internally but have
not been searched against the literature for novelty. They must not be
advertised as new research results without an external mathematical review.

## 1. Universal structure

For a vertex `v`, write `N(v)` for its neighborhood and `M(v)` for the other
vertices not adjacent to it.

Using `R(4,5) = 25`,

```text
18 <= d(v) <= 24.
```

The graph on `N(v)` is `(4,5)`-free; the graph on `M(v)` is `(5,4)`-free.

For vertices `u,w`, put `c(u,w) = |N(u) intersect N(w)|`.

- If `uw` is an edge,

  ```text
  max(d(u),d(w)) - 18 <= c(u,w) <= 13.
  ```

- If `uw` is a nonedge,

  ```text
  max(d(u),d(w)) - 17
      <= c(u,w)
      <= d(u) + d(w) - 28.
  ```

The upper edge bound uses `R(3,5) = 14`. The other bounds follow by observing
that the relevant mixed cell is `(4,4)`-free, or that the common-nonneighbor
cell is `(5,3)`-free.

### Goodman identity

Let `T` and `I` be the numbers of triangles and independent triples in `G`.
Set

```text
delta_v = d(v) - 21
Delta   = sum_v delta_v
V       = sum_v delta_v^2.
```

Then

```text
2 e(G) = 903 + Delta
T + I  = (5719 + V) / 2.
```

Both `Delta` and `V` are odd. In particular,

```text
2860 <= T + I <= 3053.
```

A further double count gives the **derived-here** inequalities

```text
6T >= 5418 + 13 Delta + 3V,
6I >= 5418 - 13 Delta + 3V.
```

For example, for nonedges `uw`,

```text
sum_nonedge c(u,w)
  <= sum_nonedge (d(u) + d(w) - 28),
```

while

```text
sum_nonedge c(u,w) = sum_v C(d(v),2) - 3T.
```

Substitution yields the first inequality; complementation yields the second.
Optimizing either inequality over `delta_v in {-3,-2,-1,0,1,2,3}`, subject to
degree-sum parity, gives

```text
T >= 803 and I >= 803.
```

These bounds are valid but not close to a contradiction.

### Forced 4-vertex homogeneous sets

Every vertex belongs to both a 4-clique and an independent 4-set. Indeed,
every 14-subset of `N(v)` contains a triangle, and the complementary statement
holds in `M(v)`.

If `p_v` is the number of 4-cliques containing `v`, counting 14-subsets of
`N(v)` gives

```text
p_v >= ceil(C(d(v),3) / C(14,3)).
```

For degrees 18 through 24 these lower bounds are

```text
3, 3, 4, 4, 5, 5, 6.
```

Therefore `G` has at least 33 copies of `K4`, and at least 33 independent
4-sets. This is a weak global count, but it ensures that the anchor reductions
below are always available.

If an edge has codegree 13, its common-neighborhood graph is a 4-regular
13-vertex `(3,5)`-graph. Hence that edge lies in exactly 26 copies of `K4`.
This is a useful equality trigger.

## 2. Complement and labeling symmetry

The symmetry group is `S_43 x C_2`: vertex permutations and complementation.
Complementation acts freely on isomorphism classes because `C(43,2) = 903` is
odd, so no 43-vertex graph can be isomorphic to its complement.

Let the sorted degree sequence be

```text
D = (d_1 <= ... <= d_43)
```

and let

```text
D^c = (42-d_43, ..., 42-d_1).
```

Impose the safe complement selector `D <lex D^c`. The first nonzero entry in

```text
n18-n24, n19-n23, n20-n22
```

must then be positive. These three differences cannot all vanish, because the
degree sum would be `21*43`, which is odd.

This gives a canonical minimum-degree split:

- minimum degree 18, with `n18>0` and the first nonzero entry of
  `(n18-n24,n19-n23,n20-n22)` positive;
- minimum degree 19, with `n18=n24=0`, `n19>0`, and the first nonzero entry
  of `(n19-n23,n20-n22)` positive;
- minimum degree 20, with only degrees 20, 21, 22 and `n20 > n22`.

Alternatively, the handshake lemma guarantees an even-degree vertex. Up to
complementation, an arbitrary pivot can therefore be chosen with degree 18 or
20. This has fewer pivot sizes but loses the global restrictions supplied by a
minimum-degree pivot.

After fixing a pivot `v`, write

```text
A = N(v), B = M(v).
```

Once labeled representatives of `G[A]` and `G[B]` are fixed, the remaining
action on the cross-adjacency matrix is

```text
Aut(G[A]) x Aut(G[B]).
```

A correct canonical method must minimize the whole cross matrix under this
product action. Minimizing rows or columns independently is unsafe because one
automorphism acts simultaneously on all signatures.

## 3. Exact pivot-interface criterion

For `x in A`, let

```text
R_x = N(x) intersect B.
```

For `y in B`, let

```text
C_y = N(y) intersect A.
```

Once the internal graphs on `A` and `B` are fixed, the interface is valid
exactly when both conditions hold:

1. There is no all-one rectangle `P x Q`, where `P` and `Q` are cliques in
   `A` and `B` and `|P|+|Q|=5`.
2. There is no all-zero rectangle `P x Q`, where `P` and `Q` are independent
   sets and `|P|+|Q|=5`.

This is an exact gluing criterion, not merely a necessary condition.

### Single rows and columns

Put `d=|A|`, `b=42-d`, `s_x=d_A(x)`, `r_x=|R_x|`,
`t_y=d_B(y)`, and `c_y=|C_y|`.

The audited bounds are

```text
d - 18 <= s_x <= 13,
17 - s_x <= r_x <= min(17, 23-s_x),
b - 14 <= t_y <= 17,
max(d-17, 18-t_y) <= c_y <= min(d-4, 24-t_y).
```

The lower bound 4 on a mixed two-anchor cell is not intrinsic to a
`(4,4)`-free graph. It follows from the coupled 43-vertex partition, the degree
lower bound, and the upper bound 13 on the opposite cell.

Boundary cases are rigid:

- `r_x=17` makes `G[R_x]` a 17-vertex 8-regular `(4,4)`-graph.
- `r_x=4` forces `s_x=13` and global degree 18.
- `s_x=13` makes `G[N_A(x)]` a 13-vertex 4-regular `(3,5)`-graph.
- `c_y=d-17` makes `G[A-C_y]` a 17-vertex 8-regular `(4,4)`-graph.

### Pair and higher intersections

For `x,z in A`:

- if `xz` is an edge, `R_x intersect R_z` is `(3,4)`-free and has at most
  8 vertices;
- if `xz` is a nonedge, `B-(R_x union R_z)` is `(5,3)`-free and has at most
  13 vertices;
- every row difference is `(4,4)`-free and has at most 17 vertices.

For a clique `Q` in `A`, the common positive row intersection contains no
`K_(5-|Q|)`. In particular, an edge has at most 8 common cross-neighbors and a
triangle at most 3.

For an independent `Q` in `A`, the common zero-set contains no
`I_(5-|Q|)`. In particular:

```text
independent pair:   common zero-set <= 13
independent triple: common zero-set <= 4
independent 4-set:  common zero-set is empty
```

There are exact dual statements for columns.

Two column signatures also force internal adjacency in `B`:

- a triangle in `C_y intersect C_z` forces `yz` to be a nonedge;
- an independent triple in `A-(C_y union C_z)` forces `yz` to be an edge;
- if both occur, the signature pair is impossible.

These rules refine adjacency signatures much more strongly than degree-only
color refinement.

## 4. Anchored 4-bit signature theory

Fix an independent 4-set `X` in `A`. Every `y in B` has a nonempty signature

```text
S_y = C_y intersect X.
```

For every independent set `Q` in `B`,

```text
|union_(y in Q) S_y| >= |Q|.
```

Otherwise `Q` together with the unused vertices of `X` contains an independent
5-set. Thus the signatures of every independent set satisfy Hall's condition.

For the exact class `B_S = {y : S_y=S}`:

```text
|S|=1: |B_S| <= 3
|S|=2: |B_S| <= 8
|S|=3: |B_S| <= 17
|S|=4: |B_S| <= 24
```

The first class is a clique of order at most 3. More generally, the class has
clique number at most 3 and independence number at most `|S|`.

At most 12 vertices have singleton signatures. Consequently,

```text
e(X,B) >= 2|B| - 12.
```

This is 36 for a degree-18 pivot and 32 for a degree-20 pivot. Equality forces
all four singleton classes to be triangles and every remaining signature to
have size 2.

Dually, fix a 4-clique `Y` in `B` and assign each `x in A` its nonempty missing
signature

```text
T_x = Y - R_x.
```

The missing signatures of every clique in `A` satisfy Hall's condition.
At most 12 vertices have singleton missing signatures, and

```text
e(A,Y) <= 2|A| + 12.
```

This is 48 for a degree-18 pivot and 52 for a degree-20 pivot. Equality forces
four singleton classes that are independent triples.

On the anchored `4 x 4` block `X x Y`, admissibility is exactly:

- no row is `1111`;
- no column is `0000`.

Hence the block contains between 4 and 12 cross edges.

These signature classes provide a small, exact boundary language for future
case arguments. Counts alone are not sufficient: the induced graph and the
actual subset orbit must still be retained.

## 5. Catalogue-free quadratic interface bounds

Let

```text
a = |A|, b = |B|,
eA = e(G[A]), eB = e(G[B]),
m = e(A,B), z = a*b-m.
```

The pair-intersection bounds, Turan's theorem, and Cauchy-Schwarz give the
following **derived-here** necessary inequalities:

```text
m^2/b - 4m <= 64 eA,
m^2/a - 3m <= 78 eB,
z^2/b - 3z <= 78 (C(a,2)-eA),
z^2/a - 4z <= 64 (C(b,2)-eB).
```

For example,

```text
sum_(y in B) e(G[C_y])
  = sum_(xz edge in A) |R_x intersect R_z|
  <= 8 eA.
```

Since `A` has independence number at most 4,

```text
e(G[C_y]) >= |C_y|(|C_y|-4)/8.
```

Summing and applying Cauchy-Schwarz proves the first inequality. The other
three are dual.

These inequalities are safe, cheap pruning rules. By themselves they do not
exclude either pivot branch.

## 6. Degree-18 pivot

Here `|A|=18`, `|B|=24`. Put

```text
a=e(G[A]), b=e(G[B]), x=e(A,B).
```

### Catalogue-free bounds

An elementary extremal argument gives

```text
a <= 96 and b <= 183.
```

Sketch for `a`: set `F=bar(G[A])`, choose a minimum-degree vertex of `F`, and
split its neighborhood from its nonneighborhood. The former is triangle-free
and the latter is `K4`-free. Degree lower bounds in `F`, together with Turan,
give `e(F)>=57`, hence `a<=153-57=96`.

There is also a catalogue-free perfect-matching lemma. The graph `bar(G[B])`
has 24 vertices, minimum degree at least 6, clique number at most 3, and
independence number at most 4. Tutte's theorem excludes every possible odd
component obstruction, so it has a perfect matching. For each matched pair,
which is a nonedge in `G[B]`, at most 8 vertices of `A` miss both endpoints.
Summing over 12 matching edges gives

```text
x >= 120.
```

This route is independent of the published `(4,5)` edge census.

### Sharpening from established edge extrema

The published `(4,5)` census gives

```text
50 <= a <= 85.
```

Also `bar(G[B])` is a 24-vertex `(4,5)`-graph with 116 through 132 edges, so

```text
144 <= b <= 160.
```

Degree sums give the exact corridor

```text
max(306-2a, 432-2b)
  <= x
  <= min(306, 414-2a, 576-2b).
```

In particular,

```text
x >= 136.
```

This is a tighter branch bound than the catalogue-free matching lemma, though
it relies on the established computational census.

## 7. Complement-normalized minimum-degree-20 branch

In this branch all degrees are 20, 21, or 22. Parameterize

```text
n20-n22 = 2j+1,
n22 = t.
```

Then

```text
n20 = t+2j+1,
n21 = 42-2(j+t),
n22 = t,
e(G) = 451-j,
j,t >= 0, j+t <= 21.
```

There are 253 arithmetically possible degree-count triples before further
pruning.

Fix a degree-20 vertex `v`, with `|A|=20`, `|B|=22`, and define

```text
a = e(G[A]),
b = e(G[B]),
x = e(A,B),
s = sum_(u in A) (d(u)-20).
```

Degree sums and the global edge count give the exact formulas

```text
b = a + 51 - j - s,
x = 380 + s - 2a.
```

The published `(4,5)` edge extrema give

```text
68 <= a <= 100,
117 <= b <= 143.
```

Therefore

```text
max(68, 66+j+s)
  <= a
  <= min(100, 92+j+s).
```

The number of homogeneous triples containing `v` is independent of `a`:

```text
e(G[A]) + e(bar(G[B])) = 180+j+s.
```

The published upper extrema imply the additional pruning rule

```text
j+s <= 34.
```

Two endpoint degree sequences remain viable:

- `(n20,n21,n22)=(1,42,0)`: the unique degree-20 vertex has `s=20`,
  `86<=a<=100`, `b=a+31`, and `x=400-2a`.
- `(n20,n21,n22)=(43,0,0)`: every vertex has `s=0`,
  `87<=a<=100`, `b=a+30`, and `x=380-2a`.

Thus present linear and local arguments do not exclude even the nearly regular
or regular endpoints.

## 8. Strongly regular branch is impossible

This is a clean **derived-here** conditional exclusion.

If `G` were strongly regular with parameters `(43,k,lambda,mu)`, regularity and
parity reduce, up to complement, to `k=18` or `k=20`. The parameter identity is

```text
(42-k) mu = k(k-lambda-1).
```

For `k=18`, the integral candidates are

```text
(lambda,mu) = (1,12), (5,9), (9,6), (13,3).
```

The first two violate the nonedge-codegree upper bound `mu<=8`. The remaining
restricted-eigenvalue discriminants are 57 and 160.

For `k=20`, the connected candidate is `(lambda,mu)=(8,10)`, with
discriminant 44. The disconnected alternative would contain a clique larger
than 4.

All three surviving discriminants are nonsquares. Their two conjugate
restricted eigenvalues would therefore each have multiplicity 21. The trace
condition

```text
k + 21(lambda-mu) = 0
```

fails in every case. Complementation excludes `k=22,24`.

Therefore no hypothetical 43-vertex `(5,5)`-Ramsey graph is strongly regular.
A regular candidate must have at least four distinct adjacency eigenvalues.
Generic Hoffman and interlacing bounds are too weak to exclude it.

## 9. Highest-value next lemmas

Conditional excess bounds: `degree18_excess_bounds.md` proves a high-degree
cut obstruction. When exactly h=2,4,6,8,10 vertices have degree above 18,
it gives W<=8,20,32,44,58, respectively. If all degree-18 neighborhoods have
at most 84 edges, the first three bounds sharpen to 6,18,30. Weighted and
unweighted cut averages select roots with small E; at exact h=1,2,3,4,5,6
some root has E<=0,4,6,12,18,18. Small h also forces low-overlap adjacent
degree-18 roots without assuming small W. No general bound on h is proved.
The next extension is to use actual excess multiplicities and sharper
constraints on the induced higher-degree graph in the cut inequality.

Degree-18 classification: `degree18_pivot_classes.md` defines complete numerical
root profiles, proves profile-dependent adjacent degree-18 overlap bounds,
and gives conditional unavoidable pointed-pair families when the total global
degree excess above 18 is at most ten. Its weighted root-class inequalities
force dense adjacent families for excess two, four and six. It does not prove
these excess bounds hold throughout the degree-18 branch.

Further 2026-10-14 continuation: `degree18_cliques_augmentation.md` proves
four-clique degree budgets and equality masks in B, classifies safe additions
at a=84, and specifies root-selection inequalities transferring neighborhood
edge bounds among degree-18 pivots.

2026-10-14 continuation: `degree18_small_columns.md` proves joint size-four /
size-five column bounds, exact small-column count budgets at x=136+k, and
eight-vertex induced structure forced by nonadjacent size-five columns. These
are full-interface necessary conditions, not an isolated tau>=5 theorem.

Continuation: `frontier_band.md` extends x=136 to x=136+k, proves the
census-dependent four-transversal bound throughout x=136,...,141, and records
anchor defect identities and the clique restriction on size-four columns.

The following are proof targets, not established facts:

1. **Extreme-degree exclusion.** Rule out degree 18 (and hence 24) using the
   published `a,b,x` corridor plus compatibility of the 24 column signatures.
2. **Regular-to-SRG rigidity.** Show that a regular candidate has constant edge
   and nonedge codegrees. The strongly regular exclusion would then finish all
   regular branches.
3. **Anchor incompatibility.** Show that equality or near-equality in the
   anchored independent-4 and clique-4 incidence bounds cannot coexist.
4. **Fractional homogeneous-set designs.** Prove sufficiently large fractional
   matchings in the `I4(A)` hypergraph and sufficiently small covers by
   `K4(B)`. The anchor inequalities then become global bounds on `e(A,B)`.
5. **Rooted homogeneous-triple inequality.** For

   ```text
   h_v = e(G[N(v)]) + e(bar(G[M(v)])),
   ```

   use

   ```text
   2 sum_v h_v = 17157 + 3V
   ```

   to seek a sharp local inequality whose equality cases force a narrow degree
   distribution.
6. **Signature-orbit classification.** Classify admissible row signatures by
   their exact incidences with the `K4(B)` and `I4(A)` hypergraphs, then use the
   forced-adjacency rules above. This is a mathematical categorization target;
   actual orbit enumeration is intentionally deferred.

At present none of these deductions improves the global bound
`43 <= R(5,5) <= 46`. They do, however, give a smaller and more structured set
of branches and several independently checkable pruning inequalities for the
later computational phase.

## 10. Sources used for established facts

- V. Angeltveit and B. McKay, *R(5,5) <= 46*:
  <https://arxiv.org/abs/2409.15709>
- S. Radziszowski, *Small Ramsey Numbers*, Dynamic Survey DS1:
  <https://www.combinatorics.org/ojs/index.php/eljc/article/view/DS1>
- B. McKay and S. Radziszowski, *R(4,5)=25*:
  <https://doi.org/10.1002/jgt.3190190304>
- B. McKay and S. Radziszowski, *Subgraph counting identities and Ramsey
  numbers*: <https://doi.org/10.1006/jctb.1996.1741>
