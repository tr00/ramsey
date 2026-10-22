# First deductions for the degree20 residual branch

Date: 2026-10-22. Author and self-auditor: Main, working alone.
Base revision: 615c47df296f06251067d61dd84bac1b9cebbbcc.

Thirteen claims are ready for independent review in three proof homes:
[coverage and mixed-degree pairs](../n43/d20/residual_coverage.md),
[connectivity and critical cores](../n43/d20/neighborhood_structure.md), and
[interface bounds and exhaustive column split](../n43/d20/interface_bounds.md).
The [branch index](../n43/d20/README.md) now explicitly assumes no degree18
vertices. Narrow order43, reduction, results and report navigation was updated;
no accepted-status claim or executable search filter was changed.

The main unconditional deductions use only a degree20 root and absence of
degree18 vertices: two-connectivity on both internal (4,5) sides, exact
excess identities,160<=x<=290, at most one size-three column, no size-four
columns in its presence, at most three size-four columns, and density
thresholds excluding sizes3/4 at a>=96/98. A mixed-degree extension of the
accepted prescribed-family overlap theorem gives a disjoint complete pair
selection using roots of degree at most20, at most21, or complementary
roots of degree at most20. It avoids assuming a large single degree class.

If d18 is given priority in both complementary orientations, d20 has
degrees19..23, and the complemented B-side has connectivity at least3.
This complement-invariant residual predicate is kept separate from mere
absence of degree18 in the chosen orientation. Global K5-saturation is
also a separate premise: it forces every column to contain a triangle;
a size-three column is then a triangle, leaves a17-core, and implies
74<=a<=95. Its endpoint can have degree19 or20, leaving a16- or17-core
on its B-neighborhood respectively. Both are retained. Locally safe
A-nonedges require external blockers, rather than being omitted.

The saturation/orientation routing table records that complementing a
globally K5-saturated graph preserves I5 edge-deletion criticality and does
not imply K5-saturation of the new orientation. Therefore saturated d18
and saturated d20 alone are not claimed to cover all complement orbits.
Maximum neighborhood-edge selection within a degree class is likewise
not substituted for global or neighborhood saturation.

Author validation checked all70 scalar large-row count profiles, all62
pointwise row and59 column degree tuples, and all89,056 handshake-compatible
degree-count vectors on19..23. These support the counting tables and
complete arithmetic coverage; none asserts graph realizability. The
[validation manifest](2026-10-22-d20-first-deductions.json) pins the exact
13 claim IDs, source/proof hashes, counts and upper-bound tables.
Local navigation and claim anchors were also checked, and git diff whitespace
validation passed. This remains an author self-check, with literature
premises inherited rather than recertified and independent review outstanding.

No subagents, solver, graph enumeration, catalogue, download, installation,
Lean/engine change, staging, commit or external publication was used.
Existing uncommitted d18 work and other active WORK ownership rows were
preserved. The d20 branch and the order43 decision remain open. Suggested
next work is independent review of these exact revisions, followed by
coupled-core attachment analysis in the size-three and size-four slices.
