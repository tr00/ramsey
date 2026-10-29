# Quadratic completion: matchings and inherited five-cycle cells

**Authors:** /root (Theorems 1--7, the matching prototype, and the literal-chart
optimality sublemma in Theorem 8);
`/root/structural_quadratic_remainders` (Theorems 8--10 and the cell-square
prototype). **Kind:** proved-here deductions with executable research prototypes.
**Review states:** Theorem 2 and Theorems 8--10, including the separately
reviewed optimality sublemma, are accepted on the scopes in the
[independent review record](#cell-square-review). The cell-square compiler and
the imported implication solver have distinct independent code reviews there.
Theorems 1 and 3--7 and the original matching compiler remain ready for review.
**Permitted search use:** the accepted cell-square operation is an exact
supplied-input decision oracle under its stated hypotheses. A branch closure
still needs outer-family coverage and independently checked exclusion evidence.
No order-43 branch is closed. No literature-priority claim is made.

**Scope:** finite labelled residual-obligation states, arbitrary overlapping
supports and fixed pairs. The polynomial terminal theorem requires homogeneous
thresholds at most five and the budget conditions stated below. It decides
existence and reconstructs a labelled completion; it does not compute the
count returned by the existing recurrence.

**Dependencies:** elementary Boolean algebra, finite graph definitions, and
the accepted [residual-state semantics and derivative](../n43/d18/c/recursive_ramsey.md).
The hardness statements use the standard NP-completeness of 3-SAT and Vertex
Cover and #P-completeness of counting independent sets. No numerical Ramsey
bound, graph census completeness, or symmetry assumption enters the main proof.

The results give exact tractable terminal fragments of the recursive calculus.
Reserve a matching of unknown graph pairs. After all other pairs are assigned,
every forbidden homogeneous set of order at most five gives a clause of width
at most two. The entire matching can be solved at once by implications. This
gives the uniform decision bound

\[
  O^*\!\left(2^{\binom n2-\lfloor n/2\rfloor}\right),
  \tag{1}
\]

where `O*` suppresses factors polynomial in the explicit input size. The
improvement is in the enumerated exponent, not a claim of the same factor in
wall-clock time. At order 43 the outer enumeration has `2^882` assignments in
place of `2^903`: a factor `2^21 = 2,097,152`. The leading quadratic term is
unchanged, and this bound alone is far from a feasible order-43 computation.

The algebra is closed under conjunction and existential elimination, with a
quadratic-size canonical relation. The threshold five is sharp for general
residual obligations: threshold six already represents arbitrary 3-SAT with
only a matching left unknown. Counting is #P-complete already at threshold
four, and a single unrestricted edge-count budget can make decision NP-hard.
These limits specify exactly where the new oracle can replace branching.

Sections 7--8 extend the reduction using accepted earlier deductions: each
certified five-vertex `(3,3)` cell is a C5, and its twelve labelled realizations
partition into three two-coordinate Boolean squares. For `k` disjoint such
cells with fully free interiors, plus an uncovered matching of size `r`, the
conditional decision bound is `O*(3^k 2^(m-10k-r))`. This saves `4^k` outer
choices over already enumerating the twelve C5 realizations per cell. Ordinary
and weighted degree budgets remain covered. The number of disjoint applicable
cells is not bounded below here, and the new results imply no branch closure.

The [prototype](quadratic_completion.py) accepts the existing `State` structure,
compiles supplied cofactors, solves them, and returns either a model or two
checkable implication paths proving a contradiction. The
[validation driver](validate_quadratic_completion.py) checks full Boolean
relations against direct graph semantics and exercises an already retained
42-vertex construction with 21 pairs erased.

## 1. Matching cofactors and the exact degree drop

Let `S=(U,P,M,F,B)` be a residual state as in the accepted recurrence. To avoid
confusion with the negative obligation family `M`, denote a reserved matching
by `D`. Its elements are currently unfixed unordered pairs of vertices. Let
`E_free` be all unfixed pairs, `m=|E_free|`, and `d=|D|`.

For a total assignment `eta` on `E_free-D`, retain one Boolean variable `x_e`
for each `e in D`. Its value one means that `e` is a graph edge. Write
`S[eta]` for this cofactor. A matching pair is a reserved *variable*, not a
requirement that the completed graph contain that edge.

<a id="matching-degree-drop"></a>
### Theorem 1. Matching restriction halves the clause arity

For each obligation `(+ ,t,X)` and each `Q subset X` of size `t`, examine
the pairs in `binom(Q,2)-D`:

* If a fixed pair is a nonedge, this particular clique witness is impossible
  and contributes no constraint.
* Otherwise its exact surviving condition is

  \[
    \bigvee_{e\in D\cap\binom Q2}\neg x_e.
    \tag{2}
  \]

For `(-,t,X)`, a fixed edge kills the independent witness; otherwise the
surviving clause is

\[
    \bigvee_{e\in D\cap\binom Q2}x_e.
    \tag{3}
\]

An empty disjunction is false. A support smaller than its threshold contributes
no witnesses. In particular, a nonempty threshold-one obligation immediately
contributes an empty clause.

These clauses describe the matching completion relation exactly, and every
clause has at most `floor(t/2)` literals. Consequently all homogeneous
obligations of threshold at most five compile to 2-CNF.

**Proof.** A clique witness exists exactly when every one of its pairs is an
edge. If a conditioned pair has value zero this cannot happen. Otherwise the
only remaining way to prevent that clique is for at least one reserved pair
inside it to have value zero, which is (2). Complement all pair values for
(3). Applying this equivalence to every witness of every obligation gives
both directions of the full relation, including overlapping supports.

Distinct reserved pairs inside `Q` have disjoint endpoints, hence use twice as
many vertices as there are pairs. Therefore their number is at most
`floor(|Q|/2)`. No assumption about edges between different matching pairs is
used. QED.

This is different from merely finding small support masks: a size-five support
may involve ten graph variables, but at most two of the reserved variables.
The relevant degree is degree in the *unassigned pairs*.

Every homogeneous obligation obtained by the accepted derivative from a
`K5/I5` input has threshold at most five: differentiation only decreases
thresholds. Thus the homogeneous part of every such recursive state qualifies;
the additional budget conditions are the part that must be checked separately.

<a id="matching-budgets"></a>
### Budget extension

For a budget `L <= sum_e w_e z_e <= H`, subtract its conditioned contribution
`b(eta)` to obtain

\[
  L-b(\eta)\le\sum_{e\in D}w_ex_e\le H-b(\eta).
  \tag{4}
\]

If at most two coefficients on `D` are nonzero, enumerate the at most four
Boolean assignments to those variables. For each forbidden assignment, add
the unary or binary clause excluding it. This is an exact 2-CNF description
of (4). Empty active support either contributes no constraint or an empty
clause. Negative residual lower bounds cause no problem.

In particular, arbitrary degree intervals and nonnegative weighted degree
intervals are preserved: a matching contains at most one pair incident with
any given vertex. The sum already spent at that vertex is known. Its residual
degree condition permits both matching values, just one, or neither.

More general budgets may also be harmless in a particular cofactor: an interval
containing the whole attainable range is redundant, an interval disjoint from
that range rejects, and a bound forcing every remaining value to zero or one
gives units. The prototype handles these cases too. It raises `NonQuadratic`
for other budgets with more than two active variables. It never drops a budget
to obtain the terminal reduction.

One can instead reserve a smaller matching meeting every nonspecial budget
support in at most two pairs, or assign more reserved variables before retrying.
That preserves the input exactly, with the smaller exponent saving. No
polynomial-time solver for general cardinality-constrained 2-SAT is assumed.

## 2. A closed implication calculus

<a id="quadratic-algebra"></a>
### Theorem 2. Quadratic completion relations compose and project exactly

Let `Q_d` be the family of relations on `d` Boolean variables definable by
clauses of width at most two, including the true and false relations.

The following operations stay within this family:

1. Conjoin relations on overlapping, consistently named variable sets.
2. Restrict a variable to a specified value.
3. Relabel variables, or consistently exchange a variable with its negation.
4. Existentially eliminate any subset of the variables.

In particular, if `R(x,y)` and `T(y,z)` are quadratic interfaces, their
composition

\[
   (T\circ R)(x,z)=\exists y\,[R(x,y)\land T(y,z)]
   \tag{5}
\]

is again a quadratic interface. Composition is associative as a relation.

**Proof.** The first three operations act directly on the clauses. For the
fourth, to eliminate `x`, retain the clauses not mentioning it. For each pair

\[
       (x\lor C),\qquad(\neg x\lor D),
\]

add the resolvent `C or D`. Each of `C,D` contains at most one literal,
so the resolvent has width at most two. Discard tautologies and duplicate
clauses. Empty clauses retain their usual false meaning.

Every extension satisfying the original clauses satisfies these resolvents.
Conversely suppose an assignment to the other variables satisfies all retained
clauses and resolvents. If neither value of `x` extends it, some clause
`x or C` has `C` false and some clause `not x or D` has `D` false. Their
resolvent is false, a contradiction. Thus the projected formula is exact.
Repeat for all variables to be eliminated. Formula (5) follows by conjunction
then elimination. Associativity is the identity of the corresponding
existentially quantified conjunctions, with internal variables renamed apart.
QED.

**The polynomial formulation.** Work in the Boolean coordinate algebra

\[
 \mathcal A_V=\mathbb Q[x_i:i\in V]/(x_i^2-x_i:i\in V).
 \tag{5a}
\]

Write `l_a` for the truth polynomial of literal `a`: `x_i` for a positive
literal, `1-x_i` for a negative one. The clause `a or b` is the equation
`(1-l_a)(1-l_b)=0`; a unit gives a linear equation, and an empty clause gives
`1=0`. Let `I_F` be the ideal generated by these false-clause polynomials.
For any retained variable set `W subset V`,

\[
  I_F\cap\mathcal A_W=I_{\exists(V-W)F}.
  \tag{5b}
\]

Moreover the ideal on the right still has generators that are products of
at most two literal polynomials. Conjunction is ideal addition; existential
projection is intersection with the retained coordinate subalgebra. These
operations are exact, with no higher-degree clause generators required.

To prove the ideal identity, the point idempotents
`delta_s = product_i x_i^(s_i)(1-x_i)^(1-s_i)` form a basis of this Boolean
algebra. A satisfying assignment annihilates every generator. At any
nonsatisfying assignment `s`, some false-clause generator `g` has `g(s)=1`,
and `delta_s*g=delta_s`; hence its point idempotent belongs to the ideal.
Thus `I_F` is exactly the set of functions vanishing on the satisfying
assignments. A function of `W` vanishes there exactly when it vanishes on their
projection to `W`, proving (5b). The resolution proof above supplies the
quadratic generators for that projected relation.

There is also a local algebraic elimination identity. If the two clauses
involving the eliminated variable have equations `(1-x)c=0` and `x*d=0`,
where `c,d` are each a literal polynomial or the constant one, then

\[
             cd=d[(1-x)c]+c[xd].
             \tag{5c}
\]

The quadratic resolvent `cd=0` therefore follows inside the ideal itself.
The extension argument proves that these resolvents generate the entire
elimination ideal, rather than just necessary equations.

For example, eliminating `x` from `(1-x)(1-y)=0` and `xz=0` leaves exactly
`z(1-y)=0`, the implication `z -> y`. This mixed equation need not be a
monochromatic-support obligation of the original language. Allowing such
implications is the necessary enlargement that makes the terminal calculus
closed. This claim concerns products of literals; arbitrary quadratic
polynomial systems do not inherit its tractability.

This supplies a polynomial-size *semantic* normal form, not just a sufficient
syntactic memo key. For a satisfiable relation on fixed labels, retain every
entailed unary and binary clause; represent the false relation separately.
There are at most

\[
   2d+4\binom d2=2d^2
   \tag{6}
\]

non-tautological such clauses. Their conjunction is the original relation:
all the original clauses are present, and all added clauses are consequences.
Two quadratic relations on the same variables are equal if and only if these
normal forms are equal. The normal form can be computed in polynomial time:
test each possible clause by checking whether the formula together with its
negated literals is unsatisfiable. This construction is a theorem contract;
the small prototype uses deduplicated clauses and SCCs, not this full
canonicalization procedure.

**Why the decision procedure is polynomial.** Replace `(a or b)` by
implications `not a -> b` and `not b -> a`. A unit `a` contributes
`not a -> a`. Apart from an explicit empty clause, the system is inconsistent
exactly when a literal and its negation belong to the same strongly connected
component. In one direction, paths both ways force the contradiction for
either truth value. In the other, topologically order the component DAG and
assign each variable according to which of its two components comes later;
the paired contraposed implications ensure that every clause is satisfied.
This takes linear time in the implication graph. The prototype uses this
construction and returns the resulting values.

For a rejected terminal, two paths

\[
     x\leadsto\neg x,\qquad\neg x\leadsto x
     \tag{7}
\]

are a small certificate. Each arc names the clause that justifies it, and
each compiled clause retains its original homogeneous witness or budget source.
Checking the paths does not require trusting the SCC algorithm. With repeated
vertices removed the paths have at most `2d-1` arcs each.

**Exact limits of closure.** This is an algebra of conjunction and existential
projection. It is not closed under arbitrary disjunction of different outer
cofactors. For example, the disjunction of the three unit relations `x`, `y`,
and `z` is the nonquadratic relation `x or y or z`. Nor does projection retain
counting multiplicities: `exists y (x or y)` is true for both values of `x`,
but the two fibres have respectively one and two values of `y`. A count engine
cannot substitute this Boolean oracle for its integer-valued recurrence.

## 3. The resulting complexity theorem

<a id="matching-complexity"></a>
### Theorem 3. Exact decision with `d` pairs eliminated simultaneously

Suppose all thresholds of a residual state are at most five and a supplied
matching `D` of `d` free pairs meets the nonspecial budget supports in at most
two pairs each. Existence of a completion, with witness reconstruction, can be
decided in

\[
       O^*(2^{m-d})
       \tag{8}
\]

time and polynomial space. Here the polynomial factor includes witness-clause
generation and input integer arithmetic. If there are `h` obligations on `n`
vertices, clause generation has at most

\[
       \sum_{(t,X)}\binom{|X|}{t}=O(hn^5)
       \tag{9}
\]

candidates. Thresholds and supports are those of the current residual state.

**Proof.** Enumerate every assignment to the `m-d` other free pairs exactly
once. Theorem 1 and the budget extension compile each cofactor exactly to a
polynomial-size 2-CNF instance. Theorem 2 decides whether it has a solution.
Return a model from any satisfiable cofactor and join it to the fixed and
conditioned pairs. Conversely every graph completion has exactly one outer
assignment and satisfies its matching cofactor, so rejecting all cofactors
proves the input has no completion. The exponential enumeration can be streamed
with a polynomial-size binary counter; each compiler and solver uses polynomial
space. QED.

For a completely free graph, choose `floor(n/2)` disjoint pairs and obtain
(1). With existing fixed pairs, any matching in the free-pair graph works;
a maximum one gives the largest saving within this theorem. Discovering an
automorphism group or proving that completed vertices are twins is unnecessary.

The familiar `K5/I5` cases give the following *outer enumeration* bounds when
only the displayed pairs are fixed and budgets meet the theorem's conditions:

| Input | Free pair variables `m` | Reserved matching `d` | Outer assignments |
| --- | ---: | ---: | ---: |
| Unfixed graph on 43 labels | 903 | 21 | `2^882` |
| Supplied 18-vertex `A` and fixed degree-18 root; all `A-B` and internal `B` pairs free | 708 | 21 | `2^687` |
| Supplied full `A-B` rows; all 24-vertex `B` pairs free | 276 | 12 | `2^264` |

For the middle line match all 18 vertices of `A` to distinct `B` vertices,
then match the remaining six `B` vertices in three pairs. The root has no free
incident pair. Uniform degree windows survive in all three lines. Additional
total cross-edge, `A`-excess, or internal `B`-edge budgets require their own
budget check and can reduce `d`; these are not automatically covered.

This is an existence bound for each supplied input, not a bound on the number
of possible supplied `A` graphs or row families. A useful integration is a
separate `has_completion` recursion which branches on outer pairs, applies
existing Ramsey cuts, and invokes this terminal when it has a quadratic
cofactor. The existing `CompletionDP.count` continues to have its counting
semantics. The prototype's `decide` is the minimal complete outer enumerator,
not a production replacement for the C++ engine.

## 4. Sharpness: what cannot be compressed into this algebra

<a id="quadratic-threshold-sharpness"></a>
### Theorem 4. Threshold six is the first nonquadratic matching obstruction

Take six vertices partitioned into three reserved pairs, and fix all the other
pairs to be nonedges. The single obligation `no I6` has completion relation

\[
                  x_1\lor x_2\lor x_3.
                  \tag{10}
\]

This relation has no 2-CNF representation, even after introducing any number
of auxiliary Boolean variables and existentially quantifying them.

**Proof.** Theorem 1 gives (10). Every 2-CNF relation is closed under coordinatewise
majority of three satisfying assignments. Indeed if the majority violated a
clause `a or b`, at least two assignments would falsify `a` and at least two
would falsify `b`; these two sets of assignments intersect, contradicting
satisfaction of the clause. Units obey the same assertion. Existential
projection preserves majority closure: choose satisfying extensions of the
three assignments and take the majority of the extensions.

But `100,010,001` satisfy (10), and their majority `000` does not. Thus neither
a 2-CNF representation nor a projected 2-CNF representation exists. QED.

<a id="matching-np-boundary"></a>
### Theorem 5. Matching completion with thresholds at most six is NP-complete

This statement concerns arbitrary supplied overlapping obligations, not a claim
about states reachable from a single global `K6/I6` prohibition. Even with no
budgets and every nonmatching pair fixed, this decision class is NP-complete.

**Proof.** Associate each Boolean variable `x` with a private vertex pair; its
internal pair is the reserved variable. A positive Boolean clause on two or
three variables is realized by a `no I4` or `no I6` obligation on their endpoints,
with all cross pairs between those variable pairs fixed to zero. A negative
Boolean clause is realized by `no K4` or `no K6`, with cross pairs fixed to one.
To make those fixed values consistent we construct a Boolean formula in which
an unordered pair of distinct variables is used together in at most one clause.

Given a 3-SAT instance, create a fresh occurrence variable `y` for each literal
occurrence. Replace each original clause by the positive three-clause on its
three occurrence variables. Enforce the occurrence's intended truth value
using the following fresh-variable gadgets.

For equality `x=y`, introduce fresh `a,b` and use

\[
 (\neg x\lor\neg a)\land(a\lor y)
 \land(\neg y\lor\neg b)\land(b\lor x).
 \tag{11}
\]

Existentially eliminating `a,b` gives `x -> y` and `y -> x`. All four variable
pairs are distinct. For inequality `x != y`, introduce fresh `z` and use

\[
 (x\lor y)\land(\neg x\lor\neg z)\land\operatorname{Eq}(y,z),
 \tag{12}
\]

where the equality gadget has its own fresh auxiliaries. This enforces
`z=y` and exactly one of `x,y` true. Its variable pairs are also distinct.

Use (11) for positive occurrences and (12) for negative occurrences. A clause's
three occurrence variables are fresh, and the gadgets never connect two
occurrences directly. Fresh gadget auxiliaries ensure that no unordered pair
of variables is used by two different clauses anywhere in the resulting formula.
Every clause is uniformly positive or uniformly negative, of width two or
three. Thus the prescribed fixed cross pairs for the graph realization never
conflict. Fix every unmentioned cross pair arbitrarily, say to zero.

The resulting graph cofactor has only its private matching pairs unknown and
obligations of sizes four and six. By the witness calculation each obligation
is exactly its Boolean clause. It has a completion if and only if the original
3-SAT instance is satisfiable. The construction has polynomial size. Direct
verification of a proposed matching assignment is polynomial, proving membership
in NP as well. QED.

This makes the threshold-five tractable fragment sharp for the stated input
language, not just for the compiler's choice of representation.

<a id="matching-count-budget-boundaries"></a>
### Theorem 6. Counting and an unrestricted total budget cross the boundary earlier

Let `H` be an arbitrary graph. Create a private reserved pair for each vertex
of `H`, with variable `x_i`, and fix all cross pairs between private pairs to
zero. For each edge `ij` of `H`, impose `no I4` on the four endpoints of pairs
`i,j`. These are exactly the clauses

\[
                  x_i\lor x_j \quad (ij\in E(H)).
                  \tag{13}
\]

Satisfying assignments are precisely the vertex covers of `H`. Their number
equals the number of independent sets of `H` by taking complements. Therefore
exact matching-completion counting is #P-complete already with threshold-four
negative obligations. There is no multiplicity-free counting interpretation
of the polynomial existential oracle unless `FP=#P`.

If the single nonnegative linear budget

\[
                       \sum_i x_i\le k
                       \tag{14}
\]

is added, completion is exactly the Vertex Cover decision problem. Thus arbitrary
total-edge budgets make matching completion NP-complete already at threshold
four, even though all the homogeneous constraints alone are 2-CNF. A budget
on all graph edges gives the same example because every nonreserved edge here
is fixed to zero. Degree budgets have the separate tractable status proved in
section 1. QED.

| Allowed homogeneous thresholds | No general global budget: existence | Exact counting |
| --- | --- | --- |
| At most 3 | Only units; polynomial | Polynomial |
| At most 5 | 2-SAT; polynomial | #P-complete already at 4 |
| At most 6 | NP-complete for arbitrary supplied obligations | At least as hard as the preceding class |

The first counting entry assumes no additional budgets except units or similarly
independent constraints; arbitrary two-variable budget relations can themselves
introduce the counting hardness of 2-CNF.

<a id="optimal-oblivious-reservation"></a>
### Theorem 7. A larger unconditional reservation cannot retain the same guarantee

For `n>=5`, suppose a fixed set `D` of free pairs is required to leave every
individual obligation of threshold at most five quadratic, for every assignment
of the other pairs. Then

\[
                            |D|\le\lfloor n/2\rfloor.
                            \tag{15}
\]

**Proof.** The necessary and sufficient support condition is that every vertex
set of size at most five span at most two pairs of `D`. Sufficiency is the
clause calculation. For necessity, if such a set spans three or more free
pairs, set all its other pairs to nonedges and impose the independent-set
obligation on that support. Its surviving clause has width at least three;
the majority argument in Theorem 4 again excludes any quadratic relation.

View `D` as a graph. A connected component with three or more edges contains
three edges of a connected subgraph on at most four vertices, violating the
support condition. Thus every nontrivial component is an edge or a two-edge
path. If a two-edge path occurs, any other component containing an edge would
give three edges on five vertices. Hence `D` is a matching, or just one
two-edge path and isolated vertices. The maximum size is `floor(n/2)` when
`n>=5`. QED.

This optimality is deliberately local and unconditional. It does not rule out
larger reservations after propagation has killed particular witnesses, other
tractable constraint languages, structural restrictions on actual Ramsey
histories, or algorithms improving the leading quadratic exponent.

## 5. Prototype, validation, and evidence scope

The executable contract is deliberately small:

```python
kernel = compile_matching(conditioned_state, reserved_pairs)
answer = solve_kernel(kernel)
assert verify_answer(kernel, answer)
```

All nonreserved pairs must already be in `conditioned_state.fixed`. Reserved
pairs must be disjoint, valid, and unfixed. A returned SAT model gives one bit
per `kernel.edges`; combine it with the fixed pairs to reconstruct the graph.
An UNSAT answer identifies either an empty clause or the paths (7). The
compiler checks threshold-one obligations, fixed-pair conflicts, repeated
budget coefficients, and the exact residual budget values.

`decide(state, reserved_pairs)` additionally enumerates the outer cofactors and
returns a full pair assignment, or `None` after complete exhaustion, together
with the number of cofactors tested. It does not retain a complete outer
exclusion certificate. A future certified integration must retain or regenerate
the outer coverage and check each clause's provenance and terminal certificate;
one rejected cofactor is not a rejected family of cofactors.

Run the retained author checks with

```sh
python research/foundations/validate_quadratic_completion.py
```

The checks cover:

* **21,875 matching cofactors and 169,340 full graph assignments.** All labelled
  graphs through order six for `(3,3),(3,4),(4,3),(4,4),(5,5)` are tested. For
  each cofactor every reserved assignment is compared with the direct graph
  definition, not just the existence answer. Counts through order five are
  also compared with the original recursive engine. At order six the counts
  are respectively `0,2812,2812,22484,32424`.
* **600 additional residual states.** These use overlapping supports,
  threshold-one cases, nonconsecutive vertex labels, weighted degree bounds,
  and budgets on two reserved variables. Every reserved assignment is checked.
* **500 Boolean formulas with 4,007 input clauses.** The SCC solver and its
  certificates are compared with complete truth tables; existential resolution
  is checked independently against extension over the eliminated variable.
  Incorrect models and broken contradiction paths are rejected.
* **Boundary fixtures.** The six-vertex cubic clause has seven models, the
  equality/inequality gadgets have exactly their stated projected relations,
  and the `C5` vertex-cover encoding has eleven models but none with at most
  two selected pairs. The unsupported global budget and invalid matching inputs
  are explicitly rejected.
  The actual graph embeddings of one satisfiable and one unsatisfiable 3-SAT
  formula also check the cross-pair consistency in Theorem 5: they use 24 and
  87 reserved variables and have respectively six and zero satisfying source
  assignments. All eight source assignments are checked in each embedding
  with the specified gadget extensions; the converse is the gadget proof.
* **Outer coverage.** The order-six `(3,3)` input rejects all 4,096 outer
  assignments, while an order-five witness is reconstructed and directly
  checked. This is a small correctness test of an already known Ramsey fact,
  not a new research branch closure.
* **One supplied order-42 cofactor.** The driver reads the Exoo matrix already
  retained in [the existing evidence](../n43/d18/c/exoo_uncontract_extension_evidence.json),
  erases the 21 pairs `(0,1),(2,3),...,(40,41)`, and retains all 840 other
  pairs. It includes degree intervals `18..24`, compiles and solves that one
  cofactor, checks the reconstructed graph against every five-subset, and
  probes each reserved bit for forcedness. The kernel has **33 clauses**,
  all **21 reserved values are forced**, and it reconstructs the original
  matrix exactly. This is a terminal-oracle test on
  a supplied graph, not an enumeration of order-42 or order-43 graphs. The
  exact driver output is retained in [validation data](quadratic_completion_validation.json).

These matching validation runs are author checks. The matching-specific
Theorems 1 and 3--7 and original matching compiler remain ready for independent
review. Theorem 2 and the shared implication solver have the separate review
record below. No formal proof is claimed. Existing accepted recursion proofs
and counting semantics are unchanged.

## 6. Relation to existing methods and the remaining problem

The underlying methods are standard: implication-graph 2-SAT, Davis–Putnam
variable elimination, and conditioning into a tractable SAT class, often called
a strong backdoor. The graph-specific deduction is that a matching gives such
a backdoor for every residual Ramsey prohibition of order at most five,
including arbitrarily overlapping supports, with the exact budget extension,
sharp threshold, hardness embeddings and uniform reservation bound above.
This note does not establish that the matching observation is new in the
literature.

For context, see M. Davis and H. Putnam, “A Computing Procedure for
Quantification Theory,” *JACM* 7 (1960), 201–215;
B. Aspvall, M. F. Plass and R. E. Tarjan, “A Linear-Time Algorithm for Testing
the Truth of Certain Quantified Boolean Formulas,” *Information Processing
Letters* 8 (1979), 121–123; and R. Williams, C. Gomes and B. Selman,
“Backdoors to Typical Case Complexity,” *IJCAI* (2003), 1173–1178.
The proofs here are self-contained apart from the named standard hardness
premises; these citations supply context, not numerical Ramsey assumptions.

The unresolved bottleneck is still the number of outer cofactors. The present
result removes a guaranteed linear number of bits from a quadratic exponent;
it neither reduces that leading quadratic coefficient nor establishes small
outer coverage for the order-43 problem. Its value to the recursive program is
a precisely delimited algebra in which *simultaneous exact elimination* works,
an explicit complexity gain, and proofs of the boundaries that an engine must
respect.

## 7. Saturated inherited cells give a larger quadratic remainder

**New development, author:**
`/root/structural_quadratic_remainders`, with the separately attributed
optimality sublemma supplied by /root. **Review state:** accepted on the
[recorded independent scopes](#cell-square-review). This section and section 8
are proved-here deductions using the accepted saturated-cell input. No claim
asserts that the required cells occur in every order-43 state.

The matching argument can be strengthened using an earlier deduction that is
more informative than a list of fixed pairs: an actual five-vertex `(3,3)`
cell must be a five-cycle. Its ten pairs need not yet be assigned. The twelve
labelled five-cycles have a partition into **three Boolean squares**. Inside
each square, every graph-pair indicator is a literal of just two Boolean
variables. This permits simultaneous completion of whole cells, including
many incident unknown pairs, while retaining all surviving higher obligations.

The distinction from raw support reduction is essential. A witness containing
three cell vertices may contain several unknown graph pairs. Its prohibition
is already implied by the cell theory and becomes the zero polynomial under
the coordinates below. Only witnesses not eliminated this way require clauses.

### Source of the cells, with permanent membership

A usable cell is a specified actual subset `C` of the current unprocessed
labels, with `|C|=5`, for which both `no K3 on C` and `no I3 on C` have been
proved. Two sources already available in the repository are:

* In the accepted recursive state, positive `(3,X)` and negative `(3,Y)`
  obligations imply this for any five labels in `X intersect Y`. The accepted
  recursive capacity cut bounds that intersection by five. Stronger obligations
  of the corresponding colour imply the same condition when applicable.
* In the accepted column setting, for an actual A edge `Q` and an actual
  independent A pair `P`, the cell `T_Q intersect U_P` has type `(3,3)`.
  This is the [cell-type deduction](../n43/d18/anchored_cell_averaging.md#claim-cell-types).
  The [saturation deduction](../n43/d18/anchored_cell_averaging.md#claim-cell-saturation)
  and [intersection classification](../n43/d18/cell_intersections.md#claim-intersection-types)
  identify a cell of size five as `C5`.

For completeness, on five vertices a `(3,3)` graph has degree at most two:
three neighbors of a vertex either contain an edge, making a triangle with
that vertex, or form an independent triple. Its complement obeys the same
bound, so every degree is also at least two. A simple 2-regular graph on five
vertices without triangles is one five-cycle. This uses no catalogue or
unproved numerical extremum.

All memberships must be actual or permanently established. A cell selected
from a guessed future row is a condition on that branch, not a deduction in
its parent. The selected five-cells below are pairwise disjoint. Other cells
and overlapping obligations remain in the input and are still checked.

<a id="cell-square-coordinates"></a>
### Theorem 8. Three signed Boolean squares partition the twelve labelled C5s

Fix a pivot `v` among the five cell labels. Partition the other four into two
unordered pairs, written `{a,b}|{c,d}`. There are three such partitions. For a
canonical orientation, put the smallest of the four labels in `{a,b}`, and
sort within each pair. For Boolean variables `s,t`, define

\[
\begin{array}{c|c}
\text{graph pairs}&\text{edge indicator}\\ \hline
va,vb&s\\
vc,vd&1-s\\
ab&1-s\\
cd&s\\
ac,bd&t\\
ad,bc&1-t.
\end{array}
\tag{16}
\]

For each partition, the four settings of `(s,t)` are four distinct five-cycles.
Across the three partitions the twelve settings give every labelled five-cycle
exactly once.

**Proof.** If `s=1`, the pivot has neighbors `a,b`, pair `ab` is absent, and
`cd` is present. The cross pairs between `{a,b}` and `{c,d}` form one of the
two perfect matchings, selected by `t`. Thus the cycle is either
`v,a,c,d,b,v` or `v,a,d,c,b,v`. If `s=0`, interchange the roles of the two
pairs, and the same argument gives a five-cycle.

Conversely, in any five-cycle the pivot's two neighbors and its two
nonneighbors give precisely one of the three unordered pair-partitions.
The neighbors are nonadjacent, the nonneighbors are adjacent, and the edges
between those pairs form a perfect matching. These determine `s,t` uniquely
with the canonical ordering. There are therefore three disjoint charts, each
with four models, and the representation is exhaustive. QED.

A *chart* here means one of those three explicit substitutions. It is not an
isomorphism quotient: all labels remain fixed, and all twelve labelled graphs
remain covered. One chart is already defined by linear equations in the Boolean
coordinate algebra, since every graph pair equals a literal of `s` or `t`.
The disjunction of the three charts is retained by outer branching.

**Optimality within this chart model.** This sublemma was supplied by /root
and independently checked by `/root/structural_quadratic_remainders`.
Three is the minimum number of charts
if each chart allows all assignments of its independent Boolean coordinates,
every graph pair is a constant or a literal of one coordinate, and every image
is a five-cycle. Indeed, degree two at every vertex forces, for each coordinate
separately, its positive and negative occurrences incident with that vertex to
balance. The support graph of an effective coordinate therefore has no vertex
of degree one. With at most three edges a nonempty simple graph with that
property must be a triangle, but signs cannot alternate around an odd cycle.
Thus each effective coordinate needs at least four pair positions. Distinct
coordinates use disjoint positions, so ten pair positions allow at most two
effective coordinates. Such a chart has at most four images; covering twelve
cycles requires at least three charts. Formula (16) attains this bound. This
optimality concerns unconstrained literal charts, not arbitrary constrained
2-CNF representations or other encodings.

<a id="cell-square-completion"></a>
### Theorem 9. Exact quadratic completion across disjoint saturated cells

Let `S` be any residual state whose homogeneous thresholds are at most five.
Suppose `C_1,...,C_k` are disjoint certified five-vertex `(3,3)` cells. Choose
one chart (16) for each. On the uncovered labels choose a matching `M` of
`r` free pairs; its endpoints must be outside every selected cell. Condition
every other free pair outside the selected cell interiors. Fixed pairs inside
a cell are allowed and are retained as equations on its chart coordinates.

The resulting homogeneous completion relation is exactly 2-CNF on the `2k+r`
variables consisting of the cell coordinates and the uncovered matching bits.
All graph pairs inside every selected cell are reconstructed from (16).

**Proof.** Every assignment of the cell coordinates already satisfies the
local `(3,3)` theories, by Theorem 8. Consider a witness `W` from any retained
homogeneous obligation.

If `W` contains three labels of a selected cell, then it contains a triangle
candidate and an independent-triple candidate within that cell, both forbidden
by its local theory. Thus `W` cannot be homogeneous in either colour for any
coordinate assignment. Its witness constraint is redundant and can be dropped.
This includes witnesses crossing other cells or having additional fixed pairs.

Otherwise `W` meets every selected cell in at most two labels. A selected cell
can then contribute at most one unconditioned pair to `W`. Any uncovered
matching pair also contributes at most one. All these pairs have disjoint
endpoints: different cells are disjoint, and matching endpoints are uncovered.
Consequently there are at most `floor(|W|/2)<=2` such pairs. Each is a single
literal of one cell coordinate or one matching variable. Every other pair is
conditioned. A fixed pair of the opposite colour kills the witness; otherwise
the exact clause that prevents the witness has width at most two after
substitution. A repeated literal is removed, opposite literals make a clause
true, and an empty clause rejects.

An already fixed cell pair says that its expression in (16) equals its fixed
value. That is a unit clause, including inconsistent fixed assignments as
contradictions. Taking all these clauses gives precisely the original
homogeneous conditions. Conversely every satisfying coordinate assignment
reconstructs a graph with those fixed values and no forbidden witness.
Theorem 8 makes the local reconstruction bijective within the chosen charts;
the chart partition covers all possible local graphs. QED.

This is an exact inference **modulo the inherited cell theory**. A direct
compiler that only counts unassigned graph pairs can reject this cofactor as
nonquadratic. The theorem first removes higher witnesses already forbidden by
the cell theory, then substitutes its signed coordinates.

**Algebraic form.** Let `phi_alpha` be the substitution from the Boolean
coordinate algebra on graph pairs into the algebra on the `2k+r` variables,
using the chosen charts `alpha` and the outer fixed values. It is a well-defined
algebra homomorphism, since constants and literal polynomials are idempotent.
Every generator for the local cell theories maps to zero. A generator for any
other homogeneous witness maps either to zero, or to a product of at most two
literal polynomials. Indeed a same-cell triple already has its monochromatic
product zero; without one, the disjoint-endpoint argument bounds the surviving
factors by two. Thus the pulled-back relation has exactly the quadratic ideal
calculus of Theorem 2, including conjunction and existential projection.

The algebraic gain comes from this proved parametrization and elimination of
redundant witnesses. Ideal addition alone does not produce it.

### Budgets: aggregate after the signed substitution

A retained budget must be handled, including every coefficient on cell pairs.
After (16) and the outer conditioning, its exact expression is

\[
      L\le c+\sum_{i=1}^{2k+r} a_i y_i\le H,
      \qquad a_i\in\mathbb Z.
      \tag{17}
\]

The original weights can be nonnegative while the aggregated coefficients
`a_i` are negative, because some graph pairs equal `1-y_i`. Sum coefficients
for each coordinate and cancel zeros **before** measuring the support.
Any budget with at most two nonzero `a_i` has an exact 2-CNF representation by
enumerating its at most four assignments. Constant budgets either pass or
reject. The original wider-budget limitations still apply to other cases.

Several useful budget families now qualify automatically:

* Any nonnegative weighted degree interval sees at most two cell coordinates
  if its vertex belongs to a selected cell, and at most one matching bit
  otherwise. All its other pairs are conditioned.
* An ordinary unweighted degree receives exactly two internal neighbors from
  its selected cell. That part is constant, so only its known outside degree
  remains to check.
* Any weighted budget confined to one selected cell sees at most two variables.
* An unweighted count of all pairs inside any collection of whole selected
  cells contributes the constant five per cell. In particular, a total edge
  budget on the whole residual graph has active support only on the uncovered
  matching, and is covered by the simple rule when `r<=2`.

A budget on a proper part of several cells can have larger support. Arbitrary
multi-cell weighted budgets are not automatically quadratic. Failure of the
support test is an explicit refusal of this terminal contract, not permission
to omit that budget. One may separately provide and verify another exact 2-CNF
representation, or branch further.

<a id="cell-square-complexity"></a>
### Theorem 10. Complexity and the improvement attributable to this step

Under Theorem 9, suppose all ten internal pairs of each selected cell are
initially free, and the budget conditions hold for each chart and cofactor.
Let `m` be the number of all initially free graph pairs. Exact existence with
reconstruction can be decided in polynomial space and time

\[
 O^*\!\left(3^k 2^{m-10k-r}\right)
   =O^*\!\left(2^{m-(10-\log_2 3)k-r}\right).
 \tag{18}
\]

**Proof.** There are `m-10k-r` conditioned free pairs outside the cell interiors
and the uncovered matching. Enumerate their assignments, and the three chart
choices independently for every cell. Theorem 9 and the budget compiler leave
one exact 2-SAT instance at each of the resulting `2^(m-10k-r)3^k` cofactors.
There are `2k+r` Boolean variables, and witness generation is polynomial in the
explicit input size for thresholds at most five. A model reconstructs a graph.
Every completion occurs in exactly one chart combination and one outer
assignment, by Theorem 8. Streaming the enumeration uses polynomial space.
QED.

Two comparisons must be kept distinct:

1. Enumerating ten unrestricted internal pairs would cost `2^(10k)` local
   choices. The theorem replaces that factor by `3^k`, because it combines the
   **already proved C5 classification** with the new coordinate calculus.
2. An engine already exploiting the classification could enumerate `12^k`
   labelled five-cycles. The new simultaneous 2-SAT step replaces this by
   `3^k`, saving a factor **`4^k`** in local outer choices. This is the extra
   improvement over that stronger baseline. It is an enumeration bound, not
   a measured factor in runtime.

Against the uniform matching guarantee when the entire free-pair graph is
complete, take `r=floor((n-5k)/2)`. The exponent saved by (18) is
`(10-log2(3))k+r`, rather than `floor(n/2)`. Each disjoint five-cell contributes
about 8.415 saved bits, replacing the roughly 2.5 bits available to a matching
on the same five labels. Without such cells, `k=0` recovers the matching theorem.
For an arbitrary fixed-pair pattern the right comparison is its actual maximum
free matching size; no complete-pair matching is silently assumed.

For illustration only, consider the B-completion phase with 24 labels and
276 free internal B pairs, after the supplied A graph and all A-B incidences
are fixed. If its proved cell overlaps contain four disjoint saturated
five-cells, use a matching on the remaining four labels. Then `k=4,r=2`, and
(18) gives

\[
       3^4 2^{276-40-2}=81\,2^{234},
\tag{19}
\]

compared with `2^264` from the matching theorem. The exponent saving over that
matching bound is `30-4 log2(3)`, about 23.660 bits. Compared with enumerating
the twelve C5 patterns per cell and eliminating that same leftover matching,
the new chart step saves `4^4=256` outer choices. Degree intervals, weighted
degree intervals, and a whole-B edge-count budget satisfy the stated contract
here. **The existence or frequency of four such disjoint cells is not proved.**
This is a conditional complexity specialization, not an order-43 search result.

For partially fixed cell interiors, write `q_i` for the number of free internal
pairs in cell `i`. Enumerate the three charts and turn its fixed pairs into
units, discarding charts with no local solution. If `h_i<=3` charts remain
locally compatible and some `h_i=0`, reject immediately in polynomial time.
For all `h_i>=1`, the analogous valid bound is

\[
 O^*\!\left(2^{m-\sum_i q_i-r}\prod_i h_i\right).
\tag{20}
\]

A cell with many fixed pairs may provide little or no advantage under this
bound. The engine can compare (20) with the ordinary matching bound before
choosing the reduction. Local chart filtering is not a claim that those charts
survive all global constraints.

## 8. Operator contract, evidence, and the precise remaining limitation

The separate [cell-square prototype](cell_square_completion.py) implements the
following operation without modifying the original matching compiler:

```python
compiled = compile_cell_squares(conditioned_state, cells, charts, matching)
answer = solve_kernel(compiled.kernel)
assert verify_answer(compiled.kernel, answer)
graph = reconstruct(compiled, answer.values)  # only for a SAT answer
```

Its checks are part of the contract:

1. Every supplied cell has five distinct current labels. Cells are pairwise
   disjoint. The prototype requires existing positive and negative obligations
   of threshold at most three covering each cell; it does not invent them.
   Other valid cell certificates can be incorporated through a separately
   verified obligation insertion step.
2. The reserved matching is free, disjoint, and wholly on uncovered labels.
   Every non-cell, nonmatching pair is already fixed. Cell fixed pairs become
   units rather than being overwritten by the chart.
3. All original obligations are retained, including overlapping cells, stricter
   thresholds, and ambient global restrictions. The only omitted witnesses
   have a stated same-cell triple justification or an opposite fixed pair.
4. Every budget is exactly aggregated after substitution. The prototype accepts
   support at most two, redundant budgets, and immediately impossible budgets;
   unsupported cases raise `NonQuadratic`.
5. A SAT answer reconstructs every graph pair. An UNSAT answer has the existing
   checkable implication-path certificate or an empty clause. Compiled clauses
   retain witness, fixed-pair, or budget provenance. A verifier still needs to
   check the chart and compilation contract before using such paths to reject
   a graph cofactor.

The prototype is an experimental cofactor compiler, not an integrated
order-43 search or an outer-family exclusion certificate. Section 5's existing
matching validation remains separate. Its bounded new checks and results are
recorded in [cell-square validation](cell_square_completion_validation.json).

The new author validation checks all 1,024 labelled graphs on a single cell
to verify the exact twelve-cycle chart partition, then compares **7,108 chart
cofactors and 73,168 reconstructed coordinate assignments** against direct
graph semantics. These include all 1,024 exterior assignments for one cell
plus an uncovered pair under both `(4,4)` and `(5,5)`, two-cell states with
overlapping obligations, 540 budgeted chart cofactors, partially fixed cell
interiors, explicit contradictory fixed pairs, and rejected invalid contracts.
Every existence result and returned SCC certificate is also checked. No
production search or timing comparison was performed.

There is also a supplied-graph fixture using the retained Exoo 42-vertex matrix.
Process its labels `0..17` by the accepted exact derivative, retaining every
normalized obligation and all differentiated degree intervals `18..24`. Among
the remaining labels `18..41`, inspect cells `N_R(Q) intersect M_R(P)` for each
processed edge pair `Q` and processed independent pair `P`. This gives fourteen
distinct size-five certified cells; exhaustive inspection of their
four-subfamilies shows that the maximum disjoint packing **in this list** is
three. The validation records a packing of three, its explicit anchor pairs,
and the source matrix hash.

Erase the thirty internal pair values of those three cells and four matching
pairs on uncovered labels, and retain the other 242 remaining pair values from
the matrix. The compiler handles all **86 positive obligations, 122 negative
obligations, and 24 residual degree budgets**. It checks all 27 chart
combinations, each with ten coordinates and between 34 and 44 clauses. Exactly
one chart combination is satisfiable; its returned model reconstructs the
source graph, and the full 42-vertex graph is checked directly
against every five-set and all degree intervals. This establishes that the
required structural inputs occur in one actual recursive history and that the
new operator works on it. It is a supplied order-42 residual, **not** the
rooted degree-18 B-completion phase, and gives no general cell-packing lower
bound or order-43 exclusion.

The result makes one particular inherited structural deduction computationally
useful. A saturated `(3,3)` cell provides a large internal remainder with an
exact two-coordinate description, and every constraint can see at most one
of its internal pairs unless it is already killed by the cell theory. Several
such cells therefore interact through 2-CNF.

The restriction to **disjoint** cells is used in the proof that surviving
unknown pairs have disjoint endpoints. For overlapping cells, consistency
between shared chart pairs gives binary equations, but that fact alone does
not bound the width of all remaining Ramsey witnesses. Overlapping cells are
kept as obligations; the theorem does not simultaneously parametrize them.

The restriction to threshold five is also used: a six-set can meet three
selected cells in two vertices each. Fixing every cross-cell pair on that
witness to be a nonedge leaves a three-literal independent-set clause in three
independent chart variables. Selecting one internal pair from each of three
cells with a prescribed chart variable makes the relation `x or y or z`.
The same majority obstruction as Theorem 4 rules out general quadratic closure.

Finally, an arbitrary union of chart combinations need not be quadratic. The
`3^k` outer choices remain explicit; only the `4^k` orientation choices are
eliminated together. No theorem here forces `k` to be large, bounds all later
outer branching, or changes the leading quadratic coefficient of the general
Ramsey search exponent. The concrete next measurement is the maximum number
of disjoint certified saturated cells in actual residual states, together with
how often fixed-pair and budget filtering preserve a saving under (20).

<a id="cell-square-review"></a>
## 9. Independent review of the structural extension

The following decisions cover the retained proofs and the stated supplied-input
contracts. They do not assert novelty, a formally checked theorem, complete
input-family coverage, or an order-43 exclusion. Authors and reviewers are
distinct for each covered contribution.

| Contribution | Author | Independent reviewer | Outcome |
| --- | --- | --- | --- |
| Theorem 2: quadratic relations, Boolean ideals, projection, and canonical clauses | /root | /root/structural_quadratic_remainders | Accepted |
| Theorem 8: three-square parametrization and exhaustive labelled coverage | /root/structural_quadratic_remainders | /root | Accepted |
| Theorem 8: optimality within unconstrained literal charts | /root | /root/structural_quadratic_remainders | Accepted in its stated restricted scope |
| Theorems 9--10, budget substitution, partial cells, and section 8's operator scope and limitations | /root/structural_quadratic_remainders | /root | Accepted |
| `cell_square_completion.py`: chart construction, compiler, reconstruction, and validation scope | /root/structural_quadratic_remainders | /root | Accepted for the documented cofactor contract |
| `quadratic_completion.py`: `implications`, `solve_kernel`, and `verify_answer` for well-formed kernels | /root | /root/structural_quadratic_remainders | Accepted; original matching compilation is outside this review |

For the new parametrization, /root independently generated all twelve labelled
cycles and verified unique coverage by the three four-model charts. A separate
truth-table check covered **all 59,049 partial assignments** to the ten internal
pairs, including incompatible ones. It agreed exactly with filtering the
twelve graph models directly.

The completion proof was checked in its two exhaustive witness cases: a
same-cell triple makes the homogeneous event impossible for every chart
assignment; without such a triple, all surviving unconditioned pairs have
disjoint endpoints, so a witness of order at most five contributes at most two.
The review also checked threshold-one failures, arbitrary overlapping input
obligations, fixed internal pairs as units, and the need to condition all
cross-cell pairs. Independent direct graph checks passed on **432 two-cell
cofactors and 13,824 full graphs**, across `(5,5),(5,4),(4,5),(4,4)`.

For budgets, /root checked signed coefficient aggregation, cancellation of
ordinary degrees and whole-cell edge counts, the two-coordinate bound for a
weighted star, and the explicit refusal of unsupported wider budgets.
**4,680 additional weighted-degree assignments** passed direct comparison,
including repeated coefficients and all integer intervals in the tested range.
The review rederived (18)--(20), separated the `4^k` gain over cycle enumeration
from the classification gain, and independently found the fourteen Exoo
residual cells and maximum disjoint packing three in that candidate list.
The complete retained author validation, including the supplied Exoo cofactor,
was replayed successfully.

Two requested implementation/statement repairs are retained: fixed-cell units
use a sorted enumeration for deterministic provenance, and a zero compatible
chart count is handled as an immediate polynomial rejection before applying
the product bound (20).

For Theorem 2, `/root/structural_quadratic_remainders` independently checked
Davis--Putnam projection in both directions, the point-idempotent proof of the
Boolean ideal identity, and the `2d^2` bound for the complete binary consequence
table. Its review of the imported solver checked component ordering, the paired
contrapositive arcs that justify the assignment, and the independent path
certificate contract. Separate tests covered **1,654 well-formed kernels and
34,537 truth assignments**, and rejected **464 truncated contradiction paths**.
That reviewer also checked the optimality sublemma's signed degree balance,
four-pair minimum support for each effective coordinate, and the treatment of
constant and unused coordinates.

No author accepts their own contribution. The original matching-specific
Theorems 1 and 3--7 and original matching compiler are not promoted by these
reviews. The remaining structural question is whether sufficiently many usable
cells, with a useful budget profile, occur across the required input families.

## Changelog

* Derived matching cofactor arity reduction, the exact existential implication
  calculus and quadratic Boolean-ideal elimination, and a uniform
  `O*(2^(m-d))` completion decision bound.
* Proved the threshold-six obstruction and NP-completeness boundary, the
  threshold-four counting/global-budget obstructions, and optimality of the
  unconditional supportwise quadratic reservation.
* Implemented exact cofactor compilation, SCC solving, witness reconstruction,
  contradiction-path checking, and a small complete outer enumerator.
* Added direct graph-semantic, algebraic, budget, coverage, and supplied
  order-42 author validation. Independent review remains pending.

* Added the three-square parametrization of inherited saturated `(3,3)` cells,
  its exact global quadratic completion theorem, weighted budget contract,
  conditional complexity bound, and bounded structural validation, including
  three actual certified cells in a supplied Exoo recursive history.
* Integrated independent acceptance of Theorems 8--10, the separately reviewed
  literal-chart optimality lemma, and the cell-square compiler. Independently
  reviewed Theorem 2 and the shared implication solver; other original matching
  claims and matching compilation remain pending.
