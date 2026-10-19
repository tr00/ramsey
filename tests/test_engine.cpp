#include "constraints/zero_excess.hpp"
#include "opb.hpp"

#include <bit>
#include <cstdint>
#include <iostream>
#include <limits>
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

// Independent exhaustive checker: enumerate subsets of the assembled graph.
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
    std::int64_t rhs;
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
            ramsey::InstanceBuilder instance(b, a);
            ramsey::add_core_constraints(instance);
            ramsey::write_opb(output, instance, "audit");
            require(instance.variable_count() == a * (a - 1) / 2 + a * b_size, "incorrect number of edge variables");
            const auto rows = parse_opb(output.str(), instance.variable_count(), instance.constraint_count());
            for (unsigned mask = 0; mask < (1U << instance.variable_count()); ++mask)
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

bool feasible(const std::vector<Row> &rows, std::uint64_t mask)
{
    for (const auto &row : rows)
    {
        std::int64_t lhs = 0;
        for (const auto &[coefficient, variable] : row.terms)
            lhs += coefficient * static_cast<int>((mask >> (variable - 1)) & 1U);
        if (lhs < row.rhs)
            return false;
    }
    return true;
}

void component_composition()
{
    ramsey::Graph b;
    b.vertices = 2;
    add_edge(b, 0, 1);
    ramsey::InstanceBuilder instance(b, 3);
    const int a = instance.a_edge(1, 0);
    const int cross = instance.cross_edge(2, 1);
    const int conjunction = instance.add_variable();
    // One component defines an auxiliary conjunction, before the Ramsey core.
    instance.add_ge({{2, conjunction}, {-2, a}, {-2, cross}}, -2);
    instance.add_ge({{1, a}, {-1, conjunction}}, 0);
    instance.add_ge({{1, cross}, {-1, conjunction}}, 0);
    ramsey::add_core_constraints(instance);
    // A later component can allocate more variables and reference earlier ones.
    const int complement = instance.add_variable();
    instance.add_ge({{1, conjunction}, {1, complement}}, 1);
    instance.add_ge({{-1, conjunction}, {-1, complement}}, -1);
    rejects([&] { instance.add_ge({{1, complement + 1}}, 0); }, "accepted an unknown variable");
    rejects([&] { (void)instance.a_edge(1, 1); }, "accepted an A loop");
    rejects([&] { (void)instance.cross_edge(3, 0); }, "accepted an out-of-range cross edge");
    std::ostringstream output;
    ramsey::write_opb(output, instance, "composition");
    const auto rows = parse_opb(output.str(), instance.variable_count(), instance.constraint_count());
    for (unsigned mask = 0; mask < (1U << instance.variable_count()); ++mask)
    {
        const auto value = [&](int variable) { return (mask & (1U << (variable - 1))) != 0; };
        const unsigned edge_mask = (1U << 9) - 1;
        const bool expected = (mask & edge_mask) != edge_mask && value(conjunction) == (value(a) && value(cross)) &&
                              value(complement) != value(conjunction);
        require(feasible(rows, mask) == expected, "composed components changed the feasible assignments");
    }
}

void general_pb_rows()
{
    ramsey::InstanceBuilder instance(ramsey::Graph{}, 0);
    std::vector<ramsey::Term> terms;
    for (int i = 0; i < 1000; ++i)
        terms.push_back({1, instance.add_variable()});
    const int auxiliary = instance.add_variable();
    terms.push_back({-2, auxiliary});
    instance.add_ge(terms, 1000);
    // Reusing a row's view must survive reallocation of the builder's term arena.
    instance.add_ge(instance.constraint(0).terms, 999);
    std::ostringstream output;
    ramsey::write_opb(output, instance, "wide");
    const auto rows = parse_opb(output.str(), instance.variable_count(), instance.constraint_count());
    for (const auto &row : rows)
    {
        for (int missing : {-1, 1})
            for (bool aux : {false, true})
            {
                int lhs = 0;
                for (const auto &[coefficient, variable] : row.terms)
                    lhs += coefficient * (variable == auxiliary ? aux : variable != missing);
                const int expected = 1000 - (missing == 1 ? 1 : 0) - (aux ? 2 : 0);
                require((lhs >= row.rhs) == (expected >= row.rhs), "wide auxiliary cut changed semantics");
            }
    }
    ramsey::InstanceBuilder constant(ramsey::Graph{}, 0);
    constant.add_ge({}, 1);
    std::ostringstream constant_output;
    ramsey::write_opb(constant_output, constant, "constant");
    require(!feasible(parse_opb(constant_output.str(), 0, 1), 0), "lost an impossible constant constraint");
}

void degree_semantics()
{
    const std::vector<ramsey::CardinalityBounds> global_bounds{
        {std::nullopt, std::nullopt}, {0, 0}, {2, 4}, {3, 3}, {4, std::nullopt}, {std::nullopt, 2}, {0, 20}};
    const std::vector<ramsey::CardinalityBounds> neighborhood_bounds{
        {std::nullopt, std::nullopt}, {0, 0}, {1, 1}, {2, 2}, {3, std::nullopt}, {std::nullopt, 1}};
    const auto contains = [](const ramsey::CardinalityBounds &bounds, int degree) {
        return (!bounds.min || degree >= *bounds.min) && (!bounds.max || degree <= *bounds.max);
    };
    ramsey::Graph b;
    b.vertices = 3;
    add_edge(b, 0, 1);
    add_edge(b, 1, 2);
    for (int a = 0; a <= 3; ++a)
        for (const auto &global : global_bounds)
            for (const auto &neighborhood : neighborhood_bounds)
            {
                ramsey::InstanceBuilder instance(b, a);
                ramsey::add_degree_constraints(instance, {global, neighborhood});
                std::ostringstream output;
                ramsey::write_opb(output, instance, "degrees");
                const auto rows = parse_opb(output.str(), instance.variable_count(), instance.constraint_count());
                for (unsigned mask = 0; mask < (1U << instance.variable_count()); ++mask)
                {
                    std::vector<int> degrees(1 + a + b.vertices);
                    std::vector<int> internal(a);
                    const auto edge = [&](int u, int v) {
                        ++degrees[u];
                        ++degrees[v];
                    };
                    const auto value = [&](int variable) { return (mask & (1U << (variable - 1))) != 0; };
                    for (int u = 0; u < a; ++u)
                    {
                        edge(0, 1 + u);
                        for (int v = u + 1; v < a; ++v)
                            if (value(instance.a_edge(u, v)))
                            {
                                edge(1 + u, 1 + v);
                                ++internal[u];
                                ++internal[v];
                            }
                        for (int y = 0; y < b.vertices; ++y)
                            if (value(instance.cross_edge(u, y)))
                                edge(1 + u, 1 + a + y);
                    }
                    for (int y = 0; y < b.vertices; ++y)
                        for (int z = y + 1; z < b.vertices; ++z)
                            if (b.adjacent(y, z))
                                edge(1 + a + y, 1 + a + z);
                    bool expected = true;
                    for (int degree : degrees)
                        expected = expected && contains(global, degree);
                    for (int degree : internal)
                        expected = expected && contains(neighborhood, degree);
                    require(feasible(rows, mask) == expected, "degree component disagrees with graph degrees");
                }
            }
    rejects([] { ramsey::DegreeOptions{{4, 3}, {0, 2}}.validate(); }, "accepted reversed global bounds");
    rejects([] { ramsey::DegreeOptions{{0, 4}, {-1, 2}}.validate(); }, "accepted negative neighborhood bound");
}

void edge_semantics()
{
    const std::vector<ramsey::CardinalityBounds> bounds{
        {std::nullopt, std::nullopt}, {0, 0}, {1, 2}, {2, 2}, {3, std::nullopt}, {std::nullopt, 1}, {0, 20}};
    const auto contains = [](const ramsey::CardinalityBounds &interval, int count) {
        return (!interval.min || count >= *interval.min) && (!interval.max || count <= *interval.max);
    };
    for (int a = 0; a <= 3; ++a)
        for (int b_size = 0; b_size <= 2; ++b_size)
            for (const auto &internal : bounds)
                for (const auto &cross : bounds)
                {
                    ramsey::Graph b;
                    b.vertices = b_size;
                    if (b_size == 2)
                        add_edge(b, 0, 1);
                    ramsey::InstanceBuilder instance(b, a);
                    instance.add_variable();
                    ramsey::add_edge_constraints(instance, {internal, cross});
                    std::ostringstream output;
                    ramsey::write_opb(output, instance, "edges");
                    const auto rows = parse_opb(output.str(), instance.variable_count(), instance.constraint_count());
                    for (unsigned mask = 0; mask < (1U << instance.variable_count()); ++mask)
                    {
                        const auto value = [&](int variable) { return (mask & (1U << (variable - 1))) != 0; };
                        int internal_count = 0;
                        int cross_count = 0;
                        for (int u = 0; u < a; ++u)
                        {
                            for (int v = u + 1; v < a; ++v)
                                internal_count += value(instance.a_edge(u, v));
                            for (int y = 0; y < b_size; ++y)
                                cross_count += value(instance.cross_edge(u, y));
                        }
                        const bool expected = contains(internal, internal_count) && contains(cross, cross_count);
                        require(feasible(rows, mask) == expected, "edge component disagrees with graph edge counts");
                    }
                }
    rejects([] { ramsey::EdgeOptions{{3, 2}, {0, 4}}.validate(); }, "accepted reversed internal edge bounds");
    rejects([] { ramsey::EdgeOptions{{0, 3}, {-1, 4}}.validate(); }, "accepted negative cross edge bound");
}

void excess_semantics()
{
    ramsey::Graph b;
    b.vertices = 18;
    const std::vector<ramsey::CardinalityBounds> bounds{{std::nullopt, std::nullopt},
                                                        {0, 0},
                                                        {1, 3},
                                                        {2, std::nullopt},
                                                        {std::nullopt, 1},
                                                        {std::numeric_limits<int>::max(), std::nullopt}};
    for (const auto &interval : bounds)
    {
        ramsey::InstanceBuilder aggregate(b, 2);
        ramsey::add_excess_constraints(aggregate, interval);
        std::ostringstream aggregate_output;
        ramsey::write_opb(aggregate_output, aggregate, "excess");
        const auto aggregate_rows =
            parse_opb(aggregate_output.str(), aggregate.variable_count(), aggregate.constraint_count());
        ramsey::InstanceBuilder zero(b, 2);
        ramsey::add_zero_excess_constraints(zero);
        std::ostringstream zero_output;
        ramsey::write_opb(zero_output, zero, "zero-excess");
        const auto zero_rows = parse_opb(zero_output.str(), zero.variable_count(), zero.constraint_count());
        for (bool internal : {false, true})
            for (int first = 15; first <= 18; ++first)
                for (int second = 15; second <= 18; ++second)
                {
                    std::uint64_t mask = internal ? 1 : 0;
                    for (int u = 0; u < 2; ++u)
                        for (int y = 0; y < (u == 0 ? first : second); ++y)
                            mask |= std::uint64_t{1} << (aggregate.cross_edge(u, y) - 1);
                    const int first_degree = 1 + internal + first;
                    const int second_degree = 1 + internal + second;
                    const int excess = first_degree + second_degree - 36;
                    const bool aggregate_expected =
                        (!interval.min || excess >= *interval.min) && (!interval.max || excess <= *interval.max);
                    require(feasible(aggregate_rows, mask) == aggregate_expected,
                            "aggregate excess disagrees with signed graph-degree sum");
                    require(feasible(zero_rows, mask) == (first_degree == 18 && second_degree == 18),
                            "zero-excess equations disagree with individual global degrees");
                }
    }
    ramsey::InstanceBuilder empty(ramsey::Graph{}, 0);
    ramsey::add_zero_excess_constraints(empty);
    ramsey::add_excess_constraints(empty, {0, 0});
    std::ostringstream empty_output;
    ramsey::write_opb(empty_output, empty, "empty-excess");
    require(feasible(parse_opb(empty_output.str(), 0, empty.constraint_count()), 0),
            "rejected zero excess on an empty neighborhood");
    ramsey::add_excess_constraints(empty, {1, std::nullopt});
    std::ostringstream impossible_output;
    ramsey::write_opb(impossible_output, empty, "impossible-excess");
    require(!feasible(parse_opb(impossible_output.str(), 0, empty.constraint_count()), 0),
            "accepted positive excess on an empty neighborhood");
    rejects([&] { ramsey::add_excess_constraints(empty, {2, 1}); }, "accepted reversed excess bounds");
    rejects([&] { ramsey::add_excess_constraints(empty, {-1, 2}); }, "accepted negative excess bound");
}

} // namespace

int main()
{
    try
    {
        graph6_validation();
        component_composition();
        general_pb_rows();
        degree_semantics();
        edge_semantics();
        excess_semantics();
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
