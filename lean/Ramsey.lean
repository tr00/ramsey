module

import Mathlib
import Ramsey.Basic

/-!
# Ramsey

Lean 4 formalizations for the R(5, 5) Ramsey project. This root module is
scaffolding only: no result from `results.md`, `n43/`, or `docs/` is
formalized here yet.

Build (from this directory):

    lake exe cache get   # fetch prebuilt Mathlib artifacts once
    lake build

Per-file `import Mathlib.Combinatorics.…` lines are preferred over
`import Mathlib` as the collection grows.
-/
