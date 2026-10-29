#!/usr/bin/env python3
"""Exhaust all labeled safe contraction states of supplied local examples.

Every recursion step lowers order, and every current safe edge is explored.
Memoization merges only identical labeled adjacency maps, not isomorphism
classes. This certifies the minimum reachable order for each supplied graph;
it is not a census of d18c or a test of ambient order-43 completion.
"""

import argparse
import json
from itertools import combinations
from pathlib import Path

from safe_contractions import certificate, contract


def exhaust(adj):
    if any(all(v in adj[u] for u, v in combinations(group, 2))
           for group in combinations(adj, 4)):
        raise ValueError("Safe-history certificates require a K4-free input")
    if any(all(v not in adj[u] for u, v in combinations(group, 2))
           for group in combinations(adj, 5)):
        raise ValueError("Input must also be I5-free for the stated local type")
    seen = set()
    best_order, best_history = len(adj), []
    terminal_states = 0

    def visit(current, history):
        nonlocal best_order, best_history, terminal_states
        key = tuple((u, tuple(sorted(current[u]))) for u in sorted(current))
        if key in seen:
            return
        seen.add(key)
        if len(current) < best_order:
            best_order, best_history = len(current), history
        choices = [(u, v) for u, v in combinations(sorted(current), 2)
                   if v in current[u] and certificate(current, u, v)["safe"]]
        if not choices:
            terminal_states += 1
        for u, v in choices:
            child, _ = contract(current, u, v)
            visit(child, history + [[u, v]])

    visit(adj, [])
    return {"minimum_reachable_order": best_order,
            "one_shortest_order_history": best_history,
            "distinct_labeled_states": len(seen),
            "terminal_labeled_states": terminal_states}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path,
                        default=Path(__file__).with_name("safe_contraction_examples.json"))
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    data = json.loads(args.source.read_text())
    if "examples" in data:
        examples = data["examples"]
    else:
        from verify_safe_contractions import load_examples
        examples = load_examples(args.source)
    records = []
    for entry in examples:
        adj = {u: set() for u in range(entry["n"])}
        for u, v in entry["edges"]:
            adj[u].add(v)
            adj[v].add(u)
        record = {"name": entry["name"], **exhaust(adj)}
        print(json.dumps(record), flush=True)
        records.append(record)
    if args.output:
        args.output.write_text(json.dumps({
            "scope": "Supplied pure local examples only; exhaustive safe histories, no order-43 completion claim.",
            "method": "Explore every currently safe edge until terminal; merge identical labeled adjacency states only.",
            "results": records}, indent=2) + "\n")


if __name__ == "__main__":
    main()
