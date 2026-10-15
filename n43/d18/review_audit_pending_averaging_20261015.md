# Independent audit of the averaging notes

Date: 2026-10-15.
Reviewer: Codex independent reviewer `audit_degree18_averaging`, task
`/root/audit_degree18_averaging`, distinct from authors `Codex
weighted-averaging task` and `Codex averaging extension`.
Reviewed repository HEAD: `b12925f7a96d24e18d06b0237930a32e30660ca2`.
The SHA-256 hashes below identify the exact reviewed working files;
the authors' self-audits were not used as evidence.

| Reviewed source | SHA-256 |
| --- | --- |
| `weighted_averaging.md` | `58fb2c566ae3930d14825f2d73b0fdc18dfca1e90399c3b5516e30c4fd491cbc` |
| `anchored_cell_averaging.md` | `6d6cf68977b29e0c3b98f87ecbc9b5f1287603413fbcc0cd51205a6811f21a9d` |
| `averaging_future_work.md` | `7b840aaddd9cd70c821896ba2d53be8dafc55561d6122941bd74a5440deb5248` |

No solver, graph enumeration, download, installation, or certificate checker
was used. All checks below are mathematical. This review records acceptance
of local reasoning conditional on its identified external premises, not an
order-43 exclusion, primary-literature replay, or novelty finding.

## Dependencies and ambient assumptions

Throughout, the hypothetical graph is simple, of order 43, and K5/I5-free.
The root has degree 18, so A has order 18 and type (4,5), while B has order
24 and type (5,4). In particular A may contain I4; only B is I4-free.
The external premise R(4,5)=25 gives 18<=d_G(z)<=24 and hence nonnegative
epsilon_z=d_G(z)-18. The external (4,5,18) census interval 50..85 gives
0<=q=85-e(A)<=35. Independently summing degrees on A gives

    18+2e(A)+x = 18*18+E,
    x = 136+2q+E,
    |N_B(u)| = 17+epsilon_u-d_A(u).

The smaller Ramsey inputs used in the cell caps are R(4,4)=18,
R(3,4)=9, R(3,3)=6, R(3,5)=14, and R(2,t)=t. Their values are accepted
as established external premises, not re-proved here. The census extrema
likewise have not been replayed from their primary publication or catalogue.

| Dependency read | Exact SHA-256 |
| --- | --- |
| `frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `symmetry_reduction.md` | `6b9072c4a9b1f54042bd6d7e4913d4aedd5b0a8e8c04a2d18b994c2dc2d31d1b` |
| `x142/q3/three_columns.md` | `00e670d5e5a5943f4f725184634f59be5ddf758b7b084551a9f3fd504ee068ee` |
| `transfer_summary.md` | `dd18ca7a750c8e67ec29fee57858482d1eba400315d5904e42dbe0ca3d809859` |
| `../../docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |

## Per-claim decisions

| Claim | Outcome on exact source | Permitted mathematical use |
| --- | --- | --- |
| `weighted_averaging.md#claim-weighted-anchor-excess` | accepted | Necessary excess/cross-count propagation for actual anchor families |
| `weighted_averaging.md#claim-weighted-random-order` | accepted | Rational necessary-condition rejection of proposed column families |
| `anchored_cell_averaging.md#claim-cell-types` | accepted | Actual cell type and size caps |
| `anchored_cell_averaging.md#claim-cell-quadratic-budget` | accepted | Weighted remaining-edge/nonedge budgets |
| `anchored_cell_averaging.md#claim-cell-saturation` | accepted | Internal degree intervals and sound completion implications |
| `anchored_cell_averaging.md#claim-cell-higher-order-propagation` | changes-requested | Core B-edge/nonedge implications accepted; literal F-membership example rejected below |
| Future-work high-x thresholds and row-family identities | accepted as local deductions | Necessary propagation; research-priority choices remain planning |
| Future-work adjacent size-16-row observation | accepted as local deduction | Conditional overlap and cell structure, never a row-pair exclusion |
| Future-work mixed edge/independent-pair cell observation | accepted as local deduction | Cell cap and C5 completion at order five |
| Future-work q3 threshold applicability | accepted on retained external census premise | Actual-column lower bound in q=3, 143<=x<=155 |

Future-work statements currently lack stable anchors. Recommended IDs for
coordinator integration are `claim-averaging-large-row-family`,
`claim-averaging-adjacent-sixteen-rows`, and
`claim-averaging-mixed-three-three-cell`. These are suggested identifiers,
not existing source anchors. The q3 application should reference its
already identified accepted dependency rather than imply a new theorem.

## Independent checks of weighted averaging

For each actual I4 anchor I, every B column meets I: a missed column extends
I to I5. In each exact singleton-signature class, two nonadjacent B vertices
extend I minus its specified vertex to I5. That class is therefore a clique;
four of its vertices together with the specified A vertex form K5, so its
size is at most three. Of the 24 nonempty signatures at most twelve are
singletons, which gives e(I,B)>=36. Substituting the independently derived
vertexwise degree identity gives E_I>=d_A(I)-32.

For nonnegative weights with vertex multiplicity at most one,
sum_I lambda_I E_I=sum_u m_u epsilon_u<=E. This proves the displayed
certificate and integer ceiling. The finite packing polytope is compact:
each anchor variable is bounded by one by any of its four vertex constraints.
With rational coefficients its maximum exists and has a rational optimal
vertex. Thus the use of L(A), including E>=ceil(L(A)), is justified.
Zero weights establish L(A)>=0, and omitting negative-payoff anchors
preserves feasibility while increasing the objective. The unaggregated
vertex-excess inequalities also remain valid.

The family certificate with weight 1/t has payoff (D-32m)/t. Four disjoint
anchors of degree sum at least 40 give E>=4*(40-32)=32 and x>=168+2q.
A single such anchor gives E>=8, so q=0 excludes x<=143. The proposed-profile
failure test D>32m+t*(x-136-2q) is precisely violation of the unrounded
necessary bound. These are conditional examples, not claims that such
anchor families occur.

For two column occurrences, residual I3 plus the two nonadjacent B vertices
would give I5, so an F edge is a B edge. A triangle in their common column
plus adjacent B endpoints would give K5, so an H edge is a B nonedge.
Simultaneous membership is impossible. A residual set of order at least nine
contains I3 because it is K4-free and R(4,3)=9; thus union size below ten
indeed suffices for F membership.

For an arbitrary graph J, independent exponential clocks with positive
rates select a vertex with probability w_y/(w_y+sum_N w_z). Two adjacent
vertices cannot both be selected because each would require its clock to
precede the other's. Thus the expected number selected is at most alpha(J).
Applying to complements of F[S] and H[S] gives the respective caps four
and three. The denominators include all other nonneighbors in the relevant
forced graph and never vanish. This uses actual occurrences, permits
repetitions, and applies to every nonempty partial family S.

Uniform weights give denominators |S|-d(y). For all 24 occurrences,
Cauchy-Schwarz gives 576/(576-2e(F))<=4 and
576/(576-2e(H))<=3, hence e(F)<=216 and e(H)<=192. The example degree
list has sum 3*22+21*14=360, or 180 edges, and reciprocal sum
3/2+21/10=18/5>3. Its advertised conditional rejection is correct.
No assertion of realization of that example is required. Nonuniform and
subset tests are legitimate further necessary conditions.

The incidental higher-order statements also follow: an independent B
triple leaves a residual A set with no nonedge, since that nonedge would
extend the triple to I5, and its clique order is at most three because A
is K4-free. A B triangle has an independent common A neighborhood, since
an A edge there extends it to K5, and order at most four because A is
I5-free. Neither pairwise averaging nor these observations assert full
completion coverage.

## Independent checks of anchored cells

Cell types: Q and P are in A and T is in B, so they are disjoint from T.
A forbidden (5-|Q|)-clique in T joins Q to form K5. A forbidden
(5-|P|)-independent set in T joins P to form I5. B separately forbids I4,
which gives the minimum independence parameter. If Q meets P the membership
requirements contradict each other, so T is empty. Empty anchors and a
parameter one are handled correctly. Substitution in the established
smaller Ramsey numbers verifies all eight numerical table rows. In
particular an A edge produces a (3,4) containing-column cell of order at
most eight, and an independent A pair produces a (5,3) missing-column
cell of order at most thirteen.

Weighted budgets: merging positive mass at two nonadjacent vertices into
the endpoint with greater neighbor-weight sum cannot decrease weighted
edge sum and strictly decreases support. The process stops on a clique
of order l<=k. On unit total mass its edge sum is
(1-sum w_y^2)/2<=(l-1)/(2l)<=(k-1)/(2k). Zero total mass is immediate.
Apply to B[T] with k=a-1 and its complement with k=b-1, using total
unordered pair weight (W^2-D)/2, to obtain both displayed inequalities.
Subtracting forced-edge weight f and imposing 0<=e_U<=V gives exactly
the stated completion interval; forced-nonedge weight only removes
available pair weight. Integer rounding in uniform examples is inward,
and all four stated scalar bounds check algebraically. A forbidden clique
of order a with equal weight on its vertices violates the upper bound;
the dual independent set of order b violates the lower bound. Thus the
all-weight logical equivalence statement is also correct.

Saturation: in a type (a,b) cell of order m, the neighborhood is
(a-1,b)-free and the antineighborhood is (a,b-1)-free, of respective
orders d and m-1-d. Their Ramsey bounds give
m-R(a,b-1)<=d<=R(a-1,b)-1. This verifies degrees 8 at (4,4,17), 7..8
at (4,4,16), 2..3 at (3,4,8), 4..5 at (4,3,8), and 2 at (3,3,5).
Handshake yields the listed edge intervals 68; 56..64; 8..12; 16..20;
and 5. A simple triangle-free 2-regular graph on five vertices is C5.

Subtracting forced incident edges from an allowed degree interval gives
the stated interval for t_y. The all-edge/all-nonedge consequences apply
after excluding an empty interval, as the source says. A size-17 row is
a (4,4) cell because u forbids a row K4 and B forbids row I4, hence each
of its vertices has eight row neighbors and eight row nonneighbors.

For y in T, y has no root edge and has exactly |C_y| neighbors in A,
so d_B(y)=d_G(y)-|C_y| lies in 18-|C_y|..24-|C_y|. At most 24-m of
those neighbors are outside T. Intersecting with 0..m-1 gives precisely
max(0,m-6-|C_y|)..min(m-1,24-|C_y|). Fixed excess and known outside
edges can replace these coarser contributions as stated.

Higher-order implication: columns missing an independent A triple form
a clique of order at most four; columns containing an A triangle form
an independent set of order at most three. Columns missing an independent
A pair cannot form an independent B triple, so two known nonedges force
the third B pair to be an edge. Columns containing an A edge cannot form
a B triangle, so two known edges force the third to be a nonedge. Mixed
(3,3) cells require both an edge and a nonedge in every triple, and their
order-five completion is C5. All these implications are valid independent
of excess and do not require maximal cells.

### Rejected literal F-membership assertion

The example under `claim-cell-higher-order-propagation` says:

> the third pair must enter F even if its own residual A graph has no independent triple.

The linked weighted-averaging source defines F exactly by existence of an
I3 in that pair's residual A graph. Under that definition, a pair with
no such I3 cannot enter F. The triple argument proves a forced B edge;
it does not prove existence of an I3 witness. This literal assertion is
rejected and should be withdrawn. The dual reference to propagating pairs
into the original F/H graphs has the same potential ambiguity.

Required narrow repair: preserve the exact witness graphs F and H, and
introduce separate closure graphs F* and H* containing all soundly inferred
B edges and nonedges. Replace the quoted assertion by “the third pair is
a forced B edge, even if it is not an edge of the original witness graph
F.” Define closure before using it. This corrected implication is proved
above. The random-order inequalities remain valid on any sound closure
graphs because they only need containment in B and its complement, but
such generalized scope should be explicit. The original higher-order
claim section is changes-requested until a corrected revision is reviewed;
its core logical rule does not need withdrawal. No branch result depends
on the incorrect literal witness-membership assertion.

## Independent checks of future-work observations

Universal row bound: B[R_u] is K4-free because a row K4 with u gives K5;
it is I4-free because it is a subset of B (equivalently such I4 with the
root gives I5). Thus |R_u|<=17. Summing eighteen row sizes proves
x<=252 if all are at most fourteen and x<=270 if all are at most fifteen.
The thresholds x>=253 and x>=271 follow without q or E hypotheses.
If L rows have size at least sixteen, the others are at most fifteen
and all L are at most seventeen, giving x<=270+2L and
L>=max(0,ceil((x-270)/2)). With n16,n17 the exact identity
x=270+n16+2n17-D follows by subtracting fifteen from each row size.
All signs, counts, and rounding are correct. These are sufficient
thresholds; they do not prove smaller x cannot have large rows.

For adjacent u,w in A, their common row cell cannot contain a B triangle
because that triangle and u,w form K5; it cannot contain I4 because B
cannot. Thus its order is at most R(3,4)-1=8. Two size-sixteen subsets
of a 24-set have intersection at least eight. Equality proves intersection
eight, union all B, and two exclusive eight-cells. On the common (3,4)
cell, a neighborhood is independent of size at most three, while an
antineighborhood is (3,3)-free of size at most five; therefore every
degree is two or three. This proves the observation, never exclusion of
adjacent sixteen-rows or existence of them.

For an A edge Q2 and independent A pair P2 with disjoint anchors, the
intersection of their containing/missing cells has type (3,3), order at
most five, and is C5 at order five. Smaller or empty intersections do
not contradict these bounds. If the anchors overlap, that intersection
is empty instead, which is consistent with the general cell theorem.

The q3 regime 143..155 is within the exact applicable range of the
actual-three-column theorem and the elementary two-transversal bound.
Applicability can also be rederived: complement A has 71 edges and
alpha<=3; deleting a two-transversal leaves a 16-vertex (4,4)-free graph
with at least 56 edges and at least sixteen attachment edges, contradiction.
For an actual three-column T, the retained 15-vertex (4,4) minimum 50
forces equality 71=50+21, so T is an A triangle, J=A-T has 55 edges,
and its three attachment sets each have order eight. Their pair
intersections are independent of order at most three, with no triple
intersection. Inclusion-exclusion forces three disjoint pair-cells of
order three and three private cells of order two. The three disjoint I4
anchors consist of one T vertex and its opposite pair-cell. J degrees
are 6..8. For their union U (twelve vertices), sum_U d_A>=30+18+
(110-6*8)=110, whereas e(U,B)>=108 by the three anchor bounds.
Hence 108<=204+E_U-110, so E_U>=14 and x=142+E>=156.
The advertised q3 range therefore excludes sizes one, two, and three;
it does not assume an isolated universal four-transversal theorem at q=3.
The 15-vertex census lower endpoint remains an external premise.

## Integration limits and handoff

Promote the two weighted claims and the first three anchored-cell claims
to accepted local deductions with this exact-revision review. Keep the
higher-order section changes-requested until the F/H witness-versus-closure
distinction is repaired, and explicitly withdraw only its false literal
F-membership assertion. Add stable claim metadata to the future-work
local observations if they become indexed propagation rules. Research
targets, priority regimes, claims of practical usefulness, and possible
future attachment deductions remain planning; no performance evidence,
uniform positive anchor-packing bound, unavoidable saturated cell, or
exclusion of x>=143 was supplied or inferred.

All accepted necessary conditions may support future generation/completion
filters when their actual-set hypotheses and external premises are retained.
They do not supply exhaustive search coverage, symmetry certification, a
construction, a nonexistence certificate, or a decision of order 43.

## Independent re-review of the corrected higher-order example

Reviewed corrected source: `anchored_cell_averaging.md`, SHA-256
`b288336b44e961b75675a7daef7c860c7afadacde5ef5b09a70e2c31f42f38ff`.
Reviewer: the same independent `audit_degree18_averaging` reviewer;
the correction was authored and integrated by the coordinator, not this
reviewer. The original source hash and its rejection above remain historical
evidence and are not silently superseded.

Change inspected: the example now concludes a forced B edge, preserves the
witness definitions of F and H, and defines separate closure graphs F* and
H* with F subset F* and H subset H*. It explicitly withdraws the unsupported
literal F-membership assertion. The dual example now records the forced B
nonedge in H* without asserting original H membership.

Independent check: three actual B columns omitting an independent A pair
cannot form an independent B triple, because their three vertices together
with that pair would be I5. If two pairs belong to H, they are B nonedges,
so the remaining pair must be a B edge. This uses no residual-I3 witness
for the third pair. Dually, three columns containing an A edge cannot form
a B triangle, because that triangle and the A edge would form K5; two
F pairs therefore force the remaining B nonedge. Sound implication closure
maintains F* subset E(B) and H* subset E(complement B); overlapping closures
are a contradiction, and the triple/degree/budget rules remain necessary
conditions. This proves the corrected wording and graph distinction.

Outcome on corrected revision: **accepted** for
`anchored_cell_averaging.md#claim-cell-higher-order-propagation`.
The other three cell claims are also accepted at this corrected revision:
their statements, proofs, and mathematical hypotheses were unchanged by the
localized correction. Search use may become propagate for all four cell
claims, subject to the external premises and actual-set hypotheses recorded
above. The previous F-membership assertion remains withdrawn. This renewed
acceptance does not establish realizability or exhaustive branch coverage.

## Metadata integration verification

The independent reviewer inspected the coordinator's source diff after
acceptance metadata, review links, and two future-work anchors were added.
The current exact source hashes are:

| Integrated source | SHA-256 |
| --- | --- |
| `weighted_averaging.md` | `e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07` |
| `anchored_cell_averaging.md` | `719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3` |
| `averaging_future_work.md` | `9548b538030905b5b154c4aa04dcf6bd0a75b7f2729b1d568cf6a207b3d86b99` |

Outcome: **accepted as reference/metadata-only integration**. Mathematical
statements, hypotheses, proofs, examples, and research targets are unchanged
from the reviewed weighted/future-work sources and the independently accepted
corrected cell source. The withdrawn literal F-membership assertion and its
closure-graph correction remain explicit. Search-use metadata accurately
promotes only the accepted necessary-condition deductions to propagation;
research priorities retain planning status. The two future-work IDs now
identify the previously audited large-row family and adjacent-sixteen-row
observations. Earlier hashes and findings remain preserved above.
