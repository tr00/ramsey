# Connected degree-18 neighborhood

Branch name: `research/n43/d18/c`. Parent: [degree-18 branch](../README.md).
Object: rooted graph `(G,v)` with the inherited degree18 and maximum-neighborhood-
density selector. Additional predicate: `G[N(v)]` is connected.

Put `A=N(v)` and `B=M(v)`. Then `|A|=18`, `|B|=24`, `A` is `K4/I5`-free,
and `B` is `K5/I4`-free. `A` may contain independent four-sets. This branch
imposes no zero-excess, saturation, small-cross-count, or separator hypothesis.

The independently reviewed [density-floor investigation](../../density_transfer.md#claim-density-floor-two-higher-neighbors)
proves `a>=63` when at most two A vertices have global degree above 18,
and [a>=58](../../density_transfer.md#claim-density-floor-three-higher-neighbors)
when at most three do. The [four/five-vertex extension](../../density_transfer.md#claim-density-floor-four-five-higher-neighbors)
proves `a>=55` with at most four such vertices and `a>=51` with at most
five. These apply to the original selected root and do not depend on repairs.
At a=50 there must be at least six higher-degree A vertices and at most
18 degree-18 vertices in the whole graph. The
[remaining split](../../density_transfer.md#density-floor-fifty-residual)
forces W>=138 and E_A>=22 if those roots contain an independent triple;
otherwise there are at most 13 and every one has at least ten higher-degree
neighbors. The universal edge floor remains 50.

Coverage is the connected alternative in the
[reviewed connectivity classification](../neighborhood_connectivity.md#claim-connectivity-01).
The disconnected alternatives have a complete component of order1,2,or3 and
a `(4,4)`-free component; they are not inputs to this branch. Connectedness alone
does not impose a minimum internal degree of two. The branch is **open**.

[Safe contractions](safe_contractions.md) supplies independently reviewed
local reductions and the [irreducible/reducible branch split](safe_contractions.md#branch-organization).
[d18ci](i/README.md), physically `d18/c/i`, contains all original connected
neighborhoods with a marked five-vertex obstruction at every edge.
[d18cr](d18cr/README.md) contains the complementary locally reducible branch,
including twin, defect, inverse-split and compatible double-contraction
families. Its first reduced root neighborhood has 17 vertices. The
[ambient clarification](safe_contractions.md#ambient-quotients) states the
additional global safety condition required for the full 42-vertex quotient
to be `(5,5)`-free. This condition cannot be assumed for every local reduction.
Individual constructions and their histories are consolidated as
[supporting evidence](safe_contraction_examples.json); they do not create
additional reduced-order branches.
The [complete marked safe-edge schema](safe_contractions.md#safe-edge-normal-form)
and [trace-coloring classification](safe_contractions.md#safe-split-traces)
give an exact generation scheme for the residual reducible branch, using
small side graphs and bounded split constraints. Exhaustive catalogue and
row enumeration have not been performed.
The independently reviewed [d18cr toolbox ports](d18cr/toolbox.md) transfer
the degree, anchor, interface, averaging/SOS, fixed-B and recursive-obligation
tools through exact split data. Dense-parent connectivity/transversal filters
and an endpoint-preserving completion adapter are available for supplied
parents; no complete parent generator or order-43 run is claimed.
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

The [matching completion algebra](../../../foundations/quadratic_completion.md)
adds a decision-only terminal, ready for independent review: after fixing all
pairs outside a reserved matching, every remaining homogeneous obligation has
clause width at most two. It eliminates the matching by implications, preserving
degree intervals and the stated budget class. This gives `O*(2^(m-d))` existence
search with `m` free pairs and `d` reserved pairs, including 21 reserved pairs
for a fixed d18 neighborhood with its interface still free. The theory proves
the limits for exact counting, general total budgets, and threshold-six
obligations. Direct graph-semantic validation and a supplied order-42 cofactor
pass; no branch closure or production engine integration is claimed.

The independently reviewed [saturated-cell extension](../../../foundations/quadratic_completion.md#cell-square-coordinates)
uses five-vertex `(3,3)` intersections of inherited obligations. Each is a C5
whose twelve labelled graphs partition into three Boolean squares. For `k`
disjoint such cells and an uncovered matching of size `r`, the exact decision
bound is `O*(3^k 2^(m-10k-r))` when the cell interiors are free. Ordinary and
weighted degree bounds are preserved. A supplied Exoo order-42 residual has
three usable disjoint cells and passes full reconstruction checks; a uniform
packing bound for this degree-18 branch remains open.

The older [zero-neighborhood-excess work](w0/research.json) is a narrower slice:
every `A` vertex has global degree18. Its `q=1` case was separately excluded by
the [reviewed anchor proof](../tau/q1_anchor_reduction.md), forcing `q>=2` and
`x>=140` in that slice. Higher `q` remains open; those facts are not assumptions
of the recursive theorem.
