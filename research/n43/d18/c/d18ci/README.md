# Irreducible connected degree-18 neighborhoods

Branch name: `d18ci`. Parent: [connected d18c](../README.md).
Scope: **all** original instances of the connected degree-18 branch whose
18-vertex neighborhood admits no safe edge contraction. The narrower residual
`q`, connectivity and transversal assumptions used by the examples are not
part of this branch definition. The branch is **open**.

For each existing edge `uw` of `G[A]`, require a triangle on three vertices
of `(N_A(u) union N_A(w)) minus {u,w}`. Equivalently, every edge has a
**marked** induced five-vertex obstruction of one of the two types in the
[shared proof](../safe_contractions.md#further-reach). Merely containing
unmarked copies somewhere in the graph does not meet the branch predicate.

Irreducibility concerns `(4,5)` edge contractions inside `G[A]`; it does not
assert irreducibility under vertex deletion, arbitrary vertex identification,
or ambient `(5,5)` contractions. The original order-43 graph, pivot, columns
and selected-root condition remain those of the parent branch.

The [retained pure instance](instances.json) has `a=71`, `q=14`, connectivity
six and `tau_4=6`. Its artifact includes an obstruction triangle and the marked
pattern for **each of its 71 edges**. It is independently reviewed as a pure
local example, not an order-43 extension or a complete irreducible catalogue.

The [branch split and coverage convention](../safe_contractions.md#branch-organization)
and all proofs and review findings remain in the shared topic. Run
`python research/n43/d18/c/verify_safe_contractions.py` to check the retained
instance and full obstruction coverage.
