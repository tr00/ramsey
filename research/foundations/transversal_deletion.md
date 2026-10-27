# Deleting a clique transversal: edge budgets and stability

- **Kind and scope:** four local deductions for finite simple undirected graphs.
  Claims 01–02 use the explicit `n,r,s,t,R,L` interface below; claims 03–04
  specialize to 18 vertices and retain their recorded Ramsey/census premises.
- **Author:** transversal compatibility agent (`transversal_compatibility`).
  **Independent reviewers:** overlap-author agent and `/root/audit_transversals`,
  each distinct from the author. **Review state:** accepted for all four claims
  on their stated hypotheses; this consolidation retains historical acceptance,
  not a new mathematical review.
- **Dependencies:** the justified Ramsey upper bound and lower-edge-bound
  interface; Turan's balanced extremal theorem and equality case. The numerical
  applications require `R(4,3)=9`, the order-15 `(4,4)`-free minimum 50 and
  order-14 minimum 41 recorded in the linked sources. Their applicability was
  reviewed; published census evidence was not recertified.
- **Search use:** propagate transversal-size lower bounds and exact component
  and attachment defect budgets. Terminate only a case explicitly requiring a
  transversal of size at most `t` when the justified strict edge inequality
  contradicts it. Equality structure is conditional. The four-deletion estimate
  proves neither a size-five bound nor transversal existence or order-43 closure.

The general lower bound and its exact defect identity recover the
18-vertex size-four threshold at at most 70 complement edges. Deleting four
instead gives only the necessary lower threshold 66 and defect `2+q` at
`e(F)=68+q`. No numerical premise prohibits `I4` in `A=N(v)` itself.

This parameterizes the deletion proof in
[the four-transversal note](../n43/d18/transversal_four.md) and its
[frontier-band extension](../n43/d18/frontier_band.md). Purely
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

<a id="claim-transversal-deletion-02"></a>
## 2. Exact edge-defect identity and stability

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

<a id="claim-transversal-deletion-03"></a>
## 3. The 18-vertex four-transversal threshold

Scope: every 18-vertex F with alpha(F)<=3 and e(F)<=70.
For the pivot application F is the complement of A=N(v), where A is
(4,5)-free. The clique bound on F is not needed for this claim.

Dependencies: Claim 01; `R(4,3)=9`; the published lower bound 50 for
15-vertex (4,4)-free graphs recorded in
[transversal_four.md](../n43/d18/transversal_four.md#published-input).
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

<a id="claim-transversal-deletion-04"></a>
## 4. Why deleting four does not prove the desired stronger bound

Scope: 18-vertex F with alpha(F)<=3; a four-set K4-transversal T;
the recorded lower bound 41 for 14-vertex (4,4)-free graphs.

Dependencies: Claims 01--02; `R(4,3)=9`; the 14-vertex lower bound
recorded in [frontier_band.md](../n43/d18/frontier_band.md),
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

The source dependencies are the
[published-input/proof note](../n43/d18/transversal_four.md) and
[frontier-band extension](../n43/d18/frontier_band.md).
Author self-check covered enlargement of a small transversal, exact
Ramsey type of each nonneighbor set, b=0 boundary, Turan complement
direction and equality, strict threshold, and both substitutions.
No numerical premise implies an I4 prohibition in A=N(v) itself.
This self-check is separate from the historical independent reviews below.

<a id="independent-review"></a>
## Independent review of transversal deletion and defect budgets

Historical reviewer: overlap-author agent, distinct from the
transversal-compatibility author. Coverage: claims
[01](#claim-transversal-deletion-01), [02](#claim-transversal-deletion-02),
[03](#claim-transversal-deletion-03) and [04](#claim-transversal-deletion-04).
The reviewer independently identified the actual source snapshot rather than
the initially assigned draft. Acceptance corresponds to the retained proof
through [Provenance and self-check](#provenance-and-self-check), not a new audit.

Dependencies reviewed: [transversal four](../n43/d18/transversal_four.md),
[frontier band](../n43/d18/frontier_band.md), the supplied Ramsey and
lower-edge-bound interface, and Turan's balanced extremal theorem and equality
characterization. The source notes record `R(4,3)=9`, the lower edge endpoint
50 on 15-vertex `(4,4)`-free graphs, and endpoint 41 on 14-vertex such graphs.
Their exact applicability was checked; their published census evidence was
not independently recertified.

### Independent checks

All four claims were checked. Deleting a transversal partitions edges into
the core, attachments and its own induced graph. The Ramsey nonneighbor cap
and complementary Turan bound give the correct lower threshold; enlarging a
smaller transversal is valid. Strict versus weak comparisons, t0/t=n and
zero-attachment cases were checked.

With integral core minimum L the defect components are nonnegative integers;
zero defect gives conditional balanced-clique structure. At n18,t3 the
threshold is 71, giving tau>=4 at e(F)<=70. At t4 the threshold is 66 and the
defect2+q is necessary only, not evidence that a transversal exists. All
A/B complement types and the separate order 14 minimum/maximum uses are sound.

Outcome: accepted for all four claims on their stated hypotheses and retained
Ramsey/census premises. No correction is required for this exact revision.

Permitted search use: propagate transversal-size lower bounds and exact defect
budgets; terminate only a case whose required transversal size contradicts
the justified strict edge threshold. The four-deletion estimate supplies
no order-43 termination and no transversal-existence assertion.

Limits: no graph computation, external download, formal proof checking, or
census recertification was performed. All applications must instantiate the
Ramsey and lower-edge-bound interface at exactly the stated remainder order
and graph type. Novelty was not checked. Proof changes require renewed review.

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

Dependencies reviewed for this topic: [transversal four](../n43/d18/transversal_four.md),
[frontier band](../n43/d18/frontier_band.md), Turan's balanced extremal theorem
and equality case, the supplied Ramsey upper bound interface, and the recorded
`R(4,3)=9` and minima 50 for `(4,4,15)` and 41 for `(4,4,14)`.
Applications and inequality directions were checked; no external census or
literature certificate was independently recertified. The shared audit's
other numerical premises and source-review dependencies are retained with
[compatibility](transversal_compatibility.md#audit-pending-review).

### Decisive independent checks

Deletion partitions edges into the remainder, attachments and T. Turan on
the complement gives the balanced internal-edge minimum; Ramsey bounds give
the attachment floor. Strict threshold failure excludes a transversal;
zero defects give only conditional equality structure. All t0/t=n/empty and
zero-attachment boundaries were checked. The numerical thresholds are71
for t3 and 66 for t4; the latter does not imply existence.

### Per-claim outcomes

| Claim | Outcome | Exact dependency and scope limit |
| --- | --- | --- |
| Deletion 01 | accepted | Conditional on its proved `R,L` interface and Turan; no existence or attained-extremum assumption |
| Deletion 02 | accepted | Deletion 01 component bounds, integer `L`, and Turan equality |
| Deletion 03 | accepted | Deletion 01, `R(4,3)=9`, and the order-15 minimum 50 |
| Deletion 04 | accepted | Deletion 01–02, `R(4,3)=9`, and the order-14 minimum 41; supplies a necessary budget only |

No proof in these four claims required withdrawal at the reviewed snapshot.

### Cross-topic connections

The shared audit also accepted the four compatibility claims; their outcomes,
decisive checks and limits are retained only in the
[companion topic](transversal_compatibility.md#audit-pending-review).
The order-14 minimum 41 used here and order-14 maximum 50 used there have
different graph-bound roles; neither is substituted for the other.

### Permitted use and limits

Transversal-size lower bounds and exact deletion defect budgets are justified
propagation uses. Termination is justified only for a case meeting the exact
strict contradiction hypotheses. None of these claims decides order 43 or
proves a universal transversal-size-five theorem.

No source files, shared indexes, or Git state were edited by this reviewer.
No graph enumeration, solver, canonicalizer, installation, download, or
formal proof checker was used. No novelty assessment was performed.
The numerical literature inputs remain conditional premises, and these
accepted mathematical reductions are not computational nonexistence
certificates. No substantive gap or dependency misuse was found.

## Changelog

- Established the general deletion lower bound, exact integral defect and
  conditional equality structure, the 18-vertex size-four threshold, and the
  necessary four-deletion budget with its explicit failure to imply size five
  or existence.
- The overlap-author reviewer and independent `/root/audit_transversals` audit
  accepted all four claims on their stated hypotheses, without proof correction.
  Their reviews retain the Ramsey/census premises and strict search-use limits;
  no census recertification or computational closure was claimed.
- Consolidated the mathematical development and both historical review records
  here, preserving the four claim anchors and existing heading anchors. Split
  the shared audit by topic with cross-topic links; removed repeated claim
  administration and stale pending-review text, and relocated source links.
  Matched historical acceptance to the retained reviewed argument without a
  new mathematical review.
