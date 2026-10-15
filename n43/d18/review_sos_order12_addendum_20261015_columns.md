# Independent audit: order-twelve cap and six-transversal threshold

Claim(s): `sos_order12_addendum.md#claim-order12-cap42` and
`#claim-order12-six-transversal`.

Author and reviewer: `/root/sos_finite`; independent reviewer
`/root/sos_columns` (distinct agents).

Reviewed revision: base HEAD `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`,
exact source SHA-256
`c48a88e455d232deb52ea7380a8874330362c20b750f5b73f7447ad1e835afa0`.

Dependencies reviewed: the exact finite-triangle-deficit identity at source
SHA-256 `87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`,
independently audited in `review_sos_finite_moments_20261015_columns.md`;
Turan's theorem and deletion arithmetic. R(3,4)=9 remains an external
premise, not recertified here.

Checks: (4,4) ambient type, degree endpoints, affine residuals, zero-slack
profile coverage, triangle residue, transpose/complement terms in the
underlying identity, six-set transversal hypothesis and q quantification.

Findings:

- A (4,4)-free graph on twelve vertices has degrees3..8 because both
  original and complementary neighborhoods are triangle-free/I4-free
  of order at most8. The referenced exact identity retains both the
  triangle and independent-triple terms.
- Independent exact rational substitution for all six allowed degrees
  gives r=(30,18,8,2,0,0). The affine left side equals516-12e(H),
  so nonnegativity initially gives e<=43.
- At e43 the left side is zero; every residual and both neighborhood
  defect families therefore vanish. Only degrees7 and8 remain. Writing
  n7+n8=12 and7n7+8n8=86 gives n8=2,n7=10 with no other cases.
- Zero original neighborhood slack implies3t=sum f(d)=100+24=124.
  This contradicts integer triangle count because124=1 mod3.
  Thus cap42 follows, with no order-twelve census premise.
- For a named six-set transversal L, only the remainder A-L receives
  the I4-free property. It is also K4-free because A is K4-free.
  Turan on complement A[L], which is K5-free, gives at least two edges
  in A[L] from balanced parts2,2,1,1. The exact deletion identity gives
  e(A-L)>=85-q-42+2=45-q. Cap42 then forces q>=3, independently
  of global excess E_A or cross count x.
- The corollary correctly concerns every supplied abstract transversal,
  without an actual B endpoint or an I4 prohibition on A. Neither claim
  asserts occurrence of such a set or termination of an x branch.

Outcome: **accepted** for both claims at the stated exact source hash.

Permitted use: propagation of e<=42 on specified actual (4,4)-free order12
cores/cells; rejection of a supplied degree<=7 six-transversal hypothesis
when q<=2, across arbitrary x.

Limits: no novelty review, formal checker, external-premise recertification,
unavoidable-pattern theorem, exhaustive coverage, or order-43 branch closure.
Proof changes require renewed independent review.
