# Global saturation bounds

Date: 2026-10-22. Task: `global-saturation-bounds-20261022`.
Author and self-auditor: Main, working alone. Base revision:
`615c47df296f06251067d61dd84bac1b9cebbbcc`.

The proof home is [n43/saturated_bounds.md](../n43/saturated_bounds.md).
Its eight claims are ready for independent review. No claim is accepted,
no branch is closed, and accepted indexes or engine constraints were not
changed. Existing uncommitted work was preserved.

The hypothesis is global K5-saturation of G in R(5,5,43), distinct from
local K4-saturation of an 18-vertex neighborhood. The new results are:

- Every cross-column contains a triangle and meets every independent
  four-set of the pivot neighborhood. Define sigma as the minimum size
  of a transversal containing a triangle; then
  `(42-d)*sigma<=x` and `sigma>=max(3,tau,d-17)`.
- Every pivot neighborhood has at least `ceil((42-d)/3)` triangles.
  Counting K4 incidences gives at least65 copies of K4 in G. Retained
  cuts include triangle capacity three, edge capacity eight, and the
  isolated-column-vertex inequality(1).
- Nonedge codegrees are at least3, with an actual triangle witness.
  At d18, size-three column endpoints have degree18..20, form a clique
  of size at most4, and any two have combined excess at most2.
- At a d18 root, a triangle-containing size-three transversal forces
  `a<=82`; at `a=81` it forces `E_A>=5`, and at `a=82`, `E_A>=14`.
  These give actual-column cross floors149 and156. The a82 result
  recovers an accepted result on its stated census input.
- At a d18 root with `a=85`, a triangle-containing four-set transversal
  forces `E_A>=14`; its paw shape forces15. Thus `E_A<=13` implies
  `sigma>=5`, without asserting unrestricted `tau>=5`.
- Four-set transversals containing triangles have density caps
  85,91,97,105 for pivot degrees18,19,20,21. The proof gives the
  corresponding sigma and column-floor table.
- The disconnected d18 families `K_m disjoint union C` have exact
  sigma values4,5,3 at m=1,2,3. These distinguish sigma from tau,
  without asserting an ambient realization.
- A complete existence normalization takes the denser of a witness
  and its complement, then saturates it. The result has at least452
  edges, at least22 vertices of degree>18, and a maximum-degree pivot
  of degree22,23,or24. Every d18 root in this representative obeys
  `E_A>=a-32`, `x>=274-a>=189`, and `E_B>=61`.

The dense normalization is an existential coverage theorem. The scalar
387..516 edge interval and18..24 degree interval remain the recorded
bounds for an arbitrary saturated member in this task. A dense saturated
representative need not have a d18 vertex; complementation after saturation
may lose saturation. These distinctions prevent incomplete rooted coverage.

The proof uses the published small Ramsey numbers and (4,4) edge maxima
at orders14..17, plus recorded (4,5) edge bounds at18 and24. No uniqueness
or downloaded graph catalogue is needed. The existing local arXiv text
was read for its Appendix A table; no new literature download or novelty
review was performed. The 1992 census premises are not recertified here.

Replay:

```sh
python3 research/reports/2026-10-22-global-saturation-bounds/check.py
```

PASS: fourteen arithmetic membership cells for a81/a82 triangle
transversals; six deficit cells for a85 paw/diamond transversals;
four density-threshold rows; 31,824 scalar normalized d18 cells; and
4,233 tiny labelled graphs with a fixed triangle checking the isolation
inequality's per-column step. The finite checks enumerate elementary
arithmetic and small masks, not ambient Ramsey candidates. They do not
replace independent proof review or certify the literature inputs.

Artifacts are [checker](2026-10-22-global-saturation-bounds/check.py),
[results](2026-10-22-global-saturation-bounds/checks.json), and
[manifest](2026-10-22-global-saturation-bounds/manifest.json). The manifest
records final proof, checker, result, report, and dependency hashes.
No solver, prover, canonicalizer, package installation, graph search,
Lean changes, staging, or commits occurred.

The next mathematical obligation is independent review of the eight claims.
The complete dense normalization particularly shifts a saturated existence
search to degrees22..24; it does not resolve those branches or order43.
