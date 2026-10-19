#pragma once

#include "bounds.hpp"

namespace ramsey
{

class InstanceBuilder;

struct DegreeOptions
{
    CardinalityBounds global{18, 24};
    CardinalityBounds neighborhood{0, 13};

    void validate() const;
};

// Restricts degrees in G and G[A]. Defaults are for the order-43 d18 branch.
// Missing endpoints are unrestricted. Tautological inequalities are omitted.
void add_degree_constraints(InstanceBuilder &instance, const DegreeOptions &options = {});

} // namespace ramsey
