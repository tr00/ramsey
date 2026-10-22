# Degree-18 dense-pivot coverage work, 2026-10-14

Task: `dense-pivots-20261014`. Author: pivot-coverage agent.
Owned proof: `research/n43/d18/dense_pivot_coverage.md`. Shared indexes and Git staging
are reserved for the coordinator. This report is historical, not a separate
proof or a novelty claim.

The main deduction supplies a simultaneous guarantee previously missing from
the dense-family discussion: any prescribed family of at least thirteen
degree-18 vertices contains an edge whose codegree is at most ten. Both
endpoints belong to that very family. Its proof does not require any edge
census. Under the contrary overlap assumption, triangle intersection equality
forces paw-freeness, four-clique incidence gives a contradiction, and an actual
independent-four neighborhood anchor restricts the remaining components. A
direct proof of the needed complete multipartite component structure is
included instead of adding a graph-classification premise.

For odd h and W=6h-D with D=0,2,4,6, a high-degree cut surplus forces
explicit numbers of roots with exactly (h+1)/2 higher-degree neighbors.
Their profiles have q<=1+D/2. At D=0 the family has q<=1, E=3h+3,
and each root's x is in {139+3h,141+3h}. Family sizes for h=1,3,5,7,9,11
are respectively24,26,26,24,20,14. Thus each listed family has a same-edge
overlap-at-most-ten guarantee, including h7/W42, h9/W54 and h11/W66.
The h5/W30 conclusion strengthens the prior q<=2 endpoint family to q<=1.
D=2 similarly gives two endpoint neighborhoods with at least83 edges for
h=1,3,5,7,9. The four-transversal theorem applies at both endpoints in
these D<=2 rows.

Claims are stable anchors `claim-dense-pivot-01` through
`claim-dense-pivot-03` in the proof note. The first handoff revision has
SHA-256 `ffb876fc478698c1a32a86298c29863bdfd562ca646706f8d93e630dc0a215d1`.
Independent review and any revised exact hashes are recorded in the sibling
reviews and coordinator's integration report; the author does not promote
its own self-check to independent acceptance.

Algebra and table entries were checked with the Python standard library's
`fractions.Fraction` and integer operations on the displayed formulas. This
was bounded arithmetic, not graph enumeration. No solver, proof checker,
canonicalizer, installation, dataset acquisition, or catalogue search was
performed. Dependencies retain their existing external census status.

No branch closes. The exact h,W predicates are conditional, and no general
small-h or small-W theorem was obtained. The unavoidable pair families are
overlapping coverage reductions; future exhaustive gluing must retain every
allowed overlap map and Ramsey-compatible completion. The file does not
assert x<=142 for the degree-18 branch or any change to R(5,5).
