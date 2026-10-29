#!/usr/bin/env python3
"""Independent tiny graph semantics for the endpoint-preserving adapter.

No order-43 completion search is run. All small row assignments and all B
graphs are checked directly against ambient K5/I5 definitions.
"""

import json
from itertools import combinations, product
from math import comb
from pathlib import Path
import sys

BASE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(BASE))

from recursive_ramsey import CompletionDP, State, canonical
from safe_contractions import contract
from verify_safe_contractions import load_examples
from split_interface import (split_parent, rectangle_kernel, recurrence_kernel,
                             initial_state, representation_counts)


def graph(vertices, edges):
    result = {u: set() for u in vertices}
    for u, v in edges:
        result[u].add(v)
        result[v].add(u)
    return result


def homogeneous(adj, group, edge):
    return all((v in adj[u]) == edge for u, v in combinations(group, 2))


def valid_ambient(adj):
    return not any(homogeneous(adj, group, edge)
                   for edge in (False, True) for group in combinations(adj, 5))


def ambient(layout, rows, b_size, b_mask):
    n = len(layout.vertices)
    result = {u: set() for u in range(1 + n + b_size)}
    local = layout.graph()
    index = {u: i + 1 for i, u in enumerate(layout.vertices)}
    for u in layout.vertices:
        a = index[u]
        result[0].add(a)
        result[a].add(0)
        result[a] |= {index[v] for v in local[u]}
        for b in range(b_size):
            if rows[u] >> b & 1:
                result[a].add(1 + n + b)
                result[1 + n + b].add(a)
    for i, (a, b) in enumerate(combinations(range(b_size), 2)):
        if b_mask >> i & 1:
            u, v = 1 + n + a, 1 + n + b
            result[u].add(v)
            result[v].add(u)
    return result


def direct_kernel(layout, rows, b_size):
    """Extract all local homogeneous sets, independently of split cells."""
    domain = (1 << b_size) - 1
    adj = layout.graph()
    pos, neg = [(5, domain)], [(4, domain)]
    for edge, upper, target in ((True, 3, pos), (False, 4, neg)):
        for size in range(1, upper + 1):
            for group in combinations(layout.vertices, size):
                if homogeneous(adj, group, edge):
                    support = domain
                    for u in group:
                        support &= rows[u] if edge else domain ^ rows[u]
                    target.append((5 - size, support))
    return canonical(State(domain, tuple(pos), tuple(neg)))


def tiny_checks():
    fixtures = [
        (graph(range(1), []), 0, set(), set(), 3),
        (graph(range(2), [(0, 1)]), 0, {1}, set(), 3),
        (graph(range(3), [(0, 1), (0, 2), (1, 2)]), 0, {1, 2}, {1}, 2),
        (graph(range(4), [(0, 1), (0, 2), (0, 3)]), 0, {1, 2, 3}, set(), 1),
    ]
    row_cases = ambient_cases = rejected = 0
    dp = CompletionDP()
    for parent, z, left, right, b_size in fixtures:
        layout = split_parent(parent, z, left, right, require_d18=False)
        for values in product(range(1 << b_size), repeat=len(layout.vertices)):
            rows = dict(zip(layout.vertices, values))
            expected_state = direct_kernel(layout, rows, b_size)
            direct = rectangle_kernel(layout, rows, b_size=b_size)
            recursive = recurrence_kernel(layout, rows, b_size=b_size)
            assert direct == recursive == expected_state
            x = sum(row.bit_count() for row in values)
            assert recurrence_kernel(layout, rows, b_size=b_size,
                                     cross_interval=(x, x)) == direct
            assert recurrence_kernel(layout, rows, b_size=b_size,
                                     cross_interval=(x + 1, x + 1)) is None
            count = 0
            for mask in range(1 << (b_size * (b_size - 1) // 2)):
                count += valid_ambient(ambient(layout, rows, b_size, mask))
                ambient_cases += 1
            assert (0 if direct is None else dp.count(direct)) == count
            if direct is None:
                rejected += 1
            row_cases += 1
    return {"tiny_row_families": row_cases, "direct_ambient_graph_checks": ambient_cases,
            "rejected_threshold_one_families": rejected, "DP_nodes": len(dp.nodes)}


def unsafe_global_example():
    layout = split_parent({0: set()}, 0, set(), set(), require_d18=False)
    u, v = layout.endpoints
    rows = {u: 0b0011, v: 0b1100}
    original = ambient(layout, rows, 4, (1 << 6) - 1)
    assert valid_ambient(original)
    kernel = rectangle_kernel(layout, rows, b_size=4)
    assert kernel == recurrence_kernel(layout, rows, b_size=4)
    assert kernel is not None
    b_graph = graph(range(4), combinations(range(4), 2))
    assert all(not any(homogeneous(b_graph, group, edge)
                       for group in combinations([i for i in range(4) if support >> i & 1], k))
               for edge, clauses in ((True, kernel.positive), (False, kernel.negative))
               for k, support in clauses)
    # Local A is K2 and contracts safely to K1. Ambient contraction is unsafe.
    local = layout.graph()
    local_child, _ = contract(local, u, v)
    assert len(local_child) == 1
    merged, _ = contract(original, 1, 2)
    assert not valid_ambient(merged)
    assert any(homogeneous(merged, group, True) for group in combinations(merged, 5))
    original_count = CompletionDP().count(kernel)
    merged_count = CompletionDP().count(State(0b1111, ((4, 0b1111),), ((4, 0b1111),)))
    assert (original_count, merged_count) == (63, 62)
    return {"local_safe_global_unsafe": True,
            "endpoint_rows": [rows[u], rows[v]], "union_row": rows[u] | rows[v],
            "original_ambient_valid": True, "contracted_ambient_has_K5": True,
            "original_B_completions": original_count,
            "naive_merged_B_completions": merged_count}


def d18_layout_check():
    entry = next(data for data in load_examples() if data["name"] == "anticomplete")
    original = graph(range(18), entry["edges"])
    u, v = entry["contract"][0]
    left, right = original[u] - {v}, original[v] - {u}
    parent, z = contract(original, u, v)
    layout = split_parent(parent, z, left, right)
    rebuilt = layout.graph()
    replacement = {layout.endpoints[0]: u, layout.endpoints[1]: v}
    rebuilt = {replacement.get(a, a): {replacement.get(b, b) for b in neighbors}
               for a, neighbors in rebuilt.items()}
    assert rebuilt == original
    counts = representation_counts(layout)
    assert (counts["singleton_rows"], counts["endpoint_rows"]) == (16, 2)
    assert (counts["local_adjacency_slots"], counts["parent_adjacency_slots"]) == (153, 136)
    assert (counts["actual_cross_slots"], counts["B_adjacency_slots"]) == (432, 276)
    state = initial_state(layout, degree_window=True)
    assert len(state.budgets) == 43
    assert state.remaining.bit_count() == 43
    # Forty-eight endpoint bits survive: partitioning a chosen union of size rho
    # has 3**rho assignments, and summing over unions gives all 4**24 row pairs.
    assert sum(comb(24, rho) * 3 ** rho for rho in range(25)) == 4 ** 24
    return counts


if __name__ == "__main__":
    result = {**tiny_checks(), **unsafe_global_example(), "d18_representation": d18_layout_check()}
    print(json.dumps(result, indent=2))
