# Independent review of disjoint swaps and frontier rooted kernels

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Reviewer: `audit_swap_groups_clean`, an independent
review agent distinct from the `symmetry-hour-20261015` proof author.
Owned path: this review only. No proof, shared index, Git index, or other
agent's file was edited by this reviewer.

## Claims and exact revisions

Claims reviewed:

- `docs/general_theorems/disjoint_swap_stabilizers.md#claim-disjoint-swaps-01`
  and `#claim-disjoint-swaps-02`.
- `n43/symmetry_structure.md#claim-symmetry-structure-05`
  and `#claim-symmetry-structure-06`.

The working-tree base commit when the review began was
`249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`. The two proof files were
uncommitted; their exact SHA-256 values, rather than the author's older base
revision, identify the text reviewed.

| File and stage | SHA-256 |
| --- | --- |
| General disjoint-swap proof, initial and renewed review | `bdbf5f1aabd35cfb1dec4d8ffa24dfb260a227d0561854c8dd652975161b7c46` |
| Symmetry structure, initial review | `6152574608e34c427c0af0da7eee210969034ece5a2055e4622e0dd0bb385b58` |
| Symmetry structure, renewed review after coordinator clarification | `c509fc6eb97a6ef209ae26fa6677e0b4d6cf320412f5f0772e2eeb457bdf454a` |

Initial outcomes: general Claims 01–02 and structure Claim 05 accepted;
structure Claim 06 changes-requested because the group acting on its
completion-orbit table needed an explicit distinction from the completed
graph's restriction kernel. The initial finding is retained below.

Renewed outcomes: all four assigned claims accepted at the general proof
hash above and the revised structure hash above, on their stated external
premises and exact invariant-data scope. Claims elsewhere in the structure
file are not promoted by this review.

## Independent checks and repair

Fixed-vertex/pair incidences pin a swap bit when endpoint bits differ.
Each pair block has one of five subgroup stabilizers, imposing no constraint,
a pinned bit, equality, or two pinned bits. These tests cover all graph
edges and give exactly a partition subspace with marked components.
A free component indicator is an actual automorphism, so separation D
forces at least1+ceil(D/2) pairs in each free component.

For order 43, separation8 gives component size>=5. The duplicate action
K_M=(C2)^p transports B-edge completions; the completed restriction kernel
L=K_M intersect Aut(G) fixes one completion. The initial Claim 06 wording
confused these groups. The coordinator's explicit distinction repaired it;
the original changes-requested finding is superseded by renewed acceptance.
The orbit-stabilizer tables and 24! label factors were recomputed.

## Dependency revisions and applicability

| Dependency read | SHA-256 |
| --- | --- |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
| `n43/d18/symmetry_reduction.md` | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| `n43/d18/review_d18_symmetry_20261014_pivot.md` | `b1c63e0bc08605ca9378221f1616e27c6705a71810ea01e22782416f8f60acf8` |
| `n43/d18/frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `n43/d18/x136/small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| `n43/d18/transversal_four.md` | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` |
| `docs/theory_phase_1.md` | `cab844f31da5aca53b1ed674ea04bc56ce6c9a0e271e4a8ef085568f1d9596e1` |

The d18 symmetry proof at commit49bd363 hashes to
`bbb24262ca5833d59c89c44eeb75664c6a07f092cd2ef7596d008e591e53b50a`;
its later differences were metadata-only. Multiplicity and forced-edge
reasoning was independently reconstructed within its exact frontier scope.
Small Ramsey values and85/50/41 census extrema remain external premises;
B's contextual edge upper160 is not needed for these conclusions.

## Final exact-revision renewal for structure Claims 05–06

The final structure source at
`ed61d3fd5b87aac35e6bfb41c31aaaf55ff34ed57e72a03ac0cfcba857b49062`
was reread after the later Claim02/09 changes. Claims05/06 mathematics
remained unchanged, with K_M and L explicit. Both **accepted** at this
final hash; general Claims01/02 retain acceptance at
`bdbf5f1aabd35cfb1dec4d8ffa24dfb260a227d0561854c8dd652975161b7c46`.
The assigned review does not accept unrelated structure claims.

Limits/use: exact completed-state symmetry accounting with invariant data,
whole vectors and applicable multiplicity premises. Partial states need
separate validation. No generator, certified exhaustion, runtime saving,
novelty assessment or branch closure follows; A may contain I4.

Additional historical revision/dependency hashes (labels and full records
in `3eebcca:docs/general_theorems/review_disjoint_swap_stabilizers_20261015_swap_auditor.md`):

- `67a504cfb84ed14ae85214200898c0f8ddf9c8a2fc4b48632fb0a62b0202eafd`.
