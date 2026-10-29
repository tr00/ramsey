#!/usr/bin/env python3
"""Exact endpoint-preserving interface for a marked local contraction parent.

No search runs on import. The endpoint rows remain distinct: local safety does
not permit replacing them by their union in an ambient Ramsey completion.
The direct rectangle kernel is checked by the existing exact row derivative.
"""

from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
import sys

BASE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(BASE))

from recursive_ramsey import State, Budget, canonical, derivative, d18c_initial
from safe_contractions import marked_split


def _homogeneous(adj, group, edge):
    return all((v in adj[u]) == edge for u, v in combinations(group, 2))


def _validate_graph(adj):
    if not adj or any(not isinstance(u, int) or u < 0 for u in adj):
        raise ValueError("graph needs nonnegative integer vertex labels")
    for u, neighbors in adj.items():
        if u in neighbors or not set(neighbors) <= set(adj):
            raise ValueError("graph has a loop or absent neighbor")
        if any(u not in adj[v] for v in neighbors):
            raise ValueError("graph is asymmetric")
    for size, edge in ((4, True), (5, False)):
        if any(_homogeneous(adj, group, edge) for group in combinations(adj, size)):
            raise ValueError("graph violates local K4/I5 constraints")


@dataclass(frozen=True)
class SplitInterface:
    """Canonical local row order: C singleton labels, then the two endpoints."""
    parent_vertices: tuple
    marked: int
    singletons: tuple
    endpoints: tuple
    P_u: frozenset
    P_v: frozenset
    vertices: tuple
    adjacency: tuple  # local bit rows in `vertices` order

    def graph(self):
        return {u: {self.vertices[j] for j in range(len(self.vertices))
                    if self.adjacency[i] >> j & 1}
                for i, u in enumerate(self.vertices)}


def split_parent(parent, z, P_u, P_v, *, require_d18=True):
    """Validate a legal local inverse split, retaining both endpoint labels.

    `parent` is a dict of neighbor sets. In the d18 specialization it has order
    17. Attachments cover N_H(z), may overlap, and must give a connected local
    K4/I5-free split. Tiny analogues can explicitly set require_d18=False.
    """
    parent = {u: set(row) for u, row in parent.items()}
    _validate_graph(parent)
    if require_d18 and len(parent) != 17:
        raise ValueError("d18cr requires an order-17 local parent")
    if z not in parent:
        raise ValueError("marked vertex is absent")
    left, right = set(P_u), set(P_v)
    if left | right != parent[z]:
        raise ValueError("attachments must cover exactly the marked neighbors")
    C = set(parent) - {z}
    if not _homogeneous(parent, left & right, False):
        raise ValueError("common attachment must be independent")
    for missed in (C - left, C - right):
        if any(_homogeneous(parent, group, False) for group in combinations(missed, 4)):
            raise ValueError("each endpoint's missed core must be I4-free")
    split, endpoints = marked_split(parent, z, left, right)
    _validate_graph(split)
    reached = {next(iter(split))}
    while True:
        expanded = reached | set().union(*(split[u] for u in reached))
        if expanded == reached:
            break
        reached = expanded
    if reached != set(split):
        raise ValueError("split neighborhood must be connected")
    singletons = tuple(sorted(C))
    labels = singletons + endpoints
    index = {u: i for i, u in enumerate(labels)}
    adjacency = tuple(sum(1 << index[v] for v in split[u]) for u in labels)
    return SplitInterface(tuple(sorted(parent)), z, singletons, endpoints,
                          frozenset(left), frozenset(right), labels, adjacency)


def _rows(layout, rows, b_size):
    if not isinstance(b_size, int) or b_size < 0:
        raise ValueError("B size must be a nonnegative integer")
    if set(rows) != set(layout.vertices):
        raise ValueError("supply exactly one B row for each singleton and endpoint")
    domain = (1 << b_size) - 1
    for row in rows.values():
        if not isinstance(row, int) or row < 0 or row & ~domain:
            raise ValueError("row is outside the B domain")
    return domain


def rectangle_obligations(layout, rows, *, b_size=24):
    """Exact unnormalized forbidden rectangles, using local B labels 0..b-1.

    A clique Q forbids K_(5-|Q|) on its common row; an independent I forbids
    I_(5-|I|) on its common missed row. Root adjacency contributes I4(B).
    Positive endpoint cases allow neither, one, or both endpoints; independent
    cases allow at most one because the endpoints are adjacent.
    """
    domain = _rows(layout, rows, b_size)
    adj = layout.graph()
    C = layout.singletons
    u, v = layout.endpoints
    positive = [(5, domain)]
    negative = [(4, domain)]

    def common(group):
        support = domain
        for label in group:
            support &= rows[label]
        return support

    def missed(group):
        support = domain
        for label in group:
            support &= domain ^ rows[label]
        return support

    for size in range(1, 4):
        for group in combinations(C, size):
            if _homogeneous(adj, group, True):
                positive.append((5 - size, common(group)))
    for endpoint, attachment in ((u, layout.P_u), (v, layout.P_v)):
        for size in range(3):
            for group in combinations(sorted(attachment), size):
                if _homogeneous(adj, group, True):
                    positive.append((4 - size, common((endpoint,) + group)))
    for group in [()] + [(w,) for w in sorted(layout.P_u & layout.P_v)]:
        positive.append((3 - len(group), common((u, v) + group)))

    for size in range(1, 5):
        for group in combinations(C, size):
            if _homogeneous(adj, group, False):
                negative.append((5 - size, missed(group)))
    for endpoint, attachment in ((u, layout.P_u), (v, layout.P_v)):
        for size in range(4):
            for group in combinations(sorted(set(C) - attachment), size):
                if _homogeneous(adj, group, False):
                    negative.append((4 - size, missed((endpoint,) + group)))
    return tuple(positive), tuple(negative)


def rectangle_kernel(layout, rows, *, b_size=24):
    """Canonical exact B-only state, or None for a threshold-one failure.

    This kernel includes no optional numerical budgets. It is equivalent to
    the original rooted ambient K5/I5 problem with these fixed local rows.
    """
    positive, negative = rectangle_obligations(layout, rows, b_size=b_size)
    return canonical(State((1 << b_size) - 1, positive, negative))


def initial_state(layout, *, b_size=24, degree_window=False, cross_interval=None):
    """Construct an exact fixed-split completion state; do not run the DP.

    With the degree window, reuse the reviewed d18c initializer, including its
    recorded 43-vertex degree premise. Generic tiny analogues have no window.
    """
    n = len(layout.vertices)
    if degree_window:
        if n != 18 or b_size != 24:
            raise ValueError("18..24 degrees apply here only to the order-43 problem")
        return d18c_initial(layout.adjacency, cross_interval=cross_interval)
    if b_size < 0:
        raise ValueError("negative B size")
    whole = (1 << (1 + n + b_size)) - 1
    fixed = [(0, w, int(w <= n)) for w in range(1, 1 + n + b_size)]
    fixed += [(i + 1, j + 1, (layout.adjacency[i] >> j) & 1)
              for i, j in combinations(range(n), 2)]
    budgets = ()
    if cross_interval is not None:
        lower, upper = cross_interval
        budgets = (Budget(tuple((i, j, 1) for i in range(1, n + 1)
                                for j in range(n + 1, n + 1 + b_size)), lower, upper),)
    return State(whole, ((5, whole),), ((5, whole),), tuple(fixed), budgets)


def recurrence_kernel(layout, rows, *, b_size=24, degree_window=False,
                      cross_interval=None):
    """Eliminate the root and 16+2 rows using the accepted exact derivative.

    B labels are shifted back to 0..b-1 at the end. Optional degree and cross
    budgets transport exactly, retaining endpoint degrees separately.
    """
    _rows(layout, rows, b_size)
    n = len(layout.vertices)
    shift = n + 1
    state = canonical(initial_state(layout, b_size=b_size, degree_window=degree_window,
                                    cross_interval=cross_interval))
    if state is None:
        return None
    state = derivative(state, 0, ((1 << n) - 1) << 1)
    for i, label in enumerate(layout.vertices):
        if state is None:
            return None
        neighbors = (layout.adjacency[i] << 1) | (rows[label] << shift)
        state = derivative(state, i + 1, neighbors & state.remaining & ~(1 << (i + 1)))
    if state is None:
        return None
    positive = tuple((k, mask >> shift) for k, mask in state.positive)
    negative = tuple((k, mask >> shift) for k, mask in state.negative)
    fixed = tuple((u - shift, v - shift, value) for u, v, value in state.fixed)
    budgets = tuple(Budget(tuple((u - shift, v - shift, w) for u, v, w in budget.weights),
                           budget.lower, budget.upper) for budget in state.budgets)
    return canonical(State(state.remaining >> shift, positive, negative, fixed, budgets))


def representation_counts(layout, *, b_size=24):
    """Adjacency slots in generation; supplied graphs themselves are fixed."""
    parent_order = len(layout.parent_vertices)
    local_order = len(layout.vertices)
    return {"singleton_rows": len(layout.singletons), "endpoint_rows": 2,
            "local_adjacency_slots": local_order * (local_order - 1) // 2,
            "parent_adjacency_slots": parent_order * (parent_order - 1) // 2,
            "actual_cross_slots": local_order * b_size,
            "B_adjacency_slots": b_size * (b_size - 1) // 2,
            "endpoint_row_pairs": 4 ** b_size,
            "endpoint_splits_for_union_size_rho": "3**rho; sum over all unions is 4**b_size"}
