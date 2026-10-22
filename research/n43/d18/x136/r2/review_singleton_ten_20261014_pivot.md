# Independent review of the degree-ten singleton contradiction

Editorially condensed on 2026-10-21; [original audit and lineage](../../../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
`r2_low_s` author. The reviewer did not contribute to this proof before
receiving its final draft.

Claim: `low_excess_columns.md#claim-r2-low-excess-06`.

Reviewed revision: exact uncommitted proof SHA-256
`2e6f85a9ebf910adfbe1cf4fa66c8a66452de34161d9fb38b458484f3b0a7868`.
Claims01--05 retain their previous mathematical text. Their separate
exact-revision reviews remain preserved; this is a new Claim06 audit.

Dependencies reviewed: arbitrary-transversal Claim01 and its direct
diamond argument, independently reviewed at the earlier exact proof hash
`116b354723ee5c7654beabf56709110333a0fd54332dbcdbf6228d3a2cf7fa77`;
the equality row and anchor identities; the four-transversal proof;
6<=d_A<=13. For the r=2 closure composition, the reviewer also checks
the accepted normal form Claim05 at
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`
and the two-overlap exclusion `independent_triples.md#claim-r2-triples-06`
at `fed38dd2c1bac3d580f788d4ac842da5c5b02c4fd2cc43e46fd595fd9b7f5b5f`.
Numerical maxima85 for (4,5,18),79 for (4,5,17),50 for (4,4,14), and
minimum50 for (4,4,15) remain external census premises, not recertified.

## Independent checks

Claim 06 and its r2 coverage composition were independently checked.
A degree 10 singleton overlap gives exact U total 100..104. Every I4 case,
including the 6+8+8=22 equality, is covered. Low-set size 5 gives 55>52 on the
13-core; the small hitter{a}+X+D_i forces p>=2, then degree capacities force
ell6 and p+D<=7. A high U vertex in an overlap-avoiding I4 forces p2/D5
and both transversal sums40, producing a prohibited low-degree hitter.
Every I4 therefore uses two of the six low vertices; avoidance of each
four-subset makes every low pair independent, yielding I6.

The original s4..7 coverage chain was checked: disjoint closure at s4,
singleton11 at s5, saturated-label closure at s7, and size1/2 degree 10
normal form at s6. The separately accepted global-codegree contradiction
excludes size 2 and this general theorem excludes size 1.

Outcome: accepted on the recorded external premises. Permitted search use:
propagate the general prohibition on singleton degree10 intersections of
four-set I4-transversals under the full equality-frontier assumptions;
terminate s=6 and the entire r=2 child after assembling the separately
accepted s=4,5,7 and overlap coverage chain.

Limits: this is an independent mathematical branch proof with literature
census dependencies, not a formal solver certificate or an order43
decision. It does not exclude r=0 or1, any above-frontier x branch,
or degree18 as a whole. The census and small Ramsey-number certificates
were not recertified, and novelty was not checked. No graph enumeration,
solver, download, or installation was used. Changes to the mathematical
proof or its dependencies require renewed review.
