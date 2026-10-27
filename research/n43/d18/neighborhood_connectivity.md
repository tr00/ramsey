# Connectivity of the degree-18 neighborhood

## Metadata and summary

**Kind:** local deductions on recorded Ramsey/census premises. **Authors:** Main
(original disconnected classification/interface), ConnectivityTransfer (separator
and root transfers). **Independent reviewers:** ConnectivityAudit (claims 01/02
and all six separator-transfer claims), ConnRigor (claim 03). All nine claims
are **accepted** on their individual scopes below; editorial consolidation is
not a new mathematical review or a novelty claim.

|Development|Scope and conclusion|Permitted search use|
|---|---|---|
|Claims 01/02|Actual degree-18 neighborhoods: disconnected `K_m` plus a (4,4) core; edge slices `[53,58]`, `61`, `68`|propagate; connected-only generation outside those necessary slices|
|Claim 03|Actual interface: recorded filters leave those families live; row, membership, and column obligations|propagate; no realizability or x-exclusion|
|Separator profiles and density hierarchy|Pure order-18 K4/I5-free graphs: all cuts of orders 1/2/3 and connectivity thresholds 70/75/81|propagate; separator constraints|
|Columns, row/root and selected-root transfers|Actual candidates, with connectedness or root selection only where explicitly stated|propagate; preserve all completion choices|
|Shortcut obstructions|Isolated pure graphs, not ambient witnesses|none; obstruction diagnosis only|

This topic is authoritative for the full proofs and substantive reviews. The
[separator proof JSON](connected_structure_transfer.json) and
[review JSON](review_connected_structure_transfer_20261019.json) remain immutable
historical machine-readable snapshots/evidence, not competing current prose.
Live dependencies include the [premise record](../../../README.md#state-of-the-art),
[reduction index](../reductions.md), [pivot classes](pivot_classes.md),
[pairwise pivot refinements](pairwise_pivot_refinements.md#claim-pivot-pairwise-04),
and [maximum-edge root transfer](cliques_augmentation.md).
The separate [interior-degree topic](interior_transfer.md) is not a premise of
the separator argument. No graph search, enumeration, solver, catalogue
processing, installation, novelty review, or new formalization is part of this
migration. External literature/census premises remain retained, not recertified.

<a id="motivation"></a>
The original question was whether planning the `G[A]` generator
(`scripts/geng.sh`) could safely use connected-only generation.

## Setting

G is an order-43 graph with no K5 and no I5, v is a degree-18 vertex,
A=N(v), a=e(G[A]), q=85-a. Then G[A] is (4,5)-free: K4-free because a K4
together with v gives K5, and I5-free by heredity. External premises
retained as recorded, not recertified: R(4,4)=18, R(3,4)=9, and the
published (4,4) census intervals 50..55, 60..60, 68..68 on 15, 16, 17
vertices (root README census table; McKay-Radziszowski 1992 as recorded in
`lean/Ramsey/Premises.lean`).

For u in A write epsilon_u=d_G(u)-18, the branch convention behind the
row identity used in claim 3.

Preamble (independence is exactly four). An I5 in A would be an I5 in G,
so alpha(A)<=4. Since A is K4-free on 18 vertices, R(4,4)=18 leaves an I4,
so alpha(A)>=4. Hence alpha(A)=4. The lower step is the argument already
used in `pairwise_frontier_refinements.md`.

<a id="claim-connectivity-01"></a>
## 1. Disconnection shape

Scope: every order-43 (5,5)-free G, every degree-18 pivot v; a statement
about G[A] alone, with no assumption on x, q, E, or the interface  
Dependencies: R(4,4)=18; R(3,4)=9; K5/I5 prohibitions  
Conclusion: if G[A] is disconnected, then A has exactly two components: one
complete component K_m with m in {1,2,3}, and one (4,4)-free component C on
18-m vertices with alpha(C)=3  

Proof. Let C_1,...,C_k be the components of G[A], k>=2. Independence is
additive over disjoint unions, so sum_i alpha(C_i)=alpha(A)=4. Three
component facts: (i) alpha(C_i)=1 means C_i is complete, and K4-freeness
bounds it by three vertices; (ii) consequently any component on at least
four vertices has alpha>=2; (iii) any component on at least nine vertices
has alpha>=3, because R(3,4)=9 forces a K4 or an I3 and C_i is K4-free.
The multisets of k>=2 positive integers summing to four are (1,3), (2,2),
(1,1,2), (1,1,1,1). In case (2,2) both components have no I3 and no K4,
so R(3,4)=9 bounds each by eight vertices and the total by 16<18. In cases
(1,1,2) and (1,1,1,1) the total is at most 3+3+8=14<18. Hence the profile
is (1,3): the alpha-1 component is a clique K_m with m<=3, and the single
remaining component C carries alpha(C)=3 on 18-m>=15 vertices and is
K4-free; alpha(C)=3 together with K4-freeness is exactly (4,4)-freeness.

<a id="claim-connectivity-02"></a>
## 2. Edge counts and the connectivity threshold

Scope: as claim 1  
Dependencies: claim-connectivity-01; published (4,4) census intervals
50..55 at order 15, 60..60 at order 16, 68..68 at order 17  
Conclusion: if G[A] is disconnected then a in [53,58] with m=3, a=61 with
m=2, or a=68 with m=1; in particular a>=69, equivalently q<=16, forces
G[A] connected, including the entire x=136 frontier (a=85)  

Proof. Add the clique edges C(m,2) to the census interval of C:
3+[50,55]=[53,58], 1+60=61, 0+68=68. The largest value is 68, so a>=69
excludes every disconnected profile.

These slices record necessary structure only; they do not assert that any
disconnected neighborhood is realizable as N(v) in an order-43 candidate.

<a id="claim-connectivity-03"></a>
## 3. Recorded filters leave the families live; interface obligations

Scope: as claim 1, together with the recorded row identity and universal
predicates cited below
Dependencies: claim-connectivity-01; claim-connectivity-02 for a<=68;
[reduction index](../reductions.md) sections 4.5, 5.1(2), 5.2 and 6.1;
row identity d_B(u)=17+epsilon_u-d_A(u) with epsilon_u=d_G(u)-18;
deletion floor d_A>=a-79 from published E(4,5,17)=79, recorded in
[pivot classes](pivot_classes.md) section 2; R(3,5)=14 for d_A<=13
Conclusion:
(a) no recorded unconditional G[A] filter excludes the three families: the
deletion floor d_A>=a-79 is vacuous for a<=79 and every disconnected case
has a<=68 by claim-connectivity-02; clique vertices have d_A=m-1<=2 and
C-vertices have degree at most eight, since N_C(x) is triangle-free and
I4-free and R(3,4)=9; both bounds satisfy the recorded cap d_A<=13 of
section 5.2;
(b) for u in K_m: epsilon_u<=m-1 and d_B(u)=18-m+epsilon_u; at m=1 this
forces epsilon_u=0, d_G(u)=18, d_B(u)=17, and the section 5.2 boundary
trigger makes G[N_B(u)] a 17-vertex 8-regular (4,4) graph;
(c) K4 membership (section 4.5) is automatic for m=3 via {u}+(K_m-u)+{v};
for m=1 it forces a triangle in R_u, and for m=2 a triangle in R_u or an
edge inside R_u intersect R_w, where w is the other clique vertex; I4
membership is automatic, since u is anticomplete to C and alpha(C)=3;
(d) every I4 of A consists of exactly one K_m vertex together with an
independent triple of C, so a cross column missing some clique vertex must
meet every independent triple of C  

Proof. The deletion floor follows from the published E(4,5,17)=79: A-u is
(4,5)-free on 17 vertices, so e(A-u)<=79 and d_A(u)>=a-79, nonpositive in
every disconnected case. For u in K_m, d_A(u)=m-1 and
N_G(u)={v} union (K_m-u) union R_u,
since u has no neighbor in C. The recorded row cap r_u<=17 gives
epsilon_u<=d_A(u)=m-1, and then
r_u=17+epsilon_u-(m-1)=18-m+epsilon_u; at m=1 this is r_u=17 with
epsilon_u=0. For x in C, a triangle in N_C(x) with x gives a K4, and N_C(x)
inherits I4-freeness, so R(3,4)=9 gives d_C(x)<=8. For (c), any K4
containing u is u plus a triangle in N_G(u); v has exactly A as neighbors,
so a triangle containing v needs two A-neighbors of u beyond v, available
only at m=3; all other triangles lie in R_u, or at m=2 consist of w and an
edge inside R_u intersect R_w. For (d), an independent set meets the
complete component in at most one vertex, alpha(C)=3 excludes an I4 inside
C, and every column meets every I4 of A by the recorded universal premise
(section 5.1(2), equivalently section 6.1, immediate from I5-freeness).

## Audit

Independence additivity over disjoint unions was checked on the component
partition; the clique bound alpha=1 with K4-freeness; the partition list is
complete (the four multisets are all partitions of 4 into at least two
positive parts); edge arithmetic C(m,2) with the census intervals quoted in
the recorded direction only. The interface items recombine recorded
identities (row cap, boundary trigger, section 4.5 membership, I4-column
premise) without new hypotheses. No realizability claim is made, and no
value of x is excluded by this note.

<a id="report-degree-18-neighborhood-connectivity-classification"></a>
<a id="deliverables"></a>
<a id="independent-review"></a>
### Historical independent review of claims 01/02

ConnectivityAudit, distinct from author Main, accepted
[#claim-connectivity-01](#claim-connectivity-01) and
[#claim-connectivity-02](#claim-connectivity-02) on the recorded premises.
The review checked independence additivity; all positive component-independence
partitions of four; the K4-free clique-size bound; the symmetry implicit in
using `R(3,4)=9` for K4/I3; connectedness and exact independence number of the
large component; census directions; edge arithmetic; deficit equivalence;
and equality-frontier applicability. It confirmed that the original generator
wording “exactly a>=69” needed correction to a **sufficient** condition:
connected-only generation is sound outside `[53,58] union {61,68}`, including
some smaller edge counts. A broken claim-03 dependency link was repaired to
`../reductions.md`. The four-singleton profile actually has at most twelve
vertices, satisfying the original displayed looser bound fourteen.

The accepted claim statements and proof bodies were unchanged by the subsequent
metadata/dependency-link integration. Claim 03 was only spot-checked in that
review and remained ready then; its separate acceptance is recorded below.
The external premises were not recertified. No realizability or novelty
conclusion, exhaustive claim-03 filter survey, or branch closure was supplied.
The original report's ready-state preamble describes the earlier author-only
stage, not the operative later acceptance.

<a id="independent-review-of-claim-connectivity-03-recorded-filters-and-interface-obligations"></a>
<a id="review-connectivity-03"></a>
### Historical independent review of claim 03

**Author:** Main. **Independent reviewer:** ConnRigor. Claims 01/02 were
accepted premises, rechecked only as claim 03 uses them.

<a id="checks-and-findings"></a>
All four parts were independently rederived. The reviewer checked the located
unconditional A-only filter inventory, the isolated-vertex row boundary at zero
excess, the exhaustive m=2/3 triangle cases, and the actual-column obligation
from I5-freeness. The latter is an interface obligation, **not** an I4
prohibition on all of A. The survey covers located recorded filters, not every
possible predicate in the corpus; neither realizability nor exclusion follows.

The initial outcome was **changes-requested**, with correct mathematics:
F1 required citing claim 02 for `a<=68`; F2 required the cap 13 and a bounded
filter inventory; F3 required sourcing the column obligation; F4 required
defining `epsilon=d_G-18` once. Claims 01/02 retained their separate acceptance.

<a id="addendum-2026-10-19-renewed-review-after-documentation-fixes"></a>
ConnRigor's renewed review reread the full repaired file and checked the six
localized metadata, citation, definition, and inline-derivation edits. F1--F4
were resolved, while all original bounds, quantifiers, arguments, and search
use were unchanged. The renewed outcome was **accepted** for
[#claim-connectivity-03](#claim-connectivity-03), superseding its initial
changes-requested outcome. The retained statement and proof above are that
repaired development, not a new argument.

<a id="dependencies-and-limits"></a>
Claims 01/02 supply component shapes and census slices; the reduction-index
premises, external Ramsey values, the slices 50..55/60/68,
`E(4,5,17)=79`, `E(4,5,14)=60`, and the global degree interval 18..24 remain
recorded and unrecertified. Acceptance permits scoped propagation only, not a
novelty assessment, formal certificate of every interface obligation,
realizability, branch closure, or x-exclusion.


## Search integration

For G[A] generation: connected-only generation (geng -C) is sound whenever
a>=69, equivalently q<=16, including x=136. More generally, it is sound
outside [53,58] union {61,68}. This is not a necessary-and-sufficient threshold
for connectivity or for ambient realizability. In the three exceptional slices,
generate without -C or augment connected generation by the rigid families
K_m disjoint-union C of claim 1.
Those families are small: C ranges over (4,4)-free graphs on 15 vertices
with 50..55 edges, on 16 vertices with exactly 60 edges, and on 17 vertices
with exactly 68 edges. Whether any family member embeds as N(v) with a
valid interface is open; item (d) of claim 3 is the first column obligation
any such embedding must satisfy.

## Reviewed separator strengthening

### Small separators of degree-18 neighborhoods and interface transfer

The six statements below retain the complete mathematical strings and arrays
of the [historical proof snapshot](connected_structure_transfer.json).
The [independent review snapshot](review_connected_structure_transfer_20261019.json)
records their acceptance and narrow renewed-review repairs. Comparisons copied
from the proof retain their drafting-time wording (including “pending” for
concurrent interior work); the [interior topic](interior_transfer.md) now has its
own historical acceptance. That topic was and remains no premise here.

#### Scope and notation

**Pure graph.** A is a finite simple K4-free and I5-free graph of order 18. It is not assumed I4-free: alpha(A)=4 by R(4,4)=18.

**Ambient candidate.** Where interface or global degrees are mentioned, G is an actual hypothetical order-43 K5/I5-free graph, v has global degree 18, A=N_G(v), B=M_G(v), |B|=24. All conclusions are necessary conditions, not existence assertions.

**Parameters.** a=e(A), q=85-a, epsilon_z=d_G(z)-18, E=sum_{u in A}epsilon_u, x=e(A,B)=136+2q+E. No restriction to an x band, to E=0, or to a selected root is imposed unless explicitly stated.

**Separator.** S is any set of t vertices such that A-S is disconnected. The separator need not be minimal. Vertex connectivity kappa(A) is the minimum size of such an S, with kappa(A)=0 for disconnected A.

**Witness limit.** The two explicit connected-A constructions below are isolated (4,5,18) graphs. Neither is asserted to occur as N_G(v) in an actual order-43 candidate.

#### Premise ledger

Source hashes remain only in the immutable evidence snapshots. The live sources
below identify the same mathematical premises, without repinning historical
bytes.

<a id="P-ramsey"></a>
**P-ramsey.** [README premise record](../../../README.md#state-of-the-art)

R(3,3)=6, R(3,4)=9, R(4,4)=18. Published (4,4) upper edge extrema U(12)=40, U(13)=45, U(14)=50, U(15)=55, U(16)=60, U(17)=68; nonempty order-16 and order-17 classes for the isolated witnesses. McKay-Radziszowski 1992 is the recorded source; retained, not recertified.

<a id="P-connectivity"></a>
**P-connectivity.** [claims 01–03](#claim-connectivity-01)

Accepted disconnected classification K_m disjoint union C_(18-m), m=1,2,3; disconnected edge slices [53,58], {61}, {68}; alpha(A)=4; actual row identity and disconnected-column triple-hitting obligation. The new separator proofs repeat the partition argument at orders 17,16,15 rather than assuming the order-18 classification applies unchanged.

<a id="P-interface"></a>
**P-interface.** [reduction index](../reductions.md), sections 4.1, 4.3, 4.4, 5.1, 5.2

Global degree range 18..24; edge codegree >=max(d_G(u),d_G(w))-18; nonedge codegree in [max(d_G(u),d_G(w))-17,d_G(u)+d_G(w)-28]; r_u=17+epsilon_u-d_A(u)<=17; every actual column meets every I4 in A.

<a id="P-pivot"></a>
**P-pivot.** [pivot classes](pivot_classes.md), sections 1, 2, 3

0<=q<=35, q+E<=W/2+4, the deletion floor d_A>=max(0,6-q), higher-excess floor d_A>=epsilon, and the pointed adjacent-degree-18 averaging filter. For W<=10 every degree-18 root has q<=4+W/2 and a degree-18 neighbor.

<a id="P-selected-pivot"></a>
**P-selected-pivot.** [pairwise selected-root claim](pairwise_pivot_refinements.md#claim-pivot-pairwise-04)

Accepted maximum-neighborhood-edge root choice: for W=0,2,4,6,8,10 the same selected root has q upper bounds 4,4,4,4,5,5 and a degree-18 neighbor with overlap caps 9,9,10,11,12,12. Companion need not maximize neighborhood edges.

<a id="P-max-root-transfer"></a>
**P-max-root-transfer.** [clique augmentation](cliques_augmentation.md), section 3

Choosing a maximum-edge degree-18 root is safe for existence coverage; the selected-root property cannot be imposed on an arbitrary fixed root. Existing maximum-edge interface inequalities are unchanged.

<a id="L-cw0"></a>
**L-cw0.** [zero-excess connected research snapshot](c/w0/research.json#claim-cw0-budgets-and-rerooting), failed-exclusion routes (comparison only)

Unaccepted comparison target only, not a logical premise: E=0 fixes x=136+2q, not q=0, and connectedness alone was not shown to remove q>=2. This note independently obtains topology conditional on q, without importing the q=1 anchor theorem or any closure.

<a id="claim-connected-separator-profiles"></a>
### Separator profiles

**Scope.** Every pure graph A in the stated scope; every separator S with t=|S| in {1,2,3}; no q,E,x restriction.

**Dependencies.**

- P-ramsey
- P-connectivity, partition method only

**Conclusions.**

1. A-S has exactly two components. Either its independence profile is (1,3), with components K_m and C, 1<=m<=3, |C|=18-t-m, C K4/I4-free and alpha(C)=3; or its independence profile is (2,2), with both components K4/I3-free.

2. The (2,2) case is impossible for t=1; at t=2 its component orders are 8,8; at t=3 they are 7,8 in either order.

3. In the (1,3) case, a<=U(18-t-m)+binom(m,2)+8t+t*min(m,2)+binom(t,2). Thus the caps for m=1,2,3 are respectively (69,66,63) at t=1, (74,72,69) at t=2, and (80,79,76) at t=3.

4. In the (2,2) case, a<=61 at t=2 and a<=70 at t=3. These two caps are deliberately elementary upper bounds, not claimed sharp.

**Proof.**

1. Independence is additive over the components of A-S and is at most four. A component of independence number one is complete and has order at most three, because A is K4-free. A component of independence number two is K4/I3-free and has order at most eight by R(3,4)=9. If the total independence number were at most three, a disconnected graph would have profile (1,1), (1,2), or (1,1,1), with total order at most 6,11,9. This cannot equal 18-t>=15.

2. The total is therefore four. The disconnected profiles (1,1,2) and (1,1,1,1) have order at most 3+3+8=14 and 12 respectively, so are impossible. Only (1,3) and (2,2) remain, each with exactly two components. In the former case the alpha-three component C is K4/I4-free. In the latter each component has order at most eight, giving exactly the order pairs asserted at total orders 17,16,15.

3. For any z in S, N_C(z) is triangle-free: a triangle there together with z gives K4 in A. It is also I4-free as a subset of C. Thus |N_C(z)|<=8 by R(3,4)=9. Its neighbors in K_m number at most min(m,2), since three such neighbors together with z would give K4. There are no edges between the two components. Add the census cap on e(C), the binom(m,2) clique edges, the two attachment bounds summed over S, and the elementary e(S)<=binom(t,2) to get the displayed formula. Substitution of the stated U values gives all nine caps.

4. In the (2,2) case, the neighborhood in either component of any vertex of that component, or of S, is triangle-free and I3-free. R(3,3)=6 bounds its order by five. A component on n vertices therefore has at most floor(5n/2) edges, and each S vertex has at most ten neighbors across the two components. At t=2 this gives 20+20+20+1=61. At t=3 it gives 17+20+30+3=70. No adjacency within S or between S and components is assumed attainable simultaneously.

<a id="claim-connected-density-connectivity"></a>
### Density and vertex-connectivity hierarchy

**Scope.** Every pure graph A in the stated scope, whether initially assumed connected or not; hence every actual degree-18 root, for every E and x.

**Dependencies.**

- P-connectivity#claim-connectivity-02
- claim-connected-separator-profiles

**Conclusions.**

1. a>=70 (q<=15) implies kappa(A)>=2.

2. a>=75 (q<=10) implies kappa(A)>=3.

3. a>=81 (q<=4) implies kappa(A)>=4.

4. When A is explicitly assumed connected, define k(q)=4 for q<=4, 3 for 5<=q<=10, 2 for 11<=q<=15, and 1 for q>=16. Then kappa(A)>=k(q) and d_A(u)>=k(q) for every u. These are not asserted to be best possible minimum-degree bounds.

**Proof.**

1. The accepted disconnected classification gives a<=68 for disconnected A. The preceding claim bounds a by 69 if a one-vertex separator exists, by 74 if a two-vertex separator exists, and by 80 if a three-vertex separator exists. Excluding separators of all smaller orders proves the successive connectivity conclusions. Translate a=85-q directly.

2. For the minimum-degree consequence, suppose some vertex u has degree s<k(q). Deleting N_A(u), a set of s vertices, isolates u while leaving another vertex, since |A|=18 and k(q)<=4. This contradicts the connectivity conclusion. For q>=16 the explicitly assumed connectedness alone supplies minimum degree at least one.

**Comparison recorded in the source.** n43/d18/neighborhood_connectivity.md#claim-connectivity-02 concluded only connectedness for a>=69. The new thresholds forbid all cuts of orders one, two, three at a>=70,75,81 respectively, uniformly across the full d18 branch.

<a id="claim-connected-separator-columns"></a>
### Separator-conditioned columns

**Scope.** An actual ambient candidate; every separator S of size t=1,2,3, with the component profiles above; every actual cross column C_y=N_A(y), y in B.

**Dependencies.**

- claim-connected-separator-profiles
- P-interface, every column meets every I4
- P-ramsey

**Conclusions.**

1. For profile K_m disjoint union C in A-S, either K_m is a subset of C_y or |C_y intersect C|>=10-t-m. Thus the forced core incidences for a column omitting a clique vertex are (8,7,6) for t=1 and m=1,2,3; (7,6,5) for t=2; (6,5,4) for t=3.

2. For profile (2,2) with components X,Y, at least one of X-C_y and Y-C_y is a clique (including the empty set). Consequently at least one of |C_y intersect X|>=|X|-3 and |C_y intersect Y|>=|Y|-3 holds. In particular |C_y|>=5 for t=2 and |C_y|>=4 for t=3.

**Proof.**

1. If u in K_m is omitted by C_y, every independent triple in C must meet C_y: otherwise u, that triple, and y give I5 in G. Thus C-C_y is K4/I3-free and has order at most eight by R(3,4)=9. Since |C|=18-t-m, at least |C|-8=10-t-m vertices of C belong to the column. This proof does not require A itself to be I4-free, or say anything about column incidences on S.

2. In the (2,2) case, if both X-C_y and Y-C_y contain independent pairs, their union is an I4 in A missed by the column, since X,Y are different components of A-S. This is prohibited. Therefore at least one remainder has independence number at most one and is a clique of size at most three by K4-freeness. The two incidence alternatives follow, and the component-order pairs 8,8 and 7,8 give the scalar floors five and four. Edges involving S may impose further obligations but cannot invalidate this necessary argument.

**Comparison recorded in the source.** This transfers the disconnected claim-connectivity-03(d) column triple-hitting mechanism to connected neighborhoods with separators, and turns it into explicit core-incidence floors. It strengthens generic nonempty-column bounds only under the stated separator profile, not for all connected A.

<a id="claim-connected-row-root-transfer"></a>
### Row and companion-root transfer

**Scope.** Every actual ambient candidate with connected A; every q,E,x. The companion-root assertion additionally assumes t=m_0(v)>0.

**Notation.** L=max(0,6-q), F=max(L,k(q)), m_i=number of A vertices of excess i, t=m_0.

**Dependencies.**

- claim-connected-density-connectivity
- P-pivot, sections 1,2
- P-interface

**Conclusions.**

1. For every u in A, d_A(u)>=max(F,epsilon_u), and r_u<=min(17,17+epsilon_u-F). For excess-zero rows this is r_u<=17-F; in particular connectedness alone gives r_u<=16 instead of 17 when the old deletion floor is zero.

2. If t>0, some degree-18 neighbor u has lambda_vu=d_A(u)<=min(13,floor((170-2q-sum_{i=1..6}m_i*max(F,i))/t)), and lambda_vu>=F.

3. For q=15, m_0=10, m_1=8 and all other m_i=0, E=8 and x=174. The old pivot-class upper overlap filter is 13, while the connected-structure filter is 12; each excess-zero row also has size at most 15 rather than 17. This is an implication conditional on a realized numerical profile, not a feasibility assertion.

4. For a separator profile K_m+C, every u in K_m satisfies epsilon_u<=d_A(u)=m-1+|N_A(u) intersect S|<=m-1+|S|. For u in K_m and w in C, put h=|N_A(u) intersect N_A(w) intersect S|. Then max(0,max(epsilon_u,epsilon_w)-h)<=|R_u intersect R_w|<=7+epsilon_u+epsilon_w-h.

**Proof.**

1. The connectivity result gives d_A>=k(q), and the two existing pivot-class floors give d_A>=L and d_A>=epsilon. Combine them. Substitute into the exact identity r_u=17+epsilon_u-d_A(u), retaining the independent old cap r_u<=17.

2. The handshake sum of all internal degrees is 2a=170-2q. Higher-excess neighbors consume at least sum_{i>=1}m_i*max(F,i) of it. The remaining t internal degrees therefore average at most the displayed quotient, and at least one is no larger than its floor. Its global degree is 18 by membership in the m_0 class; adjacency to v makes its internal A degree the global overlap lambda_vu. The cap 13 is the old (3,5) common-neighborhood bound. For the example, a=70, F=2 and the old higher-degree floor is one; min(13,floor((140-8)/10))=13, whereas min(13,floor((140-16)/10))=12. The exact cross identity gives x=136+30+8=174.

3. A K_m component vertex u has neighbors inside A only in K_m-u and S. From r_u<=17 and the row identity, epsilon_u<=d_A(u). For w in C, u and w are nonadjacent. Their common neighbors in A all lie in S; their other common neighbors are v and R_u intersect R_w. Thus global codegree is 1+h+|R_u intersect R_w|. Apply the retained nonedge codegree interval [1+max(epsilon_u,epsilon_w),8+epsilon_u+epsilon_w] and rearrange. The existing global edge lower floor on the adjacent pair v,u is only lambda_vu>=epsilon_u; it does not itself rule out internal degree one.

**Comparison recorded in the source.** The old section-2 pointed filter in pivot_classes.md uses max(0,6-q,i) for each excess-i vertex. Replacing its floor by max(F,i) yields the stated conditional improvement and row caps. Concurrent interior_transfer.json derives stronger minimum-degree information by another method; the vertex-connectivity statement here is stronger structural information, but no numerical improvement over that separate pending note is claimed or used as a premise.

<a id="claim-connected-selected-root-transfer"></a>
### Selected-root transfer

**Scope.** Actual candidates with total excess W<=10; arbitrary degree-18 roots unless a maximum-edge root is explicitly selected.

**Dependencies.**

- claim-connected-density-connectivity
- P-pivot, section 3
- P-selected-pivot
- P-max-root-transfer

**Conclusions.**

1. At W=0 every degree-18 neighborhood is at least four-vertex-connected. At W in {2,4,6,8,10}, every degree-18 neighborhood is at least three-vertex-connected.

2. For the maximum-edge root of accepted claim-pivot-pairwise-04, its neighborhood is at least four-vertex-connected at W=0,2,4,6 and at least three-vertex-connected at W=8,10. These are the same selected roots as in that claim's cross-count and overlap table.

3. The guaranteed adjacent degree-18 companion has a four-connected neighborhood at W=0 and a three-connected neighborhood at W=2,4,6,8,10. The accepted overlap caps 9,9,10,11,12,12 and selected x caps 144,145,146,147,149,150 are unchanged.

**Proof.**

1. For any degree-18 root, q<=4+W/2 from the existing root budget and E>=0. At W=0 this is q<=4, giving four-connectivity. At W<=10 it gives q<=9, giving three-connectivity. These are universal-root conclusions, so apply to both endpoints of any existing adjacent degree-18 pair.

2. The accepted maximum-edge selection table improves the selected root to q<=4 for W=0,2,4,6 and q<=5 for W=8,10. Apply the connectivity thresholds at that root. The original proof ensures a degree-18 companion for W<=10. Its q need not equal the selected root's q; only the universal-root bound is used for it. No pair chosen by an independent family argument is silently identified with this pair.

**Comparison recorded in the source.** Adds quantified separator exclusions to the same roots of pivot_classes.md section 3 and pairwise_pivot_refinements.md#claim-pivot-pairwise-04, not just existence of some unrelated connected root.

<a id="claim-connected-shortcut-obstructions"></a>
### Connectedness shortcut obstructions

**Scope.** Isolated pure (4,5,18) graphs, with ambient-transfer limits stated separately; relevant to the full connected branch, not only E=0 or a small x band.

**Dependencies.**

- P-ramsey, existence of order-16 and order-17 (4,4) graphs
- P-interface
- P-pivot
- claim-connected-density-connectivity

**Conclusions.**

1. Connected (4,5,18) does not imply d_A>=2, and does not imply e(A)>=69. A connected example with 62 edges and a leaf follows from any order-16 (4,4) graph by attaching a length-two path.

2. There is a connected isolated (4,5,18) graph with 69 edges, a cut vertex, a leaf, and an independent-four transversal of size one. Thus the threshold a>=70 for two-connectivity cannot be lowered to 69 using only the stated pure-graph hypotheses; connectedness alone does not imply actual-column size at least two by transversal reasoning.

3. Neither witness is an order-43 Ramsey candidate or a certified ambient neighborhood. The global edge-codegree floor alone does not eliminate the leaf: it requires only epsilon_leaf<=1, already implied by the row cap.

4. In the E=0 connected branch, topology yields kappa(A)>=4 for q<=4, >=3 for q<=10, >=2 for q<=15. It yields no contradiction, no upper bound q<=15, and no extension of the q=1 core theorem to q>=2.

**Proof.**

1. An order-16 or order-17 (4,4)-free graph H is connected. Otherwise independence-number additivity, alpha(H)<=3, K4-freeness, and R(3,4)=9 give disconnected component orders at most 11, exactly as in the first separator proof. Such graphs exist by the recorded nonempty census classes. They have respectively 60 and 68 edges.

2. For order-16 H, add vertices z,u and edges zc,zu for any fixed c in H, with no other edges incident to z or u. The result is connected of order 18 and has 60+2=62 edges. Its only possible K4 would lie in H, since the new vertices have degrees two and one. An independent set uses at most one of z,u, so has size at most 1+alpha(H)<=4. It has a leaf. This is a complete mathematical construction from the retained existence premise, not a graph search.

3. For order-17 H, add a leaf u adjacent to one fixed z in H. The graph is connected of order 18 with 68+1=69 edges, is K4-free and has independence number at most four. Deleting z isolates u, so z is a cut vertex. Every I4 must contain u because H is I4-free; hence {u} meets every I4. Such an I4 exists: H-z has 16 vertices and is K4-free, so R(3,4)=9 supplies an I3 there, which together with u is independent. This proves every claimed property without supplying or assuming any interface to B.

4. If one attempts to place the leaf in an actual A, d_A(u)=1 gives r_u=16+epsilon_u<=17 and thus epsilon_u in {0,1}. The global edge-codegree floor for vu is max(d_G(v),d_G(u))-18=epsilon_u, and lambda_vu=1 is consistent with both values. A singleton actual column would additionally force all the recorded critical-core and degree conditions; the isolated transversal example does not assert these have a valid ambient completion.

5. Setting E=0 in x=136+2q+E gives x=136+2q, not q=0. The separator conclusions depend on q and continue to apply, but do not delete any q slice by themselves. In particular the isolated examples cannot be used to assert realizability of q=16 or q=23 in the zero-excess ambient branch. Conversely the q=1 signature theorem in c/w0 cannot be promoted to all connected A by any implication proved here.

**Comparison recorded in the source.** Rigorously diagnoses the failed connectedness shortcut recorded in c/w0/research.json, while extracting valid all-E separator statements. Distinguishes actual ambient filters from isolated-A counterexamples.

<a id="review-connected-structure-transfer"></a>
### Historical independent separator review

ConnectivityAudit, distinct from ConnectivityTransfer, independently reviewed
all six separator-transfer claims. Decisive checks covered the pure/ambient
boundary, all independence profiles (including the indispensable `(2,2)` case
at cut orders two and three), attachment and census directions, all nine caps
69/66/63, 74/72/69, 80/79/76, balanced-profile caps 61/70, and the correct
contrapositive threshold translations. Reuse of the ambient-stated original
claim 02 in the pure density claim was checked proof-internally: its partition,
Ramsey, and census inputs are pure, so no ambient assumption is imported.
The row example, codegree decomposition, genuine-column quantifiers, and
averaging over excess-zero neighbors were checked. The audit kept universal,
maximum-edge-selected, and companion roots distinct: the overlap and cross
caps concern the same selected pair as pairwise claim 04; the companion gets
only universal-root connectivity and need not maximize neighborhood edges.

The initial review **accepted the first five claims** and requested changes
only for the shortcut claim's missing density-connectivity dependency (F2).
A second note-level finding (F1) required adding reduction-index section 4.1
to the interface premise citation for global degree range 18..24. The positive
excess range was already correctly sourced from pivot classes, so neither
finding changed mathematics. Both isolated witnesses, their edge counts,
leaf/cut/transversal properties, and their non-ambient status were verified at
proof level; the q=1 core theorem was not imported, nor was the unaccepted
parameter landscape. The c/w0 material is comparison only.

The renewed review confirmed exactly the F1 citation and F2 dependency repairs.
Reverse-applying those two edits reproduced the originally reviewed bytes,
establishing that scopes, conclusions, proof bodies, premise hashes, and all
other content were unchanged. Its **renewed outcome accepted all six claims**,
superseding the shortcut claim's initial changes-requested outcome and closing
F1/F2. Subsequent status/search-use/review-link integration preserved claim
scientific content, as recorded by the historical synthesis. Thus draft-stage
self-audit and integration-gate text in the immutable proof snapshot do not
outweigh the renewed acceptance; no new review or promotion is inferred here.

Limits carry over: external Ramsey/census values and `E(4,5,17)=79` remain
unrecertified, attachment caps need not be jointly attainable, the elementary
balanced caps are not claimed sharp, and no novelty, ambient realizability,
candidate existence, branch closure, or exhaustive certificate follows. The
shortcut claim permits diagnosis only, not propagation of an ambient witness.

<a id="lean-formalization-history"></a>
<a id="formalization-and-review-continuation"></a>
## Lean formalization history

The original report first described an author-only ready stage and then recorded
independent acceptance and Lean continuation. Its historical module path was
`lean/Ramsey/d18/ConnectivityClassification.lean`; the retained source is now
[ConnectivityClassification.lean](../../../lean/Ramsey/n43/d18/ConnectivityClassification.lean).
It retains `Ramsey.d18.connectivity_classification`, the exceptional family
`IsKNeighborhood k` / `IsDisconnectedNeighborhood`, connectedness of the large
(4,4) component with an independent triple and no independent four-set, and
the exact complete-component order trichotomy. It now also supplies the
`conn`/`k1`/`k2`/`k3` subcase cover and the conditional `excludes_of_subcases`
reduction; these do not discharge the four subcase obligations.

The formal structural proof uses anticomplete cuts rather than the prose's
partition enumeration: if both sides are noncomplete, independent pairs force
both sides to be K4/I3-free of order at most eight, contradicting order eighteen.
A complete side has order at most three; its complement is (4,4)-free and is
connected by the analogous order-at-most-eleven argument. Thus the structural
Lean theorem needs the order-9 bound, not the order-18 bound. These small
Ramsey bounds are now proved theorems, as the [Lean index](../../../lean/README.md)
records; their original characterization as external premises describes the
prose's historical source ledger, not an instruction to change present axioms.

The old report additionally recorded `disconnected_edge_slices`, degree-18
wrappers, and formal connectivity corollaries for `q<=16` and `x=136`, using
the six published order-15/16/17 census bounds. **Those census-edge and numeric
connectivity corollaries are no longer retained in the current Lean source.**
Their accepted mathematical proofs remain above, but the old validation is not
a claim that current source still exports them. Original claim 03's interface
items were outside that formalization; the current Lean index separately
records K1 rigidity corresponding to claim 03(b). No retained Lean proof of
the six separator-transfer claims or the interior-transfer claims is asserted.

<a id="premises"></a>
<a id="limits"></a>
<a id="integration-handoff"></a>
### Historical validation and retained evidence

The original connectivity report records successful historical runs of
`lake env lean Ramsey/d18/ConnectivityClassification.lean`, `lake build`,
a temporary importing consumer, `lake env lean scripts/Audit.lean`, and
`sh lean/scripts/check.sh`. The consumer exercised the equivalence,
independent-triple extraction, and numeric connectivity corollaries including
`q<=16` and `x=136`; the consumer and temporary counting draft were removed. The report
records no new axiom or `sorry`, no `sorryAx` in new audited targets, unchanged
unrelated warnings/deliberate sorries, and passing build/sorry-ledger/style/axiom
expectations. These are **historical reported outcomes**, not reruns or
certification of the current, subsequently changed Lean export set.
The deleted original report is recoverable with
`git show 65831d0^:research/reports/2026-10-17-d18-connectivity.md`.

The deleted cross-branch synthesis separately records scalar separator-cap
validation and exhaustive checks of two **prescribed**, not searched, graphs.
For its fixed 62-edge witness, use vertices 1..16 with Paley-17 residue set
`{1,2,4,8,9,13,15,16}`, joining `i,j` when `(i-j)%17` belongs to the set;
add vertices 17,18 and edges `(1,17),(17,18)`. The historical result was
connected, minimum degree 1, with 3,060 K4 subsets and 8,568 I5 subsets checked.
For its 69-edge witness use Paley-17 on 0..16 and add leaf 17 adjacent to 0;
it reported 56 independent four-sets, all containing the leaf. No graph files
were generated: the former report retained definitions/source, not a catalogue
or ambient completion. Both witnesses' general analytic constructions remain
fully proved in [the shortcut claim](#claim-connected-shortcut-obstructions).
The former report is recoverable with
`git show 65831d0^:research/reports/2026-10-19-cross-branch-synthesis.json`;
it was deleted with the reports directory and is not a current fixture or live
link. The immutable separator proof/review snapshots linked above remain
current historical machine-readable evidence; these records are not new runs.

The separator author's own audit covered profile partition completeness, cap
arithmetic, and the conditional q=15/m_0=10/m_1=8 example. That self-check is
not independent review; the separate ConnectivityAudit acceptance supplies
the review record. No graph search, solver, catalogue, download, installation,
new formalization, or branch-closing evidence was produced by this migration.

### Validation of the retained definitions

The two prescribed fixed witnesses above were replayed directly: both edge
counts, connectedness and minimum degree were checked, and every four-subset
was tested for K4 and every five-subset for I5. The 69-edge witness also
reproduced the recorded independent-four count and leaf-transversal property.
All nine separator caps and both balanced-profile caps were recomputed from
the displayed census upper bounds. This validates the retained definitions
and arithmetic, not the external census, an ambient completion, or a closure.

## Changelog

- Classified disconnected neighborhoods and their census slices; clarified that
  `a>=69` is sufficient, not an if-and-only-if test, for connected-only
  generation. ConnectivityAudit accepted claims 01/02.
- Repaired claim 03's cited edge bound, bounded filter inventory, cap/column
  provenance, and excess definition. ConnRigor's renewed acceptance superseded
  documentation-only changes-requested findings without changing mathematics.
- Added the six separator, topology, column, row/root, selected-root, and
  shortcut claims. ConnectivityAudit accepted all six after narrow
  degree-range citation and density-dependency repairs.
- Consolidated full immutable-snapshot mathematics and compact independent
  reviews here, replacing the short separator summary without duplicating
  proofs. Retired the separate claim-03 Markdown review; preserved original
  topic/report/review anchors and the deleted report's useful validation and
  Lean history, explicitly distinguishing removed numeric corollaries and
  absent report fixtures from current sources. No proof or review-state change.
