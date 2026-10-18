#pragma once

#include "instance.hpp"

#include <iosfwd>
#include <string_view>

namespace ramsey
{

// Serializes the completed model; counts include all component/auxiliary additions.
void write_opb(std::ostream &output, const InstanceBuilder &instance, std::string_view record);

} // namespace ramsey
