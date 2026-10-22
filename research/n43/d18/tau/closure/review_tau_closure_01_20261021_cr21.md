# Independent review of tau arithmetic closure

Claim: [claim-tau-closure-01](README.md#claim-tau-closure-01).
Author: Main (`tau-scaffold-20261019`). Reviewer: independent subagent
`claim_review_21`, task token `cr21`, 2026-10-21.

Reviewed revision: worktree at HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256
`b2a0fee0cece17a0308607e545c28c77d1bfdfac1914779f55626918a211eab8`.
Hashes identify the current presentation, not the historical pre-cleanup bytes.

Dependencies checked (SHA-256 of exact worktree files):

| Source | SHA-256 |
| --- | --- |
| `research/n43/d18/README.md` | `414e3736238a87ea6715f725c9d46312d2caf97b285c27f535de91b5ecf76c66` |
| `research/n43/d18/frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `research/n43/d18/tau/README.md` | `1d68090879bc6009bdb69be8f0d58b211d6097472d88fdea888b9c34a5ce2ab7` |
| `research/n43/d18/tau/symmetry.md` | `204e4baa20aee79c08a4f1320fab292fbe981b87d4fe16be673564d2fa0b98f7` |
| `research/n43/d18/tau/t4/README.md` | `fe2eb8ee0300874a312c053f760442f280f60590217a442d69d4c35be8b04deb` |
| `research/n43/d18/tau/t5/README.md` | `eecb58e206073b782b73f3dcb209280b0228c1a5c3eb03e92ac3278e3442cf50` |

Checks and findings:

- Independently checked the column premise directly: an independent four-set
  of A missed by `N_A(y)` forms an independent five-set with y. This uses
  I5-freeness of G and permits I4 in A. There are exactly 24 y in B. Counting
  each A--B edge once by its B endpoint gives
  `x=sum_y |C_y|>=24*tau_4`, without a q, degree-excess, connectivity, or
  census premise. The empty hypergraph convention also causes no problem:
  its transversal minimum is zero.
- Since tau is an integer, the cap gives `tau_4<=floor(x/24)`. The boundary
  is exact arithmetically: `24*6=144`, so the contradiction covers 143 but
  does not cover 144. This establishes only a necessary condition.
- Rechecked the load-bearing relocation argument for the conditional rung
  conclusion: a permutation of all 18 A labels applied to both the internal
  graph and every cross column fixes B and v, preserves x and Ramsey
  constraints, and carries any size-m transversal onto the prescribed T_m.
  Any smaller transversal extends to size m when m<=18. Thus a refutation
  of the complete fixed-T_m predicate at the same B and x excludes all
  transversals of size at most m. Restrictions added to an actual instance
  must preserve this orbit coverage; this review checks the mathematical
  predicate, not an encoding.
- Coverage does not require a separate lower bound tau>=4: if
  `4<=M=floor(x/24)<=18`, any transversal of size below four extends to
  size four, and any size 4..M is covered by the stated rungs. The d18
  parent restricts feasible x to x>=137, hence M>=5; also the complete
  bipartite interface has at most `18*24=432` edges, hence M<=18. Thus the
  general clause's rung range is meaningful on every feasible d18 cell.
  Refuting rung M alone suffices, but retaining all rungs is sound.

Outcome: **accepted** for claim-tau-closure-01 at the recorded source hash,
as a mathematical cap and conditional per-fixed-B closure implication.
No repair to the claim is required. The symmetry reasoning needed here was
checked independently; this file does not separately change the review state
of claim-tau-symmetry-01.

Limits: no rung refutation, catalogue coverage, solver encoding, certificate,
or order-43 exclusion was checked or produced. `terminate` is justified only
when the specified complete rungs at the same B and x have certified
refutations and applicable relocation coverage. The contextual x137 shortcut
and x<=279 extension ceiling rely on existing separate reviews and are not
newly accepted by this claim review. No novelty audit, solver, prover,
canonicalizer, download, or graph search was used.
