#pragma once

#include "engine.hpp"

#include <array>
#include <cstdint>
#include <iosfwd>
#include <string_view>

namespace ramsey
{

struct CoreStats
{
    int variables = 0;
    std::array<std::uint64_t, 8> families{};
    std::uint64_t constraints() const noexcept;
};

// A edges are lexicographic, cross edges row-major; rows match the Python core.
// Small orders are supported for exhaustive semantic audits, not CLI modes.
CoreStats write_core_opb(std::ostream &output, const Graph &b, std::string_view record, int a_vertices = 18);

} // namespace ramsey
