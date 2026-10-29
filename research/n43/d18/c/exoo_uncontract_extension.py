#!/usr/bin/env python3
"""Verify Exoo inputs and exact obstructions to inverse edge contraction.

An ambient edge contraction inside the neighborhood of a degree-18 root
reduces that root's degree to 17. Thus an inverse split which reconstructs
that same rooted branch requires a degree-17 root in its order-42 input.
There is also a stronger obstruction, checked at every split vertex z:
write D for its nonneighbors. If a neighbor x misses an independent triple
T in D, both new adjacent endpoints must see x, because otherwise the
missed endpoint together with {x} union T is an independent five-set.
If these forced common neighbors contain a triangle, the two endpoints
and that triangle would form a K5. This excludes every inverse edge split
at z, regardless of its new root choice or endpoint degrees.

These checks concern inverse edge contraction, not every possible
construction of an order-43 Ramsey graph.

The JSON snapshot retains the exact downloaded inputs and their provenance.
Default execution verifies it without network access. ``--refresh`` downloads
the two attributed public sources and regenerates the snapshot. The known
328-graph catalogue and its complements are not a complete order-42 census.
"""

import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import urllib.request


HERE = Path(__file__).resolve().parent
EVIDENCE = HERE / "exoo_uncontract_extension_evidence.json"
SOURCE_URLS = {
    "exoo": "https://cs.indstate.edu/ge/SmallRamsey/r5.5.42",
    "mckay_known_catalogue":
        "https://users.cecs.anu.edu.au/~bdm/data/r55_42some.g6",
}
ATTRIBUTION_URLS = {
    "exoo": "https://cs.indstate.edu/ge/SmallRamsey/index.html",
    "mckay_known_catalogue":
        "https://users.cecs.anu.edu.au/~bdm/data/ramsey.html",
}


def parse_matrix(raw):
    rows = [row for row in raw.decode("ascii").splitlines() if row]
    n = len(rows)
    if not all(len(row) == n and set(row) <= {"0", "1"} for row in rows):
        raise ValueError("invalid square binary adjacency matrix")
    return [sum((value == "1") << i for i, value in enumerate(row))
            for row in rows]


def parse_graph6(raw):
    """Parse the small-order graph6 format used by the order-42 source."""
    if raw.startswith(b">>graph6<<"):
        raw = raw[len(b">>graph6<<"):]
    if not raw or any(value < 63 or value > 126 for value in raw):
        raise ValueError("invalid graph6 alphabet")
    values = [value - 63 for value in raw]
    n = values[0]
    if n > 62:
        raise ValueError("this source parser only supports orders at most 62")
    expected_bits = n * (n - 1) // 2
    if len(values) != 1 + (expected_bits + 5) // 6:
        raise ValueError("incorrect graph6 length")
    bits = [(value >> shift) & 1 for value in values[1:]
            for shift in range(5, -1, -1)]
    if any(bits[expected_bits:]):
        raise ValueError("nonzero graph6 padding")
    adj = [0] * n
    pos = 0
    for v in range(1, n):
        for u in range(v):
            if bits[pos]:
                adj[u] |= 1 << v
                adj[v] |= 1 << u
            pos += 1
    return adj


def clique_witness(adj, size, candidates=None):
    """Exact search; each increasing vertex set is considered once."""
    if size == 0:
        return ()
    if candidates is None:
        candidates = (1 << len(adj)) - 1
    while candidates.bit_count() >= size:
        bit = candidates & -candidates
        candidates ^= bit
        vertex = bit.bit_length() - 1
        tail = clique_witness(adj, size - 1, candidates & adj[vertex])
        if tail is not None:
            return (vertex,) + tail
    return None


def complement(adj):
    full = (1 << len(adj)) - 1
    return [full ^ neighbors ^ (1 << v)
            for v, neighbors in enumerate(adj)]


def graph_check(adj):
    n = len(adj)
    full = (1 << n) - 1
    if n != 42 or any(neighbors & ~full for neighbors in adj):
        raise ValueError("input does not have order 42")
    if any(neighbors & (1 << v) for v, neighbors in enumerate(adj)):
        raise ValueError("input has a loop")
    if any(bool(adj[u] & (1 << v)) != bool(adj[v] & (1 << u))
           for u in range(n) for v in range(u)):
        raise ValueError("input is not symmetric")
    k5 = clique_witness(adj, 5)
    i5 = clique_witness(complement(adj), 5)
    if k5 is not None or i5 is not None:
        raise ValueError(f"input has forbidden sets: K5={k5}, I5={i5}")
    degrees = [neighbors.bit_count() for neighbors in adj]
    roots = [v for v, degree in enumerate(degrees) if degree == 17]
    return {
        "order": n,
        "edges": sum(degrees) // 2,
        "degree_counts": {str(degree): count for degree, count
                          in sorted(Counter(degrees).items())},
        "K5_free": True,
        "I5_free": True,
        "eligible_degree17_roots": roots,
        "eligible_root_split_vertex_pairs":
            sum(degrees[root] for root in roots),
    }


def inverse_split_obstructions(adj):
    """Produce direct witnesses excluding all assignments at blocked vertices.

    Unlike a bounded search failure, a forced triangle is a certificate
    quantified over every pair of attachment rows covering N(z).
    """
    n = len(adj)
    co = complement(adj)
    certificates = []
    for z in range(n):
        forced = 0
        witnesses = {}
        for x in range(n):
            if not adj[z] & (1 << x):
                continue
            triple = clique_witness(co, 3, co[z] & co[x])
            if triple is not None:
                forced |= 1 << x
                witnesses[x] = list(triple)
        triangle = clique_witness(adj, 3, forced)
        if triangle is None:
            continue
        # Check the small certificates directly as a separate consistency
        # check, rather than relying only on the search which found them.
        for x in triangle:
            triple = witnesses[x]
            if len(set(triple)) != 3 or z in triple or x in triple:
                raise ValueError("invalid forced-neighbor witness")
            if any(adj[z] & (1 << y) or adj[x] & (1 << y)
                   for y in triple):
                raise ValueError("witness is not missed by z and x")
            if any(adj[u] & (1 << v)
                   for u in triple for v in triple if u != v):
                raise ValueError("witness triple is not independent")
        if any(not adj[u] & (1 << v)
               for u in triangle for v in triangle if u != v):
            raise ValueError("forced common set certificate is not a triangle")
        certificates.append({
            "split_vertex": z,
            "degree": adj[z].bit_count(),
            "forced_common_neighbor_count": forced.bit_count(),
            "forced_common_triangle": list(triangle),
            "forcing_independent_triples": [witnesses[x] for x in triangle],
        })
    return certificates


def compute(sources):
    raw = {}
    for name, source in sources.items():
        if source["url"] != SOURCE_URLS[name]:
            raise ValueError("unexpected source URL")
        raw[name] = source["downloaded_text"].encode("ascii")
        if hashlib.sha256(raw[name]).hexdigest() != source["sha256"]:
            raise ValueError(f"source digest mismatch: {name}")
        if len(raw[name]) != source["bytes"]:
            raise ValueError(f"source length mismatch: {name}")
    exoo = parse_matrix(raw["exoo"])
    known = [parse_graph6(line) for line
             in raw["mckay_known_catalogue"].splitlines() if line]
    if len(known) != 328:
        raise ValueError("unexpected known catalogue entry count")
    exoo_checks = {
        "original": graph_check(exoo),
        "complement": graph_check(complement(exoo)),
    }
    for side, adj in (("original", exoo), ("complement", complement(exoo))):
        certificates = inverse_split_obstructions(adj)
        exoo_checks[side]["inverse_split_certificates"] = certificates
        exoo_checks[side]["inverse_split_blocked_vertices"] = len(certificates)
    catalogue_checks = []
    for index, adj in enumerate(known):
        check = {"entry": index}
        for side, graph in (("original", adj),
                            ("complement", complement(adj))):
            check[side] = graph_check(graph)
            check[side]["inverse_split_blocked_vertices"] = len(
                inverse_split_obstructions(graph))
        catalogue_checks.append(check)
    all_checks = list(exoo_checks.values()) + [check[side]
                  for check in catalogue_checks
                  for side in ("original", "complement")]
    degrees = sorted({int(degree) for check in all_checks
                      for degree in check["degree_counts"]})
    pair_count = sum(check["eligible_root_split_vertex_pairs"]
                     for check in all_checks)
    split_blocked = sum(check["inverse_split_blocked_vertices"]
                        for check in all_checks)
    return {
        "exoo": exoo_checks,
        "known_catalogue": catalogue_checks,
        "summary": {
            "known_catalogue_entries": len(known),
            "known_catalogue_checks_including_complements": 2 * len(known),
            "degree_spectrum": degrees,
            "required_input_root_degree": 17,
            "eligible_root_split_vertex_pairs": pair_count,
            "inverse_split_vertices_checked": 42 * len(all_checks),
            "inverse_split_vertices_certifiably_blocked": split_blocked,
            "requested_search_status": "excluded_by_forced_common_triangle"
                if split_blocked == 42 * len(all_checks)
                else "unblocked_vertices_require_split_search",
            "catalogue_completeness_claimed": False,
            "order43_witness_constructed": False,
        },
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--refresh", action="store_true")
    args = parser.parse_args()
    if args.refresh:
        sources = {}
        for name, url in SOURCE_URLS.items():
            raw = urllib.request.urlopen(url, timeout=30).read()
            sources[name] = {
                "url": url,
                "attribution_url": ATTRIBUTION_URLS[name],
                "sha256": hashlib.sha256(raw).hexdigest(),
                "bytes": len(raw),
                "downloaded_text": raw.decode("ascii"),
            }
        evidence = {"sources": sources, "checks": compute(sources)}
        EVIDENCE.write_text(json.dumps(evidence, indent=2) + "\n")
    else:
        evidence = json.loads(EVIDENCE.read_text())
        checks = compute(evidence["sources"])
        if checks != evidence["checks"]:
            raise ValueError("recomputed checks disagree with evidence")
    print(json.dumps(evidence["checks"]["summary"], sort_keys=True))
    print("Verified directly attributed Exoo witness and 328 known entries "
          "with their complements, including exact inverse-split "
          "obstructions and the degree-17 root precondition.")


if __name__ == "__main__":
    main()
