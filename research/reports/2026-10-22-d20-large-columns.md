# Useful reductions in the saturated d20 large-column branch

Date: 2026-10-22. Main, working alone.

Outcome: the all-columns-at-least-five branch remains open, with four new
local deductions in [large_columns.md](../n43/d20/large_columns.md).
All are ready for independent review; none is an accepted executable filter.

The reductions bound size-six column counts by 10,9,6,3,0 as size-five
counts range from zero through four; retain stronger actual-overlap and
equality constraints; force a 4+8+10 B frame for four size-five columns;
exclude four of the 15 five-column shapes at a=100; and impose a triangle
resource inequality and an exact eight-core reduction for nonadjacent
six-column endpoints. They retain degree 19 and all relative labellings.
No category has a complete refutation or an ambient construction.

The [standard-library validation](2026-10-22-d20-large-columns/validate.py)
checks the count optimization, all group-size solutions, every 2^8 and
2^13 local cell assignment with two homogeneous-subset implementations,
all 254,016 E-subgraph combinations, and all 1,024 labelled five-vertex
graphs up to every permutation. It also checks the shared-triangle rule
on every size-five/size-six pair named by a shared triangle in explicit
Paley17. No universal Paley-core identification is assumed. Exact output is in
[validation.json](2026-10-22-d20-large-columns/validation.json); hashes
identify the proof, driver and output. These are author self-checks.

A small exploratory integer optimization guided the shape inequality:
for each of the 15 five-column shapes it maximized signature incidences
into a 15-vertex complement using degree and homogeneous-subset capacities.
It ran with scipy already present in /tmp/ramsey-pivot-floor/venv (five
seconds per shape), without installation or network access. All 15 relaxed
problems were feasible, so the experiment gave no closure. The final
bound is proved by inclusion-exclusion and the existing published edge
premise; no optimizer answer is a proof dependency. The small driver and
output are retained for the exploration's scope and reproducibility.

No order-43 SAT search, catalogue processing or acquisition, Lean/engine
changes, staging or commit was performed. Existing uncommitted work was
preserved. The d20 branch README and categorization link the new result.

The next narrowed case is the four-five B frame: identify overlapping cell
pairs, choose all remaining B adjacencies, then impose the full A and cross
completion constraints. Alternatively, use the size/triangle compatibility
filter on actual column domains throughout the remaining count region.
The all-columns-at-least-seven branch is still covered and unresolved.
