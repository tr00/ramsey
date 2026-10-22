# Independent review: four-column stability

Claim(s): [four_column_stability.md](four_column_stability.md), anchors
claim-four-column-stability-01 through claim-four-column-stability-06.

Author: four-column agent, band137-r4-20261014.
Reviewer: Codex coordinator, band137-20261014.
Reviewed revision: base commit 81c768a683d3c3b3df70d4d3b7d03a67d505447b plus
exact uncommitted file SHA-256
`71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a`.
Dependencies reviewed: existing 14-vertex (4,4) edge interval41..50;
(4,5,17) maximum79; order-43 degree range; R(3,4)=R(4,3)=9;
four-transversal argument at q=0, based on the published 15-vertex minimum50.
Numerical census premises are retained as recorded and not independently
recertified or downloaded.

Checks and findings:

- Deleting an actual size-four column gives a (4,4) core. Its attachment
  neighborhoods are triangle-free and I4-free, giving upper degree11.
  Deleting one member leaves at most76 edges: for a complementary triangle,
  pair intersections are independent and anticomplete to the third triangle
  vertex, so their size is at most3 using I5 avoidance in A. This is the
  required quantifier; A itself may contain I4. The lower degree9-q and
  arbitrary-vertex degree6-q follow from separate edge deletions.
- Nonadjacent B columns have union at least10. Four size-four columns form
  Q=K4; every external column of size<=5 would extend Q to K5. Therefore
  the exact twenty-column excess is k even without a global minimum-column
  hypothesis. The p(a) overlap bounds count distinct exceptional neighbors.
  For m=2 ordinary neighbors are independent in the I4-free B and number
  at most3; for m=3 none is possible. Thus d_A>=12+epsilon-p or
  14+epsilon-p respectively. The upper degree11 then gives the stated
  necessary exceptional incidences. All m cases, including m=4, are covered.
- The independent-four anchor lower incidence36 and vertexwise pivot-degree
  identity give sum_X d_A<=32+E_X. The four transversals give sum_X m>=4.
  For q=0 and at most one exception, repeated members have degree11 and
  zero excess. Minimizing 24+3j+2b with b<=j and j+b>=4 gives34.
- Avoiding three largest-excess vertices is justified by the existing
  four-transversal theorem at q=0. This supplies an anchor of excess at
  most E-3, or zero when the support has at most3 vertices. It proves
  E>=5 with one exception and E>=7 for disjoint small columns.
- At E=5 the only excess partition surviving this avoidance is five ones;
  avoidance of the complementary triple makes all five pairs independent,
  contradiction. At E=6 only six ones or (2,1,1,1,1) survive arithmetic.
  For the latter, every pair of ones extends to an excess-two anchor.
  The upper34 and lower24+3j+2b force j=b=2. Repeated vertices have zero
  excess, so all four ones are outside every T_i and are pairwise
  nonadjacent, yielding a missed I4. For six ones, complementary-triple
  avoidance only proves triangle-freeness; the note correctly leaves it open.

Outcome: accepted. Search use: propagate for member/anchor/overlap filters;
branch for the stated exclusions. At x137 only r4 is eliminated. The q0
restrictions are not transferred to q>=1.

Limits: no new formal certificate or literature novelty audit; census bounds
are retained published premises. No complete x or order-43 branch is closed.

