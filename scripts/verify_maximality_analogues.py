#!/usr/bin/env python3
"""Machine verification for research/n43/d18/catalogue_edge_maximality.md.

Deterministic, standard library only, no downloads. Verifies that restricting
the B-side catalogue to edge-maximal members destroys completeness of the
rooted v + A + B pivot search in the two direct analogues:

  (3,5)/13: pivot degree 4, |A|=4, |B|=8, B (3,4)-free;
  (4,4)/17: pivot degree 8, |A|=8, |B|=8, B (4,3)-free.

Exit code 0 iff every check passes.
"""
import itertools
import sys

FAIL = []


def check(name, cond):
    print(("PASS" if cond else "FAIL"), name)
    if not cond:
        FAIL.append(name)


# ---------------------------------------------------------------- 8-vertex census
N = 8
PAIRS = [(i, j) for i in range(N) for j in range(i + 1, N)]


def has_indep4(adj):
    for (a, b, c, d) in itertools.combinations(range(N), 4):
        if not ((adj[a] >> b & 1) | (adj[a] >> c & 1) | (adj[a] >> d & 1)
                | (adj[b] >> c & 1) | (adj[b] >> d & 1) | (adj[c] >> d & 1)):
            return True
    return False


sols, adj, deg = [], [0] * N, [0] * N


def rec(k):
    if k == 28:
        if min(deg) >= 2 and not has_indep4(adj):
            sols.append(tuple(adj))
        return
    i, j = PAIRS[k]
    rec(k + 1)
    # deg<=3 is necessary for alpha<=3 in a triangle-free graph (N(u) independent)
    if deg[i] < 3 and deg[j] < 3 and (adj[i] & adj[j]) == 0:
        adj[i] |= 1 << j
        adj[j] |= 1 << i
        deg[i] += 1
        deg[j] += 1
        rec(k + 1)
        adj[i] &= ~(1 << j)
        adj[j] &= ~(1 << i)
        deg[i] -= 1
        deg[j] -= 1


rec(0)


def strong_inv(g):
    e = sum(bin(a).count("1") for a in g) // 2
    ds = tuple(sorted(bin(a).count("1") for a in g))
    cn, cnn = [], []
    for (i, j) in PAIRS:
        if (g[i] >> j) & 1:
            cnn.append(bin((~g[i] & 255) & (~g[j] & 255)).count("1"))
        else:
            cn.append(bin(g[i] & g[j]).count("1"))
    return (e, ds, tuple(sorted(cn)), tuple(sorted(cnn)))


def canon8(g):
    best = None
    for pi in itertools.permutations(range(N)):
        v = 0
        for t, (i, j) in enumerate(PAIRS):
            a, b = pi[i], pi[j]
            if (g[max(a, b)] >> min(a, b)) & 1:
                v |= 1 << t
        if best is None or v < best:
            best = v
    return best


buckets = {}
for s in sols:
    buckets.setdefault(strong_inv(s), []).append(s)
reps = {}
for lst in buckets.values():
    reps[canon8(lst[0])] = lst[0]

e_of = lambda g: sum(bin(a).count("1") for a in g) // 2
by_e = sorted((e_of(g), g) for g in reps.values())

check("exactly 3 iso classes of (3,4)-graphs on 8 vertices", len(reps) == 3)
check("e-values of (3,4)-classes are {10,11,12}", [e for e, _ in by_e] == [10, 11, 12])
check("e=10 class has degree sequence (2,2,2,2,3,3,3,3)",
      tuple(sorted(bin(a).count("1") for a in dict(by_e)[10])) == (2, 2, 2, 2, 3, 3, 3, 3))


def sat_triangle_free(g):
    return all((g[i] & g[j]) != 0 for (i, j) in PAIRS if not ((g[i] >> j) & 1))


def sat_k4_free(g):
    for (i, j) in PAIRS:
        if (g[i] >> j) & 1:
            continue
        cm = g[i] & g[j]
        bits = [u for u in range(N) if (cm >> u) & 1]
        if not any((g[a] >> b) & 1 for a, b in itertools.combinations(bits, 2)):
            return False
    return True


compl = lambda g: tuple((~a) & 255 for a in g)
sat_e = sorted(e_of(g) for g in reps.values() if sat_triangle_free(g))
satC_e = sorted(e_of(compl(g)) for g in reps.values() if sat_k4_free(compl(g)))
check("only edge-maximal (3,4)-graphs have e=12 (Wagner graph)", sat_e == [12])
check("only K4-saturated (4,3)-graph has e=22", satC_e == [22])

# ------------------------------------------------- (3,5)/13 analogue gluing
TRIP = list(itertools.combinations(range(8), 3))
C3_13 = list(itertools.combinations(range(13), 3))
C5_13 = list(itertools.combinations(range(13), 5))


def build_13(B, rows):
    g = [0] * 13
    for (i, j) in PAIRS:
        if (B[i] >> j) & 1:
            g[i] |= 1 << j
            g[j] |= 1 << i
    for ai, R in zip((8, 9, 10, 11), rows):
        g[12] |= 1 << ai
        g[ai] |= 1 << 12
        for b in R:
            g[ai] |= 1 << b
            g[b] |= 1 << ai
    return tuple(g)


tri13 = lambda g: not any((g[a] >> b & 1) and (g[a] >> c & 1) and (g[b] >> c & 1)
                          for a, b, c in C3_13)


def alpha4(g):
    for S in C5_13:
        if not any((g[a] >> b) & 1 for a, b in itertools.combinations(S, 2)):
            return False
    return True


def pivot_stats(g, p):
    M = [u for u in range(13) if u != p and not ((g[p] >> u) & 1)]
    sub = 0
    for u in M:
        sub |= 1 << u
    eM = sum(1 for a, b in itertools.combinations(M, 2) if (g[a] >> b) & 1)
    sat = all((g[a] & g[b] & sub) != 0
              for a, b in itertools.combinations(M, 2) if not ((g[a] >> b) & 1))
    return len(M), eM, sat


valid, total_assign, feasible_B = [], 0, 0
for e, B in by_e:
    dB = [bin(B[b]).count("1") for b in range(8)]
    need = [4 - d for d in dB]
    if any(c < 0 for c in need) or sum(need) != 12:
        continue  # column budget infeasible: only e=10 survives (pinning)
    feasible_B += 1
    ind = [t for t in TRIP if all(not ((B[a] >> b) & 1)
                                  for a, b in itertools.combinations(t, 2))]
    found = []

    def assign(k, rem, rows):
        if k == 4:
            if all(c == 0 for c in rem):
                found.append(tuple(rows))
            return
        if sum(rem) > 3 * (4 - k):
            return
        for t in ind:
            nr = list(rem)
            ok = True
            for b in t:
                nr[b] -= 1
                if nr[b] < 0:
                    ok = False
            if ok:
                assign(k + 1, nr, rows + [t])

    assign(0, list(need), [])
    for rows in found:
        total_assign += 1
        g = build_13(B, rows)
        if tri13(g) and alpha4(g) and all(bin(x).count("1") == 4 for x in g):
            valid.append(g)

check("only the e=10 B-class admits row assignments", feasible_B == 1)
check("48 valid 13-vertex (3,5)-graphs assembled", len(valid) == 48)
check("all valid 13-graphs: every pivot has (|M|=8, e(M)=10, non-maximal)",
      all(pivot_stats(g, p) == (8, 10, False) for g in valid for p in range(13)))

w = tuple(sum(1 << ((i + d) % 13) for d in (1, 5, 8, 12)) for i in range(13))
check("circulant C13(1,5) is a valid 13-vertex (3,5)-graph witness",
      tri13(w) and alpha4(w) and all(bin(x).count("1") == 4 for x in w))
check("C13(1,5): all pivots (8, 10, False)",
      all(pivot_stats(w, p) == (8, 10, False) for p in range(13)))

# ------------------------------------------------- (4,4)/17 analogue witness
Q = {x * x % 17 for x in range(1, 17)}
P = tuple(sum(1 << ((i + d) % 17) for d in Q) for i in range(17))
k4free = not any(all((P[y] >> z) & 1 for y, z in itertools.combinations(S, 2))
                 for S in itertools.combinations(range(17), 4))
a3 = all(any((P[a] >> b) & 1 for a, b in itertools.combinations(S, 2))
         for S in itertools.combinations(range(17), 4))
check("Paley-17 is a valid 17-vertex (4,4)-graph (8-regular)",
      k4free and a3 and all(bin(x).count("1") == 8 for x in P))

res = set()
for v in range(17):
    A = [u for u in range(17) if u != v and (P[v] >> u) & 1]
    B = [u for u in range(17) if u != v and not ((P[v] >> u) & 1)]
    eA = sum(1 for a, b in itertools.combinations(A, 2) if (P[a] >> b) & 1)
    eB = sum(1 for a, b in itertools.combinations(B, 2) if (P[a] >> b) & 1)
    satB = True
    for x, y in itertools.combinations(B, 2):
        if not ((P[x] >> y) & 1):
            bits = [u for u in B if (P[x] >> u) & 1 and (P[y] >> u) & 1]
            if not any((P[a] >> b) & 1 for a, b in itertools.combinations(bits, 2)):
                satB = False
                break
    res.add((eA, eB, eB - eA, satB))
check("Paley-17: every pivot (e(A)=12, e(B)=16, e(B)-e(A)=4, B not saturated)",
      res == {(12, 16, 4, False)})
# universality at 17 needs e(B)=e(A)+4 with e(A) in {10,11,12}, and the unique
# saturated (4,3)-class has e=22: covered by the census checks above.

print()
if FAIL:
    print("FAILED:", len(FAIL), "checks")
    sys.exit(1)
print("ALL CHECKS PASSED")
