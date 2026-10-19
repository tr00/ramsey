# General theorem catalogue

A catalogue of the deterministic, non-SOS/SDP theorems in
[`docs/general_theorems/`](../../../docs/general_theorems/README.md), for reference
when formalizing reusable results in Lean. No probabilistic arguments are
included. This README is an inventory of mathematical notes, **not a claim that
these results have been proved in Lean**.

The nine theorem notes contain 30 general claims and five explicitly
branch-specific specializations, listed separately below. Reviews and manifests
are provenance, not additional theorem families. All nine notes have
independent acceptance banners on their stated premises; the four claims in
`symmetry_quotients.md` were accepted on 2026-10-19 in
[their review](../../../docs/general_theorems/review_symmetry_quotients_20261019_quotient_rigor.md).
Acceptance is not a formal certificate or a novelty claim.
See the [integration manifest](../../../docs/general_theorems/integration_manifest.json),
the [symmetry audit manifest](../../../docs/general_theorems/symmetry_audit_manifest.json)
and the per-note sibling reviews for exact reviewed revisions.

## Lean statement status

[TransversalDeletion.lean](TransversalDeletion.lean) states Claims 01–04 of its note.
Its 17 theorem declarations retain deliberate `by sorry` bodies. General inputs use
`DeletionHypotheses` and `IsSizedCliqueTransversal`, with external edge bounds kept
explicit. Named threshold and defect definitions preserve natural-number truncation
and integer casts. Component, defect, stability, equality and four-set budget results
have named fields instead of nested conjunctions.

[TransversalCompatibility.lean](TransversalCompatibility.lean) proves the elementary
avoidance and weighted criteria. `WeightOccupancy` and `ComplementExclusion` separate
the two weighted arguments. `IsSizedIndepTransversal` records exact cardinality and
transversality. `DegreeCompatibilityHypotheses` and `DegreeCompatibilityGaps` separate
graph properties from numerical gaps. The degree-gap theorem and its frontier
specialization retain two deliberate `sorry` bodies.

Shared graph definitions live in [defs/RamseyGraph.lean](../defs/RamseyGraph.lean)
and [defs/Transversals.lean](../defs/Transversals.lean). The packages above stay
with their theorem topics. The root module re-exports both transversal modules,
but the existing order-43 target does not use them.
The Ramsey-specific declarations `eighteen_pivot_indep_transversal_card_ge_four`
and `frontier_four_transversals_intersect` take a bundled `RamseyGraph`.
Its `graph` and `ramsey` fields replace separate graph and Ramsey-proof arguments.

[TransversalFour.lean](TransversalFour.lean) proves
[`n43/d18/transversal_four.md`](../../../n43/d18/transversal_four.md): a
three-vertex clique transversal forces at least 71 edges, so an 18-vertex graph
with no independent four-set and at most 70 edges has transversal size at least
four. It includes the source's 68-edge theorem and the actual cross-column
application from an 85-edge neighborhood. Its published inputs are the named
axioms `edges_ramsey_4_4_15_ge_50 : RamseyEdgeLowerBound 15 4 4 50` and
`ramsey_4_3_le_9 : RamseyUpperBound 4 3 9` from `Ramsey.Premises`, rather than
caller-supplied hypotheses. All proofs in this module are complete; it does not
import either transversal module. Those general modules retain explicit
bound hypotheses, keeping their general formulations independent of the premises.

## Proved reduction-index basics

The following modules formalize scoped parts of
[`n43/reductions.md`](../../../n43/reductions.md), not the entire index.
Every declaration in these modules has a proof. They do not import the two
statement-only transversal modules or the unproved branch exclusions.

| Module | Proved scope |
| --- | --- |
| [LocalReductions.lean](LocalReductions.lean) | §4.3 full adjacent/nonadjacent codegree intervals, §4.4 mixed and common-nonneighbor cells, §§5.2–5.3 row/column cardinal inequalities |
| [PivotInterface.lean](PivotInterface.lean) | §5.1 exact equivalence between the full Ramsey property and correct internal types plus forbidden rectangles, including empty sides and pivot-containing five-sets |
| [PivotCounting.lean](PivotCounting.lean) | §2 general degree sums over both pivot parts, cross-edge row counting and complement edge counting |
| [d18/PivotBudget.lean](../d18/PivotBudget.lean) | §§2, 8.1–8.3 and the basic §8.6 identity: `50≤a≤85`, `144≤b≤160`, `x+2a=306+Δ_A`, `x=136+2(85-a)+Δ_A`, `x≥136`, `x=136 ↔ a=85 ∧ ∀u∈A,d(u)=18`, and `148≤b≤160` at equality |

Shared counting and rectangle predicates are in
[defs/Transversals.lean](../defs/Transversals.lean).
[Premises.lean](../Premises.lean) derives natural-number census intervals from
the existing named axioms, with no additional trusted input. The pair bounds
use `R(3,5)≤14` and `R(4,4)≤18`; the degree-18 budgets additionally use the
existing `R(4,5)≤25` and order-18/order-24 edge extrema.

Triple-cell bounds, critical-cell regularity, signature equality triggers,
the full cross-edge corridor, regularity of the 18-regular corner, and the
later small-column exclusions are not newly formalized here. Existing
`TransversalFour.lean` remains the proved size-four lower bound. No new
declaration establishes the size-five lower bound or closes a branch.

## Conventions

Graphs are finite, simple and undirected. `K_r` is an r-clique, `I_s` an
independent s-set, and `(r,s)`-free means containing neither. A transversal
meets every member of its specified family. Ramsey numbers and edge extrema
used numerically are external premises unless proved separately.

For a root `v`, write `A=N(v)`, `B=V(G) \ (A ∪ {v})`, and
`C_y=N(y) ∩ A` for `y ∈ B`. In a `(p,q)`-free graph, `A` is
`(p-1,q)`-free and `B` is `(p,q-1)`-free; these types are not interchangeable.
Each linked statement is authoritative for its complete hypotheses and proof.

## Safe augmentation — accepted

Source: [Safe augmentation below a Ramsey edge extremum](../../../docs/general_theorems/safe_augmentation.md).
Let `M` be the maximum edge count of a nonempty `(r,s)`-free class on a fixed
vertex set, `q=M-e(G)`, and `T` the individually safe missing edges. A proved
upper bound `U≥M` may replace `M` with deficit `U-e(G)` where stated.

- [01 — Single-edge obstruction and deficit budget](../../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-01).
  Adding `uv` is safe exactly when its common neighborhood has no `K_(r-2)`;
  every feasible addition set has at most `q` edges.
- [02 — Bounded star forest at deficit one](../../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-02).
  When `q=1`, the safe-edge graph is a star forest with at most `r-1` edges.
- [03 — Complete generation split](../../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-03).
  At deficit one, a graph is either already `K_r`-saturated or is obtained by
  deleting an edge from an extremal parent. Both cases must be retained;
  parent deletions must still pass the `I_s` prohibition.
- [04 — Exact conflict hypergraph](../../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-04).
  Inclusion-minimal missing-edge sets completing an r-set to a clique define
  a hypergraph on `T`. Its independent sets are exactly the feasible additions;
  its independence number is at most `q`, and hyperedge sizes lie between
  `2` and `min(q+1, binom(r,2))` for `q≥1`.

## Cross signatures and homogeneous anchors — accepted

Source: [Cross signatures and weighted homogeneous anchors](../../../docs/general_theorems/signature_anchors.md).

- [01 — Exact mixed homogeneous-set criterion](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-01).
  Given the correct internal graph types, rooted gluing is `(p,q)`-free
  exactly when column intersections over B-cliques exclude the corresponding
  A-cliques, and complements of column unions over B-independent sets exclude
  the corresponding A-independent sets.
- [02 — Numerical union and intersection bounds](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-02).
  For an independent t-set `Q⊆B`, its column union has size at least
  `|A|-R(p-1,q-t)+1`; for a clique t-set its column intersection has size at
  most `R(p-t,q)-1`. These necessary numerical bounds do not replace claim 01.
- [03 — Independent anchors: Hall, capacities and defects](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-03).
  For an independent `(q-1)`-anchor `X⊆A`, signatures are nonempty and satisfy
  Hall's condition on independent B-subfamilies. Each exact singleton class
  has size at most `p-2`; with `c=(q-1)(p-2)`, this gives
  `e(X,B)≥max(|B|,2|B|-c)` and exact nonnegative defect identities.
- [04 — Weighted degree/excess certificates](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-04).
  Nonnegative anchor weights yield load-weighted degree-excess inequalities
  and the exact cross-edge count. Bounding total excess requires loads at
  most one and nonnegative vertex excesses; no perfect anchor cover is assumed.
- [05 — Clique dual](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-05).
  For a `(p-1)`-clique `Y⊆B`, missing signatures satisfy the dual Hall and
  singleton bounds, giving
  `e(A,Y)≤min((p-2)|A|,(p-3)|A|+(p-1)(q-2))` and an exact defect identity.

## Transversal deletion — accepted

Source: [Deleting a clique transversal: edge budgets and stability](../../../docs/general_theorems/transversal_deletion.md).

- [01 — General deletion lower bound](../../../docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-01).
  If `α(F)<s` and a t-set meets every `K_r`, put `h=|F|-t`. Given a Ramsey
  upper bound `R≥R(r,s-1)` and a lower edge bound `L` for h-vertex
  `(r,s)`-free graphs,
  `e(F)≥L+t·max(0,h-R+1)+a(t,s)`, where `a(t,s)` is the edge count of
  balanced disjoint cliques on t vertices in `s-1` parts. A strict violation
  excludes all transversals of size at most t.
- [02 — Exact defect budget and equality structure](../../../docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-02).
  Excess above that bound is the sum of nonnegative core, internal-transversal
  and attachment defects. It bounds each defect separately; zero excess forces
  balanced disjoint cliques on the transversal and all attachment bounds tight.

## Transversal compatibility — accepted

Source: [Weighted avoidance and two-transversal incompatibility](../../../docs/general_theorems/transversal_compatibility.md).

- [01 — Avoidance forces occurrence](../../../docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-01).
  If every family member uses at least t points of `L` and every `L\T`, for
  a t-subset `T⊆L`, fails to be a transversal, every such `T` occurs as an
  exact intersection. For a family of independent sets and `t≥2`, `L` is
  independent; `t=1` gives only vertex occurrence.
- [02 — Weighted occupancy and low-weight exclusion](../../../docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-02).
  Explicit weight gaps force family members to use at least t low-weight
  vertices, while weight lower bounds on transversals exclude the complementary
  subsets. Together these establish the hypotheses of claim 01.
- [03 — Degree-gap obstruction to disjoint transversals](../../../docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-03).
  For independent four-sets, explicit degree ranges, transversal degree bounds,
  induced-subgraph edge bounds and strict total-degree gaps exclude two
  disjoint s-set transversals. Every listed gap is a hypothesis, not a general
  consequence of being Ramsey-free.

## Prescribed-family overlap — accepted

Source: [Prescribed equal-degree families with a simultaneous overlap bound](../../../docs/general_theorems/family_overlap.md).
These results concern a prescribed family `F` of ambient degree-d vertices
in a `(5,s)`-free graph; put `k=s-1`, `b=n-d-1`, and
`A₀=max(b,2b-3k)`.

- [01 — Triangle equality, four-clique exception and anchor](../../../docs/general_theorems/family_overlap.md#claim-family-overlap-01).
  If all family edges have codegree at least `L` and `2L=d+k`, triangles
  force exact codegrees, k common neighbors and induced-paw-freeness.
  `d≠3k` excludes `K4` in the family; `A₀>k(d-1-L)` additionally excludes
  independent k-sets from its internal neighborhoods.
- [02 — Structural component bound](../../../docs/general_theorems/family_overlap.md#claim-family-overlap-02).
  An induced-paw-free, `K4`-free graph with independence number at most k
  and neighborhood independence numbers at most `k-1` has order at most
  an explicit partition bound `H_k` from supplied triangle Ramsey bounds.
  Triangle-containing components are complete tripartite; suitable numerical
  premises give `H_k≤3k`.
- [03 — Low-overlap edge in the prescribed family](../../../docs/general_theorems/family_overlap.md#claim-family-overlap-03).
  Under the equality-threshold anchor and nonexceptional-degree hypotheses,
  `|F|≥H_k+1` forces an edge of codegree at most `L-1`. The edge lies in
  the original prescribed family, preserving properties at both endpoints.
- [04 — Strict threshold and odd degrees](../../../docs/general_theorems/family_overlap.md#claim-family-overlap-04).
  When `2L>d+k` with the same strict anchor condition, a hypothetical
  high-codegree family is triangle-free. Size `k²+1`, or a sharper
  Ramsey-based component threshold, therefore forces an edge of codegree
  at most `L-1`; this includes the odd-degree cases.

## Cut capacity — accepted

Source: [Cut capacities force prescribed root families](../../../docs/general_theorems/cut_capacity.md).
Let `P` be the minimum-degree-d vertices of a `K_r`-free graph, `H=V\P`,
and `η_z=d(z)-d` on `H`. These results require a separately proved root
inequality `q_v+E_v≤B`, where `q_v` is a nonnegative integer and
`E_v=Σ_{z∈N(v)∩H}η_z`.

- [01 — Cut demand and multiset capacity](../../../docs/general_theorems/cut_capacity.md#claim-cut-capacity-01).
  Degree summation and Turán bound the demand across `P–H`. The sorted excess
  multiset bounds each root's capacity, forcing a lower bound on the number
  of roots in the same family `F_Q={v∈P:q_v≤Q}`.
- [02 — Weighted cut demand](../../../docs/general_theorems/cut_capacity.md#claim-cut-capacity-02).
  An exact weighted-incidence identity, including squared excesses and
  weighted H-nonedges, gives a second lower bound on `|F_Q|`.
- [03 — Composition with family overlap](../../../docs/general_theorems/cut_capacity.md#claim-cut-capacity-03).
  Once either valid count reaches an overlap theorem's family threshold,
  that theorem supplies one edge whose two endpoints both satisfy `q_v≤Q`
  and whose codegree satisfies the required bound.

## Disjoint-swap stabilizers — accepted

Source: [Exact stabilizers of disjoint vertex swaps](../../../docs/general_theorems/disjoint_swap_stabilizers.md).

- [01 — Partition subspace with pinned components](../../../docs/general_theorems/disjoint_swap_stabilizers.md#claim-disjoint-swaps-01).
  For p specified disjoint vertex pairs, the completed graph's stabilizer
  under independent swaps is defined solely by `s_i=0` and `s_i=s_j`.
  If t equality components are unpinned, the stabilizer has order `2^t`
  and the orbit has size `2^(p-t)`.
- [02 — Pair separation bounds stabilizers and orbits](../../../docs/general_theorems/disjoint_swap_stabilizers.md#claim-disjoint-swaps-02).
  If each pair is distinguished by at least D other vertices, each free
  component contains at least `h=1+ceil(D/2)` pairs. Thus the stabilizer
  has order at most `2^floor(p/h)`; the action is free when `p<h`.
  These are completed-state results, not partial-state pruning rules.

## Two-root symmetry gluing — accepted

Source: [Exact automorphism quotients for two-root neighborhood gluing](../../../docs/general_theorems/symmetry_pair_gluing.md).
Fixed colors must agree on identified vertices and all maps preserve them.

- [01 — Double-coset classification of overlap maps](../../../docs/general_theorems/symmetry_pair_gluing.md#claim-pair-gluing-01).
  For two pointed neighborhoods with compatible overlap `S`, ordered-root
  skeletons are classified by `J_v \ Aut(S) / J_u`, where the J groups
  are the overlap restriction images of the pointed automorphism groups.
- [02 — Fiber-product completion group](../../../docs/general_theorems/symmetry_pair_gluing.md#claim-pair-gluing-02).
  Compatible side automorphisms form a fiber product. With t otherwise
  interchangeable vertices nonadjacent to both roots, the full residual
  group is that fiber product times `S_t`; exact full-vector minimization
  classifies ordered-root completions. Additional coupled fixed data require
  the actual enriched-state stabilizer instead.
- [03 — Coverage under staged quotienting](../../../docs/general_theorems/symmetry_pair_gluing.md#claim-pair-gluing-03).
  Complete pointed-input coverage, one map per double coset and one completion
  per residual orbit preserve every target with an admissible ordered pair.
  Unique unrooted representatives require a further canonical pair choice.

## Residual symmetry and descent — accepted

Source: [Exact residual symmetry and arbitrary-domain descent](../../../docs/general_theorems/symmetry_quotients.md).
These four statements were independently accepted on 2026-10-19
([review](../../../docs/general_theorems/review_symmetry_quotients_20261019_quotient_rigor.md)).
They remain mathematical deductions only: no pruning rule is implemented and
no algorithm or certificate is validated.

- [01 — Split extension and composed minimization](../../../docs/general_theorems/symmetry_quotients.md#claim-symmetry-quotients-01).
  Ranking repeated columns splits the residual group as `K ⋊ H`, with K
  permuting identical occurrences and H stabilizing the column multiset.
  Full orbit minimization is exactly H minimization followed by K
  minimization, not merely comparisons against group generators.
- [02 — Exact swap minimization via binary implications](../../../docs/general_theorems/symmetry_quotients.md#claim-symmetry-quotients-02).
  Each edge bit depends on at most two disjoint-swap variables. Successive
  2-CNF feasibility checks therefore find the exact lexicographic orbit
  minimum in at most `binom(b,2)` checks, without enumerating all swaps.
- [03 — Uniform descent on arbitrary assigned domains](../../../docs/general_theorems/symmetry_quotients.md#claim-symmetry-quotients-03).
  A partial state can be rejected if one group element strictly decreases
  every feasible full extension in a single fixed full coordinate order.
  Orbit minima survive even with non-prefix, state-dependent branching;
  the feasible family must remain invariant under the group used.
- [04 — Hierarchical minimization and root selection](../../../docs/general_theorems/symmetry_quotients.md#claim-symmetry-quotients-04).
  Minimize successive equivariant data using stabilizers of earlier fixed
  data to obtain the exact least tuple. Complete rooted codes, minimized
  over a nonempty invariant admissible root family, give unrooted codes;
  scalar root keys alone do not resolve ties.

## Branch-specific specializations, not additional general theorems

These five claims complete the inventory of the nine source notes. All have
independent acceptance on their explicit numerical and interface premises.

- [Safe augmentation 05](../../../docs/general_theorems/safe_augmentation.md#claim-safe-augmentation-05):
  using the 85-edge cap for 18-vertex `(4,5)`-free graphs, 85 edges implies
  saturation and 84 edges permits at most three safe edges in a star forest.
- [Signature anchors 06](../../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-06):
  order-43 `(5,5)` specialization, including independent-four anchor
  incidence bounds 36 and 32 at pivot degrees 18 and 20, respectively.
- [Transversal deletion 03](../../../docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-03):
  an 18-vertex graph with independence number at most three and at most
  70 edges has no `K4`-transversal of size at most three, conditional on
  the stated Ramsey and 15-vertex edge-minimum premises.
- [Transversal deletion 04](../../../docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-04):
  a four-set transversal forces only 66 edges under the recorded premises;
  at `e(F)=68+q` the exact defect is `2+q`, not a contradiction.
- [Transversal compatibility 04](../../../docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-04):
  in the full degree-18, `x=136` frontier/interface setting, any two
  four-set transversals of independent four-sets intersect. The transversals
  need not themselves be actual cross columns.

The source index also links the
[normalized minimum-degree-20 pair-coverage theorem](../../../n43/min-degree20/pair_coverage.md)
and [order-43 symmetry structure](../../../n43/symmetry_structure.md).
Those are order-specific applications outside the nine general theorem notes,
not additional general results. No entry here closes an order-43 branch.

## Standard tools used in the proofs

The notes also invoke classical deterministic results: Ramsey's homogeneous-set
bounds; Hall's marriage theorem for systems of distinct representatives;
Turán's theorem and its equality case; the greedy independence bound;
orbit–stabilizer, group kernels/images, double cosets and finite orbit minima;
and the implication-graph characterization of 2-CNF satisfiability. Weighted
incidence, degree summation and balanced integer sums supply the remaining
counting tools. Weighted arguments here are deterministic, not probabilistic
or SOS/SDP relaxations.
