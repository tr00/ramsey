<!-- sos-theory-integration:start -->
Integration status (2026-10-15): all 4 claims received independent
exact-revision acceptance in [the review](review_sos_finite_moments_20261015_columns.md) at reviewed-body
SHA-256 `87621348ef6d4612553c6e011f30506b89d85fd507fdd641bcef602581264e94`.
The reviewed body is preserved verbatim below; its ready labels are historical.
Current state: accepted local deductions on each exact premise chain.
Permitted use: core edge-cap and transversal propagation, and unavoidable-anchor branching in the fixed q=1,E_A<=29 slice.
No complete x branch or order-43 case is closed. External premises are retained;
independent mathematical review is not a formal exhaustion certificate or novelty review.
See [the synthesis](../../reports/2026-10-15-sos-theory.md) and
[the manifest](sos_theory_manifest.json).
<!-- sos-theory-integration:end -->

# Exact finite triangle moments and a beyond-equality anchor reduction

Date: 2026-10-15. Task token: `sos-finite-20261015`.
Author and self-auditor: `sos_finite`. Base revision:
`5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.

Theory only: no SDP or other solver, graph search or enumeration, download,
installation, or novelty review. All claims below are **ready for independent
review**. Proposed propagation and conditional branching are described, but
Search use remains none until exact-revision review.

The useful improvement is that every (4,4)-free graph on 11 vertices has at
most 36 edges and every such graph on 13 vertices has at most 48. These
improve the sufficient 37 and 49 caps in the existing degree-eight anchor
proof. Exact complementary triangle moments, integrality, and overlap of
actual neighborhoods provide the extra unit. Applying these caps to a
degree-18 pivot gives an unavoidable independent four-set with all internal
degrees at least eight whenever `q=1` and `E_A<=29`; this covers
`x=138,...,167` within that fixed-q slice. No whole x branch is excluded.

## Setting and dependencies

A `(r,s)`-free graph has neither K_r nor an independent s-set. Write `t(H)`
and `i(H)` for triangle and independent-triple counts. An order-43 K5/I5-free
graph G, with a degree-18 pivot v, has `A=N(v)` and `B=M(v)` of orders 18
and 24. A is (4,5)-free and may contain I4; B is (5,4)-free and has no I4.

Use the existing external premises `R(3,4)=9`, `R(3,5)=14`,
`R(4,5)=25`, the (4,5,18) maximum 85, and the (4,4,14) maximum 50.
The census citations and retrieval provenance remain those in
[the frontier anchor proof](x136/five_column_compatibility.md) and
[the cross corridor](cross_upper_bound.md). They are not independently
recertified here. Set

```text
q=85-e(A), epsilon_u=d_G(u)-18, E_A=sum_(u in A)epsilon_u,
x=e(A,B)=136+2q+E_A, 0<=epsilon_u<=6.
```

For every independent four-set I in A the actual-column argument gives

```text
sum_(u in I)d_A(u)<=32+E_I, E_I=sum_(u in I)epsilon_u.
```

This argument uses the 24 actual B columns, each meeting I, and at most
three columns with each exact singleton I signature. It is not a property
of an isolated A with the same edge count. See
[signature anchors](../../docs/general_theorems/signature_anchors.md#claim-signature-anchors-03)
and [frontier defects](frontier_band.md).

## Exact complementary moment bookkeeping

<a id="claim-finite-triangle-deficits"></a>

Claim ID: `n43/d18/sos_finite_moments.md#claim-finite-triangle-deficits`

Kind: local-deduction. Review state: ready.

Scope: every (4,4)-free graph H of order `7<=m<=17`, every vertex u.

Dependencies: `R(3,4)=9`; Mantel's theorem, or its elementary quadratic
proof; Goodman's identity derived in this claim.

Conclusion: The exact slack identities and integer residues below hold.

Proof. A neighborhood is triangle-free and I4-free, so its order is at most
eight. The same is true in the complement. Hence

```text
max(0,m-9)<=d(u)<=min(8,m-1).
f(d)=min(floor(d*d/4),floor(3*d/2)).
```

The first term bounds edges in a triangle-free neighborhood by Mantel.
The second holds because every vertex of that neighborhood has at most
three neighbors: four would be independent in the triangle-free graph and
form I4 in H. The same statements apply separately to complement H.
Define nonnegative integer neighborhood defects

```text
s_u=f(d(u))-e(H[N_H(u)]),
bar_s_u=f(m-1-d(u))-e(bar_H[N_barH(u)]).
```

Each triangle is counted three times in neighborhood edge counts, so

```text
3*t(H)=sum_u f(d(u))-sum_u s_u,
3*i(H)=sum_u f(m-1-d(u))-sum_u bar_s_u.
```

Counting nonhomogeneous triples by their two incident edge/nonedge choices
gives

```text
t(H)+i(H)=C(m,3)-(1/2)*sum_u d(u)*(m-1-d(u)).
g_m(d)=f(d)+f(m-1-d)+(3/2)*d*(m-1-d),
sum_u g_m(d(u))-3*C(m,3)=sum_u(s_u+bar_s_u)>=0.
```

Thus this method retains the exact neighborhood slack rather than just an
upper bound on its sum. Additionally,

```text
sum_u s_u == sum_u f(d(u)) (mod 3),
sum_u bar_s_u == sum_u f(m-1-d(u)) (mod 3).
```

Let a,c be rational numbers with `r(d)=c-a*d-g_m(d)>=0` for every allowed
degree. The exact affine deficit identity is

```text
m*c-2*a*e(H)-3*C(m,3)
 =sum_u r(d(u))+sum_u(s_u+bar_s_u).
```

Every term on the right is nonnegative. A small left side restricts degree
support and neighborhood defects simultaneously, with the two separate
modulo-three conditions still available. This is a finite positivity
certificate, using quadratic degree moments and nonnegative local terms.
It does not purport to be a pure ordinary SOS identity in unconstrained
edge variables: the discrete neighborhood bounds and integrality are explicit
ingredients. In an SOS relaxation they would need justified polynomial
constraints or derived certificates.

Search use: none; proposed propagation on specified actual (4,4) cores or
anchored cells, retaining degree and integer slack variables. Reviews: none.

## Two strengthened core edge caps

<a id="claim-finite-core-caps"></a>

Claim ID: `n43/d18/sos_finite_moments.md#claim-finite-core-caps`

Kind: local-deduction. Review state: ready.

Scope: every (4,4)-free H of order 11 or 13; no census at these orders needed.

Dependencies: preceding claim; elementary common-neighbor counting.

Conclusion: `e(H)<=36` at order 11 and `e(H)<=48` at order 13.

Proof for order 11. In increasing degree order `d=2,...,8`, take
`a=11/2,c=82`. Direct substitution gives

```text
r(d) = 34,22,11,5,0,0,1.
```

The affine inequality gives `e(H)<=37`. If `e(H)=37`, its total deficit is
`11*82-11*37-3*C(11,3)=0`. Every degree must therefore be six or seven;
the degree sum 74 forces three sixes and eight sevens. The two neighborhood
edge caps now give separately

```text
3*t(H)<=3*f(6)+8*f(7)=27+80=107,
3*i(H)<=3*f(4)+8*f(3)=12+16=28.
```

Consequently `t(H)<=35` and `i(H)<=9`. But the exact triple identity gives

```text
t(H)+i(H)=165-(1/2)*(3*6*4+8*7*3)=45,
```

contradicting the upper bound 44. Equivalently each of the two neighborhood
defect totals must have a positive residue modulo three, whereas the affine
identity requires both to vanish. Thus `e(H)<=36`.

Proof for order 13. In degree order `d=4,...,8`, take `a=9/2,c=100`.
Direct substitution gives

```text
r(d) = 18,9,1,0,0.
```

The affine inequality initially gives `e(H)<=floor(442/9)=49`. If
`e(H)=49`, the deficit is one. Degrees four and five are impossible, and
at most one vertex has degree six. The degree sum 98 leaves exactly two
profiles:

```text
(i) seven degree-eight vertices and six degree-seven vertices;
(ii) eight degree-eight, four degree-seven, one degree-six vertex.
```

In case (ii), the degree-six vertex consumes the entire affine deficit.
All neighborhood defects must vanish, yet

```text
sum_u f(d(u))=8*12+4*10+9=145
```

is not divisible by three, contradicting `3*t(H)=sum f(d)`.

In case (i), `sum f(d)=7*12+6*10=144`, and
`sum f(12-d)=7*4+6*6=64`. The combined neighborhood defect is one.
Modulo-three integrality forces `sum s_u=0` and `sum bar_s_u=1`. In
particular every degree-eight vertex has a neighborhood with 12 edges.
That triangle-free I4-free neighborhood has maximum degree three, and on
eight vertices its 12 edges force every vertex degree three. Therefore
every edge incident to an original degree-eight vertex has exactly three
common neighbors in H.

Let J be complement H, let L be the seven original degree-eight vertices,
and K be the other six. Every L vertex has J-degree four. If two L vertices
are nonadjacent in J, they are adjacent in H with common-neighbor count
three. Their number of common J-neighbors is

```text
13-d_H(u)-d_H(w)+|N_H(u) intersect N_H(w)|=13-8-8+3=0.
```

Thus two L vertices with a common J-neighbor must be adjacent in J.
For any vertex z, the set `N_J(z) intersect L` is consequently a clique;
as it is joined to z and J is K4-free, it has at most two vertices.
Every L vertex therefore has at most two neighbors in L and at least
two in K. Hence `e_J(L,K)>=7*2=14`. Every K vertex has at most two
neighbors in L by the same common-neighbor argument, giving
`e_J(L,K)<=6*2=12`. This contradiction excludes case (i). Hence
`e(H)<=48`.

Search use: none; proposed core/anchored-cell edge-cap propagation.
Reviews: none.

## Uniform low-degree transversal thresholds

<a id="claim-finite-low-transversal-thresholds"></a>

Claim ID: `n43/d18/sos_finite_moments.md#claim-finite-low-transversal-thresholds`

Kind: local-deduction. Review state: ready.

Scope: degree-18 pivot setting; every L subset A with `5<=ell=|L|<=11`,
all `d_A(u)<=7`, and L meeting every I4 of A; q arbitrary within the setting.

Dependencies: preceding claim; the smaller-core caps in
[frontier anchor Claim01](x136/five_column_compatibility.md#claim-five-columns-core-caps);
Turan's theorem with equality; deletion identity.

Conclusion: The following necessary q thresholds hold, without any restriction
on E_A or x. The exceptional `q=1,ell=9` case forces `E_A>=30`.

```text
ell                     5   6   7   8   9  10  11
m=18-ell               13  12  11  10   9   8   7
b4(ell)                 1   2   3   4   6   8  10
core edge upper U(m)   48  43  36  31  27  21  16
necessary q >=          3   2   3   2   1   2   2
```

Proof. H=A-L is (4,4)-free precisely because L hits every I4. Since
A[L] has no I5, Turan applied to its complement gives `e(A[L])>=b4(ell)`,
where b4 is the sum of binomial part sizes in the balanced four-part split.
The exact deletion identity gives

```text
e(H)=85-q-sum_L d_A+e(A[L])>=85-q-7*ell+b4(ell).
```

Compare with U(m) to obtain the table. At `q=1,ell=9` all inequalities
must be equalities: `e(H)=27`, `e(A[L])=6`, and every L degree is seven.
The K4-free Turan equality case makes `H=K(3,3,3)`. The I5-free lower-edge
equality case makes `A[L]=K3 disjoint union 3 K2`.

Let t1,t2,t3 be the triangle vertices of A[L]. Each has five neighbors in H.
Its H-neighborhood is triangle-free because A is K4-free; therefore it
meets at most two of H's three independent parts. It must omit one whole
part and have a 3+2 distribution on the other two. Two of the ti cannot
omit the same part: their two five-subsets of the other six vertices would
intersect in at least four vertices, including an H edge, giving K4 with
that adjacent ti pair. The three omitted parts are thus distinct.

For each i, the omitted H part together with ti is an independent four-set
Ii in A. These three anchors are disjoint. Their combined internal degree
sum is

```text
sum_(u in H)d_A(u)+sum_(i=1..3)d_A(ti)
= [2*27+e(H,L)]+21
=54+[9*7-2*6]+21=126.
```

The three actual-interface anchor caps give the same sum at most
`3*32+E_(I1 union I2 union I3)<=96+E_A`. Thus `E_A>=30`, and
`x=138+E_A>=168` in this exceptional q=1 case. This is a conditional
exclusion of such a low-degree transversal below x168, not an exclusion
of all q=1 interfaces there.

Search use: none; proposed transversal thresholds and rejection of a specified
`q=1,ell=9,E_A<=29` transversal hypothesis. Reviews: none.

## A beyond-equality independent-four anchor

<a id="claim-finite-q1-anchor"></a>

Claim ID: `n43/d18/sos_finite_moments.md#claim-finite-q1-anchor`

Kind: local-deduction. Review state: ready.

Scope: every degree-18 rooted candidate with `q=1,E_A<=29`; equivalently
this fixed-q slice has `138<=x<=167`. No assumption that q<=1 or x<=167
holds for all degree-18 roots.

Dependencies: preceding claim; `R(3,5)=14` for `d_A<=13`; existing
four-transversal lower bound and actual four-transversal degree floor;
actual independent-four anchor cap.

Conclusion: An independent four-set I exists in A with every `d_A(u)>=8`.
For any such I,

```text
sum_(u in I)(d_A(u)-8)+eta_I=E_I,
eta_I=e(I,B)-36=12-n1+h>=0,
h=sum_(y:|C_y intersect I|>=3)(|C_y intersect I|-2).
```

Thus both the total internal-degree excess of the anchor above eight and
the singleton/signature defect are at most E_I. In particular at `E_A=0`
(`q=1,x=138`) there is an all-degree-eight independent four-set, with
twelve singleton columns in four triangle classes and twelve two-element
signatures, each anchor vertex occurring in six two-element signatures.

Proof. Put `L={u in A:d_A(u)<=7}` and ell=|L|. The neighborhood of any A
vertex is (3,5)-free, giving `d_A<=13`. Since `sum_A d_A=168`,

```text
168<=7*ell+13*(18-ell)=234-6*ell,
```

so ell<=11. Suppose L were a transversal. The q<=2 transversal theorem
excludes ell<=3. At ell=4 every transversal vertex has internal degree at
least `9-q=8`, contradicting its membership in L. This lower floor holds
for abstract four-set transversals: A-L is (4,4)-free, and the proof of
[four-column Claim01](four_column_stability.md#claim-four-column-stability-01)
uses only that remainder, the order-14 maximum50, R(3,4), and K4/I5
constraints. It does not need an actual B endpoint.

For ell=5,...,11 the preceding table excludes every case at q=1 except
ell=9; that exception forces E_A>=30, contrary to the hypothesis. Hence
L is not a transversal and some I4 avoids it, proving all four degrees
at least eight. The exact row sum gives

```text
e(I,B)=68+E_I-sum_I d_A
      =36+E_I-sum_I(d_A-8).
```

Substitution of the exact anchor-defect formula proves the stated identity.
At E_A=0 both nonnegative terms vanish. The saturated singleton-capacity
argument then gives the signature description; each anchor vertex has
`17-8=9` B neighbors, three singleton and six two-element occurrences.

This extends the existence part of the equality-frontier anchor theorem
to a strictly larger fixed-q strip. It does **not** exclude size-four
columns at q=1: their degree floor is eight, so the degree-eight anchor
and a four-transversal may intersect. No column size>=5 conclusion,
unconditional upper bound on x, or order-43 exclusion is claimed.

Search use: none; proposed branching on an unavoidable anchor with all anchor
choices, actual signatures, overlaps, and completions retained. Reviews: none.

## Author audit and limitations

The two triangle counts were retained throughout Goodman's identity.
Neighborhood max-degree-three bounds were checked independently in H and
its complement. The affine r tables were checked by direct rational
substitution over the stated seven/five degree values; this is finite
formula arithmetic, not a graph or degree-profile search. At order13, both
profiles were obtained algebraically from the sum and one-unit slack.
The complement codegree formula includes the two endpoints correctly:
for an original adjacent pair it is `m-d(u)-d(w)+c(u,w)`.

The exceptional nine-set proof uses both Turan equality cases. The omitted
part of each triangle vertex is justified by its triangle-free H-neighborhood,
and pair overlaps use the original triangle adjacency. The three I4s are
disjoint because their omitted parts are distinct, permitting their excess
loads to be bounded by E_A without a fractional-cover assumption.

The anchor theorem concerns an arbitrary root satisfying its stated q,E
conditions. It does not establish that some root in every candidate lies
in this strip. Existing claims and external census results remain dependencies.
An author self-check is not independent review, a novelty review, or a formal
proof certificate. No branch closes. The finite deficit mechanism can be
applied to actual anchored (4,4) cells across arbitrary x when such cells
are specified; their occurrence is not assumed unavoidable.
