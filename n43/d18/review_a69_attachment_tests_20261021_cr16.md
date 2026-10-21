# Independent review: exact attachment and exchange tests

Date: 2026-10-21. Task/reviewer: `cr16`, independent subagent.

Claim: [claim-a69-attachment-tests](a69_decomposition.md#claim-a69-attachment-tests), and no other claim in that note.
Author: Main (source identifies author and self-auditor as Main, working alone).
Reviewer: `cr16`, distinct from the author.

Reviewed revision: uncommitted source at repository HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`;
SHA-256 of `n43/d18/a69_decomposition.md`:
`b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085`.

Dependencies checked: the forbidden-set decomposition is elementary and is
rederived below; no other numbered claim in the note is needed. Finite simple
graph and transversal conventions were checked in `docs/notation.md`, SHA-256
`92d91500274d60c69ebcf9c0033a7676ed934f87a68c0941d81f39991efe3081`.
The numerical corollaries use the external premise `R(4,3)=R(3,4)=9`, recorded
in the root `README.md` table, SHA-256
`c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0`.
The general baseline was inspected at `docs/mathematical_baseline.md`, SHA-256
`de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0`;
the root table supplies the explicit smaller Ramsey value. No census premise
or ambient order-43 degree premise is needed for this claim.

Decisive independent checks:

- For a forbidden clique, partition its vertices between `T` and `H`. With
  respectively one, two, or three vertices in `T`, those vertices must be a
  singleton, edge, or triangle; their common attachment must avoid respectively
  a triangle, edge, or vertex. Counts zero and four are covered by the core
  hypothesis and the explicit panel prohibition. This establishes both
  directions of the first three tests, without an edge-budget assumption.
- For a forbidden independent five-set, the cases with zero or one vertices
  in `T` are impossible because `H` has no `I4`. Counts two, three, and four
  require an independent panel set and respectively an independent triple,
  nonedge, or vertex in its common nonneighbor set `D_J`. Count five is exactly
  the panel prohibition. A clique condition includes empty and singleton
  remainders. This establishes necessity and sufficiency of the last three
  tests and covers every forbidden-set distribution.
- An edge's common attachment is independent inside an `I4`-free core, hence
  has at most three vertices. For an independent pair, `H[D_J]` has no `K4`
  and no `I3`, hence order at most eight by `R(4,3)=9`. For an independent
  triple, `H[D_J]` is a clique in a `K4`-free graph, hence order at most three.
  Subtracting these latter bounds from `h` gives the stated union bounds,
  including when their right sides are negative.
- `T` already meets every `I4` because `H` has none. Any smaller candidate
  transversal `S` decomposes uniquely as `(T-U) union D`, with
  `U=T-S` nonempty, `D=S intersect H`, and `|D|<|U|`. Every `I4` avoiding
  `S` has nonempty independent intersection `J` with `U`, of size at most
  four, and the remaining independent vertices lie in `H[D_J]` avoiding
  `D`. Conversely every such `J,K` yields an `I4` avoiding `S`. Therefore
  condition `(*)` is equivalent to absence of a smaller transversal. This
  reasoning also handles an empty panel, for which the quantifier is vacuous
  and the empty transversal is minimum.
- If `U` contains an `I4`, its corresponding remainder is the empty set,
  which is disjoint from every `D`; the exchange condition for that `U`
  holds automatically. For singleton `U`, only `D=empty` is allowed, giving
  precisely a private triple. For clique `U`, only singleton `J` contributes,
  so the union of the private-triple families has no hitting set smaller than
  `|U|`. For an edge pair this means no core vertex hits all triples in the
  union of the two endpoint families. It does not assert disjoint triples.

Findings: no mathematical gap or correction identified. Both equivalences
hold for any stated core/panel construction, independently of the 18-vertex
and 69-edge specialization. The last edge-pair sentence is read collectively
over the union of the endpoint triple families, as specified by its preceding
sentence.

Outcome: **accepted**, conditional on the stated external smaller Ramsey
premise for the numerical pair-union corollary. The exact tests and exchange
equivalence require no external Ramsey value.

Limits: this is an independent mathematical review, not formal verification.
No solver, prover, canonicalizer, download, or graph search was used. The
external Ramsey theorem was not recertified; novelty was not investigated.
No other claim, existence of attachment systems, ambient extension, or slice
closure is certified. Search use in the source remains `none pending
independent review`; the coordinator may integrate this claim-level review
before adopting the exact tests for attachment propagation or structural
branching.
