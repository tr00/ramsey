# Independent review: candidate exclusion of the entire x=136 frontier

Date: 2026-10-19. Reviewer token: `main` (integration session). Author and
self-auditor: Codex (distinct identity, per
[frontier_exclusion_handoff.md](frontier_exclusion_handoff.md)).

```text
Claim(s): n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-double-domination
          n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-three-anchors
          n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-low-degrees
          n43/d18/x136/frontier_exclusion_handoff.md#claim-frontier-handoff-exclusion
Author and reviewer: Codex author; main reviewer (independent rederivation)
Reviewed revision: commit 904f46e (branch x136), merged at a0d4746;
  file SHA-256 c07f097358bd42e8c11957660f4f25dce3784608b143a87bc86a16d2bc0561cb
Dependencies reviewed: current revisions of frontier_band.md,
  five_column_compatibility.md, sos_finite_moments.md,
  sos_order12_addendum.md, x136/small_columns.md, r2/low_excess_columns.md
  (operative content verified identical to the author's recorded snapshots;
  see Findings)
Checks: assumptions, quantifiers, ambient types, algebra, case coverage,
  dependency applicability, permitted search use
Findings: no gaps; supporting reasoning below
Outcome: accepted (all four claims)
Limits: published external premises not recertified; no formal certificate;
  novelty not checked; rooted branch scope only
```

## Independent checks performed

All four proofs were rederived from the stated setting without reusing the
author's text, and every numeric table was recomputed by an independent
Python3 script (written fresh; the author's replay script was also rerun and
passes). The deletion identity `e(A-S)=85-sum_S d_A+e(A[S])` was additionally
validated on 2000 random graphs.

### Inputs

1. Budget `x=136 => (a,E)=(85,0)`: verified against
   [frontier_band.md](../frontier_band.md); `k=2q+E` with `q,E>=0` forces
   `q=0` (e(A)=85) and `E=0` (every A vertex has global degree 18), hence
   `d_B=17-d_A` and `sum_A d_A=170`. `epsilon>=0` is sound: for any vertex u
   of an order-43 K5/I5-free graph, M(u) is K5-free and I4-free (an
   independent four-set in M(u) joins u to an I5), so `|M(u)|<=R(5,4)-1=24`
   and `d(u)>=18`. Operative content unchanged since the author's snapshot
   (diff against ab4941b shows table reformatting and the separately reviewed
   accepted anchor-defects claim only).
2. Degree range `6<=d_A<=13`: ceiling rederived (N_A(a) is K3/I5-free, so
   `d_A(a)<=R(3,5)-1=13`); floor rederived (`e(A-a)=85-d_A(a)<=E(4,5,17)=79`
   on the 17-vertex (4,5)-free `A-a`). Only the ceiling is load-bearing in
   the four claims.
3. `sum_X d_A<=32` for every I4 X: rederived elementarily (every column meets
   every I4; each exact singleton signature class in B is a clique of order
   at most three; so `e(X,B)>=48-12=36` and the row identity gives
   `sum_X d_A<=68-36=32`). Ambient types respected: no I4 prohibition on A
   is assumed anywhere.
4. Anchor existence: [five_column_compatibility
   Claim03](five_column_compatibility.md#claim-five-columns-degree-eight-anchor),
   review state accepted with recorded exact-revision review. Diff against
   ab4941b shows only the Review state/Reviews metadata flips.
5. `tau(I4(A))>=5` for abstract transversals: [five_column_compatibility
   Claim04](five_column_compatibility.md#claim-five-columns-no-four-transversal),
   accepted as above.
6. Core caps: Turan `floor(m^2/3)` for K4-free orders `m<=9` rechecked
   (m=4 cap 5); m=10 cap 31 = accepted five-column Claim01; m=11 cap 36 and
   m=13 cap 48 = accepted
   [finite core caps](../sos_finite_moments.md#claim-finite-core-caps); m=12
   cap 42 = accepted
   [order-twelve addendum](../sos_order12_addendum.md#claim-order12-cap42).
   All review states and review links verified at current revisions; diffs
   against ab4941b are metadata-only.

### Claim01 (double domination)

Rederived: all four anchor vertices have `d_B=9` (input1), so `e(I,B)=36`.
Columns missing I would give an I5, singleton classes are cliques of order
at most three (K5 and I5 witnesses rechecked), so `36>=48-n1>=36` forces
`n1=12`, three members per class, and every other column meeting I twice.
For `a in A-I` with exact I-signature `{i}`: a nonedge to any member y of
i's singleton class gives I5 `{a,y} union I-{i}`; adjacency to all three
members plus i gives K5 `{a,i,y1,y2,y3}` (the class is a triangle, all
adjacent to i). Signature 0 is excluded by an immediate I5. Hence at least
two I-neighbors. The full-ambient-graph singleton saturation is the new move
and is valid; it is applied only to A vertices, not to columns.

### Claim02 (no three disjoint anchors)

Rederived: Claim01 gives at least eight edges per anchor pair, so
`e(A[D])>=24`; the twelve anchor vertices have degree sum exactly 96; the
identity `85=96-e(A[D])+e(A[R])` with `e(A[R])<=12` (Turan, K4-free R on six
vertices; no I4 prohibition imposed on R) yields `85<=84`. Sound.

### Claim03 (low degrees)

Rederived both deletion tables. The b4(ell) Turan floor on `e(A[L])`
(complement of A[L] is K5-free since A is I5-free) recomputed for
ell=2..10: 0,0,0,1,2,3,4,6,8. First table lower bounds 43,38,33,29,25,21,17,
14,11 strictly exceed the caps 42,36,31,27,21,16,12,8,5 at orders 12..4, so
`I union L` is not a transversal and a disjoint all-degree-eight anchor J
exists (degrees at least 8 avoiding L, capped at 32). Second table lower
bounds 23,20,17,15,13,11,9,8,7 strictly exceed 21,16,12,8,5,3,1,0,0 at
orders 8..0, so `I union J union L` is not a transversal either; for ell<=6
the surviving I4 is a third anchor, contradicting Claim02, and for ell>=7
the order `10-ell<=3` remainder makes the transversal trivial and the table
row itself contradicts. The logic covers both directions for every ell.

Degree-six subcase rederived: `I union {u}` as transversal gives
`e>=85-32-6+2=49>48`; the second anchor J exists; R (order 9) is I4-free
else a third anchor arises; `e(A[R])>=85-70+8+4=27` forces equality,
`A[R]=K(3,3,3)` (Turan equality case), R vertices have `d_A>=6+2+2=10`; the
two A-neighbors of u outside `I union J` miss a tripartite part P; `{u} union P`
is an I4 of degree sum at least `6+3*10=36>32`. Sound; degrees are taken in
all of A, not just R.

### Claim04 (final exclusion)

Quantifiers rechecked. Case (a): every I4 lies in D8 (degrees at least 8,
sum capped at 32), so each column's D8 projection is an abstract transversal
of size at least 5 (input5), giving `9t>=120`, `t>=14`, against
`170<=8t+13(18-t)` giving `t<=12`. Case (b): `(C_y intersect D8) union {u}`
is an abstract transversal (I4s containing u are met by u; all others lie in
D8 and are met by the actual column), so `|C_y intersect D8|>=4`, `9t>=96`,
`t>=11`, against `170<=7+8t+13(17-t)` giving `t<=11`; hence t=11, the six
remaining vertices have degree sum 75 and each degree at least 10, no I4
meets them (`10+7+8+8=33>32`), every I4 lies in `U=D8 union {u}`, columns
projected to U are transversals of size at least 5, but
`e(U,B)=11*9+10=109<120`. Both cases impossible. The projection-to-transversal
steps are justified only after proving every I4 is supported inside the
projection target, which the proof does in both cases.

## Dependency applicability

The proof applies input5 to abstract transversals (permitted by its accepted
scope: every abstract four-set transversal), the core caps to K4/I4-free
remainders obtained by deleting proved transversals (not by ambient-type
transfer), and the anchor theorem at x=136 only. No claim transfers an I4
prohibition from B to A or vice versa. Rooted scope: the exclusion is for
order-43 K5/I5-free graphs with a degree-18 root and x=136; it does not
assert that a low-x degree-18 root is unavoidable in every candidate.

## Findings

No mathematical gaps found. One clarifying observation, not affecting
correctness: in Claim03's second table, for ell>=7 the third-anchor route is
vacuous (remainder below four vertices) and those rows are excluded directly
by the table contradiction, as the proof states.

## Outcome

All four claims **accepted** at the reviewed revision. Permitted use: close
the entire `n43/d18/x136` branch, including r0; propagate `x>=137` for every
degree-18 root of an order-43 candidate. Search use remains none (no solver
or pruning was run or authorized by this review).

## Limits

Published premises were not recertified: R(3,5)=14, R(4,5)=25, E(4,5,17)=79,
E(4,5,14)=60, R(4,3)=9, and the accepted reviewed core caps remain recorded
external or reviewed-internal premises. No formal Lean certificate exists for
these four claims (the Lean tree still carries d18 as an open sorry ledger
target). Novelty was not checked. The x>=137 siblings, other degree-18
profiles, the d20 and min-degree20 schemes, and the x>=143 residual remain
open; no R(5,5) value is claimed.
