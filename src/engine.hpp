#pragma once

#include "constraints/degrees.hpp"
#include "constraints/edges.hpp"
#include "constraints/excess.hpp"
#include <array>
#include <cstddef>
#include <cstdint>
#include <filesystem>
#include <string>
#include <string_view>
#include <vector>

namespace ramsey
{

struct Graph
{
    int vertices = 0;
    std::array<std::uint32_t, 24> neighbors{};

    bool adjacent(int u, int v) const noexcept
    {
        return (neighbors[u] & (std::uint32_t{1} << v)) != 0;
    }
    int edge_count() const noexcept;
    void validate() const;
};

std::string read_record(const std::filesystem::path &path, std::size_t index);
Graph decode_graph6(std::string_view record);
void validate_b(const Graph &graph);

struct Options
{
    std::filesystem::path input;
    std::filesystem::path output;
    std::size_t index = 1;
    bool generate_only = false;
    DegreeOptions degrees;
    EdgeOptions edges;
    CardinalityBounds excess;
    bool zero_neighborhood_excess = false;
    std::vector<char *> solver_arguments;
};

int run(const Options &options);

} // namespace ramsey
