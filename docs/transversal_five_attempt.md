# Attempt to Raise the Transversal Bound to Five

Status date: 2026-10-13

This is a standalone work log created while another agent was active in the
same folder. No existing research note was modified.

## Outcome

The target

```text
tau_K4(F) >= 5
```

is **not proved**.

The four-transversal hypothesis was reduced substantially:

- the 43-edge remainder is rigorously impossible;
- only one 49-edge complementary-core family and three types of 50-edge
  complementary-core families remain;
- several tempting local configurations were eliminated;
- no explicit counterexample was found.

All deductions below are purely mathematical. No graph catalogue was
downloaded and no new enumeration or solver run was performed.

## 1. Setup

At the sharp degree-18 frontier, let

```text
F = complement G[N(v)].
```

Then

```text
|F|=18,
e(F)=68,
alpha(F)<=3,
omega(F)<=4.
```

Assume for contradiction that a four-set `T` meets every `K4` in `F`, and put

```text
H=F-T.
```

Then `H` has 14 vertices and contains neither a `K4` nor an independent
4-set. The published `(4,4,14)` census gives

```text
41 <= e(H) <= 50.
```

For every `t in T`, the vertices of `H` not adjacent to `t` contain neither a
`K4` nor an independent triple. Since `R(4,3)=9`, there are at most eight of
them, so

```text
d_H(t)>=6.
```

Also `T` is not independent because `alpha(F)<=3`, so `e(F[T])>=1`.

Write

```text
e(H)=41+a,
e(T,H)=24+b,
q=e(F[T]).
```

The edge total gives the exact budget

```text
a+b+q=3,
a,b>=0,
q>=1.
```

Thus only remainders with 41, 42, or 43 edges need consideration.

## 2. The 43-edge remainder is impossible

This exclusion was independently audited.

If `e(H)=43`, the edge budget forces

```text
e(F[T])=1,
e(T,H)=24.
```

Hence `F[T]` is one edge plus two isolated vertices, and every vertex of `T`
has exactly six neighbors in `H`.

For `t_i in T`, let

```text
A_i = {h in H : h is not adjacent to t_i}.
```

Then every `A_i` has size 8. For each of the five nonedges `t_i t_j` in
`F[T]`, the intersection `A_i intersect A_j` is a clique and has size at most
3: two nonadjacent vertices in the intersection, together with `t_i,t_j`,
would form an independent 4-set.

Label the unique edge `t_1t_2`. The independent triples in `T` imply

```text
A_1 intersect A_3 intersect A_4 = empty,
A_2 intersect A_3 intersect A_4 = empty.
```

Counting membership redundancy across the four size-eight sets shows that
their union must contain at least 15 vertices. But `H` has only 14 vertices.
Therefore:

```text
e(H) != 43.
```

Equivalently, in the complementary formulation below, the 48-edge core is
impossible.

## 3. Complementary formulation

It is cleaner to state the surviving cases in

```text
A = complement F.
```

Then `A` has 18 vertices and 85 edges, contains no `K4` and no independent
5-set, and the four-set `T` meets every independent 4-set of `A`.

Put

```text
B=A-T,
m=e(B),
t=e(A[T]),
c=e(T,B).
```

The graph `B` is a 14-vertex `(4,4)`-Ramsey graph. Moreover,

```text
m+t+c=85,
t<=5,
c<=32,
41<=m<=50.
```

For `x in T`, write

```text
S_x=N_B(x),
delta_x=8-|S_x|.
```

Each `S_x` is triangle-free and contains no independent 4-set, so
`|S_x|<=8`.

## 4. Triangle-deficit reductions

If `x,y,z` form a triangle in `A[T]`, their common neighborhood in `B` is
empty, and each pairwise common neighborhood is an independent set of size at
most 3. Inclusion-exclusion gives

```text
delta_x+delta_y+delta_z >= 1.
```

For a diamond `K4-e`, let `u,v` be its shared-edge vertices and `x,y` its
nonadjacent tips. A stronger argument gives

```text
delta_u+delta_v+delta_x >= 2,
delta_u+delta_v+delta_y >= 2.
```

The strengthening uses independent-5 avoidance: equality at only one deficit
would create an independent triple in the shared common neighborhood that is
anticomplete to both tips.

These inequalities eliminate:

- every 48-edge core;
- the 49-edge core with `A[T]=K4-e`.

## 5. Complete surviving family list

After auditing, exactly the following families remain.

### Family 1: 49-edge core

```text
e(B)=49,
A[T]=C4,
|S_x|=8 for every x in T.
```

No other 49-edge case survives.

### Family 2: 50-edge core, three internal edges

```text
e(B)=50,
A[T]=P4 or K1,3,
|S_x|=8 for every x in T.
```

### Family 3: 50-edge core, four internal edges

```text
e(B)=50,
A[T]=C4 or a paw,
cross-neighborhood sizes are 8,8,8,7.
```

In the paw case, the degree-7 cross-neighborhood belongs to a triangle vertex.
The triangle neighborhoods attain equality:

```text
their union is all of B,
each pairwise intersection has size 3.
```

### Family 4: 50-edge core, diamond

```text
e(B)=50,
A[T]=K4-e.
```

The two nonadjacent tips have cross-neighborhood size 8. The two shared-edge
vertices have sizes either

```text
8,6
```

or

```text
7,7.
```

If the shared vertices are `u,v` and the tips are `x,y`, then

```text
|S_u intersect S_v|=2,
|S_u intersect S_x|=|S_v intersect S_x|=3,
|S_u intersect S_y|=|S_v intersect S_y|=3,
S_u union S_v union S_x = B,
S_u union S_v union S_y = B.
```

These conditions are highly rigid but were not contradicted.

## 6. Useful endpoint facts

Published facts gathered during this phase:

- There are 130,816 nonisomorphic `(4,4)`-Ramsey graphs on 14 vertices.
- Their edge counts range from 41 to 50.
- Exactly 40 isomorphism classes have 41 edges; by complementation, exactly
  40 have 50 edges.
- There are 74 `(4,5,18)` graphs with the maximum 85 edges.

No refereed source was found that tabulates the `K4` transversal numbers of
the 68-edge complements of those 74 graphs.

An unrefereed, catalogue-conditional endpoint note computes more detailed
transversal profiles for a different regular-endpoint argument. It was not
used as evidence for `tau>=5`.

## 7. Important correction

For two nonadjacent vertices of `A[T]`, their common nonneighbors in `B` have
independence number at most 2. They do **not** necessarily form a clique.

An intermediate line of reasoning incorrectly treated a size-three common
nonneighbor set as a triangle and appeared to eliminate Family 1. That
elimination is invalid and has not been retained.

## 8. Additional partial information

### Endpoint saturation

Because `A` has the maximum possible 85 edges, it is `K4`-saturated:
adding any missing edge must create a `K4`. Equivalently, every nonedge of
`A` has an adjacent pair in its common neighborhood.

This was identified as a promising strengthening for all four families, but
the focused saturation proof attempts were interrupted when this work was
stopped for the day. No conclusion from saturation is claimed here.

### Maximum-edge 14-vertex core

For a 50-edge `(4,4)` graph `B`:

```text
5 <= d_B(v) <= 8,
sum_v d_B(v)=100.
```

If `n_i` counts degree-`i` vertices, then

```text
n_8 = 2 + 2n_5 + n_6.
```

Goodman's identity gives

```text
triangles(B) + independent_triples(B)
  = 72 + 3n_5 + n_6.
```

Maximum-edge status implies one-sided `K4` saturation: every nonedge has an
edge in its common neighborhood. It does not imply the dual saturation
property.

### No explicit counterexample

Attempts to build a four-transversal example from the 17-vertex Paley
`(4,4)` graph fail by edge count. An explicit symmetric 42-edge
14-vertex Ramsey core based on the Fano plane was also examined; it could not
support the required degree-6 attachments.

The Fano-core analysis was exploratory and was not independently audited, so
it should not be used as a theorem.

## 9. Current status and next step

The statement

```text
tau_K4(F) >= 5
```

remains plausible but unproved.

The best hand-proof continuation is to apply `K4` saturation of the
85-edge graph `A` to the four surviving attachment families, especially the
exact paw and diamond configurations.

If hand arguments stall, the deferred finite check is small relative to the
full Ramsey problem:

1. inspect the 74 published extremal `(4,5,18)` graphs;
2. compute the minimum independent-4 transversal size of each;
3. independently verify any claim that every minimum is at least 5.

That finite check requires explicit user approval before downloading the
published catalogue.

## Sources

- V. Angeltveit and B. McKay, *R(5,5) <= 46*:
  <https://arxiv.org/abs/2409.15709>
- B. McKay and S. Radziszowski, *A New Upper Bound for the Ramsey Number
  R(5,5)*:
  <https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>
- B. McKay and S. Radziszowski, *Linear Programming in Some Ramsey Problems*:
  <https://www.cs.rit.edu/~spr/PUBL/paper29.pdf>
- McKay's Ramsey graph data page:
  <https://users.cecs.anu.edu.au/~bdm/data/ramsey.html>
