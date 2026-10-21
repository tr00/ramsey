# Independent review of the sharper degree-18 complement selector

Date: 2026-10-21. Reviewer: `claim_review_07` (`cr07`), independent of
the `symmetry-extensions-20261015` author.

Claim: [claim-d18-symmetry-extensions-03](symmetry_extensions.md#claim-d18-symmetry-extensions-03), only.

Reviewed revision: working-tree bytes at base commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; source SHA-256
`1f4115db83f8ac1b1f0f21a80213f9fef17076e3b43bfb3a76b3a76d06067497`.

Dependencies read (SHA-256 of current working-tree files):

| File | SHA-256 |
| --- | --- |
| `symmetry_reduction.md` | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| `../reductions.md` | `3bd4aa599896e88436e83241216638d51848c38ad580c768ba86b0b274f59ca2` |
| `frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `review_d18_symmetry_20261014_pivot.md` | `b272654e877d8e5cdd7d94174bdb1d9c3d93c5978afceb0c8fb4ab24bbff8754` |

The old symmetry Claim 06 and its historical review provide context; this
review rederives the budget and selector arguments directly and does not
depend on acceptance of pending Claims 01 or 02 in the extensions note.
The retained external premises are `R(4,5)=25`, the 18-vertex `(4,5)`
upper edge bound 85, and the 24-vertex `(4,5)` lower edge bound 116.
Their citations are recorded in reductions Section 15; census completeness
is not independently recertified here.

Decisive checks and findings:

- The graph types justify exactly these premises: `A` is `(4,5)`-free,
  while the complement of the 24-vertex `(5,4)`-free `B` is `(4,5)`-free.
  Thus `e(B)<=276-116=160`. No prohibition of `I4` in `A` is used.
- Independent degree summation gives `324+E=18+2e(A)+x`, hence
  `x=136+2q+E`. Also `e(G)=18+e(A)+x+e(B)` gives
  `W=2e(G)-774=2e(B)-296+2q+2E`. This is even and at most
  `24+2q+2E`. Nonnegative excess gives `z<=E`, with `0<=z<=18`.
- For a putative outer-count failure set `a=n18<=m=n24`.
  The root and its zero-excess neighbors give `a>=19-z`, so `m>=19-z`.
  Baseline excess is `43-a+5m>=43+4m`; parity raises the bound to
  `44+4m>=120-4z`. Comparison with the upper budget proves
  `q+E+2z>=48`, including the strict criterion by contraposition.
- At equality the upper budget is exactly `120-4z`. The lower bound forces
  `m=19-z`, and then `19-z<=a<=m` forces `a=m`. Baseline excess is
  `119-4z`; the unique remaining unit belongs to one of the other vertices.
  They consequently consist of one degree-20 vertex and `4+2z` degree-19
  vertices. This reproduces every displayed count, their sum 43, and
  `W=120-4z`; no alternative degree-21 through degree-23 count fits.
- Ascending sorted degree sequences compare paired counts starting with
  `n18-n24`. A positive value selects `D<D^c`; with the equality profile
  this pair ties and `n19-n23=4+2z>0` supplies the strict next comparison.
  This verifies the nonstrict hypothesis without incorrectly concluding
  strict outer-count inequality at its boundary.
- `q+3E=3k-5q`, and `q>=0`, show sufficiency through `k=16`.
  At `k=16`, equality of the weaker criterion requires `q=0,E=16`;
  an outer-count tie further requires `z=16`, yielding exactly
  `18^3,19^36,20^1,24^3`. The concentrated-excess numerical example
  also satisfies both displayed criterion values. These are necessary
  numerical profiles and do not assert realizability.

Outcome: **accepted**, as a conditional local deduction on the stated
global degree and census premises. Complement compatibility and degree-count
propagation are justified within that scope. No correction is required.

Limits: no published census, graph construction, catalogue coverage, solver
certificate, formal proof, or novelty claim was verified. No solver, prover,
canonicalizer, download, graph enumeration, or nontrivial search was used.
This result does not bound all possible `x`, select a unique root, implement
pruning, or close a Ramsey branch. Changing the reviewed proof or a retained
premise requires renewed review of the affected uses.
