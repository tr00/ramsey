# Reading the R(5,5)<=46 method

Date: 2026-10-14. Read Angeltveit and McKay, arXiv:2409.15709v2,
dated 2025-09-01, https://arxiv.org/pdf/2409.15709v2.
This is the open preprint version, not a comparison with the journal version.
Retrieved PDF SHA-256:
0121815a4de2320d24c2b5632a6b2a02454183d08831f70057291528d75015ab.
The paper was retrieved at the user's explicit request; no graph data or tools
were downloaded. This note records published methodology, not new deductions.

## What optimization they use

The abstract and Sections 4-5 describe linear programming/counting, not
semidefinite programming or flag algebras. Their displayed final inequality
argument can be checked as ordinary linear arithmetic and graph case analysis.
No SDP matrices or flag-algebra certificate are presented in this version.

## Three stages

1. Section 3 generates complete edge-dense slices of (4,5) graphs: order 24
   with at least 127 edges, order 23 with at least 119, order 22 with at least
   113, and order 21 with 107. It avoids generating all graphs of orders 21-23.
   Generation itself exploits attachment degree budgets and dense prefixes to
   create intermediate bottlenecks.
2. Sections 4-5 use the exact excess identity to force sufficient weighted
   membership in these slices, and structural arguments to force a tractable
   adjacent pair of pointed neighborhoods. Theorem 5.4 is the coverage theorem.
3. Sections 6-7 exhaust the selected overlaps and their extensions using two
   independently implemented computations, with different gluing strategies.

## The counting filter in detail

For a hypothetical 46-vertex F, each degree lies in 21..24, and

```
sum_v [e(M(v))-e(N(v))-(1/2)d(v)(46-2d(v))]=0.
```

If every neighborhood avoids the selected dense slices and every
antineighborhood avoids their complements, the contributions are at least
one for every vertex. For example, at degree 24 the contribution is

```
e(M(v))-e(N(v))+24.
```

Avoiding the slices implies e(M(v))>=104 and e(N(v))<=126, hence the
contribution is at least two. At degrees 23,22,21 the respective bounds are
119-118, 135-112-22, and 149-106-42, all at least one.
Thus some exceptional dense slices must occur. Section 5 refines this with
weights 5,2,1 for classes E1,E2,E3 and their complementary counterparts:
alpha=5m1+2m2+m3, beta=5mbar1+2mbar2+mbar3, alpha+beta>=46.
Proposition 5.3 proves their induced adjacency pattern forces an overlap from
the selected list, using additional finite lemmas and inclusion-exclusion.

Theorem 5.4 permits throwing away four or seven of the hardest pointed choices
in designated classes: the forced degree five or eight ensures a retained
incident choice exists. The difficulty ranking is heuristic, but the coverage
argument is mathematical. Merely choosing the easiest pointed graphs would
not have this guarantee.

## Gluing and early extension

For adjacent roots a,b, glue their (4,5)-free neighborhoods along the common
neighborhood K, with all relevant overlap isomorphisms. Besides the cross
edges, include selected vertices adjacent to neither root during gluing.
Their presence avoids an enormous collection of weaker partial solutions.

The first implementation works with graphs of at least 37 vertices; it reports
8,485,247 order-37 outputs, none extending to order 38. The second uses forced
small induced structures in the omitted cell, propagation/backtracking, then
Glucose and successive extension phases. It reports roughly 12 million initial
overlaps, 15,248 satisfiable first-phase cases, 17 second-phase cases, and no
third-phase cases. See Sections 6-7 for the differing phase definitions.
The authors estimate about 30 CPU-years for the first computation and 50 more
for the independent replication. These are not LRAT-based certification claims.

## Consequence for our order-43 track

Our current frontier reductions are predominantly necessary conditions for an
already fixed degree-18 root. To emulate the decisive part of this paper we
need a coverage theorem forcing manageable neighborhoods or adjacent-root
families in every graph of the target branch. An exclusion of selected small-k
cases alone does not supply such a theorem.

The 46-vertex thresholds do not transfer to order 43: neighborhoods can be
smaller and considerably more varied, and the degree term in the excess
identity changes. A useful mathematical task is to seek branch-dependent
linear weights and unavoidable pairs using the degree-excess budgets, rather
than assume the same dense slices suffice. SDP/flag inequalities could be an
additional research direction, but they are not a reproduction of this paper.
At fixed order 43 they require exact finite-sampling corrections and checked
coefficient/positivity certificates before use in pruning.
