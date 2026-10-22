#!/usr/bin/env python3
"""Small arithmetic self-check; no graph search or satisfiability claim."""

import hashlib
import itertools
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


# Check every scalar high-row profile admitted by the two omission cuts.
d20_profiles = []
deficit_floor = [0, 2, 10, 14, 16]
for t in range(5):
    for l in range(5 - t):
        for h in range(21 - t - l):
            if 7 * h > 22 * (4 - t - l) or 5 * t + 6 * l + 7 * h > 66:
                continue
            floor = max(deficit_floor[t], 3 if t == 1 and l else 0)
            d20_profiles.append((t, l, h, floor, 280 + 3 * t + 2 * l + h - floor))

maxima = [max(p[4] for p in d20_profiles if p[0] == t) for t in range(5)]
assert maxima == [290, 289, 282, 278, 276]
equality_290 = [p for p in d20_profiles if p[4] == 290]
assert equality_290 == [(0, 1, 8, 0, 290), (0, 2, 6, 0, 290)]
single_289 = [p for p in d20_profiles if p[0] == 1 and p[4] >= 289]
assert single_289 == [(1, 0, 8, 2, 289)]

# Independently recover the single-17 profile from the full deficit equation.
# Deficit two across eleven rows at most fourteen has only two partitions.
deficit_partitions = [[13, 13] + [14] * 9, [12] + [14] * 10]
profiles = []
for rows in deficit_partitions:
    possible_neighbors = [r for r in rows if r <= 13]
    if len(possible_neighbors) >= 2:
        profiles.append(sorted([17] + [15] * 8 + rows))
assert len(profiles) == 1
assert sum(profiles[0]) == 289
assert profiles[0] == [13] * 2 + [14] * 9 + [15] * 8 + [17]

# Check W's two disjoint H-attachment sizes against the degree floor/cap.
# For delta zero retain the additional independent-pair union demand.
attachment_cells = []
for delta in (0, 1):
    for k0, k1 in itertools.product(range(9), repeat=2):
        f = k0 + k1
        if not 19 <= 15 + delta + k0 <= 24:
            continue
        if not 19 <= 15 + delta + k1 <= 24 or f > 9:
            continue
        if delta == 0 and 1 + f < 10:
            continue
        a = 70 + delta + f
        reroot_a = 86 + delta
        assert a <= 80 and reroot_a > a
        assert 8 + f >= 14
        attachment_cells.append({"delta": delta, "k0": k0, "k1": k1,
                                 "a": a, "reroot_a": reroot_a,
                                 "forced_degree24_vertices": 8 + f})
assert {(c["k0"], c["k1"]) for c in attachment_cells if c["delta"] == 0} == {(4, 5), (5, 4)}

# Check the general two-core transfer identity on every boundary cut.
# q is the W-(B-D) cut, at most ten; slack is unused H degree.
# The identity is affine in slack, so its extremes suffice after checking
# each permissible nonnegative total H row degree.
pair_transfer_cells = 0
for f, c, q in itertools.product(range(35), range(17), range(11)):
    for slack in (0, 255 - f):
        h_rows = 255 - f - slack
        x = 17 + c + q + h_rows
        assert c - f - (x - 282) == 10 - q + slack
        assert c - f >= x - 282
        if f >= c:
            assert x <= 282
        pair_transfer_cells += 1

# Check the four-17 independent-anchor equality without enumerating graphs.
anchor_count_cells = []
for n1 in range(9):
    for surplus in range(33):
        total_degree = 32 - n1 + surplus
        if total_degree <= 4 * 6:
            anchor_count_cells.append((n1, surplus, total_degree))
assert anchor_count_cells == [(8, 0, 24)]

# Check every degree-19 high-row count and its union-deficit lower bound.
d19_profiles = []
floors19 = [0, 1, 9, 13, 15]
for t in range(5):
    for l in range(5 - t):
        floor = max(floors19[t], 2 if t == 1 and l else 0)
        d19_profiles.append((t, l, floor, 285 + 2 * t + l - floor))
maxima19 = [max(p[3] for p in d19_profiles if p[0] == t) for t in range(5)]
assert maxima19 == [289, 288, 282, 279, 278]
assert [p for p in d19_profiles if p[3] == 289] == [(0, 4, 0, 289)]
assert 4 * 16 + 15 * 15 == 289

proofs = ["research/n43/degree19_row_ceiling.md", "research/n43/d20/large_row_tail.md"]
dependencies = ["docs/mathematical_baseline.md", "research/n43/d20/interface_bounds.md",
                "research/n43/d20/residual_coverage.md",
                "research/n43/d18/independent_row_cuts.md"]
result = {
    "status": "passed",
    "limits": "Author arithmetic self-check; no independent review, graph search, realizability or global Ramsey exclusion.",
    "proof_sha256": {p: sha256(ROOT / p) for p in proofs},
    "dependency_sha256": {p: sha256(ROOT / p) for p in dependencies},
    "driver_sha256": sha256(Path(__file__)),
    "d20_checked_profiles": len(d20_profiles),
    "d20_maxima_by_size17_count": maxima,
    "d20_equality290_profiles": equality_290,
    "d20_single17_equality289": single_289,
    "d20_single17_full_profile": profiles[0],
    "d20_critical_core_attachment_cells": attachment_cells,
    "degree20_pair_transfer_boundary_cells": pair_transfer_cells,
    "d20_four17_anchor_cells": anchor_count_cells,
    "d19_checked_profiles": len(d19_profiles),
    "d19_maxima_by_size17_count": maxima19,
    "complement_closed_existing_census_ceiling": 23 * 22 - 2 * 117,
}
assert result["complement_closed_existing_census_ceiling"] == 272
(HERE / "validation.json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps({k: v for k, v in result.items() if not k.endswith("sha256")}, indent=2))
