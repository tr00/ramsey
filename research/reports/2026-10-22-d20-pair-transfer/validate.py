#!/usr/bin/env python3
"""Author arithmetic checks for d20 pair transfer; no graph search."""

import hashlib
import itertools
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
L = {11: 19, 12: 26, 13: 33, 14: 41, 15: 50, 16: 60, 17: 68}


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def add(*terms):
    """Add scaled affine coefficient maps; key '1' is the constant."""
    out = {}
    for scale, coefficients in terms:
        for key, value in coefficients.items():
            out[key] = out.get(key, 0) + scale * value
    return {key: value for key, value in out.items() if value}


# Equality of coefficient maps checks all substitutions, not just examples.
identity_cases = 0
for gamma, M in itertools.product((0, 1), range(20, 25)):
    for q in range(3 - gamma, 13 + gamma):
        k, z = 20 - gamma - q, q + 1 + 2 * gamma
        assert 0 <= k <= 17 and k + q + gamma == 20
        assert 2 + q + 2 * k + z == 43
        delta = {"mD": 1, "mH": -1, "c": 1, "f": -1}
        xv = {"1": gamma * k + (1 - gamma) * q,
              "c": 1, "j": 1, "p": 1, "r": 1}
        xu = {"1": gamma * k + (1 - gamma) * q,
              "f": 1, "j": 1, "p": 1, "s": 1}
        sum_h = {"1": k, "mH": 2, "f": 1, "p": 1, "r": 1}
        sum_d = {"1": k, "mD": 2, "c": 1, "p": 1, "s": 1}
        cj = {"1": (M - 1 + gamma) * k + (1 - gamma) * q,
              "J": 1, "mH": -1, "mD": -1}
        slack_h = add((1, {"1": M * k}), (-1, sum_h))
        slack_d = add((1, {"1": M * k}), (-1, sum_d))
        cut_slack = {"J": 1, "j": -1}
        assert add((1, delta), (-1, xv), (1, cj)) == add(
            (1, slack_h), (1, cut_slack))
        assert add((-1, delta), (-1, xu), (1, cj)) == add(
            (1, slack_d), (1, cut_slack))
        assert add((1, xv), (1, xu)) == add(
            (2, cj), (-1, slack_h), (-1, slack_d), (-2, cut_slack))
        identity_cases += 1


def edge_cap(M, q):
    return M * (19 - q) + q * (q + 3) - 2 * L[19 - q]


def nonedge_cap(M, q):
    return (M - 1) * (20 - q) + q + q * min(q + 1, 8) - 2 * L[20 - q]


def packing_cap(M, q, triangles, edges):
    assert 3 * triangles + 2 * edges <= q
    z, b0 = q + 1, min(q + 1, 8)
    rho2 = max(0, 2 * b0 - z - 5)
    rho3 = max(0, 3 * b0 - 2 * z - 2)
    return nonedge_cap(M, q) - triangles * rho3 - edges * rho2


adjacent = {str(M): [edge_cap(M, q) for q in range(2, 9)] for M in (24, 23)}
nonadjacent = {str(M): [nonedge_cap(M, q) for q in range(3, 10)] for M in (24, 23)}
triangle = {str(M): [packing_cap(M, q, 1, 0) for q in range(3, 10)] for M in (24, 23)}
assert adjacent == {"24": [282, 282, 288, 294, 300, 306, 314],
                    "23": [265, 266, 273, 280, 287, 294, 303]}
assert nonadjacent == {"24": [270, 272, 280, 288, 296, 296, 296],
                       "23": [253, 256, 265, 274, 283, 284, 285]}
assert triangle == {"24": [268, 269, 276, 283, 290, 292, 294],
                     "23": [251, 253, 261, 269, 277, 280, 283]}
packing_examples = []
for q, t, e in ((5, 1, 1), (6, 1, 1), (6, 2, 0)):
    row = {"q": q, "triangles": t, "edges": e,
           "M24": packing_cap(24, q, t, e), "M23": packing_cap(23, q, t, e)}
    packing_examples.append(row)
assert [(r["M24"], r["M23"]) for r in packing_examples] == [(275, 260), (281, 267), (278, 264)]

# Marginal incidence counts validate cut arithmetic; no adjacency matrices.
edge_marginals = triangle_marginals = packing_cells = 0
for q in range(3, 13):
    z, b0 = q + 1, min(q + 1, 8)
    for n2 in range(min(z, 5) + 1):
        for n1 in range(z - n2 + 1):
            cut = n1 + 2 * n2
            if cut > 2 * b0:
                continue
            assert cut <= min(2 * b0, z + 5)
            edge_marginals += 1
    for n3 in range(min(z, 2) + 1):
        for n2 in range(z - n3 + 1):
            for n1 in range(z - n3 - n2 + 1):
                cut = n1 + 2 * n2 + 3 * n3
                if cut > 3 * b0:
                    continue
                assert cut <= min(3 * b0, 2 * z + 2)
                triangle_marginals += 1
    for t in range(q // 3 + 1):
        for e in range((q - 3 * t) // 2 + 1):
            block_cut = (t * min(3 * b0, 2 * z + 2)
                         + e * min(2 * b0, z + 5)
                         + (q - 3 * t - 2 * e) * b0)
            formula = (q * b0 - t * max(0, 3 * b0 - 2 * z - 2)
                       - e * max(0, 2 * b0 - z - 5))
            assert block_cut == formula
            packing_cells += 1

# Verify the sufficient overlap thresholds, including the last excluded q.
for threshold, adj_q, non_q in ((283, 3, 5), (289, 4, 6)):
    assert all(edge_cap(24, q) < threshold for q in range(2, adj_q + 1))
    assert all(nonedge_cap(24, q) < threshold for q in range(3, non_q + 1))
assert all(packing_cap(24, q, 1, 0) < 284 for q in range(3, 7))
assert all(edge_cap(23, q) < 270 for q in (2, 3))
assert all(nonedge_cap(23, q) < 270 for q in (3, 4, 5))
assert all(packing_cap(23, q, 1, 0) < 270 for q in range(3, 7))
assert 23 * 22 - 2 * 117 == 272
assert [q for q in range(2, 14) if 19 - q == 14] == [5]
assert 16 + 8 * 15 + 11 * 14 == 290
assert 2 * 16 + 6 * 15 + 12 * 14 == 290

# Independently recover the exact omission band from its aggregate budgets.
omission_bands = []
for n0, n1, n2, n3 in itertools.product(range(23), repeat=4):
    if n0 + n1 + n2 + n3 != 22 or n1 + 2 * n2 + 3 * n3 != 62:
        continue
    if 11 * max(0, n3 - 14) > 50:
        continue
    omission_bands.append([n0, n1, n2, n3])
assert omission_bands == [[0, 0, 4, 18]]

stability_cells = []
for eh in range(7, 29):
    for epq in range(3, 45):
        for eph in range(89):
            if eph < 44 + epq or 2 * eh + eph > 64:
                continue
            slack = 64 - 2 * eh - eph
            assert 7 <= eh <= 8 and 3 <= epq <= 6 and 47 <= eph <= 50
            assert 0 <= slack <= 3
            if eh == 8:
                assert slack <= 1 and epq <= 4
            stability_cells.append([eh, epq, eph, slack])
assert len(stability_cells) == 13
assert min(8 - c[3] for c in stability_cells) == 5
assert min(8 - c[3] for c in stability_cells if c[0] == 8) == 7
assert 28 - (8 * 8 // 3) == 7
assert 5 + 2 + 3 == 10
# The written shape proof excludes e(H)=7: at least four P vertices miss
# ell, all must see the edge component, so they are independent and give I5.
assert 11 - (24 - 1 - 16) == 4
surviving_stability_cells = [c for c in stability_cells if c[0] == 8]
assert surviving_stability_cells == [[8, 3, 47, 1], [8, 3, 48, 0], [8, 4, 48, 0]]
assert min(8 - c[3] for c in surviving_stability_cells) == 7

proofs = ["research/n43/d20/pair_density_transfer.md",
          "research/n43/d20/cross_tail_stability.md"]
dependencies = ["docs/mathematical_baseline.md", "README.md",
                "research/n43/reductions.md", "research/n43/d20/large_row_tail.md",
                "research/n43/d20/interface_bounds.md", "research/n43/d20/residual_coverage.md"]
result = {
    "status": "passed",
    "date": "2026-10-22",
    "task": "d20-pair-transfer-20261022",
    "base_revision": "d6d6ee085b701171362b6de8ea16f32383f09d9c",
    "limits": "Author arithmetic self-check; no independent review, graph search, graph realizability, branch closure or global Ramsey result.",
    "proof_sha256": {p: sha256(ROOT / p) for p in proofs},
    "dependency_sha256": {p: sha256(ROOT / p) for p in dependencies},
    "driver_sha256": sha256(Path(__file__)),
    "affine_pair_identity_cases": identity_cases,
    "adjacent_q2_through_q8": adjacent,
    "nonadjacent_q3_through_q9": nonadjacent,
    "one_triangle_q3_through_q9": triangle,
    "disjoint_packing_examples": packing_examples,
    "edge_marginal_cells": edge_marginals,
    "triangle_marginal_cells": triangle_marginals,
    "disjoint_packing_cells": packing_cells,
    "one_size16_omission_bands_n0_n1_n2_n3": omission_bands,
    "one_size16_stability_cells_eH_ePQ_ePH_slackH": stability_cells,
    "one_size16_surviving_cells_after_eH7_shape_exclusion": surviving_stability_cells,
    "one_size16_forced_degree24_in_high_rows": 7,
    "complement_closed_existing_ceiling": 272,
    "new_claim_review_states": "ready; no independent reviews",
}
(HERE / "validation.json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps({k: v for k, v in result.items() if not k.endswith("sha256")}, indent=2))
