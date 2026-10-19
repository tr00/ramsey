# Transversal-size branching (tau scheme)

Branch name: `n43/d18/tau`. Parent: [degree-18 pivot](../README.md).
State: scaffolding. No run, no exclusion, no computation.

Date: 2026-10-19. Task token: `tau-scaffold-20261019`.

Scheme: a cross-x refutation overlay for the open degree-18 cells, split by
the minimum transversal size

```text
tau_4 = tau(K4(F)),  F = complement of G[A] on A,
```

where `K4(F)` is the family of 4-cliques of `F`, equivalently the family of
independent 4-sets (I4) of `G[A]`. The branches below are predicates added
on top of a fixed x cell and a fixed B; they are an overlay on the existing
x-cell and q-profile splits, not a new partition of them. This folder
records predicates, assumptions, and the coverage argument only.

## Shared assumptions

Inherited in full from [n43/d18](../README.md): G order-43, K5/I5-free,
chosen pivot v of degree 18, `A=N(v)` of order 18, `B=M(v)` of order 24,
A is (4,5)-free, B is (5,4)-free, `x=e(A,B)`, `q=85-e(A)`, `x=136+2q+E_A`.
Additionally shared by every child:

- (S1) `K4(F)` is the family of independent 4-sets of `G[A]`. A transversal
  meets every member of `K4(F)`; `tau_4` is its minimum size. A may contain
  I4. No I4 prohibition on A is assumed anywhere in this scheme.
- (S2) Every column `C_y=N_A(y)`, y in B, is a `K4(F)`-transversal: an I4 of
  `G[A]` disjoint from `C_y` together with y is an I5 of G
  ([frontier band](../frontier_band.md)). Hence `tau_4 <= |C_y|` for all y
  and `24*tau_4 <= x`.
- (S3) Superset closure: a `K4(F)`-transversal contained in A extends to any
  size `t<=18`. Hence "a t-transversal exists" is equivalent to
  `tau_4 <= t`.
- (S4) Fixed-B scope: every rung is stated per fixed (5,4)-free B. No
  catalogue-wide statement is made here.
- (S5) The A-label relocation reduction
  [symmetry.md](symmetry.md#claim-tau-symmetry-01) (ready, unreviewed)
  collapses the `C(18,t)` labeled transversal branches to the single
  instance with `T = {a_0,...,a_{t-1}}`.

## Established inputs

| Input | Status | Source |
| --- | --- | --- |
| `tau_4>=4` whenever `q<=2` | proved; formalized | [frontier band](../frontier_band.md), [four-transversal bound](../transversal_four.md), [Lean](../../../lean/Ramsey/theorems/TransversalFour.lean) |
| Every four-set transversal excluded at x=137 | independently accepted 2026-10-18 | [effective anchor](../x137/effective_anchor.md#claim-x137-no-four-transversal) |
| Every four-set transversal excluded at x=136 under equality assumptions | reviewed | [five-column compatibility](../x136/five_column_compatibility.md#claim-five-columns-no-four-transversal); x136 itself closed per user report |
| Deletion budgets for a t-transversal | accepted | [transversal deletion](../../../docs/general_theorems/transversal_deletion.md), [frontier band](../frontier_band.md) |
| Recorded edge-count totals reach 65 (t=4), below `e(F)=68+q` | recorded | [lemma phase II section 8](../../../docs/lemma_phase_2.md) |
| r=0 count structure (`s=8-k+H`, `5s<=54`, eight-vertex alternatives) | internally audited; extends to q<=2 cells | [small columns](../x136/small_columns.md) |

## Coverage argument

Fix B and an x cell. Every feasible extension has exactly one `tau_4` value.

1. If `tau_4<=4`, then by (S3) a 4-transversal exists, and by (S5) the
   [t4](t4/README.md) instance is satisfiable. UNSAT of t4 gives `tau_4>=5`.
2. If `tau_4<=5`, likewise [t5](t5/README.md); UNSAT of t5 gives `tau_4>=6`.
3. `tau_4>=6` forces `x>=24*6=144` by (S2), contradicting `x<=143`
   ([closure](closure/README.md#claim-tau-closure-01)).

Hence UNSAT of both rungs closes each cell `137<=x<=143` for that B. Three
recorded orderings, all sound because branches may overlap while every
branch is refuted:

- Ladder: refute t4 first — its refutation is the standalone `tau_4>=5`
  strengthening proposed in
  [lemma phase II section 8](../../../docs/lemma_phase_2.md) — then t5.
- Shortcut: UNSAT of t5 alone already gives `tau_4>=6` and the closure
  contradiction. t4 is retained as the expected-easier instance and for its
  standalone lemma value.
- Pairing without t5: UNSAT of t4 together with UNSAT of the relaxation
  branch [columns5](columns5/README.md) (all `|C_y|>=5`) also covers the
  cell: any candidate without a 4-transversal has `tau_4>=5` by (S3), hence
  all columns `>=5` by (S2).

The ladder needs no `q<=2` premise; column-floor structure used inside
branches does (see each child).

## Children

| Child | Predicate | Status |
| --- | --- | --- |
| [t4](t4/README.md) | `{a_0,...,a_3}` is a `K4(F)`-transversal | Scaffolding; no run |
| [t5](t5/README.md) | `{a_0,...,a_4}` is a `K4(F)`-transversal | Scaffolding; no run |
| [columns5](columns5/README.md) | all 24 columns have size `>=5` | Scaffolding; no run |
| [closure](closure/README.md) | arithmetic cap `24*tau_4<=x` | Claim ready, unreviewed |

Shared reduction: [symmetry.md](symmetry.md) (ready, unreviewed).

## Applicability

| x | k=x-136 | Rungs | Notes |
| --- | --- | --- | --- |
| 136 | 0 | none | Closed per user report; closure evidence pending integration ([x136](../x136/README.md)) |
| 137 | 1 | t5 + closure | `tau_4>=5` already accepted; columns5 is the whole live r0:s7..10 space ([x137](../x137/README.md)) |
| 138..142 | 2..6 | t4, t5 + closure | All open; per-x q-profile children exist; the ladder itself needs no q premise, including the x=142 q=3 cell |
| 143 | 7 | t4, t5 + closure | Inside the residual branch [x-ge143](../x-ge143/README.md); `24*6=144>143` |
| >=144 | >=8 | additionally t6, ... | Cap permits `tau_4=6`; see the extension formula in [closure](closure/README.md). Folders not created. |

## Scope limits

- Per fixed B only; a full order-43 exclusion needs every catalogue B, the
  residual x>=144 rungs, and the other pivot-degree branches.
- Computational exploration is paused by default; any rung run requires
  explicit user authorization and follows
  [reproducibility policy](../../../docs/reproducibility.md), including
  measuring OPB and proof-trace growth before enabling proof logging.
- UNSAT of rungs is candidate evidence, never a certified Ramsey result.
  SAT of any rung is a 43-vertex candidate: verify by exhaustive 5-subset
  checking before any bound claim, and report immediately.
- This overlay does not impose anything on the d20 or min-degree20 lines.
