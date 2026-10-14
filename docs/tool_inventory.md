# Local Tool and Resource Inventory

Observed on 2026-10-13. This is a setup snapshot, not a capacity guarantee.

## Host

```text
CPU threads:       16
RAM:               62 GiB total, about 48 GiB available at inspection
/scratch free:     83 GiB
Open-file limit:   5120
OS:                Ubuntu 24.04 family, Linux 6.8 x86_64
```

The available scratch space is too small to retain uncontrolled collections of
large CNFs and proof traces. Artifact-size estimates and retention rules are
required before serious runs.

## Present on PATH

```text
Python 3.12.3
g++ 13.3.0
cmake 3.28.3
git
```

No executable was found on `PATH` for:

```text
kissat cadical minisat glucose cryptominisat
z3 cvc5 yices boolector
clasp clingo
scip highs glpsol cbc gurobi_cl
nauty geng dreadnaut sage
lean lake coqc isabelle
```

This list is an inventory, not permission to install any item.

## Existing Python environments

The system Python has no relevant third-party package detected. Environments
belonging to the separate `/scratch/vitis_flexml` workspace contain:

- `.venv`: NumPy, NetworkX, and SymPy.
- `.tox/test`: NumPy, SciPy, NetworkX, Python-MIP, and SymPy.

The Ramsey baseline intentionally does not depend on these environments.
Python-MIP may be useful for exploratory linear or integer models, but its
results do not supply the portable UNSAT proof certificates desired for a final
nonexistence claim. Reusing another project's environment also harms isolation,
so it should be an explicit post-review decision.

## Capabilities needed for the solve phase

1. A high-performance SAT solver supporting deterministic operation,
   assumptions or incremental solving, and DRAT or FRAT proof logging.
2. A converter/checker path to a strongly checkable format, preferably LRAT.
3. For catalogue-based decomposition, mature canonical labeling and
   automorphism support such as nauty/Traces.
4. Optionally, a theorem prover for an end-to-end formal statement after the
   computational architecture is stable.

The first three capabilities are not currently available on `PATH`. No solver,
prover, package, binary, source archive, or graph catalogue was downloaded or
installed during setup.
