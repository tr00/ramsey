# Independent audit of the prescribed-family overlap claims

Date: 2026-10-15. Task: `audit-pending-20261015`.

Claim(s): `family_overlap.md#claim-family-overlap-01` through
`family_overlap.md#claim-family-overlap-04`.

Author and reviewer: overlap-author agent; independent
`/root/audit_family_overlap` agent. The reviewer rederived the arguments
before consulting the earlier source theorem; the author's self-check and
any concurrent review are not treated as independent evidence for this audit.

Reviewed revision: repository HEAD
`b12925f7a96d24e18d06b0237930a32e30660ca2`, with exact uncommitted source
SHA-256:

```text
ccc995bf68e3d6b2db994e9ebd358a0a91926209100dfd951476ae5d955207a1  docs/general_theorems/family_overlap.md
```

Dependencies reviewed: the four source claims are audited below directly.
The specialized numerical statements assume the classical upper bounds
`R(3,3)<=6`, `R(3,4)<=9`, and `R(3,5)<=14`. Their lower bounds are
unnecessary. Those literature premises were not independently proved or
certificate-replayed here. For a completely specified input to the component
formula one may also take `rho_1=3`, using the elementary `R(3,2)=3`.
The source theorem was consulted for comparison at:

```text
e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a  n43/d18/dense_pivot_coverage.md
e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e  docs/mathematical_baseline.md
51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2  docs/workflow.md
```

No census, minimum-degree theorem, solver, graph enumeration, download,
installation, or formal checker was used. All calculations below are
mathematical counts.

## Claim 01: equality, the exceptional four-clique, and the anchor

Outcome: **accepted** on the exact stated hypotheses.

For a family triangle `u,v,w`, put `S=N(u) intersect N(v)` and
`T=N(u) intersect N(w)`. Both are subsets of the open neighborhood `N(u)`;
their intersection is exactly the common-neighbor set of the triangle.
An edge in that intersection would create a `K5`, so its independence and
the ambient `I_s` prohibition give `|S intersect T|<=s-1=k`. Thus

```text
2L <= |S|+|T| = |S union T|+|S intersect T| <= d+k = 2L.
```

Equality forces `|S|=|T|=L`, intersection size `k`, and union `N(u)`.
The same argument at the other two triangle vertices handles all three
codegrees. If an ambient vertex has precisely one triangle neighbor, it
belongs to that neighbor's open neighborhood but to neither of the two
codegree sets, contradicting the union equality. This establishes the
ambient attachment statement and therefore induced-paw-freeness in `G[F]`.
No prohibition of `I_k` in arbitrary ambient neighborhoods is inferred.

For a family `K4`, every edge lies in a family triangle, so all six
codegrees are `L`. An outside vertex has at most three neighbors in the
four-clique. One neighbor violates the attachment statement on a triangle
containing it; two neighbors violate that statement on the triangle
consisting of one met and the two missed vertices. Thus its attachment
size is zero or three. The cut count is `4(d-3)`, whereas the sum of
external common-neighbor counts over the six edges is `6(L-2)`.
Attachments of size three contribute three to both sums. Equating them
gives `4d-12=6L-12`, hence `2d=3L`. Substitution into
`2L=d+k` gives exactly `d=3k`, without another possible equality case.

The exception is real as a structural limitation: a complete four-partite
graph with each part of size `k` is `(5,k+1)`-free, has degree `3k` and
edge codegree `2k`, and contains a four-clique. This is a symbolic family
checking the necessity of the exception; it is not an order-43 witness or
an assertion that it satisfies the strict anchor hypothesis.

For the anchor, an independent `k`-set `I` is required to lie in
`N(v) intersect F`. Every vertex of `M(v)` has a nonempty `I`-signature:
otherwise it extends `I` to an ambient `I_(k+1)`. Each singleton class is
a clique, since two nonadjacent members and `I` with its singleton element
removed form an `I_(k+1)`. Four members and the singleton element form a
`K5`, so each such class has size at most three. With `b` signatures and
at most `3k` singletons, the incidence lower bound is
`b+max(0,b-3k)`. This also covers `b<3k` and `b=0` correctly.

For each `i in I`, the partition `{v},N(v),M(v)` gives
`d=1+lambda_vi+|N(i) intersect M(v)|`. Equal ambient degrees are justified
by membership in `F`, not by membership in `N(v)` alone. Summing gives
the source identity and contradicts `lambda_vi>=L` precisely when
`A>k(d-1-L)`. The source retains this strict inequality; equality does
not yield a contradiction by the displayed argument.

## Claim 02: the component bound

Outcome: **accepted**, conditional on the supplied Ramsey upper bounds.

The complete-multipartite argument was checked independently rather than
importing a paw-free classification. For a maximal induced complete
multipartite subgraph `K` with at least three parts and an outside vertex
`z` meeting it, a triangle through any met vertex forces `z` to meet a
second part. If its adjacency is mixed within a part, a neighbor in a
different part is available because at least two parts are met. Together
with the met vertex, that neighbor makes a triangle to which the missed
same-part vertex has exactly one adjacency. This is the forbidden paw.
Adjacency is therefore uniform within every part. Missing two parts now
makes a paw with representatives of those parts and a met part. Hence
`z` can be added to its sole missed part or as a new singleton part,
contradicting maximality. Connectedness supplies such an outside adjacent
vertex if the component is larger than `K`. A triangle-containing component
is therefore complete multipartite; `K4`-freeness makes it exactly
three-partite, of order at most three times its independence number.

For a triangle-free component of independence number `a`, every
neighborhood is independent. The local independence hypothesis gives
maximum degree at most `k-1`, so selecting independent vertices greedily
removes at most `k` vertices at each step and proves order at most `ka`.
The Ramsey premise gives order at most `rho_a-1`. Nonneighbors of any
vertex have independence number at most `a-1`, because adjoining that
vertex would otherwise exceed `a`. They are still triangle-free and have
order at most `rho_(a-1)-1`; counting the vertex, its neighbors and its
nonneighbors gives order at most `rho_(a-1)+k-1`. These are exactly the
three entries in `B_k(a)` for `a>=2`. When `a=1`, completeness and
triangle-freeness give order at most two, including singleton components.

Every nonempty component has a positive integer independence number;
these add across components and sum to at most `k`. This verifies the
finite partition bound, including the empty-graph case. No assumption that
the supplied `rho_a` are exact, minimal or monotone enters the proof.

## Claim 03: the equality-threshold family theorem

Outcome: **accepted**, conditional only on Claims 01--02 and their
explicit Ramsey premises.

The contradiction quantifies over every edge of the same prescribed
`G[F]`: absence of an edge of codegree at most `L-1` means all its edges
have integer codegree at least `L`. Empty edge sets are included; the
ambient independence bound still applies. Claim 01 gives all the local
hypotheses of Claim 02, with `alpha(G[F])<=k` supplied by the ambient
`I_(k+1)` prohibition. Thus a family larger than `H_k` contradicts that
component theorem. The condition `d!=3k` is exactly the required exclusion
of the four-clique equality case.

For `k=4`, use `rho_1=3,rho_2=6,rho_3=9,rho_4=14`.
The triangle-free component bounds are at most `2,5,8,12` for
`a=1,2,3,4`. Consequently `T_4(a)=3a`, and maximizing over sums of
independence numbers at most four gives exactly `H_4=12`.
Even `d` gives integer `L=(d+4)/2`; substitution gives
`4(d-1-L)=2d-12` and low-overlap bound `L-1=(d+2)/2`.
The sufficient range `n>=2d+2` gives `b>=d+1` and
`2b-12>=2d-10>2d-12` as claimed. At `d=18`, `n>=38`
gives `b>=19`, hence `A>=26>24`. At `n=43` the exact quantities are
`b=24,A=36,L=11` and right-hand anchor bound `24`.

The theorem selects both endpoints from the prescribed family itself.
It therefore permits conditions shared by all members to be carried to
the same edge; it does not splice two separate existence guarantees.

## Claim 04: strict triangle exclusion and odd degrees

Outcome: **accepted**, conditional on the stated Ramsey premises for
the sharper numerical specialization.

If all family edge codegrees are at least `L` and `2L>d+k`, the same
triangle union calculation gives an immediate contradiction to a family
triangle. No equality conclusion or paw-free classification is required.
The independent-neighbor anchor count remains valid with this changed
threshold and again forbids an independent `k`-set within a family
neighborhood. Since the family graph is triangle-free, each such
neighborhood is independent and has order at most `k-1`. The greedy
bound gives `|F|<=k alpha(G[F])<=k^2`.

The bounds `B_k(a)` audited in Claim 02 use only triangle-freeness,
the local degree restriction and Ramsey premises; they therefore apply
componentwise in this strict case. Additivity yields the asserted
`H_k^triangle` bound. With `k=4`, all four bounds `2,5,8,12` are at most
`3a`, so family size thirteen suffices.

With `L=ceil((d+4)/2)`, even degrees obey the equality threshold and odd
degrees obey `2L=d+5>d+4`. The combination uses the applicable proof for
each parity. Direct substitution in the order-43 rows gives

```text
d=18: b=24, A=36, L=11, 4(d-1-L)=24, codegree<=10
d=19: b=23, A=34, L=12, 4(d-1-L)=24, codegree<=11
d=20: b=22, A=32, L=12, 4(d-1-L)=28, codegree<=11
d=21: b=21, A=30, L=13, 4(d-1-L)=28, codegree<=12
```

Every anchor inequality is strict. Every row requires thirteen actual
members of that same degree family; no census of such vertices is proved.

## Search use, limits, and handoff

All four exact-revision claims may support propagation or branching under
their recorded hypotheses and Ramsey premises after coordinator integration.
They are existence-coverage results for retained two-root families. A future
exhaustion must still cover every permitted codegree, overlap map and
completion. No claim supplies a complete graph nonexistence certificate,
family census, novelty determination, or decision of `R(5,5)`.

No unsupported inference requiring withdrawal was found in these four
claims. The restrictions on the equality threshold, exceptional `d=3k`,
strict anchor inequality, equal degrees within the prescribed family, and
explicit general-`k` component bounds are essential and must be retained.
This review changes no source proof or shared index. Any substantive proof
change requires a fresh exact-revision audit.
