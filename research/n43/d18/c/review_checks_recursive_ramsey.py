#!/usr/bin/env python3
"""Independent reviewer checks for research/n43/d18/c/recursive_ramsey.md.

Distinct from the author's validate_recursive_ramsey.py: randomized arbitrary
mixed states with weighted budgets (Claims 1-4), the Claim 5 interface formula
(8) checked end to end against direct elimination on a small analogue and on
the d18 fixture under random rows, plus the Claim 6 count bound at the B phase.
"""

import importlib.util
import itertools
import random
import sys
from pathlib import Path

SRC = Path(__file__).resolve().parent / "recursive_ramsey.py"
spec = importlib.util.spec_from_file_location("rr", SRC)
rr = importlib.util.module_from_spec(spec)
sys.modules["rr"] = rr
spec.loader.exec_module(rr)

results = {}


def labels(mask):
    return [v for v in range(mask.bit_length()) if mask & (1 << v)]


def pairs(mask):
    return list(itertools.combinations(labels(mask), 2))


def assignments(mask):
    edges = pairs(mask)
    for bits in range(1 << len(edges)):
        yield {e: (bits >> i) & 1 for i, e in enumerate(edges)}


def obeys(state, graph):
    """Direct reading of the note's semantics for one labelled graph."""
    for colour, clauses in ((1, state.positive), (0, state.negative)):
        for k, support in clauses:
            for chosen in itertools.combinations(labels(support & state.remaining), k):
                if all(graph[u, v] == colour for u, v in itertools.combinations(chosen, 2)):
                    return False
    if any(graph[u, v] != value for u, v, value in state.fixed if (u, v) in graph):
        return False
    for budget in state.budgets:
        total = sum(w * graph[u, v] for u, v, w in budget.weights)
        if not budget.lower <= total <= budget.upper:
            return False
    return True


def direct_count(state):
    return sum(obeys(state, g) for g in assignments(state.remaining))


# -------------------------------------------------- randomized fuzz (Claims 1-4)
random.seed(20261027)
fuzz_states = graph_cases = dp_cases = 0
for _ in range(2500):
    n = random.randint(1, 5)
    rem = (1 << n) - 1
    pos, neg = [], []
    for _ in range(random.randint(0, 3)):
        k = random.randint(1, 5)
        # supports may exceed the current U: normalization must intersect them
        x = random.randint(0, (1 << (n + 2)) - 1)
        (pos if random.random() < 0.5 else neg).append((k, x))
    fixed, seen = [], {}
    for u, v in pairs(rem):
        if random.random() < 0.25:
            value = random.randint(0, 1)
            if (u, v) in seen:
                continue
            seen[u, v] = value
            fixed.append((u, v, value))
    budgets = []
    for _ in range(random.randint(0, 2)):
        weights = tuple((u, v, random.randint(1, 3)) for u, v in pairs(rem)
                        if random.random() < 0.5)
        budgets.append(rr.Budget(weights, random.randint(-2, 4), random.randint(-1, 6)))
    state = rr.State(rem, tuple(pos), tuple(neg), tuple(fixed), tuple(budgets))

    norm = rr.canonical(state)
    for g in assignments(rem):
        assert obeys(state, g) == (False if norm is None else obeys(norm, g)), state
        graph_cases += 1
    count = rr.CompletionDP().count(state)
    assert count == direct_count(state), (state, count, direct_count(state))
    dp_cases += 1
    if fixed:
        u, v, value = fixed[0]
        bad = rr.State(rem, tuple(pos), tuple(neg),
                       tuple(fixed) + ((u, v, 1 - value),), tuple(budgets))
        assert rr.canonical(bad) is None
    fuzz_states += 1
results["fuzz_states"] = fuzz_states
results["fuzz_normalization_graph_cases"] = graph_cases
results["fuzz_dp_vs_direct_states"] = dp_cases


# ------------------------------------------- Claim 5 formula (8), small (4,4) analogue
def process_edge(a_edges):
    """Edges of the processed set {root} u A: root joined to all of A."""
    def edge(x, y):
        if x == 0 or y == 0:
            return x != y
        return tuple(sorted((x, y))) in a_edges
    return edge


def expected_family(processed, edge, row_of, bmask, p, q):
    """The obligation family of formula (8) generalised to thresholds p,q."""
    exp_pos, exp_neg = [], []
    for size in range(0, max(p, q) + 1):
        for S in itertools.combinations(processed, size):
            es = list(itertools.combinations(S, 2))
            if p - size >= 1 and all(edge(x, y) for x, y in es):
                m = bmask
                for x in S:
                    m &= row_of[x]
                exp_pos.append((p - size, m))
            if q - size >= 1 and not any(edge(x, y) for x, y in es):
                m = bmask
                for x in S:
                    m &= bmask ^ row_of[x]
                exp_neg.append((q - size, m))
    return exp_pos, exp_neg


rng = random.Random(7)
# root 0, A = path on labels 1..3 (K3-free, I4-free), B = labels 4..6, p = q = 4
a_path = {(1, 2), (2, 3)}
mini_fixed = [(0, a, 1) for a in (1, 2, 3)] + [(0, b, 0) for b in (4, 5, 6)] + \
    [(1, 2, 1), (1, 3, 0), (2, 3, 1)]
mini_free = [(a, b) for a in (1, 2, 3) for b in (4, 5, 6)] + \
    list(itertools.combinations((4, 5, 6), 2))
U7 = (1 << 7) - 1
mini_cases = 0
for _ in range(40):
    r = {a: rng.randint(0, 7) for a in (1, 2, 3)}  # B rows, bits 0..2 -> labels 4..6
    initial = rr.State(U7, ((4, U7),), ((4, U7),), tuple(mini_fixed), ())
    st = rr.canonical(initial)
    st = rr.derivative(st, 0, 0b0001110)  # root row = A only
    assert st is not None
    for a in (1, 2, 3):
        neigh = 0
        for other in labels(st.remaining):
            if other == a:
                continue
            if other < 4:
                if (min(a, other), max(a, other)) in a_path:
                    neigh |= 1 << other
            elif (r[a] >> (other - 4)) & 1:
                neigh |= 1 << other
        st = rr.derivative(st, a, neigh)
        assert st is not None
    got = rr.canonical(st)

    row_of = {0: 0, **{a: (r[a] << 4) for a in (1, 2, 3)}}
    exp_pos, exp_neg = expected_family([0, 1, 2, 3], process_edge(a_path),
                                       row_of, 0b1110000, 4, 4)
    want = rr.canonical(rr.State(0b1110000, tuple(exp_pos), tuple(exp_neg), (), ()))
    assert got == want, (r, got, want)

    count = rr.CompletionDP().count(initial)
    direct = 0
    fixed_value = {(u, v): val for u, v, val in mini_fixed}
    state7 = rr.State(U7, ((4, U7),), ((4, U7),), tuple(mini_fixed), ())
    for bits in range(1 << len(mini_free)):
        graph = dict(fixed_value)
        for i, e in enumerate(mini_free):
            graph[e] = (bits >> i) & 1
        full = {e: graph.get(e, 0) for e in pairs(U7)}
        if obeys(state7, full):
            direct += 1
    assert count == direct, (r, count, direct)
    mini_cases += 1
results["mini_claim5_formula_and_count_cases"] = mini_cases


# -------------------------------- Claim 5 full d18 fixture: formula (8) + Claim 6 bound
residues = {1, 2, 4, 8, 9, 13, 15, 16}
paley_edges = [(u, v) for u, v in itertools.combinations(range(17), 2)
               if (u - v) % 17 in residues] + [(0, 17)]
a_rows = [0] * 18
for u, v in paley_edges:
    a_rows[u] |= 1 << v
    a_rows[v] |= 1 << u
a_edges = set(tuple(sorted((u + 1, v + 1))) for u, v in paley_edges)
budgetful = rr.d18c_initial(a_rows)
whole = budgetful.remaining
assert whole.bit_count() == 43
assert len(rr.canonical(budgetful).budgets) == 43
# degree-window budget transport at the root
st = rr.canonical(budgetful)
root_budget = [b for b in st.budgets
               if all(u == 0 for u, v, _ in b.weights) and len(b.weights) == 42]
assert len(root_budget) == 1 and (root_budget[0].lower, root_budget[0].upper) == (18, 24)
child = rr.derivative(st, 0, sum(1 << a for a in range(1, 19)))
assert child is not None
assert len(child.budgets) == 42  # root budget satisfied exactly by its row and dropped
results["degree_budget_transport"] = "43 -> 42 budgets; root row spends exactly 18"

# formula (8) on obligations only (the note imposes the degree window optionally)
initial = rr.State(whole, budgetful.positive, budgetful.negative, budgetful.fixed, ())
bmask = sum(1 << y for y in range(19, 43))
rng2 = random.Random(20261022)
accepted = rejected = 0
max_pos = max_neg = 0
for trial in range(60):
    dense = trial % 3 != 2  # two thirds dense rows (survivors), one third sparse
    r = {}
    for a in range(1, 19):
        size = rng2.randint(20, 24) if dense else rng2.randint(0, 24)
        r[a] = rng2.sample(range(19, 43), size)
    rmask = {a: sum(1 << v for v in r[a]) for a in range(1, 19)}
    st = rr.canonical(initial)
    st = rr.derivative(st, 0, sum(1 << a for a in range(1, 19)))
    assert st is not None
    for a in range(1, 19):
        if st is None:
            break
        neigh = 0
        for other in labels(st.remaining):
            if other == a:
                continue
            if 1 <= other <= 18:
                if (min(a, other), max(a, other)) in a_edges:
                    neigh |= 1 << other
            elif other in r[a]:
                neigh |= 1 << other
        st = rr.derivative(st, a, neigh)
    got = None if st is None else rr.canonical(st)

    row_of = {0: 0, **rmask}
    exp_pos, exp_neg = expected_family([0] + list(range(1, 19)),
                                       process_edge(a_edges), row_of, bmask, 5, 5)
    want = rr.canonical(rr.State(bmask, tuple(exp_pos), tuple(exp_neg), (), ()))
    assert (got is None) == (want is None), (trial, dense, got, want)
    if got is None:
        rejected += 1
        continue
    assert got == want, (trial, got.positive[:6], want.positive[:6],
                         got.negative[:6], want.negative[:6])
    assert len(got.positive) <= 988 and len(got.negative) <= 988, \
        (trial, len(got.positive), len(got.negative))
    max_pos = max(max_pos, len(got.positive))
    max_neg = max(max_neg, len(got.negative))
    accepted += 1
assert accepted > 0 and rejected > 0, (accepted, rejected)
results["claim5_formula_d18_accepted_rejected"] = [accepted, rejected]
results["max_obligations_per_colour_over_random_rows"] = [max_pos, max_neg]

# bound table cross-check against an independent plain recurrence
def ref(p, q):
    if min(p, q) == 1:
        return 1
    if min(p, q) == 2:
        return max(p, q)
    seeds = {(3, 3): 6, (3, 4): 9, (3, 5): 14, (4, 4): 18, (4, 5): 25}
    key = (min(p, q), max(p, q))
    return min(seeds.get(key, 10 ** 9), ref(p - 1, q) + ref(p, q - 1))

cells = 0
for p in range(1, 9):
    for q in range(1, 9):
        assert rr.ramsey_bound(p, q) == ref(p, q), (p, q, rr.ramsey_bound(p, q), ref(p, q))
        assert rr.ramsey_bound(p, q) == rr.ramsey_bound(q, p)
        cells += 1
assert rr.ramsey_bound(5, 5) == 50
results["bound_table_cells"] = cells

print("PASS", results)
