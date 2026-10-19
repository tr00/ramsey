#include "bounds.hpp"
#include "instance.hpp"

#include <stdexcept>
#include <string>

namespace ramsey
{

void CardinalityBounds::validate(const char *name) const
{
    if ((min && *min < 0) || (max && *max < 0))
        throw std::invalid_argument(std::string(name) + " bounds must be nonnegative");
    if (min && max && *min > *max)
        throw std::invalid_argument(std::string(name) + " minimum exceeds maximum");
}

void add_cardinality_bounds(InstanceBuilder &instance, std::span<Term> terms, int fixed,
                            const CardinalityBounds &bounds)
{
    if (bounds.min && *bounds.min > fixed)
        instance.add_ge(terms, *bounds.min - fixed);
    if (bounds.max && *bounds.max < fixed + static_cast<int>(terms.size()))
    {
        for (auto &term : terms)
            term.coefficient = -1;
        instance.add_ge(terms, fixed - *bounds.max);
    }
}

} // namespace ramsey
