# Independent review of transversal deletion and defect budgets

Claim(s): `transversal_deletion.md#claim-transversal-deletion-01` through
`transversal_deletion.md#claim-transversal-deletion-04`.

Author and reviewer: transversal-compatibility agent; overlap-author agent
(distinct identities). Date: 2026-10-15.

Reviewed revision: exact uncommitted file SHA-256
`03f47814e5092641864b3f221c06f09123e2364ab0068a05d2cdb8d0bb46dee1`.
This is the current file independently hashed by the reviewer, superseding
the `4939f0b995004f80abeb3601159bc51686f6eddcb8ca057db2bd463f0b42240a`
revision initially named in the assignment. Input project revision:
`b12925f7a96d24e18d06b0237930a32e30660ca2`.

Dependencies reviewed:

- `n43/d18/transversal_four.md`, SHA-256
  `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e`;
- `n43/d18/frontier_band.md`, SHA-256
  `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54`;
- the supplied Ramsey and lower-edge-bound interface, Turan's balanced
  extremal theorem and equality characterization.

The source notes record `R(4,3)=9`, the lower edge endpoint 50 on
15-vertex `(4,4)`-free graphs, and endpoint 41 on 14-vertex such graphs.
Their exact applicability was checked; their published census evidence was
not independently recertified.

Checks and findings:

1. Claim01 uses only absence of `I_s` in `F`, and a set `T` whose deletion
   leaves a `K_r`-free graph. The remainder `H` has exactly `h=n-t` vertices
   and no `I_s`, so its external lower edge premise applies. Each attachment
   vertex's nonneighbors in `H` have neither `K_r` nor `I_(s-1)`. The latter
   would extend with that vertex to an `I_s`. The Ramsey bound therefore
   gives at most `R-1` nonneighbors and at least
   `b=max(0,h-R+1)` attachments. This uses the precise ambient types and
   transfers no independent-set prohibition to an arbitrary neighborhood.
2. The internal-edge bound has the correct complement polarity: `F[T]`
   has no `I_s`, so its complement is `K_s`-free. Its edge maximum is the
   balanced complete `(s-1)`-partite graph, whose missing-edge count is
   exactly `sum_i binom(p_i,2)=a(t,s)`. The three disjoint edge categories
   give `e(F)>=L+t*b+a(t,s)` without double counting or a rounding shortcut.
   The exact balanced bound is valid also with empty parts, `t=0`, or
   `t<s-1`.
3. If a transversal has size less than `t`, it can be enlarged to exactly
   `t` because `t<=n`. Every superset still meets every forbidden clique,
   so the same fixed-order remainder argument excludes all sizes at most
   `t` under the strict inequality. No monotonicity in `t`, and no edge
   lower bound at smaller remainder orders, is required. The numerical
   lower bound `L` in Claim01 may be real; its strict comparison is still
   valid. The integer-minus-one formulation is correctly restricted to an
   integer right-hand side. Claim02 explicitly requires integer `L`.
4. Claim02's defect identity follows by substituting the three edge
   categories into its definition of `delta`. Every summand is a
   nonnegative integer, so their sum bounds each bracket and each
   attachment defect; at most `delta` positive attachment defects can
   occur. Attachment degree is also capped by `h`. At zero defect the
   complement attains Turan equality, giving balanced disjoint cliques in
   `F[T]`. If `b>0`, then `h-b=R-1` exactly. The explicit `b=0` qualification
   prevents an unwarranted nonneighbor equality. At `t=0` the internal and
   attachment assertions are vacuous, and the defect statement remains sound.
5. Claim03's substitution is exact: `n=18,t=3,h=15,r=s=4,R=9,L=50`
   gives `b=7`; the balanced sizes are `1,1,1`, so `a(3,4)=0`. Thus a
   size-at-most-three transversal forces at least `50+21=71` edges, against
   the hypothesis at most 70. In the pivot application `A` is `K4`-free,
   hence its complement has independence number at most three, and
   `e(complement A)=153-(85-q)=68+q`. Its `K4` sets are exactly the
   independent four-sets of `A`. An actual cross column must meet each,
   because its antineighbor endpoint otherwise extends one to `I5`.
6. Claim04's substitution gives `h=14,b=6,L=41` and balanced sizes
   `2,1,1`, hence one induced-`T` edge is forced. The lower edge total is
   `41+24+1=66`. At `e(F)=68+q`, `delta=2+q`; writing the internal edge
   count itself as `z` rather than its defect gives exactly
   `u+w+z=3+q`, with `z>=1`. The claim correctly treats this as a necessary
   budget, with no conclusion that a four-transversal exists and no
   size-at-least-five inference. The complement `A=N(v)` may contain
   independent four-sets throughout this argument.

Outcome: accepted for all four claims on their stated hypotheses and retained
Ramsey/census premises. No correction is required for this exact revision.

Permitted search use: propagate transversal-size lower bounds and exact defect
budgets; terminate only a case whose required transversal size contradicts
the justified strict edge threshold. The four-deletion estimate supplies
no order-43 termination and no transversal-existence assertion.

Limits: no graph computation, external download, formal proof checking, or
census recertification was performed. All applications must instantiate the
Ramsey and lower-edge-bound interface at exactly the stated remainder order
and graph type. Novelty was not checked. Proof changes require renewed review.
