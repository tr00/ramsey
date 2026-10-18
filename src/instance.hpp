#pragma once

#include "engine.hpp"

#include <initializer_list>
#include <span>
#include <vector>

namespace ramsey
{

struct Term
{
    int coefficient;
    int variable;
};

struct Constraint
{
    std::span<const Term> terms;
    std::int64_t rhs;
};

// Solver-independent binary PB model. Components share this builder; OPB is one consumer.
class InstanceBuilder
{
  public:
    explicit InstanceBuilder(const Graph &b, int a_vertices = 18);

    int a_vertices() const noexcept;
    const Graph &b_graph() const noexcept;
    // Zero-based local vertex indices; A edges accept either orientation, not loops.
    int a_edge(int i, int j) const;
    int cross_edge(int i, int y) const;

    // Every variable is binary. Auxiliary IDs follow the fixed edge variables.
    int add_variable();
    int variable_count() const noexcept;
    // Copies terms; negative coefficients, repeated variables and empty rows are valid.
    void add_ge(std::span<const Term> terms, std::int64_t rhs);
    void add_ge(std::initializer_list<Term> terms, std::int64_t rhs);
    std::size_t constraint_count() const noexcept;
    // Views remain valid until the next mutation of this builder.
    Constraint constraint(std::size_t index) const;

  private:
    struct Row
    {
        std::size_t end;
        std::int64_t rhs;
    };

    Graph b_;
    int a_vertices_;
    int a_edges_;
    int variables_;
    std::vector<Term> terms_;
    std::vector<Row> rows_;
};

// Adds the eight exact rooted-extension families, in their canonical order.
// Small orders are supported for exhaustive semantic audits, not CLI modes.
void add_core_constraints(InstanceBuilder &instance);

} // namespace ramsey
