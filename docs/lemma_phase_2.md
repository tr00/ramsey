# Lemma Phase II: Proof Attempts and Audits

Status date: 2026-10-13

This phase tested the proposed "next best lemmas" from the first theory report.
No computation, solver, graph enumeration, or catalogue search was run.

The outcome is mixed:

- several useful intermediate lemmas were proved and independently audited;
- three attractive conjectural shortcuts were shown to be unjustified;
- an established 15-vertex edge census closes the remaining attachment cases
  and proves the desired four-vertex transversal bound.

As before, "derived here" means internally audited, not literature-checked for
novelty.

## 1. Degree-18 frontier

Let `v` have degree 18, let

```text
A=N(v), |A|=18,
B=M(v), |B|=24,
a=e(A), b=e(B), x=e(A,B).
```

The published `(4,5)` edge extrema give

```text
a <= 85, 144 <= b <= 160.
```

Define the degree excess on `A`:

```text
Delta_A = sum_(u in A) (d_G(u)-18).
```

Degree summation over `A` gives the exact identity

```text
x = 306 - 2a + Delta_A
  = 136 + 2(85-a) + Delta_A.
```

All terms after 136 are nonnegative. Therefore:

### Frontier lemma

```text
x >= 136.
```

If `x=136`, then necessarily:

```text
a=85,
d_G(u)=18 for every u in A,
148 <= b <= 160.
```

If also `b=148`, every vertex in `B` has degree 18, so the entire graph is
18-regular.

### Independent-4 anchors at the frontier

Fix an independent 4-set `I` in `A`, put `S=A-I`, and define

```text
C=e_A(I,S).
```

Since every vertex of `I` has global degree 18,

```text
e(I,B)=68-C,
e(S)=85-C.
```

Every `B`-vertex meets `I`. At most twelve vertices meet it in exactly one
place: each of the four singleton signature classes is a clique of size at
most 3. Thus `e(I,B)>=36`, giving `C<=32`.

The 14-vertex graph on `S` is `K4`-free. Turan gives `e(S)<=65`, but equality
would be `K(5,5,4)`, which contains an independent 5-set. Therefore
`e(S)<=64`, giving `C>=21`.

Hence, in the `x=136` branch, every independent 4-set satisfies

```text
21 <= C <= 32,
36 <= e(I,B) <= 47,
53 <= e(S) <= 64.
```

These bounds were independently rederived during audit.

## 2. A four-vertex transversal lemma

At `x=136`, put

```text
F = complement of G[A].
```

Then:

```text
|F|=18,
e(F)=68,
alpha(F)<=3,
omega(F)<=4.
```

The `K4` sets of `F` are exactly the independent 4-sets of `A`. Let `tau_4(F)`
be the minimum size of a vertex set meeting every `K4` in `F`.

### Proven lemma

```text
tau_4(F) >= 4.
```

The proof uses one established census fact: every 15-vertex graph with neither
a `K4` nor an independent 4-set has at least 50 edges.

Suppose a set of at most three vertices meets every `K4`; enlarge it to a
3-set `T` and put `H=F-T`. Then `H` is a 15-vertex `(4,4)`-Ramsey graph, so
`e(H)>=50`.

For each `t in T`, its `H`-nonneighbors contain neither a `K4` nor an
independent triple. By `R(4,3)=9`, there are at most eight, so `t` has at
least seven neighbors in `H`. Therefore

```text
e(F)
  = e(H) + e(T,H) + e(F[T])
  >= 50 + 21
  = 71,
```

contradicting `e(F)=68`.

Every cross column `N_A(y)`, `y in B`, meets every independent 4-set of `A`;
otherwise that set together with `y` is an independent 5-set. Consequently,
in the `x=136` branch,

```text
|N_A(y)| >= 4 for every y in B.
```

The detailed proof and source information are in `n43/d18/transversal_four.md`.

## 3. Superseded three-transversal reduction

Before the 15-vertex edge census was brought into the argument, direct
counting reduced a hypothetical 3-transversal to cores with 45, 46, or 47
edges. A hand proof excluded the 45-edge case, while detailed cell arguments
left three 46/47-edge attachment templates.

The published census states that every 15-vertex `(4,4)`-Ramsey graph has
between 50 and 55 edges. It therefore excludes all of those templates at once.
They are retained only in the development history; they are not open cases.

## 4. Anchor-equality rigidity

Fix an independent 4-set `X in A` and a 4-clique `Y in B`. Recall:

```text
e(X,B) >= 2|B|-12,
e(A,Y) <= 2|A|+12.
```

Suppose both inequalities are equalities.

On the `X` side, all four singleton column-signature classes have size 3 and
every other signature has size 2. On the `Y` side, all four singleton
missing-signature classes have size 3 and every other missing signature has
size 2.

Let `p` be the number of `Y` columns with a singleton `X` signature, and `q`
the number of `X` rows with a singleton missing signature. Counting edges in
the `4 x 4` block gives

```text
e(X,Y)=8-p=8+q.
```

Thus `p=q=0`.

### Proven rigidity conclusion

Every row and column of `G[X,Y]` has degree 2. Therefore the block is either:

```text
C8
```

or

```text
C4 disjoint union C4.
```

This does **not** give a contradiction. Both blocks are locally admissible.
Global incompatibility would have to use the four forced private triangle
classes on the `X` side and the four private independent-triple classes on the
`Y` side. A scalar relaxation of the resulting `12 x 12` incidence problem is
feasible.

A valid stability form is also available. If `epsilon_B` and `epsilon_A` are
the two anchor defects, then

```text
sum_columns |degree-2| + sum_rows |degree-2|
  <= 2(epsilon_A+epsilon_B),
```

and

```text
-epsilon_A <= e(X,Y)-8 <= epsilon_B.
```

The earlier hope that equality itself was impossible is therefore rejected.

## 5. Rooted degree-energy identities

For every vertex set

```text
delta_v=d(v)-21,
D=sum delta_v,
S=sum delta_v^2,
C=sum delta_v^3,
s_v=sum_(u adjacent v) delta_u.
```

Define

```text
h_v=e(G[N(v)]) + e(complement G[M(v)]).
```

The following exact local identity was proved and independently audited:

```text
2h_v = 399-D + delta_v + delta_v^2 + 2s_v.
```

Now put

```text
P=sum delta_v h_v,
Q=sum_(uv edge) (delta_u-delta_v)^2.
```

Then:

```text
2P = 399D-D^2 + 43S + 3C - 2Q,
0 <= Q <= 43S-D^2.
```

Therefore:

```text
399D+D^2-43S+3C
  <= 2P
  <= 399D-D^2+43S+3C.
```

These identities measure degree assortativity exactly. However, the currently
known degree-dependent ranges for `h_v` leave enough slack to permit the full
quadratic-deviation range. This is a sound bookkeeping tool, not presently a
route to an extreme-degree exclusion.

## 6. The 18-regular corner

If the `x=136,b=148` corner exists, `G` is 18-regular. The rooted identity and
published edge ranges force

```text
81 <= e(G[N(v)]) <= 85
```

for every vertex.

Let `lambda` be the common-neighbor count of an edge and `mu` that of a
nonedge.

### Proven codegree improvement

```text
2 <= lambda <= 13,
3 <= mu <= 8.
```

The upper bounds were known. The lower bounds are new deductions in this
attempt.

For `lambda`:

- inside an 18-vertex neighborhood with at least 81 edges, an incident vertex
  of internal degree 0 leaves at most 68 edges;
- internal degree 1 leaves at most 73 edges.

Both contradict the 81-edge lower bound.

For `mu`, fix `v`, let `B=M(v)`, and put `L=complement G[B]`. A nonneighbor
`x` with `mu_vx=2` has degree 7 in `L`. Every one of its seven `L`-neighbors
must have `mu=8` and hence `L`-degree 13. The neighborhood of each such
degree-13 vertex is a 13-vertex `(3,5)`-graph and is therefore 4-regular.
It follows that the seven-vertex graph induced by `N_L(x)` is 4-regular and
triangle-free, with 14 edges, contradicting Mantel's upper bound 12.

For fixed `v`, nonneighbors having `mu=3` or 4 form a clique and therefore
number at most 4.

The next case, `mu=3`, was investigated. Its cardinal and pair-union
constraints admit an explicit set-system countermodel, so a contradiction must
use the actual induced adjacency structure, not only set sizes. At the chosen
`x=136` pivot, the four-vertex transversal lemma now excludes size-3 columns;
the generic `mu=3` question remains only at other roots whose neighborhood has
fewer than 85 edges.

## 7. Attractive approaches that were rejected

### Regular does not presently imply strongly regular

The strongly regular branch is impossible, but regularity does not force
constant codegrees from the available scalar identities. Nonconstant formal
codegree distributions satisfy all degree, triangle, fourth-moment, and
ordinary induced-four-vertex equations. This route has low promise unless a
new equality mechanism is found.

### Fractional perfect anchor designs are not guaranteed

Let `P` be a 17-vertex `(4,4)`-Ramsey graph and form

```text
Q = independent_t join P, t=2 or 3.
```

Then `alpha(Q)=3`, `omega(Q)=4`, and every `K4` uses exactly one of the `t`
independent-side vertices. Any fractional `K4` matching therefore has total
weight at most `t`, less than `|Q|/4`.

Thus the local Ramsey hypotheses alone do not guarantee a fractional perfect
design. Additional global cross-interface information would be required.

### Pairwise anchor inequalities alone do not exclude `mu=3`

The possible eight-vertex triangle-free minimum-degree-three neighborhood
graphs and their set-union constraints admit explicit abstract models.
Higher-order induced constraints are essential.

## 8. Revised recommendation

The desired `tau_4(F)>=4` lemma is proved. The next natural strengthening is:

> Determine whether every `K4(F)` transversal has size at least 5.

The same edge-count proof no longer closes automatically. Deleting four
vertices leaves a 14-vertex `(4,4)`-Ramsey graph with at least 41 edges, and
the forced attachment degrees only raise the resulting total to 65 rather than
past 68.

A proof of `tau_4(F)>=5` therefore needs structural information about the
four-vertex transversal, the 14-vertex remainder, or their attachment. Even
without that strengthening, `tau_4(F)>=4` is immediately useful: it removes
all size-3 cross columns from the sharp `x=136` branch.
