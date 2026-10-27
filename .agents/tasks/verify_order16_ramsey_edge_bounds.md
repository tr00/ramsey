# Formally verify the order-16 (4,4) edge bounds

## Goal and scope

Replace these existing literature axioms with kernel-checked Lean theorems of the
same types:

```lean
Ramsey.edges_ramsey_4_4_16_ge_60 : RamseyEdgeLowerBound 16 4 4 60
Ramsey.edges_ramsey_4_4_16_le_60 : RamseyEdgeUpperBound 16 4 4 60
```

The mathematical statement is: every simple graph on 16 vertices with no clique
of size 4 and no independent set of size 4 has exactly 60 edges. No maximality,
extendibility to order 17, or additional structural hypothesis is allowed.

This is formalization and certificate/engine development if that route is used,
not a request to decide order 43 or reproduce the full graph classification.
Preserve the existing theorem interfaces and downstream mathematics. No new
axioms, sorries, or replacement trusted census assumptions.

Read the current repository instructions, `lean/AGENTS.md`, the Lean skill,
`docs/workflow.md`, `docs/reproducibility.md`, and `WORK.md`. Claim precise owned
paths before editing and preserve concurrent work. This task brief is not
permission to download or install tools, obtain a graph catalogue, or start
nontrivial computation. Obtain explicit approval before requiring a SAT solver,
proof checker or canonicalizer, and before each computational run beyond trivial
validation. Agree on resource and storage limits before generating large traces.

## Background and current consumers

The axioms are currently in `lean/Ramsey/Premises.lean`. The cited source is
McKay and Radziszowski, *A New Upper Bound for the Ramsey Number R(5,5)*,
Australasian Journal of Combinatorics 5 (1992), 13–20:
<https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>.

Section 2, printed pages 15–16, describes exhaustive generation of (4,4)-free
graphs by vertex extension, with nauty-based canonical parent selection and
isomorph rejection. A new vertex's neighbor set must contain no triangle and
must hit every independent triple in the old graph. Table 1 reports 2
isomorphism classes at order 16 and maximum edge count 60. Complementation
supplies the lower bound, since there are 120 possible edges. These are
literature results, not presently checked certificates in this repository.

The bounds are consumed by `lean/Ramsey/n43/d18/k2/Rerooting.lean` and hence
`Ramsey.d18.k2.excludes`. That theorem excludes K2 neighborhoods at a maximizing
degree-18 pivot by a strict re-rooting from 61 to 69 neighborhood edges. Its
current named premises include both order-16 bounds and
`Ramsey.ramsey_4_5_le_25`. Find all current consumers before changing placement
or imports. The source correspondence is in
`research/n43/d18/density_rerooting.md#claim-reroot-k2`.

## Recommended proof route

Prove only the upper bound independently. Derive the lower bound by applying it
to the complement, using 120 total possible edges and preservation of the (4,4)
condition. A full classification, the count of 2 graphs, or a witness construction
is not needed to prove these universal edge bounds.

A concrete candidate is a certified refutation of the existence of a
16-vertex (4,4)-free graph with at least 61 edges:

1. Use 120 Boolean variables, one for each unordered vertex pair.
2. For each of the 1820 four-vertex subsets, add a clause forbidding its 6 edges
   from all being present and a clause forbidding them from all being absent.
   This is 3640 clauses before the cardinality encoding.
3. Encode an edge count of at least 61. Any auxiliary-variable encoding needs
   a proved assignment-extension property, not merely an empirical cross-check.
4. Obtain an UNSAT proof certificate and validate it through a formally verified
   checker whose result yields a Lean proof of the exact encoded formula's
   unsatisfiability.
5. Prove in Lean that any mathematical counterexample induces a satisfying
   assignment of that formula, including all auxiliary variables. Combine this
   with the checked refutation, then transport across finite vertex labelings
   as required by `RamseyEdgeUpperBound`.

The encoding bridge and the certificate check are both essential. A solver's
UNSAT answer, external checker success alone, checking only a list of known
graphs, or trusting a program's enumeration is insufficient. Bind the checked
certificate to the exact formula used in the semantic theorem. Prefer no
symmetry breaking initially. Any restriction, case split or symmetry reduction
requires a formal completeness argument and certificates for every case.

Inspect existing Lean/checker infrastructure before choosing an implementation.
Do not assume an installed checker can produce a kernel-checked theorem, or that
an arbitrary evaluation tactic has an acceptable axiom footprint. The final
`#print axioms` output is decisive. A direct structural proof is also acceptable
if one is found and independently audited. No short structural proof or solver
runtime/certificate-size estimate has been established for this task.

## Integration and evidence

- Follow Lean placement and visibility rules. Keep the two existing public names
  and types as the proved API, with no compatibility shims or import cycles.
  Remove the obsolete axiom declarations and any circular dependence on them.
- Add both proved bounds to `lean/scripts/Audit.lean` and update all affected
  entries in `lean/scripts/expected-axioms.txt` from observed audit results.
  Do not add entries to the sorry ledger or expand the axiom allowlist.
- If a certificate is necessary to replay the proof, retain it with its exact
  inputs, generator/checker sources or pinned requirements, commands, coverage
  statement, hashes and observed results under the evidence policy. Measure
  growth before committing to large computations. Clean-checkout replay must
  not depend on an unrecorded local solver run or temporary files.
- Keep any new authoritative mathematical topic under `research/` at the shared
  (4,4) scope, not under d18. Reuse an existing suitable topic if present. Keep
  review findings inline, not in a separate report. Record Lean correspondence
  and outcomes according to current Lean conventions. Update affected source
  status/navigation without changing unrelated census bounds or branch claims.
- Any engine changes must obey deterministic encoding conventions and the checks
  in `docs/engine.md`. Document any deliberate divergence from the Python
  reference. Do not modify or download third-party sources during the build.

## Acceptance criteria

1. Both existing edge-bound statements elaborate as theorems, unchanged in
   meaning, with no sorries and no named axioms beyond standard Lean logical
   axioms (`propext`, `Classical.choice`, `Quot.sound`). In particular neither
   theorem may depend on either former census axiom or another unproved census.
2. The proof covers every 16-vertex (4,4)-free graph. It does not assume that the
   graph extends to an order-17 graph or belongs to an imported catalogue.
3. Any certificate route includes checked semantics, exact certificate/formula
   binding, complete coverage and reproducible retained evidence. Independent
   review audits this connection, not just the final UNSAT result.
4. A Lean consumer smoke check applies both bounds to an arbitrary graph of the
   required type and derives exactly 60 edges. Exercise the existing K2
   exclusion consumer as well, without weakening its statement.
5. Observed axiom audits for `Ramsey.d18.k2.strict_reroot` and
   `Ramsey.d18.k2.excludes` no longer contain the two census axioms. The existing
   `Ramsey.ramsey_4_5_le_25` premise may remain. Other branches' existing sorries
   are outside this task and must not be presented as discharged.
6. Run `sh lean/scripts/check.sh` after integration and pass its build, unchanged
   sorry-ledger expectations, style and intentionally updated axiom audit. Run
   the required engine checks if engine files changed. Verify affected links.
7. Final handoff states the actual trust basis, replay commands, observed
   verification, retained evidence location and any remaining unrelated premises.
   A proposed encoding or unchecked certificate is not task completion.
