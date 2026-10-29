# Safe minors of Ramsey graphs

## Metadata and summary

**Scope:** finite simple graphs in `R(s,t,n)`, with `s,t>=2`; local applications
to an order-43 `(5,5)` candidate and its degree-18 neighborhood.
**Kind:** elementary deductions and a transfer analysis of standard minor
theorems. **Author:** Main. **Review state:** draft; no independent review.
**Search use:** exploratory design only, pending the repository review gate.
No branch exclusion or new Ramsey bound is claimed.

The contraction restriction has two distinct readings. The literal condition
in the question uses the open-neighborhood union, including both endpoints.
The exact condition for preserving the forbidden clique bound uses the union
with both endpoints removed. We distinguish them throughout. Neither version
permits unrestricted edge deletion while preserving the Ramsey type.

Every safe minor is an ordinary minor, so minor-monotone parameters and
ordinary excluded-minor conclusions transfer downwards. Theorems guaranteeing
the existence of particular minors do not automatically supply safe models.
The most concrete uses here are codegree filters, smaller-order edge bounds,
and conditional reconstruction from the classified Paley-17 core. The literal
condition blocks that last reconstruction via contractions.

Dependencies: [shared notation](../../docs/notation.md), elementary Ramsey
bounds recorded in the [reduction index](../n43/reductions.md), the
[Paley-17 classification](paley17_uniqueness.md), and the existing
[69-edge two-transversal analysis](../n43/d18/a69_decomposition.md#claim-a69-two-transversal).
Literature references for standard minor results appear below. Their full
proofs are not reproduced; the safety implications and failures are proved here.

<a id="definition"></a>
## 1. Definitions and the exact preservation lemma

Let `G in R(s,t,n)` and `uv in E(G)`. Write

```text
U_uv = N_G(u) union N_G(v),
W_uv = U_uv minus {u,v},
c = c_G(u,v).
```

Since neighborhoods are open, `u,v` both belong to `U_uv`.
The literal rule in the question permits contraction exactly when `G[U_uv]`
is `K_(s-1)`-free. Call this **literal-safe**. Call a contraction
**exact-safe** when `G[W_uv]` is `K_(s-1)`-free. Literal safety implies exact
safety; the converse need not hold. We do not replace the literal definition
silently by the weaker one.

**Preservation lemma.** The simple contraction `H=G/uv` belongs to
`R(s,t,n-1)` if and only if it is exact-safe.

Proof. Let `z` be the contracted vertex. The graph on the other vertices is
unchanged and `N_H(z)=W_uv`. A new `K_s` must contain `z`, and exists precisely
when `G[W_uv]` contains a `K_(s-1)`. An independent set avoiding `z` already
exists in `G`. One containing `z` lifts, with the same cardinality, by replacing
`z` by `u` (or by `v`): its other vertices are adjacent to neither endpoint.
Thus contraction never increases independence number. This proves the lemma.
It preserves the forbidden bounds, not equality of `omega`, `alpha`, or the
least Ramsey parameters of the individual graph.

For `s=3`, the literal test forbids every contraction: `uv` itself is a `K2`
inside `U_uv`. The exact test still allows, for example, contraction of an edge
of `C5`, producing `C4`. For `s=2`, there are no edges to contract in the class.

**Edge deletions need their own test.** If `uv` is deleted, a new `I_t` must
use both endpoints. Hence deletion preserves the type exactly when

```text
G[M_G(u) intersect M_G(v)] is I_(t-2)-free.
```

For `t=2`, the empty independent set witnesses that every edge deletion is
unsafe. Vertex deletion always preserves the type. For example, deleting an
edge from `K2 in R(3,2,2)` creates a forbidden `I2`.

For either reading, define a safe-minor relation using vertex deletions,
contractions permitted by that reading, and, if desired, edge deletions passing
the preceding test. Check every operation in its **current** graph. With only
vertex deletions and contractions it is a restricted induced-minor relation.
These variants should not be conflated when claiming generation coverage.

<a id="transfer"></a>
## 2. What transfers from ordinary graph minors

| Standard fact or theorem | Safe-minor conclusion | Use and limit here |
| --- | --- | --- |
| Reflexivity and transitivity of the minor relation | Yes, by the empty sequence and concatenation of legal sequences | Fix the Ramsey parameters and permitted operations throughout |
| Branch-set model for a minor | Every safe sequence yields an ordinary branch-set model | An ordinary model needs an ordered sequence with safety certificates |
| Minor monotonicity of treewidth, pathwidth, genus, and vertex-cover number | `p(H)<=p(G)` whenever `H` is a safe minor of `G` | A certified safe core supplies lower bounds for the parent |
| Closure of planarity and other ordinary minor-closed classes | Every safe minor of a member remains a member | Ordinary exclusion of a graph also excludes it as a safe minor |
| Wagner's planarity characterization | Absence of ordinary `K5,K3,3` minors still proves planarity | Absence of these **safe** minors does not, in general, prove planarity |
| Robertson-Seymour well-quasi-ordering | Does not follow just by restricting the order | For fixed `s,t` in the Ramsey class, finiteness supplies a trivial substitute |
| Finite forbidden-minor characterization of minor-closed classes | An ordinary forbidden list is still an ordinary test of the parent | Replacing every occurrence of “minor” by “safe minor” needs a new theorem |
| Excluded-grid theorem | An ordinary sufficiently large-treewidth graph has a grid minor | The grid model need not be safe; a grid with `alpha>=t` cannot be a safe minor |
| Fixed-pattern minor testing | Failure to find an ordinary `H` minor rules out a safe `H` minor | Success requires additional safety checks; the ordinary algorithm alone is insufficient |
| Mader-type density theorems forcing complete minors | They still give ordinary complete minors | A `K_h` with `h>=s` is impossible as a type-preserving safe minor |
| Hadwiger's complete-minor assertion | No direct safe analogue with the same clique target | Already `C5` has chromatic number three but cannot have an exact-safe `K3` minor in a `(3,3)` class |

The last row uses Hadwiger only as a named family of assertions; the general
conjecture is not assumed as a proved theorem.

**Why branch sets are insufficient.** Partition `C4` into two adjacent
two-vertex bags. Contracting both produces the `K2` quotient, which is
triangle-free, but either first contraction creates `K3`. Thus a Ramsey-safe
final quotient does not certify that this prescribed contraction model can be
performed safely. `K2` itself is still a safe minor of `C4` by vertex deletions;
the counterexample concerns the specified bags, not nonexistence of all models.

**Failure of a safe Wagner characterization.** Subdivide each edge of `K5`
once, obtaining a triangle-free graph `S` on 15 vertices. Its independence
number is ten: choosing `k` original vertices permits exactly
`binom(5-k,2)` subdivision vertices, so the maximum of
`k+binom(5-k,2)` is ten. Hence `S in R(3,11,15)` and is nonplanar.
It cannot have a safe `K5` minor because safe minors remain triangle-free.
It has no ordinary `K3,3` minor either: each of the six branch sets of a
`K3,3` model needs at least three distinct neighboring bags, whereas a
connected bag containing only subdivision vertices has at most two external
neighbors. Each bag must therefore contain an original vertex, and only five
exist. This proves failure for both safety readings and either deletion variant.
It is not an example in the fixed `(5,5)` class.

**Well-quasi-ordering requires careful scope.** A stronger relation has fewer
comparable pairs, so ordinary-minor well-quasi-ordering does not imply
safe-minor well-quasi-ordering on arbitrary graph families. We assert neither
a general well-quasi-order theorem nor an infinite antichain here. For fixed
`s,t`, all Ramsey graphs have order at most `R(s,t)-1`; there are finitely many
isomorphism types. Every sequence therefore repeats a type, independently of
Robertson-Seymour. Any safe-minor-closed subclass of this finite ambient class
has finitely many minimal excluded elements **relative to that ambient class**.
This does not construct a small obstruction list or prove ordinary
minor-closure. The Ramsey class itself is generally not ordinary minor-closed.

<a id="filters"></a>
## 3. Quantitative filters supplied by one contraction

Both safety readings imply the following necessary inequalities. Passing the
inequalities is not sufficient for safety; the clique test remains necessary.

The merged neighborhood is `(s-1,t)`-free, so

```text
|W_uv| = d_G(u)+d_G(v)-c-2 <= R(s-1,t)-1,
c >= d_G(u)+d_G(v)-R(s-1,t)-1.
```

For `s>=3`, the common neighborhood is `(s-2,t)`-free, since a clique of size
`s-2` there completes with `uv` to `K_s`. Thus

```text
c <= R(s-2,t)-1.
```

The contracted graph has exactly

```text
e(H) = e(G)-1-c,
d_H(z) = d_G(u)+d_G(v)-c-2,
d_H(w) = d_G(w)-1[w in N_G(u) intersect N_G(v)]  (w != z).
```

If `R(s,t,n-1)` is nonempty, its recorded edge extrema therefore imply

```text
e(G)-1-E(s,t,n-1) <= c <= e(G)-1-e(s,t,n-1).
```

An independently proved upper bound can replace `E`, and a lower bound can
replace `e`, in the corresponding inequality. If the smaller-order family is
known empty, every edge is unsafe. Never evaluate an extremum of an empty
family. These inequalities do not imply that a safe edge must exist.

For the literal test, the stronger necessary size bound
`|U_uv|<=R(s-1,t)-1` holds, giving
`c>=d_G(u)+d_G(v)-R(s-1,t)+1`.
This improves the exact-safe codegree floor by two. It also shows why stating
the neighborhood convention matters even for numerical applications.

<a id="applications"></a>
## 4. Applications to the current Ramsey work

### 4.1 Order 43: a high-codegree condition, not an unavoidable contraction

Assume an actual `G in R(5,5,43)`. The recorded degree interval is `18..24`.
Using `R(4,5)=25` and `R(3,5)=14`, exact-safe edges satisfy

```text
d_G(u)+d_G(v)-26 <= c_G(u,v) <= 13.
```

For degree pairs `(18,18)`, `(18,20)`, `(19,20)`, and `(20,20)`, the lower
bounds are respectively `10,12,13,14`. The last pair cannot be exact-safe.
More generally a degree sum at least 40 forbids exact safety.
An edge of codegree at most nine is unsafe throughout this order-43 class.
The existing low-overlap root-family arguments therefore do not automatically
produce contractible edges.

Under the **literal** rule the corresponding interval is

```text
d_G(u)+d_G(v)-24 <= c_G(u,v) <= 13.
```

Only degree sums at most 37 can work: possible degree pairs are `(18,18)` and
`(18,19)`. Their codegrees must be respectively `12..13` and `13`.
If the candidate has minimum degree at least 19, it has no literal-safe
contractions at all. These are conditional deductions; existence of an
order-43 Ramsey graph or of an edge attaining these conditions is not claimed.

### 4.2 Degree-18 side: smaller-order bounds and critical cores

Let `A=N_G(v)`, so `G[A] in R(4,5,18)` and `a=e(G[A])`.
Safety **inside** `G[A]` uses `s=4,t=5`; it is not the ambient `(5,5)` test.
The existing `E(4,5,17)=79` and `R(3,5)=14` give, for an exact-safe edge
inside `G[A]`,

```text
max(a-80, d_A(u)+d_A(w)-15) <= c_A(u,w) <= 4.
```

Consequently `a=85` permits no exact-safe contractions; at `a=84` any such
edge must have codegree exactly four. Under the literal rule replace the
second term of the lower bound by `d_A(u)+d_A(w)-13`.
This is a contraction obstruction complementary to, but distinct from, the
[safe augmentation](safe_augmentation.md) obstruction at the same edge cap.

At `a=69`, choose an **adjacent** independent-four-set transversal `{u,w}`
as in the existing two-transversal topic. Set

```text
C = G[A]-{u,w},  P=N_C(u),  Q=N_C(w),  D=C-(P union Q).
```

Here `C in R(4,4,16)`, `e(C)=60`, and `|P|+|Q|=8`. Contraction preserves the
`(4,5)` type exactly when `C[P union Q]` is triangle-free. To improve the
result to `(4,4)` one must additionally require that `C[D]` is `I3`-free.
The resulting 17-core then has 68 edges, forcing `P intersect Q` empty,
and the [classification](paley17_uniqueness.md#claim-paley17-uniqueness-01)
identifies it with Paley-17. This yields the precise reusable reduction:

> The adjacent-transversal subfamily whose contraction is `(4,4)` consists
> of vertex splittings of Paley-17, with its eight neighbors partitioned
> between two adjacent replacement vertices.

Both nonempty parts give the two-connected family; keep the marked vertex and
partition, or justify every symmetry quotient. Retain the other cases: a
mixed triangle in `P union Q` obstructs exact-safe contraction, while an `I3`
in `D` obstructs the stronger `(4,4)` target even if `(4,5)` safety holds.
Identifying a **nonadjacent** transversal pair is not an edge contraction and
does not become a safe minor merely because its quotient is a Ramsey graph.

This reduction is available only for the **exact** reading. Under the literal
reading, triangle-freeness of `G[A][U_uw]` requires `P,Q` individually
independent and disjoint. Their union would be bipartite. But the eight
neighbors of the merged vertex in Paley-17 induce the nonbipartite Mobius
ladder `M8`: its cycle vertices `0,1,2,3,4,0` give an odd cycle. Thus **every**
Paley-17 splitting fails the literal contraction test. Exact type preservation
alone cannot authorize these contractions under the stated literal relation.

Paley-17 itself has no exact-safe `(4,4)` edge contractions: each external
neighborhood union has order `8+8-3-2=11`, but a `(3,4)`-free graph has order
at most eight. Contraction-irreducible cores really occur here.

### 4.3 Width bounds and why compression is not equivalence

Minor monotonicity makes a certified safe core a lower-bound witness for the
parent's treewidth or genus. Ordinary width bounds can also be obtained
directly: a graph of treewidth `k` is `k`-degenerate, has minimum degree at
most `k`, and, when `n>=k`, has at most `kn-binom(k+1,2)` edges.
Thus the ambient order-43 graph has treewidth at least 18; an 18-vertex side
with 85 edges has treewidth at least six; the 24-vertex `(5,4)` side with at
least 144 edges has treewidth at least eight (at least nine above 156 edges).
These are lower bounds, not evidence of bounded treewidth suitable for a
small-width dynamic program. Safety supplies no upper bound on treewidth.

Safe reduction is one-way. Contracting a hypothetical 43-vertex graph to a
42-vertex Ramsey graph is compatible with the already known order-42
constructions; order reduction alone gives no contradiction. Inverting a
contraction requires distributing every neighbor of the merged vertex between
the endpoints (possibly to both), rechecking the Ramsey constraints and the
chosen safety convention, and retaining all attachment data needed by the
ambient interface. An isolated safe contraction of `G[A]` need not be safe in
`G`, and discarding its rows can lose the completion constraints.

A complete generation scheme must retain graphs with no legal contractions,
all admissible inverse splittings, and a proved coverage argument. Contracting
arbitrary safe edges terminates, but does not produce a unique normal form or
justify using one chosen contraction history per isomorphism class.

<a id="validation"></a>
## 5. Self-check and literature pointers

Run the dependency-free self-check with

```sh
python scripts/verify_safe_minors.py
```

It exhausts all labelled graphs of orders zero through six for the parameter
pairs `(3,3),(3,4),(4,3),(4,4)`, checking the exact contraction equivalence,
literal-safety implication, edge-count identity, and edge-deletion criterion.
It also verifies Paley-17 and all 254 nonempty labelled partitions of one
vertex's eight neighbors, including Ramsey safety, the 69-edge count, the
critical quotient, and failure of literal safety. This is an author's
self-check, not independent review or a catalogue completeness claim for any
larger Ramsey family.

Standard references, for the ordinary theorems rather than a claimed existing
safe-minor theory:

- R. Diestel, *Graph Theory*, chapters on minors, treewidth, planar graphs,
  and the graph-minor theorem: <https://diestel-graph-theory.com/>.
- K. Wagner, *Uber eine Eigenschaft der ebenen Komplexe* (1937), for the
  ordinary forbidden-minor characterization of planarity.
- N. Robertson and P. D. Seymour, *Graph Minors. V. Excluding a planar graph*,
  JCTB 41 (1986), 92–114, for the excluded-grid framework.
- N. Robertson and P. D. Seymour, *Graph Minors. XIII. The disjoint paths
  problem*, JCTB 63 (1995), 65–110, for the fixed-pattern algorithm framework.
- N. Robertson and P. D. Seymour, *Graph Minors. XX. Wagner's conjecture*,
  JCTB 92 (2004), 325–357, for ordinary-minor well-quasi-ordering.

These citations identify standard results; no exhaustive literature or novelty
search is claimed. The counterexamples above establish why the named ordinary
results cannot simply be restated with restricted contractions.

## Changelog

- Distinguished literal and exact contraction safety and safe edge deletion;
  proved the transfer limits and local codegree/edge filters; connected exact
  contraction to the existing Paley-17 splitting subfamily while proving that
  the literal rule blocks it; added small exhaustive self-checks. Draft pending
  independent review.
