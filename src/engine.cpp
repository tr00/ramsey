#include "engine.hpp"
#include "constraints/zero_excess.hpp"
#include "opb.hpp"

#include <gtools.h>

#include <bit>
#include <cerrno>
#include <cstring>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <system_error>

#include <unistd.h>

namespace ramsey
{
namespace
{
namespace fs = std::filesystem;

void reject_alias(const fs::path &input, const fs::path &output)
{
    if (fs::canonical(input) == fs::weakly_canonical(output) || (fs::exists(output) && fs::equivalent(input, output)))
        throw std::invalid_argument("input and output paths must differ");
}

class TemporaryOpb
{
  public:
    explicit TemporaryOpb(const fs::path &destination)
    {
        if (destination.filename().empty())
            throw std::invalid_argument("output must name a file");
        const auto parent = destination.has_parent_path() ? destination.parent_path() : fs::path(".");
        fs::create_directories(parent);
        path_ = (parent / ("." + destination.filename().string() + ".XXXXXX")).string();
        const int fd = ::mkstemp(path_.data());
        if (fd < 0)
            throw std::system_error(errno, std::generic_category(), "create temporary OPB");
        if (::close(fd) != 0)
        {
            const int error = errno;
            ::unlink(path_.c_str());
            throw std::system_error(error, std::generic_category(), "close temporary OPB");
        }
    }
    TemporaryOpb(const TemporaryOpb &) = delete;
    TemporaryOpb &operator=(const TemporaryOpb &) = delete;
    ~TemporaryOpb()
    {
        std::error_code ignored;
        fs::remove(path_, ignored);
    }
    const std::string &path() const
    {
        return path_;
    }

  private:
    std::string path_;
};

bool has_set(const Graph &graph, std::uint32_t candidates, int size, bool clique)
{
    if (size == 0)
        return true;
    while (candidates != 0 && std::popcount(candidates) >= size)
    {
        const int vertex = std::countr_zero(candidates);
        candidates &= candidates - 1;
        const auto neighbors = graph.neighbors[vertex];
        if (has_set(graph, candidates & (clique ? neighbors : ~neighbors), size - 1, clique))
            return true;
    }
    return false;
}
} // namespace

int Graph::edge_count() const noexcept
{
    int edges = 0;
    for (int i = 0; i < vertices; ++i)
        edges += std::popcount(neighbors[i]);
    return edges / 2;
}

void Graph::validate() const
{
    if (vertices < 0 || vertices > 24)
        throw std::invalid_argument("B must have between 0 and 24 vertices");
    const auto mask = (std::uint32_t{1} << vertices) - 1;
    for (int i = 0; i < vertices; ++i)
    {
        if ((neighbors[i] & ~mask) != 0 || adjacent(i, i))
            throw std::invalid_argument("B is not a labeled simple graph");
        for (int j = i + 1; j < vertices; ++j)
            if (adjacent(i, j) != adjacent(j, i))
                throw std::invalid_argument("B adjacency is not symmetric");
    }
}

std::string read_record(const fs::path &path, std::size_t index)
{
    if (index == 0)
        throw std::invalid_argument("--index must be at least 1 (one-based)");
    std::ifstream input(path, std::ios::binary);
    if (!input)
        throw std::runtime_error("cannot open graph6 input: " + path.string());
    constexpr std::string_view header = ">>graph6<<";
    // 47 graph6 bytes, a possible header, CR, LF, and the terminator.
    std::array<char, 60> line{};
    std::size_t count = 0;
    for (;;)
    {
        input.getline(line.data(), line.size());
        if (input.bad())
            throw std::runtime_error("error reading graph6 input: " + path.string());
        if (input.fail())
        {
            if (input.eof() && input.gcount() == 0)
                break;
            throw std::runtime_error("graph6 input line exceeds the order-24 record limit: " + path.string());
        }
        auto length = static_cast<std::size_t>(input.gcount());
        if (!input.eof())
            --length;
        while (length != 0 && line[length - 1] == '\r')
            --length;
        std::string_view record(line.data(), length);
        for (unsigned char c : record)
            if (c > 127)
                throw std::invalid_argument("graph6 input must be ASCII");
        if (count == 0 && record.starts_with(header))
            record.remove_prefix(header.size());
        if (record.empty())
            continue;
        if (++count == index)
            return std::string(record);
    }
    throw std::runtime_error(path.string() + ": requested record " + std::to_string(index) + ", found only " +
                             std::to_string(count));
}

Graph decode_graph6(std::string_view record)
{
    if (record.empty())
        throw std::invalid_argument("empty graph6 record");
    for (unsigned char c : record)
        if (c < 63 || c > 126)
            throw std::invalid_argument("invalid graph6 character");
    const int n = static_cast<unsigned char>(record.front()) - 63;
    if (n > 24)
        throw std::invalid_argument("expected a graph6 record for between 0 and 24 vertices");
    const int bits = n * (n - 1) / 2;
    if (record.size() != static_cast<std::size_t>(1 + (bits + 5) / 6))
        throw std::invalid_argument("incorrect graph6 record length");
    const int padding = (6 - bits % 6) % 6;
    if (padding != 0 && ((static_cast<unsigned char>(record.back()) - 63) & ((1 << padding) - 1)))
        throw std::invalid_argument("nonzero graph6 padding bits");

    // Nauty's parser can exit on malformed input; validate before calling it.
    std::array<char, 48> encoded{};
    std::memcpy(encoded.data(), record.data(), record.size());
    constexpr int words = SETWORDSNEEDED(24);
    std::array<graph, 24 * words> dense{};
    stringtograph(encoded.data(), dense.data(), words);
    Graph result;
    result.vertices = n;
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            if (ISELEMENT(GRAPHROW(dense.data(), i, words), j))
                result.neighbors[i] |= std::uint32_t{1} << j;
    return result;
}

void validate_b(const Graph &graph)
{
    graph.validate();
    const auto vertices = (std::uint32_t{1} << graph.vertices) - 1;
    if (has_set(graph, vertices, 5, true))
        throw std::invalid_argument("B contains K5");
    if (has_set(graph, vertices, 4, false))
        throw std::invalid_argument("B contains I4");
}

int run(const Options &options)
{
    options.degrees.validate();
    options.edges.validate();
    options.excess.validate("neighborhood excess");
    reject_alias(options.input, options.output);
    const auto record = read_record(options.input, options.index);
    const auto graph = decode_graph6(record);
    if (graph.vertices != 24)
        throw std::invalid_argument("B must have exactly 24 vertices");
    validate_b(graph);

    {
        TemporaryOpb temporary(options.output);
        std::ofstream output;
        output.exceptions(std::ios::badbit | std::ios::failbit);
        output.open(temporary.path(), std::ios::binary);
        InstanceBuilder instance(graph);
        add_core_constraints(instance);
        add_degree_constraints(instance, options.degrees);
        add_edge_constraints(instance, options.edges);
        add_excess_constraints(instance, options.excess);
        if (options.zero_neighborhood_excess)
            add_zero_excess_constraints(instance);
        write_opb(output, instance, record);
        output.close();
        reject_alias(options.input, options.output);
        fs::rename(temporary.path(), options.output);
        std::cerr << "Wrote " << options.output << ": " << instance.variable_count() << " variables, "
                  << instance.constraint_count() << " constraints\n";
    }
    if (options.generate_only)
        return 0;

    const auto output = fs::absolute(options.output).string();
    std::vector<char *> arguments{const_cast<char *>(RAMSEY_ROUNDINGSAT)};
    arguments.insert(arguments.end(), options.solver_arguments.begin(), options.solver_arguments.end());
    arguments.push_back(const_cast<char *>(output.c_str()));
    arguments.push_back(nullptr);
    ::execv(RAMSEY_ROUNDINGSAT, arguments.data());
    const int error = errno;
    std::cerr << "ramsey: cannot execute RoundingSat: " << std::generic_category().message(error) << '\n';
    return error == ENOENT || error == ENOTDIR ? 127 : 126;
}

} // namespace ramsey
