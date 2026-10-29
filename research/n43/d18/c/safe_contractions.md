# Safe contractions in residual connected degree-18 neighborhoods

## Metadata and summary

**Scope:** the reductions studied here target connected `d18/c` with `4<=q<=15`,
`kappa(G[A])>=4`, and `tau_4>=3`, with `a=85-q`. Thus `70<=a<=81` and
`x=136+2q+E_A>=144`. No zero-excess hypothesis. Pure examples satisfy only
these neighborhood predicates; no order-43 extension or selected-root property
is asserted. The branch definitions in section 8 apply to **all** connected
degree-18 instances, without these additional residual restrictions.
Section 9 supplies universal forcing families within this residual scope.
Section 10's minimum-core investigation also considers the broader class of
pure connected `(4,5,18)` graphs; its order-one example is outside the residual
range. **Dependencies:** classical Ramsey bounds, and the recorded `(4,4,12)`
and `(4,4,13)` edge maxima for the density refinements in section 9, from the
[source table](../../../../README.md#state-of-the-art). The homology argument
is proved here over `F_2` and requires no topological classification theorem.
**Kind:** local reductions, universal family theorems, and constructive examples.
**Authors:** Main; force_safe_reductions for complete-history exhaustion and
later constructions; minimum_safe_core for the scientific construction and
homology investigation.
**Review state:** accepted for the local theorems, ten supplied examples,
example-only minimum-order claims, and branch predicates by
review_safe_contractions, on the scoped review below, including sections
9--10's family and minimum-core theorems. **Search use:** scoped mathematical
reduction and exploratory core generation; no parent-catalogue completeness
or executable order-43 pruning claim.
The full [module classification](#module-classification),
[at-most-two residual adjacent-pair bound](#twin-count-sharpening), total
module counts, weighted quotient, and scoped ambient row consequence are also
**accepted** by review_safe_contractions. These are local family restrictions
and exact representations, without a complete parent catalogue.

The working contraction neighborhood is
`(N_A(u) union N_A(w)) minus {u,w}`, as clarified by the user.
All contractions here are inside `G[A]`, preserving `(4,5)`.

Reusable reductions include anticomplete exclusive cells, shielded star forests,
noncritical marked parents, and compatible batches. Two family parameters now
force a contraction before full graph enumeration: edge-containing modules
(necessarily adjacent twin pairs), and a six-bit defect graph around an
independent degree-four neighborhood. Supplied residual examples reach order
11; an irreducible residual example shows that `q,kappa,tau_4` alone do not
force a contraction. Scientifically, one pure connected order-18 graph reaches
order one, whereas positive second homology forces every reachable core to
have at least six vertices.
Residual graphs have at most two adjacent twin modules and at most seven
nontrivial proper modules altogether. Independent modules have order two or
three, obstruct every incident edge initially, and admit exact weighted
quotient compression for family generation.

### Scope audit against existing tools

| Existing development | Why another local reduction is useful here |
| --- | --- |
| [69-edge decomposition](../a69_decomposition.md) and [critical identification](../a69_attachment_obstructions.md) | Here `a=70,71` and `tau_4=3,6`; the two-transversal critical contraction does not apply |
| [Small-separator profiles](../neighborhood_connectivity.md#claim-connected-separator-profiles) | Examples have connectivity five or six, with no separator of order at most three |
| [Thin-frontier exclusions](../README.md) | Here `q=14,15`, implying `x>=164,166`, beyond `x<=142` regardless of excess |
| [Near-regular root tools](../pivot_classes.md#3-a-complete-reduction-when-the-graph-is-near-18-regular) | The examples have `q>=10`, which forces total excess `W>=12` from `q+E_A<=W/2+4`; the `W<=10` reductions do not cover them |
| [Interior bounds](../interior_transfer.md) | Examples pass the degree bounds; these do not generate contracted parents |
| [Recursive completion](recursive_ramsey.md) and [symmetry](recursive_symmetry.md) | They accept a supplied connected neighborhood, rather than generating smaller contraction cores |

This is an audit of located tools, not a claim that these examples evade every
interface constraint. The new reduction concerns neighborhood generation in
the specified residual subbranch.

<a id="exclusive-cells"></a>
## 1. Anticomplete exclusive cells

For an edge `uw`, define

```text
J = N_A(u) intersect N_A(w),
P = N_A(u) minus (N_A(w) union {w}),
Q = N_A(w) minus (N_A(u) union {u}),
W = J union P union Q.
```

`K4`-freeness implies that `J` is independent and both `J union P` and
`J union Q` are triangle-free. Every triangle of `G[A][W]` must therefore
use an edge between the exclusive cells. Precisely,

```text
uw is safe iff N_W(p) intersect N_W(q) is empty
                 for every pq in E_G(P,Q).                         (1)
```

Proof. A triangle not contained in one of those two triangle-free sets has
a vertex of each exclusive cell, and its third vertex is a common neighbor
of the resulting cross edge. Conversely such a common neighbor completes a
triangle. The exact contraction preservation lemma gives (1).

**Reduction 1:** `e_G(P,Q)=0` permits immediate contraction. Neither cell
needs to be small or independent, and both can have multiple vertices.
This is not a dominated-edge or twin-vertex condition.

The retained example has `a=71`, `q=14`, `kappa=6`, `tau_4=3`. Its marked
edge has degrees six and seven and codegree three. Contraction gives a
17-vertex `(4,5)` graph with 67 edges and an independent four-set.

<a id="shielded-stars"></a>
## 2. Shielded star forests

Let `T` be the bipartite graph on `P,Q` consisting of their actual cross edges.
Suppose:

1. Every nontrivial component of `T` is a star.
2. The leaves of each star are independent in their own exclusive cell.
3. Every cross edge `pq` satisfies `N_J(p) intersect N_J(q)=empty`.

**Reduction 2:** these conditions imply that `uw` is safe.

Proof. A mixed triangle with its third vertex in `J` violates condition 3.
One with its third vertex in `P` uses two `P` neighbors of the same `Q`
vertex. In a star forest these are leaves of one star and are independent
by condition 2. The argument with third vertex in `Q` is identical.
Equation (1) applies.

For a matching, condition 2 is automatic: check only that each matching
edge has no common neighbor in `J`. More generally a cross graph is a star
forest exactly when every edge has an endpoint of cross degree one; then
check each leaf set for independence and each edge for shielding by `J`.

Two retained examples have `a=70`, `q=15`, `kappa=5`, `tau_4=3`. Their
marked edges have degrees seven and five and codegree two. One cross graph
is a single edge; the other is two disjoint two-edge stars. Both contract
to the same 67-edge 17-vertex graph. All three single-edge examples have
both exclusive cells of size at least two.

<a id="noncritical-parents"></a>
## 3. Overlapping splits of noncritical 17-vertex parents

**Reduction 3:** every graph in this residual subbranch with a safe edge
is generated from a marked `H in R(4,5,17)` for which `H-z` contains an `I4`.
This excludes the classified critical Paley-17 parents.

Proof of the marked restriction. `H-z` is the original neighborhood minus
the contracted endpoints. If it were `I4`-free, those endpoints would be
an independent-four transversal of size two, contradicting `tau_4>=3`.

Here is the exact inverse construction. Let `C=H-z`, `W=N_H(z)`, and choose
`P,Q subset W` with `P union Q=W`. Replace `z` by adjacent vertices attached
to `P,Q`. The result is `(4,5)`-free exactly when

```text
C[P intersect Q] is independent,
C-P is I4-free,
C-Q is I4-free.                                                    (2)
```

Proof. `C` has no `K4` or `I5`. A `K4` using one replacement needs a triangle
in `P` or `Q`, impossible inside `N_H(z)`. One using both needs an edge in
their common attachment. An `I5` cannot use both adjacent replacements;
one using a single replacement is exactly an `I4` of its missed part of `C`.
These exhaust the cases. Contraction returns the original triangle-free `W`.

With `c=|P intersect Q|` and `m=|W|`,

```text
e(G[A]) = e(H)+1+c,
d_A(u)=|P|+1,  d_A(w)=|Q|+1,
0<=c<=4,       m<=13.
```

For fixed `c`, there are `binom(m,c)*2^(m-c)` unfiltered marked attachments:
choose the common set and assign every other neighbor to one endpoint.
Filter (2), the desired edge slice, connectivity, and `tau_4`. Keep both
endpoints marked or prove the endpoint-swap quotient. For this scope the
safe parent has `65<=e(H)<=79`, using `c<=4` and the recorded order-17 edge cap.

Also `kappa(H)>=kappa(G[A])-1`, so at least three-connected 17-vertex parents
suffice. A cut of size `r` in `H` lifts to at most `r+1` deleted vertices in
the original graph, proving this connectivity bound.

The three single-edge examples share the parent

```text
H = Paley17 minus edge {1,2},  marked vertex z=0,
N_H(0) = {1,2,4,8,9,13,15,16},  e(H)=67.
```

In the square-difference Paley labeling their attachments are:

| Example | `P` | `Q` | Common set |
| --- | --- | --- | --- |
| Anticomplete exclusives | `{1,4,8,9,16}` | `{2,4,9,13,15,16}` | `{4,9,16}` |
| Shielded matching | `{1,4,8,9,13,16}` | `{2,13,15,16}` | `{13,16}` |
| Shielded star forest | `{1,4,8,13,15,16}` | `{2,9,13,16}` | `{13,16}` |

These overlapping attachments give 70/71-edge neighborhoods, outside the old
69-edge disjoint critical splitting. All choices satisfying (2) for this
specific parent form a finite constructive family; no complete collection of
other 17-vertex parents is supplied here.

<a id="double-contractions"></a>
## 4. Compatible double contractions and induced-matching batches

Let `e={u,w}` and `f={r,s}` be disjoint individually safe edges. Define

```text
D = V(G[A]) minus (e union f),
W_e = (N_A(u) union N_A(w)) intersect D,
W_f = (N_A(r) union N_A(s)) intersect D,
C_ef = W_e intersect W_f.
```

**Reduction 4:** both edges can be contracted in either order exactly when

```text
there is no edge between e and f,
or G[A][C_ef] is independent.                                     (3)
```

Proof. Individual safety excludes a `K4` in the double quotient using at
most one merged vertex: such a clique already occurs in the corresponding
single quotient. A `K4` using both merged vertices exists exactly when they
are adjacent and an edge in their common neighborhood supplies its other
two vertices. Contraction cannot create `I5`. Thus (3) characterizes the safe
final quotient. Since either first step is individually safe, the preservation
lemma makes the second step safe too.

The retained example has `a=71`, `q=14`, `kappa=5`, `tau_4=6` and edges
`{5,12}`, `{10,14}`, each of codegree three. The pairs are adjacent, but their
common external union is independent. Both contractions succeed, giving a
16-vertex `(4,5)` graph with 63 edges and an independent four-set. This is
not a `(4,4)` 16-core supplied by the 60-edge critical-core census.

A second, denser example has `a=75`, `q=10`, `kappa=6`, `tau_4=5`.
Its edges `{3,11}`, `{8,15}` have codegrees three and four. They are again
compatible despite cross adjacency, yielding a 16-vertex `(4,5)` graph with
66 edges. Its cross-count floor is `x>=156`, and the root budget forces
total excess at least 12, outside the near-regular `W<=10` tool scope.

For correct edge accounting, let `b_ef` count edges between the endpoint
pairs; let `h` count endpoints of `f` seeing both of `e`, and `h'` endpoints
of `e` seeing both of `f`; let `r_ef=1[b_ef>0]`. The total edge loss is

```text
2+c_e+c_f-h-h'+b_ef-r_ef.                                        (4)
```

Proof. Outside the four endpoints, the contractions lose `c_e-h` and
`c_f-h'` duplicate edges. They delete the two contracted edges and replace
the `b_ef` cross edges by one edge if any existed. This proves (4).
In the example `h=h'=1,b_ef=3,r_ef=1`, giving loss eight.

For an induced matching of individually safe edges, every contraction
commutes and remains safe. No `K4` can use two merged vertices, which are
nonadjacent; a clique using only one was excluded by individual safety.
Each contraction neighborhood is unaffected by the others. A size-`k`
induced matching therefore gives order `18-k` and edge count
`a-k-sum c_e`. Selecting one endpoint from each edge is independent, so
`k<=4`. This allows reductions to 16, 15 or 14 vertices when such certified
matchings occur; only the adjacent-pair reduction to 16 is exhibited here.

For three or more adjacent pairs, pairwise compatibility alone is not a
certificate: a new `K4` can use three or four merged vertices. Validate
a sequential history or use the induced-matching condition.

<a id="integration"></a>
## 5. Use in d18c

For a supplied residual neighborhood, scan edges with (1), retaining the
anticomplete and shielded-star certificates. Then scan disjoint safe pairs
with (3). Prefer the largest certified reduction found, keeping its marked
history. This heuristic does not assert a unique normal form; neighborhoods
without safe edges remain in complete coverage.

For neighborhood generation, enumerate marked 17-vertex parents, or 16-vertex
parents for double contractions, reconstruct all legal splits, and feed the
reconstructed 18-vertex graph to the existing completion initializer. The
unrestricted internal edge-variable counts are `153`, `136`, and `120` at
orders 18, 17, and 16. Attachment states still have to be retained, and any
parent catalogue needs its own completeness argument.

For actual interface search keep endpoint rows separately. A merged row
records only their union; each neighbor has left/right/both choices. Check
the original endpoint degrees, independent-four obligations, columns, and
maximum-density root selection after lifting to 18 vertices. Local `(4,5)`
safety does not imply ambient `(5,5)` safety. The prototype supplies core and
lift operations, not an altered order-43 solver that discards these rows.

<a id="verification"></a>
## 6. Validation and evidence limits

The [prototype](safe_contractions.py) implements the mixed-triangle certificate,
pair compatibility, labeled contraction, and inverse split. The
[examples](safe_contraction_examples.json) retain canonical edge lists and
expected local invariants. Run

```sh
python research/n43/d18/c/verify_safe_contractions.py
```

The [driver](verify_safe_contractions.py) enumerates all `K4` and `I5` subsets,
all separators below the reported connectivity, and transversals until the
exact `tau_4` is reached. It verifies the contractions, quotient sizes and
edge counts, and exact inverse reconstruction. Exhausting all labeled `(4,5)`
graphs through order five checks 4,809 edges and 3,015 individually safe
disjoint pairs against direct quotient semantics. All checks pass.

Discovery used ternary splits of `Paley17-{1,2}` for the first three examples
and small fixed-seed Ramsey-preserving edge walks for the last two. Retained
edge lists make validation independent of discovery. These are pure examples
and author self-checks, not order-43 constructions or independent review.

<a id="further-reach"></a>
## 7. Further reach, and a genuine contraction barrier

The first five examples were not a coverage analysis. A subsequent bounded
exploration found deeper sequential reductions and contraction-irreducible
examples within the same residual scope. The complete added edge lists and
histories are in the existing example artifact, and the same validation driver
checks every intermediate Ramsey graph and exact inverse reconstruction.

### Sequential contractions unlock initially unsafe edges

A graph with `a=71`, `q=14`, `kappa=6`, and `tau_4=6` admits the sequence

```text
{4,10}, {7,13}, {3,9}, {8,11}.
```

The successive orders are `18,17,16,15,14` and edge counts
`71,66,61,58,55`. All intermediate graphs are `(4,5)`-free; the final
14-vertex graph still contains an independent four-set. Initially only
`{4,10},{7,13},{8,11}` are safe. Edge `{3,9}` is unsafe, with the triangle
`{7,13,14}` in its external neighborhood union. Contracting `{7,13}` removes
that triangle, and the edge subsequently becomes safe.

Thus checking only the initially safe edges misses successful histories.
Recompute safety after each step. The parent search can reach order 14 even
when no initially safe induced matching of size four exists. Its unrestricted
internal adjacency has 91 variables, compared with 153 at order 18; all lift
data still need to be retained.

A second added example, with `a=73`, `q=12`, `kappa=6`, `tau_4=5`, has
three safe sequential contractions to an order-15, 59-edge parent. Its third
edge `{0,16}` is also absent from the original safe-edge list.

### Small exploratory coverage measurement

The [exploration driver](explore_safe_contractions.py) runs a fixed-seed
Ramsey-preserving edge walk, retains distinct labeled states satisfying the
residual predicates, and exhausts legal contraction choices to depth four.
The [measurement](safe_contraction_coverage.json) records 200 states:

| Observation | Number of states |
| --- | --- |
| At least one safe edge | 79 |
| An initially compatible disjoint pair | 18 |
| A safe history of at least three contractions | 5 |
| No safe edge | 121 |

This is one correlated walk, with most states at `q=10..15`; it is not a
uniform sample, an isomorphism census, or an estimate of the proportion of
actual order-43 neighborhoods. It demonstrates additional reachable cases
and a barrier, without supplying a global coverage percentage.

One retained irreducible example has `a=71`, `q=14`, `kappa=6`, `tau_4=6`:
every edge is unsafe. These are the same numerical and connectivity parameters
as the order-14 reduction above. Hence those coarse parameters alone cannot
force a contraction; finer local structure matters.

### An exact description of the rigid alternative

An unsafe edge in a `K4`-free graph has a triangle `T` in its external union.
On its two endpoints and `T`, each endpoint sees at most two triangle vertices
(otherwise there was already a `K4`), their attachments cover `T`, and they
share at most one triangle vertex (two common triangle vertices with the edge
would make a `K4`). The attachment-size patterns are therefore exactly

```text
(1,2), disjoint; or (2,2), with one common vertex.
```

Consequently the induced five-vertex witness is exactly either the complement
of `P3 disjoint union K2`, or `K5` minus two disjoint edges, with the candidate
edge in the specified endpoint role. Conversely either marked pattern certifies
an unsafe contraction. This is a proved finite local characterization, not an
exclusion of graphs containing these patterns.

A complete contraction approach can therefore split into reducible graphs,
generated from smaller marked parents, and rigid graphs in which **every edge**
has one of these five-vertex witnesses. Studying compatibility of many such
marked witnesses is a concrete next route for the rigid subbranch. There is no
proof yet that this route makes that subbranch small or excludes it.

<a id="branch-organization"></a>
## 8. Irreducible branch and reduced-order families

Fix an original instance `(G,v)` of connected `d18/c`, including the inherited
maximum-density root selector. Put `A_0=G[N_G(v)]`. A legal history is

```text
A_0, A_1, ..., A_k,
A_(j+1) = A_j / e_j,
e_j in E(A_j),
A_j[(N(u_j) union N(w_j)) minus {u_j,w_j}] triangle-free.
```

Every step is checked in the current graph and produces a `(4,5)`-free graph.
Preserve the original-vertex bags, endpoint attachments, and enough lift data
to restore all original rows and selected-root constraints.

**Irreducible branch `d18ci`.** Its predicate is that every edge of the original
`A_0` has an external triangle, equivalently a marked five-vertex obstruction
as proved in section 7. It includes all connected original neighborhoods
meeting that condition, not only the narrower residual scope. See the
[branch definition and instance](d18ci/README.md). Irreducibility concerns
edge contractions inside `A_0`, not vertex deletion or ambient contractions.
Terminal smaller cores are recorded in the shared supporting evidence, with
terminality recorded separately; they are not original 18-vertex instances
of `d18ci`.

**Reduced-order family convention `d18crnXX`.** Retain such a folder only
when it indexes a useful proved family reduction to order `XX`; an example
history or a history prefix alone does not justify a folder. A reduction's
objects carry a certified legal history of length `18-XX`. The number is an
attained order, not an assumed minimum over all histories. Histories can
contract already merged vertices. Families can overlap after projecting
away the history: one original neighborhood can admit several reductions.
Individual minimum-order claims require a lower bound matching the attained
order, or complete-history exhaustion. Reaching order one supplies that lower
bound immediately.

There is an exact disjoint split of original instances into `d18ci` and those
with at least one safe edge. Every original in the latter class has a legal
order-17 history. This proves predicate coverage; it does not prove that the
retained family generators or any unprovided parent catalogue exhaust that
class.

The retained family folders are:

| Folder | Proved family reductions |
| --- | --- |
| [d18crn17](d18crn17/README.md) | Adjacent twin modules, independent degree-four anchors with an isolated defect vertex, and exact marked-parent inverse splitting |
| [d18crn16](d18crn16/README.md) | Compatible disjoint safe-edge pairs, including the two-adjacent-twin-pair family |

The folders for orders 01 through 15 were removed because their contents
were individual constructions or history prefixes. This is a retention
decision, not a nonexistence or branch-closure claim. Concrete graphs remain
supporting evidence in [safe_contraction_evidence.json](safe_contraction_evidence.json),
with the original irreducible graph retained in `d18ci/instances.json`.
The shared [example manifest](safe_contraction_examples.json) resolves both
sources. No prefix files or example-indexed reduced branches are retained.

### Reviewed individual evidence at orders 12 and 11

The reduction subagent found two further examples in the residual scope.
Both original graphs have connectivity six and `tau_4=5`:

| Original `a,q` | Successive reduced orders | Successive edge counts | Final order |
| --- | --- | --- | --- |
| `70,15` | `17,16,15,14,13,12` | `66,61,57,53,48,44` | 12 |
| `71,14` | `17,16,15,14,13,12,11` | `66,61,57,53,48,43,39` | 11 |

The shared [supporting artifact](safe_contraction_evidence.json), under names
`sequential_6_to12` and `sequential_7_to11`, retains all original edges,
current-label histories, endpoint attachments and original-vertex bags.
Earlier steps are recorded within each history, without separate folders.
The order-11 sequence is

```text
{2,6}, {1,12}, {5,19}, {8,13}, {10,14}, {11,16}, {7,23},
with new merged labels 18,19,20,21,22,23,24.
```

Only `{2,6}` and `{8,13}` are initially safe. Two size-three final bags,
`{1,5,12}` and `{7,11,16}`, arise by contracting edges incident to previously
merged vertices. Thus safe sequential reductions can proceed well beyond an
initial matching. The final graph has 11 vertices and 39 edges, remains
`(4,5)`-free, and contains an independent four-set.

The [separate direct replay](verify_deeper_reductions.py) checks both
original graphs, every intermediate Ramsey condition, direct edge-map
quotients, edge-loss identities, inverse reconstruction and complete-history
exhaustion. The shared [exhaustion evidence](safe_history_exhaustion.json) gives minimum
reachable orders 12 and 11 for these two supplied graphs, with respectively
62 and 131 distinct labeled adjacency states. This concerns graph-only
contractions; it is not an exhaustion of lifted interface states or a census
of either reduced-order branch.

<a id="family-forcing"></a>
## 9. Forcing reductions for entire families

These are universal implications on local graphs, rather than contraction
histories for selected examples. Their hypotheses can be imposed in a family
generator before all 153 internal adjacency variables are assigned. Nonempty
local families need not have an order-43 extension.

<a id="module-forcing"></a>
### Edge-containing modules and the twin-count parameter

A proper module `M` is a nonempty proper vertex set such that each outside
vertex is complete or anticomplete to `M`.

**Theorem.** In a connected `(4,5,18)` graph `A`, every proper module
containing an edge is exactly an adjacent twin pair. Its edge is safe.
Distinct such pairs are disjoint and pairwise anticomplete. Consequently,
the family with at least `r` such pairs has `r` commuting safe contractions,
attaining order `18-r`.

Proof. Let `C` be the outside vertices complete to `M`, and `D` the outside
vertices anticomplete to it. Connectedness gives `C` nonempty. An edge in
`M` makes `C` independent, since any edge of `C` would complete a `K4`.
Thus `|C|<=4`. A vertex of `C` makes `M` triangle-free. Put `k=alpha(M)`.
Since `M` is anticomplete to `D`, `alpha(D)<=4-k`. The classical bounds
`R(3,3)=6`, `R(3,4)=9`, `R(3,5)=14`, and `R(4,3)=9` give:

| `k` | Upper bound on `|M|` | Upper bound on `|D|` | Upper bound on `|A|` |
| --- | --- | --- | --- |
| 2 | 5 | 8 | 17 |
| 3 | 8 | 3 | 15 |
| 4 | 13 | 0 | 17 |

Each contradicts order 18. Hence `k=1`; the triangle-free complete graph
`M` containing an edge is `K2`. Its common external neighborhood `C` is
independent, so contraction is safe. Two adjacent twin pairs sharing a
vertex would give an edge-containing three-vertex module, which was just
excluded. Adjacency between disjoint pairs would be complete between them
by the module property, giving `K4`. The pairs therefore form an induced
matching, and section 4 proves the commuting contraction conclusion.

In the residual scope `kappa(A)>=4`, the common neighbor set of every pair
is a separator and has **exactly four vertices**. Indeed `|C|<=4`, and
`D` has at least 12 vertices. Each twin has degree five and each contraction
loses exactly five edges. Selecting one vertex of each pair gives an
independent set, so `r<=4` even before the density refinement below.

There are useful parameter restrictions, using the recorded edge caps:

* One pair forces `a<=81`, hence `q>=4`. Its anticomplete remainder `D`
  has order 12 and is `(4,4)`-free, so `e(D)<=40`. Each of the four `C`
  attachment rows in `D` is triangle-free and `I4`-free, hence has size at
  most eight. Thus `a<=1+8+32+40=81`.
* Three pairs force `a<=75`, hence `q>=10`. The edges incident to all pair
  endpoints total `9r`; their remaining order-`18-2r` graph is `K4`-free.
  For `r=3`, Turan's bound is `a<=27+48=75`.
* Four pairs would force `a<=36+33=69`, so are impossible when `a>=70`.

For residual generation this gives a branch by the structural integer
parameter `r`: the reducible part with `r>=1` is generated from smaller
parents; the original irreducible branch necessarily has `r=0`. This does
not force a contraction when `r=0`. The existing
[global primeness theorem](../../symmetry_structure.md#claim-symmetry-structure-03)
does not already remove this family: it explicitly does not assert that
the local order-18 neighborhood is prime.

<a id="twin-overlap"></a>
**The common-neighborhood overlap parameter.** A further computer-assisted
family theorem rules out two twin pairs whose independent common four-sets
meet in exactly two vertices: every such `(4,5,18)` graph has `a<=69`.
Consequently, in the residual branch the common four-sets of **any two
twin pairs must intersect in exactly one vertex**.

Proof of the overlap-two bound. Write the common sets as `X union Y` and
`X union Z`, where `X,Y,Z` each have order two. The pairs themselves are
anticomplete. Their six common-neighborhood vertices form `S`; only the
four possible edges between `Y` and `Z` can occur inside `S`. The remaining
eight vertices `D` are anticomplete to both pairs. Choosing one endpoint
of each pair shows that `D` is `I3`-free, and it is already `K4`-free.

Put `F=complement(D)`, a triangle-free, `I4`-free order-eight graph. Its
degrees are at most three because neighborhoods are independent. They
are at least two: a vertex of degree at most one has at least six
nonneighbors, which contain an `I3` by `R(3,3)=6`, giving an `I4` with
that vertex. The exact small census below excludes eight and nine edges
in `F`, so `e(D)<=18`. Each `S` attachment row in `D` is triangle-free
and `I3`-free, hence has at most five vertices. Thus

```text
a <= 18 (pair-incident edges) + 18 (D) + 30 (S,D) + 4 (Y,Z) = 70.
```

Equality requires `e(D)=18`, all six rows to have size five, and all four
`Y,Z` edges. The row graphs are then `C5`, the unique triangle-free,
`I3`-free order-five graph. At `e(F)=10`, its degree multiset is four
threes and four twos. Exact enumeration finds 72 graphs for this fixed
degree assignment, all isomorphic to one representative, so only one
`D` needs examination. It has exactly four `C5` five-subsets, denoted
`P_0,...,P_3` in the [proof data](two_twin_overlap_evidence.json).

Two rows across `Y,Z` must intersect in an independent set by
`K4`-freeness. Their size-five subsets of order-eight `D` intersect in
at least two vertices; `alpha(D)<=2` therefore makes this intersection
exactly two. Two rows within `Y` must have a clique as their common
missed remainder: otherwise its independent pair, both `Y` vertices,
and one endpoint of the opposite twin pair form `I5`. The same holds
within `Z`. For the four possible rows, both compatibility relations
are the same loopless four-cycle, with edges `01,02,13,23`. The four
chosen `Y,Z` rows would therefore have to be pairwise compatible, giving
`K4` in that four-cycle. This is impossible. Equality cannot occur,
and hence `a<=69`.

The [standard-library checker](two_twin_overlap.py) exhausts every labeled
graph of the required degree sequences, branching on both decisions for
every edge with exact-degree and triangle pruning. The eight- and nine-edge
cases have zero valid graphs; the ten-edge case has 72, all degree-preserving
isomorphic to the representative. It derives both four-row relations and
also checks all 256 row tuples. Run

```sh
python research/n43/d18/c/two_twin_overlap.py
```

For the stated residual corollary, intersection size `h>=3` leaves
`|D|=6+h>=9` vertices anticomplete to both pairs, impossible for a
`(4,3)`-free graph by `R(4,3)=9`. Intersection zero is also impossible:
one endpoint of the first pair together with all four common neighbors
of the second pair gives `I5`. The overlap-two bound leaves exactly one.
This is a necessary family-generation restriction; existence for every
twin count satisfying it is not established.

<a id="twin-count-sharpening"></a>
**At most two residual adjacent twin modules.** The accepted overlap restriction
sharpens the earlier `r<=3` density bound to **`r<=2`** throughout the residual
scope. This is an upper bound, not a claim that two pairs are attained.

Proof. Suppose there are three pairs with common independent four-sets
`C_1,C_2,C_3`. Each pair of sets meets in exactly one vertex. If their triple
intersection is nonempty, the three vertices of
`C_3 minus (C_1 union C_2)` together with one endpoint of each of the first
two pairs form `I5`. Thus the triple intersection is empty. Their union `S`
then has order nine, and the three remaining vertices `D` are anticomplete
to all three pairs. Choosing one endpoint of each pair forces `D` to be a
clique, so `D=K3`. Each `C_i` contributes six nonedges within `S`; these
18 nonedges are distinct because pairwise intersections have order one.
Consequently `e(S)<=36-18=18`. Every vertex of `S` has at most two neighbors
in `D`, since three would complete its triangle to `K4`. All edges incident
with the six pair endpoints number `3*(1+2*4)=27`. Hence

```text
a = 27 + e(S) + e(S,D) + e(D) <= 27 + 18 + 18 + 3 = 66,
```

contrary to residual `a>=70`. Any larger collection contains a forbidden
three-pair subcollection. The family parameter therefore has only values
`r=0,1,2`; `r=1` forces order 17, and `r=2` forces order 16, without deciding
whether either quotient admits additional reductions.

<a id="module-classification"></a>
### Independent modules, total counts, and the limit of the reduction

The edge-containing theorem also lets us classify **all** nontrivial proper
modules in a connected `(4,5,18)` graph. They are adjacent twin pairs,
independent twin pairs, or independent twin triples. Independent twins have
equal open neighborhoods; adjacent twins have equal closed neighborhoods.
This distinction matters: an independent module supplies no edge to contract.

For an independent module `M` of order `m>=2`, put `C=N_A(M)` and let `D`
be its anticomplete outside remainder. Every vertex of `M` sees all of `C`,
so `C` is triangle-free and `I5`-free, with `|C|<=13` by `R(3,5)=14`.
Also `alpha(D)<=4-m`. The possibilities are:

| Module | Common neighborhood `C` | Anticomplete remainder `D` | Consequence |
| --- | --- | --- | --- |
| Independent pair | Triangle-free, `8<=|C|<=13` | `(4,3)`-free, `|D|<=8` | Possible type; no safe incident edge |
| Independent triple | Triangle-free, `12<=|C|<=13` | Clique of order two or three | Possible type; no safe incident edge |
| Independent four-set | `|C|<=13` | Empty | At most 17 total vertices; impossible here |

Here the lower bounds follow from `18=m+|C|+|D|`. An independent module
cannot have larger order because `A` is `I5`-free. Together with the
edge-containing theorem, this exhausts all nontrivial proper modules.

**Independent modules have only obstructed incident edges initially.** For
`u in M` and `x in C`, choose `u' in M minus {u}`. The external neighborhood
union for `ux` contains `u'` and all of `C minus {x}`. The latter set has at
least seven vertices, so it contains an edge `yz`, since `alpha(A)<=4`.
The triangle `u'yz` makes `ux` unsafe. This gives a marked five-vertex
obstruction on `{u,x,u',y,z}` for every incident edge. Later contractions
elsewhere can change this obstruction, so this is an initial-state statement.

**Counting independent modules.** Maximal independent twin classes are
disjoint. If all nontrivial such classes have size two, choosing one
representative of each gives a `(4,3)`-free graph: `K4` is inherited, and an
independent triple of classes would give `I6` in `A`. Thus there are at most
eight classes, by `R(4,3)=9`.
In fact there are at most **seven**. Eight classes would occupy 16 vertices.
Choose an outside vertex `x` and one representative from each class. This
nine-vertex graph is also `(4,3)`-free: any independent triple avoiding `x`
expands to `I6`; one using `x` expands to `I5`, because its two twin classes
are anticomplete to each other and to `x`. This contradicts `R(4,3)=9`.

If a class `M` has size three, it is the **only** nontrivial independent
twin class. Indeed any other such class `T` must be complete to `M`, since
otherwise three vertices of `M` and two of `T` give `I5`. Hence `T` would
be an independent module in the triangle-free, `I5`-free graph `A[C]` of
order at least 12. But a triangle-free, `I5`-free graph with an independent
module of size `k>=2` has at most 11 vertices: its common neighborhood is
independent of order at most four, and its anticomplete remainder has
independence number at most `4-k`. For `k=2,3,4` the total bounds are
`2+4+5=11`, `3+4+2=9`, and `4+4=8`, respectively, using `R(3,3)=6` in the
first case. This contradicts `|C|>=12`.

A triple has four nontrivial module subsets: its three pairs and the triple
itself. With no triple, each nontrivial independent class contributes just
one pair. Thus there are at most seven nontrivial independent modules, or
exactly four if an independent triple occurs. All edge-containing modules
are disjoint from these classes: sharing a vertex would make the two other
vertices have incompatible adjacencies to that vertex's module mate.
Consequently there are at most **nine nontrivial proper modules in total**:
without a triple they are disjoint pairs on 18 vertices; with a triple the
four independent subsets plus at most four adjacent twin pairs give at
most eight.

There is a useful joint bound when an adjacent twin pair exists: at most
**five** maximal independent pair classes can occur. Its independent common
neighborhood `C`, of order at most four, contains at most two pair classes.
All other pair classes lie in the anticomplete remainder `D`. Any two of
these must be adjacent, since otherwise they and one adjacent-twin endpoint
give `I5`. Their representatives form a clique, so there are at most three.
Thus in the residual scope there are at most **seven nontrivial proper
modules altogether**: with no independent triple, `r=0` gives at most seven
independent pairs, and `r>=1` gives at most `r+5<=7` pair modules. With an
independent triple there are at most `4+r<=6` module subsets. These are
upper bounds; extremal attainability has not been shown.

Identifying two nonadjacent twins does preserve local `(4,5)`-freeness:
the resulting simple graph is isomorphic to deleting one twin, so it is a
minor obtainable by vertex deletion, rather than an edge contraction.
Reconstructing the original requires remembering the independent multiplicity
and separate ambient attachment rows. Thus only the **edge-containing**
modules provide the safe
edge reductions used for `d18crnXX`. Every original `d18ci` graph has no
adjacent twin pair, but it can still have independent modules or fail to be
prime. Conversely, absence of modules does not imply edge irreducibility.

**Exact weighted family compression.** Collapse every maximal adjacent or
independent twin class to a quotient vertex `i`, retaining its order `m_i`,
clique weight `w_i`, and independence weight `b_i`. Singletons have weights
`(w_i,b_i)=(1,1)`, adjacent pairs `(2,1)`, and independent classes of order
`m_i` have `(1,m_i)`. The module property makes adjacency between distinct
classes complete or empty. Consequently

```text
omega(A) = max over cliques K of Q of sum_(i in K) w_i,
alpha(A) = max over independent sets I of Q of sum_(i in I) b_i.
```

For either formula, projecting a clique or independent set in `A` gives the
corresponding set in `Q` and the stated upper bound. Conversely, choose a
maximum clique or independent set inside each selected class; uniform
between-class adjacency combines them to attain the weight sum. Thus the
original local Ramsey constraints are exactly clique weight at most three,
independent-set weight at most four, and total order `sum m_i=18`. This is a
family representation that also compresses independent modules. Forgetting
their multiplicities would lose the original independent-set constraints.
Only adjacent-pair collapses count as the safe edge contractions in the
attained-order folders. Ambient extension still requires the original rows.
Indeed the accepted
[pair-separation theorem](../../symmetry_structure.md#claim-symmetry-structure-01)
forces any two vertices of a local twin module to have `B` attachment rows
whose symmetric difference has order at least eight: no vertex of `A`
outside that pair, nor the root, distinguishes them. This is a necessary
ambient condition, not an obstruction to the pure local family.

The 13 registered originals contain one adjacent-twin witness and no
independent twin pair (direct comparison of all open and closed neighborhood
rows). The other 12 have no nontrivial module by the classification above,
and include both reducible and irreducible graphs. The independent-module
types and the upper bound of two adjacent pairs have not been witnessed by
this registry.

### An exact four-row adjacent-twin family generator

Fix an independent set `C` of order four and a `(4,4,12)` graph `D`.
Add an adjacent pair complete to `C` and
anticomplete to `D`. Choose four attachment sets `P_c subset D`, one for
each `c in C`. The resulting order-18 graph is `(4,5)`-free exactly when:

1. Every `D[P_c]` is triangle-free.
2. For every pair `U subset C`, `D - union_(c in U) P_c` is `I3`-free.
3. For every triple `U subset C`, that missed remainder is `I2`-free.
4. The four rows cover `D`.

Proof. A `K4` using a vertex of `C` is precisely a triangle in its row;
`C` is independent, so no clique uses two of its vertices. The added pair
has independent common neighbors and sees no `D`. An `I5` containing one
twin would require an `I4` in `D`, already forbidden. For an `I5` avoiding
the twins, taking `j` vertices of `C` requires an independent `5-j` set
in their common missed remainder in `D`. For `j=0,1` the `(4,4)` premise
on `D` suffices; `j=2,3,4` give exactly conditions 2--4.

Filter this exact family by connectivity, `tau_4`, the desired edge slice,
and all ambient lift constraints. Every passing member has the safe twin
contraction. The unconstrained internal variables are 66 within `D` plus
48 across `C,D`, totaling 114 instead of 153; a complete known `D` census
can eliminate the first 66 choices. The 114 count precedes all filtering
and says nothing about the number of surviving interface states.

<a id="degree-four-defect"></a>
### Six defects around an independent degree-four neighborhood

Suppose `v` has independent neighborhood `S=N_A(v)` of order four. On `S`
define a defect graph `D_v` by

```text
xy in E(D_v) iff A[(N_A(x) intersect N_A(y)) minus {v}]
                    contains an edge.
```

**Theorem.** The spoke `vx` is safe exactly when `x` is isolated in `D_v`.
Thus the entire family with `e(D_v)<=1` has at least two initially safe
spokes and admits a contraction to order 17. More generally, the number
of initially safe spokes is exactly the number of isolated defect vertices.

Proof. `N_A(x) minus {v}` is triangle-free by `K4`-freeness. The external
union for `vx` is `(S minus {x}) union (N_A(x) minus {v})`. Any triangle
there must therefore use a vertex `y in S minus {x}` and an edge `pq`
inside `N_A(x) minus {v}`. Since `S` is independent, `p,q` are outside
`S union {v}`. Such a triangle exists exactly when `p,q` are adjacent common
neighbors of `x,y`, precisely the defect `xy`. This proves the equivalence.
At most one defect edge leaves at least two isolated vertices.

This is a condition on six pair cells, usable in an independent-four-anchor
generator before enumerating complete neighborhoods. In the irreducible
alternative every such defect graph must have no isolated vertex. Two safe
spokes are **two initial choices**, not a guarantee of two consecutive
contractions: they share `v`, and safety must be recomputed after a step.
As another parameter restriction, the outside order-13 graph is `(4,4)`-free
because it is anticomplete to `v`. It has at most 45 edges, and the four
attachment rows have size at most eight. Hence this family also has
`a<=45+32+4=81`, or `q>=4`.

For the **forced safe-spoke subfamily** this sharpens to `a<=80`, or `q>=5`:
an independent `S` makes every spoke's codegree zero, so a safe contraction
has `a-1` edges. The recorded order-17 parent cap is 79. In particular,
an `a=81` graph with this independent degree-four anchor must have a defect
graph with no isolated vertex. The general anchor family still has the
row-count bound 81.

**Nonvacuity in the residual branch.** The
[supporting witnesses](safe_contraction_evidence.json) include one member
of each family, both with `a=70,q=15,kappa=4,tau_4=5`. The twin witness
has twins `{0,17}` with common neighborhood `{1,2,3,4}` and contracts to
17 vertices and 65 edges. The defect witness has center 0, independent
neighbors `{1,2,3,4}`, and just the defect `{1,2}`. Its two safe spokes
are `{0,3}` and `{0,4}`; the recorded first choice gives 17 vertices and
69 edges. These witnesses establish local nonemptiness; the proofs give
the universal guarantees. They do not establish an ambient extension or
the feasibility of every possible twin count.

<a id="minimum-core"></a>
## 10. Can a connected neighborhood reduce to one vertex?

**Yes for pure connected `(4,5,18)` graphs.** The
[scientific construction](safe_contraction_evidence.json), named
`scientific_17_contractions_to_one`, has
`a=63,q=22,kappa=5,tau_4=6` and admits 17 consecutive safe contractions
to one vertex. Its successive edge counts, at orders 18 through 1, are

```text
63,58,53,48,44,39,34,29,24,20,16,12,10,7,5,3,1,0.
```

All steps use current labels; inverse attachments and original bags are
retained. Attaining order one already proves its exact minimum, with no
need to exhaust alternative histories. This proves the sharp minimum one
over the broader class of pure connected `(4,5,18)` neighborhoods. It is
outside `4<=q<=15` and does not prove that the residual class, or any actual
order-43 neighborhood, reaches one.

<a id="homology-barrier"></a>
### A family-wide obstruction to reaching a small core

Let `X(A)` be the clique complex of a `K4`-free graph: vertices, edges and
triangles are its simplices, with no simplices of dimension three. Write
`b(A)=dim H_2(X(A);F_2)`. Equivalently, this is the number of triangles minus
the rank over `F_2` of their edge-boundary matrix. It counts independent
collections of triangles in which every edge occurs an even number of times.

**Theorem.** Every safe contraction `A -> H` induces an injection
`H_2(X(A);F_2) -> H_2(X(H);F_2)`. In particular `b(H)>=b(A)`.

Proof. Contraction induces a simplicial map, and its chain map sends a
triangle containing both contracted endpoints `u,v` to zero. Every other
triangle has a distinct nondegenerate image: the only possible duplicate
images would come from `uxy` and `vxy`, which together with `uv` form a
forbidden `K4`. A two-cycle with zero image must consequently use only
triangles `uvw`. The original edge `uw` appears in exactly one of those
triangles, so the cycle condition forces every coefficient to vanish.
Thus the map is injective on two-cycles. There are no three-chains in
either clique complex, so no nonzero two-cycle is a boundary. Safety
ensures that the target is still `K4`-free, proving the homology claim.

For connected order-18 `A` with `a` edges and `t` triangles, Euler's identity
gives

```text
b(A) = t-a+17+beta_1(X(A);F_2) >= t-a+17.
```

Consequently **the entire family `t>=a-16` cannot reduce to one vertex**.
In fact every reachable core has at least six vertices. For a self-contained
proof of this size bound, take the triangles supporting a nonzero two-cycle.
At each support vertex, the incident triangles give a nonzero one-cycle
in its link. The link is triangle-free, so this cycle uses at least four
neighbors. With at most five support vertices, every vertex would therefore
be adjacent to all the others, forcing a forbidden `K4`.

Positive `b` is a sufficient obstruction, not an exact irreducibility test.
A graph may have safe edges while retaining nonzero second homology. Conversely
`b=0` alone does not prove that a safe history to one exists. The first ten
retained original graphs have `b` between 6 and 17, so all their histories
meet this obstruction; the scientific order-one source has 43 triangles,
boundary rank 43, and `b=0`.

### The smallest nontrivial terminal obstruction

Every connected `K4`-free graph on two through five vertices has a safe edge,
and therefore eventually reaches one. At order at most four the external
union has too few vertices for a triangle. At order five any unsafe edge
requires the entire graph to be one of the two marked obstruction types of
section 7, and each of those graphs also has a safe edge: in the disjoint
attachment pattern contract the endpoint having two triangle neighbors to
one of those neighbors;
in `K5` minus two disjoint edges contract the universal vertex to any other
vertex. The corresponding external union is triangle-free in each case.

The octahedron `K_(2,2,2)` on six vertices is irreducible and has `b=1`.
For an edge between two parts, the other vertices include a triangle made
of the other vertex of each endpoint's part and one vertex of the third
part. Hence every edge has the five-vertex obstruction. Thus six is the
smallest **nontrivial connected irreducible** order; the singleton itself
is trivially irreducible. A direct labeled census through order six finds
15 irreducible graphs at order six, exactly the 15 labelings of this
octahedron; that uniqueness is recorded computationally, not used in the
size-bound proof.

The [scientific checker](d18ci/minimum_safe_core.py) uses the standard
library to perform this census, check homology on 155,143 safe contractions,
and replay the order-one source. Run

```sh
python research/n43/d18/c/d18ci/minimum_safe_core.py
```

The [evidence](d18ci/minimum_safe_core_evidence.json) is scientific support,
not a complete order-18 catalogue. It resides under `d18ci` because it studies
terminal obstructions; the reducible original graph is stored in the shared
supporting artifact, without an order-one family folder.

<a id="independent-review"></a>
## Independent review

**Reviewer:** review_safe_contractions, distinct from the authors.
**Accepted coverage:** sections 1--4 local reduction statements, section 7's
two-pattern characterization and original examples/histories, section 8's
irreducible/attained-order branch semantics and new order-12/order-11 examples,
the example-only minimum claims on the stated hypotheses, section 9's universal
module/twin and defect families, and section 10's scientific minimum-core and
homology results.

The reviewer independently enumerated 28,486 labeled `(4,5)` graphs through
order six: 199,044 edge decisions, 220,860 individually safe disjoint-pair
checks, and 17,760 external-triangle witness patterns. Independently built
partition quotients confirmed the exact safety and compatibility equivalences.
All 69,990 ternary splits of marked parents through order five matched the
inverse-split conditions. Separate cut and hitting-set enumerations confirmed
all eight original examples' exact connectivity and `tau_4`, all histories,
and the original irreducible graph's zero safe edges.

The reviewer also verified the migrated original-bag quotients and every
irreducible registry entry: 71 distinct covered edges, with 33 witnesses of
type `K5` minus a two-edge matching and 38 of type complement `P3+K2`.
All intermediate states are preserved inside the supporting histories; the
former folder-level prefix references have been removed.

The reduction agent's [complete-history driver](exhaust_safe_histories.py)
and [results](safe_history_exhaustion.json) explore every currently safe edge
until terminal, merging only identical labeled adjacency states. Order strictly
decreases, so the exploration terminates and covers every reachable labeled
adjacency state, hence certifies the minimum reachable order. It merges
histories with the same graph state rather than enumerating every lift history.
The reviewer separately exhausted original-vertex set partitions, confirming
the original eight examples' minimum reachable orders
`17,17,17,16,16,15,14,18`. Different memoized-state counts in the two methods
are expected because contraction labels can distinguish history orders.

For the two later constructions the reviewer independently rebuilt both
original graphs, found their 47 independent four-sets, and confirmed
connectivity six and `tau_4=5` with separate bitmask cut/hitting-set checks.
Every intermediate quotient and safe step was checked through original-bag
edge existence. A separate exhaustive original-vertex partition search
confirmed minimum orders 12 and 11, respectively using 24 and 23 canonical
partition states. Merged-vertex steps and the resulting size-three bags were
independently confirmed. The original records and bag histories are checked
by the shared validator as well as the scoped independent review.
An independent recursion using the same labeled-adjacency equivalence also
reproduced the recorded counts exactly: 62 states/25 terminals and
131 states/27 terminals. The final manifest resolves ten distinct original
examples from that review; their earlier history steps were independently
replayed as well.

For section 9 the reviewer independently checked the module-size case bounds,
disjoint and anticomplete twin pairs, the `q` restrictions, every obligation of
the exact four-row generator, and the defect/spoke equivalence. The final
safe-spoke refinement `a<=80`, and the `a=81` no-isolated-defect consequence,
were accepted using codegree zero and the recorded order-17 edge cap.
Separate Ramsey,
cut and hitting-set checks confirmed both residual witnesses' parameters and
their quotients. Section 10's chain-map injection, Euler bound and support-size
argument were accepted, including the distinction between positive homology
and edge irreducibility. The reviewer reproduced the connected `K4`-free
census through order six and all 155,143 homology checks. An independent replay
of the scientific source checked all 17 safe steps, every intermediate Ramsey
condition, inverse attachments, original bags, and the initial boundary rank
43. Its sharp minimum one concerns pure local graphs and is outside the
residual `q=4..15` range. The current manifest resolves **13 distinct original
graphs**. Independent review also replayed all 34 former prefix references;
those redundant references have since been removed, while the complete
source histories remain available.

The overlap-two theorem was separately reviewed using an independent
vertex-neighbor-choice census: zero valid complement cores at eight/nine
edges, 72 at ten edges and one isomorphism class, four `C5` rows, and identical
four-cycle compatibility relations. The equality contradiction was accepted.
The additional residual overlap-exactly-one corollary uses the stated `I5`
argument and `R(4,3)=9`. The reviewer accepted the final retained overlap
theorem and corollary, including its permitted structural-family exclusion.

For [the residual twin-count sharpening](#twin-count-sharpening), the reviewer
checked the triple-intersection `I5`, the nine-vertex union and triangle
remainder, and the distinct nonedge count giving `a<=66`; `r<=2` was accepted.
For [the full module classification](#module-classification), the reviewer
checked the independent-module order and common-neighborhood bounds, every
initial incident-edge triangle obstruction, the sole-triple-class argument,
and the eight-class contradiction improving the independent pair count to
seven. The five-class joint bound and residual total module bound of seven
were accepted. The reviewer checked both directions of the weighted quotient
formulas and their local scope, independently compared every neighborhood row
in all 13 originals, and accepted the `B`-row distance consequence using the
existing pair-separation theorem. Acceptance applies to the retained text;
the extremal counts and allowed independent types are not asserted attained,
and separate ambient rows are still required.

**Limits:** acceptance concerns these local results and supplied graphs.
It does not provide a complete order-18 isomorphism census, a complete
reduced-parent catalogue, an actual order-43 extension, exclusion of the full
`d18c` or `d18ci` branch, or a formal Lean certificate. The overlap-two
structural subfamily is excluded at `a>=70` by the accepted finite proof.
The exploratory edge-walk proportions remain nonrepresentative observations.

## Changelog

- Added residual-scope audit, four contraction reductions, overlapping
  noncritical-parent generation, and five pure examples including successful
  adjacent double contractions to order 16 at `q=10,14`. Draft pending review.
- Added verified histories to orders 15 and 14, an explicit irreducible
  neighborhood, bounded exploratory coverage measurements, and an exact
  two-pattern characterization of unsafe edges. Draft pending review.
- Created the all-connected irreducible branch and attained-order reduction
  branches, migrated canonical instances with obstruction and lift data,
  and integrated independent acceptance of the original local results and
  example-only complete-history minima.
- Integrated separately reviewed reductions to orders 12 and 11, including
  merged-vertex contractions, original bags, and every earlier attained-order
  prefix. Independent review confirmed both graph-only minimum-order claims.
- Added accepted universal module/twin-count and six-defect forcing theorems,
  an exact four-row family generator, density restrictions, and two residual
  witnesses establishing local nonvacuity.
- Added an independently checked finite exclusion of the whole two-twin
  overlap-two family at `a>=70`, with an exact small-core census and row
  compatibility obstruction.
- Added the accepted scientific order-18 to order-one construction, all earlier
  attained-order folders, homology monotonicity and a triangle-count family
  barrier. Six is the smallest nontrivial connected irreducible order; the
  dense residual minimum and actual order-43 realizability remain open.
- Classified all proper nontrivial local modules, proved the initial
  incident-edge obstruction for independent twins, and sharpened residual
  adjacent-pair and total-module counts to two and seven. Added exact weighted
  quotient compression and the necessary ambient row distance of eight.
  Independent review accepted the final proofs and registry observations.
- Retained reduced-order folders only for proved families at orders 17 and
  16. Removed example-only folders for orders 01 through 15 and all prefix
  files; consolidated their certificates and exhaustion evidence, and updated
  replay paths without changing the mathematical proofs.
