# Degree-18 avenues: clique budgets, augmentation, and pivot transfer

Date: 2026-10-14. Mathematical work only. The deductions were internally
audited using separate obstruction counts and explicit equality analysis.
No enumeration, solver, installation, download, or novelty review was performed.

Let G be an order-43 (5,5)-free graph, v a degree-18 vertex, A=N(v), B=M(v).
Write a=e(A), x=136+k, q=85-a, and epsilon_z=d_G(z)-18. For y in B,
C_y=N_A(y), c_y=|C_y|, and d_B(y)=18+epsilon_y-c_y.
The census premise a<=85 is recorded in `theory_phase_1.md`.

## 1. Every four-clique in B has degree sum at most 60

This theorem uses only that B is a 24-vertex (5,4)-free graph and
R(3,4)=9. Fix a four-clique Q in B. For z in B-Q put j_z=|N_B(z) intersect Q|.
Since B has no K5, 0<=j_z<=3. Each edge of Q has at most eight common B
neighbors: its common-neighborhood graph is (3,4)-free. Two of those
neighbors are the other Q vertices. Therefore

```
sum_(z in B-Q) C(j_z,2) <=6*(8-2)=36.
```

Put D=sum_z j_z=e_B(Q,B-Q). The pointwise inequality
C(j,2)>=2j-3 for j=0,1,2,3 gives 2D-60<=36. Hence D<=48 and

```
sum_(y in Q) d_B(y)=12+D<=60.
sum_(y in Q) c_y >=12+sum_(y in Q) epsilon_y.
```

This lower anchor incidence bound complements the existing upper bound
e(A,Q)<=48. It is most effective for cliques built from small columns.

### Equality is rigid

If the degree sum is 60, then D=48. All inequalities above are equalities:
every external vertex has j=2 or 3; every edge of Q has exactly eight common
B neighbors; there are eight external vertices with j=3 and twelve with j=2.

An eight-vertex (3,4)-free graph has degrees two or three. Its neighborhoods
are independent and have size at most three; its nonneighbors are (3,3)-free
and have size at most five, proving the degree lower bound two.

Label Q={1,2,3,4}. In the common neighborhood of any Q edge ij, the Q vertex
l other than i,j has internal degree 1 plus the number of external vertices
with exact Q signature {i,j,l}. Therefore every exact triple class has size
at most two. Since there are eight triple-signature vertices in four classes,
each class has size two. For the edge ij, its six external common neighbors
then comprise two triple classes of size two and an exact pair class of size
two. Thus all six exact pair classes also have size two.

Consequently the 20 external vertices comprise two vertices for each of the
ten Q signatures of sizes two and three. Each Q vertex has 12 external
neighbors and internal B degree exactly 15. No internal adjacency between
those external classes is assumed; it must satisfy the remaining Ramsey tests.

### Application to four size-four columns

If r=4 size-four columns exist, they form Q by `n43/d18/x136/small_columns.md`.
Their c sum is 16, so their total excess E_Q is at most four. If E_Q=4,
each d_B(y)=15, hence each epsilon_y=1 and d_G(y)=19. The exact pair/triple
signature classes above are forced. This holds at any x; at x=136 the
additional column budget forces all other 20 columns to have size six.

This does not exclude the r=4 subcase. It removes E_Q>4 and fixes the entire
Q-incidence pattern at its equality endpoint.

## 2. Safe missing edges in an 84-edge neighborhood

For a (4,5)-free A on 18 vertices, call a nonedge safe if adding it creates
no K4. Equivalently its common A neighborhood has no edge. Adding an edge
cannot create an independent five. Thus at a=85 no safe nonedge exists,
by the published extremal upper bound 85.

Suppose a=84. For any two distinct safe nonedges, adding both must create a
K4: otherwise the augmented graph is (4,5)-free with 86 edges. Because each
addition individually is safe, that K4 uses both new edges.

- If the safe edges are disjoint, their four endpoints have all four cross
  edges in A. They induce C4 before the two missing diagonals are added.
- If the safe edges share an endpoint, the other two endpoints are adjacent
  in A (and a fourth vertex completes the K4 after both additions).

Let S be the graph whose edges are all safe nonedges. It has no triangle:
two incident safe edges require their other endpoints to be adjacent in A.
It has no three-edge path on four distinct vertices: the first and last
safe edges are disjoint and require the middle edge to be present in A.
These two conditions imply every nontrivial component of S is a star.

Within each star its leaves form a clique in A. Between distinct components
all endpoints are mutually adjacent in A, by the disjoint-edge rule. Choosing
all leaves, with one endpoint chosen from each single-edge component, yields
a clique in A whose size equals e(S). Since A has no K4,

```
number of safe missing edges <=3.
```

The possible nonempty safe-edge graphs, ignoring isolated vertices, are
K2, P3, K1,3, 2K2, P3 disjoint union K2, and 3K2. These are necessary
patterns, not assertions that all occur in extremal-near graphs.

An 84-edge neighborhood is therefore either already K4-saturated or differs
by one safe edge from an 85-edge (4,5)-free graph, with at most three choices
of that edge. This is a generation/filtering reduction. It does not prove
that every 84-edge graph has an augmentation. It applies to the q=1 cases
at x=138,139 and every higher-x q=1 case, regardless of degree excess.

For general q, any q+1 chosen missing edges must jointly create a K4 if all
are added. Otherwise there would be 86 edges in a (4,5)-free graph. This
gives a precise higher-deficit extension target: control the conflicts among
individually safe additions. The pair classification above is special to q=1.

## 3. Choosing a pivot by neighborhood edge count

In the branch containing at least one degree-18 vertex, it is safe to choose
v maximizing e(G[N(v)]) among degree-18 vertices. An isomorphism or tie rule
is unnecessary for existence coverage if all maximizing roots are allowed.
This choice does not involve complementation and cannot be silently imposed
on an arbitrary fixed root. A finer canonical choice still needs its own proof.

With this extra precondition, every degree-18 vertex u satisfies
e(G[N(u)])<=a. This has concrete interface expressions.

For u in A, put S_u=N_A(u), R_u=N_B(u), s_u=|S_u|. If d_G(u)=18 then
N_G(u)={v} union S_u union R_u, disjointly, and

```
s_u + e_A(S_u) + e_B(R_u) + e(S_u,R_u) <=a.
```

For y in B of global degree 18, put P_y=N_B(y). Since y is not adjacent
to v, its neighborhood is C_y union P_y, and

```
e_A(C_y) + e_B(P_y) + e(C_y,P_y) <=a.
```

These transfer the selected pivot's upper bound to all other degree-18 roots,
coupling the internal graphs and cross matrix. In particular, at q=1 the
upper bound is 84, stronger than the unconditional census upper bound 85.
All four-transversal and anchor lemmas remain valid at the chosen root.

## 4. Priorities and limits

The most concrete new branch is r=4, x=136, E_Q=4: four degree-19 Q vertices,
twenty size-six columns, and two vertices in each Q pair/triple signature
class. Test structural compatibility of these classes mathematically; the
equalities do not presently contradict one another.

A separate route is augmentation of q=1 neighborhoods. The safe-edge theorem
separates already saturated graphs from at most three augmentations to the
extremal order-18 graphs. Characterizing the already saturated part is the
main gap, rather than assuming every near-extremal graph extends.

Pivot transfer is broadly applicable but its strength depends on the actual
interface. It gives a safe extra root-selection condition and exact inequalities,
not a new numerical lower bound on x. None of these results decides order 43.

Audit: clique degrees were counted by cut edges and independently by pair
codegrees; equality was checked for all ten masks. Safe-edge coverage uses
both possible endpoint patterns and a forbidden-path argument. Pivot formulas
include the pivot contribution for A vertices and exclude it for B vertices.
