# Boundary profiles for uniform Ramsey gluing

**Author:** BoundaryProfileTheory. **Independent reviewer:** Main, a distinct
identity. **Kind:** local deductions (Claims 01–04), with worked examples and
contextual discussion. **Review state:** accepted for the four claims, their exact
operator contracts, and the stated worked examples, by the historical independent
written review [retained below](#independent-review). This editorial consolidation
carries that decision forward; it is not a new mathematical review.

**Scope and dependencies:** finite simple graphs with a fixed finite labelled
boundary and thresholds `p,q>=1`; the profile is defined even when the graph is
not `R(p,q)`-free. The four claims use only the definitions, finite maxima,
elementary set decomposition, and structural induction. The completed-graph
module consequence in section 7 additionally uses
[the accepted module obstruction](../n43/symmetry_structure.md#claim-symmetry-structure-03),
including its retained literature Ramsey premises. The Antipov–Kratsch citation
in that section supplies standard terminology, not a premise of Claims 01–04.

| Covered statement | Conclusion and permitted search use | Review scope |
| --- | --- | --- |
| [Claim 01](#claim-boundary-profiles-01) | A finite profile gives exact clipped clique/independence observations and detects `R(p,q)`-freeness; exact propagation or terminal observation, not branch coverage. | Historically accepted. |
| [Claim 02](#claim-boundary-profiles-02) | Exact propagation for complete or anticomplete interior joins over the same labelled boundary, counted once. | Historically accepted; uniform joins only. |
| [Claim 03](#claim-boundary-profiles-03) | Exact forgetting, uniform interior introduction, and fixed relabelling. | Historically accepted; arbitrary mixed introduction excluded. |
| [Claim 04](#claim-boundary-profiles-04) | Profile replacement only inside certified expressions of these operators; preserve order only with the additional equal-order hypothesis. | Historically accepted; no replacement under arbitrary ambient incidences. |
| [Examples](#5-direct-examples) and [mixed-attachment counterexample](#6-why-arbitrary-mixed-joins-are-not-profile-operations) | Direct examples and the limit of the permitted operator language. | Covered by the historical written review; not extra formalized claims. |
| [Decomposition discussion](#7-dynamic-programming-interpretation-and-limits-of-decomposition) | Interpretation, dependencies, and limitations; no bounded-width decomposition or Ramsey bound. | No separate claim acceptance or formalization asserted. |

The contribution here is a sufficient finite replacement invariant, together with
exact operations on that invariant. It is not a characterization of arbitrary
attachments. The existing [cross-signature criterion](signature_anchors.md#claim-signature-anchors-01)
already handles arbitrary mixed homogeneous sets when their actual cross columns
are retained. The [two-root gluing theory](../../docs/general_theorems/symmetry_pair_gluing.md) instead handles
compatible overlap identifications and their automorphism quotients. Neither is
being renamed as this invariant; no symmetry quotient is implicit here.

The finite-state view is the standard boundaried-graph dynamic-programming
viewpoint: retain the information visible through an interface and prove that
each permitted operation acts on that information. No novelty claim or
literature-priority review is made. This is a mathematical note, not an
implementation or a new Ramsey bound. The original author-stage development used
no solver, graph search, enumeration, download, build, or formal verification;
the small examples below were proved directly. Historical reviewer validation
and the later documented Lean correspondence are distinguished below.

## Objects, conventions, and observations

Fix integers `p,q>=1`. A graph is `R(p,q)`-free when it has no `K_p` and no
independent set `I_q`. The nondegenerate applications have `p,q>=2`, but the
formulas also cover threshold 1.

A **B-boundaried graph** is a finite simple graph `G` with distinct vertices
labelled by the elements of a fixed finite set `B`. Its boundary graph is the
labelled induced graph `H=G[B]`; its interior is `X=V(G) minus B`. Boundary labels
are retained exactly, not only up to isomorphism. Interior vertices carry no
persistent names in the invariant. When graphs are combined, take fresh disjoint
copies of their interiors first.

The empty vertex set is both a clique and an independent set. Put
`omega(empty)=alpha(empty)=0`. For `t>=1`, write `cap_t(s)=min(t,s)` on
nonnegative integers. A value equal to the cap means **at least** the threshold,
not equality with the untruncated maximum. All tables below are defined for all
finite graphs, including graphs already containing a forbidden set. This makes
the operations closed; freeness is an observation on the resulting state.

For a clique `U` of `H`, and an independent set `U` of `H`, respectively, set

```text
N_X^+(U) = {x in X: x is adjacent to every u in U},
N_X^-(U) = {x in X: x is nonadjacent to every u in U},

c_G(U) = cap_p(omega(G[N_X^+(U)])),       U a clique of H,
a_G(U) = cap_q(alpha(G[N_X^-(U)])),       U independent in H.
```

Here both neighborhoods of the empty set are `X`. Thus `c_G(empty)` and
`a_G(empty)` record the clipped interior clique and independence numbers. A zero
entry means that the corresponding eligible interior is empty. For nonhomogeneous
`U` the corresponding entry is not part of the state; it is not silently assigned
a value. The **profile** is

```text
Sigma_(p,q)(G,B) = (H, (c_G(U))_(U clique in H),
                        (a_G(U))_(U independent in H)).
```

The value `|U|` is never included in either table entry. It is added only when a
boundary set is actually used in a homogeneous set of the whole graph.

<a id="claim-boundary-profiles-01"></a>
## 1. The finite profile detects both forbidden homogeneous sets exactly

Scope: all finite simple B-boundaried graphs, fixed `p,q>=1` and finite label set
`B`; no freeness hypothesis.

Dependencies: the definitions above and elementary decomposition of a vertex set
into boundary and interior.

Conclusion: for fixed `B,p,q`, there are finitely many profiles. Moreover,

```text
cap_p(omega(G)) = max_(U clique in H) cap_p(|U|+c_G(U)),
cap_q(alpha(G)) = max_(U independent in H) cap_q(|U|+a_G(U)).
```

Consequently `G` is `R(p,q)`-free exactly when every clique-boundary candidate
satisfies `|U|+c_G(U)<p` and every independent-boundary candidate satisfies
`|U|+a_G(U)<q`.

Proof: A clique `Q` has a unique boundary part `U=Q intersect B`. Its interior
part is a clique in `G[N_X^+(U)]`. Conversely, a clique in this eligible interior
unites with `U` to form a clique. Therefore the untruncated maximum is the maximum
of `|U|+omega(G[N_X^+(U)])` over all cliques `U` of `H`. For nonnegative `r,s`,

```text
cap_t(r+cap_t(s))=cap_t(r+s).
```

This identity and monotonicity of the cap give the first displayed formula. The
independent-set decomposition, using common nonneighbors, proves the second.
The empty candidate `U` is present, so these maxima are defined even when the
whole graph is empty. A threshold is reached precisely when some displayed
candidate reaches it, proving the freeness criterion.

If `b=|B|`, there are `2^(b(b-1)/2)` labelled boundary graphs and at most `2^b`
entries of each kind. Each clique entry has `p+1` possible values and each
independent entry has `q+1`. Thus, for example,

```text
2^(b(b-1)/2) (p+1)^(2^b) (q+1)^(2^b)
```

is a finite upper bound on the number of states, without asserting that every
such assignment is realizable. If `H` already has a `K_p` or `I_q`, its boundary
candidate alone reaches the threshold. There is no exception for residual size
zero: no interior vertex is then needed. If the residual size is one, freeness
forces the eligible interior to be empty, exactly the zero entry. When `p=1` or
`q=1`, any nonempty graph fails the corresponding test, as required. This proves
all endpoint assertions. QED.

<a id="claim-boundary-profiles-02"></a>
## 2. Exact uniform gluing over a shared labelled boundary

Scope: any two B-boundaried graphs `G_1,G_2` having exactly the same labelled
boundary graph `H`, with disjoint interiors `X_1,X_2`. Fix `epsilon in {0,1}`.

Dependencies: profile definitions and the cap identity in claim 01.

Conclusion: identify the two copies of each boundary vertex. Preserve all
previous edges and put every edge between `X_1,X_2` present if `epsilon=1`, and
absent if `epsilon=0`. Denote the result `G_1 star_epsilon G_2`. Its boundary
is still `H`, and its profile is determined by

```text
epsilon=1 (complete interior join):
  c(U)=cap_p(c_1(U)+c_2(U)),
  a(U)=max(a_1(U),a_2(U)).

epsilon=0 (anticomplete interior join):
  c(U)=max(c_1(U),c_2(U)),
  a(U)=cap_q(a_1(U)+a_2(U)).
```

Each equation is evaluated only on its corresponding homogeneous boundary
subsets. Empty interiors and the empty boundary are allowed.

Proof: For fixed clique `U`, its eligible interior is the disjoint union of the
two old eligible interiors. In a complete join, maximum eligible cliques from
the two sides can be combined, and every eligible clique decomposes into such a
pair. The untruncated maximum is therefore the sum. In an anticomplete join a
nonempty clique can use at most one side, giving the maximum of the two old
values. The empty clique causes no exception when both eligible interiors are
empty. Independent sets have exactly the dual behavior. Clipping commutes with
these sums and maxima, proving all four formulas. Incidences from a boundary
vertex into either side are unchanged, so no further eligibility condition has
been lost. QED.

In particular, in the complete-join case the clipped whole-graph clique number
is

```text
max_(U clique in H) cap_p(|U|+c_1(U)+c_2(U)),
```

and in the anticomplete-join case the analogous independent-set expression is
`max_U cap_q(|U|+a_1(U)+a_2(U))`. The shared set `U` is counted **once**, not twice.
For example, two copies of an edge `bx` with boundary `{b}`, joined completely
on their singleton interiors, produce a triangle, not a four-vertex clique.
The order is always `|G_1|+|G_2|-|B|`.

<a id="claim-boundary-profiles-03"></a>
## 3. Forgetting, uniform introduction, and fixed relabelling are exact

Scope: all profiles of finite boundaried graphs, fixed `p,q>=1`; each operation
below has precisely the stated boundary data.

Dependencies: profile definitions and the cap identity in claim 01.

Conclusion and proof:

### 3.1 Forget a boundary label

For `b in B`, keep the graph unchanged and move `b` from boundary to interior.
The new boundary is `B'=B minus {b}` with graph `H[B']`. For a clique `U` of
`H[B']`,

```text
c'(U)=max({c(U)} union
          {cap_p(1+c(U union {b})): U union {b} is a clique of H}).
```

For an independent `U` of `H[B']`,

```text
a'(U)=max({a(U)} union
          {cap_q(1+a(U union {b})): U union {b} is independent in H}).
```

The second candidate is omitted when its stated condition fails, so no
undefined table entry is queried. An eligible clique either avoids `b`, giving
the first candidate, or contains `b`. The latter is possible precisely when
`b` is adjacent to every vertex of `U`, and its other vertices are a clique in
the old common neighborhood of `U union {b}`. This proves the clique formula,
including the added one for `b` itself. The same dichotomy with nonadjacency
proves the independent formula. Clipping is valid by the cap identity. In
particular, when `U` is empty the second candidate is always available, even if
its old eligible interior is empty: the newly internal singleton `{b}` exists.
Repeated forgetting gives the exact profile for any smaller retained boundary.
Its result is independent of the forgetting order because each step is the
profile of the same unchanged graph with its stated boundary.

### 3.2 Introduce a new boundary vertex uniformly to the old interior

Choose a fresh label `b`, a specified subset `S subset B`, and a bit
`epsilon in {0,1}`. Add a new vertex `b` to the boundary, adjacent to exactly `S`
inside the old boundary, and adjacent to every old interior vertex if
`epsilon=1`, to none if `epsilon=0`. The interior `X` is unchanged. The extended
boundary graph `H'` is completely specified by `H,S`. Entries not containing
`b` are unchanged. For homogeneous sets containing `b`, writing `U=U_0 union
{b}`, the new entries are

```text
c'(U)=c(U_0) if epsilon=1, and 0 if epsilon=0,
a'(U)=a(U_0) if epsilon=0, and 0 if epsilon=1.
```

The first line is queried only for cliques of `H'`, the second only for
independent sets of `H'`. Such a `U_0` has the old required homogeneous type.
For cliques, eligibility at `b` either imposes no extra restriction on the old
eligible interior or excludes every interior vertex, according to `epsilon`.
For independent sets the roles reverse. This proves the formulas, also when
`X` or `U_0` is empty. No plus one occurs: the introduced vertex remains in the
boundary, not in the recorded interior.

### 3.3 Relabel the boundary by a fixed bijection

For a specified bijection `pi:B -> B_new`, rename each boundary label, retaining
the same graph. The new boundary graph is `pi(H)`, and

```text
c'(pi(U))=c(U),
a'(pi(U))=a(U).
```

This follows immediately from the unchanged vertices and incidences. This is a
fixed transport of labels, not an identification of distinct boundary vertices
or permission to permute a boundary while keeping its attachments fixed.
Together with claim 02, all three operations therefore act exactly on the
finite profiles. QED.

<a id="claim-boundary-profiles-04"></a>
## 4. Replacement theorem for every expression in this calculus

Scope: fixed `p,q>=1`. Expressions have finite boundaried graphs as leaves and
are generated by the two binary operators of claim 02 and the three unary
operations of claim 03. The boundary graph is the type: a binary gluing is
allowed only when its operands have the same labelled boundary graph; all
unary data (label, subset `S`, bit, or bijection) are specified as part of the
expression. Interiors are copied apart before each gluing. A context is such a
well-typed expression with one leaf replaced by a hole of specified boundary
type. All other leaves are fixed graphs, of arbitrary order and internal type.

Dependencies: claims 01, 02, and 03.

Conclusion: if `G` and `G'` have the same profile, then for every such context
`C[-]`,

```text
Sigma_(p,q)(C[G])=Sigma_(p,q)(C[G']).
```

In particular the two outputs have equal clipped clique numbers and equal
clipped independence numbers, and one is `R(p,q)`-free if and only if the other
is. Equality of profiles is a congruence for this entire operator language, not
just for one gluing. Any finite family of equal-profile replacements can be
performed in an expression without changing these observations. If the replaced
graphs additionally have equal orders, the outputs also have equal orders.

Proof: Induct along the path from the hole to the root of the expression. At
the hole the states agree, including their boundary graph. At a unary node,
claim 03 computes the output state solely from the input state and the fixed
operation data, so equality and type compatibility persist. At a binary node,
the other child is fixed, and claim 02 computes the output state solely from the
two states and its fixed bit. Equality again persists. This proves the displayed
identity at the root. Claim 01 proves the two homogeneous-number observations
and the freeness equivalence. Apply the same argument successively to make any
finite number of replacements. For orders, forgetting and relabelling do not
change the number of vertices, introduction adds one, and a binary gluing gives
`n_1+n_2-|B|`. These identities give the additional assertion by the same
induction. QED.

This is a sound context-equivalence theorem, not a claim that the profile is the
smallest possible state or that unequal profiles are always distinguishable by
Boolean freeness observations. Exact order is not part of this finite invariant;
when order matters, use the equal-order replacement assertion or track an
additional integer order separately. Nor does the theorem preserve degrees,
isomorphism type, or properties not determined by the stated profile.

## 5. Direct examples

### 5.1 Shared boundary, both joins, and forgetting

Take `p=q=3` and `B={b}`. Let `G_1` have interior `{x,y}` and exactly the edges
`bx,xy`; let `G_2` have interior `{z}` and edge `bz`. Their profiles are

| Entry | `G_1` | `G_2` | Complete join | Anticomplete join |
| --- | ---: | ---: | ---: | ---: |
| `c(empty)` | 2 | 1 | 3 | 2 |
| `c({b})` | 1 | 1 | 2 | 1 |
| `a(empty)` | 1 | 1 | 1 | 2 |
| `a({b})` | 1 | 0 | 1 | 1 |

For example, the nonneighbors of `b` in the first interior consist of `y`, while
there are none in the second. The complete join adds `xz,yz`, so it contains the
triangle `xyz` and also `bxz`; both the empty-boundary candidate and the candidate
using `b` detect a `K_3`. The anticomplete join is the path `y-x-b-z`. Claim 01
gives clique and independence numbers both 2, so it is `R(3,3)`-free. Its order
is `3+2-1=4`, not 5. Forgetting `b` in this anticomplete result gives

```text
c'(empty)=max(2,1+1)=2,
a'(empty)=max(2,1+1)=2,
```

the correct empty-boundary profile of that four-vertex path.

### 5.2 Same order and Ramsey type do not suffice for attachment

Let `A` and `A'` both be a three-vertex path with boundary `{b}`. In `A`, `b` is
the middle vertex and the interior is an independent pair `x,y`. In `A'`, `b`
is an endpoint and the interior is an edge `xy`, with `b` adjacent to `x` only.
Both whole graphs are isomorphic, have order 3, have clique and independence
numbers 2, and are `R(3,3)`-free. Nevertheless their profiles differ:

```text
                c(empty)  c({b})  a(empty)  a({b})
A                   1         1         2         0
A'                  2         1         1         1
```

Attach the same graph with boundary `{b}` and one interior vertex `z`
nonadjacent to `b`, using the complete interior join. For `A` the result is the
4-cycle `b-x-z-y-b`, which has neither a triangle nor an independent triple.
For `A'` the result contains the triangle `xyz`. Thus equal order, equal global
homogeneous numbers, and even the same unlabelled input graph do not imply
replacement safety with a prescribed boundary.

### 5.3 Equal profiles can identify genuinely different boundaried graphs

In contrast, take a four-vertex path and designate either an endpoint or an
internal vertex as its only boundary vertex `b`. These two boundaried graphs
are not isomorphic, since the boundary degrees are 1 and 2. For `p=q=3` both
have the profile

```text
c(empty)=2, c({b})=1, a(empty)=2, a({b})=1.
```

Indeed deleting either chosen vertex leaves a graph with clique and independence
numbers 2; its boundary neighbors have clique number 1, and its boundary
nonneighbors have independence number 1. Claim 04 therefore makes them
interchangeable in every permitted context, with order preserved as well. This
is a genuine replacement beyond labelled graph isomorphism.

More explicitly, give their interiors temporary names `x,y,z`. Take edge sets
`{bx,xy,yz}` and `{bx,by,yz}`, respectively. The first interior is a three-vertex
path; the second is an edge together with an isolated vertex. These are
different internal graphs, not merely different labelings of one interior.
The interior subset `{x,y}` has clique/independence numbers `(2,1)` in the first
and `(1,2)` in the second, so the profile certainly does not preserve all ranks
of named interior subsets. Nonetheless forgetting `b` is safe in both:

```text
c'(empty)=max(2,1+1)=2,
a'(empty)=max(2,1+1)=2.
```

They remain interchangeable after this forgetting and after every further
permitted context, by claim 04. Retaining those differing interior-subset ranks
is unnecessary for this operator language; allowing arbitrary mixed attachments
to those named subsets would change the language, as the next example shows.

## 6. Why arbitrary mixed joins are not profile operations

Even equal order and equal profiles do not suffice if arbitrary interior
vertices can be singled out by a later attachment. For `p=q=3`, use empty
boundary and the fixed vertex names `1,2,3,4` only to describe this counterexample.
Let `F` be the path with edges `12,23,34`, and let `F'` be the cycle with edges
`12,23,34,41`. Both have order 4 and profile

```text
c(empty)=2, a(empty)=2.
```

Perform the same proposed mixed attachment: add one vertex `z` adjacent to
exactly vertices `1,4`. For `F` the result is the 5-cycle. Each vertex has two
neighbors, no two of which are adjacent, so it is triangle-free; an independent
set in a cycle of length 5 has size at most 2, since between any three selected
vertices would have to lie three distinct unselected vertices. Thus it is
`R(3,3)`-free. For `F'` the vertices `z,1,4` form a triangle. Therefore no operation
on just the old profile and this mixed attachment instruction can return the
correct profile or even the correct freeness answer in both cases. Persistent
interior names are not present in the invariant; even if supplied as extra
names without their additional structural information, the two old table
states remain identical.

This also illustrates what more information is needed: expose the attachment
vertices in the retained boundary, or retain a richer state that records
compatibility with the attachment's interior subsets. Claim 03 does not permit
promoting a forgotten vertex or introducing a vertex with arbitrary adjacency
to the old interior. The [existing cross-signature theorem](signature_anchors.md#claim-signature-anchors-01)
is the appropriate exact criterion when the full mixed cross-column data are
available. Uniform join formulas alone cannot replace those data.

## 7. Dynamic-programming interpretation and limits of decomposition

The boundary plays the role of a labelled bag in graph dynamic programming.
The forgetting recurrence separates witnesses using the forgotten vertex from
those avoiding it; the gluing recurrence separates the two interiors while
counting the shared bag once. Equality of table states then supports replacement
by structural induction on an expression. These are standard mechanisms, not a
new general algorithmic paradigm. Introducing boundary vertices with arbitrary
fixed edges to the existing boundary, but uniform edges to the current
interior, and transporting labels by fixed bijections are sufficient to close
this particular operator language. They do not close it under mixed interior
attachments.

For explicit standard definitions, see Leonid Antipov and Stefan Kratsch,
[Boundaried Kernelization via Representative Sets, IPEC 2025, section 2](https://drops.dagstuhl.de/storage/00lipics/lipics-vol358-ipec2025/html/LIPIcs.IPEC.2025.6/LIPIcs.IPEC.2025.6.html#S2).
They define regular gluing by union along shared boundary vertices, and
problem-relative gluing equivalence by agreement under all external gluings;
their introduction also describes the connection to decomposition-based dynamic
programming. When the whole boundary and its induced graph agree, their regular
gluing is `star_0` here. The operation `star_1` additionally prescribes a complete
join between the interiors. Our paired truncated Ramsey tables give a sufficient
congruence for the explicitly stated, larger operator language; the abstract
notion of contextual replacement is not new. This citation supplies terminology
and context, not an external premise needed in proofs 01--04.

No fixed bound on boundary size, expression size, or computation time is claimed.
The state bound in claim 01 grows with `|B|`; it is finite for a fixed interface,
not a uniform finite set for all interface sizes. Every finite graph can
trivially be represented by starting with the empty graph, introducing all its
vertices as boundary with their prescribed pairwise edges while the interior is
empty, and then forgetting them all. This uses the entire vertex set as a
boundary and supplies no compact decomposition or Ramsey improvement.

With empty boundary, complete and anticomplete gluing are precisely the ordinary
complete join and disjoint union. Recursively using these two operations from
singletons is the usual cograph construction, whose last nontrivial operation
exhibits modules. This is a serious limitation for large Ramsey graphs, not a
reason to assume they have such a decomposition. In particular,
[research/n43/symmetry_structure.md, claim 03](../n43/symmetry_structure.md#claim-symmetry-structure-03)
proves that any `K_5/I_5`-free graph with a proper module of size at least 2 has
order at most 39. Thus an order-43 `K_5/I_5`-free graph cannot have a top-level
empty-boundary complete or anticomplete split into two nonempty interiors:
at least one side has size at least 2 and would be such a proper module.

For nonempty boundary, a side is uniformly related to the other interior but
can have nonuniform adjacency to boundary vertices, so it need not be a module
of the whole graph. Conversely a module in a partial graph can be broken by
later boundary data; the cited obstruction must not be applied to such a
partial module. This calculus proves information preservation for an expression
when that expression is given. It neither supplies a bounded-interface
expression for every Ramsey graph nor transfers an inherited local graph to an
unjustified stronger ambient Ramsey type. No new value or bound for `R(5,5)`
follows from the note.

<a id="independent-review"></a>
## Independent review of the uniform boundary-profile calculus

Historical independent written review by **Main**, distinct from author
**BoundaryProfileTheory**. The checks and validation below are the retained
historical record, not checks rerun during this editorial migration.

### Claims and exact reviewed revision

Main's independent review covers all four claims:

- [claim-boundary-profiles-01](#claim-boundary-profiles-01)
- [claim-boundary-profiles-02](#claim-boundary-profiles-02)
- [claim-boundary-profiles-03](#claim-boundary-profiles-03)
- [claim-boundary-profiles-04](#claim-boundary-profiles-04)

It includes the strengthened section 5.3 with different interior graphs, the
exact operator contracts, and the stated worked examples. It does not promote
any sibling proof manuscript or alter search coverage.

The review's recorded author-stage digest was recovered from the original
committed topic by removing its later integration banner and the following blank
line. Git history shows that the only subsequent change to that source before
this consolidation relocated the module-obstruction reference; it changed no
mathematical argument. This consolidation retains the statements, proofs,
examples, and development verbatim apart from relative-link relocation and
removal of repeated administrative labels. Historical acceptance therefore
applies to the retained mathematical body, not to a newly reviewed revision.
The old review's digest and revision bookkeeping remain in Git history rather
than being duplicated here.

### Dependencies reviewed

The four proofs use only the note's definitions, finite maxima, elementary
set decomposition, and structural induction on a specified expression.
They require no numerical Ramsey theorem, catalogue or uniqueness premise.

The contextual links to [signature anchors](signature_anchors.md) and
[two-root gluing](../../docs/general_theorems/symmetry_pair_gluing.md) describe distinct pre-existing
mechanisms, not additional premises of the four claims. Section 7 uses
[the accepted module obstruction](../n43/symmetry_structure.md#claim-symmetry-structure-03)
only for its stated completed-graph consequence: an order-43 K5/I5-free
graph has no proper module with at least two vertices. The source statement
and proof were read; its literature Ramsey premises are retained, not
recertified by this review. The Antipov--Kratsch citation supplies standard
terminology, not a mathematical dependency.

### Independent proof checks

#### Claim 01: the state and its exact observation

For every homogeneous set Q in G, split it uniquely into U=Q intersect B
and Q-B. If Q is a clique, U is a clique in the exact labelled boundary
and Q-B lies in its eligible common interior neighborhood. Conversely,
every clique there combines with U. The independent-set argument uses
common interior nonneighbors. This independently derives the two maxima.

The entries exclude |U|; adding it exactly once is essential. Clipping at
the full threshold is safe because min(t,r+min(t,s))=min(t,r+s) for
nonnegative r,s. This remains true when a boundary candidate already
exceeds the threshold. Empty U supplies a candidate for every state,
including the empty graph. At threshold 1, any nonempty graph is detected.
Residual size 1 forces an empty eligible interior; residual size 0 needs
no interior witness. Nonhomogeneous boundary subsets are not queried.

The displayed finite state bound follows by choosing a labelled boundary
graph and at most 2^|B| entries of each colour, each in 0..p or 0..q.
It is an upper bound, not a realization assertion. No graph-order field
is silently included in the invariant.

#### Claim 02: both uniform joins

Fix a homogeneous boundary U. The eligible interior after gluing is the
disjoint union of the old eligible interiors. For a complete interior
join, clique maxima add and independence maxima take their maximum.
For an anticomplete join, these roles exchange. These equations also
cover an empty side, a zero entry and an empty boundary. Clipping commutes
with the sums and maxima used here.

Both sides agree on the entire labelled boundary graph and their interiors
are copied apart, so no conflicting boundary edge or duplicated interior
vertex is hidden. The final boundary witness contributes |U| once.
The graph order n1+n2-|B| is independently correct. Arbitrary mixed cross
edges are not among this claim's operations.

#### Claim 03: forgetting, introducing and relabelling

Forgetting b partitions eligible homogeneous interior witnesses into
those avoiding b and those using b. The latter branch exists exactly
when U union {b} has the appropriate boundary homogeneous type. Its
remaining vertices are counted by the old entry at U union {b}, plus
one for b. This gives both displayed max recurrences and does not query
an undefined entry. It also handles an empty old eligible interior:
b alone is a genuine new interior witness. Iterated forgetting computes
the same unchanged graph with its smaller boundary in every order.

Introducing a boundary vertex leaves the interior unchanged. For entries
not using it, eligibility is unchanged. For entries using it, a uniform
edge/nonedge to the old interior either imposes no restriction or removes
all interior candidates. Thus the entries are the old entry or zero;
there is no extra one while the vertex is still in the boundary. The
fixed edges to the old boundary determine which entries exist.

A fixed bijection transports boundary sets, incidences and entries.
It does not quotient by isomorphism, identify different boundary vertices,
recover forgotten interior names or admit mixed interior introduction.

#### Claim 04: context congruence

The context's boundary graph is part of its type, and all unary operation
data and binary bits are fixed. At every node on the hole-to-root path,
Claims 02--03 compute the output profile solely from input profiles.
Induction therefore preserves profile equality, including admissibility
of subsequent typed operations. Claim 01 then gives equal clipped global
homogeneous numbers and equivalent R(p,q)-freeness. Multiple replacements
follow by successive applications.

Graph order is not inferred from profile equality. The separate equal-order
hypothesis is sufficient: unary introduction adds one, forgetting and
relabeling preserve order, and a binary join subtracts the common boundary
once. The same induction proves this assertion. The manuscript correctly
does not preserve degrees, named-subset ranks or arbitrary contextual
properties. It proves a sufficient congruence, not minimality or the
converse that different profiles must have distinguishable Boolean tests.

### Worked examples and exercised validation

The examples were independently re-derived and exercised in an in-memory
Python 3.12.3 validation with 30-second call deadlines. No packages,
solver, catalogue, graph generation search or canonicalizer was used.
Only subsets of explicitly fixed graphs were considered.

- For b-x-y and b-z, the complete interior join has triangles; the
  anticomplete join is the four-vertex path y-x-b-z. Its empty-boundary
  clique and independence ranks after forgetting b are both 2.
- The differently pointed three-vertex paths are distinguishable by the
  same complete-join context, as stated.
- The two section 5.3 examples have interiors P3 and K2+I1, and different
  boundary degrees 1 and 2. Both have c(empty)=a(empty)=2 and
  c({b})=a({b})=1 at p=q=3. Named interior subset {x,y} has different
  ranks, so this is genuine information loss with safe replacement.
  Both joins to a fixed context and subsequent forgetting preserve their
  observed profile equality.
- The P4 versus C4 mixed-attachment counterexample was checked by its
  explicit triangle/C5 witnesses. It correctly limits the operator language.

The scripted operator checks covered p,q=1..4, including threshold 1:
64 uniform-join table entries, 160 forgetting entries, 1,888 uniform
introduction entries and 112 relabelling entries. All passed. The broader
calculus validation also exercised the C5 versus identically ported,
relabelled P4 distinction. The dated
[research report](../reports/2026-10-19-ramsey-attachment-calculus.md)
retains the full validation source, commands, a corrected separate dual
capacity-fixture assertion, and exact outputs. The correction concerned
an erroneous fixture expectation, not this manuscript or its four claims.

### Findings

No proof gaps found. The important safeguards are explicit in the source:
full labelled boundary, disjoint interiors, uniform cross joins, exact
homogeneous eligibility, threshold clipping, shared boundary counted once,
and equal order as an additional replacement condition when needed.

The primeness discussion is confined to completed graphs. A partial module
can be broken by later attachments. Nonempty interfaces need not define
modules. There is no bounded-width or compact-decomposition theorem.

### Outcome

**Accepted**: all four claims, their exact operator contracts and the stated
worked examples in the author-stage body identified above.
Proposed permitted use is exact propagation and profile replacement only
inside certified expressions formed from these operators. It is not a
complete generator or a proof of coverage of any Ramsey branch.

### Limits

This is an independent written mathematical review, not a Lean proof,
formal certificate, novelty review or numerical Ramsey improvement.
No bound on required interface size, expression size or runtime follows.
The state count can be large, and any graph can be represented trivially
by retaining all its vertices as a boundary. Arbitrary mixed attachments
require the richer interface, not these smaller tables.

## Existing Lean correspondence

The [theorem-module documentation](../../lean/Ramsey/theorems/README.md#uniform-boundary-calculus)
records proved interfaces for all four claims in namespace `Ramsey.Boundary`,
re-exported by `import Ramsey`. This is existing repository correspondence, not a
new build or axiom audit performed during this consolidation.

| Claim | Existing interfaces and modules |
| --- | --- |
| 01 | `card_profile_le`, `capped_homogeneousNumber`, `isRamseyGraph_iff_candidates`, and endpoint lemmas in [BoundaryProfiles.lean](../../lean/Ramsey/theorems/BoundaryProfiles.lean). |
| 02 | `entry_glue`, the four colour-specific formulas, whole-number corollaries, and `glue_order_sub` in [BoundaryProfileGluing.lean](../../lean/Ramsey/theorems/BoundaryProfileGluing.lean) and its definition module. |
| 03 | Exact unary recurrences and profile congruences in [BoundaryProfileOperations.lean](../../lean/Ramsey/theorems/BoundaryProfileOperations.lean); retained-boundary reindexing and forgetting-order invariance in [BoundaryProfileTransport.lean](../../lean/Ramsey/theorems/BoundaryProfileTransport.lean). |
| 04 | `uniform_replacement`, `uniform_replacement_observations`, `uniform_replacement_isRamseyGraph`, and `uniform_ordered_replacement` in [BoundaryProfileContexts.lean](../../lean/Ramsey/theorems/BoundaryProfileContexts.lean). |

Concrete definitions use `B ⊕ X`, separate retained boundary labels from the
finite interior, and store the exact boundary graph with two capped tables
indexed only by homogeneous boundary sets. Interior names and graph order are
not stored. The typed `UniformDerivation` grammar retains both join bits, all
three unary operations, fixed operation data, and labelled-boundary gluing
compatibility. Replacement leaves can have unrelated finite interior types;
order preservation requires the separate equal-order hypothesis. The examples
and decomposition discussion are explanatory, not additional formalized claims.
No arbitrary mixed-attachment, minimal-state, bounded-width, or runtime theorem
is asserted.

## Changelog

- The original development introduced the four exact profile claims and the
  uniform-context replacement theorem; its strengthened equal-profile example
  uses genuinely different interior graphs and records lost named-subset ranks.
- Main's historical independent review accepted the four claims, their operator
  contracts, and worked examples, while retaining the uniform-language,
  equal-order, completed-module, and no-coverage limitations.
- Consolidated the topic and its substantive independent review here, preserving
  the reviewed mathematical development and stable anchors. Removed repeated
  administrative metadata and obsolete source/review files; relocated links and
  recorded the existing Lean correspondence. This is an editorial consolidation,
  not renewed mathematical review or an extension of accepted scope.
