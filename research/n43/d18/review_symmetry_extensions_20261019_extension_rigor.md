# Independent review: symmetry_extensions Claims 01--03

Date: 2026-10-19.

Claim(s): research/n43/d18/symmetry_extensions.md#claim-d18-symmetry-extensions-01,
          research/n43/d18/symmetry_extensions.md#claim-d18-symmetry-extensions-02,
          research/n43/d18/symmetry_extensions.md#claim-d18-symmetry-extensions-03

Author and reviewer: author Codex (task symmetry-extensions-20261015);
reviewer token extension_rigor -- distinct identities, independent review.

Reviewed revision: commit 7ebbef265ef9b55746b798b337b86e4fd6140045
(last commit touching the file; working tree identical to it); SHA-256 of
exact reviewed file
1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497
(recomputed before and after review; matches the assigned hash).

Dependencies reviewed:
- research/n43/d18/symmetry_reduction.md
  6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b:
  Claim 01 accepted (K_M ~= prod_C S_(m_C), label count 24!/prod m_C!),
  Claim 03 accepted (m_C<=2 for 0<=k<=5; premises: small-column H bounds,
  four-transversal e_A(C_y)>=3-q, pair-union >=10), Claim 06 accepted
  (3k-5q<48 => n18>n24 => D<lex D^c); applicability rechecked in proofs.
- docs/general_theorems/signature_anchors.md
  6d2c64d09b5dc3096b4948eef68e3cdbaa8b8d03edc68b88a41dd9113995175f:
  Claim 01 accepted; homogeneous-set equivalence rechecked.
- docs/general_theorems/symmetry_quotients.md
  fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f:
  Claims 01, 02 -- ready at this review's time, reviewed in parallel by
  reviewer token quotient_rigor in
  docs/general_theorems/review_symmetry_quotients_20261019_quotient_rigor.md;
  both arguments rederived directly for this review (semidirect/min-formula;
  per-coordinate 2-CNF construction incl. constant same-pair coordinates).
  The parallel review accepted Claims 01 and 02 at the same revision, so
  the dependency-status limit recorded at review time is now resolved.
- Unresolved external premises (assumed as recorded): degrees 18..24 for
  all vertices, e(A)<=85, e(B)<=160; small Ramsey values R(3,3)=6,
  R(3,4)=9, R(4,3)=9, R(3,5)=14.

Checks:
- Claim 01: clique extension through A[C] (incl. omega_C=0, obstruction
  wholly in B) and independent extension through A[U] (incl. U empty,
  alpha(empty)=0, no-I_(q-1) clause) rederived; parameter legitimacy
  p-omega_C>=2, q-alpha_U>=1 from inherited types; Ramsey step
  m_C<=R-1 incl. R(1,t)=1 => empty B_C. Degree-18 line by line:
  |U|>=14 => alpha_U>=3 (R(4,3)=9) => forced adjacency via I5
  obstruction; c>=5 => omega_C>=2 => (3,4)-free => m_C<=8 (R(3,4)=9);
  c<=4 => m_C<=4 (K5); m_C>=6 chain: triangle-free (edge in C + triangle
  in B_C = K5), I3 (R(3,3)=6), U clique (I3 + I2 = I5), |U|<=3 => c>=15,
  adjacent pair (B has no I4), C triangle-free, c<=13 (R(3,5)=14),
  contradiction => m_C<=5. Cases (i)-(iii) rederived:
  (i) C independent, clique, 3<=m_C<=4; (ii) 10<=c<=13 via
  alpha_U<=2+R(4,3), omega_C=2, alpha_U=2 (|U|>=5, U not clique),
  (3,3)-free; (iii) m_C=3 (B no I4), U clique, 15<=c<=18; cases
  exhaustive/exclusive for m_C>=3. C5 lemma rederived AND exhaustively
  checked over all 2^10 labeled graphs on 5 vertices: exactly 12
  (3,3)-free graphs, all C5, zero exceptions. Partition maximization
  checked by full enumeration: max prod m_C! = 4,976,640,000 at
  (5,5,5,5,4) (second 1,244,160,000); 24!/4,976,640,000 =
  124,672,148,625,024 exactly, so the >= bound holds with equality at
  the extremal partition. Scope/quantifier: derivation uses only
  |A|=18, ambient (5,5)-freeness and the four Ramsey values -- "every
  degree-18 candidate regardless of x or q" matches the proof.
- Claim 02: band 136<=x<=141 <-> 0<=k<=5 matches accepted Claim 03
  scope; K_M=(C2)^p from accepted Claim 01 kernel structure, p<=12 from
  24 occurrences; C(24,2)=276 verified; one feasibility question per
  coordinate on p variables matches quotient Claim 02; same-pair
  coordinate f_e is constant under all generators (own swap fixes the
  edge, other swaps fix its endpoints), so no assumption on the pair's
  internal bit is used and nonadjacent pairs (size ten, k=4,5 =
  x140,141, permitted by accepted Claim 03) are handled; quotient
  Claim 01 gives the exact Gamma_M minimum from kernel minima over lifts
  of H_M with no H_M cost bound (caveat line 166 correct); no twin
  equations imposed. Scope/dependency lines match proof use
  (four-transversal/small-column premises enter only transitively
  through accepted Claim 03 and are named in Scope).
- Claim 03: identity W=2e(B)-296+2q+2E rederived from
  sum_A d=2e(A)+18+e(A,B)=324+E and e(A,B)=136+2q+E; W<=24+2q+2E iff
  e(B)<=160. Strict chain rederived: n18>=19-z; W>=43-n18+5m>=43+4m;
  even => W>=44+4m>=120-4z; with W<=24+2q+2E => q+E+2z>=48;
  contrapositive gives the strict claim. Equality case rederived in
  full: m=n18=19-z forced; baseline 43+4m=119-4z; slack exactly 1 =>
  one degree-20 vertex, remainder degree 19; profile
  n18=n24=19-z, n19=4+2z, n20=1, n21=n22=n23=0, W=120-4z.
  Profile sums to 43 and excess equals 120-4z for every z (checked
  z=0..18, identity holds algebraically). D<lex D^c at equality checked
  by explicit sorted-sequence comparison for all z=0..18 in both sort
  orders: first differing entry always favors D (z=0: pos 19, 19 vs 22;
  z=18: pos 1, 19 vs 22), using n19>0, n23=0 and complement 42-d.
  Algebra 3E+q=3k-5q, z<=E, k<=16 & q>=0 => <=48 (=> 136<=x<=152),
  x152 endpoint q=0,E=16 only (old 48-5q<48 fails iff q=0 at k=16;
  script endpoint table), tie => z=16 => 18^3,19^36,20^1,24^3 (sum 43,
  W=56), and examples q=0,E=18,z=3 => 24 and 3E+q=54 all verified.
  Scope: proof uses only degrees 18..24, the two censuses, W even,
  z<=E and the selector -- all inside Scope/Dependencies; no
  transversal, small-column or x136 premise used.
- All three: search-use lines consistent with ready state and with the
  workflow template; no realizability, existence, branch-closure,
  pruning or novelty claim anywhere (disclaimers at lines 9-12, 76-77,
  131, 203, 240, 244).

Findings:
- Claim 01 (editorial): Conclusion line 57 lists only the two internal
  ambient types as hypotheses; the K_p/I_q contradictions in the proof
  (lines 87-90) need the gluing itself to be K_p/I_q-free, which Scope
  line 49 supplies ("general K_p/I_q-free rooted gluing"). Standalone
  the Conclusion is insufficient: A={a,b,c} with edge ab, B a triangle,
  all B vertices adjacent exactly to C={a,b} satisfies both internal
  types but has B_C=K3 with omega_C=2, contradicting the bound; the
  assembled graph contains K5, so it is out of scope. In-scope reading
  and every application are correct; suggestion: add "in a
  K_p/I_q-free rooted gluing" to the Conclusion sentence.
- Claim 01 (editorial): lines 98-99, 111, 113-114 compress the
  I5-obstruction, the K5 mechanisms and the R(4,3) use for c>=10; each
  step rederives correctly.
- Claim 02 (editorial): Dependencies lines 149-150 omit symmetry
  Claim 01 (source of K_M ~= prod S_(m_C)); carried transitively by
  quotient Claim 01's own dependency line.
- Claim 02 (limit): its two quotient dependencies were ready, not
  accepted, at this review's time; both were rederived here, and the
  parallel review accepted them at the same revision (see Dependencies
  reviewed above).
- Claim 03 (editorial): line 233 compresses z>=16 & z<=16 into "outer
  degree tie forces z=16"; lines 226-227 use a count-comparison
  shorthand for the position-wise first-differing-entry argument.
  Both rederive correctly.
- No material gap was found in any of the three claims; no premise
  outside any stated Scope was used.

Outcome: claim-d18-symmetry-extensions-01: accepted;
claim-d18-symmetry-extensions-02: accepted;
claim-d18-symmetry-extensions-03: accepted.

Limits: recorded external premises unverified by this review (degrees
18..24, e(A)<=85, e(B)<=160, four-transversal/small-column bounds via
accepted symmetry Claim 03); small Ramsey values taken as
standard/given; no formal certificate, no computational proof of the
43-vertex claims, no novelty or literature check; no realizability of any
case, degree profile or branch is asserted or implied by acceptance.

## Coordinator integration addendum (2026-10-19)

Integrated by the coordinator after the outcome above: claim metadata in
`research/n43/d18/symmetry_extensions.md` flipped (`Review state: ready` ->
`accepted`, `Reviews: none.` -> a link to this review) and an
integration-status banner added under the title. No proof body, claim
statement, or author prose was edited. The byte-preservation gate
(strip the banner, revert those metadata lines) reproduces the reviewed
SHA-256 exactly; gate result and post-integration hashes are recorded in
[the audit report](../../reports/2026-10-19-symmetry-quotients-extensions-audit.md).
The editorial findings above remain open as optional wording fixes; if
applied, the file hash changes and a renewed check is required.
