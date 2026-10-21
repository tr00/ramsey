# Reproducibility and Evidence Policy

The objective is not merely to obtain a solver answer. A positive result needs
a directly checkable graph; a negative result needs a complete, independently
checkable exhaustion argument.

## Retention scope

Keep the full reproducibility package below when a computation is used to
close a **named mathematical subbranch**, or when retaining a verified Ramsey
construction. Name the branch predicate and connect each input, certificate,
checker result, and coverage argument to that claim. A solver's UNSAT status
alone, or UNSAT after arbitrary experimental restrictions, does not close a
branch.

For pure experimentation, keep a concise session summary of the scope,
commands or configuration, resource limits, outcome, and useful findings.
Generated CNF/OPB models, proof traces, temporary assignments, and bulky logs
need not be retained. Store them in ignored `scratch/` (or outside the repo)
and delete them after recording the useful result. Small inputs, drivers,
measurements, or logs may be kept when they help future work; a full artifact
manifest and a report for every run are unnecessary.

Before using an exploratory result to close a branch, promote it to a
reproducibility package and independently check the evidence.
Never discard the only copy of evidence for an already recorded closure.

## Trusted core

Keep the trusted code small:

1. Parse and validate graph witnesses.
2. Check every candidate clique and independent set.
3. Map graph edges to Boolean variables deterministically.
4. Generate the direct Ramsey CNF.
5. Check SAT assignments against both the CNF and graph semantics.
6. Check cube coverage and final proof certificates.

Discovery code, heuristics, canonicalizers, and SAT solvers may be large and
untrusted if their outputs reduce to evidence checked by this core.

## Positive evidence

For a claimed graph in `R(5,5,n)`, retain:

- A canonical, zero-based edge list with declared vertex count.
- An adjacency-matrix rendering for human inspection.
- SHA-256 hashes of both forms.
- Checker source hash and complete checker output.
- An independent implementation's check.
- Degree sequence, edge count, and complement hash.

The checker must enumerate all 5-subsets, not sample them.

## Negative evidence

For an UNSAT result used to close a named subbranch, retain:

- Mathematical reduction and every external theorem assumed.
- Exact model-generator source and revision.
- Exact CNF/OPB input, SHA-256, variable and constraint counts, and generation
  command; deterministic regeneration must be verified before replacing a
  stored model with its recipe.
- Solver name, version, binary hash, build flags, full command, seed, resource
  limits, exit status, and log.
- Proof certificates, with hashes: DRAT/FRAT and any elaborated LRAT for
  CNF refutations,
  or the solver's independently checkable pseudo-Boolean proof format.
- Checker source/binary hashes, command, exit status, and log.
- If cube-and-conquer is used, the cube tree plus a machine-checkable coverage
  proof and a manifest linking each cube to its proof.
- If catalogues are used, source, license, format, hash, counts, and evidence
  for every completeness assertion.

A timeout, crash, empty frontier, or failure to find a witness is not negative
evidence.

## Determinism

- Number vertices `0..n-1`.
- Number edge variables lexicographically by `(u,v)`, with `u < v`, starting
  at DIMACS variable 1.
- Enumerate vertex subsets lexicographically.
- Emit the forbidden-clique clause before the forbidden-independent-set clause
  for a subset when their sizes coincide.
- Store commands and manifests as plain UTF-8 text.
- Record SHA-256 for retained evidence artifacts.

## Storage discipline

Only tiny validation CNFs are generated in setup. Before generating an
`R(5,5,43)` CNF or any proof trace:

1. Estimate CNF, proof, temporary, and compressed sizes.
2. Reserve enough free space for the solver and checker simultaneously.
3. Define cleanup rules: discard exploratory outputs after summarizing the
   run; preserve the only copy of branch-closing evidence.
4. Prefer streaming generation and checking.

At `n=43`, the direct diagonal encoding has 903 variables and
`2 * C(43,5) = 1,925,196` clauses of length 10. Its clause count is manageable,
but an UNSAT proof trace could be much larger than the CNF.

## Review gates

- No external download or installation without user approval.
- No large computation before small-instance cross-checks pass.
- No use of a graph catalogue as complete without a completeness argument.
- No public claim before independent replay of the evidence chain.
