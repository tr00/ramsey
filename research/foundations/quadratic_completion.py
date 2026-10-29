#!/usr/bin/env python3
"""Matching cofactors of residual Ramsey states, with a checked 2-SAT terminal.

Research prototype; see quadratic_completion.md for scope and review status.
Accepts the existing recursive_ramsey.State by its attributes. No import-time
search, external dependencies, Ramsey seeds, or silent budget relaxation.
"""

from collections import deque
from dataclasses import dataclass, replace
from itertools import combinations, product


class NonQuadratic(ValueError):
    """This exact cofactor is outside the implemented quadratic fragment."""


@dataclass(frozen=True)
class Clause:
    literals: tuple
    source: tuple


@dataclass(frozen=True)
class Kernel:
    edges: tuple
    clauses: tuple


@dataclass(frozen=True)
class Answer:
    satisfiable: bool
    values: tuple = ()
    empty_clause: int | None = None
    variable: int | None = None
    forward: tuple = ()
    backward: tuple = ()


def vertices(mask):
    if mask < 0:
        raise ValueError("negative vertex mask")
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit


def compile_matching(state, reserved):
    """Compile one fully conditioned matching cofactor to exact clauses.

    Every nonreserved pair must occur in state.fixed. Reserved pairs must be
    free and form a matching. Reject unsupported active constraints instead of
    dropping them. Literals use signed, one-based reserved-edge indices.
    """
    domain = tuple(vertices(state.remaining))
    pairs = set(combinations(domain, 2))
    edges = tuple(sorted(reserved))
    if len(set(edges)) != len(edges) or any(e not in pairs for e in edges):
        raise ValueError("invalid or repeated reserved edge")
    if len({v for e in edges for v in e}) != 2 * len(edges):
        raise ValueError("reserved edges must form a matching")
    index = {e: i + 1 for i, e in enumerate(edges)}
    fixed = {}
    contradiction = False
    for u, v, bit in state.fixed:
        if (u, v) not in pairs or bit not in (0, 1):
            raise ValueError("invalid fixed pair")
        if (u, v) in index:
            raise ValueError("a reserved edge is already fixed")
        if (u, v) in fixed and fixed[u, v] != bit:
            contradiction = True
        fixed[u, v] = bit
    if pairs != set(fixed) | set(edges):
        raise ValueError("condition every nonreserved pair before compilation")
    if contradiction:
        return Kernel(edges, (Clause((), ("conflicting fixed pair",)),))

    clauses = {}

    def add(literals, source):
        key = tuple(sorted(set(literals), key=lambda x: (abs(x), x)))
        if any(-x in key for x in key):
            return
        if len(key) > 2:
            raise NonQuadratic(f"active clause has width {len(key)}: {source}")
        clauses.setdefault(key, Clause(key, source))

    for sign, family, forbidden_bit in (
        ("clique", state.positive, 1),
        ("independent", state.negative, 0),
    ):
        for threshold, mask in family:
            if threshold < 1 or mask < 0:
                raise ValueError("invalid obligation")
            for witness in combinations(tuple(vertices(mask & state.remaining)),
                                        threshold):
                literals = []
                for pair in combinations(witness, 2):
                    if pair in fixed:
                        if fixed[pair] != forbidden_bit:
                            break
                    else:
                        variable = index[pair]
                        literals.append(-variable if forbidden_bit else variable)
                else:
                    add(literals, (sign, threshold, witness))

    for number, budget in enumerate(state.budgets):
        weights = {}
        for u, v, coefficient in budget.weights:
            if (u, v) not in pairs or coefficient < 1 or not isinstance(coefficient, int):
                raise ValueError("invalid budget coefficient")
            weights[u, v] = weights.get((u, v), 0) + coefficient
        spent = sum(w * fixed[e] for e, w in weights.items() if e in fixed)
        active = tuple((index[e], w) for e, w in weights.items() if e in index)
        total = sum(w for _, w in active)
        lower, upper = max(0, budget.lower - spent), min(total, budget.upper - spent)
        if lower > upper:
            add((), ("budget impossible", number, spent))
        elif lower == 0 and upper == total:
            continue
        elif upper == 0 or lower == total:
            bit = int(lower == total)
            for variable, _ in active:
                add((variable if bit else -variable,), ("budget forced", number, bit))
        elif len(active) > 2:
            raise NonQuadratic(f"budget {number} has {len(active)} active variables")
        else:
            for bits in product((0, 1), repeat=len(active)):
                value = sum(w * bit for (_, w), bit in zip(active, bits))
                if not lower <= value <= upper:
                    add(tuple(-v if bit else v for (v, _), bit in zip(active, bits)),
                        ("budget forbidden tuple", number, bits))
    return Kernel(edges, tuple(clauses.values()))


def implications(clause):
    """All directed implication edges certified by a unary/binary clause."""
    if not clause.literals:
        return ()
    if len(clause.literals) == 1:
        a, = clause.literals
        return ((-a, a),)
    if len(clause.literals) == 2:
        a, b = clause.literals
        return ((-a, b), (-b, a))
    raise NonQuadratic("the implication solver accepts only clauses of width <= 2")


def solve_kernel(kernel):
    """Linear-time 2-SAT, returning a model or explicit contradiction paths."""
    literals = tuple(x for v in range(1, len(kernel.edges) + 1) for x in (v, -v))
    graph = {x: [] for x in literals}
    reverse = {x: [] for x in literals}
    for i, clause in enumerate(kernel.clauses):
        if not clause.literals:
            return Answer(False, empty_clause=i)
        for a, b in implications(clause):
            if a not in graph or b not in graph:
                raise ValueError("clause literal outside the kernel")
            graph[a].append((b, i))
            reverse[b].append(a)

    seen, order = set(), []
    for start in literals:
        if start in seen:
            continue
        seen.add(start)
        stack = [(start, iter(graph[start]))]
        while stack:
            vertex, iterator = stack[-1]
            item = next(iterator, None)
            if item is None:
                order.append(vertex)
                stack.pop()
            elif item[0] not in seen:
                seen.add(item[0])
                stack.append((item[0], iter(graph[item[0]])))
    component = {}
    for start in reversed(order):
        if start in component:
            continue
        number = len(component)
        component[start] = number
        stack = [start]
        while stack:
            vertex = stack.pop()
            for neighbor in reverse[vertex]:
                if neighbor not in component:
                    component[neighbor] = number
                    stack.append(neighbor)

    def path(start, end):
        parent = {start: None}
        queue = deque([start])
        while queue and end not in parent:
            vertex = queue.popleft()
            for neighbor, clause_index in graph[vertex]:
                if neighbor not in parent:
                    parent[neighbor] = (vertex, clause_index)
                    queue.append(neighbor)
        result = []
        current = end
        while current != start:
            previous, clause_index = parent[current]
            result.append((previous, current, clause_index))
            current = previous
        return tuple(reversed(result))

    for variable in range(1, len(kernel.edges) + 1):
        if component[variable] == component[-variable]:
            return Answer(False, variable=variable,
                          forward=path(variable, -variable),
                          backward=path(-variable, variable))
    values = tuple(int(component[v] > component[-v])
                   for v in range(1, len(kernel.edges) + 1))
    return Answer(True, values=values)


def verify_answer(kernel, answer):
    """Check a model or contradiction paths without recomputing SCCs."""
    if answer.satisfiable:
        if len(answer.values) != len(kernel.edges) or any(
                bit not in (0, 1) for bit in answer.values):
            return False
        return all(any(answer.values[abs(x) - 1] == int(x > 0)
                       for x in clause.literals) for clause in kernel.clauses)
    if answer.empty_clause is not None:
        return (0 <= answer.empty_clause < len(kernel.clauses)
                and not kernel.clauses[answer.empty_clause].literals)
    variable = answer.variable
    if variable is None or not 1 <= variable <= len(kernel.edges):
        return False

    def valid_path(steps, start, end):
        current = start
        for a, b, number in steps:
            if a != current or not 0 <= number < len(kernel.clauses):
                return False
            if (a, b) not in implications(kernel.clauses[number]):
                return False
            current = b
        return current == end

    return (valid_path(answer.forward, variable, -variable)
            and valid_path(answer.backward, -variable, variable))


def decide(state, reserved):
    """Exhaust the outer cofactors, solving each matching simultaneously.

    Returns (full edge assignment or None, number of tested cofactors).
    This minimal coverage driver is for small validation and supplied inputs;
    unsupported budgets raise NonQuadratic. It is not an order-43 search run.
    """
    reserved = tuple(reserved)
    fixed_pairs = {(u, v) for u, v, _ in state.fixed}
    outer = tuple(e for e in combinations(tuple(vertices(state.remaining)), 2)
                  if e not in fixed_pairs and e not in reserved)
    for tested, bits in enumerate(product((0, 1), repeat=len(outer)), 1):
        extra = tuple((u, v, bit) for (u, v), bit in zip(outer, bits))
        cofactor = replace(state, fixed=state.fixed + extra)
        kernel = compile_matching(cofactor, reserved)
        answer = solve_kernel(kernel)
        if not verify_answer(kernel, answer):
            raise AssertionError("invalid terminal certificate")
        if answer.satisfiable:
            final = cofactor.fixed + tuple((u, v, bit) for (u, v), bit
                                           in zip(kernel.edges, answer.values))
            return tuple(sorted(final)), tested
    return None, 1 << len(outer)
