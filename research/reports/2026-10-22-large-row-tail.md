# Large-row deficits and a degree-20 rerooting exclusion

Date: 2026-10-22. Author and self-auditor: /root, working alone.
Task: `large-row-breakthrough-20261022`.
Base revision: `d6d6ee085b701171362b6de8ea16f32383f09d9c`.

The main result is a two-core rerooting inequality: adjacent degree-20
vertices v,u with exactly two common neighbors satisfy
e(N(u))-e(N(v))>=x_v-282. If v maximizes neighborhood edges in its
degree class, x_v<=282 follows. The pair argument even allows degree-18
vertices elsewhere. It also excludes the size-17-row, x=289 endpoint
in the no-degree18 branch for a degree-20 root maximizing neighborhood
edges in the same graph.
It is [Claim 4 of the large-row note](../n43/d20/large_row_tail.md#claim-d20-large-row-maximal-root).
The purported endpoint exposes two 8-regular critical 17-cores, has
at most 80 edges in the original neighborhood, and supplies another
degree-20 root with 86 or 87 neighborhood edges. The root selection
retains all maximizing ties and needs no symmetry reduction. This
excludes a precisely stated endpoint, not the whole d20 branch.

The same note strengthens the three/four-size-17-row ceilings from
282/282 to 278/276, forces degree 24 and a singleton/double-signature
partition for four such roots, and describes the unrestricted x=289
single-size-17 endpoint, including at least fourteen degree-24 vertices.
The [degree-19 note](../n43/degree19_row_ceiling.md) proves x<=289 for
every degree-19 root, even when degree-18 vertices occur; equality forces
four size-16 and fifteen size-15 rows. All six claims are **ready for
independent review**, with full proofs. No claim is marked accepted.

These deductions use only the stated small Ramsey bounds and the
ambient degree window. The degree-20 scalar cuts are rederived, rather
than importing pending assertions as accepted dependencies. No edge census
or identification of a critical core with Paley17 is used in the proofs.
The complement-closed residual's existing census cap x<=272 is explicitly
recorded to distinguish it from the weaker conditional 288 bound.

The [standard-library driver](2026-10-22-large-row-tail/validate.py) checks
all 70 scalar d20 high-row profiles, all 15 d19 high-row profiles, both
partitions of the single-size-17 endpoint's deficit, the 12 permitted
two-core attachment-count cells, and the four-root anchor equality.
The general transfer identity is checked by direct integer substitution
at every scalar cut and the extreme aggregate degree slacks.
Every check passed. The
[retained output](2026-10-22-large-row-tail/validation.json) pins proof,
driver and dependency SHA-256 hashes. Deterministic replay and local link,
claim-anchor and whitespace checks also passed. These are author checks;
scalar cells are not assertions of graph realizability.

The initial four-five-column frame investigation yielded no exclusion.
An early conjecture that the x=290 endpoints force degree-24 vertices
was corrected: that inference belongs to x=289 with a size-17 row.
The two x=290 profiles, (t,l,h,D)=(0,1,8,0) and (0,2,6,0), remain
unexcluded. The order-43 decision and the global interval 43..46 remain
unchanged. No literature novelty assessment was performed.

Narrow navigation was added in the order-43, d20, results and report
indexes. Existing proof notes, review states, active WORK rows, Lean,
engine and search filters were preserved. No subagents, graph enumeration,
solver, theorem prover, download, installation, staging, commit or external
publication was used. Independent review of the exact six claim revisions
is the next gate before any executable pruning. The unresolved unrestricted
x=290 profiles are the next arithmetic endpoints to investigate.
