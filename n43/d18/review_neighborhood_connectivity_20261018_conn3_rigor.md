# Independent review of claim-connectivity-03 (recorded filters and interface obligations)

Claim(s): `n43/d18/neighborhood_connectivity.md#claim-connectivity-03`
(review state `ready`, Reviews: none at review time). Claims
`#claim-connectivity-01` and `#claim-connectivity-02` in the same file were
independently reviewed and accepted elsewhere (`ConnectivityAudit`,
`reports/2026-10-17-d18-connectivity.md`); they are treated here as reviewed
premises and were rechecked only as claim 03 uses them.

Author and reviewer: Author `Main` (task `connectivity-d18-20261017`);
reviewer `ConnRigor`, a distinct identity performing an independent
re-derivation. Date: 2026-10-19.

Reviewed revision: SHA-256 of the exact bytes reviewed:

```text
125007bb8e179ff0fa741eeb926dc1a8cfad4c5d72a07eddfcc3cd919204df77  n43/d18/neighborhood_connectivity.md
```

This equals the post-review integration snapshot recorded in
`reports/2026-10-17-d18-connectivity.md`, where claims 01/02 were accepted
with claim statements and proof bodies unchanged.

Dependencies reviewed:

- `#claim-connectivity-01` (accepted elsewhere): component shape
  `K_m` disjoint-union `C`, m in {1,2,3}, alpha(C)=3, no edges between the
  components. Rechecked as used: correct.
- `#claim-connectivity-02` (accepted elsewhere): source of "every
  disconnected case has a<=68" used in part (a). Rechecked (C(m,2) plus the
  census intervals gives [53,58], 61, 68; maximum 68). Not cited in claim
  03's Dependencies — see F1.
- `n43/reductions.md` SHA-256
  `e00118c9890d529f755591b6f8daa823edb2cf3d344f49338155573e4034cf23`,
  sections 4.5 (every vertex in a K4 and an I4), 5.1(2)/6.1 (every column
  meets every I4 of A), 5.2 (row bounds `17-s_u <= r_u <= min(17,23-s_u)`,
  cap `r_u<=17`, boundary trigger `r_u=17`).
- Row identity `d_B(u)=17+epsilon_u-d_A(u)` with the branch-wide convention
  `epsilon_u=d_G(u)-18` (frontier_band, parameter_landscape, etc.).
- Deletion floor `d_(N(v))(u)>=max(0,a_v-79)` (`n43/d18/pivot_classes.md`
  section 2; `transfer_bounds.md`, from E(4,5,17)=79).
- Unresolved external premises, retained as recorded and not recertified:
  R(4,4)=18, R(3,4)=9, R(4,3)=9, R(3,5)=14, (4,4) census 50..55 / 60..60 /
  68..68, (4,5,18) interval 50..85, E(4,5,17)=79, E(4,5,14)=60, degree
  interval 18..24.

Checks. Every item below was re-derived before reading the author's audit;
finite enumerations and arithmetic were run as throwaway scripts.

## Part (a)

1. Deletion-floor vacuity. Raw floor `a-79 <= 0 <= d_A` for a <= 79; the
   recorded form is `max(0,a-79)`, which is exactly 0 there, so vacuous.
   Script: at every disconnected a (53..58, 61, 68) the raw floor is
   -26..-11, recorded floor 0; boundary exact (a=79 vacuous, a=80 not).
2. Disconnected a <= 68: recomputed C(m,2) + census = [53,58] (m=3),
   {61} (m=2), {68} (m=1); maximum 68. This is claim-connectivity-02's
   conclusion (see F1).
3. Clique degrees: d_A=m-1 in {0,1,2} for m<=3 — correct, since the two
   components of G[A] have no edges between them.
4. C-vertex degrees. d_A(x)=d_C(x) (no K_m-C edges). A triangle inside
   N_C(x) together with x is a K4 in A, and with v a K5, so N_C(x) is
   triangle-free. N_C(x) subset C inherits I4-freeness from alpha(C)=3
   (hereditary; NOT from A, which does contain I4). R(3,4)=9 in the
   direction "every 9-vertex graph contains a K3 or an I4" then forces
   |N_C(x)| <= 8. Direction confirmed correct; d_C(x)<=8.
5. Quantifier audit of the universal "no recorded unconditional G[A]
   filter". I surveyed every recorded predicate I could locate that is
   unconditional (no x/q/E/interface hypothesis) and evaluable on G[A]
   alone, and evaluated each on the three families:
   - generation filters of `scripts/geng.sh` (K4-free, I5-free, 50<=a<=85,
     max degree 13): satisfied (claims 01/02 give K4-free, alpha(A)=4,
     a in [53,68]; degrees <=2 and <=8 <= 13);
   - deletion floor: vacuous (item 1);
   - row/degree cap d_A<=13 (reductions 5.2, R(3,5)=14): satisfied;
   - (4,4) census on the slices: satisfied by claim 02's arithmetic;
   - (4,5,14)=60 on A-I for every I4: script-checked per family — m=1:
     C is forced 8-regular (every (4,4)-free 17-graph is, by the same
     N/co-N R(3,4)=9 argument), e(C-T)=68-24=44; m=2: degrees in C are
     7 or 8, e(C-T)=60-sum_T d <= 39, plus the clique edge gives <=40;
     m=3: <= 1+55 = 56. All <= 60;
   - transversal/tau bounds: `tau<=2 => e(complement A)>=72` (proof_review
     2026-10-13, deletion sizes 0,1,2 give 81,77,72), `tau>=3 only when
     e(complement A)<72` (pivot_classes, transfer_bounds), `tau>=4 at
     q<=2` (frontier_band), four-set transversal `e(F)>=66`
     (transversal_deletion-04), member floor `9-q`. For the families
     e(complement A)=153-a is 85..100 and 9-q <= -8, so every one of
     these is vacuous or satisfied (note the m=1 family has transversal
     number 1 via the single clique vertex, so these bounds WOULD exclude
     it if applicable — applicability fails at a<=68, verified numerically);
   - parameter_landscape deletion ledger (50,44,...): q=1-strip specific;
     the landscape itself records "no degree refinement" at q 17..35.
   Result: no counterexample filter found; the universal holds over the
   located corpus. The proof text itself checks only the deletion floor and
   states two degree facts without naming the cap they discharge — see F2.

## Part (b)

6. Epsilon convention. The claim file never defines epsilon_u; the cited
   row identity pins its sign. Verified from d_G(u)=1+d_A(u)+d_B(u) (v
   contributes the +1) with epsilon=d_G-18 that
   d_B=17+epsilon-d_A, matching the identity as written and the
   branch-wide convention (script sweep over d_G=18..24, s=0..13).
   Notation consistent; no sign mismatch (see F4).
7. Row algebra for u in K_m: d_A(u)=m-1 and
   N_G(u)={v} disjoint-union (K_m-u) disjoint-union R_u (u anticomplete to
   C; V partitions as {v}, A, B). Cap r_u<=17 gives
   17+epsilon_u-(m-1)<=17, i.e. epsilon_u<=m-1 — the cap really does give
   it. Then r_u=18-m+epsilon_u, correct for m=1,2,3 (script).
8. m=1 forcing: cap gives epsilon<=0; reductions 5.2's lower row bound
   r>=17-s gives epsilon>=0, so r_u=17, epsilon_u=0, d_G(u)=18,
   d_B(u)=17 exactly. Both directions sit inside the cited section 5.2.
9. Boundary trigger: reductions 5.2 at r_u=17 states G[R_u]=G[N_B(u)] is a
   17-vertex 8-regular (4,4) graph; hypotheses met. Independently
   re-derived: K4-free (K4+u=K5), I4-free inside B (I4+v=I5); in the core
   H, N_H(y) is K3-free (triangle+y=K4) and I4-free, so R(3,4)=9 gives
   d<=8; the co-neighborhood (16-d vertices) is I3-free (I3+y=I4) and
   K4-free, so R(4,3)=9 gives 16-d<=8, i.e. d>=8. Hence 8-regular,
   e=68. The claim states the trigger exactly as recorded.

## Part (c)

10. Case split, exhaustively script-enumerated over all adjacency
    configurations of N_G(u)={v}+(K_m-u)+R_u (v~clique, v nonadjacent to
    R_u, clique pairwise adjacent, clique-R and R-internal arbitrary;
    8 configs at m=1, 64 at m=2): a K4 containing u is u plus a triangle
    in N_G(u); a triangle through v needs two distinct adjacent A-neighbors
    of u, available only at m=3 (there the two other clique vertices, so
    {u}+(K_m-u)+{v} is always a K4); at m=1 no v-triangle exists and the
    only triangles are triangles in R_u; at m=2 the only triangles are
    triangles in R_u or w plus an edge inside R_u intersect R_w. No other
    case occurs (v is nonadjacent to B, so {v,*,r} is impossible). "v has
    exactly A as neighbors" verified (A=N(v), degree 18).
11. I4 membership: {u} plus an independent triple of C is independent (no
    K_m-C edges, alpha(C)=3), for every m — automatic as claimed. The
    claim scopes (c) to clique vertices only and makes no claim about
    C-vertex membership; no overreach.

## Part (d)

12. Structure: an independent 4-set of A meets K_m in at most one vertex
    and cannot lie inside C (alpha(C)=3), so it is exactly one K_m vertex
    plus an independent triple of C. Triples exist (alpha(C)=3). Correct
    for all m in {1,2,3}.
13. Column premise: "every column meets every I4 of A" is recorded at
    reductions 6.1 (nonempty four-bit signature S_y=C_y intersect X; the
    Hall condition at |Q|=1) and 5.1(2) (all-zero rectangle X x {y} is
    forbidden); it also follows directly from I5-freeness (X plus an
    anticomplete y would be an I5). Unconditional for candidates —
    applicability confirmed (citation is unpinned in the note: F3).
14. Obligation: if C_y misses u in K_m, then for every independent triple
    T of C the set {u}+T is an I4 of A (u anticomplete to C), so C_y
    intersects T. Quantifiers correct: cross column (y in B; V = {v}, A, B),
    every missing clique vertex, every independent triple.

## Scope, search use, and premise usage

15. No x-exclusion, realizability, or existence claim appears in claim 03's
    statement, proof, or its Audit sentences ("No realizability claim is
    made, and no value of x is excluded by this note") — true as written.
16. Search use `propagate` is consistent with the Search integration
    section: (a) guards against over-pruning the exceptional slices
    (generate without -C or augment), (b)-(d) are row/column obligations
    usable as propagation; no terminate/branch/coverage claim is made.
17. Use of claims 01/02 rechecked: structure, alpha(C)=3, m<=3 and
    anticompleteness used correctly from claim 01; the Setting's
    alpha(A)=4 and K4-freeness of A used consistently (note A itself is
    NOT I4-free — the proof correctly derives C's I4-freeness from
    alpha(C)=3, not from A); a<=68 comes from claim 02 (F1).

Findings:

- F1. Dependency citation gap: conclusion (a) quantitatively relies on
  `#claim-connectivity-02` ("every disconnected case has a<=68"), but the
  Dependencies field lists only `#claim-connectivity-01`. Under the
  workflow's link-based invalidation, claim 02 must be linked, or the
  two-line derivation (C(m,2) + census <= 68) inlined into the proof.
- F2. Part (a) under-documents its own universal. The universal "no
  recorded unconditional G[A] filter excludes the three families" is
  supported — my independent survey (check 5) found every located
  unconditional G[A]-evaluable predicate vacuous or satisfied — but the
  proof text explicitly checks only the deletion floor; the two degree
  facts are never tied to the recorded cap d_A<=13 (reductions 5.2, the
  geng max-degree bound) they discharge, and no filter inventory is given.
  Flagged per the assigned quantifier/overreach check: no mathematical
  overreach found, but the quantifier is auditable only with information
  external to the note; name the cap (and ideally enumerate the checked
  filter families).
- F3. Part (d)'s "recorded universal premise" is never located. It is
  reductions 5.1(2)/6.1 (or directly I5-freeness); cite it precisely.
- F4. epsilon_u is never defined in the file; the sign arrives only via
  the cited row identity. Verified consistent with the branch-wide
  convention epsilon_u=d_G(u)-18, so the algebra is correct; a one-line
  definition would remove the ambiguity.
- F5. Positive: every displayed computation re-derived with no
  discrepancy — vacuity boundary a<=79 exact; R(3,4)=9 direction correct;
  m=1 chain (epsilon=0, d_G=18, d_B=17) and the 8-regular trigger
  (d<=8 from N, d>=8 from co-N) confirmed; the m=1/2/3 triangle
  enumeration is exhaustive by script; the column obligation follows with
  the stated quantifiers.

Outcome: **changes-requested** for `#claim-connectivity-03`. All four parts
(a)-(d) were independently re-derived at the reviewed hash and are
mathematically correct; nothing in the proof body needs to change. The
requested changes are citation/scope documentation only: (1) link
`#claim-connectivity-02` (or inline its two-line use), (2) name the
recorded cap d_A<=13 that the (a) degree facts discharge (F2), (3) pin the
column premise to reductions 5.1(2)/6.1 (F3); (4) optionally define
epsilon_u once (F4). After those edits the claim should be re-reviewed at
the new hash for acceptance. Claims 01/02 retain their accepted status from
their own review; this review does not revisit it.

Limits: published and census premises (R(4,4)=18, R(3,4)=9, (4,4)
intervals, E(4,5,17)=79, E(4,5,14)=60, degree interval 18..24) were
retained as recorded, not recertified. No literature or novelty review; no
solver, graph search, enumeration, catalogue processing, download,
installation, Lean, or engine change; no staging or commit. The Lean
formalization covers claims 01/02 and the connectivity corollaries, not
claim 03's interface obligations. The part (a) survey (F2) covers the
recorded unconditional filters I could locate; it is not a proof that no
other recorded predicate exists elsewhere in the corpus. C-vertex
K4/I4 membership obligations under section 4.5 are not addressed by claim
03 and not claimed by it. The boundary trigger was re-derived from
R(3,4)=R(4,3)=9 without re-auditing the remainder of reductions 5.2. No
branch-closure, realizability, or x-exclusion conclusion of any kind.

## Addendum (2026-10-19): renewed review after documentation fixes

The original review above is preserved verbatim; this addendum records the
renewed review of the revised file.

Reviewed revision (renewed): SHA-256 of the exact bytes reviewed:

```text
f50fd572fb7a3ed9a275b67bc655f9553ca6b9c0248e2b9b4fe575e21067379a  n43/d18/neighborhood_connectivity.md
```

(previous revision `125007bb8e179ff0fa741eeb926dc1a8cfad4c5d72a07eddfcc3cd919204df77`).
The new hash was computed with sha256sum before reading; the full file was
then re-read and compared against the original text of the earlier review.

Checks (diff against the original revision):

1. Edit inventory — exactly six localized changes, no other difference
   found anywhere in the file:
   - Setting: one added paragraph defining `epsilon_u=d_G(u)-18` as the
     branch convention (F4).
   - Claim 03 metadata: `Review state: ready` -> `changes-requested`;
     `Reviews: none` -> link to this review file (workflow state only).
   - Claim 03 Dependencies: now links `claim-connectivity-02 for a<=68`
     (F1), sections `4.5, 5.1(2), 5.2 and 6.1`, the epsilon convention in
     the row identity, the deletion-floor source (published
     `E(4,5,17)=79`, `pivot classes` section 2), and `R(3,5)=14` for the
     cap `d_A<=13` (F2).
   - Conclusion (a): adds "by claim-connectivity-02" to a<=68 (F1) and
     "both bounds satisfy the recorded cap d_A<=13 of section 5.2" (F2).
     The mathematical statements of (a)-(d) are otherwise word-for-word
     unchanged; Conclusions (b), (c), (d) and Search use `propagate` are
     byte-identical in content.
   - Proof: an inline three-sentence deletion-floor derivation is
     prepended (`A-u` is (4,5)-free on 17 vertices, `e(A-u)<=79`,
     `d_A(u)>=a-79`, nonpositive at a<=68) — the inlined-derivation option
     I offered in F1; and the (d) premise now carries the parenthetical
     "(section 5.1(2), equivalently section 6.1, immediate from
     I5-freeness)" (F3). No pre-existing mathematical sentence was
     altered, only line-wrapping around the new opening.
   - Claims 01 and 02, the Audit section, the Search integration section,
     and the rest of the Setting are unchanged.
2. Classification: documentation-only in effect — every change is an
   attribution, citation, definition, or an inline reproduction of
   arithmetic already verified at the previous revision; no claim
   statement, bound, threshold, or argument direction changed.
3. Fixes F1-F4: F1 satisfied (claim 02 linked and named in Dependencies
   and Conclusion (a)); F2 satisfied (cap `d_A<=13` of section 5.2 named
   and tied to both degree facts; floor derivation and source inlined;
   m-1<=2<=13 and <=8<=13 checked); F3 satisfied (premise pinned to
   5.1(2)/6.1 with the I5-freeness route); F4 satisfied (epsilon defined
   once in the Setting, convention identical to the identity's sign).
4. Derivations: all part (a)-(d) re-derivations of the original review
   stand unchanged at the new hash — the added text restates exactly what
   was independently verified there (floor direction from the published
   upper extremum E(4,5,17)=79, cap arithmetic, premise pins). No new
   claim, hypothesis, or scope entered the file.

Renewed outcome for `#claim-connectivity-03`: **accepted** at revision
`f50fd572fb7a3ed9a275b67bc655f9553ca6b9c0248e2b9b4fe575e21067379a`.
All four requested documentation fixes (F1-F4) are in place; the
mathematical content is identical to what was independently re-derived and
found correct at the previous revision. Limits of the original review
carry over unchanged (premises retained as recorded, no novelty/solver/
enumeration/Lean/engine work, no realizability or x-exclusion conclusion).
State flip to `accepted` and the Reviews link update belong to the
coordinator; this reviewer only records the renewed outcome here.
