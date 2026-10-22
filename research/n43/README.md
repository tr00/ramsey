# Order 43

Scope: graphs G of order 43 with neither K5 nor I5.

[Reduction index](reductions.md) owns the existing global notation, predicates,
and prospective case tree. [Baseline](../../docs/mathematical_baseline.md) records
external premises. This directory is navigation by mathematical scope, not a
new proof of exhaustive case coverage.

| Path | Scope | Coverage distinction |
| --- | --- | --- |
| [d18](d18/README.md) | A degree-18 pivot maximizing e(G[N_G(v)]) among degree-18 vertices | Even-pivot scheme; ties unrestricted; no claim that minimum degree is exactly the pivot degree |
| [d20](d20/README.md) | A chosen pivot has degree 20 | General even-pivot scheme |
| [min-degree20](min-degree20/README.md) | Complement-normalized minimum degree 20 | Alternative scheme; do not impose these assumptions on d20 |

The even-pivot and normalized minimum-degree schemes are alternatives, not
siblings of a single disjoint partition. Canonical root selection and symmetry
coverage remain subject to the obligations in the reduction index.

[Reviewed symmetry structure](symmetry_structure.md) gives pair separation,
prime-graph and actual-automorphism support restrictions, and conditional
frontier duplicate-orbit bounds. The
[reviewed two-root gluing quotient](../../docs/general_theorems/symmetry_pair_gluing.md)
classifies compatible overlap maps and full ordered-root completions; its
input-family coverage assumptions remain explicit.
