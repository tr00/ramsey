# Whole-K1 obstruction attempt: critical-core exterior and shared-cell stability

Date: 2026-10-19. Task: `k1-whole-branch-obstruction-20261019`.
Task kind: Research. Coordinator/author: Main. Additional proof authors:
CoreSignatureTheory and MixedCoreTheory.

## Objective and outcome

The target was the entire degree-18 K1 branch, across all cross counts,
not another lowest-x slice. No full exclusion was obtained. The new work
proves stronger necessary restrictions on the critical cores, their shared
seven-cell T, and all289 C-D edge variables.

All17 new claims are now independently accepted on their stated premises.
ExteriorCapacityAudit accepted Main's four core/aggregate claims, and
SignatureGeometryAudit accepted the five one-core geometry claims. Main,
distinct from both other authors, accepted the five mixed-core claims and
three dense-cell claims. The exterior audit discharges the latter's
conditional premises. Proof bodies were preserved byte-for-byte.

The setting is the accepted partition {v,u},C,D,T of orders2,17,17,7,
with edge vu, no common root neighbor, two SRG(17,8,3,4) cores, and T
anticomplete to both roots. Write p=e(C,T), q=e(D,T), r=e(C,D), h=e(T),
and W=sum_G(d_G-18). Both core+T sides are K5/I4-free; G is K5/I5-free.
No core-uniqueness or catalogue-completeness premise is added.

## New restrictions

| Quantity | Previous recorded restriction | New independently reviewed restriction |
| --- | --- | --- |
| Exterior nonneighbors of any vertex of a critical17 core in a K5/I4-free graph | no I3; K1 row size at most5 | triangle-free and I3-free, size at most4 |
| T-neighbors of each core vertex | at least2 | at least3; exact missed-row types |
| One-core attachment totals p,q | at least64 | at least65, and at least22+3h |
| Seven-cell edge count h | 5..18 | 6..15 |
| Connected components of T | at most3 | at most2 |
| C-D edge count r | 74..191 | 91..182, plus triangle-moment inequalities |
| Global excess W | at least26 | at least32 |

The degree-18 roots in this branch consequently have x_v,x_u>=173
(previously170); this is branch-specific, not a replacement for the
unrestricted degree-18 lower bound138.

### Critical-core exterior theorem

[critical_core_exterior.md](../n43/d18/critical_core_exterior.md), two claims.
In any K5/I4-free B containing an induced critical17 core H, each core
vertex c has at most four nonneighbors outside H, and those nonneighbors
induce a triangle-free, I3-free graph. At size four the only types are
2K2,P4,C4. This theorem does not require |B|=24.

The key contradiction uses the eight core nonneighbors E of c. Saturated
nonedge packing lets every x in E miss at most one member of any proposed
exterior missed triangle. Labels by that missed member have clique
classes of size at most two; a zero label contradicts the no-isolate
property in the four/five-vertex neighborhoods inside E. Eight vertices
cannot occupy three classes of size at most two. The five-missed-vertex
case is then excluded by a second triangle/label injection.

### Uniform seven-cell density and topology

[triangle_capacity.md](../n43/d18/k1/triangle_capacity.md), two claims.
For F=complement(T), the new missed-row theorem gives

    e(F[W_c])>=|W_c|-2.

Summing over a core and using clique intersections of missed signatures
bounds the same count above by3e(F), giving p,q>=22+3h.
Then168>=p+q+2h>=44+8h excludes every h>=16.
All three possible three-component T shapes are separately impossible:
K3+K2+K2, K3+K3+K1, and K4+K2+K1. The last uses a set of at least10
vertices which would be simultaneously triangle-free and I4-free,
contradicting R(3,4)=9. This also removes h=5.

### Near-minimal one-core geometry

[signature_geometry.md](../n43/d18/k1/signature_geometry.md), five claims.
A hypothetical p=64 forces six eight-point missed signatures and one
seven-point signature, all pair intersections of order three, and exact
multiplicities three/four. The SRG spectral seven-set bound and accepted
S10 outside moments contradict the remaining incidence geometry.
Thus p,q>=65. Exact stability includes

    sum_x (m_x-3)(m_x-4)/2
      +sum_(i<j)(3-|U_i intersect U_j|)=3(p-64).

At p=65 the two possible signature-size patterns cover at least64 of the
68 core nonedges. The identity is necessary, not a completion theorem.

### Mixed C-D triangle budgets

[mixed_core_obstruction.md](../n43/d18/k1/mixed_core_obstruction.md), five claims.
The root consumes one place in each core-triangle common-neighborhood
capacity. D and T therefore share the remaining three places rather than
receiving separate budgets. Every T signature uses at least its size+3
core triangles. A uniform induced-triangle envelope gives four degree
moment inequalities and

    4r+p,4r+q<=795,
    6r+p,6r+q<=1169,
    91<=r<=182.

The manuscript also proves that a suggested combined triangle/opposite-I3
score floor20 is false: S=N_H(x) always has score12. This failed route is
recorded rather than used as an exclusion.

### Dense-cell localization

[dense_cell_stability.md](../n43/d18/k1/dense_cell_stability.md), three claims.
Localizing the nonnegative row/intersection slack and cancelling it against
the total T degree deficit gives

    7d_(complement T)(t)+8h<=140.

Thus h=15 forces complement(T) to have maximum degree2. Its six exhaustive
analytic shapes are P7, C3+P4, C4+P3, C5+P2, C6+P1, and2C3+P1.
They are residual shapes, not constructions or closed cases.

### Direct excess corollary

The reviewed mixed bounds r>=91 and attachment bounds p,q>=65 imply
E_C=r+p-153>=3 and E_D=r+q-153>=3. The accepted side census gives
E_T>=26, so W=E_C+E_D+E_T>=32, hence e(G)=387+W/2>=403.
The accepted root identities x_v=170+E_C and x_u=170+E_D give173.
This is direct substitution, with no additional ambient-graph hypothesis.

## Proof and review hashes

The proof hashes below are the exact author-stage revisions; review files
name the same revisions. Acceptance banners, if later added, must leave
those bodies byte-identical.

| Proof | Author-stage SHA-256 |
| --- | --- |
| `research/n43/d18/critical_core_exterior.md` | `8b8b1101af98e4c6dfe76234e95510bc6b24fcc32887189aac67d481a2dc2f51` |
| `research/n43/d18/k1/triangle_capacity.md` | `35107639650ce2719ffa43d251dbf41d837f7f152ddc2a58fff608edd2ff53a8` |
| `research/n43/d18/k1/signature_geometry.md` | `f5d3e739185bfcfb52c5520406c8c8461814308e5338c6e32564e50c18a840bb` |
| `research/n43/d18/k1/mixed_core_obstruction.md` | `2e1ed67b761847d9b8cc0432c2ef928e0365022262de88c875776d9c005a329d` |
| `research/n43/d18/k1/dense_cell_stability.md` | `d077f32c6a49b68105eedefb3abe93b3d74236ec97f58e154f1195ed59064383` |

Integrated SHA-256 values after adding only acceptance banners:

| Proof basename | Integrated SHA-256 |
| --- | --- |
| `critical_core_exterior.md` | `e30573b5d121f9cbaf01369ad55cfbd109ba12690d66cf4fffdcf30b4344bf19` |
| `triangle_capacity.md` | `c2de4beb5fafc71f2670c8cdf8f61a3c88d3bc83517fb46feab4c9dc975c0ec2` |
| `signature_geometry.md` | `d740562696a0d6223c67f4d7d1978fbc468a3751d1643e294480cace6e7cf7c1` |
| `mixed_core_obstruction.md` | `2dae30c853ac6d7f963b48efb580fd10aefeff116e6c4d7d7d3382e7b9f76ad8` |
| `dense_cell_stability.md` | `d101fd419f229071cff306618b86f5c0b2c46945149fc677e5f93c25f77454a8` |

Removing the delimited integration banners reproduces each of the five
author-stage hashes exactly: checked PASS in the validation kernel.

Reviews:

- [ExteriorCapacityAudit](../n43/d18/k1/review_triangle_capacity_20261019_exterior_audit.md):
  accepted Main's two exterior claims and two capacity/component claims.
- [SignatureGeometryAudit](../n43/d18/k1/review_signature_geometry_20261019_geometry_audit.md):
  accepted all five one-core geometry claims.
- [Main, independent of MixedCoreTheory](../n43/d18/k1/review_mixed_core_obstruction_20261019_main.md):
  all five mixed-core claims accepted.
- [Main, independent of CoreSignatureTheory](../n43/d18/k1/review_dense_cell_stability_20261019_main.md):
  accepted all three dense-cell claims; their exterior/density premises are now independently accepted.

| Review basename | SHA-256 |
| --- | --- |
| `review_triangle_capacity_20261019_exterior_audit.md` | `209a26f8dd167dfec48f4fc1dd6698045f6c695a47247ee9341edb791dcc4060` |
| `review_signature_geometry_20261019_geometry_audit.md` | `b0b0455d48c47c1d829191c1989010894fd48cb07151e24c76cb8498db5e418f` |
| `review_mixed_core_obstruction_20261019_main.md` | `e987a3f3eb9b034929d20d65bf22c854af9de1bd2de5209d23bd5d0c16ac6455` |
| `review_dense_cell_stability_20261019_main.md` | `3ed15e93d596c363ca71e7da099389ead84ec0b97bab1ddbf3a7b1e9d5932d36` |

Accepted input SHA-256 at the author's validation:

| Input | SHA-256 |
| --- | --- |
| `research.json` | `bf434421efcf08b73813866ba8db7e76878700fb65104895539622d8127a069e` |
| `cross_core.json` | `772a3df44e76627408b7933cbb46c51a86368f74dde484665e54a14bfd7bd19d` |
| `seven_cell.json` | `f62130763dfb9315377ad542c33aabef9eb8555370c29db2b61f5e998f780bfd` |
| `../large_row_extensions.md` | `43209c981ceeead3a3820cdce00a016f4477e1be460a5c856e56e7cf597a0ad3` |

These files retain their recorded independent reviews. Literature premises
were not recertified; no novelty review was performed.

## Executed trivial validation

Python3.12.3 (GCC13.3.0), in-memory Eval,30-second cell deadlines. All cells
completed normally. Only exact scalar arithmetic and explicitly fixed tiny
templates were checked; no candidate search, catalogue scan, solver,
download, installation, engine/Lean change, builds or test suites.

- The complements of the three fixed accepted eight-vertex S10/S11/S12
  templates were checked for the degree4/5 and edge-in-triangle facts used
  in the exterior proof. Only these three fixed graphs were used.
- Spectral comparisons were checked by exact integer squares; all eighteen
  triangle-envelope affine comparisons, sixteen parity degree-count rows
  at order7, and two degree-count rows at order6 passed.
- All nine fixed missed-row types passed the localized degree/slack bound.
- Each of the six explicit h15 complement shapes was checked to have7
  vertices,6 edges and maximum degree2. Its T complement passed the T-only
  K5/I4 checks. This does not assert any two-core attachment exists.
- The prior aggregate envelope's1589 scalar(h,L,R) buckets and155057
  scalar(h,L,R,r) positions were reproduced. Intersecting with the new
  aggregate inequalities leaves1210 buckets and107360 positions. These
  are scalar-envelope counts, not graph counts, and the envelope remains
  nonempty. The four degree-moment constraints are not all captured by
  this aggregate projection.
- One fixed real Ramsey side was also checked, not a catalogue scan:
  original input91, the first previously retained survivor, with core mask
  `5ff5f1`. Its B24 K5/I4 and critical-core K4/I4 conditions were checked
  exhaustively. All17 missed exterior rows obeyed the new theorem. Observed
  p=77, h=7 and minimum core-to-T degree4. This is only a valid one-side
  smoke witness, not a43-vertex construction.

The exact graph6 record including its trailing newline has SHA-256
`d6053a50482a5ec633bd5a5989b6127f51e0df91d62381e6c153f5f72b5ab5a2`.
It is the first record of `data/r45_24/k1_survivors.g6`; the corresponding
mask is line2 of `data/r45_24/k1_witnesses.tsv`, from the
[earlier authorized experiment](2026-10-19-k1-catalogue-filter.json).
The following reproduces the exercised fixed-record smoke without scanning
or reading any catalogue file:

```python
from itertools import combinations
line = b'W~zezpdJilqlM~lUTcrSo[E~H|U`HxYJpVcRbkW{eeTpXuh\n'
bits = [(byte-63 >> shift)&1 for byte in line[1:-1] for shift in range(5,-1,-1)]
adj = [set() for _ in range(24)]
pos = 0
for b in range(1,24):
    for a in range(b):
        if bits[pos]:
            adj[a].add(b)
            adj[b].add(a)
        pos += 1
core = {v for v in range(24) if int('5ff5f1',16) >> v & 1}
ext = set(range(24))-core
assert len(core)==17 and all(len(adj[c]&core)==8 for c in core)
assert all(not all(b in adj[a] for a,b in combinations(s,2))
           for s in combinations(range(24),5))
assert all(any(b in adj[a] for a,b in combinations(s,2))
           for s in combinations(range(24),4))
assert all(not all(b in adj[a] for a,b in combinations(s,2))
           for s in combinations(sorted(core),4))
for c in core:
    missed = ext-adj[c]
    assert len(missed)<=4
    assert all(sum(b in adj[a] for a,b in combinations(s,2)) not in (0,3)
               for s in combinations(sorted(missed),3))
p = sum(len(adj[c]&ext) for c in core)
h = sum(b in adj[a] for a,b in combinations(sorted(ext),2))
assert (p,h)==(77,7)
assert min(len(adj[c]&ext) for c in core)==4
assert p>=65 and p>=22+3*h
print('PASS: fixed B24 witness and all17 exterior rows')
```


A dependency-free replay of the scalar envelope check follows. It uses
L=p+h, R=q+h and the existing E_C,E_D in0..102 bounds.

```python
old, new = [], []
for h in range(5,19):
    for L in range(max(76,64+h),93):
        for R in range(max(76,64+h),93):
            if L+R > 168:
                continue
            lo = 153+h-min(L,R)
            hi = 255+h-max(L,R)
            old.append((h,L,R,lo,hi))
            p,q = L-h,R-h
            if not 6 <= h <= 15 or min(p,q) < max(65,22+3*h):
                continue
            new_lo = max(lo,91)
            new_hi = min(hi,182,(795-max(p,q))//4,(1169-max(p,q))//6)
            if new_lo <= new_hi:
                new.append((h,L,R,new_lo,new_hi))
assert len(old) == 1589
assert sum(hi-lo+1 for h,L,R,lo,hi in old) == 155057
assert len(new) == 1210
assert sum(hi-lo+1 for h,L,R,lo,hi in new) == 107360
assert min(lo+L-h-153 for h,L,R,lo,hi in new) == 3
assert min(2*(lo+L+R-h-216) for h,L,R,lo,hi in new) == 32
print('PASS: scalar envelope and excess corollaries; residual nonempty')
```

## Unresolved goal

The attempt did not prove that all surviving core/T attachments are
incompatible. Neither h=6..15 nor the six h15 shapes are asserted feasible
or excluded wholesale. The exact289-bit C-D completion problem remains;
these theorems strengthen its necessary conditions but are not a SAT/UNSAT
certificate or a proof of R(5,5)=43. No new formal Lean proof is supplied.

Integration adds [K1 branch navigation](../n43/d18/k1/README.md) and updates
the degree-18 and results indexes. Accepted earlier proof/JSON bodies,
catalogue artifacts, engine constraints and Lean interfaces are intentionally
unchanged: their weaker inequalities remain sound relaxations. No code
claim is made that the newly proved filters are implemented in the engine.

Final integration checks: all156 local links/anchors across14 changed/new
research and navigation documents passed. Both retained Python blocks were
executed verbatim from this report and passed. All five reviewed-body hash
preservation checks passed before the final navigation integration.
