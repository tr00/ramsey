# A-label relocation for fixed-B transversal branches

Date: 2026-10-19. Task token: `tau-scaffold-20261019`. Author: Main,
working alone. No computation, solver run, download, or Lean change was
used. No novelty claim is made; this is a routine relabeling observation
recorded so the rung branches can cite one fixed-label instance.

Purpose: collapse the `C(18,t)` labeled `K4(F)`-transversal branches of the
[tau scheme](README.md) to a single fixed-label instance per size t.

<a id="claim-tau-symmetry-01"></a>

## 1. Fixed-B extensions are invariant under relabeling A

Claim ID: `research/n43/d18/tau/symmetry.md#claim-tau-symmetry-01`
Kind: local-deduction
Review state: ready
Scope: every fixed (5,4)-free B on 24 vertices, every feasible extension of
the d18 setting for that B (see proof), every t with `1<=t<=18`
Dependencies: definitions of the d18 setting ([research/n43/d18](../../README.md));
superset closure (S3) of the [tau scheme](README.md)
Conclusion: If some feasible extension of the fixed B has a `K4(F)`
-transversal of size t, then some feasible extension of the same B, with
the same `e(A)`, the same x, and the same multiset of column sizes, has
`{a_0,...,a_{t-1}}` as a `K4(F)`-transversal. Consequently UNSAT of the
fixed-`T_t` branch instance implies that no feasible extension of that B
has any `K4(F)`-transversal of size at most t.
Search use: symmetry
Reviews: none

Proof. Fix B, v, A with `|A|=18`. Call a pair `(G[A], (C_y)_(y in B))`
feasible when the assembled graph on `{v} u A u B` — v adjacent exactly to
A, B inducing the fixed graph, each y adjacent exactly to `C_y` — is
K5/I5-free; then v has degree 18. Let pi be any permutation of A and apply
it simultaneously to `G[A]` and to every `C_y`. The result is again a
feasible extension of the same B: it is the same assembled graph up to
renaming the A-vertices, and K5/I5-freeness, `e(A)`, x, and every column
size are invariant under renaming. Independent 4-sets of `G[A]` correspond
bijectively under pi, so `T` is a `K4(F)`-transversal if and only if
`pi(T)` is one for the relocated extension. The full symmetric group on A
is transitive on t-subsets, so pi may be chosen with
`pi(T)={a_0,...,a_{t-1}}`. The final implication combines this with
superset closure: refuting the single t-transversal instance refutes all
t-transversals, hence all transversals of size at most t.

Caveats that must be re-checked for every row set added to a rung instance:

- The reduction is valid only if every additional restriction is itself
  invariant under relabeling of A, or is added only in invariant
  combinations. `e(A)`, x, `E_A`, column sizes, and the counts r and s are
  invariant. Any row distinguishing A labels, a specific label, or a
  specific column y breaks the orbit argument for that instance.
- The reduction does not mix different B graphs, different x cells, or
  different pivot-degree branches.
- It uses nothing about automorphisms of B; only A is relabeled.
- Without this claim, each rung expands to its `C(18,t)` labeled
  sub-branches (3060 at t=4, 8568 at t=5); refutation certificates obtained
  under the reduction are conditional on its acceptance.

Audit: labeling invariance of K5/I5-freeness, of the assembled-graph
construction, and of transversality; subset transitivity of the symmetric
group; superset closure. All elementary. Self-audit only; this claim has
not been independently reviewed.
