# Remote handoff: degree-18 k1 pseudo-Boolean experiments

Date: 2026-10-19. Task: `k1-pb-remote-handoff-20261019`.
Kind: experiment design and agent handoff, not a computational result.
Status: no model generated, remote connection attempted, or solver run for this handoff.

## Assignment and boundaries

Implement and validate a deterministic PB encoding of the **order-43 degree-18 k1 branch**, then perform the bounded pilot below on the receiving machine if its owner approves the resource envelope. The user requested this handoff for an agent on a stronger machine. This document does not authorize downloads, installations, unrestricted catalogue searches, unbounded solver runs, or attacks on orders 44/45.

The mathematical reduction is already proved in Lean; the OPB generator and its bridge to that reduction are **not implemented or certified by this report**. First inspect the receiving checkout: tooling may have changed since this handoff. Do not rerun the historical catalogue filter merely to reproduce its count.

Deliver actual generator/checker code, deterministic models, bounded logs, and a dated experiment report. Do not describe solver status alone as a certified Ramsey result. Stop after the pilot and report evidence rather than silently expanding the run budget.

## Sources to transfer and inspect

Transfer the current working-tree content, including uncommitted files; a revision identifier alone may omit the new formalization. Retain source SHA-256 hashes and a tracked-change patch plus a manifest of transferred untracked source files. Preserve any work already on the receiving machine.

Required mathematical sources:

- [Reviewed branch reduction](../n43/d18/k1/research.json).
- [Reviewed packing and budget bounds](../n43/d18/k1/cross_core.json).
- [Seven-cell analysis](../n43/d18/k1/seven_cell.json).
- [Formalization correspondence and axiom report](2026-10-19-lean-d18k1-reduction.json).
- [Frame and admissibility](../lean/Ramsey/n43/d18/k1/Frame.lean).
- [Exact completion equivalence](../lean/Ramsey/n43/d18/k1/Completion.lean).
- [Complete reduction](../lean/Ramsey/n43/d18/k1/Reduction.lean).
- [Scalar envelope](../lean/Ramsey/n43/d18/k1/Parameters.lean).

Operational sources:

- [Reproducibility policy](../docs/reproducibility.md) and [workflow](../docs/workflow.md).
- [Current engine interface](../README.md).
- [Python reference and exhaustive witness checker](../scripts/ramsey.py).
- [Historical catalogue filter, with scope limits](2026-10-19-k1-catalogue-filter.json).
- [Historical solver-status and timeout lessons](2026-10-19-scoped-engine-experiments.json).

The recorded formalization passed `sh lean/scripts/check.sh`, kept the sorry ledger unchanged, and added no axioms or sorries. That historical check is not a certificate for a subsequently written generator. The k1 exclusion remains open.

## 1. Exact graph layout and variable map

Use fixed labels:

| Cell | Vertices |
| --- | --- |
| v | 0 |
| u | 1 |
| C | 2..18 |
| D | 19..35 |
| T | 36..42 |

Root edges are exactly `vu`, all `v-C`, and all `u-D`. All other edges incident to either root are absent. Thus both roots have degree 18, no common neighbor, and `u` is isolated in `G[N(v)]`.

There are 83 root-incident edge positions, of which 35 are present and 48 absent. The remaining blocks are:

| Block | Edge positions |
| --- | ---: |
| inside C and D | 136 + 136 = 272 |
| C-D, denoted X | 289 |
| C-T and D-T, denoted P and Q | 119 + 119 = 238 |
| inside T, denoted Z | 21 |
| total non-root positions | 820 |

Every actual k1 candidate can be relabelled into this layout. Neither core is assumed to be Paley17, unique up to isomorphism, or preselected from a catalogue. Both cores are `(4,4)`-free and 8-regular; both sides `C union T` and `D union T` are `(5,4)`-free. Here `(s,t)`-free means no clique of size s and no independent set of size t.

For the initial implementation, use all 903 edge variables with root positions fixed by equalities. This is simpler to audit than compacting immediately. For `0 <= a < b < 43`, use the Python reference's lexicographic one-based edge numbering:

`id(a,b) = a * (85-a) / 2 + (b-a)`.

The product divided by 2 is integral. Record the complete map in a machine-readable file. Use `x<id>` as the OPB variable name. Exactly 820 variables are unfixed before core or side choices. Optional compact encodings must carry an explicit reversible map and record the numbering divergence from the Python reference; do not claim byte identity.

Choose lexicographic vertex subsets and edge order. For equal-size clique/independence restrictions, emit the clique constraint first for each subset. Record any ordering difference from an existing generator. Repeated generation with identical inputs must be byte-identical.

## 2. Two equivalent exact encoding routes

### Route A: direct, audit-friendly whole-branch baseline

For every 5-subset S of all 43 vertices emit:

- clique exclusion: `sum_{ab in choose(S,2)} e_ab <= 9`;
- independent-set exclusion: `sum_{ab in choose(S,2)} e_ab >= 1`.

Together with the 83 root equalities, this already specifies the entire k1 branch: a Ramsey graph with this rooted shape. The induced neighborhood is the isolated vertex u plus a 17-vertex `(4,4)` core; the reviewed reduction proves its regularity and the mirrored core. Additional core/admissibility constraints below are sound strengthening, not extra hypotheses restricting the target.

For an OPB serializer that emits only `>=`, rewrite the first inequality as `sum -1 e_ab >= -9 ;`. There is no objective. Graph edge variables are Boolean by the OPB input semantics.

The unsimplified Ramsey component has exactly 1,925,196 constraints. Substitute root constants, remove true constraints, and retain an explicit contradiction if a false constant constraint occurs. Constraint counts after simplification must be measured, not guessed.

This route gives a simple independent semantic reference for the specialized route. For a closure package, one exact model plus checked regeneration and translation data suffices; both unsimplified and simplified full models need not be stored. Exploratory models follow the retention scope in section8.

### Route B: specialized cells, no missing root cases

Encode all of the following:

1. Both cores are `(4,4)`-free: on each core 4-subset S, `sum e_ab <= 5` and `sum e_ab >= 1`.
2. Every core vertex has exactly 8 neighbors inside its core.
3. Both sides `C union T` and `D union T` are `(5,4)`-free: exclude each side 5-clique with `sum e_ab <= 9`, and each side independent 4-set with `sum e_ab >= 1`.
4. All mixed forbidden selections described below.

For disjoint selections A subset C, B subset D, R subset T, let `W=A union B union R`, of size 5. Enumerate only these cell-count triples:

| Forbidden structure | (size A, size B, size R) |
| --- | --- |
| clique | (3,2,0), (2,3,0), (3,1,1), (2,2,1), (1,3,1), (2,1,2), (1,2,2), (1,1,3) |
| independent set | (3,2,0), (2,3,0), (2,2,1) |

For every selection of a listed clique type emit `sum_{ab in choose(W,2)} e_ab <= 9`. For every listed independent type emit `sum e_ab >= 1`.

**If the cores, attachments, or T are variables, retain their literals. Do not treat eligibility as a fixed condition.** This avoids unproved guards and needs no auxiliary variables. Side/core validity plus these mixed constraints cover all forbidden 5-sets, including the root cases by the proved completion theorem. The eight/three families are exhaustive only with those side/core hypotheses.

If an entire admissible key is fixed, all non-X edges become constants. Skip ineligible selections; each eligible clique selection reduces to

`sum_{c in A,d in B} X_cd <= |A|*|B|-1`,

and each eligible independent selection reduces to

`sum_{c in A,d in B} X_cd >= 1`.

These have 1..6 variables for clique exclusions, and 4 or 6 for independent exclusions. This is the exact 289-variable completion problem, not just a relaxation. An admissible key must be checked independently: 17/17/7 cell sizes, `(4,4)`-free 8-regular cores, and both `(5,4)`-free sides. Full side validity does not follow from edge counts alone.

### Scope of fixing data

| Fixed data | Unfixed positions | Interpretation |
| --- | ---: | --- |
| root layout only | 820 | complete labelled k1 branch |
| root layout and both cores | 548 | conditional on this pair of core graphs |
| full admissible key | 289 | conditional on these cores, attachments and T |

UNSAT at 548 or 289 positions does not close k1 without complete coverage of the fixed data. The whole-branch pilot should therefore use 820 unfixed positions. Fixed-key experiments are optional later work, not a reason to invent one arbitrary key and report whole-branch coverage.

## 3. Linear strengthening: exact PB formulas

Use `p=e(C,T)`, `q=e(D,T)`, `h=e(T)`, `r=e(C,D)`. Each is a sum of edge variables; do not introduce unrestricted integer variables for them. The following are reviewed necessary bounds. Add them as a separate, reproducible strengthened variant:

- `18 <= d(w) <= 24` for every vertex w. Root degrees are already 18.
- `p >= 64`, `q >= 64`.
- `5 <= h <= 18`.
- `76 <= p+h <= 92`, `76 <= q+h <= 92`.
- `152 <= p+q+2h <= 168` (equivalently the T degree-excess sum is 26..42).
- For every t in T, `d_C(t) >= 9` and `d_D(t) >= 9`.
- For every c in C and d in D, `2 <= d_T(c), d_T(d) <= 7`.
- `153 <= r+p <= 255` and `153 <= r+q <= 255`.

For c in C, let `a_c=d_T(c)` and `m_c=sum_{d in D} X_cd`. Its degree is `9+a_c+m_c`, so `9 <= a_c+m_c <= 15`. For d in D use its Q row and X column. For t in T, its degree is `sum_c P_ct + sum_d Q_dt + sum_{s in T-{t}} Z_st`; no root incidence is present. Prefer these explicit formulas when building the strengthened model.

For a fixed key, row/column bounds become `9-a_c <= m_c <= 15-a_c`, and total-X bounds become `153-min(p,q) <= r <= 255-max(p,q)`. Do not substitute numerical attachment counts in the whole-branch model.

The scalar `(h,L,R,r)` cover, with `L=p+h`, `R=q+h`, is a possible later complete decomposition:

- `5 <= h <= 18`;
- `max(76,64+h) <= L,R <= 92`, `L+R <= 168`;
- `153+h-min(L,R) <= r <= 255+h-max(L,R)`.

The historical arithmetic recount is 1,589 `(h,L,R)` profiles and 155,057 four-parameter buckets, not 155,057 known realizable graphs. Do not launch that many jobs. Unsplit whole-branch search is the first pilot. A subset of scalar buckets is only a partial experiment; full exclusion needs every allowed bucket and all underlying graph assignments covered.

No nonlinear common-neighbor products, SRG product equations, or extra pair-codegree auxiliaries are required for this first encoding. The core Ramsey conditions already imply the proved SRG parameters. Avoid an extra unvalidated auxiliary-variable encoding in the pilot.

## 4. Validation gates before nontrivial solver runs

1. Inspect installed tools and local resources; capture versions, binaries and hashes. Do not install/download missing RoundingSat, proof checkers, Lean, nauty, catalogues or packages without owner approval. Lean need not be rerun merely to execute the pilot if unchanged source provenance is preserved.
2. Test the OPB serializer and model evaluator on tiny satisfiable and contradictory instances. Confirm negative coefficients, equality, upper-bound rewriting, constants, and the empty-constraint contradiction. Verify decoded assignments against the actual inequalities rather than merely accepting solver output.
3. Match the direct Ramsey clause semantics against `scripts/ramsey.py`. Its helper `iter_ramsey_clauses` currently emits all clique clauses before all independent clauses; the policy instead requests clique-first per subset when sizes coincide. Compare mathematical clauses independently of ordering, and document the chosen deterministic serialization. Any new specialized numbering/ordering or format is a declared divergence, not a claim of Python byte identity.
4. Exhaust small Boolean graph assignments to compare emitted constraints with independent graph semantics. Separately test the cell classifier and substitution on reduced toy partitions, without pretending smaller toy graphs have the actual 17/17/7 admissibility theorem. Cross-check candidate selection types against the exact table above. This is validation, not an order-43 graph search.
5. Before trusting whole-instance preprocessing, validate it on all-constant and mixed constant/variable forbidden sets. A true fixed literal can remove a clause; a completely forbidden fixed subset must reject the key or emit contradiction, never silently disappear.
6. Check deterministic model hashes across two generations. Independently parse the generated OPB, verify the variable map/root equalities and family counts, and check hand-selected obstruction examples for both colors and both roots. These are sanity checks, not a formal equivalence certificate.
7. If engine code is changed, run the required engine gates: `ctest --test-dir build --output-on-failure` and `python3 -m unittest discover -s tests -v`. Do not modify third-party sources. If Lean is changed, follow its full separate check and ledger policy; no Lean changes are required for this task.

A solver UNSAT answer to two encodings does not establish their equivalence. Keep the structural coverage argument, source audit, independent small semantic checks and encoding hashes separate from solver performance observations.

## 5. Bounded first pilot on the stronger machine

### Resource envelope to approve and record

These are proposed limits, not a statement about the receiving hardware:

- One solver process at a time; no overlapping pilot runs or background catalogue searches.
- Four nontrivial runs maximum, in the fixed order below.
- Per run: 900 seconds solver internal limit, 1,200 seconds external wall limit, with a short TERM/INT grace and hard-kill fallback. Record whether the installed solver measures CPU or wall time; the external wall cap is authoritative.
- Per run: at most 16 GiB address space and no more than half the machine's available RAM at launch; choose and record a lower limit if necessary. Do not run if a safe memory allowance cannot be reserved. Prefer a verified OS/cgroup memory cap where available; an RSS measurement is not an enforcement mechanism.
- Four-run solver wall ceiling: 80 minutes, plus explicitly bounded build/generation/validation overhead recorded separately. Do not convert this into an unattended multi-day batch.
- Before generation, estimate bytes from constraint counts and the serializer; reserve space for inputs, logs, temporary files and certificates. Initial model text is expected to be in the tens-to-hundreds-of-MB range, not a measured promise. Stream generation. Set and record a disk-quota/watchdog policy, and stop before exhausting the filesystem. No large proof traces in this performance pilot.

If owner limits are already explicit, use the stricter values; otherwise obtain approval for this envelope before nontrivial runs. Missing proof-checking tools do not prevent an explicitly uncertified performance pilot, but they do prevent claiming certified UNSAT.

### Model choice and run matrix

Implement Route B for the actual pilot after validation against Route A semantics. Use global edge IDs and the complete root layout, not an arbitrarily pinned core/key. Baseline B0 contains root equalities, core and side validity, core regularity, and all exact mixed families. B1 is B0 plus all linear cuts in section 3. Both cover the same k1 branch.

| Run | Model | LP setting | Limit |
| --- | --- | --- | --- |
| pilot-01 | B0 | LP off, `--lp=0` | 900 internal / 1,200 wall seconds |
| pilot-02 | B1 | LP off, `--lp=0` | same |
| pilot-03 | B0 | installed LP-enabled default | same |
| pilot-04 | B1 | installed LP-enabled default | same |

Only run the LP-enabled rows if the actual receiving binary has LP support; a previous machine's SoPlex build does not imply the remote binary has it. If unavailable, mark those rows skipped rather than downloading/building a new dependency or silently substituting runs. Keep other options fixed. Do not invent a seed flag: previous observed RoundingSat help exposed no seed option. Record the actual version's supported settings.

The existing engine CLI loads a fixed 24-vertex B and is **not a whole-k1 generator**. Do not use its generic default invocation and label the result a k1 experiment. Prefer a small dedicated generator using existing instance-building conventions, with sources owned and reported, then invoke the existing local solver directly on its OPB. This is an extension of the encoding and must be documented accordingly.

Known local solver argument forms are `--time-limit=900`, `--lp=0`, and `--proof-log=<prefix>`. Inspect receiving-version help/source before use. Conceptually the LP-off invocation is:

```text
<verified wall/memory limiter> <local-roundingsat> --time-limit=900 --lp=0 <model.opb>
```

This is a command template, not a newly implemented command or verified remote path. Capture the exact expanded argv and working directory in the run manifest. Use installed supervisory facilities to enforce resource limits, collect stdout/stderr and exit status, and reap the whole process tree on cancellation. If working through Oh My Pi, start supervised long-lived jobs through its process hub, not an unmanaged shell background job.

### Status handling and early stops

- SAT: stop additional solver runs, preserve the assignment and model, decode and exhaustively verify the graph as below. A malformed or incomplete assignment is not a witness. Never arbitrarily set missing model variables to zero unless a complete satisfying assignment is independently established.
- UNSAT: stop the performance batch and preserve input/logs; without a checked proof it is an **uncertified solver result**, not branch closure. Report the result and propose the bounded proof replay as the next separately approved run.
- Timeout/unknown/memory limit/signal/crash: record it accurately and proceed only within the remaining approved pilot envelope. None is evidence of nonexistence.
- Raw RoundingSat exit 0 historically represented SAT, UNSAT, or timeout. Parse terminal output together with the exit status. Missing/conflicting statuses or abnormal exit do not constitute a mathematical decision. If using the repository's supervisor, its normalized codes are SAT 10, UNSAT 20, timeout 4, unknown 5; direct solver invocation does not inherit that normalization.

Record wall/CPU time, peak RSS, exact constraint/variable counts, propagations/conflicts and LP statistics if emitted. The four rows are a controlled pilot, not evidence that LP or the cuts are universally faster; runs may time out and early stops may leave rows unexecuted.

## 6. Witness and certificate paths

### SAT

Reconstruct all 903 edge positions including fixed root edges. Retain a sorted zero-based edge list, adjacency matrix, graph/complement hashes, degree sequence, total edges, roots and partition, exact assignment and model hash. Check both the PB inequalities and branch membership.

The existing exhaustive graph checker can be invoked with:

```sh
python3 scripts/ramsey.py check <edges.txt> --vertices 43 --clique 5 --independent 5
```

It checks clique and independent-set obstructions by exhaustive subset enumeration, stopping on the first obstruction. For a valid witness every 5-subset passes both checks. Require a second independent implementation of the exhaustive graph check, not another call through the same checking function. Verify root degrees, the isolated-neighbor shape, and both core/side conditions separately. A valid 43-vertex `(5,5)` construction raises the lower bound; independent verification precedes any public claim.

### UNSAT

For a future proof-producing replay, first approve a proof-storage and checker-resource envelope. Run a tiny proof/checker compatibility smoke check with the installed tool versions. RoundingSat has `--proof-log=<prefix>` in the inspected source; determine actual output names and proof format from that version, never assume DRAT or a particular `.pbp` filename. Keep the exact OPB and all required companion files.

For native PB proofs, use an available compatible independently checkable PB certificate pipeline, for example an installed compatible VeriPB; installation still requires approval. For a CNF route instead, record any PB-to-CNF translation and check its correctness, retain the exact CNF, and check its DRAT/FRAT/LRAT chain as applicable. A CNF refutation without a trustworthy encoding bridge is insufficient.

A checked refutation of the complete whole-branch model can support closing k1 only after independent audit of the OPB generator, mathematical hypotheses, coverage and proof-checker chain. The existing Lean theorem does not automatically certify an external OPB file or the solver's proof. Fixed-key or fixed-core refutations remain conditional unless the fixed-data enumeration is proved complete.

## 7. Optional later decomposition: catalogue and symmetry hazards

The historical local B24 filter retained 134,112 of 352,366 input graphs satisfying the recorded induced-core test. That is not a list of complete k1 keys and not by itself a certificate of catalogue completeness. The filtered `b24.g6` input consists of actual K5/I4-free sides, matching the `(5,4)` antineighborhood orientation here; the original `(4,5)` catalogue orientation is its complement. Explicitly check the source format and orientation rather than complementing every graph unconditionally.

A side may contain multiple induced 17-cores. The historical filter stopped at its first witness per B. That is sufficient for its existential keep/drop predicate, but **one witness per side is not a complete enumeration of rooted side/core embeddings for k1 gluing**. A complete gluing family must cover all required embeddings, align the shared T graph through every needed bijection, and justify all orbit reductions. Do not independently canonicalize and pair just one labeling of each side.

Do not assume core uniqueness, sort rows/columns by sums independently of their fixed incident graphs, or pin arbitrary attachment signatures as symmetry breaking. A safe first pilot uses no additional symmetry restrictions. Scalar equality buckets are safe only with their explicit full coverage manifest; they do not enumerate keys automatically.

## 8. Artifacts and receiving-agent handoff

Before starting, claim distinct generator/checker/report paths in `WORK.md` following coordinator policy. Generate pilot models and logs in ignored `scratch/<actual-run-date>-k1-pb-pilot/` or outside the repo; record one concise dated session report. Do not overwrite historical runs or mutate the source notes to match solver behavior.

For exploration, record the source/configuration, executed and skipped pilot rows, limits, measured sizes, outcomes, validation and useful findings. Generated OPB files, traces and bulky logs may be discarded after that summary. Follow [the retention policy](../docs/reproducibility.md#retention-scope).

If a computation closes a named mathematical subbranch or produces a verified Ramsey construction, retain the full package:

- Source revision, dirty-source patch, transferred-file manifest and SHA-256 hashes of generator, checker, mathematical sources, input data and executable binaries.
- Hardware/OS, solver/compiler/checker versions and build flags; LP availability and exact limits.
- Full model-generation argv, determinism check hashes, OPB files and variable maps, family counts, fixed/active variable counts and model scope (`whole-k1`, `fixed-core-pair`, or `fixed-key`).
- For each run: exact argv/cwd, model SHA-256, timestamps, wall/CPU/RSS, resource limits and limit events, raw exit status, parsed status, complete stdout/stderr, solver statistics and whether proof logging was enabled.
- All witness/proof/checker artifacts required for any claimed decision, with hashes; if none, state that explicitly.
- A dated concise report identifying the exact branch predicate, validation outcomes, retained byte totals and coverage limits. Use `WORK.md` only while the task is active.

Keep potentially useful UNSAT inputs and proof logs temporarily until deciding whether to promote them to checked closure evidence. Do not delete the only evidence copy for a recorded closure. Compress retained evidence only with lossless verification and recorded hashes. An arbitrary fixed-key UNSAT run covers only that key; whole-k1 closure still requires complete key coverage. A checkpoint or partial log is not a completed case.

### Acceptance checklist for the remote agent

- [ ] Receiving source snapshot and allowed resource envelope recorded.
- [ ] Exact generator implemented; whole-k1 versus conditional scope explicit.
- [ ] Tiny semantic/serialization controls, constant substitution and determinism checks pass.
- [ ] Model sizes measured and disk/RAM/process limits enforced before solving.
- [ ] At most the approved four pilot rows executed, with honest early-stop/skip statuses.
- [ ] SAT independently checked exhaustively, or UNSAT clearly marked uncertified unless the full proof chain was checked.
- [ ] Concise session report retained; full reproducibility package retained for any claimed subbranch closure or verified construction.

## Authoring validation

This handoff was prepared from the checked-in/current local mathematical and tooling sources, without running the proposed experiments. Arithmetic identities, source links, variable-map consistency and the distinction between whole-branch and conditional coverage are checked as document validation. Remote capabilities, OPB generation, solver performance and proof replay remain tasks for the receiving agent.
