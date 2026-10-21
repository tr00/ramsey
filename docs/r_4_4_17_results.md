# Collected repository results on R(4,4,17)

Collected 2026-10-21 from the current worktree. This is a synthesis and source
index, not a new proof or independent review. Source statements, hypotheses,
review hashes and historical artifacts remain in their original homes.

Here `R(4,4,17)` is the family of graphs on 17 vertices with neither a K4 nor
an independent four-set, not a three-parameter Ramsey number. The numerical
Ramsey number is R(4,4)=18. See [notation](notation.md).

## 1. Published baseline and existence

The [root census table](../README.md#state-of-the-art) records exactly 68
edges for every member of R(4,4,17). Its cited source is McKay–Radziszowski,
*A New Upper Bound for the Ramsey Number R(5,5)* (1992), Table 1, p. 16.
The [published-input report](../reports/2026-10-16-published-edge-bounds.md)
records direct inspection of the source table; it does not replay the census.

The [Lean premise ledger](../lean/Ramsey/Premises.lean) retains
`edges_ramsey_4_4_17_ge_68` and `edges_ramsey_4_4_17_le_68` as trusted
published axioms. The local regularity and codegree arguments below recover
68 edges without these census axioms.

Paley-17 is an explicit example recorded and checked in
[the maximality analogue script](../scripts/verify_maximality_analogues.py):
vertices are residues modulo 17, and two distinct vertices are adjacent when
their difference belongs to `{1,2,4,8,9,13,15,16}`. The historical
[analogue report](../reports/2026-10-18-b-maximality-analogy.md) records the
verification passing. This collection does not rerun it.

**Uniqueness is not a proved-here or recertified premise.** The large-row note
mentions a published unique-core census as a possible additional external
premise, but explicitly does not acquire or certify it. The accepted arguments
retain all (4,4)-free 17-cores and do not identify every core with Paley-17.

## 2. Universal structure of every 17-core

These statements apply to any `H in R(4,4,17)`, independently of an order-43
ambient graph. Their accepted source is
[seventeen-core codegrees and moments](../n43/d18/large_row_extensions.md#claim-seventeen-codegree-moments),
with an additional accepted derivation in
[cross_core.json](../n43/d18/k1/cross_core.json), claim `critical-core-srg`.

| Quantity | Exact value or structure |
| --- | --- |
| Degree of each vertex | 8 |
| Edges / nonedges | 68 / 68 |
| Common neighbors of adjacent vertices | 3, forming an independent triple |
| Common neighbors of nonadjacent vertices | 4 |
| Common nonneighbors of nonadjacent vertices | 3, forming a triangle |
| Strongly regular parameters | SRG(17,8,3,4) |
| Total codegree over unordered vertex pairs | 476 |

Regularity follows from R(3,4)=9: each neighborhood and each
antineighborhood has at most eight vertices, and their orders sum to 16.
Adjacent-pair codegrees are at most three; nonadjacent-pair codegrees are at
most four. Their sum is `17*binom(8,2)=476=68*3+68*4`, forcing equality in
every bound. This is the source's census-free argument, not a uniqueness proof.

The generic Lean theorem
`Ramsey.card_neighborSet_eq_eight_of_isRamseyGraph_4_4` lives in
[RowBounds.lean](../lean/Ramsey/theorems/RowBounds.lean).
[Core.lean](../lean/Ramsey/n43/d18/k1/Core.lean) supplies
`core_isSRGWith`, `core_nonedge_common_anti_triangle`,
`core_paircodegree_mass`, and `core_total_paircodegrees`.

### Exact subset attachment moments

For `U subset V(H)`, let `r=|U|`, `e=e(H[U])`,
`d_s=|N_H(s) intersect U|` for `s in U`, and
`h_t=|N_H(t) intersect U|` for `t outside U`. The same accepted source gives

```text
sum_(t outside U) h_t = 8r-2e,
sum_(t outside U) binom(h_t,2)
  = 4*binom(r,2)-e-sum_(s in U) binom(d_s,2).
```

Every triangle-free I4-free graph on eight vertices is one of the three
explicit graphs S10, S11, S12 in the accepted
[eight-cell classification](../n43/d18/large_row_extensions.md#claim-common-eight-classification).
They have respectively 10, 11, 12 edges. When such an eight-set occurs in H,
its attachment moments on the other nine vertices are:

| Type | Sum of attachment degrees | Sum of binomial second moments |
| --- | ---: | ---: |
| S10 | 44 | 86 |
| S11 | 42 | 81 |
| S12 | 40 | 76 |

For S10, exactly eight outside vertices have five U-neighbors and one has
four; `H-U` has degree sequence `(4,3,3,3,3,3,3,3,3)`.
The source does not claim unique attachment signatures for S11 or S12,
or that every displayed eight-type occurs inside every 17-core.

## 3. A 17-core inside a (5,4)-free 24-vertex side

Let B be K5/I4-free of order 24, H an induced (4,4)-free 17-core, and
W the other seven vertices. For `z in W`, put
`S_z=N_H(z)` and `T_z=V(H)-S_z`. The accepted
[exact extension domain](../n43/d18/large_row_extensions.md#claim-seventeen-extension-domain)
gives the following necessary and sufficient conditions for the specified
core, W graph and signatures to form such a B:

- B[W] has no K5 or I4.
- Each H[T_z] has no I3; hence `|T_z|<=8` and `|S_z|>=9`.
- For an edge zz' in W, H[S_z intersect S_z'] has no triangle.
- For a triangle Q in W, the common H-neighbor set is independent.
- For a K4 Q in W, the common H-neighbor set is empty.
- For a nonedge zz' in W, H[T_z intersect T_z'] is a clique of size at most three.
- For an independent triple in W, the common missed H-set is empty.

These are exact local conditions for B. They do not ensure extension to a
43-vertex (5,5)-free graph.

The accepted [strict seven-signature budget](../n43/d18/k1/cross_core.json)
and [seven-cell analysis](../n43/d18/k1/seven_cell.json) strengthen the conditions:
each nonedge of H is missed by at most one outside vertex, even when the
outside vertices are adjacent. Thus, for distinct t,s in W, their common
omitted core set is always a clique of size at most three, and

```text
sum_(t in W) [binom(|T_t|,2)-e(H[T_t])] <= 68.
```

An eight-vertex missed signature contains at least ten core nonedges, so at
most six outside vertices have exactly nine core neighbors. Consequently
`e(H,W)>=64`. This is a necessary lower bound; attainability is not established.
[Attachments.lean](../lean/Ramsey/n43/d18/k1/Attachments.lean) formalizes the
common-omission, nonedge packing consequence and 64-edge bound.

### Two induced 17-cores in the same B

The accepted [two-core balance claim](../n43/d18/large_row_extensions.md#claim-two-seventeen-core-balance)
applies to any two induced cores H,H' in the same (5,4)-free B24. Put
`J=H intersect H'`, `X=H-H'`, `Y=H'-H`, and `t=|X|=|Y|<=7`.

```text
|J|=17-t>=10,
d_X(j)=d_Y(j)                    (j in J),
e(J,X)=e(J,Y),  e(X)=e(Y),
d_Y(x)>=d_X(x)+1                 (x in X),
d_X(y)>=d_Y(y)+1                 (y in Y),
e(X,Y)>=2e(X)+t.
```

For t=1, the two tips are adjacent and have the same eight-neighbor set in J;
they are true twins within their union with J, without a claim about all B.
Any fixed 16-subset J is contained in at most two distinct induced 17-cores.
This bounds core subsets, not multiplicities of identical cross rows.

## 4. Uses at a degree-18 pivot of an order-43 graph

Now assume `G in R(5,5,43)`, `d_G(v)=18`, `A=N_G(v)`, `B=M_G(v)`.
A is (4,5)-free and can contain I4; B is (5,4)-free.
For `u in A`, set `R_u=N_B(u)` and `epsilon_u=d_G(u)-18`.

An actual row of size 17 induces a (4,4)-free 17-core. The accepted
[large-row note](../n43/d18/large_row_extensions.md#claim-seventeen-extension-domain)
gives `d_A(u)=epsilon_u<=6`. Every A-neighbor w of u has row size at most
15. If its row size is 15, w meets the 17-core in exactly eight vertices
and is complete to the seven outside vertices. A row-17/row-16 edge cannot
occur. A general size-17 row is not proved to have `d_A(u)=0`.

Further conditional profile restrictions are collected in
[averaging omission cuts](../n43/d18/averaging_omission_cuts.md),
[zero/one size-17 row tails](../n43/d18/tail_zero_one.md), and
[two/three size-17 row tails](../n43/d18/tail_two_three.md).
These are restrictions on the full A/B interface, not a classification of H.
The [reduction index](../n43/reductions.md) also uses regular 17-vertex
(4,4) cells at saturation boundaries.

### The K1 double-core branch

If u is isolated in G[A], the accepted
[connectivity rigidity](../n43/d18/neighborhood_connectivity.md#claim-connectivity-03)
and [K1 research](../n43/d18/k1/research.json) force the partition

```text
V(G) = {v,u} disjoint-union C disjoint-union D disjoint-union T,
|C|=|D|=17, |T|=7,
C=N(v)-{u}, D=N(u)-{v}.
```

Both roots have degree 18 and no common neighbor. Both cores belong to
R(4,4,17); root edges are exactly vu, v-C and u-D.
Both C+T and D+T are (5,4)-free B24 sides. Each root neighborhood has
68 edges, so its degree-18 neighborhood deficit is 17.

Write `r=e(C,D)`, `p=e(C,T)`, `q=e(D,T)`, `h=e(T)`, and
`E_S=sum_(z in S)(d_G(z)-18)`. Here q is an attachment edge count,
not the root neighborhood deficit. The accepted
[budget and matrix analysis](../n43/d18/k1/cross_core.json) gives

```text
r+p=153+E_C,  r+q=153+E_D,  p+q+2h=126+E_T,
e(G)=171+r+p+q+h,
W=E_C+E_D+E_T=2(r+p+q+h-216),
x_v=170+E_C,  x_u=170+E_D,
p,q>=64,
76<=p+h,q+h<=92,  152<=p+q+2h<=168,
26<=E_T<=42.
```

Each T vertex meets each core in at least nine neighbors, or at least ten
if isolated in T. Each core vertex has between two and seven T-neighbors;
its combined degree into the opposite core and T lies between nine and 15.
[seven_cell.json](../n43/d18/k1/seven_cell.json) records the complete local
homogeneous-subset obligations on both sides, nonedge packing, pair/triangle
constraints, and the census offsets `i=p+h-76`, `j=q+h-76`, with
`i,j>=0`, `i+j<=16` and T degree-deficit sum `16-i-j`.

The exact aggregate envelope in cross_core.json uses `L=p+h`, `R=q+h`:

```text
5<=h<=18,
max(76,64+h)<=L,R<=92,  L+R<=168,
153+h-min(L,R)<=r<=255+h-max(L,R).
```

Its recorded projections are `p,q in [64,87]`, `r in [74,191]`,
`W in [26,246]`, `x_v,x_u in [170,272]`, `e(G) in [400,510]`.
The 1,589 (h,L,R) profiles describe aggregate inequalities, not graph feasibility.
The same source retains explicit matrix pair-codegree and triangle/independent
triple intersection filters; those are necessary and do not replace completion.

### Exact unresolved completion

For fixed labelled cores, T graph, and attachments satisfying both side
conditions, exactly the 17-by-17 C-D matrix remains: 289 Boolean positions.
The accepted [exact partition](../n43/d18/k1/research.json) proves that all
remaining forbidden sets have the following cell counts `(C,D,T)`:

| Obstruction | Counts |
| --- | --- |
| K5 | (3,2,0), (2,3,0), (3,1,1), (2,2,1), (1,3,1), (2,1,2), (1,2,2), (1,1,3) |
| I5 | (3,2,0), (2,3,0), (2,2,1) |

On eligible internally homogeneous selections with the required fixed
T-attachments, exclude an all-one C-D rectangle for K5 and an all-zero
rectangle for I5. Together with valid fixed sides and the vertex degree
conditions this is an exact completion criterion. All labelings remain;
there is no established automatic orbit quotient or unique-core substitution.
**K1 remains open: neither a full exclusion nor a 43-vertex construction is recorded.**

## 5. Historical computations and rejected reductions

The [2026-10-19 K1 catalogue filter](../reports/2026-10-19-k1-catalogue-filter.json)
tested existence of an induced 8-regular (4,4)-free 17-row in each of 352,366
recorded B24 graphs. It retained 134,112 and rejected 218,254 (61.94%).
It found one witness per survivor, not all placements or orbits. All recorded
witness rows were checked for order, degree, clique and independence bounds;
the report includes hashes, commands and sample exhaustive keep/drop checks.
Catalogue completeness remains external. This is a necessary K1 filter,
not gluing evidence or an order-43 exclusion.
The implementation and independent checker remain in
[filter_k1.c](../scripts/filter_k1.c) and [verify_k1.py](../scripts/verify_k1.py).
The report's data paths are historical artifact locations, not an assertion
that those data files are present in the current checkout.

The draft [maximality analogue](../n43/d18/catalogue_edge_maximality.md#claim-catalogue-max-02)
records a failed normalization: at every pivot of a valid 17-core,
`e(M(v))=e(N(v))+4 in {14,15,16}`. In the complete eight-vertex (4,3)
analogue catalogue the sole K4-saturated class has 22 edges. Paley-17 has
`e(N(v))=12`, `e(M(v))=16` at each pivot. Keeping only maximal
antineighborhoods would therefore discard all valid 17-core examples.
The associated script/report record verification, but the proof note remains
draft with no independent review or pruning authority.

The new [density re-rooting note](../n43/d18/density_rerooting.md) also uses
17-core rigidity in its K1 family certificate and proposes conditional
improvements from a 68-edge K1 root to a denser degree-18 neighborhood.
It is ready for independent review and has **no accepted pruning authority**.
Its actual excess/offset hypotheses must be retained; it is not a K1 exclusion.

## New arithmetic exploration (2026-10-21; pending independent review)

The [Paley-17 arithmetic note](paley17_arithmetic.md) develops explicit
arithmetic-progression obstructions, quadratic-character/Gram identities,
and quartic-coset omission classes. Bounded exact enumeration finds 7,991
legal single omissions in 72 affine subgroup orbits, with only 51 size-eight
omissions in two orbits. Joint packing permits at most four of the latter.
A finite local check proposes the stronger bound `e(Paley17,T)>=70` for
any K5/I4-free seven-cell extension; applying it to every K1 core retains
the external unique-core classification premise. The new claims are ready
for independent review and have no pruning authority yet. Sources, complete
small case lists and checks are in the
[session report](../reports/2026-10-21-paley17-arithmetic.md).

## 6. Formalization, reviews and further source navigation

| Source | Role |
| --- | --- |
| [Large-row review](../n43/d18/review_large_row_extensions_20261017_audit.md) | Acceptance and exact reviewed body for codegrees, moments, extension domain, two-core balance and eight-cell classification |
| [K1 research review](../n43/d18/k1/review_research_20261019.json) | Double-core structure, budgets and exact eleven-obstruction partition |
| [K1 attachment review](../n43/d18/k1/review_attachments_20261019.json) | Cross-core and seven-cell claims, scope and exact hashes |
| [K1 Lean directory](../lean/Ramsey/n43/d18/k1/) | Rigidity, Core, Frame, Structure, Attachments, VertexBounds, Budgets, Totals, Parameters, Completion and Reduction |
| [Remote PB handoff](../reports/2026-10-19-k1-pb-remote-handoff.md) | Exact whole-K1/fixed-core/fixed-key encodings and required coverage; proposed runs are not completed evidence |
| [Cross-branch synthesis](../reports/2026-10-19-cross-branch-synthesis.json) | Historical connections to the wider degree-18 program |

The recorded K1 formalization passed the repository Lean gate without adding
axioms or sorries; the removed formalization reports remain in Git history. Its structural/completion theorems do not prove the open
exclusion; the global endgame still has unfinished obligations. No new Lean,
solver, catalogue, canonicalizer or graph-search run was performed for this
editorial collection. Source review states and computational limitations are
preserved rather than promoted.
