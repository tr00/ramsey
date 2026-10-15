# Independent review of cut-capacity family bounds

Claim(s): `cut_capacity.md#claim-cut-capacity-01`,
`cut_capacity.md#claim-cut-capacity-02`, and
`cut_capacity.md#claim-cut-capacity-03`.

Author and reviewer: Codex coordinator; overlap-author agent (distinct
identities). Date: 2026-10-15.

Reviewed revision: exact uncommitted file SHA-256
`07884ee766c6d74831dc6b08e99c8e7b81ced6ec5474f40804f4758f8d2ce911`.
Input project revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.

Dependencies reviewed: direct proofs in the three claims; Turan's theorem
for a `K_r`-free graph; the input statistic inequality `q_v+E_v<=B`.
The order-43 illustration was compared with `n43/d18/excess_bounds.md`
and `n43/d18/pairwise_pivot_refinements.md`. The accepted source
`n43/d18/dense_pivot_coverage.md#claim-dense-pivot-01` and its existing
independent review were read; its structural proof was also checked directly
in the reviewer's parallel abstraction work. Published census extrema remain
input premises, not independently recertified facts of this review.

Checks and findings:

1. In Claim01, a root with `m` neighbors in `H` has `m<=min(h,d)` and
   neighbor-excess sum at least `S_m`, independent of which vertices are
   selected. Since `q_v>=j` gives `E_v<=B-j`, the defined `t(j)` is a
   necessary capacity. This does not assert simultaneous cheap selections.
   The degree sum on `H` is `dh+W=2e(H)+C`. Turan on `H`, with the
   coefficient `(r-2)/(2(r-1))` and a downward floor on its edge upper
   bound, therefore gives the displayed lower bound for `C`. This need not
   be the sharp balanced-part Turan value for every `r,h`, but it is valid.
2. All roots have capacity `t(0)`; its defining set contains zero since
   `B>=0`. Because `q_v` is integral, roots outside `F_Q` have `q_v>=Q+1`.
   The family capacity inequality and its ceiling division follow with a
   strictly positive denominator. If `t(Q+1)` is undefined, then `B-Q-1<0`
   because `S_0=0`, so no outside root exists. If the capacities are equal,
   no family-specific count can be recovered; the stated global capacity
   contradiction is exactly the remaining comparison. A bound larger than
   `p` is an inconsistent profile, as stated.
3. Independently, for `z in H`, write
   `d_H(z)=h-1-d_(complement H)(z)` and subtract it from `d+eta_z`.
   This yields `d_P(z)=d+1-h+eta_z+d_(complement H)(z)`. Multiplying by
   `eta_z` and summing gives Claim02's exact identity: each unordered
   nonedge contributes `eta_y+eta_z`, with no factor-of-two error. Turan
   applies to `H`, hence lower-bounds its nonedges; positivity of excesses
   bounds each weight by `2eta_min`. The complement is not assumed
   `K_r`-free. The possibly negative coefficient `d+1-h` causes no issue
   because that term remains exact.
4. At fixed positive integer excess total `W` and length `h`, transferring
   one unit from an entry at least two larger than another decreases the
   square sum. At a minimum, all entries are `a` or `a+1`, with `b` of the
   latter when `W=ha+b`, giving `ha^2+b(2a+1)`. As `W>=h`, `a>=1` and
   the positive-entry restriction is preserved. The `h=0` case is separately
   handled before using `eta_min` or balanced division.
5. Every root has `E_v<=W` because it sums a subset of positive excesses,
   and has `E_v<=B` because `q_v>=0`. Thus `A=min(W,B)` is valid even
   for real `B`. Outside roots have `E_v<=D=B-Q-1` using integer `q_v`;
   no floor on `B` is needed for the asserted real inequalities. With
   `0<=D<A`, the weighted family denominator is positive and the ceiling
   of the real quotient is justified by integral `M_Q`. If `D<0`, there
   are no outside roots; if `D>=A`, this comparison provides no lower
   bound. The exact `J` or a stronger justified lower bound can replace
   `J_lo` without changing polarity.
6. Both independent bounds count exactly `F_Q`, so their maximum is valid.
   Applying a theorem quantified over every sufficiently large subset of
   `P` to `F_Q` places both endpoint statistics and the overlap restriction
   on the same edge. No optimized-root selections are identified.
7. The original illustration was checked directly: `h=3,W=18`, excesses
   `(6,6,6)`, `Q=1` give `B=13`, prefix sums `0,6,12,18`, and capacities
   `t(0)=2`, `t(2)=1`. Turan's floor is `floor(27/8)=3`, so
   `C_lo=54+18-6=66`, `p=40`, and the family bound is
   `(66-40)/(2-1)=26`. As an additional consistency check, the weighted
   identity has `J_lo=16*18+108=396`, since `L_h=0`; `A=13,D=11`
   yield only the trivial weighted lower bound zero here. Claim03 correctly
   relies on the stronger cut count. At least thirteen of those 26 roots
   can be fed to the accepted same-family theorem, giving both `q<=1`,
   hence neighborhood edge count at least 84, and codegree at most ten.

Outcome: accepted for all three claims on their explicitly stated hypotheses.
No proof correction is required for the exact reviewed revision.

Permitted search use: numerical propagation and rejection of inconsistent
profiles; composition gives existence coverage for complete two-root families.
Allowed overlap maps, completions, and applicability premises must be retained.

Limits: no graph computation, formal certificate checking, or census
recertification was performed. The real root bound `B` and any required
overlap theorem remain application-specific inputs. Neither the abstract
claims nor the conditional illustration exclude order 43. Novelty was not
checked. Proof changes require renewed exact-revision review.
