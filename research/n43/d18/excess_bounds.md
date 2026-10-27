# Conditional upper bounds on degree excess

Scope: local deductions for an order-43 (5,5)-free graph with nonempty
degree-18 set P; exact h and W hypotheses are retained in each result.
Author: branch authors. Kind: derived-here necessary cut, excess, selected-root
and pointed-overlap bounds. Review state: draft (self-audited, without
standalone independent acceptance); scoped dependency checks are listed below.

| Development | Review coverage | Permitted mathematical use |
| --- | --- | --- |
| Sections 1--7 as a standalone development, including the selected-minimum-E bounds | Author degree/cut and exact-table audits only | Necessary conditional deductions; no new executable pruning authorization |
| Degree/cut identities, capacities and overlap premises used by pairwise refinements | Independently rederived by the coordinator for those accepted claims, not all of this topic | Use within the accepted dependent claims' exact scopes |
| Section 4 forced-q0 premise at (h,W)=(2,8),(4,20),(6,32) | Independently rederived by cr10 for the accepted forced-q0 closure consequence | That scoped unavoidable-root premise; not a promotion of the remaining sections |

Dependencies: [pivot classes](pivot_classes.md) and its recorded degree and
edge-census premises; Turan's theorem for H or its complement, each K5-free.
The external census source is Angeltveit--McKay, *R(5,5)<=46*,
[arXiv:2409.15709v2](https://arxiv.org/abs/2409.15709v2), Appendix A Table 1,
as retained in the linked topic; it is not recertified here.

Summary: the high-degree cut gives conditional W upper bounds and dense-root
existence, while separate weighted averages select a small-E root. Neither
small h nor small W is established globally, and the minimum-E root cannot
be identified with a maximum-edge root without proof. The original audits
used degree and cut counts and exact arithmetic on the stated finite tables;
no graph search, solver, catalogue acquisition, or novelty review was performed.

## 1. Setting and existing bounds

Let G be an order-43 (5,5)-free graph with degree-18 vertices. Let P denote
those vertices, H the higher-degree vertices, h=|H|, p=43-h, and
epsilon_z=d_G(z)-18. Put W=sum_z epsilon_z and Z=sum_z epsilon_z^2.
Thus W is even, h<=W<=6h, and e(G)=387+W/2. For v in P put
q_v=85-e(N(v)) and E_v=sum_(z adjacent v)epsilon_z.
The census inputs in `research/n43/d18/pivot_classes.md` imply

```
q_v+E_v<=W/2+4.
```

The universal row bound gives x_v<=306, hence E_v<=170-2q_v. It is weaker
than E_v<=108 when q_v<=31, including the dense frontier, but tighter when
q_v>=32. Also retain E_v<=W, E_v<=6 min(18,h), and q_v+E_v<=W/2+4.

The elementary bound for an arbitrary graph containing a degree-18 root is
W<=252 (42 vertices of excess at most six). The conditional results below
supply the improvements; no small-h assumption is made globally.

## 2. High-degree cut obstruction

Assume q_v>=Q for every v in P, where Q>=0 is a specified integer.
Consequently E_v<=B=W/2+4-Q for every such root. If v has m neighbors in H,
the h-m nonneighbors in H carry at most 6(h-m) of the total excess. Therefore

```
E_v>=W-6(h-m).
```

Combining these bounds gives

```
m <= t = h-ceil((W/2-4+Q)/6).
```

Retain m<=min(h,18,t).
The formula follows equivalently by solving 6m<=6h-W/2+4-Q for the integer m.
Negative ceilings cause no problem if the final bound is capped by h and 18;
a negative t rules out the profile entirely.

Now count the P-H cut. Degree summation over H gives

```
C=e(P,H)=18h+W-2e(G[H]).
```

G[H] is K5-free, so Turan gives e(G[H])<=floor(3h^2/8). On the other hand,
the P side gives C<=p min(h,18,t). Every candidate must therefore satisfy

```
18h+W-2floor(3h^2/8) <= (43-h)min(h,18,t).
```

This is a general necessary inequality involving h,W and the absence of
dense degree-18 neighborhoods. It is not restricted to the frontier band.
It uses no graph catalogue beyond the q+E bound.

There is an explicit refinement using actual degree counts. Sort the h
positive excesses as eta_1<=...<=eta_h and put S_m=sum_(i=1..m)eta_i,
with S_0=0. A root with m neighbors in H has E_v>=S_m. Define

```
t_seq(Q)=max{m:0<=m<=min(h,18), S_m<=W/2+4-Q}.
```

If the set is empty, the profile is impossible. Otherwise every root with
q_v>=Q has at most t_seq(Q) neighbors in H, giving the stronger necessary
inequality

```
18h+W-2floor(3h^2/8) <= p*t_seq(Q).
```

Indeed S_m>=W-6(h-m), so this refinement implies the earlier bound.
When individual q_v values are retained, replace p*t_seq(Q) by
sum_(v in P)t_seq(q_v). This remains only a necessary cut filter: it does
not assert that the roots can simultaneously choose the cheapest excesses.

## 3. Explicit W upper bounds with few higher-degree vertices

First set Q=0; all degree-18 roots satisfy q_v>=0 by the published maximum
85. The cut inequality excludes:

|h|excluded W near the elementary maximum|proved W upper bound|
|---|---|---|
|2|10,12|8|
|4|22,24|20|
|6|34,36|32|
|8|46,48|44|
|10|60|58|

To audit the first four rows, write W=6h-D. The excluded even values have
D=0 or2. For even h=2,4,6,8 these values force m<=h/2 for every root in P.
The lower cut bound exceeds p*h/2, as follows:

|h|18h-2floor(3h^2/8)|p*h/2|
|---|---|---|
|2|34|41|
|4|60|78|
|6|82|111|
|8|96|140|
|10|106|165|

Adding the smallest excluded W gives respectively 44,82,116,142,166,
each larger than the right-hand capacity. For h=10 this calculation covers
W=60; W=58 does not give this contradiction. Other h are governed by the
general inequality, not an unstated interpolation of these rows.

Combining these W bounds with q+E<=W/2+4 gives, for every v in P:

|h|W upper bound|E_v upper bound|
|---|---|---|
|2|8|8|
|4|20|14|
|6|32|20|
|8|44|26|
|10|58|33|

These remain conditional on the stated exact h, not on W being assumed small.

## 4. Absence of 85-edge roots sharpens the upper bounds

If no degree-18 vertex has an 85-edge neighborhood, then q_v>=1 for all P.
The same cut inequality excludes one further W value in each of the first
three rows:

|h|additional excluded W|proved W upper bound|all E_v upper bound|
|---|---|---|---|
|2|8|6|6|
|4|20|18|12|
|6|32|30|18|

At the excluded value W=6h-4, the bound E_v<=W/2+3 prevents m>=h/2+1,
because such an m would give E_v>=W-6(h/2-1)=3h+2, whereas the upper
bound is 3h+1. The cut is then too large: 42>41, 80>78, or114>111.

Equivalent unavoidable-family conclusion: for h=2,W=8; h=4,W=20; or
h=6,W=32, some degree-18 root has q=0. For larger even W in the
same h rows, the whole profile has already been excluded in Section 3.
This does not force E=0 or x=136 at the extremal root: E<=W/2+4 still
allows x=136+E to be substantially larger.

## 5. A selected root can have still smaller E

Let J=sum_(v in P)E_v. Count from H:

```
J=sum_(z in H)epsilon_z*d_P(z)
 =18W+Z-sum_(yz edge in G[H])(epsilon_y+epsilon_z)
 <=18W+Z<=24W.
```

Thus some degree-18 root satisfies E_v<=floor((18W+Z)/p), and in
particular E_v<=floor(24W/p). There is also the individual bound
E_v<=W/2+4-Q. One may choose a root minimizing E_v, but this is a different
selection from maximizing neighborhood edges; both properties cannot be
assumed for the same root without proof.

There are two useful refinements. First, at fixed h and W the sharp numerical
upper bound on Z for excesses in {1,...,6} is

```
W-h=5a+r, 0<=r<5,
Z<=Z_max(h,W)=h+35a+r(r+2).
```

To see this, transfer one unit of excess from a smaller entry greater than one
to a larger entry less than six. The sum of squares increases. At a maximum,
all entries except possibly one are one or six; there are a sixes and, if
r>0, one entry 1+r. The formula includes h=W=0. It is nondecreasing in W
for fixed h. For h=4 and Q=1, W<=18 gives Z<=98, so some root has
E_v<=floor((18*18+98)/39)=10, improving the coarser bound eleven.

Second, count unweighted neighbors in H. Write

```
L_h=C(h,2)-floor(3h^2/8).
```

Since alpha(G[H])<=4, Turan applied to the complement gives e(G[H])>=L_h.
Thus C<=18h+W-2L_h, and some root has at most
floor((18h+W-2L_h)/p) neighbors in H. Each contributes at most six, so
some degree-18 root satisfies

```
E_v<=6 floor((18h+W-2L_h)/p).
```

Combining the existence bounds by choosing a root minimizing E_v gives

```
min_(v in P) E_v <= min(
  W, 6 min(18,h), W/2+4-Q,
  floor((18W+Z_max(h,W))/p),
  6 floor((18h+W-2L_h)/p)).
```

For Q=0 the following table uses the cut bounds when available and W<=6h
otherwise. These rows are exact-h statements, not interpolated ranges.

|h|W upper bound used|all E_v upper bound|some E_v upper bound|
|---|---|---|---|
|0|0|0|0|
|1|6|6|0|
|2|8|8|4|
|3|18|13|6|
|4|20|14|12|
|5|30|19|18|
|6|32|20|18|

For h=1,3,6 the upper cut counts are 24,72,136 and p is 42,40,37:
some root has at most zero, one, three neighbors in H, respectively.
For h=2,4,5 use the weighted bound instead: at W=8,20,30 the respective
Z_max values are 40,112,180, yielding floors 4,12,18.
If Q=1, the selected-root bounds for h=2 and h=4 improve to three and ten.
The actual Z and weighted edges of H can tighten these estimates further.

## 6. Small h gives overlap bounds without any small-W assumption

Every v in P has at least 18-h degree-18 neighbors. In the overlap formula
from `research/n43/d18/pivot_classes.md`, bound the number z of higher-degree neighbors
by h rather than by E. Then some adjacent degree-18 u satisfies

```
lambda_vu<=min(13,
 floor((170-2q_v-max(0,6-q_v)*h)/(18-h)))
```

for h<18. The expression follows from a monotone bound in z; it does not
replace the sharper actual-multiplicity formula. Maximizing over q=0,...,35
gives, for h=0,1,2,3,4,5, overlap at most 9,9,9,10,11,12 respectively.
Thus h<=2 forces an overlap-at-most-nine adjacent degree-18 pair even when
W is not in the earlier W<=2 table; h<=3 gives overlap at most ten.
This uses the published E(4,5,17)=79.

## 7. Limits and continuation

The cut obstruction gives genuine conditional W bounds and, in the absence
of extremal roots, stronger bounds or forced q=0 families. It does not prove
that h is small in an arbitrary order-43 candidate. High h remains the coverage
gap. The t_seq inequality already gives a filter for actual degree counts;
combining it with sharper constraints on G[H] is the next route to extend
these conclusions. The
selected-root E bound supplies a separate route when an unavoidable dense
neighborhood cannot yet be proved.

Audit: W parity and h<=W<=6h are degree sums; the omitted-excess argument
counts all nonneighbors in H; cut degrees were counted from both sides;
Turan is applied only to H or its complement, each K5-free. Tables were
checked by exact integer and rational arithmetic. No excluded row is a
graph-search result.

## Historical independent review coverage

<a id="review-excess-scoped-dependencies"></a>
The [pairwise coordinator review](pairwise_pivot_refinements.md#review-pairwise-pivot-coordinator)
independently rederived the q+E budget, degree/cut identities, integer
capacities and pointed overlap bounds needed by its four accepted claims.
The [dense-family review](dense_pivot_coverage.md#review-dense-pivot-low-excess)
also rederived the root budget from degree/edge sums and applicable extrema.
Neither review accepts the entire excess-bound development, and in particular
the selected-minimum-E bounds in Section 5 remain author-audited here.

Reviewer cr10 independently checked the Section 4 premise for the accepted
[forced-q0 closure consequence](x136_closure_consequences.md#claim-closure-consequences-forced-q0).
The [shared review](review_closure_consequences_forced_q0_20261021_cr10.md)
rederived q>=0, q+E<=W/2+4, the omitted-excess capacity and the P-H cut.
Assuming q>=1 at every root gives m<=h/2 for W=6h-4; the three decisive
contradictions are 42>41, 80>78 and 114>111. No root selector or I4-free
neighborhood assumption is used. Its outcome accepts the dependent
forced-q0 claim, explicitly not this note wholesale; the external census
premises and x136 closure dependency are not recertified by that review.

## Changelog

- Established the conditional cut bounds, separate minimum-E selection and
  exact-h pointed-overlap bounds, with author arithmetic audits.
- Recorded scoped independent dependency checks, including the forced-q0
  premise, without promoting the unreviewed remainder.
- Consolidated topic metadata and review coverage; statements, proofs and
  numerical tables are unchanged.
