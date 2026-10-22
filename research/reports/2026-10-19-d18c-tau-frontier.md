# Connected degree18 tau research: the x138 frontier

Started: 2026-10-19. Integrated: 2026-10-20. Task: `d18c-tau-frontier-20261019`.
Kind: mathematical research. Authors: Main, TauQ0Closure, TauQ1Closure.

**Status: full x138 exclusion independently accepted. All18 new claims accepted.**
No novelty claim, formal certificate, or complete order43 nonexistence.
The deductions are conditional on the published Ramsey/edge-extremum
premises already recorded in the repository. No new external premise,
solver, catalogue completeness assertion, or graph search is used.

## Chosen case and full coverage

G is an order43 K5/I5-free graph, v has degree18, A=N(v), B=M(v).
A is K4/I5-free, not I4-free; B is K5/I4-free. Write

    q=85-e(A), E_A=sum_A(d_G(a)-18), x=e(A,B)=136+2q+E_A.

At x138 the exact nonnegative budget partitions the case into precisely:

|Slice|e(A)|E_A|Proof|
|---|---:|---:|---|
|q0|85|2|[Effective-weight exclusion](../n43/d18/tau/q0_effective_reduction.md)|
|q1|84|0|[Zero-excess exclusion](../n43/d18/tau/q1_anchor_reduction.md)|

Both excess distributions in q0 are covered: one excess-two vertex or two
excess-one vertices. Neither proof fixes an anchor before locating excess.
Connectedness is automatic at these edge densities but is not needed by
either argument. No existence of a low-x root in every candidate is assumed.

## The tau mechanism

Put w(a)=d_A(a)-(d_G(a)-18), L={w<=7}, D={w=8}.
For either slice sum_A w=168 and d_B(a)=17-w(a). Every I4 in A has
weight sum at most32, from the actual24 B columns and their singleton
class cap3. A weight-eight independent quartet is a saturated anchor:
it forces four singleton triangles in B, twelve double signatures, and
at least two neighbors in the anchor for every A vertex outside it.

The key strengthening is **projected** rather than full-column capacity.
If U contains every I4 of A and tau(I4(A))>=5, then

    e(U,B)=sum_U(17-w)>=24*5=120.

Vertices unable to occur in any I4 cannot contribute to this capacity.
The [general support theorem](../n43/d18/tau/transversal_support.md)
makes this uniform using the sum of the three smallest other weights.

### q1: zero neighborhood excess

Here w=d_A. An accepted finite-moment anchor theorem supplies an anchor.
Three disjoint anchors would force an induced K222 remainder with saturated
four-neighbor attachments. That equality is impossible. Two complete
transversal-deletion tables then force |L|<=1.

An abstract four-transversal has all member degrees at least8. Projecting
it to D, or to three D vertices together with the unique possible low
vertex, leaves a14vertex (4,4)-free graph with at least52 or53edges,
above the recorded maximum50. Thus tau>=5.

If L is empty, D has at most13vertices, giving capacity at most117.
With L={u}, h=d_A(u), t=|D|, exactly four numerical cases remain:
(5,11),(6,11),(7,11),(7,12). In every one, the possible I4 support carries
at most118 B-incidences. This contradicts120 and excludes the slice.

### q0: two excess units

Here weights can be below actual A degrees. The proof retains the exact
nonnegative deletion defects rather than silently transferring x137.
The anchor-existence argument resolves all low-set-transversal exceptions:

- A10vertex31edge core has a unique triangle-free seven-set whenever
  such a set exists; the two forced unit-excess attachments give I5.
- The exceptional9vertex26edge core is exactly K333 minus one cross
  edge. Eight forced full-two-part attachments exceed its capacity3.
- The remaining Turan equality cores K332 and K322 exceed their explicit
  triangle-free attachment capacities.

The nine-vertex classification is derived in the proof, not read from a
catalogue. Three disjoint anchors are excluded for every allocation of the
two excess units. Exact deletion then leaves |L| in{0,1,3,4}. A further
abstract-transversal argument proves tau>=5 in all four cases.

Zero or one low vertex is excluded by projected capacity. The apparent
one-low exception has weights4,8^11,12^2,13^4; its six highest-degree vertices
would be independent because every adjacent A pair has degree sum at most22.
It therefore contains I5.

For four low vertices, equality leaves a10vertex31edge core. The exact
Goodman/Mantel defect budget is8, forcing internal minimum degree5 and at
most two degree-five vertices. Combined with the adjacent-degree bound,
its only possible external-weight multisets are10^2,11^8 and9,11^9.
Each gives an explicit abstract four-transversal, contradicting tau>=5.
These multisets are necessary scalar profiles, not graph isomorphism classes.

For three low vertices, equality leaves an11vertex36edge core with total
weight115. The adjacent-degree bound and I4-freeness show it has at most
two extra weight-eight vertices: three would give the four exhaustive upper
bounds112,114,113,113, all below115. Double domination then forces all
anchors to share a vertex. That vertex together with L is a four-transversal,
the last contradiction. Thus no low-count possibility survives.

## Generalized consequences

Both slice proofs are independently accepted; with the accepted x136/x137 exclusions:

- Every degree18 root satisfies x>=139 and2q+E_A>=3.
- q0 requires E_A>=3; q1 requires E_A>=1.
- E_A=0 requires q>=2, e(A)<=83 and x>=140.
- For an entirely18regular candidate, every root has q in{2,3,4}, not
  merely a specially selected root. The triangle and independent-triple
  counts satisfy1161<=t(G)<=1189 and1864<=i3(G)<=1892.

These are rooted necessary restrictions. They do not exclude the full
connected branch, prove root-unavoidability at x139, affect the separate
d20/minimum-degree20 schemes, or determine R(5,5).

The support theorem applies at arbitrary q and E_A. Its complete-tripartite
attachment lemma gives at most4-p_i vertices having two whole parts as
neighbors and omitting a part of size p_i. This abstracts the equality
obstructions without claiming all tripartite cores are forbidden.

## Independent review record

The two q0 authors are Main and TauQ0Closure; its two reviewers were distinct
third identities. The q1 author is TauQ1Closure; its reviewer is independent
of authorship and parent self-checks. All four reviews accepted their full
assigned claims; dependency gates are satisfied. Nonblocking implicit-notation
notes are retained in the reviews. No unreviewed source claim was promoted.

- [q0 foundations review](../n43/d18/tau/review_q0_foundations_20261019_independent.md):
  claims1..4, anchor existence and exact equality coverage.
- [q0 closure review](../n43/d18/tau/review_q0_closure_20261019_independent.md):
  claims5..10, transversals, support, moment cores and final consequences.
- [q1 review](../n43/d18/tau/review_q1_anchor_reduction_20261019_independent.md):
  all five claims and full slice coverage.
- [General support review](../n43/d18/tau/review_transversal_support_20261019_independent.md):
  all three support, attachment and transfer claims.

Exact accepted author-stage revisions and final integrated hashes:

|Proof|Reviewed SHA-256|Integrated SHA-256|
|---|---|---|
|q0_effective_reduction.md|491b9c76a125cec320f5adcf3474a53f4d39e5885d455d702385efe6342ce0a8|9057b108cccaf6e7eb2df9a49d34e5c6811a6dbbd8cebb77c67e02173059ea06|
|q1_anchor_reduction.md|aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7|a58627f9ae262a2bd4d8f5d56183229a2844f43b092d3b523acac78f2c080b45|
|transversal_support.md|905edd28fcd6640dd4246a83b01251405525c1c43ed475e00cc620835be8f67a|41ea19654ef8aa2b3ca9917aa1d4040f6595b919b15680552e8730d72561c238|

Acceptance banners are additive metadata only. All three reviewed proof
bodies were checked byte-for-byte against retained exact pre-integration
inputs and passed. Their historical ready/Reviews:none labels are governed
by the acceptance banners, following the existing repository convention.

|Independent review|Final SHA-256|
|---|---|
|q0 foundations|1f417bc87cd2f3e7779120544527e0daef3edb0fe803b27ea9c1d3a144190f97|
|q0 closure|8d5ee2c341719ec03a37f9fa4d4a63c0c6b68784c539ea5bea89bacef6b16081|
|q1 closure|9378b76356680274635046fd242f5a2ed3139e01f61e5abe0ed7c0444f3f7fd3|
|general support|1ca91635c876530d833e2281f2f756057a623857855e9f3826b11937178f45f5|

The initial q0 handoff hash was
`0117ceb620f8d27b501cf3fd3a42c2daac7a5fb1d5d1ab1a4ba5c51915b4d433`.
Before review completed, Section7 explicitly separated the one-low-plus-
three-anchor quartet (excluded by double domination) from one-low quartets
meeting H (excluded by the weight bound). Both q0 reviewers were redirected
to the corrected exact revision above; the initial hash is not the final
review target.

## Executed self-checks

Python3.12.3 in the retained session Python runtime; standard library only.
Successful exact scalar/tiny fixed-object validation, not independent review
and not candidate exploration. No large artifacts or CNFs generated.

1. The K222 remainder has exactly three triangle-free four-subsets, each
   two full parts. Their omitted-part classes permit at most two vertices.
2. All72 two-extra-vertex attachment/edge patterns over a fixed independent
   four-anchor with two neighbors per extra have at most two independent
   quartets and a common anchor vertex. Extra attachment edges can only
   remove quartets, so this covers the at-least-two-neighbor condition.
3. The order-ten moment certificate has budget8 and exact degree costs
   44,30,18,10,4,0,0,2 for degrees1..8. The order-eleven comparison has
   budget11 and costs34,22,11,5,0,0,1 for degrees2..8.
4. An independent small integer-profile replay using only justified degree
   caps and the moment budget leaves exactly9,11^9 and10^2,11^8 in the
   four-low core. This checks the proof's arithmetic, not graph realizability.
5. The three-low bounds are112,114,113,113. All four q1 support cases
   attain the safe upper bound118, below120. The x138 budget split and
   regular triangle/triple endpoints replayed exactly.
6. Three fixed cores were exhaustively checked for K4/I4, showing that the
   extreme cores themselves exist and must be excluded by attachments:

|Fixed core|Vertices|Edges|Four-subsets checked|Forbidden|
|---|---:|---:|---:|---:|
|I3 joined to C7 plus chords03,14,25|10|31|210|0|
|I3 joined to C8 plus opposite chords04,15,26,37|11|36|330|0|
|K333 minus edge03, parts012/345/678|9|26|126|0|

The ten-core's triangle-free seven-set is unique; the nine-core's triangle-
free six-sets are exactly the three unions of two parts. These checks
exercise the exceptional structures used by the proofs; they do not certify
an order43 candidate or a graph catalogue.

Source premise hashes are retained in the proof notes. No Lean/engine/code
was changed, so their build and test suites were not invoked. No solver,
graph catalogue, external fetch, package install, Git staging, commit,
checkout switch, or destructive command was performed by Main or proof authors.
All403 local Markdown targets/anchors across18 touched Markdown artifacts
passed validation; the historical zero-excess JSON parsed and its new target
paths resolved. Current branch dashboards, tau applicability, reduction index,
frontier status, historical w0 status and audited theory map were updated.
The theory-map formalization backlog records that these new proofs are not
yet mirrored in Lean. Existing x136/x137 proof bodies and the sorry ledger
are intentionally unchanged. Higher-x connected d18 remains open.
