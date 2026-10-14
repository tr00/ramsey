# Proof review status

Date: 2026-10-13.

Reviewed all research notes, reports, the reference checker/CNF generator, and
its tests. No computational exploration or external acquisition was performed.

Two material gaps were found: the 45-edge 15-vertex core exclusion incorrectly
infers equality from compatible one-sided triangle bounds; and the normalized
minimum-degree-18/19 split omits tied outer degree counts. Prior statements
claiming only three attachment cases or strict first-pair inequalities should
not be used as complete reductions.

The exact interface framework, degree-18 frontier identity, tau>=3 lemma,
anchor rigidity, rooted identities, and normalized minimum-degree-20 formulas
survive mathematical review, conditional on their external numerical premises.
Several proof sketches and claimed countermodels need fuller evidence.

Recommend joint multi-column interface compatibility, a bounded band above
x=136, safe symmetry coverage, and explicit coverage of the remaining pivot
branches. Deprioritize the isolated 15-vertex attachment problem. No global
bound improvement or novelty claim is made.

Detailed audit, corrected case coverage, and directions:
`docs/proof_review_2026_10_13.md`.
