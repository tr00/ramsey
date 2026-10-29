#!/usr/bin/env python3
"""Finite self-checks for regular_case.md; this does not search order 43."""

from collections import Counter
from itertools import combinations, combinations_with_replacement
import json
from math import comb


def graph(n, bits):
    adj = [set() for _ in range(n)]
    for bit, (u, v) in enumerate(combinations(range(n), 2)):
        if bits & (1 << bit):
            adj[u].add(v)
            adj[v].add(u)
    return adj


def edges(adj, vertices):
    return sum(v in adj[u] for u, v in combinations(sorted(vertices), 2))


def cut(adj, left, right):
    return sum(len(adj[u] & right) for u in left)


def homogeneous(adj, vertices, clique):
    return all((v in adj[u]) == clique for u, v in combinations(vertices, 2))


def contains(adj, vertices, size, clique):
    return any(homogeneous(adj, sub, clique)
               for sub in combinations(sorted(vertices), size))


def check_regular_identities():
    counts = Counter()
    root_checks = pair_checks = 0
    for n in range(1, 7):
        vertices = set(range(n))
        for bits in range(1 << comb(n, 2)):
            adj = graph(n, bits)
            k = len(adj[0])
            if any(len(row) != k for row in adj):
                continue
            counts[n] += 1
            a = [edges(adj, row) for row in adj]
            for v in vertices:
                neighbors = adj[v]
                nonneighbors = vertices - neighbors - {v}
                b = edges(adj, nonneighbors)
                x = cut(adj, neighbors, nonneighbors)
                assert x == k * (k - 1) - 2 * a[v]
                assert 2 * (b - a[v]) == k * (n - 2 * k)
                assert sum(len(adj[u] & adj[v]) for u in neighbors) == 2 * a[v]
                assert sum(len(adj[u] & adj[v]) for u in nonneighbors) == x
                root_checks += 1
            for u, v in combinations(range(n), 2):
                gamma = int(v in adj[u])
                shared = adj[u] & adj[v]
                q = len(shared)
                left = adj[v] - shared - {u}
                right = adj[u] - shared - {v}
                neither = vertices - {u, v} - shared - left - right
                assert len(left) == len(right) == k - gamma - q
                assert len(neither) == n - 2 - 2 * k + 2 * gamma + q
                assert a[u] + a[v] == (
                    edges(adj, left) + edges(adj, right)
                    + (k - 2 + 2 * gamma) * q - cut(adj, shared, neither)
                )
                pair_checks += 1
            triangles = sum(homogeneous(adj, sub, True)
                            for sub in combinations(range(n), 3))
            independent = sum(homogeneous(adj, sub, False)
                             for sub in combinations(range(n), 3))
            assert sum(a) == 3 * triangles
            assert 2 * (comb(n, 3) - triangles - independent) == n * k * (n - 1 - k)
    return {"regular_graphs_by_order": dict(sorted(counts.items())),
            "root_identity_checks": root_checks, "pair_identity_checks": pair_checks}


def side_and_rectangle_criterion(adj):
    """Root 0; apply the exact side types and six mixed obstruction types."""
    vertices = set(range(len(adj)))
    left = adj[0]
    right = vertices - left - {0}
    for side, clique_size, independent_size in ((left, 4, 5), (right, 5, 4)):
        if contains(adj, side, clique_size, True):
            return False
        if contains(adj, side, independent_size, False):
            return False
    for clique, splits in ((True, ((1, 4), (2, 3), (3, 2))),
                           (False, ((2, 3), (3, 2), (4, 1)))):
        for i, j in splits:
            for first in combinations(sorted(left), i):
                if not homogeneous(adj, first, clique):
                    continue
                for second in combinations(sorted(right), j):
                    if homogeneous(adj, second, clique) and all(
                        (v in adj[u]) == clique for u in first for v in second
                    ):
                        return False
    return True


def check_completion_criterion():
    checked = 0
    obstructions = Counter()
    for bits in range(1 << comb(6, 2)):
        adj = graph(6, bits)
        direct = not contains(adj, range(6), 5, True) and not contains(adj, range(6), 5, False)
        assert side_and_rectangle_criterion(adj) == direct
        # Separately verify that the stated row/column equations give regularity.
        left = adj[0]
        right = set(range(6)) - left - {0}
        k = len(left)
        row_ok = all(len(adj[u] & right) == k - 1 - len(adj[u] & left) for u in left)
        column_ok = all(len(adj[u] & left) == k - len(adj[u] & right) for u in right)
        assert (row_ok and column_ok) == all(len(row) == k for row in adj)
        # Ensure every mixed obstruction type is exercised, beyond equality alone.
        for sub in combinations(range(1, 6), 5):
            for clique in (True, False):
                i, j = len(set(sub) & left), len(set(sub) & right)
                if i and j and homogeneous(adj, sub, clique):
                    obstructions[f"{'K' if clique else 'I'}:{i}+{j}"] += 1
        checked += 1
    for key in ("K:1+4", "K:2+3", "K:3+2", "I:2+3", "I:3+2", "I:4+1"):
        assert obstructions[key] > 0
    return {"six_vertex_completion_checks": checked,
            "mixed_obstruction_examples": dict(sorted(obstructions.items()))}


def check_numerics():
    corridor = []
    for a in range(87, 101):
        b, f, x = a + 30, 201 - a, 380 - 2 * a
        assert 2 * a + x == 380 and 2 * b + x == 440
        assert b + f == comb(22, 2)
        corridor.append({"a": a, "b": b, "f": f, "x": x})
    upper44 = {15: 55, 16: 60, 17: 68}
    lower44 = {16: 60, 17: 68}
    bounds = []
    for q in (2, 3, 4):
        cap = q + upper44[19 - q] + 8 * q + q * q // 4
        assert cap == {2: 87, 3: 89, 4: 95}[q]
        bounds.append({"relation": "edge", "q": q, "a_min": 87, "a_max": cap})
    for q, delta in ((3, 3), (4, 5)):
        k, z = 20 - q, q + 1
        cap = upper44[k] + 8 * q + delta
        floor = 201 - (comb(k, 2) - lower44[k] + 9 * z + z * z // 4)
        assert (floor, cap) == {3: (93, 95), 4: (90, 97)}[q]
        bounds.append({"relation": "nonedge", "q": q, "a_min": floor, "a_max": cap})
    profiles = []
    maximum = 0
    for profile in combinations_with_replacement(range(9), 5):
        eights = profile.count(8)
        if eights > 4 or (eights == 4 and any(6 < x < 8 for x in profile)):
            continue
        maximum = max(maximum, sum(profile))
        if sum(profile) == 38:
            profiles.append(list(reversed(profile)))
    assert maximum == 38
    assert profiles == [[8, 8, 8, 8, 6], [8, 8, 8, 7, 7]]
    assert 340 - 136 - 17 - 16 - 47 == 124
    assert 39 + 136 + 1 + 32 + 2 + 2 + 94 + 124 == 430
    assert (43 * 87 + 2) // 3 == 1247 and 43 * 100 // 3 == 1433
    assert comb(43, 3) - 43 * 20 * 22 // 2 == 2881
    assert 20 * 9 + 2 * 10 == 20 * 10 == 200
    assert (20 * 10 + 2 * 11) // 2 == 111 == 201 - 90
    return {"corridor": corridor, "pair_bounds": bounds,
            "edge_two_omission_profiles": profiles}


if __name__ == "__main__":
    print(json.dumps({"status": "passed", "scope": "author finite self-check; no order-43 search",
                      **check_regular_identities(), **check_completion_criterion(),
                      **check_numerics()}, indent=2, sort_keys=True))
