#include "zero_excess.hpp"
#include "bounds.hpp"
#include "instance.hpp"

#include <vector>

namespace ramsey
{

void add_zero_excess_constraints(InstanceBuilder &instance)
{
    const int a = instance.a_vertices();
    const int b = instance.b_graph().vertices;
    std::vector<Term> terms;
    terms.reserve(a + b);
    for (int u = 0; u < a; ++u)
    {
        terms.clear();
        for (int v = 0; v < a; ++v)
            if (v != u)
                terms.push_back({1, instance.a_edge(u, v)});
        for (int y = 0; y < b; ++y)
            terms.push_back({1, instance.cross_edge(u, y)});
        add_cardinality_bounds(instance, terms, 1, {18, 18});
    }
}

} // namespace ramsey
