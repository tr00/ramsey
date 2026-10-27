# Weighted avoidance and two-transversal incompatibility

- **Kind and scope:** four local deductions. Claims 01–02 concern finite set
  families and ordered real weights; claim 03 concerns full degrees in one
  finite simple undirected graph and all six explicit degree-gap hypotheses;
  claim 04 uses the full 18-vertex frontier/interface setting.
- **Author:** transversal compatibility agent (transversal compatibility author).
  **Independent reviewers:** `augmentation_author` (augmentation author) and
  `/root/audit_transversals`, each distinct from the author. **Review state:**
  accepted for all four claims on their stated premises; this consolidation
  retains historical acceptance rather than recording a new mathematical review.
- **Dependencies:** elementary set inclusion, weighted sums, degree sums and
  induced-edge deletion. The numerical recovery requires the linked
  low-excess setting and arbitrary-transversal bounds, the four-transversal
  bound, and recorded Ramsey/census premises including `R(3,4)=9`.
  Applicability was reviewed; classical values and census extrema were not
  recertified. Numerical order-43 premises are not abstract-family hypotheses.
- **Search use:** propagate occupancy, avoidance and transversal intersection;
  terminate only a case satisfying the precise strict contradiction hypotheses.
  Claim 03 requires disjoint transversals and every induced-subgraph and
  numerical-gap premise. No universal size-five bound, universal degree-ten
  exclusion, frontier closure or order-43 nonexistence result follows.

Occupancy and avoidance force each small subset to occur, with independence
only for `t>=2`. Ordered-weight hypotheses can supply these conditions.
The degree-gap theorem excludes two disjoint transversals and exactly recovers
the existing frontier disjointness theorem. Singleton-overlap conclusions
still require their separate source occupancy and case analyses; an `I4`
prohibition applies only to specified deleted remainders, not to `N(v)` itself.

These are theorem abstractions of the reviewed arguments in
[low-excess columns](../n43/d18/x136/r2/low_excess_columns.md), especially
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

<a id="claim-transversal-compatibility-02"></a>
## 2. Weighted occupancy and low-weight exclusion supply the hypotheses

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

The low-weight exclusion may instead be vertexwise: if all transversals
of the specified size have every vertex of weight at least a and `c<a`,
then every nonempty L-T fails. This version is used below. Neither
version follows merely from a lower bound on the *size* of a transversal.

<a id="claim-transversal-compatibility-03"></a>
## 3. A degree-gap theorem excluding two disjoint transversals

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

This is a sufficient theorem with intentionally explicit gaps. It does
not characterize all pairs of transversals. The induced-subgraph premise
concerns deletion of a transversal of size s+1; it places no independent
four-set prohibition on H itself.

<a id="claim-transversal-compatibility-04"></a>
## 4. Exact recovery of the frontier disjointness theorem

Scope: the full setting of
`research/n43/d18/x136/r2/low_excess_columns.md`, before imposing r=2. In particular
H=A is (4,5)-free on 18 vertices, e(H)=85, and the full actual-interface
anchor bound holds. The transversals need not be actual columns.

Dependencies: Claim 03;
[low-excess setting and Claim 01](../n43/d18/x136/r2/low_excess_columns.md#claim-r2-low-excess-01);
[four-transversal bound](../n43/d18/transversal_four.md);
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

The topic's record in the
[historical integration manifest](../../docs/general_theorems/integration_manifest.json)
identifies the reviewed source, its integrated snapshot and the individual
independent review. The committed integration snapshot in Git (`f98a128`)
matches that record; removing only its integration-status banner reconstructs
the exact reviewed-source fingerprint recorded by the individual reviewer and
shared auditor. Subsequent pre-migration changes affected only review-state
and review-link administration and relocated source references. The setting,
scopes, dependencies, conclusions, proof prose and search conditions retained
above match that reviewed development after removal of repeated administrative
fields. Historical paths and hashes remain identifiers of the original bytes
in history and evidence, not identifiers of this relocated topic. This
correspondence preserves historical acceptance; it is not renewed review.

The existing independent reviews of
[low-excess columns](../n43/d18/x136/r2/low_excess_columns.md) support the
original numerical-premise specialization; they are not reviews of the
abstract family and degree-gap deductions. The separate historical independent
reviews of those deductions are retained below.

The author separately checked the t=1 limitation, the empty-transversal
case, integral cutoff c+1, exact disjointness in the degree-sum identity,
strict versus weak inequalities, and every numerical substitution above.
This is a self-check, separate from the independent reviews.

<a id="independent-review"></a>
## Independent review of weighted avoidance and transversal compatibility

Historical reviewer: `augmentation_author` (augmentation author), distinct
from the transversal compatibility author. Coverage: claims
[01](#claim-transversal-compatibility-01),
[02](#claim-transversal-compatibility-02),
[03](#claim-transversal-compatibility-03) and
[04](#claim-transversal-compatibility-04), including the stated limitations on
singleton-overlap applications. Acceptance corresponds to the retained proof
through [Provenance and self-check](#provenance-and-self-check), not a new audit.

Dependencies reviewed: the family and degree-gap arguments are proved directly.
For the numerical recovery, [low-excess columns](../n43/d18/x136/r2/low_excess_columns.md)
was independently reread, especially its setting and claims 01–02, together
with the [four-transversal source](../n43/d18/transversal_four.md).
Its numerical census minimum was not recertified. Classical `R(3,4)=9`
and the source degree/transversal/census premises remain explicit assumptions.

### Independent checks

All four claims were independently checked. Occupancy plus avoidance of
L-T forces exact T occurrence; independence needs t>=2. Empty-family and
empty-transversal cases were handled explicitly. Ordered-weight signs are
correct even for negative real weights; vertexwise alternatives require
nonempty candidates.

The low-degree argument covers ell<s, ell=s, ell=s+1 and the remaining
ell=s+2 case using the two strict total gaps. Deleted remainders are I4-free;
the ambient graph need not be. The full frontier substitution N10/P14/D90
satisfies33>32,55>52,88<90,89<90. The theorem assumes disjoint transversals;
singleton overlaps still require their separate source case analyses.

Outcome: **accepted**, claims 01–04 at the historically reviewed theorem snapshot,
on their explicitly recorded premises.

Limits: This independent mathematical audit is not a formally checked
certificate. Published census extrema and classical Ramsey values were not
recertified. No novelty review was performed. The abstract theorem can
terminate a case requiring disjoint transversals only after all of its
strict numerical gaps and induced-subgraph hypotheses are independently
established for that case. It does not prove a universal five-transversal
bound, a universal degree-ten exclusion, or an order-43 nonexistence result.

<a id="audit-pending-review"></a>
## Independent audit of pending transversal claims

Historical reviewer: `/root/audit_transversals`, an independently assigned
audit agent distinct from the transversal compatibility author. The reviewer
derived the arguments before reading the concurrent deletion review; that
review is supporting provenance, not the basis for these outcomes. The audit
covered both transversal topics; only this topic's findings are retained in
this section, with the companion findings linked below. Acceptance applies
through the reviewed-body correspondence in [Provenance and self-check](#provenance-and-self-check).
The starting points and workflow were read. Any mathematical change requires
renewed review.

Dependencies reviewed for this topic:
[four-transversal source](../n43/d18/transversal_four.md),
[low-excess columns](../n43/d18/x136/r2/low_excess_columns.md), and its
[triples review](../n43/d18/x136/r2/review_low_excess_columns_20261014_triples.md)
and [pivot review](../n43/d18/x136/r2/review_low_excess_columns_20261014_pivot.md).
Retained numerical inputs include `R(4,3)=R(3,4)=9`, `R(3,5)=14`, maxima
85 for `(4,5,18)`, 79 for `(4,5,17)` and 50 for `(4,4,14)`, and the
order-15 `(4,4)`-free minimum 50 underlying the four-transversal bound.
Their applications and inequality directions were checked; no external
census or literature certificate was independently recertified. The shared
audit's lower-edge-bound interface, Turan checks and order-14 minimum 41
are retained with [deletion](transversal_deletion.md#audit-pending-review).

### Decisive independent checks

Compatibility01 uses occupancy plus nontransversality to force every
specified t-subset to occur; independence needs t>=2. Ordered-weight signs
and the separate empty-set exclusion were checked in Claim 02. Claim 03's
low-degree cases cover every |L|, with strict capacity gaps and hereditary
I4-freeness only in deleted remainders. For the frontier specialization,
actual B columns supply degree-sum cap 32; all six abstract hypotheses were
checked at N10,P14,D90, including33>32,55>52,88<90,89<90.
The arbitrary-transversal floor9 and degree cap 40 were independently rederived.

### Per-claim outcomes

| Claim | Outcome | Exact dependency and scope limit |
| --- | --- | --- |
| Compatibility 01 | accepted | Set inclusion, with `1<=t<=|L|`; independence conclusion requires `t>=2` |
| Compatibility 02 | accepted | Compatibility 01 and its stated ordered weight bounds, occupancy gap, and transversal exclusion |
| Compatibility 03 | accepted | Compatibility 01 and every one of its six explicit hypotheses; degrees are full degrees in the same graph |
| Compatibility 04 | accepted | Compatibility 03 and full frontier/interface setting, including the arbitrary-transversal degree bounds |

No proof in these four claims required withdrawal at the reviewed snapshot.

### Cross-topic connections

The shared audit also accepted the four deletion claims; their outcomes,
decisive checks and limits are retained only in the
[companion topic](transversal_deletion.md#audit-pending-review).
The order-14 maximum 50 used in the arbitrary-transversal argument differs
from the deletion topic's order-14 minimum 41; the two bound directions
and applications must not be exchanged.

### Permitted use and limits

Weighted occupancy and avoidance, and intersection of frontier four-transversals,
are justified propagation uses. Termination is justified only for a case
meeting the exact strict contradiction hypotheses. None of these claims
decides order 43 or proves a universal transversal-size-five theorem.

No source files, shared indexes, or Git state were edited by this reviewer.
No graph enumeration, solver, canonicalizer, installation, download, or
formal proof checker was used. No novelty assessment was performed.
The numerical literature inputs remain conditional premises, and these
accepted mathematical reductions are not computational nonexistence
certificates. No substantive gap or dependency misuse was found.

## Changelog

- Established exact subset occurrence from occupancy and avoidance, its
  ordered-weight sufficient hypotheses, the six-hypothesis degree-gap
  incompatibility theorem and its exact frontier specialization. Retained
  the additional requirements and limits of singleton-overlap applications.
- The augmentation-author reviewer and independent `/root/audit_transversals`
  audit accepted all four claims on their explicit premises. The reviews
  cover empty families and transversals, weight signs, all low-degree cases,
  strict gaps, ambient graph types and the full numerical substitution;
  no literature recertification or order-43 closure was claimed.
- Consolidated the mathematical development and both historical review records
  here, preserving the four claim anchors and existing heading anchors. Split
  the shared audit by topic with cross-topic links; removed repeated claim
  administration and stale pending-review text, and relocated source links.
  Matched historical acceptance to the retained reviewed argument without a
  new mathematical review.
