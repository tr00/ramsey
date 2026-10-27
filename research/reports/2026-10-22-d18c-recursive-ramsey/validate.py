#!/usr/bin/env python3
"""Tiny semantic author validation; no order-43 completion search.

Direct graph semantics and DAG replay are independently implemented here.
This is an author's cross-check, not independent review or closure evidence.
"""

import hashlib
import importlib.util
import itertools
import json
import math
from functools import lru_cache
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE = ROOT / "research/n43/d18/c/recursive_ramsey.py"
spec = importlib.util.spec_from_file_location("residual_dp", SOURCE)
dp = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = dp
spec.loader.exec_module(dp)


def labels(mask):
    return [v for v in range(mask.bit_length()) if mask & (1 << v)]


def pairs(mask):
    return list(itertools.combinations(labels(mask), 2))


def assignments(mask):
    edges = pairs(mask)
    for bits in range(1 << len(edges)):
        yield {edge: (bits >> index) & 1 for index, edge in enumerate(edges)}


def obeys(state, graph):
    for colour, clauses in ((1, state.positive), (0, state.negative)):
        for size, support in clauses:
            for chosen in itertools.combinations(labels(support & state.remaining), size):
                if all(graph[u, v] == colour for u, v in itertools.combinations(chosen, 2)):
                    return False
    if any(graph[u, v] != value for u, v, value in state.fixed
           if (u, v) in graph):
        return False
    for budget in state.budgets:
        value = sum(coefficient * graph[u, v] for u, v, coefficient in budget.weights)
        if not budget.lower <= value <= budget.upper:
            return False
    return True


def direct_count(state):
    return sum(obeys(state, graph) for graph in assignments(state.remaining))


@lru_cache(None)
def reference_bound(p, q):
    if min(p, q) == 1:
        return 1
    if min(p, q) == 2:
        return max(p, q)
    seeds = {(3, 3): 6, (3, 4): 9, (3, 5): 14, (4, 4): 18, (4, 5): 25}
    return min(seeds.get(tuple(sorted((p, q))), 10 ** 9),
               reference_bound(p - 1, q) + reference_bound(p, q - 1))


def parse_state(data):
    return dp.State(data["remaining"], tuple(map(tuple, data["positive"])),
                    tuple(map(tuple, data["negative"])), tuple(map(tuple, data["fixed"])),
                    tuple(dp.Budget(tuple(map(tuple, item["weights"])), item["lower"],
                                    item["upper"]) for item in data["budgets"]))


def replay(certificate):
    """Independent tiny DAG replay through direct completion-set semantics."""
    assert certificate["format"] == "ramsey-residual-dag-v1"
    assert certificate["seeds"] == [[3, 3, 6], [3, 4, 9], [3, 5, 14],
                                     [4, 4, 18], [4, 5, 25]]
    nodes = certificate["nodes"]
    for index, node in enumerate(nodes):
        state = parse_state(node["state"])
        assert len(labels(state.remaining)) <= 4
        assert node["count"] == direct_count(state)
        if node["kind"] == "empty":
            assert state.remaining == 0 and node["count"] == 1
        elif node["kind"] == "capacity":
            p, x, q, y, support, bound = node["witness"]
            assert (p, x) in state.positive and (q, y) in state.negative
            assert support == x & y and support.bit_count() >= bound
            assert bound == reference_bound(p, q) and node["count"] == 0
        else:
            assert node["kind"] == "branch"
            pivot = node["pivot"]
            assert pivot in labels(state.remaining)
            rest = state.remaining ^ (1 << pivot)
            expected_rows = []
            for mask in range(1 << state.remaining.bit_length()):
                if mask & ~rest:
                    continue
                if all(((mask >> (v if u == pivot else u)) & 1) == value
                       for u, v, value in state.fixed if pivot in (u, v)):
                    expected_rows.append(mask)
            assert [row[0] for row in node["rows"]] == expected_rows
            total = 0
            for row, child in node["rows"]:
                child_state = None if child is None else parse_state(nodes[child]["state"])
                if child_state is not None:
                    assert child_state.remaining == rest
                    assert child_state.remaining.bit_count() < state.remaining.bit_count()
                expected_count = 0
                for graph in assignments(rest):
                    full = dict(graph)
                    for other in labels(rest):
                        full[min(pivot, other), max(pivot, other)] = (row >> other) & 1
                    permitted = obeys(state, full)
                    actual = False if child_state is None else obeys(child_state, graph)
                    assert actual == permitted
                    expected_count += permitted
                if child is not None:
                    assert nodes[child]["count"] == expected_count
                else:
                    assert expected_count == 0
                total += expected_count
            assert node["count"] == total
    raw = parse_state(certificate["input"])
    expected = direct_count(raw)
    root = certificate["root"]
    assert (0 if root is None else nodes[root]["count"]) == expected
    return len(nodes)


whole = 15
states = [dp.State(whole, (), ())]
for support in range(16):
    for threshold in range(1, 6):
        states.append(dp.State(whole, ((threshold, support),), ((3, whole),)))
        states.append(dp.State(whole, ((3, whole),), ((threshold, support),)))
for x in range(16):
    y = ((x << 1) | (x >> 3)) & 15
    states.append(dp.State(whole, ((3, whole), (2, x), (3, x & 7)),
                           ((3, whole), (2, y)), ((0, 3, x & 1),),
                           (dp.induced_budget(whole, x % 4, 3 + x % 4),
                            dp.Budget(((0, 1, 2), (1, 2, 1)), x % 2, 2))))
states += [dp.State(whole, (), (), ((0, 1, 0), (0, 1, 1))),
           dp.State(whole, (), (), (), (dp.Budget((), 1, 2),)),
           dp.State(whole, (), (), (), (dp.Budget(((0, 1, 1),), 0, -1),)),
           dp.State(whole, ((3, 15), (2, 7), (3, 3)), ((3, 15),), (),
                    (dp.Budget(((0, 1, 1), (0, 1, 2)), 0, 3),
                     dp.Budget(((0, 1, 3),), 1, 2)))]

normalization_checks = derivative_checks = dag_nodes = 0
for state in states:
    normalized = dp.canonical(state)
    for graph in assignments(whole):
        assert obeys(state, graph) == (False if normalized is None else obeys(normalized, graph))
        normalization_checks += 1
    engine = dp.CompletionDP()
    assert engine.count(state) == direct_count(state)
    dag_nodes += replay(engine.certificate(state))
    if normalized is None:
        continue
    for pivot in labels(whole):
        rest = whole ^ (1 << pivot)
        for row in dp.row_choices(normalized, pivot):
            child = dp.derivative(normalized, pivot, row)
            for graph in assignments(rest):
                full = dict(graph)
                for other in labels(rest):
                    full[min(pivot, other), max(pivot, other)] = (row >> other) & 1
                assert obeys(normalized, full) == (False if child is None else obeys(child, graph))
                derivative_checks += 1

# Full fixed graphs are tiny checker truth-table cases, not a research search.
fixed_graph_cases = kernel_state_cases = 0
for n in range(6):
    domain = (1 << n) - 1
    for graph in assignments(domain):
        for p, q in ((3, 3), (3, 4), (4, 3)):
            state = dp.State(domain, ((p, domain),), ((q, domain),),
                             tuple((u, v, bit) for (u, v), bit in graph.items()))
            engine = dp.CompletionDP()
            assert engine.count(state) == int(obeys(state, graph))
            for node in engine.nodes:
                current = parse_state(node["state"])
                processed = domain ^ current.remaining
                h = processed.bit_count()
                for threshold, colour, clauses in ((p, 1, current.positive),
                                                   (q, 0, current.negative)):
                    assert len(clauses) <= sum(math.comb(h, t)
                        for t in range(min(h, threshold - 2) + 1))
                    provenance = set()
                    for size in range(min(h, threshold - 2) + 1):
                        for chosen in itertools.combinations(labels(processed), size):
                            if not all(graph[u, v] == colour for u, v
                                       in itertools.combinations(chosen, 2)):
                                continue
                            support = sum(1 << v for v in labels(current.remaining)
                                if all(graph[min(u, v), max(u, v)] == colour for u in chosen))
                            provenance.add((threshold - size, support))
                    assert set(clauses) <= provenance
                kernel_state_cases += 1
            fixed_graph_cases += 1
assert sum(math.comb(18, t) for t in range(4)) == 988
assert 2 * 988 * 24 == 47424
assert 47424 // 8 == 5928

bound_cells = 0
for p, q in itertools.product(range(1, 7), repeat=2):
    assert dp.ramsey_bound(p, q) == reference_bound(p, q)
    assert dp.ramsey_bound(p, q) == dp.ramsey_bound(q, p)
    bound_cells += 1
assert dp.ramsey_bound(5, 5) == 50

# Overlap and higher-arity regressions that pairwise/unary states alone lose.
overlap = dp.State(15, ((3, 7),), ((3, 7),))
assert dp.CompletionDP().count(overlap) == direct_count(overlap)
impossible_overlap = dp.State(63, ((3, 63),), ((3, 63),))
assert dp.CompletionDP().count(impossible_overlap) == 0
four = dp.State(15, ((5, 15),), ((5, 15),),
                tuple((u, v, 1) for u, v in pairs(15)))
assert dp.CompletionDP().count(four) == 1
parent = dp.State(31, ((5, 31),), ((5, 31),),
                  tuple((u, v, 1) for u, v in pairs(31)))
assert dp.CompletionDP().count(parent) == 0

# Witness that repeated child references must retain distinct row multiplicities.
free = dp.CompletionDP()
assert free.count(dp.State(15, (), ())) == 64
assert len(free.nodes) == 5
assert len({child for _, child in free.nodes[0]["rows"]}) == 1

# Reconstruct exactly the prescribed Paley17-plus-leaf fixture already recorded
# in the cross-branch report. Validate the initializer, never recurse on order43.
residues = {1, 2, 4, 8, 9, 13, 15, 16}
edges = [(u, v) for u, v in itertools.combinations(range(17), 2)
         if (u - v) % 17 in residues] + [(0, 17)]
assert len(edges) == 69
rows = [0] * 18
for u, v in edges:
    rows[u] |= 1 << v
    rows[v] |= 1 << u
initial = dp.d18c_initial(rows, use_reviewed_budgets=True)
assert initial.remaining.bit_count() == 43
assert len(initial.fixed) == 42 + 153 and len(initial.budgets) == 44
child = dp.derivative(dp.canonical(initial), 0, ((1 << 19) - 2))
b_domain = ((1 << 43) - 1) ^ ((1 << 19) - 1)
assert (4, (1 << 19) - 2) in child.positive
assert (4, b_domain) in child.negative
assert child.remaining.bit_count() == 42
initializer_checks = 1
for invalid in ([0] * 18, [row | (1 << u) for u, row in enumerate(rows)],
                rows[:-1], [(1 << 18) - 1 ^ (1 << u) for u in range(18)]):
    try:
        dp.d18c_initial(invalid)
    except ValueError:
        initializer_checks += 1
    else:
        raise AssertionError("invalid connected-neighborhood input accepted")

cert = dp.CompletionDP().certificate(dp.State(7, ((3, 7),), ((3, 7),)))
assert replay(cert) > 0
(HERE / "tiny_dag.json").write_text(json.dumps(cert, indent=2, sort_keys=True) + "\n")

dependencies = ["docs/general_theorems/ramsey_attachment_calculus.md",
                "research/foundations/boundary_profiles.md",
                "docs/mathematical_baseline.md", "research/n43/d18/neighborhood_connectivity.md",
                "research/n43/d18/independent_row_cuts.md",
                "research/n43/d18/cell_intersections.md",
                "research/n43/d18/cell_obligation_cuts.md",
                "research/n43/d18/deletion_degree_transfer.json",
                "research/reports/2026-10-19-cross-branch-synthesis.json"]
artifacts = ["research/n43/d18/c/recursive_ramsey.md",
             "research/n43/d18/c/recursive_ramsey.py",
             str((HERE / "validate.py").relative_to(ROOT)),
             str((HERE / "tiny_dag.json").relative_to(ROOT))]
output = {"status": "PASS", "review": "author semantic self-check only",
          "completion_states": len(states), "normalization_truth_cases": normalization_checks,
          "derivative_truth_cases": derivative_checks, "replayed_dag_nodes": dag_nodes,
          "full_fixed_graph_truth_cases": fixed_graph_cases, "bound_table_cells": bound_cells,
          "reachable_kernel_provenance_cases": kernel_state_cases,
          "d18_B_phase_maximum_obligations_per_colour": 988,
          "d18_B_phase_packed_mask_bytes_bound": 5928,
          "d18c_initializer_checks": initializer_checks,
          "free_four_vertex_completions": 64, "free_four_vertex_memo_states": len(free.nodes),
          "maximum_counted_completion_order": 4, "maximum_fixed_graph_order": 5,
          "capacity_only_regression_order": 6,
          "order43_execution": "initializer only; no completion recursion",
          "hashes": {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest()
                     for name in dependencies + artifacts}}
(HERE / "validation.json").write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
print(json.dumps({key: value for key, value in output.items() if key != "hashes"}, sort_keys=True))
