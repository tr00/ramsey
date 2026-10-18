#include "opb.hpp"

#include <charconv>
#include <cstring>
#include <ostream>
#include <stdexcept>
#include <system_error>

namespace ramsey
{
namespace
{

constexpr int max_a = 18;
constexpr int max_b = 24;
constexpr int max_variables = max_a * (max_a - 1) / 2 + max_a * max_b;

constexpr std::uint64_t choose(int n, int k) noexcept
{
    if (k > n)
        return 0;
    std::uint64_t result = 1;
    for (int i = 1; i <= k; ++i)
        result = result * (n - i + 1) / i;
    return result;
}

template <std::size_t Size, class Function> void for_subsets(int n, Function &&function)
{
    if (n < static_cast<int>(Size))
        return;
    std::array<int, Size> subset;
    for (std::size_t i = 0; i < Size; ++i)
        subset[i] = static_cast<int>(i);
    for (;;)
    {
        function(subset);
        int i = static_cast<int>(Size) - 1;
        while (i >= 0 && subset[i] == n - static_cast<int>(Size) + i)
            --i;
        if (i < 0)
            return;
        ++subset[i];
        for (std::size_t j = i + 1; j < Size; ++j)
            subset[j] = subset[j - 1] + 1;
    }
}

template <std::size_t Size> bool homogeneous(const Graph &b, const std::array<int, Size> &subset, bool clique)
{
    std::uint32_t remaining = 0;
    for (int v : subset)
        remaining |= std::uint32_t{1} << v;
    for (int v : subset)
    {
        remaining &= ~(std::uint32_t{1} << v);
        const auto edges = b.neighbors[v] & remaining;
        if (clique ? edges != remaining : edges != 0)
            return false;
    }
    return true;
}

// Decimal conversion is locale independent, including the OPB header/comments.
struct Line
{
    char bytes[128];
    char *end = bytes;

    void append(std::string_view text)
    {
        if (text.size() > static_cast<std::size_t>(bytes + sizeof(bytes) - end))
            throw std::logic_error("OPB line exceeds its fixed buffer");
        std::memcpy(end, text.data(), text.size());
        end += text.size();
    }

    template <class Integer> void number(Integer value)
    {
        const auto result = std::to_chars(end, bytes + sizeof(bytes), value);
        if (result.ec != std::errc{})
            throw std::logic_error("OPB integer overflow");
        end = result.ptr;
    }

    void write(std::ostream &output) const
    {
        output.write(bytes, end - bytes);
    }
};

struct VariableToken
{
    // The row supplies the sign; the largest token is "1 x585".
    char bytes[6];
    std::uint8_t size = 0;
};

using Tokens = std::array<VariableToken, max_variables + 1>;
using AVariables = std::array<std::array<int, max_a>, max_a>;

Tokens variable_tokens(int variables)
{
    Tokens result{};
    for (int i = 1; i <= variables; ++i)
    {
        auto &token = result[i];
        std::memcpy(token.bytes, "1 x", 3);
        const auto end = std::to_chars(token.bytes + 3, token.bytes + sizeof(token.bytes), i);
        if (end.ec != std::errc{})
            throw std::logic_error("OPB variable overflow");
        token.size = static_cast<std::uint8_t>(end.ptr - token.bytes);
    }
    return result;
}

struct Row
{
    Line line;
    const Tokens &tokens;
    bool clique;
    int terms = 0;

    void add(int variable)
    {
        if (terms++)
            line.append(" ");
        line.append(clique ? "-" : "+");
        const auto &token = tokens[variable];
        line.append(std::string_view(token.bytes, token.size));
    }

    void write(std::ostream &output)
    {
        line.append(" >= ");
        line.number(clique ? 1 - terms : 1);
        line.append(";\n");
        line.write(output);
    }

    Row(const Tokens &variable_tokens, bool is_clique) : tokens(variable_tokens), clique(is_clique)
    {
    }
};

template <std::size_t Size> struct ASubset
{
    std::array<int, Size> vertices;
    std::array<int, Size *(Size - 1) / 2> internal;
};

template <std::size_t Size> struct ASubsets
{
    std::array<ASubset<Size>, choose(max_a, Size)> entries;
    std::size_t size = 0;

    ASubsets(int n, const AVariables &variables)
    {
        for_subsets<Size>(n, [&](const auto &subset) {
            auto &entry = entries[size++];
            entry.vertices = subset;
            std::size_t term = 0;
            for (std::size_t i = 0; i < Size; ++i)
                for (std::size_t j = i + 1; j < Size; ++j)
                    entry.internal[term++] = variables[subset[i]][subset[j]];
        });
    }
};

template <std::size_t ASize, std::size_t BSize>
std::uint64_t mixed_rows(std::ostream &output, const Graph &b, const ASubsets<ASize> &subsets, const Tokens &tokens,
                         int a_edges, bool clique)
{
    std::uint64_t emitted = 0;
    for_subsets<BSize>(b.vertices, [&](const auto &b_subset) {
        if (!homogeneous(b, b_subset, clique))
            return;
        for (std::size_t index = 0; index < subsets.size; ++index)
        {
            const auto &a_subset = subsets.entries[index];
            Row row(tokens, clique);
            for (int variable : a_subset.internal)
                row.add(variable);
            for (int i : a_subset.vertices)
                for (int y : b_subset)
                    row.add(a_edges + i * b.vertices + y + 1);
            row.write(output);
            ++emitted;
        }
    });
    return emitted;
}

template <std::size_t Size>
std::uint64_t pure_rows(std::ostream &output, int n, const AVariables &variables, const Tokens &tokens, bool clique)
{
    std::uint64_t emitted = 0;
    for_subsets<Size>(n, [&](const auto &subset) {
        Row row(tokens, clique);
        for (std::size_t i = 0; i < Size; ++i)
            for (std::size_t j = i + 1; j < Size; ++j)
                row.add(variables[subset[i]][subset[j]]);
        row.write(output);
        ++emitted;
    });
    return emitted;
}

} // namespace

std::uint64_t CoreStats::constraints() const noexcept
{
    std::uint64_t result = 0;
    for (auto count : families)
        result += count;
    return result;
}

CoreStats write_core_opb(std::ostream &output, const Graph &b, std::string_view record, int a_vertices)
{
    if (a_vertices < 0 || a_vertices > max_a)
        throw std::invalid_argument("A must have between 0 and 18 vertices");
    b.validate();

    std::array<std::uint64_t, 4> triples{};
    for_subsets<3>(b.vertices, [&](const auto &subset) {
        const int edges =
            b.adjacent(subset[0], subset[1]) + b.adjacent(subset[0], subset[2]) + b.adjacent(subset[1], subset[2]);
        ++triples[edges];
    });
    std::uint64_t k4 = 0;
    for_subsets<4>(b.vertices, [&](const auto &subset) {
        if (homogeneous(b, subset, true))
            ++k4;
    });
    const int a_edges = static_cast<int>(choose(a_vertices, 2));
    const int b_edges = b.edge_count();
    CoreStats stats;
    stats.variables = a_edges + a_vertices * b.vertices;
    stats.families = {
        choose(a_vertices, 4),
        choose(a_vertices, 5),
        static_cast<std::uint64_t>(a_vertices) * k4,
        choose(a_vertices, 2) * triples[3],
        choose(a_vertices, 3) * b_edges,
        choose(a_vertices, 2) * triples[0],
        choose(a_vertices, 3) * (choose(b.vertices, 2) - b_edges),
        choose(a_vertices, 4) * b.vertices,
    };
    {
        Line line;
        line.append("* #variable= ");
        line.number(stats.variables);
        line.append(" #constraint= ");
        line.number(stats.constraints());
        line.append("\n");
        line.write(output);
    }
    output << "* Exact fixed-B Ramsey (5,5) rooted extension core\n";
    {
        Line line;
        line.append("* A vertices: ");
        line.number(a_vertices);
        line.append("; B vertices: ");
        line.number(b.vertices);
        line.append("\n");
        line.write(output);
    }
    output << "* B graph6: " << record << '\n' << "* a_i_j: A edge; m_i_y: cross edge; zero-based local labels\n";
    AVariables variables{};
    int variable = 0;
    for (int i = 0; i < a_vertices; ++i)
    {
        for (int j = i + 1; j < a_vertices; ++j)
        {
            variables[i][j] = ++variable;
            Line line;
            line.append("* x");
            line.number(variable);
            line.append(" = a_");
            line.number(i);
            line.append("_");
            line.number(j);
            line.append("\n");
            line.write(output);
        }
    }
    for (int i = 0; i < a_vertices; ++i)
    {
        for (int y = 0; y < b.vertices; ++y)
        {
            Line line;
            line.append("* x");
            line.number(++variable);
            line.append(" = m_");
            line.number(i);
            line.append("_");
            line.number(y);
            line.append("\n");
            line.write(output);
        }
    }
    const auto tokens = variable_tokens(stats.variables);
    const ASubsets<1> singles(a_vertices, variables);
    const ASubsets<2> pairs(a_vertices, variables);
    const ASubsets<3> threes(a_vertices, variables);
    const ASubsets<4> fours(a_vertices, variables);
    const std::array<std::uint64_t, 8> emitted{
        pure_rows<4>(output, a_vertices, variables, tokens, true),
        pure_rows<5>(output, a_vertices, variables, tokens, false),
        mixed_rows<1, 4>(output, b, singles, tokens, a_edges, true),
        mixed_rows<2, 3>(output, b, pairs, tokens, a_edges, true),
        mixed_rows<3, 2>(output, b, threes, tokens, a_edges, true),
        mixed_rows<2, 3>(output, b, pairs, tokens, a_edges, false),
        mixed_rows<3, 2>(output, b, threes, tokens, a_edges, false),
        mixed_rows<4, 1>(output, b, fours, tokens, a_edges, false),
    };
    if (emitted != stats.families)
        throw std::logic_error("emitted OPB family counts do not match the header");
    if (!output)
        throw std::runtime_error("failed to write OPB output");
    return stats;
}

} // namespace ramsey
