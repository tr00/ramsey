# Independent review of forced-q0 closure consequences

Date: 2026-10-21. Reviewer: subagent `cr10`; source author: Main.

Claim: [claim-closure-consequences-forced-q0](x136_closure_consequences.md#claim-closure-consequences-forced-q0), only.
Reviewed revision: worktree based on commit
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; exact source SHA-256
`3a7a2777728de0b10b9057f74a44ad908222c20c117d1a37ad623929fb358647`.
Outcome: **accepted**, relative to the recorded published premises and the
already independently reviewed x136 closure. Permitted mathematical use:
propagation at the same degree-18 root produced by an applicable argument.

## Exact dependency snapshots

| Dependency read | SHA-256 |
| --- | --- |
| `frontier_band.md` | `4034a88807d5588943b3ad487574d35c8b23e11472ec0436f913b703e56db134` |
| `excess_bounds.md` | `2577e6eccf38b51fbb2d691d488d747302b4445fca31dbe344b64dd30af73c97` |
| `pivot_classes.md` | `ab0849cf011c8b830eb5ded2a67d9439776caf7535c19bcf6ef79280cd61081c` |
| `x136/frontier_exclusion_handoff.md` | `a199142f594183660037639eddeeeb4ebffe331afcb92e00f0fa796384e9a127` |
| `x136/review_frontier_exclusion_handoff_20261019_main.md` | `fc3583f0ef92956752e4b24a065620473cef966d56c1058ff3f0f999fdd8c9fb` |
| `../../../docs/mathematical_baseline.md` | `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` |

The closure review identifies historical reviewed source hash
`c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb`
at commit `904f46e`, merged at `a0d4746`. The current presentation preserves
the acceptance and rooted scope. This review uses that accepted theorem as a
premise; it does not independently recertify its complete dependency chain.

## Independent checks and findings

For a degree-18 root, summing degrees over its 18 neighbors gives
`324+E_v=18+2e(A)+x`, hence `x=306-2e(A)+E_v`.
At `q=0`, therefore, `e(A)=85` and `x=136+E_v`. The degree floor follows
from `R(4,5)=25`: the nonneighborhood is K5/I4-free, so has at most 24
vertices; thus every global degree is at least 18. All summands of `E_v`
are consequently nonnegative integers. The accepted exclusion of `x=136`
then forces `E_v>=1`, so some neighbor of this very root has global degree
at least 19, and `x>=137`. This rederives precisely part (c) needed here.
No inference concerning root independence of `b=e(M(v))` is needed.
The flagged graph-invariant assertion in root-profiles part (d) cannot
invalidate this separate part-(c) derivation.

I also checked the concrete unavoidable-family premise independently rather
than relying on the internal audit of `excess_bounds.md`. The recorded
published 18-vertex neighborhood maximum gives `q_v>=0`. Counting all
edges at a root gives `e(G)=18+e(A)+x+b_v`; substituting the degree-sum
identity and `e(G)=387+W/2` yields
`b_v=148+W/2-q_v-E_v`. The recorded published 24-vertex complement
minimum `b_v>=144` therefore yields `q_v+E_v<=W/2+4`.

For each of the three profiles, assume every degree-18 root has `q_v>=1`.
Then `E_v<=W/2+3`. Each higher-degree vertex has excess at most six by
the other side of `R(4,5)=25`; a root with `m` neighbors among the `h`
higher-degree vertices thus has `E_v>=W-6(h-m)`. With `W=6h-4`,
`m>=h/2+1` would force `E_v>=3h+2`, exceeding the upper bound `3h+1`.
Consequently `m<=h/2` at every root. The P-H cut has at most
`(43-h)h/2` edges but at least `18h+W-2floor(3h^2/8)` edges, by degree
summation over H and Turan's K5-free bound on G[H]. Direct substitutions
give respectively `42>41`, `80>78`, and `114>111` for `(h,W)=(2,8),
(4,20),(6,32)`. These contradictions force a q0 root, which the preceding
rootwise deduction makes adjacent to H. The count assumes neither I4-free
neighborhoods nor root-invariant b, and uses no special choice of root.

## Limits

Published `R(4,5)=25`, the 18-vertex maximum 85, and the complemented
24-vertex minimum 144 remain external premises; their catalogues or
certificates were not recertified. The internal excess-bound note is not
promoted wholesale: only the section-4 premise needed for this claim was
independently rederived here. Other claims in the source, including the
root-profiles part-(d) assertion, are outside this review. No existence,
global q-positive bound, unavoidable degree-18 root in arbitrary candidates,
or determination of R(5,5) follows. No solver, prover, canonicalizer,
download, graph search, or novelty review was performed.
