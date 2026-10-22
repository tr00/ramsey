# Saturated d20: complete categories and the remaining completion problem

Date: 2026-10-22. Author: Main, working alone.
Outcome: **the branch remains open**. This note gives a complete disjoint
structural categorization and an exact finite completion criterion. It does
not enumerate isomorphism classes or claim an ambient realization of a category.
Claims are ready for independent review; validation below is an author's self-check.

Throughout G is an order-43 K5/I5-free, globally K5-saturated graph,
n18(G)=0, and v is an actual degree-20 vertex. Put A=N(v), B=M(v),
|A|=20, |B|=22, a=e(A), b=e(B), and C_y=N_A(y).
The scope includes degrees 19..24. The complement-closed variant additionally
requires n24(G)=0 and has degrees 19..23. Degree 19 is retained throughout.
Dependencies are the [interface bounds](interface_bounds.md),
[core restrictions](neighborhood_structure.md), the small Ramsey bounds and
edge census premises cited there, and the elementary saturation witness criterion.
No unique-core premise is used.

<a id="claim-d20-saturated-categories"></a>
## 1. Twenty-two disjoint structural categories

Claim ID: n43/d20/saturated_categorization.md#claim-d20-saturated-categories  
Kind: local-deduction  
Review state: ready  
Scope: every rooted saturated d20 graph as above  
Dependencies: interface Claims 2, 5, 6; structure Claim 3  
Conclusion: the table gives a disjoint exhaustive 22-category cover  
Search use: none pending review; proposed complete branching  
Reviews: none

Let Z, P, D denote a triangle plus an isolated vertex, a paw, and a diamond.
Count columns of size three by ell3 and columns of size four of these shapes
by (z,p,d). These counts refer to actual B vertices, not distinct signatures.

| Category | Exact predicate | Number of categories | Necessary bounds |
| --- | --- | ---: | --- |
| T19 | ell3=1, its endpoint degree 19; z=p=d=0 | 1 | C_y=K3; d_B(y)=16; 74<=a<=95 |
| T20 | ell3=1, its endpoint degree 20; z=p=d=0 | 1 | C_y=K3; d_B(y)=17; 74<=a<=95 |
| Q1 | ell3=0, z+p+d=1; retain each shape | 3 | 68<=a<=97; endpoint degree in {19,20,21} |
| Q2 | ell3=0, z+p+d=2; retain each nonnegative count triple | 6 | 68<=a<=97; both endpoints adjacent and degree 19 |
| Q3 | ell3=0, z+p+d=3; retain each nonnegative count triple | 10 | 68<=a<=97; endpoints form K3 and all have degree 19 |
| L | ell3=z=p=d=0 | 1 | 68<=a<=100; every column has size at least five |

Proof. Every column contains a triangle by saturation of vy. Its missed
A-set is I4-free, and R(4,4)=18 forces its size to be at least three.
A size-three column is K3. The previously proved pair competition gives
ell3<=1, ell3=1 implies ell4=0, and ell4<=3. A four-column is K4-free
and contains a triangle, so its fourth vertex has zero, one, or two
neighbors on that triangle, giving exactly Z, P, D. The two-or-more
four-column endpoints form a clique and all have degree 19. A lone
four-column has d_B(y)<=17, hence 19<=d_G(y)<=21.
The core note supplies the two three-column endpoint types and their a
bounds; the four-column core bound gives a<=97. There are respectively
binom(k+2,2) count triples for k=1,2,3, giving 2+3+6+10+1=22.
Counts and the degree of the unique three-column endpoint determine a
unique row and category. Conversely every graph satisfies one predicate.
This proves coverage only; it does not prove that any category is nonempty.

Every category can further be split, disjointly, by whether A is
K4-saturated. This gives 44 predicates, some possibly empty. In the
second alternative retain every locally safe A-nonedge and its external
blocker obligation. This refinement does not justify dropping that alternative.

Common restrictions on all categories include 117<=b<=143,
160<=x<=290, the exact degree/excess identities, and the connectivity
bounds in the linked notes. The restrictions apply to the same graph and
root, so they may be combined. No maximum-density selection is needed.

<a id="claim-d20-exact-saturated-completion"></a>
## 2. An exact 440-bit completion criterion

Claim ID: n43/d20/saturated_categorization.md#claim-d20-exact-saturated-completion  
Kind: local-deduction  
Review state: ready  
Scope: every labelled K4/I5-free A20 and K5/I4-free B22, without any catalogue assumption  
Dependencies: exhaustive partition of a five-set and triangle witnesses  
Conclusion: the conditions below are necessary and sufficient for saturated d20 completion  
Search use: none pending review; proposed exact completion specification  
Reviews: none

Fix the two side graphs, label their vertices, and retain all 20-by-22
Boolean matrices M. Set u-y adjacent iff M[u,y]=1; join v to all A and
none of B. The following is an exact criterion:

1. Each A vertex has 19<=1+d_A(u)+sum_y M[u,y]<=24 and each B vertex
   has 19<=d_B(y)+sum_u M[u,y]<=24. For the complement-closed variant
   replace 24 by 23. The pivot itself has degree 20.
2. For each pair of internally complete subsets U of A and W of B,
   with (|U|,|W|) in {(1,4),(2,3),(3,2)}, the rectangle M[U,W]
   is not all one.
3. For each pair of internally independent subsets U of A and W of B,
   with (|U|,|W|) in {(1,4),(2,3),(3,2),(4,1)}, the rectangle M[U,W]
   is not all zero. The (1,4) family is empty because B has no I4;
   it is retained in the list to make the partition explicit.
4. For every nonedge pq of the resulting graph, some three distinct
   vertices in N(p) intersect N(q) are pairwise adjacent.

The last condition is a positive witness disjunction; the rectangle
conditions alone do not establish saturation. It can be checked directly
on every pair. For pq=vy it says that C_y contains a triangle.

Proof of necessity is immediate from degrees, forbidden five-sets, and
saturation. For sufficiency, a K5 containing v would require a K4 in A;
an I5 containing v would require an I4 in B. Both are excluded by the
side types. A forbidden five-set avoiding v lies inside a side (already
excluded), or splits across A and B. For K5 the only internally possible
splits are those in condition 2; for I5 they are those in condition 3.
Their rectangles are prohibited. Thus the graph is K5/I5-free. Condition 1
establishes the residual degrees and condition 4 is precisely global
K5-saturation: adding pq creates K5 iff its common neighborhood contains
K3. Consequently all hypotheses, and hence exactly one category from
Claim 1, hold. This proves both directions without symmetry restrictions.

This criterion retains all side graphs, all relative labellings and all
440 cross variables. Enumerating only independently normalized column
signatures, only K4-saturated A, or only Paley cores is not licensed by it.
It is a completion specification, not a completed exhaustion.

<a id="claim-d20-saturated-obstruction"></a>
## 3. Explicit obstruction to declaring closure

Claim ID: n43/d20/saturated_categorization.md#claim-d20-saturated-obstruction  
Kind: design  
Review state: ready  
Scope: the attempted saturated d20 closure and its use in global routing  
Dependencies: Claims 1 and 2; residual coverage Claim 2  
Conclusion: exact unresolved obligations and the orientation limitation below  
Search use: none  
Reviews: none

No contradiction presently excludes L (all 22 columns of size at least
five), or all the other categories. The numerical envelope is nonempty:
a=90, b=130, x=220 gives E_A=40, E_B=62 and e(G)=460. These numbers
satisfy the recorded scalar corridor, parity and excess caps even in
degrees 19..23. This is an arithmetic witness only, not a graph, not a
realizable degree sequence, and not evidence that a completion exists.
It shows why scalar bounds alone have not yielded closure.

The missing mathematical step is exclusion of every matrix in Claim 2,
for every eligible labelled pair of sides, across all 22 categories
(or construction and full verification of one matrix). Neither a complete
side catalogue with its completeness evidence nor completion refutations
are supplied by this work. No category is marked closed.

Even eventual exclusion of this entire rooted saturated d20 scope would
not alone settle the global residual: augmentation can change the root's
degree, and the complemented orientation can lose K5-saturation. The
[routing table](residual_coverage.md#claim-d20-saturation-routing) retains
those other orientations explicitly. This limitation is separate from
the unresolved completions inside the present branch.

The retained [validation](../../reports/2026-10-22-d20-saturated-categorization/validate.py)
checks the category counts, five-set splits, and scalar example. It is
not an independent proof review or a satisfiability check.

The [large-column follow-up](large_columns.md) adds restrictions within category L,
including simultaneous five/six counts, an equality B frame and triangle resources.
It leaves the category open.
