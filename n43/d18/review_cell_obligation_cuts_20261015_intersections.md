# Independent review of simultaneous cell-obligation cuts

Date: 2026-10-15.
Author reviewed: Codex cell-obligations agent.
Independent reviewer: Codex cell-intersection author, task
`/root/cell_intersection_retry`; distinct from the reviewed author.
Reviewed repository HEAD: `f98a1285b7adc9720a693ae3a54fba212a021bdf`.
The exact uncommitted source, rather than HEAD alone, is identified below.

| Reviewed file | Exact SHA-256 |
| --- | --- |
| `cell_obligation_cuts.md` | `46f6e43ab3758fb085c41b90418e3780d720374e53e04dfb25d36b77c843470f` |
| `anchored_cell_averaging.md` dependency | `719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3` |
| `review_audit_pending_averaging_20261015.md` dependency review | `e6964bfaaecc6a78b6d45ab922f3535a98a0c76174ec7be49445397bd6dfd66a` |
| `../../docs/workflow.md` review protocol | `51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2` |

Outcome: **accepted** for all four mathematical claims at the exact source
hash above. Their proposed search use may become **propagate**, retaining
the hypotheses and limitations below. The certificate-format paragraph
remains design, not an implementation claim.

No graph enumeration, solver, proof checker, theorem prover, download,
installation, or catalogue was used. The reviewed author note was not edited.
The author's self-audit was not relied on as proof.

## Scope and dependencies checked

G has order 43 and no K5 or I5, with a degree-18 root. B has order 24
and no K5 or I4: an I4 in B extends with the root to I5. A has no K4
or I5, and may contain I4. These ambient types are kept distinct.

For an actual A edge Q, a triangle in its containing-column cell T_Q
joins Q to give K5. For an actual independent A pair P, an independent
triple in its missing-column cell U_P joins P to give I5. Therefore the
two cell types and their triple implications can be checked directly.
Intersection membership gives both restrictions; overlapping Q and P
forces that cell empty. No condition on the cross-edge count or a census
extremum is required.

The universal capacity d_T(a)<=3 follows because a T-neighborhood is
independent in a triangle-free graph and T has no I4. The universal
nonneighbor capacity in U is four because its antineighborhood is a clique
in an I3-free graph and U has no K5. These are upper capacities at every
cell size. No minimum or saturation is assumed.

The global degree premise 18<=d_G(a)<=24 is the retained established
R(4,5)=25 premise for order 43: neighborhoods have type (4,5) and
antineighborhoods type (5,4), each of order at most 24. This review uses
that established Ramsey value without re-proving it from primary literature.
The proof does not require external graph census extrema. Supplied degree
intervals and other obligations must themselves be sound and applicable
to the specified actual subsets, or to proved permanent memberships in a
partial state. An omitted possible future member is never treated as absent
from a completed cell.

## Per-claim decisions

| Claim in `cell_obligation_cuts.md` | Outcome | Accepted use |
| --- | --- | --- |
| `claim-cell-signed-cut` | accepted | Rational necessary-condition cut and strict-failure rejection on its supplied state |
| `claim-cell-overlap-degree-cut` | accepted | Degree propagation on the exact intersection and union |
| `claim-cell-star-cover-cut` | accepted | Witnessed attachment demand against its remaining capacity |
| `claim-cell-odd-cycle-certificates` | accepted | Explicit local infeasibility certificate, conditional on every listed witness |

## Signed lower obligations and upper capacities

I independently rewrite every upper edge inequality c_l z<=H_l as
-c_l z>=-H_l, and every upper nonedge inequality d_m(1-z)<=J_m
as -d_m(1-z)>=-J_m. Multiplication by nonnegative multipliers and addition
to the lower obligations gives exactly

    V <= sum_e [alpha_e*z_e+beta_e*(1-z_e)].

The source's alpha, beta, and V subtract the upper families with the correct
signs. The single-pair right side is beta_e when z_e=0 and alpha_e when
z_e=1; its maximum is precisely max(alpha_e,beta_e), even if both numbers
are negative. For a fractional value 0<=z_e<=1 it is their convex
combination, proving the same bound. Thus independent pair maximization
produces a necessary upper bound on the weighted demands. It can be loose
when pair choices are coupled, but that cannot invalidate rejection by
strict violation.

This reasoning checks zero multipliers, empty families, empty D, arbitrary
nonnegative rational coefficients, and all assigned binary states. Assigned
pair contributions have to be subtracted from the obligation constants
before passing to D; the source states this. For example, a single pair
required to be both edge and nonedge gives alpha=beta=1,V=2 and upper
bound one, an immediate rejection. An edge demand z>=1 and an upper edge
capacity z<=0, both weighted one, give alpha=beta=0,V=1 and upper bound
zero. A lone upper capacity z<=0 gives alpha=-1,beta=0,V=0 and does not
incorrectly reject. These boundary checks agree with the algebra.

Clearing all denominators, including those in products of coefficient and
multiplier, by one positive integer preserves inequality direction and
commutes with the maximum. The resulting strict integer comparison is
checkable evidence conditional on its supplied obligations. Failure to find
a violated cut cannot establish feasibility; no such converse is claimed.

## Vertex overlap and known outside pairs

For a vertex a inside both T and U, partition its neighbors into S,
T-U, and U-T. Their counts are d_S, d_T-d_S, and d_U-d_S, so

    d_(T union U)=d_T+d_U-d_S.

Solving for d_S and applying independently sound intervals gives lower
bound l_T+l_U-u_W and upper bound u_T+u_U-l_W, which must also be
intersected with [l_S,u_S]. These are exactly interval (2). Solving for
d_W gives lower bound l_T+l_U-u_S and upper bound u_T+u_U-l_S,
exactly interval (3). The pre-existing [l_W,u_W] still applies, so it may
be intersected with (3) during propagation. Their lack of explicit inclusion
inside (3) is not a mathematical error: (3) is stated as another necessary
interval, not the complete feasible interval. Empty derived intervals reject
only when all input intervals are applicable.

For an actual Z containing a in B, m=|Z| and c=|C_a|, a has no edge to
the root, so d_B(a)=d_G(a)-c. B-Z has exactly 24-m vertices. It gives

    d_Z(a)>=18-c-(24-m),
    d_Z(a)<=24-c,

and intersection with 0<=d_Z<=m-1 proves both coarse endpoints. If h_out
of those outside pairs are known nonedges, at most 24-m-h_out outside
neighbors remain possible. If f_out are known edges, at least f_out
outside neighbors are unavoidable. These observations give the exact
displayed tightened lower and upper endpoints with the correct signs.
They cover all outside assignments provided forced edges and nonedges
are sound, distinct, and counted among B-Z; any contradictory pair
assignment is already an invalid partial state. A fixed global degree
can replace the global endpoints as advertised. Nothing gives a vertex
outside Z an unearned anchored-cell type.

## Star demand and fractional matching

In the edge-cell pattern, each leaf is in T and each center-leaf pair is
undecided. The other forced T-neighbors consume f units of d_T(a)<=3,
so sum_i z_i<=3-f is sound. Any stronger independently proved capacity
h remains sound. If f>3 the state is already rejected; this does not
need an assumption that 3-f is nonnegative.

For each H edge ij, the named U_(P_ij) contains all three occurrences
and b_i b_j is a known nonedge. If both center-leaf pairs were also
nonedges, this would be I3 in that named cell. Therefore z_i+z_j>=1.
The anchors can vary across edges of H; the derivation is edge by edge
and never needs a single common anchor. Consequently the selected leaf
neighbors form a vertex cover of H, whose order is at most h. The
necessary exact statement is tau(H)<=h. It makes no sufficiency claim
for completing the actual graph.

For any supplied nonnegative rational lambda satisfying the incident
weight bounds, adding its weighted triple inequalities gives

    sum_ij lambda_ij <= sum_i z_i * sum_j lambda_ij
      <= sum_i z_i <= h.

The middle inequality uses z_i>=0 and coefficient at most one. This proves
the advertised cut and its integral ceiling. It handles isolated leaves,
zero weights, multiple witnesses for the same H edge (which need not be
counted repeatedly), and all possible assignments of the undecided star.
No graph-theoretic matching algorithm or vertex-cover computation is needed
to check a supplied fractional certificate.

The dual sets z_i to the center-leaf nonedge indicator inside U. A known
leaf edge and a named common T cell make two further center-leaf edges
impossible by T's triangle prohibition. Hence the same inequality follows.
Four forced U-nonneighbors consume the dual capacity four with exactly the
same arithmetic. This duality uses B cell types; it does not impose B's
I4 restriction on A. Inferred relations may be stored in sound closures
F*,H*, and the note correctly avoids declaring them members of the original
witness-defined F,H.

## Odd-cycle certificates and examples

A cycle of length 2h+1 on distinct leaves has exactly two cycle edges
incident to each leaf. Weight one half on each edge satisfies the incident
capacity one, and its total h+1/2 exceeds the integral upper capacity h.
Equivalently, summing the unweighted triple inequalities yields
2*sum_cycle z_i>=2h+1. Nonnegativity and sum_all z_i<=h yield
2*sum_cycle z_i<=2h. These contradict each other even over real values;
binary rounding is not needed for this odd-cycle rejection.

At h=0 one witnessed pair gives z_i+z_j>=1 against sum_all z<=0.
Extra leaves cannot remove the contradiction; chords do not enter the
specified proof and need no assigned value. Every cycle edge must still
have its exact opposite leaf-pair assignment and named anchor witness.

I checked the four containing-cell rows: f=0,1,2,3 gives capacity
3,2,1,0 and rejecting cycle length 7,5,3, or one witnessed pair.
The first three rows use 2h+1; the last is the h=0 case. The dual rows
f=0,1,2,3,4 give capacity 4,3,2,1,0 and rejecting length 9,7,5,3,
or one pair. Forced pairs outside the chosen cycle consume capacity;
undecided pairs outside it only add nonnegative terms to the attachment
sum, so the rows remain sound when more leaves exist. These are conditional
examples. Some configurations may already violate another local type bound,
which affects usefulness but not validity.

## Limits and integration handoff

All four deductions are independently accepted at the exact reviewed hash.
They may reject their explicitly witnessed partial states, or propagate
their necessary inequalities, once those statements and review metadata
are integrated by the coordinator. They do not prove that a rejecting
configuration must occur in every candidate, nor that passing the cuts
implies completion. The general signed cut has no completeness claim.

The design paragraph suggests locally checkable certificate data; no verifier
was implemented or tested. No external-literature novelty assessment,
order-43 case coverage, formal certificate replay, or nonexistence proof
was supplied. Any mathematical source edit requires renewed review; a
metadata-only integration may preserve this acceptance after its diff is
checked against the reviewed hash.
