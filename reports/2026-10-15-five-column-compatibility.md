# Equality-frontier size-four exclusion and forced anchor handoff

Integration status (2026-10-15): the user requested an independent subagent
audit and a commit if the revised claims survived. The independent reviewer
accepted all four claims at the original proof hash below, without mathematical
changes. See [the exact-revision review](../n43/d18/x136/review_five_column_compatibility_20261015_independent.md),
SHA-256 `c6b7e29afaa61a1be112b1ecb47938c7be7452fe6eff96d09564e2834f19a14f`.
The historical handoff below is retained. Its ready/pending labels describe
the author stage; the current state is independently accepted on the recorded
external premises. A banner was added to the proof, preserving its entire
reviewed body. Branch navigation, Section8.7 of the reduction index, and the
theory map now record r1 excluded, only r0:s8..10 live, and the unavoidable
degree-eight anchor. The complete equality frontier remains open.

Integrated proof SHA-256:
`2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e`.
Integration checked the reviewed body byte-for-byte after removing only the
added banner, replayed the independent review's arithmetic script, and checked
all new local links and anchors. The user-authorized commit contains this
proof, its independent review and historical report, frontier navigation,
the reduction/theory updates, and this task's WORK row. Unrelated concurrent
cell and symmetry work is excluded from the commit and preserved in place.

Date: 2026-10-15. Task token: `five-columns-20261015`.
Author and self-auditor: Codex. Starting revision:
`7ebbef265ef9b55746b798b337b86e4fd6140045`.

The selected handoff was joint size-five-column compatibility in the live
x136/r0,r1 branches from
[the previous joint research report](2026-10-14-d18-joint-discoveries.md).
The continuation produced a shorter full-interface argument, recorded in
[five_column_compatibility.md](../n43/d18/x136/five_column_compatibility.md).

## Principal deductions and exact scope

Four claims are ready for independent review:

1. Elementary neighborhood and complementary-neighborhood triangle bounds
   imply that K4/I4-free graphs of orders7..13 have at most
   16,21,27,31,37,43,49 edges respectively. No new census input is used.
2. In the full degree18 equality frontier, a set of at most eleven vertices,
   all of internal degree at most seven, cannot meet every I4 of A.
   Its deletion leaves more edges than the first claim permits.
3. The set of all degree-at-most-seven vertices has size at most ten by
   total degree170 and the degree ceiling13. Some I4 avoids it. The
   actual-interface degree-sum cap32 forces all four of its degrees to
   be eight. Relative to this anchor, the24 actual columns have exactly
   twelve singleton signatures, in four triangle classes of size three,
   and twelve two-element signatures. Each anchor vertex occurs in six
   two-element signatures.
4. Every four-set I4 transversal has internal degrees at least nine by the
   already accepted deletion/attachment lemma. It therefore misses the
   forced degree-eight I4. Hence tau(I4(A))>=5, every column has size>=5,
   and the entire x136/r1 branch is excluded **conditional on review**.
   All r>=1 are covered; only r0,s8..10 remains in the equality frontier.

The actual24-column anchor degree-sum bound is essential. This does not
prove the isolated universal transversal-five conjecture for every85-edge
K4/I5-free order18 graph. Nor does it exclude r0, all x136, the unrestricted
degree18 branch, or order43. No change to the known global R(5,5) interval
is claimed. Novelty was not checked.

## Review state, correction, and provenance

Exact proof SHA-256 at handoff:

```text
a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b
```

The four anchors are `claim-five-columns-core-caps`,
`claim-five-columns-low-transversal`,
`claim-five-columns-degree-eight-anchor`, and
`claim-five-columns-no-four-transversal`. All have Kind local-deduction,
Review state ready, and Search use none pending independent review.
Input hashes and numerical literature dependencies are recorded in the proof.
No new dependency or changed existing claim is silently introduced.

An initial author calculation omitted independent triples from Goodman's
identity. The self-audit caught the error before integration or pruning.
The final argument explicitly counts both triangles and independent triples,
bounding the former in H neighborhoods and the latter in complement-H
neighborhoods. Both types are triangle-free with maximum degree at most3.
This supplies corrected, stronger sufficient edge bounds. The erroneous
intermediate argument is superseded and has no search use.

Exact rational arithmetic checked every allowed degree value in all seven
affine-bound rows, every integer floor, and every strict deletion inequality.
Local proof links and claim anchors resolve; git diff --check passed.
This is arithmetic validation and author self-check, not independent review
or graph enumeration. No solver, proof checker, theorem prover, graph
canonicalizer, downloads, installations, CNFs or proof traces were used.

## Integration and next focused task

Independent exact-revision review is the remaining evidence gate. The root
[workflow](../docs/workflow.md) requires distinct author/reviewer identities;
this single-author continuation has not supplied that review. Consequently
accepted branch navigation, reduction index, and theory map were left intact.
After acceptance, integrate the forced degree-eight anchor and the r1
exclusion with their precise external premises and coverage; do not mark the
whole x136 branch closed.

The next breakthrough target is compatibility of the forced anchor's four
singleton triangles with its twelve two-element columns, especially the
eight to ten size-five columns in the remaining r0 branch. The unavoidable
anchor now gives exact signatures; all actual B adjacencies, A induced
graphs, and anchor choices must remain covered.

Owned changes are the new proof, this historical report, and the task's own
WORK row. Other concurrent cell integration files and shared navigation
changes were preserved. Ownership is released at handoff. Nothing was
staged or committed.
