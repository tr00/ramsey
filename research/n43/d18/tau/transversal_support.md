<!-- tau-support-review-integration:start -->
Integration status (2026-10-19): all three claims independently **accepted** in
[the exact-revision review](review_transversal_support_20261019_independent.md),
at SHA-256 `905edd28fcd6640dd4246a83b01251405525c1c43ed475e00cc620835be8f67a`.
The author-stage body below is unchanged; its ready labels are historical.
The q1 dependency is independently accepted. Permitted use: the stated
support/attachment restrictions and rootwise/regular propagation only.
<!-- tau-support-review-integration:end -->

# Support capacity and consequences of the q1 zero-excess exclusion

Date: 2026-10-19. Task: `d18c-tau-frontier-20261019`. Author: Main.
All three claims are **ready** for independent review. No novelty claim.
Mathematical research only; no graph search, solver or catalogue processing.

## Setting

G is a simple K5/I5-free graph on43vertices. The chosen vertex v has degree18.
Write A=N(v), B=M(v), |A|=18, |B|=24. Then A is K4/I5-free and B is
K5/I4-free; A may and does contain independent four-sets. Put

    q=85-e(A), epsilon_a=d_G(a)-18, E_A=sum_A epsilon_a,
    w(a)=d_A(a)-epsilon_a, x=e(A,B)=136+2q+E_A.

Recorded premises are 0<=epsilon_a<=6, d_A(a)<=13,
d_B(a)=17-w(a), and sum_A w=306-x. For every independent four-set I in A,

    sum_I w<=32.

The last bound follows from the actual24column interface, not from an
isolated A: every column meets I, each exact singleton class is a clique
of size at most3, and hence e(I,B)>=36. This is the accepted
[anchor-defect bound](../frontier_band.md#claim-frontier-anchor-defects).
Let tau be the minimum size of a set meeting every I4 of A.

## 1. Projected capacity on the possible I4 support

<a id="claim-tau-support-capacity"></a>

Claim ID: `research/n43/d18/tau/transversal_support.md#claim-tau-support-capacity`
Kind: local-deduction
Review state: ready
Scope: every rooted graph above; any integer lower bound t<=tau
Dependencies: anchor-defect bound; actual-column transversality
Conclusion: every set S containing every independent four-set satisfies
sum_(a in S)(17-w(a))>=24t. In particular this holds for the weight-defined
support S_w below.
Search use: propagate; terminate a case only when this capacity is contradicted
Reviews: none

For a in A let m_3(a) be the sum of the three smallest weights among A-{a},
counted with multiplicity, and define

    S_w={a in A: w(a)+m_3(a)<=32}.

Proof. If an independent four-set contains a, its other three weights sum
to at least m_3(a), proving that all such four-sets are contained in S_w.
For any S containing every I4 and any y in B, C_y intersect S is itself a
transversal: C_y meets each I4 and all members of that I4 belong to S.
Thus |C_y intersect S|>=tau>=t. Sum over all24 y and double count to get

    24t<=sum_y |C_y intersect S|=e(S,B)=sum_(a in S)(17-w(a)).

The same argument holds for the exact union of all I4s, but computing it
is not required. S_w is only a safe support superset: passing its inequality
proves neither that I4s exist with those weights nor that G exists.
No sign assumption on w is needed beyond the recorded degree identities.

Two equivalent useful refinements follow from the same proof:

- If every I4 avoiding a fixed set L lies in D, then
  L union(C_y intersect D) is a transversal, so e(D,B)>=24(t-|L|).
- Vertices proved absent from all I4s must be discarded before counting
  the projected capacity, even if their full columns are large.

This abstracts the117<120 contradiction at
[x137](../x137/frontier_closure.md#claim-x137-closure-exclusion).
The new use at x138 reaches118<120 rather than relying on a blanket
bound |C_y|>=5 alone.

## 2. Complete-tripartite attachment obstruction

<a id="claim-tau-tripartite-attachments"></a>

Claim ID: `research/n43/d18/tau/transversal_support.md#claim-tau-tripartite-attachments`
Kind: local-deduction
Review state: ready
Scope: any finite K4/I5-free graph A, an induced H=K_(p1,p2,p3) with
1<=p_i<=4, and a disjoint set Z whose members each meet exactly two whole
parts of H and miss the third
Dependencies: K4/I5 prohibitions only
Conclusion: if a missing part has size4 no vertex may have that type;
otherwise at most4-p_i vertices miss part i. Thus |Z|<=12-|H|.
Separately, an induced K333 cannot coexist with a disjoint independent4.
Search use: terminate these explicitly specified local configurations
Reviews: none

Proof. Classify Z by its omitted part. Two vertices in the same class
have a common H-neighborhood containing an edge, so they cannot be adjacent:
that edge and the two vertices would be K4. The class and its omitted
part are therefore a single independent set, of order at most4. This
proves all three class caps and their sum. If p_i=4 the cap is zero;
if an induced H already contained I5, the ambient hypotheses would fail.

For the second assertion, let H=K333 and let I be a disjoint independent4.
For every i in I its H-neighborhood is triangle-free, so it misses one
whole part: a neighbor in each of the three parts would make K4 with i.
Among four i, two miss the same three-vertex part. Those two and that
part give I5. This argument does not require saturated attachment degrees.

In particular, twelve vertices with triangle-free four-neighbor attachments
to an induced K222 are impossible. Indeed such a four-subset is exactly
two whole parts; the first assertion permits at most6 attachment vertices.
This is the equality obstruction used to rule out three disjoint saturated
anchors in the q1 proof. It is an obstruction to a concrete local pattern,
not a declaration that an arbitrary tripartite core is forbidden.

## 3. Rootwise and regular consequences

<a id="claim-tau-q1-global-transfer"></a>

Claim ID: `research/n43/d18/tau/transversal_support.md#claim-tau-q1-global-transfer`
Kind: local-deduction
Review state: ready
Scope: every order43 K5/I5-free graph and every degree18 root; final
paragraphs additionally assume that the entire graph is18regular
Dependencies: [q1 zero-excess exclusion](q1_anchor_reduction.md);
accepted [x136](../x136/frontier_exclusion_handoff.md) and
[x137](../x137/frontier_closure.md) exclusions;
[exact root budgets](../pivot_classes.md#1-complete-numerical-profiles)
Conclusion: q=1 forces E_A>=1 and x>=139; E_A=0 forces q>=2,
e(A)<=83 and x>=140. Every18regular candidate has q_v in{2,3,4} at every
vertex,1161<=t(G)<=1189 and1864<=i3(G)<=1892.
Search use: propagate only after the q1 proof receives independent acceptance
Reviews: none

Proof. q=1,E_A=0 is exactly the excluded x138 q1 case. E_A is a
nonnegative integer, so q=1 implies E_A>=1, and the exact identity yields
x>=136+2+1=139. If E_A=0, q=0 is the excluded x136 case and q=1 is now
excluded; hence q>=2, e(A)=85-q<=83 and x=136+2q>=140.
No zero-excess or connectedness condition is transferred to a different
root without checking its own neighborhood excess.

If G is18regular, E_v=0 at every vertex, W=sum_V(d_G-18)=0,
and the exact antineighborhood edge identity gives

    e(G[M(v)])=148-q_v.

The recorded (5,4,24) minimum144 implies q_v<=4. Hence q_v in{2,3,4}
and81<=e(G[N(v)])<=83 everywhere. Each triangle is counted at its three
vertices, giving

    43*81<=3t(G)<=43*83,
    1161<=t(G)<=1189.

Goodman's triple identity, obtained by counting mixed triples at their
unique two incident edge/nonedge choices, gives

    t(G)+i3(G)=C(43,3)-(1/2)*43*18*24=3053.

Subtracting the two triangle endpoints proves1864<=i3(G)<=1892.
These are necessary invariants, not a classification or exclusion of
18regular graphs. In particular q2,q3,q4 and the q0,E_A=2 slice of
x138 remain outside this consequence's termination scope.

## Review and scope

The q1 exclusion is proved separately, not presumed from the support lemma.
The weight test uses only a necessary bound on independent four-sets;
it cannot replace actual graph compatibility. There is no full connected-d18
or order43 closure, no exhaustive graph catalogue, and no formal certificate.
External Ramsey numbers and published edge extrema retain their repository
premise status. Source revision hashes and exact scalar/fixed-object validation
are retained in the dated research report after review.
