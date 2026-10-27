# General theorem synthesis

These notes abstract the project's local proofs. The original seven-topic
integration covered twenty-eight independently accepted claims. The
[historical manifest](integration_manifest.json) records the original source
paths and reviewed/integrated hashes; those paths identify historical bytes,
not necessarily current files. No novelty claim, formal certificate, or new
global Ramsey bound is made.

[Boundary profiles](../../research/foundations/boundary_profiles.md),
[signature anchors](../../research/foundations/signature_anchors.md),
[safe augmentation](../../research/foundations/safe_augmentation.md),
[transversal deletion](../../research/foundations/transversal_deletion.md),
[transversal compatibility](../../research/foundations/transversal_compatibility.md),
[cut capacity](../../research/foundations/cut_capacity.md), and
[prescribed-family overlap](../../research/foundations/family_overlap.md)
keep their statements, proofs, independent reviews and changelogs together under
`research/foundations/`. Other topics retain their legacy layout until migrated.
Live dependency links follow the migrated topics. Historical source-hash fields
and comparison records continue to identify the original paths and bytes; they
are not fingerprints of the consolidated files.

A separate [symmetry audit](../../research/reports/2026-10-15-symmetry-audit.md) adds
fourteen independently accepted claims in three notes. Its
[manifest](symmetry_audit_manifest.json) records the revised proof and review
hashes; these claims are separate from the historical twenty-eight above.

A [2026-10-19 audit](../../research/reports/2026-10-19-symmetry-quotients-extensions-audit.md)
adds four independently accepted claims in
[symmetry_quotients.md](symmetry_quotients.md) and three in the branch note
[research/n43/d18/symmetry_extensions.md](../../research/n43/d18/symmetry_extensions.md),
each recorded in a sibling review at its exact reviewed revision.

The [2026-10-19 attachment calculus](ramsey_attachment_calculus.md) supplies
16 independently reviewed statements across four notes, including explicit
restatements of older interface criteria. The substantive additions are
finite uniform-context replacement, critical-face-to-colouring transport,
and structural obstructions lifted through information-equivalent blocks.
The [report](../../research/reports/2026-10-19-ramsey-attachment-calculus.md) records
exact hashes, independent audits, fixed-object validation and limits.

| Theorem family | Abstract hypotheses and conclusion | Original use and limits |
| --- | --- | --- |
| [Mixed attachment calculus](ramsey_attachment_calculus.md) | Root cells have types determined by the homogeneous ranks of their root signatures; exact higher-arity port templates compose by homogeneous-rank convolution. | Unifies induced-core refinements and arbitrary mixed joins; pairwise port checks alone are not sufficient. |
| [Boundary profiles](../../research/foundations/boundary_profiles.md) | A finite paired truncated profile supports exact complete/anticomplete interior gluing, forgetting, uniform introduction, relabelling and context replacement. | Equal-order replacement preserves order and Ramsey-freeness in the stated uniform language, not under arbitrary mixed attachments. |
| [Critical-face transport](critical_face_transport.md) | Critical faces have exact residual capacities; saturation yields labels, actual transversal demands, derived conflict graphs and rigid equality partitions. | Unifies anchor singleton capacities and saturated core-pair packing without assuming an SRG in the abstract theorem; necessary, not sufficient attachment conditions. |
| [Profile obstruction lifting](profile_obstructions.md) | An equal-profile, equal-order representative with an impossible interior symmetry or module excludes the original certified context, even if the original block lacks that feature. | Connects interface replacement to global structural premises; no forbidden state collision is proved unavoidable in every candidate. |
| [Safe augmentation](../../research/foundations/safe_augmentation.md) | A K_r/I_s-free graph one edge below a proved edge cap has a star forest of individually safe additions, with at most r-1 edges. At higher deficit an exact minimal-conflict hypergraph describes feasible addition sets. | Recovers q=1 neighborhood generation; saturated alternatives must remain. |
| [Signature anchors](../../research/foundations/signature_anchors.md) | General K_p/I_q rooted gluing has exact homogeneous union/intersection tests, anchor Hall conditions, singleton capacities, defect identities and weighted excess certificates. | Covers all pivot degrees; weighted aggregation requires explicit loads and nonnegative excess. No perfect cover is asserted. |
| [Transversal deletion](../../research/foundations/transversal_deletion.md) | Deleting a K_r-transversal from an alpha<s graph costs a smaller Ramsey core minimum, mandatory attachments and a balanced internal-edge minimum. Their excess is an exact nonnegative defect budget. | Recovers tau>=4 and the four-set defect budget; the raw four-set threshold is 66, below the needed 68. Smaller-order edge minima remain external inputs. |
| [Transversal compatibility](../../research/foundations/transversal_compatibility.md) | Weighted occupancy plus failure of complementary subsets as transversals forces every small subset of a low-weight set to occur in an independent member. Explicit degree gaps exclude disjoint transversals. | Recovers frontier disjointness without actual-column status. Singleton proofs still require their preliminary case analysis; no isolated tau>=5 theorem follows. |
| [Prescribed-family overlap](../../research/foundations/family_overlap.md) | Equal-degree families with high edge codegrees have either triangle equality and paw-free structure, or no triangles. Anchor and component bounds force a low-overlap edge inside the prescribed family. | At order43, thirteen roots of degree18,19,20,21 give codegree at most10,11,11,12. Family counts are separate hypotheses. |
| [Cut capacity](../../research/foundations/cut_capacity.md) | An input root inequality plus cut demand and multiset/weighted capacities forces counts of the same prescribed root family. | The input q+E bound must be proved at each application; composing with overlap gives both endpoint properties on the same edge. |
| [Disjoint-swap stabilizers](disjoint_swap_stabilizers.md) | Stabilizers of disjoint pair swaps are partition subspaces with pinned components. Pair separation D forces each free component to contain at least 1+ceil(D/2) pairs. | Exact completed-state orbit accounting; partial-state pruning needs separate validation. |
| [Two-root symmetry gluing](symmetry_pair_gluing.md) | Compatible overlap maps are double cosets of the two pointed-neighborhood restriction images; the residual group is a fiber product times the uniform D-cell permutation group. | Exact ordered-root coverage with complete inputs/maps/completions; fixed nonlocal data require the actual enriched-state group. |
| [Order43 symmetry structure](../../research/n43/symmetry_structure.md) | Pair separation at least8, automorphism support at least10, prime G and order24 B, and conditional frontier duplicate-stabilizer bounds. | Kernel at most4 through x141; at x136 the accepted anchor gives p<=10, at least4 singletons and kernel at most2. No new branch closure. |

## Further use

The full x136 frontier is now [excluded](../../research/n43/d18/x136/frontier_exclusion_handoff.md).
At higher x, actual columns may supply the occupancy and nontransversality
hypotheses of the compatibility theorem. Higher-deficit augmentation must
retain saturated alternatives and the full conflict hypergraph. Root-family
applications require their own q+E bounds before using cut capacity and
overlap. These are mathematical directions, not computation authorization.
