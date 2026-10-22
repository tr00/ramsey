# K4-saturation raises the degree-18 neighborhood floor to58

Date: 2026-10-22. Author: Main, working alone. The user clarified that edge-maximal means K4-saturated, superseding the earlier interpretation as maximum neighborhood density over the degree18 class.

Three claims in [the proof note](../n43/d18/saturated_neighborhood_density_floor.md) establish e(A)>=58 for every18-vertex K4-saturated K4/I5-free graph. This covers the requested actual degree18 neighborhood whenever it is saturated. The proof uses saturation witnesses, their three-vertex independent capacity, an isolated-incidence count, and a degree-surplus cut. The only numerical census dependency is the recorded minimum26 edges for R(4,4,12). It does not use the root-maximization results, the x136 closure, or any ambient column assumption.

Replay author checks:

    python3 research/reports/2026-10-22-saturated-d18-floor/check.py

The [driver](2026-10-22-saturated-d18-floor/check.py) and [output](2026-10-22-saturated-d18-floor/checks.json) retain the exact finite validation. Checks covered2898 triangle-free labelled six-vertex graphs with four or five edges, their signatures' isolated-incidence bounds, and nine surplus-budget cells, including independent integer-composition verification of the convex square maximum. All passed. These are author checks, not independent acceptance or an ambient exhaustion certificate.

During the preceding interpretation, the published arXiv:2409.15709v2 PDF was inspected and scipy was installed in a temporary virtual environment outside the checkout for a degree-class scalar LP experiment. Those weak scalar relaxations were feasible even at the50-edge threshold and establish no graph realizability or lower-bound obstruction. Neither the LP, scipy, nor any newly read table values are dependencies of the58-edge proof. No SAT solver, catalogue, canonicalizer, theorem prover, engine change, Lean change, staging or commit was used for the saturation proof. The earlier singleton files are retained with their distinct root-maximization hypotheses.

The58-edge endpoint remains open. Independent review should focus on the edge capacity three (the pivot extends the independent common H-neighbor set), and on counting isolated incidences separately from signatures witnessing edges. No sharpness or order43 exclusion is claimed. Existing accepted statuses and shared indexes are unchanged. The former maximal-pivot-floor WORK row is released after this handoff under the user's corrected saturation hypothesis.
