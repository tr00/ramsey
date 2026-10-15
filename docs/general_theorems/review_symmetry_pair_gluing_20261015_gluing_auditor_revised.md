# Independent renewed review of two-root symmetry gluing

Date: 2026-10-15. Review task: `audit_pair_gluing`.

Claim(s): [pair gluing](symmetry_pair_gluing.md),
`claim-pair-gluing-01`, `claim-pair-gluing-02`, and
`claim-pair-gluing-03`, together with the order-43 application table.

Author and reviewer: Codex, task `symmetry-hour-20261015`; reviewer
`/root/audit_pair_gluing`, a distinct agent performing an independent
mathematical review. The author self-check is not acceptance evidence.

Reviewed revision: exact uncommitted proof SHA-256
`4ece07911564de0370a787129e46fa359b4157ec6e5bbe41450990dec1c771f4`.
The full revised proof was re-read after verifying this hash.
Working HEAD at the original audit was
`249f50a0d2f0e71e4ed6556252eb99ad3e8ed4f4`; the exact file hash, rather
than that commit, identifies the audited uncommitted proof.

This supersedes the changes-requested outcome of the
[original exact-revision review](review_symmetry_pair_gluing_20261015_gluing_auditor.md)
only for the revised proof. The original review remains historical evidence
about proof hash `9d57200109c45fcaca71167f209781a4f3a10fd5b8de8a79459396c9b796391b`.

## Dependencies reviewed

Claims 01--03 were derived independently from their displayed finite graph
and permutation hypotheses. Their core group theory requires no Ramsey
theorem, catalogue, or computational classification. The order-43 application
dependencies were read at these exact versions:

| Dependency | SHA-256 |
| --- | --- |
| `n43/min-degree20/pair_coverage.md` | `dcc49b82fd216c9db70de88d0d8f0dc33e25a82c0eb75e671d47542d4c30cbde` |
| `n43/d18/dense_pivot_coverage.md` | `e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a` |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
| `docs/general_theorems/family_overlap.md` | `6fbd343167de8f0d43985ecf11d39fff9060b867680a91c12347772ffda86e87` |
| `n43/min-degree20/review_pair_coverage_20261015_transversal.md` | `688cf4ba772d8ef5180c966dd063a2b9f34d2c189401a0648c35e6adb32f0376` |
| `n43/d18/review_dense_pivot_coverage_20261014_low_s.md` | `9d23cb041c1d128c24236916f75dbe4c469111945c4d1941daba4c83bb813d59` |

The previous independent reviews concern their recorded exact proof revisions;
current integration banners are not themselves mathematical evidence. For
this review, the family theorem statements and their application hypotheses
were read, and the normalization/count consequences and both numerical
family-overlap substitutions were separately checked. The application remains
conditional on those stated family theorems and their explicit classical
Ramsey premises. Those premises were checked for applicability, not
recertified. No external Ramsey premise is needed for Claims 01--03.

The required project instructions and starting notes were read, including
the exact ambient-type warning: a single neighborhood is `(4,5)`-free and
may contain `I4`, while an antineighborhood is `(5,4)`-free.

## Repair verification

The revised setting defines every overlap map and automorphism to preserve
fixed colors from a common alphabet. It requires consistent root-color data
and excludes incompatible overlap identifications from `I` itself. Thus
`I`, when nonempty, is a torsor for the color-preserving overlap
automorphism group. In the original red/blue edgeless-overlap example, the
color-swapping map is now absent, so the original counterexample no longer
applies.

Arbitrary additional branch relations are explicitly outside the full-group
and exact-classification assertions unless their enriched skeleton is
separately analyzed. The final clarification correctly distinguishes an
independent stabilizer of D-only colors from fixed D-to-side signatures:
such signatures can require coupled permutations of the side and D cells.
The displayed direct-product formula is not asserted for that enriched case.

## Claim 01: accepted

Take a map `phi:S_u -> S_v` and side permutations `a in A`, `b in B`.
The changed gluing map must satisfy

```text
phi' rho_u(a) = rho_v(b) phi,
```

which gives exactly the displayed action
`phi'=rho_v(b) phi rho_u(a)^(-1)`. This equation is both necessary and
sufficient for the two side permutations to agree after passing to the
identified overlap. Their induced union permutation fixes the ordered roots,
preserves colors, and preserves every fixed incidence of the skeleton.

Conversely any color-preserving ordered-root skeleton isomorphism preserves
each root's neighborhood because adjacency to that fixed root is preserved.
Its two restrictions are pointed neighborhood automorphisms, with the
distinguished other root fixed. Their common-neighbor restrictions satisfy
the same equation. Thus there are no additional map equivalences beyond
the side action. Root order is essential here: reversing the two roots is
not an element of this group.

Fix a compatible `phi_0`. Each compatible map has a unique expression
`phi_0 h`, where `h` is a color-preserving automorphism of `S_u`:
indeed `h=phi_0^(-1) phi`. Conjugating the right-side image group back
through `phi_0` makes the action `h -> j_v h j_u^(-1)`. Its equivalence
classes are exactly `J_v h J_u`, since inversion does not change the
right subgroup. The restrictions' kernels do not affect these map orbits;
their images do. This proves the exact double-coset classification.
Empty `I` means no compatible overlap; an empty overlap with nonempty `I`
has the unique empty map and trivial overlap group, consistent with the
same argument.

## Claim 02: accepted

The root-incidence patterns of `S,X,Y,D` are respectively `(1,1)`, `(1,0)`,
`(0,1)`, and `(0,0)`. Fixing both ordered roots preserves each cell, even
if side sizes or colors coincide. The restriction to the two neighborhoods
therefore lies in `A x B`, and compatibility on the overlap is exactly
the fiber-product equation. Conversely a compatible pair preserves all
known side incidences and colors. With initially interchangeable D vertices
and no additional fixed relations, any D permutation can be chosen
independently; it preserves the known nonadjacency to both roots. This proves
that the full permitted vertex group is `F_phi x S_t`.

Map `F_phi` to the common overlap image on `S_v`. Its range is

```text
K = J_v intersect phi J_u phi^(-1).
```

Every `k in K` has a left lift and a right lift independently. The left
lifts form a coset of `ker(rho_u)` and the right lifts form a coset of
`ker(rho_v)`, so each fiber has exactly
`|ker(rho_u)| |ker(rho_v)|` elements. Hence

```text
|F_phi| = |ker(rho_u)| |ker(rho_v)| |K|,
|Gamma_phi| = t! |F_phi|.
```

No faithful overlap restriction is assumed. If a pair acts trivially on
the glued vertex set, its actions on every vertex of each complete pointed
neighborhood are trivial, so both automorphisms are identities. A D
permutation acting trivially is also the identity. This proves the faithful
**vertex** action. The induced action on free-edge coordinates can have a
kernel, particularly in degenerate small cases; faithfulness there is not
claimed and is unnecessary for orbit minima.

A rooted isomorphism between two completions of this same fixed skeleton
must preserve every known neighborhood incidence and color, hence belongs
to `Gamma_phi`. Conversely any group element transports a completion to
a rooted isomorphic completion. A finite total ordering of the full free-edge
vector thus has a unique least vector per orbit, and vector orbits are
exactly ordered-root completion isomorphism classes. This assertion concerns
full vectors, not independently minimized fragments. With additional fixed
relations the actual complete-state stabilizer is required, as the repaired
note explicitly states.

## Claim 03: accepted

Let a target graph have an admissible ordered adjacent pair. Complete
pointed-input representative lists permit relabeling its two neighborhoods
to retained representatives. The actual identification of their common
vertices is compatible and belongs to `I`. Claim 01 then supplies a pair
of side automorphisms moving that identification to the retained double-coset
map. Apply the same relabeling to every remaining edge, including all
D-to-side edges. Claim 02 finally sends the resulting full completion
vector to its retained orbit minimum. Each step is a color-preserving graph
isomorphism and preserves the invariant feasibility conditions. This proves
retention of a representative of every admissible rooted target.

The converse follows from restrictions of a rooted completion isomorphism:
it cannot join distinct pointed-neighborhood isomorphism types, and within
one such pair it cannot join distinct double-coset map classes. Within one
retained map, Claim 02 supplies the exact completion equivalence. Thus with
one representative per stated equivalence class and complete enumeration,
the complete codes classify ordered-root objects exactly.

Selecting distinguished vertices modulo the full color-preserving
neighborhood automorphism group is valid only when every vertex orbit type
allowed by the input family remains covered. The final residual group is
the paired compatibility group, so the two side maps cannot subsequently be
minimized independently. Isomorphism-equivariance and nonemptiness of the
admissible pair family are explicit premises, not consequences of symmetry.
An unrooted graph may have several inequivalent admissible ordered edges;
the note correctly requires an additional selector for unrooted uniqueness.
This redundancy does not impair complete nonexistence coverage.

## Order-43 application checks

For equal root degree `d`, each side-exclusive cell has `d-1-lambda`
vertices. Consequently the glued union has
`2+lambda+2(d-1-lambda)=2d-lambda` vertices, and
`|D|=43-2d+lambda`. Substituting degrees 18, 20, and 21 yields the
table's three D sizes exactly.

The common-neighbor graph is `(3,5)`-free: a triangle there completes `K5`
with the adjacent roots, and an independent five is already forbidden
in the ambient graph. It is not being treated as a whole `(4,5)`
neighborhood. A side-exclusive cell is `(4,4)`-free: a clique of four there
completes a clique of five with the adjacent root, and an independent four
completes an independent five with the other, nonadjacent root. Therefore
the retained `R(4,4)=18` premise bounds that cell by 17 and gives
`lambda>=d-18`. This supplies lower bounds 0, 2, and 3 for the three rows.

The degree-18 row is conditional on a prescribed family of at least thirteen
actual degree-18 vertices; the group theorem creates no such family. The
degree-20 row uses a family with `n20>=13`. For the other normalized row,
the count identities `n20=t+2j+1<=12` imply `j+t<=11` and hence
`n21=42-2(j+t)>=20`, enough for the degree-21 family theorem. The retained
family-overlap substitutions have anchor values `32>28` at degree 20 and
`30>28` at degree 21, and yield overlap upper bounds 11 and 12 in those
same families. The two count predicates are disjoint and exhaustive only
within the normalized minimum-degree-20 branch. They are not coverage for
the arbitrary-degree-20-pivot scheme or the lower-minimum branches.

## Outcome, permitted use, and limits

| Claim | Revised outcome | Permitted use |
| --- | --- | --- |
| `claim-pair-gluing-01` | accepted | Symmetry of compatible overlap maps, with certified double-coset coverage. |
| `claim-pair-gluing-02` | accepted | Symmetry of full completions under the exact residual group in the stated scope. |
| `claim-pair-gluing-03` | accepted | Staged ordered-root coverage conditional on complete admissible inputs, maps, and completions. |

Acceptance is an independent mathematical audit of the exact proof hash.
A future generator still needs independently checkable input coverage,
pointed-automorphism witnesses, double-coset coverage, full-vector orbit
handling, and the stated constraint invariance. An unchecked omission list,
cyclic descent relation, timeout, or failed search proves no nonexistence.
The formulas alone promise no practical reduction size or tractability.
Endpoint reversal and complementation require separate compatible selectors.
Extra fixed nonlocal data require a separately derived enriched-state group.

No solver, proof checker, theorem prover, canonicalizer, graph enumeration,
download, installation, novelty review, formal certificate, construction,
branch closure, or improvement of the bounds on `R(5,5)` is supplied here.
Substantive changes to the proof or affected dependencies require renewed
exact-revision review.
