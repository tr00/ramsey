#include "instance.hpp"

#include <array>

namespace ramsey
{
namespace
{
constexpr int max_a = 18;

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

struct Row
{
    std::array<Term, 10> terms;
    std::size_t size = 0;
    bool clique;

    explicit Row(bool is_clique) : clique(is_clique)
    {
    }
    void add(int variable)
    {
        terms[size++] = {clique ? -1 : 1, variable};
    }
    void add_to(InstanceBuilder &instance) const
    {
        instance.add_ge(std::span<const Term>(terms.data(), size), clique ? 1 - static_cast<int>(size) : 1);
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

    explicit ASubsets(const InstanceBuilder &instance)
    {
        for_subsets<Size>(instance.a_vertices(), [&](const auto &subset) {
            auto &entry = entries[size++];
            entry.vertices = subset;
            std::size_t term = 0;
            for (std::size_t i = 0; i < Size; ++i)
                for (std::size_t j = i + 1; j < Size; ++j)
                    entry.internal[term++] = instance.a_edge(subset[i], subset[j]);
        });
    }
};

template <std::size_t ASize, std::size_t BSize>
void mixed_rows(InstanceBuilder &instance, const ASubsets<ASize> &subsets, bool clique)
{
    const auto &b = instance.b_graph();
    for_subsets<BSize>(b.vertices, [&](const auto &b_subset) {
        if (!homogeneous(b, b_subset, clique))
            return;
        for (std::size_t index = 0; index < subsets.size; ++index)
        {
            const auto &a_subset = subsets.entries[index];
            Row row(clique);
            for (int variable : a_subset.internal)
                row.add(variable);
            for (int i : a_subset.vertices)
                for (int y : b_subset)
                    row.add(instance.cross_edge(i, y));
            row.add_to(instance);
        }
    });
}

template <std::size_t Size> void pure_rows(InstanceBuilder &instance, bool clique)
{
    for_subsets<Size>(instance.a_vertices(), [&](const auto &subset) {
        Row row(clique);
        for (std::size_t i = 0; i < Size; ++i)
            for (std::size_t j = i + 1; j < Size; ++j)
                row.add(instance.a_edge(subset[i], subset[j]));
        row.add_to(instance);
    });
}
} // namespace

void add_core_constraints(InstanceBuilder &instance)
{
    const ASubsets<1> singles(instance);
    const ASubsets<2> pairs(instance);
    const ASubsets<3> threes(instance);
    const ASubsets<4> fours(instance);
    pure_rows<4>(instance, true);
    pure_rows<5>(instance, false);
    mixed_rows<1, 4>(instance, singles, true);
    mixed_rows<2, 3>(instance, pairs, true);
    mixed_rows<3, 2>(instance, threes, true);
    mixed_rows<2, 3>(instance, pairs, false);
    mixed_rows<3, 2>(instance, threes, false);
    mixed_rows<4, 1>(instance, fours, false);
}

} // namespace ramsey
