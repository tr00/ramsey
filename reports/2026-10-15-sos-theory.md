# Theory-only SDP/SOS investigation for order 43

Date: 2026-10-15. Coordinator: Codex. Task token: sos-theory-20261015.
Input HEAD: `5c8d20526b37a1a74b6dbb3cb7540c6e829dec92`.
User explicitly requested parallel subagent research, no solver, focused on
choice of a degree-18 pivot or inequalities across varying x.

## Ownership and methods

Three authors investigated distinct approaches: sos_pivot (degree/excess
covariance and prescribed-family overlap), sos_columns (actual-column rooted
triple moments), and sos_finite (finite complementary-triangle moments and
transversal stability). The coordinator developed a fourth approach: rational
SOS certificates on dispersed attachment-obligation graphs. Authors self-audit;
different agents review exact file hashes before navigation integration.

Owned proof notes:

- `n43/d18/sos_pivot_selection.md`
- `n43/d18/sos_column_compatibility.md`
- `n43/d18/sos_finite_moments.md`
- `n43/d18/sos_obligation_graphs.md`

No solver, graph enumeration, package installation, catalogue acquisition,
download, staging or commit was performed. Tiny exact rational coefficient
checks validate displayed polynomial/matrix identities, not graph feasibility.
No literature novelty review or formal theorem-prover certificate is provided.
A is K4/I5-free and may contain I4; B is K5/I4-free. The general x corridor
and all unresolved branches are retained. Conditional reductions do not assume
that a degree-18 pivot exists in every order-43 candidate.

## Coordinator obligation result

For either established dispersed-star pattern, Boolean cover indicators on the
obligation graph encode which center attachments must consume capacity.
Independent-set SOS certificates therefore transfer directly to local rejection
certificates. The explicit eight-leaf cycle-plus-opposite-matching graph has a
rational positive definite shifted adjacency matrix. A centered quadratic SOS
proves its independent sets have size at most40/11, hence at most3. Thus every
cover has at least5 leaves. Eight witnessed leaves reject an omission-cell
star with full remaining nonneighbor capacity4, for every x. In comparison,
the graph has fractional matching optimum4 (weight1/3 on every cubic edge),
so the existing fractional-matching bound alone cannot reject this capacity.
No unavoidable occurrence or superior runtime is claimed.

## Independently audited results

The four main proof notes and one bounded addendum have seventeen independently accepted local claims.
Their exact reviewed bodies are preserved under integration banners, and
`sos_theory_manifest.json` records reviewed-body, integrated-source and review
hashes. The individual historical author reports retain their author-stage
labels. Independent review is mathematical, not a formal proof checker.

### Pivot selection and the same guaranteed pair

The [pivot note](../n43/d18/sos_pivot_selection.md) proves any twelve
actual degree-18 vertices contain an adjacent pair of codegree at most ten,
improving the accepted threshold thirteen. It does not assert that every
candidate has twelve degree-18 vertices. The proof excludes the old equality
case using exact triangle signatures and ambient attachments, and applies to
any prescribed family across every x. Full gluing use still requires every
allowed overlap, map and completion.

For H the higher-degree vertices, h=|H|>0, e=e(H), W=sum excess and
Z=sum excess squared, set R=Z-W^2/h, V=(3/2)eh-4e^2/h. A weighted
clique/spectral bound and explicit covariance squares give, for rational t>0,

    J=sum_(v degree18) E_v
      >=18W+Z-2eW/h-(tR+V/t)/2.

Use its rounded value or any stronger old lower bound. The universal root
cap min(W,W/2+4) also sharpens the family count. Conditional example
h10,W50,Z290,e(H)36,t3/4 gives J>=801, a safely selected minimum-q root
q<=4,x<=169, and at least fourteen roots q<=7. These fourteen roots
contain the same-edge overlap-ten pair. No graph realizing the example
statistics is asserted.

### Exact finite moments and beyond-equality anchors

The [finite note](../n43/d18/sos_finite_moments.md) strengthens sufficient
(4,4)-free core edge caps from37 to36 at order11 and49 to48 at order13.
The proof retains both complementary triangle counts, separate divisibility
constraints and exact nonnegative slack. The order13 case additionally
requires compatibility of actual neighborhoods, giving a14>12 cross-incidence
contradiction. These local caps do not require a new census.

The separately reviewed [order-twelve addendum](../n43/d18/sos_order12_addendum.md)
likewise improves the sufficient cap43 to42: its zero-slack equality would
require3t=124. The size-six low-degree transversal threshold becomes q>=3.
The original reviewed finite note is preserved rather than silently revised.

The low-degree transversal deletion table applies to any q. In the exceptional
q1,size9 case, three disjoint I4 anchors have total A-degree126; their actual
24-column incidence caps allow only96+E_A. Thus such a transversal requires
E_A>=30. Consequently every full q1 candidate with E_A<=29 has an I4
whose A degrees are all at least8, covering the fixed-q slice x138..167.
The exact stability identity is

    sum_(u in I)(d_A(u)-8)+eta_I=E_I,
    eta_I=e(I,B)-36=12-n1+h_I>=0.

At E_A=0 the anchor has degrees8 and the same twelve singleton/twelve
pair-signature structure as at equality. No exclusion of size-four columns
at q1 follows, since their degree floor is also8.

### Dispersed actual-column triple coverage

The [column note](../n43/d18/sos_column_compatibility.md) uses witnesses
which may vary by triple: an A edge in three columns' intersection forbids
a B triangle; an independent A pair outside their union forbids a B independent
triple. Let O contain the triples with at least one monochromatic possibility
not ruled out. For nonnegative rational weights, W_w=sum w, D_w=sum w^2,
T_w=sum w^3, the exact weighted monochromatic count is

    M_w=(W_w^3-6W_w D_w+5T_w)/24
        +(1/2)sum_y w_y(d_y^w-(W_w-w_y)/2)^2 <= O_w.

Integral degrees strengthen this: six columns require at least two open
triples, so nineteen doubly witnessed triples among their twenty is a
conditional rejection certificate even without individually forced pairs.
For all24 columns, c_y=|C_y| and tau_y=max(0,6-c_y,c_y-13),

    |O|>=440+sum_y tau_y(tau_y+1)/2,
    |O|>=ceil(437+(e(B)-138)^2/12).

At x136 the first becomes |O|>=440+s>=448. These filters apply across x;
no universal violation is proved. The equality anchor's first incidence Gram
has eigenvalues0,8a,8b,8c for opposite pair multiplicities a,b,c summing6:
its PSD condition contributes no information beyond these counts. This is a
proved limitation of that particular matrix, not a hierarchy lower bound.

### Explicit obligation-graph SOS

The [obligation note](../n43/d18/sos_obligation_graphs.md) and its
independent review establish the eight-leaf certificate described above.
It supplies a strict improvement over the existing fractional-matching
star test on this explicit graph, with rational matrix-square identities.
Every obligation edge still needs its own actual anchor and known B-pair
witness; no pattern is asserted to be unavoidable.

## Integration and scope

Coordinator navigation updates link the audited notes in the degree-18 parent,
results dashboard, reduction index and theory continuation. Every order-43
and x branch remains open as previously recorded. No bound on R(5,5) changes.
No theorem for eleven-root overlap coverage, uniform positive anchor packing,
or unavoidable obligation graph is asserted. Further literature review would
be necessary before any novelty claim.


Final verification: all five reviewed proof-body hashes, all five review hashes
and all integrated source hashes agree with the manifest. Local linked files
exist, and `git diff --check` passes. Shared task ownership is released; no
staging or commit was performed. The original four reviewed bodies and the
separately reviewed order-twelve addendum are preserved byte-for-byte.
