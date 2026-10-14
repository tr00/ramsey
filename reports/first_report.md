# First R(5,5) Setup Report

Report date: 2026-10-13  
Requested delivery: approximately 16:53 CEST  
Scope: setup and plan only; the solve attempt has not started

## Outcome

The workspace is ready at `/scratch/ramsey`. No package, solver, graph
catalogue, source archive, or other tool was downloaded or installed.

The current peer-reviewed result is:

```text
43 <= R(5,5) <= 46.
```

The best first decision target is order 43. If no `(5,5)`-Ramsey graph exists
there, Exoo's established 42-vertex witness gives `R(5,5) = 43`. If one exists,
it is a directly checkable new lower-bound witness and the search moves to 44.

## Setup completed

- Recorded sources, proof obligations, degree/cell constraints, and the warning
  that the 656 known order-42 graphs are not a proved complete census.
- Inventoried the host: 16 CPU threads, 62 GiB RAM, and 83 GiB free scratch.
- Implemented a dependency-free graph checker and direct DIMACS CNF generator.
- Fixed deterministic vertex, edge-variable, subset, and clause orderings.
- Added artifact/provenance rules for witnesses, CNFs, cube trees, solver logs,
  graph catalogues, and SAT proof certificates.
- Passed 9 baseline tests in 0.422 seconds. The tests exhaust all 32,768 labeled
  graphs on 6 vertices to confirm the `R(3,3) <= 6` checker path, verify the
  5-cycle witness at order 5, and compare CNF semantics with graph semantics on
  every graph of order 5.
- Confirmed the direct `R(5,5,43)` dimensions without generating it:
  903 variables and 1,925,196 ten-literal clauses.

## Structural starting point

For a candidate graph `G` of order 43, every degree lies in `18..24`.
The handshake lemma guarantees an even-degree vertex. After replacing `G` by
its complement if necessary, a pivot can therefore be chosen with degree 18 or
20.

This yields two complete top-level branches:

1. **Degree 18:** the pivot antineighborhood has order 24 and is a `(5,4)`
   graph. Its complement belongs to the complete published collection of
   352,366 `(4,5,24)` graphs. This is the more concrete catalogue branch.
2. **Degree 20:** the neighborhood and antineighborhood have orders 20 and 22.
   A raw product of catalogues is infeasible; this branch needs stronger
   interface constraints, generalized templates, or certified SAT splitting.

This reduction is useful but does not make either branch small. The published
order-46 proof consumed tens of CPU-years, and its authors state that the same
method does not scale to a better bound without new ideas.

## Proposed solve program after feedback

1. Validate an external solver and its proof checker on the existing tiny
   encodings, then on `R(3,4) = 9`.
2. Establish a simple direct-CNF baseline for order 43 and collect solver
   behavior; retain no non-checkable timeout as evidence.
3. Add proved redundant constraints: degree bounds, common-neighbor bounds,
   and selected counting identities. Test each addition independently.
4. Split on the degree-18 and degree-20 pivot branches. Use canonical labels
   only to guide and compress search; anchor final negative evidence to
   exhaustive cubes plus checkable SAT certificates.
5. Run parallel theory work on degree-sequence/counting reductions and equality
   cases for critical `(3,5)` and `(4,4)` cells.
6. If order 43 is SAT, verify and publish the witness format, then repeat at 44.
   If UNSAT, independently replay all cube coverage and proof certificates.

The first research objective is not a long monolithic solve. It is a measured
order-43 pilot that identifies whether direct SAT, the degree-18 catalogue
branch, or a new theoretical reduction has the best scaling.

## Tools needed for the solve phase

No suitable SAT solver, proof checker, theorem prover, or graph canonicalizer
is currently on `PATH`.

Before serious exhaustive work, please provide or approve access to:

1. A proof-logging SAT solver such as CaDiCaL or Kissat, with deterministic
   options and DRAT or FRAT output.
2. A compatible independent proof checker/converter, preferably supporting an
   LRAT end product.
3. nauty/Traces or an equivalent mature canonical-labeling and automorphism
   package for catalogue work.

A theorem prover is not yet required. It should be selected only after the
computational proof architecture stabilizes. The existing Python-MIP package in
another project's test environment could support exploratory ILP, but it is
not an acceptable source of final infeasibility evidence and is not used by
this workspace.

The 83 GiB free-space limit may be more restrictive than CPU or RAM once proof
logging begins. The pilot must measure trace growth before committing to a
large run.

## Feedback requested

Please decide whether the next phase may use the three external capabilities
listed above and whether published graph catalogues may be supplied or
downloaded with recorded provenance and hashes. Without them, useful
theoretical and heuristic work can continue, but a credible exhaustive
order-43 proof attempt cannot.
