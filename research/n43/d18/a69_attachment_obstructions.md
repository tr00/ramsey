# Ambient obstructions and critical contractions at 69 edges

Date: 2026-10-21. Task: `a69-attachments-20261021`.
Author and self-auditor: Main, working alone.

Integration status (2026-10-21): all six claims were independently accepted
at reviewed-source SHA-256
`e950033e2937805086c18e59f66d2863ad0aa8132fbd1e77436e695b31541e86`.
See [the independent review](review_a69_attachment_obstructions_20261021_independent.md).
The ready labels below record the author-stage presentation; current permitted
mathematical use is the stated conditional root selection, structural branching,
and witnessed propagation. The only post-review correction adds the already
used `R(3,5)=R(5,3)=14` to the dependency metadata. No mathematical
statement or proof changed; this banner and citation additions change file bytes.

Claims are **ready for independent review**. Proposed uses are safe root
selection, structural branching, and witnessed propagation; current search
use is none. No solver, graph enumeration, catalogue, downloads, installation,
or Lean change was used. No novelty or order-43 exclusion is claimed.

This continues [the 69-edge decomposition](a69_decomposition.md). Its main
new ambient result is an unavoidable strict density improvement from every
size-two column belonging to a degree-18 vertex. Consequently a
maximum-density degree-18 root with 69 edges has no singleton columns and
at most one size-two column. The exceptional column has degree 19 and
supplies a specified asymmetric pair of critical cores. This is a
root-selection reduction, not a prohibition on arbitrary 69-edge roots.

## Setting and premise ledger

Let `G in R(5,5,43)` and `d_G(v)=18`. Put `A=N_G(v)`, `B=M_G(v)`,
`a_v=e(G[A])`, `C_y=N_A(y)`, and `epsilon_z=d_G(z)-18`.
For the slice `a_v=69`, `q_v=16` and `x_v=168+E_A`.
Notation follows [the common reference](../../../docs/notation.md).

The optional **maximum-density hypothesis** is that `a_v` is maximum over
all actual degree-18 vertices of this same `G`. It is valid for existence
coverage when that degree class is nonempty, as in
[clique augmentation](cliques_augmentation.md), Section 3. It is not imposed
on arbitrary pivots or on degree-19 destinations.

Retained premises are:

- Global degree range 18..24 and smaller Ramsey numbers `R(3,3)=6`,
  `R(3,4)=9`, `R(3,5)=R(5,3)=14`, `R(4,4)=18`, as recorded in the
  [baseline](../../../docs/mathematical_baseline.md).
- Published exact `(4,4)` edge counts 60 and 68 at orders 16 and 17,
  and the other recorded small-order intervals in the
  [root census table](../../../README.md#state-of-the-art). These retain the
  literature/computation premises of McKay--Radziszowski 1992, Table 1.
- [Independent-row pair cuts](independent_row_cuts.md#claim-independent-row-degree-cuts)
  and [opposing pair tests](independent_row_cuts.md#claim-independent-row-combined-pairs),
  used for comparison. The sharper two-root proof is given below.
- [Reviewed 17-core codegrees and attachment moments](large_row_extensions.md#claim-seventeen-codegree-moments)
  and [three eight-cell types](large_row_extensions.md#claim-common-eight-classification).
- The [69-edge core decomposition](a69_decomposition.md) is a ready,
  author-self-audited source, not an accepted premise. Every fact used from
  it is rederived below on the recorded published inputs. Its general
  higher-transversal parametrization is not needed for these results.

Literature premises are not recertified. The x137/x138 closures and ongoing
maximal-pivot lower-bound work are not dependencies.

<a id="claim-a69-overlap-two-improvement"></a>
## 1. Two nonadjacent degree-18 roots of overlap two cannot both have at most 69 edges

Claim ID: `research/n43/d18/a69_attachment_obstructions.md#claim-a69-overlap-two-improvement`  
Kind: local-deduction  
Review state: ready  
Scope: any nonadjacent degree-18 roots `v,y` with exactly two common neighbors  
Dependencies: global degrees; order-16 census; `R(3,3)=6`, `R(3,4)=9`, `R(3,5)=R(5,3)=14`  
Conclusion: `a_v+a_y>=139`; if the common neighbors are adjacent,
`a_v+a_y>=140+E_S`  
Search use: none pending independent review  
Reviews: none

Write their common neighbors as `S={u,w}`, their respective exclusive
neighbors as `C,D`, and their common nonneighbors as `Z`. Exclude the
roots from every cell. Then

```text
|C|=|D|=16, |Z|=7,
e(C)=e(D)=60,
G[C],G[D] are (4,4)-free,
G[Z] has no I3,
E_S=epsilon_u+epsilon_w.
```

For example, an `I4` in `C` extends with `y`, while a `K4` extends
with `v`. The `Z` type follows because an `I3` there extends with the
nonadjacent roots to `I5`.

Count neighborhood edges and then sum degrees on `S`:

```text
a_v+a_y = e(C)+e(D)+2e(S)+e(S,C)+e(S,D),
36+E_S = 4+2e(S)+e(S,C)+e(S,D)+e(S,Z).
```

Subtracting gives the exact identity

```text
a_v+a_y=152+E_S-e(S,Z).                            (1)
```

If `uw` is an edge, its common neighbors inside `Z` are triangle-free
(a triangle would extend with `u,w` to `K5`) and `I3`-free. Thus at
most five `Z` vertices see both `u,w`. Since every other `Z` vertex
contributes at most one incidence, `e(S,Z)<=7+5=12`. This proves
the stronger edge-case conclusion.

If `uw` is a nonedge and `E_S=0`, then both have global degree 18.
Their common-neighbor count is at most eight: among the 41 vertices
other than them, at most 13 miss both, since that cell is `(5,3)`-free
and `R(5,3)=14`; hence their neighborhood union has size at least 28,
and their overlap at most `36-28=8`. The two roots `v,y` already
contribute two common neighbors. At most six vertices of `Z` therefore
see both `u,w`, giving `e(S,Z)<=13`. Equation (1) yields 139.

If `E_S>=1`, the elementary `e(S,Z)<=14` instead gives
`a_v+a_y>=138+E_S>=139`. These cases are exhaustive.
Consequently at least one root has neighborhood edge count at least 70.
For a source with `a_v=69`, re-rooting at `y` gives `a_y>=70`, or
`a_y>=71+E_S` in the edge case. There is no small-total-excess hypothesis.

<a id="claim-a69-selected-small-columns"></a>
## 2. Maximum-density 69-edge roots have at most one small column

Claim ID: `research/n43/d18/a69_attachment_obstructions.md#claim-a69-selected-small-columns`  
Kind: local-deduction  
Review state: ready  
Scope: `a_v=69`, with the maximum-density hypothesis  
Dependencies: Claim 1; smaller Ramsey bounds; actual column transversality  
Conclusion: every column has size at least three except possibly one
size-two column; that exception has global degree 19 and B-degree 17  
Search use: none pending independent review  
Reviews: none

All columns are nonempty because `A` contains `I4` and a disjoint column
would extend it to `I5`. Also `d_B(y)<=17`: its `B`-neighborhood is
`K4/I4`-free. Thus a singleton column has global degree exactly 18,
and a size-two column has global degree 18 or 19.

Suppose `C_y={u}`. Transversality makes `A-u` a `(4,4)` 17-core with
68 edges, so `d_A(u)=1`. Put `D=N_B(y)`; it has order 17 and 68 edges.
The row of `u` in `B` has size `16+epsilon_u` and contains `y`.
Inside `B-{y}` of order 23,

```text
|N_B(u) intersect D| >= (15+epsilon_u)+17-23=9+epsilon_u,
a_y=68+|N_B(u) intersect D|>=77+epsilon_u.
```

This strictly exceeds 69 and contradicts maximum density. A size-two
column of global degree 18 contradicts Claim 1 directly. Therefore any
remaining size-two column has global degree 19 and B-degree 17.

There cannot be two such columns, even before root selection. Their
two B endpoints must be adjacent: a nonedge would require their column
union to have size at least ten, since its missed set in `A` has type
`(4,3)` and at most eight vertices. But two B-degrees 17 give at least
ten common B neighbors, whereas an edge's common B neighborhood has
type `(3,4)` and order at most eight. This is a contradiction.

It follows that a maximum-density 69-edge root has `|L_1|=0` and
`|L_2|<=1`. This strengthens actual column floors even though the isolated
neighborhood can have transversal number one or two. It does not prove
that such a maximum-density root exists or that any remaining column
collection is realizable.

<a id="claim-a69-small-column-degree-competition"></a>
## 3. An exceptional two-column controls the degrees of other small columns

Claim ID: `research/n43/d18/a69_attachment_obstructions.md#claim-a69-small-column-degree-competition`  
Kind: local-deduction  
Review state: ready  
Scope: every actual degree-18 pivot; two distinct B vertices with
`|C_y|+|C_z|<10`  
Dependencies: column union bound and common-B-neighbor bound  
Conclusion: `epsilon_y+epsilon_z<=|C_y|+|C_z|-4`, with the consequences below  
Search use: none pending independent review  
Reviews: none

The small total column size forces `yz` to be an edge. Its common B
neighbors have order at most eight, whereas inclusion-exclusion gives
at least `d_B(y)+d_B(z)-24`. Thus the degree sum is at most 32. Since
`d_B(y)=18+epsilon_y-|C_y|`, rearrangement gives the assertion.

In particular, any degree-19 size-two column is the only size-two
column, and it cannot coexist with a singleton column. Every size-three
column accompanying it has global degree exactly 18. For a pair of
size-three columns their total excess is at most two. These are
pairwise degree conditions, not assertions that small columns occur.

If the exceptional degree-19 two-column has endpoints `u,w`, every
size-three column has a degree-18 B endpoint. The two B endpoints
are adjacent, and their B-neighborhoods have at least `17+15-24=8`
common vertices. The common-neighbor B cell has order at most eight,
forcing equality and their B-neighborhood union to cover B. This is
an actual critical eight-cell of type S10, S11, or S12. No containment
relation between the two A columns follows from this count alone.

<a id="claim-a69-critical-contraction"></a>
## 4. Two-transversal neighborhoods split into critical vertex splittings or explicit local defects

Claim ID: `research/n43/d18/a69_attachment_obstructions.md#claim-a69-critical-contraction`  
Kind: local-deduction  
Review state: ready  
Scope: any pure `K4/I5`-free 18-vertex graph `A` with 69 edges and
a transversal `{u,w}`  
Dependencies: order-16 and order-17 census; `R(4,3)=9`  
Conclusion: the contraction dichotomy and explicit witnesses below are exhaustive  
Search use: none pending independent review  
Reviews: none

Put `C=A-{u,w}`, a `(4,4)` 16-core with 60 edges. Let
`P=N_C(u)`, `Q=N_C(w)`, `W=P union Q`, `J=P intersect Q`, and
`D=C-W`. Replace `u,w` by a single vertex `z` attached to `W`; denote
the resulting 17-vertex graph by `H`. This is a defined vertex identification,
including when `u,w` are nonadjacent, not an asserted minor operation.

If `uw` is an edge, `|P|+|Q|=8`, `J` is independent, and `|J|<=3`.
The graph `H` is a `(4,4)` 17-core exactly when

```text
J is empty, C[W] is triangle-free, and C[D] has no I3.       (2)
```

Indeed the second and third conditions are exactly the new vertex's
clique/independence tests. If they both hold, the order-17 edge count
forces `60+|W|=68`, so `J` must be empty; conversely (2) suffices.
Every noncritical identification therefore has either a triangle in
`W` or an independent triple in `D`. If a triangle occurs, it uses
vertices from both `P-Q` and `Q-P`, since each attachment individually
is triangle-free. These are explicit three-vertex witnesses.

If `uw` is a nonedge, `|P|+|Q|=9`, `D` is `I3`-free, and
`|W|>=8`, so `|J|<=1`. In this case:

- If `C[W]` is triangle-free, then `H` is a critical 17-core and
  `|W|=8`, `|J|=1`.
- Otherwise an actual triangle spanning both exclusive attachments
  witnesses the failure of critical identification. In particular
  disjoint attachments (`|W|=9`) always contain such a triangle.

The nonedge case has no independent-triple defect in `D`; its only
retained defect is a witnessed mixed triangle in the attachment union.
No such defect is asserted to be an ambient contradiction on its own.

In either critical identification, let `L` be the eight degree-seven
vertices of `C`, and `U` its eight degree-eight vertices. Regularity
of the 17-core forces

```text
W=L,
C[L] is the cubic S12 eight-cell,
C[U] is the complement of S12,
every vertex has four neighbors across L,U.
```

Here the 17-core has edge codegree three. For a neighbor `c` of `z`
this gives three neighbors within `L`; for a nonneighbor in `U`,
codegree four gives four neighbors in `L`, leaving four in `U`.
The three-type eight-cell classification then identifies the cubic type
as S12. Thus critical vertex splitting has a specified eight-plus-eight
core structure, with no uniqueness premise for the 17-core.

<a id="claim-a69-sixteen-core-moments"></a>
## 5. A 16-core has only five possible triangle counts and a fixed codegree-deficit budget

Claim ID: `research/n43/d18/a69_attachment_obstructions.md#claim-a69-sixteen-core-moments`  
Kind: local-deduction  
Review state: ready  
Scope: every `(4,4)`-free graph `C` on 16 vertices  
Dependencies: degree profile; Mantel; `R(3,4)=9`; Goodman identity  
Conclusion: the exact partition and moment constraints below hold  
Search use: none pending independent review  
Reviews: none

The degree-seven and degree-eight sets `L,U` each have eight vertices.
Writing `b=e(C[L])`, degree sums give

```text
e(C[U])=b+4,
e_C(L,U)=56-2b.
```

A neighborhood of a degree-seven vertex is triangle-free, `I4`-free,
and has maximum degree at most three, so has at most ten edges. A
degree-eight neighborhood has at most twelve edges. Therefore
`3 triangles(C)<=8*10+8*12=176`, giving at most 58 triangles.
The complement has the same degree profile and the same upper bound.
Goodman's identity gives

```text
triangles(C)+|mathcal I_3(C)|
  =binom(16,3) - (1/2)sum_c d_C(c)(15-d_C(c))
  =560-448=112.
```

Consequently both counts lie in `54..58`. If
`f_c=10` on degree-seven vertices and `12` on degree-eight vertices,
the nonnegative integer neighborhood defects satisfy

```text
sum_c [f_c-e(C[N_C(c)])]=176-3 triangles(C) in {2,5,8,11,14}.
```

There is also an exact codegree slack budget. For an edge set
`cap(c,c')=3`; for a nonedge set
`cap(c,c')=d_C(c)+d_C(c')-11`. Every codegree is at most this cap:
an edge's common neighborhood is independent of size at most three;
a nonedge's common nonneighborhood is a clique of size at most three,
and its order is `14-d_C(c)-d_C(c')+codegree(c,c')`.
Using the displayed eight-plus-eight edge partition gives

```text
sum_(unordered pairs) cap(c,c')=416,
sum_(unordered pairs) codegree(c,c')=8*binom(7,2)+8*binom(8,2)=392,
sum_(unordered pairs) [cap(c,c')-codegree(c,c')]=24.
```

These constraints hold in both the critically identifiable and defective
attachment families. They limit simultaneous core configurations without
enumerating or asserting a finite isomorphism list. The earlier sufficient
`I3` range `52..60` is sharpened here to `54..58`.

<a id="claim-a69-exceptional-column-core"></a>
## 6. The remaining size-two column has paired cores and forced low-degree attachments

Claim ID: `research/n43/d18/a69_attachment_obstructions.md#claim-a69-exceptional-column-core`  
Kind: local-deduction  
Review state: ready  
Scope: actual `a_v=69`, an actual column `C_y={u,w}` with `d_G(y)=19`  
Dependencies: core censuses; global degrees; smaller Ramsey numbers  
Conclusion: the paired-core model, endpoint excess bounds, and critical
eight-cell forcing below are necessary  
Search use: none pending independent review  
Reviews: none

Set `g=1[uw edge]`, `C=A-{u,w}`, `D=N_B(y)`, and
`Z=B-(D union {y})`. Then `C,D` are actual `(4,4)` cores, and

```text
|C|=16, e(C)=60,
|D|=17, e(D)=68,
|Z|=6, G[Z] has no I3,
d_A(u)+d_A(w)=9+g.
```

For an endpoint `t in {u,w}` write `s_t=d_A(t)` and
`b_t=|N_D(t)|`. The set `N_D(t)` is triangle-free because `ty` is an
edge and a triangle there would give `K5` with `t,y`. It is `I4`-free
as a subset of `D`, so `b_t<=8`. Inclusion-exclusion in `B-{y}` gives

```text
b_t >= (16+epsilon_t-s_t)+17-23=10+epsilon_t-s_t,
epsilon_t<=s_t-2.                                  (3)
```

Thus the two endpoints have internal degree at least two. A size-two
degree-19 column cannot contain a leaf, and an endpoint of internal
degree two necessarily has global degree 18. If `s_t=2`, all of (3)
are equalities: `b_t=8`, and `t` is adjacent to all six vertices of
`Z`. In that case `D[N_D(t)]` is one of S10,S11,S12. Its nine-vertex
complement in the 17-core has the exact moment pairs `(44,86)`,
`(42,81)`, or `(40,76)` respectively, from the reviewed 17-core moments.
These constrain the same core and attachments, not separately chosen cells.

Let `E_T=epsilon_u+epsilon_w`, `b=b_u+b_w`, and `h=e({u,w},Z)`.
Degree sums on the two endpoints give

```text
b+h=23-g+E_T,
b<=16,
h<=12.
```

For an edge `uw`, their common neighbors in `Z` are triangle-free and
`I3`-free, hence number at most five; thus `h<=11`. Consequently
`E_T<=5` in both cases: `b+h<=27` for `g=1`, and at most 28 for
`g=0`. This improves the immediate sum bound from (3) in the edge case.

The neighborhood of the degree-19 vertex is also dense. Repeating the
two-root degree sum with the unequal exclusive cores gives

```text
e(G[N_G(y)])=91+E_T-h,
e(G[N_G(y)])>=80+E_T  if uw is an edge,
e(G[N_G(y)])>=79+E_T  if uw is a nonedge.
```

The destination has degree 19 and is therefore not silently treated as
a degree-18 re-rooting option. Its paired cores, endpoint excess budget,
and forced eight-cell when an endpoint has degree two remain restrictions
on every such completion. Maximum-density root selection is not needed
for this claim; it is needed only to make this the sole small-column
possibility of Claim 2.

## Outcome and remaining target

The most consequential new exclusion is local and unconditional: two
nonadjacent degree-18 roots with overlap two cannot both have neighborhood
edge count at most 69. It turns any degree-18 size-two column at a 69-edge
root into a strict move out of this slice. The maximum-density 69-edge
case therefore has no singleton column and at most one two-column,
with the exceptional asymmetric paired-core structure of Claim 6.

For isolated two-transversal neighborhoods, Claim 4 divides the systems
into vertex splittings of a critical 17-core and actual three-vertex
defects. These defects are not branch closures. Claim 5 restricts every
16-core without a uniqueness census.

All large-column completions, the exceptional degree-19 column, and the
higher-transversal families remain open. Independent review must precede
use as certified branching or propagation. No exhaustive completion
search or search-speed improvement is claimed.
