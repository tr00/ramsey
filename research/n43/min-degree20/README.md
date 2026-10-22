# Normalized minimum degree 20

Branch name: `research/n43/min-degree20`. State: open.
Scheme: complement-normalized minimum degree; distinct from even-pivot d20.

The exact complement selector, degree restrictions, and parametrization remain
in [reduction index](../reductions.md), sections 9 and 10.2. This navigation
record does not complete the other minimum-degree cases or audit the selector.

Branch-specific follow-up notes belong here. Shared symmetry arguments should
retain their explicit normalization and coverage assumptions.

[Independently reviewed pair coverage](pair_coverage.md) supplies a disjoint,
exhaustive selection rule: n20>=13 guarantees a degree-20 edge of codegree
at most11; n20<=12 forces n21>=20 and a degree-21 edge of codegree at most12.
This needs no small-excess or neighborhood-edge-census hypothesis. It supplies
existence coverage for later two-root gluing with all overlap maps/completions
retained, and does not decide this branch. The degree-21 endpoint choice is
compatible with minimum degree20; arbitrary even-pivot d20 remains separate.

The [reviewed two-root symmetry quotient](../../../docs/general_theorems/symmetry_pair_gluing.md)
retains one compatible overlap map per double coset and one full completion
per residual-group orbit. It preserves the pair-coverage theorem's exact
family assumptions. Complete pointed inputs, all allowed overlap types and
checked orbit omissions remain future implementation requirements.
