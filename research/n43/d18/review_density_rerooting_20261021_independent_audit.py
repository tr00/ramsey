"""Independent scalar and tiny-identity audit; no Ramsey graph search.

Run from the repository root with Python 3. Only the standard library is used.
The author validator is neither imported nor executed.
"""

from fractions import Fraction
from hashlib import sha256
from math import comb
from pathlib import Path
import json


SOURCE = Path("n43/d18/density_rerooting.md")
EXPECTED = "381ee81feb7fc8518badfce095ed589a2351406c2eaf2e08bbe61470aeb4203d"
assert sha256(SOURCE.read_bytes()).hexdigest() == EXPECTED

# A fixed, arbitrary nine-vertex graph is used only for identities. It is not
# an order-43 candidate and none of its Ramsey properties is tested.
nbr = [set() for _ in range(9)]
for x, y in [(0, 1), (0, 2), (0, 4), (0, 7), (1, 2), (1, 3),
             (1, 5), (2, 3), (2, 6), (3, 4), (3, 8), (4, 5),
             (4, 6), (5, 6), (5, 8), (6, 7), (7, 8)]:
    nbr[x].add(y)
    nbr[y].add(x)


def edges(part):
    return sum(len(nbr[x] & part) for x in part) // 2


def cut(left, right):
    return sum(len(nbr[x] & right) for x in left)


pair_count = 0
local_count = 0
for v in range(9):
    a = nbr[v]
    b = set(range(9)) - a - {v}
    for u in range(v + 1, 9):
        other = set(range(9)) - {v, u}
        s = other & nbr[v] & nbr[u]
        x = (other & nbr[v]) - nbr[u]
        y = (other & nbr[u]) - nbr[v]
        z = other - s - x - y
        gamma = int(u in nbr[v])
        epsilon_sum = sum(len(nbr[t]) - 18 for t in s)
        rhs = edges(x) + edges(y) + (16 + 2 * gamma) * len(s)
        rhs += epsilon_sum - cut(s, z)
        assert edges(nbr[v]) + edges(nbr[u]) == rhs
        pair_count += 1
    for u in a:
        s = nbr[u] & a
        r = nbr[u] & b
        assert edges(nbr[u]) == len(s) + edges(s) + edges(r) + cut(s, r)
        local_count += 1
    for y in b:
        c = nbr[y] & a
        r = nbr[y] & b
        assert edges(nbr[y]) == edges(c) + edges(r) + cut(c, r)
        local_count += 1

# Recompute the lower-bound table and the order-10 complementary cap.
lower = {m: comb(m, 2) - m * m // 3 for m in range(10)}
lower.update({10: 14, 11: 19, 12: 26, 13: 33, 14: 41,
              15: 50, 16: 60, 17: 68})
f_neighborhood = lambda d: min(d * d // 4, 3 * d // 2)
for degree in range(1, 9):
    nondegree = 9 - degree
    goodman_bound = f_neighborhood(degree) + f_neighborhood(nondegree)
    goodman_bound += Fraction(3, 2) * degree * nondegree
    assert goodman_bound + 6 * degree <= 74
assert (10 * 74 - 3 * comb(10, 3)) // 12 == 31
assert comb(10, 2) - 31 == lower[10]

pair_rows = []
for gamma, overlaps in [(1, range(4)), (0, range(1, 6))]:
    for k in overlaps:
        side_size = 18 - gamma - k
        cut_cap = 7 + k if gamma else min(8, 5 + k)
        bound = 2 * lower[side_size] + k * (16 + 2 * gamma - cut_cap)
        pair_rows.append([gamma, k, bound, (bound - 1) // 2])
assert [row[2] for row in pair_rows] == [136, 130, 118, 106,
                                                     146, 138, 124, 114, 106]
assert [s + lower[17 - s] for s in range(8)] == [68, 61, 52, 44, 37, 31, 25, 21]
assert [lower[18 - c] for c in range(1, 9)] == [68, 60, 50, 41, 33, 26, 19, 14]

# A scalar dynamic program minimizes the weighted D contributions directly.
# It is independent of the author's balanced closed-form implementation.
minimum = {}
for z in range(17):
    cost = [d * max(0, 2 + d - z) for d in range(7)]
    assert all(cost[d + 2] - cost[d + 1] >= cost[d + 1] - cost[d]
               for d in range(5))
    dp = [0]
    for entries in range(1, 18):
        next_dp = [10**9] * (6 * entries + 1)
        for old_total, old_cost in enumerate(dp):
            for d in range(7):
                total = old_total + d
                next_dp[total] = min(next_dp[total], old_cost + cost[d])
        dp = next_dp
    for total, optimum in enumerate(dp):
        b, r = divmod(total, 17)
        balanced = (17 - r) * cost[b] + (r * cost[b + 1] if r else 0)
        assert optimum == balanced
        minimum[z, total] = optimum


def k1_bound(z, excess_c, i, j):
    excess_d = excess_c + j - i
    if not 0 <= excess_d <= 102:
        return None
    excess_t = 26 + i + j
    b0 = 17 + excess_c + j
    j_lower = max(0, 9 - z) * (excess_c + excess_t)
    j_lower += minimum[z, excess_d]
    q_sum_upper = (17 - z) * b0 - j_lower
    return q_sum_upper, q_sum_upper // (17 - z)


k1_rows = []
for z, excesses, promised in [(0, [0], 78), (1, range(1, 7), 74),
                              (2, range(2, 13), 69), (3, range(3, 5), 69)]:
    values = [(k1_bound(z, ec, i, j), ec, i, j)
              for ec in excesses for i in range(17) for j in range(17 - i)
              if k1_bound(z, ec, i, j) is not None]
    worst_sum = max(values, key=lambda value: value[0][0])
    worst_q = max(value[0][1] for value in values)
    assert 85 - worst_q == promised
    k1_rows.append({"z": z, "profiles_checked": len(values),
                    "max_q_sum": worst_sum[0][0],
                    "sum_maximizer_EC_i_j": list(worst_sum[1:]),
                    "guaranteed_edges": 85 - worst_q})
assert [row["max_q_sum"] for row in k1_rows] == [135, 186, 247, 236]

for z, excesses, expected in [(1, range(1, 4), 75), (2, range(2, 5), 72),
                              (2, range(5, 8), 71), (2, range(8, 11), 70),
                              (2, range(11, 13), 69)]:
    worst_q = max(result[1] for ec in excesses
                  for i in range(17) for j in range(17 - i)
                  if (result := k1_bound(z, ec, i, j)) is not None)
    assert 85 - worst_q == expected

k3_rows = []
for z in range(3):
    # Use the unsimplified root sum and a rational W endpoint, independently.
    largest = None
    for q in range(27, 33):
        for excess_c in range(z, 6 * z + 1):
            w_upper = 30 + 2 * q + 2 * excess_c
            root_sum = Fraction(15 - z, 2) * w_upper + 4 * (15 - z)
            root_sum -= (7 - z) * (w_upper - 21)
            assert root_sum == (1 + z) * (q + excess_c) + 222 - 10 * z
            largest = root_sum if largest is None else max(largest, root_sum)
    k3_rows.append([z, int(largest), 85 - int(largest // (15 - z))])
assert k3_rows == [[0, 254, 69], [1, 288, 65], [2, 334, 60]]

print(json.dumps({"proof_sha256": EXPECTED, "outcome": "PASS",
                  "tiny_pair_identity_checks": pair_count,
                  "tiny_neighborhood_identity_checks": local_count,
                  "pair_rows_gamma_k_bound_source_max": pair_rows,
                  "convex_balancing_totals_checked": len(minimum),
                  "k1_uniform_rows": k1_rows,
                  "k3_z_sum_edges": k3_rows}, indent=2))
