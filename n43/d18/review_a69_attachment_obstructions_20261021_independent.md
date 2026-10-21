# Independent review of the 69-edge attachment obstructions

Date: 2026-10-21. Author: Main (`/root`). Independent reviewer:
`/root/a69_review_clean`. The reviewer owns this new review file only.

Claim(s): the six stable anchors in
[a69_attachment_obstructions.md](a69_attachment_obstructions.md), listed below.
Reviewed revision: uncommitted source at repository HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`, exact proof SHA-256
`e950033e2937805086c18e59f66d2863ad0aa8132fbd1e77436e695b31541e86`.
This hash was checked before reading and again immediately before writing
this review. Author self-audits and checker output were not used as
independent evidence.

## Premises and applicability

The review follows [.agents/AGENTS.md](../../.agents/AGENTS.md) and
[workflow](../../docs/workflow.md). All ambient statements use an actual
K5/I5-free graph on 43 vertices, with A= N(v) K4/I5-free and
B=M(v) K5/I4-free. Claim 4 is instead a pure 18-vertex K4/I5-free
statement. In particular, I4-freeness is imposed only on a core or a
cell where its anchor argument proves it.

| Source read, with current SHA-256 | Status and use |
| --- | --- |
| [Baseline](../../docs/mathematical_baseline.md), `de981cede9200a6d61fe7c113734bec5f1b2446d904ec5f16d42afa18a5dc7c0` | Retained literature premises R(3,3)=6, R(3,4)=R(4,3)=9, R(3,5)=R(5,3)=14, R(4,4)=18, and R(4,5)=25. The latter gives the all-vertex global degree range 18..24. No external proof or certificate was recertified. |
| [Root table](../../README.md#state-of-the-art), `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` | Retained published/computational input: every (4,4)-free 16-core has exactly 60 edges. The recorded 17-core count is 68, also rederived here from degree saturation. Source: McKay--Radziszowski, *A New Upper Bound for the Ramsey Number R(5,5)* (1992), Table 1, p. 16. No census uniqueness is assumed. |
| [Large-row extensions](large_row_extensions.md), `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` | The codegree/moment and eight-cell classification anchors are independently accepted; [review](review_large_row_extensions_20261017_audit.md), current review hash `14a19ee0a4914b5189b17cd797747400cd16c3e43847f1583c43b0a1d18f11fe`, records accepted proof-body hash `1f53107e3e8889c6ee8064e50578de8e092641b60e8b9c3eacfac6d6f2827c48`. The degree saturation, codegree sums, moments, and cubic classification were checked anew below. |
| [Independent-row cuts](independent_row_cuts.md), `553b70258b1ce63672d651ae8142ac013b9fb68347f24d372af9cbb922ff306f` | The two comparison anchors are accepted at body hash `8cfd9375da0f8bc3afd0c7e7bf123fc829afde62a427514dec7c04c2bf8c04a0`, per [review](review_independent_row_cuts_20261017_audit.md). The present B-pair tests and the stronger two-root count were independently derived from their actual cells; the tail or x136 closure is unused. |
| [Clique augmentation, Section 3](cliques_augmentation.md#3-choosing-a-pivot-by-neighborhood-edge-count), `4cb5c4bd34d7d45a3c42783fdf091ac3aae0acafcc6f6fd6203f83cf9d366b2c` | Recorded safe maximum-density root choice; this elementary coverage fact was independently checked: a nonempty finite degree-18 class has a maximizer. Its restriction applies only to Claim 2 and degree-18 destinations. No assumption that such a maximizer has 69 edges is added. |
| [69-edge decomposition](a69_decomposition.md), `b7398f2f92ac62e93041133be0e0990131683a8ca5349eecaed7eaf96dbb4085` | Ready, author-self-audited, not accepted when read. Not used as an established premise. Every needed core, transversal, attachment, and degree fact was derived directly from the retained inputs. Its higher-transversal claims are outside this review. |

For a (4,4)-free h-core, each neighborhood is (3,4)-free and each
antineighborhood is (4,3)-free. Hence h-9 <= d <= 8. At h=17 this
gives 8-regularity and 68 edges without a census. At h=16 the exact
60-edge premise then fixes eight degrees 7 and eight degrees 8. These
are the only core-degree facts needed from the pending decomposition.

## Claim outcomes and decisive checks

### 1. `claim-a69-overlap-two-improvement` — accepted

The disjoint cells have sizes 2,16,16,7 after excluding the two roots.
The exclusive cells are K4-free through their own root and I4-free
through the other root; Z is I3-free through the nonadjacent roots.
Subtracting the S-degree sum from the two neighborhood counts gives
a_v+a_y=152+E_S-e(S,Z), with root incidences totaling four and the
S-edge counted twice in both expressions.

For an edge in S, its double-neighbor cell in Z is K3/I3-free and has
at most five vertices, so e(S,Z)<=12 and the claimed 140+E_S bound
follows. For a nonedge with E_S=0, the endpoints both have degree 18.
Their common antineighborhood is K5/I3-free, of order at most 13;
among the 41 other vertices their neighborhood union has at least 28
members and their overlap at most eight. Two overlap members are the
original roots. Thus at most six Z vertices see both endpoints and
e(S,Z)<=13. When E_S>=1, e(S,Z)<=14 suffices. These exhaust the
integer nonnegative excess cases and establish 139 and strict re-rooting
to at least 70 from a 69-edge source.

Non-blocking metadata finding: this proof explicitly uses
R(5,3)=R(3,5)=14, which the linked baseline records, but Claim 1's
dependency line and the initial retained smaller-number list omit it.
Add 14 to both lists. It is already an explicit proof premise, so the
omission does not leave the argument dependent on an unstated theorem.

### 2. `claim-a69-selected-small-columns` — accepted

A contains I4 by R(4,4)=18; every actual column hits every such set.
For y in B, its B-neighborhood is K4-free through y and I4-free through
v, giving d_B(y)<=17. Global degree >=18 then fixes a singleton's
degree as 18, and restricts a two-column to degrees 18 or 19.

A singleton {u} makes A-u a 17-core, so s_u=1 and |N_B(u)|=16+epsilon_u.
Its B endpoint y has a 17-core neighborhood D. Within B-{y}, the two
sets have sizes 15+epsilon_u and 17, giving intersection at least
9+epsilon_u and a_y>=77+epsilon_u. This contradicts the selected
maximum-density hypothesis. Claim 1 excludes degree-18 two-columns.

Two remaining degree-19 two-columns would have nonadjacent endpoints
only if their union had size at least ten: its missed A cell is K4/I3-free
of order at most eight. Thus their endpoints are adjacent. Their
17+17 B-degrees force at least ten common B neighbors, while that edge's
common B cell is K3/I4-free of order at most eight. The contradiction
establishes the sole exception. The proof restricts actual column
vertices, including repeated signatures, and does not assert existence
of a selected root in the 69-edge slice.

### 3. `claim-a69-small-column-degree-competition` — accepted

The same missed-A-cell argument forces an edge whenever c_y+c_z<10.
The common-B-neighbor cap eight and inclusion-exclusion in B24 then
give d_B(y)+d_B(z)<=32. Substitution gives exactly
epsilon_y+epsilon_z<=c_y+c_z-4. Nonnegative excess yields all listed
singleton/two/three-column consequences, including degree 18 for every
three-column accompanying the degree-19 two-column.

For that pair the B-degrees are 17 and 15, so the common B cell has
at least eight and at most eight vertices. Their neighborhood union
therefore equals B. The common cell is triangle-free/I4-free and the
accepted S10/S11/S12 classification applies on its stated general scope;
it need not be a cell of two size-16 A rows. This forces no A-column
containment, and the source correctly makes no such inference.

### 4. `claim-a69-critical-contraction` — accepted

Deleting a transversal leaves an actual I4-free/K4-free 16-core.
The edge budget gives |P|+|Q|=9-g. A K4 through either endpoint
forces each attachment triangle-free; when g=1 their intersection is
independent of size at most three. When g=0, an I5 through both
endpoints forces D I3-free, and R(4,3)=9 gives |W|>=8 and |J|<=1.

The identified graph H has only two new obstruction tests: a triangle
in W or an I3 in D. If both tests pass, H is a 17-core and its
68 edges force |W|=8. This is equivalent to J empty in the edge
case and J singleton in the nonedge case. Consequently even failure
of the edge-case disjointness requirement must have one of the two
displayed witnesses; there is no missing third defect. A triangle in
W contains a vertex of P-Q and a vertex of Q-P, since otherwise it
lies in one triangle-free attachment. Disjoint nonedge attachments
have |W|=9 and necessarily fail the triangle test. Identification is
used as a defined graph operation for both relations, without a minor
assumption, and a defect is not promoted to an ambient contradiction.

For completeness, H's edge codegrees are <=3 and nonedge codegrees
<=4. There are 68 pairs of each relation, and the total codegree
sum is 17*binom(8,2)=476=68*3+68*4, so all caps saturate.
Regularity therefore gives W=L: neighbors of the identified vertex
have degree seven after its deletion, and nonneighbors degree eight.
Edge codegree three makes L cubic; nonedge codegree four gives four
neighbors in L at each U vertex. Every L vertex likewise has four
U neighbors. The U graph is degree four and I3-free, so its complement
is a cubic triangle-free/I4-free eight-graph. The cubic part of the
classification makes both L and the complement of U isomorphic to
S12. This proves the entire stated partition without core uniqueness.
The classification's cubic step can also be checked directly: a vertex
has an independent three-neighbor set P, its other four vertices Q
have three edges and no triangle or I3, hence induce P4; cubic degrees
and triangle avoidance force exactly the displayed S12 attachments.

### 5. `claim-a69-sixteen-core-moments` — accepted

Degree sums on eight degree-seven and eight degree-eight vertices give
e(U)=b+4 and e(L,U)=56-2b. Each core neighborhood is triangle-free
and I4-free. A neighbor's degree within that neighborhood is at most
three because it is an independent set in the core. Thus a seven-vertex
neighborhood has at most floor(7*3/2)=10 edges; an eight-vertex one
has at most 12. The bound 3T<=176 gives T<=58. The complement has
the same degree profile and exact 60-edge count, so its triangle count
also has this upper bound. Goodman gives T+I3=560-448=112, yielding
54<=T,I3<=58. Hence the stated neighborhood-defect totals are exactly
176-3T in {2,5,8,11,14}; this is a set of permitted totals, not a
claim that every triangle count is realized.

Edge codegree <=3 follows because a common neighborhood is independent
in an I4-free core. On a nonedge, the common antineighborhood must be
a clique of order at most three, and its order is
14-d(c)-d(c')+codegree(c,c'), giving the claimed cap d(c)+d(c')-11.
There are 28-b LL nonedges, 8+2b LU nonedges, and 24-b UU nonedges.
Their caps 3,4,5 and the 60 edges of cap three sum to
180+3(28-b)+4(8+2b)+5(24-b)=416. Independently the codegrees sum
to 8*binom(7,2)+8*binom(8,2)=392. Every deficit is nonnegative,
so the exact slack is 24. No finite isomorphism census is inferred.

### 6. `claim-a69-exceptional-column-core` — accepted

The two-column is a transversal, giving the 16-core C; D=N_B(y)
is a 17-core because y has degree 19 and two A neighbors. The common
nonneighbor cell Z has six vertices and no I3 through nonadjacent v,y.
The budget e(A)=60+g+e({u,w},C) gives s_u+s_w=9+g.

For t in {u,w}, N_D(t) is triangle-free through the edge ty and
I4-free as a subset of D, so b_t<=8. Since the B row of t contains
y, its size after deleting y is 16+epsilon_t-s_t. Inclusion-exclusion
in B-{y}, of size 23, gives b_t>=10+epsilon_t-s_t and hence
epsilon_t<=s_t-2. If s_t=2, nonnegative excess forces epsilon_t=0
and b_t=8. The remaining six members of that 14-vertex row all
belong to Z, proving full Z adjacency and the stated eight-cell type.

Rechecking its same-core moment pairs uses H=D and the selected eight-set:
sum h=64-2e and sum binom(h,2)=112-e-sum binom(d_internal,2).
The S10/S11/S12 degree sequences have respectively four/two/zero
degree-two vertices, giving internal second moments 16/20/24 and
outside pairs (44,86), (42,81), (40,76). No independent choice of a
nine-vertex complement is introduced.

The endpoint global degree sum counts two edges to v, two to y,
s_u+s_w in A, and b+h in B. It yields b+h=23-g+E_T.
For g=1, at most five Z vertices see both endpoints by K3/I3-freeness,
so h<=6+5=11; otherwise h<=12. Together with b<=16 these give
E_T<=5 in both cases. Finally N_G(y)={u,w} disjoint union D and
its edge count is 68+g+b=91+E_T-h. Thus the two lower bounds are
80+E_T and 79+E_T. The endpoint y remains degree 19 throughout;
maximum-density selection among degree-18 roots is neither needed nor
misapplied in this claim.

## Findings, permitted use, and limits

All six claims are **accepted at the exact reviewed proof hash above**,
conditional on the retained literature/census premises. No substantive
proof gap, missing case, incorrect ambient type, or algebraic error was
found. The sole outstanding correction is the non-blocking R(3,5)=14
dependency-list omission in Claim 1 and the opening ledger. Reference or
metadata integration should preserve this reviewed hash as provenance;
a mathematical proof change requires renewed review.

The claims support their stated conditional root selection, structural
branching, and witnessed propagation. Claim 2 requires a maximum-density
degree-18 root; Claim 4's defects are retained local cases; none is a
closure of the 69-edge slice, the degree-18 branch, or order 43. The
exceptional degree-19 two-column, all large-column completions, and the
higher-transversal families remain open.

Validation consisted of independent mathematical derivation, source and
review reading, exact file hashing, and a bounded scalar Python calculation
of 560/448/176, the 416/392 slack sums, 476 codegree saturation,
the three eight-cell moment pairs, and constants 152/23/91. No graph or
subset enumeration, solver, catalogue download, theorem prover, author
checker replay, further agent, staging, or commit was used. External
premises and novelty were not independently recertified; acceptance is
of the written deductions, not a formal or exhaustive Ramsey certificate.
