# Independent audit of cross signatures and homogeneous anchors

Date: 2026-10-15. Author: `augmentation_author`. Reviewer: audit-pending
coordinator (distinct from the author and this session's three subagent auditors).
Claim(s): `signature_anchors.md#claim-signature-anchors-01` through
`claim-signature-anchors-06`.
Reviewed revision: input HEAD `b12925f7a96d24e18d06b0237930a32e30660ca2`;
exact source SHA-256 `7c286ad9f941ca8bb62ac24aa03967e436d78266299a42d2fef1cede098ebb0b`.

Dependencies reviewed: the six direct arguments, the precise rooted graph
setting and complement roles, and the Ramsey inputs R(4,3)=9 and R(3,5)=14.
The optional global minimum-degree floor 18 is conditional on R(4,5)=25.
These classical premises were checked for applicability, not recertified.

Checks and findings:

1. Claim 01: partition each forbidden set according to whether it contains
   the pivot, then according to its nonempty A/B parts. Sets through the
   pivot are excluded by K_(p-1)-freeness of A and I_(q-1)-freeness of B.
   Sets wholly on one side are excluded by its inherited types. For every
   remaining clique its A part lies in the column intersection; for every
   remaining independent set it lies outside the column union. Reversing
   these implications proves sufficiency as well as necessity. The final
   parameter-one cases require empty relevant sets, as stated.
2. Claim 02: the residual graph is (p-1,q-t)-free, whereas the intersection
   graph is (p-t,q)-free. Their two Ramsey order caps have exactly the
   displayed polarity and subtraction by one. No smaller independent-set
   prohibition is transferred to A.
3. Claim 03: for independent Q of order t, if the anchor-signature union
   had fewer than t vertices, its complement inside the (q-1)-anchor has
   at least q-t vertices. These vertices and Q form I_q. Apply separately
   to every subfamily to obtain Hall's condition. Two singleton-signature
   vertices must be adjacent because the remaining q-2 anchor vertices
   complete an I_q otherwise. A singleton class joined to its anchor
   vertex has at most p-2 members. Summing singleton, doubleton, and larger
   signatures gives 2b-n1+h exactly. The defect c-n1+h is nonnegative,
   with equality requiring every singleton capacity saturated and h=0.
   For b<c the sharper b-bound instead has equality precisely at n1=b,
   h=0. At b=c the two descriptions agree, including empty-side cases.
4. Claim 04: d_B(z)=delta-1+epsilon_z-d_A(z), since each z in A has the
   pivot as one neighbor. Summing over X, multiplying by nonnegative w_X,
   and interchanging finite sums proves the load inequality. Passing to
   total excess requires both load <=1 and nonnegative excess at each
   vertex; the note states both. The floor substitution has sum l_z=kW.
   Sum over all of A independently gives x=a(delta-1)-2e(A)+E_A.
5. Claim 05: although the anchor is now on the other side in the complement,
   its direct proof remains valid. Any missing signature must be nonempty
   to avoid K_p with Y. Missing-singleton classes are independent in G,
   and together with their one missed Y vertex have size at most q-1;
   hence the class bound q-2. For a clique P, too-small union of missing
   signatures leaves enough vertices of Y completely joined to P to give
   K_p. Counting missing incidences yields both the minimum of the two
   edge caps and the stated exact defect, with no improper root-side
   assumption.
6. Claim 06: substituting p=q=5 gives independent-pair union >=d-8 and
   adjacent-pair intersection <=13. With b=42-d, 2b-12=72-2d; subtraction
   of 4(18-1)=68 gives 4-2d. At d=18 and 20 this gives the two degree-sum
   allowances 32 and 36. The clique dual min(3d,2d+12) gives 48 and 52.
   Weighted load subtraction is (2d-4)W, and x=17d-2e(A)+E_A. Actual
   anchor existence and nonnegative excess are retained conditions.

Outcome: accepted, all six claims on their stated hypotheses.
Permitted search use: propagate; Claim 01 supplies complete mixed-set checking
only when every required homogeneous B subset is covered. Explicit anchor
weights and loads are required for weighted certificates. No branch closes.
Limits: mathematical independent review, without formal proof checker,
literature novelty check, computation, or census recertification. Substantive
source edits invalidate exact-revision acceptance and need a new review.
