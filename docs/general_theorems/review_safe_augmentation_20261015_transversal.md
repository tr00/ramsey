# Independent review of safe augmentation

Date: 2026-10-15. Reviewer: `transversal_compatibility`.
Author: `augmentation_author`; distinct from reviewer.

Claim(s): `docs/general_theorems/safe_augmentation.md`,
`claim-safe-augmentation-01` through `claim-safe-augmentation-05`.

Reviewed revision: exact uncommitted file SHA-256
`6f6afdb332679d1acd1ae6d29d509ba6701f05a5ec3f1a0879437565e0938760`.
The hash was checked immediately before reading the full proof.

Dependencies reviewed: Claims 01--04 are independently rederived below.
For Claim 05, the value 85 is accepted only as the stated external upper
bound. The recorded literature table and its proof/census are not
independently rechecked in this audit. The source frontier identity is used
only for the ancillary slice-location statement, not for the augmentation
conclusions.

Checks: assumptions, quantifiers, clique witness coverage, ambient graph
types, upper-bound variant, minimal-conflict rank, and generation coverage.

## Findings

**Claim 01 accepted.** A clique created by one new edge must use that edge,
and deleting its two endpoints leaves exactly an `(r-2)`-clique in the
original common neighborhood. This works for r=3, where a one-vertex
clique is simply a common neighbor. An addition cannot create an independent
set: all old nonedges remain or are removed. Thus exceeding the actual
edge maximum, or a valid upper bound U, must create a forbidden clique.
The budget applies to every missing-edge set, without initial-safety
assumptions, and the q=0 assertion follows.

**Claim 02 accepted.** At deficit one every pair of safe edges is infeasible,
and a clique witness must contain both because either alone was safe.
Incident pairs force the leaf edge in G; disjoint pairs force every edge
between their endpoints in G. For r=3 disjoint safe edges cannot exist
because their joint clique witness would contain four distinct vertices.
The argument therefore remains valid at the smallest allowed r. A triangle
or any three-edge path in S conflicts with these pair rules. Independently,
a connected graph without either subgraph is a star: a vertex of degree
at least two has only degree-one neighbors, since any extra neighbor gives
a triangle or a path of three edges. Leaves chosen from each star are
pairwise adjacent in G; choose one endpoint from every single-edge star.
The pair rules join choices from different components. The resulting clique
has exactly |T| vertices, implying |T|<=r-1. This reasoning also proves
the U-1 version; the pair budget needs only the certified upper bound.

**Claim 03 accepted.** The empty/nonempty safety split is disjoint and
exhaustive. A nonempty T at M-1 supplies a parent by adding each safe edge.
The reverse edge-deletion operation requires the stated I_s filter, since
deletion need not preserve the class. Every unsaturated graph is covered,
but deletion families can overlap. At U-1, existence of a safe edge yields
a U-edge graph in the class, forcing M=U; if U is unattained, the saturated
case contains every graph at U-1. No generation claim silently drops the
saturated case or presumes an upper bound is attained.

**Claim 04 accepted.** For any r-set W, adding F creates its clique exactly
when every originally missing edge D_G(W) is in F. If F is a subset of T,
only W with D_G(W) subset T matter. Taking all inclusion-minimal retained
sets preserves this equivalence in both directions because the universe
is finite. Every hyperedge is nonempty, and a singleton would contradict
initial safety. A proper subset of a minimal conflict contains no conflict:
otherwise a retained set strictly inside the original conflict contradicts
its minimality. Thus removing one element leaves a feasible set and proves
rank at most q+1; each original missing-edge set has size at most
binom(r,2). A feasible addition consists solely of initially safe edges,
so use of vertex set T discards none. Complete r-set coverage is explicit.
The statement also covers an empty conflict collection or empty T: the
independence bound is still the edge budget, not a claimed existence of
conflicts. At q=1 every two elements conflict, recovering precisely the
pair rules; at q>=2 no star-forest conclusion is imported.

**Claim 05 accepted on its recorded numerical premise.** Substitution
`r=4,s=5,U=85` gives rank at most min(q_85+1,6), and deficit one gives
a star forest with at most three edges. Partitioning one, two, or three
edges among nontrivial stars gives exactly K2, P3, K1,3, 2K2,
P3 disjoint union K2, and 3K2. They are listed as permitted patterns,
not existence assertions. At 84 edges a safe edge creates an 85-edge
graph, so the stated number of parents/choices follows even when the
starting premise is merely an upper bound. The ambient graph A is
(4,5)-free and can contain I4; B is (5,4)-free and is explicitly excluded
from inheriting the 18-vertex bound. The slice identity with q_85=1
puts x at 138+E_A and is not used to derive a false global restriction.

Outcome: **accepted**, all five claims, conditional for Claim 05 on its
stated external upper bound and for the slice statement on the source
frontier identity.

Permitted search use: Claims 01, 02, 04, and 05 propagate only on their
stated hypotheses. Claim 03's branch split retains both cases. Conflict
generation use requires coverage of every r-subset. No claim terminates
an order-43 branch.

Limits: no literature novelty check, external census recertification,
graph enumeration, implementation audit, or formal proof-checking
certificate. This acceptance applies only to the exact hash above;
a substantive proof change requires renewed review.
