#include "opb.hpp"

#include <algorithm>
#include <charconv>
#include <cstring>
#include <ostream>
#include <stdexcept>
#include <system_error>

namespace ramsey
{
namespace
{
// Bounded output buffering, independent of row length and locale.
class Buffer
{
  public:
    explicit Buffer(std::ostream &output) : output_(output)
    {
    }
    void append(std::string_view text)
    {
        while (!text.empty())
        {
            if (size_ == sizeof(bytes_))
                flush();
            const auto count = std::min(text.size(), sizeof(bytes_) - size_);
            std::memcpy(bytes_ + size_, text.data(), count);
            size_ += count;
            text.remove_prefix(count);
        }
    }
    template <class Integer> void number(Integer value)
    {
        char digits[32];
        const auto result = std::to_chars(digits, digits + sizeof(digits), value);
        if (result.ec != std::errc{})
            throw std::logic_error("OPB integer overflow");
        append(std::string_view(digits, result.ptr - digits));
    }
    void flush()
    {
        output_.write(bytes_, size_);
        size_ = 0;
    }

  private:
    std::ostream &output_;
    char bytes_[4096];
    std::size_t size_ = 0;
};

struct VariableToken
{
    char bytes[11];
    std::uint8_t size;
};
} // namespace

void write_opb(std::ostream &output, const InstanceBuilder &instance, std::string_view record)
{
    Buffer buffer(output);
    buffer.append("* #variable= ");
    buffer.number(instance.variable_count());
    buffer.append(" #constraint= ");
    buffer.number(instance.constraint_count());
    buffer.append("\n* Exact fixed-B Ramsey (5,5) rooted extension core\n* A vertices: ");
    buffer.number(instance.a_vertices());
    buffer.append("; B vertices: ");
    buffer.number(instance.b_graph().vertices);
    buffer.append("\n* B graph6: ");
    buffer.append(record);
    buffer.append("\n* a_i_j: A edge; m_i_y: cross edge; zero-based local labels\n");
    const auto mapping = [&](int variable, std::string_view prefix, int i, int j) {
        buffer.append("* x");
        buffer.number(variable);
        buffer.append(" = ");
        buffer.append(prefix);
        buffer.number(i);
        buffer.append("_");
        buffer.number(j);
        buffer.append("\n");
    };
    for (int i = 0; i < instance.a_vertices(); ++i)
        for (int j = i + 1; j < instance.a_vertices(); ++j)
            mapping(instance.a_edge(i, j), "a_", i, j);
    for (int i = 0; i < instance.a_vertices(); ++i)
        for (int y = 0; y < instance.b_graph().vertices; ++y)
            mapping(instance.cross_edge(i, y), "m_", i, y);

    // Cache tokens once, including auxiliary variables beyond the original 585 IDs.
    std::vector<VariableToken> tokens(static_cast<std::size_t>(instance.variable_count()) + 1);
    for (std::size_t i = 1; i < tokens.size(); ++i)
    {
        auto &token = tokens[i];
        token.bytes[0] = 'x';
        const auto end = std::to_chars(token.bytes + 1, token.bytes + sizeof(token.bytes), i);
        if (end.ec != std::errc{})
            throw std::logic_error("OPB variable overflow");
        token.size = static_cast<std::uint8_t>(end.ptr - token.bytes);
    }
    for (std::size_t index = 0; index < instance.constraint_count(); ++index)
    {
        const auto row = instance.constraint(index);
        bool first = true;
        for (const auto &term : row.terms)
        {
            if (!first)
                buffer.append(" ");
            first = false;
            if (term.coefficient >= 0)
                buffer.append("+");
            buffer.number(term.coefficient);
            buffer.append(" ");
            const auto &token = tokens[term.variable];
            buffer.append(std::string_view(token.bytes, token.size));
        }
        // Empty polynomials are accepted by the OPB backend, including RoundingSat.
        buffer.append(" >= ");
        buffer.number(row.rhs);
        buffer.append(";\n");
    }
    buffer.flush();
    if (!output)
        throw std::runtime_error("failed to write OPB output");
}

} // namespace ramsey
