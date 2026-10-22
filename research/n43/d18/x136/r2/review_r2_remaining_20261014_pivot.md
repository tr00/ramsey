# Independent review of the two-overlap s=6 closure

Date: 2026-10-14. Reviewer: `pivot_coverage` agent, distinct from the
`r2_triples` author and coordinator who supplied the common-neighbor count.

Claim: `independent_triples.md#claim-r2-triples-06`.

Reviewed revision: exact uncommitted proof SHA-256
`fed38dd2c1bac3d580f788d4ac842da5c5b02c4fd2cc43e46fd595fd9b7f5b5f`.
This targeted review accepts Claim06 at that hash. It does not replace
the original independent review of earlier Claims01--04 or constitute
independent acceptance of Claim05's separate, conditional core description.
The latter is not used in Claim06's proof.

Dependencies reviewed: `low_excess_columns.md#claim-r2-low-excess-05`
at proof SHA-256
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`,
independently accepted in
[the normal-form review](review_low_excess_remaining_20261014_pivot.md);
the equality-frontier global degrees18 of every A vertex; R(3,5)=14.
The normal form inherits the recorded external census premises, without
their recertification here.

Checks and findings:

- The overlap size-one-or-two split is complete by the independently
  accepted normal form. If size two, both vertices a,b have A degree10,
  global degree18, and are nonadjacent. Their common B neighbors are the
  six distinct vertices q1,q2,W1,W2,z1,z2. The potential size5 neighbors
  y_a,y_b are not needed in the lower bound and no equality between them
  is assumed.
- Each degree10 overlap has internal degree at least2 in each four-set
  T_i because its attachment to A-T_i is at most8. The other overlap
  vertex is nonadjacent, so it meets both of T_i's other vertices. Those
  four T-union vertices are distinct when the intersection is exactly
  {a,b}. Hence they are four common A neighbors of a,b. With the pivot v
  and the six common B vertices, disjointness of the rooted partition
  gives c=|N(a) intersect N(b)|>=1+6+4=11.
- Because a,b are nonadjacent, both eighteen-element neighborhoods lie
  in the41 vertices outside {a,b}. Their union has order36-c. Thus their
  common nonneighbor set has order41-(36-c)=5+c. It is K5-free as an
  induced subgraph of G and I3-free because an independent triple there
  would make I5 with a,b. R(5,3)=R(3,5)=14 bounds its order by13,
  giving c<=8. This contradicts the lower bound11. The calculation uses
  full global neighborhoods, rather than only A codegrees.
- Ambient types and coverage are preserved. No I4 prohibition is imposed
  on A; the needed I3 prohibition is derived on the common zero-set with
  both nonadjacent anchors. No condition from the independently impossible
  size-two core is used to exclude size one. The exact split therefore
  leaves the singleton overlap of degree10 with all its existing row
  alternatives covered.

Outcome: accepted on the recorded premises. Permitted search use:
terminate the r=2/s=6 child with overlap size two, and propagate overlap
size one in the remaining r=2/s=6 interface after the independently
accepted normal-form coverage. This does not terminate the whole s=6,
x=136, degree18, or order43 branch.

Limits: independent mathematical review is not a formal exhaustion
certificate. External census and small Ramsey-number certificates were
not recertified, and novelty was not checked. No graph enumeration,
solver, download, or installation was performed. Mathematical changes
require renewed exact-revision review.
