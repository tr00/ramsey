# Excluding Four Size-Four Columns at the Degree-18 Frontier

Date: 2026-10-14

This note uses the current live results in:

- `n43/d18/frontier_band.md`
- `n43/d18/x136/small_columns.md`
- `n43/d18/x136/transversal_five_attempt.md`

No graph enumeration, solver, catalogue download, or installation was used.

## Theorem

In the degree-18 `x=136` branch, there cannot be four cross columns of
size four.

Equivalently, with

```text
r = |{y in B : |C_y|=4}|,
```

one has

```text
r <= 3.
```

## Preconditions

Let `G` be an order-43 graph with no `K5` or independent 5-set. Fix a
degree-18 pivot `v` and put:

```text
A=N(v), |A|=18,
B=M(v), |B|=24,
C_y=N_A(y).
```

At `x=e(A,B)=136`, the audited frontier identity gives:

```text
e(A)=85,
d_G(a)=18 for every a in A.
```

Hence, for every `a in A`,

```text
d_cross(a)=|N_B(a)|=17-d_A(a).
```

The four-transversal theorem gives `|C_y|>=4` for every `y in B`.
The small-column count then shows that if `r=4`:

- the four corresponding vertices form a `K4`, denoted
  `Q={q_1,q_2,q_3,q_4}`, in `B`;
- every other one of the twenty columns has size six.

Write:

```text
T_i=C_{q_i}.
```

Each `T_i` is a four-vertex transversal of the independent 4-sets of `A`.
The audited four-transversal family reduction implies:

```text
9 <= d_A(a) <= 11 for every a in every T_i.
```

Indeed, the possible induced four-vertex types and attachment degrees are
exactly the `C4`, `P4`/claw, `C4`/paw, and diamond families recorded in
`n43/d18/x136/transversal_five_attempt.md`; direct addition of internal and attachment
degrees gives the interval above.

## Step 1: an element cannot lie in two columns `T_i`

For `a in A`, put:

```text
I(a)={i : a in T_i},
m(a)=|I(a)|.
```

Let `z in B-Q` be adjacent to `a`. Its column has size six.

If `z` were nonadjacent to some `q_i` with `a in T_i`, the two nonadjacent
vertices `q_i,z` would have columns of sizes four and six. The established
pair-union bound requires:

```text
|T_i union C_z|>=10.
```

Since the two sizes sum to ten, they must be disjoint, contradicting
`a in T_i intersect C_z`. Therefore:

```text
a in C_z implies I(a) is a subset of N_Q(z).
```

Now consider possible values of `m(a)`.

### Case `m(a)=4`

Then `Q union {a}` is a `K5`, impossible.

### Case `m(a)=3`

Because `d_A(a)<=11`,

```text
d_cross(a)=17-d_A(a)>=6.
```

Three cross neighbors lie in `Q`, so `a` has at least three neighbors in
`B-Q`. Any such neighbor is adjacent to all three vertices of `I(a)`.
It therefore forms a `K5` with `a` and that `Q`-triangle, impossible.

### Case `m(a)=2`

Again `d_cross(a)>=6`, so `a` has at least four neighbors in `B-Q`. Every
one is adjacent to the same two vertices `q_i,q_j`.

Any edge between two of these external neighbors would form a `K5` with
`a,q_i,q_j`. Thus the four external neighbors are independent. But `B` has
no independent 4-set, contradiction.

Hence:

```text
m(a)<=1 for every a in A.
```

The four sets `T_1,T_2,T_3,T_4` are pairwise disjoint.

## Step 2: use an independent 4-set in `A`

The graph `A` is `K4`-free on 18 vertices. Since `R(4,4)=18`, it contains an
independent 4-set `X`.

Every `T_i` meets every independent 4-set of `A`, so:

```text
X intersect T_i is nonempty for all i.
```

The `T_i` are pairwise disjoint and `|X|=4`; therefore `X` contains exactly
one vertex from each `T_i`.

For every `a in X`, the internal-degree bound gives `d_A(a)>=9`, and hence:

```text
d_cross(a)=17-d_A(a)<=8.
```

Therefore:

```text
e(X,B)=sum_(a in X) d_cross(a)<=32.
```

## Step 3: independent anchor lower bound

Every column `C_y`, `y in B`, meets `X`; otherwise `X union {y}` is an
independent 5-set.

For fixed `a in X`, the vertices whose exact `X`-signature is `{a}` form a
clique: two nonadjacent such vertices together with `X-{a}` form an
independent 5-set.

That clique has size at most three, because four of its vertices together
with `a` form a `K5`. Across the four singleton signatures, at most twelve
columns contribute one incidence. The other twelve columns contribute at
least two.

Thus:

```text
e(X,B)>=12+2*12=36.
```

This contradicts `e(X,B)<=32`.

Therefore `r=4` is impossible.

## Search consequence

At `x=136`, the small-column count table is sharpened from:

```text
r=0,1,2,3,4
```

to:

```text
r=0,1,2,3.
```

The remaining necessary `(r,s)` ranges are:

```text
r=0: s=8..10
r=1: s=6..10
r=2: s=4..7
r=3: s=2..3
```

No claim of realizability or exclusion is made for these remaining ranges.

## Audit notes

The proof does not assume `tau>=5`; it uses only the proved `tau>=4`
transversal bound and the audited size-four family classification.

The vertexwise identity `d_cross(a)=17-d_A(a)` is essential. It follows from
the already-proved `x=136` equality conclusion that every `A` vertex has
global degree 18; it does not follow from the aggregate cross-edge count
alone.
