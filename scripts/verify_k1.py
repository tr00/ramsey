#!/usr/bin/env python3
"""Replay k1 row witnesses; independently brute-force deterministic samples.

Usage: python3 scripts/verify_k1.py DATA_DIRECTORY OUTPUT_ROWS.g6
Then use countg -n17 -d8 -D8 -k3 -h3 OUTPUT_ROWS.g6 to audit every row.
Negative results are independently checked only on the reported samples.
"""
import csv
import json
import sys
from itertools import combinations
from pathlib import Path

from verify_b24 import decode


def encode_row(adj, vertices):
    bits = [int(u in adj[v]) for j, v in enumerate(vertices) for u in vertices[:j]]
    bits += [0] * (-len(bits) % 6)
    return chr(len(vertices) + 63) + "".join(
        chr(63 + sum(bits[k + t] << (5 - t) for t in range(6)))
        for k in range(0, len(bits), 6)
    ) + "\n"


def brute_row(adj):
    masks = [sum(1 << w for w in neighbors) for neighbors in adj]
    for omitted in combinations(range(24), 7):
        row = ((1 << 24) - 1) ^ sum(1 << v for v in omitted)
        vertices = [v for v in range(24) if row >> v & 1]
        if not all((masks[v] & row).bit_count() == 8 for v in vertices):
            continue
        if all(sum(v in adj[u] for u, v in combinations(q, 2)) not in (0, 6)
               for q in combinations(vertices, 4)):
            return True
    return False


def verify(directory, output):
    assert output.resolve() not in {
        (directory / name).resolve()
        for name in ("b24.g6", "k1_survivors.g6", "k1_witnesses.tsv")
    }
    with (directory / "k1_witnesses.tsv").open() as handle:
        records = list(csv.DictReader(handle, delimiter="\t"))
    witnesses = {int(row["index"]): int(row["row_mask_hex"], 16) for row in records}
    assert len(witnesses) == len(records)
    assert list(witnesses) == sorted(witnesses)
    sample_indices = set(range(1, 9)) | {1 + i * 352365 // 32 for i in range(33)}
    samples = []
    accepted = 0
    total = 0
    with (directory / "b24.g6").open("rb") as source, \
         (directory / "k1_survivors.g6").open("rb") as survivors, \
         output.open("w") as rows:
        for index, line in enumerate(source, 1):
            total = index
            if index not in witnesses and index not in sample_indices:
                continue
            adj = decode(line)
            if index in witnesses:
                assert survivors.readline() == line, index
                row = witnesses[index]
                assert 0 <= row < 1 << 24 and row.bit_count() == 17, index
                vertices = [v for v in range(24) if row >> v & 1]
                selected = set(vertices)
                assert all(len(adj[v] & selected) == 8 for v in vertices), index
                rows.write(encode_row(adj, vertices))
                accepted += 1
            if index in sample_indices:
                result = brute_row(adj)
                assert result == (index in witnesses), index
                samples.append({"index": index, "survives": result})
        assert not survivors.read(1)
    assert total == 352366 and accepted == len(witnesses)
    return {"graphs": total, "verified_witnesses": accepted,
            "independent_exhaustive_samples": samples,
            "all_row_K4_I4_check": "Run gtools countg on output rows separately."}


if __name__ == "__main__":
    print(json.dumps(verify(Path(sys.argv[1]), Path(sys.argv[2])), sort_keys=True))
