# Edge-maximality pruning of the order-24 antineighborhood catalogue

Date: 2026-10-18. Author/task: CatalogueMaximality (user-posed question, this
session).

Status: drafts with author self-checks; independent review pending. The local
audit data `data/r45_24/` was only read; no catalogue file was modified.
Machine checks: `python3 scripts/verify_maximality_analogues.py` (stdlib only,
deterministic, 12/12 PASS, ~3 s).

## Question

May the degree-18 fixed-B outer cover — the complemented 352366-graph
Ramsey(4,5,24) census, `fixed_b_extensions.md#claim-fixed-b-outer-cover` — be
restricted to members whose induced B-graph is edge-maximal? B is K5/I4-free
but G[B] need not be maximal; the local audit measured 10421 edge-maximal and
341945 nonmaximal members (`research/reports/2026-10-17-b24-catalogue-filter.json`), so
the filter would cut the outer loop by a factor of about 34.

Answer: no completeness proof is known, and the general reduction principle is
false. In both direct analogues with the identical rooted v+A+B structure and a
complete B-side census, every B-part of every valid graph is non-maximal, so a
maximality-pruned search returns a false nonexistence certificate. Edge-
maximality of B is a WLOG normalization, not a necessary condition; it carries
no pruning authority for a certified order-43 search.

<a id="claim-catalogue-max-01"></a>
## 1. The (3,5)/13 analogue falsifies the reduction

Claim ID: `research/n43/d18/catalogue_edge_maximality.md#claim-catalogue-max-01`
Kind: local-deduction
Review state: draft
Scope: rooted pivot search for K3/I5-free graphs on 13 vertices with pivot
degree 4 (the minimum forced degree); A=N(v) with |A|=4, B=M(v) with |B|=8;
B-side catalogue = all (3,4)-free graphs on 8 vertices
Dependencies: R(3,3)=6, R(3,4)=9, R(3,5)=14 (classical, already external
premises in `fixed_b_extensions.md`); machine check above
Conclusion: every valid 13-vertex (3,5)-graph has e(M(v))=10 and M(v)
non-edge-maximal for every vertex v, although such graphs exist; a v+A+B
search restricted to edge-maximal B therefore finds nothing and would falsely
certify R(3,5)<=13
Search use: none (rejection evidence for the analogous order-43 filter)
Reviews: none

Proof. Let G be K3/I5-free on 13 vertices. Every neighborhood is independent
(triangle-free) with at most 4 vertices (no I5), so d<=4; every antineighborhood
is (3,4)-free (a K3 is inherited; an independent 4-set T in M(u) makes T+{u} an
I5), so |M(u)|<=R(3,4)-1=8 and d>=12-8=4. Hence G is 4-regular, A=N(v) is an
independent 4-set and B=M(v) is an (3,4)-graph on 8 vertices. Each a in A has
neighbors {v} union R_a only, so r_a=3, x=12; each b in B has c_b=4-d_B(b), so
32-2e(B)=x=12 and e(B)=10. This pins e(B) for every choice of pivot.

Now no (3,4)-graph on 8 vertices with 10 edges is edge-maximal. In such a
graph, d<=3 because N(u) is independent and alpha<=3, and d>=2 because the
(non-neighborhood inside B) is (3,3)-free: an independent triple there plus u
is an I4, and R(3,3)=6 caps it at 5 vertices. So the degree sequence is
exactly (3,3,3,3,2,2,2,2) and sum over vertices of C(d,2)=16. In a
triangle-free graph sum over vertex w of C(d(w),2) equals the sum of
common-neighbor counts over non-edges, and there are 28-10=18 non-edges; 16<18
forces a non-edge with no common neighbor, whose addition keeps B triangle-free
(and alpha<=3 is preserved by adding edges). Hence not edge-maximal.

Valid witnesses exist: R(3,5)=14, e.g. the circulant C13(1,5) (verified by
exhaustive 5-subset check), and 48 labeled valid graphs were assembled by the
same row/column gluing. Every one of their 13 pivots gives (|M|=8, e(M)=10,
non-maximal). The only edge-maximal (3,4)-graphs on 8 vertices form the single
e=12 class (Wagner graph), disjoint from the pinned e=10, so the pruned
catalogue meets no admissible B. ∎

<a id="claim-catalogue-max-02"></a>
## 2. The (4,4)/17 diagonal analogue falsifies the reduction

Claim ID: `research/n43/d18/catalogue_edge_maximality.md#claim-catalogue-max-02`
Kind: local-deduction
Review state: draft
Scope: rooted pivot search for K4/I4-free graphs on 17 vertices with pivot
degree 8 (the forced degree); B-side catalogue = all (4,3)-free graphs on
8 vertices
Dependencies: R(3,4)=9, R(4,4)=18; the complete 3-class census of (3,4)-graphs
on 8 vertices (machine-checked above; hand-reproducible)
Conclusion: every valid 17-vertex (4,4)-graph has e(M(v))=e(N(v))+4 in
{14,15,16} and M(v) non-maximal for every vertex v, although such graphs exist;
a maximality-pruned search would falsely certify R(4,4)<=17
Search use: none (rejection evidence)
Reviews: none

Proof. Degree counting as in Claim 1 with R(4,4)=18 and R(3,4)=9 gives
8-regularity, A=(3,4)-free of order 8, B=(4,3)-free of order 8. Row and column
budgets give r_a=7-d_A(a) and c_b=8-d_B(b), so 56-2e(A)=x=64-2e(B) and
e(B)=e(A)+4. The census of (3,4)-graphs on 8 vertices realizes exactly
e(A) in {10,11,12}, so e(M(v)) in {14,15,16} for every pivot of every valid
graph. Complements give all (4,3)-graphs, and the unique K4-saturated one has
e=22, outside {14,15,16}; hence no valid graph has a saturated antineighborhood
at any pivot. Paley-17 is a valid witness (verified; per pivot
(e(A),e(B))=(12,16), not saturated). ∎

<a id="claim-catalogue-max-03"></a>
## 3. Consequence for the order-43 degree-18 fixed-B cover

Claim ID: `research/n43/d18/catalogue_edge_maximality.md#claim-catalogue-max-03`
Kind: design
Review state: draft
Scope: the outer cover `fixed_b_extensions.md#claim-fixed-b-outer-cover` and
any prospective pruning of it; no order-43 branch closure asserted
Dependencies: Claims 1 and 2 above; the measured audit
`research/reports/2026-10-17-b24-catalogue-filter.json`
Conclusion: restricting the 352366-member outer cover to the 10421 edge-maximal
members is an unproven WLOG reduction and must not be used as pruning
authority; completeness would require a transfer theorem ("some extendable B
has an edge-maximal extendable completion"), which fails in both analogues and
has no order-43 proof
Search use: none (rejected as unjustified pruning)
Reviews: none

Argument. The cover itself is necessity-based: B must be (5,4)-free, and the
census premise supplies completeness. Edge-maximality is not necessary: the
interface couples B to the rows and degrees (r_u=d_G(u)-1-s_u,
c_y=d_G(y)-d_B(y), the (E2)-(E4) clique-side conditions tighten as B gains
edges while the independent-set side relaxes, and 18<=d_G<=24 plus the
x-identity x=306-2a+Delta_A budget both sides). Adding an edge inside B can
create a K5 through A-side vertices even when no B-side witness exists, and
repairing by cutting columns is blocked by the degree floors and creates I5
obstructions; conversely Claim 1 shows a valid interface can pin e(B) into a
window containing no maximal graph at all. In the order-43 setting the
measured catalogue makes the coverage loss concrete: the 10421 maximal members
span e(B) in [144,157], while the catalogue holds 905 members with
e(B) in {158,159,160}, all nonmaximal, and the recorded x136 predicate keeps
148<=b<=160. A maximal-only cover would reach zero graphs on the live
b in {158,159,160} region without any lemma excluding it. ∎

## Audit and use limits

Claims 1 and 2 concern the analogue settings only; they do not assert that an
order-43 candidate exists or that every order-43 B-part is non-maximal. They
remove the default justification for the filter: the burden is a proved
transfer, which no current note supplies. The 34x outer-loop saving is real
only under that unproved transfer; necessity-based filters (row domain D_B,
(E)-propagation, capacity systems, symmetry quotients) remain the sound
reductions. No novelty claim; no catalogue, index, or theory-map edit.
