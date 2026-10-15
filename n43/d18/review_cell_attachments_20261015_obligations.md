# Independent review of anchored-cell attachment rigidity

Date: 2026-10-15.
Author: Codex cell-attachment author.
Reviewer: Codex cell-obligations agent, a distinct collaborating agent.

Claim(s): all three claims in `n43/d18/cell_attachments.md`:
`claim-c5-omission-budget`, `claim-u13-c5-rigidity`, and
`claim-external-independent-demands`.

Reviewed revision: exact uncommitted source SHA-256
`6a8b8981a221ce07dfa41805797ce374ad9996e0b482abf91bde3fbfbaebe743`.
Repository HEAD during review:
`f98a1285b7adc9720a693ae3a54fba212a021bdf`.

Dependencies reviewed: `anchored_cell_averaging.md`, SHA-256
`719fe4120c38550ee80d88cd6d9c48d8703959c46536daecae9ea17519c1a6e3`,
especially the independently accepted cell-type claim;
`cell_intersections.md`, SHA-256
`cc05444b193403ba5ef614ed75f1acfba566afda576e7a3fe473c08aac4144b7`,
whose five claims this reviewer independently accepted in
[the intersection review](review_cell_intersections_20261015_obligations.md).
The established external R(4,3)=9 premise is retained without primary-source
reproof. All attachment algebra and rigidity arguments below were derived
independently of the author's self-audit.

## Checks and findings

All claims retain order-43 K5/I5-free G, the degree-18 pivot, and actual
cells. A is K4/I5-free and may contain I4. B is K5/I4-free, T is
triangle-free/I4-free, and U is K5-free/I3-free. In particular, omission
signatures in S=C5 are cliques; they are never treated as independent
sets. No x or excess restriction is used. Any nonempty S forces the two
anchors to be disjoint, so the absence of an explicit anchor-disjointness
assumption does not impair the statements with S=C5.

For `claim-c5-omission-budget`, I independently count a U vertex's
nonneighbors: they form a clique by no I3, and there are at most four
by no K5. Its degree is therefore at least |U|-5=t. Its neighborhood
has type (4,3), hence degree at most eight. A cycle vertex has exactly
two S neighbors and t-r_s neighbors in Y, so

    t <= 2+t-r_s <= 8.

These two inequalities give r_s<=2 and r_s>=t-6, respectively.
Intersecting with 0<=r_s<=t gives precisely the claimed interval. Summing
over all five cycle vertices gives the lower bound
5*max(0,t-6); the upper bounds M<=10 and M<=2t follow independently
from the vertex omission bound and the signature-size bound.

For y in Y, its U degree is 5-|D_y|+d_Y(y). Substituting the same
degree range [t,8] gives t-5+|D_y|<=d_Y(y)<=3+|D_y|.
The displayed source lower bound t-6+|D_y| is one unit weaker than this
direct lower bound, and is therefore still sound. In detail, the source
writes

    max(0,t-6+|D_y|) <= d_Y(y)
      <= min(t-1,3+|D_y|),

so it is a valid necessary inequality, but its sentence saying
“substitution ... proves the displayed bounds” uses a deliberately weaker
endpoint without saying so. This is not a validity gap or reason to reject;
the directly stronger bound above may be recorded in a later proof revision
with renewed review. For t=0 no y exists, so the apparent upper endpoint
t-1 causes no assertion. For t>=1 all displayed bounds are valid; at t=8
the separate U13 regularity claim recovers the exact degree.

The attachment count is exactly sum_s(t-r_s)=5t-M. A nonedge yy'
with a shared omitted s gives I3 in U, proving disjointness of their
D signatures. An edge yy' and a common Y neighbor w form a triangle.
Their common S-neighborhood is S minus the union of the three D
signatures; an edge in it joins that triangle to give K5. This proves the
pair refinements with the correct universal quantification over common
Y neighbors. The refinements are necessary, without a claimed sufficiency
for constructing U.

For `claim-u13-c5-rigidity`, |U|=13 gives degree interval [8,8],
so every vertex has degree eight. Each s has degree
2+8-r_s, giving r_s=2. The omission sum is therefore ten and the
cross attachment count is 40-10=30. Each y has
d_Y(y)=8-(5-|D_y|)=3+|D_y|, hence
2e(Y)=24+10=34 and e(Y)=17. Independently, U has 52 edges,
S has five, and 52-5-30=17.

I checked the complete-overlap vertices W and the nonadjacent-pair
exclusion in detail. A W vertex has Y degree three. If adjacent W
vertices y,z had common Y neighbor w, w sees at least three cycle
vertices. Some two of those are adjacent because alpha(C5)=2. They
would form K5 with y,z,w. If instead W vertices y,z are nonadjacent,
every other Y vertex must meet at least one of them to avoid I3.
Their two size-three Y neighborhoods are subsets of the six other
vertices, so they partition those six and have no common neighbor.
Thus any pair of W vertices has Y codegree zero. Every vertex of Y
can have at most one W neighbor, including the case that the vertex
itself lies in W. Counting all incidences from W to Y gives 3|W|<=8,
hence |W|<=2.

To exclude two nonadjacent W vertices, denote their disjoint size-three
neighborhoods by L and R. Because y misses R and z misses L, both
L and R must be cliques by U's no-I3 condition. The K4 y union L
must have no common S neighbor, so the three L signatures cover S;
their sizes sum to at least five. The corresponding argument on R
gives another sum at least five. The total signature size in L union R
is already exactly ten, because D_y and D_z are empty. Therefore each
sum is five and every S vertex belongs to exactly one signature within
each triple. Three signatures of size at most two summing to five have
sizes (2,2,1), and the size-two signatures are cycle edges. Choose the
singleton-omitting vertex a and either edge-omitting vertex b in L.
The triangle y,a,b has as common S neighborhood precisely the other
size-two signature in this partition, itself a cycle edge. This is a K5
contradiction. Hence W is a clique, with order at most two.

When |W|=2, the adjacent W vertices each have exactly two further
Y neighbors. Codegree zero makes those four neighbors distinct. The
two other vertices outside W miss both; they must meet each other to
avoid I3 with either W vertex. This confirms every stated structural
consequence. Finally n0+n1+n2=8 and n1+2n2=10 imply

    n2=n0+2, n1=6-2n0.

Combining n0<=2 gives exactly (0,6,2),(1,4,3),(2,2,4).
The table correctly claims necessary arithmetic possibilities, not existence.

For `claim-external-independent-demands`, each outside vertex z has
a U-neighborhood containing no K4 (which would extend with z) and
no I3 (inherited from U), giving order at most eight by R(4,3)=9.
The disjointness hypothesis z outside U prevents self-counting. For a
nonadjacent outside pair p,q, any nonadjacent pair inside their common
U-nonneighborhood would give I4 in B. Thus that common nonneighborhood
K is a clique of order at most four. Inclusion-exclusion then gives
both displayed union and degree-sum inequalities. For an independent
outside triple, any further common U nonneighbor would give I4,
so the three U-neighborhoods cover U.

For p,q in X, their common nonneighbor clique K meets S in exactly
D=S-(N_S(p) union N_S(q)), and meets Y in precisely the vertices
missing both. Thus its Y part is a clique completely joined to D and
has order at most 4-|D|. This proves the named joint-attachment lower
bound |N_Y(p) union N_Y(q)|>=|Y|-4+|D|. In a T8/S5 path
extension, the independently accepted classification gives |D|=2
in A,B and |D|=1 in C,D. With Y8 these lower demands are six
and five. The individual degree cap eight into U yields the stated
Y capacity eight minus the known S-neighbor count. These implications
use ambient B no I4 and U no I3 in their respective places.

Outcome: **accepted**, all three stated mathematical claims at the exact
hash above. No source correction is necessary for validity. There is one
optional sharpening of the medium-size y-degree lower endpoint, as derived
above; recording it would constitute a proof change requiring renewed review.

Permitted use after integration: necessary-condition propagation and local
rejection on the stated actual-cell hypotheses. No universal saturated-cell
occurrence, T8/U13/S5 nonexistence, global x improvement, or branch closure
was proved. The medium-size bounds are necessary and not a complete
classification.

Limits: external R(4,3)=9 was not reproved from primary literature. No graph
enumeration, solver, proof checker, installation, download, novelty review,
construction verification, or certified exhaustive order-43 decision was
performed. Any mathematical source revision requires renewed exact-hash
review.

## Renewed review of the stronger medium-size endpoint

Date: 2026-10-15. Author and reviewer identities are unchanged.
The original exact-hash review above is retained as historical evidence.

Renewed reviewed revision: `cell_attachments.md` SHA-256
`01246b17c14f43a5cc8e879f87c056376b3269c4f5670eeb80acbe82a52bb810`.
I re-read the entire revised file. The only mathematical change from the
prior reviewed source is the medium-size lower endpoint

    max(0,t-6+|D_y|)  ->  max(0,t-5+|D_y|).

For every y in Y, U no I3 makes its nonneighbors a clique of size
at most four, so d_U(y)>=|U|-5=t. The actual partition of its neighbors
gives d_U(y)=5-|D_y|+d_Y(y). Therefore
d_Y(y)>=t-5+|D_y|, intersected with d_Y(y)>=0, as recorded in the
revised claim. The upper endpoint and all other statements are unchanged.
At t=8 this stronger lower endpoint equals the existing upper endpoint
3+|D_y|, independently agreeing with U13 regularity. At t=0 there is
no y in Y and the assertion remains vacuous. All t=1..7 are covered by
the same exact derivation without a saturation assumption.

Outcome at the renewed exact hash: **accepted**, all three claims.
The historical optional-sharpening comment has now been implemented and
fully reviewed; there is no outstanding source correction. All scopes,
dependencies, permitted propagation uses, and limits recorded above remain
in force.
