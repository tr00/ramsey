# Saturated d20 closure attempt

Date: 2026-10-22. Main, working alone.

Outcome: complete disjoint structural categorization and an explicit remaining
completion problem; no full or partial branch closure.

The proof home is [saturated_categorization.md](../n43/d20/saturated_categorization.md).
Its three claims give 22 categories, an exact fixed-side 440-bit completion
criterion including every saturation witness, and the unresolved obligations.
All claims are ready for independent review. The categories classify necessary
structural predicates, not graph isomorphism classes or demonstrated realizations.

The [retained self-check](2026-10-22-d20-saturated-categorization/validate.py)
counts the categories, checks a scalar profile, compares the split rectangle
criterion against direct five-set checks on all 32,768 small fixed-root graphs,
and compares common-triangle witnesses with explicit single-edge additions.
Results are in [validation.json](2026-10-22-d20-saturated-categorization/validation.json).
This is an author's self-check and supplies no order-43 feasibility claim.

No solver, catalogue acquisition, download, Lean change, staging or commit
was performed. Existing uncommitted work was preserved. The d20 README links
the new result. A hash manifest identifies the new proof and validation files.

Next mathematical obligation: exclude all eligible side pairs and matrices in
all categories, or produce and exhaustively verify a completion. Complemented
saturated routing remains a separate obligation even if this rooted branch
is eventually closed. Independent proof review is pending.
