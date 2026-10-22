# Independent review of pair separation, modules, and small swap components

Editorially condensed on 2026-10-21; [original audit and lineage](../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Task: `symmetry-audit-20261015`.

Author: Codex coordinator `/root`, the `symmetry-hour-20261015` author.
Independent reviewer: Codex agent `/root/audit_structure_clean`, token
`structure_auditor`. The reviewer did not edit any proof, shared navigation,
WORK row, or Git index, and spawned no further agents. This new sibling
review is the reviewer's only owned output.

Claims assigned: [symmetry_structure.md](symmetry_structure.md), stable anchors
`claim-symmetry-structure-01` through `-04`, and `-07` through `-09`.
General disjoint-swap Claims01-02 and structure Claims05-06 were independently
reconstructed as required dependencies, rather than inferred from labels.

Reviewed working-tree base: `249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`.
The proof is uncommitted, so exact SHA-256 identifies the reviewed revision.

| Proof stage | SHA-256 | Outcome |
| --- | --- | --- |
| Author handoff, initially read before coordinator revisions | `6152574608e34c427c0af0da7eee210969034ece5a2055e4622e0dd0bb385b58` | Claim02 wording needs nonidentity qualification; other assigned mathematics passes |
| Explicit K_M candidate action and L completed stabilizer in Claim06 | `c509fc6eb97a6ef209ae26fa6677e0b4d6cf320412f5f0772e2eeb457bdf454a` | Claim02 qualification still required; Claim06 dependency clarified |
| Claim02 nonidentity qualification | `0a4a6cc21c2ad531f82c8f1a6f9370959f32566816f24e3b9334ded0c26848e2` | Qualification resolves initial finding |
| Final proposed proof, reread in full; Claim09 strengthened | `ed61d3fd5b87aac35e6bfb41c31aaaf55ff34ed57e72a03ac0cfcba857b49062` | All seven assigned claims accepted on renewed review |

**Outcome: accepted for Claims01-04 and07-09 at the final proof hash above,
on the stated external premises and exact scopes.** No unresolved
mathematical gap remains in these assigned claims. Acceptance does not cover
an implementation, a certified exhaustion, or a novelty claim. Mathematical
changes require renewed review; later metadata integration must preserve this
exact provenance.

## Dependencies and exact revisions

| Dependency | SHA-256 | Status and use |
| --- | --- | --- |
| docs/general_theorems/disjoint_swap_stabilizers.md | `bdbf5f1aabd35cfb1dec4d8ffa24dfb260a227d0561854c8dd652975161b7c46` | General Claims01-02 reconstructed below; separate swap audit also accepts them |
| docs/general_theorems/review_disjoint_swap_stabilizers_20261015_swap_auditor.md | `67a504cfb84ed14ae85214200898c0f8ddf9c8a2fc4b48632fb0a62b0202eafd` | Read review of swaps and structure05-06 at c509 revision; final structure dependencies independently reread here |
| research/n43/d18/symmetry_reduction.md | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` | Accepted multiplicity/forced-edge Claim03; required reasoning rederived |
| research/n43/d18/review_d18_symmetry_20261014_pivot.md | `b1c63e0bc08605ca9378221f1616e27c6705a71810ea01e22782416f8f60acf8` | Prior exact-revision acceptance and scope restrictions inspected |
| research/n43/d18/frontier_band.md | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` | Frontier identities and four-transversal premises |
| research/n43/d18/x136/small_columns.md | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` | Small-column budgets used by multiplicity |
| research/n43/d18/transversal_four.md | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` | Scope/provenance of transversal dependency |
| research/n43/d18/x136/r2/low_excess_columns.md | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` | Anchor review's unrestricted four-transversal degree floor |
| research/n43/d18/x136/five_column_compatibility.md, integrated file | `2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e` | Integration banner accepts all four claims; only Claim03 anchor needed here |
| Same anchor proof, accepted body before banner | `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b` | Exact accepted body reproduced by stripping only the banner |
| research/n43/d18/x136/review_five_column_compatibility_20261015_independent.md | `c6b7e29afaa61a1be112b1ecb47938c7be7452fe6eff96d09564e2834f19a14f` | All-four-claim independent acceptance and precise external premises inspected |
| docs/mathematical_baseline.md | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` | Published small Ramsey values and degree derivation |
| docs/workflow.md | `51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2` | Exact-revision independent review requirements |
| docs/reproducibility.md | `ee57ae7e71a839fffd48c8e21323a845aef972a0295021e46fb04de618fc8de9` | Certificate and search-use limits |

The small Ramsey values and frontier census extrema remain external premises;
the accepted multiplicity, forced-edge and degree-eight-anchor chains were
reconstructed for their actual scopes. No I4 prohibition was transferred to A.

## Decisive independent checks

Pair separation is d(u)+d(w)-2-2c on an edge and its complementary formula
on a nonedge, both>=8; fixed vertices cannot distinguish moved endpoints,
so nonidentity support>=10. The module tables were recomputed in every
homogeneous and nonhomogeneous case, giving proper-module order caps39
for K5/I5-free graphs and 23 for K5/I4-free graphs. Thus G43 and B24 are prime.

Disjoint-swap components are pinned/equality subspaces; each free component
has>=5 pairs. The candidate action K_M and completed stabilizer L were kept
separate. For five edge pairs, every interpair block is a matching; the
support is 5-regular, endpoints have degree 18, and each fixed common13-cell
is 4-regular. A second free component would be anticomplete to the first;
an independent triple and pair then give I5. The six-plus-six case at p12
remains unresolved. The final anchor-parity strengthening gives p<=10 and
at least four singleton full signatures at equality. All tables and factorial
orbit counts were checked independently; no runtime gain was measured.

## Claim-by-claim outcomes and permitted use

| Assigned claim | Final outcome | Permitted mathematical use after integration |
| --- | --- | --- |
|01|accepted|Pair-distinction propagation with correct incidence upper bounds and fixed pair/degree hypotheses|
|02|accepted after nonidentity correction|Reject impossible actual automorphism supports; involution parity propagation in explicit symmetry branches|
|03|accepted|Filter completed G, or a module guaranteed to survive every extension; no rejection solely from a partial module|
|04|accepted|Filter completed order24 K5/I4-free B and its complement; no primeness assumption on order18 A|
|07|accepted|Conditional matching, degree, common-neighbor and codegree propagation for the specified five edge-pair automorphism|
|08|accepted|Conditional duplicate-stabilizer and orbit accounting through x139, with forced-edge premises|
|09|accepted after stronger exact revision|At x136 propagate p<=10/four singleton signatures and use rooted/orbit bounds on the accepted anchor chain|

General swap Claims01-02 and structure05-06 were checked as dependencies
and found applicable; their dedicated independent review remains the primary
review for those claims. This review does not alter their proof files or
their separate outcome history.

Both module tables, all homogeneous cases, degree/support edge counts,
24! orbit arithmetic, and p=10,11 orbit values were also checked with
existing Python3 standard-library integer arithmetic. Every assertion
passed. This was finite arithmetic, not graph generation or enumeration.
Anchor banner removal was checked with standard-library SHA-256 and
reproduced the exact accepted body hash. Shell tools only read local files,
Git revision/status, and hashes.

Limits: no SAT solver, checker, theorem prover, canonicalizer, graph search,
download, installation, external literature retrieval, catalogue completeness
audit, construction verification, formal certificate, staging, or commit.
No branch closure or determination of R(5,5) follows from these claims.
No realized orbit extreme or runtime reduction is asserted. Future exhaustive
work must supply full generation/coverage and independently checked
permutation omissions, in addition to applicable nonexistence certificates.
