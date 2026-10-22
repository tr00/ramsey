# Independent review of the zero-excess q=1 core

Claim: [research.json](research.json), `claim-cw0-q1-core` only.
Author: Main. Reviewer: `/root/claim_review_27` (distinct agent), 2026-10-21.
Outcome: **accepted**, subject to the recorded dependency premises below.

Reviewed revision: HEAD `3eebcca5e627fdc3df5f26fd2a1925a7c121153f`;
exact working source SHA-256
`88c31770ed2011a82248902ad14f7572bfaaf4b08202fa58c97ed3b89c5661a1`.

Dependencies inspected (exact working-file SHA-256):

| File / relevant claim | SHA-256 |
| --- | --- |
| `research.json`, `claim-cw0-anchor-defect-transport` | `88c31770ed2011a82248902ad14f7572bfaaf4b08202fa58c97ed3b89c5661a1` |
| `../../sos_finite_moments.md`, `claim-finite-q1-anchor` | `cc4a8d4b3850122d37ad871d4a41f3f8275dbe0e71a5343258bdb209919b3404` |
| `../../obstruction_coverage.md`, `claim-coverage-root-cell-types` | `7f5e7da7b5ee9d5dbf7ee505ee44f69778a83c70dd1762f28d35fef336f1c2a7` |
| `../../review_sos_finite_moments_20261015_columns.md` | `64bf4cbe9801978f208add2efce1d9a35f492cd31003a639172e8527970df6db` |
| `../../review_obstruction_coverage_20261017_audit.md` | `299c80cebe6e5dc437592131bb48db590db0a5242a96ad657a3218222d1e0eb6` |

The anchor review accepts its original source hash
`87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`;
the cell review accepts original source hash
`86a940a7871f5196bc8a51590ef9d60bbc2479c4a1194dff420b127bb14d4874`.
The current dependency notes identify the preserved reviewed bodies; their
present hashes above do not replace that historical provenance. Anchor
existence is used as an accepted dependency, rather than recertifying its
small-Ramsey/census and transversal premises.

Decisive independent checks:

- Rechecked the needed defect argument directly. Every external signature
  against an independent four is nonempty. Each global exact singleton
  class is a clique of size at most three (I5 and K5 extensions respectively).
  With all four roots of global degree 18, the 24 B vertices have
  `68-s` incidences. Thus `32-s=12-b1+b3+2*b4>=0`, and combining the
  global singleton cap with this identity gives
  `a1+b3+2*b4<=32-s`. The accepted anchor theorem applies at `q=1,E_A=0`,
  so `s>=32`; equality forces all four internal degrees to be eight,
  `a1=b3=b4=0`, and `b1=12`. Saturation gives three vertices in each
  B singleton class, and degree nine into B gives six double occurrences
  at each anchor root. This audit of the dependency's needed reasoning
  does not assign a separate outcome to that claim.
- Independently solving the two A-I incidence equations gives
  `a2=10+t`, `a3=4-2t`, `a4=t`, with `t=0,1,2`, hence precisely the
  three stated profiles. No empty signatures occur; absence of singleton
  signatures proves 2-domination. Since I is independent, deleting it
  removes exactly 32 edges, leaving `84-32=52`.
- The pivot contributes one additional all-four signature outside I.
  The six global overlaps sum to
  `(22+t)+3(4-2t)+6(1+t)=40+t`. If all overlaps are at least seven,
  their sum is at least 42, forcing `t=2` and all six overlaps exactly
  seven. Otherwise a pair has overlap at most six. Two eight-element
  neighborhoods inside the same 14-element A-I have intersection at
  least two; adding the pivot gives global overlap at least three.
  Thus the alternatives are disjoint and exhaustive for any chosen
  degree-eight anchor supplied by the theorem.
- For a nonadjacent degree-18 pair with overlap lambda, the opposite
  mixed cells have order `18-lambda`. A K4 in either cell extends with
  its adjacent root; an I4 extends with the opposite root. Thus they
  are actual (4,4)-free cells of orders 12 through 15 when lambda is
  three through six. No I4 prohibition is transferred to A itself.
  The exceptional case forces two all-four vertices in A-I, no triples,
  and three global all-four vertices including v; subtracting their
  contribution from each overlap seven leaves four exact double
  vertices per pair, as required for the next claim's allocation setup.

Findings: no gap found in the target claim's anchor application, integer
profiles, overlap dichotomy, ambient types, or quantifiers. Its reference
to the next claim is supported at the allocation setup level; the separate
five-allocation classification is outside this review's assigned outcome.
The theorem is available for structural propagation or branching in the
specified q=1 slice, retaining all completions and both alternatives.

Limits: C136 is the user's reported closure of the whole x=136 case with
proof pending checkout integration; **this target claim does not use it**.
No closure of q=1, q>=2, or the connected zero-excess branch follows.
No graph realizability search, solver, prover, canonicalizer, download,
formal certificate check, novelty assessment, or recertification of the
anchor theorem's external premises was performed.
