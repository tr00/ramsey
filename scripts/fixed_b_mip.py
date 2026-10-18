#!/usr/bin/env python3
"""Generate the exact OPB core for a degree-18 pivot and a fixed B24.

Usage:
    python3 scripts/fixed_b_mip.py data/r45_24/b24.g6 --index 1 -o /tmp/b1.opb

The input is B itself (K5/I4-free), NOT its catalogue complement. --index is
one-based. A single-record graph6 file and an optional graph6 header work too.
Variables x1..x153 encode A edges in lexicographic (i,j) order; x154..x585
encode cross edges in row-major (i,y) order. Mapping comments use zero-based
local labels a_i_j and m_i_y. The pivot is complete to A and anticomplete to B.
All variables are boolean; there is no objective. No degree cuts, symmetry
breaking, x136 exclusion, or other strengthening is included. No solver or
third-party package is used.

Forbidden cliques give -sum(edges) >= 1 - number_of_edges; forbidden independent
sets give sum(edges) >= 1. Fixed B incidences are simplified out. Output follows
third-party/roundingsat/InputFormats.md: exact header, comments, >= inequalities
and semicolon terminators.
See n43/d18/fixed_b_extensions.md#claim-fixed-b-exact-extension.
"""
from __future__ import annotations

import argparse
import json
import os
import sys
import tempfile
from collections import Counter
from itertools import combinations
from math import comb
from pathlib import Path
from typing import Iterator, TextIO

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from ramsey import check_ramsey_graph, sha256_file  # noqa: E402

Edge = tuple[int, int]


def read_record(path: Path, index: int) -> str:
    if index < 1:
        raise ValueError("--index must be at least 1 (one-based)")
    count = 0
    with path.open(encoding="ascii") as stream:
        for line in stream:
            record = line.rstrip("\r\n")
            if count == 0 and record.startswith(">>graph6<<"):
                record = record[len(">>graph6<<"):]
            if not record:
                continue
            count += 1
            if count == index:
                return record
    raise ValueError(f"{path}: requested record {index}, found only {count}")


def decode_b24(record: str) -> frozenset[Edge]:
    if len(record) != 47 or record[0] != "W":
        raise ValueError("expected a graph6 record for exactly 24 vertices")
    chunks = [ord(char) - 63 for char in record[1:]]
    if any(value < 0 or value > 63 for value in chunks):
        raise ValueError("invalid graph6 character")
    edges = set()
    bit = 0
    for y in range(1, 24):
        for x in range(y):
            if chunks[bit // 6] & (1 << (5 - bit % 6)):
                edges.add((x, y))
            bit += 1
    return frozenset(edges)


def iter_core_rows(
    a_vertices: int, b_vertices: int, b_edges: frozenset[Edge]
) -> Iterator[tuple[str, tuple[int, ...], str, int]]:
    """Yield positive-unit-coefficient inequalities; small orders permit audits."""
    a_variables = {
        edge: index
        for index, edge in enumerate(combinations(range(a_vertices), 2), 1)
    }
    cross_variables = tuple(
        tuple(len(a_variables) + i * b_vertices + y + 1 for y in range(b_vertices))
        for i in range(a_vertices)
    )
    for size, family, sense in ((4, "K4_A", "<="), (5, "I5_A", ">=")):
        for subset in combinations(range(a_vertices), size):
            terms = tuple(a_variables[edge] for edge in combinations(subset, 2))
            yield family, terms, sense, len(terms) - 1 if sense == "<=" else 1

    # K5 with >=4 A vertices is excluded by K4_A. I5 with >=4 B vertices
    # is excluded by B's I4-freeness. Pure B obstructions are checked on input.
    families = (
        (True, 1, 4), (True, 2, 3), (True, 3, 2),
        (False, 2, 3), (False, 3, 2), (False, 4, 1),
    )
    for clique, a_size, b_size in families:
        family = f"{'K5' if clique else 'I5'}_A{a_size}_B{b_size}"
        sense = "<=" if clique else ">="
        a_subsets = tuple(
            (subset, tuple(a_variables[edge] for edge in combinations(subset, 2)))
            for subset in combinations(range(a_vertices), a_size)
        )
        for b_subset in combinations(range(b_vertices), b_size):
            if not all(
                (edge in b_edges) == clique
                for edge in combinations(b_subset, 2)
            ):
                continue
            for a_subset, internal_terms in a_subsets:
                terms = internal_terms + tuple(
                    cross_variables[i][y] for i in a_subset for y in b_subset
                )
                yield family, terms, sense, len(terms) - 1 if clique else 1


def write_core_opb(
    stream: TextIO,
    b_edges: frozenset[Edge],
    record: str,
    a_vertices: int = 18,
    b_vertices: int = 24,
) -> tuple[int, dict[str, int]]:
    b_triples = Counter(
        sum(edge in b_edges for edge in combinations(subset, 2))
        for subset in combinations(range(b_vertices), 3)
    )
    b_k4 = sum(
        all(edge in b_edges for edge in combinations(subset, 2))
        for subset in combinations(range(b_vertices), 4)
    )
    counts = {
        "K4_A": comb(a_vertices, 4),
        "I5_A": comb(a_vertices, 5),
        "K5_A1_B4": a_vertices * b_k4,
        "K5_A2_B3": comb(a_vertices, 2) * b_triples[3],
        "K5_A3_B2": comb(a_vertices, 3) * len(b_edges),
        "I5_A2_B3": comb(a_vertices, 2) * b_triples[0],
        "I5_A3_B2": comb(a_vertices, 3) * (comb(b_vertices, 2) - len(b_edges)),
        "I5_A4_B1": comb(a_vertices, 4) * b_vertices,
    }
    variables = comb(a_vertices, 2) + a_vertices * b_vertices
    constraints = sum(counts.values())
    stream.write(f"* #variable= {variables} #constraint= {constraints}\n")
    stream.write("* Exact fixed-B Ramsey (5,5) rooted extension core\n")
    stream.write(f"* A vertices: {a_vertices}; B vertices: {b_vertices}\n")
    stream.write(f"* B graph6: {record}\n")
    stream.write("* a_i_j: A edge; m_i_y: cross edge; zero-based local labels\n")
    for index, (i, j) in enumerate(combinations(range(a_vertices), 2), 1):
        stream.write(f"* x{index} = a_{i}_{j}\n")
    for i in range(a_vertices):
        for y in range(b_vertices):
            index = comb(a_vertices, 2) + i * b_vertices + y + 1
            stream.write(f"* x{index} = m_{i}_{y}\n")
    emitted: Counter[str] = Counter()
    for family, terms, sense, rhs in iter_core_rows(a_vertices, b_vertices, b_edges):
        coefficient = "-1" if sense == "<=" else "+1"
        degree = -rhs if sense == "<=" else rhs
        stream.write(" ".join(f"{coefficient} x{variable}" for variable in terms))
        stream.write(f" >= {degree};\n")
        emitted[family] += 1
    if emitted != Counter(counts):
        raise AssertionError(f"emitted {dict(emitted)} constraints; expected {counts}")
    return variables, counts


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("b", type=Path, help="graph6 file containing B, not its complement")
    parser.add_argument("--index", type=int, default=1, help="one-based graph record (default: 1)")
    parser.add_argument("-o", "--output", type=Path, required=True, help="destination OPB file")
    args = parser.parse_args(argv)
    temporary_name: str | None = None
    try:
        if args.b.resolve() == args.output.resolve():
            raise ValueError("input and output paths must differ")
        record = read_record(args.b, args.index)
        b_edges = decode_b24(record)
        result = check_ramsey_graph(24, b_edges, 5, 4)
        if not result.valid:
            name = "K5" if result.obstruction == "clique" else "I4"
            raise ValueError(f"B is not (5,4)-free: {name} on vertices {result.vertices}")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with tempfile.NamedTemporaryFile(
            mode="w", encoding="utf-8", newline="\n", dir=args.output.parent,
            prefix=f".{args.output.name}.", suffix=".tmp", delete=False,
        ) as stream:
            temporary_name = stream.name
            variables, counts = write_core_opb(stream, b_edges, record)
        os.replace(temporary_name, args.output)
        temporary_name = None
        print(json.dumps({
            "input": str(args.b), "index": args.index, "b_graph6": record,
            "b_edges": len(b_edges), "output": str(args.output),
            "variables": variables, "constraints": sum(counts.values()),
            "families": counts, "bytes": args.output.stat().st_size,
            "sha256": sha256_file(args.output),
        }, sort_keys=True))
        return 0
    except (OSError, ValueError, UnicodeError) as error:
        parser.exit(2, f"{parser.prog}: {error}\n")
    finally:
        if temporary_name is not None:
            os.unlink(temporary_name)


if __name__ == "__main__":
    raise SystemExit(main())
