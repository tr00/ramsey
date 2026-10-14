# Proof review and research priorities

Date: 2026-10-13. This is a review of the files in this workspace, not a fresh
literature verification or an independent certified proof. No graph search,
solver, catalogue download, or installation was performed. Published numerical
extrema are treated as external premises pending precise source verification.

## Material proof gaps

### The 45-edge core exclusion is not established

In `lemma_phase_2.md`, Section 3, write `t` and `u` for the triangle counts of
the proposed 6-regular core H and its 8-regular complement. The stated arguments
give `t+u=95`, `u>=50`, and `t<=45`. These inequalities are compatible with
`t<45` and `u>50`; they do not force equality. Consequently the assertion that
all neighborhoods of H are K(3,3) does not follow. The final cut contradiction
is valid conditional on that neighborhood structure, but does not prove it.

Even if the auxiliary 8-vertex edge lower bound is accepted, this gap persists.
Restore the p=45 possibility: H has degree sequence `6^15`, and
`q+s=23`, with `s>=21`. Thus q is 0, 1, or 2. The attachment degree multisets
are respectively `(9,7,7)` or `(8,8,7)`; `(8,7,7)`; and `(7,7,7)`.
These are necessary arithmetic cases, not assertions of realizability.
The listed three p=46/47 cases remain valid necessary cases, but the claim that
they exhaust the reduction is unsupported. This also affects the Phase II report.

### The minimum-degree complement split omits ties

The selector `D <lex D^c` and the first-nonzero-difference rule in Phase I,
Section 2, are correct. The following branch list is too restrictive.
Minimum degree 18 does not imply `n18>n24`: these counts can tie, and a later
difference can decide the selector. Likewise minimum degree 19 can have
`n19=n23` with `n20>n22`.

The correct normalized split is:

- Minimum 18: `n18>0`, and the first nonzero entry of
  `(n18-n24,n19-n23,n20-n22)` is positive.
- Minimum 19: `n18=n24=0`, `n19>0`, and the first nonzero entry of
  `(n19-n23,n20-n22)` is positive.
- Minimum 20: only degrees 20,21,22 occur and `n20>n22`.

The alternative arbitrary even-degree pivot split into 18 and 20 is sound.
It must not be combined with minimum-degree-20 restrictions without a separate
coverage argument. The error propagates to the Phase I report.

## Results that survive this review

Re-derivation supports the universal degree/codegree bounds, Goodman identity,
triangle lower inequalities, homogeneous-set counting bounds, exact gluing
criterion (assuming the internal graphs have their stipulated Ramsey types),
single-signature and intersection constraints, Hall anchor bounds, quadratic
interface inequalities, the census-dependent degree-18 corridor, and the
minimum-degree-20 parametrization and pivot identities.

In Phase II, the identity
`x=136+2(85-a)+Delta_A` proves the frontier and its equality conclusions.
The transversal proof `tau_4(F)>=3` is sound: its lower bounds on e(F) are
81,77,72 for deletion sizes 0,1,2. It does not depend on the defective
45-edge core exclusion. The independent-four anchor bounds, simultaneous
anchor equality conclusion, and rooted degree-energy identities also survive.

For the rooted identity an independent derivation is obtained from
`h_v=C(42-d(v),2)-e(G)+sum_(u in N(v))d(u)`.
For the weighted identity use
`Q=21S+C-2 sum_(uv edge)delta_u delta_v`.
These reproduce the coefficients 399,43,3 in the recorded formulas.

The strongly regular exclusion is sound under the stated codegree premises.
The assertion about at least four eigenvalues additionally uses connectedness:
a disconnected candidate of minimum degree 18 would have two components of
order at least 19, each containing an independent triple by R(5,3)=14, which
would give an independent six-set. A connected regular graph with exactly
three eigenvalues is strongly regular.

The regular-corner nonedge improvement has a valid structural mechanism:
`d_L(y)=mu_vy+5`, so an L-edge incident with a degree-7 vertex forces its other
endpoint to degree 13 by the mixed-cell bound. Its 13-vertex neighborhood is
4-regular, making N_L(x) 4-regular and triangle-free on seven vertices, impossible
by Mantel. The mu=3/4 clique assertion follows because an L-edge requires the
two mu values to sum to at least 10. The edge improvement's intermediate
68/73 residual edge bounds need explicit proofs or exact source locations.

## Documentation and evidence limitations

The catalogue-free a<=96 argument and perfect-matching argument in Phase I
are sketches, not fully presented proofs. In particular, supply the Tutte
obstruction case coverage before treating the latter as an audited standalone
lemma. The claimed explicit set-system countermodels and feasible moment
distributions in Phase II are not included in the folder; retain their actual
objects and checks before citing them as independently auditable evidence.

Published extrema need table/theorem/page references, including the residual
17/16-vertex bounds used in the regular corner. The local files do not establish
that their bounds or literature inventory are current as of today's date.
Internal re-derivation does not establish novelty or external verification.

The reference checker exhausts the required subsets for any accepted witness;
the CNF signs and variable mapping agree with the graph semantics. There is a
minor reproducibility mismatch: policy requests consecutive clique/independent
clauses per subset when sizes coincide, but the generator emits all clique
clauses first. Either convention is deterministic and semantically correct;
document one consistently before generating evidence.

## Recommended directions

1. Prioritize joint interface compatibility. A size-three transversal existing
   locally is much weaker than its participating in 24 mutually compatible
   columns with the prescribed B graph and degree totals. Keep actual subsets,
   not only their sizes or hypergraph incidence counts. For a clique Q in B,
   the common column intersection in A must contain no K_(5-|Q|); for an
   independent Q, the common column zero-set must contain no I_(5-|Q|).
   Pairs, triples, and quadruples provide the complete mixed five-set tests.
   The next useful theorem would restrict simultaneous signatures, rather than
   prove universal nonexistence of every local three-transversal.
2. Study a band near the frontier, not solely equality. If x=136+k, the exact
   identity gives `2(85-a)+Delta_A=k`. Thus k=1 forces a=85 and a single unit
   of A degree excess; k=2 allows only a=85 with excess two or a=84 with
   excess zero. These audited consequences give a controlled extension of
   equality lemmas. They do not themselves exclude any branch.
3. Develop certified symmetry coverage on paper. Product-group lex minimization
   is sufficient but not necessary: any rule retaining at least one matrix per
   orbit is safe. Stabilizer chains can reduce partial matrices, provided one
   group element acts on all assigned signatures together. Distinguish residual
   fixed-pivot symmetry from the separate choice among possible pivots.
4. Address coverage beyond the extreme corner. Develop the minimum-degree-19
   branch explicitly if using minimum pivots; otherwise develop the arbitrary
   degree-20 branch allowing the full global degree range 18..24. In parallel,
   the normalized minimum-degree-20 branch offers a narrow degree alphabet for
   constraints on adjacent and nonadjacent pairs of pivots. A useful goal is
   coupling their induced neighborhoods, rather than another scalar moment bound.
5. Park the 15-vertex attachment problem as a later finite diagnostic. Even
   proving tau>=4 would remove size-three columns only in the x=136 branch
   (and mu=3 at pivots with e(A)=85 in the regular corner); it would not remove
   all degree-18 candidates or decide order 43. Revisit if joint-interface work
   needs a particular local classification. Universal fractional-design and
   regular-to-SRG routes also remain low priority without additional structure.

These priorities are judgments about research value, not evidence that any
surviving case exists or fails. The global Ramsey bound is unchanged.
