#!/usr/bin/env python3
"""Generate direct OPB Ramsey constraints and optional complete relabeling restrictions."""

import argparse
import hashlib
import itertools
import json
from pathlib import Path


def encode(n=16, r=4, minimum=61, symmetry="none"):
    edges = list(itertools.combinations(range(n), 2))
    variables = {edge: i + 1 for i, edge in enumerate(edges)}
    rows = []

    def edge(u, v):
        return variables[min(u, v), max(u, v)]

    for subset in itertools.combinations(range(n), r):
        ids = [variables[e] for e in itertools.combinations(subset, 2)]
        rows.append(([(v, -1) for v in ids], 1 - len(ids)))
        rows.append(([(v, 1) for v in ids], 1))
    rows.append(([(v, 1) for v in variables.values()], minimum))
    if symmetry != "none":
        if (n, r, minimum) != (16, 4, 61):
            raise ValueError("rooted modes are justified only for the order-16 threshold-61 target")
        for u in range(n):
            ids = [edge(u, v) for v in range(n) if u != v]
            rows.append(([(v, 1) for v in ids], 7))
            rows.append(([(v, -1) for v in ids], -8))
        for v in range(1, n):
            rows.append(([(edge(0, v), 1 if v <= 8 else -1)], 1 if v <= 8 else 0))
        if symmetry == "rooted-lex":
            for block in [range(1, 9), range(9, 16)]:
                for u, v in itertools.combinations(block, 2):
                    outside = [k for k in range(n) if k != u and k != v]
                    terms = []
                    for index, k in enumerate(outside):
                        weight = 1 << (len(outside) - 1 - index)
                        terms.extend([(edge(v, k), weight), (edge(u, k), -weight)])
                    rows.append((terms, 0))
        elif symmetry != "rooted":
            raise ValueError("unknown symmetry mode")
    return edges, rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path)
    parser.add_argument("--vertices", type=int, default=16)
    parser.add_argument("--homogeneous", type=int, default=4)
    parser.add_argument("--minimum", type=int, default=61)
    parser.add_argument("--symmetry", choices=["none", "rooted", "rooted-lex"], default="none")
    parser.add_argument("--proof-header", action="store_true",
                        help="include equality count and integer size required by RoundingSat proof logging")
    args = parser.parse_args()
    if args.vertices < 0 or args.homogeneous < 2 or args.minimum < 0:
        parser.error("invalid graph or cardinality parameters")
    try:
        edges, rows = encode(args.vertices, args.homogeneous, args.minimum, args.symmetry)
    except ValueError as error:
        parser.error(str(error))
    args.output.parent.mkdir(parents=True, exist_ok=True)
    header = f"* #variable= {len(edges)} #constraint= {len(rows)}"
    if args.proof_header:
        integer_bits = 1 + max(
            (abs(value).bit_length() for terms, rhs in rows
             for value in itertools.chain((rhs,), (coefficient for _, coefficient in terms))),
            default=0,
        )
        header += f" #equal= 0 intsize= {integer_bits}"
    with args.output.open("w") as stream:
        stream.write(header + "\n")
        for terms, rhs in rows:
            stream.write(" ".join(f"{coefficient:+d} x{variable}" for variable, coefficient in terms))
            stream.write(f" >= {rhs};\n")
    print(json.dumps({
        "variables": len(edges), "auxiliary_variables": 0, "constraints": len(rows),
        "symmetry": args.symmetry, "bytes": args.output.stat().st_size,
        "sha256": hashlib.sha256(args.output.read_bytes()).hexdigest(),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
