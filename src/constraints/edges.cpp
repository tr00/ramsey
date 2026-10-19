#include "edges.hpp"
#include "instance.hpp"

#include <algorithm>
#include <vector>

namespace ramsey
{

void EdgeOptions::validate() const
{
    internal.validate("internal edge");
    cross.validate("cross edge");
}

void add_edge_constraints(InstanceBuilder &instance, const EdgeOptions &options)
{
    options.validate();
    const int a = instance.a_vertices();
    const int b = instance.b_graph().vertices;
    std::vector<Term> terms;
    terms.reserve(std::max(a * (a - 1) / 2, a * b));
    for (int u = 0; u < a; ++u)
        for (int v = u + 1; v < a; ++v)
            terms.push_back({1, instance.a_edge(u, v)});
    add_cardinality_bounds(instance, terms, 0, options.internal);
    terms.clear();
    for (int u = 0; u < a; ++u)
        for (int y = 0; y < b; ++y)
            terms.push_back({1, instance.cross_edge(u, y)});
    add_cardinality_bounds(instance, terms, 0, options.cross);
}

} // namespace ramsey
