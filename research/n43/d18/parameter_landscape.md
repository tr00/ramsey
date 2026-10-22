# The degree-18 parameter landscape

Date: 2026-10-18. Author and self-auditor: Main, alone; no subagents.
Task: `parameter-landscape-20261018`.

The five claims below are **ready, independently unreviewed**. Existing
published and reviewed premises retain their own status. New conclusions
must not change accepted pruning before independent review. No novelty claim,
solver run, candidate graph search, download or Lean change is made.

The main extensions are not tied to one x:

- Every 18-vertex K4/I5-free A with 84 or 85 edges contains an independent
  four-set whose internal degrees are all at least eight. The 84-edge
  statement has no E_A restriction, removing the former E_A<=29 restriction.
- At 85 edges such an anchor can avoid **any prescribed vertex**.
- Consequently, at q=0, positive excess supported on at most one A vertex
  forces every actual cross column to have size at least five, even when
  that vertex carries several excess units.
- Uniform certificates give degree and effective-degree anchor floors over
  all 3,600 integer cells of a basic outer (q,E_A) envelope.

The [machine-readable map](parameter_landscape.json) covers every cell;
[the report](../../reports/2026-10-18-parameter-landscape.json) retains exact
reproduction source, hashes, outputs and limits. This is a structural map,
**not** a classification of which parameter cells are realizable.

## Setting and premise ledger

The pure-graph claims concern every K4/I5-free A of order 18 with

    e(A)=85-q,   0<=q<=35,   d(u)=d_A(u).

The full pivot setting adds a K5/I5-free G on 43 vertices, a degree-18
pivot v, A=N(v), and B=M(v) of order 24. Write

    epsilon_u=d_G(u)-18 in {0,...,6},
    E=E_A=sum_A epsilon_u,
    w(u)=d(u)-epsilon_u=17-d_B(u),
    x=136+2q+E,   sum_A d=170-2q,   sum_A w=170-2q-E.

A may contain I4; B has no I4. We use d<=13, from R(3,5)=14, and
w>=0, from the reviewed bound d_B(u)<=17. R(4,4)=18 guarantees I4 in A.
The actual 24-column singleton argument gives, for every I4 I in A,

    sum_I w<=32,   eta_I=e(I,B)-36=32-sum_I w>=0.

See [the baseline](../../../docs/mathematical_baseline.md),
[frontier budgets and anchor defects](frontier_band.md), and
[reviewed row bounds and x<=279](independent_row_cuts.md).

For a K4/I4-free graph of order m, the following sufficient upper edge
bounds U(m) are used:

|m|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|U(m)|0|0|1|3|5|8|12|16|21|27|31|36|40|45|50|55|60|68|

For m<=9 these are Turan's K4-free bounds floor(m^2/3). At m=10,
U=31 is the elementary complementary-triangle bound in
[the core-cap proof](x136/five_column_compatibility.md#claim-five-columns-core-caps).
For m=11..17 the published maxima are recorded, with primary citations, in
[the root table](../../../README.md#state-of-the-art). Their provenance is not
recertified here. They are stronger than some sufficient bounds in the
older finite-moment note.

Put T3(j)=floor(j^2/3), the K4-free Turan bound, and let b4(j) be the sum
of binomial(part_size,2) over four balanced parts of total size j. For any
j-set S in A, e(A[S])>=b4(j), since A has no I5. Equality identifies the
union of four balanced cliques, by Turan equality in the complement.

Every s-set I4-transversal S leaves a K4/I4-free core A-S. Each S vertex
has at most eight neighbors in that core: its neighborhood there is
K3/I4-free, and R(3,4)=9. Thus each member has degree at least

    D(q,s)=max(0,85-q-U(18-s)-8(s-1)-T3(s-1)).        (1)

At s=4 replace this by max(D(q,4),9-q). The stronger term is the
[reviewed four-transversal degree-floor argument](four_column_stability.md#claim-four-column-stability-01).
That proof requires transversality, not actual-column status or E=0.

<a id="claim-landscape-template-cap"></a>
## 1. Complete multipartite cores have bounded attachment multiplicity

Claim ID: `research/n43/d18/parameter_landscape.md#claim-landscape-template-cap`
Kind: local-deduction
Review state: ready
Scope: any K4/I5-free A containing an induced balanced complete
three-partite H of order 3<=m<=9; any ell vertices outside H
Dependencies: K4/I5 obstructions; no census beyond identifying H
Conclusion: the outside-to-H cut has at most C_m(ell) edges, as below
Search use: none pending independent review
Reviews: none

Let c be the smallest part size, k the number of parts of size c, and
M=m-c. Then

    C_m(ell)=(M-1)ell+min(ell,k(4-c)).                (2)

Proof. A vertex outside H can meet at most two parts of H, or those
three neighbors with it form K4. Its H-degree is at most M. Equality
means its neighborhood is exactly the two whole parts complementary to
a smallest part. There are k types. Vertices of one type cannot be
adjacent: their common neighborhood contains an edge, completing K4.
They are therefore independent; together with the omitted independent
c-set they show that a type occurs at most 4-c times. At most
min(ell,k(4-c)) vertices have degree M, and the others have degree at
most M-1. This proves (2), allowing repeated neighborhoods.

In particular, for H=K333, C_9(ell)=5ell+min(ell,3).
For H=K332, C_8(ell)=5ell+min(ell,2).
These remove equality cases that edge counts alone leave undecided.

<a id="claim-landscape-uniform-certificate"></a>
## 2. A uniform low-effective-degree transversal certificate

Claim ID: `research/n43/d18/parameter_landscape.md#claim-landscape-uniform-certificate`
Kind: local-deduction
Review state: ready
Scope: the full pivot setting, arbitrary q,E; t an integer in 0..7;
L={u:w(u)<=t}, ell=|L|, m=18-ell
Dependencies: premise ledger; Claim 1; degree identity; Turan
Conclusion: if L is a transversal, all tests (3)--(7) below are necessary
Search use: none pending independent review
Reviews: none

For each proposed ell=1,...,18 put B_ell=min(E,6ell). Necessarily

    170-2q-E <= t*ell+13(18-ell),                    (3)
    85-q <= U(m)+8ell+T3(ell),                      (4)
    85-q-t*ell-B_ell+b4(ell) <= U(m).               (5)

With D=D(q,ell) from (1), also

    D<=t+6,   ell*max(0,D-t)<=B_ell.                (6)

If 3<=m<=9 and the left side of (5) equals U(m), necessarily

    t*ell+B_ell-2b4(ell) <= C_m(ell).               (7)

Proof. Equation (3) sums the upper weights t on L and 13 elsewhere.
Transversality makes A-L K4/I4-free. Its edge bound, the attachment cap
eight, and e(A[L])<=T3(ell) give (4). The deletion identity gives

    e(A-L)=85-q-sum_L d+e(A[L])
          >=85-q-t*ell-B_ell+b4(ell),

proving (5). Every L vertex has d>=D but w<=t, so it needs excess at
least max(0,D-t); the excess cap six gives (6).

In the equality case of (5), all deletion inequalities are equalities:
e(A-L)=U(m)=T3(m), e(A[L])=b4(ell), and sum_L d=t*ell+B_ell.
Turan equality makes the core the balanced complete three-partite graph.
The cut is exactly t*ell+B_ell-2b4(ell), so Claim 1 gives (7).

If no ell passes these necessary tests, L is not a transversal: some I4
has every weight at least t+1. This is an implication, not a converse.
Passing ell values are unresolved numerical witnesses, not graphs.

There is a **pure internal-degree version**: set E=0 in (3)--(7) and
replace w by d throughout. Here zero is the certificate budget, not an
assumption about actual E_A. Indeed sum_A d=170-2q and sum_L d<=t*ell,
so exactly the same proof works for every pure A in the setting.

<a id="claim-landscape-internal-anchors"></a>
## 3. An internal-degree anchor curve independent of E_A

Claim ID: `research/n43/d18/parameter_landscape.md#claim-landscape-internal-anchors`
Kind: local-deduction
Review state: ready
Scope: every pure A in the setting; hence every full pivot at that q,
without any E_A restriction
Dependencies: Claims 1--2 and the U(m) premise ledger
Conclusion: some I4 has all internal degrees at least h(q) below
Search use: none pending independent review
Reviews: none

|q|guaranteed h(q)|
|---|---|
|0..1|8|
|2..9|7|
|10..11|6|
|12|5|
|13|4|
|14|3|
|15|2|
|16|1|
|17..35|0 (no degree refinement)|

Proof. For each q substitute t=h(q)-1 into the pure version of
(3)--(7); every ell=1..18 fails at least one necessary condition.
The retained reproduction source evaluates these finite integer
inequalities exhaustively. At h=0, use R(4,4)=18 directly.

The newly enlarged q=1 strip can also be checked without the full table.
For L={d<=7}, degree summation bounds ell<=11. Sizes at most three are
excluded by the q<=2 transversal theorem; size four is excluded by the
member degree floor 9-q=8. At ell=5,...,11 the deletion lower bounds
for e(A-L), respectively, are

    50,44,38,32,27,22,17,

against upper bounds

    45,40,36,31,27,21,16.

Only ell=9 remains. It forces H=K333, e(A[L])=6 and sum_L d=63,
hence a cut of 51. Claim 1 bounds that cut by 48. Contradiction.
This proof uses no E_A or actual B interface. It strengthens the
[earlier fixed-q anchor strip](sos_finite_moments.md#claim-finite-q1-anchor),
which required E_A<=29 and did not eliminate this attachment case.

For any anchor with d>=h(q), the actual pivot interface gives the useful
exact defect identity

    sum_I(d-h(q))+eta_I = 32-4h(q)+E_I.              (8)

Thus for q<=1, both internal-degree excess above eight and signature
defect consume the actual anchor excess E_I. The entire q=1 envelope
E=0..108 (x=138..246) now has this anchor, not just E<=29.

<a id="claim-landscape-point-avoidance"></a>
## 4. Point-avoiding anchors and excess-support obstruction

Claim ID: `research/n43/d18/parameter_landscape.md#claim-landscape-point-avoidance`
Kind: local-deduction
Review state: ready
Scope: every pure A in the setting; every prescribed vertex p of A
Dependencies: Claims 1--3; U(m); Turan equality; the fixed K433 argument
Conclusion: an I4 avoiding p has all internal degrees at least g(q)
in the stated ranges; the full-interface excess-support corollary below
Search use: none pending independent review
Reviews: none

|q|guaranteed point-avoiding g(q)|
|---|---|
|0|8|
|1..5|7|
|6..7|6|
|8|5|
|9..35|no point-avoidance conclusion|

Proof. Fix a proposed positive h from this table and let L={d<=h-1},
t=h-1. Claim 3 ensures an I4 disjoint from L. If p is in L, that I4
already avoids p. Otherwise suppose L union {p} is a transversal.
Every high-degree I4 then contains p and has its other three vertices
in K=A-(L union {p}); in particular d_K(p)<=14-ell. Also

    ell<=min(14,floor((64+2q)/(13-t))).

The first bound uses the four vertices outside L; the second sums
degrees over L and its complement. The two deletion identities give

    e(K)>=85-q-t*ell-13+b4(ell+1),                  (9)
    e(K)>=71-q-(t-1)ell+b4(ell).                    (10)

For (9), delete L union {p} and use d(p)<=13. For (10), use the exact
identity e(K)=85-q-sum_L d+e(A[L])-d_K(p).
Both bounds must be at most U(17-ell). Also the generic attachment bound

    85-q<=U(17-ell)+8(ell+1)+T3(ell+1)              (11)

must hold. If ell>0, every L member of the transversal L union {p}
requires D(q,ell+1)<=t. Substitution excludes every cardinality for the
stated g(q), except q=0,h=8,ell=8. The source records all these tests.

Here is the full exceptional equality argument. In that case (10) gives

    e(K)>=85-7*8-6+b4(8)=27=U(9).

Equality forces every L vertex to have A-degree seven, e(A[L])=4,
and d_K(p)=6. Thus A[L] is four disjoint edges, K=K333, and p is joined
to two whole K parts: its neighborhood is triangle-free and has size six.
Consequently A[K union {p}]=K433, with the four-part containing p.
Every L vertex has exactly six neighbors in this K433, since its
internal L degree is one. It must meet the four-part, or that independent
four-set and the vertex form I5. It cannot meet all three parts, or it
forms K4. Its six neighbors therefore occupy the four-part and exactly
one of the two three-parts, at least three in the former and at least two
in the latter.

There are two types according to the chosen three-part. Two vertices of
the same type have a common neighbor in both occupied parts, hence a
common edge; they cannot be adjacent. But both omit the other independent
three-part, so they cannot be nonadjacent either. At most one vertex of
each type exists. This is incompatible with eight L vertices, excluding
the last equality case. Hence L union {p} is not a transversal and the
required point-avoiding anchor exists.

**Excess-support corollary.** In the full pivot setting at q=0, suppose
positive epsilon is supported on at most one A vertex p. Choose the
point-avoiding degree-at-least-eight anchor. It has E_I=0, so (8) forces
all four degrees to equal eight and eta_I=0. Every member of a four-set
transversal would have degree at least nine, so it would miss this I4.
No four-set transversal exists. The existing lower bound four then gives

    tau(I4(A))>=5,   |C_y|>=5 for every y in B.       (12)

With no positive excess, choose any p. With one, its excess may be any
integer 1..6. Thus a four-transversal at q=0 requires **at least two
positive-excess A vertices**, not merely a positive total E_A. This
extends the x137 conclusion to all concentrated-excess profiles through
x142; it does not exclude the profiles themselves.

More generally, choose p of largest excess wherever the point-avoiding
curve applies. Equation (8), with h=g(q), has E_I<=E-max_A epsilon.
This controls both anchor defects by the excess left after removing its
largest contributor. No simultaneous choice of unrelated anchors is assumed.

<a id="claim-landscape-column-bands"></a>
## 5. Column lower bounds across the q axis

Claim ID: `research/n43/d18/parameter_landscape.md#claim-landscape-column-bands`
Kind: local-deduction
Review state: ready
Scope: every pure A for the transversal bounds; every full pivot for columns
Dependencies: U(15..17); attachment cap eight; R(4,4)=18
Conclusion: the following uniform transversal and actual-column lower bounds
Search use: none pending independent review
Reviews: none

|q|every I4-transversal has size at least|
|---|---|
|0..2|4|
|3..7|3|
|8|2|
|9..35|1|

Proof. A one-set transversal forces e(A)<=U(17)+8=76, hence q>=9.
A two-set transversal forces e(A)<=U(16)+16+1=77, hence q>=8.
A three-set transversal forces e(A)<=U(15)+24+3=82, hence q>=3.
Smaller transversals can be enlarged, so these statements exclude all
sizes below the displayed lower bounds. The empty transversal is
excluded by R(4,4)=18. Every actual column is a transversal.

Retain the stronger existing actual-column conclusion at q=3,E<=13:
columns have size at least four, by the
[reviewed three-column excess theorem](x142/q3/three_columns.md#claim-q3-three-column-excess-fourteen).
Claim 4 adds the size-five conclusion when q=0 and positive support has
size at most one. As a scalar consequence, all q=0,E<=1 cells have
column floor five; for E=2..6 it is conditional on the support pattern.
Neither type of structural lower bound asserts a whole cell is impossible.

## Complete parameter map and how to read it

The basic outer envelope used here is

    0<=q<=35,   0<=E<=min(108,143-2q),   q,E integers.

These come from 50<=e(A)<=85, epsilon<=6, and the reviewed x<=279.
They contain exactly 3,600 integer cells. No assertion of realizability
is made for any of them. The user-reported x136 closure is retained as
external pending-integration information, not reconstructed or used here.

For each q the JSON records the exact E endpoint, internal anchor floor,
point-avoiding floor (null means no conclusion), effective-anchor ranges,
and column-floor ranges. A range h means that **some independent four-set
has all four effective degrees at least h**. Its defect obeys

    sum_I(w-h)+eta_I=32-4h.

In particular effective h=8 forces the exact singleton-triangle/double
signature pattern, independently of how the excess is distributed.
Different floors need not be witnessed by the same anchor.

Selected effective-floor transitions illustrate the full map. Entries
`E:h` mean that h applies starting at E, until the next listed transition
or the end of that q row. They are sufficient bounds from Claim 2, not
optimality claims.

|q|E:h transitions|
|---|---|
|0|0:8; 2:7; 10:6; 16:5; 20:4; 24:3; 35:2|
|1|0:8; 1:7; 9:6; 14:5; 18:4; 22:3; 30:2; 102:1|
|2|0:7; 8:6; 13:5; 17:4; 21:3; 29:2; 48:1|
|3|0:7; 7:6; 12:5; 16:4; 20:3; 24:2; 42:1|
|4|0:7; 6:6; 11:5; 15:4; 18:3; 23:2; 41:1|
|5|0:7; 5:6; 10:5; 13:4; 16:3; 22:2; 36:1|
|6|0:7; 4:6; 9:5; 12:4; 15:3; 18:2; 30:1|
|7|0:7; 3:6; 8:5; 11:4; 14:3; 17:2; 24:1|
|8|0:7; 2:6; 7:5; 10:4; 12:3; 16:2; 23:1|
|9|0:7; 1:6; 3:5; 4:4; 5:3; 6:2; 18:1|
|10|0:6; 2:5; 3:4; 4:3; 5:2; 6:1; 42:0|
|11|0:6; 1:5; 2:4; 3:3; 4:2; 5:1; 6:0|
|12|0:5; 1:4; 2:3; 3:2; 4:1; 5:0|
|13|0:4; 1:3; 2:2; 3:1; 4:0|
|14|0:3; 1:2; 2:1; 3:0|
|15|0:2; 1:1; 2:0|
|16|0:1; 1:0|
|17..35|0:0 (no effective-degree refinement)|

The concentrated-excess conclusion at q=0 is additional information not
encoded by total E alone; it is explicitly retained as a support-conditional
corollary in the JSON. A zero floor is only the existing w>=0 bound, not
an indication that this part of the mathematical problem has been settled.

## Self-checks and unresolved obligations

The reproduction evaluates all 3,600 cells, all low-set cardinalities needed
for their reported positive effective floors, and the finite internal and
point-avoidance tables. A second arithmetic implementation rechecks every
reported effective floor. Fixed-template checks examine 1,016 subsets of
the balanced complete three-partite cores of orders 3..9 and all 14 possible
six-neighbor K433 templates, including all 42 distinct same-type pairs.
These checks are not candidate searches, independent mathematical review,
formal proofs, or evidence of Ramsey nonexistence.

All new claims remain ready. In particular, independent review must check
both ambient graph types, the arbitrary-transversal quantifier in (1), the
budget-zero interpretation for pure A, both equality arguments, and the
finite-certificate interpretation of the map. No complete x branch,
degree-18 branch, or order-43 decision is claimed.
