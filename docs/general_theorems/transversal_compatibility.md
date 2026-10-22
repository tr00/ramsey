# Weighted avoidance and two-transversal incompatibility

Integration status (2026-10-15): every claim below is independently accepted
on its stated premises. The author-stage “ready” labels are preserved to
keep the exact reviewed proof text unchanged. See the
[independent review](review_transversal_compatibility_20261015_augmentation.md)
and [integration manifest](integration_manifest.json).

Date: 2026-10-15. Task token: `abstraction-20261015-transversal`.
Author: transversal compatibility agent. Base revision:
`b12925f7a96d24e18d06b0237930a32e30660ca2`.

These are theorem abstractions of the reviewed arguments in
[low-excess columns](../../research/n43/d18/x136/r2/low_excess_columns.md), especially
Claims 02, 04, and 06. No graph computation, installation, download, or
literature review was performed. No novelty is claimed. Numerical order-43
premises remain dependencies of the specialization, not premises of the
abstract family lemmas.

## Notation

All graphs are finite, simple, and undirected. For a graph H, let `I_k(H)`
be its family of independent k-sets. A transversal of a family F is a set
meeting every member of F; `tau(F)` is its minimum size. If F is empty,
`tau(F)=0`. For vertex weights w write `w(S)=sum_(v in S) w(v)`.
An independence statement concerns H itself, never a different ambient
neighborhood or antineighborhood.

<a id="claim-transversal-compatibility-01"></a>
## 1. Avoidance forces every small subset to occur

Claim ID: `docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-01`

Kind: local-deduction

Review state: accepted

Scope: any finite set V, family F of subsets of V, L subset V, and integer
`1<=t<=|L|`.

Dependencies: elementary set inclusion; no Ramsey premise.

Conclusion: Suppose every member I of F satisfies `|I intersect L|>=t`,
and, for every t-subset T of L, `L-T` is not a transversal of F. Then for
every such T there exists I in F with `I intersect L=T`. In particular,
if `F=I_k(H)` and `t>=2`, then L is independent. If additionally
`t>=2` and `alpha(H)<|L|`, the hypotheses are inconsistent.

Proof: For fixed T, nontransversality supplies I disjoint from L-T.
Thus `I intersect L` is a subset of T, while its size is at least t.
Since |T|=t it equals T. In the graph case every t-subset is independent,
being contained in some independent I. Every pair in L extends to a
t-subset because `2<=t<=|L|`, so every pair is nonadjacent. This proves
the conclusion. The assertion for t=1 is occurrence of each vertex; it
does not assert independence of L.

Search use: propagate; terminate only if the resulting independent L
exceeds the ambient independence bound and every hypothesis is certified.

Reviews: [review](review_audit_pending_transversals_20261015.md).

<a id="claim-transversal-compatibility-02"></a>
## 2. Weighted occupancy and low-weight exclusion supply the hypotheses

Claim ID: `docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-02`

Kind: local-deduction

Review state: accepted

Scope: a k-uniform family F on V, real vertex weights w, disjoint sets
P,L subset V, and integers `1<=t<=|L|`, `0<=j<=k`.

Dependencies: Claim 01 and weighted summation.

Conclusion: Assume every I in F has `w(I)<=B` and `|I intersect P|>=j`.
Assume weights on P are at least a, weights on L are at least m, and
weights on `V-(P union L)` are at least b, where `m<=b<=a`. If

```text
j*a + (t-1)*m + (k-j-t+1)*b > B,    j+t-1<=k,
```

then every I in F uses at least t vertices of L. Independently, suppose
every transversal of size `|L|-t` has weight at least Q, every vertex of
L has weight at most c, and `(|L|-t)*c<Q`. Then every L-T with |T|=t
fails as a transversal. These two sets of hypotheses imply Claim 01.
When `|L|=t`, the transversal condition includes the empty set explicitly.

Proof: If I has q<=t-1 vertices in L and p>=j in P, then

```text
w(I)>=p*a+q*m+(k-p-q)*b
     >=j*a+(t-1)*m+(k-j-t+1)*b.
```

The second inequality follows because replacing b by a cannot decrease
the expression, and replacing b by m cannot increase it. This contradicts
the weight cap. Every L-T has size |L|-t and weight at most
`(|L|-t)*c<Q`, so it cannot be a transversal with the specified weight
lower bound. Claim 01 applies. Nonnegative weights are not required.

Search use: propagate occupancy and nontransversality; subsequent
termination requires the independence bound in Claim 01.

Reviews: [review](review_audit_pending_transversals_20261015.md).

The low-weight exclusion may instead be vertexwise: if all transversals
of the specified size have every vertex of weight at least a and `c<a`,
then every nonempty L-T fails. This version is used below. Neither
version follows merely from a lower bound on the *size* of a transversal.

<a id="claim-transversal-compatibility-03"></a>
## 3. A degree-gap theorem excluding two disjoint transversals

Claim ID: `docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-03`

Kind: local-deduction

Review state: accepted

Scope: a graph H of order n and edge count e. Integer parameters
`s>=1`, `m<=c<M`, `a>c`, B, S, and a real edge upper bound F0 satisfy
the hypotheses below. Degrees always mean full degrees in H.

Dependencies: Claim 01; degree sums; induced-edge deletion identity.

Conclusion: No two disjoint s-set transversals of `I_4(H)` exist if all
of the following hold:

1. Every H degree lies in `[m,M]`; every independent four-set has degree
   sum at most B; `tau(I_4(H))>=s`.
2. Every s-set transversal has each vertex of degree at least a and
   total degree at most S.
3. Put `N=n-2s`, `P=B-2a`, `D=2e-2S`. Require `N>=s+3` and

   ```text
   3*a+m>B,
   P<=2*c+1,
   P-(c+1)<=m.
   ```

4. Every induced subgraph of H of order `n-s-1` having no independent
   four-set has at most F0 edges, and `e-(s+1)*m>F0`.
5. The total degree budget satisfies both strict gaps

   ```text
   D>(s+3)*c+(N-s-3)*M,
   D>(s+2)*c+(P-m)+(N-s-3)*M.
   ```

6. `alpha(H)<s+2`.

Proof: Suppose T1,T2 are disjoint s-set transversals and put
`U=V(H)-(T1 union T2)`, so |U|=N. Any independent four-set I meets both
T1 and T2. Three of its vertices in their union would give degree sum
at least `3*a+m>B`; four would also do so since `a>c>=m`. Consequently
I contains exactly one vertex in each T_i and two in U. The latter
pair has degree sum at most P. Put

```text
L={u in U:d_H(u)<=c}, ell=|L|.
```

Since degrees are integers and `P<=2*c+1`, the U pair meets L: otherwise
its sum is at least `2*c+2>P`. Thus L is a transversal. The tau bound
excludes ell<s, and the vertexwise s-transversal lower bound excludes
ell=s since `c<a`. Hence ell>=s+1.

If ell=s+1, for each u in L the s-set L-{u} is not a transversal.
An independent four-set avoiding it contains u as its only L vertex,
and its other U vertex has degree at least c+1. Hence
`d_H(u)<=P-(c+1)<=m`, and the lower degree bound gives `d_H(u)=m`.
This holds for every u in L. Since L meets every independent four-set,
H-L has no independent four-set and order n-s-1. The exact deletion
identity yields

```text
e(H-L)=e-sum_L d_H+e(H[L])>=e-(s+1)*m>F0,
```

contradicting Hypothesis 4. Thus ell>=s+2.

Disjointness and the total-degree upper bounds on T_i give
`sum_U d_H=2e-sum_(T1)d_H-sum_(T2)d_H>=D`. If ell>=s+3, then

```text
sum_U d_H<=ell*c+(N-ell)*M
          <=(s+3)*c+(N-s-3)*M<D,
```

using c<M. Therefore ell=s+2. If any independent four-set used a
U vertex outside L, its U pair, of sum at most P, would give that
outside vertex degree at most P-m. There are exactly N-s-2 outside
vertices, at least one by N>=s+3. Thus

```text
sum_U d_H<=(s+2)*c+(P-m)+(N-s-3)*M<D,
```

again impossible. Every independent four-set therefore uses two vertices
of L. For each pair T subset L, the set L-T has size s and all degrees
at most c<a, so it is not a transversal. Claim 01 with t=2 makes the
(s+2)-set L independent, contradicting Hypothesis 6.

Search use: propagate nonempty overlap between s-set transversals;
terminate a case that requires disjoint transversals. Every strict gap
and the induced-subgraph edge premise must be checked for that case.

Reviews: [review](review_audit_pending_transversals_20261015.md).

This is a sufficient theorem with intentionally explicit gaps. It does
not characterize all pairs of transversals. The induced-subgraph premise
concerns deletion of a transversal of size s+1; it places no independent
four-set prohibition on H itself.

<a id="claim-transversal-compatibility-04"></a>
## 4. Exact recovery of the frontier disjointness theorem

Claim ID: `docs/general_theorems/transversal_compatibility.md#claim-transversal-compatibility-04`

Kind: local-deduction

Review state: accepted

Scope: the full setting of
`research/n43/d18/x136/r2/low_excess_columns.md`, before imposing r=2. In particular
H=A is (4,5)-free on 18 vertices, e(H)=85, and the full actual-interface
anchor bound holds. The transversals need not be actual columns.

Dependencies: Claim 03;
[low-excess setting and Claim 01](../../research/n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-01);
[four-transversal bound](../../research/n43/d18/transversal_four.md);
the recorded literature value `R(3,4)=9`. Numerical census premises
underlying the degree/transversal facts are not recertified here.

Conclusion: Any two four-set transversals of independent four-sets in A
intersect. This recovers existing low-excess Claim 02.

Proof: Use the following parameters in Claim 03:

```text
n=18, e=85, s=4, m=6, M=13, a=9,
B=32, S=40, c=7, F0=52.
N=10, P=14, D=90.
```

The source setting establishes degrees 6..13, independent-four degree
cap 32, and tau>=4. Its Claim 01 gives the degree floor 9 and total
cap 40 on every four-set transversal. An induced 13-vertex subgraph
with no independent four-set is (4,4)-free because A is K4-free.
Its vertex neighborhoods are triangle-free and have no independent
four-set, so R(3,4)=9 bounds their sizes by eight. Handshake gives
at most `13*8/2=52` edges. The numerical checks are

```text
3*a+m=33>32,
P=14<=15=2*c+1,
P-(c+1)=6=m,
e-(s+1)*m=55>52,
(s+3)*c+(N-s-3)*M=49+39=88<90,
(s+2)*c+(P-m)+(N-s-3)*M=42+8+39=89<90.
```

Finally alpha(A)<=4<6=s+2. Every hypothesis of Claim 03 applies.

Search use: propagate intersection of the two transversals, on the
recorded frontier/interface premises. This does not close x=136.

Reviews: [review](review_audit_pending_transversals_20261015.md).

## Singleton overlaps and the limit of this abstraction

The final steps of the existing singleton-degree-eleven and
singleton-degree-ten proofs are also exact instances of Claim 01: their
prior case analysis produces a six-set L, every independent four-set
uses at least two L vertices, and every four-set L-T has degree at most
seven at each vertex and is excluded as a transversal by the degree-nine
floor. Every pair T is therefore independent, yielding I6. For degree
eleven, four-sets containing the overlap use three vertices of L; for
degree ten the preceding argument proves at least two. Either is enough.

The preliminary fact that L meets every independent four-set is weaker
and does not imply independence. Nor does a singleton overlap degree of
ten, by itself, imply the required occupancy. Those proofs additionally
use the full frontier degree cap, total degree sum, four-transversal
bounds, and degree-deficit/exception analysis. Claim 03 assumes disjoint
transversals and cannot be applied to a singleton overlap. No universal
degree-ten theorem or universal tau>=5 theorem is asserted here.

## Provenance and self-check

Source `research/n43/d18/x136/r2/low_excess_columns.md` was read at SHA-256
`e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff`.
Its existing independent reviews support the original numerical-premise
specialization; they do not constitute review of these new abstractions.

The author separately checked the t=1 limitation, the empty-transversal
case, integral cutoff c+1, exact disjointness in the degree-sum identity,
strict versus weak inequalities, and every numerical substitution above.
This is a self-check. Independent exact-hash review remains required.
