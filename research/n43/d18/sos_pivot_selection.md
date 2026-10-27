# Quadratic positivity for degree-18 pivot selection

Scope: local deductions for order-43 K5/I5-free graphs with a nonempty
degree-18 set, plus the standalone K5-free degree-square theorem in Claim 01.
Author: sos_pivot (pivot/SOS agent). Independent reviewer: sos_finite,
distinct from the author and making no source edits during review.

| Claim | Kind and current review state | Permitted search use |
| --- | --- | --- |
| [Degree square](#claim-sos-pivot-degree-square) | Local deduction; accepted | Propagate on actual H statistics |
| [Covariance](#claim-sos-pivot-covariance) | Local deduction; accepted | Conditional excess/covariance propagation; feed the family claim |
| [Families and selected roots](#claim-sos-pivot-family) | Local deduction; accepted | Propagate and branch under explicit safe selection or complete same-family coverage |
| [Twelve roots](#claim-sos-pivot-twelve) | Local deduction; accepted | Same-family overlap existence coverage and propagation; retain every permitted profile, map and completion |

Dependencies: [pivot classes](pivot_classes.md),
[pairwise refinements](pairwise_pivot_refinements.md),
[dense-pivot Claim 01](dense_pivot_coverage.md#claim-dense-pivot-01), the
elementary principles and exact small Ramsey numbers stated per claim, and
the retained Angeltveit--McKay census premises,
[arXiv:2409.15709v2](https://arxiv.org/abs/2409.15709v2), Appendix A Table 1.
External premises are not recertified by this topic or its review.

The [inline independent review](#review-sos-pivot-finite) and the retained
[historical machine-readable integration manifest](sos_theory_manifest.json)
document acceptance of all four claims. The old author's ready labels were
superseded by that existing exact-revision acceptance, not by a new review.
The manifest's source, audit and integration hashes refer to historical bytes,
not the current editorial presentation. Theory only: no solver, graph
enumeration, download, installation or novelty review was performed.

There are two deliverables: an explicit quadratic certificate improving the
weighted excess bound used to select dense roots, and a strengthening of the
unavoidable same-family overlap theorem from thirteen roots to twelve. The
latter is combinatorial rather than an SOS certificate. No order-43 branch is
closed, and no existence of a degree-18 vertex is asserted globally.

## Setting

Let G be an order-43 graph with no K5 and no I5, and suppose its degree-18
set P is nonempty. Put H=V(G)-P, h=|H|, p=43-h,
epsilon_z=d_G(z)-18, W=sum epsilon_z, and Z=sum epsilon_z^2. Degrees are
18..24, so all H excesses are in {1,...,6}, W is even, and h<=W<=6h.
For v in P put q_v=85-e(G[N(v)]), E_v=sum_(z in N(v))epsilon_z.
The retained census premises in [pivot classes](pivot_classes.md) give

```text
0<=q_v<=35,
B0=W/2+4,
q_v+E_v<=B0,
x_v=136+2q_v+E_v.
```

Here N(v) is (4,5)-free and may contain I4; M(v) is (5,4)-free.
Writing e=e(G[H]), weighted degree incidence gives exactly

```text
J=sum_(v in P)E_v=18W+Z-A,
A=sum_(z in H)epsilon_z*d_H(z)
 =sum_(yz in E(H))(epsilon_y+epsilon_z).
```

The external census source is Angeltveit--McKay, arXiv:2409.15709v2,
Appendix A, Table 1, as already retained by the linked project notes:
e(4,5,18)<=85 and the complemented order-24 interval 144..160.
This task does not independently certify those external data.

<a id="claim-sos-pivot-degree-square"></a>
## 1. A degree-square bound for any K5-free graph

Scope: every K5-free simple graph H on h>0 vertices with e edges

Dependencies: elementary weighted clique inequality (proved below),
Rayleigh principle for a real symmetric matrix, Cauchy--Schwarz

Conclusion: sum_(z in H)d_H(z)^2 <= (3/2)eh. Consequently
V=(3/2)eh-4e^2/h is nonnegative and bounds the degree variance.

Proof. For nonnegative weights a_z with sum a_z=1, the weighted edge
sum satisfies sum_(yz edge)a_y*a_z<=3/8. To prove this, if two positive
weights are supported on nonadjacent vertices, move their combined weight
to the vertex with larger weighted neighbor sum. The objective does not
decrease and the support shrinks. Eventually the support is a clique of
size r<=4. On that support the objective is
(1-sum a_z^2)/2 <=(1-1/r)/2<=3/8. This is the standard weighted clique
inequality, included to avoid requiring an additional literature premise.

Let D be H's adjacency matrix and rho its largest eigenvalue. A unit
Rayleigh maximizer can be chosen nonnegative: replacing a vector by its
entrywise absolute value cannot decrease its quadratic form. For this
nonnegative unit vector u,

```text
rho=2 sum_(yz edge)u_y*u_z,
rho^2 <=4e sum_(yz edge)u_y^2*u_z^2 <=(3/2)e.
```

The first inequality is Cauchy--Schwarz; the second applies the preceding
weighted clique inequality to a_z=u_z^2. For any vector b,
|b^T D b|<=|b|^T D |b|<=rho*||b||^2, so every eigenvalue has absolute
value at most rho. Thus

```text
sum d_H(z)^2=||D*1||^2<=rho^2*h<=(3/2)eh.
```

For e=0 the conclusion is immediate as well. Subtracting the squared
mean contribution 4e^2/h gives
sum_z(d_H(z)-2e/h)^2<=V. The left side is nonnegative, establishing V>=0.

Search use: propagate on actual H statistics

<a id="claim-sos-pivot-covariance"></a>
## 2. A rational SOS covariance certificate for the excess cut

Scope: the setting above with h>0; every positive rational t

Dependencies: Claim01; exact identity for J in the setting

Conclusion: with R=Z-W^2/h and V=(3/2)eh-4e^2/h,

```text
A<=2eW/h+sqrt(R*V),
J>=18W+Z-2eW/h-sqrt(R*V),
J>=18W+Z-2eW/h-(t*R+V/t)/2.
```

Proof. Put a_z=epsilon_z-W/h and b_z=d_H(z)-2e/h. Both sums vanish,
sum a_z^2=R>=0, sum b_z^2<=V, and
A=2eW/h+sum a_z*b_z. Cauchy--Schwarz gives sum a_z*b_z<=sqrt(RV).
For the rational version the exact elementary SOS identity is

```text
0<=sum_z(t*a_z-b_z)^2/t
  =t*R+(sum_z b_z^2)/t-2 sum_z a_z*b_z.
```

Use sum b_z^2<=V and substitute into J=18W+Z-A. Rational t makes all
displayed certificate coefficients rational when the input statistics are
integers. Integer J can be bounded by the ceiling of the rational lower
bound. If actual d_H(z) are available, their exact centered square sum can
replace V and can only improve the bound. For h=0, J=W=Z=0 separately.

This is a quadratic SOS step combined with a K5-free spectral/clique bound.
It is not a full Boolean SOS refutation or a claim about its hierarchy degree.

Search use: propagate, then branch through Claim03

<a id="claim-sos-pivot-family"></a>
## 3. Dense-root families and safe selected roots from any J certificate

Scope: the setting, any proved rational lower bound J_lo<=J,
any integer Q>=0 with 0<=D0=B0-Q-1<U0=min(W,B0)

Dependencies: q_v+E_v<=B0; E_v<=W; Claim02 if its bound is used;
Claim04 only for the same-edge corollary

Conclusion: put J_int=ceil(J_lo). Then

```text
M_Q=|{v in P:q_v<=Q}|
 >=max(0,ceil((J_int-p*D0)/(U0-D0))).
```

If the right side exceeds p, the specified statistics are impossible.
If M_Q>=12, two roots in this very q<=Q family are adjacent with overlap
at most ten by Claim04; the same edge has both endpoint deficits bounded.
Each family member has x_v<=136+B0+Q.

If v is safely chosen to minimize q over P, q_*=q_v satisfies

```text
q_*<=min(35,floor(B0-J_int/p)),
x_v<=136+B0+q_*.
```

Proof. A root outside the family has q_v>=Q+1 and therefore E_v<=D0.
Every family root has E_v<=U0 because q_v>=0 and E_v<=W. Thus
J_int<=J<=M_Q*U0+(p-M_Q)*D0. Rearrange and round upward.
The cap U0 improves the earlier use of W when B0<W. It is a universal
cap, not an assumption that every root simultaneously attains it.
Also x_v=136+q_v+(q_v+E_v)<=136+Q+B0 on the family.
For the selected root, sum q_v>=p*q_*; summing q_v+E_v<=B0 yields
p*q_*+J<=p*B0. The x bound follows at that same root. No minimization
of E is identified with minimization of q.

**Explicit conditional example, not a graph construction.** Suppose h=10,
W=50, Z=290, and e(H)=36. These excess moments correspond to eight
excess-six and two excess-one vertices, but no compatible graph is asserted.
Then p=33, B0=29, R=40, V=108/5. Choosing t=3/4 gives

```text
A<=360+(30+144/5)/2=1947/5,
J>=4003/5, hence J>=801.
```

The earlier exact-edge additive bound in
[pairwise refinement Claim01](pairwise_pivot_refinements.md#claim-pivot-pairwise-01)
would give only J>=9*50+290+2*(45-36)=758 here. The selected root now
has q_*<=floor(29-801/33)=4 and x_v<=169; that prior bound gives only
q_*<=6 and x_v<=171.
For Q=7, D0=21, U0=29, the new family count is
ceil((801-33*21)/8)=14. Thus a same-edge pair with overlap<=10 and both
neighborhood edge counts at least78 is guaranteed conditionally, with
both x<=172. The prior J lower bound with even the improved U0 cap
would yield only nine such roots, below the twelve-root threshold.
These bounds narrow a future conditional family; they do not eliminate it.

Search use: propagate | branch; safe selection must be used explicitly, and
a two-root branch must retain all maps and completions permitted by the
guaranteed profiles

<a id="claim-sos-pivot-twelve"></a>
## 4. Twelve degree-18 roots suffice for the same-family overlap bound

Scope: every subset F of P with |F|>=12, with no restrictions on W, h,
q, x, or how the family is chosen

Dependencies: the first four consequences proved in
[dense-pivot Claim01](dense_pivot_coverage.md#claim-dense-pivot-01),
R(3,3)=6 and R(3,4)=9; elementary C5 argument rederived below

Conclusion: some adjacent u,v in F satisfy |N_G(u) intersect N_G(v)|<=10.

Proof. Suppose every edge of G[F] has codegree at least eleven. The
accepted parent argument, which uses only the exact degree-18 assumption
and Ramsey hypotheses, establishes:

1. Every F triangle has all three edge codegrees exactly eleven, four
   common neighbors, and no ambient vertex adjacent to exactly one of
   its vertices. In particular G[F] is paw-free.
2. G[F] has no K4.
3. N_F(v) contains no independent four-set, for every v in F.
4. Every connected component D of G[F] satisfies |D|<=3*alpha(D).
   Components containing a triangle are complete tripartite.

The sum of component independence numbers is at most four. Hence |F|<=12,
and the only new case to rule out is |F|=12. Every component then attains
|D|=3*alpha(D), and alpha(G[F])=4.

**A triangle-free component cannot attain equality.** For independence
number one its order is at most two; for two it is at most five by
R(3,3)=6; for three at most eight by R(3,4)=9. Thus equality would
require a triangle-free component D of order twelve and alpha(D)=4.
Its neighborhoods are independent and contain no independent four-set,
so Delta(D)<=3. For v in D its 11-d_D(v) nonneighbors form a triangle-free
graph with no I4, hence have order at most eight. Thus d_D(v)>=3, and
D is cubic with eighteen edges.

Deleting v and its three independent neighbors removes exactly nine edges.
The eight remaining vertices form a triangle-free graph T with no I4
(an I4 there together with v would be I5) and exactly nine edges.
This is impossible by the following elementary bound.

Any triangle-free graph T of order eight and no I4 has minimum degree at
least two: its nonneighbors at a vertex have no I3 and are triangle-free,
so their order is at most five by R(3,3)=6. If e(T)<=9, a degree-two
vertex v exists. Its two neighbors u,w are nonadjacent. The other five
vertices S induce a triangle-free graph with no I3. Such a graph is C5:
each vertex has degree at most two because its neighborhood is independent,
and at least two because its nonneighbors have no independent pair: such
a pair together with the vertex would be I3. Those nonneighbors form a
clique and are triangle-free, so number at most two. Thus every degree
is two, and triangle-freeness makes the 2-regular five-vertex graph a C5.
The two edges at v and five C5 edges leave at most two edges between
{u,w} and S. Minimum degree two forces exactly one at each of u,w.
At least three vertices of S miss both u,w; among three triangle-free
vertices there is a nonadjacent pair. Together with u,w this is I4, a
contradiction. Therefore e(T)>=10, ruling out the cubic component.

Consequently all components of G[F] are complete tripartite. Equality
|D|=3*alpha(D) forces each of its three independent parts to have the
same size a. Let their part sizes be a_1,...,a_m, so sum_i a_i=4.

For a component K_{a,a,a}, let Z_D consist of ambient vertices outside
F that have a neighbor in each of its three parts. Such a vertex is
complete to at least two entire parts. Indeed, if it missed a vertex in
each of two parts, taking those two and a neighbor in the third produces
a triangle to which it is adjacent exactly once, forbidden by consequence1.
Thus it has at least a^2 neighbors among the a^3 triangles of D, where
"neighbor of a triangle" means adjacent to all three triangle vertices.
Every triangle has only four common neighbors. Double counting gives

```text
|Z_D|*a^2<=4a^3, hence |Z_D|<=4a.
```

Every ambient vertex z outside F must belong to some Z_D. Otherwise it
misses an entire part in each component. Choose all vertices of one such
missed part in each component. Their union is independent of order
sum_i a_i=4, and together with z forms I5.
There are 43-12=31 vertices outside F, but

```text
31<=sum_D |Z_D|<=4 sum_i a_i=16,
```

a contradiction. Thus |F|=12 is also impossible under the all-high-overlap
assumption, completing the proof.

Search use: branch | propagate. This is an overlapping unavoidable family
theorem. Excluding one representation or one overlap map is insufficient to
exclude the global family.

## Limits and author audit

The covariance inequality preserves actual H structure through e(H) and Z;
it does not claim a uniformly positive improvement over all prior bounds.
If excesses are constant, R=0 and the covariance term vanishes; if H is
edgeless, V=0. The new certificate should be combined with existing lower
bounds by taking their maximum. Generic spectral inequalities remain
auxiliary filters rather than a primary order-43 decision method.

The twelve-root theorem improves a coverage threshold, not the overlap cap.
No analogous claim for eleven roots is made. The example has all its
hypotheses stated as conditional statistics. No q<=2, W<=10, or small-x
assumption is silently used. Safe selected-root bounds apply only to roots
chosen to minimize q; same-family bounds apply only to the guaranteed
members. N(v) is never assumed I4-free.

Author self-check: the spectral inequality was independently expanded through
Rayleigh and weighted edge sums; the centered variables have exact zero
sums; the rational certificate is literally a sum of squares. The example
was evaluated using exact rational arithmetic only. The threshold extension
was checked component by component; independent sets are added across
components and triangle common-neighbor counts include all ambient vertices.
This is a self-check, not independent review or a formal certificate.

<a id="review-sos-pivot-finite"></a>
## Independent review of quadratic degree-18 pivot selection

Independent reviewer sos_finite accepted all four claims, separately from
author sos_pivot, for the exact uncommitted proof revision recorded in the
historical review. The retained integration manifest pairs that reviewed body
with its original audit and integrated source, records four accepted claims
and their permitted uses, and the former integration record explicitly
preserved the reviewed body. This is the correspondence behind the current
accepted state; the earlier ready labels were historical author metadata.
The later condensed audit retained the same outcomes, decisive checks and
limits. Its retired prose is consolidated here, not restored as a second proof.

### Independent checks

The reviewer read the degree/excess dependencies and independently rederived
the four high-codegree consequences from dense-pivot Claim 01. Checks covered
assumptions, quantifiers, ambient types, algebra, spectral direction, positive
parameters, integer rounding, exact equality at twelve roots, additive
component independence, global-vertex coverage, the example and conditional
branching use.

Weighted K5-free mass merging and the adjacency operator norm gave the
degree-square bound 3eh/2. Centered rational squares verified covariance for
t>0, including e=0 and the h>0 boundary. Family and selected-root bounds
were checked with positive denominators and the same root/statistics; E and
q minimizers were not conflated. The exact example reproduced R=40,
V=108/5, t=3/4, J>=4003/5, integer J>=801, q_*<=4 and M_7>=14.
For twelve roots, the reviewer reconstructed the equality components,
the eight-cell minimum 10 excluding the cubic triangle-free case, and
outside-vertex coverage allowing at most 16 of 31 vertices. Counts include
all ambient common neighbors and overlapping component cover sets.

### Outcome and limits

Outcome: accepted for all four claims on their exact stated dependencies.
Permitted use is degree/variance/covariance propagation, safe selected-root
and conditional same-family branching, and termination only of an explicitly
inconsistent statistic profile. Twelve-root coverage remains an overlapping
unavoidable-family statement requiring every permitted root profile, overlap
map and completion in eventual exhaustive gluing.

The review supplies no graph construction, order-43 nonexistence, general
degree-18 existence, unconditional small-x or small-excess assumption, or
novelty result. It is independent mathematical review, not a formal
certificate or replay of the external census. Exact Ramsey values and census
extrema remain external premises. No solver, graph enumeration, download,
installation, staging or commit was used in the review.

## Validation of the conditional example

Exact rational replay reproduced each bound in the displayed covariance
example, including the integer J bound, selected-root deficit and family
count. The selected-root cross-count formula also reproduced all six entries
of the low-W table in the pairwise topic. This is arithmetic validation,
not renewed independent review or evidence that the specified profile occurs.

## Changelog

- Independent review accepted the degree-square, rational covariance, safe
  family/selected-root and twelve-root overlap claims on their stated premises.
- Reconciled historical ready labels with that documented acceptance and
  consolidated the existing condensed review inline. The retained JSON
  manifest remains historical integration evidence, not current prose metadata.
- Preserved the full mathematical development, conditional example, limits
  and all original section/claim anchors; removed duplicated date/hash/task
  administration and the obsolete synthesis link.
