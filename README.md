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
18 and 24 vertices. The original cross-edge floor was 136; the reviewed
[x136](research/n43/d18/x136/README.md) and [x137](research/n43/d18/x137/README.md) exclusions
raise it to 138. Higher cross counts remain open.
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

The C++20 engine extends one actual K5/I4-free B24 graph around a degree-18
pivot and launches local RoundingSat. It supports degree, edge and A-excess
bounds; it does not run a catalogue-wide search or check proof certificates.

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j
./build/ramsey data/r45_24/b24.g6 --index 1 -o /tmp/b1.opb -- --time-limit=60
```

Dependencies must be configured separately. See [engine documentation](docs/engine.md)
for setup, all options, constraint semantics, the builder API and tests.
SAT/UNSAT exit codes are 10/20; timeout is 4. A solver answer becomes a
research result only after the checks in [evidence policy](docs/reproducibility.md).
Exploratory models and traces may be discarded; retain a full evidence package
when a computation closes a named subbranch.

## Where to read

| Location                                        | What you will find                                                      |
| ----------------------------------------------- | ----------------------------------------------------------------------- |
| [results.md](results.md)                        | Current progress and links to recent deductions                         |
| [research/n43/](research/n43/README.md)                           | The 43-vertex case, organized by mathematical assumptions               |
| [research/n43/d18/](research/n43/d18/README.md)                   | Degree-18 neighborhoods, cross-column compatibility, and frontier cases |
| [research/n43/min-degree20/](research/n43/min-degree20/README.md) | The complementary line of work on normalized minimum degree 20          |
| [docs/](docs/)                                  | Workflow and evidence standards; legacy mathematical notes pending migration |
| [research/reports/](research/reports/README.md)                    | Historical reports and validation artifacts; no new session reports    |
| [src/](src/) and [tests/](tests/)               | C++ fixed-B OPB frontend and semantic regression tests                  |
| [scripts/](scripts/)                            | Independent Python graph checker and reference CNF utilities            |

For background and references, start with the
[mathematical baseline](docs/mathematical_baseline.md) and the shared
[definitions and notation](docs/notation.md). For a concrete example
of the approach, read the
[degree-18 equality frontier](research/n43/d18/x136/README.md), whose full-interface proof excludes the entire x=136 branch.
The degree-18 branch and order-43 problem remain open.

## Contributing

Contributions can be a new argument, a sharper bound, a counterexample to a
proposed lemma, or a careful review of an existing proof. Particularly useful
questions concern compatibility between multiple columns, constraints from
overlapping neighborhoods, and symmetry reductions that preserve all cases.

Keep one authoritative file per research topic under `research/`: metadata and
summary at the top, detailed statements, proofs and inline independent review
in the middle, and a changelog at the bottom. Do not create separate research
reports or review files, or duplicate Git history with prose hashes and
timestamps. Existing research documents remain in place pending migration.

When extending an argument, make clear which cases it covers and which remain
open. A failed search does not establish nonexistence. A construction needs
exhaustive verification of every five-vertex subset, and an exclusion needs
complete case coverage with independently checkable evidence. The
[workflow](docs/workflow.md) and
[reproducibility notes](docs/reproducibility.md) define topic structure, review
gates, and retained computational evidence.

## References

[1] V. Angeltveit and B. D. McKay, _R(5,5) ≤ 46_, Journal of Graph Theory
112 (2026) 198–208, <https://doi.org/10.1002/jgt.70029>; open version
<https://arxiv.org/abs/2409.15709>.

[2] B. D. McKay and S. P. Radziszowski, _A New Upper Bound for the Ramsey
Number R(5,5)_, Australasian Journal of Combinatorics 5 (1992) 13–20,
<https://ajc.maths.uq.edu.au/download/5/ocr-ajc-v5-p13.pdf>.

## License

This project is available under the [MIT License](LICENSE).
