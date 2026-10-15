# Independent review of prescribed equal-degree families

Date: 2026-10-15. Reviewer: `augmentation_author`.

Claim(s): [family overlap](family_overlap.md), claims
`claim-family-overlap-01` through `claim-family-overlap-04`.

Author and reviewer: overlap-author and augmentation-author, distinct agents.

Reviewed revision: SHA-256
`ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1`
of the exact uncommitted `docs/general_theorems/family_overlap.md`.

Dependencies reviewed: All internal mathematical arguments were independently
rederived. The numerical corollaries use the classical stated premises
`R(3,3)=6`, `R(3,4)=9`, and `R(3,5)=14`. No census, minimum-degree
premise, or completeness of a graph catalogue is needed. The accepted source
note motivates the abstraction but is not needed as an unproved logical step.
No external literature or numerical Ramsey source was fetched in this review.

Checks and findings:

- **Triangle equality and ambient coverage.** The two common-neighbor sets
  inside `N(u)` have intersection exactly the ambient common neighborhood
  of the triangle. Its independence follows from the `K5` prohibition, so
  its size is at most `s-1`. The equality chain forces both codegrees and
  the union to their bounds. Repeating at all triangle vertices excludes
  an ambient vertex adjacent to exactly one of them. This implies the
  required induced-paw prohibition in the prescribed family.
- **Four-clique exception.** An outside vertex cannot have one or two
  neighbors in the four-clique, by selecting a triangle to which it would
  attach exactly once; it cannot have four by `K5`. The remaining masks
  zero and three have equal first and binomial-second incidence. Removing
  the internal four-clique edges gives respectively `4d-12` and
  `6(L-2)`, so `4d=6L`. Combining with `2L=d+k` yields precisely `d=3k`.
  The theorem excludes this parameter rather than treating it as impossible.
- **Anchor counts and strictness.** An independent `k=s-1` set in a
  family neighborhood is met by every ambient antineighbor of the root.
  Its singleton classes are cliques of size at most three: adding the
  anchor vertex would otherwise give `K5`. Counting nonempty signatures
  gives `max(b,2b-3k)`. Equal ambient degrees at every anchor member give
  the exact codegree sum `k(d-1)-e(I,M(v))`. The strict inequality is
  correctly necessary for the contradiction; neighborhood independence
  restrictions are derived only within the prescribed family.
- **Complete multipartite structure.** In a connected paw-free component
  containing a triangle, a maximal induced complete multipartite graph
  with at least three parts cannot have an adjacent outside vertex.
  Meeting one part forces a second; adjacency to each part is uniform
  by the induced paw on `z,x,y,x'`; missing two parts gives another paw.
  The outside vertex could consequently be added as a singleton part or
  into its unique missed part. Connectedness completes the proof. `K4`
  then limits the component to three parts and its order to `3alpha`.
- **Triangle-free component envelope.** Triangle-free neighborhoods are
  independent and have size at most `k-1`. Greedy deletion gives order
  at most `k*a`; the supplied Ramsey upper bound gives `rho_a-1`.
  Nonneighbors of a vertex have independence at most `a-1`, giving the
  third bound `rho_(a-1)+k-1`. Components add their independence numbers,
  so the partition maximum covers disconnected and empty graphs. For
  `a=1`, a triangle-free complete component has at most two vertices.
- **Numerical recovery and parity.** At `k=4` the component bounds
  `2,5,8,12` are at most `3a`, giving `H_4=12`. The equality threshold
  `L=(d+4)/2` requires even `d`, with the excluded value 12 exactly the
  four-clique exception. The sufficient range `n>=2d+2` makes
  `2b-12>=2d-10>2d-12`. In particular `d=18,n>=38` is covered.
- **Strict threshold.** With `2L>d+k`, the same triangle-set inequality
  excludes triangles outright. The anchor argument remains valid without
  triangle equality. Every family neighborhood is then independent and
  has size at most `k-1`, proving the `k^2` family cap; the triangle-free
  component envelope gives its stated refinement. Odd `d` at
  `L=ceil((d+4)/2)` satisfies this strict threshold. Direct substitution
  verifies every entry for degrees 18, 19, 20, and 21, including the
  strict anchor comparisons `36>24`, `34>24`, `32>28`, and `30>28`.
- **Quantifiers and permitted use.** Failure to have a small-codegree edge
  implies every actual family edge has integer codegree at least `L`,
  including vacuous edge-free cases. Thus all component and anchor
  restrictions apply to the same prescribed family. Its property is
  inherited by both endpoints of the guaranteed edge. Complete later
  exhaustion still needs all permitted maps and completions. No family
  size census or global branch closure is supplied by the theorem.

Outcome: **accepted**, all four claims at the exact reviewed hash, on their
explicit hypotheses and numerical Ramsey premises.

Limits: This is an independent mathematical audit, not a formally checked
certificate. The stated classical Ramsey values were not reproved or fetched.
Novelty has not been checked. The theorem supplies conditional two-root
coverage, not an order-43 nonexistence result. Any proof change requires a
renewed exact-revision review; replacing the numerical Ramsey premises also
requires checking their applicability to the component envelope.
