# Independent review of density re-rooting

Date: 2026-10-21. Review task: `density_rerooting_audit`.

Claims: the nine anchored claims in [density_rerooting.md](density_rerooting.md).
Author: Main `/root`. Independent reviewer: Codex subagent
`/root/density_rerooting_audit`. The reviewer did not contribute to the proof.

Reviewed revision: working-tree HEAD
`3eebcca5e627fdc3df5f26fd2a1925a7c121153f`; the proof is uncommitted.
Acceptance below applies to the exact proof SHA-256
`381ee81feb7fc8518badfce095ed589a2351406c2eaf2e08bbe61470aeb4203d`,
recomputed before and after review. The proof remained unchanged.

**Outcome: accepted for all nine claims on the recorded external premises.**
No substantive mathematical gap or required repair was found. Two optional
wording clarifications are recorded below. This review supplies independent
mathematical evidence; it does not promote proof metadata or branch indexes.

## Per-claim outcomes

| Claim anchor | Outcome | Decisive independent check |
| --- | --- | --- |
| [claim-reroot-family-transport](density_rerooting.md#claim-reroot-family-transport) | accepted | Summing the actual degree-18 root budgets gives `sum_F q <= t B0 - J_F`. Integer averaging gives the displayed floor; strict improvement requires `J_lo > t(B0-q_v)`. The multiple-destination denominator is positive under its stated hypothesis, and non-improving destinations have `E_u<=B0-q_v`. Both attachment lower counts retain exactly `F subset P`. |
| [claim-reroot-independent-four](density_rerooting.md#claim-reroot-independent-four) | accepted | For any degree-18 t-set, `sum_I q<=4t+sum_j(t-2j)W_j/2`. Independence supplies precisely the additional signature restrictions. For four roots `W0=0` and `sum_I E=2W-Delta`, so the cancellation is exact. Singleton classes are cliques of size at most three, giving `W1<=72` and a destination with at least 63 edges. The 14/25-root occurrence thresholds invoke `R(5,3)=14` and `R(5,4)=25` on the actual induced root family. |
| [claim-reroot-pair-sum](density_rerooting.md#claim-reroot-pair-sum) | accepted | Recomputed the four cell orders and the degree sum on S. Eliminating its internal degree terms gives the exact coefficient `16+2gamma`. X,Y are K4/I4-free for both root relations. For a nonedge Z is K5/I3-free, and `N_Z(s)` is K4/I3-free, so its order is at most 8. For an edge only the trivial cut cap is used; no K4 prohibition is imposed on Z. All table constants and strict source cutoffs match. |
| [claim-reroot-small-neighbor](density_rerooting.md#claim-reroot-small-neighbor) | accepted | An eligible u has `|R|=17-s`. The root-neighbor contribution is exactly s; intersections of rows of sizes `17-s` and `17-w(t)` inside B24 have lower bound `10-s-w(t)`. R is K4/I4-free by its u anchor and the B ambient type. All base bounds and three examples are correct. The stipulated `epsilon_u=0` is essential and retained. |
| [claim-reroot-small-column](density_rerooting.md#claim-reroot-small-column) | accepted | An eligible B vertex has `|R|=18-c`, with R K4/I4-free, hence `c>=1`. For t in C, remove y from its B row before intersecting inside B minus y, of order 23; this gives `(16-w(t))+(18-c)-23=11-c-w(t)`. All examples and the full `c=1..18` lower-bound domain check out. |
| [claim-reroot-k2](density_rerooting.md#claim-reroot-k2) | accepted | Row sizes `16+epsilon_u` and `16+epsilon_w`, together with lower intersection `r_u+r_w-24` and the edge cap 8, force both excesses zero and intersection 8. The source has 61 edges and each destination has exactly `1+60+8=69`. The destinations are connected, since 69 is beyond every disconnected edge slice. |
| [claim-reroot-k3](density_rerooting.md#claim-reroot-k3) | accepted | Pair excess sums at most 2 force the exact retained alternative `(1,1,1)` when no small vertex is eligible. Every zero-excess small vertex gives at least `3+50+6+6=65>58`. In the degree 19 alternative, the actual eligible core family and its exceptional B class give the independent sum bounds 254,288,334 at z=0,1,2, hence destinations with at least 69,65,60 edges respectively. The remaining z>=3 case is left open. |
| [claim-reroot-k1-transport](density_rerooting.md#claim-reroot-k1-transport) | accepted | Independently re-derived the offsets and three excess budgets. Weighted attachment counts give the stated J lower bound; discrete convex balancing of the 17 D excesses is valid throughout 0..6. Exact scalar minimization and separate offset maximization reproduce K1 root-sum maxima 135,186,247,236, guarantees 78,74,69,69, and all refinements. Destination family size is the actual `17-z`; neither isolated root is used for strict improvement. |
| [claim-reroot-max-zero-excess](density_rerooting.md#claim-reroot-max-zero-excess) | accepted | Nonnegative excess makes every vertex of the same zero-excess neighborhood globally degree 18. The complete disconnected classification then applies: K1 has z=0, K2 has its unconditional move, and K3 has eligible small vertices. Each produces a strict contradiction to global maximum density over P. The conclusion retains both maximum density and zero excess at the same root. |

## Key derivations and coverage checks

The common budget was re-derived without using the author's validator.
Summing degrees in the 18-vertex A gives `x=306+E_v-2a_v`. The total edge count is
`387+W/2`, so `b_v=148+W/2-q_v-E_v`. Complementing the published
(4,5,24) edge interval gives `144<=b_v<=160`; its lower endpoint gives
`q_v+E_v<=W/2+4`, and its upper endpoint gives
`W<=24+2q_v+2E_v`. The global degree interval follows from the two correct
ambient types and `R(4,5)=25`. Thus all excesses used for weighted lower
counts are nonnegative, `q>=0`, W is even, and B0 is integral.

For family transport, if no destination improves then each has `q_u>=q_v`,
so each has `E_u<=T0`. If M destinations improve, the weighted incidence
sum is at most `t T0+M(U0-T0)`. The displayed ceiling is therefore a
necessary lower bound for M. The cases `T0<0` and `U0<=T0` are stated in
the correct direction. Integral averaging remains valid for negative
intermediate deficit bounds; a negative final q bound refutes the
specified configuration.

For independent triples the empty signature class is a clique: a nonedge
inside it would combine with the three independent roots to give I5.
K5-freeness bounds this clique by four, hence `W0<=24`. For an independent
four, each singleton class is a clique by pairing a nonedge with the
other three roots; its root adjacency bounds the clique by three.
The four singleton classes contribute at most `4*3*6=72` excess. The
63-edge guarantee and the example Delta thresholds 51,27,3,-9 use floor
rounding correctly, including negative Delta. The threshold claims are
conditional on supplied anchors unless the stated root-family cardinality
forces occurrence. No local neighbor is inferred from a global root count.

For Claim 3 the independently reconstructed identity is

```text
a_v+a_u = 2e(S)+e(X)+e(Y)+e(S,X)+e(S,Y)+2 gamma k,
18k+E_S = 2k+2e(S)+e(S,X)+e(S,Y)+e(S,Z).
```

Subtracting yields the claimed pair sum. The lower-bound function is used
only at actual orders 0..17: adjacent pairs have `k=0..13`, and nonadjacent
pairs have `k=1..8`. At an edge with k=0, each neighborhood is an isolated
root plus an order 17 K4/I4-free graph, so the exceptional equality 68 for
both endpoints is correct even though the strict source cutoff 67 then
describes an impossible source. The table makes no unsupported overlap
occurrence assertion.

For K3 core transport, the 15-vertex core degree interval 6..8 follows from its own
K4/I4-freeness. A B vertex y missing one small vertex u has C-nonneighbors
with no I3 (such a triple plus u,y would give I5). Their order is at most 8,
so y sees at least 7 core vertices. A core vertex with positive excess sees
at least `6-(z-1)=7-z` eligible core vertices. Vertices adjacent to the
whole small triangle are the only omitted B class; the triangle's complete
common neighborhood is independent of order at most 4 and includes v,
leaving at most 3 exceptional B vertices and at most 18 excess. The three
small vertices have total excess 3 and no core attachments. Hence
`J_F>=(7-z)(W-21)` for the displayed z=0..2 scope. Substituting the original
root's upper W bound is sound because the coefficient in the q sum is
`(1+z)/2>0`. No degree 19 small vertex is used as a degree 18 destination.

For K1, direct degree sums give `E_D-E_C=j-i` and
`E_T=26+i+j`; consequently `W=2E_C+26+2j` and
`B0=17+E_C+j`. The 17 C and D core vertices are 8-regular by the local
Ramsey degree caps; their SRG codegree identity and catalogue uniqueness
are unnecessary for this proof. Every T vertex sees at least 9 C vertices
because C minus that signature has no I3 and no K4. A D vertex has
`d_C+d_T=9+epsilon` and `d_T<=7`, giving
`d_C>=2+epsilon`. These facts re-derive J without assuming graph
realizability of any scalar profile.

The convex function in Claim 8 has successive nondecreasing integer slopes:
for z<=2 it is a quadratic with second difference 2; for z>=3 it is zero
up to d=z-2, then starts with the positive slope z-1 and continues with
second difference 2. Thus balancing is valid on the bounded excess domain.
For the displayed table rows the q-sum bound reduces to

```text
55+5j-6i                                          (z=0),
64+6E_C+6j-6i-2 max(0,E_C+j-i-17)                  (z=1),
73+7E_C+7j-6i-2 max(0,E_C+j-i-17)                  (z=2),
82+8E_C+8j-6i-2 max(0,E_C+j-i-17)                  (z=3, E_C<=4).
```

Each expression increases with E_C,j and decreases with i, including on
both sides of the max breakpoint. Its stated extremum is at i=0,j=16.
Dividing by 17,16,15,14 respectively gives the advertised integer floors.
Exchanging the two actual cores is sound because v,u have equal source
density 68. At a maximum-density K1 root each core must therefore have at
least 3 positive-excess vertices, with total excess at least 5 when it has
exactly 3. This remains a necessary restriction, not a K1 exclusion.

The disconnected classification was independently reconstructed from
`alpha(A)=4`, additive independence across components, the clique size
cap 3, and the order cap 8 for a K4/I3-free component. Independence profiles
(2,2), (1,1,2), and (1,1,1,1) cannot reach order 18. Only (1,3) remains,
with the three small clique orders 1,2,3 and source densities 68,61,53..58.
This closes the case coverage needed in Claim 9. Every strict move keeps
the graph and global degree 18 fixed and increases an integer density in
50..85, so the termination count is correct. A local terminal root does
not gain the properties of a global maximum without a further argument.

## Findings and suggested wording

No required mathematical repair was found. These optional clarifications
would make the already valid scope easier to read:

1. At proof lines 390..392, “the A-side test above cover[s] every eligible
   vertex” can be read more broadly than Claim 4's stated `s=0..7` scope.
   Its exact decomposition in fact holds for all eligible A vertices;
   the intersection lower bound extends to `s=0..17` using the defined L
   function, often with a weak value. State that extension explicitly,
   or say that the exact formulas cover all destinations while the
   displayed small-row estimates are scoped to s<=7. This does not affect
   any claimed certificate or subsequent disconnected-case proof.
2. Claim 6's display `N(u)={v,w} disjoint-union R_u` is a disjoint union of
   vertex sets. It must not be interpreted as graph disjoint union:
   the very next count correctly includes 8 edges from w into R_u.
   Replacing that phrase by ordinary union of disjoint vertex sets would
   remove the ambiguity without changing the proof.

Neither x137 nor x138 closure is used. The core-cap dependency lives in an
x136 directory, but its stated scope is every K4/I4-free graph of the
specified order; its proof uses no frontier hypothesis or x136 closure.
No restriction on destination E or x is inferred from its density gain.
No new theorem forces a dense root or excludes the retained connected,
general K1, or z>=3 degree 19 K3 cases.

## Independent arithmetic evidence

The reviewer wrote and ran
[review_density_rerooting_20261021_independent_audit.py](review_density_rerooting_20261021_independent_audit.py),
SHA-256 `20790a153f5d22d972925d405a132f03f2dd0a2270bca79b9fa86536dd00d9ae`.
Command from the repository root:

```text
python3 research/n43/d18/review_density_rerooting_20261021_independent_audit.py
```

Exit status 0, outcome PASS. It does not import or execute the author script.
It checks 36 pair identities and 72 A/B neighborhood identities on a single
fixed arbitrary graph of order 9, only as algebraic identities. It separately
recomputes the pair table, small-row/column base bounds, and the order 10
Goodman cap. A scalar dynamic program minimizes the weighted D cost for
all 17 values z=0..16 and 103 excess totals 0..102 (1,751 checks), independently
confirming convex balancing. It then maximizes the K1 q-sum bounds over
the permitted offset envelope and table excess ranges:

| z | Scalar profiles | Maximum q sum bound | E_C,i,j at a maximum | Guaranteed edges |
| --- | --- | --- | --- | --- |
| 0 | 81 | 135 | 0,0,16 | 78 |
| 1 | 641 | 186 | 6,0,16 | 74 |
| 2 | 1,382 | 247 | 12,0,16 | 69 |
| 3, E_C<=4 | 215 | 236 | 4,0,16 | 69 |

All K1 refined bounds and K3 uniform bounds 254/288/334 were independently
reproduced. These are scalar checks of the proved inequalities. They are
not graph generation, candidate search, or evidence that a maximizing
scalar profile is realizable.

## Dependencies reviewed and limits

The following hashes identify the dependency text actually consulted.
Published Ramsey values and census edge intervals were checked against
the repository's cited table and in the correct ambient direction. Their
published certification was not independently replayed.

| Dependency | SHA-256 | Review use |
| --- | --- | --- |
| [README.md](../../../README.md) | `c7c87fcd814879ad9a15a5a7137d152f55d5edf366cd4aca847b4c692075eaf0` | Recorded Ramsey values and published edge intervals. |
| [reductions.md](../reductions.md) | `3bd4aa599896e88436e83241216638d51848c38ad580c768ba86b0b274f59ca2` | Degree interval, row identity, and universal cell types re-derived. |
| [pivot_classes.md](pivot_classes.md) | `ab0849cf011c8b830eb5ded2a67d9439776caf7535c19bcf6ef79280cd61081c` | q/E/W budget and antineighborhood bounds re-derived. |
| [neighborhood_connectivity.md](neighborhood_connectivity.md) | `b67a6083ad065cb51febd75bbc9c0aff7a6a64fcf33580d0e7d8378bcc885bb0` | Component coverage, source edge slices, and row cap checked. |
| [obstruction_coverage.md](obstruction_coverage.md) | `7f5e7da7b5ee9d5dbf7ee505ee44f69778a83c70dd1762f28d35fef336f1c2a7` | Two-root cell theorem and independent-signature obstructions checked independently. No closure claim is used. |
| [large_row_extensions.md](large_row_extensions.md) | `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` | 17-core regularity and codegree statement checked; only regularity is required. |
| [k1/research.json](k1/research.json) | `bf434421efcf08b73813866ba8db7e76878700fb65104895539622d8127a069e` | Actual double-core decomposition, degrees, side types and attachments re-derived. |
| [k1/seven_cell.json](k1/seven_cell.json) | `f62130763dfb9315377ad542c33aabef9eb8555370c29db2b61f5e998f780bfd` | Offset envelope, T excess and side-census budgets re-derived. |
| [k1/cross_core.json](k1/cross_core.json) | `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d` | Consistency check only; no scalar-bucket, packing, or residual-exclusion result needed. |
| [connected_structure_transfer.json](connected_structure_transfer.json) | `4f7abd8d1dcd5fae9e08b8123ea76427af7f4678310f51af78fcb36f42a9bd13` | Accepted connectivity thresholds 70/75/81 checked for applicability; separator proof not re-audited in full. |
| [x136/five_column_compatibility.md](x136/five_column_compatibility.md#claim-five-columns-core-caps) | `ceac4b53cb09c94ec9b2dd850208c865f0bab12c9b203b7a3de51b7a26acbf88` | Unconditional order 10 K4/I4 upper cap 31 independently checked, giving lower cap 14 by complementation. Other frontier claims are unused. |

For the L function, Turan's theorem on the K4-free complement gives the
listed nonnegative elementary bounds at orders 0..9. At orders 11..17
the listed lower bounds are exactly the retained McKay--Radziszowski 1992 census premises. At order 10 the Goodman
argument retains both triangle and independent-triple terms; checking all
allowed degrees 1..8 gives `g_10(d)+6d<=74`, whence `e<=floor(95/3)=31`.
Complementation gives `L(10)=45-31=14`. The (4,4,16) exact 60 and the
(4,4,15) interval 50..55 are used in the correct direction. The 17-core
68-edge value follows directly from regularity and does not require a
census uniqueness premise.

The proof author remains distinct from the reviewer. The author report,
validator, validation output and manifest were treated as self-check
provenance, not independent evidence. No solver, theorem prover, download,
catalogue scan, candidate graph search, novelty review, or formal certificate
replay occurred. Only this review and its small sibling audit script were
created; the frozen proof, proof metadata, indexes, WORK.md, Git staging,
and concurrent changes were left untouched.
