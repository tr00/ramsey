# Independent review of the low-degree panel decomposition

Date: 2026-10-21. Reviewer: subagent `cr17` (independent of author Main).
Claim: [claim-a69-low-degree-panel](a69_decomposition.md#claim-a69-low-degree-panel).
Outcome: **accepted**, conditional on the recorded smaller Ramsey numbers and
published core edge intervals. This review applies only to Claim 7.

## Exact revision and dependencies

HEAD when reviewed: `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`.
The exact uncommitted source is identified by SHA-256 below; HEAD alone does
not identify its bytes.

| File | SHA-256 | Material checked |
| --- | --- | --- |
| `a69_decomposition.md` | `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085` | Claim 7; direct forbidden-set reasoning of Claim 6; closed-neighborhood and private-triple reasoning of Claim 5 |
| `neighborhood_connectivity.md` | `b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0` | Disconnected profiles and edge cap, Claims 1–2 |
| `x136/five_column_compatibility.md` | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` | Elementary order-10 core cap, Claim 1 |
| `../../../README.md` | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` | Recorded order-11 through order-16 core edge intervals and Ramsey numbers |
| `../../../docs/mathematical_baseline.md` | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` | Ramsey premises and exact ambient-type conventions |

## Decisive independent checks

The degree sum gives minimum degree at most seven. Degree zero is impossible:
a disconnected pure graph has independence profile `(1,3)`, since the other
partitions of total independence four have order at most sixteen. The clique
component sizes one, two, three yield at most 68, 61, 58 edges respectively.
Thus the recorded connectedness argument applies to the pure graph, without
an ambient extension assumption. Two-connectivity implies minimum degree at
least two. The closed neighborhood of any vertex hits every independent
four-set, so its size bounds the transversal number from above and gives
`s >= tau_4-1`.

Deleting the chosen vertex and its neighbors leaves a K4/I4-free induced
core. Its neighbor panel is triangle-free by K4 avoidance and inherits I5
avoidance. For a panel vertex its core attachment is triangle-free and
I4-free, hence has order at most eight by R(3,4)=9. Splitting the edges
between root, panel, core, and cut gives `69=s+g_S+a_H+e(S,H)`.
Substitution of each recorded core interval gives all seven table rows,
including the singleton panel row where `g_S=0`. Complementing the accepted
elementary cap 31 at order ten gives the sufficient lower bound 45-31=14;
no exact census assertion is required there.

I independently checked Claim 6's mixed forbidden-set conditions as used
here: with one/two/three panel vertices a K4 requires respectively a
triangle/edge/vertex in their common core attachment. With two/three/four
independent panel vertices an I5 requires respectively an independent
triple/pair/vertex in their common unhit core. The panel has no triangle,
so the third K4 test is vacuous. These checks account for every forbidden
set in `A-u`; a forbidden set using `u` would require a triangle in S or
an independent four-set in H, both already excluded. The two displayed
degree inequalities are exactly the degrees of nonroot vertices being at
least s. Consequently the construction is necessary and sufficient,
provided the template includes the stated core/panel types and 69-edge
budget. All choices of a minimum-degree root are covered; no canonical or
disjoint generation claim is inferred.

For transversal number eight, every vertex has degree at least seven and
`138-18*7=12` total excess. At most twelve vertices can have positive
excess, leaving at least six degree-seven roots. Each corresponding closed
neighborhood is an eight-transversal and hence minimum; its complement is
a maximum-order core, since any larger I4-free induced core would give a
transversal of size below eight. Removing any panel vertex from this
minimum transversal leaves an independent four-set meeting it only at that
vertex. Its other three vertices lie in the core and avoid that vertex's
attachment. The ten-vertex core attachment therefore has size at most
seven, a stronger bound than the general eight bound. Finally, summing
degree floors on the seven panel vertices and ten core vertices gives
`e(S,H)+2g_S >= 42` and `2a_H+e(S,H) >= 70`. Using
`e(S,H)=62-g_S-a_H` yields `a_H-g_S <= 20` and
`a_H-g_S >= 8`. These are simultaneous restrictions on the same graph;
the proof does not assume independently selectable overlapping arrangements.

## Findings and limits

No mathematical gap was found in Claim 7. Its generic core need not be a
maximum core; the source explicitly asserts maximal order only in the
transversal-eight specialization. The two-through-seven panel and
10-through-15 core sentence describes the two-connected residual families;
the degree-one case remains explicitly covered in the preceding table.

Permitted mathematical use after coordinator integration: complete structural
branching with all valid labeled choices retained, and propagation of the
stated necessary degree/cut restrictions. This is not a graph census,
ambient extension theorem, or branch closure. External Ramsey and published
census premises were retained, not recertified. I checked the dependency
arguments needed here directly; this does not accept every claim elsewhere
in the source. No solver, prover, canonicalizer, catalogue processing,
nontrivial search, download, or novelty review was performed.
