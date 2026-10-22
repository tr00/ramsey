# Independent review of signature multiplicity and kernel bounds

Claim: [claim-d18-symmetry-extensions-01](symmetry_extensions.md#claim-d18-symmetry-extensions-01) only.

Author: Codex, task `symmetry-extensions-20261015`. Reviewer: independent
subagent `/root/claim_review_05`, token `cr05`, 2026-10-21.

Reviewed revision: working-tree bytes at HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; SHA-256 identifies the exact
uncommitted presentation read, rather than asserting it matches HEAD.

| Source or dependency read | SHA-256 |
| --- | --- |
| `research/n43/d18/symmetry_extensions.md` | `1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497` |
| `docs/general_theorems/signature_anchors.md`, Claim 01 | `6d2c64d09b5dc3096b4948eef68e3cdbaa8b8d03edc68b88a41dd9113995175f` |
| `research/n43/d18/symmetry_reduction.md`, Claim 01 kernel definition/count | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |

Outcome: **accepted**, on the stated classical Ramsey premises.

Decisive independent checks:

- Re-derived the homogeneous extensions directly. A clique in a repeated
  class is completely joined to any clique in C, and an independent set in
  that class is anticomplete to any independent set in U. The rooted ambient
  types give `omega_C<=p-2`, `alpha_U<=q-1`, and B has no `I_(q-1)`.
  Thus the two Ramsey parameters are valid, including empty C and empty U;
  parameter one forces the class to be empty. This also independently
  verifies applicability of signature-anchor Claim 01.
- For degree 18, `c<=4` gives `|U|>=14`, hence an I3 in U and forced
  adjacency within the class. Three occurrences then force C independent;
  B's K5 prohibition gives the upper bound four. For `c>=5`, C has an edge,
  so the class is triangle-free. Six occurrences would contain an I3,
  forcing U to be a clique and `c>=15`; B's I4 prohibition also ensures an
  edge among those occurrences, forcing C triangle-free and `c<=13`.
  The contradiction proves the universal bound five.
- With at least three occurrences and `c>=5`, triangle-freeness gives a
  nonedge, so U has no I3 and `|U|<=8` by `R(4,3)=9`: hence `c>=10`.
  If the class has an edge, C has no triangle and `c<=13`; now `|U|>=5`
  and A's K4 prohibition ensures U is not a clique, proving `alpha_U=2`.
  Also `omega_C=2`. If the class has no edge, B's I4 prohibition makes
  its size exactly three, and U is a clique of size at most three. The
  three listed cases are mutually exclusive and exhaustive.
- A five-vertex (3,3)-free graph has every degree exactly two: neighborhoods
  are independent and nonneighborhoods are cliques, each of size at most
  two. Simplicity and five vertices leave only C5.
- Checked the kernel interpretation separately: permutations preserving
  each actual signature form `product_C S_(m_C)`, irrespective of internal
  B edges. The stated kernel refers to the cross-matrix action; it need
  not be the automorphism group of a completed B graph. The factorial
  transfer argument strictly increases the product until the partition is
  `5+5+5+5+4`. Trivial Python integer arithmetic and a 25-entry recurrence
  over parts 1 through 5 independently gave maximum `4,976,640,000`;
  division of 24! gave `124,672,148,625,024` with remainder zero.

Findings: no mathematical gap found. None of the degree/census budgets,
frontier assumptions, or prohibition of I4 in A is used. The kernel count
is a universal bound and does not assert that its extremal partition is
realizable. Permitted use is multiplicity propagation and cross-matrix
kernel-size bounds under the actual rooted hypotheses.

Limits: classical upper bounds `R(3,3)<=6`, `R(3,4)<=9` (equivalently
`R(4,3)<=9`), and `R(3,5)<=14` are retained external premises; their
literature provenance was not independently audited. No solver, prover,
canonicalizer, download, catalogue processing, or graph search was used.
No novelty, implementation certification, or branch closure is certified.
Claims 02 and 03 in the source were not reviewed here.
