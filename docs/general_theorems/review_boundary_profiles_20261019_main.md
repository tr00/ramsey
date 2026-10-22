# Independent review of the uniform boundary-profile calculus

Date: 2026-10-19.
Author: BoundaryProfileTheory. Reviewer: Main, a distinct identity.
Task: `ramsey-attachment-calculus-20261019`.

## Claims and exact reviewed revision

All four claims in [boundary_profiles.md](boundary_profiles.md):

- [claim-boundary-profiles-01](boundary_profiles.md#claim-boundary-profiles-01)
- [claim-boundary-profiles-02](boundary_profiles.md#claim-boundary-profiles-02)
- [claim-boundary-profiles-03](boundary_profiles.md#claim-boundary-profiles-03)
- [claim-boundary-profiles-04](boundary_profiles.md#claim-boundary-profiles-04)

Reviewed SHA-256 of the complete uncommitted author-stage file:
`013507deec2512db52acdbc8897cf38155c6f05bc9df6152dd5438d18d736673`.
This includes the strengthened section 5.3 with different interior graphs.
Acceptance below applies to these exact bytes only. It does not promote
any sibling proof manuscript or alter search coverage.

## Dependencies reviewed

The four proofs use only the note's definitions, finite maxima, elementary
set decomposition, and structural induction on a specified expression.
They require no numerical Ramsey theorem, catalogue or uniqueness premise.

The contextual links to [signature anchors](signature_anchors.md) and
[two-root gluing](symmetry_pair_gluing.md) describe distinct pre-existing
mechanisms, not additional premises of the four claims. Section 7 uses
[the accepted module obstruction](../../research/n43/symmetry_structure.md#claim-symmetry-structure-03)
only for its stated completed-graph consequence: an order-43 K5/I5-free
graph has no proper module with at least two vertices. The source statement
and proof were read; its literature Ramsey premises are retained, not
recertified by this review. The Antipov--Kratsch citation supplies standard
terminology, not a mathematical dependency.

## Independent proof checks

### Claim 01: the state and its exact observation

For every homogeneous set Q in G, split it uniquely into U=Q intersect B
and Q-B. If Q is a clique, U is a clique in the exact labelled boundary
and Q-B lies in its eligible common interior neighborhood. Conversely,
every clique there combines with U. The independent-set argument uses
common interior nonneighbors. This independently derives the two maxima.

The entries exclude |U|; adding it exactly once is essential. Clipping at
the full threshold is safe because min(t,r+min(t,s))=min(t,r+s) for
nonnegative r,s. This remains true when a boundary candidate already
exceeds the threshold. Empty U supplies a candidate for every state,
including the empty graph. At threshold 1, any nonempty graph is detected.
Residual size 1 forces an empty eligible interior; residual size 0 needs
no interior witness. Nonhomogeneous boundary subsets are not queried.

The displayed finite state bound follows by choosing a labelled boundary
graph and at most 2^|B| entries of each colour, each in 0..p or 0..q.
It is an upper bound, not a realization assertion. No graph-order field
is silently included in the invariant.

### Claim 02: both uniform joins

Fix a homogeneous boundary U. The eligible interior after gluing is the
disjoint union of the old eligible interiors. For a complete interior
join, clique maxima add and independence maxima take their maximum.
For an anticomplete join, these roles exchange. These equations also
cover an empty side, a zero entry and an empty boundary. Clipping commutes
with the sums and maxima used here.

Both sides agree on the entire labelled boundary graph and their interiors
are copied apart, so no conflicting boundary edge or duplicated interior
vertex is hidden. The final boundary witness contributes |U| once.
The graph order n1+n2-|B| is independently correct. Arbitrary mixed cross
edges are not among this claim's operations.

### Claim 03: forgetting, introducing and relabelling

Forgetting b partitions eligible homogeneous interior witnesses into
those avoiding b and those using b. The latter branch exists exactly
when U union {b} has the appropriate boundary homogeneous type. Its
remaining vertices are counted by the old entry at U union {b}, plus
one for b. This gives both displayed max recurrences and does not query
an undefined entry. It also handles an empty old eligible interior:
b alone is a genuine new interior witness. Iterated forgetting computes
the same unchanged graph with its smaller boundary in every order.

Introducing a boundary vertex leaves the interior unchanged. For entries
not using it, eligibility is unchanged. For entries using it, a uniform
edge/nonedge to the old interior either imposes no restriction or removes
all interior candidates. Thus the entries are the old entry or zero;
there is no extra one while the vertex is still in the boundary. The
fixed edges to the old boundary determine which entries exist.

A fixed bijection transports boundary sets, incidences and entries.
It does not quotient by isomorphism, identify different boundary vertices,
recover forgotten interior names or admit mixed interior introduction.

### Claim 04: context congruence

The context's boundary graph is part of its type, and all unary operation
data and binary bits are fixed. At every node on the hole-to-root path,
Claims 02--03 compute the output profile solely from input profiles.
Induction therefore preserves profile equality, including admissibility
of subsequent typed operations. Claim 01 then gives equal clipped global
homogeneous numbers and equivalent R(p,q)-freeness. Multiple replacements
follow by successive applications.

Graph order is not inferred from profile equality. The separate equal-order
hypothesis is sufficient: unary introduction adds one, forgetting and
relabeling preserve order, and a binary join subtracts the common boundary
once. The same induction proves this assertion. The manuscript correctly
does not preserve degrees, named-subset ranks or arbitrary contextual
properties. It proves a sufficient congruence, not minimality or the
converse that different profiles must have distinguishable Boolean tests.

## Worked examples and exercised validation

The examples were independently re-derived and exercised in an in-memory
Python 3.12.3 validation with 30-second call deadlines. No packages,
solver, catalogue, graph generation search or canonicalizer was used.
Only subsets of explicitly fixed graphs were considered.

- For b-x-y and b-z, the complete interior join has triangles; the
  anticomplete join is the four-vertex path y-x-b-z. Its empty-boundary
  clique and independence ranks after forgetting b are both 2.
- The differently pointed three-vertex paths are distinguishable by the
  same complete-join context, as stated.
- The two section 5.3 examples have interiors P3 and K2+I1, and different
  boundary degrees 1 and 2. Both have c(empty)=a(empty)=2 and
  c({b})=a({b})=1 at p=q=3. Named interior subset {x,y} has different
  ranks, so this is genuine information loss with safe replacement.
  Both joins to a fixed context and subsequent forgetting preserve their
  observed profile equality.
- The P4 versus C4 mixed-attachment counterexample was checked by its
  explicit triangle/C5 witnesses. It correctly limits the operator language.

The scripted operator checks covered p,q=1..4, including threshold 1:
64 uniform-join table entries, 160 forgetting entries, 1,888 uniform
introduction entries and 112 relabelling entries. All passed. The broader
calculus validation also exercised the C5 versus identically ported,
relabelled P4 distinction. The dated
[research report](../../research/reports/2026-10-19-ramsey-attachment-calculus.md)
retains the full validation source, commands, a corrected separate dual
capacity-fixture assertion, and exact outputs. The correction concerned
an erroneous fixture expectation, not this manuscript or its four claims.

## Findings

No proof gaps found. The important safeguards are explicit in the source:
full labelled boundary, disjoint interiors, uniform cross joins, exact
homogeneous eligibility, threshold clipping, shared boundary counted once,
and equal order as an additional replacement condition when needed.

The primeness discussion is confined to completed graphs. A partial module
can be broken by later attachments. Nonempty interfaces need not define
modules. There is no bounded-width or compact-decomposition theorem.

## Outcome

**Accepted**: all four claims, their exact operator contracts and the stated
worked examples at SHA-256
`013507deec2512db52acdbc8897cf38155c6f05bc9df6152dd5438d18d736673`.
Proposed permitted use is exact propagation and profile replacement only
inside certified expressions formed from these operators. It is not a
complete generator or a proof of coverage of any Ramsey branch.

## Limits

This is an independent written mathematical review, not a Lean proof,
formal certificate, novelty review or numerical Ramsey improvement.
No bound on required interface size, expression size or runtime follows.
The state count can be large, and any graph can be represented trivially
by retaining all its vertices as a boundary. Arbitrary mixed attachments
require the richer interface, not these smaller tables.
