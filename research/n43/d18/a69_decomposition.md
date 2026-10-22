# Structural decomposition of the 69-edge neighborhood slice

Date: 2026-10-21. Task: `a69-decomposition-20261021`.
Author and self-auditor: Main, working alone.

All claims are **ready for independent review**. Search use is none until
review; the proposed use is complete structural branching and attachment
propagation. No family is excluded as an ambient neighborhood. No solver,
catalogue enumeration, download, Lean change, or novelty review was performed.

The result is an exhaustive structural parametrization, with exact local
attachment tests, rather than an isomorphism census. The two-connected
families remain live. The decomposition uses both internal vertex connectivity
and the independent-four transversal number, not a small cross-edge hypothesis.
Here a maximum `(4,4)` core means maximum vertex order among induced
`(4,4)`-free subgraphs, not maximum edge count.

## Setting and premises

Pure claims concern a graph `A` on 18 vertices with no `K4`, no `I5`, and
`e(A)=69`. Thus `alpha(A)=4` by `R(4,4)=18`. Write

```text
tau_4 = tau(mathcal I_4(A)).
```

Here `A` names the induced graph as well as its vertex set when unambiguous.
Other notation follows [the common reference](../../../docs/notation.md).
An ambient specialization additionally has `G in R(5,5,43)`,
`A=G[N_G(v)]`, `d_G(v)=18`, and `B=M_G(v)`. It has

```text
q=16,  x=168+E_A,  epsilon_u=d_G(u)-18 in {0,...,6}.
```

The proof retains the following external and reviewed premises:

- `R(3,3)=6`, `R(3,4)=9`, `R(4,4)=18`, and `R(3,5)=14`, recorded
  in the [baseline](../../../docs/mathematical_baseline.md).
- Published `(4,4)` edge intervals at orders 11 through 17, from
  McKay--Radziszowski (1992), Table 1, p. 16, as recorded in the
  [root table](../../../README.md#state-of-the-art). In particular the
  order-16 edge count is exactly 60 and the order-17 count exactly 68.
- The order-10 interval `14..31` is a sufficient bound, obtained by
  complementing the elementary cap 31 in
  [the core-cap proof](x136/five_column_compatibility.md#claim-five-columns-core-caps).
  It is not asserted to be a published exact interval.
- [Disconnected classification](neighborhood_connectivity.md#claim-connectivity-01)
  and [its edge threshold](neighborhood_connectivity.md#claim-connectivity-02).
- [Reviewed separator profiles](connected_structure_transfer.json),
  claim `claim-connected-separator-profiles`.
- [Reviewed transversal deletion](deletion_degree_transfer.json), especially
  `claim-deletion-transfer-boundary-stability`, for comparison. The small-core
  formulas below are derived directly rather than changing that source.

The literature and census premises are not recertified here. The user's
closures of `x=137` and `x=138` in another checkout are not used.

<a id="claim-a69-core-connectivity"></a>
## 1. Connectivity of the critical cores

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-core-connectivity`  
Kind: local-deduction  
Review state: ready  
Scope: every `(4,4)`-free graph `H` of order `h>=12`  
Dependencies: `R(3,4)=9`; independence additivity  
Conclusion: `kappa(H)>=h-11`; at orders 16 and 17 the degree profiles
are respectively eight degrees 7 plus eight degrees 8, and all degrees 8  
Search use: none pending independent review  
Reviews: none

Proof. A disconnected induced subgraph of `H` has independence number at
most three. Each component with independence number one is a clique of
order at most three. Each component with independence number two has no
`K4` and no `I3`, and has order at most eight. The possible disconnected
independence profiles have total order at most eleven, attained by `(1,2)`;
profiles `(1,1)` and `(1,1,1)` give at most six and nine. Thus a separator
must remove at least `h-11` vertices. This argument also excludes initial
disconnection when `h>=12`.

Every vertex of an order-`h` core has at most eight neighbors and at most
eight nonneighbors, since these sets have types `(3,4)` and `(4,3)`.
Consequently `h-9<=d_H<=8`. At order 17 this forces degree eight. At
order 16 it gives degrees seven or eight; the published edge count 60
fixes eight vertices of each degree. In particular every order-16 core
is at least five-connected, and every order-17 core at least six-connected.

<a id="claim-a69-cut-classification"></a>
## 2. Every cut-vertex case is a critical core with a leaf

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-cut-classification`  
Kind: local-deduction  
Review state: ready  
Scope: every pure `A` in the setting  
Dependencies: reviewed disconnected and separator profiles; Claim 1  
Conclusion: if `A` has a cut vertex, its unique leaf `u` and unique cut
vertex `z` have the description below, and `tau_4` is one or two  
Search use: none pending independent review  
Reviews: none

`A` is connected because disconnected neighborhoods have at most 68 edges.
For any cut vertex `z`, the reviewed one-separator profiles leave
`K_m` plus a `(4,4)`-free component, with caps 69, 66, 63 for `m=1,2,3`.
Thus equality at 69 forces `m=1`, and equality in every contributing
bound. Writing that singleton as `u` and the other component as `C`,

```text
|C|=16,  e(C)=60,
uz is an edge,  N_C(u)=empty,
W=N_C(z),  |W|=8,  C[W] is triangle-free.
```

Conversely any `(4,4)`-free `C` on 16 vertices and any triangle-free
eight-subset `W` give a valid pure `A` by this construction. Its edge
count is `60+8+1=69`. A `K4` cannot use `u` and cannot use `z` unless
`W` contains a triangle. An independent set uses at most one of `u,z`
and at most three vertices of `C`, so there is no `I5`.

Claim 1 makes `C` five-connected. Removing any vertex other than `z`
leaves the graph connected: removing `u` leaves `z` with eight neighbors
in `C`; removing a core vertex leaves `C` connected and at least seven
attachments to `z`. Thus `u,z` are unique in their respective roles.
The graph `A-u` is itself at least five-connected: fewer than five
deletions cannot disconnect `C` or exhaust `z`'s eight attachments.

All independent four-sets are exactly

```text
{u} union J,  J in mathcal I_3(C),
{z} union J,  J in mathcal I_3(C-W).
```

Hence `{u,z}` is a transversal. The two subfamilies are disjoint. In fact
`52<=|mathcal I_3(C)|<=60`: the degree profile gives
`triangles(C)+|mathcal I_3(C)|=112` by Goodman, while edge codegrees
at most three give at most 60 triangles in both `C` and its complement.

<a id="claim-a69-singleton-classification"></a>
## 3. Singleton transversals and the exact cut-family split

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-singleton-classification`  
Kind: local-deduction  
Review state: ready  
Scope: every pure `A` in the setting, and the cut-family parameters of Claim 2  
Dependencies: order-17 census count; Claims 1 and 2  
Conclusion: `tau_4=1` exactly for pendant extensions of an order-17
`(4,4)` core; the cut family has `tau_4=2` exactly when `C-W` contains `I3`  
Search use: none pending independent review  
Reviews: none

Proof. If `{u}` is a transversal, `A-u` is `(4,4)`-free on 17 vertices
and has exactly 68 edges. Consequently `d_A(u)=69-68=1`. Conversely
attaching a leaf to a `(4,4)`-free 17-core gives a valid pure `A`, and
every `I4` must use that leaf. Thus the singleton-transversal family is
precisely this pendant construction; it is a subfamily of Claim 2.

Within Claim 2, a singleton transversal must be the unique leaf `u`.
The displayed `I4` families show that this happens exactly when
`mathcal I_3(C-W)` is empty. Otherwise `tau_4=2`.

In the singleton case `C+z` is a 17-core. Its regularity forces `W` to
be exactly the eight degree-seven vertices of `C`. Moreover `C[W]` is
cubic: for `c in W`, `d_W(c)` is the codegree of the edge `zc` in the
17-core, which is three by the reviewed
[17-core codegree argument](large_row_extensions.md#claim-seventeen-codegree-moments).
Thus `e(C[W])=12`, and `e(C-W)=16`. These are additional necessary
conditions; the degree-set and edge counts alone are not substituted for
the exact test that `C-W` is `I3`-free.

This also shows why a leaf does not by itself imply a singleton transversal:
the `z`-containing family may still be present. No pure cut-family
construction is asserted to extend to an order-43 candidate.

<a id="claim-a69-two-transversal"></a>
## 4. Exact parametrization of the two-connected, two-transversal family

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-two-transversal`  
Kind: local-deduction  
Review state: ready  
Scope: pure `A` with `kappa(A)>=2` and `tau_4=2`  
Dependencies: order-16 census count; Claims 1 and 3; smaller Ramsey bounds  
Conclusion: exactly the following two attachment families occur, and
their vertex connectivity is determined by the attachment sizes  
Search use: none pending independent review  
Reviews: none

Choose any minimum transversal `{u,w}`. Its complement `C` is a
16-vertex `(4,4)` core, with 60 edges and the degree profile of Claim 1.
Put `P=N_C(u)`, `Q=N_C(w)`, `p=|P|`, `q'=|Q|`. The local symbol `q'`
is an attachment size, not the fixed neighborhood deficit `q=16`.

| Relation on `u,w` | Edge budget | Size range | Exact additional mixed test | Vertex connectivity |
| --- | --- | --- | --- | --- |
| Edge | `p+q'=8` | `1<=p,q'<=7` | `C[P intersect Q]` is independent | `min(p,q')+1`, in `2..5` |
| Nonedge | `p+q'=9` | `2<=p,q'<=7` | `C-(P union Q)` is `I3`-free | `min(p,q')`, in `2..4` |

In both rows `C[P]` and `C[Q]` must be triangle-free. These tests and
budgets are necessary and sufficient for the stated pure family; every
allowed labeled choice is retained, and no occurrence of an attachment
type is asserted without its actual core and sets.

Proof of the local tests. A `K4` using one added vertex is exactly a
triangle in its attachment. A `K4` using both added vertices is possible
only in the edge case, where it is an edge in `P intersect Q`. An `I5`
using one added vertex is impossible because `C` has no `I4`. An `I5`
using both is possible only in the nonedge case, where its other three
vertices lie in `C-(P union Q)`. This proves local sufficiency as well as
necessity. The 69-edge budget gives `p+q'+1[uw edge]=9`.

In the edge case the common attachment is independent in an `I4`-free
core, so `|P intersect Q|<=3` and `|P union Q|>=5`. Let
`k=min(p,q')+1<=5`. Fewer than `k` deletions leave the core connected.
If both added vertices survive, they remain joined to one another and
cannot lose all their combined core neighbors. If just one survives,
disconnecting it costs its own attachments plus the other added vertex,
at least `k` deletions. Thus connectivity is at least `k`; isolating the
smaller-degree added vertex proves equality.

In the nonedge case `|P union Q|>=8` by `R(4,3)=9`. Set
`k=min(p,q')<=4`. Fewer than `k` deletions leave the core connected and
leave each surviving added vertex attached to it. Isolating a
smaller-degree added vertex again proves equality. The size ranges in
the table are exactly those ensuring two-connectivity. Claim 3 then
excludes a singleton transversal, so the constructed graph has `tau_4=2`.

In particular, `kappa(A)>=6` forces `tau_4>=3` throughout the 69-edge
slice. A two-set transversal can still coexist with connectivity five.

There is a concrete subfamily realizing every edge-case connectivity in
`2..5`. Start with any `(4,4)` 17-core, delete a vertex `z`, partition
its eight neighbors into two nonempty parts `P,Q`, and replace `z` by
adjacent vertices `u,w` attached to the respective parts. Both parts are
triangle-free because the original neighborhood of `z` is triangle-free.
The resulting graph has 69 edges and connectivity `min(|P|,|Q|)+1`.
Thus these connectivity values are actual pure-graph possibilities, not
just arithmetic profiles. No ambient extension is asserted.

For a general edge-case template, contraction of `uw` produces a
`(4,4)` 17-core exactly when all three conditions hold:

```text
P intersect Q is empty,
C[P union Q] is triangle-free,
C-(P union Q) is I3-free.
```

Indeed the contracted graph has `60+|P union Q|` edges. A `(4,4)` 17-core
must have 68 edges, forcing the union to have size eight and the
attachments to be disjoint. The remaining two tests are exactly the
new vertex's `K4` and `I4` conditions. This separates vertex splittings
of critical 17-cores from the other retained 16-core attachment systems,
without assuming that every two-transversal graph has a critical contraction.

<a id="claim-a69-minimum-core"></a>
## 5. The whole slice has a core of order at least ten

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-minimum-core`  
Kind: local-deduction  
Review state: ready  
Scope: every pure `A`; every chosen minimum transversal `T`  
Dependencies: degree sum; `I5` prohibition; core edge intervals  
Conclusion: `1<=tau_4<=8`, with the core and degree constraints below  
Search use: none pending independent review  
Reviews: none

For every vertex `u`, the closed neighborhood `{u} union N_A(u)` is a
transversal: an `I4` outside it would extend with `u` to `I5`. Since
`sum d_A=138`, some vertex has degree at most seven. Thus `tau_4<=8`.
For `t=tau_4`, this observation at every vertex also gives

```text
d_A(u)>=t-1 for every u.
```

For a minimum transversal `T` of size `t`, put `H=A-T`, `h=18-t`,
`g=e(A[T])`, `a_H=e(H)`, and `P_u=N_H(u)` for `u in T`.
The graph `H` is `(4,4)`-free. Its attachments have the exact budget

```text
sum_(u in T)|P_u|=69-a_H-g.
```

Every `u in T` has a private independent triple in `H-P_u`: deleting
`u` from a minimum transversal leaves an `I4` meeting `T` only at `u`.
Therefore `|P_u|<=min(8,h-3)`. The eight bound follows because
`H[P_u]` is triangle-free and `I4`-free. The core orders and budgets are:

| `t` | Core order `h` | Recorded core edge range `a_H` | Attachment budget |
| --- | --- | --- | --- |
| 1 | 17 | 68 | `1` |
| 2 | 16 | 60 | `9-g` |
| 3 | 15 | `50..55` | `[14-g,19-g]` |
| 4 | 14 | `41..50` | `[19-g,28-g]` |
| 5 | 13 | `33..45` | `[24-g,36-g]` |
| 6 | 12 | `26..40` | `[29-g,43-g]` |
| 7 | 11 | `19..36` | `[33-g,50-g]` |
| 8 | 10 | sufficient `14..31` | `[38-g,55-g]` |

Also, summing the degree floor separately on `T,H` gives

```text
h(t-1)-69 <= a_H-g <= 69-t(t-1).
```

These are necessary numerical restrictions, not realizability tables.
For `t>=3` the template and exchange tests below retain all residual families.

<a id="claim-a69-attachment-tests"></a>
## 6. Exact core attachment tests and minimum-transversal witnesses

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-attachment-tests`  
Kind: local-deduction  
Review state: ready  
Scope: any `(4,4)` core `H`, disjoint vertex set `T`, graph on `T`, and
specified attachments `P_u subset H`; in this slice `|H|+|T|=18`  
Dependencies: forbidden-set decomposition  
Conclusion: the following local tests are equivalent to `K4/I5` avoidance;
the exchange test is equivalent to `T` being a minimum transversal  
Search use: none pending independent review  
Reviews: none

For `J subset T` write

```text
P_cap(J)=intersection_(u in J) P_u,
D_J=H - union_(u in J) P_u.
```

The full graph is `K4/I5`-free exactly when:

| Configuration in `T` | Required condition in `H` |
| --- | --- |
| One vertex `u` | `H[P_u]` is triangle-free |
| An edge `J` | `H[P_cap(J)]` is independent |
| A triangle `J` | `P_cap(J)` is empty |
| An independent pair `J` | `H[D_J]` has no `I3` |
| An independent triple `J` | `H[D_J]` is a clique |
| An independent four-set `J` | `D_J` is empty |

In addition `A[T]` itself must have no `K4` and no `I5`. A mixed `K4`
uses one, two, or three panel vertices, giving the first three tests. A
mixed `I5` cannot use only one panel vertex because `H` has no `I4`;
using two, three, or four gives the last three tests. Forbidden sets
inside either side are already accounted for. This proves equivalence.
In particular, independently of scalar budgets,

```text
|P_cap(J)|<=3                 for an edge J,
|union_(u in J)P_u|>=h-8      for an independent pair J,
|union_(u in J)P_u|>=h-3      for an independent triple J.
```

Here is an exact condition distinguishing a minimum transversal from a
merely inclusion-minimal one. For nonempty `U subset T`, define the
family on `H`

```text
mathcal F(U) = {K : for some nonempty independent J subset U,
                    |J|<=4, K in mathcal I_(4-|J|)(H[D_J])}.
```

The family of independent zero-sets is `{empty}`. If `U` contains `I4`,
then `mathcal F(U)` contains the empty set and cannot be hit by any set.
Otherwise `T` is a minimum transversal exactly when

```text
for every nonempty U subset T and every D subset H with |D|<|U|,
some member of mathcal F(U) is disjoint from D.               (* )
```

Proof. Every smaller transversal can be uniquely written
`(T-U) union D` with `U!=empty` and `|D|<|U|`. An `I4` avoiding it
must use some nonempty independent `J subset U`, since `H` has no `I4`.
Its remaining vertices form exactly a member of `mathcal F(U)` disjoint
from `D`. This proves both directions of `(*)`.

For `U={u}`, this is the private-triple requirement. For a clique `U`,
only singletons `J` contribute: the union of the private-triple families
has hitting number at least `|U|`. For an edge pair, in particular, no
core vertex can belong to every triple missed by either endpoint.
These simultaneous requirements are stronger than merely displaying one
private triple for each panel vertex. No disjointness of private triples
is assumed or inferred.

<a id="claim-a69-low-degree-panel"></a>
## 7. A second complete decomposition with a small triangle-free panel

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-low-degree-panel`  
Kind: local-deduction  
Review state: ready  
Scope: every pure `A`; choose any minimum-degree vertex `u`  
Dependencies: degree sum; `K4/I5` avoidance; Claim 6  
Conclusion: every graph is generated by the following critical-core template;
for `tau_4=8` at least six such minimum-core arrangements coexist  
Search use: none pending independent review  
Reviews: none

Put `s=d_A(u)`, `S=N_A(u)`, and `H=A-({u} union S)`. Then
`1<=s<=7`; in the two-connected remainder `2<=s<=7`. If `tau_4=t`,
also `s>=t-1`. The graph `H` is `(4,4)`-free, since an `I4` in `H`
would extend with `u` to `I5`. The graph on `S` is triangle-free and
`I5`-free. Put `g_S=e(A[S])`, `a_H=e(H)`.

```text
|H|=17-s,
e(S,H)=69-s-g_S-a_H,
|N_H(z)|<=8 for z in S.
```

| Minimum degree `s` | Core order | Core edge range | Exact cut budget |
| --- | --- | --- | --- |
| 1 | 16 | 60 | `8` |
| 2 | 15 | `50..55` | `[12-g_S,17-g_S]` |
| 3 | 14 | `41..50` | `[16-g_S,25-g_S]` |
| 4 | 13 | `33..45` | `[20-g_S,32-g_S]` |
| 5 | 12 | `26..40` | `[24-g_S,38-g_S]` |
| 6 | 11 | `19..36` | `[27-g_S,44-g_S]` |
| 7 | 10 | sufficient `14..31` | `[31-g_S,48-g_S]` |

There are no edges between `u,H`, and `u` is adjacent to all of `S`.
The exact tests of Claim 6 apply with panel `S`; its triangle test is
vacant because `S` is triangle-free. Those tests, the budget, and

```text
d_S(z)+|N_H(z)|+1>=s  (z in S),
d_H(c)+|N_S(c)|>=s    (c in H)
```

are necessary and sufficient to construct a pure graph in the slice
with `u` of minimum degree `s`. The vertex `u` creates no additional
forbidden set: a `K4` using it needs a triangle in `S`, and an `I5`
using it needs an `I4` in `H`.

Thus the complete residual construction uses `(4,4)` cores on 10..15
vertices and triangle-free panels on 2..7 vertices, with a prescribed
cut size. It does not require unrestricted generation of 18-vertex
`(4,5)` graphs. Different choices of `u` can describe the same graph;
this is a coverage theorem, not an isomorphism quotient.

If `tau_4=8`, all degrees are at least seven and their excess above seven
sums to twelve. At least six vertices therefore have degree seven. For
each such vertex, its closed neighborhood is a minimum eight-transversal
and its antineighborhood a maximum `(4,4)` core of order ten. In every
one of these arrangements all seven `S` vertices miss an independent
triple of `H`, hence have at most seven neighbors in `H`, and

```text
8<=a_H-g_S<=20.
```

The last inequality follows by summing the degree-seven floor on `S,H`:
`e(S,H)+2g_S>=42`, and `2a_H+e(S,H)>=70`, then substituting the cut
budget `62-g_S-a_H`. These at least six arrangements must hold
simultaneously on the same `A`; their overlaps cannot be chosen independently.

<a id="claim-a69-ambient-transfer"></a>
## 8. Ambient transfer: paired cores and heavy columns

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-ambient-transfer`  
Kind: local-deduction  
Review state: ready  
Scope: actual order-43 pivot graphs in the ambient setting; the templates above  
Dependencies: global degrees 18..24; actual column transversality; smaller Ramsey bounds  
Conclusion: the paired-core and column restrictions below hold for every extension  
Search use: none pending independent review  
Reviews: none

For the minimum-degree vertex `u` in Claim 7, put
`epsilon=epsilon_u` and `D=N_B(u)`. The row identity gives

```text
0<=epsilon<=min(6,s),
|D|=17-s+epsilon.
```

The graph `G[D]` is also `(4,4)`-free: a `K4` extends with `u` to `K5`,
and an `I4` extends with `v` to `I5`. Thus the entire slice contains
two actual critical cores

```text
H inside A, order 17-s,
D inside B, order 17-s+epsilon,
```

both of order at least ten. The adjacent roots `v,u` have common
neighborhood `S` of order `s`; the vertices adjacent to neither are
`B-D`, of order `7+s-epsilon`. If `epsilon=0`, the two cores have equal
order, but they are not assumed isomorphic. For a cut-family leaf they
have orders 16 and either 16 or 17. No extra root-choice hypothesis is used.

Every vertex `y in B-D` has at least `|H|-8` neighbors in `H` and at
least `|D|-8` neighbors in `D`. For the first statement, an independent
triple in `H-N_H(y)` would extend with the nonadjacent vertices `u,y`
to `I5`; for the second use `v,y` instead. Each unhit remainder is
`K4/I3`-free and has order at most eight.

For the cut family this is a particularly constrained paired-core model:

| Leaf excess | First core | Mirrored core | Common nonneighbors of `v,u` | Mandatory neighbors of each common nonneighbor |
| --- | --- | --- | --- | --- |
| 0 | `C`, order 16 / 60 edges | `D`, order 16 / 60 edges | 8 vertices | at least 8 in each core |
| 1 | `C`, order 16 / 60 edges | `D`, order 17 / 68 edges | 7 vertices | at least 8 in `C` and 9 in `D` |

The common neighbor `z` sees exactly eight vertices of `C` and at most
eight of `D`: its `D`-neighborhood is triangle-free because `u,z`
are adjacent. The unknown completion therefore couples two specified
critical cores, seven or eight vertices with mandatory attachments to
both, and the common neighbor `z`. Neither the cross-core matrix nor
the remaining attachments are suppressed by this reduction.

For any core/panel template `H,T`, consider an actual column `C_y`.
If `u in T` is omitted, then `C_y intersect H` meets every independent
triple in `H-P_u`. Otherwise such a triple with `u,y` gives `I5`.
Consequently

```text
|C_y intersect (H-P_u)|>=max(0,h-|P_u|-8).              (1)
```

Indeed its unhit remainder has no `K4` and no `I3`, so order at most eight.
If the column omits an independent pair `J subset T`, its unhit portion
of `D_J` must be a clique, and hence

```text
|C_y intersect D_J|>=max(0,|D_J|-3).                   (2)
```

If it omits an independent triple `J`, it must contain all of `D_J`.
All these are conditions on actual columns, with repeated columns retained.
Their full independent-set formulation is: for every independent
`J subset T-C_y` of size 1..3, `D_J-C_y` has no independent set of
size `4-|J|`. A column cannot omit an independent four-set of `T`.
Together these are exactly the column's `I4`-transversal requirement;
they do not alone ensure compatibility between different columns.

The core row budget is

```text
sum_(y in B)|C_y intersect H|
  =17h-2a_H-e(T,H)+E_H
  =17h-69-a_H+g+E_H.                                 (3)
```

For Claim 2's leaf, `P_u=empty` and `h=16`. There are
`8-epsilon_u` columns omitting it, where `epsilon_u` is zero or one;
every one contains at least eight core vertices. Thus at least 64 or
56 core incidences, respectively, lie in those columns, and (3) gives
the total core incidence `144+E_C`. This is a heavy-column condition
despite `tau_4<=2`, not a large-transversal scalar bound.

For Claim 4 the total core incidence is `143+g+E_C`, with `g=1` for
the edge family and `g=0` for the nonedge family. If an endpoint has
attachment size `p`, a column omitting it contains at least `8-p`
core vertices. The numbers of such columns are respectively
`8+p-epsilon_u` and `7+p-epsilon_u`. These restrictions can be combined
with the paired cores; no contradiction from these counts alone is asserted.

<a id="claim-a69-exhaustive-split"></a>
## 9. Exhaustive disjoint split and what remains

Claim ID: `research/n43/d18/a69_decomposition.md#claim-a69-exhaustive-split`  
Kind: local-deduction  
Review state: ready  
Scope: every pure `A` in the setting; ambient candidates inherit the same split  
Dependencies: Claims 2 through 7  
Conclusion: the following predicates give a disjoint exhaustive decomposition  
Search use: none pending independent review  
Reviews: none

| Family | Predicate | Complete structural description |
| --- | --- | --- |
| Pendant 17-core | `tau_4=1` | Claim 3; leaf attached to a `(4,4)` 17-core |
| Cut vertex, two-transversal | `kappa(A)=1`, `tau_4=2` | Claim 2 with `C-W` containing `I3` |
| Two-connected, two-transversal | `kappa(A)>=2`, `tau_4=2` | The two exact 16-core attachment families in Claim 4 |
| Two-connected, higher transversal | `kappa(A)>=2`, `tau_4=t`, separately for `t=3..8` | Maximum core of order `18-t`, Claim 6's exact attachment/exchange tests; Claim 7's small triangle-free panel gives an alternative complete construction |

Connectedness excludes `kappa=0`; Claim 3 puts all `tau_4=1` graphs
in the cut family; Claim 2 puts all cut graphs in `tau_4<=2`; Claim 5
excludes `tau_4>=9`. These facts prove exhaustiveness and disjointness
of the predicates. The edge/nonedge refinement in Claim 4 is relative
to a chosen minimum transversal: a graph may admit both kinds of pairs,
so the two parameter families are a cover, not a further disjoint split
of unmarked graphs. The same care applies to the choice of a minimum-degree
vertex or a maximum core. No canonical representative is supplied.

The substantive unresolved object is now the attachment system on critical
cores, including the six simultaneous maximum-core arrangements forced
at `tau_4=8`. No isomorphism census of these systems, no universal ambient
obstruction, and no closure of the 69-edge slice is claimed. Independent
review should precede use of the decomposition in generation or pruning.
