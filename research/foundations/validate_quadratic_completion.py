#!/usr/bin/env python3
"""Direct graph-semantic checks for the matching completion theorem.

Runs only on explicit invocation. This is author validation, not independent
review or an order-43 exclusion. Prints a small reproducible JSON summary.
"""

from dataclasses import replace
from itertools import combinations, product
import json
from pathlib import Path
import random
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "n43/d18/c"))
from recursive_ramsey import Budget, CompletionDP, State, canonical
from quadratic_completion import (Answer, Clause, Kernel, NonQuadratic,
                                  compile_matching, decide, solve_kernel,
                                  verify_answer)


def direct(state, assignment):
    """Evaluate graph definitions and budgets, with no clause compiler."""
    domain = tuple(v for v in range(state.remaining.bit_length())
                   if state.remaining >> v & 1)
    for u, v, bit in state.fixed:
        if assignment[u, v] != bit:
            return False
    for family, bit in ((state.positive, 1), (state.negative, 0)):
        for size, support in family:
            eligible = tuple(v for v in domain if support >> v & 1)
            for witness in combinations(eligible, size):
                if all(assignment[e] == bit for e in combinations(witness, 2)):
                    return False
    for budget in state.budgets:
        value = sum(w * assignment[u, v] for u, v, w in budget.weights)
        if not budget.lower <= value <= budget.upper:
            return False
    return True


def kernel_truth(kernel, bits):
    return all(any(bits[abs(x) - 1] == int(x > 0) for x in c.literals)
               for c in kernel.clauses)


def check_cofactor(state, matching):
    kernel = compile_matching(state, matching)
    expected = 0
    for bits in product((0, 1), repeat=len(kernel.edges)):
        graph = {(u, v): bit for u, v, bit in state.fixed}
        graph.update(zip(kernel.edges, bits))
        truth = direct(state, graph)
        assert truth == kernel_truth(kernel, bits)
        expected += truth
    answer = solve_kernel(kernel)
    assert answer.satisfiable == bool(expected)
    assert verify_answer(kernel, answer)
    if answer.satisfiable:
        graph = {(u, v): bit for u, v, bit in state.fixed}
        graph.update(zip(kernel.edges, answer.values))
        assert direct(state, graph)
    return expected


def exhaustive_global():
    reports = []
    total_graphs = total_cofactors = 0
    for p, q in ((3, 3), (3, 4), (4, 3), (4, 4), (5, 5)):
        for n in range(7):
            mask = (1 << n) - 1
            pairs = tuple(combinations(range(n), 2))
            matching = tuple((i, i + 1) for i in range(0, n - 1, 2))
            outer = tuple(e for e in pairs if e not in matching)
            count = 0
            for bits in product((0, 1), repeat=len(outer)):
                state = State(mask, ((p, mask),), ((q, mask),),
                              tuple((u, v, b) for (u, v), b in zip(outer, bits)))
                count += check_cofactor(state, matching)
                total_cofactors += 1
                total_graphs += 1 << len(matching)
            reports.append({"p": p, "q": q, "n": n, "count": count})
            if n <= 5:
                original = canonical(State(mask, ((p, mask),), ((q, mask),)))
                assert CompletionDP().count(original) == count
    return {"cofactors": total_cofactors, "graph_assignments": total_graphs,
            "counts": reports}


def random_residuals():
    rng = random.Random(20261029)
    total = 0
    for trial in range(600):
        # Nonconsecutive labels exercise the existing mask convention.
        domain = (0, 2, 3, 5, 6, 9)
        mask = sum(1 << v for v in domain)
        pairs = tuple(combinations(domain, 2))
        matching = ((0, 2), (3, 5), (6, 9))
        fixed = tuple((u, v, rng.randrange(2)) for u, v in pairs
                      if (u, v) not in matching)
        positive = tuple((rng.randrange(1, 6), rng.getrandbits(10))
                         for _ in range(rng.randrange(6)))
        negative = tuple((rng.randrange(1, 6), rng.getrandbits(10))
                         for _ in range(rng.randrange(6)))
        budgets = []
        for vertex in domain:
            weights = tuple((u, v, rng.randrange(1, 4)) for u, v in pairs
                            if vertex in (u, v))
            low = rng.randrange(5)
            budgets.append(Budget(weights, low, low + rng.randrange(10)))
        chosen = rng.sample(matching, 2)
        weights = tuple((u, v, rng.randrange(1, 5)) for u, v in chosen)
        budgets.append(Budget(weights, rng.randrange(4), rng.randrange(4, 10)))
        state = State(mask, positive, negative, fixed, tuple(budgets))
        check_cofactor(state, matching)
        total += 1
    return total


def implication_and_projection_checks():
    # Independent exhaustive truth evaluation of random 2-CNF and elimination.
    rng = random.Random(7229)
    clauses_checked = 0
    for _ in range(500):
        edges = ((0, 1), (2, 3), (4, 5), (6, 7))
        raw = []
        for _ in range(rng.randrange(16)):
            variables = rng.sample(range(1, 5), rng.randrange(1, 3))
            literals = tuple(v * rng.choice((-1, 1)) for v in variables)
            raw.append(Clause(literals, ("test",)))
        kernel = Kernel(edges, tuple(raw))
        count = sum(kernel_truth(kernel, bits) for bits in product((0, 1), repeat=4))
        answer = solve_kernel(kernel)
        assert answer.satisfiable == bool(count)
        assert verify_answer(kernel, answer)
        if not answer.satisfiable:
            assert not verify_answer(kernel, replace(answer, forward=()))
        elif count < 16:
            bad = next(bits for bits in product((0, 1), repeat=4)
                       if not kernel_truth(kernel, bits))
            assert not verify_answer(kernel, Answer(True, values=bad))

        # Davis-Putnam elimination of variable 4, independently expressed.
        retained = [c.literals for c in raw if 4 not in c.literals and -4 not in c.literals]
        positive = [tuple(x for x in c.literals if x != 4) for c in raw if 4 in c.literals]
        negative = [tuple(x for x in c.literals if x != -4) for c in raw if -4 in c.literals]
        for left in positive:
            for right in negative:
                union = tuple(set(left + right))
                if not any(-x in union for x in union):
                    retained.append(union)
        projected = Kernel(edges[:3], tuple(Clause(c, ("projected",)) for c in retained))
        for bits in product((0, 1), repeat=3):
            assert kernel_truth(projected, bits) == any(
                kernel_truth(kernel, bits + (last,)) for last in (0, 1))
        clauses_checked += len(raw)
    return {"formulas": 500, "input_clauses": clauses_checked}


def boundaries():
    # A single I6 obligation with only three matching edges unknown is OR3.
    matching = ((0, 1), (2, 3), (4, 5))
    fixed = tuple((u, v, 0) for u, v in combinations(range(6), 2)
                  if (u, v) not in matching)
    state = State(63, (), ((6, 63),), fixed)
    assert sum(direct(state, dict(((u, v), b) for u, v, b in fixed)
                      | dict(zip(matching, bits)))
               for bits in product((0, 1), repeat=3)) == 7
    try:
        compile_matching(state, matching)
    except NonQuadratic:
        pass
    else:
        raise AssertionError("threshold-six OR3 was silently approximated")

    # Check the equality and inequality gadgets in the hardness proof.
    for x, y in product((0, 1), repeat=2):
        def equal(a, b):
            return any((not a or not r) and (r or b)
                       and (not b or not s) and (s or a)
                       for r, s in product((0, 1), repeat=2))
        assert equal(x, y) == (x == y)
        unequal = any((x or y) and (not x or not z) and equal(y, z)
                      for z in (0, 1))
        assert unequal == (x != y)

    # C5 vertex covers: eleven models, none of weight at most two.
    matching = tuple((2 * i, 2 * i + 1) for i in range(5))
    fixed = tuple((u, v, 0) for u, v in combinations(range(10), 2)
                  if (u, v) not in matching)
    negative = tuple((4, sum(1 << v for edge in (matching[i], matching[(i + 1) % 5])
                            for v in edge)) for i in range(5))
    state = State(1023, (), negative, fixed)
    assert check_cofactor(state, matching) == 11
    bounded = replace(state, budgets=(Budget(tuple((u, v, 1) for u, v in matching), 0, 2),))
    assert not any(direct(bounded, {(u, v): b for u, v, b in fixed}
                         | dict(zip(matching, bits)))
                   for bits in product((0, 1), repeat=5))
    try:
        compile_matching(bounded, matching)
    except NonQuadratic:
        pass
    else:
        raise AssertionError("nonquadratic edge budget was silently dropped")

    # Malformed cofactors fail rather than acquiring new free variables.
    for bad in (((0, 1), (1, 2)), ((0, 1), (0, 1))):
        try:
            compile_matching(State(7, (), ()), bad)
        except ValueError:
            pass
        else:
            raise AssertionError("invalid matching accepted")
    try:
        compile_matching(State(7, (), ()), ((0, 1),))
    except ValueError:
        pass
    else:
        raise AssertionError("unconditioned pair accepted")
    return {"threshold_six_or_models": 7, "vertex_cover_models": 11,
            "unsupported_budget_rejected": True, "gadgets_verified": True}


def hardness_embeddings():
    """Check the actual graph realization and cross-pair consistency of gadgets."""
    formulas = [((1, -2, 3), (-1, 2, -3)),
                tuple(tuple(v * s for v, s in zip((1, 2, 3), signs))
                      for signs in product((-1, 1), repeat=3))]
    reports = []
    for original in formulas:
        next_variable = 3
        clauses, occurrences, gadgets = [], [], []

        def fresh():
            nonlocal next_variable
            next_variable += 1
            return next_variable

        def equal(x, y):
            a, b = fresh(), fresh()
            clauses.extend(((-x, -a), (a, y), (-y, -b), (b, x)))
            gadgets.append((x, y, a, b))

        for clause in original:
            copies = []
            for literal in clause:
                y = fresh()
                copies.append(y)
                occurrences.append((literal, y))
                if literal > 0:
                    equal(literal, y)
                else:
                    z = fresh()
                    occurrences.append((literal, z))
                    clauses.extend(((abs(literal), y), (-abs(literal), -z)))
                    equal(y, z)
            clauses.append(tuple(copies))

        matching = tuple((2 * i, 2 * i + 1) for i in range(next_variable))
        fixed = {}
        positive, negative = [], []
        used_variable_pairs = set()
        for clause in clauses:
            assert all(x > 0 for x in clause) or all(x < 0 for x in clause)
            variables = tuple(abs(x) for x in clause)
            for pair in combinations(sorted(variables), 2):
                assert pair not in used_variable_pairs
                used_variable_pairs.add(pair)
            endpoints = tuple(v for x in variables for v in matching[x - 1])
            support = sum(1 << v for v in endpoints)
            bit = int(clause[0] < 0)
            (positive if bit else negative).append((len(endpoints), support))
            for x, y in combinations(variables, 2):
                for u in matching[x - 1]:
                    for v in matching[y - 1]:
                        edge = tuple(sorted((u, v)))
                        assert edge not in fixed or fixed[edge] == bit
                        fixed[edge] = bit
        for edge in combinations(range(2 * next_variable), 2):
            if edge not in matching:
                fixed.setdefault(edge, 0)
        state = State((1 << (2 * next_variable)) - 1, tuple(positive), tuple(negative),
                      tuple((u, v, bit) for (u, v), bit in sorted(fixed.items())))
        satisfying = 0
        for bits in product((0, 1), repeat=3):
            values = {i + 1: bit for i, bit in enumerate(bits)}
            for literal, y in occurrences:
                values[y] = values[abs(literal)] if literal > 0 else 1 - values[-literal]
            for x, y, a, b in gadgets:
                values[a], values[b] = 1 - values[y], 1 - values[x]
            graph = fixed | {edge: values[i + 1] for i, edge in enumerate(matching)}
            expected = all(any(values[abs(x)] == int(x > 0) for x in c) for c in original)
            assert direct(state, graph) == expected
            satisfying += expected
        reports.append({"source_clauses": len(original), "matching_variables": next_variable,
                        "satisfying_source_assignments": satisfying})
    assert [r["satisfying_source_assignments"] for r in reports] == [6, 0]
    return reports


def coverage():
    matching = ((0, 1), (2, 3), (4, 5))
    state = State(63, ((3, 63),), ((3, 63),))
    model, tested = decide(state, matching)
    assert model is None and tested == 4096
    state = State(31, ((3, 31),), ((3, 31),))
    model, first = decide(state, matching[:2])
    assert model is not None and direct(state, {(u, v): b for u, v, b in model})
    return {"r33_order6_outer_cofactors": tested,
            "r33_order5_witness_cofactor": first}


def known42():
    """One supplied cofactor from the repository's already retained Exoo input."""
    source = (Path(__file__).resolve().parents[1]
              / "n43/d18/c/exoo_uncontract_extension_evidence.json")
    snapshot = json.loads(source.read_text())
    rows = snapshot["sources"]["exoo"]["downloaded_text"].splitlines()
    assert len(rows) == 42 and all(len(row) == 42 and set(row) <= {"0", "1"}
                                  for row in rows)
    assert all(rows[u][u] == "0" for u in range(42))
    assert all(rows[u][v] == rows[v][u] for u, v in combinations(range(42), 2))
    matching = tuple((i, i + 1) for i in range(0, 42, 2))
    fixed = tuple((u, v, int(rows[u][v])) for u, v in combinations(range(42), 2)
                  if (u, v) not in matching)
    domain = (1 << 42) - 1
    budgets = tuple(Budget(tuple((u, v, 1) for u, v in combinations(range(42), 2)
                                 if vertex in (u, v)), 18, 24)
                    for vertex in range(42))
    state = State(domain, ((5, domain),), ((5, domain),), fixed, budgets)
    kernel = compile_matching(state, matching)
    answer = solve_kernel(kernel)
    assert answer.satisfiable and verify_answer(kernel, answer)
    graph = {(u, v): bit for u, v, bit in fixed} | dict(zip(kernel.edges, answer.values))
    assert direct(state, graph)
    forced = []
    for variable, bit in enumerate(answer.values, 1):
        opposite = Clause((-variable if bit else variable,), ("probe",))
        probe = Kernel(kernel.edges, kernel.clauses + (opposite,))
        result = solve_kernel(probe)
        assert verify_answer(probe, result)
        if not result.satisfiable:
            forced.append(variable)
    return {"source": str(source.relative_to(Path(__file__).resolve().parents[2])),
            "order": 42, "fixed_pairs": len(fixed), "reserved_pairs": len(matching),
            "kernel_clauses": len(kernel.clauses), "forced_reserved_pairs": len(forced),
            "original_recovered": all(graph[u, v] == int(rows[u][v])
                                      for u, v in combinations(range(42), 2)),
            "direct_all_five_subsets_check": True,
            "scope": "one supplied cofactor; no search of order-42 or order-43 families"}


def main():
    report = {"scope": "author validation; no order-43 exclusion",
              "exhaustive": exhaustive_global(),
              "random_residual_states": random_residuals(),
              "implication_algebra": implication_and_projection_checks(),
              "boundaries": boundaries(), "hardness_graph_embeddings": hardness_embeddings(),
              "coverage": coverage(),
              "known_order42_cofactor": known42()}
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
