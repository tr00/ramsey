# Attachment rigidity around actual anchored cells

Date: 2026-10-15. Author: Codex cell-attachment author.

Integration status (2026-10-15): all 3 mathematical claims below have
independent exact-revision acceptance; see [the review](review_cell_attachments_20261015_obligations.md).
The reviewed proof body and its historical author-stage labels are preserved.
This banner resolves their current status: conditional propagation is accepted
on the stated hypotheses; certificate implementation remains a draft design.
Reviewed and integrated hashes are recorded in
[the cell integration manifest](overlapping_cells_manifest.json).
All claims are drafts pending independent exact-revision review. Purely
mathematical deductions; no enumeration, solver, catalogue, download, or
installation. No novelty claim or order-43 branch closure.

## Setting

Let G be an order-43 K5/I5-free graph with degree-18 pivot v. Put A=N(v),
B=M(v), and C_b=N_A(b). A is K4/I5-free and B is K5/I4-free. For an
actual edge Q of A and independent pair P of A define

    T={b in B: Q subset C_b},
    U={b in B: P intersect C_b is empty},
    S=T intersect U, X=T-U, Y=U-T.

The reviewed [cell-type lemma](anchored_cell_averaging.md#claim-cell-types)
makes T (3,4)-free, U (5,3)-free, and S (3,3)-free. Their order caps are
8,13,5 respectively. These notes apply for every x; no frontier, excess,
column-size lower bound, or unavoidable large-cell hypothesis is imposed.

## Medium-size missing-pair cells containing C5

<a id="claim-c5-omission-budget"></a>
Claim ID: `n43/d18/cell_attachments.md#claim-c5-omission-budget`
Kind: local-deduction
Review state: accepted
Scope: any actual U as above with S=C5; t=|Y|, 0<=t<=8
Dependencies: reviewed cell types; R(4,3)=9; elementary degree counts
Conclusion: the omission and attachment constraints below hold simultaneously
Search use: none pending review; proposed use: propagate
Reviews: [review](review_cell_attachments_20261015_obligations.md)

For y in Y set D_y=S-N_B(y). Every D_y is a clique of C5, hence empty,
a singleton, or a cycle edge. Put r_s=|{y in Y:s in D_y}| and
M=sum_y |D_y|=sum_s r_s. Then

    max(0,t-6) <= r_s <= min(2,t),
    5*max(0,t-6) <= M <= min(10,2t),
    e(S,Y)=5t-M.

For every y in Y one also has

    max(0,t-5+|D_y|) <= d_Y(y)
       <= min(t-1,3+|D_y|).

Finally, retaining the actual edge/nonedge status of each Y pair gives
stronger constraints than these counts:

* If yy' is a nonedge, D_y intersect D_y' is empty.
* If yy' is an edge, every Y vertex adjacent to both y,y' has its D
  signature such that S-(D_y union D_y' union D_w) contains no edge.

Proof. Two nonadjacent S vertices omitted by y would make I3 with y,
so D_y is a clique. In any (5,3)-free graph of order m, a vertex has at
most four nonneighbors, because they form a clique. Its neighborhood is
(4,3)-free and has at most eight vertices. Thus m-5<=d_U<=8.
Here m=5+t. A cycle vertex s has degree 2+t-r_s in U, giving
r_s<=2 and r_s>=t-6; the trivial bounds 0<=r_s<=t complete the
first interval. Sum over the five cycle vertices and also use |D_y|<=2.
For y, d_U(y)=5-|D_y|+d_Y(y); substitution in t<=d_U(y)<=8,
followed by the trivial degree interval in Y, proves the displayed bounds.
The handshake identity gives e(S,Y)=sum_s(t-r_s)=5t-M.
If a nonedge yy' omitted the same s, {y,y',s} would be I3. For an edge
yy' and common Y neighbor w, an edge in their common S-neighborhood
would join their triangle to make K5. This proves the pair refinements.

## Size-thirteen rigidity and complete-overlap vertices

<a id="claim-u13-c5-rigidity"></a>
Claim ID: `n43/d18/cell_attachments.md#claim-u13-c5-rigidity`
Kind: local-deduction
Review state: accepted
Scope: actual U of order13 with actual S=C5, Y=U-S of order8
Dependencies: preceding claim; U is (5,3)-free
Conclusion: U is8-regular, e(S,Y)=30, e(Y)=17; the signature profiles
are exactly the three necessary arithmetic possibilities below, and vertices
with empty D signatures form a clique of order at most two
Search use: none pending review; proposed use: propagate
Reviews: [review](review_cell_attachments_20261015_obligations.md)

Every vertex of U has degree eight by 13-5<=d_U<=8. Therefore

    r_s=2 for each s in S,
    sum_y |D_y|=10,
    d_Y(y)=3+|D_y|,
    e(S,Y)=30, e(Y)=17.

Write n_i=|{y in Y:|D_y|=i}|, i=0,1,2. The necessary profiles are

| n0 | n1 | n2 |
| --- | --- | --- |
| 0 | 6 | 2 |
| 1 | 4 | 3 |
| 2 | 2 | 4 |

These are necessary arithmetic profiles, not assertions of realizability.
Let W={y in Y:D_y is empty}. Its vertices are pairwise adjacent, and
any two of them have no common neighbor in Y. In particular, when |W|=2
their four other Y-neighbors are distinct; the remaining two Y vertices
are nonadjacent to both W vertices and must be adjacent to each other.

Proof. Regularity and the preceding equations give the counts immediately;
for example 2e(Y)=sum_y(3+|D_y|)=24+10=34. First show that any two
W vertices have no common Y neighbor. If adjacent, a common Y neighbor
w sees 5-|D_w|>=3 vertices in C5, which contain an edge since C5 has
independence number two. That edge together with the triangle of Y
vertices gives K5. If two W vertices y,z are nonadjacent, their Y degrees
are three. U has no I3, so their neighborhoods must cover the six other
Y vertices; they are consequently disjoint. This also forbids a common
Y neighbor. Thus every Y vertex has at most one W neighbor. Counting
incidences between W and Y gives 3|W|<=8, hence |W|<=2.

It remains to exclude two nonadjacent W vertices y,z. As just proved,
their other Y vertices split into L=N_Y(y) and R=N_Y(z), each of order
three, with y missing R and z missing L. Since U has no I3, each of L,R
is a clique. The four-set {y} union L is a K4; if the three D signatures
in L failed to cover S, a common S neighbor would make K5. Therefore
sum_(a in L)|D_a|>=5; likewise the sum over R is at least five. Their
total is ten, so both sums are exactly five, and both covers are disjoint
partitions of S. Each consists of two cycle edges and a singleton because
the individual sizes are at most two and there are three signatures.
Take in L its singleton-omitting vertex a and either edge-omitting vertex b.
The common S-neighborhood of the triangle {y,a,b} is exactly the other
cycle edge in the partition. This yields K5, a contradiction. Hence W
is a clique. If |W|=2, each vertex has Y degree three including the other
W vertex, and their remaining neighborhoods are disjoint. Of the six
vertices outside W, precisely four meet W and two miss both; the two
common nonneighbors must be adjacent since U has no I3. This proves all
stated structure. Solving n0+n1+n2=8 and n1+2n2=10 with n0<=2 gives
the table.

## External independent sets impose joint attachment demands

<a id="claim-external-independent-demands"></a>
Claim ID: `n43/d18/cell_attachments.md#claim-external-independent-demands`
Kind: local-deduction
Review state: accepted
Scope: any actual T,U; vertices Z subset B-U independent in B, |Z|=1,2,3
Dependencies: B is K5/I4-free; U has no I3; R(4,3)=9
Conclusion: the union, clique, and capacity constraints below
Search use: none pending review; proposed use: propagate
Reviews: [review](review_cell_attachments_20261015_obligations.md)

For z outside U, |N_U(z)|<=8: this neighborhood is (4,3)-free. For a
nonadjacent outside pair p,q, define

    K=U-(N_U(p) union N_U(q)).

Then K is a clique of order at most four, and therefore

    |N_U(p) union N_U(q)| >= |U|-4,
    |N_U(p)|+|N_U(q)| >= |U|-4
                                  +|N_U(p) intersect N_U(q)|.

For an independent outside triple p,q,r one has

    N_U(p) union N_U(q) union N_U(r)=U.

With S=T intersect U and nonadjacent p,q in X=T-U, set
D=S-(N_S(p) union N_S(q)). Then K intersect S=D; hence the Y vertices
missing both p,q form a clique completely joined to D and number at most
4-|D|. Equivalently,

    |N_Y(p) union N_Y(q)| >= |Y|-4+|D|.

Proof. A K4 in N_U(z) joins z to make K5; an I3 is already prohibited
inside U. R(4,3)=9 gives its order cap. An independent pair in K would
join p,q to make I4 in B, so K is a clique, and K5-freeness bounds its
order by four. The union bound and inclusion-exclusion give both inequalities.
For the triple, a vertex of U outside all three neighborhoods would make
I4 together with p,q,r. The final statement splits the same clique K into
its S and Y portions; a clique meets S exactly in the displayed D. Its
total order is at most four. No ambient constraint is moved onto A.

For a conditional T of order eight with S=C5, the independently authored
[path classification](cell_intersections.md#claim-c5-edge-cell-extensions)
makes X=P3. Its nonadjacent endpoints have |D|=2 in patterns A,B and
|D|=1 in patterns C,D. When also |U|=13, they must collectively meet
at least six Y vertices in A,B and at least five in C,D. The endpoints'
individual Y capacities are at most 8-|N_S(p)| and 8-|N_S(q)|.
These are simultaneous named-vertex constraints; neither scalar cell cap
alone records them. The path classification remains a draft dependency
until independently reviewed.

## Self-audit and limits

The author checked the lower degree bound by common-nonneighbor cliques
and the upper bound by neighborhoods of type (4,3). The two independent
calculations of e(Y) are 52-5-30=17 (U is8-regular on13 vertices) and
(24+10)/2=17. Omission sets are **cliques**, not independent sets; two
omitted nonadjacent S vertices would violate U's I3 prohibition. An early
informal message used the wrong word and was explicitly corrected before
this file was written. The endpoint table excludes n0=3 by incidence and
excludes a nonadjacent n0=2 pair by the separate clique-partition argument;
it does not exclude the adjacent n0=2 profile.

For t=0 the medium-size equations give M=0; for t=8 they specialize to
the exact U13 counts. The external-set arguments use ambient B noI4,
whereas the signature arguments use U noI3. Vertex sets outside U are
disjoint from U by hypothesis, so no vertex is counted in its own
neighborhood or used twice in a forbidden set.

No saturated cell or cycle overlap is proved unavoidable. These are local
necessary filters across all x, with additional medium-size inequalities
through t=1..7. The note does not exclude T8/U13/S5, prove any global
cross-count improvement, characterize an entire Ramsey candidate, or
replace certified exhaustive coverage. Independent review is required
before pruning use.
