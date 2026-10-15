# Independent review of the degree-eight anchor and four-transversal exclusion

Date: 2026-10-15.

Author: Codex coordinator `/root`, author and self-auditor of the target note.
Independent reviewer: Codex agent `/root/audit_five_columns`, task token
`audit-five-columns-20261015-independent`. These are distinct agents. The
reviewer did not contribute to or edit the target proof, its dependencies,
shared indexes, or the Git index, and spawned no further agents.

Claim(s):

- [Core caps](five_column_compatibility.md#claim-five-columns-core-caps).
- [Low-degree nontransversality](five_column_compatibility.md#claim-five-columns-low-transversal).
- [Degree-eight anchor](five_column_compatibility.md#claim-five-columns-degree-eight-anchor).
- [No four-set transversal](five_column_compatibility.md#claim-five-columns-no-four-transversal).

Reviewed revision: input HEAD
`7ebbef265ef9b55746b798b337b86e4fd6140045`; exact uncommitted target
`n43/d18/x136/five_column_compatibility.md`, SHA-256
`a688d0b96de80dba90e77b6a0f918aa93754635d8e81e369f93e9b480de9789b`.
Acceptance applies to this exact text. Mathematical changes require renewed
review; metadata integration must preserve this provenance.

Outcome: **accepted for all four claims on the recorded external premises**.
No mathematical gap or requested correction was found. This is independent
mathematical review, not formal verification or an order-43 decision.

## Dependencies and remaining external premises

The reviewer read AGENTS.md, docs/workflow.md, docs/reproducibility.md,
WORK.md, results.md, the order-43 and degree-18 branch READMEs, the x136
README, and the pertinent mathematical dependencies. The following exact
versions were used to rederive the required dependency reasoning:

| File | SHA-256 |
| --- | --- |
| `n43/d18/frontier_band.md` | `0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54` |
| `n43/d18/transversal_four.md` | `4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e` |
| `n43/d18/x136/small_columns.md` | `f542dc5f73640d4d9b9da8790638dfd2d546feed79c5d8633d2ed3155f680733` |
| `n43/d18/x136/r2/low_excess_columns.md` | `e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff` |
| `n43/d18/x136/pairwise_small_refinements.md` | `3900dbde7907b8c08feecb7d8dd7582be491c1bff50b1cfbe23476bd3d6b5c85` |
| `n43/d18/x136/transversal_five_attempt.md` | `2073f1bb0c9390795c352a226f9760ccad6767f709fddf8cc139a769f8727e4c` |
| `n43/d18/pivot_classes.md` | `43d4ff670667705f4f974ef69dfe37a1dc43aa09e7825a2fc7448cff60d76233` |
| `n43/d18/x136/r4/exclusion.md` | `718d7efd114850a86715f2e4d2f28cc8d14bd2084390fc999f1120e6a6b344a0` |
| `docs/mathematical_baseline.md` | `e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e` |
| `n43/reductions.md` | `2c3ed9bb38d20cf9010d8a217d68556c485cd9204702b4540c87a9245c88f41f` |
| `docs/theory_phase_1.md` | `679f3b84f848ac32564538af833fd1b681659417bde55f0bb6262dfb25fc66fd` |

Existing independent low-excess reviews were read as provenance, but the
needed degree-nine assertion was rederived rather than accepted merely from
an existing review label. The attempted isolated transversal theorem and the
older r4 classification are not needed for the new four-claim chain.

Unrecertified external inputs remain:

- `R(4,5)=25`, `R(3,5)=14`, and `R(3,4)=R(4,3)=9`, as recorded in
  [the baseline](../../../docs/mathematical_baseline.md) and dependencies.
- The maximum 85 edges for `(4,5,18)` and maximum 79 for `(4,5,17)`,
  attributed in the project to Angeltveit--McKay, *R(5,5)<=46*,
  arXiv:2409.15709v2, Appendix A, Table 1.
- The maximum 50 edges for `(4,4,14)` and minimum 50 for `(4,4,15)`.
  The latter is explicitly cited in transversal_four.md to McKay--Radziszowski,
  *A New Upper Bound for the Ramsey Number R(5,5)*, Australasian Journal of
  Combinatorics 5 (1992), 13--20, with a later corroborating census table
  cited there. The order-14 range 41..50 is recorded in the project census
  dependencies; only its upper endpoint 50 is required here.
- Turan's theorem for the four-part extremum of a K5-free graph. Its
  application and balanced-part arithmetic were independently checked.

No published census, small Ramsey certificate, external source file, or
completeness computation was recertified. The order-14 minimum 41 and
order-24 census edge bounds occur in contextual dependencies but are not
needed for the target chain. The core bounds for orders 7..13 use no census.

## Setting and dependency applicability

For a hypothetical K5/I5-free graph G on 43 vertices and degree-18 pivot v,
`A=N(v)` is K4/I5-free on 18 vertices, while `B=M(v)` is K5/I4-free on 24
vertices. The I4 prohibition on B is never transferred to A. Every actual
column `C_y=N_G(y) intersect A` meets every independent four-set of A:
otherwise that set with y gives I5.

The global degree floor18 follows from `R(4,5)=25`: an antineighborhood
of order25 is impossible. Thus `E=sum_A(d_G(a)-18)>=0`. The upper census
bound `e(A)<=85` gives, by summing global degrees over A,

```text
136=x=306-2e(A)+E=136+2(85-e(A))+E.
```

Both last summands are nonnegative; equality forces `e(A)=85` and E=0.
Each individual excess is nonnegative, so every A vertex has global
degree18. The exact row identity is therefore `d_B(a)=17-d_A(a)`, and
the handshake identity gives `sum_A d_A=170`. This uses an actual order-43
candidate, without assuming its minimum degree is exactly the pivot degree.

Deleting a vertex of A leaves a `(4,5,17)` graph, so the recorded maximum79
gives `d_A(a)>=85-79=6`. Its A neighborhood is triangle-free and I5-free,
so `R(3,5)=14` gives `d_A(a)<=13`. In particular this is an I5-free
neighborhood argument, not an erroneous I4 prohibition in A.

For an independent four-set I in A, fix a in I. Two nonadjacent vertices
of B with exact I signature {a} would form I5 with `I-{a}`. That signature
class is a clique; four members would form K5 with a, so its size is at
most three. The four singleton classes contribute at most12 columns.
Every other actual column contributes at least two incidences. Consequently
`e(I,B)>=36`, and the row identity gives `sum_I d_A=68-e(I,B)<=32`.
This deduction explicitly requires all 24 actual columns and the frontier
rows; it does not follow from `e(A)=85` alone.

For the existing `tau(I4(A))>=4` dependency, put Q=complement(A), of order18,
68 edges, and independence number at most3. Enlarge any alleged transversal
of size at most three to a three-set S. Then Q-S is `(4,4)`-free on15
vertices and has at least50 edges. For each s in S, its nonneighbors in
Q-S are K4-free and I3-free, hence number at most8 by `R(4,3)=9`.
Each s therefore has at least7 neighbors in Q-S. This gives
`e(Q)>=50+21=71>68`. Complementation identifies K4(Q) transversals with
I4(A) transversals. This proves both the quantifier for abstract sets and
the size-at-most-three exclusion used in Claim02.

For [low-excess Claim01](r2/low_excess_columns.md#claim-r2-low-excess-01),
let T be **any** four-set meeting all I4 of A and K=A-T. Then K is
K4/I4-free on14 vertices, with `e(K)<=50`. For each t in T,
`S_t=N_A(t) intersect K` is triangle-free (A is K4-free) and I4-free
(K is I4-free), so `|S_t|<=8`. Fix a in T. If T-{a} has at most two
edges, then `e(A-a)<=50+3*8+2=76`. If T-{a} is a triangle, every pair
of its attachment sets has independent intersection of size at most3,
since an edge there gives K4 and four independent vertices contradict
I4-freeness of K. Their triple intersection is empty, since a common
vertex with the triangle gives K4. Inclusion-exclusion then bounds the
three attachment sizes by `14+3+3+3=23`, giving
`e(A-a)<=50+23+3=76` again. Thus `d_A(a)=85-e(A-a)>=9` for **each**
a in **every** abstract four-transversal. This reasoning needs neither
an actual B endpoint nor r=2; the file's setting introduces r=2 notation
for later claims but does not narrow this claim. No classification of T
or diamond attachment lemma is required for this lower bound.

## Claim01: core caps and both triple counts

Accepted. For every K4/I4-free H of order m in 7..13, both H and its
complement have triangle-free, I4-free neighborhoods. Applying
`R(3,4)=9` in each graph gives degrees at most8 in each, equivalently
`max(0,m-9)<=d_H(u)<=min(8,m-1)`. The table uses exactly these intervals.
In H language its antineighborhood is K4/I3-free, not necessarily
triangle-free; its **complement** is the needed triangle-free/I4-free graph.

Inside a triangle-free neighborhood of order d, four neighbors of one
vertex are independent. I4-freeness therefore bounds its maximum degree
by3 and its edge count by `floor(3d/2)`. The same argument in complement(H)
uses I4-freeness of complement(H), which follows from K4-freeness of H.
Thus the maximum-degree-three bound is valid in both uses. The other edge
bound is `floor(d*d/4)`: for a triangle-free graph J on d vertices,
each edge pq has `d_J(p)+d_J(q)<=d`; summing and Cauchy-Schwarz give
`4e(J)^2/d<=sum d_J(p)^2<=d*e(J)` when d and e(J) are positive.
The zero cases are immediate. This independently establishes f(d).

In `sum_u d_H(u)(m-1-d_H(u))`, every nonhomogeneous triple contributes
exactly2, and every triangle or independent triple contributes0. Hence

```text
t(H)+i3(H)=C(m,3)-(1/2)sum_u d_H(u)(m-1-d_H(u)).
```

Each triangle is counted exactly3 times among the H neighborhood edges;
each independent triple is counted exactly3 times among the complement
neighborhood edges. Applying f to both gives

```text
3*C(m,3)<=sum_u [f(d_H(u))+f(m-1-d_H(u))
                              +(3/2)d_H(u)(m-1-d_H(u))].
```

In particular i3(H) is retained and upper-bounded; it is never set to zero.
This repairs the omitted-term issue described in the author's provenance.
The exact affine bounds were checked independently at every allowed degree.
The values of `g_m(d)+a*d`, in increasing degree order, are:

| m | Values | c | Resulting rational cap |
| --- | --- | --- | --- |
| 7 | 9,17,24,28,31,31,30 | 31 | 16 |
| 8 | 10,22,30,36,40,42,42,38 | 42 | 21 |
| 9 | 12,23,33,38,42,43,43,38,32 | 43 | 27 |
| 10 | 30,44,56,64,70,74,74,72 | 74 | 95/3 |
| 11 | 48,60,71,77,82,82,81 | 82 | 37 |
| 12 | 68,80,90,96,98,98 | 98 | 43 |
| 13 | 82,91,99,100,100 | 100 | 442/9 |

Every a is positive, so substituting `sum d=2e(H)` has the stated inequality
direction. Taking integer floors gives exactly `16,21,27,31,37,43,49`.
These are sufficient upper bounds; no optimality or classification is claimed.

## Claim02: full cardinality coverage and deletion

Accepted. Assume L is a transversal of size ell<=11 consisting entirely
of degrees at most7. The preceding tau bound rules out ell=0,1,2,3;
the abstract-transversal degree floor9 rules out ell=4. Thus the only
cases requiring a core cap are ell=5..11. The graph H=A-L is K4-free
because A is, and I4-free **because L is a transversal**.

Complement(A[L]) is K5-free because A is I5-free. Turan's theorem bounds
its edges above by the balanced complete four-partite extremum, giving
`e(A[L])>=sum_i C(p_i,2)=b4(ell)`. This is a lower bound on A[L], with
the correct complement orientation. The exact deletion identity counts
internal edges of L twice in `sum_L d_A`, yielding
`e(A-L)=85-sum_L d_A+e(A[L])`. Hence
`e(H)>=85-7*ell+b4(ell)`.

Independent balanced-part calculation gives:

| ell | Balanced part sizes | b4(ell) | Lower e(H) | Core cap |
| --- | --- | --- | --- | --- |
| 5 | 2,1,1,1 | 1 | 51 | 49 |
| 6 | 2,2,1,1 | 2 | 45 | 43 |
| 7 | 2,2,2,1 | 3 | 39 | 37 |
| 8 | 2,2,2,2 | 4 | 33 | 31 |
| 9 | 3,2,2,2 | 6 | 28 | 27 |
| 10 | 3,3,2,2 | 8 | 23 | 21 |
| 11 | 3,3,3,2 | 10 | 18 | 16 |

Every case is a strict contradiction. This checks all cardinalities promised
by Claim02; it assumes neither that L is a column nor that low-degree
vertices have an induced graph of any specified type. Nothing for ell>11
is asserted or needed.

## Claim03: anchor existence and exact signatures

Accepted. For the **full** low-degree set `L={a:d_A(a)<=7}`, the total
170 and upper degree13 give `170<=234-6ell`. If ell>=11 the right side
is at most168, impossible, so ell<=10. Claim02 applies to this exact L
and produces an independent four-set I disjoint from it. Every member has
degree at least8, and the independently rederived actual-interface cap32
forces every one of the four degrees to equal8.

Each anchor vertex has B degree9, hence the anchor has exactly36 cross
incidences. Every column meets it, and each singleton class has capacity3.
For the number n1 of singleton columns,
`36>=48-n1>=36` follows from the incidence lower bound and n1<=12.
Equality forces n1=12 and every remaining signature to have size exactly2:
any larger signature gives positive excess in the incidence sum. Since
four singleton classes each have size at most3 and total12, each has
size3 and is a triangle in B. There are exactly12 pair-signature columns.
Each anchor vertex occurs in exactly its three singleton columns and
six pair signatures, totaling nine neighbors. Repeated pair signatures
are allowed; these are counts of actual B columns, not a claim that
each of the six possible pair types has some fixed multiplicity.

The argument applies before any r or s split and supplies at least one
anchor for each full candidate. It does not assert that the anchor is
unique or canonically selected. Proposed branching must cover all allowed
anchor/signature/completion choices.

## Claim04: every four-transversal and the r1 consequence

Accepted. The forced I from Claim03 contains only degree8 vertices.
Every member of any hypothesized four-set transversal T has degree at
least9 by the unrestricted dependency above. Therefore T is disjoint
from I, contradicting the definition of a transversal. Together with the
already rederived size-at-most-three exclusion, this gives
`tau(I4(A))>=5`. Each actual column is such a transversal, so has size
at least5 and r=0. This excludes r1 and every r>=1 equality interface
without reliance on the existing r2,r3,r4 closures or a profile split.

The residual count range is also applicable: with r=0, total136 and
24 columns of size at least5, the exact budget is
`s=8+H`, where `H=sum_(|C_y|>=6)(|C_y|-6)>=0`. Intersecting size-five
columns have union size at most9, so the pair-union bound forces adjacent
B endpoints. Size-five columns containing a fixed a therefore form a
clique of size at most3, since four with a give K5. Their total incidences
give `5s<=18*3=54`, hence s<=10. Thus s=8..10 is a necessary surviving
range. This does not assert realizability or close r0/x136.

## Reproducible arithmetic check and permitted use

The reviewer separately used existing Python3 standard-library rational
arithmetic, with no graph generation or enumeration. The core and deletion
checks are reproduced by this finite arithmetic script:

```python
from fractions import Fraction as Q
from math import comb

f = lambda d: min(d*d//4, 3*d//2)
rows = [(7,0,6,Q(7,2),31), (8,0,7,Q(4),42),
        (9,0,8,Q(5,2),43), (10,1,8,Q(6),74),
        (11,2,8,Q(11,2),82), (12,3,8,Q(6),98),
        (13,4,8,Q(9,2),100)]
caps = [16,21,27,31,37,43,49]
for (m,lo,hi,a,c), cap in zip(rows,caps):
    for d in range(lo,hi+1):
        g = f(d)+f(m-1-d)+Q(3,2)*d*(m-1-d)
        assert g+a*d <= c
    rational_cap = Q(m*c-3*comb(m,3))/(2*a)
    assert rational_cap.numerator//rational_cap.denominator == cap
for ell, cap in zip(range(5,12),reversed(caps)):
    q,r = divmod(ell,4)
    parts = [q+1]*r+[q]*(4-r)
    b4 = sum(comb(p,2) for p in parts)
    assert 85-7*ell+b4 > cap
assert 234-6*11 == 168 < 170
assert 4*(17-8) == 12+2*12 == 36
assert 17-8-3 == 6
```

All assertions passed. The mathematical reasoning, ambient types,
quantifiers, and full ell coverage were independently checked apart from
this arithmetic script.

Permitted search use after coordinator integration and acceptance of the
recorded premise chain: propagate the stated core caps and low-degree
nontransversality predicates; branch on an unavoidable all-degree-eight
I4 with complete anchor/interface coverage; propagate column size at
least5; terminate exactly the x136/r1 child and, redundantly, all x136/r>=1
interfaces. No isolated 85-edge A theorem, unique-anchor symmetry rule,
x136 closure, whole degree18 closure, or order43 nonexistence is proved.

Limits: no novelty review, formal prover, solver, canonicalizer, graph
enumeration, installation, download, catalogue recertification, graph witness,
or exhaustion certificate. This review does not change any shared index,
claim status, search implementation, or Git index. The coordinator owns
integration and the historical report.
