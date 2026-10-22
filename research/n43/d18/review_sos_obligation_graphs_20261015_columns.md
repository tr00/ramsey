# Independent audit: rational SOS for dispersed attachment obligations

Claim(s): `sos_obligation_graphs.md#claim-sos-obligation-general`,
`#claim-sos-obligation-wagner`, and `#claim-sos-obligation-eight-leaves`.

Author and reviewer: Codex coordinator; independent reviewer
`/root/sos_columns` (distinct agent).

Reviewed revision: base HEAD `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`,
exact uncommitted source SHA-256
`378cc12352d4c1fa208d12dc6c8f4640d17b6a4a28dec976399e6a9de4a24d68`.

Dependencies reviewed: source definitions, accepted star-cover construction
in `cell_obligation_cuts.md#claim-cell-star-cover-cut`, and cell types in
`anchored_cell_averaging.md`. The local derivations were rechecked from
K5/I5 prohibitions, independently of their recorded acceptance labels.

Checks: assumptions, quantifiers, A/B types, witness permanence, Boolean
cover conversion, rational matrix positivity, centered quadratic identity,
capacity subtraction, comparison with matching cuts, and search-use limits.

Findings:

- U_P is I3-free because every independent triple joins the actual omitted
  independent A pair to give I5. Its center-nonneighbors form a clique of
  size at most four. T_Q is triangle-free because a triangle joins the
  containing actual A edge to give K5. No I4 prohibition is assigned to A.
- For every witnessed obligation, z_i+z_j>=1 and Boolean z imply
  t_i*t_j=0 for t_i=1-z_i. At most h selected z gives at least n-h
  independent t. Fractional z does not justify this product equality.
- The general affine SOS identity vanishes on all Boolean/edge equalities
  and supplies sum t<=U. The rejection comparison n-h>U is sound for
  every supplied rational U; integrality also permits alpha<=floor(U).
- The eight-vertex graph has exactly the eight cycle and four opposite
  edges and is cubic. The opposite-pair transform sends the cycle part
  to C on pair sums and to signed C (D) on pair differences. The opposite
  matching shifts these blocks by +1 and -1. Thus K+(5/2)I has exactly
  the displayed half-weighted ((7/2)I+C), ((3/2)I+D) blocks.
- Direct multiplication gives D^2=2I. Expanding the signed-block squares
  gives (1/3)(2I+3D+(9/4)I)+(1/12)I=(3/2)I+D. The other block expands
  as 2I+C+(3/2)I. Positive residual coefficients make both strictly
  positive definite. All coefficients are rational and require no solver.
- Independently, exact Python Fraction arithmetic on the displayed 4x4
  and 8x8 matrices verified D^2, the opposite-pair identity, and
  P^T M P=M-(11/16)J for P=I-J/8. This is formula checking only,
  with no graph enumeration, package installation, or solver.
- Hence on independent t the quadratic is (5/2)s-(11/16)s^2. Its
  nonnegativity gives s<=40/11<4 for positive s and handles s=0
  separately. Eight leaves with h<=4 require s>=4 and are rejected.
- Additional obligation edges can only reduce independent sets. A subset
  of eight leaves remains valid when other leaves exist, provided their
  already consumed capacities were soundly included. No universal
  occurrence is inferred.
- Summing eight unit fractional-matching capacities gives total<=4;
  uniform edge weight1/3 attains4. Half-valued z satisfies the LP cover
  clauses and capacity4. Thus the asserted separation from the existing
  fractional-matching test is exact.

Outcome: **accepted** for all three claims at the stated exact hash.

Permitted use: conditional propagation/rejection of a specified actual
or permanently witnessed partial star for any x, retaining every leaf,
anchor, pair decision and sound remaining capacity. The certificate is
the displayed rational identity and its witness data.

Limits: no novelty review, runtime claim, formal checker, unavoidable-pattern
theorem, graph construction, or branch closure. Acceptance is independent
mathematical audit, not a certified order-43 exhaustion. Future source proof
changes require renewed review.
