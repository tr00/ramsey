# Independent audit of pending transversal claims

Date: 2026-10-15. Task token: `audit-pending-20261015`.

Claim(s): all four `claim-transversal-deletion-01` through `-04` in
[transversal_deletion.md](transversal_deletion.md), and all four
`claim-transversal-compatibility-01` through `-04` in
[transversal_compatibility.md](transversal_compatibility.md).

Author and reviewer: the source author is the transversal compatibility
agent; reviewer is `/root/audit_transversals`, an independently assigned
audit agent. The reviewer derived the arguments before reading the concurrent
deletion review. That review is supporting provenance, not the basis for
these outcomes.

Reviewed revision: working tree based on commit
`b12925f7a96d24e18d06b0237930a32e30660ca2`; exact source SHA-256 values:

```text
03f47814e5092641864b3f221c06f09123e2364ab0068a05d2cdb8d0bb46dee1  docs/general_theorems/transversal_deletion.md
fb591c3905f288906230cfd7a5318e64feaf64490150c24a486ed20be2df63e1  docs/general_theorems/transversal_compatibility.md
```

These hashes were checked repeatedly during the audit and immediately before
creating this review. Review acceptance applies to these snapshots. A later
metadata-only acceptance update does not change the reasoning audited here;
any mathematical change requires renewed review.

Dependencies reviewed:

```text
4c084b03583248dc7c7ed56324ec5b6801bdca5278cf4fc17fa7e845dc07825e  n43/d18/transversal_four.md
0b8eaa6bd7ca0c6ea8691409112754ab2f0d4b2730166ff4d843b5b807269a54  n43/d18/frontier_band.md
e855ca074447be16c6d42a1924d067702972e1d7147b7522f121bf08c2fb9dff  n43/d18/x136/r2/low_excess_columns.md
fdae3de53cd7d68e9d7d414829d13be4cae4928e70b3f1aac3986e88b6a7727b  n43/d18/x136/r2/review_low_excess_columns_20261014_triples.md
0d95f98f6682272b1bf2ec561d6f87018f6c74b5bb2f0c57d0cbfcd48f6b6f61  n43/d18/x136/r2/review_low_excess_columns_20261014_pivot.md
```

The starting points and workflow were read. The retained external inputs are
Turan's balanced extremal theorem and equality case, the supplied Ramsey
upper bound interface, and for the numerical applications the recorded values
`R(4,3)=R(3,4)=9`, `R(3,5)=14`, maxima 85 for `(4,5,18)`, 79 for
`(4,5,17)`, 50 for `(4,4,14)`, and minima 50 for `(4,4,15)` and 41 for
`(4,4,14)`. Their applications and inequality directions were checked; no
external census or literature certificate was independently recertified.

## Per-claim outcomes

| Claim | Outcome | Exact dependency and scope limit |
| --- | --- | --- |
| Deletion 01 | accepted | Conditional on its proved `R,L` interface and Turan; no existence or attained-extremum assumption |
| Deletion 02 | accepted | Deletion 01 component bounds, integer `L`, and Turan equality |
| Deletion 03 | accepted | Deletion 01, `R(4,3)=9`, and the order-15 minimum 50 |
| Deletion 04 | accepted | Deletion 01–02, `R(4,3)=9`, and the order-14 minimum 41; supplies a necessary budget only |
| Compatibility 01 | accepted | Set inclusion, with `1<=t<=|L|`; independence conclusion requires `t>=2` |
| Compatibility 02 | accepted | Compatibility 01 and its stated ordered weight bounds, occupancy gap, and transversal exclusion |
| Compatibility 03 | accepted | Compatibility 01 and every one of its six explicit hypotheses; degrees are full degrees in the same graph |
| Compatibility 04 | accepted | Compatibility 03 and full frontier/interface setting, including the arbitrary-transversal degree bounds |

No proof in these eight claims requires withdrawal at the reviewed revisions.

## Checks and independent supporting reasoning

### Deletion 01: remainder, attachments, and threshold

For a `t`-set transversal `T`, the remainder `H` has exactly `h=n-t`
vertices and neither `K_r` nor `I_s`, so its stated lower edge bound applies.
For each `x` in `T`, nonneighbors in `H` are `K_r`-free by restriction and
`I_(s-1)`-free because adjoining `x` would create `I_s` in `F`. Hence
there are at most `R-1` such vertices, and at least
`max(0,h-R+1)` attachment edges from `x`.

The complement of `F[T]` is `K_s`-free. Turan gives its maximum edge
count as the balanced complete `(s-1)`-partite count; subtracting from
`binom(t,2)` gives exactly the claimed `a(t,s)`. Adding the remainder,
attachment, and internal edge counts yields the displayed inequality.
An arbitrary transversal smaller than `t` can be enlarged because `t<=n`;
its enlargement remains a transversal and uses the same fixed-order lower
bound `L`. No monotonicity of the threshold in `t` is assumed.

The strict comparison is necessary. The integer-minus-one restatement is
correctly restricted to an integer right side. Real `L` is permissible in
Claim 01. Cases `t=0`, `t=n`, `b=0`, and empty balanced parts cause no
failure: an impossible remainder makes the implication vacuous, while an
existing empty remainder must satisfy its justified lower bound. Neither a
sharp edge bound nor a witness attaining `L` is required.

### Deletion 02: exact defect and equality

Substitution of the three disjoint edge counts gives the exact sum of
defects. With integer `L`, all defects are nonnegative integers. Thus each
individual attachment excess and each component is bounded by `delta`, and
at most `delta` attachment excesses are positive. At zero defect the induced
`T` graph is the complement of the Turan equality graph, namely disjoint
balanced cliques. The attachment equality implies `R-1` nonneighbors only
when `b>0`; the source correctly isolates the `b=0` boundary. Equality is
a conditional structural implication, not an assertion that equality can
occur for arbitrary parameters or a loose lower bound `L`.

### Deletion 03–04: substitutions and ambient types

For `n=18,r=s=4,t=3,R=9,L=50`, the terms are
`h=15,b=7,a(3,4)=0`, so a transversal of size at most three requires
at least 71 edges. At most 70 therefore excludes it. In the pivot application,
`A=N(v)` is `K4`-free; consequently its complement `F` has no `I4`, and
`e(F)=binom(18,2)-(85-q)=68+q`. This does not prohibit `I4` in `A`.
Each actual column meets every `I4` of `A`: a missed one extends with its
endpoint in `B` to `I5` in `G`.

For `t=4,L=41`, the terms are `h=14,b=6,a(4,4)=1`, hence the
lower bound is 66. At `68+q` the defect is `2+q`. If the raw internal
edge count is denoted `z`, the identity instead reads `u+w+z=3+q`,
with `u,w>=0,z>=1`, as asserted. An inequality below 68 does not establish
existence of a four-transversal. The source expressly avoids that inference.
The order-14 minimum 41 here is different from the order-14 maximum 50
used in the compatibility specialization; their roles are not exchanged.

### Compatibility 01: occurrence and pair coverage

For fixed `T`, a family member missing `L-T` has intersection with `L`
contained in `T`. The occupancy bound and `|T|=t` force equality. In the
independent-set specialization, every `t`-subset of `L` is therefore contained
in an independent set. When `t>=2`, every pair extends to a `t`-subset,
so all pairs are nonadjacent in that same graph. This checks the universal
quantifier over `T` and uses the exact coverage assumption. For `t=1`
only occurrence follows. An empty family cannot satisfy nontransversality
of any `L-T`; in particular the stated condition treats the empty transversal
correctly when `|L|=t`.

### Compatibility 02: ordered weights

For an alleged member with `p>=j` vertices in `P` and `q<=t-1` in
`L`, its weight is at least
`k*b+p*(a-b)+q*(m-b)`. Since `a-b>=0` and `m-b<=0`, this is at
least `k*b+j*(a-b)+(t-1)*(m-b)`, exactly the displayed expression.
The condition `j+t-1<=k` makes the corresponding residual count
nonnegative. This reasoning allows negative and nonintegral weights.
The separate upper weight bound on each `L-T` contradicts its presumed
transversal weight lower bound. Neither occupancy alone nor a transversal
size bound alone supplies this exclusion. The vertexwise alternative works
for nonempty `L-T` with `c<a`; for the empty set its universal vertex
condition is vacuous, so it cannot replace the explicitly included empty-set
exclusion. The source makes this qualification.

### Compatibility 03: complete low-degree case split

Two disjoint transversals force each `I4` to meet both. Three union vertices
would have degree sum at least `3a+m>B`; four have sum at least `4a`,
which is still greater because `a>m`. Every `I4` thus contains exactly
one vertex in each transversal and two in `U`, with U-pair sum at most
`P=B-2a`. Integer degrees and `P<=2c+1` ensure each such pair meets
`L={u:d_H(u)<=c}`. The tau bound and the vertexwise transversal degree
floor exclude `|L|<s` and `|L|=s`, respectively.

If `|L|=s+1`, avoidance of each `L-{u}` yields an `I4` whose other U
vertex is outside `L`, of degree at least `c+1`. Thus each selected `u`
has degree at most `P-(c+1)<=m` and hence exactly `m`. Deleting the
transversal `L` leaves order `n-s-1` with no `I4`. Its edge count is
`e-(s+1)m+e(H[L])`, greater than `F0`, contrary to the precise induced
subgraph premise. No `I4` prohibition was imposed on `H` itself.

For larger `L`, disjointness gives `sum_U d_H>=D=2e-2S` with no
overlap correction. The first strict capacity gap rules out `|L|>=s+3`
because `c<M`; so only `|L|=s+2` remains. If an `I4` used any U vertex
outside `L`, that vertex would have degree at most `P-m`. There is at
least one outside position by `N>=s+3`, and the second strict capacity gap
bounds all U degrees below `D`, a contradiction. Consequently every
`I4` uses two vertices of `L`. Every `L-T` for a pair `T` has size `s`
and degrees at most `c<a`, so is not a transversal. Compatibility 01
forces an independent `(s+2)`-set, contradicting the final hypothesis.
These cases cover every possible size of `L`. Inconsistent numerical
parameters merely make the hypothesis family empty, not an invalid proof.

### Compatibility 04: all hypotheses instantiated

The full actual interface gives the independent-four degree cap 32: each
column meets an independent four-set; each singleton signature class is
a clique of size at most three, so at most twelve of 24 columns are
singletons. Therefore at least 36 incidences hit the anchor, and the exact
row identity gives its degree sum at most `68-36=32`. This is an interface
premise, not a conclusion from `e(A)=85` alone.

The universal degree floor 6 uses deletion and the order-17 maximum 79;
the ceiling 13 uses `R(3,5)=14` on the triangle-free, I5-free vertex
neighborhood. The four-transversal minimum size and its Claim 01 bounds
apply to arbitrary transversals, without requiring actual column status.
Their needed degree floor 9 and total cap 40 were also rechecked directly:
the 14-vertex remainder has at most 50 edges and each attachment at most
eight. Deleting one transversal vertex leaves at most 76 edges: either the
other three induce at most two edges, or their triangle attachment total
is at most `14+3+3+3=23` by inclusion-exclusion. Thus every transversal
vertex has degree at least nine. Its internal edge count is at most five.
At at most four internal edges the total degree is at most 40. For a
diamond, the shared-edge neighborhood intersection has at most two vertices
since it is independent and misses both nonadjacent tips; intersections
with either tip have at most three. A triangle's attachment total is at
most `14+2+3+3=22`, forcing total attachments at most 30 and hence
total degree at most 40. These are upper bounds; attainment is not assumed.

The induced 13-vertex remainder in Hypothesis 4 is `(4,4)`-free. Each
of its neighborhoods is triangle-free and I4-free, so has at most eight
vertices by `R(3,4)=9`, giving at most 52 edges. The substitutions yield
`N=10,P=14,D=90`, with the strict comparisons
`33>32`, `55>52`, `88<90`, and `89<90`; the weak comparisons
`14<=15` and `14-8=6` also hold. Finally `alpha(A)<=4<6`.
All numerical and structural premises of Compatibility 03 apply.

## Permitted use and limits

The stated propagation uses are justified: transversal size lower bounds,
exact deletion defect budgets, weighted occupancy and avoidance, and
intersection of frontier four-transversals. Termination is justified only
for a case meeting the exact strict contradiction hypotheses. None of these
claims decides order 43 or proves a universal transversal-size-five theorem.

No source files, shared indexes, or Git state were edited by this reviewer.
No graph enumeration, solver, canonicalizer, installation, download, or
formal proof checker was used. No novelty assessment was performed.
The numerical literature inputs remain conditional premises, and these
accepted mathematical reductions are not computational nonexistence
certificates. No substantive gap or dependency misuse was found.
