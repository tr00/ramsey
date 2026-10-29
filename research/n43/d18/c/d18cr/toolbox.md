# The degree-18 toolbox on marked order-17 parents

## Metadata and summary

**Scope:** an original selected degree-18 root `p` in an order-43
`K5/I5`-free graph `G`, with connected neighborhood `A`, and one marked
locally safe edge `uv` of `A`. This is the locally reducible branch, including
edges whose contraction fails the global safety test. The additional residual
scope, wherever explicitly stated, is

```text
70<=e(A)<=81,  q=85-e(A) in 4..15,  kappa(A)>=4,  tau_4(A)>=3.
```

These restrictions do not redefine the broader [d18cr branch](README.md).
**Kind:** exact theorem translations, additional necessary family filters,
and a split-aware completion adapter. **Authors:** /root, port_budgets,
port_structure, force_safe_reductions. **Review state:** accepted on the
scoped independent reviews [recorded below](#review-record). Permitted use is
the stated necessary family predicates and exact fixed-split completion
states, on their declared hypotheses and literature premises. The generation
sequence remains an implementation design; no production pruning is enabled.
No complete parent catalogue, order-43 run, or branch exclusion is claimed.

Dependencies are the accepted local [safe-edge and inverse-split theorems](../safe_contractions.md),
the original d18 tools linked below, classical Ramsey bounds and Mantel/Turan
bounds, and the recorded [edge extrema](../../../../../README.md#state-of-the-art).
In particular the order-17 `(4,5)` maximum is 79; the `(4,4)` maxima at orders
11,12,13 are 36,40,45. These literature premises are not recertified here.
The new 76-edge connectivity threshold uses those three `(4,4)` maxima.

Most tools survive exactly when evaluated through the split data. The main
extra parent filters are a connectivity test, forced common-neighbor membership
of degree-three vertices, and restrictions on globally safe splits. All column
witness, averaging, SOS, fixed-B and recursive-obligation tools can use the
same two endpoint rows as before. A union row alone loses necessary information.

## 1. Notation and exact lifting

<a id="split-data"></a>
Write `H=A/uv` for the **local** order-17 parent, `z` for its marked vertex,
and `C=H-z=A-{u,v}`. The full quotient is written `F=G/uv`.
Let

```text
W=N_H(z),  D=C-W,
P_u=N_A(u)-{v},  P_v=N_A(v)-{u},
P_u union P_v=W,  J=P_u intersect P_v,  c=|J|,  m=|W|,
h=e(H),  a=e(A)=h+1+c.
```

The parent is `(4,5)`-free, `W` is triangle-free, and `J` is independent.
The exact local inverse-split test also requires every independent four-set of
`C` to meet both `P_u` and `P_v`. The accepted
[trace-coloring theorem](../safe_contractions.md#safe-split-traces) supplies a
finite encoding of that condition. These conditions are necessary and
sufficient for a locally safe `(4,5)` lift; residual and ambient conditions
are additional.

For `w in C`, keep its original row `R_w=N_B(w)`. Also keep `R_u,R_v`
separately. Put

```text
T=R_u union R_v,  K=R_u intersect R_v,  rho=|T|,  k=|K|,
b=e(B),  x=e(A,B),  y=e(F[N_F(p)],B)=x-k.
```

`B` still has 24 vertices and is `(5,4)`-free, independently of global
contraction safety. The union row of `z` is `T`; it need not be `(4,4)`-free
or have size at most 17.

<a id="homogeneous-lift"></a>
**Exact induced-subset predicate.** For `S subset C` and availability bits
`alpha,beta`, the tested subset of the lift consists of `S`, plus `u` if
`alpha=1` and `v` if `beta=1`. For every `j>=2`, it contains a clique of
order `j` exactly when at least one of these holds:

```text
C[S] contains K_j;
alpha=1 and C[S intersect P_u] contains K_(j-1);
beta=1  and C[S intersect P_v] contains K_(j-1);
alpha=beta=1 and C[S intersect J] contains K_(j-2).
```

Here `K_0` is always present, including in the empty set. The subset contains
an independent `j`-set exactly when at least one of these holds:

```text
C[S] contains I_j;
alpha=1 and C[S-P_u] contains I_(j-1);
beta=1  and C[S-P_v] contains I_(j-1).
```

Proof: partition a clique by its subset of endpoints, which is respectively
empty, `{u}`, `{v}` or `{u,v}`. Its remaining vertices have exactly the stated
common-neighbor requirements. An independent set contains at most one endpoint
because `uv` is an edge. These cases prove both directions. Thus all actual
homogeneous sets used by the old tools can be found from 16 core vertices and
the two attachment masks, without assuming anything about `F`.

## 2. Degree, edge and excess budgets

<a id="degree-budgets"></a>
Let `s_i=d_A(i)` and `epsilon_i=d_G(i)-18`. The original global degree
window is `0<=epsilon_i<=6`. The exact formulas are

```text
s_w=d_H(w)+1_J(w),              r_w=17+epsilon_w-s_w    (w in C),
s_u=1+|P_u|,                   r_u=16+epsilon_u-|P_u|,
s_v=1+|P_v|,                   r_v=16+epsilon_v-|P_v|.
```

Consequently every original row satisfies

```text
max(4,17-s_i) <= r_i <= min(17,23-s_i).
```

If the original excess is specified, use the equality rather than only this
interval. For an original B column let `S_b=N_C(b)`, and let
`alpha_b=1_Ru(b)`, `beta_b=1_Rv(b)`. Its lifted size is

```text
gamma_b=|S_b|+alpha_b+beta_b
       =|N_F(b) intersect N_F(p)|+1_K(b),
18 <= d_B(b)+gamma_b <=24.
```

The original column bounds `1<=gamma_b<=14` and `10<=d_B(b)<=17` survive.
In the residual scope, `gamma_b>=tau_4(A)>=3`; the exact transversal condition
must still be checked. Degree sums prove all displayed equalities. Ordinary
vertices of `F` have their original degrees minus one exactly when they see
both endpoints. They may therefore have degree 17. Original root-degree and
excess bounds must be applied to the lifted degrees.

<a id="scalar-budgets"></a>
Put `E_A=sum_(i in A) epsilon_i` and
`E_B=sum_(b in B)(d_G(b)-18)`. The exact translated d18 identities are

```text
q=84-h-c,
E_A=2h+y+k+2c-304,
E_B=2b+y+k-432,
y=304-2h-2c+E_A-k =136+2q+E_A-k.
```

Proof: contraction deletes `uv` and the `c` duplicated local edges, so
`a=h+1+c`; it merges exactly the `k` duplicate cross edges, so `x=y+k`.
Substitute these into the accepted original identities
`E_A=2a+x-306` and `E_B=2b+x-432`.

Using the [original d18 corridor](../../../reductions.md#8-degree-18-branch),
every such lift satisfies

```text
max(139-k,304-2h-2c-k,432-2b-k)
    <= y <= min(279-k,412-2h-2c-k,576-2b-k),
144<=b<=160,  0<=E_A<=108,  0<=E_B<=144.
```

The first lower term uses the reviewed `x>=139` closure and the first upper
term uses the reviewed [independent-row bound](../../independent_row_cuts.md).
All other terms are degree sums. In the residual scope replace `139-k` by
`144-k`; more precisely retain `y=136+2q+E_A-k` with `q in 4..15`.
Also require `65<=h<=79` and `70<=h+1+c<=81`. These are family filters,
including when the global quotient is unsafe. Original near-frontier
`x=136,137,138` exclusions remain exclusions of `y+k`, not of `y` alone.

## 3. Connectivity, interior degrees and transversals

<a id="connectivity-lift"></a>
**Exact four-connectivity test.** For a valid local split, `kappa(A)>=4`
is equivalent to all three conditions below:

1. `C-U` is connected for every `U subset C` with `|U|<=1`.
2. Each of `P_u-U` and `P_v-U` meets every component of `C-U`, for every
   `U subset C` with `|U|<=2`.
3. `W-U` meets every component of `C-U`, for every `U subset C` with
   `|U|<=3`.

Proof: every deleted set of at most three vertices removes both endpoints,
one endpoint, or neither. In the first case the remaining graph is `C-U`.
In the second it is `C-U` with one endpoint attached to its prescribed set.
In the last case the surviving adjacent endpoints connect exactly those
components hit by their union. The three conditions are therefore exhaustive
and exact.

Equivalently, the parent must be at least three-connected, every parent
three-vertex separator must contain `z`, and condition 2 must hold for the
actual split. This gives a parent-only rejection before trace colorings or
ambient rows are enumerated: a parent three-cut avoiding `z` rejects every
four-connected lift.

<a id="dense-parent-connectivity"></a>
**Dense parents.** Every three-connected `(4,5)`-free graph `H` of order17
with `h>=76` is four-connected. Consequently, for such a parent, a valid
local split is four-connected exactly when

```text
|P_u|>=3 and |P_v|>=3.
```

Proof of the threshold: a three-cut leaves14 vertices. Independence numbers
add across its components and total at most4. A component of independence
number1 is a clique of order at most3; one of independence number2 has order
at most8 by `R(4,3)=9`. The only possible profiles are `(1,3)`, `(2,2)` and
`(1,1,2)`; more components cannot supply14 vertices.
For `(1,3)`, the clique component has order `r=1,2,3`; the other component is
`(4,4)`-free of order `14-r`. Each cut vertex has at most
`8+min(r,2)` neighbors outside the cut: its neighborhood in the `(4,4)`
component is `(3,4)`-free, and it sees at most two vertices of the clique.
Thus the edge caps are

```text
45+0+3*9+3=75,  40+1+3*10+3=74,  36+3+3*10+3=72.
```

For `(2,2)`, component orders are `6+8` or `7+7`. Turan's `K4`-free caps
give at most33 edges in the components. Each cut vertex has at most five
neighbors in each component by `R(3,3)=6`, giving total at most66.
For `(1,1,2)`, the orders must be `3,3,8`; component edges total at most27
and each cut vertex has at most `2+2+5=9` outside neighbors, giving at most57.
Every case has at most75 edges, proving the threshold. If `H` is
four-connected, removing at most two core vertices leaves `C-U` connected;
condition 2 above then reduces exactly to attachment sizes at least three.
Conditions 1 and 3 follow from four-connectivity of `H`.

<a id="degree-three-filter"></a>
**Forced common neighbors.** In the residual scope `delta(A)>=4`. Hence

```text
3<=d_H(w)<=13                  (w in C),
d_H(w)=3 => w in J,
w in J => d_H(w)<=12,
3<=|P_u|,|P_v|<=12.
```

Proof: substitute `s_w=d_H(w)+1_J(w)` into `4<=s_w<=13`, and use
`s_u=1+|P_u|`, `s_v=1+|P_v|`. In particular all degree-three parent
vertices must lie in `W`, form an independent set, and belong to the common
set of every permissible split. There can be at most `c<=4` of them.
Together with the forced singleton traces this can fix or reject `J` before
coloring. The accepted parameter-dependent
[interior bounds](../../interior_transfer.md) transfer by the same equations;
the residual four-connectivity floor already improves their weaker low-density
floors to four.

<a id="parent-degree-floor"></a>
**A direct order-17 degree floor.** Independently of the split, every
`(4,5)`-free order-17 parent satisfies

```text
65<=h<=69 => delta(H)>=2;
70<=h<=74 => delta(H)>=3;
75<=h<=79 => delta(H)>=4.
```

Proof: for a vertex of degree `s`, its neighborhood is triangle-free and
its missed core is `(4,4)`-free of order `16-s`. Every neighbor has at
most eight attachments to that core by `R(3,4)=9`. The edge partition gives
`h<=U(16-s)+9s+floor(s*s/4)`. At `s=0,1,2,3`, the recorded maxima
`U(16),U(15),U(14),U(13)=60,55,50,45` give caps `60,64,69,74`.
The residual parent already has minimum degree at least three by
three-connectivity; the `h>=75` slice improves this to four and therefore
has no forced degree-three vertices.

<a id="transversal-lift"></a>
**Exact transversal test.** Every independent four-set of the lift is
one of

```text
I4 in C;
{u} union I3 in C-P_u;
{v} union I3 in C-P_v.
```

For a proposed hitting set `Z subset A`, put `Z_C=Z intersect C`. It hits
all these sets exactly when

```text
C-Z_C is I4-free;
if u not in Z, C-(Z_C union P_u) is I3-free;
if v not in Z, C-(Z_C union P_v) is I3-free.
```

Thus `tau_4(A)>=3` has an exact finite test over `|Z|<=2`, using16 core
vertices and the endpoint flags. In particular `C` must contain an `I4`,
or `{u,v}` would be a transversal. For each B column use the same test with
`Z=S_b union {u if alpha_b} union {v if beta_b}`. A test of `tau_4(H)` alone
need not be equivalent: contraction can remove original independent
four-sets. Lower bounds on the parent do imply useful lower bounds on
the lift, as follows.

<a id="dense-parent-transversals"></a>
**Dense parent transversal bounds.** Every valid local split satisfies
`tau_4(A)>=tau_4(H)`. Any original I4-transversal has an image under the
contraction that hits all parent I4s: a parent independent four-set missing
that image lifts to an original independent four-set missing the original
transversal. If it uses `z`, all its other vertices lie in `D` and either
endpoint supplies the lift. The image has no larger cardinality, proving
the inequality.

For a `(4,5)`-free graph of order `n` with an I4-transversal of size `r`,
the missed graph is `(4,4)`-free and each transversal vertex has at most
eight neighbors there. Hence

```text
e <= U(n-r)+8r+binom(r,2).
```

For `H` at order17, `r=1,2,3` give caps `68,72,77`. For `C` at
order16 they give `63,67,72`. Thus

```text
h>=69 => tau_4(H)>=2;
h>=73 => tau_4(H)>=3, and every valid split already has tau_4(A)>=3;
h>=78 => tau_4(H)>=4;
h-m>=64,68,73 => tau_4(C)>=2,3,4, respectively.
```

Here `U(16),U(15),U(14),U(13)=60,55,50,45` are the recorded edge
maxima. To exclude a transversal of size less than `r`, enlarge it to size
`r` and apply the same bound. The argument requires no original small-q
or saturation hypothesis.

Every actual B column projects to an I4-transversal of `H`, by the same
lifting argument. Therefore, in addition to the exact column test,

```text
|S_b|>=tau_4(C),
|S_b|+(alpha_b OR beta_b)>=tau_4(H).
```

In particular `h>=78` forces projected columns of size at least four.
At `h>=76`, once `H` is three-connected and parent validity and the exact
local inverse-split conditions hold, the original residual four-connectivity
and transversal conditions therefore reduce to the two endpoint
attachment-size tests.

## 4. Row cuts, anchors, averaging and SOS

<a id="anchor-ports"></a>
Let `ell(w)=d_H(w)+1_J(w)` on `C`, `ell(u)=1+|P_u|`, and
`ell(v)=1+|P_v|`. Enumerate original independent sets by the exact lift
predicate. The accepted [independent-row cuts](../../independent_row_cuts.md)
give, for every independent `j`-set `I`,

```text
j=2: sum_I ell>=8,   sum_I r<=26+sum_I epsilon;
j=3: sum_I ell>=12,  sum_I r<=39+sum_I epsilon;
j=4: sum_I ell>=20,  sum_I r<=48+sum_I epsilon.
```

The [independent-four anchor](../../weighted_averaging.md#claim-weighted-anchor-excess)
also gives

```text
sum_I r>=36,  sum_I ell<=32+sum_I epsilon.
```

Proof: these are the original internal independent-set degree counts and
24-column singleton-class count, with the exact lifted degrees substituted.
All constants refer to18 original vertices and24 B vertices and retain those
values. Endpoint anchors are included; each independent set uses at most one
endpoint. Restricting to actual `I4` in `C` gives cheap parent-based filters.

For nonnegative rational weights `lambda_I` on actual lifted independent
four-sets, with `sum_(I containing i)lambda_I<=1` for every original vertex,
the accepted weighted packing proof yields

```text
E_A >= ceil(sum_I lambda_I*(sum_I ell-32)).
```

Multiplying the preceding anchor inequalities and using nonnegative excess
proves the statement. This can reject an entire split/degree family; it does
not assert a uniform positive certificate. Original row-size17/16 pair cuts,
omission demand and tail profiles use the18 actual row occurrences including
`u,v`, with their lifted adjacency and excess. They apply unchanged through
these predicates. In particular an adjacent pair of size16 rows has union
all24 B vertices, because their intersection has size at most8. If that pair
is the contracted edge, the quotient is globally unsafe: `B` contains a `K4`
by `R(4,4)=18` and all of `B` lies in its merged neighborhood.

<a id="column-witness-ports"></a>
**Pair and triple witnesses.** Original columns are
`L_b=S_b union {u if alpha_b} union {v if beta_b}`. The accepted
[column compatibility tools](../../sos_column_compatibility.md) use

```text
C_y intersect C_t contains K3 => yt is a B nonedge;
A-(C_y union C_t) contains I3 => yt is a B edge;
triple common intersection contains an A edge => no B triangle;
triple common missed region contains an independent A pair => no B I3.
```

Here the `C_y` in these legacy formulas means the **lifted column** `L_y`,
not our core graph `C`. Compute every witness with
[the exact induced-subset predicate](#homogeneous-lift): intersect or unite
core masks and intersect the corresponding endpoint availability bits.
For missed regions, an endpoint is available exactly when every involved
column misses it. This preserves every original witness, including those
using one or both split endpoints. Witnesses on a contracted column alone
need not be sound for the lift.

The B-side of the original weighted random-order and Goodman/SOS arguments
is unchanged. For example six column occurrences still require at least two
open triples. For all24 columns, if `O` contains all still possible B triangles
and B independent triples, the original bounds become

```text
|O| >= 440 + sum_b eta_b*(eta_b+1)/2,
eta_b=max(0,6-gamma_b,gamma_b-13),
|O| >= ceil(437+(b-138)^2/12).
```

Proof: the witnesses just established are exactly the original sound
prohibitions. `B`, its degrees and its24 column occurrences are unchanged;
the original allowed degree interval is `[18-gamma_b,24-gamma_b]`. The
accepted Goodman identity and degree-interval minimization therefore apply
verbatim. Use the original `gamma_b`, including the common-endpoint bit,
when computing the interval. The weighted random-order inequalities likewise
retain caps4 and3 on their two forced-pair graphs. No quotient `K5`-freeness
is needed. Higher-order finite-moment or cell tools can be transported by the
same exact witnesses, subject to each source's additional hypotheses and
review state; this is not a new certificate of their universal success.

<a id="quadratic-ports"></a>
**Quadratic interface bounds.** All four original cuts remain valid with
the lifted incidence `X=y+k`, lifted edges `a=h+1+c`, and original missing
incidences `Z=432-y-k`:

```text
X*X/24-4X <=64(h+1+c),
X*X/18-3X <=78b,
Z*Z/24-3Z <=78(152-h-c),
Z*Z/18-4Z <=64(276-b).
```

There are also two direct order-17 cuts valid in the entire locally
reducible branch. With `Z'=408-y`,

```text
Z'*Z'/24-3Z' <=78(136-h),
Z'*Z'/17-4Z' <=64(276-b).
```

The two positive-incidence direct cuts retain marked corrections:

```text
y*y/24-4y <=64(h-m)+8e_G(W,T),
y*y/17-3y <=78b+6(e_B(R_u-R_v,R_v-R_u)-e_B(K)).
```

Proof of all cuts: a graph with independence number at most `r` has at least
`(n*n/r-n)/2` edges by the complementary Turan bound. Apply this on each
column or row support, sum, and use Cauchy-Schwarz on support sizes. For
the original positive cuts, an A edge has at most eight common B neighbors
and a B edge has at most13 common A neighbors; for the original missing
cuts, an A nonedge has at most13 common missed B vertices and a B nonedge
has at most eight common missed A vertices. These capacities follow from
`R(3,4)=9` and `R(3,5)=R(5,3)=14` on the corresponding supports.

For the direct missing cuts, `alpha(F)<=4`, `H` remains `K4`-free, and
`B` remains `K5/I4`-free. A parent nonedge still has at most13 common
missed B vertices, since an independent triple there together with the
nonedge would give `I5` in `F`. A B nonedge's common missed H vertices
have no `I3` and no `K4`, hence number at most eight. The same support
counts use17 rows,24 columns and136 possible internal parent pairs.

For the first corrected positive cut, parent edges within `C` still have
at most eight common B neighbors; summing the intersections on the `m`
edges incident with `z` gives exactly `e_G(W,T)`. For the second, a
B-edge's common parent column count differs from its original count by
`+1` between the two exclusive endpoint rows and `-1` within `K`.
Summing gives `13b+e_B(R_u-R_v,R_v-R_u)-e_B(K)` as an upper bound.
The support lower bounds yield the displayed coefficients8 and6. If the
quotient is globally safe, the ordinary uncorrected order-17 positive cuts
also hold. Global safety is unnecessary for the direct missing cuts.

## 5. The globally safe alternative is much narrower

<a id="ambient-safe-filters"></a>
These inequalities distinguish a useful family before attempting a full
Ramsey42 parent search. Write `e=epsilon_u+epsilon_v`. In every valid original
completion, regardless of global contraction safety,

```text
0<=k<=8,  c+k<=12,
m+c+rho+k=32+e,  m+rho>=20+e.
```

Proof: the intersection `B[K]` is triangle-free because `uv` is an edge,
and it is `I4`-free as a subset of `B`, so `k<=8`. The full common
neighborhood of `u,v` is `{p} union J union K`; it is `(3,5)`-free, giving
`1+c+k<=13`. Sum the endpoint degrees
`d_G(u)=2+|P_u|+r_u` and `d_G(v)=2+|P_v|+r_v` to obtain the identity.
The final inequality follows from `c+k<=12`.

If and only if the global external union
`G[{p} union W union T]` is `K4`-free, `F` is a full `(5,5)`-free graph.
In that alternative this external union is `(4,5)`-free, so

```text
m+rho<=23,
9+e<=c+k<=12,
e<=3,  c>=1+e,
21+e<=d_F(z)=1+m+rho<=24,
11+e<=e(G)-e(F)=2+c+k<=14.
```

Proof: `R(4,5)=25` bounds the external union by24 vertices. Combine with
the preceding endpoint-degree identity; `k<=8` gives `c>=1+e`.
Ambient edge loss is the contracted edge plus its `1+c+k` duplicate
incident edges. These prove all bounds. They are necessary, and the actual
`K4`-free union test is still required for sufficiency.

In the residual scope this leaves the following necessary common-set profiles:

| Local common order `c` | Maximum combined endpoint excess `e` | Required cross codegree `k` |
| --- | --- | --- |
| 0 | No globally safe lift | — |
| 1 | 0 | 8 |
| 2 | 1 | `7+e <= k <=8` |
| 3 | 2 | `6+e <= k <=8` |
| 4 | 3 | `5+e <= k <=8` |

Together with `a=h+1+c<=81`, this yields `e<=79-h` for globally safe
residual lifts. At `h=79`, necessarily `c=1`, `a=81`, `e=0` and `k=8`;
at `h=78,77` the endpoint excess is at most1,2. These restrictions rule out
whole proposed inverse-split families. They do not remove the complementary
locally safe but globally unsafe families from d18cr.

## 6. Fixed-B completion, recursive obligations and symmetry

<a id="interface-adapter"></a>
The [split-aware adapter](split_interface.py) accepts a marked parent and
its two local attachments. It retains16 singleton rows and two endpoint
rows and uses the accepted [recursive obligation engine](../recursive_ramsey.md).
For a supplied set of fully assigned rows, its B-state contains exactly

```text
no K5 on B, no I4 on B;
for each original A clique Q, 1<=|Q|<=3:
  no K_(5-|Q|) on intersection_(i in Q) R_i;
for each original A independent set I, 1<=|I|<=4:
  no I_(5-|I|) on B-union_(i in I) R_i.
```

The homogeneous sets are enumerated by the split predicate, including `uv`
and triangles `uvw` with `w in J`. For instance `uv` forbids a triangle
on `K`, and `uvw` forbids an edge on `K intersect R_w`. A threshold-one
independent obligation forces its missed region to be empty. These are exactly
the [original fixed-B conditions](../../fixed_b_extensions.md#claim-fixed-b-exact-extension)
and cover every mixed forbidden five-set by the sizes of its A and B parts.
They require no `K4`-free condition on the union row `T`.

Original degree, cross-edge and B-edge budgets are linear in the actual
18 row occurrences. They can be retained by the existing recurrence without
substituting a union-row degree. State differentiation, overlapping Ramsey
capacities and antichain memoization carry over unchanged because the future
labels and the fully assigned row masks have the same meaning. This ports the
operational recurrence, not a completed enumeration of all starting parents.

For a supplied parent/split, the main entry points are

```python
layout = split_parent(parent, z, P_u, P_v)
initial = initial_state(layout, degree_window=True, cross_interval=(139, 279))
kernel = rectangle_kernel(layout, rows, b_size=24)
budgeted_kernel = recurrence_kernel(
    layout, rows, b_size=24, degree_window=True, cross_interval=(139, 279)
)
```

`rows` maps every label in `layout.vertices` to a 24-bit B mask. The
initializer has fixed internal A/root pairs and both original endpoint
degree budgets. The direct kernel has only homogeneous-set obligations;
the recurrence kernel also retains differentiated optional linear budgets.
Constructing either state launches no solve. The layout validates connected
local `(4,5)`-freeness and the safe split, but callers must separately enforce
the residual edge slice, four-connectivity, transversal bound and selected
root. A fixed B graph is handled by evaluating the obligations or appending
its fixed pairs to the state; this adapter is not a complete row generator.

The complete complemented order-24 census remains the same outer cover for
the [fixed-B tools](../../fixed_b_extensions.md). Their row domain, forced
pairs, at-most-two actual row multiplicity, mixed occupancy and exchange-ball
capacities still apply to18 original occurrences. In particular a separable
row cut `sum_(i in A) L(R_i)<=M` becomes exactly

```text
sum_(w in C) L(R_w)+L(R_u)+L(R_v)<=M.
```

This is an exact reuse of the original family predicate, with its original
premises; no single `L(T)` substitutes for the two endpoint contributions.

<a id="symmetry-and-selectors"></a>
**Symmetry.** With a marked parent fixed, use automorphisms preserving `z`
and transporting both attachment masks; endpoint exchange also exchanges
`P_u,P_v` and `R_u,R_v`. After fixing a particular split, retain only the
subgroup preserving its unordered attachment pair and the marked edge
`{u,v}`, together with all existing decorations and budgets. A permutation
carrying the attachments to a different split transports the entire state
rather than identifying it while holding the attachments fixed. Fixed-B
row actions obey the same marked-edge restriction. The original column-occurrence multiset argument
remains applicable when columns are the full lifted masks `L_b`, with
duplicates retained. Equal contracted columns can have different endpoint
bits and cannot automatically be merged. The accepted fixed-B row
multiplicity bounds count18 actual rows; duplicate union masks do not
satisfy those same bounds merely because they coincide.

Proof: every permitted permutation is an isomorphism of the represented
original rooted graph and transports every constraint. A column's endpoint
bits affect its original adjacencies and may affect witnesses; quotient
equality alone is insufficient. These are coverage-preserving group actions,
without an implemented canonical parent generator.

**Selected root and conditional tools.** The original selector remains

```text
for every t in V(G), d_G(t)=18 => e(G[N_G(t)])<=h+1+c.
```

Evaluate it on the lifted graph. A vertex of quotient degree17 can lift
to degree18; a quotient degree18 vertex can lift to degree19. The eligible
root set is therefore determined by lifted degrees. Density rerooting and
companion-root tools survive with their original root and excess hypotheses,
not with a new selector over quotient degree17 vertices. Saturation,
zero-excess, small-q and small-total-excess tools retain their stated
preconditions. Residual `q>=4` means that original `q=0,1` augmentation
and frontier templates are not available as generic residual assumptions.

## 7. Operational use and remaining work

<a id="operational-order"></a>
A complete implementation can apply the ports in this order:

1. Generate marked local parents with `65<=h<=79`, triangle-free `W`,
   the accepted `(3,5)/(4,4)` side decomposition and residual parent bounds.
   Reject parents failing the three-cut restriction or lacking `I4` in `C`.
2. Enumerate independent common sets containing forced singleton traces
   and degree-three vertices. Apply `70<=h+1+c<=81` and trace coloring.
3. Check the exact four-connectivity and transversal predicates on each
   split. For `h>=76`, use only the two attachment-size conditions for
   four-connectivity. Apply original interior-degree and anchor budgets.
4. Generate the18 actual B rows, use the translated scalar corridor and
   all pair/triple/averaging/SOS filters, and compile the exact B obligations.
5. In the globally safe alternative, apply the common-set/excess profile
   table and the actual global union test. For locally-only reductions,
   retain the exact split-aware original completion constraints.
6. Check original root selection and every inherited branch condition.
   Supply complete input coverage and independently check any exclusion DAG.

Raw local internal variables decrease from153 to136. The original interface
still has `18*24=432` adjacency bits when both endpoint rows are free. A
union-row encoding has408 bits plus endpoint-distribution data and does not
give an automatic24-bit saving. Once the parent, split and all A rows are
fixed, the residual B phase has276 internal edge variables, as in the
original recurrence. Variable savings and runtime gains require a particular
family-generation/solver architecture; the safe contraction alone does not
provide an end-to-end complexity bound.

The ports provide operational predicates and an exact adapter for supplied
parents/splits. Complete parent and side-row generation, canonical marking,
production propagation and an order-43 coverage proof remain separate work.

<a id="review-record"></a>
## Independent review and validation

The final retained mathematical statements and adapter are accepted on the
following distinct-review scopes. No author accepts their own contribution.

| Scope | Independent reviewer | Outcome |
| --- | --- | --- |
| Sections1,2,4,5,6,7 and the direct parent degree floor | port_structure, distinct from the numerical, lifting and adapter authors | Accepted |
| Exact connectivity, 76-edge threshold, forced degree-three membership, exact transversal and dense transversal bounds | port_budgets, distinct from structural author port_structure | Accepted |
| Global safety, lifting, obligation coverage and marked symmetry/selector transport | port_budgets, also checked by port_structure | Accepted |
| `split_interface.py` and `validate_split_interface.py` fixed-input semantics | port_structure, distinct from author force_safe_reductions | Accepted |

For the mathematical review, port_structure independently rederived all
eight quadratic bounds with the proper18- or17-row denominators, verified
the exact positive-incidence corrections, and checked the degree caps
`60,64,69,74`, the original scalar/anchor/SOS constants and global-safe
excess table. port_budgets checked all endpoint and deleted-set cases,
separator profiles and caps `75,66,57`, exact transversal images and caps
`68,72,77` and `63,67,72`, every mixed forbidden five-set, the original
selected-root predicate and marked-edge stabilizers. Root also independently
checked the structural cases and source edge maxima before integration.

Two clarity repairs were requested and retained: the combined dense-parent
shortcut explicitly requires three-connectivity of `H`, and symmetry after
fixing a split uses its marked-edge/attachment stabilizer. There are no
outstanding review changes. External catalogue completeness and source
extrema remain declared premises, without recertification.

The adapter reviewer checked its split validation, every zero/one/two-endpoint
clique case, independent endpoint case, root obligation, label shift and
budget derivative against the existing engine. Separate direct ambient
checks on132 tiny split/row families and8,448 graphs found no mismatch.
These independent checks are separate from the author's retained
[validation driver](validate_split_interface.py), run with

```sh
python research/n43/d18/c/d18cr/validate_split_interface.py
```

That driver checks864 tiny row families and5,152 full ambient graphs against
the direct homogeneous-set definition and the accepted recurrence. It also
checks cross-budget equality/failure, threshold-one failures, and exact
reconstruction of a supplied residual18-vertex local example. Its degree
initializer creates43 budgets without running the order-43 recurrence.
The local-safe/global-unsafe fixture has63 original B completions versus62
after a naive union-row restriction, demonstrating the required coverage
distinction. All retained validation checks pass.

Acceptance covers these mathematical predicates and exact supplied-input
semantics. The adapter does not itself enforce the residual edge/connectivity/
transversal slice or root selector; callers must do so. No complete parent
generation, timing improvement, certified order-43 exclusion DAG or branch
closure follows from these checks.

## Changelog

- Ported degree, edge/excess, independent-row, anchor, column witness,
  averaging/SOS, fixed-B and recursive-obligation tools using exact split data.
- Added exact four-connectivity and transversal predicates, a 76-edge
  four-connectivity threshold, dense parent degree/transversal thresholds,
  and forced common-neighbor degree-three filters.
- Derived direct order-17 quadratic omission cuts and marked corrections
  for the positive-incidence cuts, including globally unsafe local quotients.
- Added necessary endpoint-excess/common-set profiles for globally safe
  ambient contractions while retaining all locally-only reducible families.
- Specified split-aware symmetry, original root selection, and the limits
  of raw variable savings and uncompleted parent coverage.
- Integrated distinct acceptance of all retained theorem ports and the
  endpoint-preserving adapter, including the global-unsafe semantic fixture.
