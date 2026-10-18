from __future__ import annotations

import io
import itertools
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
sys.path.insert(0, str(ROOT / "scripts"))

import fixed_b_mip  # noqa: E402
import ramsey  # noqa: E402


class FixedBCoreTests(unittest.TestCase):
    def test_graph6_column_order_and_invalid_characters(self) -> None:
        # Set bits 0, 12, 260 in the graph6 upper triangle: byte boundaries
        # and a late column distinguish graph6 order from row-major order.
        record = "W_?_" + "?" * 40 + "G??"
        self.assertEqual(
            fixed_b_mip.decode_b24(record),
            frozenset({(0, 1), (2, 5), (7, 23)}),
        )
        with self.assertRaises(ValueError):
            fixed_b_mip.decode_b24("W" + "?" * 45 + " ")

    def test_opb_feasibility_matches_all_small_rooted_graphs(self) -> None:
        # Exercise every surviving mixed family, both pure-A families, and
        # fixed-B substitutions against the independent full-graph checker.
        for a_size in range(1, 6):
            b_size = 5 - a_size
            b_pairs = list(itertools.combinations(range(b_size), 2))
            for b_mask in range(1 << len(b_pairs)):
                b_edges = frozenset(
                    edge for bit, edge in enumerate(b_pairs) if b_mask & (1 << bit)
                )
                if not ramsey.check_ramsey_graph(b_size, b_edges, 5, 4).valid:
                    continue
                output = io.StringIO()
                fixed_b_mip.write_core_opb(output, b_edges, "audit", a_size, b_size)
                lines = output.getvalue().splitlines()
                self.assertRegex(lines[0], r"^\* #variable= \d+ #constraint= \d+$")
                header = lines[0].split()
                variable_count, row_count = int(header[2]), int(header[4])
                rows = []
                names = {}
                for line in lines[1:]:
                    if line.startswith("* x"):
                        _, variable, _, name = line.split()
                        self.assertRegex(variable, r"^x[1-9]\d*$")
                        index = int(variable[1:])
                        self.assertNotIn(index, names)
                        names[index] = name
                    elif not line.startswith("*"):
                        self.assertTrue(line.endswith(";"))
                        fields = line[:-1].split()
                        self.assertEqual(fields[-2], ">=")
                        self.assertEqual((len(fields) - 2) % 2, 0)
                        terms = []
                        for coefficient, variable in zip(fields[:-2:2], fields[1:-2:2]):
                            self.assertRegex(variable, r"^x[1-9]\d*$")
                            index = int(variable[1:])
                            self.assertTrue(1 <= index <= variable_count)
                            terms.append((int(coefficient), index))
                        rows.append((terms, int(fields[-1])))
                self.assertEqual(len(rows), row_count)
                self.assertEqual(set(names), set(range(1, variable_count + 1)))
                for mask in range(1 << variable_count):
                    assignment = {
                        index: (mask >> (index - 1)) & 1
                        for index in range(1, variable_count + 1)
                    }
                    feasible = all(
                        sum(coefficient * assignment[index] for coefficient, index in terms) >= rhs
                        for terms, rhs in rows
                    )
                    # Full labels: pivot 0, A 1..a_size, then B.
                    edges = [(0, i + 1) for i in range(a_size)]
                    edges.extend(
                        (1 + a_size + y, 1 + a_size + z) for y, z in b_edges
                    )
                    for index, value in assignment.items():
                        if value:
                            kind, left, right = names[index].split("_")
                            i, j = int(left), int(right)
                            edges.append((1 + i, 1 + j if kind == "a" else 1 + a_size + j))
                    expected = ramsey.check_ramsey_graph(6, edges, 5, 5).valid
                    self.assertEqual(
                        feasible, expected,
                        f"A={a_size}, B mask={b_mask}, assignment={mask}",
                    )


if __name__ == "__main__":
    unittest.main()
