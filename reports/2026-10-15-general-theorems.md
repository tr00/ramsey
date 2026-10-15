# General theorem abstraction and independent audit

Date: 2026-10-15. Task: abstraction-20261015.
Base revision: b12925f7a96d24e18d06b0237930a32e30660ca2.
The user requested theorem synthesis, theorem-specific subagents, subsequent
independent audits, documentation and a commit. The coordinator assigned three
authors distinct paths, then cross-assigned audits so no author reviewed their
own proof. The coordinator authored the cut-capacity note, independently
reviewed by the overlap author. No graph computation or new external tools,
packages, catalogues or data were used.

## Results

Seven notes contain 28 independently accepted claims, including their
specializations. Six mixed-scope notes live in docs/general_theorems; the
normalized minimum-degree20 application lives beside its branch. The
[synthesis](../docs/general_theorems/README.md) links statements and limits.

The principal new branch application is complete same-degree pair coverage
in the normalized minimum-degree20 branch. If n20>=13, there is a degree20
edge with codegree<=11. Otherwise the degree-count identities force n21>=20,
and there is a degree21 edge with codegree<=12. This needs neither a small
degree excess nor an extremal neighborhood edge count. It remains conditional
on the normalized branch, and retains every overlap map and completion.

Other results parameterize safe-edge star forests and higher-deficit conflicts;
general rooted signature/Hall and weighted anchor bounds; deletion/attachment
defects; low-weight transversal avoidance and disjointness; equality/strict
triangle family overlap; and cut capacities counted on the same root family.
The deletion abstraction includes the balanced induced-transversal edge cost,
raising the raw four-set estimate from65 to66 while still falling below68.

## Review and provenance

| Proof | Independent reviewer | Claims accepted |
| --- | --- | --- |
| safe_augmentation | transversal author | 5 |
| signature_anchors | overlap author | 6 |
| transversal_compatibility | augmentation author | 4 |
| transversal_deletion | overlap author | 4 |
| family_overlap | augmentation author | 4 |
| cut_capacity | overlap author | 3 |
| min-degree20/pair_coverage | transversal author | 2 |

All reviews identify exact proof hashes, assumptions, algebra, quantifiers,
ambient types, coverage, permitted search use and limitations. Author clarity
changes made before review include an explicit t>=2 condition for independence
and a source hash. The overlap theorem gained a separately audited strict
triangle-exclusion claim; its even-degree equality and odd-degree strict cases
were then combined into the normalized branch application. No mathematical
corrections were required in the final independently reviewed revisions.

Integration adds only a status banner to reviewed proof notes; the original
proof bodies remain preserved. The
[manifest](../docs/general_theorems/integration_manifest.json) records the
reviewed proof, integrated proof and review hashes. Author-stage ready labels
inside preserved bodies are superseded by the banner and acceptance records.
Shared navigation and the theory map were updated only after all audits.

## Limits and validation

Numerical specializations retain classical smaller Ramsey values and existing
published edge extrema where explicitly used. Abstract forms expose these as
inputs; none recertifies a census. No novelty review, formal proof certificate,
construction, order43 exclusion or improved global Ramsey bound is claimed.
No work attacked orders44 or45, or repeated order46 nonexistence.

Validation checks the manifest and exact reviews, preserved proof bodies,
claim counts, local Markdown links/anchors, and repository whitespace. This
is document/provenance validation, not graph enumeration or proof checking.
Unrelated concurrent edits to pending averaging/upper-bound audits were
observed and excluded from this task's staging and commit.
