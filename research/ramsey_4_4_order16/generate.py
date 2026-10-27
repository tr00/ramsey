#!/usr/bin/env python3
"""Generate unrestricted Ramsey CNFs with a prefix-count edge lower bound."""

import argparse
import hashlib
import itertools
import json
from pathlib import Path


def encode(n, r, minimum):
    edges = list(itertools.combinations(range(n), 2))
    variables = {edge: i + 1 for i, edge in enumerate(edges)}
    clauses = []
    for subset in itertools.combinations(range(n), r):
        row = [variables[e] for e in itertools.combinations(subset, 2)]
        clauses.extend([[-v for v in row], row])
    core_count = len(clauses)
    count = len(edges)
    prefix = {}

    def add(*literals):
        if True in [x for x in literals if isinstance(x, bool)]:
            return
        clauses.append([x for x in literals if not isinstance(x, bool)])

    def neg(literal):
        return not literal if isinstance(literal, bool) else -literal

    def at(i, j):
        if j == 0:
            return True
        if j > i:
            return False
        return prefix[i, j]

    for i in range(1, len(edges) + 1):
        for j in range(1, min(i, minimum) + 1):
            count += 1
            prefix[i, j] = count
            a, b, x, y = at(i - 1, j), at(i - 1, j - 1), i, count
            # y iff a or (b and x).
            add(neg(a), y)
            add(neg(b), -x, y)
            add(-y, a, b)
            add(-y, a, x)
    add(at(len(edges), minimum))
    return count, clauses, edges, prefix, core_count


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('output', type=Path)
    parser.add_argument('--vertices', type=int, default=16)
    parser.add_argument('--homogeneous', type=int, default=4)
    parser.add_argument('--minimum', type=int, default=61)
    args = parser.parse_args()
    if args.vertices < 0 or args.homogeneous < 2 or args.minimum < 0:
        parser.error('invalid graph or cardinality parameters')
    count, clauses, edges, _, core = encode(args.vertices, args.homogeneous, args.minimum)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open('w') as stream:
        stream.write(f'p cnf {count} {len(clauses)}\n')
        for clause in clauses:
            stream.write(' '.join(map(str, clause)) + ' 0\n')
    print(json.dumps({
        'vertices': args.vertices, 'homogeneous': args.homogeneous,
        'minimum_edges': args.minimum, 'edge_variables': len(edges),
        'variables': count, 'ramsey_clauses': core, 'clauses': len(clauses),
        'bytes': args.output.stat().st_size,
        'sha256': hashlib.sha256(args.output.read_bytes()).hexdigest(),
        'symmetry_breaking': False,
    }, sort_keys=True))


if __name__ == '__main__':
    main()
