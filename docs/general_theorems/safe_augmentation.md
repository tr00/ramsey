# Safe augmentation below a Ramsey edge extremum

Integration status (2026-10-15): every claim below is independently accepted
on its stated premises. The author-stage “ready” labels are preserved to
keep the exact reviewed proof text unchanged. See the
[independent review](review_safe_augmentation_20261015_transversal.md)
and [integration manifest](integration_manifest.json).

Date: 2026-10-15. Author: `augmentation_author`.

This parameterizes the safe-addition argument in
[degree-18 clique budgets and augmentation](../../research/n43/d18/cliques_augmentation.md),
section 2. It is mathematical work only: no graph enumeration, solver,
installation, download, or literature search was performed. No novelty claim
is made. The statements below are ready for independent review, rather than
accepted or formally certified results.

## Setting and the actual extremal parameter

All graphs are finite, simple, and on a fixed labeled vertex set of size `n`.
For integers `r>=3`, `s>=2`, let `C(n;r,s)` be the graphs containing neither
a clique `K_r` nor an independent set `I_s`. Assume this class is nonempty.
Define its actual maximum edge count by

```text
M(n;r,s) = max {e(H): H in C(n;r,s)}.
```

Fix `G in C(n;r,s)` and put `q=M(n;r,s)-e(G)>=0`. Write `D` for its missing
edges. An edge `uv in D` is *individually safe* when `G+uv` contains no `K_r`.
Let `T` be the set of these edges and `S=(V(G),T)` their graph. Adding edges
cannot create an independent set, so safety is equivalently
`G+uv in C(n;r,s)`. All assertions concern additions to this fixed `G`.

An independently justified integer upper bound `U>=M(n;r,s)` can replace
`M` in all statements with deficit `q_U=U-e(G)`. This is useful when only
an upper bound is available. An arbitrary reference edge count, or an
uncertified conjectural upper bound, cannot replace `M`.

<a id="claim-safe-augmentation-01"></a>
## 1. Single-edge obstruction and the deficit budget

Claim ID: `docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-01`

Kind: local-deduction. Review state: accepted.

Scope: all `n,r,s,G` in the setting; every missing edge `uv` and every
subset `F` of missing edges. Dependencies: definitions above only.

Conclusion: `uv` is safe exactly when `G[N_G(u) intersect N_G(v)]` has no
`K_(r-2)`. Every feasible addition set `F`, meaning `G+F in C(n;r,s)`,
has `|F|<=q`. Consequently every `(q+1)`-element subset of missing edges,
if there is one, creates a `K_r` when added. When `q=0`, `T` is empty.

Proof: A new `K_r` created by a single edge must contain that edge, and its
other `r-2` vertices form a clique in the original common neighborhood.
Conversely such a clique extends to a `K_r` after adding `uv`. Feasibility
of `F` gives `e(G)+|F|<=M`, proving the budget. Adding edges preserves the
absence of `I_s`, so any violation after exceeding the budget is a `K_r`.
For `q=0`, a safe edge would violate the budget. The same argument uses
`e(G)+|F|<=M<=U` for the upper-bound version.

Search use: propagate. Reviews: [review](review_safe_augmentation_20261015_transversal.md).

<a id="claim-safe-augmentation-02"></a>
## 2. One below the maximum: a bounded star forest

Claim ID: `docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-02`

Kind: local-deduction. Review state: accepted.

Scope: the setting with `e(G)=M(n;r,s)-1`; equally, an established upper
bound `U` and `e(G)=U-1`. Dependencies: claim 01.

Conclusion: The individually safe-edge graph `S` is a star forest, and
`|T|=e(S)<=r-1`. Isolated vertices are unrestricted. These are necessary
patterns, with no assertion that every permitted star forest is realized.

Proof: Any two distinct safe edges `f,g` jointly create a `K_r` by the
deficit budget. This clique contains both new edges: a clique containing
only one would contradict that edge's individual safety. There are two
endpoint patterns, exhausting all pairs of distinct edges.

1. For incident edges `uv,uw`, the pair witness contains `u,v,w`, and
   therefore `vw` is an edge of the original `G`.
2. For disjoint edges `uv,wz`, the pair witness contains all four endpoints,
   so all four edges between `{u,v}` and `{w,z}` belong to the original `G`.
   If `r=3`, such a pair is impossible because its witness would need four
   vertices; the conditional implication is still valid.

The first rule forbids a triangle in `S`. The second rule forbids a path of
three edges on four distinct vertices in `S`: its first and last edges
would force its middle edge to be an edge of `G`, whereas every edge of
`S` is missing from `G`. The path need not be induced.

For completeness these two prohibitions force every nontrivial connected
component to be a star. A component with maximum degree one is a single
edge. Otherwise choose a vertex `c` with two distinct neighbors `a,b` in
`S`. No neighbor of `c` has another neighbor: a neighbor `x` with a second
neighbor `z` would either form a triangle (if `z` is adjacent to `c`) or
give the three-edge path `z,x,c,y` for another neighbor `y` of `c`.
Thus all neighbors of `c` have degree one and connectedness excludes any
remaining vertices of that component.

In each component with at least two edges, choose all its leaves. They
form a clique in `G` by the incident-edge rule, and their number is the
number of edges of the component. In a single-edge component choose one
endpoint. Any two chosen vertices from distinct components are adjacent
in `G`: choose an incident `S` edge at each vertex and apply the disjoint
edge rule. Hence all chosen vertices form a clique in `G` of size exactly
`e(S)`. Since `G` has no `K_r`, `e(S)<=r-1`.

Search use: propagate. Reviews: [review](review_safe_augmentation_20261015_transversal.md).

<a id="claim-safe-augmentation-03"></a>
## 3. The precise generation split at deficit one

Claim ID: `docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-03`

Kind: local-deduction. Review state: accepted.

Scope: `G in C(n;r,s)` with `e(G)=M-1`.
Dependencies: claims 01 and 02.

Conclusion: There is a complete, disjoint property split into `T=empty`
and `T!=empty`. The first case is already `K_r`-saturated, meaning every
missing-edge addition creates a `K_r`. In the second case every safe edge
produces an `M`-edge graph in the class, with at most `r-1` choices. Every
graph in the second case is obtained by deleting an edge from an extremal
graph. The extremal parents can overlap; their deletion families do not
constitute a disjoint partition.

Proof: The two cases exhaust the possible `T`. If it is nonempty then
`G+f` belongs to the class and has `M` edges for each `f in T`. Conversely,
deleting any edge from an `M`-edge graph, **provided the resulting graph
still has no `I_s`**, gives such a `G`: readding that edge is safe. Edge
deletion can create `I_s`, so this explicit filter is necessary. The
number of safe choices is given by claim 02.

This does not show that the saturated case is empty. For the upper-bound
version at `U-1`, a safe edge implies `M=U`; if `U` is not attained, every
graph at `U-1` in the class is saturated. In particular an upper bound
alone never supplies a catalogue of extremal parents.

Search use: branch. Reviews: [review](review_safe_augmentation_20261015_transversal.md).

<a id="claim-safe-augmentation-04"></a>
## 4. Higher deficit: the exact conflict hypergraph

Claim ID: `docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-04`

Kind: local-deduction. Review state: accepted.

Scope: the setting with arbitrary `q>=1`, including every `r`-vertex subset
of `V(G)`; no restriction to a selected family of clique candidates.
Dependencies: claim 01.

Conclusion: There is a conflict hypergraph `H_G` on vertex set `T` such
that `F subset T` is feasible exactly when it is an independent vertex
set of `H_G`. Its independence number is at most `q`. Every hyperedge has
size between `2` and `min(q+1,binom(r,2))`. A feasible `(q+1)`-set cannot
exist, but neither the pair rules nor the star-forest conclusion of claim
02 is asserted for `q>=2`.

Definition and proof: For each `r`-set `W`, let

```text
D_G(W) = binom(W,2) minus E(G).
```

This set is nonempty because `G` has no `K_r`. Keep precisely those sets
with `D_G(W) subset T`, and take their distinct inclusion-minimal members
as the hyperedges of `H_G`. Empty collections and repeated missing-edge
sets cause no ambiguity. No retained set is a singleton, since its edge
would then fail the defining safety test.

For `F subset T`, a new `K_r` in `G+F` occurs exactly when there is an
`r`-set `W` with `D_G(W) subset F`. Such a set contains an inclusion-minimal
retained set, and conversely a retained minimal set certifies a `K_r` if
all its edges are added. This proves the claimed equivalence, using also
that adding edges cannot create `I_s`. Claim 01 then gives `alpha(H_G)<=q`.

If `L` is a hyperedge, every proper subset is independent in `H_G` by its
minimality and hence feasible. Removing one edge gives a feasible set of
size `|L|-1`, so `|L|-1<=q`. Also `L=D_G(W)` for some `r`-set, which gives
`|L|<=binom(r,2)`. Combined with the singleton exclusion this proves both
rank bounds. With `U` replacing `M`, the same reasoning yields independence
number at most `q_U` and hyperedge size at most `q_U+1`.

At `q=1` every pair of distinct elements of `T` contains a conflict, so
the hypergraph is the complete graph on `T` (including the empty or
one-vertex cases). Its conflict witnesses recover the endpoint rules
in claim 02. At higher deficit, missing pair conflicts may be replaced
by larger conflicts, so the deficit-one geometric proof cannot simply
be transferred.

Every feasible addition set consists of initially safe edges: if
`G+F` is feasible then `G+f` is a subgraph of it for each `f in F`,
and also cannot contain `I_s` because it is obtained by adding an edge to
`G`. Thus the fixed initial vertex set `T` loses no feasible augmentation.
Sequentially feasible additions are likewise covered by their final
set. There is no assumption that initial safety alone permits all edges
of `F` to be added together.

Search use: propagate; branch when used to enumerate all independent
sets under complete `r`-set coverage. Reviews: [review](review_safe_augmentation_20261015_transversal.md).

<a id="claim-safe-augmentation-05"></a>
## 5. Exact degree-18 specialization and its limits

Claim ID: `docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-05`

Kind: local-deduction. Review state: accepted.

Scope: every 18-vertex `A` with neither `K4` nor `I5`, conditional on the
published extremal upper bound `e(A)<=85`. For a degree-18 pivot in an
order-43 `(5,5)`-free candidate this applies to `A=N(v)`; no degree-excess,
cross-column, or root-selection hypothesis is needed.

Dependencies: claims 01–04; the upper bound 85 recorded in
[theory phase 1](../theory_phase_1.md), section containing the interval
`50<=a<=85`, and [reduction index](../../research/n43/reductions.md), sections 8
and 15. Those notes attribute the census extrema to Angeltveit–McKay,
*R(5,5)<=46*, arXiv:2409.15709v2, Appendix A, Table 1. The external table
has not been independently rechecked in this task.

Conclusion: At `a=e(A)=85`, every missing edge is unsafe. At `a=84`, safe
missing edges form a star forest with at most three edges. Its nonempty
possibilities, after discarding isolated vertices, are exactly the
following permitted patterns:

```text
K2; P3; K1,3; 2K2; P3 disjoint union K2; 3K2.
```

These are necessary patterns, rather than six existence claims. Every
unsaturated `84`-edge `A` has one to three safe augmentations to a
`85`-edge `(4,5)`-free graph. The saturated `84`-edge alternatives remain
in any complete generation scheme. For `q_85=85-a>=1`, the exact conflict
hypergraph has independence number at most `q_85` and hyperedge sizes
`2..min(q_85+1,6)`.

Proof: Substitute `n=18,r=4,s=5,U=85` in the preceding claims. The star
forest list follows by partitioning one, two, or three edges among stars.
The clique obstruction for a single missing edge reduces to an edge
in its common `A` neighborhood, since `r-2=2`. The higher-deficit rank
uses `binom(4,2)=6`.

The known identity `x=136+2q_85+E_A` places `a=84` in the `q_85=1`
degree-18 slices beginning at `x=138`, regardless of `E_A`. It does not
restrict this theorem to a small frontier band. An antineighborhood
`B=M(v)` is `(5,4)`-free and cannot inherit this `(4,5,18)` census bound
or the three-edge conclusion. `A` may contain `I4`; the proof prohibits
only `I5` there. No order-43 branch is closed by these statements.

Search use: propagate; branch for the saturated/augmentable split only
when both alternatives are retained. Reviews: [review](review_safe_augmentation_20261015_transversal.md).

## Provenance, self-check, and handoff

Source revision at start: `b12925f7a96d24e18d06b0237930a32e30660ca2`.
The exact input SHA-256 values read for this derivation were:

```text
4cb5c4bd34d7d45a3c42783fdf091ac3aae0acafcc6f6fd6203f83cf9d366b2c  research/n43/d18/cliques_augmentation.md
0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54  research/n43/d18/frontier_band.md
51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2  docs/workflow.md
```

Author self-check: The two pair endpoint cases exhaust the possibilities;
each clique witness must use both safe additions. The forbidden path is
a subgraph condition, not an induced-path condition. The leaf clique has
exactly one vertex per safe edge even for single-edge components. The
conflict construction considers every `r`-set and takes inclusion-minimal
missing-edge sets, making feasibility an equivalence. The rank bound
uses the feasible proper subsets of a minimal conflict. Deleting an edge
from a parent requires a fresh independent-set check. Saturation does not
imply extremality, and a maximal feasible augmentation may have fewer than
`q` edges. These checks are not an independent review.

No empirical claim, catalogue completeness assertion, novelty assertion,
or certified Ramsey nonexistence result is made. Future enumeration must
retain all saturated cases and all conflict-compatible choices, with its
own coverage evidence. The coordinator owns shared-index/report updates;
this author has edited only this theorem file.
