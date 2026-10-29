# Exact residual obligations and recursive Ramsey completion

Author: /root. Task kind: research with a branch-local prototype.
All six claims are **accepted** after independent review; see the
[review record](#d18c-review-record) below. No novelty claim.

This note gives an exact dynamic program for arbitrary attachments in the
connected degree-18 branch. Its state is a family of overlapping homogeneous-set
obligations, with an exact vertex-elimination rule. Smaller Ramsey bounds apply
at every recursive state, including intersections of obligations inherited from
different roots. Histories having the same state have precisely the same labelled
future completions, even when their processed interiors differ.

The [prototype](recursive_ramsey.py) implements the recurrence, memoization,
weighted edge budgets, and a recurrence DAG. It runs nothing when imported.
The [validation driver](validate_recursive_ramsey.py) with its recorded
[outputs](validation.json) provides the tiny semantic self-check; the
independent review and its own checks are recorded below. An order-43 execution
and a branch-coverage certificate remain separate work.

The separate [quadratic completion development](../../../foundations/quadratic_completion.md)
uses this state semantics to eliminate a reserved matching by 2-SAT for
existence queries. Its matching-specific complexity and hardness results
remain ready for independent review. The implication/Boolean-ideal calculus
and a stronger saturated-cell extension now have independent acceptance:
disjoint inherited five-vertex `(3,3)` cells can be completed together through
three Boolean squares per cell. Those separate results and review scopes are
not part of the six accepted claims below.

## Objects and semantics

All graphs are finite, simple, and labelled. Let `U` be the unprocessed labels.
An obligation `(+,k,X)`, for `X subset U` and `k>=1`, says that the future graph
on `X` has no `K_k`. An obligation `(-,k,X)` says that it has no independent
`k`-set. Obligations may overlap arbitrarily. A state is

\[
 S=(U,\mathcal P,\mathcal M,F,\mathcal B),
\]

where `P,M` are its two obligation families, `F` specifies some fixed edge or
nonedge pairs on `U`, and `B` consists of integer budgets

\[
 L_j\le \sum_{e\in\binom U2} w_{je}z_e\le H_j,
 \qquad w_{je}\ge0.
 \tag{1}
\]

Zero coefficients may be omitted. The implementation uses positive integer
coefficients; rational data can first be multiplied by a common denominator.
`z_e=1` denotes an edge. A *completion* is a graph on `U` satisfying every
obligation, fixed pair, and budget. Write `C(S)` for this set and `f(S)=|C(S)|`.
Empty supports satisfy every positive-threshold obligation, including threshold
one. A nonempty support with threshold one is impossible.

The state describes actual future vertex labels. Equal order, degree sequences,
or numerical residual types do not substitute for equality of support masks.
Relabelling would require transporting all masks, fixed pairs, and coefficients.

## Exact differentiation of an interface

<a id="claim-d18c-residual-derivative"></a>
### Claim 1. Assigning a vertex row gives an exact smaller state

Claim ID: `research/n43/d18/c/recursive_ramsey.md#claim-d18c-residual-derivative`  
Kind: local-deduction  
Review state: accepted  
Scope: every finite state defined above, every `u in U`, every specified future
neighbor set `N subset U-{u}` compatible with its fixed incident pairs  
Dependencies: definitions; compare the [attachment template](../../../../docs/general_theorems/ramsey_attachment_calculus.md#claim-attachment-exact-template),
whose own claim remains unreviewed and is illustrative only here  
Conclusion: the derivative below is in bijection with completions whose `u` row is `N`  
Search use: exact propagation and branching  
Reviews: [independent review](#d18c-review-record)

Put `W=U-{u}`, `D=W-N`. Transport each positive obligation `(k,X)` to

\[
 (k,X\cap W),\qquad (k-1,X\cap N)\quad\text{if }u\in X,
 \tag{2}
\]

and each negative obligation to

\[
 (k,X\cap W),\qquad (k-1,X\cap D)\quad\text{if }u\in X.
 \tag{3}
\]

Apply these rules only after checking that the input is not already impossible
at threshold one. Retain fixed pairs contained in `W`. For a budget (1), let

\[
 b_j(N)=\sum_{v\in N}w_{j,\{u,v\}}.
\]

Remove its coefficients incident with `u` and replace its interval by
`[L_j-b_j(N),H_j-b_j(N)]`. This defines `partial_(u,N) S` before simplification.

Proof. A clique in `X` either omits `u`, giving the first obligation in (2), or
contains `u`. In the latter case its other vertices lie in `X cap N` and form
a clique one vertex smaller. These alternatives are exhaustive and reversible.
The independent-set proof uses `D` instead and gives (3). The forgotten edge
indicators have exactly the specified values, so subtracting their weighted sum
from each budget is an equality. Fixed incident pairs were already checked;
every other fixed pair is preserved. Therefore deleting `u` maps each completion
with this row to a derivative completion. Reintroducing `u` with row `N` is the
inverse map and creates no forbidden set by the same two-case analysis. QED.

Every row is assigned in full before `u` is forgotten. A processed vertex has no
undecided adjacency to the future. This condition is essential: otherwise (2)
and (3) have no permanent supports, and forgetting its identity is unsound.

<a id="claim-d18c-residual-congruence"></a>
### Claim 2. Antichain states preserve arbitrary future completions

Claim ID: `research/n43/d18/c/recursive_ramsey.md#claim-d18c-residual-congruence`  
Kind: local-deduction  
Review state: accepted  
Scope: every state above; every two processed histories with completely assigned
rows whose normalized future state is identical on the same labelled `U`  
Dependencies: Claim 1; elementary containment of homogeneous sets  
Conclusion: the normalization is exact, and identical normalized states have
identical labelled completion sets and counts  
Search use: memoization  
Reviews: [independent review](#d18c-review-record)

Use the following deterministic normalization separately for each colour:

1. Intersect supports with the current `U` and remove obligations with `|X|<k`.
2. Reject a nonempty threshold-one obligation.
3. Remove duplicates. Remove `(k,X)` if a distinct `(ell,Y)` of the same colour
   has `ell<=k` and `X subset Y`.

Conflicting fixed values on one pair reject the state. Combine repeated budget
coefficients by addition; combine identical coefficient vectors by intersecting
their intervals. Clip each interval to `[0,sum_e w_e]`; an empty interval rejects
the state, and an interval covering that range is redundant. Sort every retained
tuple lexicographically. Budget normalization assumes that coefficients refer
only to the current `U`; incident coefficients must be differentiated first.

Proof. Too-small supports cannot contain a forbidden set. Threshold one forbids
each vertex of its support. If a graph has no homogeneous `ell`-set on `Y`, it
has no homogeneous `k`-set on `X subset Y` when `k>=ell`: any such `k`-set
would contain an `ell`-subset. Thus the dominating obligation implies the
removed obligation. The dominance relation is transitive and antisymmetric on
distinct tuples; every removed tuple is dominated by a surviving tuple in a
finite family. Removing all dominated tuples simultaneously therefore preserves
the same conjunction. The fixed-pair and budget operations preserve their
conjunctions by elementary integer arithmetic and nonnegative coefficient bounds.

Starting from an initial state and applying Claim 1 repeatedly yields exactly the
conditions imposed on the future by each fully assigned history. Normalization
does not change these conditions. Two equal normalized states consequently have
the same completion set, independently of how they arose. For any next row their
derivatives again have the same semantics. This is an exact right congruence for
arbitrary fully assigned future rows. It asserts a sufficient equivalence, not
that semantically equivalent states always have the same normal form. QED.

Unlike [uniform boundary profiles](../../../foundations/boundary_profiles.md),
this congruence allows arbitrary mixed attachment rows. It retains overlapping
masks. Arbitrarily supplied states can have exponentially many masks, but Claim 6
proves a polynomial mask bound for states reached from fixed Ramsey prohibitions.
There is no bounded-width or polynomial-time assertion.

<a id="claim-d18c-recursive-capacity"></a>
### Claim 3. Every overlapping obligation admits recursive Ramsey cuts

Claim ID: `research/n43/d18/c/recursive_ramsey.md#claim-d18c-recursive-capacity`  
Kind: local-deduction  
Review state: accepted  
Scope: every state above and any valid upper-bound table `B(p,q)>=R(p,q)`
for positive parameters, with `B(1,q)=B(p,1)=1`  
Dependencies: elementary Ramsey recurrence; any table seeds retain their stated
literature premises in the [baseline](../../../../docs/mathematical_baseline.md)  
Conclusion: intersection capacities (4), row capacities (5), and recursively
generated table entries are sound at every state  
Search use: propagation and local termination  
Reviews: [independent review](#d18c-review-record)

For `(p,X) in P` and `(q,Y) in M`, put `T=X cap Y`. Necessarily

\[
 |T|\le B(p,q)-1.
 \tag{4}
\]

If `p,q>=2` and `u in T`, every completion row additionally satisfies

\[
 |N\cap(T-\{u\})|\le B(p-1,q)-1,\qquad
 |D\cap(T-\{u\})|\le B(p,q-1)-1.
 \tag{5}
\]

Thus if `t=|T|`, its `T`-degree lies in the integer interval
`[t-B(p,q-1),B(p-1,q)-1]`. These cuts can be checked before expanding a row;
the implementation checks the equivalent derived intersection capacities after
expansion. The row is rejected if any derived capacity fails.

Proof. A completion restricted to `T` has neither `K_p` nor `I_q`; its order
is smaller than `R(p,q)` and therefore smaller than the valid upper bound
`B(p,q)`. On `N cap T`, differentiation supplies no `K_(p-1)` and inheritance
supplies no `I_q`; on `D cap T` it supplies no `I_(q-1)` and inherits no `K_p`.
This proves (5), including the threshold-one endpoint where the support is empty.
Subtract the second bound from the `t-1` available vertices for the lower degree
bound. No disjointness of `X,Y`, or of any other supports, was used.

For completeness, a table can be constructed by dynamic programming. Use exact
`B(1,q)=1`, `B(2,q)=q` and their symmetric counterparts. For `p,q>=3`, use

\[
 B(p,q)=\min\{B(p-1,q)+B(p,q-1),\ \hbox{applicable certified seed}\}.
 \tag{6}
\]

Without a seed, the minimum has just the recurrence term. If a graph has order
at least the sum in (6), choose a vertex. Either it has at least `B(p-1,q)`
neighbors or at least `B(p,q-1)` nonneighbors, because the two sets sum to at
least that sum minus one. The first set contains `K_(p-1)` or `I_q`; the second
contains `K_p` or `I_(q-1)`. Adding the chosen vertex when needed proves the
recurrence. Induction on `p+q`, and taking the minimum with a valid seed,
proves that all generated bounds are valid. QED.

The prototype's seeds are `B(3,3)=6`, `B(3,4)=9`, `B(3,5)=14`,
`B(4,4)=18`, and `B(4,5)=25`, with symmetric entries. It generates
`B(5,5)=50`, not a new upper bound and not a premise asserting 43 is excluded.
A failed capacity comparison is a complete contradiction for that exact state;
passing every comparison does not prove that the state is feasible.

<a id="claim-d18c-completion-dp"></a>
### Claim 4. An exact completion recurrence has a finite auditable DAG

Claim ID: `research/n43/d18/c/recursive_ramsey.md#claim-d18c-completion-dp`  
Kind: local-deduction  
Review state: accepted  
Scope: every finite initial state, deterministic chosen pivot at each nonempty
normalized state, all rows compatible with fixed incident pairs, a valid `B`  
Dependencies: Claims 1–3  
Conclusion: (7) computes the exact labelled completion count, terminates, admits
memoization, and zero counts have the explicit recurrence evidence below  
Search use: exact branching and counted coverage  
Reviews: [independent review](#d18c-review-record)

An elementary failure of Claim 2 or capacity failure of Claim 3 has `f(S)=0`.
The empty surviving state has `f(S)=1`. Otherwise choose `u in U` and write

\[
 f(S)=\sum_{N\in\mathcal R_F(u)}f\bigl(\operatorname{norm}
                      (\partial_{u,N}S)\bigr),
 \tag{7}
\]

where `R_F(u)` contains **every** subset of `U-{u}` obeying its fixed incident
pairs. It may be filtered only by proved row impossibilities. An impossible
normalized child contributes zero. Several rows may lead to the same child;
their contributions are repeated in the sum, not deduplicated.

Proof. Every graph on `U` has a unique row at `u`. The fixed-pair condition
therefore partitions the completion set into disjoint row classes. Claim 1
bijection gives each summand, and Claim 2 allows normalization and reuse of equal
states. Claim 3 justifies the optional zero leaves. Every derivative removes one
vertex, so induction on `|U|` proves both the recurrence and termination. The
empty graph is the unique graph on the empty set, and surviving empty budgets
permit its zero edge sum; thus its count is one.

The memo graph is acyclic because `|U|` strictly decreases along every edge.
Without reuse or pruning it enumerates at most `2^(n(n-1)/2)` labelled graphs,
with a finite row tree. Memoization can reduce that number, but a speedup is
not guaranteed. For fixed `n`, maximum thresholds `p,q`, fixed pairs, and bounded
integer input budget data, there are finitely many states: finitely many labelled
supports and threshold tuples, fixed-pair assignments, coefficient subvectors,
and budget residuals. This gives a genuine finite-state DP, with no small-state
claim.

One can retain a DAG containing each state's full tuples, leaf reason, chosen
pivot, every compatible row mask with its child, and its count. To replay it,
check the following contracts independently:

* The recorded initial state is the intended branch input.
* Every zero leaf supplies either an elementary failure or a capacity witness
  `(p,X,q,Y,T,B(p,q))`; the bound has the declared premise/recurrence chain.
* Every branch lists all compatible rows exactly once, and each child is the
  correctly transported and normalized state; a rejected child really fails.
* Every recorded count is the sum of child counts with row multiplicity.
* Empty leaves count one; every edge reduces the remaining vertex count.

Induction over this DAG proves its root count. A root count zero closes only
the **exact input state**. Exhaustive coverage of all initial branch inputs is
an additional obligation. The prototype emits the explicit DAG; its small
independent replay in the [validation driver](validate_recursive_ramsey.py) is
author validation, not independent review or an order-43 certificate. QED.

## Connected degree-18 specialization

<a id="claim-d18c-unified-interface"></a>
### Claim 5. All connected d18 attachments fit one exact recurrence

Claim ID: `research/n43/d18/c/recursive_ramsey.md#claim-d18c-unified-interface`  
Kind: local-deduction  
Review state: accepted  
Scope: fixed labelled connected `K4/I5`-free `A` on 18 vertices; root `v` joined
to `A` and anticomplete to a labelled 24-vertex `B`; arbitrary edges of `B` and
arbitrary `A`–`B` rows; optional valid linear budgets explicitly declared  
Dependencies: Claims 1–4; [exact mixed attachments](../../../../docs/general_theorems/ramsey_attachment_calculus.md#claim-attachment-exact-template);
global 18..24 degree window on the recorded `R(4,5)=25` premise  
Conclusion: the initial state and its row elimination describe exactly the
`K5/I5`-free completions of this fixed connected neighborhood, with the equivalent
interface obligations (8) and the listed smaller-Ramsey corollaries  
Search use: connected-branch completion  
Reviews: [independent review](#d18c-review-record)

Initialize `U={v} union A union B`, `P={(5,U)}`, `M={(5,U)}`, and fix all root
edges and all internal `A` pairs. The full degree window may be imposed as 43
linear budgets `18<=sum_(z!=u) z_{uz}<=24`. The root has exactly degree18 by
its fixed row. This state is exactly the set of ambient `K5/I5`-free completions
of the specified `A`: its two global obligations are their definitions, and the
degree window is necessary for every such graph by `R(4,5)=25`.

Eliminate `v`, whose row is forced. The state inherits the global prohibitions
and adds `no K4 on A` and `no I4 on B`. In particular `A` still **may contain
I4**. Then eliminate all `A` vertices, assigning each of their `B` rows in full.
At the end of this elimination, repeated differentiation gives precisely the
following obligations before normalization:

\[
\begin{array}{ll}
 \text{no }K_{5-|Q|}\text{ on }\displaystyle\bigcap_{a\in Q}R_a,
   &\varnothing\ne Q\subseteq A\text{ a clique},\quad |Q|\le3,\\[4pt]
 \text{no }I_{5-|I|}\text{ on }B-\displaystyle\bigcup_{a\in I}R_a,
   &\varnothing\ne I\subseteq A\text{ independent},\quad |I|\le4,\\[4pt]
 \text{no }K_5\text{ on }B,\qquad\text{no }I_4\text{ on }B.
\end{array}
 \tag{8}
\]

Here `R_a=N_B(a)` are actual row masks. The first two lines are in addition
to the last line. A clique containing `v` has no common neighbor in `B` and
produces only empty supports. An independent set containing `v` has no vertex
of `A`, since `v` sees all of `A`; its only nontrivial contribution is the
`I4` prohibition on `B`. No size-four clique of `A` exists. An independent
four of `A` creates a threshold-one obligation and forces its missed `B` region
to be empty, exactly the column-transversality rule.

Proof. Track each derived obligation by the processed homogeneous set whose
vertices it uses. Its support consists of future common neighbors for a clique,
or future common nonneighbors for an independent set. Taking the inherited
obligation corresponds to omitting the next processed vertex; taking the
decremented obligation adds it to this homogeneous set, and intersects the
support with its appropriate row. It can be added only if that vertex lies in
the current support, exactly the condition that it is adjacent, or nonadjacent,
to all previously chosen vertices. Induction on the processed set therefore
generates every homogeneous set and only such sets. At the end, the root
observations just made reduce the list to (8). Equivalently, decompose every
mixed forbidden set into its `A` and `B` parts; (8) excludes it in both
directions, as in the exact attachment template. Claims 1–4 then give the exact
completion recurrence for these arbitrary row attachments. QED.

The recurrence unifies the following existing necessary restrictions. Each is
a direct specialization of (8), inheritance, and the intersection capacity (4):

| Actual processed configuration | Obligations on the same `B` support | Result |
| --- | --- | --- |
| One `a in A`, row `R_a` | `K4` and `I4` forbidden | `|R_a|<=17` |
| An `A` edge `ab`, support `R_a cap R_b` | `K3` and `I4` forbidden | order at most8 |
| An `A` triangle, common row intersection | `K2` and `I4` forbidden | order at most3 |
| An independent `A` pair `ab`, support `B-(R_a union R_b)` | `K5` and `I3` forbidden | order at most13; hence `|R_a union R_b|>=11` |
| An independent `A` triple, common missed region | `K5` and `I2` forbidden | order at most4 |
| An independent `A` four, common missed region | `I1` forbidden | empty; every column meets the four |
| Disjoint edge `Q` and independent pair `I`, support `(cap_(a in Q)R_a)-(cup_(a in I)R_a)` | `K3` and `I3` forbidden | order at most5 |

The last line is an intersection of obligations from **different** processed
sets. Keeping only the numerical types of individual signature cells would lose
that intersection. Keeping only pairwise outside constraints would lose the
independent-four test. Both survive automatically in the residual state.
The [mixed-cell proofs](../cell_intersections.md) and
[simultaneous obligations](../cell_obligation_cuts.md) may supply further exact
structural or linear cuts on these same supports. They are compatible operators;
their structural classifications are not claimed to follow from capacities alone.

The same machinery applies to a chosen transversal `T` of `I4(A)`: initialize the
core `A-T` with both `K4` and `I4` prohibitions and attach `T` by differentiation.
If its order is `h`, one attached vertex's core neighborhood has no triangle and
no `I4`, hence at most8 vertices. A published core-edge upper bound `U(h)` and
the `K4`-free Turan cap on `T-{t}` then give, for `s=|T|`,

\[
 d_A(t)\ge e(A)-U(h)-8(s-1)-\lfloor(s-1)^2/3\rfloor.
 \tag{9}
\]

Indeed decompose the edges of `A-t` into core-internal edges, the attachment
cuts between the core and the `s-1` vertices of `T-{t}`, and edges within
`T-{t}`, bound them as stated, and subtract from `e(A)`. This recovers the common
deletion-envelope argument in [reviewed deletion transfer](../deletion_degree_transfer.json);
its sharper equality and four-transversal refinements require their own proofs.
Published census entries in (9) remain external premises and are not generated
by (6). This example explains how the same residual calculus also handles a
transversal decomposition, rather than only consecutive pivot roots.

<a id="claim-d18c-polynomial-obligation-kernel"></a>
### Claim 6. A Ramsey history has a polynomial-size residual interface

Claim ID: `research/n43/d18/c/recursive_ramsey.md#claim-d18c-polynomial-obligation-kernel`  
Kind: local-deduction  
Review state: accepted  
Scope: a state reached by completely assigning and forgetting `h` vertices from
an initial `K_p/I_q`-free completion problem on `n` labels, `p,q>=2`; arbitrary
fixed pairs and linear budgets, and `r=n-h` remaining labels; no extra externally
introduced homogeneous obligations  
Dependencies: Claims 1–2; homogeneous-set provenance in Claim 5's proof  
Conclusion: every surviving normalized state has at most `A_p(h)` positive and
`A_q(h)` negative obligations, defined in (10); at the fixed-d18 `B` phase
each count is at most988, with exact completion congruence  
Search use: exact interface compression  
Reviews: [independent review](#d18c-review-record)

Put

\[
 A_k(h)=\sum_{t=0}^{\min(h,k-2)}\binom ht.
 \tag{10}
\]

After `h` processed vertices, each inherited or differentiated positive
obligation is indexed by an actual clique `Q` of processed vertices: its threshold
is `p-|Q|` and its mask consists of the remaining common neighbors of `Q`.
There is one possible mask for each fixed `Q` and the current history. Negative
obligations have the same description with processed independent sets and common
nonneighbors. For a surviving state, threshold-one obligations have empty support
and are removed. Consequently only `|Q|<=p-2` or, in the negative case,
`|I|<=q-2` can contribute retained obligations, giving (10).

Proof. Initially the empty processed set indexes the global obligation. At each
step, the inherited child preserves its indexing set and intersects its support
with the remaining labels. A differentiated child adds the chosen processed
vertex and intersects with its neighbor or nonneighbor row. The vertex lies in
the parent support precisely when that addition preserves homogeneity. Hence
induction gives the claimed provenance and a unique support for each indexing
set. If an indexing set has size `p-1`, its threshold is one: any nonempty common
future neighborhood rejects the state, and an empty support is discarded. No
surviving indexed obligation therefore reaches that size. The argument for
independent sets is identical. Duplicate removal and dominance can only reduce
the number of retained entries. These facts prove the bound.

Even if a dominating obligation was discarded earlier, the later normalized
state is contained in the family obtained by differentiating all the original
obligations without dominance removal: deleting constraints adds no new
provenance. Claim 2 guarantees that omitting the dominated descendants has the
same semantics. Thus the size bound applies to the implemented algorithm as
well as the unreduced mathematical family. QED.

For fixed `p,q`, (10) is polynomial in `h`. Encoding the masks takes at most

\[
 (A_p(h)+A_q(h))\bigl(r+\lceil\log_2\max(p,q)\rceil\bigr)
 \tag{11}
\]

bits for their masks and thresholds, apart from delimiters and support-family
bookkeeping. Fixed pairs need `O(r^2)` bits. Budgets retain coefficient subvectors
of their input vectors and shifted intervals, so their representation is bounded
by the input coefficient size and the bit lengths of their possible residuals;
no new budget is created by differentiation. This is a polynomial-size residual
kernel for each fixed-parameter history, not a polynomial bound on the number of
different histories or states.

For a degree18 neighborhood fully assigned and eliminated, (8) improves the
generic `h=19` bound because the root contributes only the baseline `I4(B)`.
Every nontrivial positive mask is indexed by the empty set, one `A` vertex, an
`A` edge, or an `A` triangle. Every nontrivial negative mask is indexed by the
baseline `I4(B)`, one `A` vertex, an independent pair, or an independent triple.
The negative mask indexed by the empty set, `I5(B)`, is dominated by `I4(B)`
and removed by normalization. The independent-four masks have already been
checked for emptiness. Therefore each colour has at most

\[
 1+18+\binom{18}{2}+\binom{18}{3}=988
 \tag{12}
\]

entries, each using a 24-bit mask and a threshold at most5. This bound requires
no census, small `q`, or degree-excess assumption. The 1,976 masks together
occupy at most47,424 mask bits (5,928 bytes) in a packed representation, before
thresholds, budgets, and data-structure overhead. Python tuples are not asserted
to achieve this byte bound. A larger homogeneous processed set was not silently
dropped: it was either impossible with the future or checked to have empty
eligible support.

Thus the processed interior can be replaced by a polynomial-size conjunction
whose completion semantics is exact under arbitrary future edge assignments.
This is the compression theorem needed for a dynamic-programming treatment of
the mixed interface. The number of possible 24-bit mask families can still be
exponential, and no practical order43 performance conclusion follows.

## Branch contract and implementation limits

The branch [index](README.md) defines d18c as a degree18 root with connected `A`,
under the parent's maximum-neighborhood-density selector. The prototype uses the
broader class of all degree18 roots with the supplied connected `A`. Excluding
that broader fixed-`A` class would also exclude a selected root with this `A`.
Maximality is not encoded. The method imposes no `E_A=0`, small `q`, saturation,
bounded separator, or unavoidable small column assumption.

The explicit prototype labels are `v=0`, `A=1..18`, `B=19..42`; local `A`
adjacency inputs use `0..17`. `d18c_initial` checks connectedness and `K4/I5`
freeness of that fixed small input and constructs the state; it does not run the
DP. Optional cross-count intervals must be valid for the intended subbranch.
The optional `B` interval `144..160` retains the published `(4,5,24)` census,
and is disabled by default. Exact degree sums and cross-count budgets survive
all eliminations by subtraction in Claim 1.

No catalogue of connected `A`, proof of its completeness, large run, or speed
measurement is supplied. The full connected branch and order43 remain open.
An exact-state algorithm is useful here because it turns future closure evidence
into a recurrence with explicit coverage contracts; it does not itself supply
that evidence. The recorded review accepts the six claims and the prototype's
semantic validation; an order-43 execution, its coverage argument, and branch
closure remain separate work.

<a id="d18c-review-record"></a>
## Independent review

Reviewer: independent assistant review, distinct from the author. Covered
sections: all six claims (`#claim-d18c-residual-derivative`,
`#claim-d18c-residual-congruence`, `#claim-d18c-recursive-capacity`,
`#claim-d18c-completion-dp`, `#claim-d18c-unified-interface`,
`#claim-d18c-polynomial-obligation-kernel`), the object definitions, the
prototype, and every linked premise. Outcome: **accepted** for all six claims
with the repairs listed below. No novelty assessment; acceptance is not a
certificate.

Decisive checks.

- Claim 1: the two-case split of a clique (independent set) through a fixed
  row is exhaustive and reversible; the budget shift by `b_j(N)` is an
  equality on the forgotten indicators; the threshold-one guard is exactly
  what prevents transport of threshold zero. `derivative` implements (2),
  (3), and the budget shift literally and rejects rows violating fixed pairs.
- Claim 2: the dominance direction (`ell<=k`, `X subset Y`) is the correct
  implication; removing all dominated tuples simultaneously is sound because
  dominance is a strict order on distinct tuples and every removed tuple is
  dominated by a survivor in a finite family. Budget clipping to
  `[0, sum_e w_e]`, intersection of identical coefficient vectors, and
  rejection of empty intervals preserve the conjunction. Equal normalized
  states have equal derivatives under every row, so the congruence holds as
  the stated sufficient equivalence.
- Claim 3: (4) and (5) follow from `B>=R` alone, including the threshold-one
  endpoints where `B(1,q)=B(p,1)=1`; no disjointness of supports is used, and
  the `T`-degree interval subtracts correctly. Table recursion (6) is the
  standard induction with `min` against valid seeds; the seeds equal the
  baseline values `R(3,3)=6`, `R(3,4)=9`, `R(3,5)=14`, `R(4,4)=18`,
  `R(4,5)=25`, and `B(5,5)=50` is confirmed by both implementations.
- Claim 4: full rows partition completions, Claim 1 bijects each class to its
  summand, and induction on `|U|` gives (7) with row multiplicity. The empty
  leaf counts one because normalization clips every surviving budget to
  contain the zero sum. The listed DAG contracts suffice for replay
  induction.
- Claim 5: the `18..24` window is the baseline's two-sided consequence of
  `R(4,5)=25` at `n=43` (`N(v)` is `(4,5)`-free, `M(v)` is `(5,4)`-free).
  Eliminating `v` and `A` regenerates exactly (8): cliques `Q` of `A` give
  `no K_(5-|Q|)` on `cap R_a` with `|Q|<=3` since `A` is `K4`-free;
  independent sets `I` give `no I_(5-|I|)` on `B-cup R_a` with `|I|<=4`
  since `A` is `I5`-free; `v` contributes only the baseline `I4(B)` plus
  empty supports. All seven table rows re-derive from (4) with the recorded
  bounds, including `|R_a|<=17` and order `<=13` hence `|R_a cup R_b|>=11`.
  In (9), `e(A-t)` decomposes into core-internal, attachment-cut, and
  `T-{t}` edges bounded by `U(h)`, `8(s-1)` via `R(3,4)=9`, and the Turan
  cap; `U(h)` remains an external premise.
- Claim 6: provenance assigns one mask per processed clique or independent
  set; a surviving state carries no threshold-one obligation, so only sizes
  `<=k-2` contribute and (10) follows. Arithmetic checks:
  `1+18+153+816=988`, `1976*24=47,424` bits `= 5,928` bytes, and
  `A_5(19)=1160 > 988`.
- Computational. `python3 research/n43/d18/c/validate_recursive_ramsey.py`
  reproduces the author's self-check on the current text (`status PASS`;
  11,584 normalization and 36,864 derivative truth cases, 181 completion
  states, 1,328 replayed DAG nodes, 10,863 kernel-provenance cases, 36 bound
  cells). `python3 research/n43/d18/c/review_checks_recursive_ramsey.py` is
  the reviewer's independent cross-check against direct graph semantics:
  2,500 randomized mixed states (548,458 graph evaluations) for normalization
  equivalence and DP count against brute force; 40 small analogue
  specializations comparing the eliminated family against (8) and the DP
  count against brute force; 60 random row families on the
  Paley17-plus-leaf fixture with exact accept/reject agreement (37 accepted,
  23 rejected) between elimination and the (8) formula, each accepted family
  matching (8) with at most 988 obligations per colour (observed maxima 84
  and 19); degree-budget transport `43 -> 42` at the root; and
  `ramsey_bound` against an independent recurrence on all 64 cells for
  `p,q<=8`. Both drivers pass.

Repairs applied with this review: removed the dated task bookkeeping from the
header; corrected the attachment-template dependency label (that claim is
still `ready`, and Claims 1 and 5 use it only as an illustrative equivalent);
reworded the (9) accounting as an edge decomposition, since the attachment
cuts lie inside the core; recorded why the `I5(B)` baseline is subsumed by
`I4(B)` in the 988 count; linked the validation outputs; and restored the
validation driver beside the topic after the reports tree removed it,
updating its root computation, dependency paths, and filename.

Limits: no order-43 execution, no branch-coverage or closure argument, no
novelty review, and no performance claim. `U(h)`, the `B` seeds, the
`(4,5,24)` census interval, and the degree window rest on recorded baseline
and published premises. The DAG replay is author-side validation, not a
production certificate; passing capacity comparisons do not imply
feasibility; a root count zero closes only the exact input state.

## Changelog

- Accepted all six claims after independent review; recorded the review, its
  computational checks, and its limits, and activated the search-use fields.
- Repaired the (9) edge-decomposition wording, stated the `I5(B)` dominance
  step behind the 988 bound, corrected the attachment-template review label,
  removed dated task bookkeeping from the header, and restored the
  validation driver beside the topic with current paths (outputs in
  `validation.json`, example certificate in `tiny_dag.json`).
