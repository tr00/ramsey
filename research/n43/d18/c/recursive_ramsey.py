#!/usr/bin/env python3
"""Exact residual-obligation DP prototype. Import only; no research run on startup.

This is candidate research code, pending independent mathematical/code review.
Default Ramsey seeds are the repository's recorded premises, not proved here.
"""

from dataclasses import dataclass
from functools import lru_cache
from itertools import combinations


SEEDS = {(3, 3): 6, (3, 4): 9, (3, 5): 14,
         (4, 4): 18, (4, 5): 25}


@lru_cache(maxsize=None)
def ramsey_bound(p, q):
    """A valid upper bound, using the additive recurrence and recorded seeds."""
    if p < 1 or q < 1:
        raise ValueError("Ramsey parameters must be positive")
    if p == 1 or q == 1:
        return 1
    if p == 2:
        return q
    if q == 2:
        return p
    bound = ramsey_bound(p - 1, q) + ramsey_bound(p, q - 1)
    return min(bound, SEEDS.get(tuple(sorted((p, q))), bound))


def vertices(mask):
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit


def subsets(mask):
    """All submasks in increasing integer order, including the empty set."""
    part = 0
    while True:
        yield part
        if part == mask:
            return
        part = (part - mask) & mask


def mask_of(items):
    mask = 0
    for vertex in items:
        if vertex < 0:
            raise ValueError("negative vertex")
        mask |= 1 << vertex
    return mask


@dataclass(frozen=True, order=True)
class Budget:
    """Integer lower/upper bound on a nonnegative weighted edge sum."""
    weights: tuple  # sorted (u, v, positive integer coefficient), u < v
    lower: int
    upper: int


@dataclass(frozen=True)
class State:
    remaining: int
    positive: tuple  # (forbidden clique size, support bitmask)
    negative: tuple  # (forbidden independent-set size, support bitmask)
    fixed: tuple = ()  # (u, v, edge bit)
    budgets: tuple = ()


def _antichain(clauses, remaining):
    retained = set()
    for threshold, support in clauses:
        if threshold < 1 or support < 0:
            raise ValueError("invalid obligation")
        support &= remaining
        if support.bit_count() < threshold:
            continue
        if threshold == 1:
            return None
        retained.add((threshold, support))
    return tuple(sorted((k, x) for k, x in retained if not any(
        (ell, y) != (k, x) and ell <= k and x & y == x
        for ell, y in retained)))


def canonical(state):
    """Return an equivalent canonical state, or None for an elementary failure."""
    if state.remaining < 0:
        raise ValueError("negative remaining mask")
    pos = _antichain(state.positive, state.remaining)
    neg = _antichain(state.negative, state.remaining)
    if pos is None or neg is None:
        return None
    fixed = {}
    for u, v, value in state.fixed:
        if u < 0 or u >= v or value not in (0, 1):
            raise ValueError("invalid fixed pair")
        if not ((state.remaining >> u) & (state.remaining >> v) & 1):
            continue
        if (u, v) in fixed and fixed[u, v] != value:
            return None
        fixed[u, v] = value
    budgets = {}
    for budget in state.budgets:
        weights = {}
        for u, v, coefficient in budget.weights:
            if u < 0 or u >= v or coefficient < 1:
                raise ValueError("invalid budget coefficient")
            if not ((state.remaining >> u) & (state.remaining >> v) & 1):
                raise ValueError("budget has an already forgotten pair")
            weights[u, v] = weights.get((u, v), 0) + coefficient
        key = tuple((u, v, coefficient) for (u, v), coefficient
                    in sorted(weights.items()))
        lower = max(0, budget.lower)
        upper = min(sum(weights.values()), budget.upper)
        if key in budgets:
            lower = max(lower, budgets[key][0])
            upper = min(upper, budgets[key][1])
        if lower > upper:
            return None
        budgets[key] = (lower, upper)
    normalized_budgets = tuple(sorted(Budget(key, lower, upper)
        for key, (lower, upper) in budgets.items()
        if lower > 0 or upper < sum(w for _, _, w in key)))
    return State(state.remaining, pos, neg,
                 tuple((u, v, value) for (u, v), value in sorted(fixed.items())),
                 normalized_budgets)


def capacity_failure(state):
    """Find a local Ramsey contradiction on an overlapping obligation support."""
    for p, x in state.positive:
        for q, y in state.negative:
            support = x & y
            bound = ramsey_bound(p, q)
            if support.bit_count() >= bound:
                return (p, x, q, y, support, bound)
    return None


def row_choices(state, pivot):
    """Every incident row compatible with fixed pairs, once and deterministically."""
    if not (state.remaining >> pivot) & 1:
        raise ValueError("pivot is absent")
    rest = state.remaining ^ (1 << pivot)
    yes = no = 0
    for u, v, value in state.fixed:
        if pivot not in (u, v):
            continue
        other = v if u == pivot else u
        if value:
            yes |= 1 << other
        else:
            no |= 1 << other
    for free in subsets(rest & ~(yes | no)):
        yield yes | free


def derivative(state, pivot, neighbors):
    """Forget a fully assigned row, transporting all homogeneous obligations."""
    rest = state.remaining ^ (1 << pivot)
    if not (state.remaining >> pivot) & 1 or neighbors & ~rest:
        raise ValueError("invalid row")
    for u, v, value in state.fixed:
        if pivot in (u, v):
            other = v if u == pivot else u
            if ((neighbors >> other) & 1) != value:
                return None
    nonneighbors = rest ^ neighbors
    out = []
    for clauses, eligible in ((state.positive, neighbors),
                              (state.negative, nonneighbors)):
        transported = []
        for threshold, support in clauses:
            transported.append((threshold, support & rest))
            if support & (1 << pivot):
                transported.append((threshold - 1, support & eligible))
        out.append(tuple(transported))
    budgets = []
    for budget in state.budgets:
        spent = 0
        weights = []
        for u, v, coefficient in budget.weights:
            if pivot in (u, v):
                other = v if u == pivot else u
                spent += coefficient * ((neighbors >> other) & 1)
            else:
                weights.append((u, v, coefficient))
        budgets.append(Budget(tuple(weights), budget.lower - spent,
                              budget.upper - spent))
    return canonical(State(rest, *out, state.fixed, tuple(budgets)))


def state_data(state):
    return {"remaining": state.remaining, "positive": list(state.positive),
            "negative": list(state.negative), "fixed": list(state.fixed),
            "budgets": [{"weights": list(b.weights), "lower": b.lower,
                         "upper": b.upper} for b in state.budgets]}


def state_from_data(data):
    return State(data["remaining"], tuple(map(tuple, data["positive"])),
                 tuple(map(tuple, data["negative"])),
                 tuple(map(tuple, data["fixed"])),
                 tuple(Budget(tuple(map(tuple, b["weights"])),
                              b["lower"], b["upper"]) for b in data["budgets"]))


class CompletionDP:
    """Exact labelled completion counts and an explicit recurrence DAG.

    There is deliberately no CLI or implicit order-43 execution. A DAG is
    candidate evidence until a separate checker and its premises are audited.
    """

    def __init__(self):
        self.nodes = []
        self.memo = {}

    def count(self, raw):
        state = canonical(raw)
        if state is None:
            return 0
        return self.nodes[self._visit(state)]["count"]

    def certificate(self, raw):
        state = canonical(raw)
        root = None if state is None else self._visit(state)
        return {"format": "ramsey-residual-dag-v1", "input": state_data(raw),
                "root": root, "nodes": self.nodes,
                "seeds": [[p, q, bound] for (p, q), bound in sorted(SEEDS.items())]}

    def _visit(self, state):
        if state in self.memo:
            return self.memo[state]
        index = len(self.nodes)
        self.memo[state] = index
        node = {"state": state_data(state), "count": 0}
        self.nodes.append(node)
        failure = capacity_failure(state)
        if failure:
            node.update(kind="capacity", witness=list(failure))
        elif not state.remaining:
            node.update(kind="empty", count=1)
        else:
            pivot = next(vertices(state.remaining))
            rows = []
            for neighbors in row_choices(state, pivot):
                child = derivative(state, pivot, neighbors)
                child_id = None if child is None else self._visit(child)
                rows.append([neighbors, child_id])
                if child_id is not None:
                    node["count"] += self.nodes[child_id]["count"]
            node.update(kind="branch", pivot=pivot, rows=rows)
        return index


def induced_budget(domain, lower, upper):
    return Budget(tuple((u, v, 1) for u, v in combinations(vertices(domain), 2)),
                  lower, upper)


def degree_budget(domain, vertex, lower, upper):
    return Budget(tuple(sorted((min(vertex, v), max(vertex, v), 1)
                              for v in vertices(domain) if v != vertex)), lower, upper)


def d18c_initial(a_adjacency, cross_interval=None, use_reviewed_budgets=False):
    """Fixed connected A on labels 1..18, pivot 0, B labels 19..42.

    No enumeration or DP is run. Maximal neighborhood-density selection is
    not encoded; every selected d18c root is among this broader class.
    Extra reviewed budgets are opt-in and retain their census premises.
    """
    if len(a_adjacency) != 18:
        raise ValueError("A must have 18 vertices")
    a_domain = (1 << 18) - 1
    for u, row in enumerate(a_adjacency):
        if row < 0 or row & ~a_domain or row & (1 << u):
            raise ValueError("invalid A adjacency")
        for v in range(18):
            if ((row >> v) & 1) != ((a_adjacency[v] >> u) & 1):
                raise ValueError("asymmetric A adjacency")
    reached = 1
    while True:
        expanded = reached
        for u in vertices(reached):
            expanded |= a_adjacency[u]
        if expanded == reached:
            break
        reached = expanded
    if reached != a_domain:
        raise ValueError("A must be connected")
    for size, value in ((4, 1), (5, 0)):
        for chosen in combinations(range(18), size):
            if all(((a_adjacency[u] >> v) & 1) == value
                   for u, v in combinations(chosen, 2)):
                raise ValueError("A violates K4/I5 freeness")
    whole = (1 << 43) - 1
    b_domain = whole & ~((1 << 19) - 1)
    fixed = [(0, u, int(u <= 18)) for u in range(1, 43)]
    fixed += [(u + 1, v + 1, (a_adjacency[u] >> v) & 1)
              for u, v in combinations(range(18), 2)]
    budgets = [degree_budget(whole, u, 18, 24) for u in range(43)]
    if cross_interval is not None:
        lower, upper = cross_interval
        budgets.append(Budget(tuple((u, v, 1) for u in range(1, 19)
                                    for v in range(19, 43)), lower, upper))
    if use_reviewed_budgets:
        budgets.append(induced_budget(b_domain, 144, 160))
    return State(whole, ((5, whole),), ((5, whole),),
                 tuple(fixed), tuple(budgets))
