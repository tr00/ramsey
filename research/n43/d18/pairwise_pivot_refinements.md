# Pairwise refinements of pivot selection, excess cuts and dense families

Scope: local deductions for order-43 K5/I5-free graphs with at least one
degree-18 root; exact degree data and explicit root-selection hypotheses are
retained per claim. Author: pivot/excess agent. Independent reviewer: Codex
coordinator, a distinct agent. All four claims are accepted on their stated
premise chains; acceptance does not promote the parent topics wholesale.

| Claim | Kind and review state | Permitted search use |
| --- | --- | --- |
| [01](#claim-pivot-pairwise-01), weighted family inequality | Local deduction; accepted | Propagate |
| [02](#claim-pivot-pairwise-02), cut-capacity family count | Local deduction; accepted | Propagate; conditional family branching |
| [03](#claim-pivot-pairwise-03), exact dense-root profiles | Local deduction; accepted | Propagate; conditional pointed branching |
| [04](#claim-pivot-pairwise-04), maximum-edge selected root | Local deduction; accepted | Branch and propagate only under explicit safe selection, retaining all maximizers |

Dependencies and literature: [pivot classes](pivot_classes.md),
[excess bounds](excess_bounds.md), [cliques and augmentation](cliques_augmentation.md),
Turan's theorem, and the recorded order-17/18/24 census premises of
Angeltveit--McKay, [arXiv:2409.15709v2](https://arxiv.org/abs/2409.15709v2),
Appendix A Table 1. These external premises are retained, not recertified.

Summary: weighted missing-edge and cut capacities improve conditional dense
families, force exact pointed profiles, and safely narrow the cross-count band
at a maximum-edge root. Separate dense-family and overlap edges cannot be
identified, and no unrestricted small-h or small-W theorem or branch closure
is supplied. The bounded tables were author-checked by exact integer
arithmetic; the [independent review](#review-pairwise-pivot-coordinator) records
the separate acceptance checks. No graph enumeration, solver, download,
installation, or novelty review was performed.

The useful links are between [pivot families](pivot_classes.md),
[high-degree cuts](excess_bounds.md), and [maximum-edge pivot
selection](cliques_augmentation.md#3-choosing-a-pivot-by-neighborhood-edge-count).
The first two used different capacities for the same degree-18 root set; the
third permits transferring a global average to one safely selected root.

## Common setting

G is an order-43 graph with no K5 or I5 and at least one degree-18 vertex.
Let P be the degree-18 vertices, H the higher-degree vertices, h=|H|,
p=43-h, epsilon_z=d_G(z)-18, W=sum_z epsilon_z and Z=sum_z epsilon_z^2.
For v in P put q_v=85-e(G[N(v)]) and E_v=sum_(z adjacent v)epsilon_z.
Let B0=W/2+4 (a scalar, not an antineighborhood), and J=sum_(v in P)E_v.
The established premises retained here are

```text
0<=epsilon_z<=6; W even; h<=W<=6h;
0<=q_v<=35; q_v+E_v<=B0;
x_v=e(N(v),M(v))=136+2q_v+E_v;
C=e(P,H)=18h+W-2e(G[H]).
```

The numerical census dependencies are the (4,5,18) interval 50..85,
the complemented (4,5,24) interval giving 144..160, and the
(4,5,17) upper extremum 79 for the pointed-overlap corollaries.
These are the existing premises in the linked parent notes. This note does
not re-certify the external census. H and its complement are K5-free;
N(v) is (4,5)-free and may contain independent four-sets.

<a id="claim-pivot-pairwise-01"></a>
## 1. The missing edges inside H improve the weighted family inequality

Scope: common setting; any h, with h=0 handled separately

Dependencies: `pivot_classes.md`, sections 1 and 4; `excess_bounds.md`, section 5; Turan's theorem

Conclusion: the weighted lower bound and family refinement below

For h>0 let eta_min=min_(z in H)epsilon_z and
L_h=C(h,2)-floor(3h^2/8). Then

```text
J=(19-h)W+Z+
  sum_(yz nonedge in G[H])(epsilon_y+epsilon_z)
 >= (19-h)W+Z+2*eta_min*L_h.
```

Proof. A vertex z in H has 18+epsilon_z neighbors overall and
d_H(z)=h-1-d_barH(z) inside H. Hence
d_P(z)=19+epsilon_z-h+d_barH(z). Multiplying by epsilon_z and summing
counts J. Each H nonedge contributes epsilon_y+epsilon_z; since
complement H is K5-free, it has at most floor(3h^2/8) edges, equivalently
H has at least L_h edges. For the lower bound on the number of H nonedges
instead apply Turan to H itself: H has at most floor(3h^2/8) edges, so
it has at least L_h nonedges. Each has weight at least 2*eta_min.
This proves the displayed formula and inequality. If h=0, J=W=Z=0.

For a bound using only h,W, replace eta_min by one and Z by

```text
Z_min(h,W)=h*a^2+r*(2a+1), W=h*a+r, 0<=r<h.
```

Convexity, or transferring a unit from an entry at least two larger than
another entry, proves this minimum square sum; the feasible balanced entries
are between one and six. Let J_lo denote either valid lower bound.
The family inequality in `pivot_classes.md` improves by replacing its old
J lower bound by J_lo: for M_Q=|{v in P:q_v<=Q}| and
D0=B0-Q-1, whenever 0<=D0<W,

```text
M_Q>=max(0,ceil((J_lo-p*D0)/(W-D0))).
```

Indeed q_v>=Q+1 gives E_v<=D0, and every family root has E_v<=W.
For example W=6 and Q=4 gives D0=2. The cases h=1,...,6 have valid
J_lo=144,120,108,100,94,88 using Z_min and eta_min>=1. The last case
gives M_4>=ceil((88-37*2)/4)=4, and the other cases give at least four.
Thus the previously guaranteed three 81-edge roots at W=6 become four.
Four roots alone do not force adjacency since alpha(G) may equal four.

<a id="claim-pivot-pairwise-02"></a>
## 2. Cut capacity turns a dense-root existence argument into a family count

Scope: common setting, actual positive excess multiset of H

Dependencies: `excess_bounds.md`, section 2; common census premises

Conclusion: the cut-capacity family bound and examples below

Sort the H excesses eta_1<=...<=eta_h and write S_m=sum_(i<=m)eta_i.
Define

```text
t(j)=max{m:0<=m<=min(h,18), S_m<=B0-j},
C_lo=18h+W-2floor(3h^2/8).
```

If the defining set is empty, no root with q_v>=j is possible.
Suppose t(0) and t(Q+1) exist and t(0)>t(Q+1). Then

```text
M_Q>=max(0,ceil((C_lo-p*t(Q+1))/(t(0)-t(Q+1)))).
```

The actual C may replace C_lo if e(H) is known. If t(0)=t(Q+1),
then C_lo>p*t(0) excludes the profile, while this capacity alone gives
no family count when C_lo<=p*t(0).

Proof. A root with m neighbors in H has E_v>=S_m. Thus every root has
m<=t(0), and a root outside the q<=Q family has m<=t(Q+1).
Count the same P-H cut from both sides:
C_lo<=C<=M_Q*t(0)+(p-M_Q)*t(Q+1). Rearrangement gives the result.
It assumes no simultaneous ability to choose the cheapest excesses: each
root merely obeys a necessary capacity bound.

Two conditional branches beyond W<=10 now force large dense families:

|h|W|H excesses|Q|t(0)|t(Q+1)|C_lo|p|guaranteed M_Q|
|---|---|---|---|---|---|---|---|---|
|3|18|6,6,6|1|2|1|66|40|26|
|5|30|6,6,6,6,6|2|3|2|102|38|26|

For h=3,W=18, B0=13: q>=2 implies E<=11 and therefore at most one
H neighbor. For h=5,W=30, B0=19: q>=3 implies E<=16 and therefore
at most two H neighbors. These prove the table directly. Any five family
roots contain an edge since alpha(G)<=4. Thus the first branch forces
adjacent degree-18 roots whose neighborhoods both have at least 84 edges,
and the second forces such roots with at least 83 edges. In either branch
the four-transversal theorem applies at both endpoints. This does not assert
a small overlap for the same pair, or realizability of either degree profile.

<a id="claim-pivot-pairwise-03"></a>
## 3. The extremal small-h cuts force exact dense-root profiles and pointed pairs

Scope: common setting and one exact (h,W) row in the table

Dependencies: claim-pivot-pairwise-02; `pivot_classes.md`, section 2

Conclusion: forced root counts, exact first-root profile, and pointed overlap bounds

|h|W|p|C_lo|at least this many roots|their (q,E,m_H,x)|some adjacent d18 neighbor overlap|
|---|---|---|---|---|---|---|
|2|8|41|42|1|(0,8,2,144)|<=9|
|4|20|39|80|2|(0,14,3,150)|<=10|
|6|32|37|114|3|(0,20,4,156)|<=10|

Proof. Write h=2a, W=6h-4 and B0=3h+2. The omitted-excess argument gives
E_v>=W-6(h-m_H)=6m_H-4. Since E_v<=B0, m_H<=a+1.
Roots with q>=1 satisfy E_v<=3h+1 and hence m_H<=a.
More strongly, every root with m_H=a+1 has E_v>=3h+2=B0, so
E_v=B0 and q_v=0. The lower cut exceeds p*a by respectively 1,2,3
in the three rows. Because no root has m_H>a+1, the cut surplus forces
at least the listed number of exact profiles.

At each such root v, the a-1 omitted H vertices have total excess
W-E_v=3h-6=6(a-1), so every omitted H vertex has excess six.
In particular h=4 forces at least one excess-six vertex, and h=6 forces
at least two. This is a necessary count, not an assumed neighbor assignment.

For the overlap corollary, q_v=0 means every vertex of N(v) has internal
degree at least 85-79=6. The m_H higher-degree neighbors account for
at least 6m_H of the total internal degree 170. Among the 18-m_H
degree-18 neighbors, one therefore has internal degree, equivalently
lambda_vu, at most floor((170-6m_H)/(18-m_H)). The three values are
9,10,10. The adjacent companion u need not have q_u=0. Thus this is
a pointed-pair family, with a prescribed first endpoint; it is not a pair
of 85-edge neighborhoods. All overlap maps and completion cells must remain
covered in any later exhaustive gluing use.

<a id="claim-pivot-pairwise-04"></a>
## 4. Safe maximum-edge root selection gives a smaller cross-count band

Scope: common setting; v explicitly chosen to maximize e(N(v)) over P

Dependencies: claim-pivot-pairwise-01; `cliques_augmentation.md`, section 3; `pivot_classes.md`, sections 1..3

Conclusion: same selected root satisfies the bound and pointed-pair table below

Put q_*=min_(u in P)q_u, so q_v=q_*. Summing q_u+E_u<=B0 and using
q_u>=q_* gives p*q_*+J<=p*B0. Therefore

```text
q_*<=min(35,floor(B0-J_lo/p)),
E_v<=B0-q_*,
x_v=136+2q_*+E_v<=136+B0+q_*.
```

The first inequality bounds q_* at the maximum-edge root itself; no root
minimizing E is selected or equated with it. The average improves q, and
the universal q+E bound supplies E at this same root. For fixed W<=10,
use h<=W and the numerical J_lo from claim 01 to obtain:

|W|selected q_* upper bound|selected x_v upper bound|some adjacent d18 neighbor overlap at most|
|---|---|---|---|
|0|4|144|9|
|2|4|145|9|
|4|4|146|10|
|6|4|147|11|
|8|5|149|12|
|10|5|150|12|

Audit of the q table: for h=1,...,W with W<=6h, evaluate
floor(B0-((19-h)W+Z_min(h,W)+2L_h)/(43-h)); its maxima for W=2,4,6,8,10
are 4,4,4,5,5. W=0 has h=0 and q_*<=4 directly.
For W=8,h=8, L_h=4 and J_lo=104, giving q_*<=5; the table does not
claim q_*<=4 there. For the overlap table, set E<=min(W,B0-q) in
the existing expression

```text
min(13,floor((170-2q-max(0,6-q)*E)/(18-E))).
```

Its maxima over q=0,...,4 for W<=6, or q=0,...,5 for W=8,10,
give the displayed values. Since E_v<=10<18, v has a degree-18 neighbor.
The companion also satisfies q_u>=q_* and the existing universal W-row
bounds, but need not be a maximizing root.

Allowing all maximizing roots preserves existence coverage. These bounds
cannot be imposed on an arbitrary previously chosen degree-18 root.
They narrow conditional gluing families: the first endpoint has the sharper
cross-count cap and the maximum-edge interface transfer inequalities; the
second endpoint keeps all choices consistent with that transfer.

## Limits and proposed integration

All statements above are necessary conditions for hypothetical candidates.
They close no order-43 branch, give no bound on h for the whole d18 branch,
and provide no independently checkable exhaustive certificate. The large
dense families in claim 02 force two dense endpoints, while the overlap
claims prescribe only one dense endpoint; their conclusions cannot be joined
into a stronger pair statement without another argument. Claim 04 is a safe
alternative root-selection scheme, not an additional predicate on every
representation. The linked independent review governs use in shared indexes or executable
pruning; it is conditional on the retained external census premises.

<a id="review-pairwise-pivot-coordinator"></a>
## Independent review of pivot/excess pairings

The Codex coordinator independently accepted claims 01--04 on the stated
premises, separately from author pivot/excess agent. The historical review
identified an exact uncommitted proof revision and expressly preserved its
acceptance through metadata/formatting changes, including conversion of
metadata hard-break spaces to blank paragraphs; proof changes require renewed
review. The retained development is that accepted argument, not a new review.
The reviewer rederived q+E<=W/2+4, the degree/cut identities, integer
capacities and pointed overlap bounds from the dependency snapshots. The
external order-18/24 extrema and order-17 maximum 79 were not recertified.

- Claim 01: checked the weighted nonedge identity, the direction of Turan on
  H versus complement-Turan, and the balanced-excess square minimum. The six
  W=6 lower bounds and uniform count four were independently reproduced;
  four roots alone do not force adjacency.
- Claim 02: verified the S_m capacities separately at every root without a
  simultaneous minimum-cost assignment assumption. The h3/W18 and h5/W30
  cut surpluses give 66-40=26 and 102-76=26 family roots, respectively;
  alpha<=4 gives two dense endpoints but not a same-edge overlap cap.
- Claim 03: checked that m_H=a+1 forces E=3h+2 and q=0, the cut surpluses
  1,2,3, and the excess-six omitted vertices. Interior degree accounting gives
  pointed overlap caps 9,10,10; the companion need not share the deficit.
- Claim 04: verified that the average and the rootwise budget constrain the
  same minimum-q root, with no minimum-E selector substituted. Exact rational
  arithmetic for every feasible h at even W=0..10 reproduced q caps
  4,4,4,4,5,5, x caps 144,145,146,147,149,150 and overlap caps
  9,9,10,11,12,12. Existence coverage keeps all maximizing roots.

Outcome: accepted for numerical propagation and conditional pointed/family
branching. No whole order-43 or degree-18 branch is terminated; no unrestricted
bound on h or W is established. No catalogue replay, formal proof checking,
graph enumeration, novelty review or exhaustion certificate was supplied.
Maximum-edge selection cannot constrain an arbitrary previously chosen root,
and separate dense-family and overlap guarantees cannot be merged.

## Changelog

- The independent coordinator accepted all four claims and their conditional
  propagation/branching uses, with the external census premises retained.
- Consolidated the topic-specific review inline and replaced repeated claim
  administration with a topic-level review/use table. The mathematical
  development, claim anchors, tables and review outcome are unchanged.
