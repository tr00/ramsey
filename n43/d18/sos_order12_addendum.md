<!-- sos-theory-integration:start -->
Integration status (2026-10-15): both claims received independent exact-revision
acceptance in [the review](review_sos_order12_addendum_20261015_columns.md)
at reviewed-body SHA-256 `c48a88e455d232deb52ea7380a8874330362c20b750f5b73f7447ad1e835afa0`.
The reviewed body is preserved verbatim below; its ready labels are historical.
Permitted use: local order-twelve core edge-cap propagation and rejection of
the specified low-degree six-set transversal at q<=2. No whole branch closes.
See [the synthesis](../../reports/2026-10-15-sos-theory.md) and
[the manifest](sos_theory_manifest.json).
<!-- sos-theory-integration:end -->

# An integer triangle-defect improvement at order twelve

Date: 2026-10-15. Author and self-auditor: `sos_finite`.
Task token: `sos-finite-order12-20261015`. Base HEAD:
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.

Bounded theory-only addendum. No solver, graph or degree-profile search,
enumeration, download, installation, or novelty review. The accepted
[finite-moment note](sos_finite_moments.md) is preserved unchanged.
Both claims below are ready for independent exact-revision review;
Search use remains none until review.

<a id="claim-order12-cap42"></a>
## 1. Every order-twelve (4,4)-free graph has at most 42 edges

Claim ID: `n43/d18/sos_order12_addendum.md#claim-order12-cap42`

Kind: local-deduction. Review state: accepted.

Scope: every simple graph H on twelve vertices with neither K4 nor I4.

Dependencies: exact finite-triangle-deficit identity in
[finite moments Claim01](sos_finite_moments.md#claim-finite-triangle-deficits),
accepted at SHA-256
`87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`;
its independent review is
[review_sos_finite_moments_20261015_columns.md](review_sos_finite_moments_20261015_columns.md).
That identity uses R(3,4)=9 and elementary triangle-free neighborhood bounds.

Conclusion: `e(H)<=42`, improving the previous sufficient cap43 without
an order-twelve census premise.

Proof. The referenced identity gives allowed degrees `3<=d<=8` and

```text
f(d)=min(floor(d*d/4),floor(3*d/2)),
g(d)=f(d)+f(11-d)+(3/2)*d*(11-d).
```

Take `a=6,c=98`. In degree order `d=3,...,8`, direct substitution gives

```text
r(d)=98-6*d-g(d) = 30,18,8,2,0,0.
```

Let `s_u=f(d(u))-e(H[N(u)])` and let `bar_s_u` be the complementary
neighborhood defect. These are nonnegative integers. The exact affine
deficit identity is

```text
12*98-12*e(H)-3*C(12,3)
 =sum_u r(d(u))+sum_u(s_u+bar_s_u)>=0.
```

Since `C(12,3)=220`, this initially gives `e(H)<=43`. If equality holds,
the displayed deficit vanishes, so every degree is seven or eight and
every neighborhood defect vanishes. The degree sum86 forces ten degree-
seven vertices and two degree-eight vertices. But exact triangle counting
would then require

```text
3*t(H)=sum_u f(d(u))=10*f(7)+2*f(8)=10*10+2*12=124,
```

which is impossible because124 is not divisible by three. Thus e43 is
excluded and `e(H)<=42`. This retains the independent-triple term in
the underlying Goodman identity; the contradiction uses the separate
triangle residue after total slack has vanished.

Search use: none; proposed propagation of the cap on specified actual
(4,4)-free cores or anchored cells. Reviews: [review](review_sos_order12_addendum_20261015_columns.md).

<a id="claim-order12-six-transversal"></a>
## 2. A low-degree six-set transversal requires q at least three

Claim ID: `n43/d18/sos_order12_addendum.md#claim-order12-six-transversal`

Kind: local-deduction. Review state: accepted.

Scope: order-43 K5/I5-free G with degree-18 pivot v; A=N(v), B=M(v),
`q=85-e(A)`; every six-set L subset A with all `d_A(u)<=7` that meets
every independent four-set in A. No restriction on E_A or x.

Dependencies: preceding cap; Turan's theorem; exact deletion identity.
The degree-18 notation and existing threshold table are in
[finite moments Claim03](sos_finite_moments.md#claim-finite-low-transversal-thresholds),
at the exact accepted hash recorded above.

Conclusion: `q>=3`, improving the size-six threshold from q>=2 to q>=3.

Proof. A is (4,5)-free and may contain I4; B is (5,4)-free. Because L
is a transversal, `H=A-L` is (4,4)-free on twelve vertices. Since A[L]
has no I5, Turan applied to its complement gives `e(A[L])>=2`: the
balanced four-part split of six has sizes2,2,1,1. The deletion identity gives

```text
e(H)=85-q-sum_(u in L)d_A(u)+e(A[L])
    >=85-q-6*7+2=45-q.
```

Claim01 gives `45-q<=42`, hence q>=3. No actual B endpoint is required
for L, and no I4 prohibition is transferred to A itself.

Search use: none; proposed rejection of a specified six-set low-degree
transversal hypothesis when q<=2. Reviews: [review](review_sos_order12_addendum_20261015_columns.md).

## Author audit and limits

The affine residual vector was checked by direct substitution in the six
allowed degree values, not by a graph/profile search. The zero-deficit case
forces degrees7,8 before solving their two linear count equations. The
triangle count is counted three times and its modulo-three obstruction is
kept separately from the independent-triple count. The threshold corollary
uses the twelve-vertex remainder only after the transversal hypothesis has
explicitly excluded I4 there.

This is an author self-check, not independent review or a formal certificate.
Neither claim closes an order43 branch or proves that a low-degree six-set
transversal occurs. The cap supplies a local filter across arbitrary x.
