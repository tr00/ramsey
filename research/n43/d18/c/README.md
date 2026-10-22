# Connected degree-18 neighborhood

Branch name: `research/n43/d18/c`. Parent: [degree-18 branch](../README.md).
Object: rooted graph `(G,v)` with the inherited degree18 and maximum-neighborhood-
density selector. Additional predicate: `G[N(v)]` is connected.

Put `A=N(v)` and `B=M(v)`. Then `|A|=18`, `|B|=24`, `A` is `K4/I5`-free,
and `B` is `K5/I4`-free. `A` may contain independent four-sets. This branch
imposes no zero-excess, saturation, small-cross-count, or separator hypothesis.

Coverage is the connected alternative in the
[reviewed connectivity classification](../neighborhood_connectivity.md#claim-connectivity-01).
The disconnected alternatives have a complete component of order1,2,or3 and
a `(4,4)`-free component; they are not inputs to this branch. Connectedness alone
does not impose a minimum internal degree of two. The branch is **open**.

The [residual-obligation theorem](recursive_ramsey.md) gives six claims ready
for independent review: exact vertex-row differentiation, antichain state
congruence for arbitrary mixed attachments, recursive Ramsey capacities on
overlapping supports, an exact memoized completion recurrence, and its connected
degree18 specialization, and a polynomial-size interface kernel (at most988
obligations of each colour at the 24-vertex `B` phase). The [prototype](recursive_ramsey.py) preserves fixed
pairs and weighted edge budgets and emits an explicit recurrence DAG. It has no
automatic research run or CLI. Its initializer accepts a supplied connected
`A`; it does not provide a complete neighborhood family or encode maximality.
It describes a broader rooted class, which still contains every selected root
with that `A`.

The [report](../../../reports/2026-10-22-d18c-recursive-ramsey.md) records tiny
semantic checks and exact artifact hashes. No order43 completion recursion or
branch exclusion was performed. Production propagation awaits independent review.

The older [zero-neighborhood-excess work](w0/research.json) is a narrower slice:
every `A` vertex has global degree18. Its `q=1` case was separately excluded by
the [reviewed anchor proof](../tau/q1_anchor_reduction.md), forcing `q>=2` and
`x>=140` in that slice. Higher `q` remains open; those facts are not assumptions
of the recursive theorem.
