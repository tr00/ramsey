# Maximum-density singleton corridor

Main worked alone on 2026-10-22. Proof home: [maximal singleton corridor](../n43/d18/maximal_singleton_corridor.md). Three claims are ready for independent review, with no executable pruning or accepted index changes.

A singleton column at a maximum-density degree-18 root confines its neighborhood edge count to 73..76. It forces two rigid 17-vertex cores, exact common-neighbor attachment budgets, and at the 73-edge endpoint a zero-excess common neighbor complete to a six-vertex cell of excess at least18. The existing accepted column competition theorem also excludes all two-columns in the presence of a singleton. The 73 lower endpoint already follows from the existing overlap-one pair bound; the additional contribution is the coupled corridor and endpoint structure, not a new unconditional density floor.

Author checks enumerated all scalar attachment tuples r,s in0..8, epsilon in0..6, h in0..6 with s<=r and r+s+h=16+epsilon: all50 feasible tuples satisfy the corridor, and r=5 forces (epsilon,s,h)=(0,5,6). A separate exhaustive check of all32768 labelled six-vertex graphs found2812 K4/I3-free graphs, minimum6 edges, and exactly10 labelled minimum shapes, all two disjoint triangles. Output: [check record](2026-10-22-maximal-singleton-check.json). This small-cell enumeration supports the elementary Mantel proof; it is not an order43 search or exclusion certificate.

All sources retain their existing review status. No subagents, solver, downloads, engine changes, Lean changes, staging or commits. The general connected maximal-root branch and every stated corridor case remain open. Existing active WORK ownership rows were preserved; the new proof and report use independent paths.
