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

[Safe contractions](safe_contractions.md) supplies independently reviewed
local reductions and the [irreducible/reducible branch split](safe_contractions.md#branch-organization).
[d18ci](d18ci/README.md) contains all original connected neighborhoods with
a marked five-vertex obstruction at every edge. Reduced-order folders are
retained only for proved families:
[d18crn17](d18crn17/README.md) indexes twin, defect and inverse-split families;
[d18crn16](d18crn16/README.md) indexes compatible double-contraction families.
The numbers are guaranteed attained orders, not minimum-order claims.
Individual constructions and their histories are consolidated as
[supporting evidence](safe_contraction_examples.json); they do not create
additional reduced-order branches.
The [family-forcing theorems](safe_contractions.md#family-forcing) allow
generation of whole reducible families using twin counts or six defects
around an independent degree-four neighborhood. A reviewed
[overlap restriction](safe_contractions.md#twin-overlap) excludes the whole
two-twin overlap-two family at `a>=70`; any two residual twin pairs must
have common four-sets meeting in exactly one vertex. The
reviewed [module classification](safe_contractions.md#module-classification)
and [count sharpening](safe_contractions.md#twin-count-sharpening) give at
most two adjacent twin modules and seven nontrivial proper modules in residual
graphs, with an exact weighted quotient for family compression. The
[scientific minimum-core study](safe_contractions.md#minimum-core) supplies
an order-18 neighborhood reaching one vertex at `q=22`, outside the residual
`q=4..15` range, retained as scientific supporting evidence;
positive clique-complex second homology gives a family barrier at order six.
The retained examples are pure neighborhoods, with no order-43
completion or parent-catalogue completeness. The full connected branch remains
open.

The [residual-obligation theorem](recursive_ramsey.md) gives six claims
accepted after independent review: exact vertex-row differentiation, antichain
state congruence for arbitrary mixed attachments, recursive Ramsey capacities on
overlapping supports, an exact memoized completion recurrence, and its connected
degree18 specialization, and a polynomial-size interface kernel (at most988
obligations of each colour at the 24-vertex `B` phase). The [prototype](recursive_ramsey.py) preserves fixed
pairs and weighted edge budgets and emits an explicit recurrence DAG. It has no
automatic research run or CLI. Its initializer accepts a supplied connected
`A`; it does not provide a complete neighborhood family or encode maximality.
It describes a broader rooted class, which still contains every selected root
with that `A`.

The [validation driver](validate_recursive_ramsey.py) records tiny semantic
checks and dependency hashes in [validation.json](validation.json). No order43
completion recursion or branch exclusion was performed. Independent review of
the six claims is recorded in the theorem note; production propagation awaits
an order-43 execution and its coverage argument.

The older [zero-neighborhood-excess work](w0/research.json) is a narrower slice:
every `A` vertex has global degree18. Its `q=1` case was separately excluded by
the [reviewed anchor proof](../tau/q1_anchor_reduction.md), forcing `q>=2` and
`x>=140` in that slice. Higher `q` remains open; those facts are not assumptions
of the recursive theorem.
