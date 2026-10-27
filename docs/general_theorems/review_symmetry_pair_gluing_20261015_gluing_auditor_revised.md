# Independent renewed review of two-root symmetry gluing

Editorially condensed on 2026-10-21; [original audit and lineage](../../research/reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Review task: `audit_pair_gluing`.

Claim(s): [pair gluing](symmetry_pair_gluing.md),
`claim-pair-gluing-01`, `claim-pair-gluing-02`, and
`claim-pair-gluing-03`, together with the order-43 application table.

Author and reviewer: Codex, task `symmetry-hour-20261015`; reviewer
`/root/audit_pair_gluing`, a distinct agent performing an independent
mathematical review. The author self-check is not acceptance evidence.

Reviewed revision: exact uncommitted proof SHA-256
`4ece07911564de0370a787129e46fa359b4157ec6e5bbe41450990dec1c771f4`.
The full revised proof was re-read after verifying this hash.
Working HEAD at the original audit was
`249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`; the exact file hash, rather
than that commit, identifies the audited uncommitted proof.

This supersedes the changes-requested outcome of the
[original exact-revision review](review_symmetry_pair_gluing_20261015_gluing_auditor.md)
only for the revised proof. The original review remains historical evidence
about proof hash `9d57200109c45fcaca71167f209781a4f3a10fd5b8de8a79459396c9b796391b`.

## Decisive independent checks

The repaired setting uses one common color alphabet and only compatible,
color-preserving overlap maps. The original red/blue counterexample is
excluded. Fixed nonlocal signatures may couple side and D actions, so the
full-group formula remains restricted to uniform unstructured D.

For Claim 01, phi' rho_u(a)=rho_v(b) phi gives the exact side action;
writing phi=phi0*h proves the double-coset classification. For Claim 02,
ordered roots preserve the four incidence cells, the side restrictions form
a fiber product, and each common overlap image has a product of kernel-size
lifts. The vertex action is faithful; the free-edge action need not be.
For Claim 03, complete pointed representatives, compatible maps and full
vector orbit minima preserve every admissible ordered-root completion.

Application counts give |D|=43-2d+lambda and lambda>=d-18. All three revised claims are
accepted, conditional on complete inputs/maps/completions.

## Dependencies reviewed

Claims 01--03 were derived independently from their displayed finite graph
and permutation hypotheses. Their core group theory requires no Ramsey
theorem, catalogue, or computational classification. The order-43 application
dependencies were read at these exact versions:

| Dependency | SHA-256 |
| --- | --- |
| `research/n43/d18/dense_pivot_coverage.md` | `e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a` |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
| `docs/general_theorems/family_overlap.md` | `6fbd343167de8f0d43985ecf11d39fff9060b867680a91c12347772ffda86e87` |
| `research/n43/d18/review_dense_pivot_coverage_20261014_low_s.md` | `9d23cb041c1d128c24236916f75dbe4c469111945c4d1941daba4c83bb813d59` |

The previous independent reviews concern their recorded exact proof revisions;
current integration banners are not themselves mathematical evidence. For
this review, the family theorem statements and their application hypotheses
were read, and the normalization/count consequences and both numerical
family-overlap substitutions were separately checked. The application remains
conditional on those stated family theorems and their explicit classical
Ramsey premises. Those premises were checked for applicability, not
recertified. No external Ramsey premise is needed for Claims 01--03.

The required project instructions and starting notes were read, including
the exact ambient-type warning: a single neighborhood is `(4,5)`-free and
may contain `I4`, while an antineighborhood is `(5,4)`-free.

## Repair verification

The revised setting defines every overlap map and automorphism to preserve
fixed colors from a common alphabet. It requires consistent root-color data
and excludes incompatible overlap identifications from `I` itself. Thus
`I`, when nonempty, is a torsor for the color-preserving overlap
automorphism group. In the original red/blue edgeless-overlap example, the
color-swapping map is now absent, so the original counterexample no longer
applies.

Arbitrary additional branch relations are explicitly outside the full-group
and exact-classification assertions unless their enriched skeleton is
separately analyzed. The final clarification correctly distinguishes an
independent stabilizer of D-only colors from fixed D-to-side signatures:
such signatures can require coupled permutations of the side and D cells.
The displayed direct-product formula is not asserted for that enriched case.

## Outcome, permitted use, and limits

| Claim | Revised outcome | Permitted use |
| --- | --- | --- |
| `claim-pair-gluing-01` | accepted | Symmetry of compatible overlap maps, with certified double-coset coverage. |
| `claim-pair-gluing-02` | accepted | Symmetry of full completions under the exact residual group in the stated scope. |
| `claim-pair-gluing-03` | accepted | Staged ordered-root coverage conditional on complete admissible inputs, maps, and completions. |

Acceptance is an independent mathematical audit of the exact proof hash.
A future generator still needs independently checkable input coverage,
pointed-automorphism witnesses, double-coset coverage, full-vector orbit
handling, and the stated constraint invariance. An unchecked omission list,
cyclic descent relation, timeout, or failed search proves no nonexistence.
The formulas alone promise no practical reduction size or tractability.
Endpoint reversal and complementation require separate compatible selectors.
Extra fixed nonlocal data require a separately derived enriched-state group.

No solver, proof checker, theorem prover, canonicalizer, graph enumeration,
download, installation, novelty review, formal certificate, construction,
branch closure, or improvement of the bounds on `R(5,5)` is supplied here.
Substantive changes to the proof or affected dependencies require renewed
exact-revision review.
