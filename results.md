# Research status

The project targets the order-43 decision; `43 <= R(5,5) <= 46` remains the
global bound. The working expectation `R(5,5)=43` is a conjecture.
Computational exploration is paused unless explicitly authorized.

| Area | Recorded state | Details |
| --- | --- | --- |
| Connected d18 recursive completion | Six claims accepted after independent review: polynomial-size residual kernel, exact state congruence and memoized completion recurrence with recursive Ramsey cuts on overlapping supports; validation recorded, branch open | [d18c](research/n43/d18/c/README.md), [theorem](research/n43/d18/c/recursive_ramsey.md), [validation](research/n43/d18/c/validation.json) |
| Matching completion algebra | Ready for independent review: thresholds at most five give an exact 2-SAT terminal on reserved matching pairs; decision bound `O*(2^(m-d))`, preserved degree bounds, and sharp counting/budget/threshold limitations. Direct semantic validation and one supplied order-42 cofactor pass | [Theorems and algebra](research/foundations/quadratic_completion.md), [prototype](research/foundations/quadratic_completion.py) |
| Saturated-cell quadratic completion | Accepted structural extension: three Boolean squares cover each certified five-cycle cell; `k` disjoint cells give `O*(3^k 2^(m-10k-r))` decision with compatible budgets. Reviewed compiler reconstructs a supplied Exoo residual with three actual cells; no uniform cell-packing bound | [Cell-square theorems](research/foundations/quadratic_completion.md#cell-square-coordinates), [compiler](research/foundations/cell_square_completion.py), [review](research/foundations/quadratic_completion.md#cell-square-review) |
| Order 43 | Open; even-pivot and normalized minimum-degree schemes have distinct coverage obligations | [Branch map](research/n43/README.md), [reductions](research/n43/reductions.md) |
| A/B density transfer | Accepted scoped deductions: same-family two-sided rerooting triggers, exact edge exchanges, low-degree hole supplies and at-most-28-variable repair systems (21 with degree-18 endpoints); exact root-star swaps and immutable signature guards; independently reviewed prototype, all branches open | [Density transfer](research/n43/density_transfer.md), [certificate tool](research/n43/density_transfer.py) |
| Selected d18c density floors | Accepted floors 63/58/55/51 with at most 2/3/4/5 higher-degree A vertices. At a=50: at least six higher-degree A vertices and at most 18 actual degree-18 roots; eligible-triple excess forcing and new repair guards narrow the remaining cases. Universal floor remains 50 | [Floors and repair limits](research/n43/density_transfer.md#density-sparse-forcing) |
| Degree-18 cross count | Reviewed corridor `139 <= x <= 279`; full x136, x137 and x138 excluded; zero neighborhood excess forces x>=140 | [d18 branches](research/n43/d18/README.md), [x136 closure](research/n43/d18/x136/frontier_exclusion_handoff.md), [x137 closure](research/n43/d18/x137/frontier_closure.md), [x138 closure](research/n43/d18/x138/README.md), [upper bound](research/n43/d18/independent_row_cuts.md) |
| K1/d18 | Open; 17 reviewed whole-branch claims, critical-core exterior theorem, 6<=h<=15 and six endpoint shapes | [K1 branch](research/n43/d18/k1/README.md) |
| K3/d18 | Open; denser connected reroot or rigid three-block case, exact completion and explicit local obstruction | [K3 branch](research/n43/d18/k3/README.md) |
| Residual d20 | First deductions ready: `160 <= x <= 290`, connectivity, small-column restrictions, saturation witnesses and complete pair-selection coverage; branch open | [d20](research/n43/d20/README.md), [coverage](research/n43/d20/residual_coverage.md) |
| All vertices degree 20 | Open; new deductions ready: every neighborhood has 87..100 edges; small pair overlaps have two-sided density bounds; an edge of codegree two forces two Paley-17 cores with 124 cross edges and exterior `2K2 + K1` | [Regular-case attempt and remaining completion](research/n43/d20/regular_case.md), [finite self-check](research/n43/d20/verify_regular_case.py) |
| Seidel switching | Ready: exact cut-energy identity, conditional spectral boundary-or-rigidity theorem, and quartet-closure rigidity criterion; exact preservation and cut-size constraints. Universal d20-to-d18 switching coverage remains open | [Conditional dichotomy](research/n43/seidel_switching.md#claim-switch-spectral-dichotomy), [rigidity certificate](research/n43/seidel_switching.md#claim-switch-quartet-rigidity), [finite self-check](research/n43/seidel_switching.py) |
| Large-row follow-up | Ready: every degree19 pivot has `x<=289`; d20 three/four size-17 rows force `x<=278/276`; a degree20 codegree-two pair forces `x<=282` at a maximum-density root, and any size-17 row there forces `x<=288` | [Degree19](research/n43/degree19_row_ceiling.md), [d20 tail](research/n43/d20/large_row_tail.md) |
| Degree20 pair transfer and tail stability | Six claims ready: general pair defect identities and triangle/edge cut bounds; the one-size-16 `x=290` profile forces exactly 8 edges among the eight size-15 endpoints and at least seven degree24 vertices; both tail profiles remain open | [Pair transfer](research/n43/d20/pair_density_transfer.md), [stability](research/n43/d20/cross_tail_stability.md) |
| Parameter landscape | Five new claims ready for independent review; outer-envelope cells are not a feasibility classification | [Pending scope](research/n43/d18/README.md#pending-independent-review) |
| General attachment theory | Reviewed exact mixed interfaces, boundary replacement, critical-face colouring and structural obstruction lifting | [Attachment calculus](docs/general_theorems/ramsey_attachment_calculus.md) |
| Symmetry | Reviewed residual symmetry split, swap minimization, descent and quotienting; degree-18 signature multiplicities, duplicate-kernel reduction and complement selection | [General quotients](docs/general_theorems/symmetry_quotients.md), [d18 extensions](research/n43/d18/symmetry_extensions.md) |

For all recorded results on 17-vertex (4,4)-free graphs, see the
[R(4,4,17) collection](docs/r_4_4_17_results.md), including core structure,
attachment reductions, K1 applications and historical computations.

The [theory map](docs/theory_map.md) records the layered dependencies, open
obligations and formalization backlog.

For shared tools and their hypotheses, use the [general theorem map](docs/general_theorems/README.md)
and the topic links in the [d18 index](research/n43/d18/README.md). Earlier
dated reports were removed with the `research/reports/` tree and remain
recoverable in Git history; they are not live links.
New research uses one topic file under
`research/`, with inline review and a bottom changelog, not separate reports.
[Workflow](docs/workflow.md) defines this format and review states;
[reproducibility](docs/reproducibility.md) defines computational evidence.

This dashboard is navigation, not an independent proof audit or coverage
certificate. Apply each result only on the premises recorded in its proof.
