#!/usr/bin/env python3
"""Tiny semantic author checks for symmetry recursion; no order43 completion run."""

from collections import Counter
import hashlib
import importlib.util
from itertools import combinations, permutations, product
import json
from math import comb, factorial
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MODULE = ROOT / "research/n43/d18/c/recursive_symmetry.py"
sys.path.insert(0, str(MODULE.parent))
spec = importlib.util.spec_from_file_location("symmetry_adapter", MODULE)
sym = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = sym
spec.loader.exec_module(sym)
base = sym.base


def labels(mask):
    return tuple(u for u in range(mask.bit_length()) if mask & (1 << u))


def all_graphs(domain):
    pairs = tuple(combinations(labels(domain), 2))
    for bits in range(1 << len(pairs)):
        yield {pair: (bits >> index) & 1 for index, pair in enumerate(pairs)}


def semantics(state, graph):
    for bit, obligations in ((1, state.positive), (0, state.negative)):
        for size, support in obligations:
            for chosen in combinations(labels(support & state.remaining), size):
                if all(graph[u, v] == bit for u, v in combinations(chosen, 2)):
                    return False
    for u, v, bit in state.fixed:
        if (u, v) in graph and graph[u, v] != bit:
            return False
    for budget in state.budgets:
        total = sum(w * graph[u, v] for u, v, w in budget.weights)
        if not budget.lower <= total <= budget.upper:
            return False
    return True


def direct_count(state):
    return sum(semantics(state, graph) for graph in all_graphs(state.remaining))


def moved_graph(graph, mapping):
    mapping = dict(mapping)
    return {tuple(sorted((mapping[u], mapping[v]))): bit for (u, v), bit in graph.items()}


def parse(data):
    return base.State(data["remaining"], tuple(map(tuple, data["positive"])),
        tuple(map(tuple, data["negative"])), tuple(map(tuple, data["fixed"])),
        tuple(base.Budget(tuple(map(tuple, item["weights"])), item["lower"], item["upper"])
              for item in data["budgets"]))


def verify_transport(source, target, mapping):
    """Separate set/tuple transport checker, without adapter relabelling."""
    mapping = dict(mapping)
    assert set(mapping) == set(labels(source.remaining))
    assert set(mapping.values()) == set(labels(target.remaining))
    assert len(mapping) == len(set(mapping.values()))
    for name in ("positive", "negative"):
        transported = {(k, sum(1 << mapping[u] for u in labels(mask)))
                       for k, mask in getattr(source, name)}
        assert transported == set(getattr(target, name))
    assert {(*sorted((mapping[u], mapping[v])), bit) for u, v, bit in source.fixed} == set(target.fixed)
    assert {(tuple(sorted((*sorted((mapping[u], mapping[v])), w) for u, v, w in b.weights)),
             b.lower, b.upper) for b in source.budgets} == {
                 (b.weights, b.lower, b.upper) for b in target.budgets}


def compatible_rows(state, pivot):
    rest = state.remaining ^ (1 << pivot)
    for mask in range(1 << state.remaining.bit_length()):
        if mask & ~rest:
            continue
        if all(((mask >> (v if u == pivot else u)) & 1) == bit
               for u, v, bit in state.fixed if pivot in (u, v)):
            yield mask


def check_row_partition(state, pivot, colours):
    blocks = tuple(block for block in sym.swap_blocks(state, colours, (pivot,))
                   if block != (pivot,))
    groups = Counter(tuple(sum((row >> u) & 1 for u in block) for block in blocks)
                     for row in compatible_rows(state, pivot))
    rows = list(sym.row_orbits(state, pivot, colours))
    actual = {}
    for mask, weight in rows:
        counts = tuple(sum((mask >> u) & 1 for u in block) for block in blocks)
        assert counts not in actual
        assert mask == sum(1 << u for block, size in zip(blocks, counts) for u in block[:size])
        assert weight == groups[counts] == product_value(comb(len(b), s) for b, s in zip(blocks, counts))
        actual[counts] = weight
    assert actual == dict(groups)
    for block in blocks:
        for u, v in combinations(block, 2):
            mapping = {w: v if w == u else u if w == v else w for w in labels(state.remaining)}
            moved = sym.relabel(state, mapping)
            verify_transport(state, moved, mapping)
            assert moved == state
            assert dict(colours)[u] == dict(colours)[v]
    return len(rows)


def product_value(values):
    result = 1
    for value in values:
        result *= value
    return result


def count_vector_orbits(blocks, generators, vectors):
    """Separate quotient coverage on the tiny count-vector set."""
    owner = {u: i for i, block in enumerate(blocks) for u in block}
    actions = [tuple(owner[dict(g)[block[0]]] for block in blocks) for g in generators]
    visited = set()
    result = []
    for initial in sorted(vectors):
        if initial in visited:
            continue
        orbit = {initial}
        queue = [initial]
        for counts in queue:
            for action in actions:
                moved = tuple(counts[action.index(i)] for i in range(len(blocks)))
                assert moved in vectors
                if moved not in orbit:
                    orbit.add(moved)
                    queue.append(moved)
        visited.update(orbit)
        result.append(frozenset(orbit))
    assert visited == set(vectors)
    return result


def replay(cert):
    assert cert["format"] == "ramsey-symmetry-dag-v1"
    assert cert["seeds"] == [[3, 3, 6], [3, 4, 9], [3, 5, 14], [4, 4, 18], [4, 5, 25]]
    nodes = cert["nodes"]
    raw = parse(cert["input"])
    root = cert["root"]
    if root is None:
        assert direct_count(raw) == 0
    else:
        verify_transport(base.canonical(raw), parse(nodes[root]["state"]), cert["root_transport"])
        mapping = dict(cert["root_transport"])
        assert tuple(sorted((mapping[u], c) for u, c in cert["colours"])) == tuple(map(tuple, nodes[root]["colours"]))
        assert nodes[root]["count"] == direct_count(raw)
    for node in nodes:
        state = parse(node["state"])
        colours = tuple(map(tuple, node["colours"]))
        assert node["count"] == direct_count(state)
        if node["kind"] == "empty":
            assert not state.remaining and node["count"] == 1
            continue
        if node["kind"] == "capacity":
            p, x, q, y, support, bound = node["witness"]
            assert (p, x) in state.positive and (q, y) in state.negative
            assert support == x & y and support.bit_count() >= bound
            assert node["count"] == 0
            continue
        assert node["kind"] == "branch"
        pivot = node["pivot"]
        blocks = tuple(map(tuple, node["blocks"]))
        assert set(u for block in blocks for u in block) == set(labels(state.remaining)) - {pivot}
        assert sum(map(len, blocks)) == state.remaining.bit_count() - 1
        groups = Counter(tuple(sum((row >> u) & 1 for u in block) for block in blocks)
                         for row in compatible_rows(state, pivot))
        generators = node.get("generators", [])
        for generator in generators:
            mapping = dict(generator)
            verify_transport(state, state, mapping)
            assert mapping[pivot] == pivot
            assert tuple(sorted((mapping[u], c) for u, c in colours)) == colours
        orbits = count_vector_orbits(blocks, generators, groups)
        expected_orbits = {min(orbit): orbit for orbit in orbits}
        seen = set()
        total = 0
        for block in blocks:
            for u, v in combinations(block, 2):
                mapping = {w: v if w == u else u if w == v else w for w in labels(state.remaining)}
                verify_transport(state, state, mapping)
                assert dict(colours)[u] == dict(colours)[v]
        for row in node["rows"]:
            mask, weight, child_id = row["neighbors"], row["weight"], row["child"]
            counts = tuple(sum((mask >> u) & 1 for u in block) for block in blocks)
            assert counts in expected_orbits and counts not in seen
            seen.add(counts)
            assert weight == sum(groups[v] for v in expected_orbits[counts])
            rest = state.remaining ^ (1 << pivot)
            child = None if child_id is None else parse(nodes[child_id]["state"])
            if child is not None:
                assert child.remaining.bit_count() == rest.bit_count()
                assert child.remaining.bit_count() < state.remaining.bit_count()
                transport = dict(row["transport"])
                assert set(transport) == set(labels(rest))
                assert set(transport.values()) == set(labels(child.remaining))
                child_colours = tuple(map(tuple, nodes[child_id]["colours"]))
                assert tuple(sorted((transport[u], c) for u, c in colours if u != pivot)) == child_colours
                derivative = base.derivative(state, pivot, mask)
                assert derivative is not None
                verify_transport(derivative, child, transport)
            expected = 0
            for graph in all_graphs(rest):
                full = dict(graph)
                for other in labels(rest):
                    full[min(pivot, other), max(pivot, other)] = (mask >> other) & 1
                allowed = semantics(state, full)
                actual = False if child is None else semantics(child, moved_graph(graph, row["transport"]))
                assert allowed == actual
                expected += allowed
            if child is not None:
                assert nodes[child_id]["count"] == expected
            else:
                assert expected == 0 and row["transport"] is None
            total += weight * expected
        assert seen == set(expected_orbits) and node["count"] == total
    return len(nodes)


domain = 15
states = [base.State(domain, (), ()), base.State(domain, ((3, domain),), ((3, domain),))]
for support in range(16):
    for threshold in (2, 3):
        states.append(base.State(domain, ((threshold, support), (3, domain)), ((3, domain),)))
        states.append(base.State(domain, ((3, domain),), ((threshold, support), (3, domain))))
    states.append(base.State(domain, ((3, domain),), ((3, domain),),
        ((0, 3, support & 1),), (base.induced_budget(domain, support % 3, 3 + support % 3),)))
states += [base.State(domain, (), (), (), tuple(base.degree_budget(domain, u, 1, 2)
           for u in range(4))),
           base.State(domain, (), (), (), (base.Budget(((0, 1, 2), (1, 2, 1)), 1, 2),)),
           base.State(domain, (), (), ((0, 1, 0), (0, 1, 1))),
           base.State(domain, ((1, 1),), ())]

count_cases = row_representatives = transport_truth_cases = derivative_equivariance_cases = 0
canonical_invariance_cases = replay_nodes = 0
for raw in states:
    for colours in (tuple((u, 0) for u in range(4)), tuple((u, u % 2) for u in range(4))):
        expected = direct_count(raw)
        for limit in (1, 3, None):
            engine = sym.SymmetryDP(limit)
            assert engine.count(raw, colours) == expected
            replay_nodes += replay(engine.certificate(raw, colours))
            count_cases += 1
        state = base.canonical(raw)
        if state is None:
            continue
        image = sym.representative_image(state, colours, None)
        assert image.exhaustive
        verify_transport(state, image.state, image.transport)
        for pivot in range(4):
            row_representatives += check_row_partition(state, pivot, colours)
        # Transport through every four-vertex permutation, including moved roles.
        for order in permutations(range(4)):
            mapping = dict(enumerate(order))
            moved = sym.relabel(state, mapping)
            verify_transport(state, moved, mapping)
            moved_colours = sym.move_colours(colours, mapping)
            new_image = sym.representative_image(moved, moved_colours, None)
            assert (new_image.state, new_image.colours) == (image.state, image.colours)
            canonical_invariance_cases += 1
            for graph in all_graphs(domain):
                assert semantics(state, graph) == semantics(moved, moved_graph(graph, mapping))
                transport_truth_cases += 1
            pivot = 0
            for row in compatible_rows(state, pivot):
                child = base.derivative(state, pivot, row)
                moved_child = base.derivative(moved, mapping[pivot], sym.move_mask(row, mapping))
                if child is None:
                    assert moved_child is None
                else:
                    rest_map = {u: v for u, v in mapping.items() if u != pivot}
                    assert sym.relabel(child, rest_map) == moved_child
                derivative_equivariance_cases += 1

# Coupled symmetry with no individually allowed swap: a prescribed 4-cycle.
cycle_edges = {(0, 1), (1, 2), (2, 3), (0, 3)}
cycle = base.canonical(base.State(15, (), (),
    tuple((u, v, int((u, v) in cycle_edges)) for u, v in combinations(range(4), 2))))
assert sym.swap_blocks(cycle) == ((0, 2), (1, 3))
rotation = {0: 1, 1: 2, 2: 3, 3: 0}
assert sym.relabel(cycle, rotation) == cycle

# A path's reversal is a coupled symmetry and no single swap preserves it.
path_edges = {(0, 1), (1, 2), (2, 3)}
path = base.canonical(base.State(15, (), (),
    tuple((u, v, int((u, v) in path_edges)) for u, v in combinations(range(4), 2))))
assert sym.swap_blocks(path) == ((0,), (1,), (2,), (3,))
assert sym.relabel(path, {0: 3, 1: 2, 2: 1, 3: 0}) == path
for order in permutations(range(4)):
    moved = sym.relabel(path, dict(enumerate(order)))
    assert sym.representative_image(moved, None, None).state == sym.representative_image(path, None, None).state

# P4 constraints plus a free distinguished pivot. Reversal acts by two swaps
# together; all four future labels have singleton swap blocks. It groups16 rows
# into10 weighted orbits, and is discovered from equal whole-state images.
coupled = base.canonical(base.State(31, (), (), path.fixed))
coupled_colours = tuple((u, 0 if u == 4 else 1) for u in range(5))
reversal = tuple((u, 3-u if u < 4 else 4) for u in range(5))
assert sym.swap_blocks(coupled, coupled_colours, (4,)) == tuple((u,) for u in range(5))
plain_rows = list(sym.row_orbits(coupled, 4, coupled_colours))
coupled_rows = list(sym.row_orbits(coupled, 4, coupled_colours, (reversal,)))
assert len(plain_rows) == 16 and len(coupled_rows) == 10
assert sum(w for _, w in coupled_rows) == 16
coupled_image = sym.representative_image(coupled, coupled_colours, None)
assert coupled_image.generators
coupled_engine = sym.SymmetryDP(None)
assert coupled_engine.count(coupled, coupled_colours) == direct_count(coupled) == 16
coupled_certificate = coupled_engine.certificate(coupled, coupled_colours)
assert len(coupled_certificate["nodes"][coupled_certificate["root"]]["rows"]) == 10
replay_nodes += replay(coupled_certificate)

# Schreier stabilizers, cross-checked against tiny explicit subgroup closure.
def closure(domain, generators):
    identity = tuple((u, u) for u in domain)
    result = {identity}
    queue = [identity]
    for value in queue:
        for generator in generators:
            candidate = tuple((u, dict(generator)[dict(value)[u]]) for u in domain)
            if candidate not in result:
                result.add(candidate)
                queue.append(candidate)
    return result


stabilizer_cases = 0
for generators in ((( (0,1),(1,2),(2,3),(3,0) ),),
                   (((0,1),(1,2),(2,3),(3,0)), ((0,0),(1,3),(2,2),(3,1))),
                   (((0,1),(1,0),(2,2),(3,3)), ((0,0),(1,2),(2,1),(3,3)))):
    full = closure(tuple(range(4)), generators)
    for pivot in range(4):
        actual = closure(tuple(range(4)), sym.point_stabilizer(tuple(range(4)), generators, pivot))
        assert actual == {g for g in full if dict(g)[pivot] == pivot}
        stabilizer_cases += 1

# Degree budgets may permute as whole tuples. Asymmetric named budgets break swaps.
uniform = base.canonical(base.State(15, (), (), (),
    tuple(base.degree_budget(15, u, 1, 2) for u in range(4))))
assert sym.swap_blocks(uniform) == ((0, 1, 2, 3),)
named = base.canonical(base.State(15, (), (), (), (base.degree_budget(15, 0, 0, 0),)))
assert sym.swap_blocks(named) == ((0,), (1, 2, 3))

unconstrained = sym.SymmetryDP()
assert unconstrained.count(base.State(15, (), ())) == 64
assert len(unconstrained.nodes) == 5
assert [row["weight"] for row in unconstrained.nodes[0]["rows"]] == [1, 3, 3, 1]
assert len({row["child"] for row in unconstrained.nodes[0]["rows"]}) == 1

# Algebraic split-tree telescoping, no graph search.
split_cases = 0
for multiplicities in product(range(4), repeat=4):
    n = sum(multiplicities)
    left, right = sum(multiplicities[:2]), sum(multiplicities[2:])
    product_weights = comb(n, left) * comb(left, multiplicities[0]) * comb(right, multiplicities[2])
    assert product_weights == factorial(n) // product_value(factorial(m) for m in multiplicities)
    split_cases += 1

# Initializer and forced root derivative only at43; no completion recursion.
residues = {1, 2, 4, 8, 9, 13, 15, 16}
edges = [(u, v) for u, v in combinations(range(17), 2) if (u - v) % 17 in residues] + [(0, 17)]
rows = [0] * 18
for u, v in edges:
    rows[u] |= 1 << v
    rows[v] |= 1 << u
initial = base.canonical(base.d18c_initial(rows, cross_interval=(0, 432), use_reviewed_budgets=True))
colours = sym.d18c_colours(initial)
root_neighbors = (1 << 19) - 2
child = base.derivative(initial, 0, root_neighbors)
child_colours = tuple((u, c) for u, c in colours if u != 0)
blocks = sym.swap_blocks(child, child_colours, (1,))
assert tuple(range(19, 43)) in blocks
first_rows = list(sym.row_orbits(child, 1, child_colours))
assert len(first_rows) == 25
assert sum(weight for _, weight in first_rows) == 2 ** 24
assert [weight for _, weight in first_rows] == [comb(24, a) for a in range(25)]
assert sum(comb(24, a) for a in range(9, 16)) == 14233964

# Representative selection on a pure24-label symmetric input requires one image,
# not24! enumerated permutations. This is a state algebra check only.
symmetric24 = base.State((1 << 24) - 1, ((5, (1 << 24) - 1),), ((4, (1 << 24) - 1),))
image24 = sym.representative_image(symmetric24, None, None)
assert image24.exhaustive and image24.candidates == 1

tiny = sym.SymmetryDP().certificate(base.State(15, ((3, 15),), ((3, 15),)))
replay(tiny)
(HERE / "tiny_symmetry_dag.json").write_text(json.dumps(tiny, indent=2, sort_keys=True) + "\n")

dependencies = ["research/n43/d18/c/recursive_ramsey.py",
                "research/n43/d18/c/recursive_ramsey.md",
                "research/n43/d18/symmetry_reduction.md",
                "docs/general_theorems/symmetry_quotients.md",
                "docs/mathematical_baseline.md"]
artifacts = [str(MODULE.relative_to(ROOT)), "research/n43/d18/c/recursive_symmetry.md",
             str((HERE / "validate.py").relative_to(ROOT)),
             str((HERE / "tiny_symmetry_dag.json").relative_to(ROOT))]
output = {"status": "PASS", "review": "author semantic self-check only",
    "tiny_count_cases": count_cases, "row_representatives_checked": row_representatives,
    "transport_truth_cases": transport_truth_cases,
    "derivative_equivariance_cases": derivative_equivariance_cases,
    "exhaustive_representative_invariance_cases": canonical_invariance_cases,
    "replayed_quotient_dag_nodes": replay_nodes, "split_weight_identity_cases": split_cases,
    "coupled_row_orbits_without_swaps": len(plain_rows), "coupled_row_orbits_with_generator": len(coupled_rows),
    "schreier_stabilizer_cases": stabilizer_cases,
    "d18_first_A_row_representatives": len(first_rows), "d18_first_A_raw_row_count": 2 ** 24,
    "degree8_first_A_allowed_size_classes": 7, "degree8_first_A_labelled_rows": 14233964,
    "pure24_symmetric_image_candidates": image24.candidates,
    "maximum_general_counted_completion_order": 4,
    "maximum_prescribed_coupled_fixture_order": 5,
    "order43_computation": "fixed initializer, forced root derivative and25 row orbits only; no completion recursion",
    "hashes": {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest()
               for name in dependencies + artifacts}}
(HERE / "validation.json").write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
print(json.dumps({key: value for key, value in output.items() if key != "hashes"}, sort_keys=True))
