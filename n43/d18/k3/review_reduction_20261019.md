# Independent review: K3 row-signature cover, reroot, and 360-bit completion

Date: 2026-10-19. Review of `n43/d18/k3/reduction.md`, all three claims.

## Template record

Claim(s): `n43/d18/k3/reduction.md#claim-k3-signature-cover`,
`#claim-k3-reroot-cover`, `#claim-k3-exact-completion` (anchors verified
present and matching their Claim ID fields).

Author and reviewer: author is Main under task `research-d18k3-20261019`;
reviewer is an independent review session with no authorship of the file.
Identities are distinct, per workflow. The author's own validations
(direct bounded count, generating-function DP, four-key 4096-matrix
rectangle smoke) were reported to this review but are author-side
self-checks and are **not** evidence for this outcome.

Reviewed revision: exact uncommitted file (directory `n43/d18/k3/` is
untracked at HEAD `3eebcca`), SHA-256

    9f3f48776d876351ff7f8e6f7e07d66aac39e14fdae7f53988edd265dabc1c94

Hash taken at review start and again immediately before writing this file;
identical, so the reviewed revision is exact and stable.

Dependencies reviewed:

- `n43/d18/neighborhood_connectivity.md` claims 01-03, read in full.
  Review state accepted (reviews: `reports/2026-10-17-d18-connectivity.md`
  with Lean verification; claim 03 addendum
  `review_neighborhood_connectivity_20261018_conn3_rigor.md`). Its
  claim-connectivity-02 conclusion (disconnected degree-18 neighborhood:
  a in [53,58] at m=3, a=61 at m=2, a=68 at m=1; a>=69 forces connected)
  rechecked against its own proof: 3+[50,55], 1+60, 0+68 with the census
  intervals quoted in the recorded direction. Claim-connectivity-03(b)
  gives d_B(u)=18-m+epsilon_u and epsilon_u<=m-1 for clique vertices, i.e.
  at m=3 exactly |R_i|=15+e_i with e_i in {0,1,2} as the Setting states.
- `n43/reductions.md` sections 4.1 (18<=d<=24 via published R(4,5)=25),
  5.2 (17-s_u <= r_u <= min(17,23-s_u), so rows 15..17 at s_u=2), 5.4
  (edge pair <=8; triangle <=3 common cross-neighbors) and 4.2
  (G[B] is (5,4)-free): all cited bounds are present at the cited
  sections (one citation precision note, finding 2).
- Root `README.md` table: R(3,4)=9, R(4,4)=18, R(4,5)=25,
  (4,4,15)=50..55, (4,4,16)=60, (4,4,17)=68, (5,4,24)=144..160. All
  quantities the reduction quotes are in the table in the direction used.
- `n43/d18/k3/README.md` branch predicate (order43 K5/I5-free, d(v)=18,
  G[N(v)]=K3 disjoint-union C15 with C15 (4,4)-free) matches the
  reduction's Setting verbatim, and its scoping warnings match claim 2's
  and claim 3's conclusion text.
- Unresolved external premises, recorded and not re-certified by author or
  reviewer: the census intervals, the Ramsey numbers, R(4,5)=25, the row
  cap r_u<=17, and the (5,4,24) edge interval. These are premise-level
  (literature-premise) inputs shared with the rest of the branch.

## Checks performed

**Assumptions.** Every premise in the Setting resolves to a real file and
statement (links checked). e_i is excess (epsilon = d_G(u_i)-18 = |R_i|-15),
consistent with `neighborhood_connectivity.md`'s convention, so
"15+e_i" and "e_i denotes excess" agree. Ambient types line up: the
connectivity claims are stated for order-43 (5,5)-free G with a
degree-18 pivot, which is exactly how claim 2 re-applies them to u_i
(degree 18 established from e_i=0 before use).

**Claim 1 algebra (re-derived independently).**
- Inclusion-exclusion: |R_i n R_j| >= (15+e_i)+(15+e_j)-24 = 6+e_i+e_j;
  with the recorded cap <=8 this forces e_i+e_j<=2. Sorted triples in
  {0,1,2}^3 with every pair sum <=2 are exactly 000,001,002,011,111
  (every other sorted triple contains a pair summing to >=3): the
  five-type conclusion is exhaustive.
- With per-cell contributions |s| to r and C(|s|,2) to p: r-p = n_1+n_2,
  so p = r-24+n_0+n_3 = 21+E_U+n_0+n_3; p<=24 gives E_U+n_0+n_3<=3.
  And r = n_1+2n_2+3n_3 = 48-2n_0-n_1+n_3, so r=45+E_U gives
  n_1 = 3+n_3-2n_0-E_U. Both displayed identities are correct.
- All-e_i-positive: pair bounds force e=(1,1,1), E_U=3; the inequality
  forces n_0=n_3=0 and the identity n_1=0; the 24 vertices then sit in
  double cells with each pair intersection (equal to its double cell,
  n_111=0) <=8, summing to 24, hence all exactly 8. The unique profile
  n_110=n_101=n_011=8 and all other n_s=0, checks out.
- **71 count, independently reproduced by exhaustive domain replay:**
  walked all C(31,7)=2,629,575 eight-cell compositions of 24 (complete
  enumeration of n_s>=0, sum=24), filtered by exactly the displayed
  system (15<=row sums<=17, pair sums<=8, n_111<=3): total 71, with
  sorted-excess distribution 000:25, 001:30, 002:6, 011:9, 111:1 -
  exactly "25,30,6,9,1". Both identities were asserted and hold for all
  71 profiles; the all-positive cell filter returns exactly one profile,
  n_011=n_101=n_110=8 with all other cells 0, e=(1,1,1). This is my own
  computation on the claim's own domain, not the author's numbers.

**Claim 2 (reroot) re-derived independently.**
- With e_i=0: d(u_i)=1+2+0+|R_i|=18, so u_i is a legitimate degree-18
  root; N(u_i)={v,u_j,u_k} union R_i uses U-C nonadjacency (setting),
  R_i=N_B(u_i) (definition), and v anticomplete to B.
- Edge decomposition: e(N(u_i)) = 3 (triangle v,u_j,u_k) + e(R_i) +
  |R_i n R_j| + |R_i n R_k| (v has no B-neighbor; u_j's B-neighbors are
  exactly R_j). With e(R_i)>=50 (R_i is (4,4)-free of order 15, census
  lower bound) and |R_i n R_j|>=6+e_j: >= 3+50+6+e_j+6+e_k =
  65+e_j+e_k = 65+sum_{j!=i}e_j. Arithmetic correct.
- Threshold bookkeeping: 65..67 vs the disconnected slices
  [53,58] union {61,68} leaves only 68 open, correctly not closed by the
  69-threshold alone. The structural argument then decides: for a
  (4,4)-free 15-vertex graph, a disconnected split gives component
  independence profile (1,1),(1,2) or (1,1,1) (component alphas are
  positive and sum to alpha<=3, >=2 parts), with orders <=3+3=6,
  3+8=11 (alpha-2 component: K4-free and I3-free, R(4,3)=9 gives <=8),
  3+3+3=9 - all <15, so R_i is connected. The profile list is complete;
  I re-enumerated the partitions myself. >=6 edges join R_i to each of
  u_j,u_k, and {v,u_j,u_k} is a triangle, so N(u_i) is connected.
- 65 > 58 >= 3+f = e(N(v)) gives the strict increase; the corollary for
  a maximizing degree-18 root follows, and the dichotomy itself used no
  maximality assumption, matching the Conclusion and the branch README
  warning (canonical restriction must not be imposed on arbitrary roots).

**Claim 3 (exact completion) - both directions checked case by case.**
- Soundness (keys+clauses => K5/I5-free). K5 containing v needs K4 in
  N(v)=K3 disjoint C (key 1 gives C K4-free; K3 has no K4; no U-C edges).
  K5 avoiding v meeting U: u-count 1,2,3 gives respectively K4 in R_i
  (key 3), triangle in B[R_i n R_j] (key 4), edge in B[R_1 n R_2 n R_3]
  (key 5); u-count 4 impossible, U-C nonadjacency blocks C vertices.
  K5 avoiding U and v: within C (key 1), within B (key 2), or a mixed
  split (p,q), p+q=5, p,q>=1, where key 1 (no K4 in C) forces p<=3 and
  key 2 (no K5 in B) forces q<=4, leaving exactly (1,4),(2,3),(3,2) -
  the table rows; an all-1 rectangle on such a split is precisely that
  K5, so "some X in P x Q is 0" is the right clause. I5 containing v
  needs I4 in B (key 2). I5 with exactly one u_i: the other four lie in
  C disjoint D_i (N(u_i) complement), and alpha<=3 on each side
  (keys 1,2) forces sizes (1,3),(2,2),(3,1) - the anchored rows, with
  "Q subset D_i" exactly encoding nonadjacency to u_i; all-0 rectangle
  is precisely that I5, so "some X in P x Q is 1" is the right clause.
  I5 with neither v nor U: alpha<=3 on C and B forces (3,2),(2,3).
  Every forbidden 5-set type is covered; no template is redundant
  (each rectangle type is instantiated at sizes realizable under the
  keys). Partition arithmetic script output:
  K5 splits [(1,4),(2,3),(3,2)], I5 [(2,3),(3,2)], anchored
  [(1,3),(2,2),(3,1)]; 3 negative + 11 positive = 14 templates,
  matching the text, and 15*24=360.
- Necessity (actual graph => its key satisfies 1-5 and X satisfies all
  clauses): keys 1-3 are recorded premises; key 4 holds because a
  triangle in B[R_i n R_j] together with u_i,u_j is a K5; key 5 holds
  because an edge in the triple intersection together with u_1,u_2,u_3
  is a K5; each clause holds because its all-opposite rectangle plus
  the fixed U/v vertices is exactly a forbidden 5-set. Both directions
  are therefore established, including for keys with empty residual
  systems (vacuous equivalence, correctly stated).
- Cardinality bounds implied by keys: pair |R_i n R_j|<=8 follows from
  key 4 (triangle-free) plus (4,4)-freeness of R_i (key 3, I4-free
  inherited) with R(3,4)=9; triple <=3 follows from key 5 (independent)
  plus I4-freeness; row bounds are stated in key 3 itself. The claim's
  "then follow from these properties and R(3,4)=9" is correct.
- Disjointness: on the fixed ordered partition, different keys differ in
  a C-C, B-B, or U-B edge, and different X differs in a C-B edge; across
  partitions, U is the unique K3 component of N(v) because C is connected
  (the order-15 argument, valid for any (4,4)-free graph on 15 vertices
  and re-applicable to C by key 1). Degrees need no separate clause:
  keys+clauses give an order-43 K5/I5-free graph, so the published
  18..24 applies, and d(v)=18 by construction. The statement that added
  necessary degree constraints (e.g. the B interval 144..160) preserve
  the parametrization is correct: they cannot remove an actual graph.
- Non-weakening/closure audit: search-use fields say branch / propagate /
  "never terminate from count feasibility" / "terminate only with
  independently certified coverage and unsatisfiability of every
  residual system"; the closing section explicitly disclaims any
  exclusion of d18k3, d18, or order 43 and any completion certificate;
  the branch README keeps the case Open. No hidden termination or
  catalogue-completeness assumption found. Claim 3's use of claim 2 is
  correctly marked optional for key restriction and full-branch (not
  maximizing-root only) in scope.

Note on the 71 vs 68 figures: `row_obstruction.md` (parent-owned, out of
this review's scope) refines the raw domain to 68 profiles. Reduction.md's
71 claim is stated over its own displayed system only, which is exactly
what was verified; the two statements do not conflict.

## Findings

Three non-blocking documentation-precision observations; no mathematical
gap was found in any claim.

1. (P3, confidence 0.8) K5 mixed-split enumeration omits the (4,1) split.
   Lines 174-175 say an avoided-U, avoided-v K5 "splits as one of the
   three mixed types listed"; the split (4,1) is also a priori possible
   but is excluded by key 1 (C is K4-free), which the sentence does not
   state. The conclusion is unaffected - the enumeration is complete once
   key 1 and key 2 are read, as the I5 paragraph does explicitly for the
   independence bounds - but the K5 paragraph leaves the step implicit.

2. (P3, confidence 0.7) The Setting bullet (line 21) attributes "each
   R_i is (4,4)-free" to reductions.md sections 4.1, 5.2, 5.4; no cited
   section states row freeness (5.2's boundary trigger at r_u=17
   presupposes it). The fact is true and follows in two lines from
   section 4.2 (G[B] is (5,4)-free, so R_i is I4-free) plus: a K4 in R_i
   with u_i is a K5 (so K4-free). Citing 4.2 alongside would make the
   premise line exact.

3. (P3, confidence 0.7) Claim 3's Dependencies (lines 122-123) says
   claims 1-2 are used "only as optional necessary filters", but the
   proof (line 187) explicitly uses claim 2's order-15 connectivity
   argument to make the U/C decomposition canonical for
   "uniquely specifies" and cross-partition disjointness. The proof
   names the argument itself, so nothing is hidden, but the dependency
   metadata understates it; a revision of claim 2 would need claim 3
   re-reviewed, which the current line does not signal.

Suggested fixes (optional, whitespace preserved):

```suggestion
A K5 avoiding U and v is either within C or B, already forbidden, or
splits across C and B: the split (4,1) needs a K4 in C and is impossible
by key 1, leaving exactly the three listed types and their clauses.
```

```suggestion
- [Interface bounds](../../reductions.md), sections4.1,4.2,5.2,5.4:
  global degrees18..24, each R_i is (4,4)-free (from section4.2 and the
  K4-with-u_i lift),
  |R_i intersect R_j|<=8, and |R_1 intersect R_2 intersect R_3|<=3.
```

```suggestion
Dependencies: elementary forbidden homogeneous5-set splitting; claim2's
order15 connectivity argument for the canonical U/C decomposition;
claims1--2 as optional necessary filters  
```

## Outcome

**Accepted.** All three claims (signature-cover 71-profile classification,
strict denser connected reroot with the canonical-root corollary, exact
360-bit mixed homogeneous completion classification) are proved as stated
for their declared scopes and quantifiers: assumptions resolve to recorded
premises, ambient types match the cited dependencies' scopes, the algebra
re-derives, the case coverage of both forbidden 5-set directions is
complete, the 71-count domain was replayed exhaustively and reproduced
exactly (71; 25/30/6/9/1; both identities; unique all-positive profile),
the template partition arithmetic reproduces 3 negative and 11 positive
clauses and 360 bits, and no search-use weakening or invalid closure is
present. The three findings above are non-blocking documentation
precision; the review state of the claims may move ready -> accepted.
This review is valid only for the exact SHA-256 recorded above; a proof
change requires renewed review.

## Limits

- Literature/premise inputs (census intervals, Ramsey numbers,
  R(4,5)=25, row cap r_u<=17, B edge interval) were read for applicability
  but not re-certified, as declared by the author.
- No builds, tests, formatters, Lean, engine, solver, catalogue, or
  download activity was performed; validation was limited to my own
  small scalar scripts (composition enumeration, partition arithmetic)
  recorded above.
- Feasibility of any key or completion, isomorphism-class counts, novelty,
  and any exclusion/construction of order-43 graphs are out of scope and
  are not claimed by the reviewed proof or by this review.
