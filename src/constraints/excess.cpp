#include "excess.hpp"
#include "instance.hpp"

#include <vector>

namespace ramsey
{

void add_excess_constraints(InstanceBuilder &instance, const CardinalityBounds &bounds)
{
    bounds.validate("neighborhood excess");
    const int a = instance.a_vertices();
    const int b = instance.b_graph().vertices;
    const std::int64_t shift = 17 * a;
    const int maximum = a * (a - 1) + a * b;
    const bool lower = bounds.min && shift + *bounds.min > 0;
    const bool upper = bounds.max && shift + *bounds.max < maximum;
    if (!lower && !upper)
        return;

    std::vector<Term> terms;
    terms.reserve(a * (a - 1) / 2 + a * b);
    for (int u = 0; u < a; ++u)
        for (int v = u + 1; v < a; ++v)
            terms.push_back({2, instance.a_edge(u, v)});
    for (int u = 0; u < a; ++u)
        for (int y = 0; y < b; ++y)
            terms.push_back({1, instance.cross_edge(u, y)});
    if (lower)
        instance.add_ge(terms, shift + *bounds.min);
    if (upper)
    {
        for (auto &term : terms)
            term.coefficient = -term.coefficient;
        instance.add_ge(terms, -shift - *bounds.max);
    }
}

} // namespace ramsey
