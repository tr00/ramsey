# Early session reports (2026-10-13 .. 2026-10-14)

Historical outcomes from the early setup and theory sessions, first
[consolidated on 2026-10-18](2026-10-18-markdown-consolidation.md) and
condensed on 2026-10-21. Stable section anchors are retained. Full prior
text and original filenames are in Git at
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f:research/reports/early_session_reports.md`.
Proof files are unchanged. Current states are in the
[reduction index](../n43/reductions.md) and [results](../../results.md).

Sessions were mathematical unless validation is specified. No solver,
graph catalogue download or installation occurred; the global bound
remained `43 <= R(5,5) <= 46`.

<a id="first-report"></a>
## First setup report (2026-10-13)

Setup added the deterministic graph checker/CNF generator and evidence
rules. Nine baseline tests passed, including all 32,768 labeled graphs on
six vertices and exact graph/CNF agreement at order 5. The order 43 direct CNF
dimensions were counted without generation:903 variables,1,925,196 clauses.
The host inventory was16 CPU threads,62 GiB RAM,83 GiB free scratch.

The initial solve plan was a measured pilot followed by proved degree/interface
cuts, degree18/20 splitting and independently checked coverage/certificates.
The known 656 order 42 graphs were not treated as a complete census. No tools
or graph data were downloaded. Foundations: [baseline](../../docs/mathematical_baseline.md);
current tooling: [engine](../../docs/engine.md), [checker](../../scripts/ramsey.py).

<a id="mathematical-phase-1"></a>
## Mathematical Phase I report (2026-10-13)

Developed complement normalization, the even degree18/20 pivot split,
exact mixed-rectangle tests, four-bit anchor Hall/defect bounds, quadratic
cross-edge inequalities, the d18 corridor, normalized minimum-degree 20
parameters and strongly regular exclusion. [Theory phase I](../../docs/theory_phase_1.md)
contains the derivations and external numerical premises.

The original strict outer degree-count split was incomplete: tied n18/n24
or n19/n23 counts need later pairs. The subsequent proof review below
corrects it. No arbitrary regular candidate was proved strongly regular,
and neither pivot branch was excluded. No computation was performed.

<a id="lemma-phase-2"></a>
## Lemma Phase II report (2026-10-13)

At x136, deleting a three-transversal from the complementary68-edge
neighborhood gives >=50 core edges and >=21 mandatory attachments, a
contradiction. Thus tau>=4 on the recorded census premise; see
[transversal four](../n43/d18/transversal_four.md). Further results were
anchor-block rigidity (C8 or two C4), rooted energy identities and regular
corner codegree floors. [Phase II](../../docs/lemma_phase_2.md) retains details.

Rejected directions: anchor equality alone is not contradictory; local
Ramsey constraints do not guarantee fractional perfect anchor designs or
regular-to-strongly-regular rigidity. No computational exploration occurred.

<a id="proof-review-2026-10-13"></a>
## Proof review status (2026-10-13)

The audit found two material gaps: the 45-edge15-core argument inferred
equality from compatible one-sided triangle bounds, and complement
normalization omitted tied outer degree counts. Claims of only three
attachment cases or strict first-pair inequalities were not complete reductions.

The exact interface framework, frontier identity, tau>=3, anchor rigidity,
rooted identities and normalized minimum-degree 20 formulas survived on
their recorded premises. Some sketches/countermodels needed fuller evidence.
[The audit](../../docs/proof_review_2026_10_13.md) gives corrected coverage.
No computational exploration or external acquisition occurred.

<a id="transversal-five-status"></a>
## Transversal-five attempt status (2026-10-13)

The isolated tau>=5 strengthening was not proved. A four-transversal
reduced the problem to a 14-vertex core; the 43-edge core and several
attachment families were excluded, leaving four listed families. An
intermediate assertion that common nonneighbors of a nonedge form a clique
was discarded; only independence number<=2 follows.

[The attempt](../n43/d18/x136/transversal_five_attempt.md) preserves the
remaining cases. The later [full-interface tau>=5 proof](../n43/d18/x136/five_column_compatibility.md)
uses actual columns and does not settle this isolated universal conjecture.

<a id="frontier-band"></a>
## Frontier band report (2026-10-13)

Extended the frontier by the exact budget x=136+2q+E, tabulating all
profiles through142 and B excess/parity budgets. The census-backed tau>=4
bound extends through141 and to higher-x slices with a>=83. Anchor defects
bound size-four attachments; such columns form a B clique, and every
size-four/size-five pair is adjacent. No endpoint improved at this date.
[Proof and premises](../n43/d18/frontier_band.md).

<a id="degree18-pivot-classes"></a>
## Degree-18 pivot classification report (2026-10-14)

Parameterized root profiles by q, neighbor excess E and global excess W;
b=148+W/2-q-E and x=136+2q+E. Dense/low-overlap adjacent degree 18
root coverage was proved on specified x or W ranges, using the published
order 17 edge maximum79. Weighted excess selects dense roots, but its pair
need not also be the small-overlap pair.

The unrestricted branch was not reduced to small x or W. Exact rational
tables were checked. [Proof, quantifiers and tables](../n43/d18/pivot_classes.md).
The later [ambient-type correction](../n43/d18/review_adjacent_root_cell_20261017_audit.md)
supersedes the common-nonneighbor cell label in the historical note.

<a id="degree18-excess-bounds"></a>
## Conditional degree-excess bounds report (2026-10-14)

Cut capacity combined the input E_v+q_v<=W/2+4 with Turán bounds on
h higher-degree vertices, giving conditional W/E limits and selected-root
averages. Small h also forces low-overlap adjacent degree 18 roots.
Minimum-E root selection does not simultaneously maximize neighborhood edges.

Exact arithmetic checked both cut counts, rounding, excluded even W values
and overlap maxima. This was scalar validation, not graph exclusion.
[Proof and threshold tables](../n43/d18/excess_bounds.md).

<a id="degree18-cliques-augmentation"></a>
## Degree-18 further reductions report (2026-10-14)

A K4 in B has internal degree sum<=60, with degree 15 and exact external
signature rigidity at equality. Four size-four columns consequently have
total global excess<=4. An84-edge A has at most three individually K4-safe
missing edges, forming a star forest; saturated alternatives remain.
Root transfer requires the explicit choice maximizing neighborhood edges
among degree 18 roots. [Proof](../n43/d18/cliques_augmentation.md).
This session also corrected complement-selector tie coverage.

<a id="degree18-small-columns"></a>
## Degree-18 small-column progress (2026-10-14)

Small-column incidence gives 4n4+5n5<=54 and sharper n5 bounds.
The exact budget is 2n4+n5=8-k+H. Nonadjacent size-five columns are disjoint
and leave an eight-vertex(4,3)-free graph with16/17/18 edges and exact
degree/triangle types; an independent triple leaves an A clique of order 3.

These are interface reductions on the tau>=4 premise, not exclusions of
the whole frontier. [Proof and audit](../n43/d18/x136/small_columns.md).
Later x136 closure supersedes the historical residual branch list.

<a id="degree18-r4-exclusion"></a>
## Four size-four columns excluded (2026-10-14)

Four size-four columns at x136 would be pairwise disjoint. Every A I4
would meet each exactly once, giving at most 32 cross incidences against
the anchor lower bound36. Hence r4 was excluded; the r0..r3 child lists
were necessary survivors at this date. [Proof](../n43/d18/x136/r4/exclusion.md).
The subsequent [full x136 closure](2026-10-19-x136-frontier-closure.md)
excludes all these children.

<a id="upper-bound-method-review"></a>
## Upper-bound paper review (2026-10-14)

Read arXiv:2409.15709v2 at the user's request. The R(5,5)<=46 proof
uses linear programming/subgraph counts, selected dense catalogues, an
unavoidable pointed-neighborhood-pair theorem and two independent gluing
computations. It does not present SDP or flag-algebra filtering.
Order43 needs stronger unavoidable-family coverage beyond filters at a
chosen frontier root. [Version, hash and analysis](../../docs/upper_bound_method_review.md).
No new Ramsey bound or computational exclusion was claimed.
