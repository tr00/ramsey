# Independent review of low-excess r=2 compatibility

Editorially condensed on 2026-10-21; [original audit and lineage](../../../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-14. Reviewer: `r2_triples` agent, distinct from the
`r2_low_s` author and the coordinator who supplied the diamond observation.

Claim(s): [Claims 01--03](low_excess_columns.md) with stable anchors
`claim-r2-low-excess-01`, `claim-r2-low-excess-02`, and
`claim-r2-low-excess-03`.

Reviewed revision: exact uncommitted proof SHA-256
`f6a4261cf1a4fd1c10a0a7703cb81c93f1208f64877a34ab481760aefcbe9f14`.
The review concerns the mathematical text at that hash; later metadata-only
integration does not replace this provenance.

Dependencies reviewed: frontier note SHA-256
`0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`;
small-column note `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733`;
earlier pairwise note
`3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85`;
four-transversal note
`4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`.
Published extrema remain recorded external premises: maxima 85 for
(4,5,18), 79 for (4,5,17), and 50 for (4,4,14), together with the minimum
50 for (4,4,15). No catalogue completeness assertion was recertified.

## Outcomes by reviewed revision

| Revision | Accepted scope |
| --- | --- |
| `f6a4261cf1a4fd1c10a0a7703cb81c93f1208f64877a34ab481760aefcbe9f14` | Claims 01--03; arbitrary four-transversal bounds, disjoint exclusion and s4 closure. |
| `116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77` | Claims 01--04; adds general singleton-degree 11 exclusion and sole-large-column/s5 coverage. |
| `2e6f85a9ebf910adfbe1cf4fa66c8a66452de34161d9fb38b458484f3b0a7868` | Claims 01--06; exact s6 normal form, general singleton-degree 10 exclusion and full r2 coverage with separately reviewed triple lemmas. |

Each renewal independently checked the new reasoning and the applicability of
unchanged earlier claims; the older outcomes remain historical.

The renewed singleton statements are `claim-r2-low-excess-04` and
`claim-r2-low-excess-06`.

## Decisive checks

Arbitrary four-transversals have member degrees9..11 and degree sum 38..40;
the diamond attachment cap 22 supplies the upper endpoint. Disjoint pairs
force an I4 degree pattern whose low-set avoidance yields I6. The deletion
contradiction is at least 55 versus at most 52 edges on a 13-vertex remainder.
No B endpoint is assumed for an abstract transversal.

For singleton degree 11, U-degree total 101..105 leaves low-set sizes6/7;
the degree equality and small hitting-set arguments exclude both, then
four-subset avoidance gives I6. For singleton degree 10, all I4 cases are
covered, including the permitted6+8+8=22 case. Total100..104, the hitter
{a}+X+D_i, and p+D<=7 force six low vertices; the only high exception
p2/D5 would make both transversal sums40 and yields another prohibited
hitter. Thus every I4 uses a low pair, again giving I6.

Claim 05's saturated common-neighborhood count gives overlap size1/2,
independent and degree 10. The separate global-codegree lemma excludes size 2;
Claim 06 excludes size 1. The complete original s4..7 range is covered by the
disjoint, singleton11, s7 saturation and s6 arguments. The parallel triple
note was read at
`885018b3583453740b5875cc360ca9d8f9e86960f41939f5568facfabf76859d`.

Outcome: **accepted**, Claims 01--06 at the final hash, with the stated
independently reviewed parallel dependencies. Use: scoped propagation,
sole-large/s5 rejection, s6 rejection and complete x136/r2 termination.
Limits: equality-frontier assumptions and published census premises remain;
no whole x136/d18/order43 closure, formal certificate, catalogue replay or
novelty assessment was supplied by this review.
