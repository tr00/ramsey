#pragma once

#include "bounds.hpp"

namespace ramsey
{

// Bounds E_A = sum_{u in A}(d_G(u) - 18) = 2e(A) + e(A,B) - 17|A|.
// This is a signed linear sum, not truncated subtraction. Disabled by default.
void add_excess_constraints(InstanceBuilder &instance, const CardinalityBounds &bounds = {});

} // namespace ramsey
