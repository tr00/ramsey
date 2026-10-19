# Deleting a clique transversal: edge budgets and stability

Integration status (2026-10-15): every claim below is independently accepted
on its stated premises. The author-stage “ready” labels are preserved to
keep the exact reviewed proof text unchanged. See the
[independent review](review_transversal_deletion_20261015_overlap.md)
and [integration manifest](integration_manifest.json).

Date: 2026-10-15. Author: `transversal_compatibility`.
Task token: `abstraction-20261015-transversal-deletion`.
Base revision: `b12925f7a96d24e18d06b0237930a32e30660ca2`.

This parameterizes the deletion proof in
[the four-transversal note](../../n43/d18/transversal_four.md) and its
[frontier-band extension](../../n43/d18/frontier_band.md). Purely
mathematical work; no computation, download, installation, or literature
review was performed. No novelty is claimed.

## Notation and external-input interface

Graphs are finite, simple, undirected. A clique transversal T meets every
K_r of F, equivalently F-T is K_r-free. Write `alpha(F)<s` for absence
of an independent s-set. Here `r>=2`, `s>=3`, `0<=t<=n` are integers,
and h=n-t. Let R be any proved finite Ramsey upper bound such that
every graph on R vertices contains K_r or I_(s-1); the exact Ramsey
number is unnecessary. Let L be any justified lower edge bound for
every h-vertex graph containing neither K_r nor I_s. Existence of such
an h-vertex graph is not presumed. Put

```text
b=max(0,h-R+1).
```

For integers t and s, partition t as evenly as possible into s-1 parts
`p_1,...,p_(s-1)` (sizes differ by at most one), and define

```text
a(t,s)=sum_i binom(p_i,2).
```

<a id="claim-transversal-deletion-01"></a>
## 1. General deletion lower bound

Claim ID: `docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-01`

Kind: local-deduction

Review state: accepted

Scope: every n-vertex F with alpha(F)<s, every t-set clique transversal
T of K_r, and proved R,L as above. F itself may contain K_r.

Dependencies: the explicit Ramsey bound R and edge lower bound L;
Turan's theorem in its balanced extremal form.

Conclusion:

```text
e(F)>=L+t*b+a(t,s).
```

Thus if `e(F)<L+t*b+a(t,s)`, F has no clique transversal of size at most
t. If the right-hand side is an integer, equivalently edge counts at
most that integer minus one exclude all such transversals.

Proof: Put H=F-T. Since T is a clique transversal, H has no K_r; since
alpha(F)<s, H has no I_s. Therefore e(H)>=L. For x in T, its set Z_x
of nonneighbors in H has no K_r because H is K_r-free. It has no
I_(s-1), since that set together with x would give I_s in F. The Ramsey
premise implies |Z_x|<=R-1, so

```text
d_H(x)=h-|Z_x|>=max(0,h-R+1)=b.
```

Summing gives e(T,H)>=t*b. Finally F[T] has no I_s, so its complement
is K_s-free. Turan's theorem bounds that complement's edges by the
balanced complete (s-1)-partite graph. Its missing edges, exactly the
edges of F[T], are at least a(t,s). Adding the three disjoint edge
counts proves the inequality. If a transversal has size less than t,
enlarge it arbitrarily to a t-set, which remains a transversal; the
same contradiction applies. This proves the size-at-most assertion
without assuming monotonicity of the displayed bound in t.

Search use: propagate a transversal size lower bound, or terminate a
case that explicitly requires size at most t, conditional on the
correct R,L inputs and the strict edge inequality.

Reviews: [review](review_audit_pending_transversals_20261015.md).

<a id="claim-transversal-deletion-02"></a>
## 2. Exact edge-defect identity and stability

Claim ID: `docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-02`

Kind: local-deduction

Review state: accepted

Scope: the setting of Claim 01 with a t-set transversal T, integer
lower bound L, and
`delta=e(F)-[L+t*b+a(t,s)]`.

Dependencies: Claim 01's component bounds and Turan equality case.

Conclusion: Delta is nonnegative and decomposes exactly as

```text
delta=[e(H)-L]+[e(F[T])-a(t,s)]
      +sum_(x in T)[d_H(x)-b],
```

with all terms nonnegative integers. Hence each of the displayed
component defects is at most delta. In particular e(H)<=L+delta,
e(F[T])<=a(t,s)+delta, and every attachment degree lies in
`[b,min(h,b+delta)]`. At most delta vertices of T have attachment
degree greater than b. If delta=0, all these component bounds are
equalities. Then F[T] is the union of s-1 disjoint cliques with balanced
part sizes (allowing empty parts). If b>0, equality also gives exactly
R-1 nonneighbors in H for every x in T.

Proof: Substitute
`e(F)=e(H)+e(F[T])+sum_T d_H(x)` into the definition of delta.
Claim 01 establishes the nonnegativity of every bracket. Their sum
therefore bounds each component; every positive integral attachment
defect contributes at least one. If delta=0 every component vanishes.
The induced T equality is precisely the complement of the balanced
Turan graph, by its equality characterization. When b>0 its definition
is h-R+1, so h-b=R-1; the claimed nonneighbor equality follows. If b=0,
equality instead asserts zero attachments, and does not imply R-1
nonneighbors unless h=R-1.

Search use: propagate exact component/attachment defect budgets; equality
structure can filter candidate transversals on all stated hypotheses.

Reviews: [review](review_audit_pending_transversals_20261015.md).

<a id="claim-transversal-deletion-03"></a>
## 3. The 18-vertex four-transversal threshold

Claim ID: `docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-03`

Kind: local-deduction

Review state: accepted

Scope: every 18-vertex F with alpha(F)<=3 and e(F)<=70.
For the pivot application F is the complement of A=N(v), where A is
(4,5)-free. The clique bound on F is not needed for this claim.

Dependencies: Claim 01; `R(4,3)=9`; the published lower bound 50 for
15-vertex (4,4)-free graphs recorded in
[transversal_four.md](../../n43/d18/transversal_four.md#published-input).
The census is not recertified here.

Conclusion: Every K4-transversal of F has size at least four.
Equivalently every independent-four transversal of complement F has
size at least four. This recovers the frontier proof and its q<=2
extension.

Proof: Set n=18,r=4,s=4,t=3,R=9,L=50. Then h=15,
b=15-9+1=7, and a(3,4)=0, giving the lower bound
`50+3*7=71` whenever a transversal of size at most three exists.
The hypothesis e(F)<=70 contradicts it. In the degree-18 setting
`e(F)=68+q`; q<=2 gives e(F)<=70. Complementation turns each K4
of F into an independent four-set of A. Actual cross columns are
transversals because a missed independent four-set together with
its B endpoint would form I5 in the ambient graph.

Search use: propagate size>=4 for independent-four transversals and
actual cross columns, on the recorded edge/census premises.

Reviews: [review](review_audit_pending_transversals_20261015.md).

<a id="claim-transversal-deletion-04"></a>
## 4. Why deleting four does not prove the desired stronger bound

Claim ID: `docs/general_theorems/transversal_deletion.md#claim-transversal-deletion-04`

Kind: local-deduction

Review state: accepted

Scope: 18-vertex F with alpha(F)<=3; a four-set K4-transversal T;
the recorded lower bound 41 for 14-vertex (4,4)-free graphs.

Dependencies: Claims 01--02; `R(4,3)=9`; the 14-vertex lower bound
recorded in [frontier_band.md](../../n43/d18/frontier_band.md),
section "Size-four columns". No external census recertification here.

Conclusion: Such a transversal forces e(F)>=66. At e(F)=68+q,
with integer q>=0, its exact deletion defect is 2+q. In particular
this theorem does not rule out a four-set transversal at e(F)=68.

Proof: Substitute n=18,r=s=4,t=4,R=9,L=41. Then h=14,
b=6, and the balanced three-part sizes 2,1,1 give a(4,4)=1.
Thus the lower bound is `41+24+1=66`. Claim 02 supplies

```text
[e(F-T)-41]+[e(F[T])-1]
+sum_(x in T)[d_(F-T)(x)-6]=2+q.
```

All terms are nonnegative. Writing u=e(F-T)-41,
w=e(T,F-T)-24, and z=e(F[T]) therefore gives
`u+w+z=3+q` with u,w>=0 and z>=1, exactly the existing frontier
size-four defect budget. Retaining the induced-T edge bound improves
the raw deletion estimate 65 to 66, while both remain below 68.
Failure of this sufficient inequality is not evidence that a
four-transversal exists or that any extension to the full graph exists.

Search use: propagate the exact four-transversal defect budget;
no size>=5 or order-43 termination claim.

Reviews: [review](review_audit_pending_transversals_20261015.md).

## Provenance and self-check

Read source hashes:

```text
0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54  n43/d18/frontier_band.md
4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e  n43/d18/transversal_four.md
```

The other source is the published-input/proof note
`n43/d18/transversal_four.md` as present at the base revision above.
The independent audit of the present abstract claims remains pending.
Author self-check covered enlargement of a small transversal, exact
Ramsey type of each nonneighbor set, b=0 boundary, Turan complement
direction and equality, strict threshold, and both substitutions.
No numerical premise implies an I4 prohibition in A=N(v) itself.
