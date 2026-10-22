# One-core missed-signature geometry in the entire k1 branch

<!-- k1-whole-branch-integration:start -->
Integration status (2026-10-19): all five claims are independently **accepted**
by [SignatureGeometryAudit](review_signature_geometry_20261019_geometry_audit.md)
at SHA-256 `f5d3e739185bfcfb52c5520406c8c8461814308e5338c6e32564e50c18a840bb`.
The author-stage body below is unchanged; ready labels are historical.
Permitted use: propagate p,q>=65 and the stated exact stability constraints.
The separate [seven-cell theorem](triangle_capacity.md) now also gives h<=15;
no remaining attachment layer or the whole K1 branch is excluded here.
<!-- k1-whole-branch-integration:end -->

This note gives a necessary attachment bound for **every** rooted k1
candidate, with no restriction on the C-D cross count. It does not exclude
the whole branch, claim novelty, assume uniqueness of a 17-vertex core,
or use a catalogue. All claims below await independent review; no search
implementation is changed.

Fix either core K=C or K=D. Write a_K=e(K,T). For t in T let
W_t=K\N_K(t), and let B be the complement of G[K], on the same 17
vertices. Put w_t=|W_t| and f_t=e(B[W_t]). Thus

    a_K=119-sum_t w_t.

The accepted premises give the following facts.

* Both G[K] and B are SRG(17,8,3,4), and B has 68 edges.
* Each B[W_t] is triangle-free and I4-free, with w_t<=8.
* The sets E(B[W_t]) are pairwise disjoint, and every intersection
  W_t intersect W_s is a clique in G[K], so has order at most three.
* If w_t=8 then f_t is 10, 11, or 12. In the 10-edge case, each vertex
  of K-W_t has four or five B-neighbors in W_t (in fact the multiplicities
  are one and eight, respectively).
* a_K>=64.

The first, second, third, and last facts are the accepted
[`cross_core.json`](cross_core.json) claims `critical-core-srg` and
`strict-seven-signature-budget`, equivalently
[`seven_cell.json`](seven_cell.json) claim
`saturated-core-nonedge-packing`. The eight-vertex classification and
its outside-degree conclusion are the accepted
[`claim-common-eight-classification`](../large_row_extensions.md#claim-common-eight-classification)
and
[`claim-seventeen-codegree-moments`](../large_row_extensions.md#claim-seventeen-codegree-moments),
applied to B rather than G[K]. Complementation is legitimate: B is itself
(4,4)-free. These premises concern arbitrary such cores, not a selected
representative.

<a id="claim-seven-signature-energy"></a>
## 1. A seven-point missed signature consumes at least seven nonedges

Claim ID: `research/n43/d18/k1/signature_geometry.md#claim-seven-signature-energy`  
Kind: local-deduction  
Review state: ready  
Scope: every SRG(17,8,3,4) graph B and every subset W of seven vertices;
in particular a missed signature of either k1 core  
Dependencies: `cross_core.json` claim `critical-core-srg`; elementary
spectral decomposition of a real symmetric matrix  
Conclusion: e(B[W])>=7; more generally inequality (1) below holds for
every subset of size w  
Search use: none (theoretical necessary bound; not installed in search)  
Reviews: none

**Proof.** Let A be the adjacency matrix of B and J the all-one matrix.
The SRG parameters give

    A^2=4I-A+4J,       A 1=8 1.

Consequently every eigenvalue on the orthogonal complement of 1 is a
root of z^2+z-4=0, and is at least

    s=-(1+sqrt(17))/2.

For the indicator vector x of a w-element subset, write
x=(w/17)1+y with y perpendicular to 1. Then
||y||^2=w(17-w)/17. Hence

    2e(B[W])=x^T A x
              >= [8w^2+s w(17-w)]/17.                 (1)

At w=7 the right side equals (357-35 sqrt(17))/17 and is strictly
larger than 12: indeed 153>35 sqrt(17), as follows by squaring the two
positive sides, 23409>20825. The integer e(B[W]) is therefore at least
seven. No induced-subgraph classification or subset enumeration is
used. In particular, this lower bound does not need the additional
triangle-free condition of a missed signature. ∎

<a id="claim-minimal-signature-incidence"></a>
## 2. The hypothetical 64-edge attachment has a forced incidence geometry

Claim ID: `research/n43/d18/k1/signature_geometry.md#claim-minimal-signature-incidence`  
Kind: local-deduction  
Review state: ready  
Scope: either core K of a k1 candidate, conditional on a_K=64  
Dependencies: accepted missed-signature bounds and pairwise clique
intersections stated above  
Conclusion: after reindexing the seven vertices of T, w_1=...=w_6=8,
w_7=7; all 21 pairwise signature intersections have order three;
exactly four core points occur in four signatures and the other thirteen
occur in three; W_7 contains all four of the former points and each
W_i, i<=6, contains exactly two of them  
Search use: none (intermediate theoretical implication)  
Reviews: none

**Proof.** Every attachment degree is at least nine. The accepted
strict bound excludes seven attachment degrees equal to nine.
If their sum is 64, exactly six are nine and the other is ten. These
are the stated signature sizes, whose sum is 55.

For x in K define m_x=|{i:x in W_i}|. Since every pairwise intersection
has size at most three,

    sum_x binom(m_x,2)
       =sum_(i<j) |W_i intersect W_j| <=21*3=63.       (2)

For every integer m,

    binom(m,2)>=3m-6,

because the difference is (m-3)(m-4)/2. Summing and using
sum_x m_x=55 gives a lower bound 3*55-6*17=63. Thus equality holds
throughout (2). Every pair intersection has size three and every m_x
is three or four. Exactly four points have multiplicity four. Denote
that four-element set by F; then m=3*1+1_F as vectors on K.

For any i, double counting the intersections with the other six
signatures gives

    18=sum_(j!=i) |W_i intersect W_j|
      =sum_(x in W_i) (m_x-1)
      =2|W_i|+|W_i intersect F|.

For i<=6 this forces |W_i intersect F|=2; for i=7 it forces
|W_7 intersect F|=4. Therefore F is contained in W_7. ∎

<a id="claim-uniform-attachment-65"></a>
## 3. Both one-core attachment totals are at least 65

Claim ID: `research/n43/d18/k1/signature_geometry.md#claim-uniform-attachment-65`  
Kind: local-deduction  
Review state: ready  
Scope: every rooted order-43 k1 candidate satisfying the accepted
partition and K5/I5-free premises; all C-D cross counts  
Dependencies: the preceding two claims; accepted saturated nonedge
packing; accepted eight-vertex classification and S10 outside moments
linked above  
Conclusion: e(C,T)>=65 and e(D,T)>=65; if six vertices of T each have
exactly nine neighbors in one core, the remaining vertex has at least
eleven neighbors in that core  
Search use: none (candidate propagation theorem awaiting independent
review; no branch termination claim)  
Reviews: none

**Proof.** Fix K and suppose a_K=64. Use the notation of the preceding
claim. The seven induced B-edge sets are pairwise disjoint, so

    sum_(i=1)^7 f_i<=68.

Each of the six eight-point sets consumes at least ten B-edges, and
the seven-point set consumes at least seven by Claim 1. Thus at most
one of W_1,...,W_6 has more than ten B-edges; all the others have
exactly ten. Call a set among these six *exceptional* if it has more
than ten B-edges. There is either none or one. If there is one, it
contains two points of F by Claim 2. Choose x in F in that exceptional
set; if there is none, choose any x in F.

The point x belongs to W_7 and to exactly three of W_1,...,W_6.
Every one of the other three eight-point sets is nonexceptional.
For each of these three sets the accepted S10 outside-degree identity
gives

    d_B(x,W_i)<=5.                                  (3)

For the three eight-point sets containing x, their B-edges incident
with x are pairwise disjoint and disjoint from the edges incident
with x in B[W_7]. Since d_B(x)=8,

    sum_(i<=6, x in W_i) d_B(x,W_i)
        <=8-d_B(x,W_7).                              (4)

Put R=W_7-F, so |R|=3. The exact multiplicity identity in Claim 2 gives

    sum_(i=1)^6 1_(W_i)
       =3*1+1_F-1_(W_7)=3*1-1_R.

Taking the B-neighbor sum at x therefore gives

    sum_(i=1)^6 d_B(x,W_i)=24-d_B(x,R).               (5)

But (3) and (4) bound the same quantity above by

    3*5+8-d_B(x,W_7)=23-d_B(x,W_7).

Since R is a subset of W_7, this is strictly less than
24-d_B(x,R), contradicting (5). Thus a_K cannot equal 64. The accepted
bound a_K>=64 and integrality give a_K>=65. Apply the argument
independently to C and D.

If six individual attachment degrees are nine, their total is 54;
the seventh is at least 65-54=11. ∎

<a id="claim-signature-slack-stability"></a>
## 4. Exact row/intersection slack near the attachment bound

Claim ID: `research/n43/d18/k1/signature_geometry.md#claim-signature-slack-stability`  
Kind: local-deduction  
Review state: ready  
Scope: either core K of any k1 candidate, with all seven missed
signatures retained; all attachment totals a_K  
Dependencies: accepted pairwise clique intersections and 2<=d_T(x)<=7
for core vertices; Claim 3 for a_K>=65  
Conclusion: identities (6)--(8) below, in particular total row/intersection
defect three at a_K=65 and six at a_K=66  
Search use: none (necessary stability conditions, not a sufficiency or
termination claim)  
Reviews: none

**Proof.** Put m_x=|{i:x in W_i}|=7-d_T(x), so 0<=m_x<=5.
Define nonnegative integer defects

    rho_x=(m_x-3)(m_x-4)/2,
    Delta_ij=3-|W_i intersect W_j|       (i<j).

The first expression is nonnegative at every integer m_x; the second
is nonnegative by saturated packing. Since

    sum_x m_x=119-a_K,
    binom(m_x,2)=3m_x-6+rho_x,

double counting intersections gives the exact identity

    sum_x rho_x + sum_(i<j) Delta_ij=3(a_K-64).       (6)

In particular, at a_K=65 at most three core points have multiplicity
outside {3,4}, and at most three signature pairs have intersection
smaller than three. Both numbers share the same budget of three,
not independent budgets. More precisely, m=0,1,2,3,4,5 has respective
row cost rho=6,3,1,0,0,1. Thus multiplicity zero is impossible at
a_K=65, and any multiplicity-one row consumes the whole budget.
At a_K=66 the corresponding shared budget is six.

There is also an exact local refinement. Write

    Delta_i=sum_(j!=i) Delta_min(i,j),max(i,j).

Then counting the intersections incident to W_i gives

    sum_(x in W_i) (m_x-3)=18-2w_i-Delta_i,           (7)
    sum_i Delta_i=2 sum_(i<j) Delta_ij.               (8)

Indeed the left side of (7) plus 2w_i equals
sum_(j!=i)|W_i intersect W_j|=18-Delta_i. In particular the right side
is 2-Delta_i for an eight-point signature, 4-Delta_i for a seven-point
signature, and 6-Delta_i for a six-point signature. These are constraints
on the same actual core rows and signature intersections; they cannot
be realized independently merely because their totals agree. ∎

<a id="claim-near-minimal-edge-stability"></a>
## 5. Near-minimal attachments cover nearly all core nonedges

Claim ID: `research/n43/d18/k1/signature_geometry.md#claim-near-minimal-edge-stability`  
Kind: local-deduction  
Review state: ready  
Scope: either core K of a k1 candidate with a_K equal to 65 or 66;
the final degree identity also applies without those restrictions  
Dependencies: Claims 1 and 4; accepted eight-set classification,
saturated packing, and S10 outside moments  
Conclusion: the signature-size/edge-budget table below and exact
ordinary-signature stability identity (9)  
Search use: none (theoretical necessary conditions; not a graph
existence claim)  
Reviews: none

**Proof of the edge budgets.** Since each w_i<=8,

    sum_i (8-w_i)=a_K-63.

At a_K=65 the nonnegative integer deficits therefore partition two;
at a_K=66 they partition three. This gives exactly the five size
patterns in the table below, with arbitrary permutations of the seven
T labels. Here `8^6,6` means six eight-point signatures and one
six-point signature; it does not identify their actual vertex subsets.

For five-point and six-point subsets, (1) gives respectively

    2f >=(170-30 sqrt(17))/17 >2,
    2f >=(255-33 sqrt(17))/17 >6,

so their integral edge counts are at least two and four. The strict
inequalities follow respectively from sqrt(17)<68/15 and
sqrt(17)<51/11, by squaring positive quantities. Together with f>=7
for seven-point subsets and f>=10 for the allowed eight-point
signatures, this gives:

| a_K | Missed-signature sizes | Minimum sum f_i | Maximum unused B-edges |
| --- | --- | --- | --- |
| 65 | 8^6,6 | 64 | 4 |
| 65 | 8^5,7,7 | 64 | 4 |
| 66 | 8^6,5 | 62 | 6 |
| 66 | 8^5,7,6 | 61 | 7 |
| 66 | 8^4,7,7,7 | 61 | 7 |

The edge sets are pairwise disjoint, so the number of unused edges
is exactly U=68-sum_i f_i. Moreover the last column bounds the
*sum* of U and all edge-count excesses over the applicable minima,
not each excess separately. In particular each eight-point set of
type S11 consumes one excess unit and each of type S12 consumes two.
At a_K=65, at least 64 of the 68 complement-core edges are therefore
covered, regardless of which of the two size patterns occurs.

**Proof of the local stability identity.** Let I be the indices of
ordinary signatures, meaning w_i=8 and f_i=10, and put

    b=|I|,       n_x=|{i in I:x in W_i}|,
    u_x=8-sum_(i:x in W_i) d_B(x,W_i).

The incident edge sets in this last sum are pairwise disjoint, so
u_x is the degree at x of the unused-edge graph; in particular
u_x>=0 and sum_x u_x=2U. For each ordinary i and x outside W_i,
let epsilon_i(x)=5-d_B(x,W_i). The accepted S10 moments say
epsilon_i(x) is zero or one, and equals one at exactly one outside
vertex. Define epsilon_x as their sum over ordinary signatures
not containing x. Thus sum_x epsilon_x=b.

With A the adjacency matrix of B and m the full row-multiplicity
vector, splitting the sum (Am)_x=sum_i d_B(x,W_i) according to
containment and ordinary status yields exactly

    (Am)_x+5n_x+u_x+epsilon_x
       =8+5b+sum_(i not in I, x not in W_i) d_B(x,W_i).     (9)

The terms from all signatures containing x sum to 8-u_x; the
ordinary signatures not containing x contribute
5(b-n_x)-epsilon_x; the remaining outside terms are precisely the
sum on the right. This proves (9).

Thus in a 65-edge attachment the unused-edge degrees have total at
most eight, and most pairwise intersections and core row sizes are
simultaneously pinned by the three-unit budget (6). Equations (7)
and (9) constrain where the exceptional rows, smaller signatures,
and S11/S12 signatures can lie in the SRG. The equations are not
asserted sufficient, and they do not exclude either 65-edge pattern
or any 66-edge pattern. ∎

## Consequences and exact limits

With the accepted notation p=e(C,T), q=e(D,T), h=e(T), and
L=p+h, R=q+h, the new conclusion permits replacing p,q>=64 by
p,q>=65. For example the side-census conditions become

    max(76,65+h)<=L,R<=92,       L+R<=168.

Equivalently, for the accepted offsets i=p+h-76 and j=q+h-76,

    h<=11+i,       h<=11+j.

These displayed consequences are direct substitutions, not a separate
claim of exact graph feasibility or a revised exhaustive scalar
partition. In particular, h<=18 is not improved merely by these
substitutions.

The proof excludes the *entire* lowest attachment layer on either
side, independently of C-D edges. It does not classify all one-core
attachments, show a 65-edge attachment exists, exclude the remaining
attachment layers, or settle simultaneous two-core compatibility.
The k1 branch remains open. The unresolved object still includes all
admissible signatures with p,q>=65 and their C-D completion matrices.

No graph enumeration, catalogue scan, solver, download, package
installation, build, test, linter, formatter, or Lean change was used.
The arguments are theoretical; only the displayed scalar arithmetic
is involved. Independent proof review remains required.
