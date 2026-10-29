#!/usr/bin/env python3
"""Exhaustive small checks and direct verification of retained pure examples."""

import json
from itertools import combinations
from pathlib import Path

from safe_contractions import certificate, compatible_pair, contract, marked_split, triangle


def homogeneous(adj, size, edge=False):
    return [set(group) for group in combinations(sorted(adj), size)
            if all((v in adj[u]) == edge for u, v in combinations(group, 2))]


def valid(adj):
    return not homogeneous(adj, 4, True) and not homogeneous(adj, 5)


def connected(adj, removed):
    alive = set(adj) - set(removed)
    if not alive:
        return True
    seen, frontier = set(), {min(alive)}
    while frontier:
        seen |= frontier
        frontier = set().union(*(adj[w] for w in frontier)) & alive - seen
    return seen == alive


def connectivity(adj):
    for size in range(min(map(len, adj.values())) + 1):
        if any(not connected(adj, removed) for removed in combinations(adj, size)):
            return size
    return len(adj) - 1


def transversal_number(adj):
    independent = homogeneous(adj, 4)
    for size in range(len(adj) + 1):
        if any(all(set(group) & member for member in independent)
               for group in combinations(adj, size)):
            return size
    raise AssertionError("finite transversal missing")


def edge_count(adj):
    return sum(map(len, adj.values())) // 2


def load_examples(source=None):
    """Read a direct example artifact or the relative-path branch manifest."""
    source = Path(source) if source is not None else Path(__file__).with_name("safe_contraction_examples.json")
    data = json.loads(source.read_text())
    if "examples" in data:
        return data["examples"]
    result = []
    for relative in data["sources"]:
        result.extend(load_examples(source.parent / relative))
    names = [entry["name"] for entry in result]
    if len(names) != len(set(names)):
        raise ValueError("duplicate example names in branch manifest")
    return result


def small_checks():
    edge_checks = pair_checks = 0
    for n in range(6):
        pairs = list(combinations(range(n), 2))
        for mask in range(1 << len(pairs)):
            adj = {u: set() for u in range(n)}
            for index, (u, v) in enumerate(pairs):
                if mask & (1 << index):
                    adj[u].add(v)
                    adj[v].add(u)
            if not valid(adj):
                continue
            edges = [(u, v) for u, v in pairs if v in adj[u]]
            for u, v in edges:
                result = certificate(adj, u, v)
                union = (adj[u] | adj[v]) - {u, v}
                assert result["safe"] == (triangle(adj, sorted(union)) is None)
                child, _ = contract(adj, u, v)
                assert result["safe"] == valid(child)
                edge_checks += 1
            for first, second in combinations(edges, 2):
                if set(first) & set(second):
                    continue
                if not certificate(adj, *first)["safe"] or not certificate(adj, *second)["safe"]:
                    continue
                child, _ = contract(adj, *first)
                child, _ = contract(child, *second)
                assert compatible_pair(adj, first, second) == valid(child)
                reverse, _ = contract(adj, *second)
                reverse, _ = contract(reverse, *first)
                assert valid(reverse) == valid(child)
                c_first = len(adj[first[0]] & adj[first[1]])
                c_second = len(adj[second[0]] & adj[second[1]])
                h = sum(all(v in adj[u] for u in first) for v in second)
                h_prime = sum(all(v in adj[u] for v in second) for u in first)
                cross_edges = sum(v in adj[u] for u in first for v in second)
                loss = 2 + c_first + c_second - h - h_prime + cross_edges - bool(cross_edges)
                assert edge_count(adj) - edge_count(child) == loss
                pair_checks += 1
    print("Small exhaustive checks passed:", edge_checks, "edges;", pair_checks, "individually safe disjoint pairs.")


def examples():
    for data in load_examples():
        adj = {u: set() for u in range(data["n"])}
        for u, v in data["edges"]:
            adj[u].add(v)
            adj[v].add(u)
        expected = data["expected"]
        assert valid(adj)
        assert edge_count(adj) == expected["edges"]
        assert 85 - edge_count(adj) == expected["q"]
        assert connectivity(adj) == expected["connectivity"]
        assert transversal_number(adj) == expected["tau4"]
        if "initial_safe_edges" in data:
            initial = [list(edge) for edge in combinations(sorted(adj), 2)
                       if edge[1] in adj[edge[0]] and certificate(adj, *edge)["safe"]]
            assert initial == data["initial_safe_edges"]
        if expected.get("irreducible"):
            assert all(not certificate(adj, u, v)["safe"]
                       for u, v in combinations(adj, 2) if v in adj[u])
            covered = set()
            for obstruction in data["edge_obstructions"]:
                u, v = obstruction["edge"]
                assert u < v and v in adj[u] and (u, v) not in covered
                covered.add((u, v))
                group = set(obstruction["triangle"])
                assert len(group) == 3 and not group & {u, v}
                assert group <= (adj[u] | adj[v])
                assert all(b in adj[a] for a, b in combinations(group, 2))
                attachments = [sorted(group & adj[x]) for x in (u, v)]
                assert attachments == obstruction["endpoint_attachments"]
                assert set(attachments[0]) | set(attachments[1]) == group
                sizes = sorted(map(len, attachments))
                pattern = ("complement_P3_disjoint_K2" if sizes == [1, 2]
                           else "K5_minus_two_disjoint_edges")
                assert sizes in ([1, 2], [2, 2])
                assert obstruction["pattern"] == pattern
                assert len(set(attachments[0]) & set(attachments[1])) == (1 if sizes == [2, 2] else 0)
            assert covered == {(u, v) for u, v in combinations(adj, 2) if v in adj[u]}
        if "family" in data:
            family = data["family"]
            if family["type"] == "adjacent_twins":
                for u, v in family["pairs"]:
                    assert v in adj[u] and adj[u] - {v} == adj[v] - {u}
                    assert len(adj[u] & adj[v]) == 4
                    assert certificate(adj, u, v)["safe"]
                assert len(family["pairs"]) == family["r"]
            elif family["type"] == "independent_degree_four":
                v = family["vertex"]
                neighbors = sorted(adj[v])
                assert len(neighbors) == 4
                assert all(y not in adj[x] for x, y in combinations(neighbors, 2))
                defects = [[x, y] for x, y in combinations(neighbors, 2)
                           if any(b in adj[a] for a, b in combinations((adj[x] & adj[y]) - {v}, 2))]
                assert defects == family["defect_edges"] and len(defects) <= 1
                assert sum(certificate(adj, v, x)["safe"] for x in neighbors) >= 2
        edges = data["contract"]
        if len(edges) == 2:
            assert compatible_pair(adj, *edges)
            reverse = adj
            for u, v in reversed(edges):
                assert certificate(reverse, u, v)["safe"]
                reverse, _ = contract(reverse, u, v)
                assert valid(reverse)
            assert edge_count(reverse) == expected["quotient_edges"]
        elif len(edges) == 1:
            assert certificate(adj, *edges[0])["kind"] == expected.get("certificate_kind", data["name"])
        current = adj
        bags = {u: [u] for u in adj}
        for index, (u, v) in enumerate(edges):
            assert certificate(current, u, v)["safe"]
            left, right = current[u] - {v}, current[v] - {u}
            before = current
            current, z = contract(current, u, v)
            bags[z] = sorted(bags.pop(u) + bags.pop(v))
            assert valid(current)
            if "history" in data:
                step = data["history"][index]
                assert z == step["merged"]
                assert len(current) == step["n"]
                assert edge_count(current) == step["edges"]
            restored, (a, b) = marked_split(current, z, left, right)
            relabel = {a: u, b: v}
            restored = {relabel.get(w, w): {relabel.get(x, x) for x in neighbors}
                        for w, neighbors in restored.items()}
            assert restored == before
        assert len(current) == expected["quotient_n"]
        assert edge_count(current) == expected["quotient_edges"]
        if "quotient" in data:
            quotient = data["quotient"]
            labels = sorted(current)
            indices = {u: i for i, u in enumerate(labels)}
            if "vertices" in quotient:
                assert quotient["vertices"] == labels
                assert quotient["edges"] == [[u, v] for u in labels for v in sorted(current[u]) if u < v]
            else:
                assert quotient["n"] == len(current)
                assert quotient["history_labels"] == labels
                assert quotient["bags"] == [bags[u] for u in labels]
                assert quotient["edges"] == [[indices[u], indices[v]] for u in labels
                                             for v in sorted(current[u]) if u < v]
        if "vertex_bags" in data:
            assert data["vertex_bags"] == [{"vertex": u, "original_vertices": bags[u]} for u in sorted(current)]
        if data["name"] in ("anticomplete", "shielded_matching", "shielded_star_forest"):
            squares = {1, 2, 4, 8, 9, 13, 15, 16}
            labels = {w: (0 if w >= 18 else w) for w in current}
            parent = {labels[w]: {labels[x] for x in neighbors} for w, neighbors in current.items()}
            expected_parent = {u: {v for v in range(17) if (v - u) % 17 in squares}
                               for u in range(17)}
            expected_parent[1].remove(2)
            expected_parent[2].remove(1)
            assert parent == expected_parent
        print(data["name"], expected, "quotient alpha=", max(k for k in range(1, 6) if homogeneous(current, k)))


if __name__ == "__main__":
    small_checks()
    examples()
