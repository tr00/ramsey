# Arithmetic of Paley-17 and attachment restrictions

Date: 2026-10-21. Task: `paley-arithmetic-20261021`.
Author and self-checker: /root, working alone.

All claims below are **accepted** after independent review (Main, 2026-10-27;
inline review record near the end of this file). Search use is permitted as
stated per claim: exact necessary-condition propagation only, never
sufficiency, termination, or coverage replacement. No novelty claim is
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
rests on the accepted in-repo core classification
[research/foundations/paley17_uniqueness.md](../research/foundations/paley17_uniqueness.md)
(accepted 2026-10-27; Lean `Ramsey.n17.isomorphic_paley17`), which supersedes
the previously unacquired published unique-core census; no external premise
is retained. Existing
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
specialization they apply separately to C+T and D+T: both cores are Paley-17
by the accepted core classification, so no further premise is retained.

<a id="claim-paley-ap-obstructions"></a>
## 1. Every homogeneous triple is an arithmetic progression

Claim ID: `docs/paley17_arithmetic.md#claim-paley-ap-obstructions`
Kind: local-deduction
Review state: accepted
Scope: the specified Paley-17, distinct vertices and nonzero progression step
Dependencies: explicit residues; existing SRG(17,8,3,4) parameters
Conclusion: all triangles/independent triples and their pair completions below
Search use: permitted as stated (2026-10-27 review); proposed exact propagation/encoding
Reviews: Main 2026-10-27 (independent; see review record)

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
Review state: accepted
Scope: fixed Paley-17; arbitrary real vectors or subset incidence matrices
Dependencies: quadratic-character correlation sum; explicit residues
Conclusion: exact matrix, signature, Fourier and mixed-codegree identities
Search use: permitted as stated (2026-10-27 review); proposed exact propagation
Reviews: Main 2026-10-27 (independent; see review record)

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
Review state: accepted
Scope: subsets W of the fixed Paley-17 containing no I3
Dependencies: explicit residues; complete 2^17-subset check in retained sources
Conclusion: count/orbit table and quartic-coset eight-signature classification
Search use: permitted as stated (2026-10-27 review); proposed exact signature branching
Reviews: Main 2026-10-27 (independent; see review record)

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
Review state: accepted
Scope: H+T K5/I4-free, H fixed Paley-17; any number of outside vertices
Dependencies: exact eight-signature domain; accepted core nonedge packing
Conclusion: at most four size-eight omissions; four forbid size-seven omissions;
three forbid four size-seven omissions
Search use: permitted as stated (2026-10-27 review); proposed necessary propagation
Reviews: Main 2026-10-27 (independent; see review record)

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
Review state: accepted
Scope: H+T K5/I4-free, H fixed Paley-17, |T|=7
Dependencies: preceding finite signature/packing claims; exact local criterion
Conclusion: `e(H,T)>=70`
Search use: permitted as stated (2026-10-27 review); proposed necessary propagation
Reviews: Main 2026-10-27 (independent; see review record)

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
The full sources, family lists and witnesses are retained; independent
review completed 2026-10-27 (accepted). No 43-vertex completion is
constructed or excluded.

The bound 70 is not asserted sharp. Even an attachment total of 70 need not
admit T edges, satisfy the published B24 edge interval, or glue to another side.

<a id="claim-paley-k1-consequences"></a>
## 6. Conditional improvements to the K1 arithmetic envelope

Claim ID: `docs/paley17_arithmetic.md#claim-paley-k1-consequences`
Kind: local-deduction
Review state: accepted
Scope: existing K1 double-core frame; both cores isomorphic to Paley-17;
published (5,4,24) edge interval 144..160
Dependencies: preceding 70-edge bound; accepted K1 budgets
Conclusion: strengthened necessary scalar restrictions below
Search use: permitted as stated (2026-10-27 review); proposed necessary propagation
Reviews: Main 2026-10-27 (independent; see review record)

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
Review state: accepted
Scope: fixed-core local extensions and K1 gluing
Dependencies: all preceding conditional claims
Conclusion: explicit design opportunities and retained obligations
Search use: permitted as stated (2026-10-27 review); proposed branching and heuristic organization
Reviews: Main 2026-10-27 (independent; see review record)

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

## Independent review record

Reviewer: Main, 2026-10-27. The author of this note is /root, so the
reviewer is distinct. Method: independent finite reimplementation from the
displayed statements; the author's retained artifacts and check code were
not consulted for any verdict. All checks are exact finite computations
over the specified Paley-17 (the 2^17 subset lattice, the 68 triangles and
68 nonedges, the affine square subgroup of order 136). No solver, catalogue
scan, download, or probabilistic argument was used.

Decisive checks per claim:

- Claim 1 (`claim-paley-ap-obstructions`): exhaustive verification that the
  68 triangles are exactly the square-step progressions and the 68
  independent triples exactly the nonsquare-step progressions (center
  unique, steps `a` and `-a` identified); the common-neighbor formula
  `{b-3a,b,b+3a}` for all 68 edges and the common-nonneighbor formula for
  all 68 nonedges; `{x,y,z}` independent for every `z` in the
  antineighbor triangle of the nonedge `xy`; and the two-vertex dichotomy
  making "compatible" (disjoint induced nonedge sets) exact: two outside
  vertices sharing a nonedge force either the K5 `Z plus {t,s}` or the I4
  `{t,s,x,y}`.
- Claim 2 (`claim-paley-character-transform`): `S = 2A-J+I`,
  `S^2 = 17I-J`, `S 1 = 0`; all four `g = Sf` identities and the parity
  congruence over 5,000 random subsets; the Gram identity
  `(SF)^T(SF) = 17F^TF - rr^T`; Fourier eigenvalues `sqrt(17)chi(k)` and 0;
  the centered-vector bound over 20,000 random pairs; and the
  mixed-codegree formula `2k_cd = r_c+c_d-2M_cd+(SM+MS)_cd+2(PQ^T)_cd`
  verified entrywise against direct common-neighbor computation in the
  accepted k1 frame for 50 random `(M,P,Q)`.
- Claim 3 (`claim-paley-signature-orbits`): independent recount of all
  131,072 subsets with a direct independent-triple test: sizes
  1/17/136/612/1632/2550/2176/816/51, total 7,991, and affine orbits
  1/1/2/5/16/20/19/6/2, total 72 — all matching the table. The 51
  eight-signatures are exactly `{b+N}` (17, 16 edges) and
  `{b+a(K union 3K)}` for `a in {1,2}` (34, 18 edges), pairwise distinct.
  No legal eight-mask has 17 edges, so the S11 non-embedding argument is
  sound.
- Claim 4 (`claim-paley-eight-packing`): recomputed compatibility graph on
  the 51 eight-signatures: clique counts 1/51/561/1292/136 and no clique of
  size 5 or 6; a single four-family affine orbit with composition ABBB; no
  legal seven- or eight-omission compatible with its four vertices; eleven
  three-family orbits, none admitting four mutually compatible sevens; and
  the representative four-family does admit a valid four-vertex T, matching
  the note's boundary statement.
- Claim 5 (`claim-paley-seventy-attachments`): independent exhaustion of
  every 7-omission family with `sum |W_t| >= 50` over all 30 size profiles
  with parts at most 8 and sums 50..56, not relying on the note's profile
  lists or packing shortcuts. Every profile was exhausted with zero
  complete pairwise-compatible families. The m=1 profile `(8,7,7,7,7,7,7)`
  was exhausted by two anchor runs (one type-A and one type-B eight), the
  affine group making these two representatives cover all 51 anchors; both
  completed with zero families. Soundness of the eliminations rests only
  on: pairwise nonedge-disjointness (the accepted cross-core packing lemma
  plus the claim-1 dichotomy), the resource cap of 68 core nonedges, and
  forced-obstruction certificates (a triangle in `P_t intersect P_s` forces
  `ts` absent; a K4 in the forced graph is an I4 in T; a forced independent
  triple with a common omitted core vertex is an I4). Hence no K5/I4-free
  `H+T` with `sum |W_t| >= 50` exists and `p = 119 - sum >= 70`.
- Claim 6 (`claim-paley-k1-consequences`): the 678 `(h,L,R)` profiles were
  recounted exactly, and the displayed box was re-derived from claim 5 per
  side plus the accepted `cross_core.json` budgets (`76<=L,R<=92`,
  `L+R<=168`, `153+h-min(L,R)<=r<=255+h-max(L,R)`, `h>=5`). Conjoined with
  the accepted mixed-core moment bounds (`91<=r<=182`), the live k1
  envelope gains `p,q>=70` and `5<=h<=14`; the accepted moment bounds on r
  remain stronger than the claim-6 aggregate r interval and stay in force.
- Claim 7 (`claim-paley-search-design`): design guidance checked for
  consistency with the verified facts, including the caution against
  replacing signatures by orbit representatives independently of relative
  position; no coverage-changing advice found.

Findings:

1. The mixed-codegree identity in claim 2 presupposes the accepted k1 root
   convention (complete v-C and u-D, no u-C or v-D, no root-T edges). It
   was verified under exactly that convention and must be re-derived
   before any reuse under a different attachment pattern.
2. The review search eliminates the claim-5 profiles already at the
   pairwise-compatible-family stage and therefore did not reproduce the
   retained-family counts (five at p=68, 8,371 at p=69). Those counts are
   internal to the author's cover normalization, are not needed for the
   conclusion, and no discrepancy with the stated bound arises.
3. The 70 bound was confirmed as a necessity statement only; sharpness,
   realizability of p=70, T-edge admissibility, and gluing remain open,
   exactly as the note states.

Outcome: claims 1-6 accepted; claim 7 accepted as design guidance.
Limits: one-side necessary conditions on fixed Paley-17 cores; applied to
k1 via the accepted Paley-17 classification, both sides independently; no
43-vertex completion is constructed or excluded; permitted search use is
necessary-condition propagation, never sufficiency, termination, or
coverage replacement.

## Changelog

- 2026-10-27: Independent review (Main) accepted all seven claims on the
  basis of the decisive checks recorded above. Review states, search-use
  lines, and the claim-5 pending-review sentence updated. Consumer notes
  updated in `docs/r_4_4_17_results.md`, the foundation topic
  `research/foundations/paley17_uniqueness.md`, and the k1 branch README
  (strengthened scalar envelope bullet).
