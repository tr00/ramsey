# Critical-face capacities and label transport

<!-- attachment-calculus-integration:start -->
Integration status (2026-10-19): all five claims, duals and worked instances
are independently **accepted** by
[CriticalTransportAudit](review_critical_face_transport_20261019_transport_audit.md)
at SHA-256 `a0d900a4f8022881b2a3f3c416eb80a26136c16ba49ee37dc34c040c0901c3f0`.
The reviewed body below is unchanged; ready/pending labels are historical.
Permitted mathematical use: necessary face/label/colouring propagation and
the stated exact saturation conclusions, not sufficient attachment criteria.
Instance B uses its global all-core-nonedges premise, ambient K5/I4 type
and hypotheses (11) together, as clarified by the review.
No Ramsey branch closure, novelty or formal certificate is supplied.
<!-- attachment-calculus-integration:end -->

Date: 2026-10-19. Author: `CriticalFaceTheory`.
Task: `ramsey-attachment-calculus-critical-faces-20261019`.
All claims are **ready for independent review**, not accepted. This is a
mathematical extraction of existing mechanisms, not a novelty assertion.
No solver, catalogue, graph search, download, build, or Lean work was used.

## Setting and relation to existing operators

Graphs are finite, simple and undirected. Fix integers `p,q>=3` and a
`K_p/I_q`-free graph `G`. Let `H` be an induced subgraph, and let `T` be
**any** subset of `V(G)-V(H)`; it need not exhaust the exterior. For
`S subset V(H)` define the open common nonneighborhood and neighborhood

```text
M_H(S)={x in V(H)-S : x is nonadjacent to every vertex of S},
N_H(S)={x in V(H)-S : x is adjacent to every vertex of S}.
```

Both sets equal `V(H)` when `S` is empty. An independent set of size
`q-2` is called an independent critical face; a clique of size `p-2` is
its clique dual. These names only describe the two-vertex distance to a
forbidden homogeneous set. They assert no Ramsey-criticality of `H`.
Write `omega` and `alpha` for clique and independence number, with value
zero on the empty graph.

The pre-existing [signature criterion](signature_anchors.md#claim-signature-anchors-01),
[weighted anchor method](signature_anchors.md#claim-signature-anchors-04),
and [transversal deletion/defect operator](transversal_deletion.md#claim-transversal-deletion-02)
remain the relevant general results. The contribution here is the passage
from **individual face capacities** to **labels on a core link**, and then
to colouring and rigid-partition obstructions. We do not give a second
arbitrary-attachment iff criterion. Every assertion below concerns actual
induced subgraphs of the stated ambient graph; stronger core types must
be supplied separately.
The sibling [attachment calculus](ramsey_attachment_calculus.md) supplies
broader context; no claim here depends on that new note.

<a id="claim-critical-face-01"></a>
## 1. Capacity at an independent face, and its complement dual

Claim ID: `docs/general_theorems/critical_face_transport.md#claim-critical-face-01`

Kind: local-deduction. Review state: ready.

Scope: every `p,q,G,H,T` in the setting, every independent `(q-2)`-set
`F subset V(H)`, and every clique `(p-2)`-set `D subset V(H)`.
Dependencies: forbidden homogeneous-set definitions only.

Conclusion: Put

```text
Z_F=M_H(F),
X_F={t in T : t is nonadjacent to every vertex of F},
c_F=p-1-|Z_F|.
```

`Z_F` and `X_F` are cliques, and every edge between them is present.
Consequently `c_F>=0` and `|X_F|<=c_F`. In particular `|Z_F|=p-2`
gives unit capacity, `|Z_F|=p-1` forbids any exterior vertex missing `F`,
and these statements remain valid if `H` has any additional prohibitions.

Dually, put

```text
Y_D=N_H(D),
X_D^+={t in T : t is adjacent to every vertex of D},
c_D^+=q-1-|Y_D|.
```

`Y_D` and `X_D^+` are independent sets, and every edge between them is
absent. Thus `c_D^+>=0` and `|X_D^+|<=c_D^+`.

Proof: Two nonadjacent vertices in `Z_F`, or two in `X_F`, together with
`F` would make an `I_q`. If `z in Z_F` and `t in X_F` were nonadjacent,
then `F union {z,t}` would also be an `I_q`. Thus `Z_F union X_F` is a
clique, of order at most `p-1`. This proves all independent-face assertions.
For the dual, two adjacent vertices in `Y_D`, two in `X_D^+`, or an edge
between the two sets would extend `D` to a `K_p`. Their union is therefore
independent, of order at most `q-1`. This proves the dual directly.

Search use: none pending independent review; prospective use is necessary
capacity propagation, never a sufficiency test. Reviews: none.

<a id="claim-critical-face-02"></a>
## 2. Weighted witness/resource packing with exact defects

Claim ID: `docs/general_theorems/critical_face_transport.md#claim-critical-face-02`

Kind: local-deduction. Review state: ready.

Scope: the setting; any family `mathcal F` of independent critical faces
in `H`; arbitrary real weights `w_F>=0`; and, for each `t in T`, any
justified real lower bound `0<=ell_t<=a_w(U_t)` defined below. Zero weights
and the empty family are allowed. Dependencies: Claim 01.

Conclusion: Define

```text
U_t=M_G({t}) intersect V(H),
n_F=|{t in T : F subset U_t}|,
a_w(U)=sum_(F in mathcal F:F subset U) w_F,
B_w=sum_(F in mathcal F) w_F*c_F.
```

Then

```text
sum_(t in T) a_w(U_t)=sum_F w_F*n_F <= B_w,
Delta=B_w-sum_t ell_t
     =sum_F w_F*(c_F-n_F) + sum_t (a_w(U_t)-ell_t) >=0.       (1)
```

The two defect sums are separately nonnegative. Equality `Delta=0`
holds **if and only if** every positive-weight face is saturated
(`n_F=c_F`) and every individual lower bound is tight
(`a_w(U_t)=ell_t`). No covering assumption or disjointness assumption is
needed. An explicit family with `sum_t ell_t>B_w` is impossible.

More quantitatively, each `w_F*(c_F-n_F)` and each
`a_w(U_t)-ell_t` is at most `Delta`. If the positive weights are all at
least `rho>0`, at most `floor(Delta/rho)` positive-weight faces are
unsaturated. If every positive vertex defect is at least `sigma>0`,
at most `floor(Delta/sigma)` vertices have a positive vertex defect.
For unit weights and integral `ell_t` both kinds of positive defect are
integral, so their **combined** number is at most `Delta`.

There are also structural consequences before summing:

* When all `c_F<=1`, the witness sets
  `mathcal F(U_t)={F in mathcal F:F subset U_t}` are pairwise disjoint.
  Capacity-zero faces occur in none of them.
* If all capacities equal one and all are saturated, these witness sets
  partition `mathcal F`. With weights, equality in (1) partitions the
  positive-weight capacity-one faces, provided those are all the
  positive-weight faces; capacity-zero faces contribute nothing.
* In any extension preserving `G[V(H) union T]` and the `K_p/I_q`
  prohibitions, an additional exterior vertex cannot miss every member
  of a saturated face. Saturated faces are therefore new hitting
  constraints on every subsequent missing signature, independently of
  its edges to `T`.

All statements have a clique dual: replace independent faces by clique
`(p-2)`-faces `D`, replace `U_t` by `N_G(t) intersect V(H)`, replace
`c_F` by `c_D^+`, and keep the weights, loads, defects, disjointness,
and saturation conclusions unchanged. An added vertex must not be
complete to a saturated dual face.

Proof: Double-count the finite weighted incidences `(F,t)` with
`F subset U_t`. Claim 01 gives `n_F<=c_F`, proving the first line and
nonnegativity of each resource defect. Subtract `sum_t ell_t` and add
and subtract `sum_t a_w(U_t)` to obtain (1). A finite sum of nonnegative
terms is zero exactly when all its positive-weight resource terms and
all vertex terms vanish. An unsaturated face has integral deficit at
least one, hence contributes at least `rho`; the other counting assertions
follow the same way. Unit capacities prohibit a face belonging to two
witness sets. Saturation forces each capacity-one face to belong to one.
An added vertex missing a saturated face would increase its load above
capacity, contradicting Claim 01, regardless of the new vertex's other
edges. The same double count and arguments use the dual part of Claim 01
without any change of inequality direction.

**Exact versus relaxation.** Identity (1), its equality characterization,
and the per-face loads are exact for actual signatures. Replacing costs
by `ell_t`, replacing individual capacities by their sum, or keeping only
signature sizes loses information. Even all individual capacities are
only necessary for an attachment: they do not detect every forbidden set.
The word “partition” here refers to face witnesses, not a partition of
vertices or an assertion of realizability.

Search use: none pending independent review; prospective use is a weighted
obstruction and defect propagation with explicitly justified costs.
Reviews: none.

<a id="claim-critical-face-03"></a>
## 3. Unit-capacity transport: labels and transversal demands

Claim ID: `docs/general_theorems/critical_face_transport.md#claim-critical-face-03`

Kind: local-deduction. Review state: ready.

Scope: the setting; an independent set `A subset V(H)` of size `q-3`;
any `E subset M_H(A)`; and any
`W subset {t in T : t is nonadjacent to every vertex of A}`. Suppose,
for every `x in E`,

```text
|M_H(A union {x})|>=p-2.                                   (2)
```

The set `A` may be empty (`q=3`). No regularity, extremality, prescribed
order, catalogue uniqueness, or additional core type is assumed.
Dependencies: Claim 01 and the definition of a clique transversal.

Conclusion: There is a uniquely determined label
`lambda:E -> {0} union W`: label `x` by its unique nonneighbor in `W`
when one exists, and by `0` otherwise. In particular the full `E`--`W`
adjacency is transported to a one-missing-vertex label:

```text
xt is a nonedge <=> lambda(x)=t,      x in E, t in W.         (3)
```

Here `0` denotes a fresh symbol not belonging to `W`.

Both `G[E]` and `G[W]` are `K_p/I_3`-free: the clique prohibition is
inherited, not strengthened to `K_(p-1)`-freeness. For `t in W`, the nonzero fibre
`E_t={x:lambda(x)=t}` is a clique and satisfies

```text
|E_t|<=d_t:=p-1-omega(G[W-{t}]).                            (4)
```

For an integer `1<=s`, let `tau_s(W)` be the smallest size of a set
meeting every `K_s` of `G[W]`; it is zero if there is no such clique.
Thus `tau_1(W)=|W|`. For **each** clique `Q subset E` of size
`1<=r<=p-1`, its nonzero label image

```text
L(Q)={lambda(x):x in Q, lambda(x)!=0}
```

is a `K_(p-r)`-transversal of `G[W]`. Consequently

```text
tau_(p-r)(W)<=|L(Q)|<=r.                                  (5)
```

In particular a proved `tau_(p-r)(W)>r` prohibits such a core clique;
`tau_(p-r)(W)>=r` forces every vertex of `Q` to have a distinct nonzero
label. These are actual label-set constraints, not just cardinalities.

Proof: `A union {x}` is an independent critical face. By (2) its capacity
is at most one, so at most one vertex of `W` misses `x`. This proves the
existence, uniqueness and (3), including the capacity-zero case, which
forces label zero. An independent triple in `E` or `W`, together with
`A`, would make an `I_q`. If distinct `x,y` have the same nonzero label
`t`, a nonedge `xy` would give `I_q` on `A union {x,y,t}`; hence every
`E_t` is a clique. It is completely joined to `W-{t}`, so it and any
maximum clique there have total size at most `p-1`, proving (4).
Finally every vertex of `W-L(Q)` sees all of `Q` by (3). A `K_(p-r)`
there would join `Q` to a `K_p`. Thus `L(Q)` is the asserted transversal,
proving (5) and its consequences.

Search use: none pending independent review; prospective use is label,
transversal and colouring propagation on (2). Reviews: none.

<a id="claim-critical-face-04"></a>
## 4. A derived colouring obstruction, not merely a sum of capacities

Claim ID: `docs/general_theorems/critical_face_transport.md#claim-critical-face-04`

Kind: local-deduction. Review state: ready.

Scope: Claim 03's hypotheses; any family `mathcal Q` of cliques in `E`
with orders `r_Q` satisfying `tau_(p-r_Q)(W)>=r_Q`. Put
`D=union_(Q in mathcal Q) Q`. Form a graph `J` on `D` by joining distinct
vertices whenever they are nonadjacent in `G[E]` **or** they belong to a
common member of `mathcal Q`. Dependencies: Claim 03.

Conclusion: The actual labels give a proper `|W|`-colouring of `J`,
using only the nonzero labels. Hence

```text
chi(J)<=|W|.                                               (6)
```

This is a necessary graph-colouring obstruction. If `mathcal Q` covers
every vertex of `E` and covers every edge of `G[E]`, then `J` is complete
on `E`, so the labels inject `E` into `W` and `|E|<=|W|`.

More generally, whenever all vertices of `E` are forced to have nonzero
labels (by this claim, Claim 05 below, or a separate proof), they partition
`E` into cliques `E_t` giving a proper colouring of `complement(G[E])`
with colour-specific capacities `d_t` from (4). Thus

```text
|E|<=sum_(t in W) d_t.                                    (7)
```

Equality in (7) holds exactly when `|E_t|=d_t` for **every** `t in W`.
For each such fibre its union with any maximum clique of `G[W-{t}]`
is a clique of order `p-1`. If `W` itself is a `k`-clique, every
`d_t=p-k`; equality forces a partition of `E` into `k` cliques each
of order `p-k`. This specifies fibre sizes and saturated cliques, not
edges between different fibres or uniqueness of the whole graph.

Proof: Claim 03 forces distinct nonzero labels on each member of
`mathcal Q`, so every vertex of `D` has a nonzero label. Vertices
nonadjacent in `G[E]` cannot have the same nonzero label because its
fibre is a clique. The other edges of `J` are between vertices in a
common `Q` and also have distinct labels. This proves (6). If all core
vertices and edges are covered, every distinct pair is an edge of `J`:
a nonedge is included by definition, and an edge is covered by a `Q`.
This proves the injection. Under the stated nonzero-label premise, sum
(4) over the partition into fibres. Equality holds precisely when each
nonnegative deficit `d_t-|E_t|` vanishes. The saturated-clique statement
then follows from (3), and the clique case substitutes
`omega(W-{t})=k-1`.

**Using the existing deletion operator.** Numerical or structural inputs
for `tau_s(W)` need not be new searches. For example, let `s>=2`,
`m=|W|`, and `0<=t<=m`. Here `alpha(W)<3` by Claim 03. Given a justified
edge lower bound `L` for every `(m-t)`-vertex `K_s/I_3`-free graph, and
a proved Ramsey upper bound `R` for `R(s,2)`,
[transversal deletion Claim 01](transversal_deletion.md#claim-transversal-deletion-01)
gives

```text
e(W)<L+t*max(0,m-t-R+1)+a(t,3)  =>  tau_s(W)>=t+1,          (8)
```

where `a(t,3)=binom(floor(t/2),2)+binom(ceil(t/2),2)`.
This invokes that existing theorem, not a renamed deletion result.
Its hypotheses concern `W`, not the generally different ambient type
of `H`. Taking `s=p-r` and `t=r-1` in (8), when `t<=m`, supplies the
tight-clique premise for (6). If `s=1`, use the exact value
`tau_1(W)=m` instead. Equality or small defect in the deletion bound can
also restrict the actual label set `L(Q)` through the existing
[component-defect identity](transversal_deletion.md#claim-transversal-deletion-02).

Search use: none pending independent review; prospective use is a
colouring obstruction or structural equality filter, not a graph
realizability criterion. Reviews: none.

<a id="claim-critical-face-05"></a>
## 5. Eliminating the zero label by a triangle-supported link

Claim ID: `docs/general_theorems/critical_face_transport.md#claim-critical-face-05`

Kind: local-deduction. Review state: ready.

Scope: Claim 03's hypotheses with `p>=4`. Suppose
`tau_(p-3)(W)>=2`. For each `x in E` assume

```text
d_(G[E])(x)>|W|,
every y in N_(G[E])(x) has a neighbor in N_(G[E])(x).        (9)
```

Equivalently the second condition says every core edge incident with
`x` belongs to a core triangle. Dependencies: Claims 03 and 04.

Conclusion: No vertex of `E` has label zero. Consequently the capacitated
colouring, inequality (7), and its exact equality consequences apply.
It suffices to check (9) only for vertices not already known to have
nonzero label. For a `k`-clique `W` with `k>=p-2`, the transversal
hypothesis holds because `tau_(p-3)(W)=k-p+4>=2`; hence (9) gives
`|E|<=k(p-k)`, with the partition rigidity of Claim 04 in equality.

Proof: Suppose `lambda(x)=0`. For any triangle `{x,y,z}` in `G[E]`,
Claim 03 requires its nonzero labels to hit every `K_(p-3)` of `W`.
The transversal hypothesis requires at least two labels, so `y,z`
have distinct nonzero labels. The second condition in (9) therefore
forces every vertex of `N_E(x)` to have a nonzero label. If two of
these neighbors shared a label, Claim 03 would make them adjacent;
together with `x` they would form a triangle with only one nonzero
label, a contradiction. The labels thus inject `N_E(x)` into `W`,
contradicting the first condition in (9). No zero label is possible.
Apply Claim 04. For a clique `W`, deleting vertices to destroy all
`K_(p-3)` requires leaving at most `p-4` vertices, giving the displayed
transversal value and the last substitution.

Search use: none pending independent review; prospective use is a
zero-label obstruction and rigid equality propagation. Reviews: none.

## Explicit dual of the transport and structural theorems

Claims 03--05 also assert the following dual statements, with exactly
the corresponding hypotheses. Take a clique `A` of size `p-3`,
`E subset N_H(A)`, and `W subset T` complete to `A`. Require

```text
|N_H(A union {x})|>=q-2  for every x in E.
```

Each `x in E` has at most one **neighbor** in `W`; its label is that
neighbor, or zero if it has none. Nonzero fibres are independent, and

```text
|E_t|<=q-1-alpha(G[W-{t}]).
```

Both `G[E]` and `G[W]` are `K_3/I_q`-free: triangle-freeness follows
from the root clique, and `I_q`-freeness is inherited. An independent `r`-set `Q`
in `E`, `1<=r<=q-1`, has a nonzero label image meeting every
`I_(q-r)` in `W`. Write `tau_s^I(W)` for this minimum independent-set
transversal size. A family of independent sets `Q` with
`tau_(q-r_Q)^I(W)>=r_Q` forces distinct nonzero labels on each member.
On their union, the graph joining original core **edges**, and also
pairs in a common such `Q`, must be `|W|`-colourable. If the family
covers every vertex and every original core **nonedge**, labels inject
the core link into `W`. If all labels are nonzero, they properly colour
`G[E]` with capacities `q-1-alpha(W-{t})`, and equality in their sum
saturates every fibre and produces independent sets of order `q-1`.

For zero-label elimination, require `q>=4`,
`tau_(q-3)^I(W)>=2`, and, for each possibly-zero vertex `x`, more than
`|W|` nonneighbors in `E`, with every such nonneighbor `y` belonging
to an independent triple `{x,y,z}` in `E`. Then there are no zero
labels. For an independent `k`-set `W`, `k>=q-2`, this yields
`|E|<=k(q-k)`, with equality a partition into `k` independent sets
of size `q-k`.

Proof of all dual assertions: Apply Claims 03--05 to `complement(G)`
with parameters `(q,p)`. The complement is `K_q/I_p`-free; its induced
core is `complement(H)`; independent `(p-3)`-sets there are exactly
the cliques `A` here; its common nonneighborhoods are exactly the
common neighborhoods here. Its cliques, clique transversals,
neighborhood degrees, and triangle-supported edges become precisely
the independent sets, independent-set transversals, nonneighbor counts,
and independent-triple-supported nonedges stated above. Complementation
preserves the vertex sets and all capacities, so every hypothesis and
conclusion is transported without an ambient-type inference.

## Worked instance A: independent-anchor singleton capacities

This is the mechanism already proved in
[signature anchors Claim 03](signature_anchors.md#claim-signature-anchors-03),
not a new anchor bound. Let `X` be any independent `(q-1)`-set in a
`K_p/I_q`-free graph, let `T` be any exterior set of order `b`, and
put `S_t=N_G(t) intersect X`. No rooted decomposition is needed for
this instance. Use the induced core `H=G[X]` and faces
`F_x=X-{x}` for `x in X`.

Every `S_t` is nonempty, since otherwise `X union {t}` is `I_q`.
For each face `M_H(F_x)={x}`, so Claim 01 gives capacity `p-2`.
Moreover `t` misses `F_x` exactly when `S_t={x}`. Thus these resources
are exactly the singleton signature classes, not merely a size bound
on arbitrary signatures. Each singleton class is a clique complete to
`x`; with unit weights Claim 02 reads

```text
n_1=sum_x |{t:S_t={x}}| <= c=(q-1)(p-2).
```

Let `h=sum_(t:|S_t|>=3)(|S_t|-2)`. Counting incidences gives the exact
identities

```text
e(X,T)=2b-n_1+h,
e(X,T)-(2b-c)=sum_x [(p-2)-|{t:S_t={x}}|]+h.                (10)
```

In particular equality in `e(X,T)>=2b-c` is exactly saturation of all
singleton resources and absence of signatures of size at least three.
For the independent bound `e(X,T)>=b`, equality instead means all
signatures are singletons. These are the existing two equality regimes:
`e(X,T)>=max(b,2b-c)`, with no false saturation assertion when `b<c`.
For example `p=q=5,b=24` gives `c=12` and `e(X,T)>=36`; equality means
four singleton cliques of order three and all remaining signatures of
size two. This does not assert those signatures can be realized in an
ambient Ramsey-free graph. Weighted anchors and degree/excess transport
remain exactly the separate existing results
[Claims 03--04](signature_anchors.md#claim-signature-anchors-03).

The complement instance uses a clique `(p-1)`-anchor, singleton
**missing** signatures, and capacity `q-2`, recovering
[signature anchors Claim 05](signature_anchors.md#claim-signature-anchors-05).
It is the dual of this same mechanism, not our second worked mechanism.

## Worked instance B: critical-core exterior labels without choosing a core

This is a different mechanism: the resources are overlapping core
nonedges, and transport forces an exterior-row obstruction. We recover
[the triangle obstruction](../../research/n43/d18/critical_core_exterior.md#claim-critical-exterior-triangle-free)
and [four-vertex exterior bound](../../research/n43/d18/critical_core_exterior.md#claim-critical-exterior-four)
from explicit local hypotheses, not from a catalogue representative.

Let `B` be `K_5/I_4`-free and contain an induced core `H`. Suppose that
for every core nonedge `cx`, `M_H({c,x})` has order three. Fix a vertex
`c`, put `E=M_H({c})`, and suppose the following additional local facts:

```text
|E|=8,
d_(H[E])(x)>=4 for every x in E,
every edge of H[E] lies in a triangle of H[E].              (11)
```

These are precisely the local facts established for each critical
17-core in the cited note; its SRG derivation is an input **for that
application only**, not a hypothesis hidden in Claims 01--05. Let
`T=V(B)-V(H)` and `W={t in T:ct is a nonedge}`.

First, Claim 01 gives capacity one to every core nonedge `cx`: its
three common core nonneighbors form a clique. Thus each `x in E`
misses at most one vertex in any chosen subset of `W`. For the whole
core, Claim 02 says the sets of core nonedges induced by the missed
signatures `U_t` are pairwise disjoint. If `H` has 68 nonedges, this
recovers exactly the resource inequality

```text
sum_(t in T) [binom(|U_t|,2)-e(H[U_t])] <= 68,
```

which is the saturated nonedge packing in
[cross_core.json, strict-seven-signature-budget](../../research/n43/d18/k1/cross_core.json).
It holds for adjacent as well as nonadjacent exterior pairs. Its defect
is literally the number of core nonedges used by no exterior vertex;
it does not certify that every packing is realizable.

Now suppose `W` contains a triangle `W'`. Apply Claim 03 with
`p=5,q=4,A={c}` and exterior set `W'`. The transversal number
`tau_2(W')=2`. By (11), all conditions of Claim 05 hold: degrees are
at least four, larger than `|W'|=3`, and every incident edge is in a
triangle. There is no zero label. Each nonzero fibre has size at most
`5-1-omega(W'-{t})=2`. Eight vertices cannot fit in three fibres of
size at most two. Thus `B[W]` is triangle-free.

Also `B[W]` has no independent triple, since that triple with `c`
would form `I_4`. The recorded input `R(3,3)=6` therefore gives
`|W|<=5`. If `|W|=5`, then

```text
tau_2(W)=|W|-alpha(W)>=5-2=3.
```

Use **all triangles** of `H[E]` in Claim 04. Each is tight: its order
is three and its label image must meet every edge of `W`, requiring
at least three labels. By (11), triangles cover every edge and every
vertex of `E`. The conflict graph `J` is therefore `K_8`, which cannot
be coloured by the five labels in `W`. Hence `|W|<=4`.

This recovers the two structural exterior restrictions from the local
hypotheses (11), with no `|T|=7`, second core, K1 partition, named SRG,
or uniqueness assumption. It is not a new proof that every arbitrary
core has (11), not an existence assertion for a listed row, and not an
exclusion of K1 or a claim about `R(5,5)`.

## Exactness, limitations, and review boundary

* Face capacities and the label relation (3) are exact necessary facts
  for the specified actual graph. They are not sufficient attachment
  conditions, even when every positive-weight resource saturates.
* Equality in a resource sum is an exact saturation statement only
  with its explicit vertex-cost defects retained. Equality in (7)
  specifies a clique partition, not all cross-fibre edges. Label demand
  (5) keeps the actual transversal; replacing it by `tau` or a lower
  bound on `tau` is a relaxation.
* Proper colouring of the conflict graph is necessary, not sufficient:
  it forgets remaining mixed-clique conditions, full independent-set
  conditions, and interactions with unlabelled core/exterior vertices.
* Unit capacity is an explicit local hypothesis (2). A larger capacity
  gives a set-valued missing label, not the one-label theorem. We make
  no claim that the same rigidity follows in that case.
* The proofs permit arbitrary weights but do not assert that a useful
  fractional packing, tight cost estimate, or transversal bound exists.
  Formula (8) needs its stated external edge/Ramsey inputs.
* All new claims are local deductions awaiting independent review.
  Previously accepted source mechanisms are linked as premises or
  worked instances; their review status does not promote this note.
  No novelty check, numerical Ramsey improvement, or graph existence
  or nonexistence conclusion is supplied.
