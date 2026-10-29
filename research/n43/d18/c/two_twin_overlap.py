#!/usr/bin/env python3
"""Exact finite proof data for two adjacent twin pairs with overlap two.

For A in R(4,5,18), two adjacent twin pairs whose independent common
neighborhoods have order four and intersect in two vertices imply e(A)<=69.
This verifies the finite census and necessary attachment constraints in the
proof; it is not a random search or an order-43 completion certificate.
"""

import argparse
import json
from itertools import combinations, permutations, product
from pathlib import Path


def complete(adj, vertices):
    return all(v in adj[u] for u, v in combinations(vertices, 2))


def independent(adj, vertices):
    return all(v not in adj[u] for u, v in combinations(vertices, 2))


def edge_list(adj):
    return [[u, v] for u in sorted(adj) for v in sorted(adj[u]) if u < v]


def census(target, reference):
    """Enumerate every labeled graph with this fixed degree assignment.

    Triangle-free graphs with alpha<=3 have degrees 2..3 at order eight.
    Fixed degree assignments suffice because arbitrary assignments relabel to
    these. Every edge gets both possible decisions, with exact degree and
    triangle-free pruning. For e=10, isomorphisms need only degree-preserving
    permutations (4! squared).
    """
    adj = {u: set() for u in range(8)}
    remaining = list(target)
    pairs = list(combinations(range(8), 2))
    reference_three = [u for u in reference if len(reference[u]) == 3]
    reference_two = [u for u in reference if len(reference[u]) == 2]
    maps = [left + right for left in permutations(reference_three)
            for right in permutations(reference_two)] if target == [3] * 4 + [2] * 4 else []
    nodes = solutions = isomorphic = 0

    def visit(index):
        nonlocal nodes, solutions, isomorphic
        if index == len(pairs):
            if any(remaining):
                return
            if any(independent(adj, group) for group in combinations(adj, 4)):
                return
            solutions += 1
            if maps:
                assert any(all((v in adj[u]) == (mapping[v] in reference[mapping[u]])
                               for u, v in pairs) for mapping in maps)
                isomorphic += 1
            return
        future = pairs[index:]
        if any(remaining[u] > sum(u in pair for pair in future) for u in adj):
            return
        nodes += 1
        u, v = pairs[index]
        visit(index + 1)
        if remaining[u] and remaining[v] and not (adj[u] & adj[v]):
            remaining[u] -= 1
            remaining[v] -= 1
            adj[u].add(v)
            adj[v].add(u)
            visit(index + 1)
            adj[u].remove(v)
            adj[v].remove(u)
            remaining[u] += 1
            remaining[v] += 1

    visit(0)
    return {"degrees": target, "edges": sum(target) // 2,
            "recursion_nodes": nodes, "valid_fixed_degree_graphs": solutions,
            "graphs_isomorphic_to_reference": isomorphic}


def evidence():
    circulant = {u: {v for v in range(13) if (v - u) % 13 in {1, 5, 8, 12}}
                 for u in range(13)}
    vertices = sorted(set(circulant) - circulant[0] - {0})
    vertex_set = set(vertices)
    reference = {u: circulant[u] & vertex_set for u in vertices}
    assert len(edge_list(reference)) == 10
    assert not any(complete(reference, s) for s in combinations(vertices, 3))
    assert not any(independent(reference, s) for s in combinations(vertices, 4))
    records = [census([2] * 8, reference),
               census([3] * 2 + [2] * 6, reference),
               census([3] * 4 + [2] * 4, reference)]
    assert [record["valid_fixed_degree_graphs"] for record in records] == [0, 0, 72]
    assert records[-1]["graphs_isomorphic_to_reference"] == 72
    # Complement excludes its diagonal: all following graphs are loop-free.
    core = {u: vertex_set - reference[u] - {u} for u in vertices}
    assert len(edge_list(core)) == 18
    assert not any(complete(core, s) for s in combinations(vertices, 4))
    assert not any(independent(core, s) for s in combinations(vertices, 3))
    rows = [set(group) for group in combinations(vertices, 5)
            if all(len(core[u] & set(group)) == 2 for u in group)]
    assert len(rows) == 4
    cross = {(i, j) for i, left in enumerate(rows) for j, right in enumerate(rows)
             if len(left & right) == 2 and independent(core, left & right)}
    within = {(i, j) for i, left in enumerate(rows) for j, right in enumerate(rows)
              if complete(core, vertex_set - left - right)}
    valid_four_rows = [list(assignment) for assignment in product(range(len(rows)), repeat=4)
                       if (assignment[0], assignment[1]) in within
                       and (assignment[2], assignment[3]) in within
                       and all((i, j) in cross for i in assignment[:2]
                               for j in assignment[2:])]
    assert len(cross) == len(within) == 8
    assert not valid_four_rows
    return {
        "scope": "Universal pure R(4,5,18) family bound for two adjacent twin pairs with independent common four-sets intersecting in two; no order-43 completion assertion.",
        "conclusion": "e(A)<=69, so this whole structural family is absent from residual d18c with 4<=q<=15.",
        "proof_steps": [
            "The two twin pairs are anticomplete: adjacency between the two modules would give K4.",
            "Their common-set union S has six vertices, with X the common two and Y,Z the exclusive two each. X is anticomplete to Y,Z; each of X,Y,Z is independent; only four Y-Z edges are possible.",
            "The remaining D has eight vertices anticomplete to both twin pairs. Choosing one endpoint of each pair forces alpha(D)<=2, so D is K4/I3-free.",
            "F=complement(D) is triangle-free/I4-free of order eight. Its degrees are at most three by independent neighborhoods, and at least two by R(3,3)=6 on antineighborhoods.",
            "The census excludes e(F)=8,9, so e(D)<=18; at e(F)=10 the degree multiset is four threes and four twos, and all 72 fixed-degree labeled graphs are isomorphic to the reference.",
            "Each S-to-D neighbor row is triangle-free/I3-free, so has at most five vertices by R(3,3)=6. With 18 edges incident to twin endpoints, e(A)<=18+18+30+4=70.",
            "Equality forces e(D)=18, all six S rows of size five (each induces C5), and complete Y-Z.",
            "Every Y/Z cross-row intersection is independent by K4-freeness and has size at least two; alpha(D)<=2 forces size exactly two.",
            "Every two Y rows have a clique of common missed D-vertices: an independent missed pair, both Y vertices and one endpoint of the opposite twin pair would form I5. The same holds for two Z rows.",
            "The four induced C5 rows of the unique D representative admit zero four-row assignments satisfying these necessary constraints. Equality is impossible, so e(A)<=69."
        ],
        "reference_F": {"vertices": vertices, "edges": edge_list(reference)},
        "census": records,
        "reference_D": {"vertices": vertices, "edges": edge_list(core)},
        "C5_rows": [sorted(row) for row in rows],
        "cross_compatible_ordered_pairs": [list(pair) for pair in sorted(cross)],
        "within_compatible_ordered_pairs": [list(pair) for pair in sorted(within)],
        "four_row_assignments_checked": len(rows) ** 4,
        "valid_four_row_assignments": valid_four_rows,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = evidence()
    if args.output:
        args.output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"conclusion": result["conclusion"], "census": result["census"],
                      "C5_rows": result["C5_rows"],
                      "valid_four_row_assignments": result["valid_four_row_assignments"]}))


if __name__ == "__main__":
    main()
