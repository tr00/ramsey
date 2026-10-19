# Independent reviews of the x137 effective anchor and connectivity claim 03

Date: 2026-10-19 (task `x137-connectivity-review-20261018`, started
2026-10-18). Author of both claim notes: earlier Main sessions. Reviewers:
`AnchorRigor` and `ConnRigor`, independent subagent identities with no author
history. No solver, graph search, catalogue processing, download, install,
Lean or engine change was used; all arithmetic checks were throwaway scripts.

## Reviewed claims and outcomes

1. `n43/d18/x137/effective_anchor.md` at reviewed revision
   `c33b0d6630873d1f1b9f8e03a7f52166b47b4348a1ce225dd15078c357d49daf`
   (the revision recorded in the author's task row):
   `#claim-x137-low-score`, `#claim-x137-exact-anchor`,
   `#claim-x137-no-four-transversal` — all three
   **accepted**. Review:
   [n43/d18/x137/review_effective_anchor_20261018_anchor_rigor.md](../n43/d18/x137/review_effective_anchor_20261018_anchor_rigor.md).
   Both scalar tables, both unique Turan equality cases, the `K_{3,3,3}`
   neighborhood-type argument, the ten-vertex cap (both `f` slots, the Goodman
   mixed-triple identity, the `g(d)+6d<=74` sweep), and the dependency
   quantifiers (abstract-transversal degree floor at `q=0`, four-transversal
   bound via `F=complement A` with `e(F)=68<=70`, anchor bound for every
   independent four-set) were re-derived and script-checked. The order-10
   core cap was re-derived inside the review, so acceptance does not rest on
   the still-unreviewed `#claim-five-columns-core-caps`.

2. `n43/d18/neighborhood_connectivity.md#claim-connectivity-03` at reviewed
   revision `125007bb8e179ff0fa741eeb926dc1a8cfad4c5d72a07eddfcc3cd919204df77`
   — initially **changes-requested**: parts (a)-(d) all independently
   re-derived and mathematically correct; four documentation defects found
   (F1 missing `claim-connectivity-02` dependency for `a<=68`, F2 part (a)
   not naming the recorded cap `d_A<=13` it discharges, F3 unpinned column
   premise, F4 undefined `epsilon_u`). After the coordinator applied exactly
   those documentation-only fixes, the renewed review at revision
   `f50fd572fb7a3ed9a275b67bc655f9553ca6b9c0248e2b9b4fe575e21067379a`
   returned **accepted** (addendum dated 2026-10-19). Review:
   [n43/d18/review_neighborhood_connectivity_20261018_conn3_rigor.md](../n43/d18/review_neighborhood_connectivity_20261018_conn3_rigor.md).
   Claims 01 and 02 keep their earlier independent acceptance
   (`reports/2026-10-17-d18-connectivity.md`).

## Integration performed

- `n43/d18/x137/effective_anchor.md`: the three claims set to `accepted`
  with the review link; `Search use` set to `propagate` (claims 1 and 2) and
  `terminate x137 children r>=1` (claim 3); header and Consequences updated
  to the recorded status.
- `n43/d18/x137/README.md`: pending-review section replaced by the accepted
  record; live ranges reduced to `r0:s7..10` with `H=s-7`; minimum column
  size for the q0 child set to 5.
- `n43/d18/x137/q0/README.md` and the `n43/d18/README.md` x137 row updated
  to the same status.
- `n43/d18/neighborhood_connectivity.md`: claim 03 metadata and the four
  documentation fixes listed above; proof bodies of all three claims
  unchanged.

## Consequences and limits

- With the accepted anchor, every actual column at x137 has size at least
  five, so all x137 children with `r>=1` are excluded; only `r0:s7..10`
  remains live, in addition to the previously reviewed r4 exclusion. The
  r0 component, x137 as a whole, and order 43 remain open.
- Connectivity claim 03 records no x-exclusion or realizability claim; it
  guards the `geng -C` usage and supplies interface obligations only.
- External premises (published extrema, census intervals, Ramsey values)
  were retained as recorded, not recertified. No novelty or literature
  review was performed. No branch closure is asserted anywhere in this
  task. No staging or commit was made.
