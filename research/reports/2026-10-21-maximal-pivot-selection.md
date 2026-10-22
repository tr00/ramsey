# Maximal-density degree-18 pivot selection

Date: 2026-10-21. Task: `maximal-pivot-selection-20261021`.
Kind: user-requested mathematical convention update, not a new exclusion.

## Change

The [degree-18 branch assumptions](../n43/d18/README.md) now choose v
maximizing e(G[N_G(v)]) among every degree-18 vertex in the fixed graph G.
The [reduction index](../n43/reductions.md), sections 3 and 8, and
[order-43 branch table](../n43/README.md) use the same convention.

The branch assumptions record finite nonempty maximization, unrestricted ties,
and the contradiction from a strictly denser eligible destination. No minimum-x
or minimum-excess condition is imposed. A destination need not preserve a child
predicate. Existing proof statements quantified over arbitrary roots retain
that scope. No proof body, claim anchor, review status, Lean declaration,
engine encoding, or executable pruning rule was changed.

## Validation and limits

A throwaway Python check resolved all 157 local Markdown link targets across
the 3 changed documents; none were missing. The convention was self-checked
for nonempty eligibility, fixed graph orientation, unrestricted ties, and
lack of preservation of x or excess. This is not independent proof review or
Lean verification. No graph search, solver invocation, build, or test run was
needed for this documentation-only change. Unique canonical-root selection
and executable coverage remain separate obligations.
