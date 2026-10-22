# Arithmetic closure of the tau scheme

Branch name: `research/n43/d18/tau/closure`. Parent: [tau scheme](../../README.md).
State: claim ready, unreviewed.

Date: 2026-10-19. Task token: `tau-scaffold-20261019`.

<a id="claim-tau-closure-01"></a>

## 1. Cap identity and terminal contradiction

Claim ID: `research/n43/d18/tau/closure/README.md#claim-tau-closure-01`
Kind: local-deduction
Review state: ready
Scope: every rooted (G,v) in the d18 setting; no q premise; any x
Dependencies: every column is a `K4(F)`-transversal
([frontier band](../../frontier_band.md)); definitions (S1)-(S3) of the
[tau scheme](../../README.md); relocation
[claim](../symmetry.md#claim-tau-symmetry-01) for the rung implications
Conclusion: `24*tau_4<=x=e(A,B)`. Consequently `tau_4>=6` contradicts every
cell `x<=143`, and in general `tau_4<=floor(x/24)`; if every fixed-`T_m`
rung is refuted for `m=4,...,floor(x/24)`, then no feasible extension of
that B exists at that x.
Search use: terminate
Reviews: none

Proof. Each `C_y`, y in B, is a `K4(F)`-transversal, and `tau_4` is the
minimum transversal size, so `tau_4<=|C_y|` for all 24 columns. Summing,
`24*tau_4<=sum_y |C_y|=x`. If `tau_4>=6` then `x>=144`, excluding every
cell `x<=143`. Generally, put `M=floor(x/24)`, so `x<24*(M+1)`. If every
fixed-`T_m` rung is UNSAT for `m=4,...,M`, then by the relocation claim
and superset closure no transversal of size at most M exists, so
`tau_4>=M+1` and `x>=24*(M+1)`, a contradiction.

Audit: single summation of the per-column bound; definition of floor. The
run at x=137 needs only m=5 because `tau_4>=5` is already accepted there;
at `x=138..143` the rungs are m=4,5. Derived here, not independently
reviewed.

## Extension beyond x=143

The cap permits `tau_4=floor(x/24)`, so each further block of 24 cross
edges adds one required rung: x=144..167 needs t6, x=168..191 needs t6 and
t7, and so on up to the reviewed `x<=279`
([omitted-row bound](../../independent_row_cuts.md)), where at most rungs
through m=11 would be needed. Those rung folders are intentionally not
created; create them if and when the residual
[x-ge143](../../x-ge143/README.md) cells are attacked, with the same
predicate shape and the same relocation caveat.
