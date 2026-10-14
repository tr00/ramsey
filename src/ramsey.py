#!/usr/bin/env python3
"""Small, dependency-free reference tools for finite Ramsey graphs."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import math
import os
import sys
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Iterator, TextIO

Edge = tuple[int, int]


@dataclass(frozen=True)
class CheckResult:
    valid: bool
    obstruction: str | None = None
    vertices: tuple[int, ...] | None = None


def normalize_edge(u: int, v: int) -> Edge:
    if u == v:
        raise ValueError(f"loop ({u}, {v}) is not a graph edge")
    return (u, v) if u < v else (v, u)


def validate_parameters(vertices: int, clique: int, independent: int) -> None:
    if vertices < 0:
        raise ValueError("the number of vertices must be nonnegative")
    if clique < 2 or independent < 2:
        raise ValueError("clique and independent-set sizes must be at least 2")


def all_edges(vertices: int) -> Iterator[Edge]:
    yield from itertools.combinations(range(vertices), 2)


def edge_variables(vertices: int) -> dict[Edge, int]:
    """Map lexicographically ordered edges to one-based DIMACS variables."""
    return {edge: index for index, edge in enumerate(all_edges(vertices), 1)}


def canonical_edges(vertices: int, edges: Iterable[Edge]) -> frozenset[Edge]:
    result: set[Edge] = set()
    for raw_u, raw_v in edges:
        edge = normalize_edge(raw_u, raw_v)
        if edge[0] < 0 or edge[1] >= vertices:
            raise ValueError(
                f"edge {edge} is outside the vertex range 0..{vertices - 1}"
            )
        if edge in result:
            raise ValueError(f"duplicate edge {edge}")
        result.add(edge)
    return frozenset(result)


def read_edge_list(path: str | os.PathLike[str], vertices: int) -> frozenset[Edge]:
    parsed: list[Edge] = []
    with open(path, encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, 1):
            content = line.split("#", 1)[0].strip()
            if not content:
                continue
            fields = content.split()
            if len(fields) != 2:
                raise ValueError(
                    f"{path}:{line_number}: expected two integer vertex IDs"
                )
            try:
                parsed.append((int(fields[0]), int(fields[1])))
            except ValueError as error:
                raise ValueError(
                    f"{path}:{line_number}: expected two integer vertex IDs"
                ) from error
    return canonical_edges(vertices, parsed)


def check_ramsey_graph(
    vertices: int,
    edges: Iterable[Edge],
    clique: int,
    independent: int,
) -> CheckResult:
    """Check all relevant subsets, returning the first obstruction."""
    validate_parameters(vertices, clique, independent)
    edge_set = canonical_edges(vertices, edges)

    for subset in itertools.combinations(range(vertices), clique):
        if all(edge in edge_set for edge in itertools.combinations(subset, 2)):
            return CheckResult(False, "clique", subset)

    for subset in itertools.combinations(range(vertices), independent):
        if all(edge not in edge_set for edge in itertools.combinations(subset, 2)):
            return CheckResult(False, "independent", subset)

    return CheckResult(True)


def cnf_dimensions(vertices: int, clique: int, independent: int) -> tuple[int, int]:
    validate_parameters(vertices, clique, independent)
    variables = math.comb(vertices, 2)
    clauses = math.comb(vertices, clique) + math.comb(vertices, independent)
    return variables, clauses


def iter_ramsey_clauses(
    vertices: int, clique: int, independent: int
) -> Iterator[tuple[int, ...]]:
    variables = edge_variables(vertices)

    for subset in itertools.combinations(range(vertices), clique):
        yield tuple(-variables[edge] for edge in itertools.combinations(subset, 2))

    for subset in itertools.combinations(range(vertices), independent):
        yield tuple(variables[edge] for edge in itertools.combinations(subset, 2))


def write_ramsey_cnf(
    stream: TextIO, vertices: int, clique: int, independent: int
) -> tuple[int, int]:
    variables, clauses = cnf_dimensions(vertices, clique, independent)
    stream.write(
        f"c Ramsey R({clique},{independent},{vertices}) direct edge encoding\n"
    )
    stream.write("c variable order: lexicographic zero-based edges (u,v), u < v\n")
    stream.write(f"p cnf {variables} {clauses}\n")
    emitted = 0
    for clause in iter_ramsey_clauses(vertices, clique, independent):
        stream.write(" ".join(map(str, clause)))
        stream.write(" 0\n")
        emitted += 1
    if emitted != clauses:
        raise AssertionError(f"emitted {emitted} clauses; expected {clauses}")
    return variables, clauses


def sha256_file(path: str | os.PathLike[str]) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def write_cnf_atomic(
    path: str | os.PathLike[str], vertices: int, clique: int, independent: int
) -> tuple[int, int, str]:
    destination = Path(path)
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary_name: str | None = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="w",
            encoding="utf-8",
            newline="\n",
            dir=destination.parent,
            prefix=f".{destination.name}.",
            suffix=".tmp",
            delete=False,
        ) as stream:
            temporary_name = stream.name
            variables, clauses = write_ramsey_cnf(
                stream, vertices, clique, independent
            )
        os.replace(temporary_name, destination)
        temporary_name = None
    finally:
        if temporary_name is not None:
            try:
                os.unlink(temporary_name)
            except FileNotFoundError:
                pass
    return variables, clauses, sha256_file(destination)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)

    check = subparsers.add_parser("check", help="check an edge-list graph")
    check.add_argument("graph", help="UTF-8 edge list, one 'u v' pair per line")
    check.add_argument("--vertices", type=int, required=True)
    check.add_argument("--clique", type=int, required=True)
    check.add_argument("--independent", type=int, required=True)

    cnf = subparsers.add_parser("cnf", help="generate the direct DIMACS encoding")
    cnf.add_argument("--vertices", type=int, required=True)
    cnf.add_argument("--clique", type=int, required=True)
    cnf.add_argument("--independent", type=int, required=True)
    cnf.add_argument("--output", required=True, help="output path, or '-' for stdout")

    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    try:
        if args.command == "check":
            edges = read_edge_list(args.graph, args.vertices)
            result = check_ramsey_graph(
                args.vertices, edges, args.clique, args.independent
            )
            if result.valid:
                print(
                    f"VALID R({args.clique},{args.independent},{args.vertices}) "
                    f"witness: {len(edges)} edges"
                )
                return 0
            members = " ".join(map(str, result.vertices or ()))
            print(f"INVALID: {result.obstruction} on vertices {members}")
            return 1

        if args.output == "-":
            variables, clauses = write_ramsey_cnf(
                sys.stdout, args.vertices, args.clique, args.independent
            )
            print(
                f"generated {variables} variables and {clauses} clauses",
                file=sys.stderr,
            )
        else:
            variables, clauses, digest = write_cnf_atomic(
                args.output, args.vertices, args.clique, args.independent
            )
            print(
                f"generated {args.output}: {variables} variables, "
                f"{clauses} clauses, sha256={digest}"
            )
        return 0
    except (OSError, ValueError) as error:
        print(f"error: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
