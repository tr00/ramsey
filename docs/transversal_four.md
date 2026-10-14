# A Four-Vertex Transversal Bound

Status date: 2026-10-13

## Theorem

Let `F` be an 18-vertex graph satisfying

```text
e(F)=68,
alpha(F)<=3.
```

Then every vertex set meeting every `K4` of `F` has size at least 4.

In the Ramsey application, `F` also has clique number at most 4, but that
hypothesis is not needed in the proof.

## Published input

McKay and Radziszowski's complete census of `(4,4)`-Ramsey graphs establishes:

> Every 15-vertex graph containing neither a `K4` nor an independent 4-set has
> between 50 and 55 edges.

Only the lower endpoint, 50, is used below. The census contains 640
nonisomorphic 15-vertex graphs.

Primary source:

- B. McKay and S. Radziszowski, *A New Upper Bound for the Ramsey Number
  R(5,5)*, Australasian Journal of Combinatorics 5 (1992), 13-20:
  <https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>

A later published table independently records the same 640 graphs and edge
interval:

- C. Calvert, S. Schuster, and S. Radziszowski, *Computing the Ramsey Number
  R(K5-P3,K5)*: <https://arxiv.org/abs/1203.6536>

No catalogue was downloaded and no enumeration was run in this project.

## Proof

Suppose that `S` meets every `K4` of `F` and `|S|<=3`. Enlarge `S`, if needed,
to a 3-set `T`; a superset of a transversal is still a transversal. Put

```text
H=F-T.
```

Then `H` has 15 vertices.

Because `T` meets every `K4`, the graph `H` contains no `K4`. Because
`alpha(F)<=3`, it also contains no independent 4-set. The published census
therefore gives

```text
e(H)>=50.
```

Fix `t in T` and let `A_t` be the vertices of `H` not adjacent to `t`.

- `F[A_t]` contains no `K4`, because `H` contains no `K4`.
- `F[A_t]` contains no independent triple, because such a triple together
  with `t` would be an independent 4-set in `F`.

Since `R(4,3)=9`, this gives

```text
|A_t|<=8.
```

Hence every `t in T` has at least seven neighbors in `H`, and so

```text
e(T,H)>=3*7=21.
```

Finally,

```text
68
  = e(F)
  = e(H) + e(T,H) + e(F[T])
  >= 50 + 21 + 0
  = 71,
```

a contradiction. Therefore every `K4` transversal has size at least 4.

## Application to the degree-18 frontier

In the `x=136` degree-18 pivot branch:

```text
A=N(v),
|A|=18,
e(G[A])=85,
F=complement G[A].
```

Thus `F` has 68 edges and `alpha(F)<=3`. Its `K4` sets are exactly the
independent 4-sets of `G[A]`.

For every `y in B=M(v)`, the cross column

```text
C_y=N_A(y)
```

meets every independent 4-set of `A`; otherwise that independent set together
with `y` would form an independent 5-set in `G`.

Therefore every cross column is a `K4(F)` transversal, and the theorem gives

```text
|C_y|>=4 for every y in B.
```

This replaces the previous lower bound 3 at the sharp `x=136` frontier and
completely eliminates the proposed three-transversal attachment cases.

It does not by itself exclude the full `x=136` branch: the 24 column sizes
still sum to 136, so columns of size 4 through 14 remain arithmetically
possible.

## Next natural question

The same argument does not immediately prove a transversal bound of 5.
Deleting four vertices leaves a 14-vertex `(4,4)`-Ramsey graph. The published
minimum edge count there is 41, while each deleted vertex is forced to have
only six neighbors in the remainder. The resulting lower edge count is 65,
which does not contradict `e(F)=68`.

Raising the bound to 5 therefore requires additional information about the
four deleted vertices or the structure of the 14-vertex remainder.
