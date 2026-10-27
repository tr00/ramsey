# Prescribed equal-degree families with a simultaneous overlap bound

Integration status (2026-10-15): every claim below is independently accepted
on its stated premises. The author-stage “ready” labels are preserved to
keep the exact reviewed proof text unchanged. See the
[independent review](review_family_overlap_20261015_augmentation.md)
and [integration manifest](integration_manifest.json).

Date: 2026-10-15. Task: `abstraction-20261015`.
Author: overlap-author agent. Input revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.
Pure mathematics; no graph computations, downloads, installations, or novelty
review. The claims below await independent exact-revision review.

This note abstracts the accepted
[degree-18 prescribed-family claim](../../research/n43/d18/dense_pivot_coverage.md#claim-dense-pivot-01).
The proof has two distinct ingredients: equality in a triangle forces a rigid
attachment pattern, and a separate component bound limits the family. The
constant three in the second ingredient is verified for the original
independent-five setting; it is not assumed for arbitrary parameters.

All graphs are finite and simple. Write `I_s` for an independent set of size
`s`, `N(v)` for the open neighborhood, `M(v)=V(G)-(N(v) union {v})`, and
`lambda_uv=|N(u) intersect N(v)|` for ambient codegree. If `G` has neither
`K5` nor `I_s`, then `N(v)` is `(4,s)`-free and `M(v)` is `(5,s-1)`-free.
The absence of an independent `(s-1)`-set from a neighborhood *inside a
prescribed family* is derived below under additional hypotheses.

<a id="claim-family-overlap-01"></a>
## 1. Equality, the four-clique exception, and the independent anchor

Claim ID: `docs/general_theorems/family_overlap.md#claim-family-overlap-01`

Kind: local-deduction

Review state: accepted

Scope: integers `s>=3`, `n>=1`, `0<=d<=n-1`, and integer `L` with
`2L=d+s-1`; an `n`-vertex `(5,s)`-free graph `G`; any prescribed subset
`F` of vertices all having ambient degree exactly `d`. Put `k=s-1` and
`b=n-d-1`. Assume every edge of `G[F]` has ambient codegree at least `L`.

Dependencies: only the displayed graph and integer hypotheses; direct counts.

Conclusion:

1. Every triangle of `G[F]` has all three edge codegrees exactly `L`,
   exactly `k` common ambient neighbors, and no ambient vertex adjacent to
   exactly one triangle vertex. In particular, `G[F]` is induced-paw-free.
2. If `2d!=3L`, equivalently `d!=3k`, then `G[F]` has no `K4`.
3. If

   ```text
   A=max(b,2b-3k) > k(d-1-L),                         (anchor condition)
   ```

   then every `N(v) intersect F`, for `v in F`, has no `I_k`.

Proof: for a triangle `u,v,w` in `F`, its common-neighbor set is
independent, since an edge in it would complete a `K5`. Its size `t` is
therefore at most `k`. Inside the `d`-element set `N(u)`, the two sets of
common neighbors on `uv` and `uw` have intersection of size `t`. Hence

```text
2L <= lambda_uv+lambda_uw <= d+t <= d+k = 2L.
```

All inequalities are equalities. Thus both codegrees equal `L`, `t=k`,
and their union is `N(u)`. Repeating at `v,w` proves assertion 1, including
the attachment statement for all ambient vertices, not only vertices in `F`.

If `Q` is a `K4` in `F`, every edge of `Q` belongs to a triangle and has
codegree `L`. For `z` outside `Q`, let `j_z=|N(z) intersect Q|`. The `K5`
prohibition gives `j_z<=3`. Assertion 1 on the triangles of `Q` forbids
`j_z=1`: a triangle containing its unique neighbor would have exactly one
neighbor of `z`. It also forbids `j_z=2`: use a triangle containing one of
the two neighbors and both missed vertices. Thus `j_z` is zero or three.
Counting the cut from `Q` and then common neighbors of its six edges gives

```text
sum_(z outside Q) j_z = 4d-12,
sum_(z outside Q) C(j_z,2) = 6(L-2).
```

For `j_z` zero or three these sums are equal, so `4d=6L`. Along with
`2L=d+k`, this is equivalent to `d=3k`, proving assertion 2. The exceptional
relation is a failure of this contradiction, not an existence assertion.

For assertion 3, suppose `I` is an independent `k`-set in `N(v) intersect F`.
Every `z in M(v)` meets `I`, since otherwise `I union {z}` is an `I_s`.
For `i in I`, consider the class whose exact `I`-signature is `{i}`. Two
nonadjacent members together with `I-{i}` would be an `I_s`; hence this
class is a clique. Four members together with `i` would be a `K5`, so its
size is at most three. At most `3k` of the `b` signatures are singletons.
Every other signature has size at least two. Consequently

```text
e(I,M(v)) >= b + max(0,b-3k) = max(b,2b-3k) = A.
```

Each `i in I` has ambient degree `d` and is adjacent to `v`, so

```text
sum_(i in I) lambda_vi
 = k(d-1)-e(I,M(v)) <= k(d-1)-A.
```

The high-codegree hypothesis gives a lower bound `kL` on this same sum.
The strict anchor condition makes these incompatible. Equality in the
anchor condition is insufficient for this argument. This proves assertion 3.

Search use: propagate | branch after independent review. This claim describes
the hypothetical failure of the desired low-overlap edge guarantee.

Reviews: [review](review_audit_pending_family_overlap_20261015.md).

<a id="claim-family-overlap-02"></a>
## 2. A structural component theorem

Claim ID: `docs/general_theorems/family_overlap.md#claim-family-overlap-02`

Kind: local-deduction

Review state: accepted

Scope: integer `k>=2`; a graph `J` that is induced-paw-free and `K4`-free,
with `alpha(J)<=k` and `alpha(J[N_J(v)])<=k-1` for every vertex `v`.
Choose any integers `rho_a>=R(3,a+1)` for `1<=a<=k`, meaning every graph
of order `rho_a` contains a triangle or an independent `(a+1)`-set.

Dependencies: the explicitly supplied Ramsey upper bounds `rho_a`; all other
steps are proved directly here. Exact Ramsey numbers are not required.

Conclusion: define

```text
B_k(1)=2,
B_k(a)=min(rho_a-1, k*a, rho_(a-1)+k-1)  for 2<=a<=k,
T_k(a)=max(3a,B_k(a)),
H_k=max { sum_i T_k(a_i) : a_i positive integers, sum_i a_i<=k }.
```

The maximum includes the empty list with value zero. Then `|J|<=H_k`.
In particular, if `B_k(a)<=3a` for every `1<=a<=k`, then `|J|<=3k`.
The partition formula is a finite mathematical bound, not a graph search.

Proof: a connected induced-paw-free graph containing a triangle is complete
multipartite. Here is a direct argument to retain the exact structural use.
Start with an induced triangle and extend it to a maximal induced complete
multipartite subgraph `K` with at least three nonempty parts. If an outside
vertex `z` has a neighbor `x` in one part, choose representatives `y,w`
of two other parts. Missing both would make `x,y,w,z` a paw, so `z` meets
at least two parts of `K`. Its adjacency is uniform in each part: if it
meets `x` and misses `x'` in one part, choose a neighbor `y` of `z` in a
different part. The triangle `z,x,y` then has `x'` adjacent to exactly `y`,
a paw. Thus each part is wholly met or wholly missed. Nor can `z` miss
two parts: representatives of them and of a met part form a triangle to
which `z` has exactly one adjacency. It follows that `z` is complete to
all parts or to all but one part. In the first case add `z` as a singleton
part; in the second add it to the missed part. Both contradict maximality.
If `K` were proper in a connected component, a path to its complement
would provide such an outside vertex adjacent to it. Therefore `K` is
the whole component. The `K4` prohibition forces exactly three parts.
For a component `D` of this kind, `|D|<=3alpha(D)`.

Now let `D` be a triangle-free component and put `a=alpha(D)<=k`.
Its neighborhoods are independent, so the local hypothesis gives
`Delta(D)<=k-1`. A greedy independent-set construction therefore gives
`|D|<=k*a`: each selected vertex removes at most `k` vertices. The supplied
Ramsey bound also gives `|D|<=rho_a-1`. If `a>=2`, the nonneighbors in `D`
of any vertex `v` are triangle-free and have independence number at most
`a-1`, since an independent `a`-set there together with `v` would contradict
the definition of `a`. There are at most `rho_(a-1)-1` such nonneighbors.
With `d_D(v)<=k-1` this yields

```text
|D|=1+d_D(v)+|M_D(v)| <= rho_(a-1)+k-1.
```

Thus `|D|<=B_k(a)` when `a>=2`. If `a=1`, triangle-freeness and completeness
give `|D|<=2=B_k(1)`. Every component, of either kind, has order at most
`T_k` of its independence number. Independence numbers add over components;
their sum is at most `k`. The defining partition bound proves `|J|<=H_k`.

Search use: propagate | branch after independent review, with applicable
Ramsey premises recorded; no numerical value of `H_k` is asserted without them.

Reviews: [review](review_audit_pending_family_overlap_20261015.md).

<a id="claim-family-overlap-03"></a>
## 3. Parameterized prescribed-family theorem and the order-43 corollary

Claim ID: `docs/general_theorems/family_overlap.md#claim-family-overlap-03`

Kind: local-deduction

Review state: accepted

Scope: the graph, family, parameters and Ramsey upper bounds of Claims 1--2,
but with no initial hypothesis on edge codegrees. Require `d!=3(s-1)` and
the strict anchor condition in Claim 1. Let `H_(s-1)` be defined in Claim 2.

Dependencies: Claims 1--2. For the explicitly stated `s=5` corollary, the
classical premises `R(3,3)=6`, `R(3,4)=9`, and `R(3,5)=14`, also used by
the accepted source claim, suffice. No edge census, minimum-degree theorem,
or neighborhood catalogue is used.

Conclusion: every prescribed equal-degree family `F` with
`|F|>=H_(s-1)+1` contains an adjacent pair `u,v` with

```text
|N(u) intersect N(v)| <= L-1 = (d+s-3)/2.
```

For `s=5`, this specializes to the following useful two-parameter statement:
if `d` is even, `d!=12`, and an `n`-vertex `(5,5)`-free graph has a prescribed
family of at least thirteen degree-`d` vertices satisfying

```text
max(n-d-1, 2(n-d-1)-12) > 2d-12,
```

then that family contains an edge of codegree at most `(d+2)/2`. A simple
sufficient parameter range for this anchor inequality is `n>=2d+2`.
In particular `n=43`, `d=18`, and `L=11` give the original thirteen-vertex
family conclusion, codegree at most ten. More generally, for fixed `d=18`
the same conclusion holds for every `n>=38` under the stated graph and
family hypotheses; degree regularity of the rest of the graph is unnecessary.

Proof: if there were no such edge, integrality would make every edge of
`G[F]` have codegree at least `L` (also true vacuously if `F` had no edges).
Claim 1 makes `G[F]` paw-free and `K4`-free, and excludes `I_(s-1)` from
each neighborhood within `F`. The ambient `I_s` prohibition gives
`alpha(G[F])<=s-1`. Claim 2 therefore gives `|F|<=H_(s-1)`, contradiction.

For `s=5`, take `k=4` and `rho_2=6`, `rho_3=9`, `rho_4=14` (the value
of `rho_1` is immaterial to the displayed bound for `a=2`). The component
bounds are

```text
B_4(1)=2,
B_4(2)<=5,
B_4(3)<=8,
B_4(4)<=min(13,16,9+3)=12.
```

Thus `T_4(a)=3a` for all `a=1,2,3,4`, and `H_4=12`. Substituting
`L=(d+4)/2` into the strict anchor condition gives the displayed inequality.
If `n>=2d+2`, then `b=n-d-1>=d+1`, and `2b-12>=2d-10>2d-12`, proving
the sufficient range. At `n=43,d=18`, the exact anchor lower bound is
`max(24,48-12)=36`, whereas `k(d-1-L)=4(17-11)=24`. All required
inequalities are strict, and `18!=12` excludes the four-clique exception.

The family is prescribed before selecting the edge. Any additional property
shared by every member therefore holds at both endpoints of the same
guaranteed edge, with its stated overlap bound.

Search use: branch | propagate after independent review. The theorem supplies
existence coverage for a two-root family; exhaustion still requires every
permitted overlap value, overlap map, and completion. It excludes no ambient
graph by itself and is not a certified order-43 decision.

Reviews: [review](review_audit_pending_family_overlap_20261015.md).

<a id="claim-family-overlap-04"></a>
## 4. Strict triangle exclusion and odd-degree families

Claim ID: `docs/general_theorems/family_overlap.md#claim-family-overlap-04`

Kind: local-deduction

Review state: accepted

Scope: an `n`-vertex `(5,s)`-free graph, `s>=3`, and a prescribed family
`F` of ambient degree-`d` vertices. Put `k=s-1`, `b=n-d-1`, and
`A=max(b,2b-3k)`. Let `L` be an integer satisfying

```text
2L>d+k, and A>k(d-1-L).
```

Dependencies: the direct triangle and anchor counts in Claim 1, whose proofs
are repeated for the changed inequality below; the triangle-free component
estimates proved in Claim 2. For the `s=5` conclusions, the same three
classical Ramsey premises as Claim 3.

Conclusion: every such family of size at least `k^2+1` contains an edge of
ambient codegree at most `L-1`. A sharper bound is available from the
triangle-free part of Claim 2: with its explicitly justified `rho_a` and
`B_k(a)`, put

```text
H_k^triangle=max { sum_i B_k(a_i) : a_i>=1, sum_i a_i<=k }.
```

Then family size at least `H_k^triangle+1` suffices. For `s=5`, family
size at least thirteen suffices. Combining this strict case for odd `d`
with Claim 3 for even `d` yields: if `d!=12` and

```text
L=ceil((d+4)/2),
max(n-d-1,2(n-d-1)-12)>4(d-1-L),
```

every prescribed family of at least thirteen degree-`d` vertices in an
`n`-vertex `(5,5)`-free graph contains an edge of codegree at most `L-1`.
The even case uses triangle equality; the odd case uses strict exclusion.

For order 43 this gives the following conditional family guarantees:

| ambient degree `d` | antineighbors `b` | anchor lower bound `A` | `L` | `4(d-1-L)` | guaranteed codegree |
| --- | --- | --- | --- | --- | --- |
| 18 | 24 | 36 | 11 | 24 | at most 10 |
| 19 | 23 | 34 | 12 | 24 | at most 11 |
| 20 | 22 | 32 | 12 | 28 | at most 11 |
| 21 | 21 | 30 | 13 | 28 | at most 12 |

Each row requires at least thirteen actual degree-`d` vertices in the
prescribed family.

Proof: suppose all family edges have codegree at least `L`. For any triangle
`u,v,w` in the family, its common neighbors are independent and have size
`t<=k`. Inside `N(u)` the pair of codegree sets would give

```text
2L<=lambda_uv+lambda_uw<=d+t<=d+k,
```

contrary to the strict threshold. Thus `G[F]` is triangle-free. If `I` were
an independent `k`-set in `N(v) intersect F`, every antineighbor of `v`
would meet it. Its singleton-signature classes are cliques of order at
most three, by exactly the `I_s` and `K5` obstructions in Claim 1.
Hence `e(I,M(v))>=A`, while equal degrees in `F` give

```text
kL<=sum_(i in I)lambda_vi=k(d-1)-e(I,M(v))<=k(d-1)-A,
```

contrary to the strict anchor condition. Since `G[F]` is triangle-free,
each family neighborhood is independent; its size is at most `k-1`.
The greedy independent-set bound then gives
`|F|<=k*alpha(G[F])<=k^2`. This proves the first guarantee.

Each triangle-free component of independence number `a` has order at most
`B_k(a)`, by the degree, Ramsey and nonneighbor bounds proved in Claim 2;
that argument does not use paw-freeness or the `K4` prohibition. Component
independence numbers add, so `|F|<=H_k^triangle` proves the sharper version.
For `k=4` the bounds `2,5,8,12` displayed in Claim 3 are each at most
`3a`, yielding `|F|<=12`. For even `d`, `2L=d+4` and Claim 3 applies;
for odd `d`, `2L=d+5>d+4` and the strict result just proved applies.
The displayed order-43 rows follow by direct substitution, with the anchor
inequality strict in every row.

Search use: branch | propagate after independent review. This is same-family
existence coverage, with all allowed edge maps and completions retained.
It does not assert any required family census or exclude order 43.

Reviews: [review](review_audit_pending_family_overlap_20261015.md).

## Limits of the abstraction

- Dropping `2L=d+s-1` is not justified by the equality proof. Claim 4 treats
  `2L>d+s-1` separately by excluding triangles; if `2L<d+s-1`,
  the triangle union need not fill a neighborhood and paw-freeness does not
  follow from this argument.
- At `d=3(s-1)`, the four-clique cut and pair-incidence identities agree.
  An additional structural exclusion of `K4` would still allow Claim 2,
  but the parameterized theorem above deliberately does not supply one.
- The precise anchor condition uses an independent `(s-1)`-set of neighbors
  whose vertices all belong to `F`, hence all have degree `d`. Applying the
  degree sum to an arbitrary independent set in `N(v)` is unjustified.
- For general `s`, the known three small Ramsey values do not establish
  `B_(s-1)(a)<=3a` for all relevant `a`. Claim 2 keeps the necessary component
  bounds explicit rather than asserting the original family threshold in
  every independent-set regime. These are limitations of this derivation,
  not proofs that stronger theorems are false.
