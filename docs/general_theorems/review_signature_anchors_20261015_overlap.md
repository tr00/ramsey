# Independent review of signatures and weighted homogeneous anchors

Claim(s): `signature_anchors.md#claim-signature-anchors-01` through
`signature_anchors.md#claim-signature-anchors-06`.

Author and reviewer: augmentation-author agent; overlap-author agent (distinct
identities). Date: 2026-10-15.

Reviewed revision: exact uncommitted file SHA-256
`7c286ad9f941ca8bb62ac24aa03967e436d78266299a42d2fef1cede098ebb0b`.
Input project revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.

Dependencies reviewed: all six direct proofs, the definitions of Ramsey
numbers including `R(i,1)=R(1,j)=1`, and the stated small Ramsey premises
`R(4,3)=9`, `R(3,5)=14` in the numerical specialization. The source
four-bit anchor and frontier-defect arguments were read in
`n43/reductions.md`, section 6, and `n43/d18/frontier_band.md` while checking
the companion abstractions. No published small Ramsey certificates or the
optional global degree floor 18 were independently recertified.

Checks and findings:

1. Claim01 covers all forbidden sets: sets containing the root are excluded
   by the precise inherited `A=(p-1,q)`-free and `B=(p,q-1)`-free types;
   sets avoiding it either lie inside a side or split across both. A clique
   split is exactly a complete cross rectangle, detected by a column
   intersection, and an independent split exactly an empty cross rectangle,
   detected by an uncovered union. The ranges `1<=t<=p-1` and
   `1<=t<=q-1` cover every nonempty mixed split, and the endpoint residual
   size one means the corresponding set must be empty. This establishes
   sufficiency as well as necessity for the proposed rooted assembly.
2. In Claim02 the uncovered set inherits `K_(p-1)`-freeness and gains
   `I_(q-t)`-freeness from Claim01, hence order at most
   `R(p-1,q-t)-1`. The common-column set gains `K_(p-t)`-freeness and
   inherits `I_q`-freeness, giving `R(p-t,q)-1`. The directions and the
   one-vertex boundary conventions agree. Numerical size restrictions
   remain only consequences of the induced-graph criterion.
3. For Claim03, an independent opposite-side set of size `t` and at least
   `q-t` unused anchor vertices form an `I_q`; a signature union of size
   at most `t-1` leaves that many anchor vertices because `k=q-1`.
   The same argument applies to every subfamily of an independent set,
   yielding exactly Hall's hypothesis and a system of distinct representatives.
   Empty opposite-side families also satisfy it. No claim is made for a
   nonindependent opposite-side family. Singleton signature classes are
   cliques because a nonedge there extends `X-{x}` to `I_q`; adjoining
   `x` to such a class gives capacity `p-2` from `K_p`-freeness.
4. Counting signatures gives `e(X,B)=2b-n1+h`, with `h` the total excess
   above size two. Both nonnegative defect forms are exact. Since each
   singleton capacity is `p-2`, `c-n1+h=0` requires all singleton classes
   saturated and no signatures above size two; this requires `b>=c`.
   When `b<c`, the sharper baseline is `b`, and equality forces every
   signature singleton because `(b-n1)+h=0`. At `b=c` the two descriptions
   agree. Empty `B` and repeated signatures cause no exceptional gap.
5. Claim04 retains the exact degree decomposition
   `d_B(z)=delta-1+epsilon_z-d_A(z)` for any real reference `delta`, because
   every `z in A` is adjacent to the root. Anchor incidence bounds, followed
   by a finite weighted sum, give the first inequality with arbitrary
   nonnegative weights and the exact load sum `sum l_z=kW`. Passing from
   weighted excess to total `E_A` requires both `l_z<=1` and
   `epsilon_z>=0`, precisely as stated. A degree floor need hold only on
   positive-load vertices. The aggregate cross-edge formula is independently
   obtained by summing over all `A`, using `sum d_A=2e(A)`; there is no
   unproved perfect-cover or packing existence assumption.
6. Claim05's dual was independently rederived. Missing signatures are
   nonempty by `K_p`-freeness. A clique with too small a missing-signature
   union can be joined to the remaining anchor clique to give `K_p`.
   A singleton missing-signature class must be independent, since an edge
   in it completes `Y-{y}` to `K_p`; adjoining the missed `y` to that class
   gives the `q-2` capacity from `I_q`-freeness. The total missing incidence
   lower bound `max(a,2a-c')` subtracts from `(p-1)a`, producing exactly
   `min((p-2)a,(p-3)a+c')`. The displayed defect is also exact, with
   edge/nonedge roles and asymmetric parameters correctly exchanged.
7. Claim06 substitutes `a=d,b=42-d,p=q=5`. An independent pair has
   uncovered type `(4,3)` and at most eight uncovered vertices; a clique
   pair has common-column type `(3,5)` and at most thirteen common vertices.
   The anchor lower bound is `max(42-d,72-2d)` and singleton capacity 12.
   Degree reference 18 gives `k(delta-1)=68`, hence the displayed
   `4-2d+sum_X d_A` excess lower bound. At `d=18` the incidence bound is
   36 and internal-degree upper bound `32+sum_X epsilon`; at `d=20` they
   are 32 and `36+sum_X epsilon`. The weighted coefficient is
   `-(2d-4)W`, and the exact cross identity is `17d-2e(A)+E_A`.
   Clique anchors give `min(3d,2d+12)`, namely 48 and 52. The note correctly
   retains actual-anchor existence and nonnegative-excess hypotheses;
   a degree-20 pivot alone does not establish reference-20 nonnegative excess.

Outcome: accepted for all six claims on their explicit hypotheses and retained
Ramsey premises. No proof correction is required for this exact revision.

Permitted search use: exact mixed-set propagation using the complete family
of opposite-side homogeneous sets, numerical signature and anchor propagation,
and weighted excess bounds with recorded weights, loads and degree premises.
These provide no fractional-cover existence or order-43 closure.

Limits: no graph computation, download, formal proof checking, or literature
certificate recertification was performed. The optional degree floor and all
numerical Ramsey inputs remain stated application premises. Novelty was not
checked. Proof changes require renewed exact-revision review.
