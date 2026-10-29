# Increasing neighborhood density while decreasing antineighborhood density

- **Scope:** a finite simple `G in R(5,5,43)`, an actual pivot `v`, and
  `A=N_G(v)`, `B=M_G(v)`. Rerooting retains the pivot degree; exchanges
  retain the vertex partition and the whole cross interface. Thus both side
  orders stay fixed and strict edge-count improvement is strict density
  improvement. Definitions follow [notation](../../docs/notation.md).
- **Kind:** exact local deductions, counting triggers, and a certificate tool.
  The existence normalization is conditional on a nonempty completion family.
- **Authors:** `/root`, `/root/reroot_tradeoff`, `/root/edge_exchange`, and
  `/root/forcing_coverage`. Independent review is scoped below.
- **Review state:** accepted for Sections 1--7 on their stated premises after
  independent review recorded below. The prototype received independent code
  review and bounded semantic validation. No branch closure, novelty claim,
  or Lean certificate. Section 6's conditional density floors and repair
  limitations have scoped independent acceptance; the universal d18c floor
  remains 50. Section 7 has scoped independent acceptance.
- **Dependencies:** elementary graph counting and the `K5/I5` prohibitions.
  Degree-18 numerical statements additionally use `18<=d_G(z)<=24`,
  `50<=a<=85`, and `144<=b<=160`, recorded in
  [pivot classes](d18/pivot_classes.md) and the
  [census dependency ledger](reductions.md#15-published-census-dependencies).
  The degree-five refinement uses the published `(4,4,12)` edge floor 26.
  The selected-root floors use the published `(4,4)` edge floor 50 at
  order 15, exact count 60 at order 16, and floor 68 at order 17, together
  with `R(4,4)=18`, `R(4,3)=9`, and `R(5,4)=25`.
  The bounded repair core uses the classical `R(3,4)=9` and `R(5,3)=14`
  from the [baseline](../../docs/mathematical_baseline.md).
  Section 7 additionally uses the published `(4,4)` floors 41 and 33 at
  orders 14 and 13, Turan equality, `R(3,3)=6`, and the isolated
  literature maximum `E(4,5,22)=114` specified in Section 7.4.
- **Permitted use:** scoped mathematical propagation, same-degree rerooting,
  and existence normalization within the explicitly fixed completion family.
  The tool diagnoses a supplied graph and provides exact exchange and repair
  certificates; no engine filter or catalogue restriction was installed.
  No solver, catalogue processing, installation,
  download, or order-43 graph search was performed.

There are two distinct avenues. Rerooting needs enough degree excess to enter
the new neighborhood: a density gain alone does not reduce `b`. Fixed-root
exchanges need compatible clique and independent-set repairs. We give
same-family counting triggers for the first and exact repair supports for
the second. Low internal degrees force actual candidate holes, and finite
extremal selection forces explicit blocker obligations at a terminal graph.
No argument here forces a successful transfer in every order-43 candidate.
The sparse-case continuation forces at least six higher-degree A vertices
and at most 18 actual degree-18 roots when a=50, with a stronger excess
budget if those roots contain an independent triple. The conditional floors
are 63, 58, 55, and 51 for at most two, three, four, and five higher-degree
A vertices, respectively.

<a id="claim-joint-reroot"></a>
## 1. Exact two-sided rerooting and a same-family forcing threshold

Let `u,v` have the same degree `d` in the same graph, and define

```text
a_w=e(G[N_G(w)]), b_w=e(G[M_G(w)]), x_w=e_G(N_G(w),M_G(w)),
S_w=sum_(z in N_G(w)) d_G(z),
Delta=a_u-a_v, T=S_u-S_v.
```

The exact accounting identities are

```text
b_w=e(G)-S_w+a_w,
b_u-b_v=Delta-T,   x_u-x_v=T-2Delta.                 (1)
```

Indeed `S_w=d+2a_w+x_w` and `e(G)=d+a_w+b_w+x_w`.
Consequently a strict two-sided move exists to this same `u` exactly when

```text
0 < Delta < T.                                      (2)
```

With `X=N(v)-({u} union N(u))` and
`Y=N(u)-({v} union N(v))`, the sets have the same size. If
`epsilon_z=d_G(z)-18`, then

```text
T=sum_Y epsilon_z-sum_X epsilon_z.
```

Common-neighbor excess and equal-degree root contributions cancel. Every
strict two-sided move has integral `T>=2`. It can either increase or decrease
the cross count: the sign is that of `T-2Delta`. In a regular graph `T=0`
for every pair, so every rerooting increase in `a` also increases `b`.
This is an exact obstruction, not a failure of the estimates below.

### Degree-18 threshold

Write `P={w:d_G(w)=18}`, `E_w=sum_(z in N(w)) epsilon_z`,
`W=sum_z epsilon_z`, `B0=W/2+4`, and `q_w=85-a_w`. Then

```text
b_w=148+W/2-q_w-E_w=a_w+63+W/2-E_w,
q_w+E_w<=B0.
```

For an actual source `v in P`, define

```text
h_v=E_v+max(q_v,b_v-144)
   =max(E_v+q_v,B0-q_v).                            (3)
```

Every actual `u in P` with `E_u>h_v` satisfies both `a_u>a_v` and `b_u<b_v`.
To prove the first, if `a_u<=a_v` then `b_u>=144` gives
`E_u<=E_v+b_v-144`. To prove the second, if `b_u>=b_v` then
`a_u<=85` gives `E_u<=E_v+q_v`. Both contradict (3).
The strict inequality matters at the integer boundary.

Let `F` be any nonempty family of actual degree-18 destinations, `t=|F|`,
and let `J_lo` be a proved lower bound on

```text
J_F=sum_(u in F) E_u
   =sum_z epsilon_z |N_G(z) intersect F|.
```

The trigger

```text
J_lo > t*h_v                                        (4)
```

forces a strict two-sided move to one vertex of this same `F`. This combines
the two requirements at a common witness. Separate existence proofs for
an A-improving root and a B-improving root would not suffice.

If `v in F`, its contribution is fixed and it cannot be a strict destination.
The sharper trigger is `J_lo>E_v+(t-1)*h_v`. In (5) one may then replace
`t*h_v` by `E_v+(t-1)*h_v`; the denominator stays `U-h_v`.

Put `U=min(W,B0,108)`, an upper bound on every `E_u` in `P`.
If `U>h_v`, at least

```text
max(0,ceil((J_lo-t*h_v)/(U-h_v)))                     (5)
```

members of `F` are strict two-sided destinations. Every root failing the
threshold contributes at most `h_v` to `J_F`, and every other root at most
`U`, proving (5). If `v in F`, it cannot be one of these destinations.
If `U<=h_v`, this threshold cannot trigger. In particular there is no
strict two-sided move from `a_v=85` or `b_v=144`.

### Forcing from data available at the original root

If `z=|A-P|<18` and `F=A intersect P`, direct incidence counting gives

```text
J_F >= sum_(y in A-P) epsilon_y max(0,d_A(y)-z+1)
     + sum_(y in B) epsilon_y max(0,c_y-z).          (6)
```

A vertex of `A-P` has at most `z-1` neighbors in `A-P`; a B vertex
has at most `z` there. The root carries zero excess. Thus (6) together
with (4) triggers the move using only the original degree and cross data.
This derives the needed incidence estimate directly; it does not assume
acceptance of the older A-only [transport result](d18/density_rerooting.md#claim-reroot-family-transport).

Alternatively let `h=43-|P|` be the number of higher-degree vertices, and
let `n_j` count global degree `j`. For `F=P`, each degree `18+i` vertex has
at most `h-1` neighbors outside `P`, so

```text
J_P >= sum_(i=1..6) i*n_(18+i)*max(0,19+i-h).        (7)
```

Equations (4) and (7) give a histogram-based trigger without first locating
a particular companion or an overlap cell.

For example, suppose a candidate has `n_18=40`, `n_22=3`, all other
degree counts zero, and an actual source with `a_v=80`, `E_v=0`.
Then `W=12`, `b_v=149`, `q_v=5`, `h_v=5`, while (7) gives
`J_P>=3*4*20=240>40*5`. Some root has `E_u>=6`. Its excess is a multiple
of four, and `E_u<=B0=10`, so `E_u=8`. Its budgets force

```text
a_u>=83, b_u<=146.
```

This is a forced gain of at least three edges on both sides under the stated
histogram and source assumptions. It makes no claim that such a graph exists
or that this histogram is unavoidable.

For any actual independent `t`-set `I subset P`, let `W_j` sum the excess
outside `I` on vertices having exactly `j` neighbors in `I`, and put
`D_I=sum_j(t-2j)W_j=tW-2J_I`. Equation (4) becomes

```text
D_I < 2t*min(q_v-4,b_v-148).                         (8)
```

For `t=4`, the empty signature is absent by `I5`-freeness. With
`Delta_I=W_1-W_3-2W_4`, (8) is

```text
Delta_I < 4*min(q_v-4,b_v-148).                      (9)
```

An actual independent four-set of degree-18 vertices with `W_1=0`
therefore forces a joint move from any source with `a_v<=80`, `b_v>=149`.
The existence and signature properties of that anchor remain hypotheses.

### An existing disconnected pattern forces improvement on both sides

Suppose `G[A]=K2` disjoint-union a `(4,4)`-free core of order 16.
The accepted [K2 rerooting proof](d18/density_rerooting.md#claim-reroot-k2)
gives `a_v=61`, and both small vertices `u,w` have degree 18 and
`a_u=a_w=69`. Each has a size-16 B row, the rows intersect in eight
vertices, and their union is B.

For the pair `v,u`, the root-excluded cells are `S={w}`, exclusive
cells `X,Y` of order 16 and 60 edges each, and a common antineighbor
cell `Z` of order eight. The vertex `w` sees every vertex of Z.
Counting the degree sum on Z gives

```text
b_v+b_u=120+2e(G[Z])+e_G(Z,X union Y),
sum_Z d_G(z)=144+E_Z=2e(G[Z])+e_G(Z,X union Y)+8,
b_v+b_u=256+E_Z<=304.                               (10a)
```

Thus `b_v>=153` forces `b_u<=151` while `a_u=69>61`. Exchanging `u,w`
gives the same conclusion for the other small vertex. Under `b_v>=153`, this pattern forces
both destinations to improve both sides, without an extra favorable
overlap hypothesis. Sources with smaller `b_v` are not excluded by this test.

<a id="claim-exact-exchange"></a>
## 2. Exact one-edge exchange and the impossibility of mutual rescue

Fix the root and the cross matrix. Let `p={u,w}` be a missing A edge and
`f={y,z}` an existing B edge. Define the actual witness families

```text
T_p=mathcal K_3(G[N(u) intersect N(w)]),
I_f=mathcal I_3(G[M(y) intersect M(z)]).
```

Then

```text
G+p-f in R(5,5,43)
 iff every Q in T_p contains f
 and every J in I_f contains p.                     (10)
```

Every newly created `K5` must use `p`, so its other three vertices are an
original triangle in `T_p`; it survives exactly when `f` is not in that
triangle. A surviving new clique cannot rely on a deleted edge. Conversely
every new `I5` must use the deleted `f`, with its other three vertices an
original independent triple in `I_f`; it survives exactly when `p` is not
in that triple. These exhaust the new forbidden sets.

For each `p`, intersect the sets of B edges contained in its triangles,
giving a repair support `D_p`. For each `f`, intersect the sets of missing
A edges contained in its independent triples, giving `P_f`. An empty witness
family has unrestricted support; a nonempty family with empty intersection
has no one-edge repair. For a nonempty family the support has size at most
three. Equation (10) is exactly the reciprocal support test

```text
f in D_p and p in P_f.                              (11)
```

The crucial further restriction is that `T_p` and `I_f` cannot both be
nonempty in a valid exchange. A triangle containing `f` in the common
neighborhood of `u,w` forces all four cross edges between `{u,w}` and
`{y,z}` to be present. An independent triple containing `p` in the common
antineighborhood of `y,z` forces all four to be absent. Thus at least one
operation must already be globally safe on its own.

This also supplies a safe order. If `T_p` is empty, add `p` first; (10)
then makes deleting `f` safe. If `I_f` is empty, delete `f` first and then
add `p`. If both are empty, either order works. A graph having neither
a globally safe A addition nor a globally safe B deletion admits no
one-edge transfer, regardless of how many internally safe candidates it has.

Every valid exchange has the exact changes

```text
Delta a=1, Delta b=-1, Delta x=0, Delta e(G)=0.
```

At degree 18, `Delta q=-1`, `Delta E_A=2`, and `Delta W=0`.
Other vertices' degrees and saturation can change. Therefore exchanges
preserve the degree-18 parent but do not preserve an arbitrary excess child,
a maximum-root selection property, or a no-degree-18 residual hypothesis.

<a id="claim-intrinsic-hole-forcing"></a>
## 3. Low internal degree forces holes and places every clique repair in B

Call an A hole `p` intrinsically safe if `G[A]+p` has no `K4`. Its common
A neighborhood is independent, by the single-edge `K4` obstruction.
Therefore every triangle in `T_p` has at most one A vertex. The root
cannot occur in such a triangle: it sees only A vertices. Every triangle
blocker consequently contains at least two B vertices and a B edge.

Thus every clique obstruction for an intrinsically safe addition is
accessible to B-edge deletion. For `C=N_B(u) intersect N_B(w)`, deleting
all edges of `G[C]` and adding `p` is always `K5`-free. It can create `I5`;
the independent-set repair obligations must still be checked.
An intrinsically unsafe hole has a `K4` witness wholly inside A, which
extends with the unchanged root to `K5` and survives every B deletion.
Dually, a B edge whose deletion creates `I4` inside B can never be repaired
by A additions, since that `I4` extends with the root to `I5`.

For the following forcing count and numerical consequences assume `d_G(v)=18`,
so `|A|=18`. For any `u in A`, put

```text
S=N_A(u), s=|S|, H=A-({u} union S), N=17-s,
f=e(G[S]), c=e_G(S,H),
h_u=number of intrinsically safe holes incident with u.
```

An intrinsically unsafe hole `uw` has an edge inside `N_S(w)` and hence
at least two S incidences. For any S edge, its common H neighbors are
independent by `K4`-freeness, and adjoining `u` makes an independent set;
there can be at most three. Counting these witnesses gives

```text
h_u >= max(0,N-3f,N-floor(c/2)).                     (12)
```

Since S is triangle-free, Mantel gives `f<=floor(s^2/4)`. Consequently

| Internal degree s | 0 | 1 | 2 | 3 | 4 |
| --- | --- | --- | --- | --- | --- |
| Guaranteed intrinsically safe incident holes | 17 | 16 | 12 | 8 | 1 |

This forces actual candidate holes whenever an A vertex has internal degree
at most four. It does not merely assume a convenient pair occurs. If `s=5`
and `h_u=0`, then `N=12`, `f>=4`, `c>=24`. The graph on H is `(4,4)`-free
and has at least 26 edges, so `a>=5+4+24+26=59`. Therefore `a<=58`
and a degree-five A vertex also force a safe hole. In particular `a<=53`
forces one by the average degree bound `2a/18<6`.

A concrete exchange trigger is now: a hole forced by (12), together with
a B edge in its common repair support that passes the reciprocal test (11).
If the hole is globally blocked, that B edge must be globally deletable.
If the hole is globally safe, any B edge whose independent witnesses all
contain the hole works. Failure produces explicit incompatible witness
supports, rather than an unexamined claim that the addition is impossible.

This route does not depend on the independently accepted
[58-edge saturated-neighborhood floor](d18/saturated_neighborhood_density_floor.md).
That stronger floor supplies the quantitative candidate-hole coverage in
Section 6, but does not remove the independent-set barriers.

<a id="claim-transfer-normalization"></a>
## 4. Forcing by extremal completion and exact batch obligations

Fix labels `v,A,B`, every root edge and cross edge, and an integer
`m=a+b`. Let `C` consist of all Ramsey completions of this boundary with
exactly `m` internal edges. If `C` is nonempty, choose a member maximizing
`a`. In this member `b=m-a` is minimized. It has no valid transfer that
adds `k>=1` A edges and deletes `k` B edges.

This gives an existence-preserving extremal normalization of the specified
fiber: every input member supplies a nonempty finite fiber and hence such
a representative. It retains `v`, its degree, both side orders, the full
cross matrix, and the total edge count. It does not retain arbitrary
additional predicates unless the fiber explicitly enforces them. To use it
within a child branch, include that branch's predicates and only forbid
transfers remaining inside it. The choice can be followed by root selection;
previous root maximality does not survive automatically.

For single exchanges, extremality forces every pair to fail (11). Thus the
two support families must have no reciprocal pair. This is a finite,
checkable blocker-cover obligation, with the low-degree hole supplies of
Section 3 present whenever their degree hypotheses hold. An absence of
globally safe A additions and globally safe B deletions is one possible
terminal barrier, not evidence of nonexistence.

In particular extremality forces a disjunction: every A hole is globally
`K5`-blocked, or every B edge is globally `I5`-critical for deletion.
Otherwise an individually safe operation of each kind gives a valid exchange.
If a safe A addition exists, every B edge must have an independent triple
witness avoiding that addition. If a safe B deletion exists, every A hole
must have a triangle witness avoiding that deletion. These are explicit
obligations forced by the choice of completion, not extra assumptions.

Any sequence of valid single exchanges terminates, since each increases
the integer `a` and decreases `b`. At degree 18 its length is at most

```text
min(85-a_initial,b_initial-144).                     (13)
```

A state terminal for single exchanges need not maximize `a` over the whole
fiber. Larger transfers can still improve it. Finite maximization proves
the normalization; a local greedy procedure alone does not establish it.

### Exact obligations for simultaneous batches

Let `L` be an arbitrary set of missing A edges to add and `D` an arbitrary
set of present B edges to delete. For every five-set `Q`, let
`M_Q=binom(Q,2)-E(G)` and `E_Q=binom(Q,2) intersect E(G)`. The exact
conditions for `G+L-D` to remain Ramsey-free are

```text
M_Q subset L  implies E_Q intersect D != empty,
E_Q subset D  implies M_Q intersect L != empty        (every Q).   (14)
```

The first implication forbids a clique after all its missing pairs are
added; the second forbids an independent set after all its original edges
are removed. Pairs outside A additions or B deletions remain fixed, so they
can make an implication's antecedent impossible. Considering all five-sets
is essential: old one-edge witness families alone omit forbidden sets that
need several edits to become homogeneous.

For example, Boolean variables for the selected additions and deletions
turn the first implication into a clause saying that some required addition
is not selected or some original B edge is deleted. The second is its dual.
Together with `|L|=|D|>=1` these describe every strict fixed-total transfer.
This is an exact finite design, not a generated solver instance or a claim
that a transfer exists. The support test is the much smaller exact `1/1`
specialization.

For fixed additions L, the first implication supplies positive deletion
clauses; the second supplies conflicts forbidding simultaneous deletions.
A singleton positive clause forces its deletion; a singleton negative
clause forbids it. All but one forbidden choice in a positive clause forces
the last choice; all but one selected deletion in a negative clause forbids
the last choice. An empty positive clause refutes L. A fully selected negative
clause refutes the current deletion choices; if all those choices were forced
by sound propagation, it refutes L. Exact balance requires `|D|=|L|`; a smaller deletion transversal
cannot be padded without verifying independence and degree constraints.

<a id="claim-bounded-repair"></a>
## 5. One-hole repair with at most 28 variables and actual propagation

Fix one intrinsically safe hole `p={u,w}` in A, at any pivot degree. Put

```text
C=N_A(u) intersect N_A(w), H=R_u intersect R_w,
H_t=H intersect R_t  (t in C).
```

Two immutable cross guards can refute every repair by A additions and B
deletions containing p. In any resulting Ramsey graph where p is filled,
the graph on H must have neither a triangle (it extends `u,w` to `K5`)
nor an independent four-set (it extends the root to `I5`). Thus `|H|<=8`
by `R(3,4)=9`. Also `u,w,t` becomes a triangle for each `t in C`, so
H_t must become independent; B's `I4` prohibition requires `|H_t|<=3`.
Violation of either cardinality guard is permanent with the cross matrix fixed.

If the guards pass, introduce retained-edge bits `k_f` for the existing
edges `f in E(G[H])`. There are at most `binom(8,2)=28` bits. Impose:

1. For every original triangle in H, at least one of its edges is deleted.
2. Every edge inside any H_t is deleted.
3. For every five-set Q not containing both `u,w`, whose original nonempty
   edge set is wholly contained in `E(G[H])`, at least one original edge
   of Q is retained.
4. At least one H edge is deleted, to make B strictly sparser.

These are exactly the Ramsey conditions for adding p and deleting a
nonempty subset of `E(G[H])`. Since C is independent, a triangle in the
common neighborhood of `u,w` is either entirely in H or has one C vertex
and two H vertices, covered by rules 1 and 2. The root cannot occur.
Every new independent five-set must have all its original edges deleted.
If it contains p, the addition destroys it; otherwise it is exactly a
rule-3 obligation. All remaining old edges are immutable and prevent it.

At order 43 one can also propagate the necessary deletion capacities

```text
sum_(f incident with y)(1-k_f)<=epsilon_y  (y in H). (15)
```

Every deletion lowers that B vertex's global degree, which must remain at
least 18. Thus a zero-excess B vertex forbids all its incident deletions;
every deleted edge needs two positive-excess endpoints. If forced deletions
exceed a vertex's capacity, repair is impossible. Filling p also requires
`d_G(u),d_G(w)<=23` because of the degree cap 24. These capacities are
consequences of complete Ramsey conditions and the published degree window,
but provide useful early propagation.

The prototype implements the four rules and unit propagation. A forced
deletion can force retention in an independent-set clause, and a forced
retention can force deletion in a triangle clause. It returns a conflict,
a concrete fully checked repair, or the unresolved exact clauses. In the
last case it has established neither feasibility nor nonexistence. This
provides explicit triggers and an exact bounded next problem.

### Why the deletion restriction covers every rescue of a blocked hole

Suppose adding p is globally unsafe and some arbitrary B deletion set D
makes `G+p-D` Ramsey-free. Put `D0=D intersect E(G[H])`. Every triangle
blocker has all its B edges in H, so D0 alone destroys every new clique.
The graph `G+p-D0` is a supergraph of the feasible `G+p-D`, so has no `I5`.
It is therefore feasible, and D0 is nonempty because p was blocked.
Thus the bounded system loses no repair of an initially blocked p, even
if the original repair used deletions elsewhere in B.

For a globally safe p, this argument can give empty D0. A blocked result
for the nonempty core-restricted system then does not rule out strict
B reductions using deletions elsewhere. The tool's result always describes
the stated core-restricted family. The immutable cardinality guards are
stronger: they refute any repair containing p with the cross matrix fixed.

One can even order any feasible one-addition repair safely. Delete D0
first. An `I5` created by those deletions would contain a deleted H edge,
whose endpoints see both `u,w`, and hence could not contain either addition
endpoint. Adding p could not repair it, contradicting feasibility of
`G+p-D0`. Thus `G-D0` is already Ramsey-free; delete its edges one by one,
add p, then delete the remaining D edges one by one. Monotonicity between
the feasible endpoints proves every intermediate graph valid. There is
a dual statement for one B deletion and arbitrary A additions. Any failure
of safe sequential execution therefore requires at least two edits on
each side; their existence at order 43 is not asserted.

### Forcing a small core from actual degree-18 endpoints

If `u,w` are degree 18 and nonadjacent, let `s=|N(u) intersect N(w)|`.
Their common antineighborhood has order `5+s`; it is `(5,3)`-free because
an independent triple there would extend `u,w` to `I5`. Hence `5+s<=13`
by `R(5,3)=14`. The pivot itself belongs to that common neighborhood and
lies outside H, so `|H|<=s-1<=7`. In this subcase the repair system has
at most 21 edge variables; the general bound remains 28.

For a degree-18 pivot, let T be the graph of intrinsically safe holes and
`z=|A-P|<=E_A`. If the vertex-cover number of T exceeds z, some safe
hole has two degree-18 endpoints: otherwise A-P would cover all its edges.
A witnessed matching of more than z safe holes suffices. This ties hole
coverage to low excess and forces the bounded-core prerequisite. It still
does not force the triple guards or the repair clauses to be satisfiable.

## 6. Can repair maximality raise the neighborhood edge floor?

**Scope and current conclusion.** The d18 parent selects a vertex maximizing
`a_v` among the actual degree-18 vertices of its graph; d18c additionally
requires its neighborhood to be connected. These are distinct requirements
from maximizing A edges across different completions. The investigation
proves conditional floors of 63 and 58 edges for selected connected roots
with at most two and three higher-degree neighbors, respectively. It does
not raise the universal d18c floor 50.
The repair mechanism supplies forced candidate holes and explicit successful
repairs, but their availability remains an open coverage obligation.

<a id="claim-density-eligible-anchor"></a>
### 6.1 An eligible independent four forces a 63-edge selected root

Let `P={z:d_G(z)=18}`, and suppose an independent four-set `I` is contained
in P. Partition vertices outside I by their exact I signatures, and let
`W_j` be their total degree excess at signature size j. There is no empty
signature: such a vertex together with I would be an independent five.
Each exact singleton-signature class is a clique of order at most three.
A nonedge there together with the other three members of I would give I5;
a four-clique there together with its unique I neighbor would give K5.
Consequently `W_1<=12*6=72`.

For an arbitrary degree-18 root u, the source accounting gives
`q_u+E_u<=W/2+4`. Also

```text
sum_(u in I) E_u = W_1+2W_2+3W_3+4W_4
                = 2W-W_1+W_3+2W_4.
```

Summing the four root budgets gives

```text
sum_(u in I) q_u <=16+W_1-W_3-2W_4<=88.
```

Some u in this actual eligible family has `q_u<=22`, hence `a_u>=63`.
The selected maximum-density root therefore has at least 63 edges. This is
an A-only rerooting conclusion; it does not assert a simultaneous B gain.
The sharper threshold is `a_u>=81-floor((W_1-W_3-2W_4)/4)`.
As a separate occurrence trigger, `|P|>=25` supplies I by `R(5,4)=25`.
Without that count or an actual anchor, I must not be assumed.

<a id="claim-density-floor-two-higher-neighbors"></a>
### 6.2 At most two higher-degree neighbors force 63 edges in d18c

**Theorem.** Let v be the selected maximum-density degree-18 root, and let
A be connected. If `z=|A-P|<=2`, then `a>=63`. The excess magnitudes are
unrestricted. In particular `E_A<=2` suffices. Conversely, a selected d18c
root with `a<=62` has at least three higher-degree neighbors and `E_A>=3`.

**Proof.** Assume `a<=62`. If `A intersect P` contains I4, Section 6.1
already contradicts the selected-root condition. Otherwise it is `(4,4)`-free.
It cannot have order 18 by `R(4,4)=18`, or order 17 because its published
edge floor is 68. Thus z=2 and the core `C=A intersect P` has order 16 and
exactly 60 edges. Write the two outside vertices as r,s. A's connectedness
requires at least two edges outside C, so `a<=62` forces exactly two.

The pair r,s must be adjacent. If not, their C-neighbor union has order at
most two. Its complement in C has at least 14 vertices and contains I3 by
`R(4,3)=9`, since C is K4-free. That I3 together with r,s would give I5.
Therefore one of the two extra edges is rs and the other joins this pair
to C. The internal A degrees of r,s are consequently 1 and 2.

For every adjacent pair i,j in A, their common B neighborhood is `(3,4)`-free
and has order at most eight. Their B-row sizes are
`17+epsilon_i-d_A(i)` and `17+epsilon_j-d_A(j)`. As B has order 24,

```text
(d_A(i)-epsilon_i)+(d_A(j)-epsilon_j)>=2.       (16)
```

Both r,s have positive excess. Their left side is therefore at most
`1+2-1-1=1`, contradicting (16). This proves the theorem. No graph edit,
complementation, repair feasibility, or transport of the selector is used.

<a id="claim-density-floor-three-higher-neighbors"></a>
### 6.3 At most three higher-degree neighbors force 58 edges

**Theorem.** A selected d18c root with `z=|A-P|<=3` has `a>=58`.
In particular `E_A<=3` suffices. Conversely, `a<=57` forces `z>=4`
and `E_A>=4`. This theorem does not depend on intrinsic saturation or
repair availability.

**Proof.** Assume `a<=57`. Section 6.2 handles z<=2. At z=3 an I4
inside the eligible core again contradicts Section 6.1, so
`C=A intersect P` is a `(4,4)`-free order-15 graph with at least 50 edges.
Let L be the three other A vertices, put `l=e(L)` and `c=e(C,L)`.
There are at most seven edges outside C.

A nonadjacent pair in L must have at least seven vertices in the union
of its C neighborhoods; otherwise at least nine common C nonneighbors
contain I3, giving I5 with that pair. If l=1 or 2, this requires
`c+l>=8`. If l=0, summing the three pair inequalities requires `2c>=21`.
Thus L is a triangle. Connectedness gives c>=1, and `c+3<=7` gives c<=4.

Write `h_i=d_C(L_i)`, `m=max h_i`, `E=sum_L epsilon_i=E_A`, and q=85-a.
Inequality (16) on each triangle edge gives
`epsilon_i+epsilon_j<=2+h_i+h_j`. Summing gives `E<=3+c<=7`; also q>=28.
The source bound b<=160 gives `W<=2q+2E+24`. Every C vertex is an actual
degree-18 destination, and selection gives q_u>=q for each of them. Hence

```text
J_C=sum_(u in C)E_u <=15(W/2+4-q).              (19)
```

A B vertex missing L_i has at least 7-h_i C neighbors, by the same
common-nonneighbor argument. Let K be the B vertices seeing all of L.
The triangle's full common neighborhood is independent and contains v,
so `|K|<=3` and its total excess is at most 18. L itself contributes
`sum_i epsilon_i h_i>=c` to J_C.

If m<=2, these facts give `J_C>=5(W-E-18)+c`. Subtracting (19) and using
the upper bound on W yields
`J_C-15(W/2+4-q)>=10q-10E-210+c>=c>0`.

If m=3, choose the other two L vertices, whose h values are at most one.
Their common B cell H has order t<=8. Put k=|K|<=3, with K subset H.
Outside H, every B vertex has at least six C neighbors; H-K vertices
have at least four. Relative to six times the total B excess, the maximum
loss is
`2*6*(t-k)+6*6*k=12t+24k<=168`.
Thus `J_C>=6(W-E)-168+c`, and subtraction yields
`J_C-15(W/2+4-q)>=12q-9E-264+c>=9+c>=12>0`.

If m=4, the other two L vertices have h=0. Inequality (16) forces their
excesses both to equal one, so their B rows have size 16, intersect in
exactly eight vertices, and cover B. Outside that intersection every B
vertex has at least seven C neighbors; within it, vertices outside K
have at least three. The maximum loss relative to seven times B excess is
`4*6*(8-k)+7*6*k=192+18k<=246`.
Adding L's contribution of at least four gives
`J_C>=7(W-E)-242`. Subtraction yields
`J_C-15(W/2+4-q)>=14q-8E-314>=22>0`.

These three cases exhaust m=1,2,3,4 and all contradict (19). The result
is a forcing theorem: a sufficiently sparse original selected root
forces more transported excess into its eligible core than selection
allows, so an actual denser degree-18 destination must exist.

<a id="claim-density-hole-count"></a>
### 6.4 Sparsity forces a quantitative supply of candidate holes

Let T(A) be the set of intrinsically safe missing A edges. Every pure
`A in R(4,5,18)` satisfies

```text
|T(A)| >= max(0,58-a).                         (17)
```

Purely augment A, one K4-safe edge at a time, to a K4-saturated graph A*.
This finite process preserves I5-freeness. The independently accepted
[saturated floor](d18/saturated_neighborhood_density_floor.md#claim-saturated-density-floor)
gives `e(A*)>=58`. Each added edge p was already intrinsically safe in A:
`A+p` is a subgraph of the final K4-free A*. Thus at least 58-a distinct
members of T(A) are present initially. This does not claim that their
simultaneous addition is safe in the ambient graph.

| a | 50 | 51 | 52 | 53 | 54 | 55 | 56 | 57 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Forced intrinsically safe holes | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 |

Here repair-terminal means that no one-addition repair with the permitted
B-deletion counts and any explicitly retained branch predicates is feasible;
single-exchange terminality alone is insufficient. This supplies a forcing
mechanism for a prospective floor. At such a terminal state all these holes require
actual obstruction certificates. More precisely, if all but at most r
intrinsically safe holes have certified admissible one-addition repairs,
terminality and (17) imply `a>=58-r`. A usable r must bound *all* repair
failures; passing the permanent guards or receiving an unresolved kernel
does not certify repair availability.

<a id="claim-density-clique-star-repair"></a>
### 6.5 A concrete collective repair certificate

Fix an intrinsically safe hole p. Let D be a nonempty set of B edges that
hits every triangle blocker of adding p. Suppose D is a star with center y,
its leaves form a clique in the original B, and every edge in D is individually
globally safe to delete. Then D is jointly safe to delete, and

```text
G-D and G+p-D are both Ramsey graphs;
a increases by one, b decreases by |D|.        (18)
```

Indeed, any new I5 in G-D contains y and at least one leaf. It cannot contain
two leaves, since their mutual edge is retained. Its original edge set is
therefore a single deleted edge, contradicting individual deletion safety.
Deleting edges creates no clique. Adding p then creates no K5 because D hits
all its blockers, and creates no independent set. Each hypothesis has a
finite witness test: the existing common-neighborhood triangles, the
leaf-clique check, and independent triples in the common antineighborhood
of each proposed deletion edge.

A clique-leaf star has at most three edges by K5-freeness. For an initially
blocked hole, restricting to its common B core loses no repair; a three-leaf
clique inside that core would itself be an unhit triangle. Consequently
two-edge stars are the useful genuinely collective core case. This criterion
provides a repair when different mixed triangle blockers force different
deletions, even though no single exchange works.

An explicit order-eight validation fixture has root 0, A={1,2,3,7},
A edges 13,23,17,27, and B={4,5,6} inducing a triangle. Both 1,2 see all B;
3 sees 4,5; 7 sees 4,6. Filling 12 forces deletion of 45 and 46 by the two
mixed triangle blockers. Those individually safe edges have adjacent leaves
5,6, so (18) applies. The bounded repair tool independently returns this
two-deletion certificate. No order-43 occurrence is asserted.

<a id="claim-density-monotone-extremum"></a>
### 6.6 What an edge maximal representative actually guarantees

Starting from a supplied rooted graph, fix the pivot star and cross matrix.
Consider every Ramsey graph H with `G[A] subset H[A]` and
`H[B] subset G[B]`. This finite family is nonempty. Maximize a and then,
among ties, minimize b. A remains connected if it started connected; the
marked root retains degree 18. The resulting representative has no valid
A addition, no valid B deletion, and no improving monotone repair batch.
This forces explicit triangle and independent-triple blockers, rather than
intrinsic K4-saturation of A.

For a blocked single hole, Section 5 trims every potential repair to its
common B core. Those core deletions must already be globally safe *before*
adding the hole: both addition endpoints see every deleted-edge endpoint,
so a newly created I5 cannot contain either endpoint and cannot be healed
by that addition. The secondary minimum of b therefore rules out every
single-hole rescue. Larger A batches may have alternating repairs before
the global extremum is reached; greedy single-hole terminality does not
rule them out.

The representative need not retain the original root selector. Reselecting
the densest degree-18 root gives at least the marked density, but may enter
a disconnected child when that density is below 69. At density at least 69,
the accepted connectivity classification makes every such selected
destination connected. Alternatively a completion reduction can retain
the connected marked root while explicitly dropping the maximum-root
predicate. Neither choice licenses applying an unproved numerical floor
to all original selected d18c instances.

<a id="claim-density-permanent-barrier"></a>
### 6.7 Permanent barriers survive even arbitrary B rewiring

There is an explicit small-order counterexample to the general inference
that a repair-maximal connected selected neighborhood is K4-saturated.
Take the independent blowup F of the complement of C7 with part weights
`(3,1,2,2,2,2,1)`: each part is independent, and distinct parts are complete
to each other except consecutive cyclic parts. Join a universal vertex t,
obtaining G on 14 vertices. Independent sets of F occupy at most two
consecutive cyclic parts, whose weights sum to at most four. Its clique
number is three. Thus G is K5/I5-free.

Choose the root v in part 2. Its neighborhood is t joined to a blown-up path
`6-4-0-5` with weights `(1,2,3,2)`, and has 22 edges. B consists of the
other part-2 vertex, isolated within B, and a `K_{1,2}` on parts 1 and 3.
The degree-nine roots in parts 2 and 5 have a=22, while those in part 0
have a=20. These are all degree-nine roots, so v satisfies the corresponding
maximum-density selector and A is connected.

The only intrinsically safe holes join the path endpoints, parts 6 and 5.
Every other A hole has t and a common path neighbor as an internal edge
witness. For either safe hole p, its common A neighborhood is {t}, and its
common B neighborhood is all four B vertices. Filling p makes a triangle
with t. K5-freeness forces B to become independent, while I5-freeness with
the fixed root forbids four independent B vertices. This contradiction
survives *any* B rewiring, including B additions, with the cross matrix fixed.
It is the permanent `|H_t|>=4` guard of Section 5.

The graph is also globally K5-saturated. For twin holes in F, the common
base neighborhood contains an edge. For holes between consecutive parts
i,i+1, common parts i+3 and i+5 are adjacent. Each added F hole therefore
creates K4, and t extends it to K5. This does not imply saturation of the
prescribed root's neighborhood.

The smaller order-nine fixture illustrates a weaker barrier. Let A be a
three-vertex path 1-2-3, root 0 see A, and B be a triangle 4,5,6 plus
isolated vertices 7,8. Join both path endpoints to the B triangle. Filling
13 creates K5; deleting any B edge creates I4 in B and I5 with the root.
Every monotone repair fails. However, filling 13, deleting 46 and 56, and
adding 67 gives a valid repair with fewer B edges. Thus B replacement can
escape an edge-critical deletion barrier, but cannot escape the permanent
cross obstruction in the order-fourteen example.

These are verified general counterexamples, not order-43 constructions or
counterexamples to an order-43 floor. They isolate the additional theorem
that is needed at order 43.

At order 43 a second numerical obstacle is `b=144`: no strictly B-decreasing
repair exists, even with arbitrary B rewiring, by the published B floor.
The scalar profile `n18=1,n19=18,n21=16,n22=8`, with the root adjacent to
all eighteen degree-19 vertices, allows

```text
a=50, E_A=18, W=98, x=224, b=144.
```

It obeys the side intervals and exact degree/excess totals. There is no
other degree-18 root and no degree-24 root to supply one in the complement.
This is a scalar consistency example, not a realized graph; it shows that
these budgets alone cannot force a strict B-decreasing transfer or a denser
original selected root.

### 6.8 Review and remaining forcing obligation

Section 6 is accepted on the scoped independent reviews below. Its positive
uses are the explicit
eligible-anchor and low-higher-neighbor density floors, forced hole counts,
and clique-star repair certificates. A universal improvement above 50
requires an order-43 argument ruling out sparse terminal representatives,
including their permanent cross guards and incompatible independent-set
repairs. Merely imposing local edge maximality does not discharge it.

| Independent reviewer | Retained statements reviewed | Outcome and decisive checks |
| --- | --- | --- |
| `/root/edge_exchange` | Sections 6.1--6.4 and 6.6; Section 6.7 scalar profile; added prototype fixtures | Accepted after correcting the m=3 endpoint to `9+c>=12`; checked actual eligible anchors, exact 16-core edge budget, all 15-core triangle attachment cases, loss bounds for every exceptional-cell size, monotone-family and selector scope, and direct semantic fixture checks |
| `/root/reroot_tradeoff` | Sections 6.1, 6.2, 6.4--6.7 | Accepted; checked singleton classes, positive-excess row contradiction, initial-hole monotonicity, collective deletion independence proof, both examples' exact root selection and cross guards, and all scalar totals; clarified that counted repair terminality includes the permitted deletion sizes |
| `/root/forcing_coverage` | Sections 6.1--6.3 and 6.5--6.7 | Accepted after rereading the corrected m=3 endpoint; independently recomputed all three excess-loss bounds, positive-excess pair demands and complete core/triangle coverage; checked star safety, both barriers and selector/normalization scope |
| `/root` | Section 6.3, authored by `/root/reroot_tradeoff`; Sections 6.4 and 6.5 and the examples, authored by the other subagents | Accepted after independently checking the three-case coverage and algebra, replacing an exception-count shortcut with `12t+24k` and `192+18k`, and correcting the m=3 numerical endpoint; checked the pure augmentation argument, clique-star proof, and both explicit graphs |

The reviews apply to the retained corrected proofs. They do not recertify
external census premises, establish novelty or order-43 realizability of
barrier patterns, or raise the universal d18c floor. The independently
accepted pure saturated floor has its own
[review](d18/saturated_neighborhood_density_floor.md#review-saturated-density-floor).

<a id="density-sparse-forcing"></a>
## 7. Forcing in the remaining sparse cases

The statements in Sections 7.1--7.5 concern the **original** selected
maximum-density degree-18 root. They do not assume repair terminality.
Sections 7.6--7.7 describe fixed-boundary repair obstructions and triggers;
their use at a terminal representative requires the completion scope of
Section 6.6. Section 7.8 changes the pivot star and lies outside that family.
Maximizing over roots of one graph does not imply terminality under changes
to that graph. In particular, the original selector alone does not say that
all the `58-a` intrinsic holes resist repair.

Throughout this section put

```text
P={u:d_G(u)=18}, p=|P|, C=A intersect P, L=A-P, z=|L|,
epsilon_u=d_G(u)-18, E=E_A=sum_A epsilon_u,
W=sum_V epsilon_u, q=85-a.
```

For every actual degree-18 root u, the B lower bound gives
`q_u+E_u<=W/2+4`. Selection gives `q_u>=q`. At the source, the B upper
bound gives

```text
W<=2q+2E+24=194-2a+2E.                         (20)
```

<a id="claim-density-triple-excess"></a>
### 7.1 An actual eligible independent triple forces excess

**Theorem.** If P contains an independent triple, then

```text
W>=6q-72=438-6a,    E>=2q-48=122-2a.           (21)
```

Such a triple exists if `p>=14`, by `R(5,3)=14`, or if `z<=9`, since
C is K4-free of order at least nine and `R(4,3)=9`.

**Proof.** Fix an actual independent triple I in P. Its empty-signature
class Q is a clique: a nonedge in Q together with I would give I5.
Thus `|Q|<=4`, and its total excess `W_0` is at most 24. All excess lies
outside I, so incidence counting yields

```text
sum_(u in I) E_u>=W-W_0>=W-24.
```

Selection and the three root budgets bound the same sum above by
`3(W/2+4-q)`. Rearrangement gives the first inequality of (21);
combining it with (20) gives the second. This is an occurrence-and-budget
forcing argument on the same actual roots, with no graph change.

**Unconditional consequence.** Every selected degree-18 root satisfies

```text
E>=min(10,122-2a).                            (22)
```

If `E<=9`, then `z<=E<=9` because each member of L has positive integral
excess, and (21) applies. Otherwise `E>=10` already proves (22).
Consequently `a=50,...,56` forces `E>=10`, and `a=57` forces `E>=8`.
Connectedness is unnecessary for (20)--(22).

<a id="claim-density-diamond-effective-degree"></a>
### 7.2 A diamond strengthens the effective-degree constraints

For i in A write `w_i=d_A(i)-epsilon_i`. Its B row R_i has size `17-w_i`.
The row is `(4,4)`-free, so has order at most 17, giving `w_i>=0`.
Every A edge satisfies `w_i+w_j>=2`, by (16).

**Theorem.** Every induced diamond `K4-e` in A satisfies

```text
sum_(i in diamond) w_i>=5.                    (23)
```

**Proof.** Label the adjacent diamond centers r,s and its nonadjacent tips
u,t. The two perfect matchings give total weight at least four. Suppose
it equals four. All four center-tip edge inequalities are then equalities,
so `w_r=w_s=k`, `w_u=w_t=2-k`. The center edge and nonnegativity give
`k in {1,2}`. Center rows have size `17-k` and tip rows size `15+k`.
Each center-tip pair has row-size sum 32; its intersection has order at
most eight, so it has intersection exactly eight and union B.

Let `H=R_r intersect R_s`, `h=|H|<=8`. The union equalities imply
`B-H subset R_u intersect R_t`. Each tip row therefore has exactly
`h-9+k` vertices in H. At least

```text
h-2(h-9+k)=18-2k-h>=6
```

vertices of H miss both tips. H is triangle-free, since a triangle there
would extend the A edge rs to K5. By `R(3,3)=6`, the six vertices contain
an independent triple; it joins the nonadjacent tips to I5. This
contradiction proves (23).

<a id="claim-density-floor-four-five-higher-neighbors"></a>
### 7.3 Four higher-degree neighbors force 55; five force 51

**Theorem.** For the original selected connected degree-18 root,

```text
z<=4 => a>=55,    z<=5 => a>=51.               (24)
```

The new exact-z arguments do not need connectedness; the stated scope also
uses the accepted smaller-z floors from Sections 6.2--6.3.

**Four-vertex proof.** Suppose `a<=54`. Smaller z is already excluded,
so z=4 and C has order 14. An eligible I4 in C invokes Section 6.1;
otherwise C is `(4,4)`-free and has at least 41 edges by the published census.
Write `l=e(L)`, `c=e(C,L)`. Effective degrees give the exact identity

```text
E=2l+c-sum_L w_i,
a=e(C)+l+c,
E=a-e(C)+l-sum_L w_i.                         (25)
```

For a K4-free graph L on four vertices, `l-sum w<=0`, except possibly
when L is a three-edge star. Here is complete coverage: l=0 is immediate;
l=1 requires weight at least two; l=2 has weight at least two; with l=3,
a triangle requires weight at least three and a path has a two-edge
matching requiring at least four. These and the star exhaust l=3.
At l=4 a two-edge matching gives weight at least four. At l=5 L is a
diamond, and (23) gives at least five. K4-freeness excludes l=6.

In the star case its three leaves are independent. Their common
nonneighbors in C form a clique of order at most three: a nonedge there
makes I5 with the leaves, and C is K4-free. Thus the leaves collectively
meet at least 11 vertices of C, giving `c>=11` and
`a>=41+3+11=55`.
In every other case (25) gives `E<=a-41`. An actual I3 exists in C,
so (21) gives `122-2a<=a-41`. Hence `3a>=163`, and a>=55.

**Five-vertex proof.** It remains to exclude a=50 with z=5. C has order
13; either it has an eligible I4, or its `(4,4)` edge count is at least 33.
We claim that every K4-free graph L on five vertices with nonnegative
integral weights satisfying the edge inequalities and (23) obeys

```text
l-sum_L w_i<=2.                              (26)
```

First, edge inequalities alone give the coarse bound three. If l<=6,
either L has a two-edge matching, giving weight at least four, or all
its edges pairwise intersect. The latter graph is a star with at most
four edges or a triangle, and has penalty at most two or zero.
If l>=7, no vertex is isolated: otherwise a K4-free graph on four
vertices would have at least seven edges. A two-edge matching gives weight
at least four, so l=7 has penalty at most three. Turan's K4-free bound gives
l<=8. At l=8 equality in Turan gives `K_{2,2,1}`; summing its four
triangles gives `2 sum_L w+2w_center>=12`. If the total weight were at
most four, the center weight would be at least two and the other four
would total at most two; their C4 edge constraints require total at least
four. This is impossible, so total weight is at least five, again giving
the coarse penalty at most three.

To rule out equality three, truncate every weight to at most two; this
preserves all edge inequalities. The coarse bound then forces equality
and no truncation loss if the original penalty was at least three.
Let r be the number of zero weights, m=5-r and t the number of weights
equal to two. Zero-weight vertices are independent and can see only
weight-two vertices, so

```text
l<=r*t+floor(m*m/3),    sum_L w=m+t.           (27)
```

The K4-free Turan bound on the m positive vertices gives (27).
For r=1,4,5 its right side minus `m+t` is at most one, two, zero,
respectively. For r=0, equality three requires l=8, t=0; the resulting
`K_{2,2,1}` contains a diamond of total weight four, contradicting (23).
For r=2, equality requires t=3 and all bounds tight: the three positive
vertices form a triangle and each zero vertex sees all three, making K4.
For r=3, equality requires t=2 and all bounds tight: the positive pair
is adjacent and sees all three zeros; two zeros with the positive pair
form a diamond of total weight four. These exhaust r, proving (26).

Now (25)--(26) give `E<=a-31`. C contains I3, so (21) implies
`122-2a<=a-31`, or `3a>=153`. This forces a>=51 and proves (24).

<a id="claim-density-root-count-floor"></a>
### 7.4 Many actual degree-18 roots force a higher floor

**Theorem.** The original selected degree-18 root obeys the hierarchy
below, without a connectedness premise.

| Actual root count | p>=19 | p>=20 | p>=21 | p>=22 | p>=23 | p>=25 |
| --- | --- | --- | --- | --- | --- | --- |
| Forced a | >=51 | >=53 | >=54 | >=56 | >=58 | >=63 |

**Proof.** If a<=57, Section 6.1 prohibits I4 in P, hence p<=24 by
`R(5,4)=25`. For `19<=p<=24` put `H=V-P`, `h=43-p`. Turan gives

```text
e(H)<=T_h=floor(3h*h/8)-1.                   (28)
```

Indeed the equality graph for the K5-free Turan bound is the balanced
complete four-partite graph; when h>=19 one part has at least five
vertices, violating I5-freeness. Each H vertex has excess in 1..6.
Selection gives `E_u<=W/2+4-q` for u in P, so the excess of the H vertices
omitted by u is at least `W/2-4+q`. Thus its number of H neighbors is at most
`h-ceil((W/2-4+q)/6)`. Summing from both ends of the cut gives

```text
18h+W-2T_h <= e(P,H)
           <= p*(h-ceil((W/2-4+q)/6)).         (29)
```

Here W is all H excess. Since p>=14, (21) supplies `W>=6q-72`.
The following endpoint violations of (29) are sufficient:

| p | Tested a | Minimal W | Lower cut bound | Upper cut bound |
| --- | --- | --- | --- | --- |
| 19 | 50 | 138 | 140 | 133 |
| 20 | 52 | 126 | 146 | 140 |
| 21 | 53 | 120 | 156 | 147 |
| 22 | 55 | 108 | 158 | 154 |
| 24 | 57 | 96 | 170 | 168 |

For each row decreasing a increases q and the minimal W; increasing W
increases the lower cut bound and weakly decreases the upper one. Thus each
exclusion covers all smaller a. Combining rows upward in p gives the first
four hierarchy entries and the p=24 endpoint.

For p=23, use one additional **isolated literature premise**:
`E(4,5,22)=114`, the maximum edge count in `R(4,5,22)`, from
Angeltveit--McKay, arXiv:2409.15709v2, Appendix A, Table 1. The
[degree-20 note](d20/interface_bounds.md) also records the complemented
22-vertex interval; none of that note's degree-20 or no-degree-18 hypotheses
is imported here. Deleting each vertex of an order-23 `(4,5)` graph and
summing the 22-vertex edge bounds gives
`E(4,5,23)<=floor(23*114/21)=124`.
Since P is `(5,4)`-free, `e(P)>=binom(23,2)-124=129`, and
`e(P,H)<=23*18-2*129=156`. But h=20, (28) gives `T_h=149`, and
(21) gives W>=96 when a<=57. The opposite cut is at least
`360+96-298=158`, a contradiction. Thus p>=23 forces a>=58.
The p>=25 entry is the accepted eligible-I4 anchor itself.

<a id="claim-density-triple-equality-reroute"></a>
### 7.5 Equality triggers a 72-edge destination in the complement

Suppose an actual I3 in P exists and `E=122-2a`. Equality in (20)--(21)
forces `W=438-6a` and b=160. In the proof of (21), equality forces the
empty-signature class Q to have excess 24, hence Q is a K4 of four
vertices of degree 24. If W_j denotes excess in signature class size j,
the exact triple incidence identity is

```text
sum_(u in I) E_u=W-W_0+W_2+2W_3.
```

Consequently `W_2=W_3=0`, and all three selected-root budget bounds are
equalities as well.

In the complement, Q is an independent four-set of actual degree-18
vertices. Each member of the original I has complementary degree 24,
is adjacent to all Q there, and contributes six excess units to the
quadruple signature. Thus `W'_4>=18`. The signed eligible-I4 certificate
from Section 6.1 gives

```text
W'_1-W'_3-2W'_4<=72-36=36,
a'_u>=81-floor(36/4)=72
```

for some actual complement degree-18 root u. The selected destination in
that orientation is connected, since the accepted disconnected slices
have at most 68 neighborhood edges. This is a concrete orientation-rerouting
trigger. It does not exclude the original orientation unless the selector
explicitly compares degree-18 roots in G and its complement.

**Concrete endpoint trigger.** At z=5 and a=51, C has order 13 and no
eligible I4. Equations (25)--(26) give `E<=51-33+2=20`, while (21)
gives `E>=122-102=20`. Thus equality is forced and the 72-edge complement
destination is automatic. Under an explicit selector maximizing neighborhood
edges over degree-18 roots in **both** orientations, the connected subclass
z<=5 therefore has a>=52. In the fixed orientation its floor remains 51,
with the a=51 endpoint supplying this rerouting certificate.

<a id="density-floor-fifty-residual"></a>
**Exact remaining split at a=50.** The accepted disconnected
classification has minimum neighborhood count 53, so such a root is
connected. Equations (24) and (29) therefore force z>=6 and p<=18.
If P contains I3, (21) forces W>=138 and E>=22. If P contains
no I3, `R(5,3)=14` gives p<=13. Every degree-18 root then has at most
eight neighbors in P, since its P neighborhood is `(4,3)`-free, and at
least p-5: its P nonneighbors are a clique of order at most four.
Therefore every such root has at least ten higher-degree neighbors and

```text
p-5<=d_P(u)<=8.
```

At p=13, P is 8-regular; its complement is a 4-regular triangle-free,
I5-free graph. Every degree-18 root has exactly ten higher-degree neighbors.
The two alternatives, including the small-P/no-I3 case, remain open.
In particular (22) rules out the old possibility E<=9 at a=50 but does
not rule out the scalar profile in Section 6.7, which has p=1 and E=18.

<a id="claim-density-signature-frozen-hole"></a>
### 7.6 Fixed signatures freeze holes and charge oversized cores

Let uw be an intrinsically safe A hole, let
`C_uw=N_A(u) intersect N_A(w)`, and `H=R_u intersect R_w`.
The set C_uw is independent. After adding uw it must remain independent
even if additional A edges are permitted, because an edge there with uw
would give K4 in A and K5 with the root.

For y,z in H, a common neighbor t in C_uw forces yz to be absent after
adding uw: otherwise `{u,w,t,y,z}` is K5. Conversely, three vertices
of C_uw missing both y,z force yz to be present, since they would form
I5 with a missing yz. If both requirements occur, no B rewiring and no
further A additions can repair uw with the pivot star and cross matrix
fixed. Since `|C_uw|<=4`, this conflict means that C_uw has order four
and y,z have the same singleton signature on it. The implication is
stronger than the old cardinality guards `|H|<=8`, `|H intersect N_B(t)|<=3`.

An explicit order-nine fixture has root 0, A={1,...,6}, A inducing
`K_{2,4}` with part {1,2}, B={7,8} joined by an edge, and cross edges
17,18,27,28,37,38. The original graph is K5/I5-free: its clique number
is at most four; any independent set containing a B vertex has order
at most four, and an independent set in A also has order at most four.
Filling 12 forces deleting 78 by the common neighbor 3, while deleting
78 gives I5 on {4,5,6,7,8}. Both old cardinality guards pass. The new tool
returns the two opposing signature witnesses.

A related **weighted guard** applies to every A nonedge, safe or otherwise.
If its common A and B orders are c and h, its common antineighborhood has
order `6+c+h-epsilon_u-epsilon_w`. This cell is `(5,3)`-free, so has
order at most 13. Therefore

```text
h<=7+epsilon_u+epsilon_w-c.                   (30)
```

An oversized common B core, h>=9, costs at least `2+c` excess units on
its endpoints. For any fractional matching of such holes, with weights
lambda_f>=0 and each vertex's total incident weight at most one, summing
(30) gives the forcing certificate

```text
E_A>=sum_f lambda_f*(2+c_f).                  (31)
```

This couples many blocked holes through one excess budget. A universal
upper budget strong enough to contradict (31) is not presently proved.

<a id="claim-density-star-batch-sequencing"></a>
### 7.7 Star batches sequence safely; mutually unsafe batches need a cycle

**Star sequencing.** Suppose a feasible monotone batch consists of A
additions all incident with one vertex x and arbitrary B deletions D.
Trim D to the deleted B edges whose endpoints both see x. Every new K5
contains x and must be hit by a B edge inside its neighborhood, so this
trimmed batch is still K5-free. Any new I5 caused by the trimmed deletions
contains such a deleted pair, hence cannot contain x; the A-star additions
cannot heal it. Feasibility of the full batch therefore proves the trimmed
deletions alone are I5-safe. Delete them first, add the star edges in any
order, then make the remaining deletions. All intermediates are Ramsey:
addition intermediates are subgraphs of the trimmed feasible final graph,
and final deletion intermediates are supergraphs of the full feasible
final graph. The clique and independent-set monotonicities give the
respective safety directions. The dual statement holds when all B
deletions share a vertex: trim A additions to pairs missing that vertex,
add them first, delete the star edges, then add the remaining A edges.

If every chosen A addition is initially blocked, the trimmed deletion set
is nonempty. Thus a B-deletion-critical graph admits no A-star rescue of
an initially blocked addition batch. Safe A additions may still make a
critical B deletion safe, as in Section 2. A simultaneous repair with
every individual edit unsafe needs edit vertex-cover at least two on
both A and B.

**Alternating dependency.** Suppose every chosen A addition is initially
K5-blocked, every chosen B deletion is initially I5-critical, but the
full batch is feasible. For each addition choose a K5 witness; some chosen
B deletion hits its triangle blocker. Draw an arc from the addition to
that deletion. All four cross pairs between their endpoints are edges.
For each deletion choose an I5 witness; some chosen A addition heals its
independent triple. Draw the reverse-type arc from that deletion to the
addition; all four cross pairs are nonedges. Each edit node has an outgoing
arc, so there is an alternating directed cycle. A two-node cycle is
impossible, hence its length is at least four. Consecutive A additions
on this cycle are vertex-disjoint because their signatures on the
intervening B pair are opposite; consecutive B deletions are similarly
disjoint. A cycle with two additions and two deletions therefore requires
an eight-vertex checkerboard of complete and empty cross rectangles.
Absence of alternating cycles rules out all-initially-unsafe mutual batches.
The cycle is necessary, not a feasibility certificate; independent and
clique witnesses outside these eight vertices must still be checked.

<a id="claim-density-root-star-swap"></a>
### 7.8 Exact root-star swaps have a bounded candidate supply

One can also change the pivot star while keeping its degree 18: remove vu
with u in A, and add vy with y in B. Put
`O_u=B-R_u`, `C_y=N_A(y)` and let Y_u be the intersection of **all**
independent triples in O_u. This triple family is nonempty: deleting vu
alone makes u and v nonadjacent and leaves v of degree 17, impossible in
a K5/I5-free graph of order 43. Any resulting I5 consists of u,v and
an independent triple in O_u. Consequently `|Y_u|<=3`, although Y_u
can be empty.

**Exact criterion.** The swap is valid if and only if

```text
y in Y_u and C_y is triangle-free.            (32)
```

Any I5 created by deleting vu must lose y from O_u after vy is added,
giving the first condition. It also gives uy a nonedge. Thus deleting vu
cannot hit a triangle in C_y, and K5-freeness requires the second condition.
Conversely, triangle-freeness makes vy safe to add; the first condition
then makes vu safe to delete. This gives the explicit execution order.

Writing `s_u=d_A(u)`, `c_y=|C_y|`, the exact changes are

```text
Delta a=c_y-s_u,
Delta b=Delta a-1+epsilon_u-epsilon_y.         (33)
```

Therefore the swap improves both sides exactly when
`1<=Delta a<=epsilon_y-epsilon_u`. Validity forces `epsilon_u>=1`
and `epsilon_y<=5`, by the final degree window. The number z is invariant:
the removed A vertex has positive excess, and the new A vertex has excess
`epsilon_y+1>=1`; other A degrees do not change. Every strict gain is at
most four and at most 3z candidate pairs need the tests in (32).
This tool exposes a forcing trigger whenever a candidate satisfies the
inequalities. It does not force a nonempty Y_u. These swaps change the
boundary and lie outside the terminality scope of Section 6.6; forbidding
them requires a separate comparison family. They may change connectedness
and the maximum-root selector, which any branch-preserving normalization
must check explicitly.

### 7.9 Independent review and current coverage

The retained proofs are accepted on the independent reviews below.

| Independent reviewer | Retained statements reviewed | Outcome and decisive checks |
| --- | --- | --- |
| `/root/edge_exchange` | Sections 7.1--7.5 | Accepted; checked actual triple occurrence and selection budgets, diamond cell counts, all four/five-vertex cases including truncation loss, all cut endpoints and monotonicity, isolated literature-premise scope, complementary equality routing, the complete a=50 residual split, and the concrete z=5,a=51 equality-trigger corollary |
| `/root/reroot_tradeoff` | Sections 7.4, 7.6, 7.8 and the Section 7.5 residual split | Accepted; independently recomputed deletion averaging and both cut bounds, checked immutable signatures under further A additions and arbitrary B rewiring, weighted fractional matching, exact root-star witness kernels and gains, and connectedness before applying the a=50 local floor |
| `/root/forcing_coverage` | Sections 7.2, 7.3, 7.7 and 7.8 | Accepted after rereading scope corrections; checked complete effective-weight case coverage, star sequencing and alternating cycles, nonempty independent-triple kernels, all swap accounting and candidate bounds. Corrected the star impossibility to require an initially blocked addition batch and explicitly excluded root-star swaps from the fixed-boundary terminality family |

These reviews apply to the retained corrected text. External census values
remain isolated literature premises; they were not independently retrieved
or recertified. Accepted deductions do not assert novelty, a realized
order-43 obstruction, branch closure, or a universal transfer.

The universal floor remains 50. A selected a=50 root must satisfy the
residual split in Section 7.5, and a separately chosen repair-terminal
representative must additionally certify failure at all its forced holes.
No uniform bound on these failures, contradiction in the residual degree
families, or universal successful root-star swap has been established.

<a id="density-transfer-tool"></a>
## 8. Certificate tool and bounded semantic validation

[density_transfer.py](density_transfer.py) reads a supplied JSON graph and
checks its Ramsey constraints exhaustively before reporting:

- every A hole and B edge, its blocker count, first witness, and complete
  common repair support;
- every valid one-edge exchange and a provably safe execution order;
- exact root-star swaps, their side gains and safe execution orders;
- all same-degree destinations, exact `(Delta,T,Delta b)`, and which satisfy
  strict improvement on both sides;
- optionally the at-most-28-variable local repair system for a specified
  intrinsically safe hole, with propagated decisions and a concrete repair,
  a conflict, or unresolved clauses. All variables describe edges retained
  in the common B core; a conflict is scoped as in Section 5.

Input is `{"n":43,"root":0,"edges":[[0,1],...]}` with zero-based labels.
No graph is changed. The tool prints deterministic JSON; an empty witness
family uses JSON `null` for unrestricted repair support, while `[]` means
no repair edge survives all witnesses. These cases must remain distinct.

```sh
python3 research/n43/density_transfer.py input.json
python3 research/n43/density_transfer.py input.json --repair-hole 1 2
python3 research/n43/density_transfer.py --self-check
```

The self-check covers every labeled order-five graph under parameters
`(3,3)`, `(3,4)`, `(4,3)`, `(4,4)` and every eligible root. General witness
sizes are `r-2` and `s-2`. It compares the predicted exchanges with direct
homogeneous-set checks of the edited graph and checks the safe intermediate
order. Result: **PASS**, 7,740 valid rooted inputs, 1,080 exchange comparisons,
480 valid exchanges, 10,800 same-degree reroot accounting checks, and
24,840 root-star swap comparisons with direct final and intermediate graph
semantics; all three
safe-order cases occur. This is bounded semantic validation, not an order-43
construction, search, or exclusion. The full order-43 `K3/I3` specialization
is proved in Section 2; the tiny analogues exercise the implementation.

Six explicit order-six/eight/nine fixtures additionally cover a B-triangle repair,
a forced mixed-triangle deletion, a two-edge clique-star repair, an incompatible
independent-set retention, an immutable four-vertex triple cell, and
the conflicting common-A signature guard of Section 7.6.
All 38 assignments across their
local deletion sets were compared with direct `K5/I5` checking. The outcomes
include `certificate`, `blocked`, and `unresolved`. A returned concrete
certificate is also checked against every five-set of the edited graph.

The order-nine and order-fourteen barrier examples in Section 6 are also
replayed by the self-check. It checks all 126 and 2,002 five-sets respectively,
same-degree root selection, the order-nine B replacement witness, the two
permanent guarded holes of the order-fourteen graph, and its global
K5-saturation. These are explicit tiny semantic validations.

### Independent review

| Reviewer | Independently reviewed retained content | Outcome |
| --- | --- | --- |
| `/root/edge_exchange` | Section 1 including pointed-family threshold and K2 joint gains; Section 3 counts and numerical consequences; Section 5 core guards, repair rules, degree caps and matching prerequisite | Accepted on stated premises; did not review their own sequencing argument |
| `/root/reroot_tradeoff` | Sections 2--5 including the complete bounded repair proof and sequencing; prototype exchange and local-repair implementation | Accepted after the scope and propagation wording repairs below; did not accept their own Section 1 derivations |
| `/root/forcing_coverage` | Sections 1, 2, 4; K2 joint calculation; initial exchange prototype | Accepted; bounded-repair derivation was their contribution and was reviewed independently by the other reviewers |

Decisive checks included both forbidden-set directions, actual same-witness
coverage, exact signed-anchor and histogram arithmetic, root-excluded K2 cells,
the degree-five `(4,4,12)` type, complete five-set batch conditions, fixed-family
coverage, support intersections, and safe intermediate execution. Review
identified and repaired an omitted explicit degree-18 premise before the
Section 3 count and distinguished refutation of discretionary deletion choices
from refutation of all repairs after forced propagation. The retained bound
uses the actual B edge floor 144; the budget constant 148 is not such a floor.
The 21-variable refinement follows directly by excluding the common pivot.

The latest local-repair code was independently checked for all clique and
independent-set clauses, sound unit and degree-capacity propagation, the
order-43 addition cap, core-restricted failure scope, and exhaustive final
verification of emitted candidates. `/root/edge_exchange` and
`/root/reroot_tradeoff` additionally accepted the new root-star witness-kernel
implementation and exact gain accounting; both checked the conflicting
common-A signature guard, and `/root/edge_exchange` checked the new fixture
and the exhaustive swap-comparison loop. The author ran the validation recorded
above; reviewers read the code without independently rerunning it. Acceptance
does not recertify the external censuses, prove a repair must always exist,
or supply an order-43 proof certificate.

## Remaining coverage

The histogram and row/column triggers use actual degree-18 families, which
must exist. Section 7 forces an eligible I3 when p>=14 or z<=9; its
occurrence is still not universal. No universally favorable histogram
or transported excess is forced. Existing A-only rerooting statements can now
be tested against the extra requirement `T>Delta`; their old density gains
alone carry no B-reduction conclusion.

At fixed boundary, extremality supplies blocker obligations but does not
force them to be inconsistent. Intrinsic saturation of A, intrinsic
edge-minimality of B, empty reciprocal supports, and larger-edit conflicts
remain possible barriers on current knowledge. In particular `a=85` or
`b=144` already prevents every fixed-root strict transfer on the published
side extrema. No occurrence at order 43 is asserted for any barrier pattern.
The degree-18 branch, residual degree-20 branch, and order-43 decision remain
open; the global Ramsey interval remains `43..46`.

## Changelog

- Added exact two-sided reroot accounting, same-family excess and histogram
  triggers, reciprocal exchange supports, the mutual-rescue obstruction,
  low-degree hole supplies, fixed-boundary normalization, exact batch
  obligations, and a bounded certificate tool.
- Accepted the retained mathematical statements after independent review,
  made the numerical forcing scope explicit, repaired propagation wording,
  and recorded the 21-variable degree-18 endpoint refinement.
- Added independently reviewed selected-d18c floors `z<=2 => a>=63` and
  `z<=3 => a>=58`, where z counts higher-degree A vertices; forced at least
  `58-a` initial safe holes, supplied a collective clique-star repair, and
  isolated permanent barriers to saturation by B rewiring. Corrected the
  three-neighbor proof's m=3 endpoint to `9+c>=12` during review.
- Replayed five local-repair fixtures and the order-nine/fourteen barrier
  graphs; the universal d18c floor and all order-43 branches remain open.
- Added actual-I3 excess forcing, a diamond effective-degree inequality,
  selected-root floors z<=4 =>55 and z<=5 =>51, a degree-18 root-count
  hierarchy, and an equality-triggered 72-edge complement destination
  (automatic at z=5,a=51; explicit two-orientation selector gives floor 52).
  Narrowed a=50 to z>=6, p<=18 and the explicit I3/no-I3 split.
- Added fixed-signature hole freezing, weighted oversized-core charges,
  star-batch sequencing, alternating-cycle necessity, and exact root-star
  swaps; extended bounded validation to 24,840 swaps and six repair fixtures.
  Accepted the retained additions after independent review, qualifying the
  star-batch impossibility and excluding root-star swaps from fixed-boundary
  terminality. The universal floor remains 50.
