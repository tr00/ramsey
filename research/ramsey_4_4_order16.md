# Order-16 (4,4) edge-bound certification

## Scope and status

- Ambient class: every simple graph on 16 vertices with neither a 4-clique nor an independent 4-set.
- Target: prove the upper edge bound 60, then derive the lower bound by complementation. No maximality, extendibility, catalogue membership, or symmetry restriction is assumed.
- Kind: experimental feasibility and unimplemented formal proof obligations.
- Review state: draft. Author: Main. No independent mathematical acceptance or certified search use.
- Current conclusion: no replacement of either literature axiom has been justified. The existing Lean statements and downstream axiom audits remain unchanged.
- Authorization: the user authorized the RoundingSat and symmetry-breaking experiments, then a proof-producing rerun and investigation of Lean certificate routes. Proof generation is no longer blocked. No external proof checker, Lean/Mathlib installation or new third-party dependency was authorized in this follow-up.

The literature source remains McKay and Radziszowski, [*A New Upper Bound for the Ramsey Number R(5,5)*](https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf), Table 1. This work does not recertify that table.

## Unrestricted experimental encoding

The retained [generator](ramsey_4_4_order16/generate.py) numbers the 120 unordered pairs lexicographically, starting at DIMACS variable 1. For each lexicographic 4-subset it emits the negative 6-literal clique clause followed by the positive independent-set clause. This deliberately interleaves the two clause families in accordance with the reproducibility policy. The older Python reference groups the families instead. The formulas have the same direct Ramsey constraints, but their serialized clause order differs.

For edge variables `x_1,...,x_120`, the counting variable `s(i,j)` means that at least `j` of the first `i` edges are present. Constants are `s(i,0)=true` and `s(i,j)=false` for `j>i`. The generator emits the 4 CNF clauses for

```text
s(i,j) <-> s(i-1,j) OR (s(i-1,j-1) AND x_i)
```

for `1 <= j <= min(i,61)`, simplifies Boolean constants, and asserts `s(120,61)`. There are 5,490 auxiliary variables, 5,610 variables overall, 3,640 Ramsey clauses and 25,420 clauses overall. The DIMACS file occupies 427,696 bytes. Input and generator hashes are recorded once in the adjacent [measurements](ramsey_4_4_order16/measurements.json).

There is no symmetry breaking, graph catalogue, degree restriction, fixed edge, or census premise in the target formula. The fixed Paley graph used below is only a separate positive control.

### Validation performed

- Checked the graph/CNF equivalence under canonical prefix-count assignments on 12,850 small graph/threshold combinations, covering orders 0 through 5 with homogeneous-set size 3 and thresholds through one more than the possible edge count.
- Exhaustively quantified all auxiliary assignments for every order-3 graph at thresholds 0 through 4 and checked the expected existence of a satisfying extension.
- The actual Gimsatul executable returned SAT with exit 10 on a unit clause and UNSAT with exit 20 on contradictory unit clauses.
- Positive graph-level control: the quadratic-residue graph modulo 17 with vertex 16 deleted has 60 edges. Exhaustive inspection of all 1,820 four-subsets found neither a clique nor an independent set. Its canonical prefix-count assignment satisfies the threshold-60 formula. Gimsatul returned SAT with exit 10 when its 120 edge literals were fixed in that separate formula.
- Regenerated the target CNF byte-identically and checked its 3,640 direct Ramsey clauses against the existing reference as a multiset. Every emitted clause has distinct literals and no complementary pair. The DIMACS header agrees with the maximum variable index.
- Negative graph-level control: unrestricted order-6 `(3,3)` formula, threshold 0. Gimsatul returned UNSAT with exit 20.

These are empirical implementation checks, not Lean proofs of the assignment-extension property or the target upper bound. The positive control is not promoted to a retained construction claim or classification premise.

## Bounded solver-only experiment

Build Gimsatul explicitly using the isolated-copy procedure in [engine documentation](../docs/engine.md). The pinned source revision and binary hash are in the measurements file. Generate and run from the repository root:

```sh
python3 research/ramsey_4_4_order16/generate.py scratch/order16/order16-ge61.cnf
prlimit --as=128849018880 --fsize=67108864 -- \
  scratch/order16/gimsatul-build/gimsatul --threads=32 --time=600 --resources \
  scratch/order16/order16-ge61.cnf
```

Limits: 600 seconds elapsed time requested from Gimsatul, 120 GiB virtual address space, 64 MiB per regular output file, 32 solver threads. No proof filename is passed, so no proof trace is generated. Available storage before launch was approximately 825 GiB. Retain only the small measurements and useful solver log. Disposable CNFs and control inputs remain under ignored scratch storage until the run is summarized, then are removed. No branch-closing evidence exists to discard.

Observed outcome: the 600-second limit expired without a SAT or UNSAT decision. Gimsatul exited 0, with a `?` progress marker and no terminal `s` status line. It reported 18,882.57 process CPU-seconds, 98% utilization across 32 threads and 1,654.93 MB memory. Thread 0 reported 1,563,892 conflicts. That is not a portfolio-wide conflict total. The complete small [solver log](ramsey_4_4_order16/solver.log) is retained with its hash in the measurements file. Disposable target and control CNFs were removed after summarizing the run.

This timeout is no evidence of nonexistence. It does not establish an eventual solver runtime, proof size, or kernel-replay feasibility. Proof storage cannot be measured without a separately authorized proof-producing run. The straightforward unrestricted run did not provide a short refutation within the measured window.

## Native PB and symmetry-breaking follow-up

The [native OPB generator](ramsey_4_4_order16/generate_pb.py) uses exactly the 120 edge variables and no auxiliary variables. Each forbidden 4-clique is the inequality `-sum(edges) >= -5`, each forbidden independent 4-set is `sum(edges) >= 1`, and the edge threshold is the single inequality `sum(all edges) >= 61`. It retains the same edge numbering and interleaved subset order as the CNF experiment. The unrestricted input has 3,641 inequalities. Inputs were independently regenerated byte-identically. Exact hashes, commands, solver identity, limits and logs are in [PB measurements](ramsey_4_4_order16/pb-measurements.json).

### Rooted completeness argument

This is a draft mathematical reduction for exploratory search, not a Lean theorem or independently accepted closure proof.

In a `(4,4)`-free graph, each neighborhood is `(3,4)`-free. The proved elementary bound `R(3,4) <= 9`, by complementation of `Ramsey.ramsey_4_3_le_9` in [R43.lean](../lean/Ramsey/n09/R43.lean), therefore bounds every degree by 8. Applying the same argument in the complement gives `15-d(v) <= 8`, hence every degree lies in `7..8`. This uses no edge census premise.

At least 61 edges give degree sum at least 122, so some vertex has degree at least 8. The degree cap makes its degree exactly 8. Relabel this vertex as 0, its 8 neighbors as `1..8`, and its 7 nonneighbors as `9..15`. The rooted input adds the 32 degree inequalities and fixes the 15 edges incident to vertex 0. Every target counterexample has such a labeling. There is no additional catalogue or extendibility restriction. The rooted input has 3,688 inequalities.

### Residual lexicographic completeness argument

Permutations within the blocks `1..8` and `9..15` preserve all rooted constraints. Select a labeling minimizing the full upper-triangular adjacency bit string in lexicographic unordered-pair order among this finite set of permutations, with `false < true`.

For vertices `u<v` in the same block, compare their adjacency rows on the increasing list of the other 14 vertices, omitting both `u` and `v`. Swapping `u,v` leaves their mutual edge and every unrelated edge unchanged. At the first outside vertex where the rows differ, the earlier changed upper-triangular edge is the edge incident to `u`. The order of these earlier edges agrees with the increasing outside-vertex order: vertices below `u` come first, followed by edges whose smaller endpoint is `u`. Thus if the row of `u` were lexicographically larger than that of `v`, the swap would decrease the full bit string, contradicting minimality. Every selected labeling therefore has row `u <=lex row v` for every within-block pair.

The generator encodes each comparison as the single inequality

```text
sum over k outside {u,v} of 2^(13-index(k)) * (x(v,k) - x(u,k)) >= 0.
```

Binary positional weights compare the rows exactly. The 2 blocks have `C(8,2)+C(7,2)=49` such inequalities. The rooted-lex input has 3,737 inequalities, still only 120 variables. These are necessary properties of a selected labeling, not additional assumptions about the unlabeled graph. Formal use still requires a Lean proof of this selection argument and its connection to the exact generated rows.

### Validation and observed runs

- Native PB graph/threshold equivalence checked on the same 12,850 small cases as the CNF generator.
- The lex-minimum/transposition row-order argument checked on all 1,024 labeled order-5 graphs by enumerating every labeling and verifying every pairwise row comparison in a selected minimum.
- The 60-edge Paley deletion control relabeled to satisfy the rooted and residual lex constraints using 17 strictly decreasing within-block transpositions. With threshold 60 and its edges fixed, the actual RoundingSat binary returned SAT. This control does not change the target threshold 61.
- The native order-6 `(3,3)` control returned UNSAT. Both solver control processes exited 0, illustrating why terminal status text, not process exit 0, distinguishes their results.

Six single-threaded RoundingSat processes ran concurrently, comparing the 3 encodings with LP reasoning disabled and enabled. Each was capped at 600 user CPU-seconds, a 660-second outer wall timeout, 20 GiB virtual memory and 64 MiB per regular output file. No proof-log option was passed. The 4 undecided comparisons were stopped after approximately 78 wall-seconds once both rooted-lex runs had decided. Their results are UNKNOWN, not timeouts at the original 600-second cap.

| Encoding | LP | Result | User CPU seconds | Conflicts |
| --- | --- | --- | ---: | ---: |
| Unrestricted | off | UNKNOWN, interrupted | 74.7066 | 3,359,258 |
| Unrestricted | on | UNKNOWN, interrupted | 75.7713 | 1,164,432 |
| Rooted | off | UNKNOWN, interrupted | 75.6418 | 2,469,726 |
| Rooted | on | UNKNOWN, interrupted | 75.6698 | 1,293,857 |
| Rooted-lex | off | UNSAT, unchecked | 0.280776 | 10,938 |
| Rooted-lex | on | UNSAT, unchecked | 1.35744 | 11,534 |

The completed UNSAT runs exited 0. The 4 interrupted comparisons exited 2 and printed `s UNKNOWN`. Complete logs are retained for the 2 decisions and final log tails for the interrupted comparisons. Disposable OPB inputs are removed after recording hashes and verifying exact deterministic regeneration. Existing RoundingSat sources and build products were reused without downloading or modifying dependencies.

The combination of native PB and residual lex constraints is promising for discovery: the symmetry-broken target is easy for this solver configuration. The measurements do not isolate a solver-only speedup over Gimsatul because the encoding and symmetry constraints also changed. These statuses do not certify nonexistence. The later proof-producing run below retained a trace; no independent proof checker result is available.

RoundingSat's logger emits `pseudo-Boolean proof version 2.0`, not LRAT. Lean's LRAT checker cannot directly check those cutting-planes proofs. The preferred native PB route below avoids PB-to-CNF proof translation. Proof size is now measured; kernel-replay feasibility remains unmeasured.

### Proof-producing rerun

The LP-disabled rooted-lex experiment was rerun with proof logging. It returned `s UNSATISFIABLE`, exit 0, in 0.331303 user CPU-seconds and 0.349184 wall-seconds, with the same 10,938 conflicts as the non-logging run. There were no LP calls or auxiliary variables. Limits were 60 user CPU-seconds, a 70-second outer wall timeout with 5-second kill grace, 20 GiB virtual memory and 64 MiB per regular output file. Approximately 825 GiB free storage was available before launch.

The initial proof-enabled attempt exposed an input compatibility issue: this pinned RoundingSat parser requires `#equal= 0 intsize= ...` in the OPB comment header only when logging proofs. It exited 1 with `Invalid opb header` and wrote an empty trace. The generator now provides `--proof-header`, which emits these fields. The inequalities remain byte-identical, and the 3 previous default input hashes were reproduced exactly. The successful run used integer size 15.

The exact input and raw solver trace are retained in [pb-proof.tar.gz](ramsey_4_4_order16/pb-proof.tar.gz), with the full [solver log](ramsey_4_4_order16/pb-proof.log) and [measurements and hashes](ramsey_4_4_order16/pb-proof-measurements.json). The archive is 1,079,653 bytes. Its input member is 195,546 bytes and its trace member is 5,608,514 bytes (5.35 MiB). Both archived members were compared byte-for-byte with the run files.

The trace has 60,920 lines, including 49,815 `rup` steps, 10,987 polynomial `p` steps and 113 deletion commands. Its arithmetic fragment uses addition, multiplication by nonnegative integers, division/rounding, saturation and Boolean literal axioms; no dominance, redundance or subproof rule appears. The final line names contradiction constraint 64,539. Structural inspection verified contiguous derived IDs, live references at every use, and a live conclusion ID. This did **not** check arithmetic or RUP inference validity. Backward dependency analysis retains 51,397 of the 60,802 derived constraints, so simple dead-step trimming alone does not make the proof tiny.

To repeat the measured run, from the repository root:

```sh
python3 research/ramsey_4_4_order16/generate_pb.py \
  scratch/order16/pb-proof/rooted-lex.opb --symmetry rooted-lex --proof-header
timeout --signal=TERM --kill-after=5s 70s \
  prlimit --as=21474836480 --fsize=67108864 -- \
  third-party/roundingsat/build/roundingsat --lp=0 --time-limit=60 \
  --proof-log=scratch/order16/pb-proof/refutation \
  scratch/order16/pb-proof/rooted-lex.opb
```

The archive also permits subsequent checking without another solver run: extract `rooted-lex.opb` and `refutation.pbp` into scratch storage and verify their manifest hashes. No independent checker was installed or run. This is retained candidate evidence, not a branch closure or a Lean certificate.

## Kernel-checking route and missing obligations

### Recommended native PB route

Source investigation found [pb-catcher](https://github.com/leansolving/pb-catcher), previously named PBLean. The inspected revision is `29462e03759848dc9180112357191eb87c185078`; it pins Lean 4.30.0, whereas this repository pins 4.35.0. Compatibility and replay cost on this repository's toolchain have not been tested. This is a proposed dependency, not an installed one.

The recommended starting point is its **explicit proof-term path**, not its default reflection command:

- [`PBCatcher/PseudoBoolean.lean`](https://github.com/leansolving/pb-catcher/blob/29462e03759848dc9180112357191eb87c185078/PBCatcher/PseudoBoolean.lean) proves `Sat.PB.add_sat`, `mul_sat`, `div_sat`, `saturate_sat` and `contra_unsat`.
- [`PBCatcher/FromVeriPB.lean`](https://github.com/leansolving/pb-catcher/blob/29462e03759848dc9180112357191eb87c185078/PBCatcher/FromVeriPB.lean) implements `buildPolProof`, `buildRupProof` and `fromVeriPBDirect`. The latter constructs an ordinary theorem of type `forall v, PBFmla.allSat v ctx -> False` for a concrete input constraint array. The `opb_veripb_file` command loads OPB/proof files through this path. Its arithmetic builder covers all polynomial operations observed in this trace, including literal bounds.
- The default `veripb_reflect` path is **not acceptable under the task's current axiom policy**: the upstream README explicitly lists per-theorem `_native...` evaluation axioms. It also describes an `@[implemented_by]` array implementation whose equality with the proved list checker is tested, not proved. Native execution is useful for diagnostics, but cannot replace the requested axiom-audited kernel proof.

This is not a drop-in import. The current pb-catcher parser requires version 3.0 kernel syntax; RoundingSat emitted version 2.0. The official [VeriPB migration guide](https://gitlab.com/MIAOresearch/software/VeriPB/-/blob/main/migration_guide.md) changes rule names, terminators, hint separators and other semantics. A header-only version change is insufficient. The [VeriPB README](https://gitlab.com/MIAOresearch/software/VeriPB/-/blob/main/README.md) keeps the old checker on branch `version2`; its current v3 [command-line source](https://gitlab.com/MIAOresearch/software/VeriPB/-/blob/main/src/args.rs) provides `--elaborate PATH`. Do not assume that v3 accepts this raw v2 trace without conversion.

One specific direct-builder limitation is already visible: the trace's first derived step is the hint-free tautology `rup >= 0 ;`, and `buildRupProof` rejects empty hint lists. This step is used in the final contradiction's dependency cone. A generic proof of degree-zero constraints, or another checked representation of this same tautology under the same ID, is required. More generally, converted RUP hints must agree with the builder's negated-target and propagation conventions. Acceptance of the remaining RUP steps has not been tested.

Proposed milestones, in dependency order:

1. Obtain approval for a pinned VeriPB checker and the repository-pinned Lean/Mathlib environment. Independently check the raw v2 input/trace before investing in formal integration. Any checker rejection is an error to investigate, not a reason to weaken the mathematical target.
2. Port or depend on the minimal pb-catcher kernel/arithmetic and explicit proof-term modules under Lean 4.35.0. Adapt this observed v2 fragment to v3 kernel syntax, preserve all constraint IDs and input order, support generic degree-zero tautologies, and kernel-check the resulting proof terms. The adapter can be untrusted because every produced inference must be checked again. Do not use `veripb_reflect`, `native_decide`, `sorry` or replacement axioms. Audit the resulting theorem with `#print axioms`.
3. Benchmark the full concrete refutation before committing to an integration architecture. Explicit terms may be expensive at 60,802 derivations. If needed, emit shared intermediate theorem declarations or checked blocks instead of repeatedly embedding preceding derivations in one expression. This is an unmeasured engineering option, not an observed speedup. Kernel evaluation of the proved list checker is another candidate, also unmeasured; it must not rely on the unproved runtime replacement.
4. Define the exact 120-variable PB formula in Lean, including signed-coefficient normalization and the 49 lex constraints. Prove that every hypothetical `(4,4)`-free graph with at least 61 edges has a rooted block-lex-minimal labeling satisfying this formula, using the degree and finite-minimum arguments above. Bind the semantic theorem to the actual constraint object used by the certificate theorem; file hashes alone do not do this. No census premise may enter this bridge.
5. Combine the bridge and kernel refutation for the upper bound 60. Apply it to the complement for the lower bound, using 120 possible edges. Preserve the two public real-valued interfaces, exercise the arbitrary-graph and K2 consumers, update observed axiom audits, run the Lean gate and obtain independent review of the complete coverage/binding argument.

Recommendation: prototype the explicit PB route first. It reuses existing soundness lemmas for the measured trace's arithmetic fragment and avoids a second CNF encoding and a PB-to-LRAT proof translator. Its remaining risks are concrete: version compatibility, hint/tautology support, proof-term resource use, and the still-unformalized graph-to-formula completeness argument. None is discharged by the solver's UNSAT status.

### Original CNF/LRAT alternative

Lean 4.35.0 upstream includes [`Std.Tactic.BVDecide.LRAT.check_sound`](https://github.com/leanprover/lean4/blob/v4.35.0/src/Std/Tactic/BVDecide/LRAT/Checker.lean), whose type converts a successful Boolean LRAT check into `cnf.Unsat`. Its [`IntAction`](https://github.com/leanprover/lean4/blob/v4.35.0/src/Std/Tactic/BVDecide/LRAT/Actions.lean) supports RUP, RAT, deletion and empty-clause steps. Gimsatul emits DRAT, not LRAT. An elaboration path from DRAT to the precise LRAT representation is therefore still required. No external elaborator/checker was installed or run.

The inspected [internal checker](https://github.com/leanprover/lean4/blob/v4.35.0/src/Std/Tactic/BVDecide/LRAT/Internal/Checker.lean) converts positive DIMACS literal `v` to variable `v-1` and negative literal `-v` to the same variable with negative polarity. Formula construction and certificate import must agree on this convention, clause order and LRAT clause indexing. A file hash in prose is not a formal binding.

Required remaining work:

1. Define the exact CNF in Lean and prove that each mathematical counterexample assigns its edge variables and extends to the counting auxiliaries. The generator's empirical checks do not discharge this.
2. Produce a complete DRAT refutation and elaborate it to the checked LRAT representation, preserving the exact initial formula and all case coverage.
3. Prove the concrete checker success in the Lean kernel without `native_decide` or another trust shortcut adding nonstandard axioms. Practical kernel reduction cost has not been measured.
4. Use `check_sound` and the assignment-extension theorem to prove the upper bound. Derive the lower bound using `isRamseyGraph_compl` and `card_edges_add_card_edges_compl`, with `16.choose 2 = 120`.
5. Preserve both public names and real-valued types in the existing API, update axiom audits from observed output, exercise the arbitrary-graph exact-edge consumer and K2 exclusion, run the Lean gate, and independently review the actual retained proof.

There is no usable `lean`, `lake`, or `elan` on PATH or in the inspected accessible installation locations, and `lean/.lake` is absent. The requested Lean skill is not available in this harness. The user selected solver-only feasibility instead of authorizing installation. No Lean files or ledgers were edited and the Lean check script was not run.

## Lean correspondence and consumers

The existing axioms are `Ramsey.edges_ramsey_4_4_16_ge_60` and `Ramsey.edges_ramsey_4_4_16_le_60` in [Premises.lean](../lean/Ramsey/Premises.lean). Their types in [RamseyGraph.lean](../lean/Ramsey/defs/RamseyGraph.lean) quantify over every `SimpleGraph (Fin 16)` satisfying `IsRamseyGraph 4 4` and compare the real cast of `Nat.card G.edgeSet` with 60.

The direct source consumer is the private `edges_sixty` lemma in [K2 Rerooting.lean](../lean/Ramsey/n43/d18/k2/Rerooting.lean), via the existing `on_finite_type` transport lemmas. The retained expected audit records both census premises in `Ramsey.d18.k2.strict_reroot`, `Ramsey.d18.k2.excludes` and `Ramsey.R_5_5_43`. No consumer or audit was weakened. In particular the unrelated `Ramsey.ramsey_4_5_le_25` premise and other branches' sorries remain outside this task.

## Changelog

- Added a deterministic unrestricted feasibility encoding, small-instance checks, graph-level controls and a bounded solver-only experiment. Identified missing kernel/toolchain and certificate-format prerequisites. Neither literature axiom is discharged.
- Added native PB experiments with complete rooted relabeling and residual lex restrictions. RoundingSat reported unchecked UNSAT in 0.281 CPU-seconds without LP. Baselines remained undecided during the measured comparison window. Recorded the reduction argument and outstanding PB-certificate/kernel obligations.
- Generated and retained a 5.35 MiB native PB refutation in 0.331 CPU-seconds, added an optional proof-compatible OPB header without changing historical default inputs, and identified pb-catcher's explicit proof-term path with concrete format, tautology, axiom and semantic-binding obligations.
