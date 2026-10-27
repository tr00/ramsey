# Interface bounds for degree20 with no degree18 vertices

Date: 2026-10-22. Author: Main, alone. Claims are ready for independent
review. No graph search, branch closure or executable pruning is involved.

Let G in R(5,5,43), d_G(v)=20, and n18(G)=0. Put A=N(v), B=M(v),
a=e(A), b=e(B), x=e(A,B). Thus |A|=20, |B|=22 and19<=d_G(z)<=24.
For u in A and y in B put

    s_u=d_A(u), r_u=|R_u|, R_u=N_B(u),
    t_y=d_B(y), c_y=|C_y|, C_y=N_A(y),
    epsilon_z=d_G(z)-19,
    E_A=sum_A epsilon_z, E_B=sum_B epsilon_z.

The inherited isolated-side edge intervals are68<=a<=100 and117<=b<=143:
Angeltveit--McKay, arXiv:2409.15709v2, Appendix A, Table1, orders20 and22
(the latter complemented), already recorded in
[theory phase I, Section7](../../../docs/theory_phase_1.md#7-complement-normalized-minimum-degree-20-branch).
Their use here needs only the side types (4,5,20) and (5,4,22), not that
section's minimum-degree20 or complement-selector hypotheses.
Other premises are R(3,4)=9, R(4,4)=18, R(3,5)=14 and the recorded
17-core degree8. They are not recertified by this task.

<a id="claim-d20-degree-corridor"></a>
## 1. Exact excess identities and degree bounds

Claim ID: n43/d20/interface_bounds.md#claim-d20-degree-corridor  
Kind: local-deduction  
Review state: ready  
Scope: no-degree18 setting above  
Dependencies: displayed edge intervals; degree summation; small Ramsey bounds  
Conclusion: exact identities and pointwise bounds below; in particular x>=160  
Search use: none pending review; proposed numerical propagation  
Reviews: none

Sum degrees on the two sides, counting the20 pivot edges on A only:

    x=360-2a+E_A=418-2b+E_B,
    b-a=29+(E_B-E_A)/2,
    e(G)=409+(E_A+E_B)/2,
    E_A=2a+x-360, E_B=2b+x-418.

Both excesses are nonnegative; E_A+E_B is even, and
x is congruent to E_A and E_B modulo2. The pointwise constraints are

    2<=s_u<=13, max(5,18-s_u)<=r_u<=min(17,23-s_u),
    8<=t_y<=17, max(3,19-t_y)<=c_y<=min(16,24-t_y).

For the internal lower s_u bound, the vertices of A outside u missing u
are K4/I4-free, so number at most17. Upper s_u follows because N_A(u)
is triangle-free/I5-free. R_u is K4/I4-free, giving r_u<=17. Thus
s_u+r_u=d_G(u)-1 lies in18..23. Dually, t_y>=8 because y's B-nonneighbors
are K5/I3-free of order at most13; t_y<=17 because N_B(y) is K4/I4-free.
The missed set A-C_y is K4/I4-free, giving c_y>=3. Finally
c_y=d_G(y)-t_y<=24-t_y<=16, using t_y>=8. This upper column cap uses
the ambient degree bound, rather than the isolated type of C_y.

Since a<=100, the first exact identity gives x>=160. The scalar degree
corridor before the stronger upper bound in Claim3 is

    max(160,360-2a,418-2b)<=x<=min(460-2a,528-2b).

For the complement-closed residual (n24=0), replace24 by23 in all
ambient caps: r_u<=min(17,22-s_u), c_y<=min(16,23-t_y),
and the scalar upper bounds become440-2a and506-2b. Degree19 remains
allowed, so E_A is measured above19 and must not be assumed to be an
excess above20.

<a id="claim-d20-small-column-competition"></a>
## 2. Small columns compete for the degree floor19

Claim ID: n43/d20/interface_bounds.md#claim-d20-small-column-competition  
Kind: local-deduction  
Review state: ready  
Scope: any two distinct columns y,z in the no-degree18 setting  
Dependencies: R(4,3)=9; R(3,4)=9; degree floor19  
Conclusion: yz nonedge implies |C_y union C_z|>=12;
c_y+c_z<12 implies yz edge and epsilon_y+epsilon_z<=c_y+c_z-8  
Search use: none pending review; proposed pair propagation  
Reviews: none

If yz is a nonedge, A-(C_y union C_z) has no I3, since such a triple
would extend with y,z to I5. It is also K4-free, so has order at most8.
Thus |C_y union C_z|>=20-8=12. If c_y+c_z<12, yz is therefore an edge.
Its common B-neighbors form a triangle-free/I4-free graph and number at
most8. The two B-neighborhoods are subsets of B, so

    t_y+t_z<=22+8=30.

Substitute t_y=19+epsilon_y-c_y and the analogous identity for z:

    epsilon_y+epsilon_z<=c_y+c_z-8.

Consequently there is at most one size-three column, and a size-three
column excludes all size-four columns. Two size-four columns force an
edge and both endpoints have degree19. All size-four columns form a
clique, and if at least two occur they all have degree19; their number
is at most3 by the K4 degree budget in Claim5 below. A triangle
in C_y intersect C_z would force yz to be a nonedge, so such an overlap
is forbidden whenever the size condition forces an edge. None of these
conclusions assumes the existence of a small column.

<a id="claim-d20-cross-upper"></a>
## 3. Large-row omissions give the unconditional upper bound290

Claim ID: n43/d20/interface_bounds.md#claim-d20-cross-upper  
Kind: local-deduction  
Review state: ready  
Scope: no-degree18 setting above; no saturation or root maximization  
Dependencies: R(3,4)=9; R(4,4)=18; degree floor19; I5 prohibition  
Conclusion: x<=290; if any size17 row occurs, x<=289; full corridor below  
Search use: none pending review; proposed numerical propagation  
Reviews: none

Let L_j={u in A:r_u=j}, t=|L17|, s=|L16|, h=|L15|, and

    D=sum_(r_u<=14)(14-r_u)>=0.
    x=280+3t+2s+h-D.

An A-edge has common B-neighborhood of order at most8. Hence any two rows
whose sizes sum to at least31 cannot be adjacent, since B has order22.
In particular L17 union L16 is independent and anticomplete to L15,
so t+s<=4. For each y in B, the rows from L15 omitting y are independent:
if two were adjacent, their intersection would have order at least
15+15-21=9. Combining those omitted rows with L17 union L16 gives an
independent subset of A, so at most4-t-s such L15 rows omit y. Sum over B:

    7h<=22(4-t-s).

There is also an independent subset consisting of the rows from L17,
L16 and L15 that omit y. It has at most3 members, or adjoining y makes I5.
Counting their respective5,6,7 omissions gives

    5t+6s+7h<=66.

For t=0 these inequalities give the following bound for2s+h:

| s | 0 | 1 | 2 | 3 | 4 |
| --- | --- | --- | --- | --- | --- |
| maximum h | 9 | 8 | 6 | 3 | 0 |
| maximum2s+h | 9 | 10 | 10 | 9 | 8 |

Thus x<=290 when t=0. For t>0, a17-row u has s_u=d_G(u)-18>=1,
but the universal s_u>=2 improves this to2. Every A-neighbor w of u
has r_w<=13, since17+r_w-22<=8. All those neighbors contribute at least
one unit to D.

If two17-rows u,z occur, their internal neighborhoods in A have union
of size at least10: the A-vertices missing both form K4/I3-free and
number at most8 among the18 vertices outside the independent pair.
Thus D>=10 for t>=2. For t=1, D>=2. Using the weaker D bounds0,2,10,10,10
at t=0,1,2,3,4 already suffices; the omission inequalities give

| t | maximum3t+2s+h | lower bound D | upper bound x |
| --- | --- | --- | --- |
| 0 | 10 | 0 | 290 |
| 1 | 11 | 2 | 289 |
| 2 | 12 | 10 | 282 |
| 3 | 12 | 10 | 282 |
| 4 | 12 | 10 | 282 |

This proves x<=290 uniformly, and x<=289 if t>0. The full corridor is

    max(160,360-2a,418-2b)<=x<=min(290,460-2a,528-2b),

with440-2a,506-2b replacing the last two caps in the complement-closed
residual. No endpoint realizability or named subbranch closure is asserted.
The upper proof uses no order20/22 edge census; the lower160 uses a<=100.

<a id="claim-d20-saturation-witnesses"></a>
## 4. Global saturation imposes actual triangle blockers

Claim ID: n43/d20/interface_bounds.md#claim-d20-saturation-witnesses  
Kind: local-deduction  
Review state: ready  
Scope: no-degree18 setting, with G globally K5-saturated  
Dependencies: [single-edge blocker characterization](../../foundations/safe_augmentation.md#claim-safe-augmentation-01)
Conclusion: every C_y contains a triangle; its missed set is I4-free;
locally safe A-nonedges require external triangle blockers  
Search use: none pending review; proposed witnessed propagation  
Reviews: none

For every y in B the missing edge vy has common neighborhood C_y.
Global saturation therefore requires an actual triangle in G[C_y].
Also every column meets every I4 of A, since an I4 missed by y would
extend to I5. Thus permissible columns must simultaneously contain a
triangle and be transversals of the I4 family. In particular a size-three
column is exactly a triangle; its coupled core restrictions are in
[the structure note](neighborhood_structure.md#claim-d20-three-column-core).

If uw is a nonedge in A, global saturation supplies a triangle T in its
common ambient neighborhood. If T contains v, its other vertices form
an edge in the common A-neighborhood, a witness that uw is locally
K4-unsafe. If no such internal edge exists, T cannot contain v or two
A-vertices, and must have location A+B+B or B+B+B. Hence the full
property split is

    A is K4-saturated;
    A has a locally safe nonedge, every such nonedge has an external blocker.

Both alternatives are retained. Global saturation alone does not justify
generating only K4-saturated A, and maximizing e(A) among actual degree20
roots does not remove the external-blocker alternative. Ordinary pair,
triple and forbidden-rectangle conditions still apply alongside these
witness requirements.

<a id="claim-d20-anchor-budgets"></a>
## 5. Independent and clique anchors give further uniform budgets

Claim ID: n43/d20/interface_bounds.md#claim-d20-anchor-budgets  
Kind: local-deduction  
Review state: ready  
Scope: no-degree18 setting, any indicated actual homogeneous anchor  
Dependencies: R(4,3)=9; K4/I5 type of A; K5/I4 type of B  
Conclusion: internal independent2/3/4 degree sums are at least10/14/24;
e(I4,B)>=32; every K4 Q in B has sum_Q t_y<=56 and sum_Q c_y>=20+sum_Q epsilon_y  
Search use: none pending review; proposed anchor propagation  
Reviews: none

For an independent pair I in A, at most8 of the18 outside vertices miss
both, so sum_I s_u>=10 (more precisely the union of their A-neighborhoods
has size at least10). For an independent triple I, the outside vertices
missing I form a clique of order at most3; thus sum_I s_u>=17-3=14.
For an independent four-set I, all16 outside vertices meet I. Each exact
singleton I-signature class is a clique of order at most2, because it
is joined to its named vertex and A has no K4. At most8 signatures are
singletons, giving sum_I s_u>=2*16-8=24. In the cross side, the analogous
singleton classes have size at most3, since the ambient prohibition is
K5. Thus e(I,B)>=2*22-12=32.

For a K4 Q in B, every one of the18 vertices in B-Q misses at least one
vertex of Q. Each exact singleton missing-signature class is independent,
or two adjacent members together with the other three Q vertices make
K5. This independent class has size at most2: an independent triple in
it together with its missed Q vertex would be I4 in B. At most8 vertices
outside Q have exactly three neighbors in Q; all others have at most2.
Consequently

    sum_Q t_y =12+e(Q,B-Q)<=12+2*18+8=56.

Summing c_y=19+epsilon_y-t_y gives sum_Q c_y>=20+sum_Q epsilon_y.
Four size-four columns would form a K4, all of degree19 by Claim2,
with sum_Q c_y=16, contradiction. Hence there are at most3 size-four
columns. This uses the same actual column family, with no root choice,
saturation or edge census assumption.

<a id="claim-d20-column-partition"></a>
## 6. An exhaustive small-column split and density-triggered column floors

Claim ID: n43/d20/interface_bounds.md#claim-d20-column-partition  
Kind: local-deduction  
Review state: ready  
Scope: no-degree18 setting; all columns, without saturation  
Dependencies: Claim2 and Claim5; (4,4) edge counts60,68 at orders16,17;
R(3,4)=9  
Conclusion: disjoint split below; a>=96 excludes size3 and a>=98 forces
all columns to have size at least5  
Search use: none pending review; proposed complete structural branching  
Reviews: none

Write ell_j for the number of columns of size j. Every column has size
at least3, ell_3<=1, ell_3=1 forces ell_4=0, and ell_4<=3. Therefore
these five predicates form a disjoint exhaustive split:

    ell_3=1 (then ell_4=0),
    ell_3=0, ell_4=1,
    ell_3=0, ell_4=2,
    ell_3=0, ell_4=3,
    ell_3=ell_4=0 (every column has size at least5).

A size-three column leaves a17-core and implies a<=95 by
[the core argument](neighborhood_structure.md#claim-d20-three-column-core).
A size-four column S leaves A-S K4/I4-free of order16 with60 edges.
Each vertex of S has at most8 neighbors there, and e(S)<=5 by K4-freeness.
Thus a<=60+4*8+5=97. Taking contrapositives proves the stated density
thresholds. No column's existence and no threshold's realizability is
asserted.

If G is globally saturated, the size-three pattern is exactly K3. For
size4, S contains a triangle and is K4-free, so its induced graph is
one of K3 plus an isolated vertex, a triangle with a pendant vertex
(the paw), or K4 with one edge missing (the diamond). These are all
possible induced patterns, before the core and ambient interface checks;
none is claimed extendible.
