# Independent audit of the degree-18 cross upper bound

Editorially condensed on 2026-10-21; [original audit and lineage](../../reports/2026-10-21-research-cleanup.md).

Date: 2026-10-15. Task: `audit-pending-20261015`.

Claim(s): `cross_upper_bound.md#claim-cross-upper-corridor` and
`cross_upper_bound.md#claim-cross-upper-defects`.

Author and reviewer: Codex cross-upper-bound task; independent
`/root/audit_family_overlap` agent.

Reviewed revision: repository HEAD
`b12925f7a96d24e18d06b0237930a32e30660ca2`, exact uncommitted source
SHA-256:

```text
e6aec586624b6370644ba8c75c00836c6dce1ffb720ae3ff4a39e395a46a82e0  n43/d18/cross_upper_bound.md
```

Dependencies reviewed: external `R(4,5)=25`; published upper extremum
`e(complement G[B])<=132` for `(4,5)`-free graphs of order 24;
and, for the displayed lower corridor endpoint, the published order-18
neighborhood extremum `a<=85`. The exact local references read were:

```text
e6ea1c070e32ac04a73eb53a5634921acb7fe6d02123a3c7d35a710f262a698e  docs/mathematical_baseline.md
8d29ca3e08dea89ab4f6962b815e143aaef9127a95614d3a6dd3c46ccbafe764  docs/upper_bound_method_review.md
492e4ce1fb5ea8e4f7292153f927089d632587eb734e4f8354ab61bdd5d6f29b  n43/reductions.md
51220632656f91905d0ace361179ea8953a51ea6e544005d723ac7425df7e5b2  docs/workflow.md
```

The census reference is Angeltveit--McKay, arXiv:2409.15709v2,
Appendix A, Table 1, as recorded by the source. The archived method review
records retrieval provenance but is not a census proof replay. This audit
verifies application and algebra, conditional on those external theorems.
No theorem proof, census completeness certificate, solver, graph enumeration,
download, installation, or formal checker was run.

## Decisive independent checks

Both surviving claims were accepted on their declared external premises.
The B degree sum gives `2b+x<=576`; the published complement cap132 gives
`b>=144`, hence `x<=288`. Equality requires b=144 and every B vertex of
global degree24. The A sum separately gives `x>=306-2a>=136`, using a<=85.

The exact nonnegative defect identity is
`288-x=2(b-144)+sum_B(24-d_G(y))`. Conditional degree refinements, the A
upper bound `x<=414-2a`, and all integer substitutions were checked.
No extra degree, small-q or root-selection restriction is automatic.

## Previously withdrawn stronger attempts

The claimed stronger bounds 277 and 272 remain **withdrawn**. The source
correctly identifies the fatal adjacency error: an independent triple in
`B` cannot be extended by both the pivot `v` and a vertex `z in A`,
because `vz` is an edge. Therefore that proposed independent-five
obstruction does not establish restrictions on the internal degree of a
vertex with a size-17 or size-16 cross row. This audit does not restore or
use those unsupported restrictions. The invalid step rejects those proofs;
it does not prove the numerical bounds themselves false.

## Search use and limits

The two current claims may support propagation after coordinator integration,
with Ramsey and census premises recorded. The upper corridor can narrow the
residual branch to `143<=x<=288`; it neither closes that branch nor proves
`x<=142`. All quantifiers apply to any chosen degree-18 pivot, with no
root-selection assumption, regularity, or complement normalization.

No unsupported inference was found in the two surviving proofs. No source
or shared index was edited by this reviewer. Any substantive source change
requires a fresh exact-revision audit, and no order-43 certificate or novelty
claim is supplied here.

## Metadata integration confirmation

On 2026-10-15 the reviewer independently compared the coordinator-integrated
source with `git show HEAD:n43/d18/cross_upper_bound.md`. The latter's
SHA-256 is exactly the original reviewed
`e6aec586624b6370644ba8c75c00836c6dce1ffb720ae3ff4a39e395a46a82e0`.
The integrated source has SHA-256:

```text
deb3638325170ef498710a049b21dd16614c8437962ce62b243a91e7c43c4c25  n43/d18/cross_upper_bound.md
```

The full diff contains only accepted review-state metadata, review links,
permitted propagation metadata, the introductory review-status sentence,
and replacement of the obsolete pending-review handoff paragraph by the
accepted-review and residual-corridor summary. Hypotheses, dependencies,
statements, equations, counts, equality conditions, conditional refinement
table, and the withdrawal of bounds 277 and 272 are unchanged. The new
residual-corridor sentence is precisely the consequence already permitted
by this review; it is not branch closure. Both claim acceptances therefore
apply to this integrated hash without a mathematical proof change. This
confirmation does not edit the source or confer acceptance on subsequently
changed versions of other files.
