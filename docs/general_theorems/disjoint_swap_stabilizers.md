<!-- symmetry-audit-integration:start -->
Integration status (2026-10-15):

All two claims below received independent exact-revision acceptance in the
[swap review](review_disjoint_swap_stabilizers_20261015_swap_auditor.md).
The reviewed body SHA-256 is
`bdbf5f1aabd35cfb1dec4d8ffa24dfb260a227d0561854c8dd652975161b7c46`.
The entire reviewed body is preserved below; its ready labels are historical.
Current state: accepted local deductions. Permitted mathematical use is exact
completed-state stabilizer and orbit accounting, and conditional support
restrictions. Partial-state pruning, generation and certificate implementation
require separate validation. No novelty or Ramsey branch closure is asserted.

See the [audit report](../../reports/2026-10-15-symmetry-audit.md) and its exact-hash manifest.
<!-- symmetry-audit-integration:end -->

# Exact stabilizers of disjoint vertex swaps

Date: 2026-10-15. Task: `symmetry-hour-20261015`. Author: Codex.
All claims are ready for independent review, with author self-checks only.
This is mathematical work; no graph enumeration or external tool was used.
No novelty claim or certified search implementation is supplied.

## Setting

Let Z be a finite simple graph with p specified disjoint pairs
P_i={a_i,b_i}; all other vertices are fixed. Let K=(C2)^p act by
independently interchanging pair endpoints. A bit vector s in F_2^p
specifies the product tau_s of swaps. Define

    L_Z={s:tau_s is an automorphism of Z}.

Thus L_Z is a subgroup of K. It is the stabilizer of this particular
completed graph, rather than the group acting on all possible completions.
For vertices u,w put

    delta_Z(u,w)=|{x outside {u,w}: Z(ux) != Z(wx)}|.

Vertex names, pair orientations and any fixed data must be transformed
consistently when using the resulting orbit action.

<a id="claim-disjoint-swaps-01"></a>
## 1. Every stabilizer is a partition subspace with pinned components

Claim ID: `docs/general_theorems/disjoint_swap_stabilizers.md#claim-disjoint-swaps-01`

Kind: local-deduction

Review state: accepted

Scope: every finite simple Z and specified disjoint-pair action above.

Dependencies: elementary vertex-permutation action on an adjacency matrix.

Conclusion: L_Z is described entirely by equations s_i=0 and s_i=s_j.
Make a graph Q on the p pair indices by inserting ij for each required
equality and mark every index with a required zero. Then L_Z consists
exactly of vectors constant on every component of Q and zero on every
component containing a marked index. If t components are unmarked,

    L_Z is isomorphic to (C2)^t, |L_Z|=2^t,
    |K.Z|=2^(p-t).

Its nonzero basis vectors are the indicators of the unmarked components;
these supports are disjoint. Computing Q and its marks requires inspection
of the original adjacency matrix only.

Proof: Edges between fixed vertices and the internal edge of a pair are
unchanged by every swap. For a fixed vertex x and pair i, unequal bits
Z(xa_i),Z(xb_i) require s_i=0; equal bits impose no constraint.

Between two pairs i,j, write the 2 by 2 adjacency block T with its rows
indexed by a_i,b_i and columns by a_j,b_j. Swaps act on this block by
row and column interchange. Its invariance subgroup inside F_2^2 is one
of the following, which exhaust all subgroups of this four-element group:

| Invariance subgroup | Equations on (s_i,s_j) |
| --- | --- |
| all F_2^2 | none |
| {(0,0),(1,0)} | s_j=0 |
| {(0,0),(0,1)} | s_i=0 |
| {(0,0),(1,1)} | s_i=s_j |
| {(0,0)} | s_i=0 and s_j=0 |

The subgroup can be determined by comparing T with its row, column and
simultaneous swaps; no assumption about Z is needed. Intersect these local
conditions for every fixed-vertex incidence and every pair block. They cover
all edges, so their conjunction is equivalent to tau_s fixing Z. Equality
propagates exactly along components of Q; a zero pins the entire component.
Every other component can be chosen independently. Orbit-stabilizer proves
the displayed orbit size.

Search use: exact symmetry accounting after independent review and validated
implementation; a completed-state stabilizer computation does not by itself
justify a partial-state pruning rule.

Reviews: [review](review_disjoint_swap_stabilizers_20261015_swap_auditor.md).

<a id="claim-disjoint-swaps-02"></a>
## 2. Pair separation forces large free components and large orbits

Claim ID: `docs/general_theorems/disjoint_swap_stabilizers.md#claim-disjoint-swaps-02`

Kind: local-deduction

Review state: accepted

Scope: the preceding setting with delta_Z(a_i,b_i)>=D for every specified
pair, where D is a positive integer.

Dependencies: Claim 01; definition of delta.

Conclusion: put h=1+ceil(D/2). Every unmarked component of Q has at least
h pair indices. Consequently

    t<=floor(p/h), |L_Z|<=2^floor(p/h),
    |K.Z|>=2^(p-floor(p/h)).

Every nonidentity product of swaps fixing Z swaps at least h pairs.
If p<h the K action on every such Z is free.

Proof: Let J be an unmarked component with w indices. Claim 01 says the
permutation exchanging exactly the w corresponding pairs is an automorphism.
For a pair i in J, every vertex outside the union of these pairs is fixed,
so has equal adjacency to a_i and b_i. At most 2(w-1) vertices inside the
other pairs can distinguish them. Hence D<=delta_Z(a_i,b_i)<=2(w-1),
which gives w>=1+ceil(D/2). Unmarked components are disjoint, so their
number is at most floor(p/h). Every nonzero stabilizer vector contains an
entire unmarked component, and the remaining conclusions follow.

The component description is stronger than treating L_Z as an arbitrary
binary linear code of minimum distance h: pair-block invariance permits
only equalities and pinned zeros, not general parity equations.

Search use: symmetry orbit bounds and rejection of impossible claimed
stabilizers after independent review; not a measured running-time factor.

Reviews: [review](review_disjoint_swap_stabilizers_20261015_swap_auditor.md).

## Author self-check and limits

The five two-bit invariance subgroups exhaust the possibilities because any
nontrivial proper subgroup of F_2^2 has exactly one nonzero element. Each
subgroup has the equations displayed; the local conditions inspect all edge
types. The unmarked-component indicator is a stabilizer vector, rather than
an arbitrary proposed permutation. Its fixed vertices cannot distinguish
the exchanged endpoints, which is the entire support argument.

This calculation supplies the stabilizer and orbit size for disjoint swaps
only. Extra automorphisms exchanging different pairs or acting on fixed
vertices need separate treatment. Additional fixed colors can pin more
components; they must never be omitted if the chosen candidate family stores
noninvariant data. No canonicalizer, SAT solver, timing experiment, exhaustive
graph check, or literature novelty review was performed.

Base revision: `7ebbef265ef9b55746b798b337b86e4fd6140045`.
