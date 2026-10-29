# Order 43

Scope: graphs G of order 43 with neither K5 nor I5.

[Reduction index](reductions.md) owns the existing global notation, predicates,
and prospective case tree. [Baseline](../../docs/mathematical_baseline.md) records
external premises. This directory is navigation by mathematical scope, not a
new proof of exhaustive case coverage.

| Path | Scope | Coverage distinction |
| --- | --- | --- |
| [d18](d18/README.md) | A degree-18 pivot maximizing e(G[N_G(v)]) among degree-18 vertices | Even-pivot scheme; ties unrestricted; no claim that minimum degree is exactly the pivot degree |
| [d20](d20/README.md) | Degree-20 pivot with no degree-18 vertices | Residual even-pivot scheme; excluding degree 24 additionally needs d18 priority in both complementary orientations |

The even-pivot and normalized minimum-degree schemes are alternatives, not
siblings of a single disjoint partition. Canonical root selection and symmetry
coverage remain subject to the obligations in the reduction index.

[Seidel switching](seidel_switching.md) gives an exact Ramsey-preservation
criterion and proves that every nontrivial valid cut has both sides of size
at least nine. Its [conditional dichotomy](seidel_switching.md#claim-switch-spectral-dichotomy)
forces every nontrivial preserving cut to reach degree 18 or 24 under an
explicit spectral condition. A separate
[quartet-closure criterion](seidel_switching.md#claim-switch-quartet-rigidity)
certifies rigidity. The deductions are ready for independent review;
unconditional switching coverage of the residual d20 branch remains open.

[Reviewed symmetry structure](symmetry_structure.md) gives pair separation,
prime-graph and actual-automorphism support restrictions, and conditional
frontier duplicate-orbit bounds. The
[reviewed two-root gluing quotient](../../docs/general_theorems/symmetry_pair_gluing.md)
classifies compatible overlap maps and full ordered-root completions; its
input-family coverage assumptions remain explicit.

The [degree-19 cross-edge bound](degree19_row_ceiling.md) applies to any
actual degree-19 pivot, including graphs with degree-18 vertices: `x<=289`,
with a single necessary equality profile. Its two claims are ready for
independent review. This is a rerooting tool, not a new global routing scheme.

[Density transfer](density_transfer.md) gives accepted same-family triggers for
increasing neighborhood edges while decreasing antineighborhood edges, exact
single exchanges, and a bounded one-hole repair system with concrete
propagation and obstruction certificates. Its fixed-boundary normalization
preserves the pivot and cross matrix; additional branch predicates need to be
enforced explicitly. The [prototype](density_transfer.py) analyzes supplied
graphs. No order-43 search or new branch closure follows from these results.

Its [density-floor continuation](density_transfer.md#claim-density-floor-two-higher-neighbors)
proves independently reviewed selected-d18c floors of 63, 58, 55 and 51
edges with at most two, three, four and five higher-degree A vertices.
The [sparse-case forcing](density_transfer.md#density-sparse-forcing) narrows
a=50 to at least six higher-degree A vertices and at most 18 actual
degree-18 roots; eligible independent triples force stronger excess budgets.
Forced intrinsic holes, immutable signature guards and exact root-star swaps
provide further repair obligations and triggers. The universal d18c floor
remains 50.
