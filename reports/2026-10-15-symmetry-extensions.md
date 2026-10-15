# Symmetry extensions research handoff

Date: 2026-10-15. Task: symmetry-extensions-20261015. Author: Codex.
Input revision: `f98a1285b7adc9720a693ae3a54fba212a021bdf`.

The deliverables are seven mathematical claims in two new proof notes:

| File | Claim anchors | SHA-256 at handoff |
| --- | --- | --- |
| [General symmetry quotients](../docs/general_theorems/symmetry_quotients.md) | claim-symmetry-quotients-01 through -04 | `fa0bdb24eb7f746c81488d3eb56f37713122a926426e83888556ddc32edaa99f` |
| [Degree-18 extensions](../n43/d18/symmetry_extensions.md) | claim-d18-symmetry-extensions-01 through -03 | `1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497` |

All seven claims are **ready for independent review**, with author
self-checks only. None has been promoted to accepted, included in the
theory map, or authorized as an implemented pruning rule. Existing
accepted proofs are unchanged. The shared navigation is left to the
coordinator: the concurrent cells-20261015 task registered ownership
of those paths after this task started, and its work was preserved.

The principal improvements over the existing symmetry arguments are:

- The residual exact sequence splits by occurrence ranks, giving
  Gamma_M=K_M semidirect H_M and an exact composition formula for
  kernel and row-group minimization. This applies to arbitrary
  multiplicities and fixed rooted neighborhoods of any degree.
- For K_M=(C2)^p, exact least-edge-vector computation reduces to at
  most C(b,2) 2-CNF feasibility questions on p variables. Every edge
  bit depends on at most two swap indicators. The proof minimizes
  over all combinations; a concrete two-pair example passes each
  generator comparison while a combined swap strictly improves it.
  For x136..141 the accepted multiplicity bound supplies p<=12,
  b=24 and at most276 such questions. No algorithm was implemented.
- A partial assignment may be rejected by a witnessed lexicographic
  decrease that holds for every full extension. This preserves a
  common least-full-vector path even with arbitrary assigned domains,
  arbitrary branching orders and witnesses that do not preserve the
  assigned domain. All comparisons must use the same full order and
  invariant feasible family. This improves the earlier prefix-domain
  sufficient condition; it does not validate arbitrary local minima.
- Hierarchical minimization uses stabilizers of literal earlier data.
  A complete rooted code minimized over a nonempty invariant root
  family gives an exact unrooted code. Automorphic roots can tie;
  a scalar root key is not a complete code. Root/pair coverage and
  code implementation remain separate obligations.
- Actual homogeneous-set sizes of C and A minus C give
  m_C<=R(p-omega(C),min(q-1,q-alpha(A minus C)))-1 for general
  K_p/I_q rooted gluing. At degree18, every signature has at most
  five copies, with no frontier or census premise. The uniform
  factorial kernel cap is (5!)^4*4!=4,976,640,000. Repeated-column
  triples have three retained cases; five copies force their B
  graph to be C5. These are necessary constraints, not realizability.
- With z the actual number of positive-excess neighbors, q+E+2z<48
  forces n18>n24, while q+E+2z<=48 already forces D<lex D^c.
  The equality case has an explicit tied-outer-degree profile.
  Since z<=E, the previous strict 3k-5q<48 criterion extends to
  3k-5q<=48 for orientation, hence automatic compatibility through
  x152. At x152 an outer tie would have degrees 18^3,19^36,20^1,24^3.
  This does not bound x or imply existence of that profile.

The author separately checked the lift/factorization, the per-bit
two-variable dependence and feasibility induction, the first differing
coordinates in the generator counterexample, a common least-vector
path for arbitrary-domain pruning, the stabilizer fiber proof, both
homogeneous extension directions, the extremal factorial partition,
and the parity-forced complement equality case. These are self-checks,
not an independent review or a proof checker run.

An overstrong provisional statement that every signature occurring
three or more times must have size10..13 was withdrawn during that
self-audit. An independent triple instead permits a clique uncovered
set of size at most three; a small independent signature can have
three or four clique occurrences. The final proof has the complete
three-way disjunction and does not discard those alternatives.

The general group statements need no external numerical census. The
degree18 minimizer application inherits the accepted frontier bound;
the stronger complement criterion inherits degrees18..24 and
e(A)<=85,e(B)<=160. General multiplicity uses the established small
Ramsey numbers cited in its statement, including R(3,5)=14, but no
neighborhood edge census. Exact input hashes are in the proof notes.

Suggested integration: obtain distinct-author exact-hash reviews of
all seven claims, explicitly checking arbitrary-domain universal
quantifiers and the complement equality profile. After acceptance,
link the degree18 note from d18 navigation, the general note from
the general-theorem index, and update symmetry Section10 of the
reduction index with separate frontier/unrestricted assumptions.
Do not increment the existing accepted theorem count before review.

No graph search, enumeration, SAT solver, proof checker, theorem prover,
canonicalizer, download, installation, external catalogue replay,
literature novelty review or measured runtime experiment was performed.
No new Ramsey value or branch closure is asserted. No files were
staged or committed. Ownership of the two proof files and this report
is released at handoff; unrelated concurrent cell files are untouched.
