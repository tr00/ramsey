# Independent review: q=1 zero-excess anchor reduction

Claim(s): `n43/d18/tau/q1_anchor_reduction.md` — all five claims:
`#claim-q1-saturated-anchors`, `#claim-q1-three-anchor-obstruction`,
`#claim-q1-at-most-one-low-degree`, `#claim-q1-five-transversal`,
`#claim-q1-projected-capacity-exclusion`.

Author and reviewer: author `TauQ1Closure` (task token
`tau-q1-closure-20261019`); reviewer token `independent`, a distinct identity.
This review rederives each argument from the setting and the recorded premise
chain; no author self-check, parent validation, or prior report is treated as
evidence here.

Reviewed revision: base commit
`1581b3ae1b0e5ca5b65a6177fd8d04678ef96782` (verified equal to repository HEAD
at review time) plus the exact SHA-256 of the uncommitted file

    aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7

which matches the expected hash in the review assignment. The file is
untracked in git at review time; no edits were made to it by the reviewer.

Scope: only the five claims above, i.e. the `q=1, E_A=0, x=138` slice of the
degree-18 pivot. This review does **not** cover the `q=0, E_A=2` x138 slice,
any `q>=2` slice, the full x138 branch, the full d18 branch, connectedness
questions, or `R(5,5)`. Review method: full re-derivation plus scalar
arithmetic recomputation of every displayed integer table. No graph search,
solver, catalogue processing, download, installation, or theorem prover was
used.

## Dependencies reviewed and provenance

| Dependency (claim) | Role | Current file SHA-256 | On-record reviewed SHA-256 | Provenance check |
| --- | --- | --- | --- | --- |
| `../sos_finite_moments.md#claim-finite-q1-anchor` | Setting input 1 (anchor existence at `q=1,E_A<=29`) | `cc4a8d4b3850122d37ad871d4a41f3f8275dbe0e71a5343258bdb209919b3404` | `87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94` (`review_sos_finite_moments_20261015_columns.md`, base HEAD `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`) | verified exact, see below |
| `../sos_finite_moments.md#claim-finite-core-caps` | `U(11)=36` | same file, same as above | same review, same body hash | verified exact |
| `../x136/five_column_compatibility.md#claim-five-columns-core-caps` | `U(10)=31` | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` | `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b` (`x136/review_five_column_compatibility_20261015_independent.md`, input HEAD `7ebbef265ef9b55746b798b337b86e4fd6140045`) | verified exact, see below |
| `../four_column_stability.md#claim-four-column-stability-01` | comparison target of the Claim 4 floor | `71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a` | `71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a` (`review_band137_four_columns_20261014_coordinator.md`, base commit `81c768a683d3c3b3df70d4d3b7d03a67d505447b`) | byte-identical to current file |
| root `README.md#state-of-the-art` | `R(3,4)=9`, `R(3,5)=14`, `E(4,5,17)<=79`, `E(4,4,12)<=40`, `E(4,4,14)<=50` | `a31dbbee3d997679089ed94c8ac8fd09ccebaf01aebd4dc42f6ccf1ee4660fac` | n/a (literature table) | hash matches the target's source table; values re-read, not recertified |
| `../c/w0/research.json` | comparison only | `88c31770ed2011a82248902ad14f7572bfaaf4b08202fa58c97ed3b89c5661a1` | n/a (marked pending) | no assertion of this file is used as a premise; confirmed unused |

All nine source hashes recorded in the target's "Source revision hashes"
table were recomputed and match byte-for-byte, including
`docs/workflow.md` `51220632...`, `x137/effective_anchor.md` `2eed07f6...`,
`x137/frontier_closure.md` `7090245d...`, and `frontier_band.md`
`c13e57b0...`.

Provenance verification of the two banner-protected dependencies (the banner
alone is an author assertion, so the hashes were recomputed from git):

- `sos_finite_moments.md`: commit `1dea550` (whose parent is exactly the
  recorded base HEAD `5c8d205`) has SHA-256 `3475235a...`; removing the
  integration banner block
  `<!-- sos-theory-integration:start --> ... <!-- sos-theory-integration:end -->`
  and its trailing newline yields SHA-256
  `87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`,
  exactly the reviewed-body hash. The only diff from `1dea550` to the current
  file is 18 changed lines, all of the form `Review state:` or `Reviews:`
  (metadata integration); no mathematical text changed after review.
- `x136/five_column_compatibility.md`: commit `249f50a` minus its integration
  banner block and trailing newline yields SHA-256
  `a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b`,
  exactly the reviewed hash. The only diff from `249f50a` to the current file
  is review-state metadata lines.

Thus each accepted dependency's mathematical body in the current tree is
byte-identical to its independently reviewed body, and the current file
hashes match those recorded by the target. All link anchors named in the
target exist in the current files (`claim-finite-q1-anchor`,
`claim-finite-core-caps`, `claim-five-columns-core-caps`,
`claim-four-column-stability-01`, and the root `## State of the Art`
heading).

Dependency applicability: the q1 anchor theorem's scope is
"every degree-18 rooted candidate with `q=1,E_A<=29`"; the setting has
`q=1, E_A=0`, so its hypotheses hold. Its conclusion used here (an I4 with
all four A-degrees at least eight) was re-read in the dependency's proof: it
follows from "`L` is not a transversal" plus the degree floor, and its
`E_A=0` specialization gives exact degree eight. Only that conclusion is
consumed; no other assertion of the dependency (or of the pending research
JSON) enters the five claims.

## Checks

### Setting algebra (recomputed)

`|A|=18`, `|B|=24` from `d(v)=18` on 43 vertices; `e(A)=84` from `q=85-e(A)=1`;
`sum_A d_A = 2*84 = 168`; with minimum degree at least 18 (a universal
premise of the branch, recorded `[PUBLISHED]` from `R(4,5)=25` in
`n43/reductions.md` section 4.1, so `E_A=0` forces global degree 18 at every
A vertex, matching `x138/q1/README.md`), `d_B(a)=18-1-d_A(a)=17-d_A(a)` and
`x = 306-168 = 138`, consistent with the identity `E_A = 2e(A)+e(A,B)-306`
in the root README and with `x = 136+2q+E_A`. Both x138 profiles evaluate to
`x=138` (`q=1,E_A=0` and `q=0,E_A=2`), so the conclusion "no `q=1,E_A=0`
rooted graph exists, equivalently this x138 slice is empty" matches the
branch's disjoint profile split.

Ambient types: `A` is K4-free (a K4 in `A` plus `v` is K5) and I5-free, so
`A` is (4,5)-free and may contain I4; `B` is (5,4)-free (an I4 in `B` plus
`v` is I5); every `C_y` meets every member of `F=I4(A)` (an I4 disjoint from
`C_y` together with `y` is I5). All were rechecked against the uses in the
proof.

### Claim 1, saturated anchors (rederived)

For `I in F` every `y in B` has a signature `C_y cap I` of size at least 1.
An exact-singleton class is a clique (a nonadjacent pair plus `I-{i}` is I5)
and has size at most 3 (four members plus their common anchor vertex are K5),
so `n1 <= 4*3 = 12` and `e(I,B) >= n1 + 2(24-n1) = 48-n1 >= 36`. Row sums
give `e(I,B) = 68 - sum_I d_A`, hence `sum_I d_A <= 32`. Input 1 gives one
`I4` with all four degrees at least 8, hence exactly 8; such an anchor has
`e(I,B)=36`, forcing equality everywhere: `n1=12` as four triangles, twelve
double signatures, and each anchor vertex `d_B=9 = 3 + 6` double incidences
(`4*6 = 24 = 2*12`, consistent). Double domination: a vertex of `A-I` with no
I-neighbor gives I5; with only `i`, a nonedge to a member of `i`'s
three-element singleton triangle gives I5 on `{a,y}+ (I-{i})`, and
adjacency to all three would make `{a,i,y1,y2,y3}` a K5. Hence every
`a in A-I` has at least two I-neighbors, and `e(A-I) = 84-0-32 = 52`.
All steps, including the strict use of the anchor (not arbitrary I4)
hypothesis in the double-domination paragraph, check out.

### Claim 2, three disjoint anchors (rederived)

With disjoint anchors `I,J,K`, `Z` of size 12 and `R` of size 6: double
domination gives `e` at least 8 per anchor pair, so `e(A[Z]) >= 24`;
`A[R]` is K4-free so `e(A[R]) <= U(6) = 12` (Turan `T(6,3)`); and
`96 = sum_Z d_A = 2e(Z)+e(Z,R)` gives the exact identity
`84 = 96 - e(A[Z]) + e(A[R]) <= 96-24+12 = 84`. Equality forces
`e(A[Z])=24`, `A[R]=K_{2,2,2}` (Turan equality case, unique), each anchor
pair exactly 8 edges, and each vertex exactly 2 neighbors in each other
anchor and exactly 4 in `R`. The R-neighborhood of any `z in Z` is
triangle-free (a triangle with `z` is K4 in `A`), a triangle-free subset of
`K_{2,2,2}` lies in at most two parts, and four elements then equal two whole
parts, so each `z` omits exactly one part. With `n_j` omitters, each
`r in P_j` has `d_A(r) = 4 + (12-n_j) = 16-n_j <= 13`, so `n_j >= 3`, and
`sum n_j = 12` gives `n_j <= 6`. Two of the four vertices of `I` share an
omitted part (pigeonhole), and `{i,i'} + P_j` is an I4 of degree sum
`48-2n_j >= 36 > 32`, contradicting Claim 1. Verified.

### Claim 3, `ell<=1` (rederived, both tables recomputed)

`168 <= 7ell + 13(18-ell)` gives `ell <= 11`. Fixing an anchor `I`
(disjoint from `L`), Case A (`I+L` a transversal) gives
`e(H) = 84 - sum_(I+L) d_A + e(A[I+L]) >= 84 - 32 - 7ell + 2ell + b4(ell)
= 52-5ell+b4(ell)` on `14-ell` vertices: the `2ell` is double domination
from the anchor, `b4(ell)` is the Turan lower bound
`e(A[S]) >= b4(j)` valid for every j-set (complement of `A[S]` is K5-free,
so `e(A[S]) >= C(j,2)-ex(j,K5) = b4(j)`; recomputed: `b4(2..11) =
0,0,0,1,2,3,4,6,8,10`). Recomputed rows
(`ell: order, lower, U`): `2:12,42,40; 3:11,37,36; 4:10,32,31; 5:9,28,27;
6:8,24,21; 7:7,20,16; 8:6,16,12; 9:5,13,8; 10:4,10,5; 11:3,7,3` — every row
strictly exceeds `U`, and the Turan caps `U(0..9)=0,0,1,3,5,8,12,16,21,27`
were recomputed as `ex(m,K4)` (with equality at 6 being `K_{2,2,2}`).
Hence `I+L` is not a transversal and an anchor `J` disjoint from it exists;
at `ell=11` the remainder has order 3 and cannot contain the 4-set `J`
(equivalently, the transversal antecedent is vacuous and the row itself
contradicts), so `ell=11` is excluded, matching the text. Case B
(`I+J+L` a transversal) gives
`e(H') >= 84-64-7ell+8+4ell+b4(ell) = 28-3ell+b4(ell)` on `10-ell` vertices
(`8` from the anchor pair, `4ell` from two double dominations). Recomputed
rows: `2:8,22,21; 3:7,19,16; 4:6,16,12; 5:5,14,8; 6:4,12,5; 7:3,10,3;
8:2,8,1; 9:1,7,0; 10:0,6,0` — every row strictly exceeds `U`. For
remainder orders at least 4 this yields a third anchor `K`, contradicting
Claim 2; for orders below four (ell in 7..10) the derived I4 cannot exist in
the remainder, a contradiction on the other reading, as the text notes.
Both readings are covered; every `ell>=2` is eliminated, so `ell<=1`.

### Claim 4, `tau>=5` (rederived)

Degree floor for any four-set transversal `T`, `Q=A-T` of order 14 with
`e(Q)<=U(14)=50`: for `t in T`, `J=T-{t}`; each Q-neighborhood is
triangle-free (a triangle with the vertex is K4 in `A`) and I4-free (subset
of `Q`), so has order at most 8 by `R(3,4)=9`. If `e(A[J])<=2`,
`e(A-t) = e(Q)+e(J,Q)+e(A[J]) <= 50+24+2 = 76`. If `J` is a triangle: the
triple intersection of the three Q-neighborhoods is empty (K4 in `A`), each
pair intersection is independent (that edge plus the J edge is K4) and
anticomplete to the third J vertex (K4), hence has size at most 3 (four
independent such vertices plus the third vertex are I5), and
inclusion-exclusion gives `e(J,Q) <= 14+3*3 = 23`, so
`e(A-t) <= 50+23+3 = 76`. The two cases are exhaustive (`e(A[J])` is 0..3).
Thus `d_A(t) = 84-e(A-t) >= 8`, an exact rederivation of the specialization
of `claim-four-column-stability-01`, whose scope states the abstract proof
uses only the (4,4)-free remainder, the order-14 maximum 50, `R(3,4)`, and
K4/I5 constraints.

- `ell=0`: every vertex has degree at least 8, so Claim 1 forces every I4
  into `D`; `T cap D` is a transversal, extendable to a four-set `S` in `D`
  (an anchor supplies four such vertices), and
  `e(A-S) = 84-32+e(A[S]) >= 52 > 50`, contradicting `U(14)`.
- `ell=1`: `L={u}`, `h=d_A(u)` in `{5,6,7}` (floor 5, definition of `L`).
  The floor gives `u notin T`. Every I4 avoiding `u` lies in `D`, so
  `T cap D` meets all of them. If `|T cap D|<=3`, extend to a three-set `S`
  in `D`; then `A-{u,S}` (order 14) is I4-free by the same reason, and
  `e = 84-h-24+e(A[{u}+S]) >= 60-h >= 53 > 50`, contradiction. So
  `T cap D = T` (size four) and the 52-edge contradiction applies.
- A smaller transversal enlarges to a four-set, preserving transversality.

Coverage of `ell in {0,1}` is complete and the abstract (not actual-column)
quantifier is used consistently. Hence `tau>=5`.

### Claim 5, projected capacity (rederived)

`ell=0`: every I4 lies in `D`, so each `C_y cap D` is an abstract
transversal of size at least 5 (Claim 4), and
`9t = e(D,B) = sum_y |C_y cap D| >= 24*5 = 120` gives `t>=14`, while
`168 <= 8t+13(18-t) = 234-5t` gives `5t<=66`, `t<=13`. Contradiction.

`ell=1`: `(C_y cap D) + {u}` is a transversal (every I4 either contains `u`
or lies in `D`), so every `C_y` meets `D` in at least 4 vertices, giving
`9t >= 96`, `t >= 11`. The sum bound `168 <= h+8t+13(17-t) = 221+h-5t`
gives `5t <= 53+h`: `t<=11` at `h=5,6`, `t<=12` at `h=7`. The parameter
list `(5,11),(6,11),(7,11),(7,12)` is therefore complete.

`t=11`: `H=A-(D+{u})` has six vertices of degree at least 9,
`sum_H d_A = 168-h-88 = 80-h`, deficit `sum_H(13-d_A) = h-2`, so each
degree is at least `15-h`. An I4 through `a in H` avoiding `u` has sum at
least `9+3*8 = 33`, so it contains `u`, and then `h+d_A(a)+2*8 <= 32` forces
`d_A(a) <= 16-h`, i.e. `a in H0`. Each `H0` member consumes deficit at least
`h-3`; two would need `2(h-3) <= h-2`, i.e. `h<=4`, false for
`h in {5,6,7}` (recomputed: needs `4<=3`, `6<=4`, `8<=5`). So `|H0|<=1`
and each `H0` member has `d_B <= 17-(15-h) = h+2`. Every I4 lies in
`U = D+{u}+H0` whether or not the low vertex or `H0` vertex actually occurs
in one (the discarded `H-H0` vertices are proved incapable of occurring), so
`C_y cap U` is a transversal and Claim 4 requires `e(U,B) >= 120`, while
`e(U,B) = 99+(17-h)+sum_H0(17-d_A) <= 99+(17-h)+(h+2) = 118 < 120`
(the `H0`-empty subcase gives `116-h <= 111`). Contradiction for all three
`t=11` cases.

`(h,t)=(7,12)`: the five remaining `H` vertices sum to `168-7-96 = 65 =
5*13`, so all have degree 13; an I4 through such a vertex has sum at least
`13+3*8 = 37` (without `u`) or `13+7+2*8 = 36` (with `u`), both above 32,
so all I4 lie in `D+{u}` and `e(U,B) = 12*9+10 = 118 < 120`. Contradiction.

No `ell` or `(h,t)` case remains; the coverage is exhaustive.

### Cross-boundary and scope checks

- Objects crossing claim boundaries are all consumed: the anchor (Claim 1)
  is consumed by Claims 2, 3 and by the `D`-containment statements in Claims
  4 and 5; `ell<=1` (Claim 3) is the case split of Claims 4 and 5;
  `tau>=5` (Claim 4) is the capacity threshold of Claim 5; `H0` and `U`
  (Claim 5) are consumed only by the same claim's capacity inequality. No
  produced value is silently dropped at any consumer.
- Slice boundary: `q=1, E_A=0` with `x = 136+2q+E_A` gives exactly the x138
  q1 profile of `x138/README.md` (`2 = 2q+E_A`), and the file explicitly
  leaves `q=0,E_A=2` and all `q>=2` outside its conclusion. The consequence
  paragraph's `x>=140` for `q>=2` follows from `x = 136+2q+E_A >= 140`, and
  the x136/x137 closures it cites are recorded excluded in
  `n43/d18/README.md` and `n43/reductions.md`.
- No x137 constant leaked into the proofs: the only occurrences of `85` are
  the definition of `q`, all internal arithmetic uses `e(A)=84` and
  `sum d_A=168`, and `117` appears only in the comparison sentence; the
  x137 closure's own capacity line (`<=99+(17-h)+(1+h)=117<24*5`) was read
  to confirm that comparison.
- Connectedness: no step uses connectivity of `A`; the stated
  "without a connectedness assumption" scope is accurate.
- Quantifiers: Claim 4's floor is proved for abstract four-set
  transversals, and Claim 5 applies it to the subsets `C_y cap D` and
  `C_y cap U`, which are abstract transversals, not only to full columns.
- Search use: none claimed, none needed; every step is inequality,
  counting, pigeonhole, inclusion-exclusion, Turan with its equality case,
  and the recorded Ramsey/census values.

## Findings

No gap, incorrect step, missing case, or scope overreach was found in any of
the five claims. Both deletion tables, the `b4` and `U` rows, the deficit
arithmetic of Claim 5, and the capacity sums were independently recomputed
by scalar arithmetic and match the file exactly.

## Outcome

**accepted** — all five claims of
`n43/d18/tau/q1_anchor_reduction.md` at SHA-256
`aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`
(base commit `1581b3ae1b0e5ca5b65a6177fd8d04678ef96782`) are accepted as
correct on the recorded premise chain, for the stated scope: the
`q=1, E_A=0, x=138` slice of the degree-18 pivot is empty. This is not
acceptance of the `q=0, E_A=2` slice, the full x138 branch, or the d18
branch. The proof file's per-claim `Reviews: none` labels remain in the
proof (the reviewer does not edit the proof); the coordinator should add the
review link and update review states at integration.

## Limits and unverified premises

- Literature/census premises were read from the root `README.md` state-of-
  the-art table and the reduction index, not recertified from the
  literature: `R(3,4)=9`, `R(3,5)=14`, `R(4,5)=25` (degree range),
  `E(4,5,17)<=79` (Angeltveit--McKay, ref [1]), `E(4,4,12)<=40` and
  `E(4,4,14)<=50` (McKay--Radziszowski 1992, ref [2]), and the published
  `e(A)<=85` behind the definition of `q`.
- Turan's theorem and its equality case, `R(3,4)`/`R(3,5)` applications,
  inclusion-exclusion, and the pigeonhole steps were re-derived here.
- The q1 anchor dependency's own interior argument (its `q<=2`
  transversal theorem and ell-tables at `E_A<=29`) was relied on through its
  recorded exact-revision acceptance; its statement and its use of the
  hypotheses were re-read and checked, but its full proof was not
  re-audited in this review.
- No formal verification, no novelty check, no order-43 or catalogue
  exhaustion certificate accompanies this acceptance. The author's process
  statement (no search/solver/tool use) is taken as recorded, not verified.
- Acceptance applies to this exact file hash; any change to the proof
  requires renewed exact-revision review.
