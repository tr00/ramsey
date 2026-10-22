# A census-free cross-edge ceiling at a degree-19 pivot

Date: 2026-10-22. Author: /root, working alone.
Task: `large-row-breakthrough-20261022`. All claims are ready for independent
review. This is written research with an arithmetic self-check.

Let G be a simple graph in R(5,5,43), let d_G(v)=19, and put
A=N_G(v), B=M_G(v), so |A|=19 and |B|=23. For u in A write
R_u=N_G(u) intersect B, r_u=|R_u| and s_u=d_A(u). Put x=e(A,B).
No absence of degree-18 vertices, saturation, root maximization or orientation
selection is assumed.

The premises are R(4,5)=25, R(4,4)=18 and R(3,4)=R(4,3)=9, as
recorded in the [baseline](../../docs/mathematical_baseline.md).
The induced types are A: K4/I5-free and B: K5/I4-free. In particular,
A may contain independent four-sets. No edge census is used.

<a id="claim-degree19-row-ceiling"></a>
## Claim 1. Every degree-19 pivot has at most 289 cross edges

Claim ID: research/n43/degree19_row_ceiling.md#claim-degree19-row-ceiling  
Kind: local-deduction  
Review state: ready  
Scope: every G,v above, including graphs with degree-18 vertices  
Dependencies: the three small Ramsey bounds listed above; forbidden homogeneous sets  
Conclusion: x<=289, with the stronger size-17-row table below  
Search use: none pending independent review; proposed propagation  
Reviews: none

Every R_u is K4/I4-free: a K4 there extends with u to K5, and B has no
I4. Therefore r_u<=17. The vertices of A outside u missing u are K4/I4-free,
so s_u>=18-17=1.

An A-edge uw has at most eight common B-neighbors: the common B-cell
is triangle-free and I4-free. Thus

    uw an edge => r_u+r_w-23<=8.

Let T={u:r_u=17}, L={u:r_u=16}, t=|T| and l=|L|. Every pair in
T union L has row-size sum at least 32, exceeding 23+8=31. This set
is independent in A, so t+l<=4. Furthermore T is anticomplete to
every size-15 row. Every A-neighbor of T has row size at most 14.

Define the nonnegative deficit

    D=sum_(u:r_u<=14)(15-r_u).

The exact row sum is

    x=285+2t+l-D.                                          (1)

Let U be the union of the A-neighborhoods of T. It consists entirely of
rows of size at most 14, and hence D>=|U|. When t=1, s_u>=1 gives
|U|>=1. If t=2, the 17 A-vertices outside T missing both members are
K4/I3-free: an independent triple there extends with T to I5. There
are at most eight of them, so |U|>=9. If t=3, the 16 outside vertices
missing T form a clique of size at most three, giving |U|>=13. If
t=4, every one of the 15 outside vertices meets T, giving |U|=15.

Substitute these bounds and l<=4-t into (1):

| t: size-17 rows | Upper bound for l | Lower bound for D | Upper bound for x |
| ---: | ---: | ---: | ---: |
| 0 | 4 | 0 | 289 |
| 1 | 3 | 1 | 289 (improved to 288 below) |
| 2 | 2 | 9 | 282 |
| 3 | 1 | 13 | 279 |
| 4 | 0 | 15 | 278 |

This proves x<=289 without any side-edge extremum. The argument is a
degree-19 extension of the [reviewed degree-18 independent-row method](d18/independent_row_cuts.md);
the thresholds are recomputed for the actual 19+23 partition.

The t=1 line improves further. If l>=1, the independent size-17/size-16
pair has A-neighborhood union of size at least nine. The size-16 vertex
has s<=23-16=7 by the ambient degree cap 24. Therefore the size-17
vertex has s>=2 and D>=2, giving x<=288. If l=0, (1) directly gives
x<=285+2-1=286. In particular every degree-19 root with a size-17 row
has x<=288.

<a id="claim-degree19-endpoint-profiles"></a>
## Claim 2. Equality forces four size-16 rows and fifteen size-15 rows

Claim ID: research/n43/degree19_row_ceiling.md#claim-degree19-endpoint-profiles  
Kind: local-deduction  
Review state: ready  
Scope: Claim 1 with x=289  
Dependencies: Claim 1 and the global degree cap 24  
Conclusion: precisely four rows have size 16 and fifteen have size 15  
Search use: none pending independent review; proposed structural branching  
Reviews: none

The sharpened t=1 bound and the t>=2 table exclude every size-17 row.
At t=0, (1) and l<=4 force l=4 and D=0. Thus there are exactly four
size-16 rows and fifteen size-15 rows, with the four size-16 endpoints
independent. This is a necessary equality condition, not an existence claim
or a refutation of the profile. Degree-19 pivots are not required by the even-pivot
cover, but occur as actual vertices in both d18 and d20 investigations.
Claim 1 may be applied when rerooting at such a vertex; it does not route
all complement orbits to degree 19.

The [dated report](../reports/2026-10-22-large-row-tail.md) records the
arithmetic self-check, hashes and remaining review obligations.
