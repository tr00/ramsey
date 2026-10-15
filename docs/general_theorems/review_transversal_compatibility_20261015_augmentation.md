# Independent review of weighted avoidance and transversal compatibility

Date: 2026-10-15. Reviewer: `augmentation_author`.

Claim(s): [transversal compatibility](transversal_compatibility.md), claims
`claim-transversal-compatibility-01` through
`claim-transversal-compatibility-04`, including the stated limitations on
singleton-overlap applications.

Author and reviewer: transversal compatibility author and augmentation author,
distinct agents.

Reviewed revision: exact uncommitted theorem SHA-256
`fb591c3905f288906230cfd7a5318e64feaf64490150c24a486ed20be2df63e1`.

Dependencies reviewed: The family and degree-gap arguments are proved directly.
For the numerical recovery, the source
`n43/d18/x136/r2/low_excess_columns.md` was independently reread at SHA-256
`e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff`,
especially its setting and claims 01–02. The four-transversal source was
read at SHA-256
`4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`;
its numerical census minimum was not recertified. Classical `R(3,4)=9`
and the source degree/transversal/census premises remain explicit assumptions.

Checks and findings:

- **Quantifiers, avoidance, and vacuity.** Nontransversality of `L-T`
  means existence of a member of the family disjoint from that set.
  Its intersection with `L` is contained in `T` and the occupancy lower
  bound makes it exactly `T`. For independent-set families, every pair
  extends to a `t`-set when `2<=t<=|L|`, giving independence of `L`.
  The corrected theorem explicitly does not assert this at `t=1`.
  An empty family cannot satisfy the nontransversality hypotheses: every
  set is a transversal of the empty family. If `|L|=t`, the hypotheses
  explicitly concern the empty candidate transversal. No existence of
  a witness independent set is silently assumed.
- **Arbitrary weighted occupancy.** For `p>=j` vertices in the higher
  weight region and `q<=t-1` in the lower weight region, the lower sum is
  `kb+p(a-b)+q(m-b)`. Since `a-b>=0` and `m-b<=0`, it is minimized
  by the stated boundary values, giving the displayed sufficient strict
  inequality. The constraint `j+t-1<=k` keeps its coefficients meaningful.
  The proof works for real weights of either sign. The separate upper
  weight cap on candidate transversals and their lower required weight
  proves nontransversality, including the size-zero case as formulated.
  A vertexwise alternative is valid only for nonempty candidates, as
  the note expressly states.
- **Two-transversal intersection pattern.** Disjointness forces every
  independent four-set to meet each transversal. Three vertices from
  their union would have degree sum at least `3a+m>B`; four vertices
  also violate it because `a>c>=m`. Thus exactly two vertices lie in
  the remainder, and their degree sum is at most `P=B-2a`.
- **Integer cutoff and the first remainder size.** If both remainder
  vertices had degree above `c`, their integral sum would be at least
  `2c+2>P`. Thus `L` is a transversal. The transversal-size bound and
  vertexwise degree floor exclude `ell<s` and `ell=s`. At `ell=s+1`,
  nontransversality of every `L-{u}` supplies a witness using `u` and
  a degree-at-least-`c+1` remainder vertex. Its pair bound forces
  `d(u)<=P-(c+1)<=m`, hence equality at the universal floor.
- **Deletion and strict total gaps.** Deleting this `(s+1)`-transversal
  yields a graph with no independent four-set. The exact deletion
  identity adds `e(H[L])`, so its edge count is at least
  `e-(s+1)m`, contrary to the explicit induced-subgraph upper premise.
  The first total-degree gap and `c<M` force `ell=s+2`. If any witness
  used a vertex outside `L`, that vertex has degree at most `P-m`;
  the second total-degree gap excludes it. The assumption `N>=s+3`
  makes the remaining count and its nonnegative coefficient valid.
  Every witness consequently uses two `L` vertices, and every
  `L-T` for a pair `T` is an `s`-set forbidden as a transversal by
  its low degree. Claim 01 gives an independent `(s+2)`-set, violating
  the final ambient independence hypothesis.
- **Exact numerical recovery.** The reread source establishes all
  degree and transversal inputs in the full actual-interface frontier
  setting, not merely from `e(A)=85`. Its bounds are `6..13`, cap 32,
  transversal floor 9 and total cap 40. The parameter substitution
  gives `N=10,P=14,D=90`. All strict checks were recalculated:
  `33>32`, `14<=15`, `14-8=6`, `85-30=55>52`, `88<90`, and `89<90`.
  A 13-vertex induced graph lacking `I4` is also `K4`-free from its
  ambient `A`, so its neighborhoods are `(3,4)`-free of order at most
  eight. Handshake gives the required 52-edge cap. Finally
  `alpha(A)<=4<6`. The conclusion therefore reproduces the source
  disjointness theorem under exactly its stated numerical premises.
- **Singleton limits and search coverage.** The abstract avoidance
  principle indeed explains the final six-set arguments in both
  singleton-degree source claims. The degree-gap theorem itself assumes
  disjoint transversals and supplies no singleton-overlap theorem.
  Its hypotheses are sufficient conditions, not a characterization.
  The notes correctly retain the additional occupancy case analyses,
  actual-interface anchor bound, and ambient independence restriction.

Outcome: **accepted**, claims 01–04 at the exact reviewed theorem hash,
on their explicitly recorded premises.

Limits: This independent mathematical audit is not a formally checked
certificate. Published census extrema and classical Ramsey values were not
recertified. No novelty review was performed. The abstract theorem can
terminate a case requiring disjoint transversals only after all of its
strict numerical gaps and induced-subgraph hypotheses are independently
established for that case. It does not prove a universal five-transversal
bound, a universal degree-ten exclusion, or an order-43 nonexistence result.
