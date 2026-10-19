<!-- tau-q1-review-integration:start -->
Integration status (2026-10-19): all five claims independently **accepted** in
[the exact-revision review](review_q1_anchor_reduction_20261019_independent.md),
at SHA-256 `aca13de84acbdaebc2e64f01d8f3c6a68dcf016aded09488233cbab02a75bcc7`.
The author-stage body below is unchanged; its ready labels are historical.
Permitted use: terminate x138,q1,E_A=0 on the recorded premises.
This does not by itself exclude the other x138 slice or the full d18 branch.
<!-- tau-q1-review-integration:end -->

# Excluding x138 with q=1 and zero neighborhood excess

Date: 2026-10-19. Author: `TauQ1Closure`.
Task token: `tau-q1-closure-20261019`.
Base commit: `1581b3ae1b0e5ca5b65a6177fd8d04678ef96782`.

**Review state: ready, not accepted.** Independent review by a distinct author
at the exact file hash is required before termination use. No graph search,
solver, catalogue processing, download, installation, or theorem prover was
used. No novelty claim is made. The proof below excludes the entire
`q=1,E_A=0,x=138` slice on the recorded literature premises; it does not
exclude the other x138 slice `q=0,E_A=2` or all connected degree-18 roots.
Connectedness is not needed here.

## Setting and dependency ledger

Let G be an order-43 K5/I5-free graph with minimum degree at least 18,
and let v have degree 18. Put A=N(v), B=M(v), and C_y=N_A(y).
Assume

    q=85-e(A)=1,  E_A=sum_(a in A)(d_G(a)-18)=0.

Thus |A|=18, |B|=24, e(A)=84, and every a in A has d_G(a)=18.
The graph A is K4/I5-free and may contain I4; B is K5/I4-free.
The degree and cross-edge identities are

    d_B(a)=17-d_A(a),  sum_A d_A=168,  x=e(A,B)=138.

Write F=I4(A), tau=tau(F),

    L={a in A:d_A(a)<=7}, ell=|L|, D={a in A:d_A(a)=8}.

A transversal means an abstract subset of A meeting every member of F,
not necessarily an actual column. Every C_y is such a transversal because
otherwise an I4 missed by y, together with y, is I5 in G.

The external and accepted inputs retained here are:

1. The accepted [q1 anchor theorem](../sos_finite_moments.md#claim-finite-q1-anchor)
   provides an I4 with all four A-degrees at least eight. Its hypotheses
   q=1 and E_A<=29 hold. No other assertion of the pending
   [zero-excess research note](../c/w0/research.json) is used as a premise.
2. R(3,5)=14 gives d_A(a)<=13: an A-neighborhood is triangle-free and
   I5-free. The published E(4,5,17)<=79 gives d_A(a)>=84-79=5.
   These sources are recorded in the [root table](../../../README.md#state-of-the-art).
3. For K4/I4-free cores use the caps U(m) below. At m<=9 use Turan's
   K4-free bound. At m=10 use the accepted
   [elementary core cap](../x136/five_column_compatibility.md#claim-five-columns-core-caps).
   At m=11 use the accepted
   [finite-moment cap](../sos_finite_moments.md#claim-finite-core-caps).
   At m=12 and 14 use the published upper bounds 40 and 50 in the root
   table, sourced there to McKay--Radziszowski (1992).

|m|0|1|2|3|4|5|6|7|8|9|10|11|12|14|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|U(m)|0|0|1|3|5|8|12|16|21|27|31|36|40|50|

The cap at 12 is 40, not the weaker elementary 43. Turan equality at
order six and 12 edges makes the core K_{2,2,2}. For every j-set S in A,

    e(A[S])>=b4(j),

where b4(j) is the sum of binomial(part size,2) over four balanced parts
of total j. This applies Turan to the K5-free complement of A[S].
The [x137 effective-anchor](../x137/effective_anchor.md) and
[x137 closure](../x137/frontier_closure.md) motivate the comparison;
no assertion specific to e(A)=85 is transferred without the proof below.

<a id="claim-q1-saturated-anchors"></a>
## 1. Saturated anchors and double domination

Claim ID: `n43/d18/tau/q1_anchor_reduction.md#claim-q1-saturated-anchors`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; every independent four-set in A
Dependencies: setting input 1; K5/I5 prohibitions; degree identity
Conclusion: every I4 has degree sum at most 32; at least one has all
four degrees eight; every such anchor double dominates its complement,
has saturated singleton/double B signatures, and leaves 52 edges in A-I
Search use: none pending independent review
Reviews: none

Proof. For any I in F every B vertex has at least one neighbor in I.
An exact singleton I-signature class is a clique: a nonadjacent pair in
that class, together with the other three vertices of I, would be I5.
It has size at most three, since four members together with their common
anchor vertex would be K5. Thus, if n1 counts singleton columns,

    e(I,B)>=n1+2(24-n1)=48-n1>=36.

The four row degrees give e(I,B)=68-sum_I d_A, so sum_I d_A<=32.
Input 1 supplies an I4 with all four degrees at least eight, hence
exactly eight. Call any such set an anchor. Every I4 avoiding L is
also an anchor, since all its degrees are at least eight.

For an anchor e(I,B)=36, so both inequalities in the display are equalities.
There are exactly three singleton columns of each of the four types,
each class is a triangle, and the other twelve columns have signature
size two. Each anchor vertex has B-degree nine, of which three goes to
its singleton class, leaving six double-signature incidences.

If a in A-I has no I-neighbor, then I together with a is I5. If it has
only i as I-neighbor, avoiding I5 forces a to be adjacent to all three
vertices of the B singleton class {i}: a nonedge to one of them and
I-{i} would be I5. That triangle, a, and i then form K5. Consequently
all a in A-I have at least two neighbors in I. Finally I is independent,
so e(A-I)=84-sum_I d_A=84-32=52.

<a id="claim-q1-three-anchor-obstruction"></a>
## 2. Three disjoint anchors are impossible at the one-edge deficit

Claim ID: `n43/d18/tau/q1_anchor_reduction.md#claim-q1-three-anchor-obstruction`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting
Dependencies: preceding claim; d_A<=13; Turan's theorem and equality
Conclusion: A contains no three pairwise disjoint anchors
Search use: none pending independent review
Reviews: none

Proof. Suppose I,J,K are disjoint anchors. Set Z=I union J union K
and R=A-Z, so |R|=6. Double domination gives at least eight edges
between each anchor pair, whence e(A[Z])>=24. The degree sum on Z is 96,
and A[R] is K4-free. Therefore

    84=96-e(A[Z])+e(A[R])<=96-24+12=84.

All bounds are tight. Thus e(A[Z])=24, A[R]=K_{2,2,2}, and every
anchor pair has exactly eight edges. Since every vertex has at least
two neighbors in each other anchor, it has exactly two in each and
therefore exactly four neighbors in R.

Write R=P1 union P2 union P3 for the independent two-vertex parts.
The R-neighborhood of any z in Z is triangle-free, or a triangle with z
would give K4 in A. A triangle-free subset of K_{2,2,2} meets at most
two parts; a four-element such subset is exactly two whole parts.
Thus every z omits exactly one part Pj and meets both other parts fully.
Let n_j be the number of Z vertices omitting Pj. Each r in Pj has

    d_A(r)=4+(12-n_j)=16-n_j.

The upper bound d_A(r)<=13 implies n_j>=3 for j=1,2,3.
Their sum is 12, so each n_j<=6.

The four vertices of I have only three omitted-part types, so two of
them, i and i', omit the same Pj. The set {i,i'} union Pj is an I4:
the pair in I is nonadjacent, Pj is independent, and the cross edges
are absent by the omitted type. But its degree sum is

    8+8+2(16-n_j)=48-2n_j>=36>32,

contradicting Claim 1. This is the additional argument required at
84 edges: the scalar equality with a K_{2,2,2} remainder alone is not
a contradiction.

<a id="claim-q1-at-most-one-low-degree"></a>
## 3. At most one A-degree is below eight

Claim ID: `n43/d18/tau/q1_anchor_reduction.md#claim-q1-at-most-one-low-degree`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; L and ell as defined above
Dependencies: preceding two claims; the setting core caps; Turan lower bound
Conclusion: ell<=1
Search use: none pending independent review
Reviews: none

Proof. Since 168=sum_A d_A<=7ell+13(18-ell), ell<=11.
Fix an anchor I, which is disjoint from L. Suppose ell>=2.
If I union L hits every I4, its remainder H is K4/I4-free and

    e(H)=84-sum_(I union L)d_A+e(A[I union L])
        >=84-32-7ell+2ell+b4(ell)
        =52-5ell+b4(ell).

The complete first deletion table is

|ell|2|3|4|5|6|7|8|9|10|11|
|---|---|---|---|---|---|---|---|---|---|---|
|b4(ell)|0|0|0|1|2|3|4|6|8|10|
|order H|12|11|10|9|8|7|6|5|4|3|
|lower e(H)|42|37|32|28|24|20|16|13|10|7|
|U(order H)|40|36|31|27|21|16|12|8|5|3|

Every row is impossible. Therefore I union L is not a transversal,
and an I4 J is disjoint from it. Since J avoids L it is an anchor.
This already rules out ell=11, whose first remainder has order three.
We may retain 2<=ell<=10.

If I union J union L is a transversal, its remainder H' is K4/I4-free.
Double domination contributes at least eight edges between I and J,
and each L vertex has at least two neighbors in each anchor. Hence

    e(H')>=84-64-7ell+8+4ell+b4(ell)
          =28-3ell+b4(ell).

The second deletion table covers every remaining ell:

|ell|2|3|4|5|6|7|8|9|10|
|---|---|---|---|---|---|---|---|---|---|
|order H'|8|7|6|5|4|3|2|1|0|
|lower e(H')|22|19|16|14|12|10|8|7|6|
|U(order H')|21|16|12|8|5|3|1|0|0|

Thus this union is not a transversal either. It leaves an I4 K,
which avoids L and hence is a third anchor disjoint from I and J,
contrary to Claim 2. For remainder orders below four the same reasoning
already contradicts the existence of an I4 in that remainder. All
ell>=2 have been eliminated.

<a id="claim-q1-five-transversal"></a>
## 4. Every abstract independent-four transversal has size at least five

Claim ID: `n43/d18/tau/q1_anchor_reduction.md#claim-q1-five-transversal`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting; every abstract I4-transversal
Dependencies: Claims 1 and 3; U(14)=50; R(3,4)=9
Conclusion: tau>=5, in particular every actual |C_y|>=5
Search use: none pending independent review
Reviews: none

Proof. First establish the degree floor for an arbitrary four-set
transversal T. Put Q=A-T, so Q is K4/I4-free on 14 vertices and e(Q)<=50.
For t in T let J=T-{t}. Each Q-neighborhood of a J vertex is triangle-free
and I4-free, so has order at most eight by R(3,4)=9.
If e(A[J])<=2, then

    e(A-t)=e(Q)+e(J,Q)+e(A[J])<=50+24+2=76.

If J is a triangle, its three Q-neighborhoods have empty triple
intersection, because A is K4-free. Each pair intersection is independent
(otherwise that edge and the corresponding J edge give K4), and is
anticomplete to the third J vertex (otherwise there is K4 with J).
A pair intersection therefore has size at most three: four independent
vertices there, with the third J vertex, would give I5. Inclusion-exclusion
bounds e(J,Q) by 14+3*3=23, so again e(A-t)<=50+23+3=76.
Consequently every t in T has

    d_A(t)=84-e(A-t)>=8.

This rederives the needed abstract-transversal specialization of the
[four-column stability argument](../four_column_stability.md#claim-four-column-stability-01).

Suppose now a four-set transversal T exists. If ell=0, every I4 is
contained in D by Claim 1. Thus T intersect D is itself a transversal.
Extend it, if necessary, to a four-set S in D; this is possible because
an anchor supplies at least four vertices of D. Then A-S is K4/I4-free
on 14 vertices, while

    e(A-S)=84-32+e(A[S])>=52>50,

a contradiction.

If ell=1, write L={u} and h=d_A(u) in {5,6,7}. The degree floor just
proved implies u is not in T. Every I4 avoiding u lies in D. Therefore
T intersect D meets every such I4. If |T intersect D|<=3, extend it to
a three-set S in D. The 14-vertex graph A-({u} union S) has no I4,
because every I4 avoiding u lies in D and meets T intersect D. But

    e(A-({u} union S))=84-h-24+e(A[{u} union S])
                     >=60-h>=53>50.

This is impossible, so T is a four-set of D, and the preceding
52-edge contradiction applies again.

No four-set transversal exists. Nor can a smaller transversal exist,
since enlarging it to a four-set would preserve transversality. Hence
tau>=5. In particular all actual columns have size at least five.

<a id="claim-q1-projected-capacity-exclusion"></a>
## 5. Projected-column capacity excludes the entire slice

Claim ID: `n43/d18/tau/q1_anchor_reduction.md#claim-q1-projected-capacity-exclusion`
Kind: local-deduction
Review state: ready
Scope: every rooted graph in the setting, without a connectedness assumption
Dependencies: Claims 1, 3 and 4; degree identities and bounds 5<=d_A<=13
Conclusion: no q=1,E_A=0 rooted graph exists, equivalently this x138 slice is empty
Search use: none pending independent review; proposed termination of this slice
Reviews: none

Proof. Put t=|D|. Every D vertex has B-degree nine.
If ell=0, every I4 lies in D, so C_y intersect D is a full transversal
for every y in B. Claim 4 gives 9t>=24*5=120, hence t>=14.
But

    168=sum_A d_A<=8t+13(18-t)=234-5t

gives t<=13, a contradiction.

It remains that L={u}, with h=d_A(u) in {5,6,7}.
Every I4 avoiding u is contained in D. Therefore
(C_y intersect D) union {u} is a full transversal, so each C_y
meets D in at least four vertices. Thus 9t>=24*4=96 and t>=11.
The upper degree sum bound

    168<=h+8t+13(17-t)=221+h-5t

gives t<=11 at h=5 or 6, and t<=12 at h=7. The complete parameter
list is therefore

    (h,t)=(5,11),(6,11),(7,11),(7,12).

For t=11 let H=A-(D union {u}). It has six vertices, all with degree
at least nine, and

    sum_H d_A=168-h-88=80-h,
    sum_(a in H)(13-d_A(a))=h-2.

Each individual degree in H is consequently at least 13-(h-2)=15-h.
If a vertex a in H occurs in an I4, that I4 must contain u: otherwise
its degree sum is at least 9+8+8+8=33. The other two vertices have
degree at least eight, so the I4 degree-sum bound forces

    d_A(a)<=16-h.

Define H0={a in H:d_A(a)<=16-h}. Each such vertex consumes deficit
13-d_A(a)>=h-3. Two would require 2(h-3)<=h-2, or h<=4,
contrary to h>=5. Thus |H0|<=1. Moreover every member of H0 has
B-degree at most 17-(15-h)=h+2.

Every I4 is contained in U=D union {u} union H0. Hence every
C_y intersect U is a full transversal, and Claim 4 requires

e(U,B)>=24*5=120. In contrast,

    e(U,B)=99+(17-h)+sum_(a in H0)(17-d_A(a))
          <=99+(17-h)+(h+2)=118.

This contradicts the required capacity. The bound also covers H0 empty.
It covers all three t=11 cases, without assuming that the low vertex
or the optional high-support vertex actually occurs in an I4.

Finally, if (h,t)=(7,12), the remaining five H vertices have degree sum
168-7-96=65. Each is at most 13, so all five have degree 13.
None can occur in an I4: an I4 containing such a vertex either omits u,
with degree sum at least 13+3*8=37, or contains u, with degree sum at
least 13+7+2*8=36. Both exceed 32. Thus all I4 lie in U=D union {u},
and its total B capacity is

    e(U,B)=12*9+(17-7)=118<120,

the last contradiction. No ell or (h,t) case remains.

## Consequences, comparison and review handoff

The x137 low-weight bound and projected-capacity strategy do extend to
this q1 slice, but not merely by ignoring the lost edge. The new work is
Claim 2's K_{2,2,2} equality obstruction and Claim 4's projection to
three degree-eight vertices plus the unique possible low vertex.
The final capacity is at most 118, rather than the x137 bound 117.

After independent acceptance this proves that an x138 degree-18 root
must lie in the other budget slice q=0,E_A=2. For the zero-neighborhood-
excess branch E_A=0, combining this with the separately accepted x136
closure removes q=0 and q=1, so its surviving roots have q>=2 and x>=140.
Neither consequence asserts the existence of a low-x root in an arbitrary
candidate graph. No conclusion about q>=2, all degree-18 roots, or R(5,5)
is proved here.

Review targets: the equality analysis in Claim 2, the two deletion tables,
the abstract (rather than actual-column) quantifier in Claim 4, and the
coverage of all four (h,t) cases in Claim 5. All five claims are ready;
none is accepted in this file. The author has not run builds, tests,
linters, formatters, or graph computations. The proofs and displayed
integer arithmetic are the evidence; exact-revision independent review
remains a prerequisite for termination use.

### Source revision hashes

These are SHA-256 values of the exact files read for this derivation,
including their integration banners. They identify premise versions, not
new certificates for the external census theorems. The pending research
JSON is listed for comparison only, not as a proof dependency.

|Source|SHA-256|
|---|---|
|`docs/workflow.md`|`51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2`|
|`n43/d18/sos_finite_moments.md`|`cc4a8d4b3850122d37ad871d4a41f3f8275dbe0e71a5343258bdb209919b3404`|
|`n43/d18/x137/effective_anchor.md`|`2eed07f6cfb1b61b0a0653d99078d5dbcfc408f369798576c4b4fcfd3dab2b2e`|
|`n43/d18/x137/frontier_closure.md`|`7090245d842a24dd4bb3aab71f3c973e3ea79dc5dd1ac8e7a37cae74cd93abfa`|
|`n43/d18/four_column_stability.md`|`71fa0ce84eeffff7b7a22790b5d3ce394a9767881269658060f076c13baa902a`|
|`n43/d18/frontier_band.md`|`c13e57b0f788d7286325f0d12ae73ef4851eb2f55b9bf8f25ce113a79918323a`|
|`n43/d18/c/w0/research.json`|`88c31770ed2011a82248902ad14f7572bfaaf4b08202fa58c97ed3b89c5661a1`|
|`n43/d18/x136/five_column_compatibility.md`|`ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88`|
|`README.md`|`a31dbbee3d997679089ed94c8ac8fd09ccebaf01aebd4dc42f6ccf1ee4660fac`|
