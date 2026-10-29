# Seidel switching and the residual degree-20 branch

Author: /root, working alone. Kind: exact local deductions, a conditional
boundary-or-rigidity theorem, and an open coverage question. Review state:
**ready**, with finite author self-checks;
independent review pending. Search use: **none pending review**. No branch
closure, order-43 construction, or novelty claim is made.

Scope: G is a finite simple graph with neither K5 nor I5. The main question
has |V(G)|=43 and 19<=d_G(v)<=23 at every vertex. This is the
[complement-closed residual](d20/residual_coverage.md#claim-d20-residual-routing),
not merely absence of degree 18 in one orientation. We use the published
values R(4,5)=25 and R(4,4)=18, and R(3,4)=9 for the critical-core example.
See the [baseline](../../docs/mathematical_baseline.md).

**Outcome.** Section 8 proves a **conditional boundary-or-rigidity theorem**:
an explicit spectral inequality ensures that every nontrivial
Ramsey-preserving switch reaches degree 18 or 24. In the 20-regular case
the condition is that C^2 has all eigenvalues on 1-perp greater than
173/11, where C is the Seidel matrix. A separate homogeneous-four closure
criterion certifies rigidity directly. Neither condition is proved for
every residual graph, so an unconditional complete switching reduction
to d18 is not established.
Sequences of arbitrary Ramsey-preserving Seidel switches reach exactly the
Ramsey graphs in one switching class. Every nontrivial valid cut at order
43 has both sides of size at least nine. An exact constraint system records
the further five-vertex obstructions. It does not imply that any nontrivial
valid cut exists, or that one reaches degree 18 or 24. Switching rigidity
really occurs at smaller Ramsey thresholds, but no order-43 counterexample
is supplied. The residual d20 branch must remain in the coverage tree.

| Sections | Conclusion | Status |
| --- | --- | --- |
| 1–2 | Composition, complementation, degree and parity identities | Ready |
| 3–4 | Exact forbidden patterns and the 9..34 cut bound | Ready |
| 5 | Rigidity at order 17 for the (4,4) problem | Ready |
| 6 | Exact formulation of the missing order-43 coverage theorem | Open; encoding ready |
| 7 | Small finite verification of identities and encodings | Author self-check only |
| 8 | Exact cut-energy identity; conditional boundary-or-rigidity theorem; quartet-closure rigidity certificate | Ready; unconditional dichotomy remains open |

<a id="claim-switch-composition"></a>
## 1. Sequences collapse to a single cut

Write G^S for the graph obtained by toggling every pair with exactly one
endpoint in S. For distinct u,v, with edge bit a_uv and cut bit x_v,

    a^S_uv = a_uv XOR x_u XOR x_v.

Consequently

    (G^S)^T = G^(S symmetric_difference T),
    G^S = G^(V-S),
    complement(G^S) = (complement G)^S.

These identities follow by cancelling repeated XOR terms on each pair.
In particular, a sequence S_1,...,S_k has the same endpoint as the single
cut S_1 symmetric_difference ... symmetric_difference S_k. If its endpoint
H is Ramsey, the direct switch from G to H is itself Ramsey-preserving:
there are only these two graphs to check. No validity of intermediate
partial cuts is needed for an atomic Seidel switch.

Thus allowing longer sequences cannot reach a Ramsey endpoint unavailable
to one unrestricted switch. Conversely, requiring *singleton* switches
would impose a substantially stronger restriction; Section 4 rules out
even the first such move here.

Allowing complementation at intermediate stages gives only endpoints G^S
or complement(G^S). On 43 vertices complementation sends degree d to 42-d,
so degree 24 becomes degree 18. Because the target property "has degree
18 or 24" is complement invariant, these intermediate complementations
do not enlarge the set of successful cuts.

The triple parity

    a_uv XOR a_uw XOR a_vw

is invariant under switching: each of x_u,x_v,x_w occurs twice. This is
the labelled two-graph invariant. The reduction therefore concerns the
particular switching class of each input, not the entire Ramsey family.
Complementation reverses every triple parity.

<a id="claim-switch-degrees"></a>
## 2. Degrees and parity

Let m=|S|. For v outside S, put c_v=|N_G(v) intersect S|; for v in S,
put c_v=|N_G(v) intersect (V-S)|. Then at order 43,

    d_(G^S)(v) = d_G(v) + m - 2c_v          if v is outside S,
    d_(G^S)(v) = d_G(v) + 43-m - 2c_v      if v is in S.

Proof: the c_v old cross edges disappear and the remaining cross pairs
become edges. These are exact equations, but say nothing by themselves
about forbidden five-sets.

For example, a degree-20 vertex outside S reaches degree 18 precisely
when c_v=(m+2)/2, so m must be even. If it is inside S, the condition is
c_v=(45-m)/2, so m must be odd. These arithmetic conditions are not
preservation criteria.

For any odd order n the parity form is

    d_(G^S)(v) = d_G(v) + |S| + 1_S(v)  (mod 2).

If two graphs in a switching class have the same degree parity at every
labelled vertex, their cut must be trivial: an even |S| forces S empty,
and an odd |S| forces S=V. Equivalently, the parity vectors uniquely
determine the switch up to replacing its cut by its complement.

In particular, an odd-order regular graph has no nontrivial switch to a
regular graph of the same degree. More generally the same conclusion
holds for any two graphs with the same prescribed parity vector.

<a id="claim-switch-five-patterns"></a>
## 3. Exact Ramsey-preservation criterion

**Theorem.** Suppose G is K5/I5-free. A cut S is invalid exactly when it
separates the two parts of one of the following induced configurations:

| Induced graph in G | Cut parts on its five vertices | Pattern after switching |
| --- | --- | --- |
| K1 disjoint_union K4 | the two cliques | K5 |
| K2 disjoint_union K3 | the two cliques | K5 |
| K_(1,4) | the two independent parts | I5 |
| K_(2,3) | the two independent parts | I5 |

The complements pair the first and third rows, and the second and fourth
rows. "Separates" means all vertices of one indicated part have one cut
bit and all vertices of the other part have the other bit. Vertices
outside this five-set are unrestricted.

**Proof.** If a five-set W is a clique after switching, the portions
W intersect S and W-S were each cliques before switching and were
anticomplete to each other. Both portions are nonempty, because G itself
has no K5. Their unordered sizes are 1+4 or 2+3. This gives exactly the
first two rows. Conversely, switching an aligned cut in either row makes
a K5. Apply the same argument to the complement for I5. There are no
other ways to create a forbidden set. QED.

This includes mixed 2+3 obstructions. Checking only the possible forbidden
sets containing a chosen target vertex is insufficient: a switch also
changes cross pairs away from that vertex. Checking only 1+4 obstructions
is likewise insufficient; K2 disjoint_union K3 is an immediate example.

### Exact Boolean form

For each row occurrence W=P disjoint_union Q, choose its part indicator
b_v, zero on P and one on Q. Add

    NAE(x_v XOR b_v : v in W),

where NAE means the five bits are not all equal. This forbids precisely
x|W=b and x|W=1-b. It is two ordinary clauses of length five:

    OR_(v in W) (x_v XOR b_v),
    OR_(v in W) NOT(x_v XOR b_v).

Let F_G be the conjunction over all such induced configurations. Then

    F_G(x) is true  iff  G^S is K5/I5-free.

Both constant assignments satisfy F_G for a Ramsey input. Nonconstant
satisfiability is a separate question. At most one of the two homogeneous
targets can be reached on a given five-set: K5 has odd triple parity,
whereas I5 has even triple parity. When one is reachable, its cut pattern
is unique up to complement. Fixing one cut bit to zero leaves 42 free
bits at order 43. There are at most 2*C(43,5)=1,925,196 clauses, generally
fewer because most five-sets are not switchable to a homogeneous graph.

<a id="claim-switch-cut-bound"></a>
## 4. Every valid nontrivial cut has two large sides

**Theorem.** If both G and G^S are K5/I5-free on 43 vertices, and S is
nonempty and proper, then

    9 <= |S| <= 34.

**Proof.** Choose v in S and put T=V-S. The induced graph on
U=N_G(v) intersect T contains no K4, since G is K5-free. It also contains
no I4: its internal edges are unchanged by switching, and v is
nonadjacent to every vertex of U in G^S. Such an I4 would therefore
extend to an I5 with v after switching. Thus G[U] is (4,4)-free.

For W=T-U, G[W] has no I4 using G and v, and no K4 using G^S and v.
Thus it too is (4,4)-free. R(4,4)=18 gives |U|,|W|<=17 and |T|<=34.
Interchanging the two cut sides gives |S|<=34. Their sizes sum to 43,
which supplies both lower bounds. QED.

This argument uses only the two Ramsey hypotheses, not the initial
19..23 degree restriction. It proves that every cut of sizes 1 through
8, or 35 through 42, is invalid throughout the whole order-43 Ramsey
family. In particular, every singleton switch fails. Indeed each vertex's
neighborhood contains an I4 and its nonneighborhood contains a K4 by
R(4,4)=18 and the universal degree range 18..24; its singleton switch
creates both forbidden patterns.

More generally, for the diagonal (r,r) problem the identical proof gives

    n - 2*(R(r-1,r-1)-1) <= |S| <= 2*(R(r-1,r-1)-1).

### Stronger local constraints and the size-nine boundary

The proof gives a condition at *every* vertex, not just one witness to
the cardinality bound: its neighbors and nonneighbors on the other cut
side must both induce (4,4)-free graphs. Equivalently, each exterior
vertex's adjacency bits must give a two-coloring of that side in which
every K4 and every I4 meets both colors. If the hypergraph consisting of
these homogeneous four-sets is not two-colorable, that side cannot occur
in a valid cut. These conditions are necessary; the 2+3 tests still apply.

Choose the smaller cut side, so 9<=m=|S|<=21. For every v in S,

    26-m <= c_v <= 17,
    |d_(G^S)(v) - d_G(v)| <= m-9.

The first interval follows because the opposite side has 43-m vertices
and both its cells have size at most 17; substitution in the degree
formula proves the second. The attainable changes have the parity of
43-m, in steps of two.

At m=9 both opposite cells have order 17. Every (4,4)-free graph of order
17 is 8-regular: its neighborhood and nonneighborhood have at most eight
vertices by R(3,4)=R(4,3)=9, and their sizes sum to 16. Hence every vertex
of the small cut side splits the other 34 vertices into two such critical
cores, and has c_v=17. Its degree is unchanged by the switch. A successful
size-nine cut from the residual must therefore reach degree 18 or 24 on
the *other* side.

At m=10, degrees on the small side change by exactly one. At m=11 they
change by -2, 0, or 2. A degree-20 target on the small side cannot reach
18 before m=11, or 24 before m=13. These last statements do not restrict
targets lying on the larger side.

As another consequence, distinct Ramsey representatives in one labelled
switching class have degree parity vectors at Hamming distance at least
ten: the difference is the indicator of S when |S| is even, or of V-S
when |S| is odd. This is an even-sized nontrivial cut side, necessarily
between 10 and 34. The representatives form a separated finite family;
there is no implication that the family has more than one member.

<a id="claim-switch-rigidity-example"></a>
## 5. Switching rigidity occurs at Ramsey thresholds

**Theorem.** Every (4,4)-Ramsey graph on 17 vertices admits only the
trivial (4,4)-Ramsey-preserving Seidel switches.

**Proof.** As just shown using R(3,4)=9, both the original and any Ramsey
endpoint would be 8-regular. If 0<|S|<17, a vertex outside S would need
exactly |S|/2 neighbors across the cut to retain degree eight, requiring
|S| even. A vertex inside S would need (17-|S|)/2 neighbors across the
cut, requiring |S| odd. Contradiction. QED.

This proof applies to every such graph and requires no uniqueness
classification. Paley-17 supplies an explicit nonempty example. Its
vertices are Z/17Z, with edges at the nonzero square differences
{1,2,4,8,9,13,15,16}; the accompanying self-check directly verifies every
four-set and all cuts up to complement. The same parity proof makes C5
switching-rigid within the (3,3)-Ramsey family.

These examples disprove a general principle that a Ramsey graph always
has a nontrivial Ramsey-preserving switch. They **do not disprove** the
specific order-43 assertion: degree regularity is not forced there, and
no order-43 Ramsey graph has been constructed in this investigation.

<a id="open-switch-coverage"></a>
## 6. The exact missing reduction and obstruction certificates

Write R_43 for the K5/I5-free graphs on 43 labelled vertices, and define

    residual(G) := every degree of G lies in {19,20,21,22,23},
    boundary(H) := some degree of H lies in {18,24}.

The requested pointwise completeness theorem is precisely

    for every G in R_43 with residual(G),
        there exists a cut S such that F_G(S) and boundary(G^S).

Equivalently, **every switching class that meets the residual must meet
the degree boundary.** A safe switch which merely stays within 19..23
does not prove this theorem. Neither does the existence of an extremum of
edge count, degree variance, or any other finite potential: a proof must
show that a maximizing/minimizing representative reaches the boundary.

By R(4,5)=25, any Ramsey endpoint automatically has all degrees in18..24.
So no separate assumption of this degree range is needed in F_G. The
open condition is the existence of at least one boundary degree.

### A complete test for one supplied graph

Given an actual residual graph G, form F_G, fix x_0=0, and conjoin

    OR_(v in V) [d_(G^S)(v)=18 OR d_(G^S)(v)=24],

using the exact equations in Section 2. This is an exact Boolean plus
cardinality formulation, not a relaxation. One can instead run separate
queries for each v and target degree. In a query for v, fixing x_v=0 is
without loss of generality, since complementary cuts have the same
effect. Its target equation becomes the especially simple signed sum

    sum_(u != v) (1-2*a_vu)*x_u = target - d_G(v).

All 86 root/target queries, or their single disjunction, must be covered
to certify that this graph has no boundary representative. The cut-size
and opposite-cell constraints are redundant necessary conditions that
can accelerate the exact test after appropriate review.

* A satisfying assignment gives a cut. Independently verify the switched
  graph on every five-set and check its degree sequence. Complement it
  if the supplied boundary degree is 24, then choose a degree-18 pivot
  according to the d18 branch's root-selection convention.
* A certified refutation of the full boundary formula proves that this
  particular switching class misses d18 in both complementary
  orientations. It does not refute existence of the input graph.
* A stronger structural certificate is a proof that F_G has only the
  two constant solutions. This proves switching rigidity; the residual
  then has no boundary representative. Such a proof can be expressed as
  an exhaustion by the forbidden five-set patterns or as a checked
  refutation of F_G AND (x_0=0) AND (OR_(v != 0) x_v).

A finite collection of aligned forbidden patterns covering every target
cut is therefore an explicit obstruction certificate. The patterns must
come from the *same actual graph*. Degree lists, independently compatible
local cells, or an unverified abstract constraint system are insufficient
to exhibit an order-43 obstruction.

### Why the order-43 question remains open here

The universal statement has a for-every-G / there-exists-S quantifier
structure. Solving a cut formula for one graph or for known smaller
examples is not uniform coverage. We have neither a theorem forcing a
boundary solution for every residual G, nor a verified order-43 graph
whose boundary formula is unsatisfiable.

In particular, failure to prove the reduction is not a counterexample.
If R(5,5)=43, there are no order-43 inputs at all and the pointwise
switching assertion is vacuously true. Refuting it would require an
actual order-43 Ramsey graph and proof that its switching class avoids
the boundary. No such construction is claimed.

For deciding nonexistence, a weaker global implication "if any residual
graph exists, some boundary graph exists" would suffice when combined
with a full d18 exclusion. It would still require proof; the pointwise
switching formulation is one possible way to establish that implication.
The present deductions establish neither it nor a full d18 exclusion.

Consequently retain d20. Section 8 gives a sufficient condition under
which testing for *any* nontrivial preserving cut does produce the stronger
boundary-or-rigidity dichotomy. It also gives an explicit sufficient
rigidity certificate. Graphs to which these tests do not apply remain
unresolved; they must not be labelled rigid merely because a boundary cut
has not been found.

## 7. Finite validation and review limits

Run from the repository root:

```sh
python research/n43/seidel_switching.py --self-check
```

The standard-library [checker](seidel_switching.py) implements switching,
direct homogeneous-set checks, exact forbidden-pattern extraction, and
the two-clause encoding. It verifies:

* All 1,024 labelled graphs on five vertices and all 16 cuts up to
  complement, at thresholds 3, 4, and 5: 49,152 comparisons of the exact
  constraint and CNF predicates against direct Ramsey checking. Initial
  non-Ramsey graphs are included to check the constant-pattern case.
* All 262,144 switch-composition identities on those graphs and cuts,
  together with degree, parity, involution, and complement identities.
* All 2,380 four-sets of Paley-17, and all 65,536 cuts up to complement.
  Its 476 NAE constraints admit only the zero cut with vertex 0 outside;
  independently, only that cut retains degree eight at every vertex.

All checks passed. These are author's implementation self-checks and a
small rigidity illustration. They are not independent review, an
order-43 search, or evidence of an order-43 branch closure. No solver,
external download, or graph catalogue is used.

<a id="claim-switch-energy-identity"></a>
## 8. A conditional boundary-or-rigidity theorem

The word **rigid** here has its strict meaning: G has no nontrivial
Ramsey-preserving Seidel switch. A switching class containing several
Ramsey representatives, all with degrees 19..23, would be a different
kind of obstruction. Its exclusion is not assumed. This distinction is
essential to stating the following conditional theorem correctly.

### 8.1 An exact degree-defect identity

Let G be a residual graph in R_43, A its adjacency matrix, and set

    C = J-I-2A,
    M = C^2 - diag(C^2 * 1).

Here diag(y) is the diagonal matrix with diagonal y. The symmetric
integer matrix M has M*1=0; it is not assumed positive semidefinite.
Let

    c = number of degree-21 vertices of G,
    e = number of even-degree vertices of G,
    p_v = (-1)^(d_G(v)).

Every cut at odd order has a unique even-sized side U. Write x=1_U and
k=|U|. If H=G^U is Ramsey, let b(H) count its degree-18 and degree-24
vertices, and let c(H) count its degree-21 vertices.

**Theorem (exact cut-energy identity).**

    x^T M x = 3*sum_(v in U) p_v + 4*(c-c(H)) + 8*b(H).       (8.1)

In particular, a Ramsey-preserving cut with

    x^T M x > 3*sum_(v in U) p_v + 4*c                       (8.2)

reaches a boundary vertex. More quantitatively,

    b(H) >= max(0, ceil((x^T M x - 3*sum_U p_v - 4*c)/8)).

**Proof.** Put s=1-2x and D=diag(s). The Seidel matrix of H is DCD,
and its vector of row sums is DCs. Thus

    sum_v (42-2*d_H(v))^2 - sum_v (42-2*d_G(v))^2
      = ||Cs||^2 - ||C1||^2
      = 4*(x^T C^2 x - (C^2*1)^T x)
      = 4*x^T M x.

The last equality uses x_v^2=x_v. By R(4,5)=25, all degrees in H lie
in 18..24. For any graph K in this degree range, with o(K) odd-degree
vertices, its squared row-sum norm is

    sum_v (42-2*d_K(v))^2 = 4*43 + 12*o(K) - 16*c(K) + 32*b(K).

This follows by checking degrees 18 through 24: their contributions
are 36,16,4,0,4,16,36. Since U is even, degree parity changes exactly
on U. Therefore o(H)-o(G)=sum_U p_v. Subtract the two moment formulas,
use b(G)=0, and divide by four. This proves (8.1). Rearrangement gives

    8*b(H) = x^T M x - 3*sum_U p_v - 4*c + 4*c(H),

which proves the remaining assertions. QED.

Equation (8.2) is a sufficient boundary test for a preserving cut. It is
not a preservation test: forbidden five-sets still have to be excluded.
It is also not necessary for reaching the boundary, because c(H) can
make its right-hand rearrangement positive even when (8.2) fails.

<a id="claim-switch-spectral-dichotomy"></a>
### 8.2 The spectral dichotomy, including mixed degrees

Define the least Rayleigh quotient on the orthogonal complement of the
constant vector by

    lambda(G) = min_(z != 0, z^T*1=0) (z^T M z)/(z^T z).

This definition allows a negative value. Complementation negates C and
leaves M, lambda(G), c, and e unchanged, so all conditions below are
complement invariant.

**Theorem (conditional boundary or rigidity).** Suppose G is a residual
graph in R_43 and

    lambda(G) > 43/3 + (86/153)*c.                           (8.3)

Then exactly one of the following holds:

1. G is switching-rigid within R_43.
2. G has a nontrivial Ramsey-preserving cut, and **every** such cut
   produces a graph with a degree-18 or degree-24 vertex.

In the second case, any preserving cut gives a d18 instance directly,
after complementation if the supplied boundary vertex has degree 24.

A sharper sufficient hypothesis replaces the right-hand side of (8.3)
with

    Theta(G) = max_(k in K)
        43*(4*c + 3*min(k, 2*e-k))/(k*(43-k)),               (8.4)

where K={10,12,...,34}. If every degree is even, one may instead take
K={10,12,...,32}.

**Proof.** A nontrivial preserving cut has both sides at least nine.
Its even side therefore has k in {10,12,...,34}. Write

    x = (k/43)*1 + z,
    z^T*1=0,             ||z||^2 = k*(43-k)/43.

Since M*1=0,

    x^T M x = z^T M z >= lambda(G)*k*(43-k)/43.              (8.5)

If H has no boundary vertex, (8.1) and c(H)>=0 give

    x^T M x <= 4*c + 3*sum_U p_v
              <= 4*c + 3*min(k, 2*e-k).                    (8.6)

For the last step, if U contains a vertices whose degrees are even, then
sum_U p_v=2a-k and a<=min(k,e). Inequalities (8.5) and (8.6)
contradict lambda(G)>Theta(G).

For the simpler condition, bound sum_U p_v by k. The resulting threshold
at k is

    43*(4*c+3*k)/(k*(43-k))
      = 4*c/k + (4*c+129)/(43-k).

This is convex on [10,34], so its maximum is at an endpoint. At k=10
it equals 43/11+86*c/165; at k=34 it equals 43/3+86*c/153.
The latter is larger for c>=0, proving (8.3).

For the all-even improvement, a cut with a nine-vertex side W is
impossible. Section 4 forces every vertex of W to have exactly 17
neighbors across the cut. Consequently

    sum_(v in W) d_G(v) = 2*e(G[W]) + 9*17

would be odd, although every summand on the left is even. Thus k=34
is impossible, which justifies the smaller set K. QED.

This proof also establishes the converse necessary condition useful for
obstructions: if G has a **distinct residual Ramsey representative**,
then its actual even cut U satisfies

    lambda(G) <= 43*(4*c+3*sum_U p_v)/(k*(43-k)) <= Theta(G). (8.7)

The direction matters. Failure of the spectral hypothesis does not prove
that such a representative exists, and (8.7) does not prove rigidity.

<a id="claim-switch-regular-dichotomy"></a>
### 8.3 Concrete forms for even degrees and regular d20

**Corollary.** If every degree of G is 20 or 22, then

    lambda(G) > 129/11

suffices for the boundary-or-rigidity dichotomy.

**Proof.** Here c=0, p_v=1, and k<=32. The maximum in (8.4) is
max 129/(43-k)=129/11. QED.

**Corollary (20-regular case).** Suppose G is 20-regular and define

    mu(G) = min_(z != 0, z^T*1=0) ||Cz||^2/||z||^2.

If

    mu(G) > 173/11,                                         (8.8)

then G is rigid or every nontrivial Ramsey-preserving cut reaches d18,
allowing complementation. The same statement holds for 22-regular G.

**Proof.** For 20-regular G, C1=2*1 and C^2*1=4*1, whence
M=C^2-4I and lambda=mu-4. Now 4+129/11=173/11. For 22-regular G,
C1=-2*1 and the calculation is identical. QED.

Equivalently, every Seidel eigenvalue on 1-perp must have absolute value
greater than sqrt(173/11). The condition uses the **least squared**
eigenvalue on that subspace; it is not a condition merely on the largest
positive eigenvalue or the ordinary second largest eigenvalue.

No theorem here establishes (8.3), (8.4), or (8.8) for all Ramsey inputs,
or supplies an order-43 graph satisfying them. These are checkable
conditional criteria, not an unconditional classification.

### 8.4 Exact certificates and a constructive procedure

The spectral condition has a rational certificate. For any proposed
rational threshold theta, let P be the 43-by-42 matrix with columns
e_i-e_42 for i=0,...,41. Then

    lambda(G)>theta
      iff P^T*(M-theta*I)*P is positive definite.

An exact rational LDL^T factorization with positive diagonal, or positive
leading principal minors, verifies this claim. A floating-point spectrum
alone is not an exact certificate. The factorization is only a suggested
verification method; no order-43 matrix was supplied or factored here.

Once a spectral hypothesis is proved for G, search the exact formula F_G
for a nonconstant cut. Section 3 already supplies its complete forbidden
patterns. One can fix one bit to zero and exclude the all-zero assignment.
The constructive alternatives are now:

* A satisfying assignment gives a cut. Verify the switched graph and its
  degrees directly. The theorem guarantees a boundary vertex, without
  adding any degree-target constraints to the cut search.
* A complete checked refutation proves strict switching rigidity. An
  elementary finite certificate is a cover of all nontrivial cuts by
  aligned forbidden five-set patterns; a branching proof can compress
  this cover. It is the complete cover or refutation that certifies
  rigidity, not failure to find a cut within a resource limit.

This is a finite certifying procedure under the hypothesis, with no
polynomial-time or practical running-time claim. Without that hypothesis,
a satisfying assignment might give another residual graph and would not
complete the requested reduction.

<a id="claim-switch-quartet-rigidity"></a>
### 8.5 A structural rigidity certificate using homogeneous four-sets

There is also a sufficient rigidity criterion that needs neither a
spectral calculation nor a full cut refutation.

For X subset V(G), define cl(X) by repeatedly applying these two rules:

* If a clique four-set Q lies in the current set, add every vertex
  anticomplete to Q.
* If an independent four-set Q lies in the current set, add every vertex
  complete to Q.

Continue to a fixed point. These monotone rules give a unique least
closed superset of X. Each addition has a four-vertex witness.

**Lemma.** Each side of a Ramsey-preserving cut is closed under these
rules. In particular, if X lies on one side, so does cl(X).

**Proof.** A clique four-set on one side and an anticomplete vertex on
the other side become a K5 after switching. The independent-set rule
similarly prevents an I5. Induct on the additions. QED.

Every proper closed set X in G has at most 34 vertices. Indeed, choose
v outside X. Original Ramsey constraints and closedness together imply
that both N_G(v) intersect X and its complement in X are (4,4)-free:
the original graph forbids a K4 in the first cell and an I4 in the second;
closedness forbids an I4 in the first and a K4 in the second. Each cell
has at most 17 vertices. Thus a closure reaching 35 vertices actually
equals all of V(G).

**Theorem (quartet-closure rigidity).** If

    |cl(Q)| >= 35 for every homogeneous four-set Q in G,      (8.9)

then G is switching-rigid within R_43.

**Proof.** A nontrivial preserving cut would have both sides at most 34,
and its larger side T would have at least 22 vertices. By R(4,4)=18,
G[T] contains a homogeneous four-set Q. The lemma gives cl(Q) subset T,
contradicting |cl(Q)|>=35>|T|. QED.

A weaker sufficient certificate is a family of homogeneous four-sets Q
with |cl(Q)|>=35 that meets every 22-vertex subset, in the sense that
each such subset contains one whole Q. The same proof applies. Individual
closure certificates are just lists of added vertices and their four-set
witnesses; the covering assertion also needs proof.

This is a **sufficient** structural obstruction. It uses only the 1+4
patterns, so failure of (8.9) does not imply a preserving cut exists.
The mixed 2+3 patterns can obstruct cuts that pass this test. No claim
is made that an order-43 example satisfying (8.9) has been constructed.

### 8.6 What the new theorem separates, and what remains open

The spectral theorem gives the requested strict two-way split on its
stated domain: rigid graphs versus graphs with a boundary-reaching cut.
The quartet theorem supplies a separate, explicit family of rigid
obstructions. For unrestricted residual d20 inputs, the following
possibility is still unexcluded:

    a non-rigid switching class whose Ramsey representatives all
    have degrees 19..23.

Every such class would violate the applicable strict spectral threshold
at each of its representatives, with a cut witnessing (8.7), and would
fail the sufficient quartet-closure rigidity test. These are proved
necessary restrictions on a potential third case, not an existence
claim and not a proof that the third case is impossible.

Thus the universal assertion "rigid or reducible to d18" is stronger
than what has been proved here. A future complete reduction must either
exclude those non-rigid classes or include them explicitly among the
obstructions. The original unconditional d20 branch remains open.

### 8.7 Author validation of the new algebra and closure rule

The same self-check command in Section 7 now also checks the integer
matrix construction and identity (8.1). To test the algebra without an
order-43 input, use odd n and center q=(n-1)/2, replacing 21 by q,
boundary degrees by q+-3, and p_v by +1 when d_G(v)-q is odd and -1
otherwise. The identical proof applies when initial degrees are within
q+-2 and endpoint degrees within q+-3.

The test uses every labelled graph on five vertices and every cut up
to complement, and a deterministic extension of each to seven vertices.
In that extension, the new edges are 50,51,52,63,64,56; all starting
degrees lie in 1..5 and every endpoint degree lies in 0..6. Thus actual
boundary-degree terms are exercised. Moment and defect identities are
checked against degrees computed by direct switching. Quartet closures
are also checked to stay on the assigned side for monochromatic seeds
in all preserving cuts of the five-vertex Ramsey inputs.

All 81,920 moment and defect comparisons passed, including 11,918
endpoints with at least one boundary degree in the generalized formula.
All 10,210 monochromatic-seed closure checks passed. A nine-vertex graph
consisting of two anticomplete K4s and a ninth vertex adjacent only to
vertex 0, and its complement, additionally test a two-step closure:
the first four-set forces the second, which then forces the ninth vertex.
All 512 cuts up to complement in these two examples were checked directly.
The previous Section 7 checks also passed on this run.

These finite checks test the algebra and closure implementation. They
do not independently review the spectral proof or establish any spectral
hypothesis at order 43. No order-43 search is run.

## Changelog

* Established the exact preservation criterion, composition and degree
  identities, universal cut-size obstruction, critical-cell boundary,
  and parity-based rigidity example. Formulated the missing d20-to-d18
  coverage theorem and exact graph-specific certificates; retained d20
  as open. Added exhaustive finite self-checks, pending independent review.
* Added the exact cut-energy/degree-defect identity, a spectral
  boundary-or-rigidity theorem for mixed degrees, the stronger all-even
  and regular criteria, and a homogeneous-four closure rigidity theorem.
  Identified the remaining possible non-rigid classes confined to the
  residual. Added small algebra and closure self-checks; independent
  review remains pending and no unconditional reduction is claimed.
