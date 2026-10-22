# The 69-edge degree-18 neighborhood decomposition

Date: 2026-10-21. Task: `a69-decomposition-20261021`.
Author: Main, working alone. Base revision:
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`, with concurrent user changes
preserved. User requested structural research on the entire 69-edge slice.

## Result and handoff

[The proof note](../n43/d18/a69_decomposition.md) gives nine claims, all
ready for independent review, with no executable pruning or acceptance change.
It gives a disjoint exhaustive structural split, not an isomorphism census
or an ambient exclusion. The new families are parametrized by actual cores
and attachment sets with necessary and sufficient local tests.

The critical-core cases have explicit classifications: a singleton
independent-four transversal is equivalent to a pendant 17-core; a cut vertex
forces a 16-core, an eight-attachment vertex, and a leaf, with transversal
number one or two. Two-connected two-transversal neighborhoods have a
16-core and two attachments totalling eight or nine edges, with exact
connectivity formulas. Adjacent vertex splitting of a 17-core realizes
pure examples with transversal number two and connectivity two through five.
Neither pure connectedness nor even connectivity five forces a large
transversal in this slice.

All remaining neighborhoods have transversal number three through eight.
Their maximum induced `(4,4)` core orders are 15 through ten. A second
complete construction uses a minimum-degree vertex, a triangle-free panel
of two through seven vertices, and a `(4,4)` antineighborhood core. Exact
exchange witnesses enforce minimum transversal cardinality, going beyond
individual private triples. At transversal number eight, at least six
degree-seven vertices give simultaneous maximum ten-core arrangements.

Ambient transfer supplies a second actual `(4,4)` core in B for every
minimum-degree vertex. In the leaf families the paired cores have orders
16/16 or 16/17, and their common nonneighbors require eight or nine
neighbors in the respective cores. Columns omitting the leaf carry at
least eight vertices of the first core. These are extension restrictions;
the cross-core matrix and other attachment choices remain unresolved.

## Validation and exact revision

The [retained scalar checker](2026-10-21-a69-checks.py) runs with

```sh
python3 research/reports/2026-10-21-a69-checks.py
```

It passed 13 ordered two-panel size profiles, 1,398 core/panel budget and
degree-floor equivalences, 396 endpoint identities, incidence and critical-core
degree accounting, and transversal-exchange equivalence on three explicit
small set systems. It does not enumerate graphs or certify the mathematical
claims independently. All proof-note links, anchors, claim IDs, review states,
and code fences were checked. The author's self-audit checked each forbidden-set
distribution and each connectivity deletion bound separately.

| Artifact | SHA-256 |
| --- | --- |
| `research/n43/d18/a69_decomposition.md` | `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085` |
| `research/reports/2026-10-21-a69-checks.py` | `47a146ee86d6c656dbb85c1d0804c130ce88629b45ee4595081023299737222b` |

External premises are the recorded smaller Ramsey numbers and published
`(4,4)` edge intervals; the order-ten interval is sufficient and derived
from the existing elementary cap. No catalogue completeness beyond these
recorded premises is introduced. No solver, graph enumeration, canonicalizer,
installation, download, Lean or engine change, staging, or independent
review occurred. The other-checkout x137/x138 closures are not premises.

## Outstanding work

An independent reviewer should audit the nine claims at the exact source hash
above before integration into structural generation. The central open problem
is compatibility of the actual attachment systems, particularly multiple
maximum cores and private-witness exchange demands. No finite isomorphism
classification, universal obstruction, or closure of a named 69-edge
ambient subfamily has been obtained. Shared accepted-result indexes were
left unchanged; this report supplies the handoff without promoting draft
mathematics. The task's WORK row is removed on completion.
