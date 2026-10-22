# Independent audit of the averaging notes

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15.
Reviewer: Codex independent reviewer `audit_degree18_averaging`, task
`/root/audit_degree18_averaging`, distinct from authors `Codex
weighted-averaging task` and `Codex averaging extension`.
Reviewed repository HEAD: `b12925f7a96d24e18d06b0237930a32e30660ca2`.
The SHA-256 hashes below identify the exact reviewed working files;
the authors' self-audits were not used as evidence.

| Reviewed source | SHA-256 |
| --- | --- |
| `weighted_averaging.md` | `58fb2c566ae3930d14825f2d73b0fdc18dfca1e90399c3b5516e30c4fd491cbc` |
| `anchored_cell_averaging.md` | `6d6cf68977b29e0c3b98f87ecbc9b5f1287603413fbcc0cd51205a6811f21a9d` |
| `averaging_future_work.md` | `7b840aaddd9cd70c821896ba2d53be8dafc55561d6122941bd74a5440deb5248` |

No solver, graph enumeration, download, installation, or certificate checker
was used. All checks below are mathematical. This review records acceptance
of local reasoning conditional on its identified external premises, not an
order-43 exclusion, primary-literature replay, or novelty finding.

## Decisive checks and repair

The reviewer rederived the exact row/excess budgets and singleton anchor
capacity, weighted fractional anchor packing, the random-order inequality,
and all eight actual-cell type/cap rows. Weighted edge budgets follow by
mass merging; saturation comes from Ramsey bounds on a vertex's neighborhood
and antineighborhood inside the actual cell. The actual-set and nonnegative
weight hypotheses are essential.

The high-row thresholds x>=253/271, adjacent-size 16 overlap8 with union B,
and the mixed(3,3) cell's C5 equality were independently checked. The q3
actual-column theorem applies through x155 and requires E_A>=14 for a
size-three column; it is not an isolated-neighborhood tau>=4 theorem.

The original higher-order example incorrectly said that an inferred B edge
must enter witness graph F even without its defining residual I3 witness.
That literal membership assertion was **rejected**; the logical B-edge rule
itself was valid. The dual had the same ambiguity. The repair preserves
witness graphs F/H and uses separate sound closures F*/H*.

## Per-claim decisions

| Claim | Outcome on exact source | Permitted mathematical use |
| --- | --- | --- |
| `weighted_averaging.md#claim-weighted-anchor-excess` | accepted | Necessary excess/cross-count propagation for actual anchor families |
| `weighted_averaging.md#claim-weighted-random-order` | accepted | Rational necessary-condition rejection of proposed column families |
| `anchored_cell_averaging.md#claim-cell-types` | accepted | Actual cell type and size caps |
| `anchored_cell_averaging.md#claim-cell-quadratic-budget` | accepted | Weighted remaining-edge/nonedge budgets |
| `anchored_cell_averaging.md#claim-cell-saturation` | accepted | Internal degree intervals and sound completion implications |
| `anchored_cell_averaging.md#claim-cell-higher-order-propagation` | changes-requested | Core B-edge/nonedge implications accepted; literal F-membership example rejected below |
| Future-work high-x thresholds and row-family identities | accepted as local deductions | Necessary propagation; research-priority choices remain planning |
| Future-work adjacent size-16-row observation | accepted as local deduction | Conditional overlap and cell structure, never a row-pair exclusion |
| Future-work mixed edge/independent-pair cell observation | accepted as local deduction | Cell cap and C5 completion at order five |
| Future-work q3 threshold applicability | accepted on retained external census premise | Actual-column lower bound in q=3, 143<=x<=155 |

Future-work statements currently lack stable anchors. Recommended IDs for
coordinator integration are `claim-averaging-large-row-family`,
`claim-averaging-adjacent-sixteen-rows`, and
`claim-averaging-mixed-three-three-cell`. These are suggested identifiers,
not existing source anchors. The q3 application should reference its
already identified accepted dependency rather than imply a new theorem.

## Independent re-review of the corrected higher-order example

Corrected source SHA-256:
`b288336b44e961b75675a7daef7c860c7afadacde5ef5b09a70e2c31f42f38ff`.
The same independent reviewer inspected the localized repair. Three B
columns missing an independent A pair cannot form an independent triple;
two known B nonedges force the third edge, without creating an I3 witness
in F. Dually, three columns containing an A edge cannot form a triangle;
two known edges force the third nonedge. Sound closure gives
F* subset E(B), H* subset E(complement B), and overlap is contradictory.

Renewed outcome: **accepted** for all four anchored-cell claims; the other
three bodies were unchanged. The original literal F-membership assertion
remains withdrawn. Accepted use is necessary-condition propagation on
actual witnesses, without saturated-cell occurrence, feasibility or closure.

## Metadata integration verification

The independent reviewer inspected the coordinator's source diff after
acceptance metadata, review links, and two future-work anchors were added.
The current exact source hashes are:

| Integrated source | SHA-256 |
| --- | --- |
| `weighted_averaging.md` | `e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07` |
| `anchored_cell_averaging.md` | `719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3` |
| `averaging_future_work.md` | `9548b538030905b5b154c4aa04dcf6bd0a75b7f2729b1d568cf6a207b3d86b99` |

Outcome: **accepted as reference/metadata-only integration**. Mathematical
statements, hypotheses, proofs, examples, and research targets are unchanged
from the reviewed weighted/future-work sources and the independently accepted
corrected cell source. The withdrawn literal F-membership assertion and its
closure-graph correction remain explicit. Search-use metadata accurately
promotes only the accepted necessary-condition deductions to propagation;
research priorities retain planning status. The two future-work IDs now
identify the previously audited large-row family and adjacent-sixteen-row
observations. Earlier hashes and findings remain preserved above.

## Dependencies and limits

The standard small Ramsey numbers, degree interval18..24 and published
A edge interval50..85 remain external premises. The needed dependencies
were reread for applicability. Research-priority choices remain planning.
No exhaustive coverage, symmetry certificate, graph witness, novelty
assessment or order 43 decision is supplied.

Additional dependency snapshots checked during the original audit:

| Dependency | SHA-256 |
| --- | --- |
| `x142/q3/three_columns.md` | `00e670d5e5a5943f4f725184634f59be5ddf758b7b084551a9f3fd504ee068ee` |
| `frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `symmetry_reduction.md` | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| `transfer_summary.md` | `dd18ca7a750c8e67ec29fee57858482d1eba400315d5904e42dbe0ca3d809859` |
| `../../../docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
