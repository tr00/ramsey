# Consequences of the reviewed x136 closure

Date: 2026-10-19. Task token: `x137-propagation-20261019`.
Author and self-auditor: Main. Purely mathematical deductions from the
independently reviewed [x136 closure](x136/frontier_exclusion_handoff.md);
no search, solver, catalogue, download, or novelty review was performed.
This note records which existing degree-18 claims strengthen under the new
bound `x>=137`, which do not, and the exact arithmetic. Its own claims are
`ready` with no independent review yet; see the dated
[report](../../reports/2026-10-19-x137-propagation.md) for the full
cross-comparison inventory.

## Setting

G is an order-43 K5/I5-free graph, v is a degree-18 root, A=N(v) of order
18, B=M(v) of order 24. As in [the frontier band](frontier_band.md), put

```text
q = 85 - e(A),   epsilon_z = d_G(z)-18,
E_v = sum_(z adjacent to v) epsilon_z,   x = e(A,B) = 136 + 2q + E_v.
```

All degrees are at least 18 (the non-neighborhood of any vertex is
K5/I4-free of order at most 24), so every epsilon is nonnegative.
W=sum over all 43 vertices of epsilon_z is the total excess.

## 1. Rootwise profile exclusion and its corollaries

<a id="claim-closure-consequences-root-profiles"></a>
Claim ID: `n43/d18/x136_closure_consequences.md#claim-closure-consequences-root-profiles`
Kind: local-deduction
Review state: ready
Scope: every order-43 K5/I5-free G and every degree-18 root v; no r, s, q,
or E profile assumed
Dependencies: [accepted closure](x136/frontier_exclusion_handoff.md#claim-frontier-handoff-exclusion)
with [its review](x136/review_frontier_exclusion_handoff_20261019_main.md);
the exact budget identity x=136+2q+E_v (frontier band); the recorded
degree floor 18 and the recorded band bound b>=144 (parts c and d only)
Conclusion: at every degree-18 root v,
(a) `2q + E_v >= 1`, equivalently `(q,E_v)!=(0,0)`, equivalently `x>=137`;
(b) `E_v = 0` implies `q >= 1` (an all-degree-18 neighborhood has at most
    84 edges);
(c) `q = 0` implies `E_v >= 1` and v has a neighbor of degree at least 19,
    with `x = 136 + E_v >= 137`;
(d) if W=0 (G is 18-regular), every root has `E_v=0` and `b = 148 - q`,
    so `q in {1,2,3,4}` is the same for all roots, `x in {138,140,142,144}`,
    and `b in {144,145,146,147}`; in particular no 18-regular candidate
    has b=148 at any root
Search use: propagate
Reviews: none

Proof. (a) The closure gives x>=137; substitute x=136+2q+E_v. Conversely
2q+E_v>=1 is exactly the negation of q=0 and E_v=0.
(b) E_v=0 with 2q+E_v>=1 gives 2q>=1, so integer q>=1.
(c) q=0 gives E_v>=1; some neighbor z of v has epsilon_z>=1, hence
d_G(z)>=19, and x=136+E_v>=137.
(d) W=0 and the degree floor 18 give d_G(z)=18 for all 43 vertices, so for
every root v both E_v=0 and E_B=0. The band identity
E_B = 2b - 296 + x with x=136+2q becomes 0 = 2b-296+136+2q, i.e.
b = 148 - q. The recorded band bound b>=144 gives q<=4; part (b) gives
q>=1. Since b is a graph invariant, q is the same at every root, and
x=136+2q takes exactly the four listed values. All arithmetic was
replayed exhaustively for q<=35 and the full epsilon range.

## 2. Floor sharpening for existing lower-bound conclusions

<a id="claim-closure-consequences-floors"></a>
Claim ID: `n43/d18/x136_closure_consequences.md#claim-closure-consequences-floors`
Kind: local-deduction
Review state: ready
Scope: the named accepted/recorded lower-bound conclusions below, in the
same setting; no other consumer is implied
Dependencies: claim 1 above; [weighted anchor certificate](weighted_averaging.md#claim-weighted-anchor-excess)
(accepted); [frontier lemma](../../docs/lemma_phase_2.md) and
[theory corridor](../../docs/theory_phase_1.md) floor derivations
Conclusion: every conclusion of the recorded form `x >= 136 + f` keeps its
original content and acquires the effective floor `x >= 137`. Explicitly:
(i) the weighted anchor certificate strengthens to
`x >= 136 + max(1, 2q + ceil(L(A)))` and
`E >= max(ceil(L(A)), 1-2q)`; it is strictly stronger than the accepted
statement exactly when `q=0` and `L(A)=0`, where it now yields `x>=137`
and `E>=1` instead of `x>=136` and `E>=0`;
(ii) the frontier-lemma block "x>=136; if x=136 then necessarily
a=85, all A degrees 18, 148<=b<=160" and the theory-phase corridor floor
`x>=306-2a>=136` both now carry floor 137; the equality-forcing list is a
profile that cannot occur (antecedent refuted), so the listed equalities
are never simultaneously available to a proof.
Search use: propagate
Reviews: none

Proof. Each named conclusion is a consequence of nonnegative q and E_v
together with x=136+2q+E_v; intersecting its truth set with the closure's
`2q+E_v>=1` from claim 1 raises the floor to 136+max(1, ...) pointwise.
For (i), E=x-136-2q >= max(1, 2q+ceil(L))-2q = max(1-2q, ceil(L)), which
for q=0 reads E>=max(1,ceil(L)) and for q>=1 is exactly the accepted
inequality (1-2q<=0). The improvement is strict exactly where the original
right-hand side equals 136, i.e. q=0 and ceil(L)=0.

## 3. Forced q=0 conclusions gain a forced higher-degree neighbor

<a id="claim-closure-consequences-forced-q0"></a>
Claim ID: `n43/d18/x136_closure_consequences.md#claim-closure-consequences-forced-q0`
Kind: local-deduction
Review state: ready
Scope: any existing argument that forces some degree-18 root to satisfy
q=0; concretely the unavoidable-family conclusion of
[excess bounds](excess_bounds.md) section 4 (that note is internally
audited, not independently reviewed, so this dependency is disclosed)
Dependencies: claim 1 part (c)
Conclusion: whenever an argument yields "some degree-18 root has q=0", the
conclusion strengthens to "some degree-18 root has q=0 and E_v>=1, hence
its 85-edge neighborhood contains a vertex of degree at least 19 and
x=136+E_v>=137". Concretely, for the profiles (h,W) in {(2,8),(4,20),(6,32)}
recorded in excess bounds section 4, the forced q=0 root is adjacent to at
least one of the higher-degree vertices.
Search use: propagate
Reviews: none

Proof. Claim 1 part (c), applied to the root the cited argument produces.

## Limits and non-strengthenings

- The closure does **not** give `q>=1` at every root: profiles with
  `(q,E_v)=(0,1)` (the live x137 cell) and `q>=1` with any E remain open.
  The conditional `Q=1` tables in [excess bounds](excess_bounds.md)
  sections 4-5 keep their hypothesis "every root has q>=1" and are **not**
  discharged by this note; do not promote `q>=1` or any global excess
  bound (same warning as in [obstruction coverage](obstruction_coverage.md)).
- Unchanged by the closure: all upper bounds (x<=279, the x142 caps, the
  dense-pivot x caps), the parity structure at even k>=2, the endpoint
  bounds b>=148 at k=1 and b>=144 globally, e(G)=387+W/2 with minimum 387,
  and the transversal ladder arithmetic 24*tau_4<=x for x<=143.
- The closure is rooted: nothing here asserts that a degree-18 root is
  unavoidable, or anything about roots of other degrees, or any value of
  R(5,5).
