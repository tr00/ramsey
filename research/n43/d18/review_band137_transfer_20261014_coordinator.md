# Independent review: transfer budgets and actual-column compatibility

Claim(s): [transfer_bounds.md](transfer_bounds.md), anchors claim-band137-budgets,
claim-band137-transfer-scope, claim-band137-small-counts,
claim-band137-adjacent-pivots, claim-band137-union-ten, and
claim-band137-independent-triples.
Author: transfer agent, band137-transfer-20261014.
Reviewer: Codex coordinator, band137-20261014.
Reviewed revision: base commit 81c768a683d3c3b3df70d4d3b7d03a67d505447b plus
exact uncommitted file SHA-256
`8187ffd3c4bc7571cb9243f2f03ba08999c364a9914158d033fc22c3a4d4a764`.
Dependencies reviewed: existing frontier band, pivot classes, small-column
note, and safe augmentation proof; smaller Ramsey values as recorded;
published edge intervals and E(4,5,17)=79. New actual q3 column theorem is
reviewed at SHA-256 15ca2f85ffbc9d739103d7071f54ba6e0416cdac651f48e6b4ff425d103e410d;
four-column stability at 71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a.
Published computational premises are retained, not newly recertified.

Checks and findings:

- Independent A and B degree sums give k=2q+E_A and E_B=2b-296+k.
  All q=0..floor(k/2) profiles for k1..6 are included; nonnegative E_B
  gives b endpoints148,147,147,146,146,145. Independent total-edge sum
  agrees with 2e(G)=774+E_A+E_B. Parities and excess partition limits hold.
- The inherited isolated four-transversal bound applies exactly q<=2.
  For q3 the reviewed elementary three lower bound and actual-column
  E_A>=14 theorem give the restored four lower bound. The source separates
  the full-interface argument from an isolated-neighborhood theorem.
  Size-four defect budgets need only the actual transversal, hence remain
  applicable at q3 even without the universal lower bound. Anchor identities
  retain E_I and hold for every I4 in A.
- Small-column incidence bounds and joining L4 to L5 give the stated s
  upper bounds. Directly summing columns gives H=k-8+2r+s. Its complete
  arithmetic ranges do not prove realizability; x137r4 is separately removed
  by the reviewed stability theorem. Repeated signatures are allowed.
- Degree-18 neighbor existence follows from t>=18-E_A>0. Deletion of an
  A vertex gives internal degree>=max(0,6-q). Averaging over degree-18
  neighbors and monotonicity in z give the specified codegree bound.
  Direct x142 substitution is 134/12,148/14,158/16,164/18, whose floors
  are11,10,9,9. The second root's profile is explicitly unrestricted.
- Every nonadjacent B pair leaves a K4-free, I3-free A complement.
  Union10 gives the same eight-vertex graph regardless of individual sizes.
  Degree4..5, Goodman triangle count8+h, and neighborhood triangle counts
  give h even and <=4. The equality h4 neighborhoods are C4/C5 as stated.
- For an independent B triple, every A nonedge outside the union gives I5;
  the complement is a clique of size<=3. Inclusion-exclusion correctly
  yields the actual overlap budgets. Each concrete4/5/6 row follows from
  this union bound and the nonadjacent pair bound, with no distinctness
  assumption. For r3 an L5 edge would extend the L4 triangle to K5, so
  s3 does force three disjoint five-columns and an A triangle remainder.

Outcome: accepted. Search use: branch for complete necessary numerical
splits and unavoidable adjacent-pivot choices; propagate for all stated
interface predicates. No complete x or order-43 branch is closed.
Limits: no formal certificate or novelty check; the published finite
premises remain evidence dependencies. Residual x>=143 is retained.


## Reference-only relocation, 2026-10-14

The user requested sibling x case folders under research/n43/d18. This review and
its claim links now use the new paths; the original reviewed hashes above
are retained as historical provenance. Claim anchors and mathematical text
are unchanged. See the [move/hash manifest](../../reports/2026-10-14-d18-layout-migration.json).

Current source: `research/n43/d18/transfer_bounds.md`, SHA-256 `97b69ae79ce042335a6405f3e1e68b72b589b2a7abc6a21ae6960f927ab074ec`.

Current source: `research/n43/d18/x142/q3/three_columns.md`, SHA-256 `00e670d5e5a5943f4f725184634f59be5ddf758b7b084551a9f3fd504ee068ee`.

Reversing the recorded path/link updates on each moved proof source
reconstructs its original reviewed SHA-256 exactly. This is a reference
migration, preserving the existing review outcome and evidence limits.
