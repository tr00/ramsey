"""Exact scalar and set-family self-checks for the a69 decomposition.

This is not a graph search, an independent review, or a proof certificate.
Run from the repository root with python3 reports/2026-10-21-a69-checks.py.
"""

from itertools import combinations


def subsets(items):
    items = tuple(items)
    for size in range(len(items) + 1):
        yield from (frozenset(x) for x in combinations(items, size))


def check(name, predicate):
    assert predicate, name
    print(f"PASS: {name}")


# The core edge ranges are input premises, not established by this script.
edge_ranges = {
    10: (14, 31), 11: (19, 36), 12: (26, 40), 13: (33, 45),
    14: (41, 50), 15: (50, 55), 16: (60, 60), 17: (68, 68),
}

check("order-16 degree sum", 8 * 7 + 8 * 8 == 2 * 60)
check("order-17 degree sum", 17 * 8 == 2 * 68)
check("order-16 Goodman total", 560 - (16 * 56) // 2 == 112)
check("order-16 independent-triple range", 112 - 60 == 52)
check("tau upper bound", 18 * 8 > 2 * 69 and (2 * 69) // 18 + 1 == 8)
check("tau-eight minimum-degree multiplicity", 18 - (138 - 18 * 7) == 6)

separator_caps = [60 + 8 + 1, 55 + 1 + 8 + 2, 50 + 3 + 8 + 2]
check("one-separator caps", separator_caps == [69, 66, 63])

attachment_cells = 0
for adjacent in (False, True):
    budget = 9 - adjacent
    allowed = []
    for p in range(9):
        q = budget - p
        if not 0 <= q <= 8:
            continue
        connectivity = min(p, q) + int(adjacent)
        if connectivity >= 2:
            allowed.append((p, q, connectivity))
            attachment_cells += 1
    lower = 1 if adjacent else 2
    upper = 7
    check(f"two-panel size range, adjacent={adjacent}",
          {p for p, _, _ in allowed} == set(range(lower, upper + 1)))
    check(f"two-panel connectivity cap, adjacent={adjacent}",
          max(k for _, _, k in allowed) == (5 if adjacent else 4))
print(f"Checked {attachment_cells} ordered two-panel size profiles.")

budget_cells = 0
for t in range(1, 9):
    h = 18 - t
    lo, hi = edge_ranges[h]
    for core_edges in range(lo, hi + 1):
        for panel_edges in range(t * (t - 1) // 2 + 1):
            cut_edges = 69 - core_edges - panel_edges
            core_degree_sum = 2 * core_edges + cut_edges
            panel_degree_sum = 2 * panel_edges + cut_edges
            assert core_degree_sum + panel_degree_sum == 138
            original = (core_degree_sum >= h * (t - 1)
                        and panel_degree_sum >= t * (t - 1))
            transformed = (h * (t - 1) - 69 <= core_edges - panel_edges
                           <= 69 - t * (t - 1))
            assert original == transformed
            check_total = 17 * h - 2 * core_edges - cut_edges
            assert check_total == 17 * h - 69 - core_edges + panel_edges
            budget_cells += 1
print(f"PASS: {budget_cells} core/panel scalar identities and degree-floor equivalences")

endpoint_cells = 0
for core_edges in range(14, 32):
    for panel_edges in range(22):
        cut_edges = 62 - core_edges - panel_edges
        original = (cut_edges + 2 * panel_edges >= 42
                    and 2 * core_edges + cut_edges >= 70)
        assert original == (8 <= core_edges - panel_edges <= 20)
        endpoint_cells += 1
print(f"PASS: {endpoint_cells} tau-eight endpoint scalar identities")

for adjacent in (False, True):
    for p in range(9):
        degree = p + int(adjacent)
        for excess in range(min(6, degree) + 1):
            row_size = 17 + excess - degree
            omitted = 24 - row_size
            expected = (8 if adjacent else 7) + p - excess
            assert omitted == expected
check("cut leaf incidence budgets", 17 * 16 - 2 * 60 - 8 == 144
      and 8 * 8 == 64 and 7 * 8 == 56)
check("pendant cubic attachment accounting", 3 * 8 // 2 == 12
      and 60 - (7 * 8 - 12) == 16)

# Check the transversal exchange equivalence on explicit small set systems.
# These examples exercise cardinality exchanges without enumerating graphs.
T = frozenset((0, 1, 2))
H = frozenset((3, 4, 5, 6, 7))
families = [
    [frozenset((u, 3, 4, 5)) for u in T],  # private witnesses; not minimum
    [frozenset((0, 3, 4, 5)), frozenset((1, 3, 6, 7)),
     frozenset((2, 4, 6, 7))],
    [frozenset((0, 1, 3, 4)), frozenset((0, 2, 5, 6)),
     frozenset((1, 2, 4, 7))],
]
for family in families:
    minimum = not any(len(D) < len(T) and all(D & I for I in family)
                      for D in subsets(T | H))
    exchange = all(
        any(not (I & (T - U)) and not (I & D) for I in family)
        for U in subsets(T) if U
        for D in subsets(H) if len(D) < len(U)
    )
    assert minimum == exchange
check("private witnesses alone do not prove minimum cardinality",
      all(any(I & T == {u} for I in families[0]) for u in T)
      and all(3 in I for I in families[0]))
print("PASS: transversal exchange equivalence on three explicit set systems")
