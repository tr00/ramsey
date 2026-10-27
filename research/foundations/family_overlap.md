<a id="prescribed-equal-degree-families-with-a-simultaneous-overlap-bound"></a>
# Prescribed equal-degree families with a simultaneous overlap bound

- **Kind and scope:** four local deductions for finite simple graphs with no
  `K5` or `I_s`, and prescribed families whose members all have the same
  ambient degree. Equality and strict triangle thresholds have separate
  hypotheses; every anchor inequality is strict. The component envelope
  remains explicit for general `k=s-1`.
- **Author:** overlap-author agent. **Independent reviewers:**
  `augmentation_author` (augmentation-author) and `/root/audit_family_overlap`,
  each distinct from the author. **Review state:** accepted for all four
  claims on their stated premises. This editorial consolidation retains
  historical acceptance and is not a new mathematical review.
- **Dependencies:** direct graph counts and the explicitly supplied Ramsey
  upper bounds in the component theorem. Numerical `s=5` corollaries use
  the classical premises `R(3,3)=6`, `R(3,4)=9`, and `R(3,5)=14`; only their
  upper bounds are needed. No census, minimum-degree theorem, or complete
  neighborhood catalogue is assumed. Classical values were not recertified.
- **Search use and limits:** propagate or branch only under the exact
  prescribed-family, equal-degree, threshold, exception and anchor hypotheses
  below. The conclusion selects both endpoints from that same family; it
  supplies neither a universal family census nor an `I4` prohibition in
  arbitrary ambient neighborhoods. Exhaustion still requires every permitted
  codegree, overlap map and completion. No order-43 closure or novelty is
  claimed. Both historical independent reviews are retained inline.

This note abstracts the accepted
[degree-18 prescribed-family claim](../n43/d18/dense_pivot_coverage.md#claim-dense-pivot-01).
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
<a id="1-equality-the-four-clique-exception-and-the-independent-anchor"></a>
## 1. Equality, the four-clique exception, and the independent anchor

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

Search use: propagate | branch. This claim describes
the hypothetical failure of the desired low-overlap edge guarantee.

<a id="claim-family-overlap-02"></a>
<a id="2-a-structural-component-theorem"></a>
## 2. A structural component theorem

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

Search use: propagate | branch, with applicable
Ramsey premises recorded; no numerical value of `H_k` is asserted without them.

<a id="claim-family-overlap-03"></a>
<a id="3-parameterized-prescribed-family-theorem-and-the-order-43-corollary"></a>
## 3. Parameterized prescribed-family theorem and the order-43 corollary

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

Search use: branch | propagate. The theorem supplies
existence coverage for a two-root family; exhaustion still requires every
permitted overlap value, overlap map, and completion. It excludes no ambient
graph by itself and is not a certified order-43 decision.

<a id="claim-family-overlap-04"></a>
<a id="4-strict-triangle-exclusion-and-odd-degree-families"></a>
## 4. Strict triangle exclusion and odd-degree families

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

Search use: branch | propagate. This is same-family
existence coverage, with all allowed edge maps and completions retained.
It does not assert any required family census or exclude order 43.

<a id="limits-of-the-abstraction"></a>
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

## Acceptance correspondence and historical scope

The [historical integration manifest](../../docs/general_theorems/integration_manifest.json)
records the reviewed source, integrated snapshot and augmentation review.
The committed integration snapshot in Git (`f98a128`) matches that manifest;
removing only its integration-status banner reconstructs the exact reviewed
source identified by both reviewers. The original augmentation review also
matches the manifest's retained review record. These historical identifiers
continue to describe their original bytes, not this relocated topic.

Compared with that snapshot, the pre-migration source changed review-state
and review-link administration, relocated the source link, and removed a
conditional application to a former degree-20 branch. Its settings, scopes,
dependencies, conclusions, proofs, table and search-use conditions otherwise
match the reviewed development. The consolidation removes repeated
administrative fields and preserves that development without a mathematical
change. For completeness, the removed historical application was:

> In particular, the degree-20 row applies conditionally
> in the normalized minimum-degree-20 branch if it has at least thirteen
> degree-20 roots; it does not establish that count throughout the branch.

This quotation records a historical conditional use, not an active branch or
a family census. Both original reviews' substantive findings are retained
below as decisive checks and limits, without repeating the theorem proofs or
source/review bookkeeping. The subsequently condensed audit's claim-outcome
table is retained as well. No new mathematical review, graph computation,
download, installation, or novelty review was performed.

<a id="independent-review"></a>
<a id="independent-review-of-prescribed-equal-degree-families"></a>
## Independent review of prescribed equal-degree families

Reviewer: `augmentation_author`. Covered statements:
[Claim 01](#claim-family-overlap-01) through
[Claim 04](#claim-family-overlap-04). Author and reviewer:
overlap-author and augmentation-author, distinct agents.
This is the historical independent review, not a new review of the migration.

Dependencies reviewed: All internal mathematical arguments were independently
rederived. The numerical corollaries use the classical stated premises
`R(3,3)=6`, `R(3,4)=9`, and `R(3,5)=14`. No census, minimum-degree
premise, or completeness of a graph catalogue is needed. The accepted source
note motivates the abstraction but is not needed as an unproved logical step.
No external literature or numerical Ramsey source was fetched in this review.

<a id="independent-checks"></a>
### Independent checks

- **Triangle equality and ambient coverage.** Independently checked the
  ambient common-neighbor intersection, its independence and size bound,
  exact codegrees, complete neighborhood union and no-exactly-one attachment
  consequence. The induced-paw prohibition applies within the family.
- **Four-clique exception.** Checked the outside masks zero and three, the
  internal-edge corrections `4d-12` and `6(L-2)`, and the resulting exception
  exactly `d=3k`. The theorem excludes that parameter, not its existence.
- **Anchor counts and strictness.** Checked singleton classes of size at
  most three, the bound `max(b,2b-3k)`, and exact codegree sum
  `k(d-1)-e(I,M(v))`. Equal ambient degrees and a strict anchor inequality
  are necessary here; neighborhood restrictions are derived only within `F`.
- **Complete multipartite structure.** Checked maximality, adjacency
  uniformity within parts, the missed-parts paw obstruction and the use of
  connectedness. `K4` limits triangle-containing components to three parts
  and order at most `3alpha`.
- **Triangle-free component envelope.** Checked all three entries
  `k*a`, `rho_a-1`, `rho_(a-1)+k-1`, the `a=1` bound two, and additivity
  over disconnected components, including the empty graph.
- **Numerical recovery and parity.** Independently checked component bounds
  `2,5,8,12`, `H_4=12`, the even-degree equality threshold, the excluded
  degree 12, the sufficient range `n>=2d+2`, and `d=18,n>=38`.
- **Strict threshold.** Checked strict triangle exclusion separately from
  equality, the still-applicable anchor, the `k^2` cap and component-envelope
  refinement, and odd degrees at `L=ceil((d+4)/2)`. All degree-18/19/20/21
  entries were substituted independently, including anchor comparisons
  `36>24`, `34>24`, `32>28`, and `30>28`.
- **Quantifiers and permitted use.** Checked integrality and vacuous edge-free
  cases. All restrictions concern the same prescribed family, whose shared
  property holds at both guaranteed endpoints. All permitted maps and
  completions still require exhaustion; no family census or closure follows.

Outcome: **accepted**, all four claims on their explicit hypotheses and
numerical Ramsey premises, for the retained proof matched above to the
historically reviewed source.

Limits: This is an independent mathematical audit, not a formally checked
certificate. The stated classical Ramsey values were not reproved or fetched.
Novelty has not been checked. The theorem supplies conditional two-root
coverage, not an order-43 nonexistence result. Any proof change requires a
renewed exact-revision review; replacing the numerical Ramsey premises also
requires checking their applicability to the component envelope.

<a id="audit-pending-review"></a>
<a id="independent-audit-of-the-prescribed-family-overlap-claims"></a>
## Independent audit of the prescribed-family overlap claims

Covered statements: [Claim 01](#claim-family-overlap-01) through
[Claim 04](#claim-family-overlap-04).

Author and reviewer: overlap-author agent; independent
`/root/audit_family_overlap` agent. The reviewer rederived the arguments
before consulting the earlier source theorem; the author's self-check and
any concurrent review are not treated as independent evidence for this audit.
This is a distinct historical independent audit, not a new migration review;
the legacy `audit-pending-review` anchor does not indicate a pending outcome.

Dependencies reviewed: the four source claims are audited below directly.
The specialized numerical statements assume the classical upper bounds
`R(3,3)<=6`, `R(3,4)<=9`, and `R(3,5)<=14`. Their lower bounds are
unnecessary. Those literature premises were not independently proved or
certificate-replayed here. For a completely specified input to the component
formula one may also take `rho_1=3`, using the elementary `R(3,2)=3`.
The source theorem was consulted for comparison in the
[degree-18 prescribed-family topic](../n43/d18/dense_pivot_coverage.md),
together with the mathematical baseline and workflow then in force.

No census, minimum-degree theorem, solver, graph enumeration, download,
installation, or formal checker was used. All calculations below are
mathematical counts.

<a id="claim-outcomes-and-independent-checks"></a>
### Claim outcomes and independent checks

| Claim | Outcome | Decisive check |
| --- | --- | --- |
| 01 | accepted | A family triangle saturates2L<=d+k, forcing exact codegrees, a complete neighborhood union and no vertex with exactly one triangle neighbor. The four-clique and independent-anchor alternatives were checked. |
| 02 | accepted | Paw-free triangle components and triangle-free components satisfy the stated independence/order capacities. Ramsey inputs and all empty/equality cases were checked. |
| 03 | accepted | Summing component capacities forces a low-overlap edge inside the prescribed same-degree family; every numerical degree18/19/20/21 substitution was recomputed. |
| 04 | accepted | Strict triangle exclusion and odd-degree consequences use the same-family and exact-codegree assumptions, not a new universal root family. |

Every outcome applies to the historically reviewed source matched to the
retained proof above. Ambient common neighbors
are counted globally. An I4 prohibition is used only where derived from
its actual anchor, not inherited by a whole neighborhood. The proof supplies
conditional overlapping families, not disjoint partitions or completed gluing.

<a id="claim-01-equality-the-exceptional-four-clique-and-the-anchor"></a>
### Claim 01: equality, the exceptional four-clique, and the anchor

Outcome: **accepted** on the exact stated hypotheses.

Independently checked the global triangle-neighborhood intersection and
complete union, all three codegrees, and the ambient attachment statement.
No prohibition of `I_k` in arbitrary ambient neighborhoods is inferred.
The four-clique incidence corrections give exactly `2d=3L`, hence `d=3k`,
with no additional equality case.

The exception is real as a structural limitation: a complete four-partite
graph with each part of size `k` is `(5,k+1)`-free, has degree `3k` and
edge codegree `2k`, and contains a four-clique. This is a symbolic family
checking the necessity of the exception; it is not an order-43 witness or
an assertion that it satisfies the strict anchor hypothesis.

The anchor audit checked the nonempty signatures, singleton clique bound
three, and incidence lower bound also for `b<3k` and `b=0`. The degree
partition `{v},N(v),M(v)` justifies equal degrees only because the anchor
members lie in `F`, not merely in `N(v)`. The contradiction requires
`A>k(d-1-L)`; equality does not suffice.

<a id="claim-02-the-component-bound"></a>
### Claim 02: the component bound

Outcome: **accepted**, conditional on the supplied Ramsey upper bounds.

The complete-multipartite argument was checked independently rather than
importing a paw-free classification. Decisive checks were the availability
of a neighbor in another met part, the mixed-adjacency and two-missed-parts
paw obstructions, maximality and connectedness. The resulting triangle
components have exactly three parts and order at most `3alpha`.

For triangle-free components, independently checked the local degree
restriction, all three entries in `B_k(a)`, the `a=1` case including
singletons, and addition of positive independence capacities across
components. The empty graph is included. No assumption that the supplied
`rho_a` are exact, minimal or monotone enters the proof.

<a id="claim-03-the-equality-threshold-family-theorem"></a>
### Claim 03: the equality-threshold family theorem

Outcome: **accepted**, conditional only on Claims 01--02 and their
explicit Ramsey premises.

Checked that the contradiction quantifies over every edge of the same
prescribed `G[F]`, including empty edge sets, with ambient independence
supplying `alpha(G[F])<=k`. All local hypotheses of Claim 02 and the exact
four-clique exclusion `d!=3k` were accounted for.

The numerical audit used `rho_1=3,rho_2=6,rho_3=9,rho_4=14` and checked
component bounds `2,5,8,12`, `H_4=12`, integer `L` for even degrees, the
anchor substitution `4(d-1-L)=2d-12`, and overlap bound `(d+2)/2`.
The sufficient range `n>=2d+2` and the sharper `d=18,n>=38` were checked;
the latter gives `b>=19` and `A>=26>24`. At `n=43,d=18`, the exact values
are `b=24,A=36,L=11` and right-hand anchor bound `24`.

Both endpoints belong to the prescribed family; the result does not splice
two separate existence guarantees.

<a id="claim-04-strict-triangle-exclusion-and-odd-degrees"></a>
### Claim 04: strict triangle exclusion and odd degrees

Outcome: **accepted**, conditional on the stated Ramsey premises for
the sharper numerical specialization.

Checked strict triangle exclusion without an equality conclusion or paw-free
classification, the unchanged independent-neighbor anchor argument, and the
`k^2` family cap. The refined `B_k(a)` envelope uses only triangle-freeness,
the local degree restriction and Ramsey premises, so it applies here too.
For `k=4`, the checked capacities `2,5,8,12` give the thirteen-member
threshold.

The parity audit verified equality for even degrees and `2L=d+5>d+4` for
odd degrees, using the applicable proof in each case. Every order-43 table
row was recomputed, including its `b`, `A`, `L`, anchor right-hand side and
codegree bound. Every anchor inequality is strict. Every row requires
thirteen actual members of that same degree family; no census is proved.

<a id="search-use-limits-and-handoff"></a>
### Search use, limits, and handoff

All four exact-revision claims may support propagation or branching under
their recorded hypotheses and Ramsey premises after coordinator integration.
They are existence-coverage results for retained two-root families. A future
exhaustion must still cover every permitted codegree, overlap map and
completion. No claim supplies a complete graph nonexistence certificate,
family census, novelty determination, or decision of `R(5,5)`.

No unsupported inference requiring withdrawal was found in these four
claims. The restrictions on the equality threshold, exceptional `d=3k`,
strict anchor inequality, equal degrees within the prescribed family, and
explicit general-`k` component bounds are essential and must be retained.
This review changes no source proof or shared index. Any substantive proof
change requires a fresh exact-revision audit.

## Validation

Exact integer evaluation reproduced both component partition envelopes from
the stated small-Ramsey upper bounds, all four order-43 table rows, the
degree-18 anchor endpoint at n=38 and the exceptional four-clique incidence
equality. This checks the displayed arithmetic only; it does not recertify
the Ramsey inputs, establish a family census or renew independent acceptance.

## Changelog

- Consolidated the prescribed equal-degree family development and both distinct
  historical independent reviews into this authoritative topic. Recovered
  substantive findings from the committed integration snapshot as decisive
  checks and limits, retaining the condensed audit's outcome table and legacy
  heading aliases.
- Preserved acceptance of all four claims by matching the manifest's integrated
  snapshot and reviewed-source record to the retained proofs. Removed repeated
  administrative fields without changing mathematical hypotheses, conclusions,
  arguments, Ramsey premises, numerical tables or permitted search use.
