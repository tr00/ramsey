# Pairwise refinements in the degree-18 branch

Date: 2026-10-14. Coordinator: Codex. This note compares existing deductions
and records their combined consequences. Mathematical reasoning only; no
graph enumeration, solver, catalogue acquisition, or novelty review.

The starting revision was `81c768a683d3c3b3df70d4d3b7d03a67d505447b`.
Concurrent work above the equality frontier is recorded separately in WORK.md;
in particular, the x137 four-column exclusion overlaps that work.

## Setting

G has 43 vertices, no K5 and no independent five-set. A chosen pivot v has
degree 18. Put A=N(v), B=M(v), C_y=N_A(y), q=85-e(A), and
E=sum_A(d_G(a)-18). Then A is (4,5)-free, B is (5,4)-free, and
x=e(A,B)=136+2q+E. The numerical bound e(A)<=85 is an external census premise.
Root-selection conditions are additional hypotheses when explicitly stated.

## Near-extremal augmentation must respect actual columns

<a id="claim-pairwise-safe-columns"></a>
Claim ID: research/n43/d18/pairwise_refinements.md#claim-pairwise-safe-columns
Kind: local-deduction
Review state: accepted
Scope: the above degree-18 setting with q=1; all actual size-four columns;
every safe nonedge uv of A, where safe means A+uv contains no K4
Dependencies: [safe augmentation](cliques_augmentation.md), section 2;
the published maximum 50 edges for a 14-vertex (4,4)-free graph, recorded in
[transversal attempt](x136/transversal_five_attempt.md), section 1;
R(3,4)=9; elementary mixed clique tests
Conclusion: the constraints below hold for every safe uv
Proof: below
Search use: propagate; conditional internal-graph generation
Reviews: [independent small-column agent review](review_pairwise-safe-columns_2026-10-14_small-agent.md),
of the exact proof revision before navigation integration

Let D8 be the vertices of internal A degree eight that belong to at least
one actual size-four column. Then:

1. Every safe edge has every vertex of D8 among its two endpoints.
2. If |D8|>=3, A is already K4-saturated. If |D8|=2, their mutual nonedge
   is the only possible safe edge. If |D8|=1, all safe edges share that
   vertex, and there are at most three by the existing safe-edge bound.
3. For every actual size-four column T with e(A-T)=50, every safe edge
   meets T. Equivalently, a safe edge wholly outside T requires e(A-T)<=49.

These conclusions do not assert that any of the possible edges is safe.
They couple the existing small-column classification to the existing q=1
augmentation classification without assuming that every 84-edge A augments.

Proof. Adding a safe edge to A gives A' with 85 edges, no K4 and no I5.
Every independent four-set of A' was an independent four-set of A. Thus
each actual T still meets every independent four-set of A', and K=A'-T
is a 14-vertex (4,4)-free graph with e(K)<=50.

For t in T write S_t=N_K(t). The induced graph on S_t is triangle-free
and has no I4, so |S_t|<=8 by R(3,4)=9. For a triangle t1,t2,t3 in T,
each S_ti intersect S_tj is independent and has size at most three: an
edge in it would form K4 with ti,tj. The triple intersection is empty,
since its vertex would form K4 with the triangle. Inclusion-exclusion
therefore gives sum_i |S_ti|<=14+9=23.

Fix a in T. If T-a has at most two edges, then
e(A'-a)<=50+24+2=76. If T-a is a triangle, then
e(A'-a)<=50+23+3=76. Consequently d_A'(a)>=85-76=9.
A vertex of D8 must therefore gain degree from every safe addition;
it must be an endpoint. This proves the first two assertions. Finally, if
uv is wholly outside T, A'-T adds that edge to A-T and remains (4,4)-free,
so e(A-T)+1<=50. This proves the third assertion. No assumption on E is used.

## Combined results and exact review links

The useful combinations are recorded with their exact scopes. Review links
accept local reasoning conditional on the recorded external premises.

| Existing claims paired | Refined conclusion | Scope / review |
| --- | --- | --- |
| Small-column H budget + overlap adjacency + independent-four anchors + four-transversal bound | Excludes r=3 at x136, leaving r=0,1,2 | [Small-column Claims 01--03](x136/pairwise_small_refinements.md#claim-pairwise-small-03), [review](review_pairwise-small_2026-10-14_coordinator.md) |
| Actual size-four attachments + deletion count | 9-q<=d_A(a)<=11, with degree eleven forcing a universal vertex inside each containing T | [Frontier Claim 01](pairwise_frontier_refinements.md#claim-pairwise-frontier-01), [review](review_pairwise-frontier_2026-10-14_coordinator.md) |
| Row excess + forced B adjacency + higher-column budget | Double/triple size-four membership requires respectively >=1+epsilon_a / >=3+epsilon_a incident columns of size >=7 | [Frontier Claim 02](pairwise_frontier_refinements.md#claim-pairwise-frontier-02), same review |
| r2 column budget + overlap resource + edge-codegree capacity | Disjoint at s4; overlap <=2 at s5; at s7 overlap <=1 and needs >=2 incident larger columns | [Small-column Claims 04--05](x136/pairwise_small_refinements.md#claim-pairwise-small-05), [Claim 05 review](review_pairwise-small-05_2026-10-14_coordinator.md) |
| Safe augmentation at q1 + retained actual I4 transversals | Every safe edge contains all degree-eight vertices in actual size-four columns; every 50-edge core requires the safe edge to meet its T | [Augmentation bridge above](#claim-pairwise-safe-columns), [review](review_pairwise-safe-columns_2026-10-14_small-agent.md) |
| Exact triple-Q classes + four-clique cut budget | For r4, 2n0+n1<=4-E_Q; exact per-edge masks also bounded | [Frontier Claim 04](pairwise_frontier_refinements.md#claim-pairwise-frontier-04), [review](review_pairwise-frontier_2026-10-14_coordinator.md) |
| Missing H edges + weighted family sums | Exact J identity adds nonedge weights; W6 forces at least four 81-edge degree-18 roots | [Pivot Claim 01](pairwise_pivot_refinements.md#claim-pivot-pairwise-01), [review](review_pairwise-pivot_2026-10-14_coordinator.md) |
| High-degree cut capacities + root deficit thresholds | h3/W18 forces >=26 roots of at least 84 neighborhood edges; h5/W30 forces >=26 of at least 83; each family contains an adjacent pair | [Pivot Claim 02](pairwise_pivot_refinements.md#claim-pivot-pairwise-02), same review |
| Cut surplus + extremal root profiles + overlap averages | h2/W8, h4/W20, h6/W32 force >=1,2,3 roots with (q,E,x)=(0,8,144),(0,14,150),(0,20,156), with respective pointed overlap caps 9,10,10 | [Pivot Claim 03](pairwise_pivot_refinements.md#claim-pivot-pairwise-03), same review |
| Maximum-edge pivot selection + weighted deficit average | At W0,2,4,6,8,10 the same selected root has x<=144,145,146,147,149,150 | [Pivot Claim 04](pairwise_pivot_refinements.md#claim-pivot-pairwise-04), same review |

The [x137/r4 cross-check](pairwise_frontier_refinements.md#claim-pairwise-frontier-03)
was reached independently during this comparison, but overlaps the concurrent
four-column stability task (`four_column_stability.md`). Its new-work ownership
and main indexing remain with that task. The direct vertex-degree lemma also
overlaps that task's independently derived lemma; neither is claimed novel.

The [pivot/excess comparison](pairwise_pivot_refinements.md) combines cut
capacities, weighted root families, and maximal-neighborhood pivot selection.
Its exact review and scope govern use; no small global excess is inferred for
the unrestricted d18 branch.

## Remaining connections worth developing

- At r0,s=8..10 and r1,s=6..10, small-column incidence and nonadjacent
  size-five pair structure already coexist, but counts alone do not enforce
  an impossible interface. Retain actual subsets and B adjacencies.
- At r2,s7, compare the unique possible overlap vertex with the actual
  two or three larger columns that must contain it. At s4, compare the
  two disjoint size-four transversals with independent-four anchors; their
  degree lower bounds alone yield 30 rather than the required contradiction
  above 32, so the r3 argument does not close r2.
- For q1, split saturated neighborhoods from those that admit a safe edge,
  then apply the degree-eight endpoint and 50-edge core constraints to
  actual columns. The augmentation only changes an internal graph; it does
  not assert that the full interface remains valid after that addition.

These are continuation targets, not proved exclusions or evidence of
realizability. No universal transversal theorem of five is used.

The comparison does not decide order 43. The full degree-18 branch still
includes arbitrary higher x and arbitrary numbers of higher-degree vertices.
Published census bounds remain external premises; accepted local review will
not constitute a formally checked exhaustion certificate or a novelty claim.
