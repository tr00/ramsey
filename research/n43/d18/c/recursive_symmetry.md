# Symmetry quotients of the residual Ramsey recursion

Date: 2026-10-22. Task: `d18c-recursive-symmetry-20261022`.
Author: /root, working alone. Task kind: research with a new branch-local adapter.
All seven claims are **ready for independent review**. No novelty claim.

This note integrates two distinct symmetry operations into the
[residual recursion](recursive_ramsey.md): weighted row orbits under a state's
pivot stabilizer, and memoization of states after transporting their whole
interface. Both preserve **labelled completion counts**. Verified subgroups
suffice for correctness, and incomplete representative selection can lose reuse
without losing completions. The [adapter](recursive_symmetry.py) implements these
operations using permutations and bitmasks, with no external canonicalizer and
no implicit research execution. The original prototype and its hashes are retained.

## Setting

A normalized residual state is `S=(U,P,M,F,B)` as in the
[state definition](recursive_ramsey.md#claim-d18c-residual-derivative): positive
and negative homogeneous-set obligations `(k,X)`, fixed pairs, and nonnegative
integer linear edge budgets. Its completion set is `C(S)` and its count is `f(S)`.
One may additionally retain a vertex colour map `c:U->integers` to restrict
permitted relabellings to a chosen role partition. Colours constrain the
symmetry action only; they impose no further graph edges or forbidden sets.

A bijection `g:U->U'` transports every support by `X->g(X)`, every fixed pair
by `{u,v}-> {g(u),g(v)}`, and every budget by moving its edge coefficients to
those pairs, retaining its lower and upper bounds. It transports colours as
`(g.c)(g(u))=c(u)`. Permutations can permute whole obligations and whole budgets
of matching type, interval and coefficients; they need not fix each tuple
individually. Write `g.S` for the resulting normalized state.

Put

\[
 \operatorname{Aut}(S,c)=\{g\in\operatorname{Sym}(U):g.S=S,\quad g.c=c\}.
 \tag{1}
\]

This is the automorphism group of the **residual constraints**, not a claim that
the processed graph or any future completion has these automorphisms. It may
contain permutations that do not extend to a history automorphism.

## Exact group action and weighted recursion

<a id="claim-d18c-symmetry-equivariance"></a>
### Claim 1. Relabelling commutes with residual differentiation

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-equivariance`  
Kind: local-deduction  
Review state: ready  
Scope: every normalized finite residual state, every bijection `g:U->U'`, every
chosen `u in U` and full future row `N subset U-{u}` compatible with fixed pairs  
Dependencies: [exact derivative and normalization](recursive_ramsey.md#claim-d18c-residual-derivative),
[state congruence](recursive_ramsey.md#claim-d18c-residual-congruence), both ready  
Conclusion: relabelling bijects completion sets, preserves counts, and gives (2)  
Search use: none pending independent review; proposed witnessed transport  
Reviews: none

Relabelling a graph sends `C(S)` bijectively to `C(g.S)`. Moreover, with `g_W`
the restriction of `g` to `W=U-{u}`,

\[
 g_W.\operatorname{norm}(\partial_{u,N}S)
 =\operatorname{norm}(\partial_{g(u),g(N)}(g.S)).
 \tag{2}
\]

An impossible child stays impossible. The equality refers to the exact normalized
tuples, not just equality of counts.

Proof. A bijection preserves clique and independence cardinalities and sends
each induced support to its transported support. It sends a specified edge
indicator to the corresponding new pair, so every fixed value and every weighted
sum has exactly the same value after transportation. Its inverse gives the
completion-set bijection. Intersections, removal of a vertex, and complements
relative to the remaining labels commute with a bijection, proving that the
homogeneous obligations produced by differentiation match. Each spent budget
sum is also identical under transport, and all unspent coefficients move together.

Normalization deletes too-small supports, duplicates, and dominated obligations
by cardinality and containment, all preserved by a bijection. Equal coefficient
vectors still match after transport, their interval intersections and clipping
are the same, and fixed-pair conflicts remain conflicts. Sorting may order the
tuples differently but produces precisely the transported families. This proves
(2) and preservation of elementary failures. QED.

Consequently a graph-only relabelling is insufficient. Ignoring budget intervals,
coefficient indices, colours when required, or negative obligations can merge
different completion problems. The whole state participates in every witness.

<a id="claim-d18c-symmetry-weighted-rows"></a>
### Claim 2. Pivot-stabilizer row orbits give an exact weighted recurrence

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-weighted-rows`  
Kind: local-deduction  
Review state: ready  
Scope: every surviving state `(S,c)`, every chosen `u in U`, any verified subgroup
`K <= Aut(S,c)` fixing `u`, and every compatible full row at `u`  
Dependencies: Claim 1; [full row recurrence](recursive_ramsey.md#claim-d18c-completion-dp), ready  
Conclusion: the weighted orbit recurrence (3) preserves exact labelled counts;
any such subgroup may be chosen anew at every state  
Search use: none pending independent review; proposed weighted symmetry branching  
Reviews: none

The set `R_F(u)` of compatible rows is invariant under `K`, since its elements
fix `u` and preserve fixed pairs. Choose one representative `N_O` in each
`K`-orbit `O` of these rows. Then

\[
 f(S)=\sum_{O\in R_F(u)/K}|O|\,
       f\bigl(\operatorname{norm}(\partial_{u,N_O}S)\bigr),
 \qquad |O|=[K:K_{N_O}].
 \tag{3}
\]

Impossible children contribute zero. Isomorphic children in different row
orbits may share a memoized count, but each orbit's weight is retained.

Proof. The full recurrence partitions labelled completions by their unique
row at the chosen vertex. If `g in K` sends `N` to `N'`, Claim 1 sends their
child states into one another and their counts coincide. Grouping equal
summands over each orbit gives (3). For orbit size, the map `g->g(N)` has
fibres the cosets of `K_N`; hence their number is the index. This uses only
that `K` is a subgroup of the constraint automorphism group, not that it is
the full group or that it extends to a processed history automorphism. QED.

There is **no multiplier for the orbit of the pivot**. A completion contributes
one row at the chosen `u`; it is not independently choosing its pivot. Nor does
dividing `f(S)` by `|Aut(S,c)|` give an unlabelled completion count: different
completions can have different stabilizers. Existential recursion may keep just
one row per orbit without weights, but exact labelled counting uses (3).

The full assigned row leaves a subgroup `K_N` preserving that row. Its action on
`U-{u}` lies in the child's constraint automorphism group by (2). Recomputing the
child group can safely enlarge this inherited action, because the child's exact
future semantics contains every condition left by the history. This is the
bridge that allows symmetry quotienting to benefit from forgetting history.

<a id="claim-d18c-symmetry-swap-blocks"></a>
### Claim 3. Verified interchangeable blocks yield binomial row orbits

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-swap-blocks`  
Kind: local-deduction  
Review state: ready  
Scope: every `(S,c)`, chosen pivot `u`, and the transpositions preserving all
of `(S,c)` while fixing `u`; no twin condition on any completed graph  
Dependencies: Claims 1–2; elementary symmetric-group generation  
Conclusion: the swap relation partitions labels into full symmetric factors;
compatible rows are represented exactly by block neighbor counts with (4)  
Search use: none pending independent review; proposed compact row branching  
Reviews: none

On `U-{u}`, declare `v~w` if `v=w` or the transposition `(v w)` lies in
`Aut(S,c)` and fixes `u`. This is an equivalence relation: symmetry is immediate,
and for distinct `v,w,z`, `(v w)(w z)(v w)=(v z)` proves transitivity.
Let its blocks be `D_1,...,D_b`, of sizes `m_i`. Every transposition inside a
block preserves the state, and they generate the subgroup

\[
 K=\prod_{i=1}^b\operatorname{Sym}(D_i)\le\operatorname{Aut}(S,c)_u.
\]

Since `u` is fixed, its fixed incident pairs are uniform within each block:
the whole block is forced adjacent, forced nonadjacent, or unassigned. A compatible
row orbit is determined by counts `a_i=|N cap D_i|`, with the forced values
`m_i` or zero when applicable, and otherwise `0<=a_i<=m_i`. Taking the first
`a_i` labels of each block gives a deterministic representative. Its orbit size is

\[
 w(a_1,...,a_b)=\prod_{i=1}^b\binom{m_i}{a_i}.
 \tag{4}
\]

Proof. The equivalence and subgroup statements were just established. A swap
would otherwise move a forced incident bit to a different or absent fixed bit,
contradicting preservation of `F`; thus the forced statuses are uniform. Inside
`D_i`, any two subsets of size `a_i` are carried into one another by a permutation,
while cardinality is preserved. The independent factors prove that count vectors
are precisely the row orbits. The number of subsets in each factor is its
binomial coefficient, and independent choices multiply, proving (4). This
also proves completeness without enumerating those subsets. QED.

The row stabilizer contains
`product_i (Sym(N cap D_i) times Sym(D_i-N))`. Both subblocks remain
interchangeable future labels after differentiation. This is a structural
recursion rule: a row splits each interchangeable block into neighbor and
nonneighbor parts. It does not force either part to be twins in a future graph;
the future graph is still arbitrary subject to its transported constraints.

Testing every transposition on the whole normalized state finds these blocks
without requiring a graph canonicalizer. If only some swaps are tested and
verified, connected components of the verified-swap graph still give a sound
product subgroup, by generation along paths; full tests find maximal blocks.
Coupled automorphisms requiring several swaps together may be missed. Missing
those symmetries costs efficiency, not correctness.

## Safe cross-state reuse

<a id="claim-d18c-symmetry-witnessed-memo"></a>
### Claim 4. Witnessed representative images permit exact memoization

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-witnessed-memo`  
Kind: local-deduction  
Review state: ready  
Scope: every residual state with colours; any representative selector returning
an explicit bijection and the exact transported state and colours; no optimality
or isomorphism-completeness hypothesis on that selector  
Dependencies: Claims 1–3; exact residual state congruence, ready  
Conclusion: equal witnessed image keys can share labelled counts; incomplete
representative selection remains correct; quotient recursion and DAG replay are exact  
Search use: none pending independent review; proposed symmetry memoization and replay  
Reviews: none

Let an image selector return `Image(S,c)=(g.S,g.c,g)` on dense labels
`0..|U|-1`. It may return a lexicographic orbit minimum, or just a transported
candidate. Store a count under the full normalized key `(g.S,g.c)`. If two inputs
have the same key, their completion counts are equal by Claim 1, so either can
reuse that count. No correction factor accompanies this memoization.

Proof. Each witnessed image is bijective with its own input completion set.
Equal image states have identical completion sets on the same dense labels.
Composing one transport with the other's inverse gives the input-to-input
bijection. Thus the equal count can be reused even if the selector does not
identify every pair of isomorphic states, or chooses different images for the
same orbit on different calls. Such omissions merely leave more cache keys.
Combining this fact with the weighted recurrence (3), induction on remaining
order proves the exact root count. Dense relabelling does not change remaining
order, and every differentiated edge lowers it, so the memo graph is acyclic.
The colour key restricts identifications but never adds graph completions. QED.

This contract admits bounded representative selection without an unproved
heuristic merge: a bound changes which valid relabellings are tried, never
replaces the full key by an invariant hash that could collide semantically.
Invariant colour histograms alone are not keys for merging.

For a quotient recurrence DAG, record the initial state and colours, its image
transport, and at every branch its pivot, certified interchangeable blocks,
each compatible count vector's representative row and binomial weight, its
normalized child, and the transport to the stored child key. A replay checks:

* Initial and child transports are bijections carrying **every** state tuple
  and the retained colours into the recorded keys.
* Within each branch block, swaps generate a subgroup preserving the complete
  state and fixing the pivot; each fixed incident status is uniform.
* The branch lists each compatible count vector once, or each generator orbit
  of those vectors once when Claim 7 applies, with its correct
  representative and product of binomial weights, or the generator-orbit weights
  of Claim 7 when supplied coupled generators are used. This proves coverage of all
  labelled rows without storing them individually.
* Child derivatives, rejected-child reasons, local Ramsey witnesses and empty
  leaves satisfy the original recurrence contracts.
* Each count equals the weighted sum of its children. Distinct rows or orbits
  sharing a child still contribute their weights separately.

These checks prove the root count by the same induction. Full group discovery
and proof that the selector found an orbit minimum are unnecessary for sound
counts. A root count zero still closes only the exact initial state, and global
input-family coverage remains an additional obligation.

<a id="claim-d18c-symmetry-refined-images"></a>
### Claim 5. Invariant refinement and swap cosets reduce representative selection

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-refined-images`  
Kind: local-deduction  
Review state: ready  
Scope: every finite `(S,c)`, any relabelling-invariant refinement of `c`, and a
verified product of symmetric swap blocks in `Aut(S,c)`  
Dependencies: Claims 1, 3–4; finite ordered encodings  
Conclusion: full enumeration of refined-class orderings modulo within-block
orders yields an exact invariant representative; any bounded prefix gives a safe
witnessed image; the adapter's refinement is equivariant  
Search use: none pending independent review; proposed representative selection  
Reviews: none

Refine vertex colours by repeatedly assigning a new colour from the sorted tuple
of the old colour and the following incidence multisets:

1. For each incident positive or negative obligation: its colour, threshold,
   and the histogram of current vertex colours on its support.
2. For each fixed pair incident with the vertex: its edge/nonedge bit and the
   current colour of the other endpoint.
3. For each budget incident with the vertex: its lower and upper bounds, the
   histogram of `(coefficient, unordered endpoint colours)` over all its
   nonzero pairs, and the multiset of `(coefficient, other endpoint colour)`
   at this vertex within that budget.

Rank distinct descriptors in sorted order, and stop when no class splits.
Zero-incidence budget vertices need no entry: the same omitted contributions
are reconstructible from the common budget family and the incident multiset.
Every step retains the old colour, so classes never merge and the partition
stabilizes in finitely many splits.

Proof. For equivariance, a transported obligation has the same threshold and
transported support colour histogram; a transported fixed pair has the same
bit and corresponding endpoint colours. A transported budget has the same
interval and coefficient-colour histogram, and transports each vertex's local
coefficient-colour multiset. The incidence tuples therefore correspond exactly
under any colour-preserving relabelling. Ranking descriptors makes the new
integer names identical on corresponding vertices. Induction proves
equivariance at every step and at stabilization. In particular, every verified
swap block lies inside one refined class.

Order the refined classes by their resulting descriptor ranks. Consider all
total vertex orders that concatenate these classes in that order, and within
each class interleave its swap blocks while retaining the fixed increasing
order inside each block. For class size `m` and block sizes `m_1,...,m_b`, the
number of such orders is

\[
 \frac{m!}{\prod_i m_i!}.
 \tag{5}
\]

For each order, relabel its successive vertices to `0,1,...` and encode the
full normalized state and transported original colours. Minimize that encoding.

Proof of completeness. All arbitrary orders within a refined class would give
the full invariant orbit representative for this convention, since relabelling
preserves its ranked class partition. An arbitrary order can be turned into
one increasing within each swap block by a permutation inside those blocks,
which is an automorphism of the whole state and colours. This changes the
transport witness but not the resulting encoded state. Thus the restricted
orders attain every possible image encoded by the unrestricted orders. Choosing
the minimum is invariant and belongs to the input's relabelling orbit. Equality
of minima implies isomorphism by Claim 4, and isomorphic inputs have the same
minimum. The number of interleavings is the multinomial in (5), and independent
refined classes multiply their numbers of choices. QED.

A candidate limit may stop before this minimum is established. The chosen
image still has a verified transport, so Claim 4 applies, but completeness of
isomorphism detection is no longer asserted. The prototype reports whether
selection was exhaustive. Equal candidate images also give explicit automorphism
witnesses, which Claim 7 uses for coupled row symmetry. A single full swap block
of size24 needs only one
order, rather than enumerating `24!` label permutations. Classes having no swaps
can still require factorially many orders, so the bounded fallback is material.

This is a sufficient exact refinement and coset construction, not a promise
that colour refinement identifies every automorphism. Coupled symmetries across
classes or across blocks are still handled by full representative enumeration
when enabled, but not necessarily by the swap-row subgroup.

## Connected d18 consequence

<a id="claim-d18c-symmetry-progressive-columns"></a>
### Claim 6. d18 rows split partial-column blocks instead of assigning labels

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-progressive-columns`  
Kind: local-deduction  
Review state: ready  
Scope: fixed connected `K4/I5`-free neighborhood `A` of a degree18 root,
24 future `B` vertices, all internal `B` pairs initially unassigned; process
`A` rows in any chosen order; uniform 18..24 degree budgets and optional uniform
`B`-edge or full cross-count budgets, no asymmetrically named `B` condition  
Dependencies: Claims 1–5; [d18 initial-state theorem](recursive_ramsey.md#claim-d18c-unified-interface), ready;
compare [reviewed column-multiset quotient](../symmetry_reduction.md#claim-d18-symmetry-01)  
Conclusion: equal partial columns are certified interchangeable blocks; row
branching uses count vectors, initially25 choices with exact binomial weights;
after all `A` rows the product weights equal the full column-multiset multiplicity  
Search use: none pending independent review; proposed progressive column quotient  
Reviews: none

After processing `t` vertices of `A`, let `D_sigma` contain `B` vertices with
the same length-`t` adjacency word `sigma` to those processed vertices. A
permutation inside any `D_sigma` fixes all processed incidences, unprocessed
`A` fixed pairs, and the root row. It preserves all differentiated homogeneous
support families and degree-budget families. It also preserves the optional
uniform budgets. Thus

\[
 K_t=\prod_{\sigma}\operatorname{Sym}(D_\sigma)
 \le\operatorname{Aut}(S_t,c),
 \tag{6}
\]

with separate role colours for remaining `A` and `B`. Assigning the next `A`
row chooses `a_sigma` adjacent labels from each block, at weight
`product_sigma binom(|D_sigma|,a_sigma)`, and splits each block into its two
extended words. Existing forced internal `A` incident bits are fixed choices.
The verified swap subgroup can be larger than (6); using it remains sound.

Proof. Equal partial columns let every within-block permutation extend by the
identity on all processed and remaining `A` labels, preserving the entire
partially specified input graph. The initial homogeneous constraints and
uniform budget family are invariant under those permutations. Claims 1–2 show
that their residual restrictions preserve the differentiated state, proving (6).
The pivot is an `A` vertex and is fixed. Claim 3 therefore gives the row choices,
weights and block splits. Every labelled cross matrix has exactly one trajectory
of splits, with within-block choices represented by these binomial factors.
This proves coverage independently of any column transversality filter. QED.

Before the first `A` row, all24 `B` vertices form one block. Its row choice
is just `a=0..24`, so there are25 representatives instead of `2^24=16,777,216`
labelled rows. The weight of size `a` is `binom(24,a)`. For internal `A` degree
`s`, the first row additionally requires

\[
 \max(0,17-s)\le a\le\min(17,23-s),
 \tag{7}
\]

from `18<=1+s+a<=24` and the Ramsey row cap17. For `s=8`, only seven
size representatives `a=9..15` survive these necessary tests, representing
14,233,964 labelled rows. This is a proved first-step compression, not a
measurement of later search performance or a feasibility claim.

After all18 rows, the blocks are the full column signatures `C subset A`,
with multiplicities `m_C`. The product of all block-split weights is exactly

\[
 \frac{24!}{\prod_C m_C!}.
 \tag{8}
\]

Indeed each split contributes `m!/(a!(m-a)!)`; parent factors cancel with
their child factors throughout the binary split tree, leaving the root24!
and only the final block factorials in the denominator. This is also exactly
the number of assignments of the final multiset to the24 `B` labels. The
remaining `B` recurrence must still count internal graphs under the fixed
columns, with its own pivot-stabilizer row weights. It must not multiply by
`product_C m_C!` a second time. Claim 2 already preserves the required labelled
count inside each residual state.

Formula (8) connects progressive row recursion directly to the existing
column-multiset quotient, while applying smaller Ramsey bounds and residual
cuts after each split rather than waiting for a full matrix. Automorphisms of
`A` can provide an additional coupled quotient when they transport every
column and budget together. A fixed-`A` stabilizer is not automatically the
full residual-state group after vertices have been forgotten.

<a id="claim-d18c-symmetry-coupled-generators"></a>
### Claim 7. Certified coupled generators act on compact count vectors

Claim ID: `research/n43/d18/c/recursive_symmetry.md#claim-d18c-symmetry-coupled-generators`  
Kind: local-deduction  
Review state: ready  
Scope: every normalized `(S,c)`, the full interchangeable-block subgroup of
Claim 3 fixing a chosen pivot, and any additional verified state automorphism
generators; no external group or graph canonicalizer  
Dependencies: Claims 1–5; elementary permutation group action  
Conclusion: equal-image witnesses yield automorphisms, Schreier generators fix
the pivot, and their count-vector orbits have the exact row weights (10)  
Search use: none pending independent review; proposed coupled row quotient  
Reviews: none

If two representative transports `a,b` have the same image of `(S,c)`, then
`b^{-1}a` is an automorphism of `(S,c)` by Claim 1. If the stored representative
uses transport `t`, conjugating by `t` gives an automorphism of that stored
state. Thus equal candidate images supply directly verifiable generators,
including automorphisms requiring several swaps together. Candidate limits can
miss generators but cannot invalidate those witnessed.

Some such generators move the chosen pivot. Let `H` be their generated subgroup,
including inverse generators, and build the orbit of the pivot `u`. For each
orbit vertex `v`, retain a permutation `t_v` with `t_v(u)=v` and `t_u=1`,
obtained by following generator edges. For a generator `g` and orbit vertex `v`,
the permutation

\[
 s_{g,v}=t_{g(v)}^{-1}g t_v
 \tag{9}
\]

fixes `u`. These permutations generate exactly `H_u`.

Proof. Each permutation in (9) sends `u` to itself and is a word in the supplied
generators, so their subgroup lies in `H_u`. For the reverse inclusion, write
an element `h in H_u` as `g_l...g_1`, with inverse generators permitted, and
track the successive orbit vertices `v_0=u`, `v_i=g_i(v_(i-1))`, `v_l=u`.
Each factor is `t_(v_i) s_(g_i,v_(i-1)) t_(v_(i-1))^{-1}`. Multiplying
these factors cancels intermediate transports and leaves a product of (9),
because both endpoint transports are identity. Thus (9) generates `H_u`. QED.

Let `K=product_i Sym(D_i)` be the full swap-block subgroup fixing `u`. It is
normal in `Aut(S,c)_u`: conjugating a permissible transposition by a
pivot-fixing automorphism gives another permissible transposition. Hence every
element of `H_u` permutes the blocks `D_i`, and its action sends a neighbor-count
vector `(a_i)` to the vector with those coordinates moved with their blocks.
Let `L=<K,H_u>`. Its row orbits are precisely unions of `K`-orbits whose count
vectors lie in one induced `H_u`-orbit. For a representative vector `a` with
vector-orbit `O_a`, the exact labelled-row weight is

\[
 |O_a|\prod_i\binom{|D_i|}{a_i}.
 \tag{10}
\]

Proof. Normality follows from the conjugation observation and generation by
within-block transpositions. An automorphism sends an equivalence block to an
equivalence block, preserving its size and incident fixed status. Its action
therefore descends to the count-vector set. Quotienting first by the normal
subgroup `K`, then by the induced `H_u` action, yields exactly the `L`-orbits.
Each vector's `K`-orbit has the product-binomial size of Claim 3. Block
permutations preserve that product, so summing it over the vector orbit gives
(10). All these rows have isomorphic children and equal completion counts by
Claim 2. QED.

The adapter builds count-vector orbits by generator traversal. It never
enumerates the vastly larger labelled-row set for that purpose. Every supplied
generator is checked on the whole state and colours; the pivot-fixing generators
can be replayed directly. With no coupled generators, count vectors stream
without storing a visited set. With generators, vector-orbit traversal still
has a potentially exponential memory cost, and no full-group size bound is
claimed.

For example, attach a distinguished free pivot to a fixed four-vertex path
constraint. None of the four path labels can be individually swapped while
preserving that path. Its reversal performs two swaps together. It identifies
the16 possible pivot rows into10 orbits: four invariant rows have weight1 and
six paired row orbits have weight2. Equal whole-state representative images
discover this reversal, and (9) retains it when the distinguished pivot is
chosen. This example checks coupled symmetry only, not an order43 Ramsey completion.

## Prototype contract and remaining work

The new adapter imports the unchanged original prototype. `SymmetryDP` uses
verified swap blocks plus discovered coupled generators for row orbits, and witnessed dense representatives for
memo keys. Its default limit is32 representative candidates per call. Setting
the limit to `None` requests exhaustive selection; no large input is run here.
The code does not request an external graph canonicalizer or enumerate a
large permutation group. Role colours travel through every child transport.

The accompanying [validation report](../../../reports/2026-10-22-d18c-recursive-symmetry.md)
compares tiny quotient counts with direct labelled semantics, checks group
transport and row coverage separately, and retains a small weighted DAG.
Author validation is not independent review. The original recursion claims
remain ready dependencies; no production pruning is promoted.

Symmetry does not force future twins, create a bounded-state theorem, or provide
a complete connected-neighborhood family. Split blocks may become small, and
the residual orbit space may still be enormous. These results supply an exact
symmetry-aware recurrence and a large first-row reduction; the connected branch
and the order43 decision remain open. Independent mathematical and code review
precedes certified use, and nontrivial computational research remains subject
to the repository's run and evidence policies.
