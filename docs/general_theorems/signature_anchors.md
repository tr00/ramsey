# Cross signatures and weighted homogeneous anchors

Integration status (2026-10-15): every claim below is independently accepted
on its stated premises. The author-stage “ready” labels are preserved to
keep the exact reviewed proof text unchanged. See the
[independent review](review_signature_anchors_20261015_overlap.md)
and [integration manifest](integration_manifest.json).

Date: 2026-10-15. Author: `augmentation_author`. Purely mathematical
parameterization of [four-bit anchors](../../research/n43/reductions.md), section 6,
and [frontier anchor defects](../../research/n43/d18/frontier_band.md).
No computation, installation, download, or novelty review was performed.
All claims are ready for independent review, not yet accepted.

## Setting

Let `p,q>=3` and let `G` be a simple graph containing neither `K_p` nor
`I_q`. Fix a vertex `v`, and write

```text
A=N_G(v), B=V(G) minus (A union {v}), a=|A|, b=|B|,
C_y=N_G(y) intersect A for y in B.
```

Then `G[A]` is `(p-1,q)`-free and `G[B]` is `(p,q-1)`-free. The notation
`(i,j)`-free means no `K_i` and no `I_j`. Use `R(1,j)=R(i,1)=1` for
the boundary cases below. All cross columns are actual columns of one
graph; repeated columns are allowed.

<a id="claim-signature-anchors-01"></a>
## 1. Exact mixed homogeneous-set criterion

Claim ID: `docs/general_theorems/signature_anchors.md#claim-signature-anchors-01`

Kind: local-deduction. Review state: accepted.

Scope: every graph in the setting, or conversely a proposed pair of
internal graphs of the stated ambient types with proposed cross columns.
Dependencies: definitions only.

Conclusion: Besides those two internal graph types, the exact remaining
conditions for the assembled rooted graph to be `(p,q)`-free are:

```text
For every clique Q subset B of size t, 1<=t<=p-1:
  A[intersection_(y in Q) C_y] contains no K_(p-t).
For every independent Q subset B of size t, 1<=t<=q-1:
  A[A minus union_(y in Q) C_y] contains no I_(q-t).
```

In the second line `A[D]` denotes the subgraph induced by `D`, rather than
a new vertex set; in the first line the same convention applies.

Proof: A forbidden homogeneous set avoiding `v` either lies in one side
or splits into homogeneous sets in `A` and `B`. For a clique its two
parts must be completely joined, which is exactly containment of its
`A` part in the indicated column intersection. For an independent set
its parts must be completely anticomplete, which is exactly containment
of its `A` part outside the indicated union. These implications are
reversible. A forbidden clique containing `v` would require a `K_(p-1)`
in `A`; a forbidden independent set containing `v` would require an
`I_(q-1)` in `B`. The stated ambient types exclude both. Thus all cases
are covered, including the endpoint `p-t=1` or `q-t=1` that forces an
empty intersection or empty uncovered set.

Search use: propagate; complete mixed-set checking with the full family
of homogeneous `Q` sets. Reviews: [review](review_audit_pending_signature_anchors_20261015.md).

<a id="claim-signature-anchors-02"></a>
## 2. Numerical union and intersection consequences

Claim ID: `docs/general_theorems/signature_anchors.md#claim-signature-anchors-02`

Kind: local-deduction. Review state: accepted.

Scope: every actual clique or independent set `Q subset B`, with the
size ranges in claim 01. Dependencies: claim 01 and Ramsey definitions;
numerical applications need independently established Ramsey bounds.

Conclusion: For independent `Q` of size `t`,

```text
|union_(y in Q) C_y| >= a-R(p-1,q-t)+1.
```

For clique `Q` of size `t`,

```text
|intersection_(y in Q) C_y| <= R(p-t,q)-1.
```

Proof: The uncovered graph in the independent case is `(p-1,q-t)`-free,
using its inherited `K_(p-1)` prohibition and claim 01's independent-set
prohibition. It has at most `R(p-1,q-t)-1` vertices. The common-column
graph in the clique case is `(p-t,q)`-free, using claim 01's clique
prohibition and its inherited `I_q` prohibition. Apply the corresponding
Ramsey bound. Empty `Q` is deliberately excluded. A negative union lower
bound is merely redundant; one may combine it with zero.

These numerical consequences alone do not replace the induced-graph
conditions of claim 01. No `I_(q-1)` prohibition is imposed on `A`, and
no `K_(p-1)` prohibition is imposed on `B`.

Search use: propagate. Reviews: [review](review_audit_pending_signature_anchors_20261015.md).

<a id="claim-signature-anchors-03"></a>
## 3. Independent anchors: Hall, capacity, incidence, and exact defects

Claim ID: `docs/general_theorems/signature_anchors.md#claim-signature-anchors-03`

Kind: local-deduction. Review state: accepted.

Scope: any independent anchor `X subset A` of size `k=q-1`. Set
`S_y=C_y intersect X` for all `y in B`. Dependencies: claim 01 only.

Conclusion: Each `S_y` is nonempty. For every independent `Q subset B`,

```text
|union_(y in Q) S_y| >= |Q|.
```

In particular the family indexed by any independent `Q` has a system of
distinct representatives, since the same inequality holds for all its
subfamilies. For each `x in X`, at most `p-2` vertices have exact signature
`{x}`. Consequently, with `c=k(p-2)`,

```text
L_B = max(b,2b-c),
e(X,B) >= L_B.
```

Writing `n1=|{y:|S_y|=1}|` and
`h=sum_(y:|S_y|>=3)(|S_y|-2)`, the exact defect formulas are

```text
e(X,B)=2b-n1+h,
eta_X=e(X,B)-(2b-c)=c-n1+h>=0,
e(X,B)-b=(b-n1)+h>=0.
```

Equality `eta_X=0` occurs exactly when every singleton class has size
`p-2` and every other signature has size two; this requires `b>=c`.
If `b<c`, equality in the sharper bound `e(X,B)>=b` instead means all
signatures are singletons. At `b=c` both equality descriptions coincide.

Proof: An empty signature would extend `X` to an `I_q`. If an independent
`Q` of size `t` had union of size at most `t-1`, it could be combined with
at least `k-(t-1)=q-t` vertices of `X` outside that union to give an `I_q`.
Here `t<=q-2` because `B` has no `I_(q-1)`, so the counted anchor vertices
exist. This proof also applies to every subset of `Q`, giving Hall's
condition. It does not assert Hall for arbitrary, possibly adjacent, `Q`.

Two distinct vertices with signature `{x}` must be adjacent: otherwise
they and `X minus {x}` form an `I_q`. That signature class is a clique,
and it is completely joined to `x`, so it has size at most `p-2`. Thus
`n1<=c`. Counting contributions of signatures of size one, two, and at
least three proves the displayed identities. Nonnegativity gives the two
incidence bounds. Equality is read from the respective nonnegative terms.

Search use: propagate. Reviews: [review](review_audit_pending_signature_anchors_20261015.md).

<a id="claim-signature-anchors-04"></a>
## 4. Weighted anchors give degree and excess certificates

Claim ID: `docs/general_theorems/signature_anchors.md#claim-signature-anchors-04`

Kind: local-deduction. Review state: accepted.

Scope: any family `F` of independent `(q-1)`-anchors in `A`, with arbitrary
nonnegative real weights `w_X`. Define

```text
W=sum_(X in F) w_X,
l_z=sum_(X in F:z in X) w_X for z in A.
```

Fix any real degree reference `delta` and put
`epsilon_z=d_G(z)-delta`, `E_A=sum_(z in A) epsilon_z`.
Dependencies: claim 03 and exact rooted degree counts.

Conclusion: Without any covering or packing assumption,

```text
sum_(z in A) l_z epsilon_z
 >= W[L_B-k(delta-1)] + sum_(z in A) l_z d_A(z).
```

If also `0<=l_z<=1` and `epsilon_z>=0` for every `z in A`, then

```text
E_A >= W[L_B-k(delta-1)] + sum_z l_z d_A(z).
```

If an independently established internal-degree floor is `d_A(z)>=D`
for all vertices with positive load, this further gives

```text
E_A >= W[L_B-k(delta-1-D)].
```

Negative right sides give only redundant lower bounds. The exact
aggregate cross-edge identity is

```text
x=e(A,B)=a(delta-1)-2e(A)+E_A.
```

Together these formulas yield a lower bound on `x` with the same weights
and assumptions. No existence of a fractional perfect anchor cover is
asserted.

Proof: Each `z in A` is adjacent to `v`, giving
`d_B(z)=delta-1+epsilon_z-d_A(z)`. Summing over an anchor and applying
claim 03 yields
`sum_X epsilon_z >= L_B-k(delta-1)+sum_X d_A(z)`.
Multiply by `w_X` and sum. Reordering finite sums gives the load formula;
also `sum_z l_z=kW`. Under the packing and nonnegative-excess assumptions,
`sum_z l_z epsilon_z<=E_A`, proving the second inequality and then the
floor version. Summing the rooted degree identity over all of `A` proves
the aggregate identity independently. Arbitrary loads remain valid in
the first formula, but cannot be replaced by `E_A` without the stated
additional conditions. A family need not be disjoint or cover every
vertex; the zero-weight family is allowed.

Search use: propagate with explicit weights, loads, and degree premises.
Reviews: [review](review_audit_pending_signature_anchors_20261015.md).

<a id="claim-signature-anchors-05"></a>
## 5. Clean clique dual

Claim ID: `docs/general_theorems/signature_anchors.md#claim-signature-anchors-05`

Kind: local-deduction. Review state: accepted.

Scope: any clique `Y subset B` of size `p-1`, with missing signatures
`T_z=Y minus N_G(z)` for `z in A`. Dependencies: the elementary signature
argument of claim 03, rederived below with edges and nonedges exchanged.

Conclusion: All `T_z` are nonempty; for each clique `P subset A`,
`|union_(z in P) T_z|>=|P|`. Every exact singleton missing-signature class
has size at most `q-2`. Put `c'=(p-1)(q-2)`. Then

```text
e(A,Y) <= (p-1)a-max(a,2a-c')
        = min((p-2)a,(p-3)a+c').
```

If `m1` counts singleton missing signatures and
`h'=sum_(z:|T_z|>=3)(|T_z|-2)`, the exact identity is

```text
((p-3)a+c')-e(A,Y)=c'-m1+h'>=0.
```

Proof: An empty `T_z` would extend `Y` to a `K_p`. A clique `P` in `A`
of size `t` with missing-signature union of size at most `t-1` would be
completely joined to at least `p-t` vertices of `Y`, giving a `K_p`.
Here `t<=p-2` because `A` has no `K_(p-1)`. This also proves Hall for all
subsets of `P`. Two vertices of exact missing signature `{y}` must be
nonadjacent, because an edge between them and `Y minus {y}` would give
a `K_p`. That signature class is independent and anticomplete to `y`,
so it has at most `q-2` vertices. Every missing signature is nonempty,
and counting its incidences as in claim 03 gives at least
`max(a,2a-c')` missing incidences and defect `c'-m1+h'`. Finally
counting missing incidences gives
`e(A,Y)=(p-1)a-sum_z|T_z|`, proving both formulas. No claim is made
about Hall's condition for noncliques `P`.

Search use: propagate. Reviews: [review](review_audit_pending_signature_anchors_20261015.md).

<a id="claim-signature-anchors-06"></a>
## 6. `(5,5)` specialization across pivot degrees

Claim ID: `docs/general_theorems/signature_anchors.md#claim-signature-anchors-06`

Kind: local-deduction. Review state: accepted.

Scope: an order-43 `(5,5)`-free graph, any pivot of degree `d`; numerical
subcases `d=18` and `d=20`; independent four-anchors when they exist.
Dependencies: claims 01–05; `R(4,3)=9` and `R(3,5)=14` for the displayed
pair bounds; optional published/global degree floor 18 for excess uses.

Conclusion: `a=d`, `b=42-d`, `A` is `(4,5)`-free and `B` is `(5,4)`-free.
For nonadjacent `y,z in B`, `|C_y union C_z|>=d-8`; for adjacent `y,z`,
`|C_y intersect C_z|<=13`. If `X=I4 in A`,

```text
e(X,B)>=max(42-d,72-2d),
eta_X=e(X,B)-(72-2d)=12-n1+h>=0.
```

With degree reference `delta=18`,

```text
sum_(z in X) epsilon_z >= (72-2d)-68+sum_(z in X) d_A(z)
                         =4-2d+sum_(z in X) d_A(z).
```

For the concrete degrees 18 and 20 this yields respectively

```text
d=18: b=24; e(X,B)>=36; sum_X d_A <=32+sum_X epsilon;
d=20: b=22; e(X,B)>=32; sum_X d_A <=36+sum_X epsilon.
```

An arbitrary weighted packing of these anchors yields
`E_A>=sum_z l_z d_A(z)-(2d-4)W`, conditional on nonnegative excesses.
The corresponding exact cross-edge identity is `x=17d-2e(A)+E_A`.
For `Y=K4 in B`, the dual bound is

```text
e(A,Y)<=min(3d,2d+12),
d=18: e(A,Y)<=48;
d=20: e(A,Y)<=52.
```

Proof: Substitute `p=q=5`, `k=4`, `c=c'=12` in claims 02–05.
For `d=18,20`, `b>=12`, so the sharper independent-anchor lower bound
is `2b-12`. The general displayed excess inequality uses the valid
`2b-12` bound even for pivots where the `b` bound is stronger. None of
these identities assumes that the pivot is a minimum-degree vertex, nor
does a degree-20 pivot permit setting `delta=20` without an additional
nonnegative-excess premise. Likewise existence of independent four-anchors
must be separately justified; it is not a conclusion of the signature
count itself.

Search use: propagate with actual anchors and stated degree premises.
Reviews: [review](review_audit_pending_signature_anchors_20261015.md).

## Provenance and limits

Input revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`. SHA-256 read:

```text
492e4ce1fb5ea8e4f7292153f927089d632587eb734e4f8354ab61bdd5d6f29b  research/n43/reductions.md
0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54  research/n43/d18/frontier_band.md
e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a  research/n43/d18/dense_pivot_coverage.md
```

Author self-check: The exact criterion includes sets through `v` and
mixed sets avoiding it. The inherited forbidden types differ on the two
sides. Hall applies to all subsets of a homogeneous opposite-side family,
not to arbitrary families. Singleton capacity counts the extra anchor
vertex for the clique obstruction. The exact defect has separate small-
`b` and large-`b` equality cases. Weighted inequalities use actual loads
and invoke packing plus nonnegative excess only when passing to total
excess. Complementation swaps parameters and side roles. These are
self-checks only; independent review and novelty review remain outstanding.
No fractional perfect-cover existence, saturated-branch exclusion,
order-43 nonexistence certificate, or new Ramsey value follows here.
