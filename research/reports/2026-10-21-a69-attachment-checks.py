"""Scalar self-checks for the a69 ambient attachment arguments.

No graph search or catalogue processing. Run from the repository root.
"""

from itertools import combinations
from math import comb


def checked(label, condition):
    assert condition, label
    print(f"PASS: {label}")


pair_cells = 0
for edge in (False, True):
    for eu in range(7):
        for ew in range(7):
            E = eu + ew
            cap = 12 if edge else (13 if E == 0 else 14)
            for cut in range(cap + 1):
                pair_sum = 120 + 32 + E - cut
                assert pair_sum >= 139
                if edge:
                    assert pair_sum >= 140 + E
                assert pair_sum - 69 >= (71 + E if edge else 70)
                pair_cells += 1
print(f"PASS: {pair_cells} nonadjacent-root overlap-two scalar cases")

# Derive triangle counts and cap sums separately from the written formula.
checked("Goodman count", comb(16, 3) - 16 * 7 * 8 // 2 == 112)
checked("neighborhood triangle cap", (8 * 10 + 8 * 12) // 3 == 58)
checked("complementary triangle range", 112 - 58 == 54)
checked("triangle defect residues",
        {176 - 3 * T for T in range(54, 59)} == {2, 5, 8, 11, 14})
for b in range(25):
    cross = 56 - 2 * b
    upper = b + 4
    if 0 <= cross <= 64 and 0 <= upper <= 28:
        cap_sum = (3 * 60 + 3 * (28 - b)
                   + 4 * (64 - cross) + 5 * (28 - upper))
        assert cap_sum == 416
        assert cap_sum - (8 * comb(7, 2) + 8 * comb(8, 2)) == 24
checked("degree partition codegree deficit", True)

exceptional_cells = 0
for edge in (False, True):
    for su in range(14):
        sw = 9 + int(edge) - su
        if not 0 <= sw <= 13:
            continue
        for eu in range(7):
            for ew in range(7):
                if eu > su - 2 or ew > sw - 2:
                    continue
                E = eu + ew
                cut_total = 23 - int(edge) + E
                cut_to_Z_cap = 11 if edge else 12
                if cut_total > 16 + cut_to_Z_cap:
                    continue
                assert E <= 5
                if su == 2:
                    assert eu == 0
                for to_Z in range(cut_to_Z_cap + 1):
                    to_D = cut_total - to_Z
                    if not 0 <= to_D <= 16:
                        continue
                    ay = 91 + E - to_Z
                    assert ay >= (80 if edge else 79) + E
                    exceptional_cells += 1
print(f"PASS: {exceptional_cells} exceptional-column scalar budgets")

# Independently replay codegree/neighborhood structure of a fixed critical
# graph from its explicit construction; not an enumeration of graphs.
residues = {x * x % 17 for x in range(1, 17)}
adj = {x: {y for y in range(17) if y != x and (y - x) % 17 in residues}
       for x in range(17)}
checked("explicit 17-core is 8-regular", all(len(N) == 8 for N in adj.values()))
for x, y in combinations(range(17), 2):
    common = len(adj[x] & adj[y])
    assert common == (3 if y in adj[x] else 4)
checked("explicit critical codegrees", True)
C = set(range(1, 17))
L = adj[0]
U = C - L
checked("critical splitting partition", len(L) == len(U) == 8)
checked("cubic and complementary cubic eight-cells",
        all(len(adj[x] & L) == 3 and len(adj[x] & U) == 4 for x in L)
        and all(len(adj[x] & L) == 4 and len(adj[x] & U) == 4 for x in U))
checked("fixed graph has no K4/I4",
        all(not all(y in adj[x] for x, y in combinations(S, 2))
            and not all(y not in adj[x] for x, y in combinations(S, 2))
            for S in combinations(range(17), 4)))
print("Validation is author self-checking, not independent proof review.")
