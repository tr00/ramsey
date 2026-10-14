# Pairwise comparison of degree-18 deductions

Date: 2026-10-14. Coordinator: Codex. Base revision:
`81c768a683d3c3b3df70d4d3b7d03a67d505447b`.

The user requested a broad repository comparison focused on claims that
could refine one another in d18, and authorized parallel agents. Three agents
compared actual small columns, frontier defects, and pivot/excess cuts;
the coordinator independently audited their proofs and developed a safe-edge
augmentation bridge reviewed by a distinct agent. Shared-worktree ownership
was recorded in WORK.md; another concurrent task's work was preserved.

## Main consequence

The x136/r3 child is excluded by an independently reviewed local deduction.
Small-column counting gives H<=1. Column overlap and row degrees make every
double-membership vertex universal inside its containing size-four columns;
these vertices form a clique O of size at most three. The four-transversal
theorem gives an independent four-set avoiding O. It meets all three columns
at distinct vertices, so its internal degree sum is at least 9+9+9+6=33,
contradicting the anchor upper bound 32. The live equality-frontier cases are
now r=0,1,2, using the prior r4 exclusion and r<=4 coverage.

Proof: [small-column Claims 01--03](../n43/d18/x136/pairwise_small_refinements.md).
The [independent review](../n43/d18/review_pairwise-small_2026-10-14_coordinator.md)
retains the exact author revision and external census premises. No isolated
transversal theorem of five or full surviving-family classification is used.

## Other accepted refinements

- r2 at x136: s4 forces disjoint size-four columns. At s5, their overlap
  has size at most two and lies in the unique size-seven column with degree
  eleven. At s7, overlap has size at most one and requires at least two
  incident columns larger than six; a single size-nine column forces
  disjointness. Claims 04--05 and their exact reviews remain propagation only.
- Actual size-four column members satisfy 9-q<=d_A<=11 by a direct
  deletion proof. Double/triple column membership costs at least
  1+epsilon_a / 3+epsilon_a actual incident columns of size at least seven.
  Four-clique exact triple-signature classes have size at most two;
  for r4 this sharpens the mask defect to 2n0+n1<=4-E_Q.
- At q1, every safe internal augmentation contains all degree-eight vertices
  in actual size-four columns. A 50-edge core requires every safe edge to
  meet its column T. Saturated neighborhoods remain explicitly covered;
  the augmented internal graph is not asserted to extend the full interface.
- A weighted nonedge identity inside the higher-degree graph strengthens J.
  Cut capacities force 26 dense degree-18 roots at exact h3/W18 and h5/W30,
  with neighborhood edges at least 84 and 83, respectively. Each family
  contains an adjacent pair. Cut surplus at h2/W8, h4/W20, h6/W32 forces
  at least 1,2,3 exact q0 roots at x144,150,156; each has a pointed adjacent
  degree-18 neighbor with overlap at most 9,10,10. The companion root need
  not be q0.
- Choosing a maximum-edge degree-18 neighborhood gives x caps
  144,145,146,147,149,150 at W0,2,4,6,8,10, at that same selected root.
  Dense-pair and low-overlap conclusions are kept separate.

The [comparison map](../n43/d18/pairwise_refinements.md) links every statement,
scope and exact review. The r4/x137 argument and general size-four degree
lemma overlap the concurrent above-frontier task; they are retained as
independent cross-checks. The user explicitly identified that overlap.
The other task's proofs, indexing, reports and later layout migration were
not replaced or claimed as new work in this comparison.

## Review provenance and integration

| Proof | Exact author-revision SHA-256 accepted |
| --- | --- |
| Small-column Claims 01--04 | `499322f3acfc97a796b7cb4906875cdbbcfb5ec5d7b21669ec62935c1b9a1f73` |
| Appended small-column Claim 05 | `bbf3ebf695e1db8c3bb375922678f965a912ec0345f1589f54331992dc65cd3d` |
| Frontier Claims 01--04 | `7090379f5864737ee3eb7021907adddb10e9011924ad53e4c403ca2d2d94c3cc` |
| Pivot/excess Claims 01--04 | `612722691dca4fb0eb0cf85330a133e8cba2270bb5743cf3f083f62d8ce82bda` |
| Coordinator's q1 augmentation claim | `095c4ed0c1d8a6abcc50705a133ae03008b5e10993709c97ee8f66a2b6f2dacb` |

Proof-bearing text was reviewed before metadata/navigation integration.
The reviews identify distinct author/reviewer agents. Later accepted-state
metadata, review links, and comparison tables change file hashes without
silently replacing the reviewed proofs. Any mathematical proof change needs
renewed review. The notes retain original dependency hashes where applicable.

The coordinator updated results.md, the d18 and x136 navigation, the r2/r3
READMEs, reduction index sections 8.7--8.9 and 8.14, and the theory map only
after independent review. Existing proof/history files were preserved.
No staging, commit, graph search, package installation, download, solver,
proof checker, or theorem prover was used. Exact arithmetic rechecked the
bounded pivot tables; git diff --check and local link checks covered these
documentation changes. Those checks are not nonexistence evidence.

The user subsequently requested a commit. The pairwise notes, exact reviews,
x136 navigation and only this task's additions to the shared indexes were
selected for that commit. The concurrent above-frontier proofs and layout
changes were left outside it. This records the later integration separately
from the mathematical work and its original no-commit handoff.

## Limits and continuation

Accepted local reasoning remains conditional on the recorded published
census and smaller Ramsey premises; these were not independently reconstructed.
No novelty review or formal certificate was produced. The full x136 frontier,
general d18 branch, and order-43 decision remain open. There is no new global
bound on h or W and no improvement to 43<=R(5,5)<=46.

The next distinct pairings are actual larger-column support at r2/s7,
the r0/r1 size-five overlap system against its eight-vertex nonedge cells,
and q1 augmentation constrained by actual column cores. Counts alone have
not excluded these configurations, and this is no evidence of realizability.
