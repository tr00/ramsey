# Independent review of the q0 closure claims (Sections 5-9)

Date: 2026-10-19.

Claim(s): `n43/d18/tau/q0_effective_reduction.md` anchors
`claim-q0-tau-five` (lines 360-399), `claim-q0-zero-one-low-excluded`
(400-455), `claim-q0-four-low-excluded` (456-545),
`claim-q0-three-low-obstruction` (546-612), `claim-q0-x138-exclusion`
(613-630), `claim-x138-conditional-frontier-consequences` (631-661).

Author and reviewer: authors TauQ0Closure and Main; this review is by a
distinct third identity (closure-rigor), so it is an independent review,
not an author self-check. I made no edits to the proof or its indices.

Reviewed revision: base commit
`1581b3ae1b0e5ca5b65a6177fd8d04678ef96782` plus the exact SHA-256 of the
uncommitted file

    491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8

(661 lines). Revision history during this review: I first received the file
at SHA-256
`0117ceb620f8d27b501cf3fd3a42c2daac7a5fb1d5d1ab1a4ba5c51915b4d433`
(658 lines). The parent then applied a proof clarification in Section 7
(old lines 524-525, new lines 524-528) and supplied the new hash above; I
recomputed the hash of the current file and it matches exactly. The old
and new versions I read differ only in that region: the case split for
four-set transversals in the first weight multiset of Section 7 now states
the "one low vertex and three I vertices" type explicitly and excludes it
by anchor domination, where the old text's weight bound `7+10+8+8=33`
covered only types containing an H vertex. Claim anchors are unchanged.
This review is of the new revision only.

Dependencies reviewed (interfaces, versions, state):

- Sections 1-4 of the same file (anchors `claim-q0-tight-defects`,
  `claim-q0-low-not-transversal`, `claim-q0-no-three-anchors`,
  `claim-q0-low-count`) are treated as explicit dependencies under
  separate review, per my scope. They are accepted by
  `n43/d18/tau/review_q0_foundations_20261019_independent.md`
  (Outcome: accepted, four claims, lines 82-358 scope) at the same
  reviewed hash `491b9c76...e0a8`; that review file itself has SHA-256
  `1f417bc87cd2f3e7779120544527e0daef3edb0fe803b27ea9c1d3a144190f97`.
  I read the Sections 1-4 statements as interfaces and re-derived every
  equality structure of Sections 5-8 from them; I did not re-audit their
  proofs outside my scope.
- The four-transversal member A-degree floor (nine) and its quantifier
  extension to arbitrary transversals: accepted per
  `review_transversal_support_20261019_independent.md` (SHA-256
  `1ca91635c876530d833e2281f2f756057a623857855e9f3826b11937178f45f5`),
  plus `n43/d18/frontier_band.md` (transversal number at least four at
  q=0) and `n43/d18/four_column_stability.md` on the recorded hashes in
  the note's source table.
- Sibling q1 closure: the note records reading
  `n43/d18/tau/q1_anchor_reduction.md` at SHA-256
  `aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`.
  The current file has since gained an additive 9-line acceptance banner
  (lines 1-9); I verified that lines 10-end hash to exactly
  `aca13de8...bcc7`, so the reviewed body is byte-for-byte preserved. The
  interface anchor `claim-q1-projected-capacity-exclusion` exists in that
  file (line 280) with the statement shape Section 9 cites. The q1 review
  `review_q1_anchor_reduction_20261019_independent.md` (SHA-256
  `9378b76356680274635046fd242f5a2ed3139e01f61e5abe0ed7c0444f3f7fd3`)
  records Outcome: accepted, all five claims, at `aca13de8...bcc7`.
- Frontier-band exact budget identity: I verified directly in
  `n43/d18/frontier_band.md` (Exact budgets, lines 8-17) that
  `x=136+k`, `k=2q+E` with `q,E` nonnegative, and that the x=138 row is
  exactly `(a,E)=(85,2)` and `(84,0)` - that is, `q=0,E_A=2` and
  `q=1,E_A=0`.
- The accepted x136 and x137 closures are prior recorded premises; I did
  not re-audit them.

Checks and independently derived evidence (all algebra re-derived by me;
the finite scalar identities were re-computed mechanically):

1. Section 5, `claim-q0-tau-five`. I re-derived: any anchor member inside
   a four-set transversal has A-degree at least nine, hence positive
   excess, hence meets `Q={a in D: epsilon_a>0}`; `1<=|Q|<=2` from total
   excess two; `L union Q` is a transversal because every I4 avoiding L
   is an anchor. Degree-sum bound: `e(A-(L union Q)) >= 85-sum_S d_A +
   b4(|S|)` with `sum_S d_A <= 7ell+10` (one Q) resp. `<=7ell+18` (two
   Q); `b4(j)` is the complement-of-Turan four-clique count, which I
   reconfirmed needs only I5-freeness of A[S] (complement is K5-free),
   so no I4-free hypothesis on the transversal is smuggled in. Mechanical
   recomputation of the table: b4(1..6)=0,0,0,0,1,2; one-Q lower
   75,68,54,48 vs U(17..13)=68,60,50,45; two-Q lower 67,60,47,41 vs
   U(16..12)=60,55,45,40. Every row strictly contradicts; the ell=4
   two-Q row depends on b4(6)=2 and checks out (41>40). Transversals of
   size below four are excluded either by the inherited frontier bound
   (tau>=4) or by padding to a four-set. Conclusion tau>=5 and the
   column-size-five conclusion follow.
2. Section 6, `claim-q0-zero-one-low-excluded`. Projection identity
   (4) re-derived: `sum_U d_B >= 24*5` because each restricted column
   `C_y intersect U` is again a transversal of U by Section 5. ell=0:
   `9t>=120` gives t>=14, weight ceiling `168<=8t+13(18-t)` gives
   t<=13. ell=1: `9t>=96` gives t>=11; `168<=h+8t+13(17-t)` gives
   t<=11 for h=4,5,6 and t<=12 only at h=7 (mechanically confirmed:
   feasible pairs are exactly (h,11) for h=4..7 and (7,12)). The
   eligibility window `w<=16-h`, the B-incidence capacity
   `99+(17-h)+(2+h)=118<120` for at most one eligible high vertex, the
   h=7,t=12 capacity 108+10=118, and the h=4 endgame all re-derive:
   at most two eligible (3*12+3*13=75<76=sum_H), at most one gives
   99+13+6=118<120, hence exactly two with profile
   `[4,8^11,12^2,13^4]` (sum 168, length 18, mechanically confirmed).
   Degree floor six forces `epsilon_u=2`, all other excesses vanish. The
   adjacent-pair bound `d_A(a)+d_A(b)<=22` (common A-neighborhood
   independent by K4-freeness hence size at most four, union at most 18)
   I re-derived; the six vertices of degrees 12,12,13,13,13,13 are then
   pairwise nonadjacent, an independent six-set, contradicting
   I5-freeness. ell=0,1 excluded.
3. Section 7, `claim-q0-four-low-excluded`. Equality structure re-derived
   from the Section 4 interface: independent L of size four, all weights
   seven, H K4/I4-free on ten vertices with 31 edges, sum_H w=108.
   Internal degree range 1..8 re-derived from R(3,4)=9 (neighborhood
   triangle-free via K4-freeness, I4-free via H) and R(4,3)=9. The
   moment functions re-derived: `3t(H)=sum e(N(v))<=sum f(d)` with
   `f(d)=min(floor(d^2/4), floor(3d/2))` (both bounds valid: N(v)
   triangle-free and alpha(N(v))<=3 since H has no I4; the floor(3d/2)
   bound follows because in a triangle-free set of independence number
   at most three every vertex has neighborhood degree at most three),
   and `3i3(H)<=sum f(9-d)` by the identical argument in the complement
   of H (K4/I4-free symmetrically). Goodman's identity then gives
   `360<=sum g(d)` exactly as written. Mechanical recomputation of the
   defect row `74-g(d)-6d` for d=1..8 gives
   44,30,18,10,4,0,0,2, and `740-360-6*62=8` with `sum d=62`. Hence
   every internal degree is at least five and at most two vertices have
   internal degree five. The weight arguments re-derive: no H weight 13
   (`5*9+3*13+2*11=106<108`), weight 12 forces equality
   `5*10+3*12+2*11=108` with the three weight-12 vertices of internal
   degree exactly five (three defects of four sum to twelve, exceeding
   eight). I exhaustively enumerated all ten-multisets with entries in
   [4,11] summing to 108: exactly two, `10^2,11^8` and `9,11^9`,
   confirming (7). In the first multiset the revised case split is
   complete: zero low vertices forces I; one low plus an H vertex gives
   at least 33; the remaining type one low plus three I vertices is now
   explicitly excluded because every low vertex has at least two
   I-neighbors by anchor domination (Section 1 interface), leaving only
   four-set transversals `three L vertices plus one I vertex`. I checked
   that this transversal hits every I4: an I4 with at least two L
   vertices meets any three-subset of the four low vertices, and I is
   hit by its I vertex. In the second multiset the transversal
   `T={z, two other L vertices, one I vertex}` is hit: any I4 avoiding T
   other than I needs at least two L vertices (same type split, with the
   low-plus-three-I type excluded by domination), so it must use both
   remaining low vertices, cannot use a weight-11 H vertex
   (`7+7+11+8=33`), and its two I vertices would have to miss both
   distinct neighbor pairs, whose union has size at least three,
   leaving at most one candidate. The distinct-pair step reads as an
   existence claim with valid contrapositive: if no two low vertices had
   distinct pairs, all four share one two-subset of I, and either of the
   other two I vertices together with the four independent low vertices
   is an I5. Both cases contradict Section 5. The clarification under
   review closes the previously implicit type; no other type remains.
4. Section 8, `claim-q0-three-low-obstruction`. I re-derived the entire
   equality structure from the Section 1/4 interfaces without assuming
   anchor excess vanishes: `E_I+E_L=2` with `E_I` possibly positive
   (Section 1 explicitly records that equality does not force anchor
   excess to vanish), `sum_H w=115`, `e(I,H)=26+E_I`,
   `e(L,H)=15+E_L`, `e(I,L)=6`, `e(I union L,H)=43` all follow from
   the vanishing defects `F=0`, `2-E_S=0`, `sigma=0`, `rho=0`; every H
   vertex has epsilon zero precisely because `2-E_S=0` puts all excess
   in `I union L`, so `d_A=w` on H is justified, not assumed. The
   adjacent-degree bound gives pairwise nonadjacent weight-at-least-12
   vertices, `k<=3` from no I4 in H. Weight-11 restrictions re-derived:
   at k=2 they form a clique of size at most three (H has no K4), at
   k=3 none exists. The r>=3 table recomputes exactly:
   k=0:112, k=1:114, k=2:113, k=3:113, all below 115, and the
   monotonicity remark (more weight-eight or fewer weight-11 vertices
   only lowers each entry) is correct, so `r<=2`. The anchor-universe
   argument re-derives: `D=I` plus at most two extras; each extra has at
   least two I-neighbors (tight-anchor domination, Section 1 interface);
   an anchor using exactly one extra would need three I vertices missing
   from at most two nonneighbors; two extras force both into any second
   anchor, which then needs the extras nonadjacent with identical
   two-element I-neighborhoods, uniquely fixing its two I vertices, so
   at most one second anchor J exists; in all cases some `i in I` lies
   in every anchor. Since every I4 avoiding L is an anchor,
   `L union {i}` is a four-set transversal, contradicting Section 5.
5. Section 9, `claim-q0-x138-exclusion`. The Section 4 interface gives
   ell in {0,1,3,4}; Sections 6, 7, 8 exclude 1, 0; 4; 3 respectively.
   Both excess distributions are handled without presupposing anchor
   excess location (Section 8 carries `E_I` symbolically). No rooted
   graph in the scope survives.
6. `claim-x138-conditional-frontier-consequences`. Verified against
   frontier_band.md: `x=136+2q+E_A`, so x=138 gives exactly
   `(q,E_A) in {(0,2),(1,0)}`, disjoint from the q=0,E_A=2 slice this
   note excludes and the q=1,E_A=0 slice the sibling q1 claim excludes
   (interface anchor verified, q1 review accepted at the recorded hash).
   With the separately accepted x136 and x137 closures, `x>=139`,
   equivalently `2q+E_A>=3`. Specializations recompute: q=0 gives
   `E_A>=3`; q=1 gives `E_A>=1`; `E_A=0` gives `2q>=3`, so integer
   `q>=2` and `x=136+2q>=140`. The conclusion is stated as conditional
   at each degree-18 root and does not assume a low-x root exists; the
   note explicitly does not assert q1's review status inside the proof
   body, and the current q1 acceptance satisfies the stated condition.

Findings: none. I found no error of algebra, quantifier, ambient type,
case coverage, or dependency applicability in the six claims on the
reviewed revision. In particular: the projection capacities and every
table entry in Sections 5 and 8 recompute exactly; the moment-defect row
in Section 7 and the two-multiset enumeration recompute exactly; the
Section 7 clarification under review correctly closes the one-low plus
three-I quartet type that the previous weight-bound prose did not
name; and no hidden assumption of `E_A(anchor)=0` or of H excess occurs
(Section 8 carries `E_I` symbolically and derives all H epsilon from the
vanishing `2-E_S` defect).

Outcome: accepted, for all six claims above, on SHA-256
`491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8`,
conditional on the continued acceptance of the Section 1-4 foundations
at that same hash and on the recorded acceptance of the sibling q1
closure at `aca13de8...bcc7`. If either dependency is revised, the
affected claims return to pending review per the workflow gates.

Limits: the external census and Ramsey premises (root README
state-of-the-art caps U(11..17), `E(4,5,17)<=79`, `R(3,5)=14`,
`R(3,4)=9`, `R(4,3)=9`, `R(4,4)=18`) were checked for applicability and
consistency within the tables, not independently re-derived; they belong
to the foundations scope. The x136 and x137 closures are accepted on
their recorded premises and were not re-audited here. No novelty was
checked and none is claimed. No solver, graph search, catalogue,
download, installation, or theorem prover was used; the arithmetic
checks above are exact finite scalar computations. No build, test, lint,
or formatter was run, and no file other than this review was created or
modified.
