# General theorem synthesis

Date: 2026-10-15. These notes abstract the project's local proofs. Twenty-eight
claims across seven proof notes have independent exact-revision acceptance;
reviews are linked inside each note. The original author-stage labels remain
in the proof bodies, with an integration banner resolving their current state.
[The manifest](integration_manifest.json) records reviewed and integrated hashes.
No novelty claim, formal certificate, or new global Ramsey bound is made.

A separate [symmetry audit](../../reports/2026-10-15-symmetry-audit.md) adds
fourteen independently accepted claims in three notes. Its
[manifest](symmetry_audit_manifest.json) records the revised proof and review
hashes; these claims are separate from the historical twenty-eight above.

| Theorem family | Abstract hypotheses and conclusion | Original use and limits |
| --- | --- | --- |
| [Safe augmentation](safe_augmentation.md) | A K_r/I_s-free graph one edge below a proved edge cap has a star forest of individually safe additions, with at most r-1 edges. At higher deficit an exact minimal-conflict hypergraph describes feasible addition sets. | Recovers q=1 neighborhood generation; saturated alternatives must remain. |
| [Signature anchors](signature_anchors.md) | General K_p/I_q rooted gluing has exact homogeneous union/intersection tests, anchor Hall conditions, singleton capacities, defect identities and weighted excess certificates. | Covers all pivot degrees; weighted aggregation requires explicit loads and nonnegative excess. No perfect cover is asserted. |
| [Transversal deletion](transversal_deletion.md) | Deleting a K_r-transversal from an alpha<s graph costs a smaller Ramsey core minimum, mandatory attachments and a balanced internal-edge minimum. Their excess is an exact nonnegative defect budget. | Recovers tau>=4 and the four-set defect budget; the raw four-set threshold is 66, below the needed 68. Smaller-order edge minima remain external inputs. |
| [Transversal compatibility](transversal_compatibility.md) | Weighted occupancy plus failure of complementary subsets as transversals forces every small subset of a low-weight set to occur in an independent member. Explicit degree gaps exclude disjoint transversals. | Recovers frontier disjointness without actual-column status. Singleton proofs still require their preliminary case analysis; no isolated tau>=5 theorem follows. |
| [Prescribed-family overlap](family_overlap.md) | Equal-degree families with high edge codegrees have either triangle equality and paw-free structure, or no triangles. Anchor and component bounds force a low-overlap edge inside the prescribed family. | At order43, thirteen roots of degree18,19,20,21 give codegree at most10,11,11,12. Family counts are separate hypotheses. |
| [Cut capacity](cut_capacity.md) | An input root inequality plus cut demand and multiset/weighted capacities forces counts of the same prescribed root family. | The input q+E bound must be proved at each application; composing with overlap gives both endpoint properties on the same edge. |
| [Normalized pair coverage](../../n43/min-degree20/pair_coverage.md) | The normalized minimum-degree20 branch splits into n20>=13 and n20<=12. The latter forces n21>=20. | Complete conditional branch coverage by a degree20 edge of overlap<=11 or degree21 edge of overlap<=12. Gluing all permitted maps/completions is still required. |
| [Disjoint-swap stabilizers](disjoint_swap_stabilizers.md) | Stabilizers of disjoint pair swaps are partition subspaces with pinned components. Pair separation D forces each free component to contain at least 1+ceil(D/2) pairs. | Exact completed-state orbit accounting; partial-state pruning needs separate validation. |
| [Two-root symmetry gluing](symmetry_pair_gluing.md) | Compatible overlap maps are double cosets of the two pointed-neighborhood restriction images; the residual group is a fiber product times the uniform D-cell permutation group. | Exact ordered-root coverage with complete inputs/maps/completions; fixed nonlocal data require the actual enriched-state group. |
| [Order43 symmetry structure](../../n43/symmetry_structure.md) | Pair separation at least8, automorphism support at least10, prime G and order24 B, and conditional frontier duplicate-stabilizer bounds. | Kernel at most4 through x141; at x136 the accepted anchor gives p<=10, at least4 singletons and kernel at most2. No new branch closure. |

## What the synthesis adds

The most consequential application is the normalized pair-coverage theorem.
It combines degree counts with the extended family theorem, so it needs no
small-excess or neighborhood-density assumption. It applies to the globally
normalized minimum-degree20 branch, not an arbitrary degree20 pivot.

The proofs repeatedly turn a scalar budget into a structural statement:
signature surplus becomes missing/oversized-signature defects; a deletion
budget becomes attachment rigidity; high codegree becomes triangle equality;
and root capacities become a usable family count. Transversal avoidance then
turns local degree restrictions into a large forbidden independent set.

The basic tools are standard extremal graph and set-system methods: incidence
counts, Ramsey bounds, Hall, Turan, equality analysis, greedy independence,
and weighted sums. Potentially distinctive results are the precise transversal
compatibility criteria, prescribed-family overlap theorem, and their branch
coverage synthesis. Establishing novelty requires a literature review.

## Scope of further work

Use actual size-five columns in the live r0/r1 frontier to seek the occupancy
and nontransversality hypotheses of the abstract compatibility theorem. At
higher deficits, analyze the safe-addition conflict hypergraph while retaining
saturated alternatives. For root coverage, prove application-specific q+E
bounds and feed the resulting family counts into the overlap theorem. In the
normalized branch, every allowed degree20/21 pair and overlap map remains a
future generation obligation. None of these directions authorizes a solver,
catalogue download, or larger-order computation.
