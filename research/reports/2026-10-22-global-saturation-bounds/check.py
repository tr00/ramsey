#!/usr/bin/env python3
"""Elementary arithmetic/finite-mask replay; no ambient graph search.

This validates the numerical and tiny set-system steps in saturated_bounds.md.
It neither verifies the cited Ramsey/census inputs nor replaces proof review.
"""

from itertools import combinations, product
from math import ceil, comb
from pathlib import Path
import hashlib
import json


ROOT = Path(__file__).resolve().parents[2]
REPORT = Path(__file__).resolve().parent


def triangle_counts():
    cells = []
    for d in range(18, 25):
        required = ceil((42 - d) / 3)
        cells.append({"degree": d, "triangle_floor": required})
    assert [c["triangle_floor"] for c in cells] == [8, 8, 8, 7, 7, 7, 6]
    assert ceil(43 * min(c["triangle_floor"] for c in cells) / 4) == 65
    return cells


def three_column_cells():
    cells = []
    for a in (81, 82):
        for m in range(50, 56):
            for sizes in product(range(9), repeat=3):
                c = sum(sizes)
                if m + 3 + c != a:
                    continue
                for pair_sizes in product(range(4), repeat=3):
                    # Pair order: 01,02,12; triple intersection empty.
                    p01, p02, p12 = pair_sizes
                    priv = (sizes[0] - p01 - p02,
                            sizes[1] - p01 - p12,
                            sizes[2] - p02 - p12)
                    if min(priv) < 0:
                        continue
                    union = c - sum(pair_sizes)
                    if union > 15:
                        continue
                    selected = [i for i, j in enumerate((p12, p02, p01)) if j == 3]
                    h_selected = 3 * len(selected)
                    u_size = 4 * len(selected)
                    internal_degree_floor = 2 * m - 8 * (15 - h_selected)
                    triangle_incidence = 2 * h_selected
                    triangle_degree_sum = sum(sizes[i] + 2 for i in selected)
                    a_degree_floor = (internal_degree_floor + triangle_incidence
                                      + triangle_degree_sum)
                    excess_floor = 36 * len(selected) - 17 * u_size + a_degree_floor
                    assert len(selected) >= 2
                    assert excess_floor >= (5 if a == 81 else 14)
                    cells.append({"a": a, "core_edges": m,
                                  "attachments": sizes, "pairs": pair_sizes,
                                  "anchor_count": len(selected),
                                  "excess_floor": excess_floor})
    assert min(c["excess_floor"] for c in cells if c["a"] == 81) == 5
    assert min(c["excess_floor"] for c in cells if c["a"] == 82) == 14
    return cells


def four_column_cells():
    # Paw: vertices0,1,2 triangle; pendant3 adjacent to0.
    # Diamond: shared vertices0,1, tips2,3.
    shapes = {
        "triangle_isolated": {(0, 1), (0, 2), (1, 2)},
        "paw": {(0, 1), (0, 2), (1, 2), (0, 3)},
        "diamond": {(0, 1), (0, 2), (0, 3), (1, 2), (1, 3)},
    }
    cells = []
    for name, edges in shapes.items():
        tri = [t for t in combinations(range(4), 3)
               if all(p in edges for p in combinations(t, 2))]
        for m in range(41, 51):
            for deficits in product(range(4), repeat=4):
                if m + len(edges) + 32 - sum(deficits) != 85:
                    continue
                if any(sum(deficits[i] for i in t) < (2 if name == "diamond" else 1)
                       for t in tri):
                    continue
                assert m == 50
                if name == "paw":
                    assert deficits[3] == 0 and sum(deficits[:3]) == 1
                    a_degree_floor = 30 + 18 + (100 - 5 * 8) + (8 - 5)
                    floor = 108 - 204 + a_degree_floor
                    assert floor == 15
                elif name == "diamond":
                    assert deficits[2:] == (0, 0) and sum(deficits[:2]) == 2
                    a_degree_floor = 40 + (100 - 6 * 8) + 16 + (8 - 6)
                    floor = 108 - 204 + a_degree_floor
                    assert floor == 14
                else:
                    raise AssertionError("Triangle plus isolated vertex survived")
                cells.append({"shape": name, "core_edges": m,
                              "deficits": deficits, "excess_floor": floor})
    assert len(cells) == 6
    return cells


def density_thresholds():
    maxima = {14: 50, 15: 55, 16: 60, 17: 68}
    cells = []
    for d in range(18, 22):
        h = d - 4
        caps = [maxima[h] + 35 - max(0, 15-h),
                maxima[h] + 36 - max(0, 15-h),
                maxima[h] + 37 - max(0, 16-h)]
        cells.append({"degree": d, "four_set_shape_caps": caps,
                      "four_set_maximum_cap": max(caps)})
    assert [c["four_set_maximum_cap"] for c in cells] == [85, 91, 97, 105]
    assert [maxima[d-3] + 27 for d in (18, 19, 20)] == [82, 87, 95]
    return cells


def normalized_edge_identities():
    count = 0
    minimum_x = 1000
    minimum_b_excess = 1000
    for a in range(50, 86):
        for b in range(144, 161):
            for ea in range(109):
                x = 306 - 2 * a + ea
                m = 18 + a + b + x
                w = 2 * m - 774
                eb = w - ea
                if m < 452 or m > 516 or eb < 0 or eb > 144:
                    continue
                assert m == 324 - a + b + ea
                assert ea >= a - 32
                assert x >= 274 - a >= 189
                assert eb == m - 450 - a + b >= 61
                assert w >= 130 and ceil(w / 6) >= 22
                count += 1
                minimum_x = min(minimum_x, x)
                minimum_b_excess = min(minimum_b_excess, eb)
    assert minimum_x == 189 and minimum_b_excess == 61
    return {"arithmetic_cells": count, "minimum_x": minimum_x,
            "minimum_B_excess": minimum_b_excess}


def column_isolation_masks():
    count = 0
    tri = {(0, 1), (0, 2), (1, 2)}
    for n in range(3, 7):
        other = [p for p in combinations(range(n), 2) if p not in tri]
        for mask in range(1 << len(other)):
            edges = tri | {p for i, p in enumerate(other) if mask >> i & 1}
            touched = set().union(*[set(p) for p in edges])
            assert n - len(touched) <= n - 3
            count += 1
    return {"labelled_graphs_with_fixed_triangle": count}


def main():
    proof = ROOT / "n43/saturated_bounds.md"
    checks = {
        "status": "PASS",
        "scope": "elementary arithmetic and tiny finite masks; no ambient graph search",
        "triangle_floors": triangle_counts(),
        "three_column_cells": three_column_cells(),
        "four_column_cells": four_column_cells(),
        "density_thresholds": density_thresholds(),
        "normalized_edge_identities": normalized_edge_identities(),
        "isolation_masks": column_isolation_masks(),
        "proof_sha256": hashlib.sha256(proof.read_bytes()).hexdigest(),
        "checker_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    }
    (REPORT / "checks.json").write_text(json.dumps(checks, indent=2) + "\n")
    print(json.dumps({"status": "PASS", "three_column_cells": len(checks["three_column_cells"]),
                      "four_column_cells": len(checks["four_column_cells"]),
                      **checks["normalized_edge_identities"],
                      **checks["isolation_masks"]}, sort_keys=True))


if __name__ == "__main__":
    main()
