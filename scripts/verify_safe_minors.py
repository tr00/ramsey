#!/usr/bin/env python3
"""Small exhaustive self-check of the safe-minor identities; no census claims."""

from itertools import combinations


def homogeneous(adj, vertices, size, edge=True):
    return any(
        all(bool(adj[u] & (1 << v)) == edge for u, v in combinations(group, 2))
        for group in combinations(vertices, size)
    )


def ramsey(adj, s, t):
    vertices = range(len(adj))
    return not homogeneous(adj, vertices, s) and not homogeneous(adj, vertices, t, False)


def contract(adj, u, v):
    keep = [a for a in range(len(adj)) if a not in (u, v)]
    result = [0] * (len(adj) - 1)
    union = (adj[u] | adj[v]) & ~((1 << u) | (1 << v))
    for i, a in enumerate(keep):
        for j, b in enumerate(keep):
            if adj[a] & (1 << b):
                result[i] |= 1 << j
        if union & (1 << a):
            result[i] |= 1 << len(keep)
            result[-1] |= 1 << i
    return result


def exhaustive():
    stats = {p: [0, 0, 0, 0] for p in [(3, 3), (3, 4), (4, 3), (4, 4)]}
    for n in range(7):
        pairs = list(combinations(range(n), 2))
        for mask in range(1 << len(pairs)):
            adj = [0] * n
            for index, (u, v) in enumerate(pairs):
                if mask & (1 << index):
                    adj[u] |= 1 << v
                    adj[v] |= 1 << u
            clique = {k: homogeneous(adj, range(n), k) for k in (3, 4)}
            independent = {k: homogeneous(adj, range(n), k, False) for k in (3, 4)}
            for (s, t), counts in stats.items():
                if clique[s] or independent[t]:
                    continue
                counts[0] += 1
                for u, v in pairs:
                    if not adj[u] & (1 << v):
                        continue
                    union = (adj[u] | adj[v]) & ~((1 << u) | (1 << v))
                    vertices = [a for a in range(n) if union & (1 << a)]
                    exact = not homogeneous(adj, vertices, s - 1)
                    raw = [a for a in range(n) if (adj[u] | adj[v]) & (1 << a)]
                    literal = not homogeneous(adj, raw, s - 1)
                    result = contract(adj, u, v)
                    assert exact == ramsey(result, s, t)
                    assert not literal or exact
                    codegree = (adj[u] & adj[v]).bit_count()
                    assert sum(a.bit_count() for a in result) // 2 == mask.bit_count() - 1 - codegree
                    anticommon = [a for a in range(n) if a not in (u, v) and not (adj[u] | adj[v]) & (1 << a)]
                    deletion_safe = not homogeneous(adj, anticommon, t - 2, False)
                    deleted = adj.copy()
                    deleted[u] &= ~(1 << v)
                    deleted[v] &= ~(1 << u)
                    assert deletion_safe == ramsey(deleted, s, t)
                    counts[1] += 1
                    counts[2] += exact
                    counts[3] += literal
    print("All labelled graphs of orders 0..6; contraction and edge-deletion equivalences passed.")
    for parameters, counts in stats.items():
        print(parameters, dict(zip(["Ramsey graphs", "edges checked", "exact-safe", "literal-safe"], counts)))


def paley():
    squares = {1, 2, 4, 8, 9, 13, 15, 16}
    adj = [sum(1 << j for j in range(17) if (j - i) % 17 in squares) for i in range(17)]
    assert ramsey(adj, 4, 4)
    edges = [(u, v) for u, v in combinations(range(17), 2) if adj[u] & (1 << v)]
    assert len(edges) == 68
    assert all(not ramsey(contract(adj, u, v), 4, 4) for u, v in edges)
    neighbors = [a for a in range(1, 17) if adj[0] & (1 << a)]
    for mask in range(1, (1 << 8) - 1):
        split = [a & ~1 for a in adj] + [0]
        split[0] = 1 << 17
        split[17] = 1
        for i, a in enumerate(neighbors):
            parent = 0 if mask & (1 << i) else 17
            split[parent] |= 1 << a
            split[a] |= 1 << parent
        assert ramsey(split, 4, 5)
        assert sum(a.bit_count() for a in split) // 2 == 69
        quotient = contract(split, 0, 17)
        assert ramsey(quotient, 4, 4)
        labels = list(range(1, 17)) + [0]
        expected = [sum(1 << j for j, b in enumerate(labels) if (b - a) % 17 in squares) for a in labels]
        assert quotient == expected
        raw = [a for a in range(18) if (split[0] | split[17]) & (1 << a)]
        assert homogeneous(split, raw, 3)
    print("Paley17: 68 edges, no exact-safe (4,4) contractions; all 254 nonempty labelled neighbor partitions give exact-safe but literal-unsafe splittings.")


if __name__ == "__main__":
    exhaustive()
    paley()
