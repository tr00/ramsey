# Research status

The project targets the order-43 decision; `43 <= R(5,5) <= 46` remains the
global bound. The working expectation `R(5,5)=43` is a conjecture.
Computational exploration is paused unless explicitly authorized.

| Area | Recorded state | Details |
| --- | --- | --- |
| Connected d18 recursive completion | Six claims ready: polynomial-size residual kernel, exact state congruence and memoized completion recurrence with recursive Ramsey cuts on overlapping supports; tiny prototype validation, branch open | [d18c](research/n43/d18/c/README.md), [theorem](research/n43/d18/c/recursive_ramsey.md), [report](research/reports/2026-10-22-d18c-recursive-ramsey.md) |
| Order 43 | Open; even-pivot and normalized minimum-degree schemes have distinct coverage obligations | [Branch map](research/n43/README.md), [reductions](research/n43/reductions.md) |
| Degree-18 cross count | Reviewed corridor `139 <= x <= 279`; full x136, x137 and x138 excluded; zero neighborhood excess forces x>=140 | [d18 branches](research/n43/d18/README.md), [x136 closure](research/n43/d18/x136/frontier_exclusion_handoff.md), [x137 closure](research/n43/d18/x137/frontier_closure.md), [x138 closure](research/n43/d18/x138/README.md), [upper bound](research/n43/d18/independent_row_cuts.md) |
| K1/d18 | Open; 17 reviewed whole-branch claims, critical-core exterior theorem, 6<=h<=15 and six endpoint shapes | [K1 branch](research/n43/d18/k1/README.md), [report](research/reports/2026-10-19-k1-whole-branch-obstruction.md) |
| K3/d18 | Open; denser connected reroot or rigid three-block case, exact completion and explicit local obstruction | [K3 branch](research/n43/d18/k3/README.md) |
| Residual d20 | First deductions ready: `160 <= x <= 290`, connectivity, small-column restrictions, saturation witnesses and complete pair-selection coverage; branch open | [d20](research/n43/d20/README.md), [coverage](research/n43/d20/residual_coverage.md), [session](research/reports/2026-10-22-d20-first-deductions.md) |
| Large-row follow-up | Ready: every degree19 pivot has `x<=289`; d20 three/four size-17 rows force `x<=278/276`; a degree20 codegree-two pair forces `x<=282` at a maximum-density root, and any size-17 row there forces `x<=288` | [Degree19](research/n43/degree19_row_ceiling.md), [d20 tail](research/n43/d20/large_row_tail.md), [report](research/reports/2026-10-22-large-row-tail.md) |
| Degree20 pair transfer and tail stability | Six claims ready: general pair defect identities and triangle/edge cut bounds; the one-size-16 `x=290` profile forces exactly 8 edges among the eight size-15 endpoints and at least seven degree24 vertices; both tail profiles remain open | [Pair transfer](research/n43/d20/pair_density_transfer.md), [stability](research/n43/d20/cross_tail_stability.md), [report](research/reports/2026-10-22-d20-pair-transfer.md) |
| Normalized minimum degree 20 | Reviewed degree20/21 pair coverage; full gluing remains | [Branch](research/n43/min-degree20/README.md), [pair coverage](research/n43/min-degree20/pair_coverage.md) |
| Parameter landscape | Five new claims ready for independent review; outer-envelope cells are not a feasibility classification | [Pending scope](research/n43/d18/README.md#pending-independent-review) |
| General attachment theory | Reviewed exact mixed interfaces, boundary replacement, critical-face colouring and structural obstruction lifting | [Attachment calculus](docs/general_theorems/ramsey_attachment_calculus.md), [report](research/reports/2026-10-19-ramsey-attachment-calculus.md) |
| Symmetry | Reviewed residual symmetry split, swap minimization, descent and quotienting; degree-18 signature multiplicities, duplicate-kernel reduction and complement selection | [General quotients](docs/general_theorems/symmetry_quotients.md), [d18 extensions](research/n43/d18/symmetry_extensions.md), [audit report](research/reports/2026-10-19-symmetry-quotients-extensions-audit.md) |

For all recorded results on 17-vertex (4,4)-free graphs, see the
[R(4,4,17) collection](docs/r_4_4_17_results.md), including core structure,
attachment reductions, K1 applications and historical computations.

The [theory map](docs/theory_map.md) records the layered dependencies, open
obligations and formalization backlog.

For shared tools and their hypotheses, use the [general theorem map](docs/general_theorems/README.md)
and the topic links in the [d18 index](research/n43/d18/README.md). The
[report index](research/reports/README.md) organizes research, formalization and engine
history. [Workflow](docs/workflow.md) defines review states and
[reproducibility](docs/reproducibility.md) defines computational evidence.

This dashboard is navigation, not an independent proof audit or coverage
certificate. Apply each result only on the premises recorded in its proof.
