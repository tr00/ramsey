# K3 neighborhood: row-signature cover and exact 360-bit completion

Date: 2026-10-19. Task: `research-d18k3-20261019`. Mathematical research,
not a novelty claim. **Open:** no exclusion and no order-43 construction.
The classification below is an exact parametrization by residual Boolean
systems, not a list of feasible isomorphism classes.

## Setting and dependencies

Let G be K5/I5-free of order43, v a degree18 vertex, and
N(v)=U disjoint-union C, where U=(u1,u2,u3) is K3 and C is a
15-vertex (4,4)-free graph. Set B=M(v), of order24, and f=e(C).
The components have no edges between them. The root v is complete to U,C
and anticomplete to B. Retain actual ordered labels; no orbit quotient.

Recorded premises, not recertified here:

- [Connectivity claims01--03](../neighborhood_connectivity.md): 50<=f<=55,
  R_i=N_B(ui) has size15+e_i, 0<=e_i<=2.
- [Interface bounds](../../reductions.md), sections4.1,5.2,5.4:
  global degrees18..24, each R_i is (4,4)-free,
  |R_i intersect R_j|<=8, and |R_1 intersect R_2 intersect R_3|<=3.
- [Recorded Ramsey and edge premises](../../../README.md): R(3,4)=9,
  R(4,4)=18; (4,4,15) edges50..55, (4,4,16) edges60;
  B is (5,4)-free with edges144..160.

Here e_i denotes excess at ui, not an edge count. Write E_U=sum e_i.
For s in {0,1}^3 put B_s={b in B: adjacency to U is exactly s},
n_s=|B_s|, and n_j=sum_{|s|=j}n_s.

<a id="claim-k3-signature-cover"></a>
## 1. Complete signature-count cover

Claim ID: `n43/d18/k3/reduction.md#claim-k3-signature-cover`  
Kind: local-deduction  
Review state: accepted
Scope: every rooted graph in the setting; count feasibility only  
Dependencies: row and intersection bounds above  
Conclusion: the sorted excess triple is one of 000,001,002,011,111.
The following equations and inequalities give exactly all integer eight-cell
counts satisfying those row/intersection bounds:

- n_s>=0, sum_s n_s=24;
- 15<=sum_s s_i n_s<=17 for i=1,2,3;
- sum_s s_i s_j n_s<=8 for i<j;
- n_111<=3.

There are71 labelled count profiles: respectively25,30,6,9,1 for the five
sorted excess types above. Every profile also satisfies
E_U+n_0+n_3<=3 and n_1=3+n_3-2n_0-E_U.
If all e_i are positive, the unique profile is e=(1,1,1),
n_110=n_101=n_011=8 and all other n_s=0.  
Search use: branch, never terminate from count feasibility  
Reviews: [independent exact-revision audit](review_reduction_20261019.md)

Proof. Inclusion-exclusion on two rows gives
6+e_i+e_j<=|R_i intersect R_j|<=8, so e_i+e_j<=2.
The five sorted triples listed exhaust integers0..2 with these pair bounds.
Let r=sum_i |R_i|=45+E_U and p=sum_{i<j}|R_i intersect R_j|<=24.
Then r-p=n_1+n_2 and 24=n_0+n_1+n_2+n_3, whence
21+E_U+n_0+n_3<=p<=24. This proves the first inequality.
Also r=48-2n_0-n_1+n_3, proving the second identity.
If all e_i>=1, the pair bounds force all equal1; the inequality forces
n_0=n_3=0 and the identity n_1=0. Three pair intersections are then at
least8, hence exactly8, and each is its corresponding double-signature cell.
The finite count71 is a small integer replay of the displayed domain; it is
not used in any mathematical exclusion. Individual row or B graph existence
is not asserted by any scalar profile.

<a id="claim-k3-reroot-cover"></a>
## 2. Strictly denser connected reroot, or balanced blocks

Claim ID: `n43/d18/k3/reduction.md#claim-k3-reroot-cover`  
Kind: local-deduction  
Review state: accepted
Scope: every rooted graph in the setting, without any canonical-root assumption  
Dependencies: claim-k3-signature-cover; recorded (4,4,15) edge lower bound50;
[connectivity threshold](../neighborhood_connectivity.md#claim-connectivity-02)  
Conclusion: either e=(1,1,1) with the unique three-block profile above, or
some ui has degree18 and its neighborhood is connected with at least
65+sum_{j!=i}e_j edges, strictly more than e(N(v))=3+f<=58.
Consequently, if v was selected to maximize neighborhood edges among all
degree18 vertices, only the balanced three-block profile remains.  
Search use: propagate; select a denser degree18 root, not terminate  
Reviews: [independent exact-revision audit](review_reduction_20261019.md)

Proof. If the excess triple is not111, one coordinate e_i is zero.
Then N(ui)={v,u_j,u_k} union R_i. The first three vertices induce a
triangle. The row R_i is a15-vertex (4,4)-free graph and has at least50
edges. The root v has no B-neighbor. For each j!=i, the edges from u_j
to R_i number |R_i intersect R_j|>=6+e_j. Thus

e(N(ui))=3+e(R_i)+|R_i intersect R_j|+|R_i intersect R_k|
         >=65+e_j+e_k.

Its degree is18, so the existing threshold at69 is not alone sufficient.
Instead apply the complete disconnected slices: a disconnected degree18
neighborhood has edge count in[53,58] union{61,68}. If the lower bound is
65, this still leaves68. Connectedness therefore needs the structural argument
below, rather than just a lower-bound threshold.

The vertex v is adjacent to both u_j,u_k. Each vertex of R_i has an
R_i-neighbor connected within that row, since R_i is connected: if a
(4,4)-free graph on15 vertices were disconnected, its component independence
numbers sum at most3. An independence-one component has at most3 vertices;
an independence-two K4-free component has at most8 by R(4,3)=9. The only
possible disconnected independence profiles (1,1),(1,2),(1,1,1) have total
order at most6,11,9, all less than15. Hence R_i is connected. At least six
edges join R_i to each of u_j,u_k. Thus the triangle and the connected row
belong to one component. Strict edge increase follows from65>58.
For a maximizing root, this contradicts its selection. The remaining profile
is exactly111 by claim1. No assumption of maximizing v was used in the
unconditional dichotomy.

<a id="claim-k3-exact-completion"></a>
## 3. Exact labelled completion classification

Claim ID: `n43/d18/k3/reduction.md#claim-k3-exact-completion`  
Kind: local-deduction  
Review state: accepted
Scope: fixed ordered v,U,C,B as above; full branch, not merely maximizing roots  
Dependencies: elementary forbidden homogeneous5-set splitting; claims1--2
only as optional necessary filters  
Conclusion: the following keys and clauses give a disjoint, exhaustive
parametrization of rooted labelled d18k3 graphs by exactly360 remaining
Boolean edge positions X in {0,1}^{15 by24}.  
Search use: branch; terminate only with independently certified coverage and
unsatisfiability of every residual system  
Reviews: [independent exact-revision audit](review_reduction_20261019.md)

### Keys

Choose the actual labelled C graph, actual labelled B graph, and the three
actual subsets R_i of B. Retain precisely keys satisfying:

1. C is (4,4)-free of order15 with50..55 edges.
2. B is (5,4)-free of order24.
3. Each R_i is (4,4)-free, 15<=|R_i|<=17.
4. B[R_i intersect R_j] is triangle-free for every pair i<j.
5. B[R_1 intersect R_2 intersect R_3] is independent.

The row/pair/triple cardinality bounds then follow from these properties
and R(3,4)=9. Keys may also be restricted by the necessary published B edge
interval and any independently established necessary filters. On the
maximizing-root scheme, one may restrict to the balanced profile of claim2,
but this is not a restriction on all arbitrary-root keys.

### Remaining constraints

Let X_cb be adjacency between c in C and b in B; these are the only free
edges. All C-U edges are0. Put D_i=B minus R_i. For internally homogeneous
subsets P subset C and Q subset B, impose:

|Obstruction|Sizes (|P|,|Q|)|Condition on Q|Clause|
|---|---|---|---|
|K5 in C+B|(1,4),(2,3),(3,2)|Q clique|some X in P times Q is0|
|I5 in C+B|(3,2),(2,3)|Q independent|some X in P times Q is1|
|I5 containing ui|(1,3),(2,2),(3,1)|Q independent and Q subset D_i|some X in P times Q is1|

In the first row P is a clique; in the other rows P is independent.
The last row is instantiated for each of the three actual ui; there are
three negative and eleven positive size/anchor templates. No degree
constraints are required for the equivalence on the recorded global Ramsey
premises, but adding derived necessary degree constraints preserves it.

### Proof of equivalence and coverage

The prescribed v-edges give degree18 and N(v)=K3 disjoint C. A K5 containing
v would require K4 inside that neighborhood, impossible. An I5 containing v
would require I4 in B, impossible. A K5 avoiding v and meeting U cannot
meet C because U is anticomplete to C. Such a K5 would have1,2,or3 U
vertices and respectively K4 in one R_i, a triangle in a pair intersection,
or an edge in the triple intersection. The key conditions forbid all three.
A K5 avoiding U and v is either within C or B, already forbidden, or splits
as one of the three mixed types listed, excluded exactly by its negative
rectangle clause.

An I5 contains at most one U vertex. With no U or v, neither C nor B
supplies4 independent vertices, leaving precisely(3,2),(2,3). With ui,
the remaining4 vertices lie in C and D_i. Neither side supplies4 independent
vertices, so their sizes are precisely(1,3),(2,2),(3,1). These are exactly
the positive rectangle clauses. This exhausts every forbidden5-set and
proves both directions, including for a key whose residual system is empty.

Every actual labelled graph uniquely specifies C,B,R_i and X. Different
keys or X change an actual edge, so the cases are disjoint. The three-clique
component is unique since C is connected by the order15 argument in claim2.
No catalogue completeness, special15-core uniqueness, or independent
isomorphism quotient is assumed. This is an exact finite completion
classification; it does not decide which keys admit a completion.

## Explicit residual obstruction and limits

The remaining obstruction is simultaneous realization of the displayed
positive and negative C-by-B rectangle constraints. Row counts, three valid
rows, or even an allowed B graph are not a completion certificate. In
particular, for an independent triple P in C and a b missing ui, the
anchored(3,1) clause requires b to hit P. For an independent triple Q in
D_i, each c must hit Q by the anchored(1,3) clause. These dual obligations
must coexist with every mixed-clique negative rectangle.

No particular order43 graph or universally inconsistent residual key is
claimed. The arbitrary-root branch is reduced to71 count profiles and360
free completion bits per exact key; maximum-edge-root selection reduces its
signature shape to three eight-vertex double-neighbor blocks. This is not
an exclusion of d18k3, d18, or order43.
