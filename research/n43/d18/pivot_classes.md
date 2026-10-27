# Degree-18 pivot classes and conditional unavoidable pairs

Scope: local deductions for an order-43 (5,5)-free graph and its actual
degree-18 roots. Numerical profiles partition roots, not neighborhood
isomorphism classes. Author: branch authors; independent reviewers cover only
the scoped material listed below. No novelty or order-43 exclusion is claimed.

| Development | Kind and review state | Permitted mathematical use |
| --- | --- | --- |
| Sections 1 and 3--6; original Section 2 overlap development as a standalone topic | Derived here; draft (self-audited, without standalone independent acceptance) | Necessary profile and conditional-family deductions; not a new executable pruning authorization |
| Section 2 corrected adjacent-root cell paragraph | Local deduction; accepted after the scoped LegacyCellAudit correction | Use the corrected cell types and unchanged overlap bounds |
| Section 2 strengthened interior floor, ceiling, and pointed filters | Imported accepted local deductions from [interior transfer](interior_transfer.md#claim-interior-transfer-interface), independently reviewed by InteriorAudit | Parameter-conditioned propagation and pointed-family branching on the exact hypotheses |

Dependencies: the degree and census premises in
[theory phase I](../../../docs/theory_phase_1.md),
[lemma phase II](../../../docs/lemma_phase_2.md),
[frontier band](frontier_band.md), and
[cliques and augmentation](cliques_augmentation.md); Angeltveit--McKay,
*R(5,5)<=46*, [arXiv:2409.15709v2](https://arxiv.org/abs/2409.15709v2),
Appendix A Table 1, including E(4,5,17)=79. External numerical premises are
retained, not recertified here.

Summary: the profiles and overlap filters give necessary conditions, complete
conditional near-regular pointed families, and weighted dense-root counts.
Neither a global small-W hypothesis nor the dense frontier is forced. Separate
family and overlap guarantees must not be joined without a same-pair argument.
The degree, edge, incidence, overlap and table arithmetic audits in this topic
are author self-checks; no solver or graph enumeration was run.

## 1. Complete numerical profiles

Let G be an order-43 (5,5)-free graph. Define epsilon_z=d_G(z)-18 and
W=sum_z epsilon_z. Then 0<=epsilon_z<=6, W is even, and e(G)=387+W/2.
For each degree-18 vertex v put

```
a_v=e(G[N(v)]), q_v=85-a_v,
E_v=sum_(z adjacent v) epsilon_z,
m_i(v)=|{z adjacent v:d_G(z)=18+i}|, i=0,...,6.
```

The published (4,5,18) interval 50..85 gives 0<=q_v<=35. The numerical
class is (q_v,m_0(v),...,m_6(v)); W is shared by every root in the graph.
It is a complete partition of actual degree-18 roots, not an isomorphism
classification of their neighborhoods. Every realized root satisfies

```
sum_i m_i=18, E_v=sum_i i*m_i,
x_v=136+2q_v+E_v,
b_v=e(G[M(v)])=148+W/2-q_v-E_v.
```

The published (4,5,24) interval 116..132, after complementation, gives
144<=b_v<=160. Hence

```
max(0,W/2-12-E_v)<=q_v<=min(35,W/2+4-E_v).
```

Also E_v<=W, E_v<=108, W-E_v<=144, and x_v<=306 by the row bound 17.
If n_i counts all vertices of degree 18+i, then m_i<=n_i for i>0 and
m_0<=n_0-1. These restrictions are necessary, not sufficient for realization.
An equivalent root class can be indexed by (q_v,E_v), then refined by the
neighbor-degree multiplicities. In particular E_v bounds the number of
non-degree-18 neighbors, not their precise number.

### Useful class distinctions

|q_v|neighborhood edges|available internal-graph facts|
|---|---|---|
|0|85|K4-saturated; four-transversal bound|
|1|84|four-transversal bound; at most three individually safe missing edges|
|2|83|four-transversal bound|
|3|82|elementary three-transversal bound; four-transversal bound not proved here|
|4..35|81..50|general degree/codegree/interface bounds; further refinements needed|

The q<=2 facts apply regardless of E_v; small x additionally limits E_v.
The elementary deletion-two proof of tau>=3 works for complement edge count
less than 72, including q=3. Neighborhoods in the last row are not excluded.

## 2. Low-excess profiles force adjacent degree-18 roots

Put t=m_0(v), z=18-t. Since each of the z higher-degree neighbors contributes
at least one to E_v, z<=E_v and t>=18-E_v. Thus E_v<18 guarantees t>0.

There is a quantitative overlap bound. The published upper extremum
E(4,5,17)=79 (Angeltveit-McKay, Appendix A, Table 1) gives

```
d_(N(v))(u)>=max(0,a_v-79)=max(0,6-q_v).
```

For a higher-degree neighbor of excess i, the mixed-cell bound additionally
gives d_(N(v))(u)>=i. Summing internal degrees of N(v), some degree-18
neighbor u therefore has codegree lambda_vu satisfying

```
lambda_vu <= min(13,
 floor((170-2q_v-sum_(i=1..6)m_i*max(0,6-q_v,i))/t)).
```

This is a proved pointed-pair filter. For E_v<=17 a simpler bound is

```
lambda_vu <= min(13,
 floor((170-2q_v-max(0,6-q_v)*E_v)/(18-E_v))).
```

Audit of the simplification: with L=max(0,6-q_v), the function
(170-2q_v-L*z)/(18-z) is increasing in z because
170-2q_v-18L>=0 for every q_v=0,...,35. Use z<=E_v.

The [reviewed interior transfer](interior_transfer.md), with its
[historical machine-readable independent audit](review_interior_transfer_20261019.json),
strengthens the floor L in both formulas above, uniformly in x and E_v:

|q_v|0|1|2..5|6..10|11..15|16|17..35|
|---|---|---|---|---|---|---|---|
|L(q_v)|6|5|4|3|2|1|0|

One may also replace the upper cap 13 by D(q_v)=min(13,44-q_v).
Thus, for E_v<=17, the strengthened bound is
lambda_vu<=min(D(q_v),floor((170-2q_v-L(q_v)*E_v)/(18-E_v))).
The actual-multiplicity formula uses max(L(q_v),i) for each excess-i
neighbor. At (q_v,E_v)=(4,4),(5,8),(10,4), the upper overlap bounds
improve from 11,13,10 to 10,12,9 respectively. These remain bounds on
one adjacent degree-18 companion, not on a companion with matching q or E.
The older tables remain valid; their worst-case W<=10 overlap caps do not
improve. The new floor and ceiling also tighten individual row intervals.

For all small frontier classes this yields:

|x_v|(q_v,E_v)|guaranteed degree-18 neighbor with codegree at most|
|---|---|---|
|136|(0,0)|9|
|137|(0,1)|9|
|138|(0,2), (1,0)|9|
|139|(0,3); (1,1)|10; 9|
|140|(0,4); (1,2); (2,0)|10; 9; 9|
|141|(0,5); (1,3); (2,1)|10; 10; 9|

The second root has degree 18, but its q or E need not equal the first root's.
Its common-neighborhood graph is (3,5)-free on lambda vertices. Two degree-18
neighborhoods overlap in lambda vertices and together cover 36-lambda
vertices; the remaining common-nonneighbor cell has order 7+lambda and is
(5,4)-free. These equations include both adjacent roots in the union.
The opposite mixed cells, not this common-nonneighbor cell, are (4,4)-free.
The former (4,4) assertion for the latter cell is withdrawn; see the
[scoped inline correction and acceptance](#review-adjacent-root-cell-pivot-scope).
The overlap bounds above do not use that assertion.

## 3. A complete reduction when the graph is near 18-regular

The additional hypothesis here is W<=10; it is not known to hold throughout
the degree-18 branch. Since E_v>=0, every degree-18 root satisfies

```
q_v<=4+W/2, a_v>=81-W/2,
0<=x_v-136=2q_v+E_v<=8+W-E_v<=8+W.
```

All such graphs contain degree-18 vertices, since fewer than 43 vertices
can have positive excess when W<43. E_v<=W ensures each root has a
degree-18 neighbor for W<=10. Apply the simplified codegree formula using
E_v<=min(W,4+W/2-q_v). The expression is increasing in E_v, as above.
Direct substitution over the explicitly bounded q range gives:

|W|all degree-18 neighborhood edges|all degree-18 cross counts|an adjacent degree-18 pair with overlap at most|
|---|---|---|---|
|0|81..85|136..144|9|
|2|80..85|136..146|9|
|4|79..85|136..148|10|
|6|78..85|136..150|11|
|8|77..85|136..152|12|
|10|76..85|136..154|12|

Both endpoints obey the neighborhood edge interval in the table. In fact
each degree-18 root has such a neighbor; no selection of a special root is
needed. The upper bounds per q, for an independent arithmetic audit, are:

```
W=0, q=0..4:   9,9,9,9,9
W=2, q=0..5:   9,9,9,9,9,8
W=4, q=0..6:   10,10,10,10,9,9,8
W=6, q=0..7:   11,11,11,10,10,9,9,8
W=8, q=0..8:   12,12,11,11,11,10,9,9,8
W=10,q=0..9:   12,12,12,12,11,11,10,9,9,8
```

This is an unavoidable pointed-pair family theorem for a conditional branch.
Excluding all pairs in a table row, including all permitted overlap maps and
completions, would exclude that W branch. Excluding only q<=2 pairs would not.
The dense slices here may still be large; no feasibility or catalogue-size
estimate is asserted.

## 4. Weighted counts force dense degree-18 families

Let P be the degree-18 vertices, n=|P|, and h=43-n. Let Z=sum_z epsilon_z^2.
Count the excess crossing from P to the higher-degree vertices:

```
J=sum_(v in P)E_v=sum_(z not in P)epsilon_z*d_P(z).
J>=sum_(i=1..6) i*n_i*max(0,19+i-h).
```

Indeed a degree-(18+i) vertex has at most h-1 neighbors outside P.
For small W the simpler bound J>=(19-h)W+Z applies. Summing the root
inequality E_v+q_v<=W/2+4 gives the certificate-ready family inequality

```
sum_(v in P) q_v <= n*(W/2+4)-J.
```

Fix a deficit threshold Q and write M_Q=|{v in P:q_v<=Q}|. A root outside
this family has E_v<=W/2+3-Q. Put B0=W/2+3-Q. If 0<=B0<W, then

```
J<=n*B0+(W-B0)*M_Q,
M_Q>=max(0,ceil((J-n*B0)/(W-B0))).
```

This can be used with the actual degree counts and cross-class edge counts,
not only W. For a uniform result use h<=W, Z>=W and n=43-h:

|W|guaranteed roots with a_v>=81 (Q=4)|guaranteed roots with a_v>=80 (Q=5)|
|---|---|---|
|0|43|43|
|2|18|all degree-18 roots, at least 41|
|4|10|16|
|6|3|10|

For example at W=6,Q=5, B0=1, J>=120-6h, hence
M_5>=ceil((77-5h)/5)>=10 for h<=6. At W=4,Q=4,
M_4>=ceil((41-3h)/3)>=10 for h<=4. At W=2,Q=4,
M_4>=20-h>=18. At W=6,Q=4, M_4>=ceil((34-4h)/4)>=3.

Since alpha(G)<=4, any five roots in such a family contain an adjacent pair.
Thus W=2 and W=4 force adjacent degree-18 roots whose neighborhoods both
have at least 81 edges; W=6 forces such a pair with at least 80 edges.
The family pair guaranteed here need not be the small-overlap pair of
Section 3. Do not combine those two conclusions without another argument.

More generally a family of size M has an induced vertex of degree at least
ceil(M/4)-1: the greedy independent-set bound gives
alpha>=M/(Delta+1). Hence forced-family incidence can eventually justify
omitting some pointed choices at one endpoint, if the other endpoint's
choices remain unrestricted. Two-sided omissions need separate coverage.

## 5. What the excess identity alone does and does not force

At a degree-18 root the contribution to the published excess identity is

```
b_v-a_v-63=W/2-E_v.
```

In particular q_v cancels. More generally, for a vertex of excess i, put
E_z=sum_(u adjacent z)epsilon_u. Its contribution is

```
W/2-E_z+i^2-(7/2)i.
```

Summing gives zero because sum_z E_z=18W+Z. Thus using just this identity
after substituting degree profiles does not force q<=2. The degree-dependent
census bounds or other structural information must supply additional leverage.
This is a limitation of this particular argument, not a proof that a stronger
unavoidable dense family theorem is impossible.

## 6. Continuation

Use (W,q,neighbor-degree multiplicities) as the mathematical case language.
The near-regular table supplies a complete conditional gluing reduction and
the weighted inequality supplies a route to better unavoidable families.
For a general graph with degree-18 vertices, neither W<=10 nor a root with
x<=141 is proved. The next major task is to extend the weighting to higher
degree classes using their neighborhood extrema and induced adjacency
constraints, or to prove stronger local bounds on q+E. Those are the remaining
coverage gaps; numerical root profiles alone are not full classifications.

## Historical independent review coverage

<a id="review-adjacent-root-cell-pivot-scope"></a>
### Adjacent-root cell correction and acceptance

LegacyCellAudit, independent of the branch authors and the coordinator who
applied the correction, accepted only the corrected Section 2 pointed-pair
paragraph. The common-nonneighbor cell of adjacent degree-18 roots is
(5,4)-free, not (4,4)-free: a K4 there is not forbidden by the standing
hypotheses. Its order 7+lambda, union order 36-lambda including both roots,
common-neighbor type (3,5), and opposite mixed-cell type (4,4) were checked.
The prior typing was changes-requested and superseded; no overlap table
changed because the proofs use the common-neighbor cap 13, the deletion floor
from E(4,5,17)=79, and, where required, the opposite mixed cells, not the
withdrawn type. The [shared ambient-type audit](review_adjacent_root_cell_20261017_audit.md)
retains the historical exact-revision evidence and its separate transfer-bounds
coverage. This acceptance does not extend to all of this topic or recertify
the external Ramsey and census premises; no closure or search-use claim was
reviewed by that audit.

### Overlap and interior-transfer dependency audits

The [pairwise coordinator review](pairwise_pivot_refinements.md#review-pairwise-pivot-coordinator)
rederived q+E<=W/2+4, degree/cut identities, capacities and pointed overlap
bounds as dependencies of its four accepted claims. The
[dense-family review](dense_pivot_coverage.md#review-dense-pivot-low-excess)
likewise rederived x=136+2q+E and q+E<=W/2+4. These dependency checks are not
independent acceptance of Sections 1--6 as a whole.

InteriorAudit separately accepted the strengthened floor, ceiling and
interface claims now developed in [interior transfer](interior_transfer.md).
Its [historical JSON review snapshot](review_interior_transfer_20261019.json)
records the corrected adjacent-cell lineage, actual-multiplicity averaging,
positive denominator, monotonic E substitution, and the three improvements
11->10, 13->12 and 10->9. It reproduced the old W<=10 table and found its
worst-case caps unchanged. This is parameter-conditioned transfer acceptance,
not an occurrence, matching-companion-profile, or whole-branch conclusion.

### Further scoped dependency checks and snapshots

The [density-rerooting independent review](review_density_rerooting_20261021_independent.md#dependencies-reviewed-and-limits)
rederived this topic's q/E/W budget and antineighborhood bounds as
dependencies of that separate result; this is not acceptance of all pivot
classes. The [forced-q0 review](review_closure_consequences_forced_q0_20261021_cr10.md#independent-checks-and-findings)
likewise rederived the root budget for its own scoped consequence.
The retained [machine-readable interior-transfer proof snapshot](interior_transfer.json)
and its JSON review are historical evidence; current mathematical dependency
links point to the authoritative Markdown topic.

## Changelog

- Corrected the adjacent-root common-nonneighbor type from (4,4) to (5,4);
  the scoped independent audit accepted the corrected paragraph and confirmed
  the overlap bounds unchanged.
- Added the independently accepted interior floor and ceiling transfer; it
  strengthens individual filters without improving the old worst-case W table.
- Consolidated metadata and scoped review findings without changing the
  mathematical development or promoting the self-audited sections. Current
  interior-transfer dependencies use the authoritative Markdown topic; JSON
  remains historical proof/review evidence.
