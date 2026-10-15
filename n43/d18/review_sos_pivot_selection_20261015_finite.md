# Independent review of quadratic degree-18 pivot selection

Date: 2026-10-15.

Claim(s): all four claims in [sos_pivot_selection.md](sos_pivot_selection.md):
`claim-sos-pivot-degree-square`, `claim-sos-pivot-covariance`,
`claim-sos-pivot-family`, and `claim-sos-pivot-twelve`.

Author and reviewer: author `sos_pivot`; independent reviewer `sos_finite`.
The reviewer did not author the source and made no changes to it.

Reviewed revision: base HEAD
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`, exact uncommitted proof SHA-256
`037901dc6de8864744ef9d5945d218624aaa575f889afc7c74650ccdf6f526e7`.

Dependencies reviewed: current exact hashes

```text
e64d608ff25049f90b46ceb5775b76dcb0354fbb510a0479d0efaca619c1cd7a n43/d18/dense_pivot_coverage.md
2b357ef5a53588c4e6879078210de4deae564ea22611fc4ffd81c21ecaa572e3 n43/d18/pairwise_pivot_refinements.md
43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233 n43/d18/pivot_classes.md
```

The reviewer read the relevant exact degree/excess identities and independently
rederived the four conditional high-codegree consequences from dense-pivot
Claim01. Exact Ramsey values and previously retained census extrema remain
external premises, not recertified by this review.

Checks: assumptions, quantifiers, ambient types, algebra, spectral direction,
positive-parameter condition, integer rounding, exact equality at twelve roots,
component independence addition, global-vertex coverage, example arithmetic,
and permitted conditional branching.

## Findings

**Degree-square claim accepted.** The reviewer independently reconstructed
the weighted K5-free clique inequality by mass merging. Applying it to
`a_z=u_z^2` for a nonnegative unit Rayleigh maximizer and Cauchy--Schwarz
over the e edges gives `rho^2<=3e/2`. For a nonnegative symmetric adjacency
matrix, absolute values show every eigenvalue has magnitude at most rho;
therefore its operator norm is rho. Applying the norm to the all-ones vector
gives `sum d_H^2<=3eh/2`. Subtracting `4e^2/h` gives the variance cap V.
The e=0 case and h>0 restriction are explicitly handled. No I4 prohibition
is imposed on H or N(v).

**Covariance claim accepted.** The reviewer expanded the centered product:
`sum epsilon_z*d_H(z)=2eW/h+sum a_z*b_z`, since both centered sums are
zero. The square identity `sum(t*a-b)^2/t>=0` yields exactly
`sum a*b<=(tR+sum b^2/t)/2` for t>0. Substitution of `sum b^2<=V`
preserves the inequality direction and supplies the claimed rational bound.
The square-root version is Cauchy--Schwarz with R,V nonnegative. The
claimed certificate is an elementary quadratic square step combined with
K5-free structure; it is not presented as an entire Boolean SOS refutation.

**Family and safe selection claim accepted.** All roots have
`E_v<=min(W,B0)=U0`, while those outside q<=Q satisfy `E_v<=D0`.
The sum inequality is therefore
`ceil(J_lo)<=J<=pD0+M_Q(U0-D0)`. Positive denominator and inward integer
rounding yield the displayed family bound. If it exceeds p, the statistics
are inconsistent. Minimizing q at the selected root gives
`pq_*+J<=pB0`, and its x bound uses the same root's q+E cap; the proof
does not identify separate minimizers of E and q.

The conditional example was checked with exact rational arithmetic, using
only the displayed formulas:

```text
R=40, V=108/5, t=3/4,
A<=1947/5, J>=4003/5, J_integer>=801,
q_*<=floor((29*33-801)/33)=4,
M_7>=ceil((801-33*21)/8)=14.
```

The earlier actual-edge additive bound equals758, and with U0=29 gives
`ceil((758-693)/8)=9`, as stated. All example degree data are explicitly
conditional; neither graph realizability nor elimination is claimed.

**Twelve-root theorem accepted.** The reviewer separately reconstructed
triangle codegree equality, the paw prohibition, the K4 cut/pair-count
contradiction, and the independent-four neighborhood obstruction in the
parent proof. Its fourth consequence holds under the hypothetical all-high
edge-codegree assumption irrespective of the original thirteen-root conclusion.
Thus it is correctly applicable to a twelve-root family.

Summing `|D|<=3alpha(D)` over components and using global I5-freeness gives
at most twelve family vertices. At equality every component must attain its
individual bound. Triangle-free components with alpha1,2,3 have strict
bounds2,5,8; alpha4 would require a twelve-vertex cubic triangle-free
component. Its cubic conclusion uses both the no-I4 family neighborhoods
and the (3,4)-free nonneighbor cells. Deleting a vertex and its three
independent neighbors removes exactly `3*3=9` edges and leaves an eight-
vertex triangle-free I4-free graph with nine edges.

The reviewer independently checked the latter impossibility. Such a graph
has minimum degree two. A degree-two vertex leaves a five-vertex triangle-free
I3-free nonneighbor graph, which has every degree two and is C5. An assumed
total of at most nine edges permits at most two attachments from the two
nonadjacent neighbors of the deleted vertex; their degree floors force one
each. At least three C5 vertices miss both. Two of those three are nonadjacent,
forming I4 with the two neighbors. Hence that graph has at least ten edges.

Every equality component is consequently `K_{a,a,a}`, and the part sizes
over components sum to four. For an ambient z outside the family to avoid
an independent five-set, it must meet all three parts of some component:
otherwise a missed whole part in each component supplies an independent
four-set anticomplete to z. If z meets all three parts, the no-exactly-one-
triangle-neighbor consequence makes it complete to at least two whole parts.
It is thus a common neighbor of at least a^2 component triangles. Each
triangle has four ambient common neighbors, so the number of such z for
one component is at most4a. The union of those component sets must cover
all31 outside vertices, but their total cardinalities are at most16. This
is a contradiction even when the sets overlap. The proof includes all
ambient common neighbors and does not incorrectly restrict them to H or P.

## Outcome and limits

Outcome: **accepted** for all four exact-hash claims on their stated
dependencies. Proposed use: degree/variance/covariance propagation; safe
selected-root and conditional same-family branching; termination only of
an explicitly inconsistent statistic profile. Twelve-root coverage is an
overlapping unavoidable-family statement, requiring every permitted root
profile, overlap map, and completion in any eventual exhaustive gluing use.

This review establishes no graph construction, order43 nonexistence, general
degree18 existence, unconditional small-x or small-excess assumption, or
novelty. It is an independent mathematical review, not a formal certificate
or replay of the external computational census. No solver, graph enumeration,
download, installation, staging, or commit was used.
