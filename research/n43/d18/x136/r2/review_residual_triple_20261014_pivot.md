# Independent review of the residual three-column partition

Claim: `independent_triples.md#claim-r2-triples-07`.

Author and reviewer: `r2_triples` author and `pivot_coverage` reviewer,
distinct identities. The reviewer independently derived the same set-count
lemma before reading the appended proof. Date: 2026-10-14.

Reviewed revision: exact proof SHA-256
`885018b3583453740b5875cc360ca9d8f9e86960f41939f5568facfabf76859d`.
Claims01--06 have unchanged mathematical text from the previous reviewed
revision; the preceding Claim06 review at `fed38dd2...` is preserved.

Dependencies reviewed: Claim06 here; the independently accepted exact
overlap row of `low_excess_columns.md#claim-r2-low-excess-05` at
`7268f1d5340b15e878e723518fc85b5c997c3210db039bf2f4b9fa67d32dbfc4`;
pair-union reasoning and K4/I5 obstructions. No additional census premise
is introduced by this appended claim.

Checks and findings:

- The exact row supplies the three distinct, pairwise nonadjacent B
  vertices p,z1,z2 of column sizes5,6,6. Each column contains the one
  overlap vertex a. Nonadjacency gives union size at least10 for P,X_i,
  hence their intersection size is at most1 and therefore exactly1.
  Consequently the triple intersection is {a}.
- Writing t=|X1 intersect X2|>=1, the full union count is
  5+6+6-1-1-t+1=16-t. Every residual A pair is adjacent: a nonedge
  with the three independent B endpoints would be I5. The residual
  set has order2+t and is a clique in the K4-free graph A, so2+t<=3.
  Thus t=1, the union order is15, and its complement is exactly a
  triangle. This argument covers every possible initial ordinary-column
  intersection and does not assume disjoint attachments in advance.
- The pair remainders are K4-free as subsets of A and I3-free by their
  two nonadjacent B anchors. The ordinary pair has union order11 and
  remainder order7; its partition is P-{a} (order4) and R (order3).
  Each mixed5/6 pair has union order10 and remainder order8; it is
  X_other-{a} (order5) and the same R. All these component sets are
  disjoint by the proved common-singleton intersections. The set
  identity does not prohibit edges between its attachment and R.

Outcome: accepted. Permitted search use: propagate the exact intersections,
residual triangle and simultaneous seven/eight/eight-vertex pair-core
partitions in the residual singleton-overlap r=2/s=6 branch.

Limits: this is a necessary interface condition, not a contradiction of
the residual s=6 branch. Every permitted induced core, attachment and
remaining column still requires coverage. No novelty review, graph
enumeration, formal checker, solver, installation or download was used.
Inherited numerical premises retain their existing evidence status.
