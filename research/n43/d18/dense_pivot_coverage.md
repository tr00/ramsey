# Dense degree-18 families with a simultaneous overlap guarantee

Scope: local deductions for order-43 K5/I5-free graphs, their actual
degree-18 roots, and the exact degree-data predicates stated below.
Author: pivot-coverage agent. Independent reviewer: low-excess agent,
a distinct identity. All three claims are accepted on their stated premises.

| Claim | Kind and review state | Permitted search use |
| --- | --- | --- |
| [01](#claim-dense-pivot-01), thirteen-root overlap theorem | Local deduction; accepted; no edge census | Existence coverage and propagation for a complete same-family two-root branch |
| [02](#claim-dense-pivot-02), odd-h near-maximum-excess families | Local deduction; accepted on the retained census premises | Numerical propagation and conditional family counts |
| [03](#claim-dense-pivot-03), simultaneous dense endpoints and overlap | Local deduction; accepted on the retained census premises | Conditional same-family two-root branching with all maps/completions |

Dependencies: [pivot classes](pivot_classes.md), [excess bounds](excess_bounds.md),
[frontier band](frontier_band.md#four-transversal-extension), the
[independent-four anchor](../../../docs/theory_phase_1.md#4-anchored-4-bit-signature-theory),
Turan's theorem and the small Ramsey numbers stated per claim. The numerical
census premises are those recorded from Angeltveit--McKay,
[arXiv:2409.15709v2](https://arxiv.org/abs/2409.15709v2), Appendix A Table 1;
the four-transversal observation also retains the published order-15 (4,4)
minimum of 50. These external premises are not recertified here.

Summary: this topic obtains density at both endpoints and overlap at most ten
on the same edge in one conditional family. It establishes neither small h,
small W nor small x globally, and closes no profile or order-43 branch.
The later [twelve-root theorem](sos_pivot_selection.md#claim-sos-pivot-twelve)
strengthens the thirteen-root threshold without replacing this proof.
The author used exact arithmetic on the displayed formulas; no graph
enumeration, solver, download, installation or novelty review was performed.

Let G have 43 vertices and neither K5 nor I5. Write P for its degree-18
vertices, H=V(G)-P, h=|H|, p=43-h, epsilon_z=d_G(z)-18, and
W=sum_z epsilon_z. For v in P write

```text
q_v=85-e(G[N(v)]), E_v=sum_(z in N(v)) epsilon_z,
m_H(v)=|N(v) intersect H|,
x_v=e(N(v),M(v))=136+2q_v+E_v.
```

The retained census premises give 0<=q_v<=35 and
q_v+E_v<=W/2+4. The degree bounds give 0<=epsilon_z<=6; W is even.
The ambient graph N(v) is (4,5)-free and may contain I4. M(v) is
(5,4)-free and cannot contain I4. No result here changes those types.

The first claim improves a coverage gap in earlier pair statements: both
endpoints belong to the same prescribed family, and the overlap bound holds
for that very pair. It does not combine two separately guaranteed pairs.

<a id="claim-dense-pivot-01"></a>
## 1. Any thirteen degree-18 roots contain an edge of overlap at most ten

Scope: any subset F of P with |F|>=13; no restriction on W, h, q, x,
or root selection.

Dependencies: G has no K5 or I5; R(3,3)=6, R(3,4)=9,
R(3,5)=14; the independent-four anchor lower bound
e(I,M(v))>=36 from
[theory phase I, Section 4](../../../docs/theory_phase_1.md#4-anchored-4-bit-signature-theory).
The anchor argument is rederived in this proof. No edge census is used.

Conclusion: some adjacent u,v in F satisfy
|N(u) intersect N(v)|<=10. Every condition shared by all members of F
therefore holds at both endpoints of this same edge.

Proof: suppose every edge in G[F] instead has codegree at least eleven.
We first establish four consequences.

**Triangle equality forbids a paw.** Let u,v,w be any triangle in F, and
let t=|N(u) intersect N(v) intersect N(w)|. These common neighbors form
an independent set, since an edge together with the triangle would give K5;
thus t<=4. The sets N(u) intersect N(v) and N(u) intersect N(w) lie in
the eighteen-element set N(u), and their intersection has size t. Hence

```text
lambda_uv+lambda_uw <=18+t<=22.
```

Both codegrees are at least eleven, so both are exactly eleven, t=4,
and the union of the two sets is all N(u). Repeating at v,w shows that
each triangle edge has codegree eleven and that no ambient vertex is
adjacent to exactly one vertex of this triangle. In particular G[F] has
no induced paw (a triangle and a fourth vertex adjacent to just one of it).

**No four-clique occurs in F.** Suppose Q is a four-clique in F. Each
Q-edge has codegree eleven by the preceding paragraph. For z outside Q
put j_z=|N(z) intersect Q|. K5-freeness gives j_z<=3. The paw prohibition
applied to each of the four Q-triangles forbids j_z=1 and j_z=2, so
j_z is zero or three. Counting the Q-outside cut from the four degrees
gives sum j_z=4*18-12=60. Counting external common neighbors from the
six Q-edges gives sum C(j_z,2)=6*(11-2)=54. These sums must be equal
when every j_z is zero or three, contradiction.

**The neighborhood within F of every vertex has no I4.** Suppose v in F
has an independent set I of four neighbors belonging to F. The anchor
argument gives e(I,M(v))>=36: each of the 24 antineighbors of v must meet I,
and for each i in I the class meeting I exactly in {i} is a clique of order
at most three (a nonedge there, together with I-{i}, would be I5; a clique
of order four there, together with i, would be K5). Thus there are at most
twelve singleton signatures, while every other signature has size at least
two, giving e(I,M(v))>=12+2*12=36. Since every i in I has degree eighteen,

```text
sum_(i in I) lambda_vi
 =sum_(i in I) d_(N(v))(i)
 =4*17-e(I,M(v)) <=32.
```

But each of the four edges vi has codegree at least eleven, so the sum
would be at least44. This is impossible.

**Every connected component of G[F] has at most three times its independence
number.** First consider a component containing a triangle. A connected
paw-free graph containing a triangle is complete multipartite; here is the
needed direct proof. Start with the induced triangle, a complete multipartite
subgraph with three singleton parts, and extend it to a maximal induced
complete multipartite subgraph K with at least three nonempty parts. Let z
outside K have a neighbor x in a part of K. Two other parts contain y,w.
If z missed both y,w it would form a paw with x,y,w. Thus z meets at least
two parts of K. In any part P_i, adjacency of z is uniform: if z meets x
and misses x' in P_i, choose a neighbor y of z in a different part. The
triangle z,x,y has x' adjacent to exactly y, a paw. Finally z cannot miss
two parts, since representatives of those parts and a part it meets would
again form a paw. Therefore z is complete to all but at most one whole
part, and either joins that missed part or forms a new singleton part.
This contradicts maximality. A proper K in a connected component has an
outside vertex adjacent to it, so K is the whole component. As G[F] has
no K4, this multipartite component has exactly three parts. Each part is
independent; its order is at most three times the largest part, which is
its independence number.

Now consider a triangle-free component D, and put a=alpha(D)<=4. For
a=1, |D|<=2. For a=2, R(3,3)=6 gives |D|<=5. For a=3,
R(3,4)=9 gives |D|<=8. These satisfy |D|<=3a. For a=4,
R(3,5)=14 gives |D|<=13. If |D|=13, then for every v in D the
12-d_D(v) nonneighbors induce a triangle-free graph with no I4: an I4
there together with v would be I5. R(3,4)=9 therefore gives
12-d_D(v)<=8, or d_D(v)>=4. Since D is triangle-free, N_D(v) contains
an independent four-set in N_F(v), contradicting the preceding anchor
consequence. Thus |D|<=12=3a in this case as well.

Independence numbers add over the components of G[F]. Hence
|F|<=3*alpha(G[F])<=12, contradiction. The conclusion follows.

Search use: branch | propagate. An exhaustive two-root gluing family must
retain all allowed overlap values, maps, and completions for the guaranteed
edge; this claim supplies only existence coverage for that family.

<a id="claim-dense-pivot-02"></a>
## 2. Odd high-degree counts near their excess maximum force dense families

Scope: h odd, 1<=h<=35, W=6h-D, D in {0,2,4,6}, and h<=W.
The statements are conditional on these exact global degree data.

Dependencies: retained bounds q_v+E_v<=W/2+4 and epsilon_z<=6;
Turan's theorem applied to the K5-free graph G[H];
[excess cut argument](excess_bounds.md#2-high-degree-cut-obstruction).

Conclusion: put a=(h-1)/2 and

```text
R_h=24h-2floor(3h^2/8)-(43-h)*(h-1)/2,
M_D=max(0,R_h-D).
```

Every root v in P has m_H(v)<=a+1. At least M_D roots satisfy
m_H(v)=a+1. Each root of this family F_D obeys

```text
3h+3-D <= E_v <=3h+4-D/2,
0<=q_v<=1+D/2,
q_v+E_v<=3h+4-D/2,
139+3h-D <=x_v<=141+3h.
```

In particular, if D=0 then every member has exactly E_v=3h+3 and
q_v in {0,1}, so x_v is one of 139+3h and141+3h.

Proof: a root with m neighbors in H omits h-m excesses, each at most six,
so E_v>=W-6(h-m)=6m-D. Consequently

```text
6m-D <= E_v <=W/2+4-q_v <=3h+4-D/2,
m <=floor((3h+4+D/2)/6)=a+1.
```

The last equality uses h=2a+1 and D<=6. The P-H cut has size

```text
C=18h+W-2e(G[H])
 >=24h-D-2floor(3h^2/8).
```

If M roots have m=a+1 and the others have m<=a, then C<=p*a+M.
Thus M>=R_h-D, giving the stated count. For any such root the
omitted-excess bound gives E_v>=6(a+1)-D=3h+3-D; the universal
q_v+E_v bound gives q_v<=1+D/2 and the displayed upper E bound.
Finally x_v=136+2q_v+E_v has lower bound139+3h-D and upper bound
136+(3h+4-D/2)+(1+D/2)=141+3h. For D=0 all h excesses equal six,
so E_v=6m=3h+3 exactly.

The count M_D>p, were it to occur, would rule out those degree data by
the same cut inequality. No row in the following table has that issue.

| h | R_h | M_0 (q<=1) | M_2 (q<=2) | M_4 (q<=3) | M_6 (q<=4) |
| --- | --- | --- | --- | --- | --- |
| 1 | 24 | 24 | 22 | 20 | not applicable: W=0<h |
| 3 | 26 | 26 | 24 | 22 | 20 |
| 5 | 26 | 26 | 24 | 22 | 20 |
| 7 | 24 | 24 | 22 | 20 | 18 |
| 9 | 20 | 20 | 18 | 16 | 14 |
| 11 | 14 | 14 | 12 | 10 | 8 |
| 13 | 6 | 6 | 4 | 2 | 0 |

Each row is a necessary family count, not an assertion of realizability.
For h=15 and17, R_h=-4 and-16 respectively; the nonnegative count is
zero and the same formula remains valid. Values beyond the table do not
inherit a positive count by interpolation.

Search use: propagate | branch; no termination claim for any listed degree
profile.

<a id="claim-dense-pivot-03"></a>
## 3. Two dense endpoints and overlap ten in the same conditional family

Scope: a row of Claim02 with M_D>=13; all exact hypotheses of that claim.

Dependencies: Claims01 and02. The four-transversal observation below
additionally uses the retained 15-vertex (4,4) minimum edge count50 via
[frontier band](frontier_band.md#four-transversal-extension).

Conclusion: F_D contains adjacent roots u,v of codegree at most ten such
that both roots have all profiles in Claim02, including q<=1+D/2 and
139+3h-D<=x<=141+3h. At D=0 or2 both endpoint neighborhoods have
at least83 edges and every actual cross column at each endpoint has size
at least four.

Proof: Claim02 supplies the one family F_D with the simultaneous root
profiles, and Claim01 applied to this very family supplies the edge.
For D<=2, q<=2 at each endpoint; the four-transversal bound applies to
the (4,5)-free neighborhood at each endpoint irrespective of E or x.
The companion's neighborhood need not be extremal and the overlap map
need not be unique. No assumption about equal q or E at the two endpoints
is made beyond D=0's individually forced exact E.

Concrete complete conditional coverage through the positive table rows:

| Global degree predicate | Family count | Both neighborhood edge counts | Both x ranges | Guaranteed same-edge overlap |
| --- | --- | --- | --- | --- |
| h=3,W=18 | >=26 | 84..85 | {148,150} | <=10 |
| h=5,W=30 | >=26 | 84..85 | {154,156} | <=10 |
| h=7,W=42 | >=24 | 84..85 | {160,162} | <=10 |
| h=9,W=54 | >=20 | 84..85 | {166,168} | <=10 |
| h=11,W=66 | >=14 | 84..85 | {172,174} | <=10 |
| h=3,W=16 | >=24 | 83..85 | 146..150 | <=10 |
| h=5,W=28 | >=24 | 83..85 | 152..156 | <=10 |
| h=7,W=40 | >=22 | 83..85 | 158..162 | <=10 |
| h=9,W=52 | >=18 | 83..85 | 164..168 | <=10 |

The h=1 rows also meet the threshold, but their overlaps can already be
bounded by nine using the previous exact-h overlap theorem. D=4 and6
retain the overlap-ten guarantee wherever M_D>=13, with the weaker
endpoint edge-count ranges82..85 and81..85 respectively. They do not
gain a four-transversal bound from q<=2 unless the actual q values supply
that additional hypothesis.

Search use: branch. Excluding these conditional degree predicates requires
exhaustive exclusion of the entire two-root family, including all stated q,E
values, all overlaps up to ten, all maps, and all remaining Ramsey-compatible
completions. No such exclusion is provided here.

## Limits, self-checks, and source revisions

These claims close no order-43 branch. They do not prove h small, W small,
or x<=142, and they do not impose a property of a selected family on an
arbitrary previously fixed degree-18 root. They give an overlapping
unavoidable family; it is not a disjoint decomposition into rooted cases.
The h3/W18 and h5/W30 rows improve the prior family results by giving an
overlap-ten edge with two dense endpoints; h5/W30 also improves the
endpoint threshold from83 to84. Higher rows extend conditional coverage.

Author self-check: triangle equality was derived from two set intersections
inside an eighteen-element neighborhood, then separately checked by exact
triangle signatures. The K4 contradiction counts both degree incidence and
pair incidence. The independent-four argument explicitly places I4 in the
(4,5)-free neighborhood and uses (5,4)-free antineighborhood signature
classes. Component size is summed using additive independence numbers.
The odd-h family count was derived both from omitted excess and from the
P-H cut; all table entries use the same formula and even D. These are
self-checks, not independent acceptance or formal certification.

No novelty is claimed. Complete multipartite structure of connected paw-free
graphs with a triangle is standard; its short direct proof above is included
to keep this local deduction independent of an additional classification
premise.

<a id="review-dense-pivot-low-excess"></a>
## Independent review of dense degree-18 pivot coverage

The low-excess agent independently accepted claims 01--03, separately from
author pivot-coverage agent, for the exact proof revision identified by the
historical audit. Its condensed review retained the original acceptance,
decisive checks and limits; this consolidation does not restore superseded
long-form review prose or constitute a new review.

### Independent checks

All three claims were independently checked. The reviewer rederived
x=136+2q+E and q+E<=W/2+4 from degree/edge sums and the applicable extrema.
The thirteen-root argument was checked using ambient common neighbors,
triangle-codegree equality and component independence; it supplies one
same-family overlap<=10 edge without an edge census. The h/W/deficit
substitutions were recomputed, including family counts 26/26/24/20/14 at
h=3/5/7/9/11, D=0. Both endpoint predicates belong to that same family;
separate root selectors are not merged. No mathematical correction was
required for the reviewed revision.

Outcome: accepted on the explicitly retained literature premises. Claim 01
and Claim 03 provide existence coverage for a complete two-root family;
Claim 02 provides numerical propagation and conditional family counts.
The families are conditional and overlapping, not a disjoint root partition.
Applying their properties to an arbitrary earlier root, identifying separate
guaranteed pairs, or omitting allowed overlaps, maps or completions exceeds
the claims. Census premises and small Ramsey-number certificates were checked
for applicability, not recertified. No exhaustive graph computation, formal
proof checking, construction, novelty review or order-43 exclusion was
performed; proof changes require renewed review.

## Changelog

- Established and independently accepted the thirteen-root same-family
  overlap theorem, odd-h family counts and simultaneous density/overlap use.
- Recorded the later twelve-root strengthening as a separate dependency link;
  the thirteen-root proof and all conditional numerical tables remain intact.
- Consolidated the topic-specific condensed review inline, replaced repeated
  administration with top-level metadata and removed prose-hash bookkeeping.
  Mathematical statements, proofs and section/claim anchors are unchanged.
