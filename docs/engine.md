# Fixed-B SAT/PB engine

The C++20 frontend reads one actual K5/I4-free B24 graph (not its catalogue
complement), generates the exact degree-18 extension core, and launches the
local RoundingSat executable. It does not run a catalogue-wide search.

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j
./build/ramsey data/r45_24/b24.g6 --index 1 -o /tmp/b1.opb -- --time-limit=60
```

Requires POSIX, CMake 3.20+, a C++20 compiler, and configured local nauty
headers under `third-party/nauty/build/`. CMake reuses the local nauty library,
or compiles its existing sources when the library is absent; it never downloads
or configures dependencies. The solver is fixed to
`third-party/roundingsat/build/roundingsat`. The local Release solver includes
SoPlex 7.1.6, statically linked for LP reasoning. Rebuild the configured solver
separately from the engine:

```sh
cmake --build third-party/roundingsat/build --parallel 4
```

Dependency setup is explicit and separate from the root engine build. The exact
SoPlex download, archive hash, bounded build/install commands, and RoundingSat
`-Dsoplex=ON` configuration are retained in
[`research/reports/2026-10-19-soplex-build.json`](../research/reports/2026-10-19-soplex-build.json).
That setup preserves vendored sources and avoids the upstream unbounded nested
build. No SoPlex shared-library path is required. Pass `-- --lp=0` to disable
LP reasoning for an individual run.

Gimsatul is an additional, standalone CNF solver pinned by the
`third-party/gimsatul` submodule. It does not replace RoundingSat in the frontend.
Initialize it explicitly, then build a disposable source copy so configuration
and compilation do not modify the third-party checkout:

```sh
git submodule update --init third-party/gimsatul
mkdir -p scratch/order16
cp -a third-party/gimsatul scratch/order16/gimsatul-build
cd scratch/order16/gimsatul-build
./configure
make -j32
./gimsatul --version
```

Use a fresh destination for the copy. Run `gimsatul --threads=32 --time=600
input.cnf` for a bounded solver-only experiment. A second positional filename
enables DRAT proof output and requires an agreed storage limit first. Neither
the solver status nor an externally checked DRAT proof is a kernel-checked
Lean theorem. Record the submodule revision and executable hash with retained
experimental results. Root CMake never builds or configures Gimsatul.

The frontend options include `-o/--output`, `-i/--index`, `-g/--generate-only`, and
`-h/--help`, parsed with the system `getopt_long`. Degree and edge bounds default to the
order-43 d18 case:

| Option | Default | Scope |
| --- | --- | --- |
| `--global-degree-min N\|none` | 18 | Every vertex of G, including the pivot |
| `--global-degree-max N\|none` | 24 | Every vertex of G, including the pivot |
| `--neighborhood-degree-min N\|none` | 0 | Every vertex of the induced graph G[A] |
| `--neighborhood-degree-max N\|none` | 13 | Every vertex of the induced graph G[A] |
| `--internal-edges-min N\|none` | 50 | a = e(G[A]) |
| `--internal-edges-max N\|none` | 85 | a = e(G[A]) |
| `--cross-edges-min N\|none` | 136 | x = e(A,B) |
| `--cross-edges-max N\|none` | 279 | x = e(A,B) |
| `--neighborhood-excess-min N\|none` | none | Minimum E_A = sum over u in A of (d_G(u)-18) |
| `--neighborhood-excess-max N\|none` | none | Maximum E_A |
| `--zero-neighborhood-excess` | off | Force global degree 18 at every vertex in A |

Use `none` to disable an individual endpoint. Bounds must be nonnegative integers
with minimum at most maximum. Stronger user-specified bounds restrict the search
and need their own mathematical justification. Bounds incompatible with fixed
graph data produce an infeasible model, not silently relaxed restrictions.
The reviewed mathematical corridor is now `137 <= x <= 279`; the engine's
default lower bound remains 136. Pass `--cross-edges-min 137` to use the
reviewed full-frontier exclusion.
To generate only the original Ramsey core:

```sh
./build/ramsey data/r45_24/b24.g6 -g -o /tmp/core.opb \
  --global-degree-min none --global-degree-max none \
  --neighborhood-degree-min none --neighborhood-degree-max none \
  --internal-edges-min none --internal-edges-max none \
  --cross-edges-min none --cross-edges-max none
```

The excess component encodes the signed linear sum
`E_A = 2e(A) + e(A,B) - 306`. It counts each internal A edge twice and
includes the 18 fixed pivot edges through the constant term. Bounds are optional
and independent of the degree and edge endpoints. They concern A-excess, not
total graph excess or degrees inside G[A]. With the default global degree floor,
`--neighborhood-excess-min 0 --neighborhood-excess-max 0` forces every A vertex
to have global degree 18. If that floor is disabled, positive and negative
excesses can cancel in this aggregate equation.

The separate zero-excess component instead enforces each A vertex's global
degree as 18, even when global degree endpoints are disabled:

```sh
./build/ramsey data/r45_24/b24.g6 -g -o /tmp/w0.opb --zero-neighborhood-excess
```

Neither component imposes connectedness of G[A], restricts q to 1, or fixes B
degrees to 18. An UNSAT result for this larger zero-excess family also covers
the connected child, but a SAT witness still needs connectivity checked.

Generate-only mode writes OPB without launching RoundingSat. Arguments after
`--` pass literally to RoundingSat, followed by the absolute OPB path. The engine
supervises a child solver, streams its stdout unchanged, and inherits stderr.
It forwards SIGINT, SIGTERM, SIGHUP, and SIGPIPE to the child and waits for it.
Solver stdout is parsed for a consistent terminal status because raw RoundingSat
exit 0 can mean SAT, UNSAT, or timeout.

| Engine exit | Meaning |
| --- | --- |
| 0 | Generate-only completed, or help displayed |
| 10 | SATISFIABLE |
| 20 | UNSATISFIABLE |
| 4 | TIMELIMIT, regardless of whether the solver returned 0 or 4 |
| 5 | UNKNOWN |
| 1 | Solver failure, missing/unsupported terminal status, or conflicting statuses |
| 2 | Frontend input or system error |
| 3 | Solver-reported memory exhaustion |
| 126 / 127 | Solver execution failure / executable not found |
| 128 + signal | Engine interrupted, or solver terminated by a signal |

SAT and UNSAT are nonzero exits. Shell scripts must inspect these codes rather
than treating shell success as a solver decision. A terminal decision is not
accepted after an unrelated nonzero solver exit. A short generation summary and
protocol errors go to stderr. There is no JSON metadata or automatic hashing.
Record hashes externally when collecting experiment evidence.

`src/main.cpp` parses arguments, `src/engine.cpp` loads and validates the graph,
writes the output atomically, and launches RoundingSat through the streaming
supervisor in `src/solver.{hpp,cpp}`. `src/instance.hpp` exposes
the solver-independent `InstanceBuilder`; `src/core.cpp` adds the eight Ramsey
constraint families. `src/constraints/degrees.hpp` exposes `DegreeOptions` and
`add_degree_constraints(instance, options)`, implemented in the sibling `.cpp`.
`src/constraints/edges.hpp` similarly exposes `EdgeOptions` and
`add_edge_constraints(instance, options)`. Both share `CardinalityBounds` and the
interval encoder in `src/bounds.{hpp,cpp}`. `src/constraints/excess.hpp` exposes
`add_excess_constraints(instance, bounds)` for the weighted A-excess sum.
`src/constraints/zero_excess.hpp` exposes `add_zero_excess_constraints(instance)`
for the per-vertex degree equations. The builder API is unchanged.
`src/opb.cpp` only serializes the completed model, using bounded output buffering
and precomputed variable tokens.

Constraint components are ordinary functions taking `InstanceBuilder &`. They
can query `a_vertices()` and `b_graph()`, look up `a_edge(i, j)` or
`cross_edge(i, y)`, allocate binary auxiliary variables with `add_variable()`,
and append weighted inequalities with `add_ge({{coefficient, variable}, ...}, rhs)`.
Indices are zero-based; A edges accept either orientation. For example, this
component introduces a binary marker equal to an existing A edge, without
restricting the graph:

```cpp
void add_edge_marker(ramsey::InstanceBuilder &instance)
{
    const int edge = instance.a_edge(0, 1);
    const int marker = instance.add_variable();
    instance.add_ge({{1, marker}, {-1, edge}}, 0);
    instance.add_ge({{1, edge}, {-1, marker}}, 0);
}
```

The assembly flow in `src/engine.cpp` is: construct the builder, call
`add_core_constraints(instance)`, `add_degree_constraints(instance, options.degrees)`,
`add_edge_constraints(instance, options.edges)`,
`add_excess_constraints(instance, options.excess)`, optionally
`add_zero_excess_constraints(instance)`, then `write_opb(output, instance, record)`.
Components need not predict counts or
format solver input. Terms are copied into contiguous model storage; variables
can be added between components without changing existing IDs. The writer
derives final counts automatically. Unlike the former streaming encoder, the
builder retains all numeric rows in memory (about 65 MiB measured peak process
RSS for catalogue entry 1). The default degree component adds 102 inequalities
and no variables. It omits tautologies, including the internal lower bound 0.
Global A degrees include the pivot edge, and global B degrees include the fixed
B edges. Neighborhood bounds concern only G[A], not all vertex neighborhoods.
The default edge component adds 4 inequalities and no variables, bounding each
internal A edge once and each A-to-B edge once. It excludes pivot and fixed B
edges. The bounds [50..85 for a and the current x corridor](../research/n43/reductions.md#8-degree-18-branch)
apply to d18 generally. The x upper
bound retains the recorded B edge-minimum and global degree-cap premises.

Graph indices are one-based; graph6 headers, blank lines, and CRLF are supported.
Nauty decodes graph6 without relabeling. B is validated as K5/I4-free before
generation. The OPB is published atomically; invalid input leaves an existing
destination unchanged, and input/output aliases are rejected. Variable numbering
and core constraint order match the former `scripts/fixed_b_mip.py`: 153 A edges and
432 cross edges. Degree inequalities follow the unchanged core, in neighborhood-A,
global-A, global-B order, with lower bounds before upper bounds for each vertex.
Edge inequalities follow the degree component, internal before cross and lower
before upper. The 2 default components together add 106 rows and no variables.
Both new excess components are disabled by default, preserving existing output
byte for byte. Aggregate bounds follow the edge component, lower before upper.
Zero-excess equations follow those bounds, in A vertex order and lower before
upper. The aggregate component adds at most 2 rows, and zero-excess mode adds
36 rows for the 18 A vertices. Neither allocates variables.
There is no objective or symmetry restriction.
Proof checking, artifact compression, symmetry reduction, and batch iteration
are not implemented. A solver response alone is not a certified Ramsey result.

`ctest --test-dir build --output-on-failure` runs exhaustive small rooted-graph
encoding checks. The independent Python checker and reference CNF generator
remain at `scripts/ramsey.py`; run their tests with
`python3 -m unittest discover -s tests -v`.
