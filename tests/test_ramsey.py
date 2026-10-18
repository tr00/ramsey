from __future__ import annotations

import io
import itertools
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

import ramsey  # noqa: E402


class GraphCheckerTests(unittest.TestCase):
    def test_five_cycle_is_r33_witness(self) -> None:
        cycle = [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0)]
        self.assertTrue(ramsey.check_ramsey_graph(5, cycle, 3, 3).valid)

    def test_reports_clique_and_independent_obstructions(self) -> None:
        triangle = [(0, 1), (0, 2), (1, 2)]
        clique_result = ramsey.check_ramsey_graph(5, triangle, 3, 5)
        self.assertEqual(clique_result.obstruction, "clique")
        self.assertEqual(clique_result.vertices, (0, 1, 2))

        independent_result = ramsey.check_ramsey_graph(5, [], 5, 3)
        self.assertEqual(independent_result.obstruction, "independent")
        self.assertEqual(independent_result.vertices, (0, 1, 2))

    def test_exhaustively_confirms_r33_upper_bound(self) -> None:
        edges = list(ramsey.all_edges(6))
        for mask in range(1 << len(edges)):
            graph = [edge for bit, edge in enumerate(edges) if mask & (1 << bit)]
            result = ramsey.check_ramsey_graph(6, graph, 3, 3)
            self.assertFalse(result.valid, f"unexpected witness at mask {mask}")

    def test_rejects_malformed_edges(self) -> None:
        with self.assertRaisesRegex(ValueError, "loop"):
            ramsey.canonical_edges(4, [(1, 1)])
        with self.assertRaisesRegex(ValueError, "outside"):
            ramsey.canonical_edges(4, [(0, 4)])
        with self.assertRaisesRegex(ValueError, "duplicate"):
            ramsey.canonical_edges(4, [(0, 1), (1, 0)])

    def test_reads_comments_and_blank_lines(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "graph.edges"
            path.write_text("# C3\n\n0 1\n1 2 # side\n2 0\n", encoding="utf-8")
            self.assertEqual(
                ramsey.read_edge_list(path, 3),
                frozenset({(0, 1), (1, 2), (0, 2)}),
            )


class CnfTests(unittest.TestCase):
    @staticmethod
    def parse_clauses(text: str) -> tuple[tuple[int, ...], ...]:
        clauses = []
        for line in text.splitlines():
            if not line or line[0] in {"c", "p"}:
                continue
            literals = tuple(map(int, line.split()))
            if not literals or literals[-1] != 0:
                raise AssertionError(f"bad DIMACS clause: {line}")
            clauses.append(literals[:-1])
        return tuple(clauses)

    @staticmethod
    def clause_value(clause: tuple[int, ...], mask: int) -> bool:
        for literal in clause:
            value = bool(mask & (1 << (abs(literal) - 1)))
            if value == (literal > 0):
                return True
        return False

    def test_variable_order(self) -> None:
        self.assertEqual(
            ramsey.edge_variables(4),
            {
                (0, 1): 1,
                (0, 2): 2,
                (0, 3): 3,
                (1, 2): 4,
                (1, 3): 5,
                (2, 3): 6,
            },
        )

    def test_r55_43_dimensions_without_generation(self) -> None:
        self.assertEqual(ramsey.cnf_dimensions(43, 5, 5), (903, 1_925_196))

    def test_cnf_semantics_matches_checker_for_every_graph_on_five_vertices(
        self,
    ) -> None:
        output = io.StringIO()
        variables, clause_count = ramsey.write_ramsey_cnf(output, 5, 3, 3)
        clauses = self.parse_clauses(output.getvalue())
        self.assertEqual((variables, clause_count), (10, 20))
        self.assertEqual(len(clauses), clause_count)

        edge_order = list(ramsey.all_edges(5))
        for mask in range(1 << variables):
            graph = [
                edge for bit, edge in enumerate(edge_order) if mask & (1 << bit)
            ]
            checker_value = ramsey.check_ramsey_graph(5, graph, 3, 3).valid
            cnf_value = all(self.clause_value(clause, mask) for clause in clauses)
            self.assertEqual(checker_value, cnf_value, f"mismatch at mask {mask}")

    def test_atomic_output_is_deterministic(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            first = Path(directory) / "first.cnf"
            second = Path(directory) / "second.cnf"
            first_stats = ramsey.write_cnf_atomic(first, 6, 3, 3)
            second_stats = ramsey.write_cnf_atomic(second, 6, 3, 3)
            self.assertEqual(first_stats, second_stats)
            self.assertEqual(first.read_bytes(), second.read_bytes())


if __name__ == "__main__":
    unittest.main()
