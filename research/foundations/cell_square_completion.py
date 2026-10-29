#!/usr/bin/env python3
"""Exact cofactor compiler for disjoint certified five-vertex (3,3) cells.

Research prototype for quadratic_completion.md sections 7--8. Imports the
existing implication solver; does not change its matching compiler or counting
engine. Run this file for bounded author validation. No import-time search.
"""

from dataclasses import dataclass
from itertools import combinations, product

from quadratic_completion import (Clause, Kernel, NonQuadratic, solve_kernel,
                                  verify_answer, vertices)


@dataclass(frozen=True)
class CompiledCells:
    kernel: Kernel
    pair_literals: tuple  # (u, v, signed one-based coordinate)
    outer_fixed: tuple   # (u, v, bit), all nonsymbolic pairs
    cells: tuple
    charts: tuple
    skipped_by_cell: int


def square_literals(cell, chart, first_variable=1):
    """Return the ten signed pair coordinates for one canonical square."""
    cell = tuple(sorted(cell))
    if len(cell) != 5 or len(set(cell)) != 5 or any(v < 0 for v in cell):
        raise ValueError("a cell must have five distinct nonnegative labels")
    if chart not in (0, 1, 2) or first_variable < 1:
        raise ValueError("invalid chart or coordinate index")
    v, a, *others = cell
    b = others[chart]
    c, d = tuple(x for x in others if x != b)
    s, t = first_variable, first_variable + 1
    return {tuple(sorted(pair)): literal for pair, literal in (
        ((v, a), s), ((v, b), s), ((v, c), -s), ((v, d), -s),
        ((a, b), -s), ((c, d), s), ((a, c), t), ((b, d), t),
        ((a, d), -t), ((b, c), -t))}


def literal_value(literal, values):
    return values[abs(literal) - 1] if literal > 0 else 1 - values[-literal - 1]


def compile_cell_squares(state, cells, charts, matching=()):
    """Compile one chart combination and one fully conditioned exterior.

    A supplied cell must already be covered by both positive and negative
    obligations of threshold <=3. All original obligations remain enforced.
    A fixed cell pair is a unit constraint on its coordinate, never overwritten.
    Each budget must be redundant/impossible or have <=2 nonzero coefficients
    after exact signed aggregation. Unsupported cases raise NonQuadratic.
    """
    if state.remaining < 0:
        raise ValueError("invalid remaining mask")
    domain = tuple(vertices(state.remaining))
    pairs = set(combinations(domain, 2))
    cells = tuple(tuple(sorted(cell)) for cell in cells)
    charts = tuple(charts)
    if len(cells) != len(charts):
        raise ValueError("one chart is required per cell")
    covered = set()
    for cell in cells:
        if len(cell) != 5 or len(set(cell)) != 5 or not set(cell) <= set(domain):
            raise ValueError("a cell must contain five distinct current labels")
        if covered.intersection(cell):
            raise ValueError("selected cells must be disjoint")
        covered.update(cell)
        cell_mask = sum(1 << v for v in cell)
        for family in (state.positive, state.negative):
            if not any(1 <= threshold <= 3 and mask & cell_mask == cell_mask
                       for threshold, mask in family):
                raise ValueError("missing certified (3,3) cell obligation")
    matching = tuple(sorted(matching))
    if len(set(matching)) != len(matching) or any(e not in pairs for e in matching):
        raise ValueError("invalid matching pair")
    ends = [v for edge in matching for v in edge]
    if len(ends) != len(set(ends)) or covered.intersection(ends):
        raise ValueError("matching must be disjoint and on uncovered labels")

    symbolic = {}
    names = []
    for i, (cell, chart) in enumerate(zip(cells, charts)):
        symbolic.update(square_literals(cell, chart, 2 * i + 1))
        names.extend((("cell", i, "s"), ("cell", i, "t")))
    for i, edge in enumerate(matching):
        symbolic[edge] = 2 * len(cells) + i + 1
        names.append(("matching", *edge))

    fixed = {}
    contradiction = False
    for u, v, bit in state.fixed:
        if (u, v) not in pairs or bit not in (0, 1):
            raise ValueError("invalid fixed pair")
        if (u, v) in matching:
            raise ValueError("reserved matching pairs must be free")
        if (u, v) in fixed and fixed[u, v] != bit:
            contradiction = True
        fixed[u, v] = bit
    if pairs != set(fixed) | set(symbolic):
        raise ValueError("every pair outside cells and matching must be fixed")

    clauses = {}

    def add(literals, source):
        key = tuple(sorted(set(literals), key=lambda lit: (abs(lit), lit)))
        if any(-lit in key for lit in key):
            return
        if len(key) > 2:
            raise NonQuadratic(f"active clause has width {len(key)}: {source}")
        clauses.setdefault(key, Clause(key, source))

    if contradiction:
        add((), ("conflicting fixed pairs",))
    for pair in sorted(set(fixed).intersection(symbolic)):
        lit = symbolic[pair]
        add((lit if fixed[pair] else -lit,), ("fixed cell pair", pair, fixed[pair]))

    skipped = 0
    cell_sets = tuple(set(cell) for cell in cells)
    for sign, family, forbidden in (("clique", state.positive, 1),
                                     ("independent", state.negative, 0)):
        for threshold, mask in family:
            if not 1 <= threshold <= 5 or mask < 0:
                raise ValueError("homogeneous thresholds must lie in 1..5")
            for witness in combinations(tuple(vertices(mask & state.remaining)), threshold):
                if any(len(set(witness) & cell) >= 3 for cell in cell_sets):
                    skipped += 1
                    continue
                literals = []
                for pair in combinations(witness, 2):
                    if pair in symbolic:
                        lit = symbolic[pair]
                        literals.append(-lit if forbidden else lit)
                    elif fixed[pair] != forbidden:
                        break
                else:
                    add(literals, (sign, threshold, witness))

    for number, budget in enumerate(state.budgets):
        constant = 0
        coefficients = {}
        for u, v, weight in budget.weights:
            pair = (u, v)
            if pair not in pairs or not isinstance(weight, int) or weight < 1:
                raise ValueError("invalid budget coefficient")
            if pair in symbolic:
                lit = symbolic[pair]
                var = abs(lit)
                if lit < 0:
                    constant += weight
                coefficients[var] = coefficients.get(var, 0) + (weight if lit > 0 else -weight)
            else:
                constant += weight * fixed[pair]
        active = tuple((v, a) for v, a in sorted(coefficients.items()) if a)
        low = constant + sum(min(0, a) for _, a in active)
        high = constant + sum(max(0, a) for _, a in active)
        if budget.lower <= low and high <= budget.upper:
            continue
        if high < budget.lower or budget.upper < low:
            add((), ("budget impossible", number, constant, active))
            continue
        if len(active) > 2:
            raise NonQuadratic(f"budget {number} has {len(active)} aggregated coordinates")
        for bits in product((0, 1), repeat=len(active)):
            value = constant + sum(a * bit for (_, a), bit in zip(active, bits))
            if not budget.lower <= value <= budget.upper:
                add(tuple(-var if bit else var for (var, _), bit in zip(active, bits)),
                    ("budget forbidden tuple", number, bits, constant, active))

    return CompiledCells(
        Kernel(tuple(names), tuple(clauses.values())),
        tuple((u, v, lit) for (u, v), lit in sorted(symbolic.items())),
        tuple((u, v, bit) for (u, v), bit in sorted(fixed.items()) if (u, v) not in symbolic),
        cells, charts, skipped)


def reconstruct(compiled, values):
    """Expand a coordinate assignment; caller checks SAT before accepting it."""
    values = tuple(values)
    if len(values) != len(compiled.kernel.edges) or any(bit not in (0, 1) for bit in values):
        raise ValueError("invalid coordinate assignment")
    return tuple(sorted(compiled.outer_fixed + tuple(
        (u, v, literal_value(lit, values)) for u, v, lit in compiled.pair_literals)))


def _direct_semantics(state, graph):
    """Independent direct graph predicate used only in the bounded checks."""
    values = {(u, v): bit for u, v, bit in graph}
    if any(values[u, v] != bit for u, v, bit in state.fixed):
        return False
    for forbidden, family in ((1, state.positive), (0, state.negative)):
        for threshold, support in family:
            for witness in combinations(tuple(vertices(support & state.remaining)), threshold):
                if all(values[pair] == forbidden for pair in combinations(witness, 2)):
                    return False
    return all(budget.lower <= sum(w * values[u, v] for u, v, w in budget.weights)
               <= budget.upper for budget in state.budgets)


def validate():
    """Bounded exhaustive and seeded semantic checks, not an order-43 run."""
    import json
    import random
    import sys
    from pathlib import Path

    recursive_dir = Path(__file__).resolve().parents[1] / "n43/d18/c"
    sys.path.insert(0, str(recursive_dir))
    from recursive_ramsey import Budget, State, canonical, derivative

    rng = random.Random(20261029)
    report = {"evidence_kind": "author validation; independent review recorded in quadratic_completion.md"}
    local = tuple(range(5))
    local_mask = (1 << 5) - 1
    local_state = State(local_mask, ((3, local_mask),), ((3, local_mask),))
    expected = set()
    for bits in product((0, 1), repeat=10):
        graph = tuple((*pair, bit) for pair, bit in zip(combinations(local, 2), bits))
        if _direct_semantics(local_state, graph):
            expected.add(graph)
    actual = []
    for chart in range(3):
        mapping = square_literals(local, chart)
        for values in product((0, 1), repeat=2):
            graph = tuple((u, v, literal_value(lit, values))
                          for (u, v), lit in sorted(mapping.items()))
            assert _direct_semantics(local_state, graph)
            actual.append(graph)
    assert len(expected) == len(actual) == len(set(actual)) == 12
    assert set(actual) == expected
    report["local_chart_partition"] = {"all_labelled_graphs_checked": 1024,
                                         "labelled_cycles": 12, "disjoint_charts": 3,
                                         "models_per_chart": 4}

    checks = {"cofactors": 0, "coordinate_assignments": 0, "satisfying_assignments": 0,
              "skipped_witnesses": 0, "budgeted_cofactors": 0}

    def check(state, cells, charts, matching=()):
        compiled = compile_cell_squares(state, cells, charts, matching)
        solutions = []
        for bits in product((0, 1), repeat=len(compiled.kernel.edges)):
            graph = reconstruct(compiled, bits)
            direct = _direct_semantics(state, graph)
            logical = all(any(literal_value(lit, bits) for lit in clause.literals)
                          for clause in compiled.kernel.clauses)
            assert direct == logical, (cells, charts, bits, state)
            if direct:
                solutions.append(bits)
            checks["coordinate_assignments"] += 1
        answer = solve_kernel(compiled.kernel)
        assert verify_answer(compiled.kernel, answer)
        assert answer.satisfiable == bool(solutions)
        if answer.satisfiable:
            assert _direct_semantics(state, reconstruct(compiled, answer.values))
        checks["cofactors"] += 1
        checks["satisfying_assignments"] += len(solutions)
        checks["skipped_witnesses"] += compiled.skipped_by_cell
        checks["budgeted_cofactors"] += bool(state.budgets)
        return compiled

    # All cross-pair assignments for one five-cell and two uncovered labels.
    # The same graph is tested against (4,4), (5,5), and overlapping supports.
    n = 7
    whole = (1 << n) - 1
    cross = tuple((u, v) for u in range(5) for v in (5, 6))
    for cross_bits in product((0, 1), repeat=len(cross)):
        fixed = tuple((*pair, bit) for pair, bit in zip(cross, cross_bits))
        for threshold in (4, 5):
            state = State(whole, ((3, local_mask), (threshold, whole)),
                          ((3, local_mask), (threshold, whole)), fixed)
            for chart in range(3):
                check(state, (local,), (chart,), ((5, 6),))
    report["exhaustive_one_cell"] = dict(checks)

    # Two simultaneous cells and a leftover matching, with arbitrary overlapping
    # obligations, cell fixings, weighted degrees, and total-edge budgets.
    before = dict(checks)
    domain = tuple(range(12))
    whole = (1 << 12) - 1
    cells = (tuple(range(5)), tuple(range(5, 10)))
    masks = tuple(sum(1 << v for v in cell) for cell in cells)
    internal = set(pair for cell in cells for pair in combinations(cell, 2))
    matching = ((10, 11),)
    outer = tuple(pair for pair in combinations(domain, 2)
                  if pair not in internal and pair not in matching)
    for trial in range(80):
        fixed = tuple((*pair, rng.randrange(2)) for pair in outer)
        pos = [(3, mask) for mask in masks] + [(5, whole)]
        neg = [(3, mask) for mask in masks] + [(5, whole)]
        if trial % 2:
            for family in (pos, neg):
                support = sum(1 << v for v in domain if rng.randrange(3))
                family.append((rng.randrange(2, 6), support))
        if trial % 3 == 0:
            edge = rng.choice(tuple(sorted(internal)))
            fixed += ((*edge, rng.randrange(2)),)
        budgets = []
        if trial % 4:
            for pivot in (0, 6, 10):
                weights = tuple((u, v, rng.randrange(1, 4))
                                for u, v in combinations(domain, 2) if pivot in (u, v))
                budgets.append(Budget(weights, rng.randrange(8), rng.randrange(14, 27)))
            weights = tuple((*pair, 1) for pair in combinations(domain, 2))
            budgets.append(Budget(weights, 20, 45))
        state = State(whole, tuple(pos), tuple(neg), fixed, tuple(budgets))
        for charts in product(range(3), repeat=2):
            check(state, cells, charts, matching)
    report["two_cell_seeded_semantics"] = {key: checks[key] - before[key] for key in checks}

    # Every partially fixed one-cell pattern, all three values {free,0,1}
    # independently on four specified pairs. This checks that chart substitution
    # does not erase conflicting fixed facts.
    before = dict(checks)
    fixed_candidates = ((0, 1), (0, 2), (1, 3), (2, 4))
    for pattern in product((-1, 0, 1), repeat=4):
        fixed = tuple((*pair, value) for pair, value in zip(fixed_candidates, pattern) if value >= 0)
        state = State(local_mask, ((3, local_mask),), ((3, local_mask),), fixed)
        for chart in range(3):
            check(state, (local,), (chart,))
    # Add an explicit conflicting duplicate to cover inconsistent state input.
    state = State(local_mask, ((3, local_mask),), ((3, local_mask),),
                  ((0, 1, 0), (0, 1, 1)))
    check(state, (local,), (0,))
    report["partial_cell_fixings"] = {key: checks[key] - before[key] for key in checks}

    rejected = {}

    def rejects(name, exception, call):
        try:
            call()
        except exception:
            rejected[name] = True
        else:
            raise AssertionError(f"missing rejection: {name}")

    rejects("missing_cell_premise", ValueError,
            lambda: compile_cell_squares(State(local_mask, (), ()), (local,), (0,)))
    rejects("overlapping_cells", ValueError,
            lambda: compile_cell_squares(local_state, (local, local), (0, 0)))
    rejects("matching_touches_cell", ValueError,
            lambda: compile_cell_squares(local_state, (local,), (0,), ((0, 1),)))
    # Three independent aggregate variables from two cells and an uncovered pair.
    fixed = tuple((*pair, 0) for pair in outer)
    budget = Budget(((0, 1, 1), (5, 6, 1), (10, 11, 1)), 1, 3)
    state = State(whole, tuple((3, mask) for mask in masks),
                  tuple((3, mask) for mask in masks), fixed, (budget,))
    rejects("three_coordinate_budget", NonQuadratic,
            lambda: compile_cell_squares(state, cells, (0, 0), matching))
    rejects("unconditioned_exterior", ValueError,
            lambda: compile_cell_squares(State(whole, state.positive, state.negative),
                                         cells, (0, 0), matching))
    report["contract_rejections"] = rejected
    report["totals"] = checks

    # An actual supplied order-42 residual after 18 completely assigned rows.
    # All remaining obligations and all differentiated degree intervals survive.
    from dataclasses import replace
    import hashlib
    evidence = recursive_dir / "exoo_uncontract_extension_evidence.json"
    snapshot = json.loads(evidence.read_text())
    matrix_text = snapshot["sources"]["exoo"]["downloaded_text"]
    assert hashlib.sha256(matrix_text.encode()).hexdigest() == snapshot["sources"]["exoo"]["sha256"]
    rows = matrix_text.splitlines()
    matrix = tuple(tuple(int(bit) for bit in row) for row in rows)
    assert len(matrix) == 42 and all(len(row) == 42 for row in matrix)
    assert all(matrix[u][u] == 0 for u in range(42))
    assert all(matrix[u][v] == matrix[v][u] for u, v in combinations(range(42), 2))
    all_mask = (1 << 42) - 1
    degrees = tuple(Budget(tuple((u, v, 1) for u, v in combinations(range(42), 2)
                                 if pivot in (u, v)), 18, 24) for pivot in range(42))
    original = State(all_mask, ((5, all_mask),), ((5, all_mask),), budgets=degrees)
    residual = canonical(original)
    for pivot in range(18):
        neighbors = sum(1 << v for v in vertices(residual.remaining)
                        if v != pivot and matrix[pivot][v])
        residual = canonical(derivative(residual, pivot, neighbors))
        assert residual is not None
    retained = tuple(range(18, 42))
    candidate_cells = {}
    for q in combinations(range(18), 2):
        if not matrix[q[0]][q[1]]:
            continue
        for p in combinations(range(18), 2):
            if matrix[p[0]][p[1]]:
                continue
            cell = tuple(v for v in retained if all(matrix[a][v] for a in q)
                         and all(not matrix[a][v] for a in p))
            if len(cell) == 5:
                candidate_cells.setdefault(cell, (q, p))
    fixtures = (
        ((18, 21, 24, 28, 31), (1, 4), (3, 13)),
        ((19, 22, 25, 29, 32), (2, 5), (4, 14)),
        ((27, 30, 34, 37, 40), (10, 14), (2, 12)),
    )
    for cell, q, p in fixtures:
        assert matrix[q[0]][q[1]] and not matrix[p[0]][p[1]]
        assert cell == tuple(v for v in retained if all(matrix[a][v] for a in q)
                             and all(not matrix[a][v] for a in p))
        assert cell in candidate_cells
    assert len(candidate_cells) == 14
    assert all(len(set().union(*(set(c) for c in four))) < 20
               for four in combinations(candidate_cells, 4))
    selected = tuple(item[0] for item in fixtures)
    occupied = set().union(*(set(cell) for cell in selected))
    assert len(occupied) == 15
    uncovered = tuple(v for v in retained if v not in occupied)
    matching = tuple(zip(uncovered[::2], uncovered[1::2]))
    internal = set(pair for cell in selected for pair in combinations(cell, 2))
    exterior = tuple((u, v, matrix[u][v]) for u, v in combinations(retained, 2)
                     if (u, v) not in internal and (u, v) not in matching)
    conditioned = replace(residual, fixed=residual.fixed + exterior)
    sat_charts = []
    clause_counts = []
    same_as_source = []
    for charts in product(range(3), repeat=3):
        compiled = compile_cell_squares(conditioned, selected, charts, matching)
        answer = solve_kernel(compiled.kernel)
        assert verify_answer(compiled.kernel, answer)
        clause_counts.append(len(compiled.kernel.clauses))
        if answer.satisfiable:
            reconstruction = reconstruct(compiled, answer.values)
            assert _direct_semantics(conditioned, reconstruction)
            complete = tuple((u, v, matrix[u][v]) for u, v in combinations(range(42), 2)
                             if u < 18 or v < 18) + reconstruction
            assert _direct_semantics(original, complete)
            sat_charts.append(charts)
            same_as_source.append(all(bit == matrix[u][v] for u, v, bit in reconstruction))
    assert sat_charts
    report["supplied_exoo42_residual"] = {
        "source_matrix_sha256": hashlib.sha256(matrix_text.encode()).hexdigest(),
        "processed_labels": list(range(18)), "remaining_labels": list(retained),
        "certified_size_five_cells": len(candidate_cells),
        "maximum_disjoint_packing_in_this_list": 3,
        "chosen_cells_and_anchor_pairs": fixtures,
        "positive_obligations": len(residual.positive),
        "negative_obligations": len(residual.negative),
        "differentiated_degree_budgets": len(residual.budgets),
        "conditioned_remaining_pairs": len(exterior),
        "free_internal_cell_pairs": 30, "uncovered_matching": matching,
        "chart_combinations_checked": len(clause_counts),
        "coordinates_per_chart": 10,
        "clause_count_min": min(clause_counts), "clause_count_max": max(clause_counts),
        "satisfiable_charts": sat_charts,
        "returned_models_equal_source": same_as_source,
        "all_returned_42_vertex_graphs_directly_verified": True,
        "scope": "one supplied order-42 residual; not the rooted degree-18 B24 branch",
    }
    path = Path(__file__).with_name("cell_square_completion_validation.json")
    path.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    validate()
