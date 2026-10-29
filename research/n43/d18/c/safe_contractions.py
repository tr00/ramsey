"""Local contraction certificates for supplied Ramsey neighborhoods.

This module does not enumerate a complete d18c neighborhood family, enforce
the selected-root condition, or decide order-43 completion.
"""

from itertools import combinations


def triangle(adj, vertices):
    return next((group for group in combinations(vertices, 3)
                 if all(v in adj[u] for u, v in combinations(group, 2))), None)


def edge_cells(adj, u, v):
    if v not in adj[u]:
        raise ValueError("contraction requires an edge")
    common = adj[u] & adj[v]
    left = adj[u] - adj[v] - {v}
    right = adj[v] - adj[u] - {u}
    return common, left, right


def certificate(adj, u, v):
    """Return a checked safety certificate, or a mixed-triangle obstruction.

    Assumes the supplied graph is K4-free. The validation driver checks this
    premise independently; callers must establish it for their own inputs.
    """
    common, left, right = edge_cells(adj, u, v)
    union = common | left | right
    cross = [(p, q) for p in sorted(left) for q in sorted(right) if q in adj[p]]
    for p, q in cross:
        witnesses = adj[p] & adj[q] & union
        if witnesses:
            return {"safe": False, "triangle": (p, q, min(witnesses))}
    if not cross:
        kind = "anticomplete"
    else:
        degrees = {w: 0 for w in left | right}
        for p, q in cross:
            degrees[p] += 1
            degrees[q] += 1
        if all(degrees[p] == 1 and degrees[q] == 1 for p, q in cross):
            kind = "shielded_matching"
        elif all(degrees[p] == 1 or degrees[q] == 1 for p, q in cross):
            kind = "shielded_star_forest"
        else:
            kind = "general_mixed_triangle_test"
    return {"safe": True, "kind": kind, "common": sorted(common),
            "left": sorted(left), "right": sorted(right), "cross": cross}


def compatible_pair(adj, first, second):
    """Exact two-edge compatibility test, conditional on individual safety."""
    if set(first) & set(second):
        raise ValueError("this test requires disjoint endpoint pairs")
    if not certificate(adj, *first)["safe"] or not certificate(adj, *second)["safe"]:
        return False
    if not any(v in adj[u] for u in first for v in second):
        return True
    endpoints = set(first) | set(second)
    first_union = (adj[first[0]] | adj[first[1]]) - endpoints
    second_union = (adj[second[0]] | adj[second[1]]) - endpoints
    shared = first_union & second_union
    return not any(v in adj[u] for u, v in combinations(shared, 2))


def contract(adj, u, v):
    """Contract to a fresh integer label, retaining all other labels."""
    if v not in adj[u]:
        raise ValueError("contraction requires an edge")
    merged = max(adj, default=-1) + 1
    union = (adj[u] | adj[v]) - {u, v}
    result = {w: neighbors - {u, v} for w, neighbors in adj.items() if w not in (u, v)}
    result[merged] = set(union)
    for w in union:
        result[w].add(merged)
    return result, merged


def marked_split(adj, z, left, right):
    """Inverse edge contraction: left/right cover exactly the marked neighbors.

    The caller must check K4/I5 constraints and any retained ambient interface.
    Neighbor overlap is allowed; adjacent replacement vertices get fresh labels.
    """
    left, right = set(left), set(right)
    if left | right != adj[z]:
        raise ValueError("split attachments must cover precisely the marked neighborhood")
    u, v = max(adj) + 1, max(adj) + 2
    result = {w: neighbors - {z} for w, neighbors in adj.items() if w != z}
    result[u], result[v] = left | {v}, right | {u}
    for w in left:
        result[w].add(u)
    for w in right:
        result[w].add(v)
    return result, (u, v)
