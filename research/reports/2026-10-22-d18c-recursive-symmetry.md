# Symmetry integrated into connected d18 residual recursion

Date: 2026-10-22. Task: `d18c-recursive-symmetry-20261022`.
Author and self-auditor: /root, working alone.
Start HEAD: `d6d6ee085b701171362b6de8ea16f32383f09d9c`.
During this session the user committed the earlier work as
`d78f659318c1e1bdeb7c0480da6f734c1e2d0821` (`new recursive research`).
No Git index operation or commit was made by this task. The original recursion
proof, prototype, and retained evidence are preserved byte-for-byte.

The [new proof note](../n43/d18/c/recursive_symmetry.md) supplies seven claims
ready for independent review. The [adapter](../n43/d18/c/recursive_symmetry.py)
integrates symmetry into the existing recurrence through weighted row orbits and
witnessed whole-state memo keys. It applies to arbitrary overlapping obligations,
fixed edges/nonedges, and nonnegative integer budgets; every condition transports
together. It preserves labelled counts, rather than dividing them by a group order.

The claims are:

* `claim-d18c-symmetry-equivariance`: complete state relabelling preserves
  completion sets bijectively and commutes with residual differentiation.
* `claim-d18c-symmetry-weighted-rows`: a verified subgroup fixing the chosen
  pivot gives an exact weighted row-orbit recurrence. The subgroup may change
  and grow after a vertex is forgotten.
* `claim-d18c-symmetry-swap-blocks`: verified transpositions generate full
  symmetric factors on interchangeable future labels. One row per block count
  has the exact product-binomial weight; future twins are not imposed.
* `claim-d18c-symmetry-witnessed-memo`: any explicit full-state representative
  transport permits safe count reuse when image keys coincide. A bounded
  representative search may miss reuse but never justifies an unwitnessed merge.
* `claim-d18c-symmetry-refined-images`: an invariant refinement includes both
  obligation colours, fixed bits, and budget intervals and coefficients.
  Interleaving swap blocks supplies coset representatives without enumerating
  their internal permutations; exhaustive image selection is invariant.
* `claim-d18c-symmetry-progressive-columns`: while processing `A`, equal partial
  columns form certified interchangeable `B` blocks. Each row splits these
  blocks, and accumulated weights telescope to `24!/product_C m_C!`.
* `claim-d18c-symmetry-coupled-generators`: equal candidate images yield explicit
  automorphisms. Schreier generators recover their pivot stabilizer, which acts
  on compact block-count vectors with exact combined row weights.

The d18 first-row consequence is substantial and exact: the24 initially
interchangeable `B` labels give25 size representatives instead of16,777,216
labelled rows. If the chosen `A` vertex has internal degree8, the global degree
window and row cap leave seven sizes9..15, whose weights sum to14,233,964.
The prototype checks and demonstrates the25-representative quotient on the
existing prescribed connected Paley17-plus-leaf initializer. It does not recurse
through order43 completions. Later row splits can make the blocks small, so no
total search-speed or small-state-space claim follows from this first-step result.

This connects directly to the reviewed column-multiset quotient: progressive
row splits build a column multiset while allowing the residual Ramsey tests
after each row. The final assignment multiplicity is counted once by the split
weights. The subsequent `B` recurrence still counts its internal labelled graphs
with its own row-orbit weights. No pivot-orbit multiplier or division by a state
group order is correct for the labelled count being computed.

`SymmetryDP` imports the original prototype and has no implicit run or CLI.
It selects a dense witnessed representative, computes a verified swap subgroup,
adds discovered coupled pivot-stabilizer generators, and sums weighted child
counts. Its default image-candidate limit is32. Even an incomplete selection
remains exact because cache keys retain the full transported state and colours.
The limit affects reuse and generator discovery only. Exhaustive selection can
be requested explicitly; classes without interchangeable blocks may still have
factorially many image candidates. Coupled count-vector orbit traversal can
also grow large. These costs are unresolved performance questions.

Validation command:

```sh
python3 research/reports/2026-10-22-d18c-recursive-symmetry/validate.py
```

The [driver](2026-10-22-d18c-recursive-symmetry/validate.py) uses direct graph
semantics and a separate set/tuple transport checker to validate tiny cases:

* 516 count comparisons across representative limits1,3,and exhaustive, using
  both unrestricted and role-restricted vertex colours on four-vertex states.
* 258,048 graph-semantics transport checks and29,184 derivative-equivariance
  checks across all four-vertex permutations for the prescribed state family.
* 4,032 checks that exhaustive representative images agree after relabelling.
* 3,656 swap-row representatives checked against direct compatible-row groups.
* 5,304 recurrence-DAG nodes replayed for labelled counts, block and generator
  witnesses, complete count-vector orbit coverage, child transport, and weights.
* Twelve Schreier-stabilizer cases compared with separately implemented tiny
  group closure, and256 split-weight telescoping identities.
* A prescribed five-vertex coupled-symmetry fixture: a free distinguished pivot
  over fixed `P4` constraints. Path reversal uses two swaps together and reduces
  its16 rows to10 weighted orbits. This is an algebraic regression, not a
  Ramsey discovery search.
* A forced order43 root derivative and its25 first-row orbits only. Their weights
  cover all `2^24` labelled rows. A pure24-label symmetric state needs one
  image candidate, avoiding enumeration of24! permutations.

The [retained tiny DAG](2026-10-22-d18c-recursive-symmetry/tiny_symmetry_dag.json)
and [validation output](2026-10-22-d18c-recursive-symmetry/validation.json) identify
the exact proof, adapter, driver, DAG and dependency hashes. Direct replay and
deterministic regeneration are author self-checks, not independent review or a
production certificate checker. The original recursion remains ready, and all
seven new claims remain ready. No accepted proof or production filter is changed.

All14 local links and anchors and all7 claim metadata blocks passed. The13
artifact and dependency hashes in the original recursion's retained output were
verified unchanged. New artifact hashes and deterministic replay passed, including
the weighted DAG. Whitespace checks passed with intentional Markdown hard breaks.

The immediate mathematical result is an exact symmetry-aware recurrence with
large initial row compression, safe reuse after forgetting history, and certified
coupled generators. It does not establish that later residual orbits stay few.
Completeness of connected-neighborhood inputs, all their completions, independent
proof/code review, and an efficient implementation remain open obligations.
The connected branch and order43 remain open; the Ramsey interval stays43..46.
No novelty claim, solver, external canonicalizer, theorem prover, graph catalogue,
download, installation, subagent, staging, commit, or publication was used.

All substantive work is in new symmetry-specific proof, adapter and report paths.
Shared indexes and existing branch files were left untouched while the user
committed the prior work. Navigation entry points are the links in this report.
The task ownership row is removed at handoff; other active rows are preserved.
