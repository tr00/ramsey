# Theory-only SOS progress on actual cross-column triples

Date: 2026-10-15. Author: Codex column-SOS agent.
Base HEAD: `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.

Deliverable: [the proof note](../n43/d18/sos_column_compatibility.md)
contains four ready, independently unreviewed local deductions. No solver,
enumeration, download, installation, shared-index editing, staging, or commit.

The main deduction combines exact weighted Goodman counting with actual
column-triple witnesses. A common A edge forbids a B triangle; an independent
A pair outside the triple's union forbids a B independent triple. Witnesses
may vary between triples, so the method does not require one common mixed
cell. A rational diagonal PSD identity bounds the total weight of triples
whose monochromatic possibility remains open; applicable degree intervals
make the bound stronger. Six specified columns with at most one open triple
are excluded by the elementary lower bound of two monochromatic triples.

Across the whole degree-18 branch, if c_y is the size of a column and
tau_y=max(0,6-c_y,c_y-13), then at least
440+sum_y tau_y*(tau_y+1)/2 triples must remain open. At the equality
frontier the reviewed r0 profile gives at least 440+s>=448 open triples.
This is a new documented necessary predicate, with no claim that every
frontier family violates it. A second SOS bound uses b=e(B) and gives
ceil(437+(b-138)^2/12). Both hold across varying x.

The forced degree-eight I4 anchor at x136 also gives opposite double-signature
multiplicities a,b,c with a+b+c=6. Its basic centered incidence Gram has
eigenvalues 0,8a,8b,8c, so PSD adds no further restriction at that level.
This limitation is recorded to keep future work focused on overlaps and
B adjacency rather than a first-moment SDP which simply repeats nonnegativity.

Self-audit rederived the weighted identity by two counts, checked uniform
small orders and complete/empty graph identities algebraically, retained
integer/parity corrections, and checked column-size endpoints and Gram
eigenvalues. Claims remain ready for independent review; no theory-map or
branch-status promotion was made. Suggested integration use after acceptance:
propagate exact triple-coverage/degree-moment predicates and opposite pair
balance, retaining every actual witness and full case coverage.

Input SHA-256 values:

| Input | SHA-256 |
| --- | --- |
| weighted_averaging.md | `e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07` |
| anchored_cell_averaging.md | `719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3` |
| overlapping_cells.md | `7538fb1429225c180e6aa7febc39d75f14ff7bf8a79019c0ef4a01d108aafb92` |
| x136/five_column_compatibility.md | `2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e` |
| docs/workflow.md | `51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2` |
| docs/mathematical_baseline.md | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |

The source hashes include current integration banners; historical author-stage
labels in accepted dependency notes were interpreted through those banners.
