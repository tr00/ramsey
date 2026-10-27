# Paley-17 is the unique 17-vertex (4,4)-Ramsey graph

- **Kind and scope:** one exact classification for finite simple graphs on 17
  vertices excluding both `K4` and independent 4-sets (the family `R(4,4,17)`
  of `docs/r_4_4_17_results.md`), plus the degree-18/K1 corollary that both
  cores of the k1 double-core frame are Paley-17. No order-43 hypothesis
  enters the classification; ambient types are plain finite simple graphs.
- **Author:** Main. **Review state:** accepted, 2026-10-27, by explicit user
  decision on the basis of the repository Lean formalization (kernel-checked,
  axiom-audited, sorry-free); see the review record below. The prose proof is a
  transcription of that formalization, not an independently human-reviewed
  argument; where the two could ever differ, the Lean artifacts govern.
- **Dependencies:** the proved in-repo bound `R(4,3)<=9` (`Ramsey.n09.R43`),
  elementary degree/codegree counting, and finitely many explicitly recorded
  enumerations (the 38 outside signatures, the two cyclic multiplicity
  families, the cubic 8-vertex completion), each kernel-checked by `decide` in
  the Lean modules listed below. The published (4,4,17) census edge count 68
  (McKay-Radziszowski 1992, Table 1) is a *consequence* here, not an input.
  `R(4,4)=18` is recorded literature; it implies maximality of every member at
  order 17 but is not used in the proof.
- **Search use:** narrow the labelled k1 completion keys by fixing both cores
  to the Paley-17 adjacency (retaining every bijection, or a separately proved
  orbit rule); propagate the arithmetic filters of
  `docs/paley17_arithmetic.md` to every 17-core without an external census
  premise. Never terminate a branch from this claim alone: it identifies
  cores, it does not complete or exclude an order-43 graph.

| Claim | Statement | State |
| --- | --- | --- |
| [01](#claim-paley17-uniqueness-01) | Every 17-vertex K4-free I4-free graph is Paley-17 | accepted |
| [02](#claim-paley17-uniqueness-02) | Both k1 cores C and D are Paley-17 | accepted |

Summary. The classification proceeds in three layers. First, every member of
`R(4,4,17)` is 8-regular with exact strongly regular parameters
`SRG(17,8,3,4)`: adjacent pairs have 3 common neighbors, nonadjacent pairs 4
(previously accepted material, retained here with its short proof). Second,
every neighborhood is the 8-vertex Mobius ladder (the Wagner graph), and the
8 antineighbors of any root carry 4-element "signatures" inside the labeled
neighborhood whose complements contain no independent triple; exactly 38
subsets qualify, and the prescribed pair-incidence counts force the signature
multiplicities to be one of two reflected cyclic families, each signature used
exactly once. Third, unit multiplicities label all 17 vertices so that every
adjacency except possibly inside the antineighborhood matches Paley-17
explicitly; a nonedge there would close a `K4` with two shared signature
members, so the adjacency inclusion plus equal regularity forces equality.
Existence holds: Paley-17 is `(4,4)`-free.

## Setting

`R(4,4,17)` is the family of graphs `G` on a 17-element vertex set with no
`K4` and no independent 4-set. The numerical Ramsey number is `R(4,4)=18`
(recorded literature, root README); it is *not* an input below.

The **Paley graph** `paley17` has vertex set `Z/17` and adjacency
`y-x in Q`, `Q = {1,2,4,8,9,13,15,16}`, the nonzero squares (`chi(3) = -1`).
The **Mobius ladder** `M8` (Wagner graph) has vertex set `Fin 8` and adjacency
differences `{1,4,7}` modulo 8: the 8-cycle plus the four opposite chords.

<a id="claim-paley17-uniqueness-01"></a>
## 1. Classification claim

Claim ID: `research/foundations/paley17_uniqueness.md#claim-paley17-uniqueness-01`
Kind: exact classification
Review state: accepted (Lean-grounded; see review record)
Scope: every finite simple graph `G` with `Nat.card V = 17`, `G` K4-free and
I4-free
Dependencies: `R(4,3)<=9` (proved in-repo); finite kernel-checked enumerations
recorded in `lean/Ramsey/n17/`
Conclusion: `G` is isomorphic to `paley17`

Search use: propagate

### Step 1: regularity and SRG(17,8,3,4)

Fix a vertex `v`. `N(v)` is K4-free (induced subgraph of a K4-free graph) and
I4-free (an independent 4-set inside `N(v)` is one in `G`). A 9-vertex graph
contains a `K4` or an independent triple by `R(4,3)<=9`; both are impossible
in `N(v)` (a `K4` lies in `G`; an independent triple completes with `v` to an
`I4`). Hence `|N(v)|<=8`. The identical argument in the complement gives
`|M(v)|<=8` for the antineighborhood, and `17 = |N(v)| + |M(v)|`, so both
equal 8: **`G` is 8-regular** and `e(G) = 68`.

Fix `x` and count length-2 paths from `x` by their midpoint:
`sum_y |N(x) intersect N(y)| = sum_(z in N(x)) d(z) = 8*8 = 64`.
The per-pair caps are: `y = x` gives 8; `y in N(x)` gives at most 3, because
the common neighbors of an edge are independent (two adjacent ones close
`K4` with the edge) and `G` is I4-free; `y` nonadjacent to `x` gives at most
4: common antineighbors of a nonedge form a clique (two nonadjacent ones
close an `I4`), hence number at most 3 by K4-freeness, and the partition
`17 = 2 + |N(x) union N(y)| + |M(x) intersect M(y)|` together with
`|N(x) union N(y)| = 16 - |N(x) intersect N(y)|` gives
`|M(x) intersect M(y)| = |N(x) intersect N(y)| - 1`, so the codegree is at
most 4. The caps sum to
`8 + 8*3 + 8*4 = 64`, so **every cap is attained**: adjacent pairs have
exactly 3 common neighbors, nonadjacent pairs exactly 4. `G` is therefore
`SRG(17,8,3,4)`; moreover the 3 common neighbors of any edge form an
independent triple and, complementarily, the 3 common antineighbors of any
nonedge form a triangle. The census value `e(G) = 68` for every member is part
of this step.

### Step 2: every neighborhood is the Mobius ladder

Fix the root `v`, write `A = N(v)` (8 vertices) and `B = M(v)` (8 vertices).
For `a in A`, the neighbors of `a` inside `A` are exactly the common neighbors
of the edge `va`, of which there are 3, so `G[A]` is **cubic**; it is
triangle-free (a triangle in `A` closes `K4` with `v`) and I4-free (induced).
So `G[A]` is a cubic 8-vertex `(3,4)`-Ramsey graph.

*Lemma (Mobius ladder).* Every such graph is isomorphic to `M8`.

Proof. Root `H := G[A]` at `r`; its three neighbors `A1` are pairwise
nonadjacent (triangle-freeness), and `O := V(H) - {r} - A1` has 4 vertices.
Each `a in A1` has degree 3, one edge to `r`, none inside `A1`, hence exactly
2 neighbors in `O`: 6 cross edges. Counting degrees on `O`,
`4*3 - 6 = 6`, so `O` carries exactly 3 edges. `O` has no independent triple
(one together with `r` is an `I4` of `H`) and no triangle. A triangle-free
3-edge graph on 4 vertices is `P4`, `K1,3`, or a triangle with a pendant edge;
the last two are excluded, so `O` induces `P4`. Label the path vertices
`3-2-6-5` (the order in which they appear inside `M8`'s labels `{2,3,5,6}`,
whose induced edges are `2-3`, `2-6`, `5-6`). Each `a in A1` attaches to a
nonedge pair of the path (triangle-freeness). Path endpoints 3 and 5 have one
path-neighbor and need 2 cross neighbors; interior vertices 2 and 6 have two
and need 1. The nonedge pairs available are `{3,6}`, `{3,5}`, `{2,5}`, and the
degree demands (`3`:2, `6`:1, `2`:1, `5`:2) force the multiset
`{{3,6},{3,5},{2,5}}` uniquely; the assignment of the three pairs to `A1` is
a free permutation of the independent triple. Labeling `r -> 0`,
`A1 -> {1,4,7}`, `O -> {2,3,5,6}` realizes exactly the adjacency differences
`{1,4,7}` of `M8`. This is the finite completion kernel-checked by
`mobius8_unique` in `lean/Ramsey/n17/M8.lean`.

So after relabeling, `G[A] = M8` on labels `0..7`; write `e` for such a
labeling and `i ~ j` for `M8`-adjacency.

### Step 3: outside signatures

Each `y in B` forms a nonedge with `v`, and nonadjacent pairs have exactly 4
common neighbors (Step 1), so `S_y := N(y) intersect A` has **size 4**,
viewed via `e` as a 4-subset of `Fin 8`. The complement `A - S_y` contains no
independent triple of `G[A]`: such a triple together with `y` is an `I4` of
`G`. The admissible 4-subsets — precisely those whose
complement contains no independent triple of `M8` — number **exactly 38**;
they are tabulated by bit-masks in `lean/Ramsey/n17/Signatures.lean`
(`signatureMask`, membership via `signatureSet`), and `signatureSet_complete`
kernel-checks both directions: every 4-subset meeting the complement
condition is in the table, and every actual signature meets it.

Worked example. Under the cyclic square labeling
`(1,2,4,8,16,15,13,9)` (consecutive labels differ by doubling mod 17; labels
at cyclic distance 4 are adjacent), the Paley vertex `10` is adjacent to the
squares `{1,2,8,9}`, i.e. labels `{0,1,3,7}` — exactly the left cyclic family
signature at position 0 (mask 139).

### Step 4: pair budgets

For distinct labels `i, j`, count the common neighbors of the vertices
`a = e^-1(i)`, `b = e^-1(j)` by region: the root `v` (always), the common
neighbors inside `A`, and the outside vertices seeing both. Inside `M8`:
adjacent pairs have none (triangle-free); nonadjacent pairs at cyclic
difference `+-2` have exactly one; at difference `+-3` exactly two. Step 1
gives total 3 for `i ~ j` and 4 otherwise, so the number of outside common
neighbors is forced:

| pair `(i,j)` in labels | common in `A` | outside common required |
| --- | --- | --- |
| adjacent (difference 1, 4, 7) | 0 | 2 |
| nonadjacent, difference `+-2` | 1 | 2 |
| nonadjacent, difference `+-3` | 2 | 1 |

Consistency check: over the 28 unordered pairs the demands sum to
`12*2 + 8*2 + 8*1 = 48 = 8 * (4 choose 2)`, exactly the total pair incidences
the 8 signatures of size 4 can supply.

### Step 5: the multiplicities are one of two cyclic families

Let `c_k` be the number of outside vertices with signature `k in Fin 38`.
Step 4 says: `sum_k c_k = 8` and, for every label pair `i < j`, the sum of
`c_k` over signatures containing both `i` and `j` equals the tabulated demand.
Exact integer elimination over the 38 explicit masks leaves **exactly two
solutions**, both 0/1-valued — each of the 8 used signatures occurs exactly
once:

```text
left  family, cyclic positions 0..7 -> signature indices {20, 1, 5, 13, 27, 15, 34, 29}
right family, cyclic positions 0..7 -> signature indices { 2, 8,17, 36, 32, 25, 10, 21}
```

The two families are mirror images: reversing the label cycle (`i -> 8-i`)
with the induced reindexing of the outside block interchanges them. This is
the kernel-checked resolution `signature_counts_classification` in
`lean/Ramsey/n17/Signatures.lean`; no solution with a repeated signature or a
signature outside the two cyclic orbits survives the 28 equations.

### Step 6: reconstruction and the final identification

Unit multiplicities identify the 8 outside vertices with the 8 cyclic
positions of one family. Fix an orientation (left, say) and label:

```text
root v -> 0,
label i in Fin 8 (block A) -> squareLabel(i) = (1,2,4,8,16,15,13,9)[i] in Z/17,
outside cyclic position j (block B) -> nonsquareLabel(j) = (10,3,6,12,7,14,11,5)[j].
```

Direct evaluation of `paley17` confirms, in either orientation (the reflection
`reflectR44` swaps the families), that (a) the root is adjacent to exactly the
square block, (b) the square block carries `M8`, and (c) each outside vertex
is adjacent to exactly its signature labels (`paleyLabels_root/square/cross`
in `lean/Ramsey/n17/Model.lean`). So the pullback `H` of `G` along this
labeling satisfies `H <= paley17` on every pair except possibly two outside
vertices.

Suppose outside vertices `x_i, x_j` (`i != j`) were adjacent in `G` while
their Paley images are not. Evaluating Paley-17, the two signatures then share
two `M8`-adjacent labels `a ~ b` (`paleyLabels_outside_obstruction`): the four
vertices `{x_i, x_j, x_a, x_b}` — where `x_a, x_b` are the `A`-vertices with
those labels — span a `K4`: `x_i x_j` by assumption, `x_a, x_b` lie in both
signatures, and `x_a x_b` is an `M8` edge. This contradicts K4-freeness.
Hence every `G`-edge maps to a Paley-edge: **`H <= P`** as graphs on the 17
labels, where `P` is Paley-17 in the chosen orientation.

Both `H` and `P` are 8-regular (`H` by Step 1; `P` because `paley17` is itself
a member of `R(4,4,17)`, Step 7). An inclusion between graphs of equal order
and equal degrees is an equality: at each vertex the neighbor `Finset`s are
nested with equal cardinality. So `H = P` and `G` is isomorphic to `paley17`.
This proves Claim 01. The final two moves (edge-forcing on the outside block,
inclusion plus equal degrees) are `isomorphic_paley17_of_labels` and
`graph_eq_of_le_regular` in `Model.lean`.

### Step 7: existence

`paley17` is K4-free (a kernel-checked normalization argument: no triangle
inside the square class `Q`, so no `K4` through any vertex) and I4-free because
multiplication by 3, a nonsquare, is a graph isomorphism `paley17 -> paley17^c`
(`paley17_compl_iso`, `paley17_isRamseyGraph` in
`lean/Ramsey/n17/Paley.lean`). The family `R(4,4,17)` is therefore exactly one
isomorphism class, realized by Paley-17 with 68 edges, matching the recorded
published census interval `68..68` (McKay-Radziszowski 1992, Table 1) — now a
consequence, not a premise.

<a id="claim-paley17-uniqueness-02"></a>
## 2. K1 corollary: both k1 double-core cores are Paley-17

Claim ID: `research/foundations/paley17_uniqueness.md#claim-paley17-uniqueness-02`
Kind: corollary of Claim 01 and the accepted k1 frame
Review state: accepted (same basis)
Scope: the accepted k1 double-core setting
(`research/n43/d18/k1/research.json`, claim `claim-k1-double-core`; Lean:
`Frame.Admissible` in `lean/Ramsey/n43/d18/k1/Frame.lean`)
Dependencies: Claim 01; the accepted k1 partition (`C`, `D` are 17-vertex
(4,4)-free graphs)
Conclusion: `G[C]` and `G[D]` are both isomorphic to Paley-17

Search use: as for Claim 01

Proof. `claim-k1-double-core` records that `C` and `D` carry 17-vertex
`(4,4)`-free induced graphs. Claim 01 identifies each with Paley-17. In Lean
this is `Ramsey.d18.k1.Frame.paley_cores`. No pivot maximization, catalogue,
or census premise is used.

### Consequences for the k1 completion program

- The accepted labelled-coverage rule in `cross_core.json`
  (`unlabelled_warning`: include every bijection from each core
  representative; no orbit quotient) applies with a **single representative**:
  completion keys may fix both cores to the Paley-17 adjacency and retain all
  bijections from `Z/17` to each core. No automatic orbit quotient on these
  bijections is established by Claim 01; any quotient still needs its own
  proof.
- All previously accepted k1 claims (`cross_core.json`, `seven_cell.json`,
  `triangle_capacity.md`, `signature_geometry.md`, `mixed_core_obstruction.md`,
  `dense_cell_stability.md`, `critical_core_exterior.md`) were deliberately
  proved **without** uniqueness and remain valid exactly as reviewed; nothing
  needs re-derivation, and their recorded hashes are unchanged.
- The arithmetic restrictions of `docs/paley17_arithmetic.md`, previously
  conditional on an unacquired published unique-core classification, now apply
  to every k1 core in-repo. That note's own claims remain ready, not accepted.
- The k1 branch itself remains **open** (`Ramsey.d18.k1.excludes`): core
  identification does not decide the 289-bit `C-D` completion.

## Lean correspondence

| Statement | Symbol | File |
| --- | --- | --- |
| Classification (Claim 01) | `Ramsey.n17.isomorphic_paley17` | `lean/Ramsey/n17/R44.lean` |
| Reconstruction from one cyclic family | `Ramsey.n17.isomorphic_paley17_of_labels` | `lean/Ramsey/n17/Model.lean` |
| Signature table and two-family resolution | `signatureMask`, `signature_counts_classification` | `lean/Ramsey/n17/Signatures.lean` |
| Mobius ladder lemma (Step 2) | `Ramsey.n17.mobius8_unique` | `lean/Ramsey/n17/M8.lean` |
| SRG parameters (Step 1) | `Ramsey.n17.isSRGWith` | `lean/Ramsey/n17/Structure.lean` |
| 8-regularity (Step 1) | `Ramsey.card_neighborSet_eq_eight_of_isRamseyGraph_4_4` | `lean/Ramsey/n17/Regularity.lean` |
| Existence (Step 7) | `Ramsey.n17.paley17_isRamseyGraph` | `lean/Ramsey/n17/Paley.lean` |
| K1 corollary (Claim 02) | `Ramsey.d18.k1.Frame.paley_cores` | `lean/Ramsey/n43/d18/k1/Core.lean` |

Audit status: `scripts/expected-axioms.txt` records that
`isomorphic_paley17`, `paley17_isRamseyGraph`, and `paley_cores` depend only
on `[propext, Classical.choice, Quot.sound]` (checked by `scripts/Audit.lean`).
None of these files appears in `lean/scripts/sorry-ledger.txt`, and
`sh lean/scripts/check.sh` enforces zero sorries outside the ledger. The
finite steps (38-signature table, pair budgets, two-family resolution, cubic
completion) are `decide` proofs elaborated by the Lean kernel.

## Review record

- 2026-10-27: **Accepted by explicit user decision** on the basis of the
  audited Lean formalization above, per the instruction that a rigorous Lean
  proof licenses acceptance of the mirrored markdown claim. Author of the
  prose: Main (same session as the transcription). Limits, recorded plainly:
  no separate independent human review of this prose has taken place; the
  prose mirrors the Lean statements and proofs, and any discrepancy is to be
  resolved in favor of the Lean artifacts, which remain the certificates.
  Renewed review of this topic is required before any later edit that changes
  a statement or proof argument; metadata, navigation, and consumer notes may
  change without one.

## Changelog

- 2026-10-27: Topic created. Recorded Claim 01 (classification of
  `R(4,4,17)`) and Claim 02 (both k1 cores are Paley-17) as accepted on the
  Lean basis, with the full prose proof transcribed from
  `lean/Ramsey/n17/{Regularity,Structure,M8,Signatures,Model,Rooted,Paley}.lean`
  and `lean/Ramsey/n43/d18/k1/Core.lean`. Consumer caveats updated:
  `docs/r_4_4_17_results.md` (uniqueness-premise status, completion-substitution
  caution, arithmetic paragraph, navigation row),
  `docs/paley17_arithmetic.md` (external-premise caveats), and
  `research/n43/d18/k1/README.md` (core identification). The k1 branch status
  (open) is unchanged.
