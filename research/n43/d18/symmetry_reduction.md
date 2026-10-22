# Symmetry reduction by generating the column multiset first

Date: 2026-10-14. Task: symmetry-d18-20261014.

This is a mathematical coverage note and a future search design. No graph
enumeration, solver, canonicalizer, download, installation, or literature
novelty review was performed. All six mathematical claims have exact-revision independent acceptance,
with the review linked below. The generator remains a draft design; no
implemented pruning or order-43 certificate is supplied.

The intended change in search order is

```text
rooted neighborhood A
  -> multiset of 24 actual subsets of A, modulo Aut(A)
  -> graph on those 24 occurrences, modulo the multiset stabilizer
  -> full rooted Ramsey graph
```

This preserves the full permutation freedom of B until its internal edges
are assigned. Fixing a labeled B graph first instead leaves only Aut(B).
Neither order is known to be faster: strong B filters are available earlier
in the latter order. The former exposes a large label quotient even when the
eventual B graph has a trivial automorphism group.

## Setting and dependencies

G has 43 vertices and contains neither K5 nor I5. Fix v with d(v)=18.
A=N(v), B=M(v), |A|=18, |B|=24, C_y=N(y) intersect A. A is (4,5)-free;
B is (5,4)-free. In particular A may contain I4 and B cannot contain I4.
Fix a labeled representative of A when discussing its automorphism group.

Write q=85-e(A), epsilon_z=d(z)-18, E=sum_A epsilon_z, W=sum_V epsilon_z,
x=136+k. The retained external premises give all degrees in 18..24,
e(A)<=85, and e(B)<=160. The exact identities are

```text
k=2q+E,
W=2e(B)-296+2k-2q <= 24+2k-2q = 24+2q+2E.
```

For the multiplicity claims use additionally q<=2, the four-transversal
bound, and the small-column count bounds in
[frontier_band.md](frontier_band.md) and
[small_columns.md](x136/small_columns.md). These give |C_y|>=4,
3-q<=e_A(C_y)<=5 for size-four columns, and

```text
r=number of size-four columns, s=number of size-five columns,
H=sum_(|C_y|>=6)(|C_y|-6),
H=2r+s-8+k,
r<=4,
s<=10,10,7,3,0 for r=0,1,2,3,4 respectively.
```

Every nonadjacent pair y,z in B satisfies |C_y union C_z|>=10: its common
zero-set in A is (4,3)-free and has at most eight vertices by R(4,3)=9.
This assertion has no census dependency. The already reviewed r3 exclusion
is needed only for the live x136 branch table below, not for Claims 01--06.

## Deterministic conventions

Vertices of A are indexed 0..17. Order subsets by (cardinality, bit tuple),
where the tuple is (1_(0 in C),...,1_(17 in C)) and 0 precedes 1. Repetitions
are retained as separate occurrences. A multiset is encoded by its sorted
list of subsets. All lexicographic comparisons below use that list order.
For a B graph use the bit vector of edges (i,j), i<j, in lexicographic pair
order. An action always permutes every assigned occurrence and every assigned
edge together. This auxiliary ordering does not change the repository's edge
variable or witness formats.

<a id="claim-d18-symmetry-01"></a>
## 1. Complete two-stage quotient and the residual group

Claim ID: `research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-01`

Kind: local-deduction

Review state: accepted

Scope: every rooted degree-18 candidate, with a fixed labeled A; no
frontier or census bound is needed for the symmetry argument.

Dependencies: finite vertex permutation action; setting and encoding above.

Conclusion: retaining one sorted column multiset per Aut(A) orbit, then
one B graph per residual orbit, retains a representative of every rooted
candidate with that A. It can give exactly one representative per rooted
isomorphism class when both orbit reductions are complete.

Proof: Before B is fixed the action is Aut(A) x S_24. Quotienting by S_24
replaces the column list by its multiset; Aut(A) then acts simultaneously on
every subset. Select a least sorted multiset M. Let m_C be the multiplicity
of C, and let

```text
H_M={g in Aut(A): m_(gC)=m_C for every C},
K_M={sigma in S_24: C_(sigma(i))=C_i for every i},
Gamma_M={(g,sigma): g in Aut(A), C_(sigma(i))=g(C_i) for all i}.
```

The projection Gamma_M -> H_M is onto: equal multiplicities allow a
bijection between occurrences of C and occurrences of gC. Its kernel is
K_M, which is isomorphic to the product over C of S_(m_C). Consequently

```text
1 -> product_C S_(m_C) -> Gamma_M -> H_M -> 1,
|Gamma_M|=|H_M| * product_C m_C!.
```

These are precisely the permutations preserving the fixed rooted graph
on {v} union A and its cross matrix. A least B edge vector under Gamma_M
exists. Relabeling to the chosen multiset and then to this B representative
preserves every Ramsey constraint and scalar budget. Conversely two rooted
completions with the same fixed M are isomorphic exactly when their B graphs
are in the same Gamma_M orbit. A row automorphism may exchange different
signature classes, so the kernel K_M alone can miss symmetries. Using only
K_M is still safe, but need not be a complete quotient.

For a multiset with fixed A labels, the number of distinct labeled cross
matrices represented by it is exactly 24!/product_C m_C!. This counts label
redundancy in cross matrices, not elapsed solver time.

Search use: symmetry, after independent review and certified orbit handling.

Reviews: [exact independent pivot-agent review](review_d18_symmetry_20261014_pivot.md).

<a id="claim-d18-symmetry-02"></a>
## 2. Sorted prefix pruning has a coverage proof

Claim ID: `research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-02`

Kind: local-deduction

Review state: accepted

Scope: the multiset generation stage of Claim 01, under any subgroup H of
Aut(A), with no B edges assigned and a fixed total subset order.

Dependencies: Claim 01's multiset encoding; finite ordered lists.

Conclusion: a generator may append subsets in nondecreasing order and prune
a length-t prefix P if sort(gP)<lex P for some g in H. Every H-orbit of full
column multisets still has a retained representative. In particular the
lexicographically least full list has a least prefix at every depth.

Proof: Let M=(C_1,...,C_24) be a least full sorted list, and let P consist of
its first t entries. For any g, gP is a submultiset of gM. The j-th entry of
sort(gM) is at most the j-th entry of sort(gP), for j<=t, because taking the
smallest entries from a larger multiset cannot increase an order statistic.
If sort(gP)<lex P, then either sort(gM) is already smaller at an earlier
entry, or it is smaller at the first strict difference of sort(gP) from P.
Thus sort(gM)<lex M, contradiction. Every prefix of M survives, so a
nondecreasing append generator reaches M. If only some elements g are tested,
the same representative survives, though more redundant prefixes remain.

The argument concerns a prefix of the sorted list. It does not allow
minimizing each column independently, forgetting multiplicities, or pruning
arbitrary assigned subsets as though they were this prefix. Remaining row
degrees are carried with the fixed A: any row relabeling permutes their
whole vector and all other row-indexed information.

Search use: symmetry, after independent review. A rejection witness is the
single row permutation g; its automorphism property and the strict sorted
comparison are directly checkable without trusting a canonicalizer.

Reviews: [exact independent pivot-agent review](review_d18_symmetry_20261014_pivot.md).

<a id="claim-d18-symmetry-03"></a>
## 3. At x136..141 no full column occurs more than twice

Claim ID: `research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-03`

Kind: local-deduction

Review state: accepted

Scope: every candidate in the setting with 0<=k<=5; hence q<=2.

Dependencies: small-column count/size bounds and pair-union assertion above;
A has no I5; G has no K5.

Conclusion: every signature multiplicity m_C is at most two. At k<=3 all
repeated-column pairs are edges of B. At k=4,5 a repeated pair has size at
most ten; a size-ten pair is not forced adjacent by this argument.

Proof: Substituting the five s bounds into H=2r+s-8+k gives respectively
H<=2+k,4+k,3+k,1+k,k. Thus uniformly H<=4+k<=9.
If |C|>=10, three occurrences would contribute at least 3*(10-6)=12 to H,
impossible. If |C|<=9, all its occurrences are mutually adjacent, because
a nonadjacent pair would have union C of size below ten. Also A[C] contains
an edge: for |C|>=5 this follows from A having no I5, and for |C|=4 it
follows from e_A(C)>=3-q>=1. Three occurrences, together with the endpoints
of that edge, would give K5. This proves m_C<=2 in every case.

For a repeated signature of size c>=7, its two occurrences spend 2(c-6)
units of H. Consequently

```text
c <= 6+floor(H/2) <= 6+floor((k+4)/2).
```

At k<=3 this is at most nine, so the pair is adjacent. At k=4,5 it is at
most ten; the pair-union bound permits nonadjacency at c=10. Signatures of
size at most six are already forced adjacent. For any repeated edge pair,
A[C] must also be triangle-free, since a triangle in C together with the
pair would give K5. This is an additional compatibility filter, not an
assumption that A itself is triangle-free.

Search use: propagate multiplicities and forced edges; symmetry via Claim 01,
after independent review of this claim and its external premises.

Reviews: [exact independent pivot-agent review](review_d18_symmetry_20261014_pivot.md).

<a id="claim-d18-symmetry-04"></a>
## 4. Concrete equality-frontier consequences

Claim ID: `research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-04`

Kind: local-deduction

Review state: accepted

Scope: x=136, and the reviewed live branches r=0,1,2 where tabulated.

Dependencies: Claims 01 and 03; small-column count bounds; for the live
table only, [reviewed r3 exclusion](x136/pairwise_small_refinements.md#claim-pairwise-small-03)
and the retained [r4 exclusion](x136/r4/exclusion.md).

Conclusion: the equality-frontier kernel consists only of disjoint duplicate
swaps. If p counts signatures occurring twice, K_M is isomorphic to (C2)^p,
with p<=12. Every duplicate pair is a forced B edge. For each such pair C,
A[C] is triangle-free. In particular

```text
|Gamma_M| <= 4096 * |H_M|,
24!/product_C m_C! = 24!/2^p >= 24!/4096
                  = 151476660579404160000.
```

The table records necessary column budgets, not realizability or speedup:

| r | s | H | largest possible single column | largest possible repeated column |
| --- | --- | --- | --- | --- |
| 0 | 8..10 | s-8, hence 0..2 | 6+H, hence at most 8 | 6+floor(H/2), hence at most 7 |
| 1 | 6..10 | s-6, hence 0..4 | 6+H, hence at most 10 | 6+floor(H/2), hence at most 8 |
| 2 | 4..7 | s-4, hence 0..3 | 6+H, hence at most 9 | 6+floor(H/2), hence at most 7 |

Proof: Claim 03 gives every multiplicity at most two and every repeated pair
adjacent. There are only 24 occurrences, so p<=12. Claim 01 gives the group
order and label count. A column of size c>=6 spends c-6 in H; two such
columns spend 2(c-6). Columns of size four or five satisfy the displayed
upper bounds as well. Substitution yields the table.

Duplicate swaps are available before B is completed. They need not remain
automorphisms of the completed B graph; acting on the entire B edge vector
maps it to a potentially different but isomorphic completion. Do not treat
the pair's remaining neighborhoods as equal or impose twin-vertex equations.

Search use: propagate and symmetry, subject to the review gates above.

Reviews: [exact independent pivot-agent review](review_d18_symmetry_20261014_pivot.md).

<a id="claim-d18-symmetry-05"></a>
## 5. Selected lex comparisons are safe but need not be complete

Claim ID: `research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-05`

Kind: local-deduction

Review state: accepted

Scope: any invariant finite family of complete B edge vectors with fixed M,
under Gamma_M; also any invariant domain of assigned edges at a partial state.

Dependencies: Claim 01; finite group action and a fixed lexicographic order.

Conclusion: constraints z<=lex gamma(z) for any chosen subset of Gamma_M
retain a representative of every orbit. Testing generators alone is safe for
coverage; it does not in general retain exactly one representative per orbit.

Proof: The least vector in a full Gamma_M orbit satisfies the comparison
for every group element, hence for any subset. This remains true for partial
vectors when the elements act within their common assigned domain and keep
all fixed conditions invariant. If an element exchanges assigned and
unassigned coordinates, this partial-vector argument does not apply.

This proves coverage for the orbit family being compared. Combining breakers
at different partial states needs a surviving full path argument as well. A
sufficient arrangement is to use prefixes of one fixed full edge order and
only elements preserving each tested prefix domain: a least full vector then
passes every tested prefix comparison. Arbitrary changing edge domains and
different local orders are not covered by that arrangement.

For example, let C3 rotate length-three binary vectors. The distinct vectors
001 and 010 both satisfy z<=lex gamma(z) when gamma maps 001 to 010, 010 to
100 and 100 to 001. They belong to one orbit, so a generator comparison alone
does not enforce global minimality. The same minimum-exists proof nonetheless
guarantees coverage. The warning about generator-only lex constraints in
[reduction index Section 10.3](../reductions.md#103-rooted-residual-action)
concerns the claim of complete minimization; it is not a reason to reject a
coverage-preserving incomplete breaker.

At equality, p duplicate swaps generate K_M. Comparing the whole edge vector
against each swap needs only p comparisons, but combinations can give further
reductions. A certified orbit rejection can record a product of swaps and a
lift of one row automorphism in H_M, with its explicit occurrence permutation.
No equality between the two duplicate vertices' external neighborhoods is
justified by these comparisons.

Search use: symmetry after review; complete quotient claims require additional
coverage of all elements or an equivalent orbit algorithm.

Reviews: [exact independent pivot-agent review](review_d18_symmetry_20261014_pivot.md).

<a id="claim-d18-symmetry-06"></a>
## 6. Complement selection is automatically compatible through x151

Claim ID: `research/n43/d18/symmetry_reduction.md#claim-d18-symmetry-06`

Kind: local-deduction

Review state: accepted

Scope: every candidate with a degree-18 root, arbitrary q>=0 and E>=0;
no four-transversal or small-column hypothesis is used.

Dependencies: global degree bounds; e(A)<=85, e(B)<=160; exact excess
identities in the setting; degree-sum parity.

Conclusion: if 3k-5q<48, then n18>n24. In particular every degree-18
candidate with 136<=x<=151 satisfies n18>n24 and hence D<lex D^c for the
project's sorted degree-sequence complement selector.

Proof: At least 19-E vertices have degree 18: the root and at least 18-E
of its neighbors, since each non-degree-18 neighbor contributes at least one
to E. Suppose instead n18<=n24, and put m=n24. Then m>=19-E.
Every vertex outside the n18 degree-18 vertices contributes at least one
unit to W, and the m degree-24 vertices each contribute another five. Thus

```text
W >= (43-n18)+5m >= 43+4m.
```

W is even, so W>=44+4m>=120-4E. On the other hand the root budget and
e(B)<=160 give W<=24+2q+2E. Therefore

```text
120-4E <= 24+2q+2E,
3E+q >=48,
3k-5q >=48.
```

This contradicts the claimed strict inequality. For k<=15 and q>=0,
3k-5q<=45<48. Finally n18>n24 makes D lexicographically smaller than its
complement sequence at the first unequal degree entry. The complement then
has n18<n24, so it cannot also have a root satisfying this local condition.

This proves compatibility of an existing orientation selector. It does not
prove x<=151 for all degree-18 candidates, does not close any branch, and
does not permit complementing a fixed degree-18 root while retaining degree
18: the same vertex has complementary degree 24.

Search use: symmetry compatibility and degree-count propagation after review.

Reviews: [exact independent pivot-agent review](review_d18_symmetry_20261014_pivot.md).

## Proposed generator and exact certification obligations

Kind: design. Review state: draft. Search use: none before implementation,
small-instance validation and review. No runtime improvement is measured.

1. Obtain complete coverage of admissible A graphs, including their fixed
   labels and certified automorphisms. The present note supplies no catalogue
   or completeness proof for this first stage.
2. Form candidate subsets C with A-C containing no I4. The other
   single-column condition is that A[C] contain no K4, which is already
   ensured by A being K4-free. Triangle-freeness is required for the common
   column set of an adjacent B pair, including repeated forced-edge pairs;
   it is not a universal single-column condition. Generate sorted
   occurrence lists with the required total x, multiplicity bounds where
   applicable, and full row-degree budgets. At equality row a has exactly
   17-d_A(a) incidences; beyond equality assign epsilon_a consistently and
   use 17+epsilon_a-d_A(a).
3. Use Claim 02 to reject prefixes with a witnessed strictly smaller row
   image. Upper/lower remaining-incidence filters must be justified for the
   sorted remaining subset domain; a failed extension is not a closure.
4. For each multiset, construct the forced B pairs using their actual subset
   graphs: force an edge if A-(C_y union C_z) contains I3; force a nonedge
   if A[C_y intersect C_z] contains K3. If both conditions hold, reject.
   These are necessary mixed five-set constraints. The union-size rule is
   a cheap sufficient test for forcing an edge. They retain both ambient
   graph types and never replace actual signatures by only their sizes.
5. Complete B under its degree bounds, no K5 and no I4, with Gamma_M
   symmetry. Assign remaining edges in an explicitly recorded order. A
   group element used on a partial edge vector must preserve its assigned
   domain and all stored vertex colors or budgets. Full-vector breakers can
   instead be encoded once with a global orbit-minimum coverage argument.
6. Check every remaining mixed clique/independent constraint, including
   triples and quadruples of columns, or use the direct Ramsey encoding for
   the full completion. Pairwise feasibility alone is insufficient.

When a child is omitted, the coverage artifact must exhibit an explicitly
checked permutation to a retained state, together with an ordering or an orbit
partition proving this mapping eventually reaches a retained representative.
The prefix proof supplies a least surviving path; it does not replace the
implementation's own coverage log. SAT proofs for the retained symmetry-broken
formulas must be joined to this coverage argument; appended lex clauses are
not ordinary consequences of the unbroken Ramsey CNF.

Root selection remains a separate matter. Enumerating all rooted candidates
and quotienting only within a fixed root is safe and can repeat unrooted
graphs. A canonical root must be selected within a nonempty invariant family
of admissible roots, using an invariant key with all tied rooted isomorphism
types retained or a whole rooted canonical code. At x136 this family can be
the degree-18 roots with x=136; it is not all 19 or more degree-18 vertices,
since neighbors of the original root need not themselves have x=136. Claim 06
handles orientation compatibility in its range, not root uniqueness.

## Author's audit and limits

The prefix argument was checked independently of Ramsey assumptions by
order statistics on nested multisets. The residual group was derived both
from the stabilizer condition on the cross matrix and from its kernel and
surjective projection. Multiplicities were audited in separate size ranges
4..9 and >=10; the size-four edge hypothesis explicitly uses q<=2. The
complement inequality was rederived from vertex counts and degree parity,
then compared with the exact local edge budget. These are self-checks by the
author, not independent acceptance or a formal proof checker run.

Standard symmetry concepts used here include lex leaders, stabilizers and
generation up to isomorphism. Their adaptation to these frontier budgets may
be useful, but novelty has not been reviewed. Choosing the multiset first
can expose large column-label redundancy while also admitting many multisets
that will fail only after B is completed. A future comparison should measure
generation cost, retained multiset count, completion cost and proof size.

Input hashes read during this task (uncommitted files; SHA-256):

| Input | SHA-256 |
| --- | --- |
| frontier_band.md | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| x136/small_columns.md | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| x136/pairwise_small_refinements.md | `3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85` |
| ../reductions.md | `66bde04cbe0e7b3ccb588f13377c26dc22e8f14f737be5564236c8ff90908577` |
