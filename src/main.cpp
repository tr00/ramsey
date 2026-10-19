#include "engine.hpp"

#include <charconv>
#include <iostream>
#include <stdexcept>
#include <string_view>

#include <getopt.h>

namespace
{
enum BoundFlag
{
    global_min = 256,
    global_max,
    neighborhood_min,
    neighborhood_max,
    internal_edges_min,
    internal_edges_max,
    cross_edges_min,
    cross_edges_max,
    neighborhood_excess_min,
    neighborhood_excess_max,
    zero_neighborhood_excess,
};

std::optional<int> parse_bound(std::string_view text)
{
    if (text == "none")
        return std::nullopt;
    int value;
    const auto parsed = std::from_chars(text.data(), text.data() + text.size(), value);
    if (parsed.ec != std::errc{} || parsed.ptr != text.data() + text.size() || value < 0)
        throw std::invalid_argument("bounds must be nonnegative integers or 'none'");
    return value;
}

void usage(const char *program)
{
    std::cout << "Usage: " << program << " B_FILE -o OUTPUT [OPTIONS] [-- ROUNDINGSAT_ARGS...]\n"
              << "\nGenerate the degree-18 Ramsey OPB instance and launch local RoundingSat.\n"
              << "  -o, --output PATH    OPB destination (required)\n"
              << "  -i, --index N        One-based graph6 record (default: 1)\n"
              << "  -g, --generate-only  Write OPB without solving\n"
              << "  --global-degree-min N|none       Minimum degree in G (default: 18)\n"
              << "  --global-degree-max N|none       Maximum degree in G (default: 24)\n"
              << "  --neighborhood-degree-min N|none Minimum degree in G[A] (default: 0)\n"
              << "  --neighborhood-degree-max N|none Maximum degree in G[A] (default: 13)\n"
              << "  --internal-edges-min N|none      Minimum e(G[A]) (default: 50)\n"
              << "  --internal-edges-max N|none      Maximum e(G[A]) (default: 85)\n"
              << "  --cross-edges-min N|none         Minimum e(A,B) (default: 136)\n"
              << "  --cross-edges-max N|none         Maximum e(A,B) (default: 279)\n"
              << "  --neighborhood-excess-min N|none Minimum sum_A(d_G(u)-18) (default: none)\n"
              << "  --neighborhood-excess-max N|none Maximum sum_A(d_G(u)-18) (default: none)\n"
              << "  --zero-neighborhood-excess       Force d_G(u)=18 for every u in A\n"
              << "  -h, --help           Show this help\n"
              << "Arguments after -- go directly to RoundingSat.\n";
}
} // namespace

int main(int argc, char **argv)
{
    try
    {
        ramsey::Options options;
        int frontend_argc = argc;
        for (int i = 1; i < argc; ++i)
        {
            if (std::string_view(argv[i]) == "--")
            {
                frontend_argc = i;
                options.solver_arguments.assign(argv + i + 1, argv + argc);
                break;
            }
        }
        static const option long_options[] = {
            {"output", required_argument, nullptr, 'o'},
            {"index", required_argument, nullptr, 'i'},
            {"generate-only", no_argument, nullptr, 'g'},
            {"global-degree-min", required_argument, nullptr, global_min},
            {"global-degree-max", required_argument, nullptr, global_max},
            {"neighborhood-degree-min", required_argument, nullptr, neighborhood_min},
            {"neighborhood-degree-max", required_argument, nullptr, neighborhood_max},
            {"internal-edges-min", required_argument, nullptr, internal_edges_min},
            {"internal-edges-max", required_argument, nullptr, internal_edges_max},
            {"cross-edges-min", required_argument, nullptr, cross_edges_min},
            {"cross-edges-max", required_argument, nullptr, cross_edges_max},
            {"neighborhood-excess-min", required_argument, nullptr, neighborhood_excess_min},
            {"neighborhood-excess-max", required_argument, nullptr, neighborhood_excess_max},
            {"zero-neighborhood-excess", no_argument, nullptr, zero_neighborhood_excess},
            {"help", no_argument, nullptr, 'h'},
            {nullptr, 0, nullptr, 0},
        };
        opterr = 0;
        int argument;
        // Return positional arguments in order rather than permuting argv.
        while ((argument = ::getopt_long(frontend_argc, argv, "-:o:i:gh", long_options, nullptr)) != -1)
        {
            switch (argument)
            {
            case 1:
                if (!options.input.empty())
                    throw std::invalid_argument("only one B file is accepted");
                if (*optarg == '\0')
                    throw std::invalid_argument("input path must not be empty");
                options.input = optarg;
                break;
            case 'o':
                options.output = optarg;
                break;
            case 'i': {
                const std::string_view text(optarg);
                const auto parsed = std::from_chars(text.data(), text.data() + text.size(), options.index);
                if (parsed.ec != std::errc{} || parsed.ptr != text.data() + text.size() || options.index == 0)
                    throw std::invalid_argument("--index must be a positive integer");
                break;
            }
            case 'g':
                options.generate_only = true;
                break;
            case global_min:
                options.degrees.global.min = parse_bound(optarg);
                break;
            case global_max:
                options.degrees.global.max = parse_bound(optarg);
                break;
            case neighborhood_min:
                options.degrees.neighborhood.min = parse_bound(optarg);
                break;
            case neighborhood_max:
                options.degrees.neighborhood.max = parse_bound(optarg);
                break;
            case internal_edges_min:
                options.edges.internal.min = parse_bound(optarg);
                break;
            case internal_edges_max:
                options.edges.internal.max = parse_bound(optarg);
                break;
            case cross_edges_min:
                options.edges.cross.min = parse_bound(optarg);
                break;
            case cross_edges_max:
                options.edges.cross.max = parse_bound(optarg);
                break;
            case neighborhood_excess_min:
                options.excess.min = parse_bound(optarg);
                break;
            case neighborhood_excess_max:
                options.excess.max = parse_bound(optarg);
                break;
            case zero_neighborhood_excess:
                options.zero_neighborhood_excess = true;
                break;
            case 'h':
                usage(argv[0]);
                return 0;
            default:
                throw std::invalid_argument("unknown option or missing value; use --help");
            }
        }
        if (options.input.empty())
            throw std::invalid_argument("a B graph6 file is required");
        if (options.output.empty())
            throw std::invalid_argument("-o/--output is required");
        return ramsey::run(options);
    }
    catch (const std::exception &error)
    {
        std::cerr << "ramsey: " << error.what() << '\n';
        return 2;
    }
}
