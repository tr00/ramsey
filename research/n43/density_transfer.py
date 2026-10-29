#!/usr/bin/env python3
"""Exact density-transfer certificates for a supplied rooted Ramsey graph.

Standard library only. This analyzes a witness; it does not search for graphs.
Input JSON: {"n": 43, "root": 0, "edges": [[0, 1], ...]}.
Use --self-check for bounded checks against direct homogeneous-set detection.
"""

import argparse
import itertools
import json
from pathlib import Path


def graph(n, edges):
    if type(n) is not int or n < 1:
        raise ValueError("n must be a positive integer")
    adjacency = [set() for _ in range(n)]
    seen = set()
    for edge in edges:
        if len(edge) != 2:
            raise ValueError("each edge must have two endpoints")
        u, w = edge
        if any(type(z) is not int or not 0 <= z < n for z in edge) or u == w:
            raise ValueError("invalid edge endpoints")
        pair = tuple(sorted((u, w)))
        if pair in seen:
            raise ValueError("duplicate edge")
        seen.add(pair)
        adjacency[u].add(w)
        adjacency[w].add(u)
    return adjacency


def homogeneous(adjacency, vertices, adjacent):
    return all((w in adjacency[u]) == adjacent
               for u, w in itertools.combinations(vertices, 2))


def obstruction(adjacency, clique_size=5, independent_size=5):
    for size, adjacent, kind in ((clique_size, True, "clique"),
                                 (independent_size, False, "independent")):
        for vertices in itertools.combinations(range(len(adjacency)), size):
            if homogeneous(adjacency, vertices, adjacent):
                return {"kind": kind, "vertices": list(vertices)}
    return None


def witness_support(adjacency, vertices, size, adjacent, pairs):
    """Intersection of eligible pair supports; None means no witnesses.

    Keep scanning after the intersection empties to give the exact count.
    Each witness is an actual homogeneous set, not a cardinality estimate.
    """
    support = None
    count = 0
    first = None
    for witness in itertools.combinations(sorted(vertices), size):
        if not homogeneous(adjacency, witness, adjacent):
            continue
        count += 1
        if first is None:
            first = list(witness)
        current = set(itertools.combinations(witness, 2)) & pairs
        support = current if support is None else support & current
    return {"count": count, "first": first,
            "support": None if support is None else sorted(support)}


def vertex_witness_kernel(adjacency, vertices, size, adjacent):
    """Vertices common to every homogeneous witness; None if none exist."""
    kernel = None
    for witness in itertools.combinations(sorted(vertices), size):
        if homogeneous(adjacency, witness, adjacent):
            kernel = set(witness) if kernel is None else kernel & set(witness)
    return kernel


def root_star_swaps(adjacency, root, clique_size=5, independent_size=5):
    """Exact pivot-neighbor replacements, including safe sequential orders."""
    a = adjacency[root]
    b = set(range(len(adjacency))) - a - {root}
    add_kernels = {y: vertex_witness_kernel(adjacency, adjacency[y] & a,
                                           clique_size - 2, True) for y in sorted(b)}
    delete_kernels = {u: vertex_witness_kernel(adjacency, b - adjacency[u],
                                              independent_size - 2, False) for u in sorted(a)}
    swaps = []
    for u in sorted(a):
        for y in sorted(b):
            add_kernel, delete_kernel = add_kernels[y], delete_kernels[u]
            if add_kernel is not None and u not in add_kernel:
                continue
            if delete_kernel is not None and y not in delete_kernel:
                continue
            add_safe, delete_safe = add_kernel is None, delete_kernel is None
            assert add_safe or delete_safe
            delta_a = len(adjacency[y] & a) - len(adjacency[u] & a) - int(y in adjacency[u])
            delta_b = len(adjacency[u] & b) - len(adjacency[y] & b) - int(y in adjacency[u])
            assert delta_b == delta_a - 1 + len(adjacency[u]) - len(adjacency[y])
            swaps.append({"remove_neighbor": u, "add_neighbor": y,
                          "delta_a": delta_a, "delta_b": delta_b,
                          "strict_two_sided": delta_a > 0 and delta_b < 0,
                          "safe_order": "either" if add_safe and delete_safe
                          else "add_first" if add_safe else "delete_first"})
    return swaps


def analyze(adjacency, root, clique_size=5, independent_size=5):
    n = len(adjacency)
    if type(root) is not int or not 0 <= root < n:
        raise ValueError("root must be a vertex")
    if clique_size < 3 or independent_size < 3:
        raise ValueError("Ramsey parameters must be at least 3")
    invalid = obstruction(adjacency, clique_size, independent_size)
    if invalid:
        raise ValueError("input is not Ramsey-free: " + json.dumps(invalid))
    universe = set(range(n))
    a_side = set(adjacency[root])
    b_side = universe - a_side - {root}
    holes = {pair for pair in itertools.combinations(sorted(a_side), 2)
             if pair[1] not in adjacency[pair[0]]}
    removable = {pair for pair in itertools.combinations(sorted(b_side), 2)
                 if pair[1] in adjacency[pair[0]]}
    additions, deletions = [], []
    for u, w in sorted(holes):
        record = witness_support(adjacency, adjacency[u] & adjacency[w],
                                 clique_size - 2, True, removable)
        additions.append({"edge": [u, w], **record})
    for y, z in sorted(removable):
        common_misses = universe - adjacency[y] - adjacency[z] - {y, z}
        record = witness_support(adjacency, common_misses,
                                 independent_size - 2, False, holes)
        deletions.append({"edge": [y, z], **record})
    exchanges = []
    for addition in additions:
        p = tuple(addition["edge"])
        for deletion in deletions:
            f = tuple(deletion["edge"])
            if addition["support"] is not None and f not in addition["support"]:
                continue
            if deletion["support"] is not None and p not in deletion["support"]:
                continue
            add_safe = addition["count"] == 0
            delete_safe = deletion["count"] == 0
            if not (add_safe or delete_safe):
                raise AssertionError("contradictory cross requirements")
            exchanges.append({"add": list(p), "delete": list(f),
                              "safe_order": "either" if add_safe and delete_safe
                              else "add_first" if add_safe else "delete_first"})
    degrees = [len(neighbors) for neighbors in adjacency]

    def counts(vertex):
        a = adjacency[vertex]
        b = universe - a - {vertex}
        return (sum(w in adjacency[u] for u, w in itertools.combinations(sorted(a), 2)),
                sum(w in adjacency[u] for u, w in itertools.combinations(sorted(b), 2)),
                sum(degrees[z] for z in a))

    a0, b0, degree_sum0 = counts(root)
    reroots = []
    for vertex in range(n):
        if vertex == root or degrees[vertex] != degrees[root]:
            continue
        a1, b1, degree_sum1 = counts(vertex)
        delta, transport = a1 - a0, degree_sum1 - degree_sum0
        if b1 - b0 != delta - transport:
            raise AssertionError("root accounting mismatch")
        reroots.append({"root": vertex, "a": a1, "b": b1,
                        "delta_a": delta, "transport": transport,
                        "delta_b": b1 - b0,
                        "strict_two_sided": a1 > a0 and b1 < b0})
    return {"n": n, "root": root, "clique_size": clique_size,
            "independent_size": independent_size, "A": sorted(a_side),
            "B": sorted(b_side), "a": a0, "b": b0,
            "x": sum(len(adjacency[u] & b_side) for u in a_side),
            "addition_blockers": additions, "deletion_blockers": deletions,
            "exchanges": exchanges, "same_degree_roots": reroots,
            "root_star_swaps": root_star_swaps(adjacency, root, clique_size, independent_size)}


def edited(adjacency, additions, deletions):
    result = [set(neighbors) for neighbors in adjacency]
    for u, w in deletions:
        result[u].remove(w)
        result[w].remove(u)
    for u, w in additions:
        result[u].add(w)
        result[w].add(u)
    return result


def local_repair(adjacency, root, hole):
    """Exact deletion constraints for one A hole, restricted to its B core.

    There is no search: unit propagation may produce a complete certificate,
    a conflict, or unresolved clauses. The constraints use retained-edge bits.
    """
    n = len(adjacency)
    p = tuple(sorted(hole))
    if len(p) != 2 or p[0] == p[1] or any(z not in adjacency[root] for z in p):
        raise ValueError("repair hole must have two distinct A endpoints")
    u, w = p
    if w in adjacency[u]:
        raise ValueError("repair hole must be a missing edge")
    if n == 43 and any(len(adjacency[z]) >= 24 for z in p):
        return {"status": "blocked", "kind": "addition_degree_capacity", "witness": list(p)}
    a_common = adjacency[u] & adjacency[w] & adjacency[root]
    for edge in itertools.combinations(sorted(a_common), 2):
        if edge[1] in adjacency[edge[0]]:
            return {"status": "blocked", "kind": "intrinsic_K4", "witness": list(edge)}
    b = set(range(n)) - adjacency[root] - {root}
    core = adjacency[u] & adjacency[w] & b
    if len(core) >= 9:
        return {"status": "blocked", "kind": "common_B_order", "witness": sorted(core)}
    for vertex in sorted(a_common):
        cell = core & adjacency[vertex]
        if len(cell) >= 4:
            return {"status": "blocked", "kind": "triangle_common_B_order",
                    "vertex": vertex, "witness": sorted(cell)}
    for y, z in itertools.combinations(sorted(core), 2):
        shared = a_common & adjacency[y] & adjacency[z]
        missed = a_common - adjacency[y] - adjacency[z]
        if shared and len(missed) >= 3:
            return {"status": "blocked", "kind": "conflicting_common_A_signatures",
                    "B_pair": [y, z], "common_A_vertex": min(shared),
                    "independent_A_triple": sorted(missed)[:3]}
    edges = sorted(pair for pair in itertools.combinations(sorted(core), 2)
                   if pair[1] in adjacency[pair[0]])
    indices = {pair: i for i, pair in enumerate(edges)}
    keep_clauses, delete_clauses = set(), {tuple(range(len(edges)))}
    for subset in itertools.combinations(sorted(core), 3):
        if homogeneous(adjacency, subset, True):
            delete_clauses.add(tuple(sorted(indices[e] for e in itertools.combinations(subset, 2))))
    for vertex in sorted(a_common):
        cell = core & adjacency[vertex]
        for edge in itertools.combinations(sorted(cell), 2):
            if edge in indices:
                delete_clauses.add((indices[edge],))
    for subset in itertools.combinations(range(n), 5):
        if u in subset and w in subset:
            continue
        original = [e for e in itertools.combinations(subset, 2) if e[1] in adjacency[e[0]]]
        if not original:
            raise ValueError("local repair requires an I5-free input")
        if all(e in indices for e in original):
            keep_clauses.add(tuple(sorted(indices[e] for e in original)))
    keep_clauses, delete_clauses = sorted(keep_clauses), sorted(delete_clauses)
    values = {}
    conflict = None
    changed = True
    while changed and conflict is None:
        changed = False
        for target, clauses, kind in ((True, keep_clauses, "keep_clause"),
                                       (False, delete_clauses, "delete_clause")):
            for clause in clauses:
                if any(values.get(i) == target for i in clause):
                    continue
                unknown = [i for i in clause if i not in values]
                if not unknown:
                    conflict = {"kind": kind, "clause": list(clause)}
                    break
                if len(unknown) == 1:
                    values[unknown[0]] = target
                    changed = True
            if conflict:
                break
        if n == 43 and conflict is None:
            for vertex in sorted(core):
                incident = [i for i, edge in enumerate(edges) if vertex in edge]
                deleted = sum(values.get(i) is False for i in incident)
                cap = len(adjacency[vertex]) - 18
                if deleted > cap:
                    conflict = {"kind": "degree_capacity", "vertex": vertex, "capacity": cap}
                    break
                if deleted == cap:
                    for i in incident:
                        if i not in values:
                            values[i] = True
                            changed = True
    candidate = None
    if conflict is None:
        completion = {i: values.get(i, True) for i in range(len(edges))}
        if (all(any(completion[i] for i in clause) for clause in keep_clauses)
                and all(any(not completion[i] for i in clause) for clause in delete_clauses)):
            candidate = [list(edges[i]) for i in range(len(edges)) if not completion[i]]
            invalid = obstruction(edited(adjacency, [p], candidate))
            if invalid:
                raise AssertionError("local repair clauses omitted " + json.dumps(invalid))
    return {"status": "blocked" if conflict else "certificate" if candidate else "unresolved",
            "hole": list(p), "core": sorted(core), "retained_edge_variables": [list(e) for e in edges],
            "keep_at_least_one": [list(c) for c in keep_clauses],
            "delete_at_least_one": [list(c) for c in delete_clauses],
            "forced_keep": sorted(i for i, keep in values.items() if keep),
            "forced_delete": sorted(i for i, keep in values.items() if not keep),
            "conflict": conflict, "certificate_deletions": candidate}


def self_check():
    """Tiny semantic validation, not an order-43 search or exclusion."""
    n = 5
    pairs = list(itertools.combinations(range(n), 2))
    inputs = comparisons = exchange_count = reroot_count = swap_comparisons = 0
    orders = set()
    for mask in range(1 << len(pairs)):
        adjacency = graph(n, [p for i, p in enumerate(pairs) if mask & (1 << i)])
        for r, s in ((3, 3), (3, 4), (4, 3), (4, 4)):
            if obstruction(adjacency, r, s):
                continue
            for root in range(n):
                report = analyze(adjacency, root, r, s)
                inputs += 1
                predicted_swaps = {(swap["remove_neighbor"], swap["add_neighbor"])
                                   for swap in report["root_star_swaps"]}
                for u in report["A"]:
                    for y in report["B"]:
                        valid = obstruction(edited(adjacency, [(root, y)], [(root, u)]), r, s) is None
                        assert valid == ((u, y) in predicted_swaps)
                        swap_comparisons += 1
                for swap in report["root_star_swaps"]:
                    u, y, order = swap["remove_neighbor"], swap["add_neighbor"], swap["safe_order"]
                    if order in ("either", "add_first"):
                        assert obstruction(edited(adjacency, [(root, y)], []), r, s) is None
                    if order in ("either", "delete_first"):
                        assert obstruction(edited(adjacency, [], [(root, u)]), r, s) is None
                predicted = {(tuple(e["add"]), tuple(e["delete"]))
                             for e in report["exchanges"]}
                for add in report["addition_blockers"]:
                    for delete in report["deletion_blockers"]:
                        p, f = tuple(add["edge"]), tuple(delete["edge"])
                        valid = obstruction(edited(adjacency, [p], [f]), r, s) is None
                        comparisons += 1
                        assert valid == ((p, f) in predicted)
                for exchange in report["exchanges"]:
                    p, f = tuple(exchange["add"]), tuple(exchange["delete"])
                    order = exchange["safe_order"]
                    orders.add(order)
                    if order in ("either", "add_first"):
                        assert obstruction(edited(adjacency, [p], []), r, s) is None
                    if order in ("either", "delete_first"):
                        assert obstruction(edited(adjacency, [], [f]), r, s) is None
                    exchange_count += 1
                reroot_count += len(report["same_degree_roots"])
    repair_fixtures = [
        # Two different mixed triangles force both edges of a clique-leaf star.
        (8, [(0, 1), (0, 2), (0, 3), (0, 7),
             (1, 3), (2, 3), (1, 7), (2, 7),
             (4, 5), (4, 6), (5, 6), (3, 4), (3, 5), (7, 4), (7, 6)]
         + [(a, b) for a in (1, 2) for b in (4, 5, 6)]),
        (6, [(0, 1), (0, 2)] + [(a, b) for a in (1, 2) for b in (3, 4, 5)]
         + [(3, 4), (3, 5), (4, 5)]),
        (6, [(0, 1), (0, 2), (0, 3), (1, 3), (2, 3), (4, 5)]
         + [(a, b) for a in (1, 2, 3) for b in (4, 5)]),
        (8, [(0, 1), (0, 2), (0, 3), (1, 3), (2, 3), (4, 5)]
         + [(a, b) for a in (1, 2) for b in (4, 5, 6, 7)]
         + [(3, 4), (3, 5)]),
        (8, [(0, 1), (0, 2), (0, 3), (1, 3), (2, 3),
             (4, 5), (5, 6), (6, 7), (4, 7)]
         + [(a, b) for a in (1, 2, 3) for b in (4, 5, 6, 7)]),
        # A common independent four makes one B edge both mandatory and forbidden.
        (9, [(0, a) for a in range(1, 7)]
         + [(u, a) for u in (1, 2) for a in (3, 4, 5, 6)]
         + [(7, 8), (3, 7), (3, 8)]
         + [(u, b) for u in (1, 2) for b in (7, 8)]),
    ]
    star_graph = graph(*repair_fixtures[0])
    star_report = local_repair(star_graph, 0, (1, 2))
    assert star_report["status"] == "certificate"
    assert star_report["certificate_deletions"] == [[4, 5], [4, 6]]
    assert all(exchange["add"] != [1, 2]
               for exchange in analyze(star_graph, 0)["exchanges"])
    signature_graph = graph(*repair_fixtures[-1])
    signature_report = local_repair(signature_graph, 0, (1, 2))
    assert signature_report["kind"] == "conflicting_common_A_signatures"
    repair_comparisons = 0
    repair_statuses = set()
    for order, fixture_edges in repair_fixtures:
        adjacency = graph(order, fixture_edges)
        assert obstruction(adjacency) is None
        report = local_repair(adjacency, 0, (1, 2))
        repair_statuses.add(report["status"])
        b = set(range(order)) - adjacency[0] - {0}
        core = adjacency[1] & adjacency[2] & b
        core_edges = sorted(e for e in itertools.combinations(sorted(core), 2)
                            if e[1] in adjacency[e[0]])
        for mask in range(1 << len(core_edges)):
            deletions = [e for i, e in enumerate(core_edges) if mask & (1 << i)]
            valid = bool(deletions) and obstruction(edited(adjacency, [(1, 2)], deletions)) is None
            if "keep_at_least_one" in report:
                keep = [not bool(mask & (1 << i)) for i in range(len(core_edges))]
                predicted = (all(any(keep[i] for i in c) for c in report["keep_at_least_one"])
                             and all(any(not keep[i] for i in c) for c in report["delete_at_least_one"]))
                assert valid == predicted
            else:
                assert not valid
            repair_comparisons += 1
    assert repair_statuses == {"blocked", "certificate", "unresolved"}
    barriers = repair_barrier_self_check()
    return {"status": "PASS", "scope": "all labeled order-5 graphs; four Ramsey parameter pairs",
            "rooted_inputs": inputs, "exchange_comparisons": comparisons,
            "root_star_swap_comparisons": swap_comparisons,
            "valid_exchanges": exchange_count, "reroot_checks": reroot_count,
            "safe_orders_covered": sorted(orders), "repair_fixtures": len(repair_fixtures),
            "repair_assignment_comparisons": repair_comparisons,
            "repair_statuses_covered": sorted(repair_statuses),
            "repair_barriers": barriers}


def repair_barrier_self_check():
    """Replay two explicit barriers; neither is an order-43 construction."""
    small_edges = [(0, 1), (0, 2), (0, 3), (1, 2), (2, 3),
                   (4, 5), (4, 6), (5, 6)]
    small_edges += [(a, b) for a in (1, 3) for b in (4, 5, 6)]
    small = graph(9, small_edges)
    report = analyze(small, 0)
    assert report["a"] == 2 and report["b"] == 3
    assert all(r["a"] == 2 for r in report["same_degree_roots"])
    assert not report["exchanges"]
    assert local_repair(small, 0, (1, 3))["status"] == "blocked"
    # Allowing one B addition removes the monotone barrier and lowers b by one.
    rewired = edited(small, [(1, 3), (6, 7)], [(4, 6), (5, 6)])
    assert obstruction(rewired) is None
    rewired_report = analyze(rewired, 0)
    assert (rewired_report["a"], rewired_report["b"]) == (3, 2)

    weights = (3, 1, 2, 2, 2, 2, 1)
    labels = [i for i, weight in enumerate(weights) for _ in range(weight)]
    blown_edges = [(u, w) for u, w in itertools.combinations(range(13), 2)
                   if (labels[u] - labels[w]) % 7 not in (0, 1, 6)]
    blown_edges += [(u, 13) for u in range(13)]
    blown = graph(14, blown_edges)
    report = analyze(blown, 4)
    assert len(blown[4]) == 9 and (report["a"], report["b"]) == (22, 2)
    assert all(r["a"] <= 22 for r in report["same_degree_roots"])
    safe_holes = []
    for addition in report["addition_blockers"]:
        u, w = addition["edge"]
        common_a = blown[u] & blown[w] & blown[4]
        if not any(z in blown[y] for y, z in itertools.combinations(sorted(common_a), 2)):
            safe_holes.append((u, w))
            repair = local_repair(blown, 4, (u, w))
            assert repair["status"] == "blocked"
            assert repair["kind"] == "triangle_common_B_order"
            assert len(repair["witness"]) == 4
    assert safe_holes == [(10, 12), (11, 12)]
    for u, w in itertools.combinations(range(14), 2):
        if w not in blown[u]:
            assert any(homogeneous(blown, triple, True)
                       for triple in itertools.combinations(sorted(blown[u] & blown[w]), 3))
    return {"orders": [9, 14], "five_sets_checked": [126, 2002],
            "monotone_barrier_allows_B_rewiring": True,
            "permanent_cross_barrier_safe_holes": [list(p) for p in safe_holes]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", nargs="?", type=Path)
    parser.add_argument("--clique-size", type=int, default=5)
    parser.add_argument("--independent-size", type=int, default=5)
    parser.add_argument("--repair-hole", nargs=2, type=int, metavar=("U", "W"))
    parser.add_argument("--self-check", action="store_true")
    args = parser.parse_args()
    if args.self_check:
        report = self_check()
    else:
        if args.input is None:
            parser.error("provide input JSON or --self-check")
        try:
            source = json.loads(args.input.read_text())
            report = analyze(graph(source["n"], source["edges"]), source["root"],
                             args.clique_size, args.independent_size)
            if args.repair_hole:
                if (args.clique_size, args.independent_size) != (5, 5):
                    raise ValueError("--repair-hole requires parameters (5,5)")
                report["local_repair"] = local_repair(graph(source["n"], source["edges"]),
                                                       source["root"], args.repair_hole)
                report["local_repair"]["scope"] = "one A addition; nonempty deletion set in its common B core"
        except (KeyError, TypeError, ValueError) as error:
            parser.error(str(error))
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
