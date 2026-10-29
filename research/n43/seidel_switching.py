#!/usr/bin/env python3
"""Exact Seidel-switch predicates and finite self-checks (standard library).

This validates identities and small examples. It does not search for or
exclude order-43 Ramsey graphs. See seidel_switching.md for mathematical scope.
Run: python research/n43/seidel_switching.py --self-check
"""

import argparse
from itertools import combinations
import json


def complement(adj):
    full = (1 << len(adj)) - 1
    return [full ^ row ^ (1 << v) for v, row in enumerate(adj)]


def switch(adj, cut):
    full = (1 << len(adj)) - 1
    if cut < 0 or cut & ~full:
        raise ValueError("cut is outside the vertex set")
    return [row ^ (full ^ cut if cut >> v & 1 else cut)
            for v, row in enumerate(adj)]


def ramsey(adj, order):
    """Direct check of every order-subset, without switching constraints."""
    for vertices in combinations(range(len(adj)), order):
        edges = sum((adj[u] >> v) & 1
                    for u, v in combinations(vertices, 2))
        if edges in (0, order * (order - 1) // 2):
            return False
    return True


def forbidden_patterns(adj, order=5):
    """Return (support, bad assignment, target edge bit) for NAE clauses.

    On support W, both bad and support^bad are forbidden. Vertices outside
    W are unrestricted. Normalize the first bit of bad to zero. Works also
    for non-Ramsey inputs, where a homogeneous W forbids the constant cuts.
    """
    if order < 3:
        raise ValueError("order must be at least three")
    patterns = []
    for vertices in combinations(range(len(adj)), order):
        first = vertices[0]
        support = sum(1 << v for v in vertices)
        for target in (0, 1):
            bits = [0] + [((adj[first] >> v) & 1) ^ target
                          for v in vertices[1:]]
            if all((((adj[u] >> v) & 1) ^ bits[i] ^ bits[j]) == target
                   for i, u in enumerate(vertices)
                   for j, v in enumerate(vertices) if i < j):
                bad = sum(bit << v for v, bit in zip(vertices, bits))
                patterns.append((support, bad, target))
    return patterns


def preserves(patterns, cut):
    return all((cut & support) not in (bad, support ^ bad)
               for support, bad, _ in patterns)


def cnf_clauses(patterns):
    """Ordinary DIMACS literals: vertex v has variable v+1."""
    for support, bad, _ in patterns:
        clause = tuple(-(v + 1) if bad >> v & 1 else v + 1
                       for v in range(support.bit_length())
                       if support >> v & 1)
        yield clause
        yield tuple(-literal for literal in clause)


def cut_energy_matrix(adj):
    """Integer M = C^2 - diag(C^2 1), where C is the Seidel matrix.

    M has zero row sums. For a binary cut vector x,
    4*x^T M x is the change in the squared norm of Seidel row sums.
    """
    n = len(adj)
    seidel = [[0 if u == v else 1 - 2 * ((adj[u] >> v) & 1)
               for v in range(n)] for u in range(n)]
    squared = [[sum(seidel[u][w] * seidel[w][v] for w in range(n))
                for v in range(n)] for u in range(n)]
    return [[value - (sum(squared[u]) if u == v else 0)
             for v, value in enumerate(row)]
            for u, row in enumerate(squared)]


def check_cut_energy(adj, cut, matrix):
    """Check the moment identity and the narrow-degree defect identity.

    The latter generalizes the order-43 formula to odd n, centered at
    q=(n-1)/2. Its hypotheses concern degrees only, so small graphs suffice
    to test the algebra, including endpoints with boundary degrees q+-3.
    """
    n = len(adj)
    assert n % 2 == 1
    if cut.bit_count() % 2:
        cut ^= (1 << n) - 1
    vertices = [v for v in range(n) if cut >> v & 1]
    energy = sum(matrix[u][v] for u in vertices for v in vertices)
    old_degrees = [row.bit_count() for row in adj]
    new_degrees = [row.bit_count() for row in switch(adj, cut)]
    old_moment = sum((n - 1 - 2 * d) ** 2 for d in old_degrees)
    new_moment = sum((n - 1 - 2 * d) ** 2 for d in new_degrees)
    assert 4 * energy == new_moment - old_moment
    q = (n - 1) // 2
    checked_defect = (all(abs(d - q) <= 2 for d in old_degrees)
                      and all(abs(d - q) <= 3 for d in new_degrees))
    boundary_count = sum(abs(d - q) == 3 for d in new_degrees)
    if checked_defect:
        parity_sum = sum(1 if (old_degrees[v] - q) % 2 else -1
                         for v in vertices)
        expected = (3 * parity_sum
                    + 4 * (old_degrees.count(q) - new_degrees.count(q))
                    + 8 * boundary_count)
        assert energy == expected
        assert boundary_count >= (energy - 3 * parity_sum
                                  - 4 * old_degrees.count(q) + 7) // 8
    return checked_defect, boundary_count


def quartet_closure(adj, seed):
    """Closure forced when seed is monochromatic in a preserving cut.

    A clique four-set forces all common nonneighbors to its own cut side;
    an independent four-set forces all common neighbors. This is only a
    sufficient rigidity tool: it omits the mixed 2+3 obstructions.
    """
    n = len(adj)
    full = (1 << n) - 1
    if seed < 0 or seed & ~full:
        raise ValueError("seed is outside the vertex set")
    closed = seed
    while True:
        expanded = closed
        vertices = [v for v in range(n) if closed >> v & 1]
        for quartet in combinations(vertices, 4):
            edges = sum((adj[u] >> v) & 1
                        for u, v in combinations(quartet, 2))
            if edges not in (0, 6):
                continue
            forced = full
            for v in quartet:
                forced &= (full ^ adj[v] ^ (1 << v)) if edges == 6 else adj[v]
            expanded |= forced
        if expanded == closed:
            return closed
        closed = expanded


def check_identities(adj, cut):
    n = len(adj)
    switched = switch(adj, cut)
    full = (1 << n) - 1
    m = cut.bit_count()
    for v in range(n):
        opposite = full ^ cut if cut >> v & 1 else cut
        expected = (adj[v].bit_count() + opposite.bit_count()
                    - 2 * (adj[v] & opposite).bit_count())
        assert switched[v].bit_count() == expected
        if n % 2:
            assert (expected - adj[v].bit_count() - m - (cut >> v & 1)) % 2 == 0
    assert switch(switched, cut) == adj
    assert switch(adj, full ^ cut) == switched
    assert complement(switched) == switch(complement(adj), cut)


def paley17():
    residues = {x * x % 17 for x in range(1, 17)}
    return [sum(1 << v for v in range(17) if (v - u) % 17 in residues)
            for u in range(17)]


def self_check():
    # All labelled graphs on five vertices, every cut up to complement,
    # and three different Ramsey thresholds. The direct checker enumerates
    # subsets; the constraint generator reconstructs signed cut patterns.
    pairs = list(combinations(range(5), 2))
    comparisons = 0
    moment_checks = 0
    defect_checks = 0
    boundary_endpoints = 0
    closure_checks = 0
    closure_cascade_checks = 0
    ramsey_inputs = {order: 0 for order in (3, 4, 5)}
    for edge_bits in range(1 << len(pairs)):
        adj = [0] * 5
        for bit, (u, v) in enumerate(pairs):
            if edge_bits >> bit & 1:
                adj[u] |= 1 << v
                adj[v] |= 1 << u
        for order in (3, 4, 5):
            patterns = forbidden_patterns(adj, order)
            clauses = list(cnf_clauses(patterns))
            ramsey_inputs[order] += ramsey(adj, order)
            for cut in range(0, 1 << 5, 2):
                expected = ramsey(switch(adj, cut), order)
                assert preserves(patterns, cut) == expected
                cnf = all(any(bool(cut >> (abs(lit) - 1) & 1) == (lit > 0)
                              for lit in clause) for clause in clauses)
                assert cnf == expected
                comparisons += 1
        for cut in range(0, 1 << 5, 2):
            check_identities(adj, cut)
            for second in range(0, 1 << 5, 2):
                assert switch(switch(adj, cut), second) == switch(adj, cut ^ second)

        matrix = cut_energy_matrix(adj)
        assert all(sum(row) == 0 for row in matrix)
        patterns = forbidden_patterns(adj, 5)
        closures = [(sum(1 << v for v in seed),
                     quartet_closure(adj, sum(1 << v for v in seed)))
                    for seed in combinations(range(5), 4)]
        for cut in range(0, 1 << 5, 2):
            checked, boundary = check_cut_energy(adj, cut, matrix)
            moment_checks += 1
            defect_checks += int(checked)
            boundary_endpoints += int(boundary > 0)
            if ramsey(adj, 5) and preserves(patterns, cut):
                for seed, closed in closures:
                    for side in (cut, 31 ^ cut):
                        if seed & side == seed:
                            assert closed & side == closed
                            closure_checks += 1

        # A fixed extension gives 1,024 seven-vertex inputs with all degrees
        # in 1..5. Every switched endpoint has degrees in 0..6, so this also
        # exercises both boundary degrees in the generalized identity.
        extended = adj + [0, 0]
        for u, v in ((5, 0), (5, 1), (5, 2), (6, 3), (6, 4), (5, 6)):
            extended[u] |= 1 << v
            extended[v] |= 1 << u
        matrix7 = cut_energy_matrix(extended)
        assert all(sum(row) == 0 for row in matrix7)
        for cut in range(0, 1 << 7, 2):
            checked, boundary = check_cut_energy(extended, cut, matrix7)
            assert checked
            moment_checks += 1
            defect_checks += 1
            boundary_endpoints += int(boundary > 0)

    # A closure cascade: starting from K4 on 0..3 first adds the
    # anticomplete K4 on 4..7; that second clique then forces vertex 8.
    cascade = [0] * 9
    for clique in (range(4), range(4, 8)):
        for u, v in combinations(clique, 2):
            cascade[u] |= 1 << v
            cascade[v] |= 1 << u
    cascade[0] |= 1 << 8
    cascade[8] |= 1
    for graph in (cascade, complement(cascade)):
        assert ramsey(graph, 5)
        assert quartet_closure(graph, 15) == 511
        for cut in range(0, 1 << 9, 2):
            if ramsey(switch(graph, cut), 5):
                for side in (cut, 511 ^ cut):
                    if side & 15 == 15:
                        assert side == 511
            closure_cascade_checks += 1

    adj = paley17()
    assert ramsey(adj, 4)
    assert all(row.bit_count() == 8 for row in adj)
    patterns = forbidden_patterns(adj, 4)
    safe = []
    regular = []
    for cut in range(0, 1 << 17, 2):
        if preserves(patterns, cut):
            safe.append(cut)
        if all(row.bit_count() == 8 for row in switch(adj, cut)):
            regular.append(cut)
    assert safe == regular == [0]
    return {
        "scope": "finite self-check; no order-43 search or exclusion",
        "labelled_five_vertex_graphs": 1024,
        "ramsey_inputs_by_forbidden_order": ramsey_inputs,
        "direct_ramsey_vs_pattern_and_cnf_comparisons": comparisons,
        "switch_composition_comparisons": 1024 * 16 * 16,
        "cut_energy_moment_checks": moment_checks,
        "cut_energy_defect_checks": defect_checks,
        "cut_energy_endpoints_with_boundary_degrees": boundary_endpoints,
        "quartet_closure_monochromatic_seed_checks": closure_checks,
        "quartet_closure_cascade_cuts_directly_checked": closure_cascade_checks,
        "paley17_four_subsets_checked": 2380,
        "paley17_cuts_checked_up_to_complement": 65536,
        "paley17_preserving_cuts_normalized_vertex0_outside": safe,
        "paley17_nae_constraints": len(patterns),
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--self-check", action="store_true", required=True)
    parser.parse_args()
    print(json.dumps(self_check(), indent=2, sort_keys=True))
