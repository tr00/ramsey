# Independent review: exterior theorem and seven-cell capacity claims

Date: 2026-10-19. Task: `k1-whole-branch-obstruction-20261019`.
Reviewer: ExteriorCapacityAudit, a distinct identity from the author.

## Claim(s)

All four claims, by repository path and anchor:

1. `n43/d18/critical_core_exterior.md#claim-critical-exterior-triangle-free`
   (every exterior missed signature is triangle-free).
2. `n43/d18/critical_core_exterior.md#claim-critical-exterior-four`
   (`|W_c|<=4`, row triangle-free and I3-free, order-four types
   2K2/P4/C4, plus the order-three types and the K1 row domain in the
   unnumbered consequences section).
3. `n43/d18/k1/triangle_capacity.md#claim-k1-dense-seven-cell`
   (`p,q>=22+3h`, `h<=15`, exact slack identity, h=15 defect bound).
4. `n43/d18/k1/triangle_capacity.md#claim-k1-component-capacity`
   (`G[T]` has at most two components, `h>=6`).

## Author and reviewer

Author: Main (both files, dated 2026-10-19, `Review state: ready`).
Reviewer: ExteriorCapacityAudit. Distinct identities; no claim was
accepted on the author's assertion. Every step below was re-derived from
the branch hypotheses before comparison with the text.

## Reviewed revision

Both files are untracked in Git at HEAD
`1581b3ae1b0e5ca5b65a6177fd8d04678ef96782`, so the exact uncommitted
file bytes are identified by SHA-256 (the two hashes under review):

| File | SHA-256 of exact reviewed file |
| --- | --- |
| `n43/d18/critical_core_exterior.md` | `8b8b1101af98e4c6dfe76234e95510bc6b24fcc32887189aac67d481a2dc2f51` |
| `n43/d18/k1/triangle_capacity.md` | `35107639650ce2719ffa43d251dbf41d837f7f152ddc2a58fff608edd2ff53a8` |

Both hashes were recomputed with `sha256sum` after the full re-read and
equal the two premises cited by the sibling conditional review
`n43/d18/k1/review_dense_cell_stability_20261019_main.md`, confirming no
drift between that audit's citations and the bytes reviewed here. Any
change to either file reverts this review to pending.

## Dependencies reviewed

| Dependency | SHA-256 (current) | Status and provenance |
| --- | --- | --- |
| `n43/d18/k1/research.json` | `bf434421efcf08b73813866ba8db7e76878700fb65104895539622d8127a069e` | accepted; reviewed `03053b63...`, integrated metadata-only with `scientific_content_preservation: PASS` per `reports/2026-10-19-d18k1-research.json` |
| `n43/d18/k1/cross_core.json` | `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d` | accepted; reviewed `f114df4f...`, integrated metadata-only, same report |
| `n43/d18/large_row_extensions.md` (`#claim-seventeen-codegree-moments`) | `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` | accepted; reviewed `1f53107e...`, integrated `4d91ae44...` with `reviewed_body_preserved: true`, then metadata-only claim-state flips gated by `reports/2026-10-19-claim-state-reconciliation.md`; current hash is the one pinned in `reports/2026-10-19-k1-whole-branch-obstruction.md` |
| Root `README.md` `## State of the Art` table | `a31dbbee3d997679089ed94c8ac8fd09ccebaf01aebd4dc42f6ccf1ee4660fac` | external literature record; row 3 read directly this review: `R(3,3)=6, R(3,4)=9, R(3,5)=14`, `R(4,4)=18`, `R(4,5)=25` |
| `n43/d18/k1/seven_cell.json` | `f62130763dfb9315377ad542c33aabef9eb8555370c29db2b61f5e998f780bfd` | accepted; read only for consistency; not cited by the four claims |

Dependency applicability: the exterior setting's hypotheses (`B` K5/I4-free,
induced `H` K4/I4-free of order 17) are met by both K1 sides
(`C+T`, `D+T` are `(5,4)`-free; `C`,`D` are accepted `(4,4)`-free of order
17, 8-regular), so the theorem applies to both sides with exterior set
exactly `T`. The packing in `cross_core.json` (`strict-seven-signature-budget`)
and its rederivation here both cover adjacent and nonadjacent `t,s`.
Budgets `p+q+2h<=168`, `p+h>=76`, `q+h>=76` match `cross_core.json`
(`L+R<=168`, `L,R>=76`). Unresolved external premises are listed under
Limits.

## Checks

### Setting layer of `critical_core_exterior.md`

- SRG premise independently recomputed as scalar arithmetic: for a
  `(4,4)`-free 17-vertex `H`, `N_H(x)` is triangle-free (triangle with `x`
  is K4) and I4-free (heredity), so `R(3,4)=9` gives `d<=8`; the
  nonneighborhood is K4-free and I3-free, so complementation of the same
  value gives at most 8; with `d+d_bar=16` every degree is 8. Edge
  codegree `<=3` (common neighborhood independent, else I4), nonedge
  common-nonneighbors form a clique of size `<=3`. Sum of common-neighbor
  counts is `17*binom(8,2)=476=68*3+68*4`, so all bounds are tight:
  `SRG(17,8,3,4)`, and a nonedge has exactly three common nonneighbors
  forming a triangle `Z`, each core vertex has 8 neighbors and 8
  nonneighbors. Matches the accepted claim at the recorded hash.
- Notation `E=M_H(c)` was disambiguated by usage: every argument treats
  `E` as the set of core *nonneighbors* of `c` (the sentence "a missing
  independent triple would extend with c to I4 in H", the packing
  precondition "x in H nonadjacent", and the degree floor from the
  clique-of-nonneighbors argument). Under that reading all Setting facts
  check out; the alternative (neighborhood) reading is false in general
  and is not used anywhere.
- Packing rederived in the general-`B` setting: `t` missing core nonedge
  `x,y` must be complete to `Z` (a missed `z` gives I4 on `x,y,z,t`);
  two missers `t,s` with nonadjacent `ts` give I4 on `x,y,t,s`, with
  adjacent `ts` give K5 on `Z+t+s`. Hence a core nonedge has at most one
  common exterior vertex, equivalently for every `c` and core nonneighbor
  `x`, `x` misses at most one member of `W_c`. `H[U_t]` I3-free follows
  by adding `t` to the triple (I4 in `B`). All ambient uses are `B`-types,
  correct by hypothesis.
- `E` facts (eight-vertex no-isolate block): `E` is K4-free (heredity)
  and I3-free (independent triple plus `c` is I4 in `H`). Nonneighbors of
  `x` in `E` form a clique (else I3 with `x`) of size `<=3` (else K4 with
  `x`), so `d_E(x)=7-nn>=4`; `N_E(x)` is triangle-free (triangle with
  `x` is K4) and I3-free, so `R(3,3)=6` gives `d_E(x)<=5`. On four or
  five vertices, an isolated `y` in `N_E(x)` would force the other `>=3`
  vertices to be a clique (any nonadjacent pair with `y` is an I3), hence
  a triangle, contradicting triangle-freeness. So `N_E(x)` has no
  isolated vertex and every edge of `E` lies in a triangle. The no-isolate
  property holds for every `x in E` (degrees 4 or 5) and yields both a
  triangle through any given vertex and a triangle through any given edge,
  which is exactly what Claim 2 consumes.

### Claim `#claim-critical-exterior-triangle-free`

- With a triangle `Q` in `W_c`, packing gives each `x in E` at most one
  missed vertex of `Q`; labels in `{0} union Q` are well defined and
  exhaustive.
- Same nonzero label `q` on `x,y` forces `xy`: otherwise `c,x,y` are
  mutually nonadjacent with `q` missing all three, an I3 in `U_q`,
  contradicting Setting I3-freeness (`q in W_c` gives `c in U_q`). So
  nonzero classes are cliques; three of them form a triangle complete to
  the edge `Q-{q}`, giving K5 in `B`. Class size `<=2`.
- No label-0 vertex: for label-0 `x`, `N_E(x)` contains no label-0 `y`
  (no-isolate supplies `z in N_E(x)` adjacent to `y`; the triangle
  `x,y,z` is adjacent to at least the two vertices of `Q` seen by `z`
  -- `x,y` see all of `Q` -- and any two vertices of `Q` are adjacent,
  giving K5), and no two vertices of `N_E(x)` share a nonzero label
  (they are adjacent by the class-clique fact and `x,y,z` see the edge
  `Q-{q}`), so `|N_E(x)|<=3`, contradicting `d_E(x)>=4`.
- With no label-0 vertex, all eight vertices of `E` lie in three classes
  of size at most two (`8<=6`), a contradiction. Quantifier is
  `every B,H as in the setting, every c in H`; no `|T|` assumption
  entered any step, as claimed. Conclusion `B[W_c]` triangle-free verified.

### Claim `#claim-critical-exterior-four`

- `W_c` I3-free (add `c`: I4 in `B`); with Claim 1, `R(3,3)=6` gives
  `|W_c|<=5`. Exhaustive fixed-template check (below) confirms the
  `m=4` list `2K2,P4,C4` and the `m=3` list `K2+K1,P3`.
- `|W_c|=5` contradiction: if `x` misses none, a triangle of `E` through
  `x` exists by no-isolate, its other two vertices miss at most one each,
  so the triangle has `>=5-0-1-1=3` common neighbors in `W_c`; any three
  vertices of the I3-free `W_c` contain an edge, and triangle plus edge
  give K5. Hence every `x in E` misses exactly one member of `W_c`.
  If `x,y` miss the same `t`, then `t in W_c` gives `c in U_t`, so with
  `x,y in U_t` a nonedge `xy` would be an I3 in `U_t`; therefore `xy` is
  an edge, it lies in a triangle of `E`, that triangle misses the shared
  `t` plus at most one further vertex, so it has `>=3` common neighbors
  in `W_c` containing an edge, giving K5. The label map `E -> W_c` is
  therefore total and injective, impossible for orders 8 and 5. The
  text's compressed "I3-freeness of U_t forces xy to be an edge" is
  correct once `c in U_t` is supplied, which follows from `t in W_c`.
- Order-four classification: degree 0 would force the other three
  vertices to be a clique (else with `v` an I3) hence a triangle;
  degree 3 would make the neighborhood an independent triple (triangle-
  free). Remaining degrees 1 or 2 give exactly `2K2,P4,C4`;
  order three gives exactly `K2+K1,P3`. Both statements match the
  exhaustive check.
- Consequences: `|W_c|<=4` gives `d_T(c)>=3` and `<=7` on each
  `(5,4)`-free 24-vertex side; side degree `8+d_T>=11` matches (and
  strictly improves on) the recorded order-24 lower bound 10
  (nonneighbors of a vertex in a `(5,4)`-free 24-graph are K5-free and
  I3-free, hence `<=13` by `R(3,5)=14`). The row table is complete by
  `|W_c|=7-d_T(c)` and the two classifications; the file correctly labels
  the table necessary-only, asserts no realisability, no catalogue
  witness, no K1 exclusion and no R(5,5) decision.

### Claim `#claim-k1-dense-seven-cell`

- Row side of the count: `sum_c m_c=119-p` (7*17 C-T pairs), so
  `sum_c (m_c-2)=119-p-34=85-p`. Turan on the triangle-free row gives
  `e(F[W_c])>=binom(m,2)-floor(m^2/4)>=m-2`; the second inequality was
  verified symbolically for all `m>=0` (even `m=2k`: `(k-1)(k-2)>=0`
  with `m=0,2` direct; odd `m=2k+1`: `(k-1)^2>=0`), so no dependence on
  `|W_c|<=4` is needed.
- Double count: `sum_c e(F[W_c]) = sum_{ts in E(F)} |U_t intersect U_s|`
  holds because `c` contributes to the left for an `F`-edge `ts` exactly
  when `c` misses both endpoints, i.e. `c in U_t intersect U_s`.
  Each intersection is a clique in the `(4,4)`-free core (two core
  nonneighbors with two common exterior misses are excluded by packing,
  adjacent or not), hence `<=3`; `e(F)=21-h`. So
  `85-p<=3(21-h)=63-3h`, i.e. `p>=22+3h`, and symmetrically `q>=22+3h`.
- Arithmetic: `168>=p+q+2h>=44+8h` gives `8h<=124`, `h<=floor(124/8)=15`
  (independently recomputed). The exclusion of 16, 17, 18 edges is
  therefore legitimate: it is a strict strengthening of the accepted
  scalar envelope's `h<=18` (K5-free Turan), and no conflict arises
  because that envelope claims only integer feasibility of aggregate
  inequalities, not graph feasibility.
- Exact slack: with `a_c=e(F[W_c])-m_c+2>=0` and `b_ts=3-|U_t intersect
  U_s|>=0`, `sum a_c=sum e(F[W_c])-85+p` and `sum b_ts=63-3h-sum e(F[W_c])`,
  which add to `p-22-3h`; the identity is exact in either core, using
  `q` on side `D`. At `h=15`: `p,q>=67`, `p+q<=138`, combined defect
  `=p+q-134<=4`, and the interval `67<=p<=71` is nonempty, so the text
  correctly stops short of excluding `h=15`.
- Scope check: no step uses `x`, root choice or any excess; the claim is
  uniform over all cross counts as stated.

### Claim `#claim-k1-component-capacity`

- `T` I4-free is inherited from the accepted `(5,4)`-free sides, not from
  `G`; stated in the Setting and declared in this claim's dependencies.
  Four components would give an I4 (one vertex each), so `<=3`. With
  three components, a nonadjacent pair in one component plus one vertex
  from each other component is an I4, so each component is a clique, of
  size `<=4` by K5-freeness of `G`. Exhaustive partition enumeration of 7
  into three positive parts of size at most 4 gives exactly
  `{2,2,3}, {1,3,3}, {1,2,4}` -- the three treated cases, none missed.
- Coverage: a core vertex complete to no component misses one vertex in
  each of the three, and those three (different components, hence mutually
  nonadjacent) with the vertex form an I4 in that vertex's own
  `core+T` side. Correct, and side-scoped.
- `K3+K2+K2`: common neighborhood of the triangle is independent (edge
  there with the triangle is K5) and `<=4` (`G` is I5-free); common
  neighborhood of an edge is triangle-free (triangle with the edge is K5)
  and I5-free, hence `<=13` by `R(3,5)=14`. The 34 core vertices lie in
  the union, `4+13+13=30<34`: contradiction.
- `K3+K3+K1`: `t` isolated in `G[T]`, anticomplete to roots, so
  `N_G(t) subset C union D`; with `d_G(t)<=24` (K4-free, I5-free
  neighborhood and `R(4,5)=25`, the recorded degree ceiling applied only
  here and to the `K4+K2+K1` case), `|Z|>=34-24=10`. Each `z in Z` misses
  `t`, so must be complete to one of the two triangles; each such common
  neighborhood is independent and `<=4`, giving `|Z|<=8`: contradiction.
- `K4+K2+K1`: no `z in Z` is complete to the K4 (K5) or to `{t}` (misses
  it), so every `z` is complete to `ab`; a triangle in `G[Z]` with `ab`
  is K5, so `G[Z]` is triangle-free; an I4 in `G[Z]` with `t` is I5 in
  `G`, so `G[Z]` is I4-free; `R(3,4)=9` gives `|Z|<=8<10`: contradiction.
- `h>=5`: `T` I4-free makes `F` K4-free, Turan gives `e(F)<=t_3(7)=16`,
  so `h>=5`; equality forces the unique extremal `F=K_{3,2,2}`, i.e.
  `T=K3+K2+K2`, already excluded, so `h>=6`. (Equivalently recomputed
  inside the three-component list: only `(3,2,2)` has 5 internal edges.)
  Combined with Claim 1: `6<=h<=15`.

### Ambient-type audit (no silent I4-free on `G` or `C`)

Every forbidden-pattern use in both files, by host graph:

- `G`: used only K5-free and I5-free (Setting `K5/I5-free`); the bounds
  `<=4` for the triangle common-neighborhood, `I5-free` of edge common-
  neighborhoods, and "`I4 with t` gives `I5`" all invoke I5-freeness or
  K5-freeness of `G`, never I4-freeness of `G`. Verified by full-text
  scan of both files: no statement asserts `G` is I4-free.
- Sides `C+T`, `D+T`: I4-free and K5-free from the accepted double-core
  claim; used for `T`'s hereditary I4-freeness, for the coverage I4, and
  as the `B` of the exterior theorem. Declared, not silent.
- Cores `C`, `D`: `(4,4)`-free (accepted), so K4-free and I4-free uses
  (`H[U_t]` I3-free, `E` I3/K4-free, clique intersections `<=3`) are
  within the accepted core hypotheses.
- `Z subset C union D` in the `K4+K2+K1` case: its I4-freeness is
  *derived* (an I4 there with `t` is I5 in `G`), not assumed.
- Exterior `B`: K5/I4-free by the claim's own scope line.

### Quantifiers, search use, and the h16..18 / whole-K1 boundary

- Exterior claims quantify over every `B,H` in the Setting and every
  `c in H`, with no `|T|` hypothesis; the consequences section adds the
  explicit `|B|=24` condition before using `|T|=7`. Triangle claims
  quantify over every rooted K1-graph, Claim 1 without any `x` or
  excess restriction. All quantifiers match the proved statements.
- Search use: both files record `Search use: none pending independent
  review`; no search, solver, catalogue scan or enumeration of
  seven-vertex graphs was performed by the author, and none was used in
  this review beyond the fixed-template check below. After acceptance the
  permitted use is `propagate` as necessary filters only, never
  terminate -- consistent with `cross_core.json`'s standing instruction.
- The `h in {16,17,18}` exclusion is a legitimate consequence of the
  accepted budget `p+q+2h<=168` plus the proved `p,q>=22+3h`, and nothing
  in either file claims a whole-K1 exclusion: the exterior file ends
  "They do not exclude K1 or decide R(5,5)" and the capacity file ends
  "The whole K1 branch and order43 remain open".

### Exercised verification (trivial scalar / fixed-template only)

Python3 in-session, seconds, no problem-space graph search:

- Exhaustive enumeration of all graphs on 3 and 4 vertices: exactly the
  claimed row types survive "triangle-free and I3-free" -- order 3: two
  types with degree sequences `(0,1,1)` (K2+K1) and `(1,1,2)` (P3);
  order 4: three types with degree sequences `(1,1,1,1)` (2K2, 2 edges),
  `(1,1,2,2)` (P4, 3 edges), `(2,2,2,2)` (C4, 4 edges). Both type sets
  are closed under complementation, consistent with the `F`-row reading
  used downstream in `dense_cell_stability.md`.
- `binom(m,2)-floor(m^2/4) >= m-2` checked for `m=0..19`.
- `h` arithmetic: `floor(124/8)=15`; at `h=15` the combined defect is
  `p+q-134<=138-134=4`.
- Ordered and unordered partitions of 7 into three parts in `1..4`:
  exactly `(1,2,4), (1,3,3), (2,2,3)` up to order.

No solver, catalogue scan, download, engine/Lean change, build, test
suite, linter or formatter was run.

## Findings

No gaps or corrections: all four claims are correct as written at the
recorded hashes, with every algebraic constant, case split, quantifier
and ambient type re-derived independently above. Two supporting notes,
neither requiring a change to the reviewed files:

1. The single compressed step in `#claim-critical-exterior-four`
   ("I3-freeness of U_t forces xy to be an edge") silently uses
   `c in U_t`, which follows from `t in W_c`; with that fact supplied the
   inference is valid, as recorded under Checks. Editorial, not a defect.
2. Propagation note for the coordinator, outside the reviewed files: the
   accepted scalar envelope in `cross_core.json` still displays `h<=18`
   and `h` bands 16..18 as integer-feasible aggregate profiles. Those
   bands are now prunable at graph level by the accepted `h<=15`; the
   envelope itself remains a correct relaxation and needs no edit.

## Outcome

**Accepted** -- all four claims, at the exact SHA-256 recorded above:

- `#claim-critical-exterior-triangle-free`: accepted.
- `#claim-critical-exterior-four`: accepted (including the order-three
  row types and the complete row domain table in the consequences
  section).
- `#claim-k1-dense-seven-cell`: accepted (`p,q>=22+3h`, `h<=15`, exact
  slack identity, h=15 defect at most four).
- `#claim-k1-component-capacity`: accepted (at most two components, all
  three-component partitions excluded, `h>=6`, interval `6<=h<=15`).

Integration may flip `Review state` / `Reviews` metadata in the two
files under this review provided a scientific-content preservation check
confirms proof bodies byte-identical to these hashes, with the
post-integration SHA recorded (precedent: the k1 research and extension
audits). Any proof-body change reverts the affected claim to pending
review. This acceptance also discharges the exterior and density
premises that `dense_cell_stability.md` declares conditional.

## Limits

- Published Ramsey values (`R(3,3)=6`, `R(3,4)=9`, `R(3,5)=14`,
  `R(4,4)=18`, `R(4,5)=25`) and the `(5,4,24)` census row behind
  `p+h,q+h>=76` are inherited from the root table as recorded premises,
  re-read here but not recertified against literature; no downloads were
  permitted or made.
- The SRG(17,8,3,4) premise was recomputed in scalar arithmetic as used,
  but the full accepted claim `#claim-seventeen-codegree-moments` and its
  eight-subset specializations were not re-audited end to end.
- Acceptance is of the written mathematics at the two recorded hashes,
  not a formal or Lean certificate; no formalization was touched.
- No novelty check, no realizability assertion for any row type, any
  `h in 6..15`, any two-component `T`, or any K1 candidate, and no
  whole-K1 or order-43 exclusion claim is made or endorsed here.
- The global degree ceiling 24 and side `(5,4)`-freeness are accepted
  premises of the branch (their own review chains were read, not
  re-proved here).
