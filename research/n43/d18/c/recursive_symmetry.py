#!/usr/bin/env python3
"""Symmetry adapter for the residual Ramsey DP. No computation on import.

Uses certified swap subgroups, binomial row weights, and witnessed whole-state
relabellings. Bounded representative selection is safe but can miss reuse.
Research prototype pending independent review; no external canonicalizer.
"""

from collections import Counter
from dataclasses import dataclass
from itertools import combinations, product
from math import comb

import recursive_ramsey as base


def colour_tuple(state, colours=None):
    domain = tuple(base.vertices(state.remaining))
    if colours is None:
        return tuple((u, 0) for u in domain)
    mapping = dict(colours)
    if set(mapping) != set(domain):
        raise ValueError("colours must cover exactly the remaining labels")
    if any(not isinstance(value, int) for value in mapping.values()):
        raise ValueError("colours must be integers")
    return tuple((u, mapping[u]) for u in domain)


def move_mask(mask, mapping):
    return sum(1 << mapping[u] for u in base.vertices(mask))


def relabel(state, mapping):
    """Transport every stored condition through a bijection of vertex labels."""
    mapping = dict(mapping)
    domain = set(base.vertices(state.remaining))
    if set(mapping) != domain or len(set(mapping.values())) != len(domain):
        raise ValueError("transport must be a bijection on the current labels")
    if any(not isinstance(v, int) or v < 0 for v in mapping.values()):
        raise ValueError("target labels must be nonnegative integers")

    def pair(u, v):
        return tuple(sorted((mapping[u], mapping[v])))

    moved = base.State(move_mask(state.remaining, mapping),
        tuple((k, move_mask(support, mapping)) for k, support in state.positive),
        tuple((k, move_mask(support, mapping)) for k, support in state.negative),
        tuple((*pair(u, v), bit) for u, v, bit in state.fixed),
        tuple(base.Budget(tuple(sorted((*pair(u, v), weight)
            for u, v, weight in budget.weights)), budget.lower, budget.upper)
            for budget in state.budgets))
    return base.canonical(moved)


def move_colours(colours, mapping):
    mapping = dict(mapping)
    return tuple(sorted((mapping[u], colour) for u, colour in colours))


def swap_blocks(state, colours=None, pinned=()):
    """Maximal blocks whose every transposition preserves the normalized state.

    Blocks denote interchangeable future labels, not twins in a future graph.
    Each tested swap transports obligation families and budget families together.
    """
    colours = dict(colour_tuple(state, colours))
    domain = tuple(base.vertices(state.remaining))
    pinned = set(pinned)
    if not pinned <= set(domain):
        raise ValueError("pinned vertex is absent")
    parent = {u: u for u in domain}

    def find(u):
        while parent[u] != u:
            parent[u] = parent[parent[u]]
            u = parent[u]
        return u

    identity = {u: u for u in domain}
    for u, v in combinations(domain, 2):
        if u in pinned or v in pinned or colours[u] != colours[v]:
            continue
        mapping = dict(identity)
        mapping[u], mapping[v] = v, u
        if relabel(state, mapping) == state:
            ru, rv = find(u), find(v)
            parent[max(ru, rv)] = min(ru, rv)
    parts = {}
    for u in domain:
        parts.setdefault(find(u), []).append(u)
    return tuple(sorted(tuple(part) for part in parts.values()))


def compose(left, right):
    """Permutation composition left after right on a common label domain."""
    left, right = dict(left), dict(right)
    return tuple(sorted((u, left[right[u]]) for u in right))


def inverse(mapping):
    return tuple(sorted((v, u) for u, v in dict(mapping).items()))


def point_stabilizer(domain, generators, pivot):
    """Schreier generators of a certified permutation subgroup's pivot stabilizer."""
    identity = tuple((u, u) for u in domain)
    if pivot not in domain:
        raise ValueError("pivot is absent")
    moves = tuple(sorted(set(tuple(sorted(dict(g).items())) for g in generators)
                         | set(inverse(g) for g in generators)))
    for g in moves:
        if set(dict(g)) != set(domain) or set(dict(g).values()) != set(domain):
            raise ValueError("generator is not a permutation of the domain")
    representatives = {pivot: identity}
    queue = [pivot]
    for vertex in queue:
        for g in moves:
            target = dict(g)[vertex]
            if target not in representatives:
                representatives[target] = compose(g, representatives[vertex])
                queue.append(target)
    stabilizer = set()
    for vertex, representative in representatives.items():
        for g in moves:
            target = dict(g)[vertex]
            h = compose(inverse(representatives[target]), compose(g, representative))
            if h != identity:
                assert dict(h)[pivot] == pivot
                stabilizer.add(h)
    return tuple(sorted(stabilizer))


def _block_rows(state, pivot, blocks, generators):
    """Count-vector orbits after the block and generator witnesses are verified."""
    if not (state.remaining >> pivot) & 1:
        raise ValueError("pivot is absent")
    fixed = {}
    for u, v, bit in state.fixed:
        if pivot in (u, v):
            fixed[v if u == pivot else u] = bit
    ranges = []
    for block in blocks:
        values = {fixed.get(u) for u in block}
        if values == {1}:
            ranges.append((len(block),))
        elif values == {0}:
            ranges.append((0,))
        elif values == {None}:
            ranges.append(range(len(block) + 1))
        else:
            raise AssertionError("a certified swap block has nonuniform fixed row data")
    owner = {u: i for i, block in enumerate(blocks) for u in block}
    actions = []
    for generator in generators:
        mapping = dict(generator)
        action = tuple(owner[mapping[block[0]]] for block in blocks)
        assert len(set(action)) == len(blocks)
        assert all({mapping[u] for u in block} == set(blocks[action[i]])
                   for i, block in enumerate(blocks))
        actions.append(action)
    visited = set()
    for initial in product(*ranges):
        if actions and initial in visited:
            continue
        orbit = {initial}
        queue = [initial]
        for counts in queue:
            for action in actions:
                moved = [0] * len(blocks)
                for i, target in enumerate(action):
                    moved[target] = counts[i]
                moved = tuple(moved)
                if moved not in orbit:
                    orbit.add(moved)
                    queue.append(moved)
        if actions:
            visited.update(orbit)
        counts = min(orbit)
        neighbors = 0
        weight = 1
        for block, size in zip(blocks, counts):
            neighbors |= base.mask_of(block[:size])
            weight *= comb(len(block), size)
        yield neighbors, weight * len(orbit)


def row_orbits(state, pivot, colours=None, generators=()):
    """Rows modulo full swap blocks plus optional certified coupled generators."""
    colours = colour_tuple(state, colours)
    blocks = tuple(block for block in swap_blocks(state, colours, (pivot,))
                   if block != (pivot,))
    for generator in generators:
        mapping = dict(generator)
        if mapping.get(pivot) != pivot or relabel(state, mapping) != state \
                or move_colours(colours, mapping) != colours:
            raise ValueError("row generator must preserve the whole state and fix its pivot")
    yield from _block_rows(state, pivot, blocks, generators)


def _histogram(items):
    return tuple(sorted(Counter(items).items()))


def refine_colours(state, colours):
    """An invariant partition using obligations, fixed pairs, and all budgets."""
    original = dict(colours)
    labels = tuple(base.vertices(state.remaining))
    current = {u: sorted(set(original.values())).index(original[u]) for u in labels}
    while True:
        descriptors = {u: [[], [], []] for u in labels}
        for kind, clauses in ((0, state.positive), (1, state.negative)):
            for threshold, support in clauses:
                descriptor = (kind, threshold, _histogram(current[v]
                    for v in base.vertices(support)))
                for u in base.vertices(support):
                    descriptors[u][0].append(descriptor)
        for u, v, bit in state.fixed:
            descriptors[u][1].append((bit, current[v]))
            descriptors[v][1].append((bit, current[u]))
        for budget in state.budgets:
            descriptor = (budget.lower, budget.upper,
                _histogram((weight, *sorted((current[u], current[v])))
                    for u, v, weight in budget.weights))
            incident = {}
            for u, v, weight in budget.weights:
                incident.setdefault(u, []).append((weight, current[v]))
                incident.setdefault(v, []).append((weight, current[u]))
            for u, edges in incident.items():
                descriptors[u][2].append((descriptor, tuple(sorted(edges))))
        signatures = {u: (current[u], *(tuple(sorted(bag))
                      for bag in descriptors[u])) for u in labels}
        ordered = {signature: rank for rank, signature in
                   enumerate(sorted(set(signatures.values())))}
        updated = {u: ordered[signatures[u]] for u in labels}
        old_parts = {frozenset(v for v in labels if current[v] == current[u]) for u in labels}
        new_parts = {frozenset(v for v in labels if updated[v] == updated[u]) for u in labels}
        current = updated
        if old_parts == new_parts:
            return tuple((u, current[u]) for u in labels)


def _block_orders(blocks):
    """Coset representatives: interleave blocks, keep each block's order fixed."""
    positions = [0] * len(blocks)
    total = sum(map(len, blocks))

    def visit(prefix):
        if len(prefix) == total:
            yield tuple(prefix)
            return
        for index, block in enumerate(blocks):
            if positions[index] == len(block):
                continue
            vertex = block[positions[index]]
            positions[index] += 1
            yield from visit(prefix + [vertex])
            positions[index] -= 1

    yield from visit([])


def state_code(state, colours):
    return (tuple(colour for _, colour in colours), state.positive, state.negative,
            state.fixed, tuple((budget.weights, budget.lower, budget.upper)
                               for budget in state.budgets))


@dataclass(frozen=True)
class Image:
    state: base.State
    colours: tuple
    transport: tuple
    exhaustive: bool
    candidates: int
    generators: tuple = ()


def representative_image(raw, colours=None, candidate_limit=32):
    """A witnessed dense relabelling; an invariant representative if exhaustive.

    A finite limit can miss identifications but cannot merge inequivalent
    completion problems: every returned key has a full transport witness.
    None means no candidate limit. No permutation group is enumerated on import.
    """
    state = base.canonical(raw)
    if state is None:
        return None
    if candidate_limit is not None and candidate_limit < 1:
        raise ValueError("candidate limit must be positive or None")
    colours = colour_tuple(state, colours)
    refined = dict(refine_colours(state, colours))
    swaps = swap_blocks(state, colours)
    classes = []
    for rank in sorted(set(refined.values())):
        blocks = tuple(block for block in swaps if refined[block[0]] == rank)
        assert all(len({refined[u] for u in block}) == 1 for block in blocks)
        classes.append(blocks)

    def orders(index, prefix):
        if index == len(classes):
            yield prefix
        else:
            for order in _block_orders(classes[index]):
                yield from orders(index + 1, prefix + order)

    best = code = None
    seen_images = {}
    automorphisms = set()
    count = 0
    exhaustive = True
    for order in orders(0, ()):
        if candidate_limit is not None and count == candidate_limit:
            exhaustive = False
            break
        mapping = tuple((u, rank) for rank, u in enumerate(order))
        moved = relabel(state, mapping)
        moved_colours = move_colours(colours, mapping)
        candidate = state_code(moved, moved_colours)
        if candidate in seen_images:
            automorphism = compose(inverse(mapping), seen_images[candidate])
            if any(u != v for u, v in automorphism):
                automorphisms.add(automorphism)
        else:
            seen_images[candidate] = mapping
        count += 1
        if code is None or candidate < code:
            best = Image(moved, moved_colours, mapping, False, 0)
            code = candidate
    generators = tuple(sorted(compose(best.transport, compose(g, inverse(best.transport)))
                              for g in automorphisms))
    return Image(best.state, best.colours, best.transport, exhaustive, count, generators)


class SymmetryDP:
    """Exact labelled counts through weighted row orbits and witnessed state keys."""

    def __init__(self, candidate_limit=32):
        self.candidate_limit = candidate_limit
        self.nodes = []
        self.memo = {}

    def count(self, state, colours=None):
        image = representative_image(state, colours, self.candidate_limit)
        return 0 if image is None else self.nodes[self._visit(image)]["count"]

    def certificate(self, state, colours=None):
        colours = colour_tuple(state, colours)
        image = representative_image(state, colours, self.candidate_limit)
        root = None if image is None else self._visit(image)
        return {"format": "ramsey-symmetry-dag-v1", "input": base.state_data(state),
                "colours": list(colours), "root": root,
                "root_transport": None if image is None else list(image.transport),
                "nodes": self.nodes,
                "seeds": [[p, q, bound] for (p, q), bound in sorted(base.SEEDS.items())]}

    def _visit(self, image):
        state, colours = image.state, image.colours
        key = (state, colours)
        if key in self.memo:
            return self.memo[key]
        index = len(self.nodes)
        self.memo[key] = index
        node = {"state": base.state_data(state), "colours": list(colours), "count": 0}
        self.nodes.append(node)
        failure = base.capacity_failure(state)
        if failure:
            node.update(kind="capacity", witness=list(failure))
        elif not state.remaining:
            node.update(kind="empty", count=1)
        else:
            pivot = next(base.vertices(state.remaining))
            blocks = tuple(block for block in swap_blocks(state, colours, (pivot,))
                           if block != (pivot,))
            for generator in image.generators:
                assert relabel(state, generator) == state
                assert move_colours(colours, generator) == colours
            stabilizer = point_stabilizer(tuple(base.vertices(state.remaining)),
                                         image.generators, pivot)
            rows = []
            child_colours = tuple((u, value) for u, value in colours if u != pivot)
            for neighbors, weight in _block_rows(state, pivot, blocks, stabilizer):
                child = base.derivative(state, pivot, neighbors)
                child_image = None if child is None else representative_image(
                    child, child_colours, self.candidate_limit)
                child_id = None if child_image is None else self._visit(child_image)
                rows.append({"neighbors": neighbors, "weight": weight, "child": child_id,
                             "transport": None if child_image is None
                             else list(child_image.transport)})
                if child_id is not None:
                    node["count"] += weight * self.nodes[child_id]["count"]
            node.update(kind="branch", pivot=pivot, blocks=list(blocks),
                        generators=list(stabilizer), rows=rows)
        return index


def d18c_colours(state):
    """Role colours for the original initializer labels; transport them thereafter."""
    return tuple((u, 0 if u == 0 else 1 if u <= 18 else 2)
                 for u in base.vertices(state.remaining))
