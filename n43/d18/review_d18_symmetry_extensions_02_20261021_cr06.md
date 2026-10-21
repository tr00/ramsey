# Independent review of the frontier-band duplicate kernel

Claim: [claim-d18-symmetry-extensions-02](symmetry_extensions.md#claim-d18-symmetry-extensions-02).

Author: Codex, task symmetry-extensions-20261015. Reviewer: independent
subagent `/root/claim_review_06`, token cr06, 2026-10-21; not the author.

Reviewed revision: working-tree bytes at HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`. Exact SHA-256 versions:

| File | SHA-256 |
| --- | --- |
| `n43/d18/symmetry_extensions.md` | `1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497` |
| `n43/d18/symmetry_reduction.md` | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| `docs/general_theorems/symmetry_quotients.md` | `fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f` |
| `n43/d18/frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `n43/d18/x136/small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |

Dependencies reviewed: symmetry-reduction Claims 01 and 03; general quotient
Claims 01 and 02, including their direct proofs; small-column count bounds
and the frontier four-transversal/size-four budget. General quotient claims
are ready in their own source; this review checks their applicability and
reasoning for this claim, without changing their separate review metadata.

Decisive independent checks:

- In the retained band, `k=2q+E<=5` gives `q<=2`. The five small-column
  bounds give `H<=k+4<=9`. A signature of size at least ten occurring three
  times would contribute at least twelve to H. For sizes four through nine,
  identical signatures force adjacency by the nonedge union bound; they
  contain an A edge (size four uses `3-q>=1`, larger sizes use no I5).
  Three occurrences would extend that edge to K5. Thus every multiplicity
  is at most two, with no assumption that A excludes I4.
- Each repeated class contributes exactly one independent permutation
  factor S2. Disjoint classes commute and use two of the 24 occurrences,
  so `K_M=(C2)^p`, `p<=12`. This is a group of relabelings of the entire
  completion vector, and does not require duplicate vertices to be twins.
- Under any product of swaps, a B-edge coordinate reads a bit depending
  on at most the two endpoint-pair variables. An internal duplicate-pair
  coordinate is constant whether its bit is zero or one. For any desired
  bit, excluding each wrong assignment gives clauses of length at most
  two, including the empty clause for an impossible constant value.
- Starting from all orientations, testing whether the next bit can be
  zero while retaining the chosen prefix uses one 2-CNF question. Failure
  forces one while preserving feasibility. Induction gives the exact
  lexicographic minimum across all `2^p` orientations, in at most
  `24*23/2=276` questions. This also covers `p=0`; no edge or adjacency
  restriction is needed. The implication-graph criterion in the dependency
  correctly handles unit and empty clauses and reconstructs a satisfying
  orientation when feasible.
- Ranking occurrences supplies a lift `ell(g)(C,j)=(gC,j)` for every
  multiset-stabilizing row automorphism. Every residual permutation
  factors as `k ell(g)`; taking the least kernel image for each lift and
  then the least of those images is therefore the exact Gamma_M minimum.
  This requires all H_M images, and supplies no cost bound for that stage.

Outcome: **accepted**, on the explicitly retained frontier, census,
four-transversal and small-column premises. No mathematical correction
is required for this claim.

Limits: external census inputs (the degree/edge bounds and published
14- and 15-vertex (4,4)-free minimum-edge values) and standard Ramsey
numbers were treated as the repository's retained premises, not independently
reverified from literature or catalogues. This is mathematical review of
the full-vector algorithm, with no implemented minimizer, solver run,
certificate, performance measurement, novelty check or order-43 closure.
Permitted search use remains exact kernel symmetry after implementation
and its required validation; arbitrary partial-vector pruning is not proved
by this claim.
