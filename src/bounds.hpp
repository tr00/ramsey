#pragma once

#include <optional>
#include <span>

namespace ramsey
{

class InstanceBuilder;
struct Term;

struct CardinalityBounds
{
    std::optional<int> min;
    std::optional<int> max;

    void validate(const char *name) const;
};

// Bounds a sum of distinct binary variables plus a fixed contribution.
// Terms enter with coefficient 1 and may leave with coefficient -1.
// Callers validate bounds first. Tautological inequalities are omitted.
void add_cardinality_bounds(InstanceBuilder &instance, std::span<Term> terms, int fixed,
                            const CardinalityBounds &bounds);

} // namespace ramsey
