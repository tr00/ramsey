# R(5,5) before GTA VI

How many vertices force a graph to contain either five mutually adjacent
vertices or five mutually nonadjacent vertices? The smallest such number is
R(5,5), and its exact value is still unknown. The established bounds are

```text
43 <= R(5,5) <= 46.
```

This repository collects mathematical work towards deciding the 43-vertex
case. A graph on 43 vertices avoiding both patterns would raise the lower
bound. A proof that no such graph exists would establish R(5,5) = 43, using
the known 42-vertex construction.

The problem remains open here. The aim is to find structural restrictions
that make a future exhaustive proof feasible, while keeping every deduction
clear enough to inspect and challenge.

## State of the Art

| R(s,t) | 1   | 2   | 3   | 4   | 5     |
| ------ | --- | --- | --- | --- | ----- |
| 1      | 1   | 1   | 1   | 1   | 1     |
| 2      |     | 2   | 3   | 4   | 5     |
| 3      |     |     | 6   | 9   | 14    |
| 4      |     |     |     | 18  | 25    |
| 5      |     |     |     |     | 43–46 |

Edge bounds for graphs in R(s,t,n):

| R(s,t,n) | min e(s,t,n) | max E(s,t,n) | Source |
| -------- | ------------ | ------------ | ------ |
| (4,5,14) | 22           | 60           | [1]    |
| (4,5,17) | 41           | 79           | [1]    |
| (4,5,18) | 50           | 85           | [1]    |
| (4,5,24) | 116          | 132          | [1]    |
| (4,4,11) | 19           | 36           | [2]    |
| (4,4,12) | 26           | 40           | [2]    |
| (4,4,13) | 33           | 45           | [2]    |
| (4,4,14) | 41           | 50           | [2]    |
| (4,4,15) | 50           | 55           | [2]    |
| (4,4,16) | 60           | 60           | [2]    |
| (4,4,17) | 68           | 68           | [2]    |
| (5,4,14) | 31           | 69           | [1]    |
| (5,4,17) | 57           | 95           | [1]    |
| (5,4,18) | 68           | 103          | [1]    |
| (5,4,24) | 144          | 160          | [1]    |
| (5,5,42) |              |              |        |
| (5,5,43) |              |              |        |

Blank entries record no extremum here and do not assert nonexistence.

## The approach

Start with a vertex and split the rest of a candidate graph into its neighbors
and nonneighbors. Each side inherits a smaller Ramsey constraint. The neighbors
cannot contain a clique of size four, and the nonneighbors cannot contain an
independent set of size four. Both sides must still avoid the forbidden
patterns of the full graph.

The difficult part is fitting these pieces together. For each nonneighbor,
record which vertices on the neighbor side it touches. These sets are called
cross columns in the notes. A column may satisfy all local conditions on its
own and still be incompatible with the other columns. Studying their overlaps,
shared adjacency patterns, and edge counts gives restrictions that an isolated
neighborhood analysis can miss.

Much of the current work follows a vertex of degree 18. Its two sides have
18 and 24 vertices. The lowest possible cross-edge count under the recorded
bounds is 136, where equality forces extra structure. The notes rule out
several configurations at this boundary and develop restrictions beyond it.
Other threads study overlapping vertex neighborhoods, symmetry reductions,
and the case with minimum degree 20 after choosing between a graph and its
complement.

```text
43 vertices
├── degree-18 pivot
│   ├── G[A] is a single connected component
│   ├── G[A] splits into K1 + R(4, 4, 17)
│   ├── G[A] splits into K2 + R(4, 4, 16)
│   └── G[A] splits into K3 + R(4, 4, 15)
└── degree-20 pivot
```

The mathematical work aims to reduce the cases that a later certified search must cover.

## Engine frontend

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
`third-party/roundingsat/build/roundingsat`. If that binary is absent, build it
locally without the optional SoPlex download:

```sh
cmake -S third-party/roundingsat -B third-party/roundingsat/build -DCMAKE_BUILD_TYPE=Release -Dsoplex=OFF
cmake --build third-party/roundingsat/build -j
```

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

Generate-only mode writes OPB without launching RoundingSat. Arguments after `--` pass literally to
RoundingSat, followed by the absolute OPB path. The frontend becomes the solver
process, preserving its exit status and signal behavior. Frontend errors return
2; execution failures return 126/127. A short generation summary goes to stderr;
stdout belongs to RoundingSat. There is no JSON metadata or automatic hashing;
record hashes externally when collecting experiment evidence.

`src/main.cpp` parses arguments, `src/engine.cpp` loads and validates the graph,
writes the output atomically, and launches RoundingSat. `src/instance.hpp` exposes
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
edges. The bounds [50..85 for a and 136..279 for x](n43/reductions.md#8-degree-18-branch)
are d18 reductions, not a restriction to an equality-frontier subcase. The x upper
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

## Where to read

| Location                                        | What you will find                                                      |
| ----------------------------------------------- | ----------------------------------------------------------------------- |
| [results.md](results.md)                        | Current progress and links to recent deductions                         |
| [n43/](n43/README.md)                           | The 43-vertex case, organized by mathematical assumptions               |
| [n43/d18/](n43/d18/README.md)                   | Degree-18 neighborhoods, cross-column compatibility, and frontier cases |
| [n43/min-degree20/](n43/min-degree20/README.md) | The complementary line of work on normalized minimum degree 20          |
| [docs/](docs/)                                  | Background, shared theorems, and evidence standards                     |
| [reports/](reports/)                            | Dated accounts of the research and its unresolved questions             |
| [src/](src/) and [tests/](tests/)               | C++ fixed-B OPB frontend and semantic regression tests                  |
| [scripts/](scripts/)                            | Independent Python graph checker and reference CNF utilities            |

For background and references, start with the
[mathematical baseline](docs/mathematical_baseline.md). For a concrete example
of the approach, read the
[degree-18 equality frontier](n43/d18/x136/README.md), where compatibility of
actual columns rules out every column of size four. That case as a whole
remains open.

## Contributing

Contributions can be a new argument, a sharper bound, a counterexample to a
proposed lemma, or a careful review of an existing proof. Particularly useful
questions concern compatibility between multiple columns, constraints from
overlapping neighborhoods, and symmetry reductions that preserve all cases.

Each proof note records its assumptions and review status. When extending an
argument, make clear which cases it covers and which remain open. A failed
search does not establish nonexistence. A construction needs exhaustive
verification of every five-vertex subset, and an exclusion needs complete case
coverage with independently checkable evidence. The
[workflow](docs/workflow.md) and
[reproducibility notes](docs/reproducibility.md) explain how to record this work.

## References

[1] V. Angeltveit and B. D. McKay, _R(5,5) ≤ 46_, Journal of Graph Theory
112 (2026) 198–208, <https://doi.org/10.1002/jgt.70029>; open version
<https://arxiv.org/abs/2409.15709>.

[2] B. D. McKay and S. P. Radziszowski, _A New Upper Bound for the Ramsey
Number R(5,5)_, Australasian Journal of Combinatorics 5 (1992) 13–20,
<https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>.

## License

This project is available under the [MIT License](LICENSE).
