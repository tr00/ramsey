# Reproducibility and Evidence Policy

The objective is not merely to obtain a solver answer. A positive result needs
a directly checkable graph; a negative result needs a complete, independently
checkable exhaustion argument.

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

For an UNSAT result, retain:

- Mathematical reduction and every external theorem assumed.
- Exact CNF-generator source and revision.
- DIMACS SHA-256, variable count, clause count, and generation command.
- Solver name, version, binary hash, build flags, full command, seed, resource
  limits, exit status, and log.
- Original DRAT/FRAT proof and any elaborated LRAT proof, with hashes.
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
- Record SHA-256 for generated artifacts.

## Storage discipline

Only tiny validation CNFs are generated in setup. Before generating an
`R(5,5,43)` CNF or any proof trace:

1. Estimate CNF, proof, temporary, and compressed sizes.
2. Reserve enough free space for the solver and checker simultaneously.
3. Define cleanup rules that never delete the only copy of evidence.
4. Prefer streaming generation and checking.

At `n=43`, the direct diagonal encoding has 903 variables and
`2 * C(43,5) = 1,925,196` clauses of length 10. Its clause count is manageable,
but an UNSAT proof trace could be much larger than the CNF.

## Review gates

- No external download or installation without user approval.
- No large computation before small-instance cross-checks pass.
- No use of a graph catalogue as complete without a completeness argument.
- No public claim before independent replay of the evidence chain.
