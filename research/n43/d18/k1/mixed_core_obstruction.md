# Mixed-core triangle budgets in the k1 branch

<!-- k1-whole-branch-integration:start -->
Integration status (2026-10-19): all five claims are independently **accepted**
by [Main's review](review_mixed_core_obstruction_20261019_main.md), distinct
from author MixedCoreTheory, at SHA-256
`2e1ed67b761847d9b8cc0432c2ef928e0365022262de88c875776d9c005a329d`.
The author-stage body below is unchanged; ready labels are historical.
Permitted use: propagate the mixed moment inequalities and 91<=r<=182,
never full K1 termination. No novelty or formal certificate is claimed.
<!-- k1-whole-branch-integration:end -->

This note gives necessary conditions for **every** C-D completion in the
accepted k1 setting. In particular it contracts the previously recorded
cross-edge interval to

\[
91\le r=e(C,D)\le182.
\]

It does not exclude the branch. No uniqueness of a critical seventeen-vertex
core, catalogue completeness, graph search, or novelty claim is used. The
proofs below have not received independent review.

Write \(\tau_H(S)\) for the number of triangles in \(H[S]\), and
\(\iota_H(S)\) for its number of independent triples. For either core, omit
its subscript when unambiguous. Put
\(m_d=|N_C(d)|\), \(n_c=|N_D(c)|\),
\(p=\sum_{t\in T}|N_C(t)|\), and
\(q=\sum_{t\in T}|N_D(t)|\).

The accepted inputs are:

- `research.json`, `claim-k1-double-core`: the rooted partition, both
  K4/I4-free seventeen-vertex cores, and both K5/I4-free twenty-four-vertex
  sides.
- `cross_core.json`, `critical-core-srg`: each core is
  SRG(17,8,3,4), without a uniqueness assertion.
- `cross_core.json`, `strict-seven-signature-budget`: every T vertex has
  at least nine neighbors in each core, and \(p,q\ge64\).
- The recorded elementary Ramsey input \(R(3,3)=6\).

All claims below are local deductions from those inputs. They do not depend
on any other new manuscript in this work session.

<a id="claim-core-pair-triple-duality"></a>
## Pair-triple duality and two forbidden induced templates

Claim ID: `research/n43/d18/k1/mixed_core_obstruction.md#claim-core-pair-triple-duality`

Kind: local-deduction  
Review state: ready  
Scope: every K4/I4-free SRG(17,8,3,4) core H  
Dependencies: `cross_core.json`, `critical-core-srg`  
Conclusion: edges of H are in bijection with its independent triples by
common neighborhoods; nonedges are in bijection with its triangles by
common nonneighborhoods. H contains neither an induced 3K2 nor an induced
seven-vertex graph with seven edges and at least two triangles.  
Search use: propagate  
Reviews: none

### Proof

There are 68 edges, 68 nonedges, 68 triangles, and 68 independent triples.
Indeed each edge has three common neighbors and hence lies in three
triangles, so the triangle count is \(68\cdot3/3=68\). The complement is
also SRG(17,8,3,4), proving the independent-triple count.

For an independent triple I, its union of neighborhoods is all fourteen
vertices outside I: a vertex outside that union would extend I to I4.
Inclusion-exclusion, using degree eight and nonedge codegree four, gives

\[
14=3\cdot8-3\cdot4+|\bigcap_{x\in I}N_H(x)|.
\]

Thus I has exactly two common neighbors. Every edge has an independent
triple of common neighbors, since an edge in that triple would give K4.
The map from edges to these triples is injective: the two common neighbors
of its image are exactly the original endpoints. Its domain and target
both have size 68, so it is a bijection. In particular the two common
neighbors of **every** independent triple form an edge. Complementing gives
the second bijection: every triangle has exactly two common nonneighbors,
and these two vertices are nonadjacent.

Suppose six vertices induce 3K2. Each of the other eleven vertices must be
adjacent to both ends of at least one of its three edges. Otherwise one
can choose a nonneighbor from each of those edges, giving an independent
triple which, together with the outside vertex, is I4. The three edges have
only \(3\cdot3=9\) common-neighbor incidences in total, and no such common
neighbor is among the six vertices of 3K2. They cannot cover eleven
outside vertices. This excludes induced 3K2.

For the seven-vertex assertion, suppose there are two triangles and only
seven edges. Consider their intersection.

1. **They share an edge.** Their union is a diamond on four vertices,
   using five edges. Its one missing internal edge cannot be added, since
   that gives K4. Let R be the other three vertices, so the remaining two
   edges are internal to R or join R to the diamond.
   - If both are internal to R, an independent pair of R together with
     the diamond's nonadjacent pair is I4.
   - If exactly one is internal to R, R is an edge plus an isolated
     vertex. If the one joining edge meets an endpoint of that edge, its
     other endpoint and the isolated vertex both miss the diamond,
     producing I4 with the diamond's nonadjacent pair. If the joining
     edge meets the isolated vertex, the edge of R is anticomplete to
     the other five vertices.
   - If neither is internal to R, R is independent and some diamond
     vertex misses all of R, again giving I4.
   The anticomplete edge in the middle case is also impossible: an edge
   of H has exactly four common nonneighbors, not five. This follows
   directly from the two endpoint degrees and their codegree three.
2. **They share exactly one vertex.** Their union is a bowtie on five
   vertices and six edges. If the seventh edge joins the other two
   vertices, that edge has five common nonneighbors. If it is internal
   to the bowtie, the other two vertices are isolated and an independent
   pair of the bowtie gives I4. If it joins an outside vertex to the
   bowtie, choose an independent pair in the bowtie avoiding that one
   neighbor; this is always possible by choosing one noncentral vertex
   from each triangle. This pair and the two outside vertices give I4.
3. **They are disjoint.** Their union uses six edges on six vertices.
   Unless the seventh edge joins the two triangles, either triangle has
   at least three common nonneighbors, contrary to the preceding
   duality. If the edge does join them, one triangle still has two
   adjacent common nonneighbors in the other triangle, again contrary
   to the duality.

All possibilities are excluded. ∎

<a id="claim-uniform-core-triangle-envelope"></a>
## A uniform induced-triangle envelope

Claim ID: `research/n43/d18/k1/mixed_core_obstruction.md#claim-uniform-core-triangle-envelope`

Kind: local-deduction  
Review state: ready  
Scope: every subset S of either core H; s=|S|  
Dependencies: `cross_core.json`, `critical-core-srg`;
[the pair-triple lemma](#claim-core-pair-triple-duality)  
Conclusion: \(\tau_H(S)\ge f(s)\), where the following table defines f;
in particular \(\tau_H(S)\ge\max(0,4s-36,6s-58)\).  
Search use: propagate  
Reviews: none

| s | 0 through 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| f(s) | 0 | 4 | 8 | 14 | 23 | 32 | 44 | 56 | 68 |

### Proof

Every vertex of H belongs to twelve triangles and every edge to three.
Put W=V(H)\S, w=|W|, and e=e(H[W]). Inclusion-exclusion on the triangles
meeting W gives the exact identity

\[
\tau(S)=68-12w+3e-\tau(W).                 \tag{1}
\]

Also \(\tau(W)\le e\), since every edge of H belongs to only three
triangles.

We first record elementary small-graph estimates used when w=7. A K4-free
graph with respectively six, seven, eight, or nine edges has at most
respectively two, three, four, or five triangles.

For six edges, discard isolated vertices. If minimum degree were at least
three, there would be at most four vertices, necessarily K4, a
contradiction. Remove a vertex of degree at most two; it destroys at most
one triangle. The remaining graph has at most four edges when the degree
is two, hence at most one triangle; degree one is even easier, since two
triangles already need five edges. This proves the six-edge bound.
The seven-edge bound follows in the same way: minimum degree at least
three again permits at most four vertices, and removal of a degree-two
vertex leaves at most five edges and two triangles. For eight edges,
a low-degree vertex reduces to the six- or seven-edge bound. Otherwise
there are five vertices with degrees 4,3,3,3,3. The degree-four vertex is
universal, and its other four vertices induce C4; there are four
triangles. For nine edges, a low-degree vertex reduces to seven or eight
edges. Otherwise there are at most six vertices. On six vertices the
graph is cubic, and a vertex belongs to at most two triangles because its
three neighbors are triangle-free; thus there are at most four triangles.
On five vertices, every four-set contains at most two triangles, so
double-counting gives at most five triangles. Fewer vertices give no
larger bound. All these arguments apply also when fewer than the stated
number of edges remain.

**s=10, w=7.** The core adjacency matrix satisfies
\(A^2=4I-A+4J\). Its least eigenvalue is
\(\theta=(-1-\sqrt{17})/2\), since on the orthogonal complement of the
all-one vector its eigenvalues solve \(x^2+x-4=0\). Decomposing the
indicator of W into its constant and orthogonal parts gives

\[
e\ge\frac{8w^2+\theta w(17-w)}{34}
 =\frac{357-35\sqrt{17}}{34}>6.
\]

The last strict inequality is equivalent to
\(153>35\sqrt{17}\), which follows on squaring. Hence e is at least
seven. If e=7, the preceding claim gives \(\tau(W)\le1\), so (1) is at
least four. If e=8 or 9, the small-graph bounds give respectively at
least four or six. If e is at least ten, \(\tau(W)\le e\) gives at
least \(-16+2e\ge4\).

**s=11, w=6.** Since H has no I4, an induced six-vertex subgraph with at
most three edges would have to be 3K2: otherwise the at most three edges
have a vertex cover of size at most two, leaving I4. The preceding claim
excludes 3K2, so e is at least four. If e=4 and W contains a triangle,
its fourth edge either lies among the other three vertices, giving three
common nonneighbors of the triangle, or joins the triangle to one of
those vertices, leaving I4. Thus e=4 implies \(\tau(W)=0\), and (1)
is eight. If e=5 there are at most two triangles: two sharing an edge
already use five edges, and any third needs an additional edge; triangles
not sharing an edge use at least six. Thus (1) is at least nine. If
\(e\ge6\), the bound \(\tau(W)\le e\) gives at least
\(-4+2e\ge8\).

**s=12, w=5.** There must be at least two edges, or W contains I4.
Two edges give no triangle and hence (1) gives fourteen. Three edges give
at most one triangle and hence at least sixteen; four or more edges give
at least \(8+2e\ge16\).

**s=13, w=4.** There is at least one edge. The quantity
\(3e-\tau(W)\) is at least three: this is exact when e=1, and follows
from \(\tau(W)\le e\) when e is larger. Equation (1) gives at least
23. For w=3,2,1,0, equation (1) gives respectively at least 32,44,56,68.
For s at most nine the asserted lower bound is merely nonnegativity.
The two affine inequalities follow by direct comparison with the table.
∎

<a id="claim-attachment-triangle-load"></a>
## Every T attachment consumes a substantial triangle budget

Claim ID: `research/n43/d18/k1/mixed_core_obstruction.md#claim-attachment-triangle-load`

Kind: local-deduction  
Review state: ready  
Scope: H is either core and t is any T vertex in the accepted k1 setting;
S=N_H(t), s=|S|  
Dependencies: accepted twenty-four-vertex side validity and s>=9;
[the triangle envelope](#claim-uniform-core-triangle-envelope)  
Conclusion: \(\tau_H(N_H(t))\ge |N_H(t)|+3\).
Consequently the seven C attachments consume at least p+21 triangles,
and the seven D attachments at least q+21.  
Search use: propagate  
Reviews: none

### Proof

Let W=H\S and F be the complement of H[W]. The valid twenty-four-vertex
side implies H[W] has no independent triple, so F is triangle-free. F
also has no I4, since H is K4-free. Thus \(\Delta(F)\le3\). Write
\(d_x=d_F(x)\), \(e_F=e(F)\), and w=|W|. Counting triples of F by
inclusion-exclusion gives

\[
\tau_H(W)=\iota_F(V(F))
 =\binom w3-(w-2)e_F+\sum_x\binom{d_x}{2},
\]

because F has no triangle. Substituting
\(e(H[W])=\binom w2-e_F\) into (1) gives

\[
\tau_H(S)=B(w)+(w-5)e_F-\sum_x\binom{d_x}{2},
\quad
B(w)=68-12w+3\binom w2-\binom w3.       \tag{2}
\]

If w=8, every F degree is two or three. The upper bound is already
proved. For the lower bound, the nonneighbors of any vertex induce a
K3/I3-free graph, of size at most five by R(3,3)=6. Thus the degree is
at least two. Formula (2) becomes
\(\tau_H(S)=24-e_F\ge12=s+3\).

If w=7, the same argument gives degrees one, two, or three. Formula (2)
is \(12+n_1+n_2\), where n_i counts degree-i vertices. Not all seven
degrees can be three, by parity, so this is at least thirteen, again s+3.

If w=6, F cannot have nine edges: a cubic triangle-free graph on six
vertices is K3,3. To see this, the three neighbors of a vertex are
independent; each must join both of the two remaining vertices to have
degree three. But then H[W] is two anticomplete triangles, impossible
because a core triangle has only two common nonneighbors. Hence
\(e_F\le8\). For degrees at most three,
\(\sum_x\binom{d_x}{2}\le2e_F\). If \(e_F\le7\), equation (2)
gives at least \(21-e_F\ge14\). If e_F=8, equality in that last degree
inequality would require every degree to be zero or three, impossible
with total degree sixteen. Thus the sum is at most fifteen, and (2)
again gives at least fourteen, equal to s+3.

If w=5, triangle-freeness gives \(e_F\le6\) by the elementary bipartite
Turan bound. The same degree inequality gives
\(\tau_H(S)=28-\sum_x\binom{d_x}{2}\ge16\ge s+3\).
Finally, if w is at most four, S contains a thirteen-set. The triangle
envelope gives at least 23 triangles, more than s+3 for s at most
seventeen. This exhausts w=0 through 8. Summing over the seven T vertices
proves the conclusion. ∎

<a id="claim-mixed-triangle-moment-obstruction"></a>
## Mixed moments and the universal cross-edge contraction

Claim ID: `research/n43/d18/k1/mixed_core_obstruction.md#claim-mixed-triangle-moment-obstruction`

Kind: local-deduction  
Review state: ready  
Scope: every full K5/I5-free rooted k1 graph, with arbitrary permitted
cores, T graph, attachments, and C-D matrix  
Dependencies: accepted rooted decomposition and p,q>=64;
[the triangle envelope](#claim-uniform-core-triangle-envelope);
[the attachment triangle load](#claim-attachment-triangle-load)  
Conclusion: all four displayed moment inequalities, their affine
consequences, and 91<=r<=182 are necessary.  
Search use: propagate, never terminate  
Reviews: none

### Statement

With f defined in the table above,

\[
\begin{aligned}
\sum_{d\in D}f(m_d)+p+21&\le204,&
\sum_{c\in C}f(n_c)+q+21&\le204,\\
\sum_{d\in D}f(17-m_d)&\le204,&
\sum_{c\in C}f(17-n_c)&\le204.           \tag{3}
\end{aligned}
\]

In particular,

\[
\begin{aligned}
4r+p&\le795,&4r+q&\le795,\\
6r+p&\le1169,&6r+q&\le1169,\\
r&\ge91.                               \tag{4}
\end{aligned}
\]

Since p,q>=64, these imply r<=182. Equivalently, if
\(b=\max(p,q)\), then the potentially stronger upper bound is

\[
r\le\min\left(
\left\lfloor\frac{795-b}{4}\right\rfloor,
\left\lfloor\frac{1169-b}{6}\right\rfloor
\right).
\]

For example r=182 requires both p and q to be at most 67. These are
necessary conditions, not feasible constructions.

### Proof

For a triangle J of C, its full common-neighbor set in G consists of the
root v, its common D neighbors, and its common T neighbors. There are no
common C neighbors, since C is K4-free, and u misses C. That full set is
independent, since an edge in it together with J gives K5. It has size at
most four, since G has no I5. Consequently

\[
|\bigcap_{c\in J}N_D(c)|+
|\bigcap_{c\in J}N_T(c)|\le3.           \tag{5}
\]

Summing over all 68 triangles J counts each triangle in N_C(d) once for
each d, and each triangle in N_C(t) once for each t. Thus

\[
\sum_{d\in D}\tau_C(N_C(d))+
\sum_{t\in T}\tau_C(N_C(t))\le204.      \tag{6}
\]

Unlike the separate old bounds on common D and common T neighborhoods,
(5) and (6) make those two populations compete for the **same** capacity.
The triangle envelope and attachment load give the first inequality of
(3). Interchanging C,D gives the second.

For an independent triple I of C, the D vertices missing all of I form
a clique: a nonedge among them would produce I5 with I. This clique has
size at most three, since D has no K4. Summing over the 68 independent
triples gives

\[
\sum_{d\in D}\iota_C(C\setminus N_C(d))\le204.
\]

The complement of C is another K4/I4-free SRG(17,8,3,4), so the triangle
envelope applied in that complement gives the third inequality in (3).
Interchanging C,D gives the fourth.

The affine bounds on f give

\[
\sum_{d\in D} f(m_d)\ge4r-17\cdot36=4r-612
\]

and also \(\sum_d f(m_d)\ge6r-17\cdot58=6r-986\).
Substitution into (3) proves both p inequalities in (4), and symmetry
proves both q inequalities. The complementary affine bound gives

\[
6(289-r)-986\le204,
\]

or \(6r\ge544\); integrality gives r>=91. Finally
\(4r+64\le795\) gives r<=182. ∎

<a id="claim-mixed-score-limit"></a>
## Limits: a combined homogeneous-triple floor does not close the branch

Claim ID: `research/n43/d18/k1/mixed_core_obstruction.md#claim-mixed-score-limit`

Kind: local-deduction  
Review state: ready  
Scope: every accepted core H and any vertex x in it  
Dependencies: `cross_core.json`, `critical-core-srg`  
Conclusion: for the fixed subset S=N_H(x),
\(\tau_H(S)+\iota_H(H\setminus S)=12\).
Thus no universal lower bound of twenty for this score can be used to
contradict the combined budgets merely by summing over seventeen columns.  
Search use: none  
Reviews: none

### Proof and residual problem

The neighborhood S is triangle-free, or x extends its triangle to K4.
Let E be the eight core nonneighbors of x. Every y in E has four
neighbors in S by nonedge codegree four, so it has four neighbors in E.
Thus e(H[E])=16 and E has twelve nonedges. E itself has no independent
triple, since one together with x would be I4. The independent triples
in \(H\setminus S=\{x\}\cup E\) are therefore exactly x plus a
nonedge of E, and there are twelve. This is a fixed-template identity in
every core, not a graph scan or an ambient construction. ∎

The necessary interval 91..182 and the four moment constraints do not
assert that any C-D matrix realizes them, and do not exclude every matrix
that does. In particular they do not replace the exact eleven mixed
obstruction families in `research.json`, `claim-k1-exact-partition`.
Completing the k1 task still requires either a genuine simultaneous
contradiction for all surviving two-core attachment systems or a full
ambient construction. No closure, acceptance, or realizability claim is
made here.
