# Independent audit and integration of symmetry reductions

Date: 2026-10-15. Task: `symmetry-audit-20261015`.
Coordinator/author: Codex `/root`. Independent reviewers: swap, structure,
and gluing subagents, explicitly authorized by the user. Audit base revision:
`249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`.

All fourteen revised claims survived independent exact-revision review.
The original [one-hour handoff](2026-10-15-symmetry-hour.md) is preserved as
historical author-stage evidence. The
[manifest](../docs/general_theorems/symmetry_audit_manifest.json) records
reviewed-body, integrated-file, and review hashes with claim assignments.
No earlier pending symmetry-extension claim was promoted by this audit.

| Proof | Claims | Independent review |
| --- | --- | --- |
| [Disjoint-swap stabilizers](../docs/general_theorems/disjoint_swap_stabilizers.md) | 01-02 | [Swap audit](../docs/general_theorems/review_disjoint_swap_stabilizers_20261015_swap_auditor.md) |
| [Two-root symmetry gluing](../docs/general_theorems/symmetry_pair_gluing.md) | 01-03 | [Renewed gluing audit](../docs/general_theorems/review_symmetry_pair_gluing_20261015_gluing_auditor_revised.md) |
| [Order43 symmetry structure](../n43/symmetry_structure.md) | 01-04,07-09 | [Structure audit](../n43/review_symmetry_structure_20261015_structure_auditor.md) |
| Same structure proof | 05-06 | [Final exact-revision swap renewal](../docs/general_theorems/review_disjoint_swap_stabilizers_20261015_swap_auditor.md) |

## Corrections and renewed review

The original gluing setting allowed fixed colors but used uncolored overlap
isomorphisms. Its [original audit](../docs/general_theorems/review_symmetry_pair_gluing_20261015_gluing_auditor.md)
gave changes-requested: two red/blue edgeless overlaps can be identified by
an incompatible color swap. The revised setting requires the whole overlap
isomorphism torsor and automorphism group to preserve the same colors. It
also explicitly distinguishes D-only colors from fixed D-to-side signatures:
the latter can couple side and D permutations, requiring the actual enriched
state stabilizer. All three revised claims were independently accepted.

Structure Claim06's orbit-table terminology could confuse the duplicate
candidate group K_M with its completed stabilizer L. The revision explicitly
names K_M as the action and L as the completed graph's stabilizer. The table
and all counts survived renewed review. Claim02 now excludes nonidentity
products of at most four swaps, avoiding the literal zero-swap exception.

The structure reviewer suggested a stronger Claim09. The accepted x136
anchor has four singleton anchor-signature classes, each of size three.
Complete duplicate signatures cannot cross those classes, and multiplicity
at most two leaves a singleton in each odd class. Thus there are at least
four singleton complete signatures, and p<=10, improving the original
p<=11. The revised proof received renewed exact-hash acceptance. The anchor
was already independently accepted in its own task and is not newly proved
or promoted here; its precise census premise chain remains inherited.

The proof integration banners also resolve historical metadata: frontier
applications of Claims07-08 inherit forced-edge/multiplicity premises, and
Claim09 inherits the anchor chain. The older introductory sentence saying
only Claim06 uses frontier census premises is superseded by that explicit
scope clarification. Historical ready/unreviewed anchor labels are resolved
by the anchor's separate accepted integration banner.

## Accepted deductions and implementation limits

Exact disjoint-swap stabilizers are partition subspaces with pinned components.
Pair separation at least eight forces each free component to contain at least
five pairs. At p12 this gives at least1024 labeled completions per candidate
swap orbit and stabilizer order at most four. Through x141 the rooted
restriction kernel has order at most four. At x136 the accepted anchor
strengthening gives p<=10 and kernel order at most two, with B-label orbit
at least24!/2. These are label counts, not measured running-time gains.

The five-edge-pair rigidity and exclusion of a second free component are
accepted on their exact automorphism assumptions. The two-six-pair possibility
at p12 through x139 remains unresolved. Pair separation, automorphism support
at least ten, and primeness of G and order24 B were independently checked.
No primeness condition is imposed on order18 A or on temporary partial modules.

The compatible overlap maps are classified exactly by double cosets. After
choosing a map, the residual group is a fiber product including both side
restriction kernels, times the permutation group on the uniform D cell.
Complete staged ordered-root coverage requires all admissible pointed inputs,
maps and full completion orbits. Normalized degree20/21 pair existence and
conditional degree18 family premises are retained without enlargement.

The coordinator added accepted-status banners while preserving each revised
reviewed proof body byte-for-byte, then integrated narrow navigation links,
Sections10.5-10.6 of the reduction index and the theory map. The manifest's
reviewed hashes are verified against the body after removing only the banner.
Review histories and initial rejected scopes remain preserved.

Validation: independent mathematical reviews; exact integer replay of module
bounds, factorial/orbit counts and five-component partition sizes; unique
claim anchors and all new local links; exact review/body/manifest hashes;
whitespace checks; staged-content inspection. Existing unrelated working-tree
changes are excluded from this task's commit and preserved in place.

The user authorized committing the surviving revisions. The commit contains
three proofs, four review files, historical and audit reports, the manifest,
and this task's navigation/theory/WORK changes. External Ramsey and census
premises were checked for applicability, not recertified. No graph search,
solver, theorem prover, canonicalizer, download, installation, new construction,
branch closure, novelty review or implemented exhaustive certificate is supplied.
