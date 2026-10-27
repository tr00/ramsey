# Cut capacities force prescribed root families

- **Kind and scope:** three local deductions for a finite simple K_r-free
  graph, r>=3, its full minimum-degree root set, and an explicitly justified
  nonnegative integer root statistic satisfying `q_v+E_v<=B`. That inequality
  is an input, not a consequence of K_r-freeness.
- **Author:** Codex coordinator. **Independent reviewer:** overlap-author agent,
  distinct from the author. **Review state:** accepted for all three claims on
  their stated premises; this editorial consolidation retains historical
  acceptance, not a new mathematical review.
- **Dependencies:** degree summation, elementary weighted incidence, Turan's
  theorem, the input root inequality and, for composition, an independently
  proved prescribed-family overlap theorem. The order-43 illustration retains
  its published neighborhood/antineighborhood extrema dependencies; these
  were not independently recertified.
- **Search use:** propagate the necessary numerical bounds and reject only
  inconsistent profiles. Composition supplies existence coverage for complete
  two-root families, retaining every permitted overlap map, completion and
  applicability premise. Neither the abstract claims nor the conditional
  illustration exclude order 43.

Cut demand and weighted cut demand give lower bounds on the same prescribed
root family; either valid bound can enable an applicable overlap theorem.
This abstracts [degree excess cuts](../n43/d18/excess_bounds.md) and
[pairwise family refinements](../n43/d18/pairwise_pivot_refinements.md).
It uses no graph computation or new external data. No novelty is claimed.

## Setting

Let G be a finite simple K_r-free graph, r>=3, of order n and minimum
degree d. Let P be all vertices of degree d, with p=|P|>0, and H=V(G)-P,
h=|H|. For z in H put eta_z=d_G(z)-d>0, W=sum_H eta_z, Z=sum_H eta_z^2.
For v in P put E_v=sum_(z in N(v) intersect H) eta_z. Suppose an explicitly
justified nonnegative integer root statistic q_v satisfies

    q_v+E_v<=B

for a common real number B>=0. This inequality is an input hypothesis,
not a universal consequence of K_r-freeness. For integer Q>=0 put
F_Q={v in P:q_v<=Q}, M_Q=|F_Q|. All conclusions retain this same family.
Empty H is permitted, with W=Z=0 and empty sums zero.

<a id="claim-cut-capacity-01"></a>
## 1. Exact cut demand and multiset capacities

Scope: setting above, actual excess multiset; every integer Q>=0

Dependencies: degree summation; Turan's theorem; input root inequality

Conclusion: the capacity inequalities below

Search use: propagate; terminate only a profile violating a necessary inequality

Sort eta_1<=...<=eta_h, and put S_m=sum_(i=1..m)eta_i, S_0=0. Define

    t(j)=max{m:0<=m<=min(h,d), S_m<=B-j}.

If the set is empty, no root with q_v>=j exists. Otherwise every such
root has at most t(j) neighbors in H: m neighbors have total excess
at least S_m, and E_v<=B-j. These are separate necessary bounds at each
root; they do not assume simultaneous choices of the cheapest neighbors.

The actual cut C=e(P,H) satisfies

    C=dh+W-2e(G[H]),
    C>=C_lo=dh+W-2floor((r-2)h^2/(2(r-1))).

The identity sums degrees on H. Turan bounds the edges of its K_r-free
induced graph, proving the second line. C itself can replace C_lo when known.

All roots have capacity t(0), so C_lo<=p*t(0) is necessary. If t(Q+1)
exists and t(0)>t(Q+1), counting the cut on P gives

    M_Q>=max(0,ceil((C_lo-p*t(Q+1))/(t(0)-t(Q+1)))).

Indeed C<=M_Q*t(0)+(p-M_Q)*t(Q+1). If this lower bound exceeds p,
the assumed profile is impossible. If t(Q+1) is undefined, every root
belongs to F_Q. If the two capacities agree, C_lo>p*t(0) excludes the
profile, and otherwise this comparison gives no family lower bound.

<a id="claim-cut-capacity-02"></a>
## 2. Weighted cut demand gives a second bound on the same family

Scope: setting above; h>0 for eta_min; thresholds specified below

Dependencies: elementary weighted incidence; Turan's theorem

Conclusion: exact identity and weighted family bound below

Search use: propagate

Let J=sum_(v in P)E_v. Each vertex z in H has
d_P(z)=d+1-h+eta_z+d_(complement H)(z). Thus

    J=(d+1-h)W+Z+sum_(yz nonedge in G[H])(eta_y+eta_z).

The identity follows by multiplying by eta_z and summing; each H nonedge
is counted once at either endpoint with the respective weight. For h>0,
eta_min=min_H eta_z and L_h=binom(h,2)-floor((r-2)h^2/(2(r-1))) give

    J>=J_lo=(d+1-h)W+Z+2*eta_min*L_h.

Turan is applied to H itself to lower-bound its nonedges. No assumption
that its complement is K_r-free is needed. The bound can be weakened by
replacing Z by its balanced integer minimum at fixed h,W: if W=ha+b,
0<=b<h, this is h*a^2+b*(2a+1). Moving a unit between entries differing
by at least two proves the minimum. Positivity of eta is preserved since
W>=h. For h=0, J=0 instead.

Put D=B-Q-1 and A=min(W,B). Suppose 0<=D<A. Every root in F_Q has
E_v<=A, and every root outside it has E_v<=D. Therefore

    M_Q>=max(0,ceil((J_lo-p*D)/(A-D))).

This follows from J_lo<=J<=M_Q*A+(p-M_Q)*D. The actual J or any proved
lower bound can replace J_lo. If D<0 there are no outside roots. If
D>=A the displayed comparison is not available. A bound above p excludes
the profile rather than creating more than p roots.

<a id="claim-cut-capacity-03"></a>
## 3. Composition with a prescribed-family overlap theorem

Scope: setting above; an independently proved theorem applying to every
subset of P of size at least m_0

Dependencies: claims 01 and 02; the specified family theorem

Conclusion: if either bound gives M_Q>=m_0, the guaranteed pair is in F_Q

Search use: branch, retaining all permitted pair maps and completions

Suppose every subset F of P with |F|>=m_0 contains an edge satisfying
a specified overlap restriction. Apply that theorem to F_Q itself.
Both endpoints have q<=Q, and that very edge has the overlap restriction.
The maximum of the two valid lower bounds above can be used, since both
count the same F_Q. Neither bound alone asserts an edge when m_0 is not
reached, and separately selected root optimizers cannot be combined.

See [prescribed-family overlap](family_overlap.md) for the corresponding
abstract overlap framework; its hypotheses must be established for the
family used here.

In the original order-43 setting, substitute n=43,d=18,r=5,
q_v=85-e(N(v)), B=W/2+4. The latter inequality retains its published
neighborhood/antineighborhood extrema dependencies; it is not proved here.
Claims 01 and 02 recover the existing multiset and weighted bounds.
For h=3,W=18 and excesses (6,6,6), Q=1 gives B=13,
t(0)=2,t(2)=1,C_lo=66,p=40, hence M_1>=26. The accepted
[thirteen-root overlap theorem](../n43/d18/dense_pivot_coverage.md)
then supplies an edge with both neighborhood edge counts at least 84
and codegree at most ten. This is a conditional existing case, not an
unconditional upper bound on h,W,x or an order-43 exclusion.

## Provenance and limits

The abstract statements use no census numbers. Their application requires
proving the input root inequality and any overlap theorem at the desired
parameters. Deficits need not be neighborhood edge deficits; any integer
statistic meeting the stated inequality is permitted. No formal certificate,
literature review, or new global Ramsey bound is supplied.

The [historical integration manifest](../../docs/general_theorems/integration_manifest.json)
records the reviewed and integrated source snapshots. The committed integration
snapshot in Git (`f98a128`) matches the manifest's integrated fingerprint;
removing only its integration-status banner reconstructs the exact reviewed
fingerprint recorded by the reviewer and manifest. The pre-migration source
matches that snapshot after reversing only review-state and review-link
administration and relocated order-43 links. The development retained here
removes repeated administrative fields and updates links, without changing its
setting, statements, hypotheses, proofs or search conditions. Historical paths
and hashes remain identifiers of the original evidence, not this relocated
file. This correspondence preserves acceptance and is not renewed review.

<a id="independent-review"></a>
<a id="independent-review-of-cut-capacity-family-bounds"></a>
## Independent review of cut-capacity family bounds

Reviewer: overlap-author agent, distinct from author Codex coordinator.
Scope: all three claims, [01](#claim-cut-capacity-01),
[02](#claim-cut-capacity-02) and [03](#claim-cut-capacity-03).

Dependencies reviewed: direct proofs in the three claims; Turan's theorem
for a `K_r`-free graph; the input statistic inequality `q_v+E_v<=B`.
The order-43 illustration was compared with
[excess bounds](../n43/d18/excess_bounds.md) and
[pairwise pivot refinements](../n43/d18/pairwise_pivot_refinements.md).
The accepted source
[dense pivot coverage, Claim 01](../n43/d18/dense_pivot_coverage.md#claim-dense-pivot-01)
and its existing independent review were read; its structural proof was also
checked directly in the reviewer's parallel abstraction work. Published census
extrema remain input premises, not independently recertified facts of this review.

### Independent checks

All three claims were independently checked. Sorted positive excesses give
a necessary per-root cut capacity, without simultaneous cheap selections.
Turan on H yields the cut demand. The family-count inequality uses positive
t(0)-t(Q+1), with inward rounding and the empty-capacity cases handled.

The numerical applications and the same-family overlap composition were
recomputed. q+E<=B is an input to establish separately, not a universal
consequence of the abstract theorem. Both endpoint predicates hold on the
same guaranteed edge only when the prescribed family hypotheses are met.

Outcome: accepted for all three claims on their explicitly stated hypotheses.
No proof correction is required for the exact reviewed revision.

Permitted search use: numerical propagation and rejection of inconsistent
profiles; composition gives existence coverage for complete two-root families.
Allowed overlap maps, completions, and applicability premises must be retained.

Limits: no graph computation, formal certificate checking, or census
recertification was performed. The real root bound `B` and any required
overlap theorem remain application-specific inputs. Neither the abstract
claims nor the conditional illustration exclude order 43. Novelty was not
checked. Proof changes require renewed exact-revision review.

## Validation

Direct checks on a prescribed five-vertex path, five-cycle and three-leaf
star reproduced the cut and weighted-incidence identities and applicable
family bounds. These cover empty H, real B, undefined outside capacity,
equal capacities, negative D and the unavailable D>=A comparison. The
conditional order-43 illustration was also recomputed. These are fixed-object
and arithmetic checks, not renewed independent review or a Ramsey search.

## Changelog

- Consolidated the cut-capacity development and its independent review into
  one authoritative foundations topic. Preserved all three claims' historical
  acceptance, original heading targets and claim anchors, full proof arguments,
  conditional order-43 illustration and substantive review limits; removed
  obsolete administrative repetition without changing mathematics.
