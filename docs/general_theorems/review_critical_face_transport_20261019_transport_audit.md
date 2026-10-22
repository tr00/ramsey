# Independent review of critical-face capacities and label transport

Claim(s): `docs/general_theorems/critical_face_transport.md#claim-critical-face-01`
through `#claim-critical-face-05`, the explicit dual section ("Explicit
dual of the transport and structural theorems"), and both worked instances
(A: independent-anchor singleton capacities; B: critical-core exterior
labels), including formulas (1)--(11).

Author and reviewer: `CriticalFaceTheory` (author); `transport_audit`
(reviewer, distinct identity). Date: 2026-10-19. This is an independent
mathematical audit, not a novelty check and not a formal certificate.

Reviewed revision: exact uncommitted file SHA-256
`a0d900a4f8022881b2a3f3c416eb80a26136c16ba49ee37dc34c040c0901c3f0`,
independently hashed with `sha256sum` at the start and at the close of this
review (both recomputations equal; file untracked at HEAD `1581b3a`).
No source, proof body, or shared metadata file was edited by this review.

## Dependencies reviewed

| Dependency (claims used) | Status | Exact revision verified |
| --- | --- | --- |
| `signature_anchors.md#claim-signature-anchors-01,-03,-04,-05` | accepted | current `6d2c64d09b5dc3096b4948eef68e3cdbaa8b8d03edc68b88a41dd9113995175f`; integration-manifest accepted revision `4959062245805c0690ba4ec9db26d4057ff9ca2342813dc02fa12fe6c08f4036` (commit `f98a128`); `git diff f98a128 ceb2cb4` on this file touches only `Review state:` and `Reviews:` metadata lines, so all reviewed proof bodies are byte-identical to the accepted revision |
| `transversal_deletion.md#claim-transversal-deletion-01,-02` | accepted | current `699b21132f1dc10e5b454d69ab45c6b06effa43c2a0a89e8716eacf3735e6eb4`; manifest accepted revision `dbc5bc023dbe92ee970a816eeaea16ecd808971c0b72b979a3103087323ac24c` (`f98a128`); same metadata-only diff verified |
| `research/n43/d18/critical_core_exterior.md#claim-critical-exterior-triangle-free`, `#claim-critical-exterior-four` | accepted | accepted at SHA-256 `8b8b1101af98e4c6dfe76234e95510bc6b24fcc32887189aac67d481a2dc2f51` by `ExteriorCapacityAudit` (review file SHA-256 `209a26f8dd167dfec48f4fc1dd6698045f6c695a47247ee9341edb791dcc4060`); current file `e30573b5d121f9cbaf01369ad55cfbd109ba12690d66cf4fffdcf30b4344bf19` equals the accepted revision plus only the delimited `k1-whole-branch-integration` banner: stripping the banner and its two adjacent newlines reproduces `8b8b1101...` exactly (recomputed here), matching the integration report's claim |
| `research/n43/d18/k1/cross_core.json` claim `strict-seven-signature-budget` | accepted | current `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d`, equal to the dependency hash recorded in the accepted k1 exterior review chain; `review_state: accepted` in the file |
| Root `README.md` State of the Art (recorded `R(3,3)=6`) | external literature record | current `a31dbbee3d997679089ed94c8ac8fd09ccebaf01aebd4dc42f6ccf1ee4660fac`, equal to the hash recorded in the accepted exterior review; row `s=3,t=3` reads `6` |
| `ramsey_attachment_calculus.md` | sibling context only | the reviewed file states no claim depends on it; confirmed by reading: no claim lists it as a dependency |
| Formula (8) external inputs: edge lower bound `L` for every `(m-t)`-vertex `K_s/I_3`-free graph; proved Ramsey upper bound `R` for `R(s,2)` | declared external inputs | existence and values not verified here; the reviewed file asserts neither, and conditions (8) on them explicitly |

No solver, catalogue or graph search, download, install, or Lean/engine work
was used by author or reviewer. Reviewer computation was limited to hash
recomputation, metadata-only diffs, and trivial fixed-object arithmetic
(instance constants, `a(t,3)` at small `t`, the `tau+alpha=n` identity
brute-forced on a fixed `C5`).

## Scope and quantifiers audited

Ambient setting, applied uniformly: integers `p,q>=3`; finite simple
undirected `K_p/I_q`-free `G`; induced `H`; `T` an arbitrary subset of the
exterior `V(G)-V(H)` (it need not exhaust the exterior, and every sum in
Claims 02--05 runs over exactly this `T`). `M_H(S)` and `N_H(S)` are open
and exclude `S`; both equal `V(H)` for `S=empty`, a convention used when a
root clique has size `p-3=0`. `omega`/`alpha` are zero on the empty graph,
used for `W-{t}` possibly empty.

Per-claim universal statements verified with the following explicit
quantifiers:

1. Claim 01: for every independent `F subset V(H)`, `|F|=q-2`, and every
   clique `D subset V(H)`, `|D|=p-2`, in every setting instance.
2. Claim 02: for every family `mathcal F` (empty allowed), every weight
   assignment `w_F>=0` (zero weights allowed), every real `ell_t` with
   `0<=ell_t<=a_w(U_t)` for all `t in T`; equality is quantified over all
   positive-weight faces and all `t in T`.
3. Claim 03: for every independent `A`, `|A|=q-3` (empty when `q=3`), every
   `E subset M_H(A)` (empty allowed), every `W` inside the nonneighbors of
   `A`; condition (2) is required for each `x in E`; conclusions quantify
   over all `x in E`, all `t in W`, and every clique `Q subset E` with
   `1<=r<=p-1`.
4. Claim 04: Claim 03's hypotheses plus any family `mathcal Q` (empty
   allowed) whose premise `tau_(p-r_Q)(W)>=r_Q` holds per member;
   (7)'s equality clause quantifies over every `t in W`.
5. Claim 05: `p>=4`, `tau_(p-3)(W)>=2`, condition (9) for each `x in E`
   (suffices only at not-yet-nonzero `x`); clique-`W` corollary for every
   `k`-clique `W`, `k>=p-2`.
6. Duals: same setting with complement parameters `(q,p)`; clique `A` of
   size `p-3` (empty at `p=3`), `E subset N_H(A)`, `W subset T` complete to
   `A`, `|N_H(A union {x})|>=q-2` per `x in E`; independent-set ranges
   `1<=r<=q-1`; zero-label dual requires `q>=4`.
7. Instances: A for every independent `(q-1)`-set `X` and every exterior
   set of order `b`; B for every `K_5/I_4`-free `B` with induced `H` under
   the stated local hypotheses.

Boundary, empty, and repeated-type cases checked:

- `S=empty` conventions for `M_H`, `N_H` (both `V(H)`), consistent with the
  `p=3` dual where the root clique is empty.
- `q=3` gives `A=empty` in Claim 03; every use of `A` (I_q arguments, (2),
  `W` premise) re-checked at `A=empty`.
- Empty family in Claim 02: `B_w=0`, `sum ell_t` forced to `0` by the
  premise `ell_t<=a_w(U_t)=0`, `Delta=0`, and the equality clause is
  vacuously satisfied.
- Zero weights: the resource term vanishes regardless of saturation; the
  equality clause correctly constrains only positive-weight faces.
- `T=empty`: all sums vanish; the structural and extension bullets remain
  valid (saturation then means `c_F=0`, and capacity-zero faces occur in no
  witness set).
- Capacity-zero faces and the `|Z_F|=p-1` / `c_F=0` boundary of Claim 01
  (and its dual at `|Y_D|=q-1`).
- `W-{t}` empty: `omega=alpha=0` by the stated convention; (4) and its
  dual then read `|E_t|<=p-1` / `<=q-1`, correct.
- `p-r=1`: `tau_1(W)=|W|` used instead of (8), as the text directs;
  `r=p-1` in (5) forces `L(Q)=W`, consistent.
- Formula (8) at `t=0` (premise `e(W)<L` forces `W` to contain a `K_s`,
  so the conclusion is not false when `tau=0`) and `t=m` (the Turan term
  makes the premise unattainable) — both boundary readings sound.
- Empty `mathcal Q` / `D=empty`: (6) reads `chi(empty)=0<=|W|`.
- Repeated types: instance A permits arbitrarily many `t` with identical
  signature `S_t`; the incidence identities count multiplicities and were
  re-derived accordingly. A family `mathcal F` read as an indexed family
  with repeated faces leaves every step of Claim 02 valid (the double count
  and equality clause are per index).
- `k=p-1` (clique `W`) and `k=q-1` (independent `W`): fibre size `p-k=1`
  or `q-k=1`, so the equality partitions have nonempty parts.
- Claim 05 is vacuous for `|W|<=1` because `tau_(p-3)(W)>=2` then fails;
  this is consistent, not an unstated assumption.

## Checks

1. **Claim 01, independent face and clique dual.** Re-derived: `Z_F` and
   `X_F` are disjoint (`H`-interior vs exterior); any nonadjacent pair
   within either set or across them unions with `F` to an `I_q`, so
   `Z_F union X_F` is a clique of order at most `p-1` (`K_p`-freeness of
   `G`, not of `H`), giving `c_F>=0` and `|X_F|<=c_F`. The dual is the
   exact edge/nonedge mirror: any adjacent pair in `Y_D`, in `X_D^+`, or
   across extends `D` to `K_p`, so the union is independent of order at
   most `q-1`, giving `c_D^+>=0`, `|X_D^+|<=c_D^+`. The open conventions
   exclude `F`/`D` themselves from `Z_F`/`Y_D` on both sides, so the
   complement translation in the dual section is exact. The boundary
   readings (`|Z_F|=p-2` unit capacity, `|Z_F|=p-1` capacity zero) are
   correct, and no argument uses any prohibition on `H` beyond ambient
   `G`, matching "remain valid if `H` has any additional prohibitions".

2. **Claim 02, exact weighted defects and equality.** The double count
   `sum_t a_w(U_t)=sum_F w_F n_F` over incidences `(F,t)` with `F subset
   U_t` is exact, and `n_F=|X_F|` for the chosen `T`, so Claim 01 gives
   `n_F<=c_F` termwise. The decomposition of `Delta` into resource defects
   `w_F(c_F-n_F)` and vertex defects `a_w(U_t)-ell_t` is algebraically
   exact and both sums are separately nonnegative (`w_F>=0`,
   `ell_t<=a_w(U_t)`), hence `Delta>=0`. The if-and-only-if equality is
   correct: a finite sum of nonnegative terms vanishes iff every
   positive-weight resource term and every vertex term vanishes; zero-weight
   faces and `t` with trivially tight bounds are handled as stated. The
   impossibility of `sum ell_t>B_w` follows from
   `sum ell_t<=sum a_w(U_t)<=B_w`. Quantitative clauses verified: each
   summand is at most `Delta`; an unsaturated face has integral deficit at
   least `1`, so `k*rho<=Delta` gives `floor(Delta/rho)`; the sigma clause
   is explicitly conditional; under unit weights and integral `ell_t` all
   positive defects are positive integers summing to `Delta`, bounding the
   combined count. Structural bullets verified: capacity `<=1` makes the
   witness sets pairwise disjoint (a shared face would give `n_F>=2>c_F`);
   capacity-zero faces are in none; saturation with all capacities one puts
   each face in exactly one witness set, and the weighted variant partitions
   exactly the positive-weight capacity-one faces under its stated proviso;
   the frozen-face extension bullet is valid because the extension preserves
   `G[V(H) union T]` (so `F`, `Z_F`, `c_F` are unchanged) while Claim 01 in
   the extended graph bounds the enlarged exterior load, contradicting
   `n_F=c_F`, independently of the new vertex's other edges. The clique
   dual (`U_t` replaced by `N_G(t) intersect V(H)`, added vertex must not be
   complete to a saturated dual face) is the exact mirror and does not
   reverse any inequality. The exact-versus-relaxation statements are
   accurate: the summed bound strictly weaker than per-face capacities,
   per-face capacities necessary but not sufficient for attachment (a
   forbidden set can lie wholly outside the faces' exterior loads), and
   "partition" restricted to face witnesses.

3. **Claim 03, unit-capacity labels, fibre capacities, transversal
   demands.** Condition (2) gives `c_(A union {x})<=p-1-(p-2)=1`, so at
   most one vertex of `T` misses `A union {x}`; since `W` consists of
   vertices missing `A`, each `x` has at most one nonneighbor in `W`, which
   proves existence, uniqueness, and both directions of (3), including the
   capacity-zero case (label `0`) and the case where the unique `T`-miss is
   outside `W` (label `0`, and (3) still holds for all `t in W`). `0` is
   explicitly a fresh symbol not in `W`. `G[E]` and `G[W]` are `K_p` by
   inheritance and `I_3` by adjoining `A`, with no unjustified
   `K_(p-1)`-strengthening. Fibres `E_t` are cliques (a nonedge inside a
   fibre plus `A` and `t` is `I_q`) and are completely joined to `W-{t}` by
   (3), so (4) follows from `|E_t|+omega(W-{t})<=p-1`; `E_t` and `W-{t}`
   are disjoint because `E subset V(H)` and `W subset T`. For the
   transversal demand: `W-L(Q)` is complete to `Q` by (3), so a `K_(p-r)`
   there would union with `Q` to `K_p`; hence `L(Q)` meets every `K_(p-r)`
   and (5) holds with `tau_(p-r)(W)<=|L(Q)|<=r`, the `r<=p-1` range
   justified by `K_p`-freeness of `E`. The strict prohibition
   (`tau>r`) and the distinct-nonzero forcing (`tau>=r`, with `|L(Q)|=r`
   a bijection onto `Q`) both follow; `tau_1(W)=|W|` (empty `W` included)
   is correct. All steps re-checked at `A=empty`, `q=3`.

4. **Claim 04, conflict colouring, injection, equality partitions.**
   Every vertex of `D` lies in some member of `mathcal Q` with `r_Q>=1`
   and `tau>=r_Q`, so Claim 03 forces a nonzero label on it (the empty
   family leaves `D` empty and (6) vacuous). J-edges come in exactly the
   two declared kinds: nonadjacent pairs cannot share a nonzero label
   (fibres are cliques), and pairs in a common member have distinct
   nonzero labels (Claim 03's forcing); pairs that are both are covered.
   This is a proper colouring with colours in `W`, so `chi(J)<=|W|`. Under
   full vertex and edge coverage, `D=E` and every distinct pair is
   J-adjacent (nonedges by definition, edges by a covering member), giving
   `K_|E|`, an injective label map, and `|E|<=|W|`. Under the nonzero
   premise, `E` is the disjoint union of the `E_t`, each a clique, so the
   labels are a proper colouring of `complement(G[E])`, and summing (4)
   gives (7); equality holds iff every deficit `d_t-|E_t|` vanishes. The
   saturated-clique statement follows from (3): `E_t` complete to
   `W-{t}` and `|E_t|+omega(W-{t})=p-1` gives a clique of order exactly
   `p-1` (the empty-`W-{t}` case still gives order `p-1`). For a `k`-clique
   `W` (`k<=p-1` by ambient `K_p`-freeness), `omega(W-{t})=k-1` gives
   `d_t=p-k`, and equality forces `k` nonempty fibres of order `p-k`; the
   text correctly claims only fibre sizes and saturated cliques, not
   cross-fibre edges or uniqueness.

5. **Formula (8), use of the existing deletion theorem.** Parameter
   mapping re-derived against `transversal_deletion.md` Claim 01 with
   `F=W`, `n=m`, clique parameter `s`, `alpha(W)<3`, `h=m-t`,
   `b=max(0,m-t-R+1)`, and `a(t,3)=binom(floor(t/2),2)+binom(ceil(t/2),2)`
   (the balanced two-part Turan complement count, matching the source's
   definition with `s-1=2` parts). `alpha(W)<3` is re-derived from Claim
   03's hypotheses: an independent triple in `W` together with `A`
   (each `W` vertex misses all of `A`) is `I_q`. The Ramsey input is
   exactly `I_(s-1)=I_2`, i.e. a proved upper bound for `R(s,2)`, and `L`
   is exactly the source's `K_s/I_3`-free remainder premise. The strict
   inequality contrapositive yields "no transversal of size at most `t`",
   hence `tau_s(W)>=t+1`, including the source's enlargement argument for
   smaller transversals. The hypotheses attach to `W` (its independence
   number, its own edges, its cliques); no ambient type of `H` enters,
   matching the text. `W` may contain `K_s`, which the source explicitly
   allows. Substituting `s=p-r`, `t=r-1` (with `t<=m`, and `s>=2`, else the
   `tau_1=m` note) supplies exactly Claim 04's premise `tau_(p-r)>=r`. The
   component-defect remark is correctly framed as conditional ("can also
   restrict"), requiring an actual size-`t` transversal and integer `L`.

6. **Claim 05, triangle-supported zero-label elimination.** `d(x)>|W|>=0`
   gives a neighbor, and (9)'s second condition turns an incident edge into
   a triangle `{x,y,z}` inside `G[E]`. With `p>=4`, `r=3<=p-1`, Claim 03
   (5) makes the triangle's nonzero label image a `K_(p-3)`-transversal of
   size at least `tau_(p-3)(W)>=2`; with `lambda(x)=0` this forces `y,z`
   to carry two distinct nonzero labels. Every `y in N_E(x)` lies in such a
   triangle, so every neighbor of `x` has a nonzero label. Two neighbours
   sharing a label are adjacent (clique fibre), forming a triangle whose
   only nonzero label is that shared one, contradicting the two-label
   requirement; hence labels inject `N_E(x)` into `W`, contradicting
   `d(x)>|W|`. Checking (9) only at possibly-zero vertices is sufficient
   because the contradiction is local to a hypothesised zero-label `x`.
   The clique corollary is exact: destroying all `K_(p-3)` in `K_k` leaves
   at most `p-4` vertices, so `tau_(p-3)(K_k)=k-p+4` (given `k>=p-2>=p-3`
   so the cliques exist), which is `>=2` for `k>=p-2`; with all labels
   nonzero, (7) gives `|E|<=k(p-k)` with `d_t=p-k`, and equality has Claim
   04's partition rigidity. The claim is vacuous for `|W|<=1` since its
   transversal premise then fails — consistent.

7. **Explicit duals.** Complementation gives exactly `K_q/I_p`-free
   `complement(G)` with parameters `(p',q')=(q,p)>=3`; independent
   `(p-3)`-sets of the complement are precisely the `p-3` cliques here;
   `M` in the complement equals `N` here with the same open exclusion of
   the parameter set (both definitions subtract `S`), so the condition
   `|N_H(A union {x})|>=q-2` is literally `|M_(complement H)(A' union
   {x})|>=p'-2`. Fibre capacity transports as
   `p'-1-omega_(complement)(W-{t}) = q-1-alpha_G(W-{t})`, a preserved
   number. The `K_3/I_q` conclusions are correct in original polarity:
   a triangle in `E` (or `W`) plus the `(p-3)`-clique root gives `K_p`;
   `I_q` is inherited. Independent `r`-sets (`1<=r<=q-1`, justified by
   `I_q`-freeness of `E`) have label images meeting every `I_(q-r)` of
   `W` (cliques of size `q-r` in the complement). The dual conflict graph
   joins original core **edges** and common-member pairs (same-colour
   fibres are independent, so edges, not nonedges, must recolour),
   coverage of core **nonedges** completes it, colouring `G[E]` under the
   nonzero premise uses capacities `q-1-alpha(W-{t})`, and equality gives
   independent sets of order `q-1` (= `p'-1` cliques of the complement,
   direction checked). The zero-label dual mirrors Claim 05 exactly:
   `q>=4`, `tau^I_(q-3)(W)>=2`, more than `|W|` nonneighbors of a
   possibly-zero `x` in `E`, each lying in an independent triple with `x`;
   the injection runs over nonneighbors and contradicts the strict
   inequality. For an independent `k`-set, `k>=q-2`, destroying all
   `I_(q-3)` leaves at most `q-4` vertices, giving `tau^I=k-q+4>=2`,
   capacities `q-1-alpha(W-{t})=q-k`, hence `|E|<=k(q-k)` and, at equality,
   `k` nonempty independent sets of size `q-k` (`k<=q-1` ensures `q-k>=1`).
   No ambient-type inference is smuggled through complementation.

8. **Worked instance A (anchor singleton mechanism).** With `H=G[X]`
   independent, `M_H(F_x)={x}` (open exclusion of `F_x`), so Claim 01
   gives `c=p-2`; `S_t` is nonempty (else `X union {t}` is `I_q`); `t`
   misses `F_x` iff `S_t subset {x}` iff `S_t={x}`, so the resource counts
   exactly the singleton signature class. The class is a clique (two
   nonadjacent members with `X-{x}` give `I_q`) complete to `x`, hence of
   order at most `p-2`. Unit-weight Claim 02 reads
   `n_1=sum_x |{t:S_t={x}}| <= c=(q-1)(p-2)`; also `a_w(U_t)` equals `1`
   exactly for singleton signatures, confirming the intended reading. The
   incidence identity `e(X,T)=2b-n_1+h` was re-derived by splitting each
   `|S_t|` into `1`, `2`, or `>=3`, and (10)'s second line is
   `c-n_1+h`, matching `sum_x[(p-2)-n_x]+h` with `c=(q-1)(p-2)`.
   Equality regimes verified: `e-(2b-c)=(c-n_1)+h` with `n_x<=p-2`
   termwise, so equality iff every singleton class is saturated and
   `h=0`; `e-b=(b-n_1)+h`, so equality iff all signatures are singletons;
   when `b<c` saturation is arithmetically impossible (`n_1<=b<c`), so no
   false assertion is made, and at `b=c` the descriptions coincide. The
   example was recomputed: `c=12`, `2b-c=36`, saturation
   `n_1=12=4*3` with `4` singleton cliques of order three, `12` remaining
   two-signatures, `e=36`. The claim that no rooted decomposition is needed
   was checked against the consumed steps of signature-anchors Claim 03
   (nonempty signatures, singleton-class clique and bound, incidence
   identities): none uses the root vertex. The complement instance maps
   correctly to signature-anchors Claim 05 (clique `(p-1)` anchor,
   singleton missing signatures, per-face capacity
   `q-1-1=q-2`, total `(p-1)(q-2)`).

9. **Worked instance B (critical-17 local instance, `W=5` conflict `K8`).**
   Hypotheses consumed were enumerated: `B` is `K_5/I_4`-free (`p=5,
   q=4`); `H` induced; order-three `M_H` for every core nonedge; the facts
   (11). Under the reading used and stated below in Findings, Claim 01
   gives capacity exactly `5-1-3=1` to every core nonedge (the face is an
   independent pair; the three common nonneighbors are clique by Claim
   01), so each `x in E` misses at most one vertex of any chosen `W'
   subset W`, and Claim 02's disjointness (valid for all pairs of exterior
   vertices, adjacent or not, matching the cross_core wording) gives
   `sum_t[binom(|U_t|,2)-e(H[U_t])] <= 68` with `a_w(U_t)` exactly the
   number of core nonedges inside `U_t` and `B_w=68` conditional on `H`
   having 68 nonedges; the defect `sum_F(1-n_F)` counts precisely the
   nonedges used by no exterior vertex since each `n_F in {0,1}`.
   Triangle step: `A={c}` is an independent `(q-3)`-set of size 1,
   `E=M_H({c})` satisfies (2) (`|M_H({c,x})|=3>=p-2=3`) for every
   `x in E`; for a triangle `W'`, `tau_2(W')=2`, `p=5>=4`,
   `d(x)>=4>|W'|=3`, and (11) supplies (9), so Claim 05 forbids zero
   labels w.r.t. `W'`; fibre capacities are `5-1-omega(K_2)=2`, and three
   fibres hold at most `6<8=|E|` — contradiction, hence `B[W]` has no
   triangle. An independent triple in `W` with `c` would be `I_4`, so
   `alpha(W)<=2`, and recorded `R(3,3)=6` gives `|W|<=5`. At `|W|=5`:
   `tau_2(W)=|W|-alpha(W)>=5-2=3` (the identity `tau+alpha=n` holds for
   all graphs — complement of a minimum vertex cover is a maximum
   independent set and conversely; re-checked on a fixed `C5` by brute
   force). Every triangle of `H[E]` has `r=3` and
   `tau_(5-3)(W)=tau_2(W)>=3`, so Claim 03 forces three distinct nonzero
   labels per triangle; by (11) every edge lies in a triangle and every
   vertex has degree at least four, hence lies in one, so `D=E` and the
   conflict graph contains every pair (nonedges by definition, edges via a
   triangle): `J=K_8`, which needs eight colours against `|W|=5`. Thus
   `|W|<=4`. These are exactly the two conclusions of the cited accepted
   claims (triangle-free; order at most four), rederived from the local
   hypotheses without `|T|=7`, a second core, a K1 partition, a named SRG,
   or uniqueness — and without assuming whole-K1 exclusion.

10. **Metadata and template conformance.** All five claims carry the full
    template fields (Claim ID with repository path and stable anchor, Kind
    `local-deduction`, Review state `ready`, Scope, Dependencies,
    Conclusion, Proof, Search use, Reviews), keep review state separate
    from kind and search use, and phrase search use as "none pending
    independent review" with a prospective description. Dependency claims
    cited as premises (signature anchors 01/03/04/05, transversal deletion
    01/02) are the accepted ones. The note claims no novelty, no Ramsey
    improvement, no existence or nonexistence conclusion, and no
    sufficiency — each such disclaimer was checked against the actual
    statements and is accurate. The author made no source or metadata
    edits (the reviewed file is untracked and self-contained).

## Findings

No correctness-level gap was found: every claim, dual, and instance
re-derives from the stated hypotheses with the stated quantifiers, and no
statement exceeds its proof. Two wording-level observations are recorded
for the author; neither changes any mathematical content, and neither is a
condition of acceptance:

1. **Quantifier wording of the order-three hypothesis in instance B**
   (lines 471--472, compared with lines 486--487 and 494--501). The text
   first says "for every core nonedge `cx`, `M_H({c,x})` has order three"
   and only afterwards "Fix a vertex `c`". The reviewed derivations are
   valid under the global reading (the quantifier ranges over all core
   nonedges, endpoints written `c,x`), which is the reading required by
   the later conclusion "capacity one to every core nonedge `cx`" and by
   the whole-core packing, and is exactly the fact established in the
   cited accepted source (every nonedge has exactly three common
   nonneighbors). Under the alternative reading (only nonedges through one
   pre-fixed `c`), the whole-core packing at lines 494--501 would not
   follow from the instance's hypotheses alone. Suggest binding `c` before
   the hypothesis or writing "for every core nonedge `uv`" to remove the
   ambiguity; no mathematical change is needed under the intended reading.
   Priority 3.

2. **Hypothesis pointer in instance B's closing sentence** (lines
   525--526). "Recovers the two structural exterior restrictions from the
   local hypotheses (11)" is slightly imprecise: the derivation also
   consumes the order-three supposition (lines 471--472, via Claim 03
   hypothesis (2)) and the ambient `K_5/I_4`-free types. All of these are
   in fact stated explicitly in the instance, so no hypothesis is hidden;
   only the "(11)" pointer under-includes. Suggest "(the order-three
   supposition and (11))". Priority 3.

## Outcome

**accepted** -- all five claims, the explicit duals, and both worked
instances, at the exact SHA-256
`a0d900a4f8022881b2a3f3c416eb80a26136c16ba49ee37dc34c040c0901c3f0`,
on the dependencies and premises tabulated above. No changes are requested.
Any edit to the reviewed proof text voids this review and requires renewed
review; reference-only moves preserve it if the move is recorded.

## Limits

- This is a mathematical audit, not a novelty check, not a Ramsey-value
  claim, and not a formal or machine-checked certificate.
- The external inputs of formula (8) (edge lower bound `L`, proved Ramsey
  upper bound `R` for `R(s,2)`) were not verified; (8) remains conditional
  on them exactly as written. The only numerical input consumed directly
  is the recorded `R(3,3)=6` from the root table.
- The SRG derivation behind instance B's hypotheses (via the cited
  accepted exterior claims and their accepted upstream
  `large_row_extensions` premise) was not re-audited here beyond verifying
  byte-identity of the accepted revision (banner stripped) and the
  recorded acceptance hashes. Instance B's mathematics was checked only on
  its stated local hypotheses, which is what the instance claims.
- No realizability, existence, or nonexistence question was checked;
  instance A's example signatures and instance B's equality patterns are
  explicitly not asserted realizable, and this review neither adds nor
  removes such assertions.
- Sufficiency, attachment-criteria, and search-use boundaries are as the
  note states: all results here are necessary conditions and exact local
  identities only. No solver, catalogue, or graph search was run by either
  party.
