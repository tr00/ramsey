#!/usr/bin/env python3
"""Directly verify the new six- and seven-step pure local reductions.

The safety, quotient, Ramsey, connectivity, and transversal checks below are
written separately from the discovery search. Complete reachable-order claims
are also replayed through the exhaustive history driver.
"""

import json
import sys
from itertools import combinations
from pathlib import Path

BASE = Path(__file__).resolve().parent
sys.path.insert(0, str(BASE))

from exhaust_safe_histories import exhaust
from safe_contractions import certificate, contract, marked_split
from verify_safe_contractions import load_examples


def homogeneous(adj, vertices, complete):
    return all((v in adj[u]) == complete for u, v in combinations(vertices, 2))


def ramsey(adj):
    assert not any(homogeneous(adj, s, True) for s in combinations(adj, 4))
    assert not any(homogeneous(adj, s, False) for s in combinations(adj, 5))


def edges(adj):
    return [[u, v] for u in sorted(adj) for v in sorted(adj[u]) if u < v]


def direct_quotient(adj, u, v, merged):
    labels = {u: merged, v: merged}
    result = {labels.get(w, w): set() for w in adj}
    for a, b in edges(adj):
        x, y = labels.get(a, a), labels.get(b, b)
        if x != y:
            result[x].add(y)
            result[y].add(x)
    return result


def disconnected(adj, removed):
    alive = set(adj) - set(removed)
    if not alive:
        return False
    reached = {min(alive)}
    while True:
        expanded = reached | (set().union(*(adj[w] for w in reached)) & alive)
        if expanded == reached:
            return reached != alive
        reached = expanded


def connectivity(adj):
    for size in range(len(adj)):
        if any(disconnected(adj, s) for s in combinations(adj, size)):
            return size
    return len(adj) - 1


def tau4(adj):
    independent = [set(s) for s in combinations(adj, 4)
                   if homogeneous(adj, s, False)]
    for size in range(len(adj) + 1):
        if any(all(set(s) & member for member in independent)
               for s in combinations(adj, size)):
            return size
    raise AssertionError("Finite graph lacks a transversal")


def verify(order):
    entry = next(item for item in load_examples()
                 if item["name"] == f"sequential_{18-order}_to{order}")
    adj = {u: set() for u in range(entry["n"])}
    for u, v in entry["edges"]:
        adj[u].add(v)
        adj[v].add(u)
    ramsey(adj)
    expected = entry["expected"]
    assert len(edges(adj)) == expected["edges"]
    assert 85 - len(edges(adj)) == expected["q"]
    assert 4 <= expected["q"] <= 15
    assert connectivity(adj) == expected["connectivity"] >= 4
    assert tau4(adj) == expected["tau4"] >= 3
    assert [[u, v] for u, v in edges(adj) if certificate(adj, u, v)["safe"]] == entry["initial_safe_edges"]
    original = adj
    for index, (u, v) in enumerate(entry["contract"]):
        assert v in adj[u]
        union = (adj[u] | adj[v]) - {u, v}
        assert not any(homogeneous(adj, s, True) for s in combinations(union, 3))
        cert = certificate(adj, u, v)
        assert cert["safe"]
        before = adj
        left, right = adj[u] - {v}, adj[v] - {u}
        adj, merged = contract(adj, u, v)
        assert adj == direct_quotient(before, u, v, merged)
        assert len(edges(before)) - len(edges(adj)) == 1 + len(before[u] & before[v])
        ramsey(adj)
        step = entry["history"][index]
        assert step["merged"] == merged
        assert step["n"] == len(adj)
        assert step["edges"] == len(edges(adj))
        assert step["certificate_kind"] == cert["kind"]
        restored, (a, b) = marked_split(adj, merged, left, right)
        mapping = {a: u, b: v}
        restored = {mapping.get(w, w): {mapping.get(x, x) for x in nbrs}
                    for w, nbrs in restored.items()}
        assert restored == before
    assert len(adj) == expected["quotient_n"] == order
    assert len(edges(adj)) == expected["quotient_edges"]
    assert entry["quotient"] == {"vertices": sorted(adj), "edges": edges(adj)}
    if order in (11, 12):
        results = json.loads((BASE / "safe_history_exhaustion.json").read_text())["results"]
        claimed = next(item for item in results if item["name"] == entry["name"])
        actual = exhaust(original)
        assert all(claimed[key] == value for key, value in actual.items())
        assert actual["minimum_reachable_order"] == order
    print(entry["name"], expected, "direct checks, inverse reconstruction, and history exhaustion passed")


if __name__ == "__main__":
    for final_order in (12, 11):
        verify(final_order)
