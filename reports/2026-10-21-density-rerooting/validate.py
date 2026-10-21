"""Bounded author arithmetic checks; no Ramsey graph or solver search."""

from fractions import Fraction
from itertools import combinations, product
import json
from math import comb
import random


def f(z, d):
    return d * max(0, 2 + d - z)


def balanced(z, excess):
    b, r = divmod(excess, 17)
    return (17 - r) * f(z, b) + r * f(z, b + 1)


def main():
    counts = {}
    # Dynamic programming over 17 scalar excess entries validates the
    # discrete-convex formula against an independent minimization method.
    checks = 0
    for z in range(17):
        values = [f(z, d) for d in range(7)]
        assert all(values[d + 2] - values[d + 1] >=
                   values[d + 1] - values[d] for d in range(5))
        dp = {0: 0}
        for _ in range(17):
            next_dp = {}
            for total, cost in dp.items():
                for d in range(7):
                    key = total + d
                    next_dp[key] = min(next_dp.get(key, 10**9), cost + f(z, d))
            dp = next_dp
        for excess, minimum in dp.items():
            assert minimum == balanced(z, excess)
            checks += 1
    counts['convex_balancing_cells'] = checks

    # Replay the K1 aggregate outer envelope. These are integer budgets,
    # not graph feasibility checks or enumeration of candidate graphs.
    results = []
    checks = 0
    for z in range(4):
        excesses = [0] if z == 0 else range(z, 6 * z + 1)
        for ec in excesses:
            worst = None
            for i in range(17):
                for j in range(17 - i):
                    ed = ec + j - i
                    if not 0 <= ed <= 102:
                        continue
                    et = 26 + i + j
                    total = ec + ed + et
                    assert total == 2 * ec + 26 + 2 * j
                    b0 = total // 2 + 4
                    assert b0 == 17 + ec + j
                    jlo = max(0, 9 - z) * (ec + et) + balanced(z, ed)
                    qsum = (17 - z) * b0 - jlo
                    if worst is None or qsum > worst:
                        worst = qsum
                    checks += 1
            density = 85 - worst // (17 - z)
            if z <= 2 or ec <= 4:
                assert density >= {0: 78, 1: 74, 2: 69, 3: 69}[z]
            results.append({'z': z, 'E_C': ec, 'guaranteed_density': density,
                            'maximum_q_sum': worst})
    counts['k1_offset_budget_cells'] = checks

    # Small-clique degree cases and K3 residual-core transport.
    cases = []
    for eps in product(range(3), repeat=3):
        if all(eps[i] + eps[j] <= 2 for i, j in combinations(range(3), 2)):
            assert 0 in eps or eps == (1, 1, 1)
            if 0 in eps:
                destination = 65 + sum(eps)
                assert destination > 58
                if 2 in eps:
                    assert destination >= 67
            cases.append(eps)
    counts['k3_small_clique_degree_patterns'] = len(cases)
    checks = 0
    for z in range(3):
        for q in range(27, 33):
            for ec in ([0] if z == 0 else range(z, 6 * z + 1)):
                upper = (1 + z) * (q + ec) + 222 - 10 * z
                assert 85 - upper // (15 - z) >= {0: 69, 1: 65, 2: 60}[z]
                for total in range(0, 2 * q + 2 * ec + 31, 2):
                    b0 = total // 2 + 4
                    raw = (15 - z) * b0 - (7 - z) * (total - 21)
                    assert raw <= upper
                    checks += 1
    counts['k3_core_transport_budget_cells'] = checks

    # Pair-bound table, including the stronger R(4,3) cap for nonedges.
    lower = {10: 14, 11: 19, 12: 26, 13: 33, 14: 41,
             15: 50, 16: 60, 17: 68}
    table = []
    for gamma, ks in ((1, range(4)), (0, range(1, 6))):
        for k in ks:
            crosscap = 7 + k if gamma else min(8, 5 + k)
            constant = 2 * lower[18 - gamma - k] + (16 + 2 * gamma - crosscap) * k
            table.append((gamma, k, constant, (constant - 1) // 2))
    assert table == [(1, 0, 136, 67), (1, 1, 130, 64),
                     (1, 2, 118, 58), (1, 3, 106, 52),
                     (0, 1, 146, 72), (0, 2, 138, 68),
                     (0, 3, 124, 61), (0, 4, 114, 56),
                     (0, 5, 106, 52)]
    counts['pair_table_rows'] = len(table)

    # Check all rounding transformations against exact rational arithmetic.
    checks = 0
    for t in (2, 3, 4):
        for signature_excess in product(range(5), repeat=t + 1):
            total = sum(signature_excess)
            if total % 2:
                continue
            weighted = sum(j * w for j, w in enumerate(signature_excess))
            signed = sum((t - 2 * j) * w for j, w in enumerate(signature_excess))
            assert t * (total // 2 + 4) - weighted == 4 * t + Fraction(signed, 2)
            qcap = 4 + signed // (2 * t)
            assert qcap == (t * (total // 2 + 4) - weighted) // t
            for q in range(36):
                assert (signed < 2 * t * (q - 4)) == (qcap < q)
                checks += 1
    for delta, target in ((51, 69), (27, 75), (3, 81), (-9, 84)):
        assert 81 - delta // 4 == target
    counts['signature_rounding_cells'] = checks

    # The two-level family count must never overcount strict destinations.
    checks = 0
    for q in range(4):
        for b0 in range(q, q + 4):
            u0 = b0
            threshold = b0 - q
            if u0 <= threshold:
                continue
            options = [(qu, eu) for qu in range(b0 + 1)
                       for eu in range(b0 + 1 - qu)]
            for roots in product(options, repeat=2):
                jf = sum(eu for qu, eu in roots)
                actual = sum(qu < q for qu, eu in roots)
                lower_count = max(0, -(-(jf - 2 * threshold) // (u0 - threshold)))
                assert lower_count <= actual
                checks += 1
    counts['strict_destination_family_count_cells'] = checks

    # The pair identity is graph accounting. Test its degree-d version on
    # tiny arbitrary graphs, with no homogeneity search or candidate filtering.
    rng = random.Random(20261021)
    pair_checks = row_checks = column_checks = 0
    for n in range(5, 17):
        for _ in range(30):
            neighbors = [set() for _ in range(n)]
            for x, y in combinations(range(n), 2):
                if rng.randrange(2):
                    neighbors[x].add(y)
                    neighbors[y].add(x)

            def edges(vertices):
                return sum(y in neighbors[x] for x, y in combinations(sorted(vertices), 2))

            def cut(xset, yset):
                return sum(y in neighbors[x] for x in xset for y in yset)

            for v, u in combinations(range(n), 2):
                if len(neighbors[v]) != len(neighbors[u]):
                    continue
                d = len(neighbors[v])
                gamma = int(u in neighbors[v])
                common = neighbors[v] & neighbors[u]
                xonly = neighbors[v] - common - {u}
                yonly = neighbors[u] - common - {v}
                outside = set(range(n)) - common - xonly - yonly - {u, v}
                k = len(common)
                es = sum(len(neighbors[z]) - d for z in common)
                lhs = edges(neighbors[v]) + edges(neighbors[u])
                rhs = edges(xonly) + edges(yonly) + (d - 2 + 2 * gamma) * k + es - cut(common, outside)
                assert lhs == rhs
                assert len(xonly) == len(yonly) == d - gamma - k
                pair_checks += 1
            for v in range(n):
                a = neighbors[v]
                b = set(range(n)) - a - {v}
                for u in a:
                    s = neighbors[u] & a
                    r = neighbors[u] & b
                    assert edges(neighbors[u]) == len(s) + edges(s) + edges(r) + cut(s, r)
                    row_checks += 1
                for y in b:
                    cset = neighbors[y] & a
                    rset = neighbors[y] & b
                    assert edges(neighbors[y]) == edges(cset) + edges(rset) + cut(cset, rset)
                    for t in cset:
                        row_without_y = (neighbors[t] & b) - {y}
                        lower_intersection = max(0, len(row_without_y) + len(rset) - (len(b) - 1))
                        assert len(row_without_y & rset) >= lower_intersection
                    column_checks += 1
    counts['tiny_graph_pair_identity_checks'] = pair_checks
    counts['tiny_graph_row_identity_checks'] = row_checks
    counts['tiny_graph_column_identity_checks'] = column_checks

    print(json.dumps({'status': 'PASS', 'counts': counts,
                      'k1_guarantees': results, 'pair_table': table}, indent=2))


if __name__ == '__main__':
    main()
