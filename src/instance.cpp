#include "instance.hpp"

#include <algorithm>
#include <functional>
#include <limits>
#include <stdexcept>

namespace ramsey
{

InstanceBuilder::InstanceBuilder(const Graph &b, int a_vertices) : b_(b), a_vertices_(a_vertices)
{
    if (a_vertices < 0 || a_vertices > 18)
        throw std::invalid_argument("A must have between 0 and 18 vertices");
    b_.validate();
    a_edges_ = a_vertices * (a_vertices - 1) / 2;
    variables_ = a_edges_ + a_vertices * b.vertices;
}

int InstanceBuilder::a_vertices() const noexcept
{
    return a_vertices_;
}

const Graph &InstanceBuilder::b_graph() const noexcept
{
    return b_;
}

int InstanceBuilder::a_edge(int i, int j) const
{
    if (i < 0 || j < 0 || i >= a_vertices_ || j >= a_vertices_ || i == j)
        throw std::out_of_range("invalid A edge indices");
    if (i > j)
        std::swap(i, j);
    return i * (2 * a_vertices_ - i - 1) / 2 + j - i;
}

int InstanceBuilder::cross_edge(int i, int y) const
{
    if (i < 0 || i >= a_vertices_ || y < 0 || y >= b_.vertices)
        throw std::out_of_range("invalid cross edge indices");
    return a_edges_ + i * b_.vertices + y + 1;
}

int InstanceBuilder::add_variable()
{
    if (variables_ == std::numeric_limits<int>::max())
        throw std::overflow_error("too many instance variables");
    return ++variables_;
}

int InstanceBuilder::variable_count() const noexcept
{
    return variables_;
}

void InstanceBuilder::add_ge(std::span<const Term> terms, std::int64_t rhs)
{
    for (const auto &term : terms)
        if (term.variable < 1 || term.variable > variables_)
            throw std::out_of_range("constraint refers to an unknown variable");
    // A component may reuse a view of an earlier row; vector insertion cannot alias itself.
    const auto less = std::less<const Term *>{};
    if (!terms.empty() && !terms_.empty() && !less(terms.data(), terms_.data()) &&
        less(terms.data(), terms_.data() + terms_.size()))
    {
        const std::vector<Term> copy(terms.begin(), terms.end());
        add_ge(copy, rhs);
        return;
    }
    // Reserve the row first so allocation failure cannot leave unreferenced terms.
    rows_.push_back({terms_.size(), rhs});
    try
    {
        terms_.insert(terms_.end(), terms.begin(), terms.end());
    }
    catch (...)
    {
        rows_.pop_back();
        throw;
    }
    rows_.back().end = terms_.size();
}

void InstanceBuilder::add_ge(std::initializer_list<Term> terms, std::int64_t rhs)
{
    add_ge(std::span<const Term>(terms.begin(), terms.size()), rhs);
}

std::size_t InstanceBuilder::constraint_count() const noexcept
{
    return rows_.size();
}

Constraint InstanceBuilder::constraint(std::size_t index) const
{
    const auto &row = rows_.at(index);
    const auto begin = index == 0 ? 0 : rows_[index - 1].end;
    return {std::span<const Term>(terms_).subspan(begin, row.end - begin), row.rhs};
}

} // namespace ramsey
