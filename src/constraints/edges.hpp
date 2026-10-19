#pragma once

#include "bounds.hpp"

namespace ramsey
{

struct EdgeOptions
{
    CardinalityBounds internal{50, 85};
    CardinalityBounds cross{136, 279};

    void validate() const;
};

// Bounds e(G[A]) and e(A,B). Defaults are for the order-43 d18 branch.
// Neither count includes pivot edges or fixed B edges.
void add_edge_constraints(InstanceBuilder &instance, const EdgeOptions &options = {});

} // namespace ramsey
