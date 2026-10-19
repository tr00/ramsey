# Research status

The project targets the order-43 decision; `43 <= R(5,5) <= 46` remains the
global bound. The working expectation `R(5,5)=43` is a conjecture.
Computational exploration is paused unless explicitly authorized.

| Area | Recorded state | Details |
| --- | --- | --- |
| Order 43 | Open; even-pivot and normalized minimum-degree schemes have distinct coverage obligations | [Branch map](n43/README.md), [reductions](n43/reductions.md) |
| Degree-18 cross count | Reviewed corridor `138 <= x <= 279`; full x136 and x137 excluded | [d18 branches](n43/d18/README.md), [x136 closure](n43/d18/x136/frontier_exclusion_handoff.md), [x137 closure](n43/d18/x137/frontier_closure.md), [upper bound](n43/d18/independent_row_cuts.md) |
| K1/d18 | Open; double-core obstruction and exact 289-bit residual partition | [Research record](n43/d18/k1/research.json) |
| K3/d18 | Open; denser connected reroot or rigid three-block case, exact completion and explicit local obstruction | [K3 branch](n43/d18/k3/README.md) |
| Normalized minimum degree 20 | Reviewed degree20/21 pair coverage; full gluing remains | [Branch](n43/min-degree20/README.md), [pair coverage](n43/min-degree20/pair_coverage.md) |
| Parameter landscape | Five new claims ready for independent review; outer-envelope cells are not a feasibility classification | [Pending scope](n43/d18/README.md#pending-independent-review) |

For all recorded results on 17-vertex (4,4)-free graphs, see the
[R(4,4,17) collection](docs/r_4_4_17_results.md), including core structure,
attachment reductions, K1 applications and historical computations.

For shared tools and their hypotheses, use the [general theorem map](docs/general_theorems/README.md)
and the topic links in the [d18 index](n43/d18/README.md). The
[report index](reports/README.md) organizes research, formalization and engine
history. [Workflow](docs/workflow.md) defines review states and
[reproducibility](docs/reproducibility.md) defines computational evidence.

This dashboard is navigation, not an independent proof audit or coverage
certificate. Apply each result only on the premises recorded in its proof.
