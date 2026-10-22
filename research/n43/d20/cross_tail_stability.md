# Stability of the one-size-16 degree-20 cross-tail profile

Date: 2026-10-22. Author and self-auditor: /root, working alone.
Task: `d20-pair-transfer-20261022`. The claim is ready for independent
review. No maximum-density selection, saturation or side-edge census is
needed. This supplies necessary structure for one of the two unresolved
x=290 profiles; it does not exclude either profile.

Let G be K5/I5-free on 43 vertices, let d_G(v)=20 and n18(G)=0,
and put A=N(v), B=M(v). For w in A put R_w=N_B(w), r_w=|R_w|,
s_w=d_A(w), and O_w=B-R_w. The degree range is 19..24.
Assume the actual row-size profile is

    L={ell}: one row of size 16,
    H: eight rows of size 15,
    P: eleven rows of size 14.

Thus x=e(A,B)=16+8*15+11*14=290. The
[large-row tail](large_row_tail.md#claim-d20-large-row-deficits) proves
that this or the two-size-16/six-size-15 profile is necessary at x=290.
The deductions here are conditional on the displayed actual profile;
their proof does not use that tail classification.

The external premises are R(4,5)=25, R(3,4)=R(4,3)=9 and R(3,3)=6 from the
[baseline](../../../docs/mathematical_baseline.md), and the elementary
Turan bound e(J)<=floor(n^2/3) for a K4-free graph J. No catalogue,
core uniqueness or enumeration is used.

<a id="claim-d20-one-sixteen-tail-stability"></a>
## Exact omission band and concentrated degree-24 endpoints

Claim ID: research/n43/d20/cross_tail_stability.md#claim-d20-one-sixteen-tail-stability  
Kind: local-deduction  
Review state: ready  
Scope: every G,v with the actual row-size profile above; arbitrary root  
Dependencies: displayed Ramsey bounds; Turan's theorem; degree cap 24; forbidden K5 and I5  
Conclusion: 18 omitted-high-row triples and four pairs; e(H)=8; H contains a triangle; at least seven H vertices have ambient degree 24; the exact cut bounds (7)  
Search use: none pending independent review; proposed profile propagation  
Reviews: none

An A-edge wz has a common B-neighborhood with no triangle and no I4:
a triangle extends {w,z} to K5, and B has no I4 because v misses B.
R(3,4)=9 bounds its order by eight. Consequently L is anticomplete
to H, since 16+15-22=9. H is K4/I4-free: its K4 would extend with
v, and its I4 with ell. Applying Turan to its K4-free complement gives

    e(H)>=binom(8,2)-floor(8^2/3)=7.                  (1)

For y in B define the actual omitted-high-row set

    J_y={w in L union H:y in O_w}, n_y=|J_y|.

The H members of J_y are independent: an edge between two omitted
size-15 rows would have intersection at least 15+15-21=9. The L
vertex is anticomplete to H, so J_y is independent. Adjoining y
would make I5 if n_y>=4. Therefore n_y<=3 and

    sum_(y in B)n_y=6+8*7=62.

Let F={y:n_y=3}, and put f=|F|. The other 22-f entries are at most
two, so 62<=3f+2(22-f), giving f>=18.

If p in P omits y in F, p has an A-neighbor in J_y, or J_y union
{p,y} makes I5. That neighbor cannot be ell: two adjacent rows of
sizes 14 and 16 have common B-neighborhood of order at most eight,
but if both omit y the intersection has order at least 14+16-21=9.
Thus an H neighbor witnesses each such omission. Moreover an A-edge
ph with h in H satisfies

    |O_p intersect O_h|<=1,                           (2)

because its B-intersection has order 14+15-22+|O_p intersect O_h|,
namely 7 plus that shared-omission count. One H neighbor can witness
at most one of p's distinct omitted-F obligations. Hence

    e(P,H)>=sum_(p in P)|O_p intersect F|>=11*(f-14). (3)

Here p omits eight B vertices, at most 22-f of them outside F.
Each h has s_h<=24-1-15=8, and L is anticomplete to H, so

    2e(H)+e(H,P)=sum_(h in H)s_h<=64.                (4)

By (1), e(H,P)<=50. If f>=19, (3) would require at least 55 edges.
Thus f=18. The four remaining y entries must each equal two, since
18*3+4*2=62. Write Q=B-F, so |Q|=4, n_y=2 on Q and n_y=3 on F.

Put E=e(P,Q). The P omission sum is 11*8=88, and P has 44 possible
edges into Q, so

    sum_P |O_p intersect F|=88-(44-E)=44+E,
    e(P,H)>=44+E.                                    (5)

Q cannot be K4. If it were, each of the nine vertices in L union H
would have to omit at least one Q vertex, or it would extend Q to K5.
This would give sum_(y in Q)n_y>=9, whereas that sum is exactly eight.

Choose a nonedge yz in Q. The P vertices missing both y,z contain no
I3, or they together with y,z make I5. They are also K4-free as a
subset of A, so R(4,3)=9 bounds their number by eight. At least three
of the eleven P vertices therefore see y or z, giving E>=3. Combining
(1), (4) and (5) proves

    3<=e(P,Q)<=6,
    47<=e(P,H)<=50,
    7<=e(H)<=8,
    sigma_H:=sum_(h in H)(24-d_G(h))
        =64-2e(H)-e(P,H)<=3.                         (6)

The last equality uses d_G(h)=16+s_h, since r_h=15. Every non-degree24
H vertex contributes at least one to the nonnegative integer sigma_H.
Thus at least five of the eight H vertices have degree 24. If e(H)=8,
(4)--(5) give sigma_H<=1, so at least seven have degree 24 and E<=4.
If e(H)=7, equality in Turan's theorem identifies H as K3 disjoint
union K3 disjoint union K2 (the balanced three-part complement).
Write its two triangle components as T1,T2 and its edge component as E2.
The size-16 endpoint ell is anticomplete to H and has s_ell<=7,
so at least four of the eleven P vertices miss ell. Let P0 be those
vertices. For p in P0, its missed H vertices cannot contain an I3,
or that triple together with p,ell makes I5. Thus p must be complete
to at least one of T1,T2,E2: if each component has a missed vertex,
one can select a missed independent triple across the components.
Completeness to either triangle makes K4 in A, so every p in P0
is complete to E2. Two adjacent P0 vertices then make K4 with E2.
Therefore P0 is independent and has at least four members, all missing
ell, again giving I5. This contradiction excludes e(H)=7 and sharpens
(6) to

    e(H)=8, 3<=e(P,Q)<=4, 47<=e(P,H)<=48,
    sigma_H=48-e(P,H) in {0,1},
    |{h in H:d_G(h)=24}|>=7.                         (7)

If sigma_H=1, exactly one H vertex has degree 23 and all others degree
24. If sigma_H=0 all eight have degree 24. These degrees concern the
same actual endpoints, not an aggregate excess on an unspecified family.

For completeness, H must contain a triangle even in the e(H)=8 case.
Suppose a triangle-free I4-free graph J on eight vertices had at most
eight edges. Every vertex has degree at least two: its nonneighbors
are triangle-free and I3-free, hence number at most five by R(3,3)=6.
If every degree is at least three, e(J)>=12. Otherwise choose a
degree-two vertex w, with independent neighbors a,b. Its five
nonneighbors C are triangle-free and I3-free. Each c in C has at
most two C-neighbors (three independent neighbors would be I3) and
at most two C-nonneighbors (three form a clique by I3-freeness, contrary
to triangle-freeness). Therefore every C degree is two and e(C)=5.
The C vertices missing both a,b form a clique, or a nonadjacent pair
with a,b makes I4; this clique has size at most two. Thus at least
three C vertices meet {a,b}, and

    e(J)>=e(C)+e({w},{a,b})+e({a,b},C)>=5+2+3=10.

This contradicts e(H)=8. The argument gives an elementary lower
bound 10 for every triangle-free I4-free graph of order eight, without
using the three-type eight-core classification.

## Limits

This profile now forces a four-vertex exceptional B set, an eight-vertex
H graph with exactly eight edges, and at least seven actual degree-24
vertices, at any root realizing the profile. The degree-24 conclusion is proved
specifically for this one-size-16 x=290 profile; it must not be transferred
to the other x=290 profile without proof. The complement consequently
has at least seven degree-18 vertices. This is a connection to the d18
branch, not an exclusion of that branch or of this profile.

The [pair comparison](pair_density_transfer.md#claim-d20-high-cross-companion-separation)
supplies additional companion restrictions when v also maximizes
degree-20 neighborhood density. Neither statement proves an unavoidable
low-overlap companion at such a root. The second x=290 profile, the
uniform ceiling and the order-43 decision remain open. Author arithmetic
checks are recorded in the [report](../../reports/2026-10-22-d20-pair-transfer.md);
independent review remains pending.
