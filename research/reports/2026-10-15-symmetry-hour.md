Integration status (2026-10-15): all fourteen claims received independent
acceptance after the scope and wording corrections documented in the
[audit report](2026-10-15-symmetry-audit.md). Claim09 was strengthened to
p<=10 and at least four singleton complete signatures at x136. The
[manifest](../../docs/general_theorems/symmetry_audit_manifest.json) records
revised reviewed and integrated hashes. The original handoff below is
preserved unchanged; its hashes and pending labels describe the author stage.
The user authorized committing the surviving revisions. No Ramsey branch
closure or measured runtime improvement is asserted.

# One-hour symmetry research handoff

Date: 2026-10-15. Task: `symmetry-hour-20261015`. Author: Codex.
Started 10:40:09 UTC; completed within the one-hour budget.
Base revision: `7ebbef265ef9b55746b798b337b86e4fd6140045`.

Fourteen mathematical claims in three new notes are ready for independent
exact-revision review. All checks below are author checks. No claim is
independently accepted and no accepted branch status, pruning rule or theory
map was changed. Input hashes and dependency links are in the notes.

| Deliverable | Claims | SHA-256 |
| --- | --- | --- |
| [disjoint_swap_stabilizers.md](../../docs/general_theorems/disjoint_swap_stabilizers.md) | 2 | `bdbf5f1aabd35cfb1dec4d8ffa24dfb260a227d0561854c8dd652975161b7c46` |
| [symmetry_pair_gluing.md](../../docs/general_theorems/symmetry_pair_gluing.md) | 3 | `9d57200109c45fcaca71167f209781a4f3a10fd5b8de8a79459396c9b796391b` |
| [symmetry_structure.md](../n43/symmetry_structure.md) | 9 | `6152574608e34c427c0af0da7eee210969034ece5a2055e4622e0dd0bb385b58` |

The strongest quantitative result is that disjoint duplicate swaps fixing a
completed graph form a partition subspace, described only by equal swap bits
and pinned zeros. Every free component has at least five pairs, because all
order43 vertex pairs have at least eight distinguishing vertices. Thus for
p duplicate pairs the stabilizer has order at most2^floor(p/5) and each
completion orbit has at least2^(p-floor(p/5)) distinct labeled members.
At p=12 this is a guaranteed label factor1024, with no runtime claim.

Throughout x136..141 this bounds the kernel of rooted automorphisms restricted
to A by4, yielding |Aut(G)_v|<=4|Aut(A)|. Combining sorted-column generation
and the residual completion quotient accounts for at least24!/4 distinct B
labelings per rooted object with fixed labeled A. The action on candidates
remains larger than its stabilizer on a particular completed graph.

Through x139 duplicate pairs are forced edges. A free component of five pairs
has a rigid ten-vertex support: matching blocks between pairs, five internal
neighbors per vertex, global degree18, and a13-vertex4-regular triangle-free
common neighborhood per pair. That component cannot coexist with another
free edge-pair component. Thus for p10 or11 the stabilizer cap improves to2,
giving orbit factors512 and1024. At p12 an order4 stabilizer can only have
two six-pair components; this remaining configuration is not excluded.

Conditional on the concurrent independently unreviewed degree-eight anchor
proof, x136 cannot have p12: an anchor cross-row has odd sum9, while entirely
doubled columns give even row sums. This gives p<=11, rooted kernel cap2,
and B-label orbit at least24!/2. The conditional anchor dependency is explicit;
its proof and its r1 exclusion were not integrated or independently reviewed.

The pair-gluing note classifies common-neighbor identifications by double
cosets J_v \ Aut(S) / J_u, with J_u,J_v the induced overlap images of the
pointed neighborhood automorphism groups. After a map is fixed, the exact
completion group is their fiber product times S_t on the neither-root cell.
Both restriction kernels are included in its order formula. The coverage
proof composes pointed-neighborhood selection, map quotient and completion
quotient. It applies to the accepted normalized degree20/21 pair families and
conditional degree18 families; input enumeration and certificates remain open.

Additional structural results: every nonidentity automorphism of an order43
candidate moves at least10 vertices; every such candidate is prime under
modular decomposition; every order24 K5/I4-free antineighborhood is prime as
well. The exhaustive module tables give maximum total orders39 and23 for
proper nontrivial modules in these two ambient classes. No primeness statement
is transferred to the order18 K4/I5-free neighborhood.

Author validation rederived the pair formula in G and its complement, classified
every two-bit block stabilizer subgroup, checked the module tables and orbit
arithmetic with Python standard-library integer calculations, and verified
all local links, unique anchors, claim metadata counts and whitespace. This
was algebra/document validation, not graph enumeration. The five-component
exclusion was audited by moved/fixed partition of each13-vertex common-neighbor
graph, then by a forbidden independent five across anticomplete supports.

A proposed upper bound13 on the set of distinguishing vertices was withdrawn:
that set need not be triangle-free. Only the proved lower bound8 is used.
An interim22 module bound in the K5/I4 case was corrected to23; primeness at24
still follows. No unsupported fixed pair-incidence count remains in Claim07.

Independent review should prioritize the partition-stabilizer theorem, the
five-pair component exclusion, both module tables, and the converse double-coset
classification. Claim09 also needs acceptance of the concurrent anchor chain.
After exact-hash acceptance, the coordinator can integrate navigation and
appropriate symmetry/propagation uses. Complete generation, all overlap types,
checked permutation omissions and UNSAT certificates still require future
implementation on the stronger machine.

No solver, proof checker, theorem prover, graph canonicalizer, graph search,
external download, installation, catalogue, new construction, branch closure,
novelty review, Git staging or commit was performed. The existing uncommitted
work was preserved. Ownership of these new files is released at handoff.
