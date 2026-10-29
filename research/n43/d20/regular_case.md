# The 20-regular order-43 case

**Scope:** simple graphs G on 43 vertices, with no K5 or independent
five-set, and d_G(w)=20 for every vertex w. Complementation gives the
equivalent 22-regular case. No saturation, transitivity, strong regularity,
or neighborhood-maximization assumption is made.

**Author:** /root. **Kind:** mathematical exclusion attempt and necessary
structural deductions. **Review state:** ready for independent review;
the validation below is an author's self-check. **Search use:** none pending
review. **Outcome:** the entire regular case remains open. The small-overlap
restrictions below are not a complete exclusion.

**Dependencies:** R(3,4)=9, R(3,5)=14, and R(4,4)=18; the published edge maxima
E(4,5,20)=100 and E(4,5,22)=114, from Angeltveit--McKay,
[*R(5,5) <= 46*](https://arxiv.org/abs/2409.15709v2), Appendix A,
Table 1; the published (4,4) edge intervals 50..55, 60..60, and 68..68
at orders 15, 16, and 17, recorded in the [root table](../../../README.md).
The identification of 17-cores uses the accepted
[Paley-17 classification](../../foundations/paley17_uniqueness.md).
Only the strengthened five-vertex conclusion in Section 3 uses the accepted
[eight-signature packing theorem](../../../docs/paley17_arithmetic.md#claim-paley-eight-packing).
These existing premises are not recertified by the present validation.

Every vertex has 87..100 neighborhood edges. Adjacent pairs of codegree
2, 3, or 4 have endpoint neighborhood edge counts at most 87, 89, or 95,
respectively. Nonadjacent pairs of codegree 3 or 4 force endpoint counts
93..95 or 90..97. Codegree two on an edge forces the exact two-core
configuration in Section 3. Section 5 states the remaining complete
extension problem and a feasible scalar profile that prevents mistaking
these necessary conditions for a contradiction.

<a id="regular-budgets"></a>
## 1. Exact budgets at every vertex

For v in V(G), put

    A=N(v), B=V(G)-({v} union A), F=complement G[B],
    a_v=e(G[A]), b_v=e(G[B]), x_v=e(A,B), f_v=e(F).

Then |A|=20, |B|=22, and A,F are both (4,5)-free. Degree summation gives

    2a_v+x_v=380,       2b_v+x_v=440,
    b_v=a_v+30,         f_v=201-a_v,
    e(G)=430.                                                   (1)

The two published maxima imply, at **every** vertex,

    87 <= a_v <= 100,
    117 <= b_v <= 130,
    101 <= f_v <= 114,
    x_v=380-2a_v in {180,182,...,206}.                            (2)

In particular, the general d20 corridor 160..290 is much wider than the
regular corridor. The lower a_v bound uses the maximum on the *complement*
of the antineighborhood: f_v<=114 gives a_v>=201-114=87.

For distinct vertices let q_uv=|N(u) intersect N(v)|. At each root,

    sum_(u in A) q_uv=2a_v,
    sum_(u in B) q_uv=x_v,
    sum_(u != v) q_uv=380.                                      (3)

Thus every vertex has a nonneighbor of codegree at most nine. If a_v>=92,
it has one of codegree at most eight, because x_v<=196<22*9.

Let T and I count triangles and independent triples in G. Then

    sum_v a_v=3T,
    1247 <= T <= 1433,
    T+I=2881,
    sum_(uv nonedge) q_uv=8170-3T.                              (4)

For the third identity, every nonhomogeneous triple contributes exactly
two to sum_v d(v)(42-d(v))=43*20*22; subtract half that sum from
binom(43,3). The last identity subtracts the edge contribution 3T from
sum_v binom(20,2)=8170. These are global counting restrictions, not a
proof that the endpoint values occur.

<a id="regular-pair-bounds"></a>
## 2. Pair identities and small-overlap restrictions

For distinct roots v,u, let gamma be one if vu is an edge and zero otherwise.
Partition the other vertices as

    S=N(v) intersect N(u),             q=|S|,
    H=N(v)-({u} union S),
    D=N(u)-({v} union S),
    Z=V(G)-({v,u} union S union H union D).

The sizes are

    |H|=|D|=20-gamma-q,       |Z|=q+1+2gamma.                    (5)

Both H and D are (4,4)-free: a clique four-set extends with its adjacent
root, and an independent four-set with its nonadjacent root. In particular,
q>=2 for an edge and q>=3 for a nonedge. The usual common-cell bounds
also give q<=13 for an edge and q<=12 for a nonedge.

Write h=e(H), d=e(D), delta=e(S), and j=e(S,Z). Counting the degrees of
S and the edges in the two root neighborhoods gives the exact identity

    a_v+a_u = h+d+(18+2gamma)q-j.                               (6)

Indeed, if p=e(S,H) and r=e(S,D), then
20q=2q+2delta+p+r+j, while
a_v+a_u=2gamma*q+2delta+h+d+p+r. Substitution proves (6).

Each vertex of S has at most eight neighbors in H, and likewise in D.
Its neighborhood there is triangle-free, or a triangle with that vertex
and v makes K5; it is I4-free because H is I4-free. Apply R(3,4)=9.
Consequently, if U(k) bounds the edges in a (4,4)-free k-vertex graph,

    a_v,a_u <= gamma*q + U(20-gamma-q) + 8q + delta.             (7)

For an edge, S is triangle-free, so delta<=floor(q^2/4). For a nonedge,
S is K4-free; at q=3,4 this gives delta<=3,5.

There is a useful reverse bound for a nonedge. The graph F=complement G[B]
at v splits as {u}, D, Z. Vertex u is adjacent in F to all q+1 vertices
of Z and to none of D. Hence F[Z] is triangle-free. Every z in Z has at
most eight F-neighbors in D, by the same (3,4) argument in F. If L(k) is
a lower edge bound on a (4,4)-free graph of order k=20-q, then

    f_v <= binom(k,2)-L(k) + 9(q+1) + floor((q+1)^2/4).          (8)

Use a_v=201-f_v, and interchange the roots for a_u. Equations (7)--(8)
and (2) give the following bounds for **both** endpoints:

| Root relation | q | Order of H,D | Required a_v and a_u |
| --- | ---: | ---: | --- |
| edge | 2 | 17 | exactly 87 |
| edge | 3 | 16 | 87..89 |
| edge | 4 | 15 | 87..95 |
| nonedge | 3 | 17 | 93..95 |
| nonedge | 4 | 16 | 90..97 |

For example, a nonedge with q=3 gives f_v<=68+36+4=108, hence a_v>=93;
the other direction gives a_v<=68+24+3=95. A nonedge with q=4 gives
f_v<=60+45+6=111 and a_v<=60+32+5=97.

At a root with a_v>=90, every adjacent overlap is at least four. At a
root with a_v>=96, every adjacent overlap is at least five. At a root
with a_v>=98, every nonadjacent overlap is at least five as well. These
are restrictions on actual roots, without a root-selection assumption.

<a id="regular-edge-two"></a>
## 3. Exact structure forced by an edge of codegree two

Suppose vu is an edge and q=2. The two 17-vertex cores H,D are Paley-17,
with 68 edges each. Equation (7) is

    a_v <= 2+68+16+delta <= 87.

Together with (2), equality holds throughout. Thus S={s,t} is an edge,
each of s,t has exactly eight neighbors in each core, and a_v=a_u=87.
The set {v,u,s,t} is a K4. Each of s,t already has three neighbors in
this K4 and sixteen in the cores, so has exactly one neighbor in Z.
In particular,

    |Z|=5,             e(S,Z)=2.                               (9)

Each of the four edges vs,vt,us,ut has codegree exactly ten: its common
neighbors are the other two vertices of the K4 and the eight neighbors
of the S endpoint in the appropriate core.

The packing premise sharpens this further. Work first in G[D union Z],
which is the (5,4)-free antineighborhood of v. For z in Z let
W_z=D-N_D(z). The accepted Paley packing theorem says:

* |W_z|<=8;
* at most four W_z have size eight;
* if four have size eight, every other W_z has size at most six.

It follows that sum_Z |W_z|<=38. With at most three eights the bound is
3*8+2*7=38; with four it is 4*8+6=38. Thus e(D,Z)>=85-38=47.
The same reasoning in the antineighborhood of u gives e(H,Z)>=47.

Put z=e(G[Z]). Counting the degrees in Z, using (9), gives

    100=2z+e(H,Z)+e(D,Z)+2 >= 2z+96,

so z<=2. On the other hand G[Z] is I4-free, since Z is contained in
either antineighborhood. A graph on five vertices with at most one
edge has an independent four-set; a graph with two intersecting edges
also has an independent four-set. Therefore

    G[Z] = 2K2 disjoint union K1,
    e(H,Z)=e(D,Z)=47.                                          (10)

On **each** core the sorted omission-size profile is consequently one of

    (8,8,8,8,6),       (8,8,8,7,7).                             (11)

Finally, summing degrees over H yields

    340 = 136 + 17 + 16 + 47 + e(H,D),
    e(H,D)=124.                                                (12)

The terms are internal degree sum, edges to v, to S, to Z, and to D.
The same calculation on D agrees. As a separate check, the full edge count is

    1+4+34+136+1+32+2+2+94+124=430.

The terms count vu, root-S edges, root-core edges, internal core edges,
the S edge, S-core edges, S-Z edges, Z edges, Z-core edges, and H-D edges.

This is a conditional structural reduction. It does not exclude either
profile in (11), or the required joint cross matrix between the cores.

<a id="regular-nonedge-three"></a>
## 4. Further structure at a nonedge of codegree three

Suppose vu is a nonedge and q=3. Again H,D are Paley-17, while |Z|=4.
Section 2 gives a_v,a_u in 93..95. Since

    a_v=68+delta+e(S,H),           e(S,H)<=24,

delta>=1: S contains an edge. More precisely,

    25-delta <= e(S,H),e(S,D) <=24,
    a_v,a_u <=92+delta,
    e(S,Z)=190-a_v-a_u in {0,1,2,3,4}.                          (13)

Thus delta=1 forces a_v=a_u=93, e(S,H)=e(S,D)=24, and e(S,Z)=4.
Here S is an edge and an isolated vertex. Its two edge endpoints have
one neighbor each in Z, and its isolated vertex has two: this follows
by subtracting the two roots, sixteen core neighbors, and the S degree
from twenty. For delta=2 the endpoint counts are 93..94; for delta=3
they are 93..95. None of these three possibilities is excluded here.

<a id="regular-remaining-completion"></a>
## 5. What a full exclusion still has to prove

There is a complete fixed-side formulation. Take **every** labelled
(4,5)-free graph A of order 20 and F of order 22 with

    87<=e(A)<=100,             e(A)+e(F)=201,

and let B=complement F. A 20-regular rooted completion is equivalent
to a 20-by-22 Boolean matrix X satisfying all the following conditions:

1. For each a in A, its row sum is 19-d_A(a).
2. For each b in B, its column sum is d_F(b)-1.
3. For i+j=5, a clique i-set in A and a clique j-set in B may not
   induce an all-one rectangle. Only (i,j)=(1,4),(2,3),(3,2) need be checked.
4. For i+j=5, an independent i-set in A and an independent j-set in B
   may not induce an all-zero rectangle. Only (i,j)=(2,3),(3,2),(4,1)
   need be checked.

To prove sufficiency, add v joined exactly to A. The first two conditions
give all degrees twenty. A forbidden five-set containing v would already
violate the prescribed side types. One avoiding v either lies in a side,
where it is excluded, or violates one of the listed rectangles. Necessity
follows by the same cases in reverse. This proof imposes no unproved
saturation or symmetry restriction.

The side degree sums agree precisely because e(A)+e(F)=201:

    sum_A (19-d_A)=380-2e(A)=2e(F)-22=sum_B(d_F-1).

The unknown matrix has 440 entries. Its side families and mixed rectangle
constraints have not been exhausted. Merely satisfying the degree sums is
far weaker. For example, the following scalar data pass (1)--(3) and all
the displayed individual small-overlap bounds:

    a=90, b=120, f=111, x=200;
    twenty A degrees 9, hence twenty row sums 10;
    twenty column sums 9 and two column sums 10;
    corresponding F degrees: twenty 10s and two 11s.

This is an arithmetic witness to the limitations of the stated scalar
tests, **not** a graph or a compatible pair of Ramsey sides.

The existing [strongly regular exclusion](../../../docs/theory_phase_1.md#8-strongly-regular-branch-is-impossible)
does not close this gap: regularity alone does not make adjacent-pair or
nonadjacent-pair codegrees constant. Saturation can change degrees, and
the [switching criteria](../seidel_switching.md#claim-switch-regular-dichotomy)
do not assert that every regular input has a preserving switch. Neither
operation supplies a missing coverage argument here.

## Validation and review limits

Run the standard-library self-check from the repository root:

```sh
python research/n43/d20/verify_regular_case.py
```

It checks the generalized regular degree and pair identities on every
labelled regular graph through order six; checks the side/rectangle criterion
against direct homogeneous-five-set detection on every labelled graph of
order six; and checks the numerical bounds and five-signature profile
arithmetic. These finite checks exercise the identities and logical encoding.
They are not an order-43 search, a new Paley packing certificate, or independent
mathematical review. No solver, installation, or external download is used.

All checks passed: 199 regular graphs, 1,145 root identity checks, 2,776 pair
identity checks, and 32,768 six-vertex completion checks. All six mixed
obstruction types were exercised. The five-signature arithmetic leaves
exactly the two profiles in (11).

Independent review: pending. The two-core completions and the remaining
larger-overlap cases are unresolved, so the 20-regular branch stays open.

## Changelog

* Specialized all-root degree sums to the 87..100 neighborhood corridor;
  derived two-sided small-overlap bounds, the exact codegree-two frame,
  and the codegree-three nonedge restrictions. Recorded the full remaining
  fixed-side completion criterion and finite author validation without
  claiming a regular-case exclusion.
