<!-- averaging-tail-integration:start -->
Integration status (2026-10-18): all three claims independently accepted at
reviewed-body SHA-256 `8b01927b165167b108b6ae0b4829a7688a4ba2ec61b80e50bcbc2f0f099e45b9`.
See the [renewed exact-revision audit](review_averaging_omission_cuts_20261018_audit.md#addendum--renewed-review-after-the-premise-declaration-fixes).
Its endpoint-cover dependency gate is discharged by the independent
[zero/one-root audit](review_tail_zero_one_20261018_audit.md) and
[two/three-root audit](review_tail_two_three_20261018_audit.md).
The reviewed body is preserved verbatim; ready labels below are historical.
Permitted use: actual omission-supply/capacity propagation and the stated
three-profile endpoint cover. Sections 1--2 are census-free; Section 3
retains its declared published B/A edge premises. All three endpoint
profiles remain unresolved, and the all-profile bound remains279.
No solver, engine filter, formal exhaustion or novelty claim is implied.
<!-- averaging-tail-integration:end -->

# Omitted-row obligations from high-row averaging

Date: 2026-10-18. Author: Main. Theory-only continuation of
[the averaging agenda](averaging_future_work.md). No novelty claim, graph
search, solver, catalogue processing, installation or theorem prover.

## Setting

G is K5/I5-free on 43 vertices, v has degree 18, A=N(v) has order 18,
and B=M(v) has order 24. A is K4/I5-free and may contain I4; B is
K5/I4-free. Write R_u=N_B(u), O_u=B-R_u, r_u=|R_u|, and
`epsilon_u=d_G(u)-18`. Recorded smaller Ramsey bounds give

```text
0<=epsilon_u<=6,  r_u<=17,  d_A(u)=17+epsilon_u-r_u<=23-r_u.
```

These are the setting and premises of the reviewed
[independent-row cuts](independent_row_cuts.md). No claim requires small q,
small excess or the reported x136 closure. Sections 1--2 use no census edge
bound. Section 3 retains the published e(B)>=144 premise behind x<=279
and its one-deficit exclusion; its q/E interval additionally uses e(A)>=50.
Let H17={u:r_u=17}, H16={u:r_u=16}, H=H17 union H16,
`t=|H17|`, `s=|H16|`, and Z=A-H. For z in Z put delta_z=15-r_z>=0.
Thus, with D=sum_Z delta_z,

```text
x=270+2t+s-D.
```

<a id="claim-omission-triple-supply"></a>
## 1. A scalar deficit guarantees actual independent triples

Claim ID: `n43/d18/averaging_omission_cuts.md#claim-omission-triple-supply`
Kind: local-deduction
Review state: accepted
Scope: every G,v in the setting; every actual y in B
Dependencies: R(3,4)=9; ambient K5/I5 prohibitions
Conclusion: the high-row omission sets below are independent of order at
most three; their deficit controls the number of nonsaturated columns
Search use: none pending independent review; proposed propagate
Reviews: [independent audit](review_averaging_omission_cuts_20261018_audit.md)

For y in B define J_y={h in H:y in O_h}, j_y=|J_y|,
S={y:j_y=3}, and U=B-S. Then

```text
J_y is independent in A,  j_y<=3,
Delta:=72-7t-8s=sum_(y in B)(3-j_y)>=0,
|U|<=Delta,  |S|>=max(0,24-Delta).
```

Proof. If distinct p,q in J_y were adjacent, their common row would be
triangle-free: a triangle in B[R_p intersect R_q] joins the edge pq to
make K5. It is also I4-free because it lies in B. R(3,4)=9 bounds its
order by eight. But both rows omit y, so
`|R_p intersect R_q|>=r_p+r_q-23>=9`, a contradiction.
Thus J_y is independent. Adjoining y to four members would give I5,
so j_y<=3. Every 17-row omits seven B vertices and every 16-row omits
eight. Double counting gives sum j_y=7t+8s and the displayed deficit
identity. Each y in U contributes at least one to this deficit.
In particular Delta=0 means that every B vertex supplies a specified
independent high-root triple; it is not an assumed anchor cover.

<a id="claim-omission-attachment-capacity"></a>
## 2. Actual triple demand versus attachment capacity

Claim ID: `n43/d18/averaging_omission_cuts.md#claim-omission-attachment-capacity`
Kind: local-deduction
Review state: accepted
Scope: the setting; every z in Z, and every subset Z0 of Z
Dependencies: preceding claim; R(3,4)=9; exact row degree identity
Conclusion: the pointwise and summed demand/capacity inequalities below
Search use: none pending independent review; proposed propagate
Reviews: [independent audit](review_averaging_omission_cuts_20261018_audit.md)

Let d16(z)=|N_A(z) intersect H16| and d17(z)=|N_A(z) intersect H17|.
Then

```text
max(0,9+delta_z-Delta)
    <= |O_z intersect S|
    <= (1+delta_z)*d16(z)+delta_z*d17(z).                 (1)
```

The sharper lower endpoint `max(0,9+delta_z-|U|)` may replace the
first term. No assumption that the triple J_y is constant in y is made.

Proof. For y in O_z intersect S, z has an A neighbor in J_y. Otherwise
z, the three independent vertices of J_y, and y would form I5. If
zh is an A edge, the same common-row argument used above gives

```text
|O_z intersect O_h|=24-r_z-r_h+|R_z intersect R_h|
                  <=32-r_z-r_h.                        (2)
```

For h in H16 this capacity is 1+delta_z, and for h in H17 it is
delta_z. Count the actual witnesses (y,h), allowing a demand to have
more than one witness, to get the upper bound in (1). For the lower
bound use |O_z|=9+delta_z and |U|<=Delta.
In particular a size-15 root cannot use a size-17 neighbor to satisfy
any such demand, whereas a size-14 root can. A size-14 to size-16
edge can witness two omissions, not one.

For any Z0 subset Z, put D0=sum_(z in Z0)delta_z and
`delta_max=max_(z in Z0)delta_z` when Z0 is nonempty. Summing the
untruncated lower bounds gives

```text
(9-Delta)*|Z0|+D0
 <= sum_(z in Z0)[(1+delta_z)*d16(z)+delta_z*d17(z)]       (3)
 <= (1+delta_max)*[7s-2e_A(H16)-e_A(H16,Z-Z0)]
    +delta_max*[6t-e_A(H17,Z-Z0)].                       (4)
```

The empty Z0 case of (3) is 0<=0; (4) is asserted only for nonempty
Z0. These are upper capacities, not realizability assertions.

To prove (4), note that H17 is independent and anticomplete to H16:
an edge with row sum at least 33 would have common row of order at
least nine even without a shared omission. Every H16 root has full
A-degree at most seven and every H17 root at most six. Subtract the
H16-internal degrees and edges to Z-Z0 to obtain the first bracket;
subtract edges from H17 to Z-Z0 for the second. Bound the nonnegative
coefficients in (3) by 1+delta_max and delta_max respectively.
The brackets themselves are nonnegative because they bound actual
edge counts.

For the particularly useful choice Z0={z:r_z=15}, the delta terms vanish:

```text
max(0,9-Delta)*|Z0| <= e_A(Z0,H16)
                  <=7s-2e_A(H16)-e_A(H16,Z-Z0).         (5)
```

Every pointwise demand must also fit d_A(z)<=8+delta_z, so (1) implies

```text
max(0,9+delta_z-Delta) <= (1+delta_z)*(8+delta_z).       (6)
```

At delta_z=0, Delta=0, this reads 9<=8 and is impossible. At Delta=1,
a size-15 root must have at least eight H16 neighbors. Since its full
A-degree is at most eight, equality forces epsilon_z=6 and all of its
A neighbors to lie in H16. This is a transition constraint, not a
universal assertion about size-15 roots.

<a id="claim-omission-endpoint-cover"></a>
## 3. The endpoint x=279 has only three remaining row profiles

Claim ID: `n43/d18/averaging_omission_cuts.md#claim-omission-endpoint-cover`
Kind: local-deduction
Review state: accepted
Scope: every G,v in the setting, with x=279
Dependencies: reviewed independent-row tail counts and x<=279; the new
[zero-root bound](tail_zero_one.md#claim-zero-seventeen-bound),
[one-root bound](tail_zero_one.md#claim-one-seventeen-eight-sixteen), and
[one-deficit exclusion](tail_two_three.md#claim-tail-two-three-one-deficit-exclusion),
each requiring independent acceptance before this synthesis is used;
the final q/E interval also uses the retained published e(A)>=50 minimum
([reduction index, Section 8.1](../reductions.md#81-published-internal-edge-ranges))
Conclusion: the following three numerical profiles cover the endpoint;
all rows have order at least fifteen
Search use: none pending independent review; proposed branch/propagate
Reviews: [independent audit](review_averaging_omission_cuts_20261018_audit.md)

```text
 t   s   D   number of size-15 rows
 1   7   0   10
 2   5   0   11
 3   3   0   12
```

Proof. The existing tail counts give 0<=t<=4,
`s<=12-3t`, `7t+8s<=72`. Together with
`s-D=9-2t` and D>=0, these leave precisely

```text
(t,s,D)=(0,9,0),(1,7,0),(1,8,1),(2,5,0),(2,6,1),(3,3,0).
```

The first, third and fifth profiles are excluded by the three linked
claims, respectively. D=0 forces every remaining Z row to have size
fifteen, giving the table. It asserts necessary coverage, not existence
or a disjoint classification of isomorphism types. In particular the
all-profile upper bound remains 279, not 278.

One useful endpoint consequence uses only the global degree cap:
`2e(A)=sum_A d_A(u)<=18*23-279=135`, so e(A)<=67.
With the already retained 50<=e(A)<=85 census interval, this gives
`50<=e(A)<=67`, `18<=q=85-e(A)<=35`, and the odd excess
`E=279-306+2e(A)` lies in 73..107. Thus this endpoint is not a
small-excess or q<=2 regime. These numerical restrictions introduce
no new external premise beyond that explicitly retained edge minimum.

## Limits and next use

These deductions turn a broad row-count deficit into unavoidable actual
triple obligations, addressing the agenda's missing supply step in the
large-row tail. They do not guarantee many saturated columns when Delta
is large. In particular (5) alone becomes vacuous at Delta>=9.

The inequalities use the union bound on actual witness supports; retaining
`|O_z intersect O_h intersect S|` instead of its cardinality cap can only
strengthen the same counting proof. No optimizer, random sampling or
certificate implementation is supplied. The separate endpoint notes
[zero/one 17-row](tail_zero_one.md) and
[two/three 17-rows](tail_two_three.md) investigate profile consequences.
They require their own independent reviews before use.
