#!/usr/bin/env python3
"""Replay B24 metrics without nauty; exhaustive subsets on deterministic samples.

Usage: python3 scripts/verify_b24.py data/r45_24
All records: check complement bytes, unchanged survivors, metric histograms
against countg. Sample records: independently decode into sets and enumerate
all four- and five-subsets, all K4 degree sums, and every safe F-edge addition.
This is not an independent full-catalogue Ramsey-freeness certificate.
"""
import csv
import json
import sys
from collections import Counter, defaultdict
from itertools import combinations, zip_longest
from pathlib import Path


def decode(line):
    assert len(line) == 48 and line[0] == 87 and line[-1] == 10
    bits = "".join(f"{c - 63:06b}" for c in line[1:-1])
    adj = [set() for _ in range(24)]
    pos = 0
    for j in range(1, 24):
        for i in range(j):
            if bits[pos] == "1":
                adj[i].add(j)
                adj[j].add(i)
            pos += 1
    return adj


def verify(directory):
    histogram = Counter()
    maxsum_histogram = Counter()
    safe_histogram = Counter()
    degree_ranges = defaultdict(list)
    samples = {}
    categories = set()
    total = 0
    with (directory / "r45_24.g6").open("rb") as source, \
         (directory / "b24.g6").open("rb") as complemented, \
         (directory / "b24_survivors.g6").open("rb") as survivors, \
         (directory / "b24_metrics.tsv").open() as metrics:
        for index, records in enumerate(zip_longest(source, complemented, survivors,
                csv.DictReader(metrics, delimiter="\t")), 1):
            original, bline, kept, row = records
            assert all(record is not None for record in records), index
            assert original[:1] == bline[:1] == b"W" and len(original) == len(bline) == 48
            assert all(x + y == 189 for x, y in zip(original[1:-1], bline[1:-1])), index
            assert bline == kept, index
            row = {key: int(value) for key, value in row.items()}
            assert row["index"] == index and row["accepted"] == 1
            e = row["edges"]
            # Independent population count directly on graph6 six-bit chunks.
            assert e == sum((c - 63).bit_count() for c in bline[1:-1]), index
            assert row["x_lo"] == max(136, 432 - 2 * e)
            assert row["x_hi"] == min(279, 576 - 2 * e)
            histogram[e] += 1
            maxsum_histogram[row["max_k4_degree_sum"]] += 1
            safe_histogram[row["safe_F_additions"]] += 1
            degree_ranges[e].append((row["min_degree"], row["max_degree"]))
            # Cover every edge count, maximum K4 sum, saturation status, and
            # evenly spaced records. No randomized or cherry-picked samples.
            keys = [("edge", e), ("k4max", row["max_k4_degree_sum"]),
                    ("saturated", row["safe_F_additions"] == 0)]
            if index == 1 or index % 8192 == 0 or any(key not in categories for key in keys):
                samples[index] = (original, bline, row)
            categories.update(keys)
            total = index
    assert total == 352366
    with (directory / "countg_edges_degrees.txt").open() as handle:
        countg = [list(map(int, line.split())) for line in handle if line.strip()]
    assert {row[0]: row[-1] for row in countg} == dict(histogram)
    for e, minlo, minhi, maxlo, maxhi, _ in countg:
        bounds = degree_ranges[e]
        assert (min(x for x, _ in bounds), max(x for x, _ in bounds),
                min(y for _, y in bounds), max(y for _, y in bounds)) == (minlo, minhi, maxlo, maxhi)
    assert (directory / "b24_rejections.tsv").read_text() == "index\tpredicate\twitness\n"
    nonmaximal_witness = None
    for index, (original, bline, row) in samples.items():
        b = decode(bline)
        f = decode(original)
        assert all(b[i].isdisjoint(f[i]) and len(b[i] | f[i]) == 23 for i in range(24))
        degrees = [len(neighbors) for neighbors in b]
        assert (sum(degrees) // 2, min(degrees), max(degrees)) == (
            row["edges"], row["min_degree"], row["max_degree"])
        clique_sums = []
        for q in combinations(range(24), 4):
            edges = sum(v in b[u] for u, v in combinations(q, 2))
            assert edges != 0, (index, "I4", q)
            if edges == 6:
                clique_sums.append(sum(degrees[u] for u in q))
        assert (len(clique_sums), max(clique_sums, default=0)) == (
            row["k4_count"], row["max_k4_degree_sum"]), index
        for q in combinations(range(24), 5):
            assert not all(v in b[u] for u, v in combinations(q, 2)), (index, "K5", q)
        safe = []
        for u, v in combinations(range(24), 2):
            if v not in f[u]:
                common = f[u] & f[v]
                if not any(y in f[x] for x, y in combinations(sorted(common), 2)):
                    safe.append([u, v])
        assert len(safe) == row["safe_F_additions"], index
        if safe and nonmaximal_witness is None:
            u, v = safe[0]
            f[u].add(v)
            f[v].add(u)
            for q in combinations(range(24), 4):
                assert not all(y in f[x] for x, y in combinations(q, 2))
            for q in combinations(range(24), 5):
                assert any(y in f[x] for x, y in combinations(q, 2))
            nonmaximal_witness = {"index": index,
                "original_graph6": original.decode().strip(), "add_edge": [u, v],
                "verification": "F plus this edge exhaustively checked K4-free and I5-free"}
    result = {
        "all_record_complement_and_survivor_checks": total,
        "independent_exhaustive_sample_count": len(samples),
        "sample_indices": sorted(samples),
        "countg_edge_and_degree_histograms_agree": True,
        "edge_histogram_B": dict(sorted(histogram.items())),
        "max_K4_degree_sum_histogram": dict(sorted(maxsum_histogram.items())),
        "safe_original_additions_histogram": dict(sorted(safe_histogram.items())),
        "maximal_originals": safe_histogram[0],
        "nonmaximal_originals": total - safe_histogram[0],
        "nonmaximal_witness": nonmaximal_witness,
    }
    return result


if __name__ == "__main__":
    print(json.dumps(verify(Path(sys.argv[1])), indent=2, sort_keys=True))
