# Transferred bounds and new deductions above x=136

Date: 2026-10-14. Mathematical work only. This navigation note separates the
existing frontier-band statements from the new claims and their exact reviews.
No upper bound x<=142 is asserted; [x>=143](x-ge143/README.md) remains open.

## Setting and coverage

G is an order-43 (5,5)-free graph, v is a chosen degree-18 pivot,
A=N(v), B=M(v). Thus |A|=18, |B|=24, A is (4,5)-free and B is
(5,4)-free. Set q=85-e(A), E_A=sum_A(d_G(u)-18), and x=136+k.
The identity k=2q+E_A and q,E_A>=0 supplies the disjoint numerical children
x137,...,x142 and the residual x>=143. It does not bound x from above.

The existing [frontier band](frontier_band.md) gives the complete profiles
through x142, b=e(B) bounds, anchor defects, and |C_y|>=4 for q<=2.
[Small-column predicates](x136/small_columns.md) transfer by their exact
hypotheses; their size-four and size-five incidence upper bounds do not need
q<=2, but their column-count identity needs every column to have size at
least four. The equality-frontier r4 proof alone does not cover higher x.

[Transfer bounds](transfer_bounds.md) records the reviewed transfer table and
additional independent-triple and union-ten pair tests. In particular, the
adjacent degree-18 neighbor bounds at x142 are 11,10,9,9 for q=0,1,2,3.
These concern the second pivot's degree and overlap, not its q or E_A.

## Elementary lower bound at the q=3 boundary

<a id="claim-band137-two-transversal"></a>
Claim ID: n43/d18/transfer_summary.md#claim-band137-two-transversal
Kind: local-deduction
Review state: accepted
Scope: an 18-vertex graph F with alpha(F)<=3 and e(F)<=71; every K4 transversal
Dependencies: R(4,3)=9; R(4,4)=18 (published smaller Ramsey numbers in
[baseline](../../docs/mathematical_baseline.md)); no census premise
Conclusion: every K4 transversal of F has size at least three
Proof: below
Search use: propagate
Reviews: [independent review](review_band137_two_transversal_20261014_q3_agent.md)

Suppose a transversal has size at most two. Enlarge it to a two-set T and
write H=F-T. Then H has 16 vertices, no K4, and alpha(H)<=3. Each h in H
has at most eight H-nonneighbors, since they have no K4 and no independent
triple (such a triple together with h would violate alpha(H)<=3).
Thus d_H(h)>=7 and e(H)>=56. Each t in T has at most eight H-nonneighbors
for the same reason; hence it has at least eight H-neighbors. Therefore

e(F)>=e(H)+e_F(T,H)>=56+16=72,

contrary to e(F)<=71. This is a lower bound of three, with no assertion of
a three-transversal's existence. Applied to complement A at q=3, it excludes
columns smaller than three before the actual-column theorem is used.

## Exact-census strengthening across all cross counts

The [reviewed deletion transfer](deletion_degree_transfer.json), with its
[independent audit](review_deletion_degree_transfer_20261019.json), replaces
the elementary order-16 lower bound 56 above by the published minimum 60.
Thus a transversal of size at most two forces e(F)>=60+16=76, proving
tau_4(F)>=3 whenever q<=7, not only q<=3. This holds for isolated A and
every actual column, uniformly in E_A and x. The census-free proof above
retains its original hypotheses and provenance.

Together with the one- and three-deletion arguments, every actual column has
size at least four for q<=2, at least three for q=3..7, and at least two
for q=8. For q>=9 these arguments give only the nonempty-column bound.
The separate q=3,E_A<=13 actual-interface theorem still gives size at least
four; its E_A threshold is not extended by the census substitution.

Members of size-one, two, three, and four I4-transversals have interior
degree at least max(0,17-q), max(0,17-q), max(0,13-q), and max(0,9-q),
respectively. The same note derives exact boundary cores and conditional
column-excess budgets. These are necessary restrictions, not existence or
branch-closure assertions.

## New independently reviewed claims

- [Four-column stability](four_column_stability.md): finite exceptional-column
  budget, size-four member degrees, and exclusion of r=4 at x137. At q=0,
  x138 r4 requires exactly two size-seven exceptions; x139..141 requires at
  least two exceptions. At q=0 through x142 four small columns must overlap.
  At x142,q0 a single exception forces six excess-one A vertices inducing a
  triangle-free graph. These close subcases, not complete x branches.
- [Actual size-three column theorem](x142/q3/three_columns.md): a=82 and an
  actual size-three column require E_A>=14. Thus q=3 and x<=155 exclude size
  three. Together with the preceding elementary bound, every q=3 profile in
  x142,...,x155 has columns of size at least four. This result needs the full
  order-43 interface and cannot be promoted to an isolated tau>=4 theorem.
- [Transfer bounds](transfer_bounds.md): exact column-count ranges through 142,
  the x142 adjacent-pivot table, and structural pair/triple compatibility tests.

Each linked claim's metadata and recorded exact-revision review govern its
permitted use. New claims are necessary filters for a future exhaustive proof;
no full x137,...,x142 branch has been excluded and order 43 is undecided.
