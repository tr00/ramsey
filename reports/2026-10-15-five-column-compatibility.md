# Equality-frontier forced anchor and size-four exclusion

Date: 2026-10-15. Task: `five-columns-20261015`. Author/self-auditor: Codex.
Starting revision: `7ebbef265ef9b55746b798b337b86e4fd6140045`.

All four claims in [the proof](../n43/d18/x136/five_column_compatibility.md)
were independently accepted without mathematical changes by
[the sibling reviewer](../n43/d18/x136/review_five_column_compatibility_20261015_independent.md).
The original author-stage ready/pending labels are historical.

| Stable claim anchor | Result |
| --- | --- |
| `claim-five-columns-core-caps` | Corrected census-free core caps at orders7..13:16,21,27,31,37,43,49. Later finite-moment work sharpens the last three. |
| `claim-five-columns-low-transversal` | In the full x136 interface, <=11 vertices of A-degree<=7 cannot meet every I4. |
| `claim-five-columns-degree-eight-anchor` | An unavoidable degree-eight I4 has twelve singleton and twelve pair column signatures; singleton classes are triangles of size 3. |
| `claim-five-columns-no-four-transversal` | Every four-transversal has degrees>=9, misses that anchor and is impossible. Thus tau>=5 and all actual columns have size>=5. |

This excluded all r>=1 children, leaving r0,s8..10 at that date. The
[later reviewed full closure](2026-10-19-x136-frontier-closure.md) excludes
the remaining x136 branch. The anchor argument uses actual24-column
incidences and does not prove the isolated universal transversal-five
conjecture for all 85-edge K4/I5-free graphs of order 18.

The author's initial Goodman calculation omitted independent triples.
Self-audit caught it before integration or pruning; the reviewed proof counts
both triangles and independent triples in their correct neighborhoods. That
discarded intermediate argument has no search use.

Provenance:

- Reviewed proof: `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b`.
- Original audit: `c6b7e29afaa61a1be112b1ecb47938c7be7452fe6eff96d09564e2834f19a14f`.
- Integrated proof: `2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e`.

Author checks used exact rational arithmetic on affine bounds, integer floors
and strict deletion comparisons. Integration matched the reviewed body after
removing only its banner, replayed the audit arithmetic and resolved links.
External numerical inputs remain those in the proof. No solver, graph
enumeration or formal certificate was involved; no novelty or global Ramsey
bound was claimed. The original author handoff and integration details remain
in Git at `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.
