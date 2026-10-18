#include "opb.hpp"

#include <bit>
#include <cstdint>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace
{
void require(bool condition, const std::string &message)
{
    if (!condition)
        throw std::runtime_error(message);
}

template <class Function> void rejects(Function &&function, const std::string &message)
{
    bool rejected = false;
    try
    {
        function();
    }
    catch (const std::exception &)
    {
        rejected = true;
    }
    require(rejected, message);
}

void add_edge(ramsey::Graph &graph, int u, int v)
{
    graph.neighbors[u] |= std::uint32_t{1} << v;
    graph.neighbors[v] |= std::uint32_t{1} << u;
}

// Independent exhaustive checker: enumerate subsets of the assembled graph,
// without relying on the generator's split into pure and mixed families.
bool has_homogeneous_set(const ramsey::Graph &graph, int size, bool clique)
{
    for (std::uint32_t mask = 0; mask < (std::uint32_t{1} << graph.vertices); ++mask)
    {
        if (std::popcount(mask) != size)
            continue;
        bool homogeneous = true;
        for (int u = 0; u < graph.vertices; ++u)
        {
            if (!(mask & (std::uint32_t{1} << u)))
                continue;
            for (int v = u + 1; v < graph.vertices; ++v)
            {
                if ((mask & (std::uint32_t{1} << v)) && graph.adjacent(u, v) != clique)
                    homogeneous = false;
            }
        }
        if (homogeneous)
            return true;
    }
    return false;
}

struct Row
{
    std::vector<std::pair<int, int>> terms;
    int rhs;
};

std::vector<Row> parse_opb(const std::string &text, int variables, std::uint64_t constraints)
{
    std::istringstream input(text);
    std::string line;
    std::getline(input, line);
    require(line == "* #variable= " + std::to_string(variables) + " #constraint= " + std::to_string(constraints),
            "incorrect OPB header");
    std::vector<Row> rows;
    while (std::getline(input, line))
    {
        if (line.starts_with("*"))
            continue;
        require(!line.empty() && line.back() == ';', "missing OPB terminator");
        line.pop_back();
        std::istringstream fields(line);
        Row row{};
        std::string token;
        bool comparison = false;
        while (fields >> token)
        {
            if (token == ">=")
            {
                require(static_cast<bool>(fields >> row.rhs), "missing OPB rhs");
                require(!(fields >> token), "unexpected OPB suffix");
                comparison = true;
                break;
            }
            const int coefficient = std::stoi(token);
            require(static_cast<bool>(fields >> token) && token.starts_with("x"), "invalid OPB variable");
            const int variable = std::stoi(token.substr(1));
            require(variable >= 1 && variable <= variables, "variable out of range");
            row.terms.emplace_back(coefficient, variable);
        }
        require(comparison, "missing OPB comparison");
        rows.push_back(std::move(row));
    }
    require(rows.size() == constraints, "OPB row count disagrees with header");
    return rows;
}

void graph6_validation()
{
    // Bits 0, 12, 260 cross byte and column boundaries in graph6 ordering.
    const auto graph = ramsey::decode_graph6("W_?_" + std::string(40, '?') + "G??");
    require(graph.vertices == 24 && graph.edge_count() == 3 && graph.adjacent(0, 1) && graph.adjacent(2, 5) &&
                graph.adjacent(7, 23),
            "graph6 upper triangle was decoded in the wrong order");
    for (const std::string &record :
         {std::string{}, "W" + std::string(45, '?') + " ", std::string("A`"), std::string("W?"), std::string("~??")})
    {
        rejects([&] { (void)ramsey::decode_graph6(record); }, "accepted malformed graph6");
    }
    ramsey::Graph empty;
    empty.vertices = 4;
    rejects([&] { ramsey::validate_b(empty); }, "accepted I4 in B");
    ramsey::Graph complete;
    complete.vertices = 5;
    for (int u = 0; u < 5; ++u)
        for (int v = u + 1; v < 5; ++v)
            add_edge(complete, u, v);
    rejects([&] { ramsey::validate_b(complete); }, "accepted K5 in B");
}

std::uint64_t semantic_equivalence()
{
    std::uint64_t assignments = 0;
    for (int a = 1; a <= 5; ++a)
    {
        const int b_size = 5 - a;
        const int b_pairs = b_size * (b_size - 1) / 2;
        for (unsigned b_mask = 0; b_mask < (1U << b_pairs); ++b_mask)
        {
            ramsey::Graph b;
            b.vertices = b_size;
            int bit = 0;
            for (int u = 0; u < b_size; ++u)
                for (int v = u + 1; v < b_size; ++v, ++bit)
                    if (b_mask & (1U << bit))
                        add_edge(b, u, v);
            if (has_homogeneous_set(b, 4, false))
                continue;
            ramsey::validate_b(b);
            std::ostringstream output;
            const auto stats = ramsey::write_core_opb(output, b, "audit", a);
            require(stats.variables == a * (a - 1) / 2 + a * b_size, "incorrect number of edge variables");
            const auto rows = parse_opb(output.str(), stats.variables, stats.constraints());
            for (unsigned mask = 0; mask < (1U << stats.variables); ++mask)
            {
                bool feasible = true;
                for (const auto &row : rows)
                {
                    int lhs = 0;
                    for (const auto &[coefficient, variable] : row.terms)
                        lhs += coefficient * static_cast<int>((mask >> (variable - 1)) & 1U);
                    if (lhs < row.rhs)
                        feasible = false;
                }
                ramsey::Graph assembled;
                assembled.vertices = 6;
                for (int i = 0; i < a; ++i)
                    add_edge(assembled, 0, i + 1);
                for (int u = 0; u < b_size; ++u)
                    for (int v = u + 1; v < b_size; ++v)
                        if (b.adjacent(u, v))
                            add_edge(assembled, a + 1 + u, a + 1 + v);
                int variable = 0;
                for (int u = 0; u < a; ++u)
                    for (int v = u + 1; v < a; ++v, ++variable)
                        if (mask & (1U << variable))
                            add_edge(assembled, u + 1, v + 1);
                for (int i = 0; i < a; ++i)
                    for (int y = 0; y < b_size; ++y, ++variable)
                        if (mask & (1U << variable))
                            add_edge(assembled, i + 1, a + 1 + y);
                const bool expected =
                    !has_homogeneous_set(assembled, 5, true) && !has_homogeneous_set(assembled, 5, false);
                require(feasible == expected, "OPB disagrees with full Ramsey graph: A=" + std::to_string(a) + ", B=" +
                                                  std::to_string(b_mask) + ", assignment=" + std::to_string(mask));
                ++assignments;
            }
        }
    }
    return assignments;
}
} // namespace

int main()
{
    try
    {
        graph6_validation();
        const auto assignments = semantic_equivalence();
        std::cout << "PASS: graph6 validation and exhaustive OPB equivalence (" << assignments
                  << " rooted assignments)\n";
        return 0;
    }
    catch (const std::exception &error)
    {
        std::cerr << "FAIL: " << error.what() << '\n';
        return 1;
    }
}
