# R(5,5) Search Results and Reduction Index

Last updated: 2026-10-22

This is the operational index for a future certified order-43 search. It
collects:

- the current case tree;
- exact pruning predicates and their preconditions;
- safe symmetry reductions;
- useful global identities;
- open branches and rejected shortcuts;
- implementation and certification requirements.

Research belongs in one authoritative topic file under `research/`, including
global and mixed-scope topics. Existing mathematical notes in `docs/` remain
legacy sources pending migration. This index should state enough assumptions
to prevent a valid branch from being pruned accidentally.

## Status labels

- **[PUBLISHED]** Established in cited literature or a published complete
  census.
- **[PROVED-HERE]** Internally derived and independently audited, but not
  literature-checked for novelty.
- **[OPEN]** A target, conjecture, or incomplete reduction. Never use it to
  prune.
- **[REJECTED]** Tested and found false, unsupported, or too weak.
- **[DESIGN]** Proposed search/certification architecture rather than a
  mathematical theorem.

## 1. Global target

**[PUBLISHED]**

```text
43 <= R(5,5) <= 46.
```

The first decision problem is whether a graph `G` on 43 vertices can satisfy

```text
omega(G)<=4 and alpha(G)<=4.
```

- UNSAT at order 43 proves `R(5,5)=43`, using the established order-42
  construction.
- SAT supplies a directly checkable 43-vertex construction and moves the
  project to order 44.
- Do not attack 44 or 45 before deciding 43.
- Order-46 nonexistence is already proved.

## 2. Core notation

The [shared definitions and notation](../../docs/notation.md) set the repository
conventions and explain aliases in existing proof notes.

For a pivot vertex `v`, define:

```text
A = N_G(v)
B = V(G) - (A union {v})
d = |A|
b0 = |B| = 42-d
a = e(G[A])
b = e(G[B])
x = e_G(A,B)
```

### What is `x`?

`x` is the number of **cross edges between the pivot neighborhood and
antineighborhood**:

```text
x = |{uw in E(G) : u in A, w in B}|.
```

It is not a codegree, catalogue index, or SAT variable. In a cross-adjacency
matrix with rows indexed by `A` and columns by `B`, `x` is the number of ones.

For the degree-18 pivot branch:

```text
|A|=18, |B|=24.
```

If

```text
Delta_A = sum_(u in A) (d_G(u)-18),
```

then degree summation over `A` gives:

```text
x = 306 - 2a + Delta_A.
```

The published bound `a<=85` yields:

```text
x = 136 + 2(85-a) + Delta_A >= 136.
```

Thus `x=136` was the sharp equality frontier. Equality forces:

```text
a=85,
d_G(u)=18 for every u in A.
```

Update (2026-10-20): x136, x137 and x138 are excluded by the reviewed
[x136 closure](d18/x136/README.md), [x137 closure](d18/x137/frontier_closure.md)
and [two-profile x138 closure](d18/x138/README.md). Every degree18 root now
has `x>=139`; the forcing list above records an impossible profile. Earlier
[x136 closure consequences](d18/x136_closure_consequences.md) remain valid.

For navigable case folders, start at [research/n43/README.md](README.md) and
[the x136 r partition](d18/x136/README.md). The proof notes own exact statements and review status; this index summarizes
applicable predicates and links to those sources.

## 3. Current branching tree

The complete even-pivot scheme, up to complementation, chooses a root of
degree 18 or 20. An order-43 graph has an even-degree vertex; degrees are
18..24, and complementation maps 22 to 20 and 24 to 18.

In the degree-18 branch, choose a root maximizing e(G[N_G(v)]) among all
degree-18 vertices in the fixed orientation of G, as specified in the
[branch assumptions](d18/README.md). No tie-break or degree-20 refinement is
imposed.

- [d18](d18/README.md): x136 is excluded; x137..142 and x>=143 remain open.
- [d20](d20/README.md): the requested residual degree-20 branch has no
  degree-18 vertices, hence degrees 19..24. Giving d18 priority whenever
  either complementary orientation has a degree-18 vertex restricts the
  residual to 19..23. The [new routing proof](d20/residual_coverage.md#claim-d20-residual-routing)
  and [first deductions](d20/README.md#first-deductions-pending-independent-review)
  are ready for independent review; no executable pruning is enabled.
- [Minimum-degree normalization](#102-canonical-complement-selector) is an
  alternative scheme.

These schemes are alternatives, not one disjoint partition. A canonical
pivot requires an invariant tie rule or explicit coverage of every choice.
Global K5-saturation is not preserved by complementation; the
[saturated routing alternatives](d20/residual_coverage.md#claim-d20-saturation-routing)
retain this additional coverage obligation. Maximum neighborhood-edge
selection within a degree class is a separate root-choice hypothesis.

## 4. Universal pruning predicates

These apply to every hypothetical order-43 candidate.

### 4.1 Degree bounds

**[PUBLISHED]** Using `R(4,5)=25`:

```text
18 <= d_G(v) <= 24.
```

Precondition: `G` has no `K5` and no independent 5-set.

Search use: propagate degree cardinalities; reject a partial graph once a
lower or upper degree bound cannot be met.

### 4.2 Neighborhood types

**[PUBLISHED]**

```text
G[N(v)] is (4,5)-free.
G[B] is (5,4)-free.
complement G[B] is (4,5)-free.
```

Search use: attach published edge extrema and local Ramsey constraints to each
pivot.

### 4.3 Pair codegree bounds

**[PROVED-HERE from published Ramsey numbers]**

Let `c(u,w)=|N(u) intersect N(w)|`.

If `uw` is an edge:

```text
max(d(u),d(w))-18 <= c(u,w) <= 13.
```

If `uw` is a nonedge:

```text
max(d(u),d(w))-17
  <= c(u,w)
  <= d(u)+d(w)-28.
```

Search use: reject partial pair signatures whose attainable codegree interval
misses these bounds.

### 4.4 Small common-cell bounds

**[PROVED-HERE from published Ramsey numbers]**

- An edge has at most 13 common neighbors.
- A nonedge has at most 13 common nonneighbors.
- A triangle has at most 4 common neighbors.
- An independent triple has at most 4 common nonneighbors.
- A mixed adjacency/nonadjacency cell for two anchors has at most 17 vertices.

At equality, several cells become regular critical graphs:

- a 13-vertex `(3,5)` cell is 4-regular;
- a 17-vertex `(4,4)` cell is 8-regular.

Search use: fast cardinality propagation and equality-triggered templates.

### 4.5 Forced homogeneous 4-sets

**[PROVED-HERE]**

Every vertex lies in a `K4` and in an independent 4-set. Globally:

```text
#K4(G) >= 33,
#I4(G) >= 33.
```

Search use: justify the availability of `K4`/`I4` anchors. The global counts
are weak and should not be used as primary branching criteria.

## 5. Pivot-interface predicates

Fix `v`, `A=N(v)`, and `B=M(v)`. For `u in A` and `y in B`, define:

```text
R_u = N_B(u)       # row signature
C_y = N_A(y)       # column signature
```

### 5.1 Exact forbidden-rectangle criterion

**[PROVED-HERE]**

Once `G[A]` and `G[B]` are fixed, the interface is valid exactly when:

1. no clique `P in A` and clique `Q in B`, with `|P|+|Q|=5`, form an all-one
   rectangle `P x Q`;
2. no independent `P in A` and independent `Q in B`, with
   `|P|+|Q|=5`, form an all-zero rectangle.

Search use: this is the semantic foundation of incremental row/column
generation.

### 5.2 Single-row bounds

Let `s_u=d_A(u)` and `r_u=|R_u|`.

**[PROVED-HERE]**

```text
d-18 <= s_u <= 13,
17-s_u <= r_u <= min(17,23-s_u).
```

Boundary triggers:

- `r_u=17` makes `G[R_u]` a 17-vertex 8-regular `(4,4)` graph.
- `r_u=4` forces `s_u=13` and global degree 18.
- `s_u=13` makes `G[N_A(u)]` a 13-vertex 4-regular `(3,5)` graph.

### 5.3 Single-column bounds

Let `t_y=d_B(y)` and `c_y=|C_y|`.

**[PROVED-HERE]**

```text
b0-14 <= t_y <= 17,
max(d-17,18-t_y) <= c_y <= min(d-4,24-t_y).
```

Boundary trigger:

```text
c_y=d-17
```

makes `G[A-C_y]` a 17-vertex 8-regular `(4,4)` graph.

### 5.4 Pair and higher intersections

**[PROVED-HERE]**

For `u,z in A`:

- if `uz` is an edge, `|R_u intersect R_z|<=8`;
- if `uz` is a nonedge,
  `|B-(R_u union R_z)|<=13`;
- every row difference has size at most 17.

For a clique in `A`:

- an edge has at most 8 common cross-neighbors;
- a triangle has at most 3 common cross-neighbors.

For an independent set in `A`:

- an independent pair has at most 13 common cross-nonneighbors;
- an independent triple has at most 4;
- an independent 4-set has none.

Dual statements hold for columns.

### 5.5 Forced adjacency from signatures

**[PROVED-HERE]**

For columns `C_y,C_z`:

- a triangle in `C_y intersect C_z` forces `yz` to be a nonedge;
- an independent triple in `A-(C_y union C_z)` forces `yz` to be an edge;
- if both occur, the signature pair is impossible.

Search use: derive internal `B` edges directly from selected cross columns.

## 6. Four-bit anchor predicates

### 6.1 Independent-4 anchor in `A`

Fix `X=I4 in A`. Every `y in B` has a nonempty four-bit signature:

```text
S_y=C_y intersect X.
```

**[PROVED-HERE]** For every independent `Q in B`:

```text
|union_(y in Q) S_y| >= |Q|.
```

Exact signature-class bounds:

```text
|S|=1: class size <= 3
|S|=2: class size <= 8
|S|=3: class size <= 17
|S|=4: class size <= 24
```

Aggregate incidence bound:

```text
e(X,B) >= 2|B|-12.
```

Equality forces four singleton classes of size 3 and all remaining signatures
to have size 2.

### 6.2 Clique-4 anchor in `B`

Fix `Y=K4 in B`. Each `u in A` has a nonempty missing signature:

```text
T_u=Y-R_u.
```

**[PROVED-HERE]** Clique signatures satisfy the dual Hall condition, and:

```text
e(A,Y) <= 2|A|+12.
```

Equality forces four singleton missing-signature classes of size 3 and all
remaining missing signatures to have size 2.

### 6.3 Simultaneous equality

**[PROVED-HERE]**

If both anchor bounds are equalities, every row and column of the anchored
`4 x 4` block has degree 2. Therefore the block is:

```text
C8
```

or

```text
C4 disjoint union C4.
```

This is rigid but not contradictory.

## 7. Catalogue-free quadratic interface predicates

Let:

```text
d=|A|,
b0=|B|,
a=e(A),
b=e(B),
x=e(A,B),
z=d*b0-x.
```

**[PROVED-HERE]**

```text
x^2/b0 - 4x <= 64a,
x^2/d  - 3x <= 78b,
z^2/b0 - 3z <= 78(C(d,2)-a),
z^2/d  - 4z <= 64(C(b0,2)-b).
```

Preconditions: the pivot split and the pair-intersection predicates above.

Search use: cheap scalar rejection before canonicalization or SAT.

## 8. Degree-18 branch

The selected pivot maximizes a=e(G[A]) over all degree-18 vertices of G;
see the [branch assumptions](d18/README.md) for the finite-choice argument
and re-pivoting restrictions. Statements below quantified over every
degree-18 root keep that stronger scope.

### 8.1 Published internal-edge ranges

**[PUBLISHED]**

For `d=18`:

```text
50 <= a <= 85,
144 <= b <= 160.
```

The second interval follows by complementing the published 24-vertex
`(4,5)` edge interval 116 through 132.

### 8.2 Cross-edge corridor

**[PROVED-HERE]** For every degree-18 root, on the published edge premises:

```text
max(139,306-2a,432-2b) <= x <= min(279,414-2a,576-2b),
q=85-a, E_A=sum_A(d_G(u)-18), x=136+2q+E_A.
```

The [independent-row cuts](d18/independent_row_cuts.md) first give x<=280
without an edge census, then exclude both equality profiles; the final one
uses b>=144 and the all-vertex degree cap 24. The reviewed
[x136 frontier exclusion](d18/x136/frontier_exclusion_handoff.md),
[x137 closure](d18/x137/frontier_closure.md) and
[x138 closure](d18/x138/README.md) give x>=139.
Search use: propagate the interval and branch by x or (q,E_A).

### 8.3 The `x=136` frontier

**[PROVED-HERE; independently accepted]** The full x136 branch is excluded.
Its equality assumptions force a=85, all A vertices to have global degree18,
and 148<=b<=160 (b=148 would make G 18-regular).

Proof and exact hypotheses: [frontier exclusion](d18/x136/frontier_exclusion_handoff.md),
Claims01--04; [review](d18/x136/review_frontier_exclusion_handoff_20261019_main.md)
at SHA-256 `c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`.
Double domination, deletion caps, and the abstract transversal lower bound
contradict both possible low-degree profiles. Search use: terminate x136,
including r0. This does not close d18 or supply an unavoidable low-x root.

For historical anchor bounds and their census inputs, see
[frontier-band anchor defects](d18/frontier_band.md#independent-four-anchor-defects).
The [closure consequences](d18/x136_closure_consequences.md) record further
rootwise upgrades as separate review-pending claims.

#### Single-excess frontier x=137

**[PROVED-HERE; accepted independent mathematical reviews]** The full x137
branch is excluded. Thus `138<=x<=279` for every degree-18 root, and
`2q+E_A>=2`; in particular q=0 requires E_A>=2.

Proof: [single-excess frontier closure](d18/x137/frontier_closure.md), Claims 1--3,
reviewed at SHA-256 `ff597134e7aa96483ac3894a7bc639480e6490e33e846ac5f5d1716153209ceb` by
[AnchorAudit](d18/x137/review_frontier_closure_20261019_anchor_audit.md) (Claims 1--2)
and [CapacityAudit](d18/x137/review_frontier_closure_20261019_capacity_audit.md) (Claim 3).
Effective-weight-eight anchors double-dominate A; three disjoint anchors
force the excess vertex to see a triangle in a K(2,2,2) remainder.
Deletion caps force at most one low-effective-weight vertex. All I4 then
lie in a set U with at most117 incidences into B, contradicting the
abstract transversal bound's requirement of at least120.

Scope: actual order43 K5/I5-free graph, arbitrary chosen degree18 root,
x=137, accepted effective-anchor inputs and recorded literature bounds,
including published (4,4,11/12) upper caps36/40. Search use: terminate
x137 entirely and propagate x>=138 with x136 closure. No root-unavoidability,
novelty, formal certificate, or order43 exclusion is claimed. See the
[integration report](../reports/2026-10-19-x137-frontier-closure.md).

#### Two-profile frontier x=138

**[PROVED-HERE; accepted independent mathematical reviews]** Both x138
profiles are excluded: q0,E_A=2 by [effective-weight theory](d18/tau/q0_effective_reduction.md)
and q1,E_A=0 by [zero-excess anchors](d18/tau/q1_anchor_reduction.md).
The exact identity2=2q+E_A makes this coverage exhaustive. The two q0
reviews cover Claims1..4 and5..10 at reviewed SHA-256
`491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8`;
the q1 review covers all five claims at
`aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`.
All review links and provenance are in the [report](../reports/2026-10-19-d18c-tau-frontier.md).

Both profiles force abstract tau>=5. Projecting columns to possible I4
support gives capacity118<120 in the one-low cases. The q0 equality
cores require additional exact moment and common-anchor obstructions;
neither valid isolated cores nor signature counts alone are ruled out.
The reviewed [support theorem](d18/tau/transversal_support.md) records the
general mechanism and regular-graph consequences.

Search use: terminate all x138 and, with x136/x137, propagate
`139<=x<=279`, `2q+E_A>=3`, q0=>E_A>=3, q1=>E_A>=1,
and E_A=0=>q>=2,x>=140. No low-x-root unavoidability, full connected-d18
exclusion, order43 proof, novelty claim or new formal certificate.

### 8.4 Four-vertex transversal bound

**[PROVED-HERE on the published 15-vertex census]** If F=complement A,
|F|=18, alpha(F)<=3 and e(F)<=70, then tau_K4(F)>=4. Every actual
column meets each K4(F), so it has size at least four. This covers q<=2.
Proof: [transversal four](d18/transversal_four.md). Search use: propagate.

### 8.5 Attempted strengthening to five

The [original isolated-neighborhood attempt](d18/x136/transversal_five_attempt.md)
left four 49/50-edge core families unresolved and contains a withdrawn
common-nonneighbor shortcut. Keep it as failed-approach history.

The later [full-interface proof](d18/x136/five_column_compatibility.md)
**does** establish tau>=5 at x136; it does not establish the same statement
for every isolated 85-edge neighborhood. The full x136 branch is now closed.
Do not apply this equality-interface conclusion at higher x.

### 8.6 Frontier band and anchor defects

**[PROVED-HERE]** For x=136+k, q=85-a and nonnegative A-excess E_A:

```text
k=2q+E_A, 0<=q<=floor(k/2),
E_B=2b-296+k,
max(144,ceil((296-k)/2))<=b<=160,
e(G)=239+b+k-q.
```

Each nonzero vertex excess is at most six. The
[frontier band](d18/frontier_band.md) gives the exact profiles, independent-four
anchor defects, and column floor four for q<=2. Its historical k=0 profile
is excluded; the separate closure-consequence claims retain their own status.
Search use: degree-excess branching and actual-anchor propagation.

### 8.7 Joint small-column predicates

**[PROVED-HERE]** With r/s counting size-four/five columns, nonadjacent
B pairs have column union at least ten. Size-four columns form a clique
joined to size-five columns; intersecting size-five columns force an edge.
Every A vertex occurs in at most three such columns, so 4r+5s<=54.
If every column has size>=4 and H=sum_(c_y>=6)(c_y-6), then
2r+s=8-k+H. Exact overlap and induced-eight-cell restrictions are in
[small columns](d18/x136/small_columns.md).

Historical x136 closures:

| Slice | Proof and review at source |
| --- | --- |
| r4 | [Four-column exclusion](d18/x136/r4/exclusion.md) |
| r3 | [Pairwise small refinements](d18/x136/pairwise_small_refinements.md) |
| r2, every former s4..7 child | [Low-excess columns](d18/x136/r2/low_excess_columns.md) and [independent triples](d18/x136/r2/independent_triples.md) |
| All r>=1 | [Five-column compatibility](d18/x136/five_column_compatibility.md) |
| All r, including r0 | [Full-frontier exclusion](d18/x136/frontier_exclusion_handoff.md) |

These proofs retain their equality assumptions and census premises. Apply
individual non-equality predicates only where their stated hypotheses hold;
the x136 closures do not terminate any higher-x branch.

### 8.8 Four-clique degree budget and equality pattern

**[PROVED-HERE]** Every K4 Q in B24 satisfies sum_Q d_B<=60 and
sum_Q |C_y|>=12+sum_Q(d_G(y)-18). Equality forces each Q vertex to have
B-degree15 and a specific pair/triple signature distribution; it is not a
contradiction. [Clique budgets](d18/cliques_augmentation.md) and
[pairwise frontier Claim04](d18/pairwise_frontier_refinements.md#claim-pairwise-frontier-04)
give the stronger actual-mask capacities. Search use: degree/signature propagation.

### 8.9 Safe augmentation at a=84

**[PROVED-HERE]** At a84, individually safe missing edges form a star
forest of at most three edges; any two additions jointly create K4.
An 84-edge neighborhood may already be saturated. This applies at q1
regardless of x or excess; it does not assert an ambient extension after
addition. [Clique augmentation](d18/cliques_augmentation.md) owns the proof;
[the actual-column bridge](d18/pairwise_refinements.md#claim-pairwise-safe-columns)
further restricts safe edges using size-four column member degrees.

### 8.10 Neighborhood bounds transferred between pivots

**[PROVED-HERE with a root-choice hypothesis]** Choose v maximizing
neighborhood edges among degree-18 roots. Every other such neighborhood has
at most a edges; the exact interface inequalities are in
[clique augmentation](d18/cliques_augmentation.md).
Do not impose these bounds on an arbitrary root. A unique canonical
maximizer requires a separate invariant tie/coverage argument.

### 8.11 Degree-18 root classes and conditional coverage

**[PROVED-HERE on published edge extrema]** With W=sum_z(d(z)-18),
e(G)=387+W/2 and W even, a degree-18 root has
x=136+2q+E and b=148+W/2-q-E. The
[pivot classes](d18/pivot_classes.md) give complete numerical profiles,
weighted family counts, and conditional adjacent-root overlap bounds.

No profile's numerical feasibility asserts realizability. Small W is a
hypothesis, not a property of every d18 candidate. Dense-pair and low-overlap
conclusions need not concern the same edge. Search use: scoped propagation
and branching with complete maps/completions.

### 8.12 Conditional upper bounds on W and E

**[PROVED-HERE on published edge extrema]** The
[excess bounds](d18/excess_bounds.md) combine cut capacities, excess sequences,
and neighborhood counts to bound W or select a root with small E_v for
explicit h=|{z:d_G(z)>18}| and q_v=85-e(N(v)) hypotheses.

No global small-h/small-W bound follows. Forcing q=0 need not force E=0
or the excluded x136 profile. Minimum-E selection does not imply minimum-q
selection. Search use: conditional scalar rejection, family counts and root
selection. Historical arithmetic audit:
[early excess report](../reports/early_session_reports.md#degree18-excess-bounds).

### 8.13 Reviewed x137..142 profiles and above-frontier deductions

**[PROVED-HERE; independently reviewed]** See the
[transfer summary](d18/transfer_summary.md) and exact reviews at each proof.

| Result | Scope and use |
| --- | --- |
| [Four-column stability](d18/four_column_stability.md) | Excludes r4 at x137; higher-x conclusions require their exact q and exceptional-column hypotheses. |
| [Effective x137 anchor](d18/x137/effective_anchor.md) | Excludes all r>=1 at x137; superseded by the [full x137 closure](d18/x137/frontier_closure.md). |
| [Actual size-three theorem](d18/x142/q3/three_columns.md) | q3 and a size-three column imply E_A>=14, hence x>=156; every x142 column therefore has size>=4. |
| [Transfer bounds](d18/transfer_bounds.md) | Exact profiles, adjacent-pivot overlap bounds and pair/triple compatibility. |
| [Exact-census deletion transfer](d18/deletion_degree_transfer.json) | Column floors >=4 for q<=2, >=3 for q3..7, >=2 for q8; q>=9 has only the nonempty floor from this argument. |

The full x137 and x138 branches are now excluded. The remaining results are
conditional propagation or subcase exclusions; no complete x139..142 branch, residual
x>=143 branch, or unconditional x<=142 bound is established.

### 8.14 Reviewed pairwise pivot and excess refinements

**[PROVED-HERE; independently reviewed]** The
[pivot pairings](d18/pairwise_pivot_refinements.md) strengthen prescribed-family
excess lower bounds, dense-root counts, and minimum-q pivot selection.
Their h/W tables and exact extremal (q,E,x) profiles remain in that proof.
Search use: conditional degree-count propagation and root-family branching.
A low-overlap edge and a dense edge are not automatically the same edge.

### 8.15 Simultaneous dense endpoints and overlap ten

**[PROVED-HERE; independently reviewed]** Every family of at least thirteen
degree-18 roots contains a same-family edge of codegree<=10, without an edge
census. [Dense-pivot coverage](d18/dense_pivot_coverage.md) applies this to
specific h/W/deficit families, so both endpoint predicates hold on one edge.
[The later twelve-root theorem](d18/sos_pivot_selection.md) improves the
family threshold. Retain all allowed overlaps, maps, and completions;
these unavoidable families are not a disjoint partition or a global h/W bound.

### 8.16 Overlapping actual cells and dispersed attachment obligations

**[PROVED-HERE; independently reviewed]** The
[overlapping-cell index](d18/overlapping_cells.md) links thirteen claims about
actual cell types, mixed intersections, signed pair capacities, witness
obligation graphs, and conditional C5 rigidity across all x/q/E.
Search use: local propagation or rejection after checking actual witnesses.
No universal occurrence, branch closure, or sharper cross-count bound follows;
certificate formats remain design.

### 8.17 Fixed-B extension capacity and unavoidable independent-root cores

**[PROVED-HERE; independently reviewed]**

- [Fixed-B extensions](d18/fixed_b_extensions.md): row multiplicities,
  exchange-ball occupancy, witnessed domain rejection and signed capacity
  certificates. Full B-family completeness is an external premise; complete
  generation, orbit handling and exhaustion remain design.
- [Independent-root coverage](d18/obstruction_coverage.md): a prescribed
  family of >=25 degree-18 roots has a nonedge of overlap1..6 or an exact
  exceptional independent-four core. For q<=2 the pair range is4..6.
  Neither alternative is excluded or universally supplied.
- [Large-row attachments](d18/large_row_extensions.md): exact critical-core,
  common-eight-cell and attachment restrictions with all ambient clauses.

Reviews and premise limits: [extension report](../reports/2026-10-17-d18-extension-research.md).
Further current threads are indexed in [d18](d18/README.md), including K1's
open double-core completion and the reviewed interior/connectivity transfers.

## 10. Symmetry reductions

### 10.1 Global action

**[PROVED-HERE]**

The action is:

```text
S_43 x C2
```

where `C2` is complementation. Complementation acts freely on isomorphism
classes because `C(43,2)=903` is odd, so no order-43 graph is self-complementary.

### 10.2 Canonical complement selector

Let:

```text
D=(d_1<=...<=d_43),
D^c=(42-d_43,...,42-d_1).
```

Safe WLOG selector:

```text
D <lex D^c.
```

The first nonzero entry of `(n18-n24,n19-n23,n20-n22)` must be positive;
they cannot all vanish by degree-sum parity. This yields:

- minimum 18 with `n18>0` and that first-nonzero-entry rule;
- minimum 19 with `n18=n24=0`, `n19>0`, and the first nonzero entry of
  `(n19-n23,n20-n22)` positive;
- minimum 20 with only degrees 20, 21, 22 and `n20>n22`.

Outer paired degree counts may tie. Do not impose n18>n24 on every
minimum-18 case, or n19>n23 on every minimum-19 case.

### 10.3 Rooted residual action

**[PROVED-HERE]** With root v and labeled A/B fixed, use
Aut(A) x Aut(B) on the **whole cross matrix**. Rowwise or columnwise
minimization under independent automorphisms is unsafe.

The [column-multiset alternative](d18/symmetry_reduction.md) quotients by
S_24 and Aut(A), then completes B under the full multiset stabilizer.
Its sorted-prefix and lex comparisons preserve coverage only under the stated
assigned-domain/full-path hypotheses. Generator-only comparisons do not imply
global lex minimality. Root selectors, permutations, omissions and completion
coverage need independent checking; the review certifies no implementation.

### 10.4 Canonical-parent generation

**[DESIGN]**

Vertex deletion is compatible with the hereditary Ramsey property, but a
rooted generator must use an isomorphism-equivariant canonical parent.
Deleting another vertex can change which pivot is minimum-degree. Either:

- retain rooted canonical labels throughout; or
- unroot and recanonicalize at every accepted extension.

The parent-map and orbit-coverage checker are part of the proof obligation.

### 10.5 Reviewed pair separation and duplicate-stabilizer bounds

**[PROVED-HERE; independently reviewed]** Every candidate pair has >=8
distinguishing vertices; a nonidentity automorphism moves >=10 vertices.
G43 and K5/I4-free B24 are prime; no primeness conclusion applies to A.

The [disjoint-swap theorem](../../docs/general_theorems/disjoint_swap_stabilizers.md)
gives a partition subspace with pinned components. For p duplicate-column
pairs, each free component has >=5 pairs, so the completed stabilizer L has
|L|<=2^floor(p/5). The candidate action K_M=(C2)^p has completion orbits
of size >=2^(p-floor(p/5)); L fixes one completion and cannot replace K_M.

[Symmetry structure](symmetry_structure.md) records stronger conditional
frontier bounds, forced-edge applicability through x139, and the unresolved
six-plus-six stabilizer case. Search use: exact completed-state symmetry
accounting; partial modules may later break, and orbit sizes are not measured
runtime gains. Equality-frontier statements are now historical consequences
of an excluded branch.

### 10.6 Reviewed exact two-root gluing quotient

**[PROVED-HERE; independently reviewed after repair]** For ordered adjacent
roots and compatible colored overlap S, map classes are double cosets
J_v \ Aut(S) / J_u. The residual group is the side restriction fiber product
times S_|D| only when D is uniform and unstructured.

[Two-root gluing](../../docs/general_theorems/symmetry_pair_gluing.md) gives the
exact action, order formula, original rejection, and revised acceptance.
Fixed nonlocal relations require the actual enriched-state stabilizer.
Search use: symmetry with complete input/map/orbit coverage; no new universal
root family, unrooted uniqueness, reversal or complement selector is supplied.

## 11. Global counting identities

These are valid pruning/LP inputs but currently do not close a branch alone.

### 11.1 Goodman identity

Define:

```text
delta_v=d(v)-21,
Delta=sum delta_v,
V=sum delta_v^2.
```

Then:

```text
2e(G)=903+Delta,
triangles(G)+independent_triples(G)=(5719+V)/2.
```

Also:

```text
6T >= 5418+13Delta+3V,
6I >= 5418-13Delta+3V,
T>=803,
I>=803.
```

### 11.2 Rooted homogeneous-triple identity

For:

```text
h_v=e(G[N(v)]) + e(complement G[M(v)]),
s_v=sum_(u adjacent v)(d(u)-21),
```

the exact identity is:

```text
2h_v
  = 399-Delta + delta_v + delta_v^2 + 2s_v.
```

The associated degree-energy identity is:

```text
2P=399Delta-Delta^2+43V+3C-2Q,
```

where:

```text
P=sum delta_v h_v,
C=sum delta_v^3,
Q=sum_(uv edge)(delta_u-delta_v)^2.
```

and:

```text
0<=Q<=43V-Delta^2.
```

Search use: degree-class LP or assortativity pruning once sharper local
`h_v` ranges are available.

## 12. Regular and equality subbranches

### 12.1 Strongly regular branch

**[PROVED-HERE]**

No order-43 strongly regular graph satisfies the `(5,5)` Ramsey constraints.
Parameter integrality, codegree bounds, eigenvalue discriminants, and trace
conditions exclude all possible degrees 18, 20, 22, 24.

### 12.2 Do not infer strong regularity

**[REJECTED]**

Regularity does not follow from current results, and regularity does not
currently force constant codegrees. Do not prune a regular branch merely
because all strongly regular cases are impossible.

### 12.3 The 18-regular corner

If `x=136` and `b=148`, `G` is 18-regular. Published edge ranges and local
arguments give:

```text
81 <= e(G[N(v)]) <= 85,
2 <= edge codegree <= 13,
3 <= nonedge codegree <= 8.
```

At the selected `x=136` root, the transversal theorem strengthens every cross
column to size at least 5, by the reviewed full-interface argument in
Section8.7. It does not imply that every nonedge of the whole graph has
codegree at least 5 at every other root.

## 13. Rejected or non-pruning ideas

### 13.1 Known 42-vertex graphs

**[REJECTED as proof]**

There are 656 known order-42 examples (including complements), and none is
known to extend to order 43. Their completeness is unproved. Nonextendibility
of this list does not prove `R(5,5)=43`.

### 13.2 Fractional perfect anchor designs

**[REJECTED]**

Local Ramsey constraints do not guarantee a fractional perfect matching in
the `I4` or `K4` anchor hypergraphs. Explicit join constructions provide a
space barrier.

### 13.3 Anchor equality as a contradiction

**[REJECTED]**

Simultaneous anchor equality is locally feasible and merely forces a
2-regular `4 x 4` block.

### 13.4 Generic spectral bounds

**[REJECTED as primary route]**

Hoffman, ordinary interlacing, fourth moments, and scalar codegree variance
leave broad feasible ranges. They remain auxiliary checks only.

### 13.5 Transversal bound five

The [original failed attempt](d18/x136/transversal_five_attempt.md) was
superseded at the **full x136 interface** by the reviewed
[five-column proof](d18/x136/five_column_compatibility.md), then full closure.
The isolated-neighborhood strengthening remains unproved; do not transfer
|C_y|>=5 outside the accepted interface hypotheses.

## 14. SAT and generator material

### 14.1 Direct encoding

**[DESIGN]**

Use one Boolean variable per edge. For order 43:

```text
variables = C(43,2) = 903,
clauses   = 2*C(43,5) = 1,925,196,
clause length = 10.
```

For each 5-set:

- one clause forbids all ten edges;
- one clause forbids all ten nonedges.

This encoding is the preferred semantic foundation because it is simple to
regenerate and independently check.

### 14.2 Structured generation

**[DESIGN]** Generate compatible partial neighborhoods/interfaces,
propagate exact predicates, canonicalize with checked coverage, and send
unresolved cubes to proof-logging SAT/PB completion. Hereditary graph
generation and a canonicalizer alone do not prove exhaustive rooted coverage.
The existing [engine](../../docs/engine.md) solves one fixed B record; catalogue
iteration, symmetry coverage and proof acceptance remain future work.

### 14.3 Candidate versus cube handling

The intended process is not:

```text
generate all full graphs -> filter -> SAT
```

It is:

```text
extend a partial graph
  -> propagate exact predicates immediately
  -> canonicalize the partial state
  -> stop at a useful cutoff
  -> send the unresolved cube to SAT
```

### 14.4 Proof obligations

For UNSAT:

- prove every mathematical branch is covered;
- prove every canonical/orbit omission is symmetry-equivalent to a retained
  case;
- prove cubes cover the base formula;
- retain a checkable proof for every cube.

For SAT:

- extract the adjacency matrix;
- exhaustively verify all 5-subsets with an independent checker.

## 15. Published census dependencies

Methodology review: `docs/upper_bound_method_review.md` reads
Angeltveit-McKay arXiv:2409.15709v2. Its filtering uses linear programming
and exact counting plus an unavoidable pointed-pair theorem (Theorem 5.4),
not SDP or flag algebras. Transferring that architecture to order 43 needs
new branch-specific coverage results; the order-46 thresholds cannot simply
be imported.

Current reductions use these published finite facts:

- `R(4,5)=25`;
- `(4,5,18)` edge interval 50 through 85;
- the `(4,5,17)` upper edge extremum 79 for the root-overlap classification;
- `(4,5,14)` edge interval 22 through 60, with its upper endpoint used
  by the revised independent-four anchor proof;
- `(4,5,24)` edge interval 116 through 132;
- every 15-vertex `(4,4)` graph has 50 through 55 edges;
- every 14-vertex `(4,4)` graph has 41 through 50 edges.

The `(4,5)` intervals are in Angeltveit-McKay, arXiv:2409.15709v2,
Appendix A, Table 1. The `(4,4)` intervals are in McKay-Radziszowski
1992, Table 1, p. 16. The [README table](../../README.md#state-of-the-art)
also records the published `(4,4)` intervals at orders 11, 12, 13, 16
and 17, now available as named Lean premises. Their addition does not
replace the separately proved, census-free sufficient caps or retroactively
change the premises of historical proofs.

Any final certificate must identify which of these are theorem-prover checked,
which rely on published exhaustive computation, and what is trusted.

### Scoped Lean proofs

The [Lean coverage catalogue](../../lean/Ramsey/theorems/README.md#proved-reduction-index-basics)
records 33 proved public reduction theorems for the basic pivot counting,
pair codegree intervals, two-anchor cells, row/column inequalities, exact
forbidden-rectangle criterion, and degree-18 deficit/excess and equality budgets.
Source hashes and an axiom audit of all 33 theorems plus three shared helpers
were recorded in the removed verification report, preserved in Git history.
Those declarations contain no `sorryAx` and retain explicit published premises.
This is partial formal coverage of this index, not a formal proof of the later
small-column exclusions, exhaustive search coverage, or order-43 nonexistence.

## 16. Update template

For new results, use [the topic-file workflow](../../docs/workflow.md).
Keep metadata and summary, detailed statements and proofs, inline review, and
a bottom changelog in one authoritative topic file under `research/`. Add only
a short index entry here with exact preconditions, conclusion, status, search
use and source link. Do not create separate claim, review, or session reports.
Never turn an OPEN result into executable pruning without an audited proof
or an explicitly admitted complete finite verification.

The [SOS report](../reports/2026-10-15-sos-theory.md) and
[d18 index](d18/README.md) locate the reviewed covariance, dispersed-column,
finite-cap and obligation-graph results; their proof notes own the statements.

## 17. Detailed source files

- [Mathematical baseline](../../docs/mathematical_baseline.md) and
  [phase-I/II foundations](../../docs/theory_phase_1.md).
- [Degree-18 proof map](d18/README.md).
- [Shared theorem map](../../docs/general_theorems/README.md).
- [Layered theory map and formalization backlog](../../docs/theory_map.md).
- [Engine documentation](../../docs/engine.md), [workflow](../../docs/workflow.md),
  and [evidence policy](../../docs/reproducibility.md).
- [Historical reports index](../reports/README.md) for legacy handoffs and validation.

The pre-cleanup index and original review presentations are preserved in Git
at `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; proof notes retain their
exact statements, claim anchors and review provenance.
