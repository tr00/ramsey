# Mathematical Baseline

Status date: 2026-10-13

## Definitions and proof target

Write `G in R(s,t,n)` when `G` has `n` vertices, no clique of size `s`, and no
independent set of size `t`. Then `R(s,t)` is the least `n` for which
`R(s,t,n)` is empty.

The peer-reviewed bounds are

```text
43 <= R(5,5) <= 46.
```

- Exoo supplied a graph in `R(5,5,42)`.
- Angeltveit and McKay proved that `R(5,5,46)` is empty.

No result found during setup establishes emptiness at 43, 44, or 45, or a
witness at 43, 44, or 45.

## Immediate local constraints

Let `G` be in `R(5,5,n)`, fix a vertex `v`, let `N(v)` be its neighborhood,
and let `M(v)` be the vertices other than `v` not adjacent to `v`.

- `G[N(v)]` is in `R(4,5,d(v))`.
- `G[M(v)]` is in `R(5,4,n-1-d(v))`.
- Since `R(4,5) = 25`,

  ```text
  n - 25 <= d(v) <= 24.
  ```

Thus candidate degree ranges are:

```text
n = 43: 18..24
n = 44: 19..24
n = 45: 20..24
n = 46: 21..24
```

Complementation maps every candidate to another candidate and maps degree `d`
to `n-1-d`.

More generally, if a cell consists of vertices adjacent to every vertex of a
fixed `c`-clique and nonadjacent to every vertex of a fixed `i`-independent
set, the induced cell graph lies in `R(5-c,5-i)`. Consequences include:

- An edge has at most 13 common neighbors, using `R(3,5) = 14`.
- A nonedge has at most 13 common nonneighbors.
- A triangle has at most 4 common neighbors.
- An independent triple has at most 4 common nonneighbors.
- A mixed adjacency/nonadjacency cell for two anchors has at most 17 vertices,
  using `R(4,4) = 18`.

For `H = G[N(v)]` and `x` in `H`,

```text
d(v) - 18 <= d_H(x) <= 13.
```

These are valid redundant constraints for search. If smaller Ramsey numbers
become trusted premises of a final computer proof, their proofs or separately
verified certificates must be included in the evidence chain.

## Published upper-bound machinery

The 46-vertex nonexistence proof uses extremal catalogues of `(4,5)` graphs,
linear/counting constraints, and large independent computer searches. A key
identity, in the notation above, is

```text
sum_v [
  e(G[M(v)]) - e(G[N(v)])
  - (1/2) d(v) (n - 2 d(v))
] = 0.
```

The published work reports tens of CPU-years across two independent
implementations. Its authors indicate that simply applying the same method to
the next bound would require excessive computation. This is evidence that new
structural reductions are needed; an unlimited-agent framing does not remove
the combinatorial bottleneck.

## Known data versus proved classification

Public Ramsey graph data include:

- A complete collection of 352,366 graphs in `R(4,5,24)`.
- Extremal `(4,5)` graph collections at smaller orders.
- 328 known 42-vertex `(5,5)` graphs; complements give 656 known examples.

The 656 known examples are not a proved complete census. Reports that none of
them extends to 43 vertices therefore do **not** prove `R(5,5) = 43`.

No data have been downloaded during setup. If external catalogues are admitted
later, they need provenance, hashes, format checks, and a completeness argument
where completeness is used.

## Sources

1. S. Radziszowski, *Small Ramsey Numbers*, Dynamic Survey DS1, revision 18,
   2026-04-24:
   <https://www.combinatorics.org/ojs/index.php/eljc/article/view/DS1>
2. G. Exoo, *A lower bound for R(5,5)*, Journal of Graph Theory 13 (1989),
   97-98: <https://doi.org/10.1002/jgt.3190130113>
3. V. Angeltveit and B. McKay, *R(5,5) <= 46*, Journal of Graph Theory 112
   (2026), 198-208: <https://doi.org/10.1002/jgt.70029>
4. Open version of the upper-bound paper:
   <https://arxiv.org/abs/2409.15709>
5. B. McKay, Ramsey graph data:
   <https://users.cecs.anu.edu.au/~bdm/data/ramsey.html>
6. A. Koutsoukou-Argyraki, C. Keller, and E. Zainoulline, formal verification
   of `R(4,5) = 25` in HOL4:
   <https://doi.org/10.4230/LIPIcs.ITP.2024.16>

Items 1-4 establish the current global bounds. Item 5 is a data source, not by
itself a proof of completeness for every collection hosted there.
