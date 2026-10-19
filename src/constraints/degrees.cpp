#include "degrees.hpp"
#include "instance.hpp"

#include <bit>
#include <vector>

namespace ramsey
{

void DegreeOptions::validate() const
{
    global.validate("global degree");
    neighborhood.validate("neighborhood degree");
}

void add_degree_constraints(InstanceBuilder &instance, const DegreeOptions &options)
{
    options.validate();
    const int a = instance.a_vertices();
    const auto &b = instance.b_graph();
    if ((options.global.min && a < *options.global.min) || (options.global.max && a > *options.global.max))
        instance.add_ge({}, 1);

    std::vector<Term> terms;
    terms.reserve(a + b.vertices);
    for (int u = 0; u < a; ++u)
    {
        terms.clear();
        for (int v = 0; v < a; ++v)
            if (v != u)
                terms.push_back({1, instance.a_edge(u, v)});
        add_cardinality_bounds(instance, terms, 0, options.neighborhood);
    }
    for (int u = 0; u < a; ++u)
    {
        terms.clear();
        for (int v = 0; v < a; ++v)
            if (v != u)
                terms.push_back({1, instance.a_edge(u, v)});
        for (int y = 0; y < b.vertices; ++y)
            terms.push_back({1, instance.cross_edge(u, y)});
        add_cardinality_bounds(instance, terms, 1, options.global);
    }
    for (int y = 0; y < b.vertices; ++y)
    {
        terms.clear();
        for (int u = 0; u < a; ++u)
            terms.push_back({1, instance.cross_edge(u, y)});
        add_cardinality_bounds(instance, terms, std::popcount(b.neighbors[y]), options.global);
    }
}

} // namespace ramsey
