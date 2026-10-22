# Arithmetic of Paley-17 and attachment restrictions

Date: 2026-10-21. Task: `paley-arithmetic-20261021`.
Author and self-checker: /root, working alone.

All new claims below are **ready for independent review**, with search use
**none until review**. Exact fixed-core computations have two implementations
but no independent author review or Lean formalization. No novelty claim is
made. The [session report](../research/reports/2026-10-21-paley17-arithmetic.md) records
commands, scope, checks and artifacts.

## Setting and applicability

Fix H=Paley-17 on F_17. Write chi(0)=0 and let chi(x) be 1 for nonzero
squares and -1 for nonsquares. Adjacency is chi(y-x)=1. Put

```text
Q = {1,2,4,8,9,13,15,16},
N = {3,5,6,7,10,11,12,14},
K = {1,4,13,16}, the subgroup of fourth powers.
```

These results are standalone arithmetic or conditional statements about
extensions of this specified H. Applying them to every member of R(4,4,17)
uses the published unique-core classification as an additional external
premise. This session does not recertify that classification. Existing
[census-free SRG proofs](../research/n43/d18/large_row_extensions.md#claim-seventeen-codegree-moments)
supply some of the same character-matrix identities for an arbitrary 17-core,
but the exact signature classification below specifically uses Paley labels.

For extension statements, H and T are disjoint, |T|=7, and H+T is
K5/I4-free. Set

```text
W_t = V(H)-N_H(t),  P_t = V(H)-W_t,
p = e(H,T) = 119-sum_t |W_t|.
```

No 43-vertex graph is needed for these one-side restrictions. In the K1
specialization they apply separately to C+T and D+T, if the cores are
identified with Paley-17 on the retained classification premise.

<a id="claim-paley-ap-obstructions"></a>
## 1. Every homogeneous triple is an arithmetic progression

Claim ID: `docs/paley17_arithmetic.md#claim-paley-ap-obstructions`
Kind: local-deduction
Review state: ready
Scope: the specified Paley-17, distinct vertices and nonzero progression step
Dependencies: explicit residues; existing SRG(17,8,3,4) parameters
Conclusion: all triangles/independent triples and their pair completions below
Search use: none pending review; proposed exact propagation/encoding
Reviews: none

Since chi(-1)=chi(2)=1, every nonconstant progression
`{b-a,b,b+a}` is a triangle if a is square and an independent triple if a
is nonsquare. There are 68 distinct progressions of each kind: the center is
unique in characteristic 17 and the steps a,-a define the same triple.
An 8-regular core with adjacent codegree 3 has `68*3/3=68` triangles;
its complement has 68 as well. Thus the progressions exhaust all homogeneous
triples, rather than merely supplying some of them.

There is also an explicit pair-to-obstruction correspondence. Write distinct
endpoints as `x=b-a`, `y=b+a`. Because chi(2)=1, their edge status is
chi(a). Directly normalizing an edge to (0,1), its common neighbors are
`{2,9,16}`. Transporting by the affine square automorphisms gives

```text
If xy is an edge: common H-neighbors = {b-3a,b,b+3a}, an independent triple.
If xy is a nonedge: common H-nonneighbors = {b-3a,b,b+3a}, a triangle.
```

The second line follows by a nonsquare multiplier, which maps H to its
complement. This uses chi(3)=-1; the formula can also be checked by
normalizing a nonedge to (0,3), whose common antineighbors are {6,10,14}. Every triangle of step d is therefore the
common antineighborhood of the unique nonedge with endpoints `b +/- d/3`;
`3^(-1)=6 mod17`. The correspondence between nonedges and triangles is a
bijection, as is the correspondence between edges and independent triples.

**Attachment use.** A legal W_t contains no nonsquare-step progression.
If W_t contains a nonedge `b +/- a`, then t must meet all of
`{b-3a,b,b+3a}`: omitting one of those vertices would create I4.
Two outside vertices cannot both omit that nonedge: if adjacent, the
associated triangle makes K5; if nonadjacent, the omitted pair makes I4.
This recovers the accepted
[nonedge packing lemma](../research/n43/d18/k1/cross_core.json) with explicit modular
arithmetic witnesses for every forced edge or contradiction.

For an outside edge ts, `P_t intersect P_s` must contain no square-step
progression. Thus common signatures can force ts to be a nonedge by displaying
just three residues. A T triangle has an independent common H-neighborhood;
a T independent triple has empty common W-intersection. These retain the
[exact local extension criterion](../research/n43/d18/large_row_extensions.md#claim-seventeen-extension-domain).

<a id="claim-paley-character-transform"></a>
## 2. The quadratic-character transform is an exact attachment coordinate system

Claim ID: `docs/paley17_arithmetic.md#claim-paley-character-transform`
Kind: local-deduction
Review state: ready
Scope: fixed Paley-17; arbitrary real vectors or subset incidence matrices
Dependencies: quadratic-character correlation sum; explicit residues
Conclusion: exact matrix, signature, Fourier and mixed-codegree identities
Search use: none pending review; proposed exact propagation
Reviews: none

Let S_xy=chi(y-x), A the adjacency matrix, J the all-one matrix. Then

```text
S = 2A-J+I,  S*1=0,  S^2=17I-J.
```

The correlation identity is `sum_z chi(z-x)chi(z-y)=-1` for x!=y,
and 16 for x=y. One proof substitutes z-x=(y-x)t and uses
`sum_t chi(t(t-1))=-1`. The latter sum follows by counting solutions of
`v^2=t(t-1)`: after completing the square, each nonzero factor of 1 gives
one pair of factors, so the solution count is 16. Equivalently, the existing
SRG identity `A^2=4I-A+4J` implies the displayed identity for S.

For an omission indicator f=1_W, r=|W|, set g=Sf. Integer coordinates
have a direct meaning:

```text
g_x = 2*d_W(x)-r+1_W(x),
sum_x g_x=0,
sum_x g_x^2=r(17-r),
sum_(x in W) g_x=4e(H[W])-r(r-1).
```

Consequently g_x is congruent to `r-1_W(x)` modulo 2. For r=8 the
squared norm is exactly 72; for r=7 it is 70. These are exact integer
energy constraints on signatures. They retain more information than a
uniform estimate on codegrees, although they are derived identities and
alone do not eliminate any genuine signature.

For an omission matrix F with columns f_i and size vector r,

```text
(SF)^T(SF) = 17 F^T F - r r^T.
```

This is an exact joint-signature Gram constraint: the inner product of
two transformed columns is `17|W_i intersect W_j|-|W_i||W_j|`.
It can be used with the clique-intersection restriction; it must not be
advertised as a separate feasibility classification.

The additive Fourier characters diagonalize S. On a nonzero frequency k,
the eigenvalue is `sqrt(17)*chi(k)`; the zero eigenvalue belongs to constants.
Thus A has eigenvalues 8 and `(-1 +/- sqrt(17))/2`. For subsets U,V with
sizes r,s and intersection l, the centered-vector bound is

```text
|2*1_U^T A 1_V - (rs-l)|
    <= sqrt(r(17-r)s(17-s)/17).
```

When U,V are disjoint, `1_U^T A 1_V=e(U,V)`. This general bound can be
weaker than the exact Ramsey restrictions, so the integer identities and
explicit signature classes are the more immediate tools.

For two fixed Paley cores with cross matrix M and T attachment matrices P,Q,
let r_c,c_d denote the row/column sums of M. Their ambient mixed-pair codegrees
are counted by `AM+MA+PQ^T`. Hence, entrywise,

```text
2*k_cd = r_c+c_d-2M_cd+(SM+MS)_cd+2(PQ^T)_cd.
```

This rewrites the existing mixed-pair filters in character coordinates and
allows Fourier analysis in the two core indices. It gives no permission to
assume that M is circulant or affine invariant.

<a id="claim-paley-signature-orbits"></a>
## 3. Legal one-vertex signatures form a small exact domain

Claim ID: `docs/paley17_arithmetic.md#claim-paley-signature-orbits`
Kind: local-deduction
Review state: ready
Scope: subsets W of the fixed Paley-17 containing no I3
Dependencies: explicit residues; complete 2^17-subset check in retained sources
Conclusion: count/orbit table and quartic-coset eight-signature classification
Search use: none pending review; proposed exact signature branching
Reviews: none

The explicit automorphisms `x -> ax+b` for a in Q act simultaneously on all
incident state. This subgroup has order 136; using it is sound without proving
that it is the full automorphism group. Complete enumeration of all 131,072
subsets, with two different I3 tests, gives:

| Omitted vertices r | Legal labelled W | Affine subgroup orbits |
| --- | ---: | ---: |
| 0 | 1 | 1 |
| 1 | 17 | 1 |
| 2 | 136 | 2 |
| 3 | 612 | 5 |
| 4 | 1,632 | 16 |
| 5 | 2,550 | 20 |
| 6 | 2,176 | 19 |
| 7 | 816 | 6 |
| 8 | 51 | 2 |
| **Total** | **7,991** | **72** |

The [subset results](../research/reports/2026-10-21-paley17-arithmetic/subsets.json)
retain every orbit representative, its size, edge count and orbit cardinality.
A legal single signature remains only one component of the exact local
extension criterion.

The 51 eight-signatures have especially simple arithmetic forms:

| Type | Omission set | Count | Edges / nonedges in H[W] |
| --- | --- | ---: | ---: |
| A | `b+N` | 17 | 16 / 12 |
| B | `b+a(K union 3K)`, a in {1,2} | 34 | 18 / 10 |

Here b ranges over F_17. K and 3K are quartic residue cosets; multiplication
by 2 exchanges the two distinct type-B shapes. The complete enumeration
checks that these sets are legal, distinct, and exhaust the domain. Type A
is an open antineighborhood. Type B is not an antineighborhood.

The complements of H[W] correspond respectively to the earlier triangle-free
S12 and S10 eight-types. **S11 never occurs as an induced eight-set of
Paley-17.** Indeed, a nonsquare multiplier identifies H with its complement;
an induced S11 would therefore yield a legal eight-omission with 17 edges,
absent from the exhaustive signature list. The accepted three-type theorem concerned standalone eight-vertex
graphs and did not assert that all types embed in a 17-core.

<a id="claim-paley-eight-packing"></a>
## 4. At most four outside vertices can have nine core neighbors

Claim ID: `docs/paley17_arithmetic.md#claim-paley-eight-packing`
Kind: local-deduction
Review state: ready
Scope: H+T K5/I4-free, H fixed Paley-17; any number of outside vertices
Dependencies: exact eight-signature domain; accepted core nonedge packing
Conclusion: at most four size-eight omissions; four forbid size-seven omissions;
three forbid four size-seven omissions
Search use: none pending review; proposed necessary propagation
Reviews: none

For every distinct t,s, W_t intersect W_s is a clique. Equivalently, the
sets of nonedges induced by the two omissions are disjoint. Every size-eight
omission contains a nonedge, so repetitions cannot evade this condition.

Construct the compatibility graph on all 51 eight-signatures, joining them
exactly when their induced nonedge sets are disjoint. Complete enumeration
has the following clique counts:

| Family size | Compatible labelled families | Affine subgroup orbits |
| --- | ---: | ---: |
| 0 | 1 | 1 |
| 1 | 51 | 2 |
| 2 | 561 | 6 |
| 3 | 1,292 | 11 |
| 4 | 136 | 1 |
| 5 or more | 0 | 0 |

Every compatible four-family has one type-A and three type-B omissions.
For its single affine orbit representative, no legal omission of size seven
or eight is compatible with all four. All other outside vertices therefore
have at least eleven core neighbors. Checking all eleven compatible
three-family orbits also shows that none admits four mutually compatible
size-seven omissions.

[packing.json](../research/reports/2026-10-21-paley17-arithmetic/packing.json),
[high_signatures.json](../research/reports/2026-10-21-paley17-arithmetic/high_signatures.json)
and [verify_finite.json](../research/reports/2026-10-21-paley17-arithmetic/verify_finite.json)
record the complete checks. There is no claim that four size-eight omissions
extend to a seven-cell: they do form valid four-vertex local extensions, but
more outside vertices impose additional obligations.

<a id="claim-paley-seventy-attachments"></a>
## 5. A Paley core plus a seven-cell needs at least 70 attachment edges

Claim ID: `docs/paley17_arithmetic.md#claim-paley-seventy-attachments`
Kind: local-deduction
Review state: ready
Scope: H+T K5/I4-free, H fixed Paley-17, |T|=7
Dependencies: preceding finite signature/packing claims; exact local criterion
Conclusion: `e(H,T)>=70`
Search use: none pending review; proposed necessary propagation
Reviews: none

First the packing facts prove `p>=68`. Let m be the number of size-eight
omissions. For m<=2 the total omissions are at most `49+m<=51`.
For m=3, no four size-seven omissions coexist, so the total is at most
`24+21+6=51`. For m=4 it is at most `32+18=50`. Since
`p=119-total omissions`, the stated preliminary bound follows.

At p=68, the only possible sorted omission-size profiles are

```text
(8,8,7,7,7,7,7),  (8,8,8,7,7,7,6).
```

At p=69, they are

```text
(8,7,7,7,7,7,7),
(8,8,7,7,7,7,6),
(8,8,8,7,7,6,6),
(8,8,8,7,7,7,5),
(8,8,8,8,6,6,6).
```

Choose every compatible size-eight family up to the explicit affine subgroup,
then retain every possible remaining mask satisfying disjoint nonedge resources.
This yields five retained families at p=68 and 8,371 at p=69. These counts
are a cover after normalizing the size-eight base; they are not full-family
orbit counts, and duplicate equivalent cases are harmless.

Every retained family forces an I4 in T. Specifically, for each pair t,s
whose common present core set contains a square-step progression, ts must
be absent to avoid K5. The retained
[finite certificates](../research/reports/2026-10-21-paley17-arithmetic/forced_obstructions.json)
exhibit, for every family, four T vertices with all six edges forced absent,
and the six corresponding core triangles. They also exhibit three forced
independent T vertices with a commonly missed core vertex, a second I4 witness.
No choice of T edges can repair those obstructions.

Two implementations independently regenerate the exact mask families:
one tests clique intersections; the other tests disjoint numbered nonedge
resources and nonsquare arithmetic progressions. They agree on the five and
8,371 families. A second whole-side homogeneous-subset encoding also checks
all allowed T edge assignments and finds no local extensions. This is an
exhaustive fixed-core finite deduction, not a timeout or heuristic failure.
The full sources, family lists and witnesses are retained; independent proof
review is still pending. No 43-vertex completion is constructed or excluded.

The bound 70 is not asserted sharp. Even an attachment total of 70 need not
admit T edges, satisfy the published B24 edge interval, or glue to another side.

<a id="claim-paley-k1-consequences"></a>
## 6. Conditional improvements to the K1 arithmetic envelope

Claim ID: `docs/paley17_arithmetic.md#claim-paley-k1-consequences`
Kind: local-deduction
Review state: ready
Scope: existing K1 double-core frame; both cores isomorphic to Paley-17;
published (5,4,24) edge interval 144..160
Dependencies: preceding 70-edge bound; accepted K1 budgets
Conclusion: strengthened necessary scalar restrictions below
Search use: none pending review; proposed necessary propagation
Reviews: none

Use the existing notation `p=e(C,T)`, `q=e(D,T)`, `h=e(T)`,
`r=e(C,D)`, `L=p+h`, `R=q+h`. The new local bound applies to each side:

```text
p,q>=70,
max(76,70+h)<=L,R<=92,  L+R<=168,
5<=h<=14,
70<=p,q<=87,
74<=r<=185.
```

The h upper bound follows from `p+q+2h<=168`. The r lower bound is unchanged: `min(L,R)<=84` gives
`r>=153+h-84>=74`, with equality possible in the aggregate envelope at
h=5,L=R=84. The upper bound follows from
`r<=255+h-max(L,R)`, with `max(L,R)>=70+h` for h>=6;
at h=5, `max(L,R)>=76` gives r<=184. The retained
[scalar audit](../research/reports/2026-10-21-paley17-arithmetic/scalars.json)
checks 678 (h,L,R) profiles and the stated projections.

These are projections of necessary inequalities, not graph feasibility.
The accepted exact 289-bit mixed-core completion problem remains intact.
At most four p_t can equal nine, and the same holds independently for q_t;
the size-eight signatures now have an explicit two-type domain.

<a id="claim-paley-search-design"></a>
## 7. How to use the arithmetic without losing coverage

Claim ID: `docs/paley17_arithmetic.md#claim-paley-search-design`
Kind: design
Review state: ready
Scope: fixed-core local extensions and K1 gluing
Dependencies: all preceding conditional claims
Conclusion: explicit design opportunities and retained obligations
Search use: none pending review; proposed branching and heuristic organization
Reviews: none

The most immediate use is to choose omission signatures from the 7,991-mask
domain, attach nonedge resource masks, and propagate the modular three-vertex
witnesses. Size-eight choices can be handled by the two quartic/antineighborhood
types; the compatibility graph then blocks many combinations before any
cross-core matrix is chosen. Seven-cell enumeration remains finite, with
T edge choices governed by exact progression obstructions.

Normalize one complete partial state by a single affine transformation and
then use its stabilizer for subsequent choices. For two cores, affine actions
on C and D and a simultaneous relabeling of T act on all incident blocks.
Do not independently replace each signature by one of the 72 orbit
representatives: the relative positions carry the information responsible
for the stronger bounds.

The Fourier and integer character coordinates offer a complementary way to
organize the remaining 17-by-17 matrix and its mixed codegrees. A circulant
matrix or a state invariant under translations is only a special search
subfamily. Symmetry of Paley-17 does not force symmetry of its extensions;
restricting to invariant completions has no established full-coverage use.

The useful number-theoretic gain here is explicit low-order obstruction
geometry, quartic-coset signature classes, and joint packing. Generic spectral
bounds mainly restate SRG information. No claim of novelty, certified K1
closure, or classification-free global pruning is made.
