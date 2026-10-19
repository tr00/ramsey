<!-- extension-research-integration:start -->
Integration status (2026-10-17): all six claims independently accepted at
reviewed-body SHA-256 `86a940a7871f5196bc8a51590ef9d60bbc2479c4a1194dff420b127bb14d4874`.
See the [exact-revision review](review_obstruction_coverage_20261017_audit.md).
The reviewed body below is preserved verbatim; ready labels are historical.
Permitted use: the stated propagation and unavoidable-family branching;
Claim06 retains its conditional user-supplied closure premise. No full
degree-18 exclusion, novelty claim, or formal exhaustion certificate follows.
<!-- extension-research-integration:end -->

# Independent-root coverage and an exact exceptional signature core

Date: 2026-10-17. Author: CoverageResearch.
All deductions below are **ready for independent review, not accepted**.
Pure mathematics; no graph enumeration, solver, theorem prover, catalogue
acquisition, installation, build, linter, or test suite was used. No novelty
or order-43 exclusion is claimed.

## Setting, deliverable, and dependencies

Let G be a simple order-43 graph containing neither K5 nor I5. Let P be
its degree-18 vertices, H=V(G)-P, h=|H|, and p=43-h. For v in P put

```text
q_v=85-e(G[N(v)]),
epsilon_z=d_G(z)-18, E_v=sum_(z in N(v))epsilon_z,
x_v=e(N(v),M(v))=136+2q_v+E_v.
```

The standing degree bounds are 18..24. Thus epsilon is nonnegative.
The q and x notation uses the retained external (4,5,18) edge maximum85.
The principal coverage theorem, Claim03, does **not** use that maximum,
any census of graphs, or the reported x136 closure. Its only non-elementary
numerical premises are R(4,5)=25, R(4,4)=18, and R(3,5)=14 from
[the baseline](../../docs/mathematical_baseline.md#immediate-local-constraints).

The result is an unavoidable alternative, not another isolated rejected
pattern: every prescribed family of at least25 degree-18 roots has either
an independent pair of overlap at most6, yielding two opposite actual
(4,4) cells of orders12..17, or an independent four-root anchor with a
single exact signature-size vector. In the dense q<=2 family the first
alternative has cell orders12..14. The exceptional alternative forces
four rooted K4's on16 vertices and further explicit attachment obligations.
Neither alternative is excluded here.

For context, [weighted averaging](weighted_averaging.md) and
[overlapping cells](overlapping_cells.md) give sound filters on supplied
anchors but explicitly leave their occurrence unresolved. The
[twelve-root theorem](sos_pivot_selection.md#claim-sos-pivot-twelve)
guarantees an **adjacent** same-family pair of overlap at most10. The
present result concerns a **nonadjacent** pair or a four-root core; these
are different unavoidable families. It does not assume that two pairs
guaranteed by different results coincide.

<a id="claim-coverage-root-cell-types"></a>
## Claim01. The four cells of two degree-18 roots, with the correct types

Claim ID: `n43/d18/obstruction_coverage.md#claim-coverage-root-cell-types`

Kind: local-deduction

Review state: accepted

Scope: every pair of distinct roots u,v in P; lambda=|N(u) intersect N(v)|

Dependencies: K5/I5 prohibitions; R(4,4)=18 and R(3,5)=14

Conclusion: the cell table and overlap bounds below hold.

Always exclude u,v themselves when defining the four cells C,X,Y,D.
Here C consists of common neighbors, X of vertices adjacent only to u,
Y of vertices adjacent only to v, and D of common nonneighbors.

| Root relation | C | X and Y individually | D | Consequence |
| --- | --- | --- | --- | --- |
| uv a nonedge | order lambda, (4,5) | order18-lambda, (4,4) | order5+lambda, (5,3) | 1<=lambda<=8 |
| uv an edge | order lambda, (3,5) | order17-lambda, (4,4) | order7+lambda, (5,4) | 0<=lambda<=13 |

Proof. For nonadjacent roots their common neighbors cannot contain K4,
since such a clique joins u to make K5. Their common nonneighbors cannot
contain I3, since it joins the independent pair {u,v} to make I5. For
adjacent roots a triangle in C joins uv to make K5; an I4 in D joins u
to make I5. In either relation, X has no K4 because it joins u and no I4
because it joins v; Y is symmetric. The inherited ambient restrictions
supply each table entry's other parameter.

For a nonedge neither root lies in either neighborhood, so the four orders
are lambda,18-lambda,18-lambda,5+lambda, summing to41. For an edge each
root lies in the other's neighborhood, so X,Y each have order17-lambda
and D has order7+lambda, again summing to41. For a nonedge, the (4,4)
cap on X gives lambda>=1, and the (5,3) cap13 on D gives lambda<=8.
For an edge the (3,5) cap13 on C gives lambda<=13.

In particular, an adjacent pair's common-nonneighbor cell is **not** typed
(4,4). Its clique restriction is only K5-free: neither root is adjacent
to D, so neither supplies a clique extension of a K4 there. The baseline
anchor rule therefore supplies no K4 prohibition for D. This corrects the
type assertion in the legacy pointed-pair paragraph of
[pivot classes](pivot_classes.md#2-low-excess-profiles-force-adjacent-degree-18-roots)
and the corresponding legacy assertion in `transfer_bounds.md`; no
existing audit is silently promoted by this correction.

Search use: none pending independent review; proposed propagate/branch

Reviews: [exact-revision review](review_obstruction_coverage_20261017_audit.md)

<a id="claim-coverage-independent-four-signatures"></a>
## Claim02. An independent four of degree-18 roots has only16 aggregate profiles

Claim ID: `n43/d18/obstruction_coverage.md#claim-coverage-independent-four-signatures`

Kind: local-deduction

Review state: accepted

Scope: every actual independent set I={v1,v2,v3,v4} contained in P

Dependencies: K5/I5 prohibitions; root degrees18; Claim01 for individual pair bounds

Conclusion: all exact signature equations, inequalities, and the dichotomy below hold.

For z outside I let sigma(z)=N(z) intersect I, and let n_j count vertices
with |sigma(z)|=j. There are39 external vertices, all with nonempty
signature: an empty signature would join I to make I5. Each singleton
class S_i={z:sigma(z)={vi}} is a clique. Indeed two nonadjacent vertices
in S_i, together with I-{vi}, give I5. Also |S_i|<=3, since four vertices
in its clique together with vi give K5. Therefore n1<=12.

Counting external vertices and incidences with I gives

```text
n1+n2+n3+n4=39,
n1+2n2+3n3+4n4=72,
n1=6+n3+2n4,
n2=33-2n3-3n4,
n3+2n4<=6.
```

In particular n2>=21, n4<=3, and there are precisely16 possible pairs
(n3,n4) in this aggregate arithmetic relaxation:

| n4 | Allowed n3 | n1 | n2 | Sum of the six pair overlaps |
| --- | --- | --- | --- | --- |
| 0 | 0..6 | 6+n3 | 33-2n3 | 33+n3, at most39 |
| 1 | 0..4 | 8+n3 | 30-2n3 | 36+n3, at most40 |
| 2 | 0..2 | 10+n3 | 27-2n3 | 39+n3, at most41 |
| 3 | 0 | 12 | 24 | 42 |

These16 aggregate profiles are necessary, not asserted realizable. Exact
signature counts n_S, for nonempty S subset I, further satisfy

```text
sum_S n_S=39,
sum_(S containing vi)n_S=18 for i=1,2,3,4,
0<=n_{vi}<=3,
1<=sum_(S containing vi,vj)n_S<=8 for i<j.
```

The bounds in the last line are Claim01. Each external vertex with
signature size j contributes C(j,2) to the sum L of the six overlaps, so

```text
L=n2+3n3+6n4=33+n3+3n4<=42.
```

Consequently at least one pair has overlap<=7, and at least one pair has
overlap>=6 because L>=33. More sharply, exactly one of the following
alternatives holds:

1. Some pair of roots in I has overlap<=6.
2. Every pair has overlap7, every singleton class has size3, every double
   signature class has size4, every triple signature class is empty, and
   the all-four signature class has size3.

To prove completeness of the alternative, suppose all six overlaps are
at least7. Then L>=42, so equality holds. The table forces n4=3,n3=0,
n1=12,n2=24. Every overlap is exactly7. Each singleton class has size3
because its cap is3 and their total is12. For each pair vi,vj its common
neighbors now comprise only its own double signature class and the three
all-four vertices. Thus its double class has size7-3=4. Conversely this
signature-size vector has all six overlaps7, so the alternatives are
disjoint. No saturated cell was assumed in this argument.

Search use: none pending independent review; proposed propagate/branch

Reviews: [exact-revision review](review_obstruction_coverage_20261017_audit.md)

<a id="claim-coverage-twenty-five-roots"></a>
## Claim03. Twenty-five roots force larger opposing cells or the exact core

Claim ID: `n43/d18/obstruction_coverage.md#claim-coverage-twenty-five-roots`

Kind: local-deduction

Review state: accepted

Scope: every specified family F subset P with |F|>=25; no restriction on
q, E, x, W, root selection, or adjacency to higher-degree vertices

Dependencies: R(4,5)=25 by complementation; Claims01 and02

Conclusion: F contains either an independent pair of overlap1..6, or
an independent four with the exact signature-size vector in Claim02(2).
The former pair has two opposite actual (4,4) cells of equal order12..17.

Proof. Since G[F] has no K5, the Ramsey premise R(5,4)=25 supplies an
independent four I in this **same** family F. Apply Claim02 to I. In its
first alternative the guaranteed pair has overlap<=6; Claim01 makes its
range1..6 and types both opposite mixed cells (4,4), with common order
18-lambda in12..17. In its second alternative retain all four roots and
the exact15-class signature partition. This proves occurrence and full
coverage, not exclusion of either branch.

In particular the theorem applies to F=P whenever h<=18. If F is defined
by a proved property of roots, the property holds at both pair endpoints,
or at all four exceptional roots, respectively. This is safe family
selection, not a property imposed on an arbitrary previously fixed root.
The selection is an overlapping unavoidable family; it is not a unique
or disjoint choice of the root set. A complete later gluing argument must
retain every allowed overlap, identification, and completion.

For h>=19 the family P has at most24 members, and this particular Ramsey
argument supplies no independent four. For a selected family of size24
or less the same limitation remains. The existing twelve-root adjacent
pair theorem still applies when its own threshold is met; its adjacent
common-nonneighbor cell must keep the type from Claim01.

Search use: none pending independent review; proposed branch with all
maps and completions retained; no termination claim

Reviews: [exact-revision review](review_obstruction_coverage_20261017_audit.md)

<a id="claim-coverage-dense-moderate-cells"></a>
## Claim04. A dense25-root family needs only orders12..14 in the pair branch

Claim ID: `n43/d18/obstruction_coverage.md#claim-coverage-dense-moderate-cells`

Kind: local-deduction

Review state: accepted

Scope: two nonadjacent degree-18 roots for the pair bounds; any prescribed
family F subset P with |F|>=25 and q_v<=2 for every v in F for the coverage conclusion

Dependencies: Claims01--03; the external maximum85 defining q; the
(4,4,15) upper edge bound55 retained in
[the four-transversal note](transversal_four.md#published-input);
R(3,4)=9 and elementary Turan bound for a K4-free graph

Conclusion: overlap1 forces q_u,q_v>=9; overlap2 forces q_u,q_v>=4;
overlap3 forces q_u,q_v>=3. Thus a q<=2 family of size25 has either
an independent pair of overlap4..6 and opposite (4,4) cells of orders12..14,
or Claim02's exact exceptional four-root core.

Proof. For a nonadjacent pair put C=N(u) intersect N(v),
X=N(u)-N(v), and lambda=|C|. Then N(u)=C disjoint union X.
By Claim01, X is (4,4)-free of order18-lambda. For lambda=1,2,3 its
edge count is at most68,64,55 respectively. The first bound follows from
the (4,4,17) degree cap8; the second from the same degree cap at order16;
the third is the stated external order15 premise.

For every c in C, its neighbors in X form a triangle-free I4-free graph:
a triangle there joins the adjacent pair u,c to make K5, and I4 is
already forbidden inside X. Thus c has at most8 neighbors in X, by
R(3,4)=9. Also G[C] is K4-free because C subset N(u). Consequently

```text
e(G[N(u)]) <= U(18-lambda)+8*lambda+floor(lambda^2/3),

lambda                  1     2     3
U(18-lambda)            68    64    55
right-hand edge cap     76    81    82
necessary q_u >=         9     4     3.
```

The same proof applies to v. The q<=2 hypothesis excludes overlap1,2,3
in Claim03's pair alternative, leaving4..6, hence mixed-cell orders14,13,12.
For a q<=3 family one can similarly retain pair overlaps3..6; for a
q<=8 family retain2..6. The exceptional alternative is unchanged.

There are already concrete non-frontier profile applications. By
[dense-pivot Claim02](dense_pivot_coverage.md#claim-dense-pivot-02):

| Exact global degree data | Guaranteed family F | Profiles at every member of F | New unavoidable alternative |
| --- | --- | --- | --- |
| h=3,W=18 | at least26 roots | q in{0,1}, E=12, x in{148,150} | independent pair overlap4..6, or exact exceptional four-root core |
| h=5,W=30 | at least26 roots | q in{0,1}, E=18, x in{154,156} | independent pair overlap4..6, or exact exceptional four-root core |

Each conclusion retains those profiles on the same two or four roots.
These are conditional on the displayed global degree data, but anchor
occurrence is proved from them; a preexisting large cell is not assumed.
Other family lower bounds, such as
[SOS-pivot Claim03](sos_pivot_selection.md#claim-sos-pivot-family), may be
substituted whenever they actually reach25. A lower bound24 is not enough
for this particular coverage proof.

Search use: none pending independent review; proposed branch/propagate
on the stated external premises

Reviews: [exact-revision review](review_obstruction_coverage_20261017_audit.md)

<a id="claim-coverage-exceptional-core-obligations"></a>
## Claim05. Exact structure and witnessed obligations in the exceptional core

Claim ID: `n43/d18/obstruction_coverage.md#claim-coverage-exceptional-core-obligations`

Kind: local-deduction

Review state: accepted

Scope: the exceptional alternative actually obtained in Claim02 or03

Dependencies: Claim02; K5/I5 prohibitions

Conclusion: the actual core and the attachment obligations below hold.

Write S_i for the three singleton vertices, D_ij for the four vertices
with signature {vi,vj}, and U for the three all-four vertices. These sets
partition the39 external vertices. Each {vi} union S_i is a K4, so the
four disjoint rooted K4's give an actual16-vertex anchor core, not four
hypothetical cliques. Every D_ij is (4,3)-free: its K4 would join vi to
make K5, and its I3 would join the other two roots to make I5.

For y in D_ij, define M_i(y)=S_i-N(y) and M_j(y)=S_j-N(y).
Both sets are nonempty: otherwise y completes the K4 {vi} union S_i,
or its j counterpart, to K5. Moreover every pair with one endpoint in
M_i(y) and one in M_j(y) must be an edge. If a in M_i(y) and
b in M_j(y) were nonadjacent, then {y,a,b,vk,vl}, where {k,l} is the
complementary root pair, would be I5. Thus each of the24 actual double
vertices forces a nonempty complete bipartite rectangle between its two
singleton classes. In particular every pair S_i,S_j has at least one
cross edge. This obligation is witnessed by actual roots and a named
double vertex; it was not supplied as an extra cell assumption.

Every y in U has a nonempty omission set M_i(y) in all four singleton
classes, again because each rooted K4 forbids completion. No choice of
one vertex from each M_i(y) can be independent, since together with y
it would form I5. This is a four-way actual attachment condition, not a
claim that any specified smaller obstruction occurs.

For every root pair vi,vj the four cells in Claim01 are explicitly

```text
C = D_ij union U,                                      order7,
X = S_i union D_ik union D_il,                          order11,
Y = S_j union D_jk union D_jl,                          order11,
D = {vk,vl} union S_k union S_l union D_kl,              order12.
```

Thus the exceptional branch is genuinely a moderate-cell branch: X and Y
are (4,4), D is (5,3), and vk,vl each have exactly7 neighbors within D.
These equations do not determine edges between the signature classes.
In particular neither the core nor its obligations are claimed impossible.

Search use: none pending independent review; proposed propagate/branch
inside the unavoidable exceptional branch

Reviews: [exact-revision review](review_obstruction_coverage_20261017_audit.md)

<a id="claim-coverage-closure-barrier"></a>
## Claim06. Exact scope of the reported x136 closure and a scalar barrier

Claim ID: `n43/d18/obstruction_coverage.md#claim-coverage-closure-barrier`

Kind: local-deduction

Review state: accepted

Scope: the root-profile identity above; first conclusion additionally
conditional on the user-reported closure premise C136 defined below;
the arithmetic barrier concerns only the explicitly listed relaxation

Dependencies: x_v=136+2q_v+E_v, q_v,E_v>=0; external root/census scalar
bounds as recorded in pivot_classes.md; Claim02's signature-size equations

Conclusion: C136 deletes exactly q_v=E_v=0 at every degree-18 root in
this scalar description. It does not, from these scalar constraints alone,
exclude the exceptional profile or force a pair of overlap<=6.

Premise C136 means that the x136 branch is wholly closed, as reported by
the user outside this checkout. This report is accepted as supplied, not
re-investigated here. Its use remains **conditional pending integration of
the user's closure evidence**; the branch README's older open status is
not evidence against the user's report. Claims01--05 do not use C136.

From the nonnegative identity, x_v=136 if and only if q_v=E_v=0.
Therefore C136 gives q_v+E_v>=1 separately at every root. In particular,
roots having no higher-degree neighbor (E_v=0) must have q_v>=1.
For roots with E_v>0 this condition is automatic; the reported closure
does not by itself delete their q=0 profiles. It must not be promoted to
q_v>=1 for all roots, or to an unproved global excess lower bound.

Here is a precise barrier to strengthening the present arithmetic argument.
Assign all43 degree variables the value18, so h=W=0. At every root assign
q=1,E=0,e(N)=84,x=138,e(M)=147. These obey

```text
q+E>=1,
0<=q<=35,
q+E<=W/2+4=4,
x=136+2q+E=138,
e(N)+e(M)+x+18=84+147+138+18=387.
```

They respect the retained scalar intervals50..85 for e(N) and144..160
for e(M). On a selected independent four, give the15 nonempty signature
classes the exceptional sizes (singletons3, doubles4, triples0, all-four3).
Their total is39, each root has18 incidences, and all pair overlaps are7,
within Claim01's interval1..8. All16-profile arithmetic constraints and
C136's rootwise deletion are therefore satisfied simultaneously, while
there is no pair of overlap<=6 among those four roots.

This is an assignment of **scalar and signature-count variables only**,
not a Ramsey graph, not a claim that the assigned neighborhood edge
counts are jointly realizable, and not a counterexample to a possible
stronger structural theorem. It proves only that these specific numerical
constraints, even with C136, cannot algebraically discard the exceptional
signature vector. Actual edge compatibility between the classes is
additional information; Claim05 records some of it.

Search use: none; limitation of the stated relaxation only

Reviews: [exact-revision review](review_obstruction_coverage_20261017_audit.md)

## Arithmetic self-check and exact remaining coverage

A Python integer-only audit was run on2026-10-17, with no graph objects,
edge assignments, graph search, or solver. It checked all16 pairs
(n3,n4) satisfying n3+2*n4<=6; each satisfies the two incidence equations,
n1<=12 and n2>=21. The maximum pair-overlap sum outside n4=3 was41;
the unique sum42 aggregate profile was (n3,n4,n1,n2)=(0,3,12,24).
It independently expanded the15-class exceptional vector, recovering
39 external vertices, four degree sums18, six overlaps7 and mixed-cell
orders11. The three low-overlap q thresholds were audited as9,4,3.
This is an author self-check, not independent mathematical acceptance.

The proved finite reduction is complete for **every independent four in P**
and, by occurrence, for **every prescribed family of at least25 roots**.
For q<=2 families its opposing-cell branch has exactly the overlap values
4,5,6 and cell orders14,13,12. Its other branch has the exact signature
sizes and actual16-vertex rooted-clique core in Claim05. Every remaining
edge between those classes is still a live completion choice subject to
Ramsey and degree restrictions. No exclusion of that exceptional core,
of any entire x branch, or of all h>=19 candidates is asserted.

In particular this work does not manufacture a dispersed obligation
contradiction from a moderate average row size: the necessary coverage
comes instead from an independent four in a sufficiently large prescribed
degree-18 family. The exceptional arithmetic vector states exactly why the
present moment argument stops at that finite alternative. Neither the
adjacent-root cell-type error nor the reported closure is used to bridge
that gap.
