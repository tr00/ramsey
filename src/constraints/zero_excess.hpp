#pragma once

namespace ramsey
{

class InstanceBuilder;

// Forces d_G(u) = 18 for every u in A, including its fixed pivot edge.
// Does not impose connectedness of G[A] or any degree equality on B.
void add_zero_excess_constraints(InstanceBuilder &instance);

} // namespace ramsey
