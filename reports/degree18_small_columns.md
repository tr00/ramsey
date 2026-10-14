# Degree-18 small-column progress

Date: 2026-10-14. Pure mathematics; no solver, enumeration, or acquisition.

Derived constraints coupling size-four and size-five columns in a complete
order-43 interface. Every A vertex belongs to at most three such columns,
so 4n4+5n5<=54. Sharper bounds give n5<=10,10,7,3,0 for n4=0,1,2,3,4.
For two size-four columns, 5n5<=36 minus their signature overlap.

The exact cross-edge budget is 2n4+n5=8-k+H for x=136+k, where H is the
total column excess above six. At x=136, four size-four columns force every
other column to have size six; with no size-four columns there must be eight
to ten size-five columns.

Nonadjacent size-five columns are disjoint and leave an eight-vertex
(4,3)-free A subgraph. Proved without catalogues that it has 16,17,or18 edges,
with degree-five counts 0,2,or4 and triangle counts 8,10,or12. Degree-five
neighborhoods are C5; at the 18-edge endpoint degree-four neighborhoods are C4.
An independent triple of size-five columns leaves a three-vertex clique in A.

These interface reductions apply throughout x=136,...,141 using the existing
four-transversal premise, and in every higher-x subcase with e(A)>=83.
No frontier value was excluded and no global Ramsey bound improved.

Full proofs and audit: n43/d18/x136/small_columns.md.
