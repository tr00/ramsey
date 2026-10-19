<!-- averaging-tail-integration:start -->
Integration status (2026-10-18): all four claims independently accepted at
reviewed-body SHA-256 `d5e0f9319228d562e886c03e7017001a6d23e3e4c4a07dda01d2879efd4a983e`.
See the [exact-revision audit](review_tail_zero_one_20261018_audit.md).
The reviewed body is preserved verbatim; ready labels below are historical.
Permitted use: the stated conditional row-profile bounds, termination of
t=0,x>=279 and t=1,s=8,x>=272, and residual attachment propagation.
The upper bounds are census-free; the residual inequality (10) retains
the published b>=144 premise. The all-profile bound remains279.
No novelty, endpoint realization or formal exhaustion claim is made.
<!-- averaging-tail-integration:end -->

# Zero or one size-17 root: omission and attachment cuts

Date: 2026-10-18. Author: TailZeroOne. Theory-only research continuation of
[the averaging agenda](averaging_future_work.md). Every claim below is ready
for independent review, not accepted. Search use is **none pending review**;
proposed uses are stated separately. No novelty, realizability, branch closure,
or computational exhaustion claim is made. No solver, graph generation,
download, installation, or theorem prover was used.

## Ambient setting and reviewed inputs

G is an order-43 K5/I5-free graph, v has degree 18, A=N(v) has order 18,
and B=M(v) has order 24. Thus A is K4/I5-free, whereas B is K5/I4-free.
In particular, A is not assumed I4-free. Put

```text
R_a=N_B(a), r_a=|R_a|, W_a=B-R_a, x=sum_(a in A) r_a,
epsilon_a=d_G(a)-18, d_A(a)+r_a=17+epsilon_a, 0<=epsilon_a<=6.
```

The global degree interval 18<=d_G(w)<=24 uses the recorded R(4,5)=25.
The reviewed [independent-row cuts](independent_row_cuts.md), Claims
`claim-independent-row-combined-pairs` and `claim-independent-row-tail-counts`,
give r_a<=17 and the following facts. Let U=L17, L=L16, t=|U|, s=|L|,
and Z=A-(U union L). Then U is independent, is anticomplete to L, and

```text
s<=12-3t, 7t+8s<=72,
delta_z=15-r_z>=0 (z in Z), D=sum_Z delta_z,
x=270+2t+s-D.
```

Only t=0 and t=1 are considered here. At y in B set

```text
k_y=|{u in U:y in W_u}|, m_y=|{l in L:y in W_l}|,
J_y={a in U union L:y in W_a}, q_y=3-k_y-m_y.
```

J_y is independent, |J_y|<=3, q_y is a nonnegative integer, and

```text
Q=sum_(y in B) q_y=72-7t-8s.
```

Call y a triple column when q_y=0. The term refers only to these high-root
omissions, not to the full column C_y=N_A(y). Every such J_y is an actual
independent triple anticomplete to y.

Other reviewed inputs are the 17-core 8-regularity and the triangle-free
I4-free order-eight classification in
[large-row extensions](large_row_extensions.md), Claims
`claim-seventeen-codegree-moments`, `claim-seventeen-extension-domain`, and
`claim-common-eight-classification`. In particular the last classification
gives at least ten edges on such an eight-set. Their integration headers and
linked exact-revision audits record independent acceptance. The elementary
inputs are R(4,4)=18 and R(3,4)=R(4,3)=9. The published b=e(B)>=144 premise
is used only in the final residual-profile numerical restrictions, not in the
new t=0 or t=1 upper bounds.

<a id="claim-zero-one-omission-budget"></a>
## 1. Actual triple omissions require A-edge capacity

Claim ID: `n43/d18/tail_zero_one.md#claim-zero-one-omission-budget`  
Kind: local-deduction  
Review state: accepted  
Scope: the ambient setting, t in {0,1}, every z in Z  
Dependencies: reviewed high-root omission independence and adjacent-row intersection bound  
Conclusion: inequalities (1)--(3) below  
Search use: none pending review; proposed propagate  
Reviews: [independent audit](review_tail_zero_one_20261018_audit.md)

If a,b are adjacent A vertices, their common B-neighborhood is K3/I4-free,
hence has order at most eight. Taking complements inside the actual B gives

```text
|W_a intersect W_b| <= 32-r_a-r_b.                       (1)
```

Indeed |R_a intersect R_b|=r_a+r_b-24+|W_a intersect W_b|.
For z in Z this makes the capacity of an edge zl, l in L, at most
1+delta_z omitted columns, and that of an edge zu, u in U, at most delta_z.
In particular a size-15 row adjacent to a size-17 row has disjoint omitted
sets; no size-17 neighbor can discharge its triple-omission obligations.

Let T_z be the number of triple columns in W_z. For each such y, z has an
A-neighbor in J_y: otherwise J_y union {z,y} is I5 in G. Count actual
witness pairs (an edge from z to a high root, a commonly omitted y).
Every obligation has a witness, possibly more than one, while (1) bounds
the number witnessed by each edge. Thus

```text
T_z <= (1+delta_z)d_L(z)+delta_z*d_U(z).                  (2)
```

There are at most Q nontriple columns, since each contributes at least one
to sum q_y. Also |W_z|=9+delta_z. Consequently

```text
T_z >= max(0,9+delta_z-Q).                              (3)
```

This is an inequality, not an assumption of distinct witnesses: overcounting
witnesses only strengthens the upper count. All capacities concern actual
omission intersections. Finally d_A(z)=2+delta_z+epsilon_z<=8+delta_z.

<a id="claim-zero-seventeen-bound"></a>
## 2. With no size-17 root, x<=278; nine size-16 roots give x<=270

Claim ID: `n43/d18/tail_zero_one.md#claim-zero-seventeen-bound`  
Kind: local-deduction  
Review state: accepted  
Scope: the ambient setting with t=0  
Dependencies: preceding claim; reviewed s<=9 and row-count identity  
Conclusion: s=9 implies D>=9 and x<=270; otherwise x<=278  
Search use: none pending review; proposed propagate and terminate t=0,x>=279  
Reviews: [independent audit](review_tail_zero_one_20261018_audit.md)

The reviewed count gives s<=9. If s=9, Q=0, so every B vertex is a triple
column. Suppose a z in Z had delta_z=0. Equations (2)--(3) would give
9<=d_L(z), whereas d_A(z)<=8. This is impossible. Thus all nine vertices
of Z have positive integral delta_z, giving D>=9 and

```text
x=270+9-D<=270.
```

If s<=8, x=270+s-D<=278 instead. This covers every t=0 profile, without a
census premise. In particular x=279 would force s=9,D=0 and is excluded.
At the new conditional endpoint x=278 the only profile not excluded here is
s=8,D=0, namely eight size-16 rows and ten size-15 rows. This is a residual
profile, not an existence assertion. No bound below 278 is proved for it.

<a id="claim-one-seventeen-eight-sixteen"></a>
## 3. With one size-17 root and eight size-16 roots, x<=271

Claim ID: `n43/d18/tail_zero_one.md#claim-one-seventeen-eight-sixteen`  
Kind: local-deduction  
Review state: accepted  
Scope: the ambient setting with t=1,s=8  
Dependencies: Claim 1; reviewed common-eight classification; row-count identity  
Conclusion: D>=9 and x<=271; hence x=279,t=1 requires s=7,D=0  
Search use: none pending review; proposed propagate and terminate t=1,s=8,x>=272  
Reviews: [independent audit](review_tail_zero_one_20261018_audit.md)

Here |Z|=9 and Q=1. Since d_U(z)<=1, (2)--(3) give, for every z in Z,

```text
8+delta_z <= (1+delta_z)d_L(z)+delta_z*d_U(z),
d_L(z) >= ceil(8/(1+delta_z)) >= 8-4delta_z.             (4)
```

The second bound is exact at delta_z=0,1; for delta_z>=2 its right side
is nonpositive and the inequality is immediate. Therefore

```text
e_A(Z,L)>=72-4D.                                       (5)
```

Suppose D<=8. Among nine nonnegative integer delta_z, at least one, say
z0, is zero. Equation (4) makes z0 complete to all eight vertices of L.
Since A has no K4, A[L] has no triangle. Since the size-17 root u is
anticomplete to L, A[L] also has no I4, or adjoining u would give I5.
Thus the reviewed common-eight result applies to A[L] itself (its hypotheses
are just triangle-free/I4-free, not a required location in B), and e_A(L)>=10.
Every l in L has d_A(l)=1+epsilon_l<=7, and has no neighbor u, so

```text
e_A(Z,L)=sum_(l in L)d_A(l)-2e_A(L)<=56-20=36.
```

But (5) gives e_A(Z,L)>=72-4*8=40, a contradiction. Therefore D>=9 and
x=270+2+8-D<=271.

The reviewed count gives s<=8 when t=1. For s<=7 the trivial identity gives
x<=279. Thus t=1 still has the conditional upper bound 279, now without
needing the b>=144 premise. At x=279, s-D=7: the complete numerical list
before this claim is (s,D)=(7,0),(8,1). The second is now excluded. The exact
remaining profile is one size-17 row, seven size-16 rows, and ten size-15
rows. The next section gives restrictions on this residual, not an exclusion.

<a id="claim-one-seventeen-residual-attachments"></a>
## 4. Explicit restrictions on the remaining t=1,x=279 profile

Claim ID: `n43/d18/tail_zero_one.md#claim-one-seventeen-residual-attachments`  
Kind: local-deduction  
Review state: accepted  
Scope: t=1,s=7,D=0, x=279, with unique size-17 root u  
Dependencies: preceding coverage; R(4,3)=9; reviewed 17-core regularity and extension domain; global degree cap; b>=144 only for (10)  
Conclusion: constraints (6)--(10) and the h=1 specialization below  
Search use: none pending review; proposed propagate, not terminate  
Reviews: [independent audit](review_tail_zero_one_20261018_audit.md)

Write H=R_u, W=B-H, so |H|=17, |W|=7, and B[H] is 8-regular. The ten
members of Z all have row size 15. Set

```text
S=N_A(u), h=|S|=epsilon_u<=6,
F=A-({u} union S), M=sum_(y in W)m_y,
a=sum_(z in Z)|W_z intersect W|,
f=e_B(H,W), e=e_B(W), b=e(B).
```

As u is anticomplete to L, S is a subset of Z. The induced graph A[F] is
K4/I4-free: an I4 in F would extend with u to I5. A vertex p of F has at
most eight nonneighbors within F, by R(4,3)=9 applied to that antineighborhood
(which is K4/I3-free). Since |F|=17-h, it follows that d_F(p)>=8-h.
For each l in L, d_A(l)<=7 and l has no neighbor u. Hence

```text
d_S(l)<=h-1,  e_A(S,L)<=7(h-1),  1<=h<=6.               (6)
```

The lower bound h>=1 follows already from d_F(l)>=8-h and d_A(l)<=7;
it does not assume a particular classification of the possible F.

On W one has k_y=1 and m_y<=2; on H one has k_y=0 and m_y<=3. Since
the seven size-16 roots omit 56 columns in total,

```text
sum_(y in H)(3-m_y)=51-(56-M)=M-5,
5<=M<=14.                                              (7)
```

Every z in S is adjacent to u and has r_z=15, so (1) says W_z intersect W
is empty. Its nine omitted columns all lie in H. At most M-5 of H's columns
are nontriple, by (7). Thus at least 14-M of those nine omissions are triple
columns. Each needs an L neighbor, since u is present at every H column;
each edge zL witnesses at most one of them. Summing over S and using (6)
gives

```text
h(14-M)<=e_A(S,L)<=7(h-1),
M>=ceil(7+7/h).                                        (8)
```

In particular h=1 forces M=14; h=2 forces M>=11; h=3 forces M>=10;
and h=4,5,6 force M>=9. These are actual attachment restrictions, not merely
the earlier total high-omission count Q=9. Also A[S] is triangle-free, since
u is complete to S and A has no K4. For each z in S, B[R_z intersect H]
is a triangle-free I4-free eight-set and z is complete to W, so the reviewed
common-eight types and the exact 17-core attachment restrictions apply to
these h eight-sets simultaneously. No mutual incompatibility is assumed.

For completeness retain the available global B-degree restrictions. There
are 68 edges in H, and every W vertex has at least nine H neighbors by the
reviewed 17-core extension argument, so f>=63. Also e>=5: the complement
of B[W] is K4-free, and Turan's bound on seven vertices gives at most
floor(7^2/3)=16 edges, leaving at least 21-16=5 edges of B[W]. Exact counting
gives

```text
b=68+f+e,
sum_(y in W)|C_y|=7*7-M+10*7-a=119-M-a,
sum_(y in H)|C_y|=279-(119-M-a)=160+M+a.
```

Summing d_G(y)<=24 separately on W and H yields respectively

```text
f+2e-M-a<=49,   f+M+a<=112,
0<=a<=7(10-h),  f>=63, e>=5.                            (9)
```

The upper bound on a uses that all h members of S omit no W vertex, while
each other Z vertex can omit at most all seven W vertices. Finally the
retained published b>=144 premise gives f+e>=76 and hence

```text
a+M >= f+2e-49 >=27+e >=32.                            (10)
```

These inequalities do not by themselves contradict the remaining profile.
For example h=2,M=11,a=24,f=72,e=5 satisfies every scalar inequality
(6)--(10), the ranges in (7), and b=145. This is only a tiny scalar
consistency witness, not a graph or an attachment construction: all actual
intersection, Ramsey, degree, and ambient completion requirements remain.

If h=1, one can sharpen the signature conclusion without asserting
nonexistence. Let S={z0}. Equation (6) gives e_A(S,L)=0. Equation (8) forces
M=14, so every W column has m_y=2. The nine omissions W_z0 all lie in H
and must all be nontriple, since z0 has no L neighbor. By (7) the total
H-deficit is exactly nine. Therefore these are precisely the nine nontriple
H columns, each has m_y=2, and the other eight H columns all have m_y=3.
Thus R_z0 intersect H is exactly that eight-set of triple columns. In A[F]
each L vertex has degree exactly seven, has no neighbor z0, and has total
A-degree seven, hence epsilon_l=6. These conditions retain, rather than
remove, all other edges of F and the simultaneous B-attachment obligations.

## Coverage, failed shortcuts, and proposed use

The new census-free conditional conclusions are:

| Hypothesis | Proved upper bound | Exact endpoint status here |
| --- | --- | --- |
| t=0 | x<=278 | x=278 leaves only s=8,D=0 |
| t=0,s=9 | x<=270 | No realization asserted |
| t=1,s=8 | x<=271 | No realization asserted |
| t=1 | x<=279 | x=279 leaves only s=7,D=0, subject to Section 4 |

No t>=2 profile is considered. In particular this note does not improve the
reviewed all-profile bound x<=279; the surviving t=1 profile is not excluded,
and nothing is asserted about the other t families.

Two tempting shortcuts are invalid. First, Q=9 in the remaining t=1,s=7
case only guarantees at least fifteen triple columns. A size-15 row omits
nine columns, so (3) can be zero; it does not force nine witnessed omissions.
Second, one may not discard the size-17 neighbor's capacity for a deficient
row: its edge capacity is delta_z, not zero. Inequality (4) retains that
capacity before eliminating it using d_U(z)<=1. Nor may the triangle-free
property of A[L] be asserted uniformly: Section 3 proves it from an actual
zero-deficit root complete to L, which is why that argument first assumes
D<=8. The scalar witness after (10) rules out declaring a contradiction from
those displayed aggregate inequalities alone, without claiming they are a
complete feasibility system.

Independent review must precede any accepted status or pruning use. Suggested
post-review use is conditional row-profile propagation and the stated t=0
termination, with the residual attachment conditions propagated rather than
used to close the branch. Existing reviewed proofs and indexes are unchanged.
