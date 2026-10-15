# Independent review of dispersed triple-witness positivity

Date: 2026-10-15.

Claim(s): all four claims in
[sos_column_compatibility.md](sos_column_compatibility.md):
`claim-sos-columns-weighted-goodman`, `claim-sos-columns-integer-goodman`,
`claim-sos-columns-profile-coverage`, and
`claim-sos-columns-anchor-first-moment`.

Author and reviewer: author `sos_columns`; independent reviewer `sos_pivot`.
The reviewer did not author or edit the proof source.

Reviewed revision: base HEAD
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`; exact uncommitted source
SHA-256 `cf63a76237207e9d7b3242b61744476a053cf087bc6e64d27d57c2cb9d266646`.

Dependencies reviewed: actual column definitions and local Ramsey tests
were rederived directly. The reviewer read the relevant exact anchor and
small-column profile conclusions at these hashes:

```text
2ac70b04e861d31e141e5b475e71245e9e0fe019a7e2f5a0572b517bdaa5ed6e n43/d18/x136/five_column_compatibility.md
f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733 n43/d18/x136/small_columns.md
e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e docs/mathematical_baseline.md
e4317ff4badde3eab2d4e5c0c1e6920a9045224c7d600869eb5b2e46aa3e1f07 n43/d18/weighted_averaging.md
719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3 n43/d18/anchored_cell_averaging.md
7538fb1429225c180e6aa7febc39d75f14ff7bf8a79019c0ef4a01d108aafb92 n43/d18/overlapping_cells.md
```

The external Ramsey number and retained frontier census premises remain
external; this review does not replay their computational certificates.

Checks: ambient graph types, actual versus speculative witnesses,
weighted triple multiplicities, polynomial expansion, rational-square
coefficients, integer-degree rounding, handshake parity, all feasible
column sizes, degree-sum variance, equality-frontier applicability,
Gram eigenvalues, and precise conditional search use.

## Findings

**Claim01 accepted.** A shared A edge for a B triangle gives K5; a
jointly missed independent A pair for a B independent triple gives I5.
The witnesses can vary between triples. Therefore every actual
monochromatic triple belongs to the supplied sound open set O. With the
two direct witness tests alone, its membership condition is exactly
absence of an A edge in the common intersection, or absence of an A
nonedge in the joint omission set. This imposes no I4 prohibition on A.

The reviewer reconstructed the weighted identity from scratch. For a
nonmonochromatic triple, exactly two vertices see one incident edge and
one incident nonedge, each contributing the same weight product. Thus
its weighted indicator is subtracted once by
`(1/2)sum_y w_y*d_y^w*(W-w_y-d_y^w)`. Expanding the elementary symmetric
cubic and completing squares gives exactly

```text
M_w=(W^3-6WD+5T)/24
    +(1/2)sum_y w_y*(d_y^w-(W-w_y)/2)^2.
```

The squared coefficients are nonnegative even at zero weights. Soundness
of O and nonnegative weights give M_w<=O_w. Replacing a squared term by
the distance from an independently justified interval preserves its
direction. The three-bit identity also checks directly after Boolean
reduction: its cubic terms cancel. The stated quadratic Gram step does
not silently lower the degree required to justify all witness constraints.

**Claim02 accepted.** Uniform weights give the stated constant
`n(n-1)(n-5)/24`. At even n all internal degrees differ from the central
half-integer by at least1/2; substitution simplifies the lower bound to
`n(n-2)(n-4)/24`. At n congruent to3 modulo4, the central degree is odd
and cannot occur at all odd-numbered vertices because their sum would
be odd. Hence at least one integer squared deviation is at least one.
For n congruent to1 modulo4, mere nonnegativity suffices.

The reviewer evaluated all displayed n rows using exact rational
arithmetic only, obtaining the stated minima 0,2,4,8,12,20,28,40,440.
In particular order six forces two monochromatic triples and therefore
at least two open triples. The interval version minimizes over justified
integer degrees; it does not assume pseudoexpectation integrality. At
order five and O empty, degree two at every vertex plus the absence of
triangles yields C5, consistently with absence of independent triples.

**Claim03 accepted.** There is no pivot edge to B, so
`d_B(y)=d_G(y)-c_y` is correct. The global degree interval18..24 and
the internal interval0..23 give the supplied bounds. For c<=6 the degree
floor is `12+(6-c)`, and for c>=13 the ceiling is `11-(c-13)`; sizes7..12
retain the half-integer distance1/2. This gives
`tau=max(0,6-c,c-13)` and squared distance at least `(tau+1/2)^2`.
The reviewer checked this expression on every integer c=0,...,18 using
exact arithmetic; every feasible interval satisfies it.

At n=24 the constant is437 and the universal square contribution is3,
giving440 plus the triangular-number penalties. The independent
degree-sum inequality follows from
`sum_y(d_B(y)-23/2)=2b-276`; Cauchy--Schwarz gives the additional term
`(2b-276)^2/48=(b-138)^2/12`, with correct ceiling. The exact pair-square
identity in the note has the correct factor1/24.

The frontier anchor theorem forbids size-four columns, and the retained
small-column identities at r=0,k=0 give 8<=s<=10 and total positive
excess above six equal to s-8. Hence all other columns are size6..8;
exactly the s size-five columns contribute a penalty1. Thus
`|O|>=440+s>=448` is valid. The note asserts a conditional necessary
coverage test, not that every interface violates it. The subfamily floor
`n-6-c_y` subtracts at most24-n outside neighbors, and its ceiling is
the smaller of n-1 and the whole-B ceiling24-c_y.

**Claim04 accepted.** The reviewed frontier anchor has twelve double
occurrences and row sum six for each anchor vertex. Subtracting row
equations gives opposite pair multiplicities equal, and their common
three values sum to six. For each pair i,j, the number of occurrences
giving equal signs is `p_ij+p_kl=2p_ij`. Thus the Gram off-diagonal is
`2p_ij-(12-2p_ij)=4p_ij-12`, with diagonal12.
Multiplying the four listed orthogonal vectors gives eigenvalues
0,8a,8b,8c. Their trace is48, consistent with the twelve length-squared
four vectors. Therefore PSD of this particular matrix is equivalent to
the already necessary a,b,c>=0. Repeated anchor signatures are not
mistaken for identical full columns, and the limitation is expressly
limited to this Gram matrix.

## Outcome and limits

Outcome: **accepted** for all four claims at the exact reviewed hash.
Permitted use: conditional propagation of weighted/integer/open-triple
coverage constraints, whole-interface degree penalties, and opposite
anchor-pair balance. A rational violation rejects a specified actual
or permanently justified partial predicate. Witness validity and
degree intervals must be independently available for that predicate.

No branch is closed by this review. It does not establish a uniform
violation, a construction, an order-43 nonexistence certificate,
an unconditional transversal theorem, or novelty. The first Gram
limitation is not an SOS hierarchy lower bound. The exact source's
author-stage labels can be retained with an integration banner linking
this review. No solver, graph enumeration, download, installation,
staging, or commit was used in the review.
